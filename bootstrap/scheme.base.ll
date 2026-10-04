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
@.str.sym.19 = private unnamed_addr constant [5 x i8] c"r7rs\00"
@.str.sym.20 = private unnamed_addr constant [5 x i8] c"emit\00"
@.str.sym.21 = private unnamed_addr constant [11 x i8] c"ieee-float\00"
@.str.sym.22 = private unnamed_addr constant [7 x i8] c"srfi-0\00"
@.str.sym.23 = private unnamed_addr constant [7 x i8] c"srfi-6\00"
@.str.sym.24 = private unnamed_addr constant [7 x i8] c"srfi-9\00"
@.str.sym.25 = private unnamed_addr constant [8 x i8] c"srfi-16\00"
@.str.sym.26 = private unnamed_addr constant [8 x i8] c"srfi-23\00"
@.str.sym.27 = private unnamed_addr constant [8 x i8] c"srfi-30\00"
@.str.sym.28 = private unnamed_addr constant [8 x i8] c"srfi-39\00"
@.str.sym.29 = private unnamed_addr constant [8 x i8] c"srfi-62\00"
@.str.sym.30 = private unnamed_addr constant [8 x i8] c"srfi-87\00"
@.str.sym.31 = private unnamed_addr constant [5 x i8] c"file\00"
@.str.lit.32 = private unnamed_addr constant [20 x i8] c"range out of bounds\00"
@.str.sym.33 = private unnamed_addr constant [13 x i8] c"vector->list\00"
@.str.sym.34 = private unnamed_addr constant [12 x i8] c"vector-copy\00"
@.str.sym.35 = private unnamed_addr constant [13 x i8] c"vector-fill!\00"
@.str.sym.36 = private unnamed_addr constant [13 x i8] c"vector-copy!\00"
@.str.sym.37 = private unnamed_addr constant [15 x i8] c"string->vector\00"
@.str.sym.38 = private unnamed_addr constant [15 x i8] c"vector->string\00"
@.str.sym.39 = private unnamed_addr constant [13 x i8] c"string-fill!\00"
@.str.sym.40 = private unnamed_addr constant [13 x i8] c"string-copy!\00"
@.str.sym.41 = private unnamed_addr constant [16 x i8] c"bytevector-copy\00"
@.str.sym.42 = private unnamed_addr constant [17 x i8] c"bytevector-copy!\00"
@.str.lit.43 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.44 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.45 = private unnamed_addr constant [60 x i8] c"rationalize: no rational found within the denominator limit\00"
@.flo.lit.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.lit.49 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.sym.50 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.lit.51 = private unnamed_addr constant [46 x i8] c"unterminated block comment #| opened at index\00"
@.str.sym.52 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.lit.53 = private unnamed_addr constant [42 x i8] c"unterminated |identifier| opened at index\00"
@.str.sym.54 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.55 = private unnamed_addr constant [14 x i8] c"unterminated \00"
@.str.lit.56 = private unnamed_addr constant [7 x i8] c"list [\00"
@.str.lit.57 = private unnamed_addr constant [16 x i8] c"bytevector #u8(\00"
@.str.lit.58 = private unnamed_addr constant [10 x i8] c"vector #(\00"
@.str.lit.59 = private unnamed_addr constant [7 x i8] c"list (\00"
@.str.lit.60 = private unnamed_addr constant [17 x i8] c" opened at index\00"
@.str.sym.61 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.lit.62 = private unnamed_addr constant [38 x i8] c"unterminated string \22 opened at index\00"
@.str.sym.63 = private unnamed_addr constant [13 x i8] c"rd-char-name\00"
@.str.lit.64 = private unnamed_addr constant [23 x i8] c"unknown character name\00"
@.str.sym.65 = private unnamed_addr constant [14 x i8] c"rd-hash-token\00"
@.str.lit.66 = private unnamed_addr constant [45 x i8] c"not a boolean; write #t, #true, #f or #false\00"
@.str.sym.67 = private unnamed_addr constant [19 x i8] c"rd-label-duplicate\00"
@.str.lit.68 = private unnamed_addr constant [22 x i8] c"duplicate datum label\00"
@.str.sym.69 = private unnamed_addr constant [20 x i8] c"rd-label-unresolved\00"
@.str.lit.70 = private unnamed_addr constant [48 x i8] c"datum label reference has no earlier definition\00"
@.str.sym.71 = private unnamed_addr constant [14 x i8] c"rd-label-self\00"
@.str.lit.72 = private unnamed_addr constant [56 x i8] c"datum label cannot be defined as only its own reference\00"
@.str.sym.73 = private unnamed_addr constant [9 x i8] c"rd-label\00"
@.str.lit.74 = private unnamed_addr constant [22 x i8] c"malformed datum label\00"
@.str.sym.75 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.76 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.77 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.78 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.79 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.80 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.81 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.82 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.83 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.84 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.85 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.86 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.87 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.88 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.89 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.90 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.91 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.92 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.93 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.94 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.95 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.96 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.97 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.98 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.99 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.100 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.101 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.102 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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

define fastcc i64 @"scheme.base:code:features"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2862 = icmp eq i64 %argc, 0
  br i1 %t2862, label %argok672, label %arityerr671
arityerr671:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok672:
  %t2863 = call i64 @rt_cons(i64 17, i64 17)
  %t2864 = call i64 @rt_intern(ptr @.str.sym.19)
  %t2865 = call i64 @rt_set_car(i64 %t2863, i64 %t2864)
  %t2866 = call i64 @rt_cons(i64 17, i64 17)
  %t2867 = call i64 @rt_intern(ptr @.str.sym.20)
  %t2868 = call i64 @rt_set_car(i64 %t2866, i64 %t2867)
  %t2869 = call i64 @rt_cons(i64 17, i64 17)
  %t2870 = call i64 @rt_intern(ptr @.str.sym.21)
  %t2871 = call i64 @rt_set_car(i64 %t2869, i64 %t2870)
  %t2872 = call i64 @rt_cons(i64 17, i64 17)
  %t2873 = call i64 @rt_intern(ptr @.str.sym.22)
  %t2874 = call i64 @rt_set_car(i64 %t2872, i64 %t2873)
  %t2875 = call i64 @rt_cons(i64 17, i64 17)
  %t2876 = call i64 @rt_intern(ptr @.str.sym.23)
  %t2877 = call i64 @rt_set_car(i64 %t2875, i64 %t2876)
  %t2878 = call i64 @rt_cons(i64 17, i64 17)
  %t2879 = call i64 @rt_intern(ptr @.str.sym.24)
  %t2880 = call i64 @rt_set_car(i64 %t2878, i64 %t2879)
  %t2881 = call i64 @rt_cons(i64 17, i64 17)
  %t2882 = call i64 @rt_intern(ptr @.str.sym.25)
  %t2883 = call i64 @rt_set_car(i64 %t2881, i64 %t2882)
  %t2884 = call i64 @rt_cons(i64 17, i64 17)
  %t2885 = call i64 @rt_intern(ptr @.str.sym.26)
  %t2886 = call i64 @rt_set_car(i64 %t2884, i64 %t2885)
  %t2887 = call i64 @rt_cons(i64 17, i64 17)
  %t2888 = call i64 @rt_intern(ptr @.str.sym.27)
  %t2889 = call i64 @rt_set_car(i64 %t2887, i64 %t2888)
  %t2890 = call i64 @rt_cons(i64 17, i64 17)
  %t2891 = call i64 @rt_intern(ptr @.str.sym.28)
  %t2892 = call i64 @rt_set_car(i64 %t2890, i64 %t2891)
  %t2893 = call i64 @rt_cons(i64 17, i64 17)
  %t2894 = call i64 @rt_intern(ptr @.str.sym.29)
  %t2895 = call i64 @rt_set_car(i64 %t2893, i64 %t2894)
  %t2896 = call i64 @rt_cons(i64 17, i64 17)
  %t2897 = call i64 @rt_intern(ptr @.str.sym.30)
  %t2898 = call i64 @rt_set_car(i64 %t2896, i64 %t2897)
  %t2899 = call i64 @rt_set_cdr(i64 %t2896, i64 2)
  %t2900 = call i64 @rt_set_cdr(i64 %t2893, i64 %t2896)
  %t2901 = call i64 @rt_set_cdr(i64 %t2890, i64 %t2893)
  %t2902 = call i64 @rt_set_cdr(i64 %t2887, i64 %t2890)
  %t2903 = call i64 @rt_set_cdr(i64 %t2884, i64 %t2887)
  %t2904 = call i64 @rt_set_cdr(i64 %t2881, i64 %t2884)
  %t2905 = call i64 @rt_set_cdr(i64 %t2878, i64 %t2881)
  %t2906 = call i64 @rt_set_cdr(i64 %t2875, i64 %t2878)
  %t2907 = call i64 @rt_set_cdr(i64 %t2872, i64 %t2875)
  %t2908 = call i64 @rt_set_cdr(i64 %t2869, i64 %t2872)
  %t2909 = call i64 @rt_set_cdr(i64 %t2866, i64 %t2869)
  %t2910 = call i64 @rt_set_cdr(i64 %t2863, i64 %t2866)
  %t2911 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t2911)
  %t2912 = and i64 %t2911, -8
  %t2913 = inttoptr i64 %t2912 to ptr
  %t2914 = load i64, ptr %t2913
  %t2915 = inttoptr i64 %t2914 to ptr
  %t2916 = musttail call fastcc i64 %t2915(i64 %t2911, i64 1, i64 %t2863, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2916
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2921 = icmp eq i64 %argc, 1
  br i1 %t2921, label %argok674, label %arityerr673
arityerr673:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok674:
  %t2922 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2922
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2927 = icmp eq i64 %argc, 1
  br i1 %t2927, label %argok676, label %arityerr675
arityerr675:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok676:
  %t2928 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2928
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2933 = icmp eq i64 %argc, 1
  br i1 %t2933, label %argok678, label %arityerr677
arityerr677:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok678:
  %t2934 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2934
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2939 = icmp eq i64 %argc, 1
  br i1 %t2939, label %argok680, label %arityerr679
arityerr679:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok680:
  %t2940 = call i64 @rt_error_object_p(i64 %a0)
  %t2941 = icmp ne i64 %t2940, 1
  br i1 %t2941, label %then681, label %else682
then681:
  %t2942 = call i64 @rt_error_object_kind(i64 %a0)
  %t2943 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2944 = call i64 @rt_eq_p(i64 %t2942, i64 %t2943)
  ret i64 %t2944
else682:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2949 = icmp eq i64 %argc, 1
  br i1 %t2949, label %argok684, label %arityerr683
arityerr683:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok684:
  %t2950 = call i64 @rt_error_object_p(i64 %a0)
  %t2951 = icmp ne i64 %t2950, 1
  br i1 %t2951, label %then685, label %else686
then685:
  %t2952 = call i64 @rt_error_object_kind(i64 %a0)
  %t2953 = call i64 @rt_intern(ptr @.str.sym.31)
  %t2954 = call i64 @rt_eq_p(i64 %t2952, i64 %t2953)
  ret i64 %t2954
else686:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_551"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2959 = icmp eq i64 %argc, 1
  br i1 %t2959, label %argok688, label %arityerr687
arityerr687:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok688:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_553"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2960 = icmp eq i64 %argc, 1
  br i1 %t2960, label %argok690, label %arityerr689
arityerr689:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok690:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_555"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2961 = icmp sge i64 %argc, 0
  br i1 %t2961, label %argok692, label %arityerr691
arityerr691:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok692:
  %t2962 = call ptr @rt_alloc_words(i64 8)
  %t2963 = getelementptr i64, ptr %t2962, i64 0
  store i64 %a0, ptr %t2963
  %t2964 = getelementptr i64, ptr %t2962, i64 1
  store i64 %a1, ptr %t2964
  %t2965 = getelementptr i64, ptr %t2962, i64 2
  store i64 %a2, ptr %t2965
  %t2966 = getelementptr i64, ptr %t2962, i64 3
  store i64 %a3, ptr %t2966
  %t2967 = getelementptr i64, ptr %t2962, i64 4
  store i64 %a4, ptr %t2967
  %t2968 = getelementptr i64, ptr %t2962, i64 5
  store i64 %a5, ptr %t2968
  %t2969 = getelementptr i64, ptr %t2962, i64 6
  store i64 %a6, ptr %t2969
  %t2970 = getelementptr i64, ptr %t2962, i64 7
  store i64 %a7, ptr %t2970
  %t2971 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2962, ptr %overflow)
  %t2972 = call i64 @rt_null_p(i64 %t2971)
  %t2973 = icmp ne i64 %t2972, 1
  br i1 %t2973, label %then693, label %else694
then693:
  %t2974 = and i64 %self, -8
  %t2975 = inttoptr i64 %t2974 to ptr
  %t2976 = getelementptr i64, ptr %t2975, i64 1
  %t2977 = load i64, ptr %t2976
  %t2978 = call i64 @rt_vector_ref(i64 %t2977, i64 0)
  ret i64 %t2978
else694:
  %t2979 = call i64 @rt_cdr(i64 %t2971)
  %t2980 = call i64 @rt_null_p(i64 %t2979)
  %t2981 = icmp ne i64 %t2980, 1
  br i1 %t2981, label %then695, label %else696
then695:
  %t2982 = and i64 %self, -8
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = getelementptr i64, ptr %t2983, i64 1
  %t2985 = load i64, ptr %t2984
  %t2986 = call i64 @rt_car(i64 %t2971)
  %t2987 = and i64 %self, -8
  %t2988 = inttoptr i64 %t2987 to ptr
  %t2989 = getelementptr i64, ptr %t2988, i64 2
  %t2990 = load i64, ptr %t2989
  call void @rt_check_callable(i64 %t2990)
  %t2991 = and i64 %t2990, -8
  %t2992 = inttoptr i64 %t2991 to ptr
  %t2993 = load i64, ptr %t2992
  %t2994 = inttoptr i64 %t2993 to ptr
  %t2995 = call fastcc i64%t2994(i64 %t2990, i64 1, i64 %t2986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2996 = call i64 @rt_vector_set(i64 %t2985, i64 0, i64 %t2995)
  ret i64 %t2996
else696:
  %t2997 = and i64 %self, -8
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = getelementptr i64, ptr %t2998, i64 1
  %t3000 = load i64, ptr %t2999
  %t3001 = call i64 @rt_car(i64 %t2971)
  %t3002 = call i64 @rt_vector_set(i64 %t3000, i64 0, i64 %t3001)
  ret i64 %t3002
}

define fastcc i64 @"min-entry:$scheme.base$ccode_555"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3003 = call i64 @rt_null_p(i64 2)
  %t3004 = icmp ne i64 %t3003, 1
  br i1 %t3004, label %then697, label %else698
then697:
  %t3005 = and i64 %self, -8
  %t3006 = inttoptr i64 %t3005 to ptr
  %t3007 = getelementptr i64, ptr %t3006, i64 1
  %t3008 = load i64, ptr %t3007
  %t3009 = call i64 @rt_vector_ref(i64 %t3008, i64 0)
  ret i64 %t3009
else698:
  %t3010 = call i64 @rt_cdr(i64 2)
  %t3011 = call i64 @rt_null_p(i64 %t3010)
  %t3012 = icmp ne i64 %t3011, 1
  br i1 %t3012, label %then699, label %else700
then699:
  %t3013 = and i64 %self, -8
  %t3014 = inttoptr i64 %t3013 to ptr
  %t3015 = getelementptr i64, ptr %t3014, i64 1
  %t3016 = load i64, ptr %t3015
  %t3017 = call i64 @rt_car(i64 2)
  %t3018 = and i64 %self, -8
  %t3019 = inttoptr i64 %t3018 to ptr
  %t3020 = getelementptr i64, ptr %t3019, i64 2
  %t3021 = load i64, ptr %t3020
  call void @rt_check_callable(i64 %t3021)
  %t3022 = and i64 %t3021, -8
  %t3023 = inttoptr i64 %t3022 to ptr
  %t3024 = load i64, ptr %t3023
  %t3025 = inttoptr i64 %t3024 to ptr
  %t3026 = call fastcc i64%t3025(i64 %t3021, i64 1, i64 %t3017, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3027 = call i64 @rt_vector_set(i64 %t3016, i64 0, i64 %t3026)
  ret i64 %t3027
else700:
  %t3028 = and i64 %self, -8
  %t3029 = inttoptr i64 %t3028 to ptr
  %t3030 = getelementptr i64, ptr %t3029, i64 1
  %t3031 = load i64, ptr %t3030
  %t3032 = call i64 @rt_car(i64 2)
  %t3033 = call i64 @rt_vector_set(i64 %t3031, i64 0, i64 %t3032)
  ret i64 %t3033
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3034 = icmp sge i64 %argc, 1
  br i1 %t3034, label %argok702, label %arityerr701
arityerr701:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok702:
  %t3035 = call ptr @rt_alloc_words(i64 8)
  %t3036 = getelementptr i64, ptr %t3035, i64 0
  store i64 %a0, ptr %t3036
  %t3037 = getelementptr i64, ptr %t3035, i64 1
  store i64 %a1, ptr %t3037
  %t3038 = getelementptr i64, ptr %t3035, i64 2
  store i64 %a2, ptr %t3038
  %t3039 = getelementptr i64, ptr %t3035, i64 3
  store i64 %a3, ptr %t3039
  %t3040 = getelementptr i64, ptr %t3035, i64 4
  store i64 %a4, ptr %t3040
  %t3041 = getelementptr i64, ptr %t3035, i64 5
  store i64 %a5, ptr %t3041
  %t3042 = getelementptr i64, ptr %t3035, i64 6
  store i64 %a6, ptr %t3042
  %t3043 = getelementptr i64, ptr %t3035, i64 7
  store i64 %a7, ptr %t3043
  %t3044 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3035, ptr %overflow)
  %t3045 = call i64 @rt_null_p(i64 %t3044)
  %t3046 = icmp ne i64 %t3045, 1
  br i1 %t3046, label %then703, label %else704
then703:
  %t3047 = call ptr @rt_alloc_words(i64 1)
  %t3048 = ptrtoint ptr %t3047 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_551" to i64), ptr %t3047
  %t3049 = or i64 %t3048, 4
  br label %merge705
else704:
  %t3050 = call i64 @rt_car(i64 %t3044)
  br label %merge705
merge705:
  %t3051 = phi i64 [ %t3049, %then703 ], [ %t3050, %else704 ]
  %t3052 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3053 = call i64 @rt_null_p(i64 %t3044)
  %t3054 = icmp ne i64 %t3053, 1
  br i1 %t3054, label %then706, label %else707
then706:
  %t3055 = call ptr @rt_alloc_words(i64 1)
  %t3056 = ptrtoint ptr %t3055 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_553" to i64), ptr %t3055
  %t3057 = or i64 %t3056, 4
  br label %merge708
else707:
  %t3058 = call i64 @rt_car(i64 %t3044)
  br label %merge708
merge708:
  %t3059 = phi i64 [ %t3057, %then706 ], [ %t3058, %else707 ]
  call void @rt_check_callable(i64 %t3059)
  %t3060 = and i64 %t3059, -8
  %t3061 = inttoptr i64 %t3060 to ptr
  %t3062 = load i64, ptr %t3061
  %t3063 = inttoptr i64 %t3062 to ptr
  %t3064 = call fastcc i64%t3063(i64 %t3059, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3065 = call i64 @rt_vector_set(i64 %t3052, i64 0, i64 %t3064)
  %t3066 = call ptr @rt_alloc_words(i64 3)
  %t3067 = ptrtoint ptr %t3066 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_555" to i64), ptr %t3066
  %t3068 = getelementptr i64, ptr %t3066, i64 1
  store i64 %t3052, ptr %t3068
  %t3069 = getelementptr i64, ptr %t3066, i64 2
  store i64 %t3051, ptr %t3069
  %t3070 = or i64 %t3067, 4
  ret i64 %t3070
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmake-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3071 = call i64 @rt_null_p(i64 2)
  %t3072 = icmp ne i64 %t3071, 1
  br i1 %t3072, label %then709, label %else710
then709:
  %t3073 = call ptr @rt_alloc_words(i64 1)
  %t3074 = ptrtoint ptr %t3073 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_551" to i64), ptr %t3073
  %t3075 = or i64 %t3074, 4
  br label %merge711
else710:
  %t3076 = call i64 @rt_car(i64 2)
  br label %merge711
merge711:
  %t3077 = phi i64 [ %t3075, %then709 ], [ %t3076, %else710 ]
  %t3078 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3079 = call i64 @rt_null_p(i64 2)
  %t3080 = icmp ne i64 %t3079, 1
  br i1 %t3080, label %then712, label %else713
then712:
  %t3081 = call ptr @rt_alloc_words(i64 1)
  %t3082 = ptrtoint ptr %t3081 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_553" to i64), ptr %t3081
  %t3083 = or i64 %t3082, 4
  br label %merge714
else713:
  %t3084 = call i64 @rt_car(i64 2)
  br label %merge714
merge714:
  %t3085 = phi i64 [ %t3083, %then712 ], [ %t3084, %else713 ]
  call void @rt_check_callable(i64 %t3085)
  %t3086 = and i64 %t3085, -8
  %t3087 = inttoptr i64 %t3086 to ptr
  %t3088 = load i64, ptr %t3087
  %t3089 = inttoptr i64 %t3088 to ptr
  %t3090 = call fastcc i64%t3089(i64 %t3085, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3091 = call i64 @rt_vector_set(i64 %t3078, i64 0, i64 %t3090)
  %t3092 = call ptr @rt_alloc_words(i64 3)
  %t3093 = ptrtoint ptr %t3092 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_555" to i64), ptr %t3092
  %t3094 = getelementptr i64, ptr %t3092, i64 1
  store i64 %t3078, ptr %t3094
  %t3095 = getelementptr i64, ptr %t3092, i64 2
  store i64 %t3077, ptr %t3095
  %t3096 = or i64 %t3093, 4
  ret i64 %t3096
}

define fastcc i64 @"scheme.base:code_567"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3101 = icmp eq i64 %argc, 1
  br i1 %t3101, label %argok716, label %arityerr715
arityerr715:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok716:
  call void @rt_check_callable(i64 %a0)
  %t3102 = and i64 %a0, -8
  %t3103 = inttoptr i64 %t3102 to ptr
  %t3104 = load i64, ptr %t3103
  %t3105 = inttoptr i64 %t3104 to ptr
  %t3106 = musttail call fastcc i64 %t3105(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3106
}

define fastcc i64 @"scheme.base:code_571"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3107 = icmp eq i64 %argc, 2
  br i1 %t3107, label %argok718, label %arityerr717
arityerr717:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok718:
  call void @rt_check_callable(i64 %a0)
  %t3108 = and i64 %a0, -8
  %t3109 = inttoptr i64 %t3108 to ptr
  %t3110 = load i64, ptr %t3109
  %t3111 = inttoptr i64 %t3110 to ptr
  %t3112 = musttail call fastcc i64 %t3111(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3112
}

define fastcc i64 @"scheme.base:code_569"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3113 = icmp eq i64 %argc, 0
  br i1 %t3113, label %argok720, label %arityerr719
arityerr719:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok720:
  %t3114 = call ptr @rt_alloc_words(i64 1)
  %t3115 = ptrtoint ptr %t3114 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_571" to i64), ptr %t3114
  %t3116 = or i64 %t3115, 4
  %t3117 = and i64 %self, -8
  %t3118 = inttoptr i64 %t3117 to ptr
  %t3119 = getelementptr i64, ptr %t3118, i64 1
  %t3120 = load i64, ptr %t3119
  %t3121 = and i64 %self, -8
  %t3122 = inttoptr i64 %t3121 to ptr
  %t3123 = getelementptr i64, ptr %t3122, i64 2
  %t3124 = load i64, ptr %t3123
  %t3125 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3125)
  %t3126 = and i64 %t3125, -8
  %t3127 = inttoptr i64 %t3126 to ptr
  %t3128 = load i64, ptr %t3127
  %t3129 = inttoptr i64 %t3128 to ptr
  %t3130 = musttail call fastcc i64 %t3129(i64 %t3125, i64 3, i64 %t3116, i64 %t3120, i64 %t3124, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3130
}

define fastcc i64 @"scheme.base:code_575"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3131 = icmp eq i64 %argc, 2
  br i1 %t3131, label %argok722, label %arityerr721
arityerr721:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok722:
  call void @rt_check_callable(i64 %a0)
  %t3132 = and i64 %a0, -8
  %t3133 = inttoptr i64 %t3132 to ptr
  %t3134 = load i64, ptr %t3133
  %t3135 = inttoptr i64 %t3134 to ptr
  %t3136 = musttail call fastcc i64 %t3135(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3136
}

define fastcc i64 @"scheme.base:code_573"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3137 = icmp eq i64 %argc, 0
  br i1 %t3137, label %argok724, label %arityerr723
arityerr723:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok724:
  %t3138 = call ptr @rt_alloc_words(i64 1)
  %t3139 = ptrtoint ptr %t3138 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_575" to i64), ptr %t3138
  %t3140 = or i64 %t3139, 4
  %t3141 = and i64 %self, -8
  %t3142 = inttoptr i64 %t3141 to ptr
  %t3143 = getelementptr i64, ptr %t3142, i64 1
  %t3144 = load i64, ptr %t3143
  %t3145 = and i64 %self, -8
  %t3146 = inttoptr i64 %t3145 to ptr
  %t3147 = getelementptr i64, ptr %t3146, i64 2
  %t3148 = load i64, ptr %t3147
  %t3149 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3149)
  %t3150 = and i64 %t3149, -8
  %t3151 = inttoptr i64 %t3150 to ptr
  %t3152 = load i64, ptr %t3151
  %t3153 = inttoptr i64 %t3152 to ptr
  %t3154 = musttail call fastcc i64 %t3153(i64 %t3149, i64 3, i64 %t3140, i64 %t3144, i64 %t3148, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3154
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3155 = icmp eq i64 %argc, 3
  br i1 %t3155, label %argok726, label %arityerr725
arityerr725:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok726:
  %t3156 = call ptr @rt_alloc_words(i64 1)
  %t3157 = ptrtoint ptr %t3156 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_567" to i64), ptr %t3156
  %t3158 = or i64 %t3157, 4
  %t3159 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t3159)
  %t3160 = and i64 %t3159, -8
  %t3161 = inttoptr i64 %t3160 to ptr
  %t3162 = load i64, ptr %t3161
  %t3163 = inttoptr i64 %t3162 to ptr
  %t3164 = call fastcc i64%t3163(i64 %t3159, i64 2, i64 %t3158, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3165 = call ptr @rt_alloc_words(i64 3)
  %t3166 = ptrtoint ptr %t3165 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_569" to i64), ptr %t3165
  %t3167 = getelementptr i64, ptr %t3165, i64 1
  store i64 %a0, ptr %t3167
  %t3168 = getelementptr i64, ptr %t3165, i64 2
  store i64 %a1, ptr %t3168
  %t3169 = or i64 %t3166, 4
  %t3170 = call ptr @rt_alloc_words(i64 3)
  %t3171 = ptrtoint ptr %t3170 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_573" to i64), ptr %t3170
  %t3172 = getelementptr i64, ptr %t3170, i64 1
  store i64 %a0, ptr %t3172
  %t3173 = getelementptr i64, ptr %t3170, i64 2
  store i64 %t3164, ptr %t3173
  %t3174 = or i64 %t3171, 4
  %t3175 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t3175)
  %t3176 = and i64 %t3175, -8
  %t3177 = inttoptr i64 %t3176 to ptr
  %t3178 = load i64, ptr %t3177
  %t3179 = inttoptr i64 %t3178 to ptr
  %t3180 = musttail call fastcc i64 %t3179(i64 %t3175, i64 3, i64 %t3169, i64 %a2, i64 %t3174, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3180
}

define fastcc i64 @"scheme.base:code_583"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3185 = icmp eq i64 %argc, 2
  br i1 %t3185, label %argok728, label %arityerr727
arityerr727:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok728:
  %t3186 = call i64 @rt_null_p(i64 %a0)
  %t3187 = icmp ne i64 %t3186, 1
  br i1 %t3187, label %then729, label %else730
then729:
  %t3188 = and i64 %self, -8
  %t3189 = inttoptr i64 %t3188 to ptr
  %t3190 = getelementptr i64, ptr %t3189, i64 1
  %t3191 = load i64, ptr %t3190
  ret i64 %t3191
else730:
  %t3192 = and i64 %self, -8
  %t3193 = inttoptr i64 %t3192 to ptr
  %t3194 = getelementptr i64, ptr %t3193, i64 1
  %t3195 = load i64, ptr %t3194
  %t3196 = call i64 @rt_car(i64 %a0)
  %t3197 = call i64 @rt_vector_set(i64 %t3195, i64 %a1, i64 %t3196)
  %t3198 = call i64 @rt_cdr(i64 %a0)
  %t3199 = or i64 %a1, 8
  %t3200 = and i64 %t3199, 7
  %t3201 = icmp eq i64 %t3200, 0
  br i1 %t3201, label %fixfast731, label %fixslow732
fixfast731:
  %t3202 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3203 = extractvalue {i64, i1} %t3202, 0
  %t3204 = extractvalue {i64, i1} %t3202, 1
  br i1 %t3204, label %fixslow732, label %fixmerge733
fixslow732:
  %t3205 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge733
fixmerge733:
  %t3206 = phi i64 [ %t3203, %fixfast731 ], [ %t3205, %fixslow732 ]
  %t3207 = musttail call fastcc i64 @"scheme.base:code_583"(i64 %self, i64 2, i64 %t3198, i64 %t3206, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3207
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3208 = icmp eq i64 %argc, 1
  br i1 %t3208, label %argok735, label %arityerr734
arityerr734:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok735:
  %t3209 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3209)
  %t3210 = and i64 %t3209, -8
  %t3211 = inttoptr i64 %t3210 to ptr
  %t3212 = load i64, ptr %t3211
  %t3213 = inttoptr i64 %t3212 to ptr
  %t3214 = call fastcc i64%t3213(i64 %t3209, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3215 = call i64 @rt_make_vector(i64 %t3214, i64 0)
  %t3216 = call ptr @rt_alloc_words(i64 3)
  %t3217 = ptrtoint ptr %t3216 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_583" to i64), ptr %t3216
  %t3218 = or i64 %t3217, 4
  %t3219 = getelementptr i64, ptr %t3216, i64 1
  store i64 %t3215, ptr %t3219
  %t3220 = getelementptr i64, ptr %t3216, i64 2
  store i64 %t3218, ptr %t3220
  %t3221 = musttail call fastcc i64 @"scheme.base:code_583"(i64 %t3218, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3221
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3226 = icmp sge i64 %argc, 0
  br i1 %t3226, label %argok737, label %arityerr736
arityerr736:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok737:
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
  %t3236 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3227, ptr %overflow)
  %t3237 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3237)
  %t3238 = and i64 %t3237, -8
  %t3239 = inttoptr i64 %t3238 to ptr
  %t3240 = load i64, ptr %t3239
  %t3241 = inttoptr i64 %t3240 to ptr
  %t3242 = musttail call fastcc i64 %t3241(i64 %t3237, i64 1, i64 %t3236, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3242
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3243 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3243)
  %t3244 = and i64 %t3243, -8
  %t3245 = inttoptr i64 %t3244 to ptr
  %t3246 = load i64, ptr %t3245
  %t3247 = inttoptr i64 %t3246 to ptr
  %t3248 = musttail call fastcc i64 %t3247(i64 %t3243, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3248
}

define fastcc i64 @"scheme.base:code_593"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3253 = icmp eq i64 %argc, 2
  br i1 %t3253, label %argok739, label %arityerr738
arityerr738:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok739:
  %t3254 = call i64 @rt_null_p(i64 %a0)
  %t3255 = icmp ne i64 %t3254, 1
  br i1 %t3255, label %then740, label %else741
then740:
  %t3256 = and i64 %self, -8
  %t3257 = inttoptr i64 %t3256 to ptr
  %t3258 = getelementptr i64, ptr %t3257, i64 1
  %t3259 = load i64, ptr %t3258
  ret i64 %t3259
else741:
  %t3260 = and i64 %self, -8
  %t3261 = inttoptr i64 %t3260 to ptr
  %t3262 = getelementptr i64, ptr %t3261, i64 1
  %t3263 = load i64, ptr %t3262
  %t3264 = call i64 @rt_car(i64 %a0)
  %t3265 = call i64 @rt_bytevector_u8_set(i64 %t3263, i64 %a1, i64 %t3264)
  %t3266 = call i64 @rt_cdr(i64 %a0)
  %t3267 = or i64 %a1, 8
  %t3268 = and i64 %t3267, 7
  %t3269 = icmp eq i64 %t3268, 0
  br i1 %t3269, label %fixfast742, label %fixslow743
fixfast742:
  %t3270 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3271 = extractvalue {i64, i1} %t3270, 0
  %t3272 = extractvalue {i64, i1} %t3270, 1
  br i1 %t3272, label %fixslow743, label %fixmerge744
fixslow743:
  %t3273 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge744
fixmerge744:
  %t3274 = phi i64 [ %t3271, %fixfast742 ], [ %t3273, %fixslow743 ]
  %t3275 = musttail call fastcc i64 @"scheme.base:code_593"(i64 %self, i64 2, i64 %t3266, i64 %t3274, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3275
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3276 = icmp eq i64 %argc, 1
  br i1 %t3276, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok746:
  %t3277 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3277)
  %t3278 = and i64 %t3277, -8
  %t3279 = inttoptr i64 %t3278 to ptr
  %t3280 = load i64, ptr %t3279
  %t3281 = inttoptr i64 %t3280 to ptr
  %t3282 = call fastcc i64%t3281(i64 %t3277, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3283 = call i64 @rt_make_bytevector(i64 %t3282, i64 0)
  %t3284 = call ptr @rt_alloc_words(i64 3)
  %t3285 = ptrtoint ptr %t3284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_593" to i64), ptr %t3284
  %t3286 = or i64 %t3285, 4
  %t3287 = getelementptr i64, ptr %t3284, i64 1
  store i64 %t3283, ptr %t3287
  %t3288 = getelementptr i64, ptr %t3284, i64 2
  store i64 %t3286, ptr %t3288
  %t3289 = musttail call fastcc i64 @"scheme.base:code_593"(i64 %t3286, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3289
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3294 = icmp sge i64 %argc, 0
  br i1 %t3294, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok748:
  %t3295 = call ptr @rt_alloc_words(i64 8)
  %t3296 = getelementptr i64, ptr %t3295, i64 0
  store i64 %a0, ptr %t3296
  %t3297 = getelementptr i64, ptr %t3295, i64 1
  store i64 %a1, ptr %t3297
  %t3298 = getelementptr i64, ptr %t3295, i64 2
  store i64 %a2, ptr %t3298
  %t3299 = getelementptr i64, ptr %t3295, i64 3
  store i64 %a3, ptr %t3299
  %t3300 = getelementptr i64, ptr %t3295, i64 4
  store i64 %a4, ptr %t3300
  %t3301 = getelementptr i64, ptr %t3295, i64 5
  store i64 %a5, ptr %t3301
  %t3302 = getelementptr i64, ptr %t3295, i64 6
  store i64 %a6, ptr %t3302
  %t3303 = getelementptr i64, ptr %t3295, i64 7
  store i64 %a7, ptr %t3303
  %t3304 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3295, ptr %overflow)
  %t3305 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3305)
  %t3306 = and i64 %t3305, -8
  %t3307 = inttoptr i64 %t3306 to ptr
  %t3308 = load i64, ptr %t3307
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = musttail call fastcc i64 %t3309(i64 %t3305, i64 1, i64 %t3304, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3310
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3311 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3311)
  %t3312 = and i64 %t3311, -8
  %t3313 = inttoptr i64 %t3312 to ptr
  %t3314 = load i64, ptr %t3313
  %t3315 = inttoptr i64 %t3314 to ptr
  %t3316 = musttail call fastcc i64 %t3315(i64 %t3311, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3316
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3321 = icmp eq i64 %argc, 1
  br i1 %t3321, label %argok750, label %arityerr749
arityerr749:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok750:
  %t3322 = call i64 @rt_pair_p(i64 %a0)
  %t3323 = icmp ne i64 %t3322, 1
  br i1 %t3323, label %then751, label %else752
then751:
  %t3324 = call i64 @rt_car(i64 %a0)
  ret i64 %t3324
else752:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3329 = icmp eq i64 %argc, 2
  br i1 %t3329, label %argok754, label %arityerr753
arityerr753:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok754:
  %t3330 = call i64 @rt_pair_p(i64 %a0)
  %t3331 = icmp ne i64 %t3330, 1
  br i1 %t3331, label %then755, label %else756
then755:
  %t3332 = call i64 @rt_cdr(i64 %a0)
  %t3333 = call i64 @rt_pair_p(i64 %t3332)
  br label %merge757
else756:
  br label %merge757
merge757:
  %t3334 = phi i64 [ %t3333, %then755 ], [ 1, %else756 ]
  %t3335 = icmp ne i64 %t3334, 1
  br i1 %t3335, label %then758, label %else759
then758:
  %t3336 = call i64 @rt_cdr(i64 %a0)
  %t3337 = call i64 @rt_car(i64 %t3336)
  ret i64 %t3337
else759:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3342 = icmp eq i64 %argc, 4
  br i1 %t3342, label %argok761, label %arityerr760
arityerr760:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok761:
  %t3343 = or i64 0, %a1
  %t3344 = and i64 %t3343, 7
  %t3345 = icmp eq i64 %t3344, 0
  br i1 %t3345, label %fixfast762, label %fixslow763
fixfast762:
  %t3346 = icmp slt i64 0, %a1
  %t3347 = select i1 %t3346, i64 257, i64 1
  br label %fixmerge764
fixslow763:
  %t3348 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge764
fixmerge764:
  %t3349 = phi i64 [ %t3347, %fixfast762 ], [ %t3348, %fixslow763 ]
  %t3350 = icmp ne i64 %t3349, 1
  br i1 %t3350, label %then765, label %else766
then765:
  br label %merge767
else766:
  %t3351 = or i64 0, %a1
  %t3352 = and i64 %t3351, 7
  %t3353 = icmp eq i64 %t3352, 0
  br i1 %t3353, label %fixfast768, label %fixslow769
fixfast768:
  %t3354 = icmp eq i64 0, %a1
  %t3355 = select i1 %t3354, i64 257, i64 1
  br label %fixmerge770
fixslow769:
  %t3356 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge770
fixmerge770:
  %t3357 = phi i64 [ %t3355, %fixfast768 ], [ %t3356, %fixslow769 ]
  br label %merge767
merge767:
  %t3358 = phi i64 [ 257, %then765 ], [ %t3357, %fixmerge770 ]
  %t3359 = icmp ne i64 %t3358, 1
  br i1 %t3359, label %then771, label %else772
then771:
  %t3360 = or i64 %a1, %a2
  %t3361 = and i64 %t3360, 7
  %t3362 = icmp eq i64 %t3361, 0
  br i1 %t3362, label %fixfast774, label %fixslow775
fixfast774:
  %t3363 = icmp slt i64 %a1, %a2
  %t3364 = select i1 %t3363, i64 257, i64 1
  br label %fixmerge776
fixslow775:
  %t3365 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge776
fixmerge776:
  %t3366 = phi i64 [ %t3364, %fixfast774 ], [ %t3365, %fixslow775 ]
  %t3367 = icmp ne i64 %t3366, 1
  br i1 %t3367, label %then777, label %else778
then777:
  br label %merge779
else778:
  %t3368 = or i64 %a1, %a2
  %t3369 = and i64 %t3368, 7
  %t3370 = icmp eq i64 %t3369, 0
  br i1 %t3370, label %fixfast780, label %fixslow781
fixfast780:
  %t3371 = icmp eq i64 %a1, %a2
  %t3372 = select i1 %t3371, i64 257, i64 1
  br label %fixmerge782
fixslow781:
  %t3373 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge782
fixmerge782:
  %t3374 = phi i64 [ %t3372, %fixfast780 ], [ %t3373, %fixslow781 ]
  br label %merge779
merge779:
  %t3375 = phi i64 [ 257, %then777 ], [ %t3374, %fixmerge782 ]
  %t3376 = icmp ne i64 %t3375, 1
  br i1 %t3376, label %then783, label %else784
then783:
  %t3377 = or i64 %a2, %a3
  %t3378 = and i64 %t3377, 7
  %t3379 = icmp eq i64 %t3378, 0
  br i1 %t3379, label %fixfast786, label %fixslow787
fixfast786:
  %t3380 = icmp slt i64 %a2, %a3
  %t3381 = select i1 %t3380, i64 257, i64 1
  br label %fixmerge788
fixslow787:
  %t3382 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge788
fixmerge788:
  %t3383 = phi i64 [ %t3381, %fixfast786 ], [ %t3382, %fixslow787 ]
  %t3384 = icmp ne i64 %t3383, 1
  br i1 %t3384, label %then789, label %else790
then789:
  br label %merge791
else790:
  %t3385 = or i64 %a2, %a3
  %t3386 = and i64 %t3385, 7
  %t3387 = icmp eq i64 %t3386, 0
  br i1 %t3387, label %fixfast792, label %fixslow793
fixfast792:
  %t3388 = icmp eq i64 %a2, %a3
  %t3389 = select i1 %t3388, i64 257, i64 1
  br label %fixmerge794
fixslow793:
  %t3390 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge794
fixmerge794:
  %t3391 = phi i64 [ %t3389, %fixfast792 ], [ %t3390, %fixslow793 ]
  br label %merge791
merge791:
  %t3392 = phi i64 [ 257, %then789 ], [ %t3391, %fixmerge794 ]
  br label %merge785
else784:
  br label %merge785
merge785:
  %t3393 = phi i64 [ %t3392, %merge791 ], [ 1, %else784 ]
  br label %merge773
else772:
  br label %merge773
merge773:
  %t3394 = phi i64 [ %t3393, %merge785 ], [ 1, %else772 ]
  %t3395 = icmp ne i64 %t3394, 1
  br i1 %t3395, label %then795, label %else796
then795:
  ret i64 257
else796:
  %t3396 = call i64 @rt_make_string(ptr @.str.lit.32, i64 19)
  %t3397 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t3397)
  %t3398 = and i64 %t3397, -8
  %t3399 = inttoptr i64 %t3398 to ptr
  %t3400 = load i64, ptr %t3399
  %t3401 = inttoptr i64 %t3400 to ptr
  %t3402 = musttail call fastcc i64 %t3401(i64 %t3397, i64 5, i64 %t3396, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3402
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3407 = icmp eq i64 %argc, 2
  br i1 %t3407, label %argok798, label %arityerr797
arityerr797:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok798:
  %t3408 = call i64 @rt_null_p(i64 %a1)
  %t3409 = icmp ne i64 %t3408, 1
  br i1 %t3409, label %then799, label %else800
then799:
  ret i64 1
else800:
  %t3410 = call i64 @rt_car(i64 %a1)
  %t3411 = call i64 @rt_car(i64 %t3410)
  %t3412 = call i64 @rt_eqv_p(i64 %a0, i64 %t3411)
  %t3413 = icmp ne i64 %t3412, 1
  br i1 %t3413, label %then801, label %else802
then801:
  %t3414 = call i64 @rt_car(i64 %a1)
  ret i64 %t3414
else802:
  %t3415 = call i64 @rt_cdr(i64 %a1)
  %t3416 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t3416)
  %t3417 = and i64 %t3416, -8
  %t3418 = inttoptr i64 %t3417 to ptr
  %t3419 = load i64, ptr %t3418
  %t3420 = inttoptr i64 %t3419 to ptr
  %t3421 = musttail call fastcc i64 %t3420(i64 %t3416, i64 2, i64 %a0, i64 %t3415, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3421
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3426 = icmp eq i64 %argc, 1
  br i1 %t3426, label %argok804, label %arityerr803
arityerr803:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok804:
  %t3427 = call i64 @rt_pair_p(i64 %a0)
  %t3428 = icmp ne i64 %t3427, 1
  br i1 %t3428, label %then805, label %else806
then805:
  %t3429 = call i64 @rt_car(i64 %a0)
  %t3430 = call i64 @rt_cdr(i64 %a0)
  %t3431 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t3431)
  %t3432 = and i64 %t3431, -8
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = load i64, ptr %t3433
  %t3435 = inttoptr i64 %t3434 to ptr
  %t3436 = call fastcc i64%t3435(i64 %t3431, i64 1, i64 %t3430, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3437 = call i64 @rt_cons(i64 %t3429, i64 %t3436)
  ret i64 %t3437
else806:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3442 = icmp sge i64 %argc, 2
  br i1 %t3442, label %argok808, label %arityerr807
arityerr807:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok808:
  %t3443 = call ptr @rt_alloc_words(i64 8)
  %t3444 = getelementptr i64, ptr %t3443, i64 0
  store i64 %a0, ptr %t3444
  %t3445 = getelementptr i64, ptr %t3443, i64 1
  store i64 %a1, ptr %t3445
  %t3446 = getelementptr i64, ptr %t3443, i64 2
  store i64 %a2, ptr %t3446
  %t3447 = getelementptr i64, ptr %t3443, i64 3
  store i64 %a3, ptr %t3447
  %t3448 = getelementptr i64, ptr %t3443, i64 4
  store i64 %a4, ptr %t3448
  %t3449 = getelementptr i64, ptr %t3443, i64 5
  store i64 %a5, ptr %t3449
  %t3450 = getelementptr i64, ptr %t3443, i64 6
  store i64 %a6, ptr %t3450
  %t3451 = getelementptr i64, ptr %t3443, i64 7
  store i64 %a7, ptr %t3451
  %t3452 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3443, ptr %overflow)
  %t3453 = call i64 @rt_cons(i64 %a1, i64 %t3452)
  %t3454 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3454)
  %t3455 = and i64 %t3454, -8
  %t3456 = inttoptr i64 %t3455 to ptr
  %t3457 = load i64, ptr %t3456
  %t3458 = inttoptr i64 %t3457 to ptr
  %t3459 = musttail call fastcc i64 %t3458(i64 %t3454, i64 2, i64 %a0, i64 %t3453, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3459
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cboolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3460 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3461 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3461)
  %t3462 = and i64 %t3461, -8
  %t3463 = inttoptr i64 %t3462 to ptr
  %t3464 = load i64, ptr %t3463
  %t3465 = inttoptr i64 %t3464 to ptr
  %t3466 = musttail call fastcc i64 %t3465(i64 %t3461, i64 2, i64 %a0, i64 %t3460, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3466
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3471 = icmp sge i64 %argc, 2
  br i1 %t3471, label %argok810, label %arityerr809
arityerr809:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok810:
  %t3472 = call ptr @rt_alloc_words(i64 8)
  %t3473 = getelementptr i64, ptr %t3472, i64 0
  store i64 %a0, ptr %t3473
  %t3474 = getelementptr i64, ptr %t3472, i64 1
  store i64 %a1, ptr %t3474
  %t3475 = getelementptr i64, ptr %t3472, i64 2
  store i64 %a2, ptr %t3475
  %t3476 = getelementptr i64, ptr %t3472, i64 3
  store i64 %a3, ptr %t3476
  %t3477 = getelementptr i64, ptr %t3472, i64 4
  store i64 %a4, ptr %t3477
  %t3478 = getelementptr i64, ptr %t3472, i64 5
  store i64 %a5, ptr %t3478
  %t3479 = getelementptr i64, ptr %t3472, i64 6
  store i64 %a6, ptr %t3479
  %t3480 = getelementptr i64, ptr %t3472, i64 7
  store i64 %a7, ptr %t3480
  %t3481 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3472, ptr %overflow)
  %t3482 = call i64 @rt_cons(i64 %a1, i64 %t3481)
  %t3483 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3483)
  %t3484 = and i64 %t3483, -8
  %t3485 = inttoptr i64 %t3484 to ptr
  %t3486 = load i64, ptr %t3485
  %t3487 = inttoptr i64 %t3486 to ptr
  %t3488 = musttail call fastcc i64 %t3487(i64 %t3483, i64 2, i64 %a0, i64 %t3482, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3488
}

define fastcc i64 @"min-entry:$scheme.base$ccode$csymbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3489 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3490 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3490)
  %t3491 = and i64 %t3490, -8
  %t3492 = inttoptr i64 %t3491 to ptr
  %t3493 = load i64, ptr %t3492
  %t3494 = inttoptr i64 %t3493 to ptr
  %t3495 = musttail call fastcc i64 %t3494(i64 %t3490, i64 2, i64 %a0, i64 %t3489, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3495
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3500 = icmp eq i64 %argc, 2
  br i1 %t3500, label %argok812, label %arityerr811
arityerr811:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok812:
  %t3501 = call i64 @rt_null_p(i64 %a1)
  %t3502 = icmp ne i64 %t3501, 1
  br i1 %t3502, label %then813, label %else814
then813:
  ret i64 257
else814:
  %t3503 = call i64 @rt_car(i64 %a1)
  %t3504 = call i64 @rt_eqv_p(i64 %a0, i64 %t3503)
  %t3505 = icmp ne i64 %t3504, 1
  br i1 %t3505, label %then815, label %else816
then815:
  %t3506 = call i64 @rt_car(i64 %a1)
  %t3507 = call i64 @rt_cdr(i64 %a1)
  %t3508 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3508)
  %t3509 = and i64 %t3508, -8
  %t3510 = inttoptr i64 %t3509 to ptr
  %t3511 = load i64, ptr %t3510
  %t3512 = inttoptr i64 %t3511 to ptr
  %t3513 = musttail call fastcc i64 %t3512(i64 %t3508, i64 2, i64 %t3506, i64 %t3507, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3513
else816:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_676"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3518 = icmp eq i64 %argc, 1
  br i1 %t3518, label %argok818, label %arityerr817
arityerr817:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok818:
  %t3519 = and i64 %self, -8
  %t3520 = inttoptr i64 %t3519 to ptr
  %t3521 = getelementptr i64, ptr %t3520, i64 1
  %t3522 = load i64, ptr %t3521
  %t3523 = or i64 %a0, %t3522
  %t3524 = and i64 %t3523, 7
  %t3525 = icmp eq i64 %t3524, 0
  br i1 %t3525, label %fixfast819, label %fixslow820
fixfast819:
  %t3526 = icmp eq i64 %a0, %t3522
  %t3527 = select i1 %t3526, i64 257, i64 1
  br label %fixmerge821
fixslow820:
  %t3528 = call i64 @rt_num_eq(i64 %a0, i64 %t3522)
  br label %fixmerge821
fixmerge821:
  %t3529 = phi i64 [ %t3527, %fixfast819 ], [ %t3528, %fixslow820 ]
  %t3530 = icmp ne i64 %t3529, 1
  br i1 %t3530, label %then822, label %else823
then822:
  %t3531 = and i64 %self, -8
  %t3532 = inttoptr i64 %t3531 to ptr
  %t3533 = getelementptr i64, ptr %t3532, i64 2
  %t3534 = load i64, ptr %t3533
  %t3535 = or i64 %a0, %t3534
  %t3536 = and i64 %t3535, 7
  %t3537 = icmp eq i64 %t3536, 0
  br i1 %t3537, label %fixfast825, label %fixslow826
fixfast825:
  %t3538 = icmp eq i64 %a0, %t3534
  %t3539 = select i1 %t3538, i64 257, i64 1
  br label %fixmerge827
fixslow826:
  %t3540 = call i64 @rt_num_eq(i64 %a0, i64 %t3534)
  br label %fixmerge827
fixmerge827:
  %t3541 = phi i64 [ %t3539, %fixfast825 ], [ %t3540, %fixslow826 ]
  br label %merge824
else823:
  br label %merge824
merge824:
  %t3542 = phi i64 [ %t3541, %fixmerge827 ], [ 1, %else823 ]
  %t3543 = icmp ne i64 %t3542, 1
  br i1 %t3543, label %then828, label %else829
then828:
  ret i64 0
else829:
  %t3544 = and i64 %self, -8
  %t3545 = inttoptr i64 %t3544 to ptr
  %t3546 = getelementptr i64, ptr %t3545, i64 1
  %t3547 = load i64, ptr %t3546
  %t3548 = or i64 %a0, %t3547
  %t3549 = and i64 %t3548, 7
  %t3550 = icmp eq i64 %t3549, 0
  br i1 %t3550, label %fixfast830, label %fixslow831
fixfast830:
  %t3551 = icmp eq i64 %a0, %t3547
  %t3552 = select i1 %t3551, i64 257, i64 1
  br label %fixmerge832
fixslow831:
  %t3553 = call i64 @rt_num_eq(i64 %a0, i64 %t3547)
  br label %fixmerge832
fixmerge832:
  %t3554 = phi i64 [ %t3552, %fixfast830 ], [ %t3553, %fixslow831 ]
  %t3555 = icmp ne i64 %t3554, 1
  br i1 %t3555, label %then833, label %else834
then833:
  ret i64 -8
else834:
  %t3556 = and i64 %self, -8
  %t3557 = inttoptr i64 %t3556 to ptr
  %t3558 = getelementptr i64, ptr %t3557, i64 2
  %t3559 = load i64, ptr %t3558
  %t3560 = or i64 %a0, %t3559
  %t3561 = and i64 %t3560, 7
  %t3562 = icmp eq i64 %t3561, 0
  br i1 %t3562, label %fixfast835, label %fixslow836
fixfast835:
  %t3563 = icmp eq i64 %a0, %t3559
  %t3564 = select i1 %t3563, i64 257, i64 1
  br label %fixmerge837
fixslow836:
  %t3565 = call i64 @rt_num_eq(i64 %a0, i64 %t3559)
  br label %fixmerge837
fixmerge837:
  %t3566 = phi i64 [ %t3564, %fixfast835 ], [ %t3565, %fixslow836 ]
  %t3567 = icmp ne i64 %t3566, 1
  br i1 %t3567, label %then838, label %else839
then838:
  ret i64 8
else839:
  %t3568 = and i64 %self, -8
  %t3569 = inttoptr i64 %t3568 to ptr
  %t3570 = getelementptr i64, ptr %t3569, i64 3
  %t3571 = load i64, ptr %t3570
  %t3572 = call i64 @rt_string_ref(i64 %t3571, i64 %a0)
  %t3573 = call i64 @rt_char_to_integer(i64 %t3572)
  %t3574 = and i64 %self, -8
  %t3575 = inttoptr i64 %t3574 to ptr
  %t3576 = getelementptr i64, ptr %t3575, i64 4
  %t3577 = load i64, ptr %t3576
  %t3578 = call i64 @rt_string_ref(i64 %t3577, i64 %a0)
  %t3579 = call i64 @rt_char_to_integer(i64 %t3578)
  %t3580 = or i64 %t3573, %t3579
  %t3581 = and i64 %t3580, 7
  %t3582 = icmp eq i64 %t3581, 0
  br i1 %t3582, label %fixfast840, label %fixslow841
fixfast840:
  %t3583 = icmp slt i64 %t3573, %t3579
  %t3584 = select i1 %t3583, i64 257, i64 1
  br label %fixmerge842
fixslow841:
  %t3585 = call i64 @rt_lt(i64 %t3573, i64 %t3579)
  br label %fixmerge842
fixmerge842:
  %t3586 = phi i64 [ %t3584, %fixfast840 ], [ %t3585, %fixslow841 ]
  %t3587 = icmp ne i64 %t3586, 1
  br i1 %t3587, label %then843, label %else844
then843:
  ret i64 -8
else844:
  %t3588 = or i64 %t3579, %t3573
  %t3589 = and i64 %t3588, 7
  %t3590 = icmp eq i64 %t3589, 0
  br i1 %t3590, label %fixfast845, label %fixslow846
fixfast845:
  %t3591 = icmp slt i64 %t3579, %t3573
  %t3592 = select i1 %t3591, i64 257, i64 1
  br label %fixmerge847
fixslow846:
  %t3593 = call i64 @rt_lt(i64 %t3579, i64 %t3573)
  br label %fixmerge847
fixmerge847:
  %t3594 = phi i64 [ %t3592, %fixfast845 ], [ %t3593, %fixslow846 ]
  %t3595 = icmp ne i64 %t3594, 1
  br i1 %t3595, label %then848, label %else849
then848:
  ret i64 8
else849:
  %t3596 = or i64 %a0, 8
  %t3597 = and i64 %t3596, 7
  %t3598 = icmp eq i64 %t3597, 0
  br i1 %t3598, label %fixfast850, label %fixslow851
fixfast850:
  %t3599 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3600 = extractvalue {i64, i1} %t3599, 0
  %t3601 = extractvalue {i64, i1} %t3599, 1
  br i1 %t3601, label %fixslow851, label %fixmerge852
fixslow851:
  %t3602 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge852
fixmerge852:
  %t3603 = phi i64 [ %t3600, %fixfast850 ], [ %t3602, %fixslow851 ]
  %t3604 = musttail call fastcc i64 @"scheme.base:code_676"(i64 %self, i64 1, i64 %t3603, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3604
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3605 = icmp eq i64 %argc, 2
  br i1 %t3605, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok854:
  %t3606 = call i64 @rt_string_length(i64 %a0)
  %t3607 = call i64 @rt_string_length(i64 %a1)
  %t3608 = call ptr @rt_alloc_words(i64 6)
  %t3609 = ptrtoint ptr %t3608 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_676" to i64), ptr %t3608
  %t3610 = or i64 %t3609, 4
  %t3611 = getelementptr i64, ptr %t3608, i64 1
  store i64 %t3606, ptr %t3611
  %t3612 = getelementptr i64, ptr %t3608, i64 2
  store i64 %t3607, ptr %t3612
  %t3613 = getelementptr i64, ptr %t3608, i64 3
  store i64 %a0, ptr %t3613
  %t3614 = getelementptr i64, ptr %t3608, i64 4
  store i64 %a1, ptr %t3614
  %t3615 = getelementptr i64, ptr %t3608, i64 5
  store i64 %t3610, ptr %t3615
  %t3616 = musttail call fastcc i64 @"scheme.base:code_676"(i64 %t3610, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3616
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3621 = icmp eq i64 %argc, 3
  br i1 %t3621, label %argok856, label %arityerr855
arityerr855:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok856:
  %t3622 = call i64 @rt_null_p(i64 %a2)
  %t3623 = icmp ne i64 %t3622, 1
  br i1 %t3623, label %then857, label %else858
then857:
  ret i64 257
else858:
  %t3624 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t3625 = and i64 %a0, -8
  %t3626 = inttoptr i64 %t3625 to ptr
  %t3627 = load i64, ptr %t3626
  %t3628 = inttoptr i64 %t3627 to ptr
  %t3629 = call fastcc i64%t3628(i64 %a0, i64 2, i64 %a1, i64 %t3624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3630 = icmp ne i64 %t3629, 1
  br i1 %t3630, label %then859, label %else860
then859:
  %t3631 = call i64 @rt_car(i64 %a2)
  %t3632 = call i64 @rt_cdr(i64 %a2)
  %t3633 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3633)
  %t3634 = and i64 %t3633, -8
  %t3635 = inttoptr i64 %t3634 to ptr
  %t3636 = load i64, ptr %t3635
  %t3637 = inttoptr i64 %t3636 to ptr
  %t3638 = musttail call fastcc i64 %t3637(i64 %t3633, i64 3, i64 %a0, i64 %t3631, i64 %t3632, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3638
else860:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_692"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3643 = icmp eq i64 %argc, 2
  br i1 %t3643, label %argok862, label %arityerr861
arityerr861:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok862:
  %t3644 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3644)
  %t3645 = and i64 %t3644, -8
  %t3646 = inttoptr i64 %t3645 to ptr
  %t3647 = load i64, ptr %t3646
  %t3648 = inttoptr i64 %t3647 to ptr
  %t3649 = call fastcc i64%t3648(i64 %t3644, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3650 = or i64 %t3649, 0
  %t3651 = and i64 %t3650, 7
  %t3652 = icmp eq i64 %t3651, 0
  br i1 %t3652, label %fixfast863, label %fixslow864
fixfast863:
  %t3653 = icmp slt i64 %t3649, 0
  %t3654 = select i1 %t3653, i64 257, i64 1
  br label %fixmerge865
fixslow864:
  %t3655 = call i64 @rt_lt(i64 %t3649, i64 0)
  br label %fixmerge865
fixmerge865:
  %t3656 = phi i64 [ %t3654, %fixfast863 ], [ %t3655, %fixslow864 ]
  ret i64 %t3656
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3657 = icmp sge i64 %argc, 2
  br i1 %t3657, label %argok867, label %arityerr866
arityerr866:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok867:
  %t3658 = call ptr @rt_alloc_words(i64 8)
  %t3659 = getelementptr i64, ptr %t3658, i64 0
  store i64 %a0, ptr %t3659
  %t3660 = getelementptr i64, ptr %t3658, i64 1
  store i64 %a1, ptr %t3660
  %t3661 = getelementptr i64, ptr %t3658, i64 2
  store i64 %a2, ptr %t3661
  %t3662 = getelementptr i64, ptr %t3658, i64 3
  store i64 %a3, ptr %t3662
  %t3663 = getelementptr i64, ptr %t3658, i64 4
  store i64 %a4, ptr %t3663
  %t3664 = getelementptr i64, ptr %t3658, i64 5
  store i64 %a5, ptr %t3664
  %t3665 = getelementptr i64, ptr %t3658, i64 6
  store i64 %a6, ptr %t3665
  %t3666 = getelementptr i64, ptr %t3658, i64 7
  store i64 %a7, ptr %t3666
  %t3667 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3658, ptr %overflow)
  %t3668 = call ptr @rt_alloc_words(i64 1)
  %t3669 = ptrtoint ptr %t3668 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_692" to i64), ptr %t3668
  %t3670 = or i64 %t3669, 4
  %t3671 = call i64 @rt_cons(i64 %a1, i64 %t3667)
  %t3672 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3672)
  %t3673 = and i64 %t3672, -8
  %t3674 = inttoptr i64 %t3673 to ptr
  %t3675 = load i64, ptr %t3674
  %t3676 = inttoptr i64 %t3675 to ptr
  %t3677 = musttail call fastcc i64 %t3676(i64 %t3672, i64 3, i64 %t3670, i64 %a0, i64 %t3671, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3677
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3678 = call ptr @rt_alloc_words(i64 1)
  %t3679 = ptrtoint ptr %t3678 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_692" to i64), ptr %t3678
  %t3680 = or i64 %t3679, 4
  %t3681 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3682 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3682)
  %t3683 = and i64 %t3682, -8
  %t3684 = inttoptr i64 %t3683 to ptr
  %t3685 = load i64, ptr %t3684
  %t3686 = inttoptr i64 %t3685 to ptr
  %t3687 = musttail call fastcc i64 %t3686(i64 %t3682, i64 3, i64 %t3680, i64 %a0, i64 %t3681, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3687
}

define fastcc i64 @"scheme.base:code_704"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3692 = icmp eq i64 %argc, 2
  br i1 %t3692, label %argok869, label %arityerr868
arityerr868:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok869:
  %t3693 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3693)
  %t3694 = and i64 %t3693, -8
  %t3695 = inttoptr i64 %t3694 to ptr
  %t3696 = load i64, ptr %t3695
  %t3697 = inttoptr i64 %t3696 to ptr
  %t3698 = call fastcc i64%t3697(i64 %t3693, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3699 = or i64 0, %t3698
  %t3700 = and i64 %t3699, 7
  %t3701 = icmp eq i64 %t3700, 0
  br i1 %t3701, label %fixfast870, label %fixslow871
fixfast870:
  %t3702 = icmp slt i64 0, %t3698
  %t3703 = select i1 %t3702, i64 257, i64 1
  br label %fixmerge872
fixslow871:
  %t3704 = call i64 @rt_lt(i64 0, i64 %t3698)
  br label %fixmerge872
fixmerge872:
  %t3705 = phi i64 [ %t3703, %fixfast870 ], [ %t3704, %fixslow871 ]
  ret i64 %t3705
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3706 = icmp sge i64 %argc, 2
  br i1 %t3706, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok874:
  %t3707 = call ptr @rt_alloc_words(i64 8)
  %t3708 = getelementptr i64, ptr %t3707, i64 0
  store i64 %a0, ptr %t3708
  %t3709 = getelementptr i64, ptr %t3707, i64 1
  store i64 %a1, ptr %t3709
  %t3710 = getelementptr i64, ptr %t3707, i64 2
  store i64 %a2, ptr %t3710
  %t3711 = getelementptr i64, ptr %t3707, i64 3
  store i64 %a3, ptr %t3711
  %t3712 = getelementptr i64, ptr %t3707, i64 4
  store i64 %a4, ptr %t3712
  %t3713 = getelementptr i64, ptr %t3707, i64 5
  store i64 %a5, ptr %t3713
  %t3714 = getelementptr i64, ptr %t3707, i64 6
  store i64 %a6, ptr %t3714
  %t3715 = getelementptr i64, ptr %t3707, i64 7
  store i64 %a7, ptr %t3715
  %t3716 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3707, ptr %overflow)
  %t3717 = call ptr @rt_alloc_words(i64 1)
  %t3718 = ptrtoint ptr %t3717 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_704" to i64), ptr %t3717
  %t3719 = or i64 %t3718, 4
  %t3720 = call i64 @rt_cons(i64 %a1, i64 %t3716)
  %t3721 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3721)
  %t3722 = and i64 %t3721, -8
  %t3723 = inttoptr i64 %t3722 to ptr
  %t3724 = load i64, ptr %t3723
  %t3725 = inttoptr i64 %t3724 to ptr
  %t3726 = musttail call fastcc i64 %t3725(i64 %t3721, i64 3, i64 %t3719, i64 %a0, i64 %t3720, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3726
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3727 = call ptr @rt_alloc_words(i64 1)
  %t3728 = ptrtoint ptr %t3727 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_704" to i64), ptr %t3727
  %t3729 = or i64 %t3728, 4
  %t3730 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3731 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3731)
  %t3732 = and i64 %t3731, -8
  %t3733 = inttoptr i64 %t3732 to ptr
  %t3734 = load i64, ptr %t3733
  %t3735 = inttoptr i64 %t3734 to ptr
  %t3736 = musttail call fastcc i64 %t3735(i64 %t3731, i64 3, i64 %t3729, i64 %a0, i64 %t3730, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3736
}

define fastcc i64 @"scheme.base:code_716"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3741 = icmp eq i64 %argc, 2
  br i1 %t3741, label %argok876, label %arityerr875
arityerr875:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok876:
  %t3742 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3742)
  %t3743 = and i64 %t3742, -8
  %t3744 = inttoptr i64 %t3743 to ptr
  %t3745 = load i64, ptr %t3744
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = call fastcc i64%t3746(i64 %t3742, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3748 = or i64 0, %t3747
  %t3749 = and i64 %t3748, 7
  %t3750 = icmp eq i64 %t3749, 0
  br i1 %t3750, label %fixfast877, label %fixslow878
fixfast877:
  %t3751 = icmp slt i64 0, %t3747
  %t3752 = select i1 %t3751, i64 257, i64 1
  br label %fixmerge879
fixslow878:
  %t3753 = call i64 @rt_lt(i64 0, i64 %t3747)
  br label %fixmerge879
fixmerge879:
  %t3754 = phi i64 [ %t3752, %fixfast877 ], [ %t3753, %fixslow878 ]
  %t3755 = call i64 @rt_not(i64 %t3754)
  ret i64 %t3755
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3756 = icmp sge i64 %argc, 2
  br i1 %t3756, label %argok881, label %arityerr880
arityerr880:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok881:
  %t3757 = call ptr @rt_alloc_words(i64 8)
  %t3758 = getelementptr i64, ptr %t3757, i64 0
  store i64 %a0, ptr %t3758
  %t3759 = getelementptr i64, ptr %t3757, i64 1
  store i64 %a1, ptr %t3759
  %t3760 = getelementptr i64, ptr %t3757, i64 2
  store i64 %a2, ptr %t3760
  %t3761 = getelementptr i64, ptr %t3757, i64 3
  store i64 %a3, ptr %t3761
  %t3762 = getelementptr i64, ptr %t3757, i64 4
  store i64 %a4, ptr %t3762
  %t3763 = getelementptr i64, ptr %t3757, i64 5
  store i64 %a5, ptr %t3763
  %t3764 = getelementptr i64, ptr %t3757, i64 6
  store i64 %a6, ptr %t3764
  %t3765 = getelementptr i64, ptr %t3757, i64 7
  store i64 %a7, ptr %t3765
  %t3766 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3757, ptr %overflow)
  %t3767 = call ptr @rt_alloc_words(i64 1)
  %t3768 = ptrtoint ptr %t3767 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_716" to i64), ptr %t3767
  %t3769 = or i64 %t3768, 4
  %t3770 = call i64 @rt_cons(i64 %a1, i64 %t3766)
  %t3771 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3771)
  %t3772 = and i64 %t3771, -8
  %t3773 = inttoptr i64 %t3772 to ptr
  %t3774 = load i64, ptr %t3773
  %t3775 = inttoptr i64 %t3774 to ptr
  %t3776 = musttail call fastcc i64 %t3775(i64 %t3771, i64 3, i64 %t3769, i64 %a0, i64 %t3770, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3776
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3777 = call ptr @rt_alloc_words(i64 1)
  %t3778 = ptrtoint ptr %t3777 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_716" to i64), ptr %t3777
  %t3779 = or i64 %t3778, 4
  %t3780 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3781 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3781)
  %t3782 = and i64 %t3781, -8
  %t3783 = inttoptr i64 %t3782 to ptr
  %t3784 = load i64, ptr %t3783
  %t3785 = inttoptr i64 %t3784 to ptr
  %t3786 = musttail call fastcc i64 %t3785(i64 %t3781, i64 3, i64 %t3779, i64 %a0, i64 %t3780, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3786
}

define fastcc i64 @"scheme.base:code_728"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3791 = icmp eq i64 %argc, 2
  br i1 %t3791, label %argok883, label %arityerr882
arityerr882:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok883:
  %t3792 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3792)
  %t3793 = and i64 %t3792, -8
  %t3794 = inttoptr i64 %t3793 to ptr
  %t3795 = load i64, ptr %t3794
  %t3796 = inttoptr i64 %t3795 to ptr
  %t3797 = call fastcc i64%t3796(i64 %t3792, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3798 = or i64 %t3797, 0
  %t3799 = and i64 %t3798, 7
  %t3800 = icmp eq i64 %t3799, 0
  br i1 %t3800, label %fixfast884, label %fixslow885
fixfast884:
  %t3801 = icmp slt i64 %t3797, 0
  %t3802 = select i1 %t3801, i64 257, i64 1
  br label %fixmerge886
fixslow885:
  %t3803 = call i64 @rt_lt(i64 %t3797, i64 0)
  br label %fixmerge886
fixmerge886:
  %t3804 = phi i64 [ %t3802, %fixfast884 ], [ %t3803, %fixslow885 ]
  %t3805 = call i64 @rt_not(i64 %t3804)
  ret i64 %t3805
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3806 = icmp sge i64 %argc, 2
  br i1 %t3806, label %argok888, label %arityerr887
arityerr887:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok888:
  %t3807 = call ptr @rt_alloc_words(i64 8)
  %t3808 = getelementptr i64, ptr %t3807, i64 0
  store i64 %a0, ptr %t3808
  %t3809 = getelementptr i64, ptr %t3807, i64 1
  store i64 %a1, ptr %t3809
  %t3810 = getelementptr i64, ptr %t3807, i64 2
  store i64 %a2, ptr %t3810
  %t3811 = getelementptr i64, ptr %t3807, i64 3
  store i64 %a3, ptr %t3811
  %t3812 = getelementptr i64, ptr %t3807, i64 4
  store i64 %a4, ptr %t3812
  %t3813 = getelementptr i64, ptr %t3807, i64 5
  store i64 %a5, ptr %t3813
  %t3814 = getelementptr i64, ptr %t3807, i64 6
  store i64 %a6, ptr %t3814
  %t3815 = getelementptr i64, ptr %t3807, i64 7
  store i64 %a7, ptr %t3815
  %t3816 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3807, ptr %overflow)
  %t3817 = call ptr @rt_alloc_words(i64 1)
  %t3818 = ptrtoint ptr %t3817 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_728" to i64), ptr %t3817
  %t3819 = or i64 %t3818, 4
  %t3820 = call i64 @rt_cons(i64 %a1, i64 %t3816)
  %t3821 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3821)
  %t3822 = and i64 %t3821, -8
  %t3823 = inttoptr i64 %t3822 to ptr
  %t3824 = load i64, ptr %t3823
  %t3825 = inttoptr i64 %t3824 to ptr
  %t3826 = musttail call fastcc i64 %t3825(i64 %t3821, i64 3, i64 %t3819, i64 %a0, i64 %t3820, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3826
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3827 = call ptr @rt_alloc_words(i64 1)
  %t3828 = ptrtoint ptr %t3827 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_728" to i64), ptr %t3827
  %t3829 = or i64 %t3828, 4
  %t3830 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3831 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3831)
  %t3832 = and i64 %t3831, -8
  %t3833 = inttoptr i64 %t3832 to ptr
  %t3834 = load i64, ptr %t3833
  %t3835 = inttoptr i64 %t3834 to ptr
  %t3836 = musttail call fastcc i64 %t3835(i64 %t3831, i64 3, i64 %t3829, i64 %a0, i64 %t3830, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3836
}

define fastcc i64 @"scheme.base:code_743"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3841 = icmp eq i64 %argc, 2
  br i1 %t3841, label %argok890, label %arityerr889
arityerr889:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok890:
  %t3842 = and i64 %self, -8
  %t3843 = inttoptr i64 %t3842 to ptr
  %t3844 = getelementptr i64, ptr %t3843, i64 1
  %t3845 = load i64, ptr %t3844
  %t3846 = or i64 %a0, %t3845
  %t3847 = and i64 %t3846, 7
  %t3848 = icmp eq i64 %t3847, 0
  br i1 %t3848, label %fixfast891, label %fixslow892
fixfast891:
  %t3849 = icmp slt i64 %a0, %t3845
  %t3850 = select i1 %t3849, i64 257, i64 1
  br label %fixmerge893
fixslow892:
  %t3851 = call i64 @rt_lt(i64 %a0, i64 %t3845)
  br label %fixmerge893
fixmerge893:
  %t3852 = phi i64 [ %t3850, %fixfast891 ], [ %t3851, %fixslow892 ]
  %t3853 = icmp ne i64 %t3852, 1
  br i1 %t3853, label %then894, label %else895
then894:
  ret i64 %a1
else895:
  %t3854 = or i64 %a0, 8
  %t3855 = and i64 %t3854, 7
  %t3856 = icmp eq i64 %t3855, 0
  br i1 %t3856, label %fixfast896, label %fixslow897
fixfast896:
  %t3857 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3858 = extractvalue {i64, i1} %t3857, 0
  %t3859 = extractvalue {i64, i1} %t3857, 1
  br i1 %t3859, label %fixslow897, label %fixmerge898
fixslow897:
  %t3860 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge898
fixmerge898:
  %t3861 = phi i64 [ %t3858, %fixfast896 ], [ %t3860, %fixslow897 ]
  %t3862 = and i64 %self, -8
  %t3863 = inttoptr i64 %t3862 to ptr
  %t3864 = getelementptr i64, ptr %t3863, i64 3
  %t3865 = load i64, ptr %t3864
  %t3866 = call i64 @rt_vector_ref(i64 %t3865, i64 %a0)
  %t3867 = call i64 @rt_cons(i64 %t3866, i64 %a1)
  %t3868 = musttail call fastcc i64 @"scheme.base:code_743"(i64 %self, i64 2, i64 %t3861, i64 %t3867, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3868
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3869 = icmp sge i64 %argc, 1
  br i1 %t3869, label %argok900, label %arityerr899
arityerr899:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok900:
  %t3870 = call ptr @rt_alloc_words(i64 8)
  %t3871 = getelementptr i64, ptr %t3870, i64 0
  store i64 %a0, ptr %t3871
  %t3872 = getelementptr i64, ptr %t3870, i64 1
  store i64 %a1, ptr %t3872
  %t3873 = getelementptr i64, ptr %t3870, i64 2
  store i64 %a2, ptr %t3873
  %t3874 = getelementptr i64, ptr %t3870, i64 3
  store i64 %a3, ptr %t3874
  %t3875 = getelementptr i64, ptr %t3870, i64 4
  store i64 %a4, ptr %t3875
  %t3876 = getelementptr i64, ptr %t3870, i64 5
  store i64 %a5, ptr %t3876
  %t3877 = getelementptr i64, ptr %t3870, i64 6
  store i64 %a6, ptr %t3877
  %t3878 = getelementptr i64, ptr %t3870, i64 7
  store i64 %a7, ptr %t3878
  %t3879 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3870, ptr %overflow)
  %t3880 = call i64 @rt_vector_length(i64 %a0)
  %t3881 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3881)
  %t3882 = and i64 %t3881, -8
  %t3883 = inttoptr i64 %t3882 to ptr
  %t3884 = load i64, ptr %t3883
  %t3885 = inttoptr i64 %t3884 to ptr
  %t3886 = call fastcc i64%t3885(i64 %t3881, i64 1, i64 %t3879, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3887 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3887)
  %t3888 = and i64 %t3887, -8
  %t3889 = inttoptr i64 %t3888 to ptr
  %t3890 = load i64, ptr %t3889
  %t3891 = inttoptr i64 %t3890 to ptr
  %t3892 = call fastcc i64%t3891(i64 %t3887, i64 2, i64 %t3879, i64 %t3880, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3893 = call i64 @rt_intern(ptr @.str.sym.33)
  %t3894 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3894)
  %t3895 = and i64 %t3894, -8
  %t3896 = inttoptr i64 %t3895 to ptr
  %t3897 = load i64, ptr %t3896
  %t3898 = inttoptr i64 %t3897 to ptr
  %t3899 = call fastcc i64%t3898(i64 %t3894, i64 4, i64 %t3893, i64 %t3886, i64 %t3892, i64 %t3880, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3900 = call ptr @rt_alloc_words(i64 4)
  %t3901 = ptrtoint ptr %t3900 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_743" to i64), ptr %t3900
  %t3902 = or i64 %t3901, 4
  %t3903 = getelementptr i64, ptr %t3900, i64 1
  store i64 %t3886, ptr %t3903
  %t3904 = getelementptr i64, ptr %t3900, i64 2
  store i64 %t3902, ptr %t3904
  %t3905 = getelementptr i64, ptr %t3900, i64 3
  store i64 %a0, ptr %t3905
  %t3906 = or i64 %t3892, 8
  %t3907 = and i64 %t3906, 7
  %t3908 = icmp eq i64 %t3907, 0
  br i1 %t3908, label %fixfast901, label %fixslow902
fixfast901:
  %t3909 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3892, i64 8)
  %t3910 = extractvalue {i64, i1} %t3909, 0
  %t3911 = extractvalue {i64, i1} %t3909, 1
  br i1 %t3911, label %fixslow902, label %fixmerge903
fixslow902:
  %t3912 = call i64 @rt_sub(i64 %t3892, i64 8)
  br label %fixmerge903
fixmerge903:
  %t3913 = phi i64 [ %t3910, %fixfast901 ], [ %t3912, %fixslow902 ]
  %t3914 = musttail call fastcc i64 @"scheme.base:code_743"(i64 %t3902, i64 2, i64 %t3913, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3914
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3915 = call i64 @rt_vector_length(i64 %a0)
  %t3916 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3916)
  %t3917 = and i64 %t3916, -8
  %t3918 = inttoptr i64 %t3917 to ptr
  %t3919 = load i64, ptr %t3918
  %t3920 = inttoptr i64 %t3919 to ptr
  %t3921 = call fastcc i64%t3920(i64 %t3916, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3922 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3922)
  %t3923 = and i64 %t3922, -8
  %t3924 = inttoptr i64 %t3923 to ptr
  %t3925 = load i64, ptr %t3924
  %t3926 = inttoptr i64 %t3925 to ptr
  %t3927 = call fastcc i64%t3926(i64 %t3922, i64 2, i64 2, i64 %t3915, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3928 = call i64 @rt_intern(ptr @.str.sym.33)
  %t3929 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3929)
  %t3930 = and i64 %t3929, -8
  %t3931 = inttoptr i64 %t3930 to ptr
  %t3932 = load i64, ptr %t3931
  %t3933 = inttoptr i64 %t3932 to ptr
  %t3934 = call fastcc i64%t3933(i64 %t3929, i64 4, i64 %t3928, i64 %t3921, i64 %t3927, i64 %t3915, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3935 = call ptr @rt_alloc_words(i64 4)
  %t3936 = ptrtoint ptr %t3935 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_743" to i64), ptr %t3935
  %t3937 = or i64 %t3936, 4
  %t3938 = getelementptr i64, ptr %t3935, i64 1
  store i64 %t3921, ptr %t3938
  %t3939 = getelementptr i64, ptr %t3935, i64 2
  store i64 %t3937, ptr %t3939
  %t3940 = getelementptr i64, ptr %t3935, i64 3
  store i64 %a0, ptr %t3940
  %t3941 = or i64 %t3927, 8
  %t3942 = and i64 %t3941, 7
  %t3943 = icmp eq i64 %t3942, 0
  br i1 %t3943, label %fixfast904, label %fixslow905
fixfast904:
  %t3944 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3927, i64 8)
  %t3945 = extractvalue {i64, i1} %t3944, 0
  %t3946 = extractvalue {i64, i1} %t3944, 1
  br i1 %t3946, label %fixslow905, label %fixmerge906
fixslow905:
  %t3947 = call i64 @rt_sub(i64 %t3927, i64 8)
  br label %fixmerge906
fixmerge906:
  %t3948 = phi i64 [ %t3945, %fixfast904 ], [ %t3947, %fixslow905 ]
  %t3949 = musttail call fastcc i64 @"scheme.base:code_743"(i64 %t3937, i64 2, i64 %t3948, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3949
}

define fastcc i64 @"scheme.base:code_758"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3954 = icmp eq i64 %argc, 1
  br i1 %t3954, label %argok908, label %arityerr907
arityerr907:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok908:
  %t3955 = and i64 %self, -8
  %t3956 = inttoptr i64 %t3955 to ptr
  %t3957 = getelementptr i64, ptr %t3956, i64 1
  %t3958 = load i64, ptr %t3957
  %t3959 = or i64 %a0, %t3958
  %t3960 = and i64 %t3959, 7
  %t3961 = icmp eq i64 %t3960, 0
  br i1 %t3961, label %fixfast909, label %fixslow910
fixfast909:
  %t3962 = icmp eq i64 %a0, %t3958
  %t3963 = select i1 %t3962, i64 257, i64 1
  br label %fixmerge911
fixslow910:
  %t3964 = call i64 @rt_num_eq(i64 %a0, i64 %t3958)
  br label %fixmerge911
fixmerge911:
  %t3965 = phi i64 [ %t3963, %fixfast909 ], [ %t3964, %fixslow910 ]
  %t3966 = icmp ne i64 %t3965, 1
  br i1 %t3966, label %then912, label %else913
then912:
  %t3967 = and i64 %self, -8
  %t3968 = inttoptr i64 %t3967 to ptr
  %t3969 = getelementptr i64, ptr %t3968, i64 2
  %t3970 = load i64, ptr %t3969
  ret i64 %t3970
else913:
  %t3971 = and i64 %self, -8
  %t3972 = inttoptr i64 %t3971 to ptr
  %t3973 = getelementptr i64, ptr %t3972, i64 2
  %t3974 = load i64, ptr %t3973
  %t3975 = and i64 %self, -8
  %t3976 = inttoptr i64 %t3975 to ptr
  %t3977 = getelementptr i64, ptr %t3976, i64 3
  %t3978 = load i64, ptr %t3977
  %t3979 = or i64 %a0, %t3978
  %t3980 = and i64 %t3979, 7
  %t3981 = icmp eq i64 %t3980, 0
  br i1 %t3981, label %fixfast914, label %fixslow915
fixfast914:
  %t3982 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3978)
  %t3983 = extractvalue {i64, i1} %t3982, 0
  %t3984 = extractvalue {i64, i1} %t3982, 1
  br i1 %t3984, label %fixslow915, label %fixmerge916
fixslow915:
  %t3985 = call i64 @rt_sub(i64 %a0, i64 %t3978)
  br label %fixmerge916
fixmerge916:
  %t3986 = phi i64 [ %t3983, %fixfast914 ], [ %t3985, %fixslow915 ]
  %t3987 = and i64 %self, -8
  %t3988 = inttoptr i64 %t3987 to ptr
  %t3989 = getelementptr i64, ptr %t3988, i64 4
  %t3990 = load i64, ptr %t3989
  %t3991 = call i64 @rt_vector_ref(i64 %t3990, i64 %a0)
  %t3992 = call i64 @rt_vector_set(i64 %t3974, i64 %t3986, i64 %t3991)
  %t3993 = or i64 %a0, 8
  %t3994 = and i64 %t3993, 7
  %t3995 = icmp eq i64 %t3994, 0
  br i1 %t3995, label %fixfast917, label %fixslow918
fixfast917:
  %t3996 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3997 = extractvalue {i64, i1} %t3996, 0
  %t3998 = extractvalue {i64, i1} %t3996, 1
  br i1 %t3998, label %fixslow918, label %fixmerge919
fixslow918:
  %t3999 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge919
fixmerge919:
  %t4000 = phi i64 [ %t3997, %fixfast917 ], [ %t3999, %fixslow918 ]
  %t4001 = musttail call fastcc i64 @"scheme.base:code_758"(i64 %self, i64 1, i64 %t4000, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4001
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4002 = icmp sge i64 %argc, 1
  br i1 %t4002, label %argok921, label %arityerr920
arityerr920:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok921:
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
  %t4012 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4003, ptr %overflow)
  %t4013 = call i64 @rt_vector_length(i64 %a0)
  %t4014 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4014)
  %t4015 = and i64 %t4014, -8
  %t4016 = inttoptr i64 %t4015 to ptr
  %t4017 = load i64, ptr %t4016
  %t4018 = inttoptr i64 %t4017 to ptr
  %t4019 = call fastcc i64%t4018(i64 %t4014, i64 1, i64 %t4012, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4020 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4020)
  %t4021 = and i64 %t4020, -8
  %t4022 = inttoptr i64 %t4021 to ptr
  %t4023 = load i64, ptr %t4022
  %t4024 = inttoptr i64 %t4023 to ptr
  %t4025 = call fastcc i64%t4024(i64 %t4020, i64 2, i64 %t4012, i64 %t4013, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4026 = call i64 @rt_intern(ptr @.str.sym.34)
  %t4027 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4027)
  %t4028 = and i64 %t4027, -8
  %t4029 = inttoptr i64 %t4028 to ptr
  %t4030 = load i64, ptr %t4029
  %t4031 = inttoptr i64 %t4030 to ptr
  %t4032 = call fastcc i64%t4031(i64 %t4027, i64 4, i64 %t4026, i64 %t4019, i64 %t4025, i64 %t4013, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4033 = or i64 %t4025, %t4019
  %t4034 = and i64 %t4033, 7
  %t4035 = icmp eq i64 %t4034, 0
  br i1 %t4035, label %fixfast922, label %fixslow923
fixfast922:
  %t4036 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4025, i64 %t4019)
  %t4037 = extractvalue {i64, i1} %t4036, 0
  %t4038 = extractvalue {i64, i1} %t4036, 1
  br i1 %t4038, label %fixslow923, label %fixmerge924
fixslow923:
  %t4039 = call i64 @rt_sub(i64 %t4025, i64 %t4019)
  br label %fixmerge924
fixmerge924:
  %t4040 = phi i64 [ %t4037, %fixfast922 ], [ %t4039, %fixslow923 ]
  %t4041 = call i64 @rt_make_vector(i64 %t4040, i64 0)
  %t4042 = call ptr @rt_alloc_words(i64 6)
  %t4043 = ptrtoint ptr %t4042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_758" to i64), ptr %t4042
  %t4044 = or i64 %t4043, 4
  %t4045 = getelementptr i64, ptr %t4042, i64 1
  store i64 %t4025, ptr %t4045
  %t4046 = getelementptr i64, ptr %t4042, i64 2
  store i64 %t4041, ptr %t4046
  %t4047 = getelementptr i64, ptr %t4042, i64 3
  store i64 %t4019, ptr %t4047
  %t4048 = getelementptr i64, ptr %t4042, i64 4
  store i64 %a0, ptr %t4048
  %t4049 = getelementptr i64, ptr %t4042, i64 5
  store i64 %t4044, ptr %t4049
  %t4050 = musttail call fastcc i64 @"scheme.base:code_758"(i64 %t4044, i64 1, i64 %t4019, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4050
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4051 = call i64 @rt_vector_length(i64 %a0)
  %t4052 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4052)
  %t4053 = and i64 %t4052, -8
  %t4054 = inttoptr i64 %t4053 to ptr
  %t4055 = load i64, ptr %t4054
  %t4056 = inttoptr i64 %t4055 to ptr
  %t4057 = call fastcc i64%t4056(i64 %t4052, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4058 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4058)
  %t4059 = and i64 %t4058, -8
  %t4060 = inttoptr i64 %t4059 to ptr
  %t4061 = load i64, ptr %t4060
  %t4062 = inttoptr i64 %t4061 to ptr
  %t4063 = call fastcc i64%t4062(i64 %t4058, i64 2, i64 2, i64 %t4051, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4064 = call i64 @rt_intern(ptr @.str.sym.34)
  %t4065 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4065)
  %t4066 = and i64 %t4065, -8
  %t4067 = inttoptr i64 %t4066 to ptr
  %t4068 = load i64, ptr %t4067
  %t4069 = inttoptr i64 %t4068 to ptr
  %t4070 = call fastcc i64%t4069(i64 %t4065, i64 4, i64 %t4064, i64 %t4057, i64 %t4063, i64 %t4051, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4071 = or i64 %t4063, %t4057
  %t4072 = and i64 %t4071, 7
  %t4073 = icmp eq i64 %t4072, 0
  br i1 %t4073, label %fixfast925, label %fixslow926
fixfast925:
  %t4074 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4063, i64 %t4057)
  %t4075 = extractvalue {i64, i1} %t4074, 0
  %t4076 = extractvalue {i64, i1} %t4074, 1
  br i1 %t4076, label %fixslow926, label %fixmerge927
fixslow926:
  %t4077 = call i64 @rt_sub(i64 %t4063, i64 %t4057)
  br label %fixmerge927
fixmerge927:
  %t4078 = phi i64 [ %t4075, %fixfast925 ], [ %t4077, %fixslow926 ]
  %t4079 = call i64 @rt_make_vector(i64 %t4078, i64 0)
  %t4080 = call ptr @rt_alloc_words(i64 6)
  %t4081 = ptrtoint ptr %t4080 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_758" to i64), ptr %t4080
  %t4082 = or i64 %t4081, 4
  %t4083 = getelementptr i64, ptr %t4080, i64 1
  store i64 %t4063, ptr %t4083
  %t4084 = getelementptr i64, ptr %t4080, i64 2
  store i64 %t4079, ptr %t4084
  %t4085 = getelementptr i64, ptr %t4080, i64 3
  store i64 %t4057, ptr %t4085
  %t4086 = getelementptr i64, ptr %t4080, i64 4
  store i64 %a0, ptr %t4086
  %t4087 = getelementptr i64, ptr %t4080, i64 5
  store i64 %t4082, ptr %t4087
  %t4088 = musttail call fastcc i64 @"scheme.base:code_758"(i64 %t4082, i64 1, i64 %t4057, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4088
}

define fastcc i64 @"scheme.base:code_776"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4093 = icmp eq i64 %argc, 1
  br i1 %t4093, label %argok929, label %arityerr928
arityerr928:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok929:
  %t4094 = and i64 %self, -8
  %t4095 = inttoptr i64 %t4094 to ptr
  %t4096 = getelementptr i64, ptr %t4095, i64 1
  %t4097 = load i64, ptr %t4096
  %t4098 = or i64 %a0, %t4097
  %t4099 = and i64 %t4098, 7
  %t4100 = icmp eq i64 %t4099, 0
  br i1 %t4100, label %fixfast930, label %fixslow931
fixfast930:
  %t4101 = icmp eq i64 %a0, %t4097
  %t4102 = select i1 %t4101, i64 257, i64 1
  br label %fixmerge932
fixslow931:
  %t4103 = call i64 @rt_num_eq(i64 %a0, i64 %t4097)
  br label %fixmerge932
fixmerge932:
  %t4104 = phi i64 [ %t4102, %fixfast930 ], [ %t4103, %fixslow931 ]
  %t4105 = icmp ne i64 %t4104, 1
  br i1 %t4105, label %then933, label %else934
then933:
  %t4106 = and i64 %self, -8
  %t4107 = inttoptr i64 %t4106 to ptr
  %t4108 = getelementptr i64, ptr %t4107, i64 3
  %t4109 = load i64, ptr %t4108
  %t4110 = call i64 @rt_cdr(i64 %t4109)
  %t4111 = and i64 %self, -8
  %t4112 = inttoptr i64 %t4111 to ptr
  %t4113 = getelementptr i64, ptr %t4112, i64 4
  %t4114 = load i64, ptr %t4113
  %t4115 = and i64 %self, -8
  %t4116 = inttoptr i64 %t4115 to ptr
  %t4117 = getelementptr i64, ptr %t4116, i64 1
  %t4118 = load i64, ptr %t4117
  %t4119 = or i64 %t4114, %t4118
  %t4120 = and i64 %t4119, 7
  %t4121 = icmp eq i64 %t4120, 0
  br i1 %t4121, label %fixfast935, label %fixslow936
fixfast935:
  %t4122 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4114, i64 %t4118)
  %t4123 = extractvalue {i64, i1} %t4122, 0
  %t4124 = extractvalue {i64, i1} %t4122, 1
  br i1 %t4124, label %fixslow936, label %fixmerge937
fixslow936:
  %t4125 = call i64 @rt_add(i64 %t4114, i64 %t4118)
  br label %fixmerge937
fixmerge937:
  %t4126 = phi i64 [ %t4123, %fixfast935 ], [ %t4125, %fixslow936 ]
  %t4127 = and i64 %self, -8
  %t4128 = inttoptr i64 %t4127 to ptr
  %t4129 = getelementptr i64, ptr %t4128, i64 2
  %t4130 = load i64, ptr %t4129
  %t4131 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t4130, i64 2, i64 %t4110, i64 %t4126, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4131
else934:
  %t4132 = and i64 %self, -8
  %t4133 = inttoptr i64 %t4132 to ptr
  %t4134 = getelementptr i64, ptr %t4133, i64 5
  %t4135 = load i64, ptr %t4134
  %t4136 = and i64 %self, -8
  %t4137 = inttoptr i64 %t4136 to ptr
  %t4138 = getelementptr i64, ptr %t4137, i64 4
  %t4139 = load i64, ptr %t4138
  %t4140 = or i64 %t4139, %a0
  %t4141 = and i64 %t4140, 7
  %t4142 = icmp eq i64 %t4141, 0
  br i1 %t4142, label %fixfast938, label %fixslow939
fixfast938:
  %t4143 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4139, i64 %a0)
  %t4144 = extractvalue {i64, i1} %t4143, 0
  %t4145 = extractvalue {i64, i1} %t4143, 1
  br i1 %t4145, label %fixslow939, label %fixmerge940
fixslow939:
  %t4146 = call i64 @rt_add(i64 %t4139, i64 %a0)
  br label %fixmerge940
fixmerge940:
  %t4147 = phi i64 [ %t4144, %fixfast938 ], [ %t4146, %fixslow939 ]
  %t4148 = and i64 %self, -8
  %t4149 = inttoptr i64 %t4148 to ptr
  %t4150 = getelementptr i64, ptr %t4149, i64 6
  %t4151 = load i64, ptr %t4150
  %t4152 = call i64 @rt_vector_ref(i64 %t4151, i64 %a0)
  %t4153 = call i64 @rt_vector_set(i64 %t4135, i64 %t4147, i64 %t4152)
  %t4154 = or i64 %a0, 8
  %t4155 = and i64 %t4154, 7
  %t4156 = icmp eq i64 %t4155, 0
  br i1 %t4156, label %fixfast941, label %fixslow942
fixfast941:
  %t4157 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4158 = extractvalue {i64, i1} %t4157, 0
  %t4159 = extractvalue {i64, i1} %t4157, 1
  br i1 %t4159, label %fixslow942, label %fixmerge943
fixslow942:
  %t4160 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge943
fixmerge943:
  %t4161 = phi i64 [ %t4158, %fixfast941 ], [ %t4160, %fixslow942 ]
  %t4162 = musttail call fastcc i64 @"scheme.base:code_776"(i64 %self, i64 1, i64 %t4161, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4162
}

define fastcc i64 @"scheme.base:code_774"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4163 = icmp eq i64 %argc, 2
  br i1 %t4163, label %argok945, label %arityerr944
arityerr944:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok945:
  %t4164 = call i64 @rt_null_p(i64 %a0)
  %t4165 = icmp ne i64 %t4164, 1
  br i1 %t4165, label %then946, label %else947
then946:
  %t4166 = and i64 %self, -8
  %t4167 = inttoptr i64 %t4166 to ptr
  %t4168 = getelementptr i64, ptr %t4167, i64 1
  %t4169 = load i64, ptr %t4168
  ret i64 %t4169
else947:
  %t4170 = call i64 @rt_car(i64 %a0)
  %t4171 = call i64 @rt_vector_length(i64 %t4170)
  %t4172 = call ptr @rt_alloc_words(i64 8)
  %t4173 = ptrtoint ptr %t4172 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_776" to i64), ptr %t4172
  %t4174 = or i64 %t4173, 4
  %t4175 = getelementptr i64, ptr %t4172, i64 1
  store i64 %t4171, ptr %t4175
  %t4176 = and i64 %self, -8
  %t4177 = inttoptr i64 %t4176 to ptr
  %t4178 = getelementptr i64, ptr %t4177, i64 2
  %t4179 = load i64, ptr %t4178
  %t4180 = getelementptr i64, ptr %t4172, i64 2
  store i64 %t4179, ptr %t4180
  %t4181 = getelementptr i64, ptr %t4172, i64 3
  store i64 %a0, ptr %t4181
  %t4182 = getelementptr i64, ptr %t4172, i64 4
  store i64 %a1, ptr %t4182
  %t4183 = and i64 %self, -8
  %t4184 = inttoptr i64 %t4183 to ptr
  %t4185 = getelementptr i64, ptr %t4184, i64 1
  %t4186 = load i64, ptr %t4185
  %t4187 = getelementptr i64, ptr %t4172, i64 5
  store i64 %t4186, ptr %t4187
  %t4188 = getelementptr i64, ptr %t4172, i64 6
  store i64 %t4170, ptr %t4188
  %t4189 = getelementptr i64, ptr %t4172, i64 7
  store i64 %t4174, ptr %t4189
  %t4190 = musttail call fastcc i64 @"scheme.base:code_776"(i64 %t4174, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4190
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4191 = icmp sge i64 %argc, 0
  br i1 %t4191, label %argok949, label %arityerr948
arityerr948:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok949:
  %t4192 = call ptr @rt_alloc_words(i64 8)
  %t4193 = getelementptr i64, ptr %t4192, i64 0
  store i64 %a0, ptr %t4193
  %t4194 = getelementptr i64, ptr %t4192, i64 1
  store i64 %a1, ptr %t4194
  %t4195 = getelementptr i64, ptr %t4192, i64 2
  store i64 %a2, ptr %t4195
  %t4196 = getelementptr i64, ptr %t4192, i64 3
  store i64 %a3, ptr %t4196
  %t4197 = getelementptr i64, ptr %t4192, i64 4
  store i64 %a4, ptr %t4197
  %t4198 = getelementptr i64, ptr %t4192, i64 5
  store i64 %a5, ptr %t4198
  %t4199 = getelementptr i64, ptr %t4192, i64 6
  store i64 %a6, ptr %t4199
  %t4200 = getelementptr i64, ptr %t4192, i64 7
  store i64 %a7, ptr %t4200
  %t4201 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4192, ptr %overflow)
  %t4202 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4202)
  %t4203 = and i64 %t4202, -8
  %t4204 = inttoptr i64 %t4203 to ptr
  %t4205 = load i64, ptr %t4204
  %t4206 = inttoptr i64 %t4205 to ptr
  %t4207 = call fastcc i64%t4206(i64 %t4202, i64 1, i64 %t4201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4208 = call i64 @rt_make_vector(i64 %t4207, i64 0)
  %t4209 = call ptr @rt_alloc_words(i64 3)
  %t4210 = ptrtoint ptr %t4209 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_774" to i64), ptr %t4209
  %t4211 = or i64 %t4210, 4
  %t4212 = getelementptr i64, ptr %t4209, i64 1
  store i64 %t4208, ptr %t4212
  %t4213 = getelementptr i64, ptr %t4209, i64 2
  store i64 %t4211, ptr %t4213
  %t4214 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t4211, i64 2, i64 %t4201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4214
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4215 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4215)
  %t4216 = and i64 %t4215, -8
  %t4217 = inttoptr i64 %t4216 to ptr
  %t4218 = load i64, ptr %t4217
  %t4219 = inttoptr i64 %t4218 to ptr
  %t4220 = call fastcc i64%t4219(i64 %t4215, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4221 = call i64 @rt_make_vector(i64 %t4220, i64 0)
  %t4222 = call ptr @rt_alloc_words(i64 3)
  %t4223 = ptrtoint ptr %t4222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_774" to i64), ptr %t4222
  %t4224 = or i64 %t4223, 4
  %t4225 = getelementptr i64, ptr %t4222, i64 1
  store i64 %t4221, ptr %t4225
  %t4226 = getelementptr i64, ptr %t4222, i64 2
  store i64 %t4224, ptr %t4226
  %t4227 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t4224, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4227
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4232 = icmp eq i64 %argc, 1
  br i1 %t4232, label %argok951, label %arityerr950
arityerr950:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok951:
  %t4233 = call i64 @rt_null_p(i64 %a0)
  %t4234 = icmp ne i64 %t4233, 1
  br i1 %t4234, label %then952, label %else953
then952:
  ret i64 0
else953:
  %t4235 = call i64 @rt_car(i64 %a0)
  %t4236 = call i64 @rt_vector_length(i64 %t4235)
  %t4237 = call i64 @rt_cdr(i64 %a0)
  %t4238 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4238)
  %t4239 = and i64 %t4238, -8
  %t4240 = inttoptr i64 %t4239 to ptr
  %t4241 = load i64, ptr %t4240
  %t4242 = inttoptr i64 %t4241 to ptr
  %t4243 = call fastcc i64%t4242(i64 %t4238, i64 1, i64 %t4237, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4244 = or i64 %t4236, %t4243
  %t4245 = and i64 %t4244, 7
  %t4246 = icmp eq i64 %t4245, 0
  br i1 %t4246, label %fixfast954, label %fixslow955
fixfast954:
  %t4247 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4236, i64 %t4243)
  %t4248 = extractvalue {i64, i1} %t4247, 0
  %t4249 = extractvalue {i64, i1} %t4247, 1
  br i1 %t4249, label %fixslow955, label %fixmerge956
fixslow955:
  %t4250 = call i64 @rt_add(i64 %t4236, i64 %t4243)
  br label %fixmerge956
fixmerge956:
  %t4251 = phi i64 [ %t4248, %fixfast954 ], [ %t4250, %fixslow955 ]
  ret i64 %t4251
}

define fastcc i64 @"scheme.base:code_793"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4256 = icmp eq i64 %argc, 1
  br i1 %t4256, label %argok958, label %arityerr957
arityerr957:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok958:
  %t4257 = and i64 %self, -8
  %t4258 = inttoptr i64 %t4257 to ptr
  %t4259 = getelementptr i64, ptr %t4258, i64 1
  %t4260 = load i64, ptr %t4259
  %t4261 = or i64 %a0, %t4260
  %t4262 = and i64 %t4261, 7
  %t4263 = icmp eq i64 %t4262, 0
  br i1 %t4263, label %fixfast959, label %fixslow960
fixfast959:
  %t4264 = icmp eq i64 %a0, %t4260
  %t4265 = select i1 %t4264, i64 257, i64 1
  br label %fixmerge961
fixslow960:
  %t4266 = call i64 @rt_num_eq(i64 %a0, i64 %t4260)
  br label %fixmerge961
fixmerge961:
  %t4267 = phi i64 [ %t4265, %fixfast959 ], [ %t4266, %fixslow960 ]
  %t4268 = icmp ne i64 %t4267, 1
  br i1 %t4268, label %then962, label %else963
then962:
  %t4269 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4269)
  %t4270 = and i64 %t4269, -8
  %t4271 = inttoptr i64 %t4270 to ptr
  %t4272 = load i64, ptr %t4271
  %t4273 = inttoptr i64 %t4272 to ptr
  %t4274 = musttail call fastcc i64 %t4273(i64 %t4269, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4274
else963:
  %t4275 = and i64 %self, -8
  %t4276 = inttoptr i64 %t4275 to ptr
  %t4277 = getelementptr i64, ptr %t4276, i64 2
  %t4278 = load i64, ptr %t4277
  %t4279 = and i64 %self, -8
  %t4280 = inttoptr i64 %t4279 to ptr
  %t4281 = getelementptr i64, ptr %t4280, i64 3
  %t4282 = load i64, ptr %t4281
  %t4283 = call i64 @rt_vector_set(i64 %t4278, i64 %a0, i64 %t4282)
  %t4284 = or i64 %a0, 8
  %t4285 = and i64 %t4284, 7
  %t4286 = icmp eq i64 %t4285, 0
  br i1 %t4286, label %fixfast964, label %fixslow965
fixfast964:
  %t4287 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4288 = extractvalue {i64, i1} %t4287, 0
  %t4289 = extractvalue {i64, i1} %t4287, 1
  br i1 %t4289, label %fixslow965, label %fixmerge966
fixslow965:
  %t4290 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge966
fixmerge966:
  %t4291 = phi i64 [ %t4288, %fixfast964 ], [ %t4290, %fixslow965 ]
  %t4292 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %self, i64 1, i64 %t4291, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4292
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4293 = icmp sge i64 %argc, 2
  br i1 %t4293, label %argok968, label %arityerr967
arityerr967:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok968:
  %t4294 = call ptr @rt_alloc_words(i64 8)
  %t4295 = getelementptr i64, ptr %t4294, i64 0
  store i64 %a0, ptr %t4295
  %t4296 = getelementptr i64, ptr %t4294, i64 1
  store i64 %a1, ptr %t4296
  %t4297 = getelementptr i64, ptr %t4294, i64 2
  store i64 %a2, ptr %t4297
  %t4298 = getelementptr i64, ptr %t4294, i64 3
  store i64 %a3, ptr %t4298
  %t4299 = getelementptr i64, ptr %t4294, i64 4
  store i64 %a4, ptr %t4299
  %t4300 = getelementptr i64, ptr %t4294, i64 5
  store i64 %a5, ptr %t4300
  %t4301 = getelementptr i64, ptr %t4294, i64 6
  store i64 %a6, ptr %t4301
  %t4302 = getelementptr i64, ptr %t4294, i64 7
  store i64 %a7, ptr %t4302
  %t4303 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4294, ptr %overflow)
  %t4304 = call i64 @rt_vector_length(i64 %a0)
  %t4305 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4305)
  %t4306 = and i64 %t4305, -8
  %t4307 = inttoptr i64 %t4306 to ptr
  %t4308 = load i64, ptr %t4307
  %t4309 = inttoptr i64 %t4308 to ptr
  %t4310 = call fastcc i64%t4309(i64 %t4305, i64 1, i64 %t4303, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4311 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4311)
  %t4312 = and i64 %t4311, -8
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = load i64, ptr %t4313
  %t4315 = inttoptr i64 %t4314 to ptr
  %t4316 = call fastcc i64%t4315(i64 %t4311, i64 2, i64 %t4303, i64 %t4304, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4317 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4318 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4318)
  %t4319 = and i64 %t4318, -8
  %t4320 = inttoptr i64 %t4319 to ptr
  %t4321 = load i64, ptr %t4320
  %t4322 = inttoptr i64 %t4321 to ptr
  %t4323 = call fastcc i64%t4322(i64 %t4318, i64 4, i64 %t4317, i64 %t4310, i64 %t4316, i64 %t4304, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4324 = call ptr @rt_alloc_words(i64 5)
  %t4325 = ptrtoint ptr %t4324 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_793" to i64), ptr %t4324
  %t4326 = or i64 %t4325, 4
  %t4327 = getelementptr i64, ptr %t4324, i64 1
  store i64 %t4316, ptr %t4327
  %t4328 = getelementptr i64, ptr %t4324, i64 2
  store i64 %a0, ptr %t4328
  %t4329 = getelementptr i64, ptr %t4324, i64 3
  store i64 %a1, ptr %t4329
  %t4330 = getelementptr i64, ptr %t4324, i64 4
  store i64 %t4326, ptr %t4330
  %t4331 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %t4326, i64 1, i64 %t4310, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4331
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4332 = call i64 @rt_vector_length(i64 %a0)
  %t4333 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4333)
  %t4334 = and i64 %t4333, -8
  %t4335 = inttoptr i64 %t4334 to ptr
  %t4336 = load i64, ptr %t4335
  %t4337 = inttoptr i64 %t4336 to ptr
  %t4338 = call fastcc i64%t4337(i64 %t4333, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4339 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4339)
  %t4340 = and i64 %t4339, -8
  %t4341 = inttoptr i64 %t4340 to ptr
  %t4342 = load i64, ptr %t4341
  %t4343 = inttoptr i64 %t4342 to ptr
  %t4344 = call fastcc i64%t4343(i64 %t4339, i64 2, i64 2, i64 %t4332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4345 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4346 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4346)
  %t4347 = and i64 %t4346, -8
  %t4348 = inttoptr i64 %t4347 to ptr
  %t4349 = load i64, ptr %t4348
  %t4350 = inttoptr i64 %t4349 to ptr
  %t4351 = call fastcc i64%t4350(i64 %t4346, i64 4, i64 %t4345, i64 %t4338, i64 %t4344, i64 %t4332, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4352 = call ptr @rt_alloc_words(i64 5)
  %t4353 = ptrtoint ptr %t4352 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_793" to i64), ptr %t4352
  %t4354 = or i64 %t4353, 4
  %t4355 = getelementptr i64, ptr %t4352, i64 1
  store i64 %t4344, ptr %t4355
  %t4356 = getelementptr i64, ptr %t4352, i64 2
  store i64 %a0, ptr %t4356
  %t4357 = getelementptr i64, ptr %t4352, i64 3
  store i64 %a1, ptr %t4357
  %t4358 = getelementptr i64, ptr %t4352, i64 4
  store i64 %t4354, ptr %t4358
  %t4359 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %t4354, i64 1, i64 %t4338, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4359
}

define fastcc i64 @"scheme.base:code_819"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4364 = icmp eq i64 %argc, 1
  br i1 %t4364, label %argok970, label %arityerr969
arityerr969:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok970:
  %t4365 = or i64 %a0, 0
  %t4366 = and i64 %t4365, 7
  %t4367 = icmp eq i64 %t4366, 0
  br i1 %t4367, label %fixfast971, label %fixslow972
fixfast971:
  %t4368 = icmp slt i64 %a0, 0
  %t4369 = select i1 %t4368, i64 257, i64 1
  br label %fixmerge973
fixslow972:
  %t4370 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge973
fixmerge973:
  %t4371 = phi i64 [ %t4369, %fixfast971 ], [ %t4370, %fixslow972 ]
  %t4372 = icmp ne i64 %t4371, 1
  br i1 %t4372, label %then974, label %else975
then974:
  %t4373 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4373)
  %t4374 = and i64 %t4373, -8
  %t4375 = inttoptr i64 %t4374 to ptr
  %t4376 = load i64, ptr %t4375
  %t4377 = inttoptr i64 %t4376 to ptr
  %t4378 = musttail call fastcc i64 %t4377(i64 %t4373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4378
else975:
  %t4379 = and i64 %self, -8
  %t4380 = inttoptr i64 %t4379 to ptr
  %t4381 = getelementptr i64, ptr %t4380, i64 1
  %t4382 = load i64, ptr %t4381
  %t4383 = and i64 %self, -8
  %t4384 = inttoptr i64 %t4383 to ptr
  %t4385 = getelementptr i64, ptr %t4384, i64 2
  %t4386 = load i64, ptr %t4385
  %t4387 = or i64 %t4386, %a0
  %t4388 = and i64 %t4387, 7
  %t4389 = icmp eq i64 %t4388, 0
  br i1 %t4389, label %fixfast976, label %fixslow977
fixfast976:
  %t4390 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4386, i64 %a0)
  %t4391 = extractvalue {i64, i1} %t4390, 0
  %t4392 = extractvalue {i64, i1} %t4390, 1
  br i1 %t4392, label %fixslow977, label %fixmerge978
fixslow977:
  %t4393 = call i64 @rt_add(i64 %t4386, i64 %a0)
  br label %fixmerge978
fixmerge978:
  %t4394 = phi i64 [ %t4391, %fixfast976 ], [ %t4393, %fixslow977 ]
  %t4395 = and i64 %self, -8
  %t4396 = inttoptr i64 %t4395 to ptr
  %t4397 = getelementptr i64, ptr %t4396, i64 3
  %t4398 = load i64, ptr %t4397
  %t4399 = and i64 %self, -8
  %t4400 = inttoptr i64 %t4399 to ptr
  %t4401 = getelementptr i64, ptr %t4400, i64 4
  %t4402 = load i64, ptr %t4401
  %t4403 = or i64 %t4402, %a0
  %t4404 = and i64 %t4403, 7
  %t4405 = icmp eq i64 %t4404, 0
  br i1 %t4405, label %fixfast979, label %fixslow980
fixfast979:
  %t4406 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4402, i64 %a0)
  %t4407 = extractvalue {i64, i1} %t4406, 0
  %t4408 = extractvalue {i64, i1} %t4406, 1
  br i1 %t4408, label %fixslow980, label %fixmerge981
fixslow980:
  %t4409 = call i64 @rt_add(i64 %t4402, i64 %a0)
  br label %fixmerge981
fixmerge981:
  %t4410 = phi i64 [ %t4407, %fixfast979 ], [ %t4409, %fixslow980 ]
  %t4411 = call i64 @rt_vector_ref(i64 %t4398, i64 %t4410)
  %t4412 = call i64 @rt_vector_set(i64 %t4382, i64 %t4394, i64 %t4411)
  %t4413 = or i64 %a0, 8
  %t4414 = and i64 %t4413, 7
  %t4415 = icmp eq i64 %t4414, 0
  br i1 %t4415, label %fixfast982, label %fixslow983
fixfast982:
  %t4416 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4417 = extractvalue {i64, i1} %t4416, 0
  %t4418 = extractvalue {i64, i1} %t4416, 1
  br i1 %t4418, label %fixslow983, label %fixmerge984
fixslow983:
  %t4419 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge984
fixmerge984:
  %t4420 = phi i64 [ %t4417, %fixfast982 ], [ %t4419, %fixslow983 ]
  %t4421 = musttail call fastcc i64 @"scheme.base:code_819"(i64 %self, i64 1, i64 %t4420, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4421
}

define fastcc i64 @"scheme.base:code_821"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4422 = icmp eq i64 %argc, 1
  br i1 %t4422, label %argok986, label %arityerr985
arityerr985:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok986:
  %t4423 = and i64 %self, -8
  %t4424 = inttoptr i64 %t4423 to ptr
  %t4425 = getelementptr i64, ptr %t4424, i64 1
  %t4426 = load i64, ptr %t4425
  %t4427 = and i64 %self, -8
  %t4428 = inttoptr i64 %t4427 to ptr
  %t4429 = getelementptr i64, ptr %t4428, i64 2
  %t4430 = load i64, ptr %t4429
  %t4431 = or i64 %t4426, %t4430
  %t4432 = and i64 %t4431, 7
  %t4433 = icmp eq i64 %t4432, 0
  br i1 %t4433, label %fixfast987, label %fixslow988
fixfast987:
  %t4434 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4426, i64 %t4430)
  %t4435 = extractvalue {i64, i1} %t4434, 0
  %t4436 = extractvalue {i64, i1} %t4434, 1
  br i1 %t4436, label %fixslow988, label %fixmerge989
fixslow988:
  %t4437 = call i64 @rt_sub(i64 %t4426, i64 %t4430)
  br label %fixmerge989
fixmerge989:
  %t4438 = phi i64 [ %t4435, %fixfast987 ], [ %t4437, %fixslow988 ]
  %t4439 = or i64 %a0, %t4438
  %t4440 = and i64 %t4439, 7
  %t4441 = icmp eq i64 %t4440, 0
  br i1 %t4441, label %fixfast990, label %fixslow991
fixfast990:
  %t4442 = icmp eq i64 %a0, %t4438
  %t4443 = select i1 %t4442, i64 257, i64 1
  br label %fixmerge992
fixslow991:
  %t4444 = call i64 @rt_num_eq(i64 %a0, i64 %t4438)
  br label %fixmerge992
fixmerge992:
  %t4445 = phi i64 [ %t4443, %fixfast990 ], [ %t4444, %fixslow991 ]
  %t4446 = icmp ne i64 %t4445, 1
  br i1 %t4446, label %then993, label %else994
then993:
  %t4447 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4447)
  %t4448 = and i64 %t4447, -8
  %t4449 = inttoptr i64 %t4448 to ptr
  %t4450 = load i64, ptr %t4449
  %t4451 = inttoptr i64 %t4450 to ptr
  %t4452 = musttail call fastcc i64 %t4451(i64 %t4447, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4452
else994:
  %t4453 = and i64 %self, -8
  %t4454 = inttoptr i64 %t4453 to ptr
  %t4455 = getelementptr i64, ptr %t4454, i64 3
  %t4456 = load i64, ptr %t4455
  %t4457 = and i64 %self, -8
  %t4458 = inttoptr i64 %t4457 to ptr
  %t4459 = getelementptr i64, ptr %t4458, i64 4
  %t4460 = load i64, ptr %t4459
  %t4461 = or i64 %t4460, %a0
  %t4462 = and i64 %t4461, 7
  %t4463 = icmp eq i64 %t4462, 0
  br i1 %t4463, label %fixfast995, label %fixslow996
fixfast995:
  %t4464 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4460, i64 %a0)
  %t4465 = extractvalue {i64, i1} %t4464, 0
  %t4466 = extractvalue {i64, i1} %t4464, 1
  br i1 %t4466, label %fixslow996, label %fixmerge997
fixslow996:
  %t4467 = call i64 @rt_add(i64 %t4460, i64 %a0)
  br label %fixmerge997
fixmerge997:
  %t4468 = phi i64 [ %t4465, %fixfast995 ], [ %t4467, %fixslow996 ]
  %t4469 = and i64 %self, -8
  %t4470 = inttoptr i64 %t4469 to ptr
  %t4471 = getelementptr i64, ptr %t4470, i64 5
  %t4472 = load i64, ptr %t4471
  %t4473 = and i64 %self, -8
  %t4474 = inttoptr i64 %t4473 to ptr
  %t4475 = getelementptr i64, ptr %t4474, i64 2
  %t4476 = load i64, ptr %t4475
  %t4477 = or i64 %t4476, %a0
  %t4478 = and i64 %t4477, 7
  %t4479 = icmp eq i64 %t4478, 0
  br i1 %t4479, label %fixfast998, label %fixslow999
fixfast998:
  %t4480 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4476, i64 %a0)
  %t4481 = extractvalue {i64, i1} %t4480, 0
  %t4482 = extractvalue {i64, i1} %t4480, 1
  br i1 %t4482, label %fixslow999, label %fixmerge1000
fixslow999:
  %t4483 = call i64 @rt_add(i64 %t4476, i64 %a0)
  br label %fixmerge1000
fixmerge1000:
  %t4484 = phi i64 [ %t4481, %fixfast998 ], [ %t4483, %fixslow999 ]
  %t4485 = call i64 @rt_vector_ref(i64 %t4472, i64 %t4484)
  %t4486 = call i64 @rt_vector_set(i64 %t4456, i64 %t4468, i64 %t4485)
  %t4487 = or i64 %a0, 8
  %t4488 = and i64 %t4487, 7
  %t4489 = icmp eq i64 %t4488, 0
  br i1 %t4489, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t4490 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4491 = extractvalue {i64, i1} %t4490, 0
  %t4492 = extractvalue {i64, i1} %t4490, 1
  br i1 %t4492, label %fixslow1002, label %fixmerge1003
fixslow1002:
  %t4493 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1003
fixmerge1003:
  %t4494 = phi i64 [ %t4491, %fixfast1001 ], [ %t4493, %fixslow1002 ]
  %t4495 = musttail call fastcc i64 @"scheme.base:code_821"(i64 %self, i64 1, i64 %t4494, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4495
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4496 = icmp sge i64 %argc, 3
  br i1 %t4496, label %argok1005, label %arityerr1004
arityerr1004:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1005:
  %t4497 = call ptr @rt_alloc_words(i64 8)
  %t4498 = getelementptr i64, ptr %t4497, i64 0
  store i64 %a0, ptr %t4498
  %t4499 = getelementptr i64, ptr %t4497, i64 1
  store i64 %a1, ptr %t4499
  %t4500 = getelementptr i64, ptr %t4497, i64 2
  store i64 %a2, ptr %t4500
  %t4501 = getelementptr i64, ptr %t4497, i64 3
  store i64 %a3, ptr %t4501
  %t4502 = getelementptr i64, ptr %t4497, i64 4
  store i64 %a4, ptr %t4502
  %t4503 = getelementptr i64, ptr %t4497, i64 5
  store i64 %a5, ptr %t4503
  %t4504 = getelementptr i64, ptr %t4497, i64 6
  store i64 %a6, ptr %t4504
  %t4505 = getelementptr i64, ptr %t4497, i64 7
  store i64 %a7, ptr %t4505
  %t4506 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4497, ptr %overflow)
  %t4507 = call i64 @rt_vector_length(i64 %a2)
  %t4508 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4508)
  %t4509 = and i64 %t4508, -8
  %t4510 = inttoptr i64 %t4509 to ptr
  %t4511 = load i64, ptr %t4510
  %t4512 = inttoptr i64 %t4511 to ptr
  %t4513 = call fastcc i64%t4512(i64 %t4508, i64 1, i64 %t4506, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4514 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4514)
  %t4515 = and i64 %t4514, -8
  %t4516 = inttoptr i64 %t4515 to ptr
  %t4517 = load i64, ptr %t4516
  %t4518 = inttoptr i64 %t4517 to ptr
  %t4519 = call fastcc i64%t4518(i64 %t4514, i64 2, i64 %t4506, i64 %t4507, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4520 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4521 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4521)
  %t4522 = and i64 %t4521, -8
  %t4523 = inttoptr i64 %t4522 to ptr
  %t4524 = load i64, ptr %t4523
  %t4525 = inttoptr i64 %t4524 to ptr
  %t4526 = call fastcc i64%t4525(i64 %t4521, i64 4, i64 %t4520, i64 %t4513, i64 %t4519, i64 %t4507, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4527 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4528 = or i64 %t4519, %t4513
  %t4529 = and i64 %t4528, 7
  %t4530 = icmp eq i64 %t4529, 0
  br i1 %t4530, label %fixfast1006, label %fixslow1007
fixfast1006:
  %t4531 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4519, i64 %t4513)
  %t4532 = extractvalue {i64, i1} %t4531, 0
  %t4533 = extractvalue {i64, i1} %t4531, 1
  br i1 %t4533, label %fixslow1007, label %fixmerge1008
fixslow1007:
  %t4534 = call i64 @rt_sub(i64 %t4519, i64 %t4513)
  br label %fixmerge1008
fixmerge1008:
  %t4535 = phi i64 [ %t4532, %fixfast1006 ], [ %t4534, %fixslow1007 ]
  %t4536 = or i64 %a1, %t4535
  %t4537 = and i64 %t4536, 7
  %t4538 = icmp eq i64 %t4537, 0
  br i1 %t4538, label %fixfast1009, label %fixslow1010
fixfast1009:
  %t4539 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4535)
  %t4540 = extractvalue {i64, i1} %t4539, 0
  %t4541 = extractvalue {i64, i1} %t4539, 1
  br i1 %t4541, label %fixslow1010, label %fixmerge1011
fixslow1010:
  %t4542 = call i64 @rt_add(i64 %a1, i64 %t4535)
  br label %fixmerge1011
fixmerge1011:
  %t4543 = phi i64 [ %t4540, %fixfast1009 ], [ %t4542, %fixslow1010 ]
  %t4544 = call i64 @rt_vector_length(i64 %a0)
  %t4545 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4545)
  %t4546 = and i64 %t4545, -8
  %t4547 = inttoptr i64 %t4546 to ptr
  %t4548 = load i64, ptr %t4547
  %t4549 = inttoptr i64 %t4548 to ptr
  %t4550 = call fastcc i64%t4549(i64 %t4545, i64 4, i64 %t4527, i64 %a1, i64 %t4543, i64 %t4544, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4551 = or i64 %t4513, %a1
  %t4552 = and i64 %t4551, 7
  %t4553 = icmp eq i64 %t4552, 0
  br i1 %t4553, label %fixfast1012, label %fixslow1013
fixfast1012:
  %t4554 = icmp slt i64 %t4513, %a1
  %t4555 = select i1 %t4554, i64 257, i64 1
  br label %fixmerge1014
fixslow1013:
  %t4556 = call i64 @rt_lt(i64 %t4513, i64 %a1)
  br label %fixmerge1014
fixmerge1014:
  %t4557 = phi i64 [ %t4555, %fixfast1012 ], [ %t4556, %fixslow1013 ]
  %t4558 = icmp ne i64 %t4557, 1
  br i1 %t4558, label %then1015, label %else1016
then1015:
  %t4559 = call ptr @rt_alloc_words(i64 6)
  %t4560 = ptrtoint ptr %t4559 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_819" to i64), ptr %t4559
  %t4561 = or i64 %t4560, 4
  %t4562 = getelementptr i64, ptr %t4559, i64 1
  store i64 %a0, ptr %t4562
  %t4563 = getelementptr i64, ptr %t4559, i64 2
  store i64 %a1, ptr %t4563
  %t4564 = getelementptr i64, ptr %t4559, i64 3
  store i64 %a2, ptr %t4564
  %t4565 = getelementptr i64, ptr %t4559, i64 4
  store i64 %t4513, ptr %t4565
  %t4566 = getelementptr i64, ptr %t4559, i64 5
  store i64 %t4561, ptr %t4566
  %t4567 = or i64 %t4519, %t4513
  %t4568 = and i64 %t4567, 7
  %t4569 = icmp eq i64 %t4568, 0
  br i1 %t4569, label %fixfast1017, label %fixslow1018
fixfast1017:
  %t4570 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4519, i64 %t4513)
  %t4571 = extractvalue {i64, i1} %t4570, 0
  %t4572 = extractvalue {i64, i1} %t4570, 1
  br i1 %t4572, label %fixslow1018, label %fixmerge1019
fixslow1018:
  %t4573 = call i64 @rt_sub(i64 %t4519, i64 %t4513)
  br label %fixmerge1019
fixmerge1019:
  %t4574 = phi i64 [ %t4571, %fixfast1017 ], [ %t4573, %fixslow1018 ]
  %t4575 = or i64 %t4574, 8
  %t4576 = and i64 %t4575, 7
  %t4577 = icmp eq i64 %t4576, 0
  br i1 %t4577, label %fixfast1020, label %fixslow1021
fixfast1020:
  %t4578 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4574, i64 8)
  %t4579 = extractvalue {i64, i1} %t4578, 0
  %t4580 = extractvalue {i64, i1} %t4578, 1
  br i1 %t4580, label %fixslow1021, label %fixmerge1022
fixslow1021:
  %t4581 = call i64 @rt_sub(i64 %t4574, i64 8)
  br label %fixmerge1022
fixmerge1022:
  %t4582 = phi i64 [ %t4579, %fixfast1020 ], [ %t4581, %fixslow1021 ]
  %t4583 = musttail call fastcc i64 @"scheme.base:code_819"(i64 %t4561, i64 1, i64 %t4582, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4583
else1016:
  %t4584 = call ptr @rt_alloc_words(i64 7)
  %t4585 = ptrtoint ptr %t4584 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_821" to i64), ptr %t4584
  %t4586 = or i64 %t4585, 4
  %t4587 = getelementptr i64, ptr %t4584, i64 1
  store i64 %t4519, ptr %t4587
  %t4588 = getelementptr i64, ptr %t4584, i64 2
  store i64 %t4513, ptr %t4588
  %t4589 = getelementptr i64, ptr %t4584, i64 3
  store i64 %a0, ptr %t4589
  %t4590 = getelementptr i64, ptr %t4584, i64 4
  store i64 %a1, ptr %t4590
  %t4591 = getelementptr i64, ptr %t4584, i64 5
  store i64 %a2, ptr %t4591
  %t4592 = getelementptr i64, ptr %t4584, i64 6
  store i64 %t4586, ptr %t4592
  %t4593 = musttail call fastcc i64 @"scheme.base:code_821"(i64 %t4586, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4593
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4594 = call i64 @rt_vector_length(i64 %a2)
  %t4595 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4595)
  %t4596 = and i64 %t4595, -8
  %t4597 = inttoptr i64 %t4596 to ptr
  %t4598 = load i64, ptr %t4597
  %t4599 = inttoptr i64 %t4598 to ptr
  %t4600 = call fastcc i64%t4599(i64 %t4595, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4601 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4601)
  %t4602 = and i64 %t4601, -8
  %t4603 = inttoptr i64 %t4602 to ptr
  %t4604 = load i64, ptr %t4603
  %t4605 = inttoptr i64 %t4604 to ptr
  %t4606 = call fastcc i64%t4605(i64 %t4601, i64 2, i64 2, i64 %t4594, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4607 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4608 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4608)
  %t4609 = and i64 %t4608, -8
  %t4610 = inttoptr i64 %t4609 to ptr
  %t4611 = load i64, ptr %t4610
  %t4612 = inttoptr i64 %t4611 to ptr
  %t4613 = call fastcc i64%t4612(i64 %t4608, i64 4, i64 %t4607, i64 %t4600, i64 %t4606, i64 %t4594, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4614 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4615 = or i64 %t4606, %t4600
  %t4616 = and i64 %t4615, 7
  %t4617 = icmp eq i64 %t4616, 0
  br i1 %t4617, label %fixfast1023, label %fixslow1024
fixfast1023:
  %t4618 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4606, i64 %t4600)
  %t4619 = extractvalue {i64, i1} %t4618, 0
  %t4620 = extractvalue {i64, i1} %t4618, 1
  br i1 %t4620, label %fixslow1024, label %fixmerge1025
fixslow1024:
  %t4621 = call i64 @rt_sub(i64 %t4606, i64 %t4600)
  br label %fixmerge1025
fixmerge1025:
  %t4622 = phi i64 [ %t4619, %fixfast1023 ], [ %t4621, %fixslow1024 ]
  %t4623 = or i64 %a1, %t4622
  %t4624 = and i64 %t4623, 7
  %t4625 = icmp eq i64 %t4624, 0
  br i1 %t4625, label %fixfast1026, label %fixslow1027
fixfast1026:
  %t4626 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4622)
  %t4627 = extractvalue {i64, i1} %t4626, 0
  %t4628 = extractvalue {i64, i1} %t4626, 1
  br i1 %t4628, label %fixslow1027, label %fixmerge1028
fixslow1027:
  %t4629 = call i64 @rt_add(i64 %a1, i64 %t4622)
  br label %fixmerge1028
fixmerge1028:
  %t4630 = phi i64 [ %t4627, %fixfast1026 ], [ %t4629, %fixslow1027 ]
  %t4631 = call i64 @rt_vector_length(i64 %a0)
  %t4632 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4632)
  %t4633 = and i64 %t4632, -8
  %t4634 = inttoptr i64 %t4633 to ptr
  %t4635 = load i64, ptr %t4634
  %t4636 = inttoptr i64 %t4635 to ptr
  %t4637 = call fastcc i64%t4636(i64 %t4632, i64 4, i64 %t4614, i64 %a1, i64 %t4630, i64 %t4631, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4638 = or i64 %t4600, %a1
  %t4639 = and i64 %t4638, 7
  %t4640 = icmp eq i64 %t4639, 0
  br i1 %t4640, label %fixfast1029, label %fixslow1030
fixfast1029:
  %t4641 = icmp slt i64 %t4600, %a1
  %t4642 = select i1 %t4641, i64 257, i64 1
  br label %fixmerge1031
fixslow1030:
  %t4643 = call i64 @rt_lt(i64 %t4600, i64 %a1)
  br label %fixmerge1031
fixmerge1031:
  %t4644 = phi i64 [ %t4642, %fixfast1029 ], [ %t4643, %fixslow1030 ]
  %t4645 = icmp ne i64 %t4644, 1
  br i1 %t4645, label %then1032, label %else1033
then1032:
  %t4646 = call ptr @rt_alloc_words(i64 6)
  %t4647 = ptrtoint ptr %t4646 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_819" to i64), ptr %t4646
  %t4648 = or i64 %t4647, 4
  %t4649 = getelementptr i64, ptr %t4646, i64 1
  store i64 %a0, ptr %t4649
  %t4650 = getelementptr i64, ptr %t4646, i64 2
  store i64 %a1, ptr %t4650
  %t4651 = getelementptr i64, ptr %t4646, i64 3
  store i64 %a2, ptr %t4651
  %t4652 = getelementptr i64, ptr %t4646, i64 4
  store i64 %t4600, ptr %t4652
  %t4653 = getelementptr i64, ptr %t4646, i64 5
  store i64 %t4648, ptr %t4653
  %t4654 = or i64 %t4606, %t4600
  %t4655 = and i64 %t4654, 7
  %t4656 = icmp eq i64 %t4655, 0
  br i1 %t4656, label %fixfast1034, label %fixslow1035
fixfast1034:
  %t4657 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4606, i64 %t4600)
  %t4658 = extractvalue {i64, i1} %t4657, 0
  %t4659 = extractvalue {i64, i1} %t4657, 1
  br i1 %t4659, label %fixslow1035, label %fixmerge1036
fixslow1035:
  %t4660 = call i64 @rt_sub(i64 %t4606, i64 %t4600)
  br label %fixmerge1036
fixmerge1036:
  %t4661 = phi i64 [ %t4658, %fixfast1034 ], [ %t4660, %fixslow1035 ]
  %t4662 = or i64 %t4661, 8
  %t4663 = and i64 %t4662, 7
  %t4664 = icmp eq i64 %t4663, 0
  br i1 %t4664, label %fixfast1037, label %fixslow1038
fixfast1037:
  %t4665 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4661, i64 8)
  %t4666 = extractvalue {i64, i1} %t4665, 0
  %t4667 = extractvalue {i64, i1} %t4665, 1
  br i1 %t4667, label %fixslow1038, label %fixmerge1039
fixslow1038:
  %t4668 = call i64 @rt_sub(i64 %t4661, i64 8)
  br label %fixmerge1039
fixmerge1039:
  %t4669 = phi i64 [ %t4666, %fixfast1037 ], [ %t4668, %fixslow1038 ]
  %t4670 = musttail call fastcc i64 @"scheme.base:code_819"(i64 %t4648, i64 1, i64 %t4669, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4670
else1033:
  %t4671 = call ptr @rt_alloc_words(i64 7)
  %t4672 = ptrtoint ptr %t4671 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_821" to i64), ptr %t4671
  %t4673 = or i64 %t4672, 4
  %t4674 = getelementptr i64, ptr %t4671, i64 1
  store i64 %t4606, ptr %t4674
  %t4675 = getelementptr i64, ptr %t4671, i64 2
  store i64 %t4600, ptr %t4675
  %t4676 = getelementptr i64, ptr %t4671, i64 3
  store i64 %a0, ptr %t4676
  %t4677 = getelementptr i64, ptr %t4671, i64 4
  store i64 %a1, ptr %t4677
  %t4678 = getelementptr i64, ptr %t4671, i64 5
  store i64 %a2, ptr %t4678
  %t4679 = getelementptr i64, ptr %t4671, i64 6
  store i64 %t4673, ptr %t4679
  %t4680 = musttail call fastcc i64 @"scheme.base:code_821"(i64 %t4673, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4680
}

define fastcc i64 @"scheme.base:code_844"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4685 = icmp eq i64 %argc, 1
  br i1 %t4685, label %argok1041, label %arityerr1040
arityerr1040:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1041:
  %t4686 = and i64 %self, -8
  %t4687 = inttoptr i64 %t4686 to ptr
  %t4688 = getelementptr i64, ptr %t4687, i64 1
  %t4689 = load i64, ptr %t4688
  %t4690 = or i64 %a0, %t4689
  %t4691 = and i64 %t4690, 7
  %t4692 = icmp eq i64 %t4691, 0
  br i1 %t4692, label %fixfast1042, label %fixslow1043
fixfast1042:
  %t4693 = icmp eq i64 %a0, %t4689
  %t4694 = select i1 %t4693, i64 257, i64 1
  br label %fixmerge1044
fixslow1043:
  %t4695 = call i64 @rt_num_eq(i64 %a0, i64 %t4689)
  br label %fixmerge1044
fixmerge1044:
  %t4696 = phi i64 [ %t4694, %fixfast1042 ], [ %t4695, %fixslow1043 ]
  %t4697 = icmp ne i64 %t4696, 1
  br i1 %t4697, label %then1045, label %else1046
then1045:
  %t4698 = and i64 %self, -8
  %t4699 = inttoptr i64 %t4698 to ptr
  %t4700 = getelementptr i64, ptr %t4699, i64 2
  %t4701 = load i64, ptr %t4700
  ret i64 %t4701
else1046:
  %t4702 = and i64 %self, -8
  %t4703 = inttoptr i64 %t4702 to ptr
  %t4704 = getelementptr i64, ptr %t4703, i64 2
  %t4705 = load i64, ptr %t4704
  %t4706 = and i64 %self, -8
  %t4707 = inttoptr i64 %t4706 to ptr
  %t4708 = getelementptr i64, ptr %t4707, i64 4
  %t4709 = load i64, ptr %t4708
  %t4710 = call i64 @rt_vector_ref(i64 %t4709, i64 %a0)
  %t4711 = and i64 %self, -8
  %t4712 = inttoptr i64 %t4711 to ptr
  %t4713 = getelementptr i64, ptr %t4712, i64 3
  %t4714 = load i64, ptr %t4713
  call void @rt_check_callable(i64 %t4714)
  %t4715 = and i64 %t4714, -8
  %t4716 = inttoptr i64 %t4715 to ptr
  %t4717 = load i64, ptr %t4716
  %t4718 = inttoptr i64 %t4717 to ptr
  %t4719 = call fastcc i64%t4718(i64 %t4714, i64 1, i64 %t4710, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4720 = call i64 @rt_vector_set(i64 %t4705, i64 %a0, i64 %t4719)
  %t4721 = or i64 %a0, 8
  %t4722 = and i64 %t4721, 7
  %t4723 = icmp eq i64 %t4722, 0
  br i1 %t4723, label %fixfast1047, label %fixslow1048
fixfast1047:
  %t4724 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4725 = extractvalue {i64, i1} %t4724, 0
  %t4726 = extractvalue {i64, i1} %t4724, 1
  br i1 %t4726, label %fixslow1048, label %fixmerge1049
fixslow1048:
  %t4727 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1049
fixmerge1049:
  %t4728 = phi i64 [ %t4725, %fixfast1047 ], [ %t4727, %fixslow1048 ]
  %t4729 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %self, i64 1, i64 %t4728, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4729
}

define fastcc i64 @"scheme.base:code_846"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4730 = icmp eq i64 %argc, 1
  br i1 %t4730, label %argok1051, label %arityerr1050
arityerr1050:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1051:
  %t4731 = and i64 %self, -8
  %t4732 = inttoptr i64 %t4731 to ptr
  %t4733 = getelementptr i64, ptr %t4732, i64 1
  %t4734 = load i64, ptr %t4733
  %t4735 = or i64 %a0, %t4734
  %t4736 = and i64 %t4735, 7
  %t4737 = icmp eq i64 %t4736, 0
  br i1 %t4737, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t4738 = icmp eq i64 %a0, %t4734
  %t4739 = select i1 %t4738, i64 257, i64 1
  br label %fixmerge1054
fixslow1053:
  %t4740 = call i64 @rt_num_eq(i64 %a0, i64 %t4734)
  br label %fixmerge1054
fixmerge1054:
  %t4741 = phi i64 [ %t4739, %fixfast1052 ], [ %t4740, %fixslow1053 ]
  %t4742 = icmp ne i64 %t4741, 1
  br i1 %t4742, label %then1055, label %else1056
then1055:
  %t4743 = and i64 %self, -8
  %t4744 = inttoptr i64 %t4743 to ptr
  %t4745 = getelementptr i64, ptr %t4744, i64 2
  %t4746 = load i64, ptr %t4745
  ret i64 %t4746
else1056:
  %t4747 = and i64 %self, -8
  %t4748 = inttoptr i64 %t4747 to ptr
  %t4749 = getelementptr i64, ptr %t4748, i64 2
  %t4750 = load i64, ptr %t4749
  %t4751 = and i64 %self, -8
  %t4752 = inttoptr i64 %t4751 to ptr
  %t4753 = getelementptr i64, ptr %t4752, i64 4
  %t4754 = load i64, ptr %t4753
  %t4755 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4755)
  %t4756 = and i64 %t4755, -8
  %t4757 = inttoptr i64 %t4756 to ptr
  %t4758 = load i64, ptr %t4757
  %t4759 = inttoptr i64 %t4758 to ptr
  %t4760 = call fastcc i64%t4759(i64 %t4755, i64 2, i64 %t4754, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4761 = and i64 %self, -8
  %t4762 = inttoptr i64 %t4761 to ptr
  %t4763 = getelementptr i64, ptr %t4762, i64 3
  %t4764 = load i64, ptr %t4763
  call void @rt_check_callable(i64 %t4764)
  %t4765 = and i64 %t4764, -8
  %t4766 = inttoptr i64 %t4765 to ptr
  %t4767 = load i64, ptr %t4766
  %t4768 = inttoptr i64 %t4767 to ptr
  %t4769 = call i64 @rt_list_length(i64 %t4760)
  %t4770 = add i64 0, %t4769
  %t4771 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4760, i64 8)
  %t4783 = getelementptr i64, ptr %t4771, i64 0
  %t4775 = load i64, ptr %t4783
  %t4784 = getelementptr i64, ptr %t4771, i64 1
  %t4776 = load i64, ptr %t4784
  %t4785 = getelementptr i64, ptr %t4771, i64 2
  %t4777 = load i64, ptr %t4785
  %t4786 = getelementptr i64, ptr %t4771, i64 3
  %t4778 = load i64, ptr %t4786
  %t4787 = getelementptr i64, ptr %t4771, i64 4
  %t4779 = load i64, ptr %t4787
  %t4788 = getelementptr i64, ptr %t4771, i64 5
  %t4780 = load i64, ptr %t4788
  %t4789 = getelementptr i64, ptr %t4771, i64 6
  %t4781 = load i64, ptr %t4789
  %t4790 = getelementptr i64, ptr %t4771, i64 7
  %t4782 = load i64, ptr %t4790
  %t4772 = icmp sgt i64 %t4770, 8
  %t4773 = getelementptr i64, ptr %t4771, i64 8
  %t4774 = select i1 %t4772, ptr %t4773, ptr null
  %t4791 = call fastcc i64%t4768(i64 %t4764, i64 %t4770, i64 %t4775, i64 %t4776, i64 %t4777, i64 %t4778, i64 %t4779, i64 %t4780, i64 %t4781, i64 %t4782, ptr %t4774)
  %t4792 = call i64 @rt_vector_set(i64 %t4750, i64 %a0, i64 %t4791)
  %t4793 = or i64 %a0, 8
  %t4794 = and i64 %t4793, 7
  %t4795 = icmp eq i64 %t4794, 0
  br i1 %t4795, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t4796 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4797 = extractvalue {i64, i1} %t4796, 0
  %t4798 = extractvalue {i64, i1} %t4796, 1
  br i1 %t4798, label %fixslow1058, label %fixmerge1059
fixslow1058:
  %t4799 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1059
fixmerge1059:
  %t4800 = phi i64 [ %t4797, %fixfast1057 ], [ %t4799, %fixslow1058 ]
  %t4801 = musttail call fastcc i64 @"scheme.base:code_846"(i64 %self, i64 1, i64 %t4800, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4801
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4802 = icmp sge i64 %argc, 2
  br i1 %t4802, label %argok1061, label %arityerr1060
arityerr1060:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1061:
  %t4803 = call ptr @rt_alloc_words(i64 8)
  %t4804 = getelementptr i64, ptr %t4803, i64 0
  store i64 %a0, ptr %t4804
  %t4805 = getelementptr i64, ptr %t4803, i64 1
  store i64 %a1, ptr %t4805
  %t4806 = getelementptr i64, ptr %t4803, i64 2
  store i64 %a2, ptr %t4806
  %t4807 = getelementptr i64, ptr %t4803, i64 3
  store i64 %a3, ptr %t4807
  %t4808 = getelementptr i64, ptr %t4803, i64 4
  store i64 %a4, ptr %t4808
  %t4809 = getelementptr i64, ptr %t4803, i64 5
  store i64 %a5, ptr %t4809
  %t4810 = getelementptr i64, ptr %t4803, i64 6
  store i64 %a6, ptr %t4810
  %t4811 = getelementptr i64, ptr %t4803, i64 7
  store i64 %a7, ptr %t4811
  %t4812 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4803, ptr %overflow)
  %t4813 = call i64 @rt_null_p(i64 %t4812)
  %t4814 = icmp ne i64 %t4813, 1
  br i1 %t4814, label %then1062, label %else1063
then1062:
  %t4815 = call i64 @rt_vector_length(i64 %a1)
  %t4816 = call i64 @rt_make_vector(i64 %t4815, i64 0)
  %t4817 = call ptr @rt_alloc_words(i64 6)
  %t4818 = ptrtoint ptr %t4817 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_844" to i64), ptr %t4817
  %t4819 = or i64 %t4818, 4
  %t4820 = getelementptr i64, ptr %t4817, i64 1
  store i64 %t4815, ptr %t4820
  %t4821 = getelementptr i64, ptr %t4817, i64 2
  store i64 %t4816, ptr %t4821
  %t4822 = getelementptr i64, ptr %t4817, i64 3
  store i64 %a0, ptr %t4822
  %t4823 = getelementptr i64, ptr %t4817, i64 4
  store i64 %a1, ptr %t4823
  %t4824 = getelementptr i64, ptr %t4817, i64 5
  store i64 %t4819, ptr %t4824
  %t4825 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %t4819, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4825
else1063:
  %t4826 = call i64 @rt_cons(i64 %a1, i64 %t4812)
  %t4827 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4827)
  %t4828 = and i64 %t4827, -8
  %t4829 = inttoptr i64 %t4828 to ptr
  %t4830 = load i64, ptr %t4829
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = call fastcc i64%t4831(i64 %t4827, i64 1, i64 %t4826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4833 = call i64 @rt_make_vector(i64 %t4832, i64 0)
  %t4834 = call ptr @rt_alloc_words(i64 6)
  %t4835 = ptrtoint ptr %t4834 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_846" to i64), ptr %t4834
  %t4836 = or i64 %t4835, 4
  %t4837 = getelementptr i64, ptr %t4834, i64 1
  store i64 %t4832, ptr %t4837
  %t4838 = getelementptr i64, ptr %t4834, i64 2
  store i64 %t4833, ptr %t4838
  %t4839 = getelementptr i64, ptr %t4834, i64 3
  store i64 %a0, ptr %t4839
  %t4840 = getelementptr i64, ptr %t4834, i64 4
  store i64 %t4826, ptr %t4840
  %t4841 = getelementptr i64, ptr %t4834, i64 5
  store i64 %t4836, ptr %t4841
  %t4842 = musttail call fastcc i64 @"scheme.base:code_846"(i64 %t4836, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4842
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4843 = call i64 @rt_null_p(i64 2)
  %t4844 = icmp ne i64 %t4843, 1
  br i1 %t4844, label %then1064, label %else1065
then1064:
  %t4845 = call i64 @rt_vector_length(i64 %a1)
  %t4846 = call i64 @rt_make_vector(i64 %t4845, i64 0)
  %t4847 = call ptr @rt_alloc_words(i64 6)
  %t4848 = ptrtoint ptr %t4847 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_844" to i64), ptr %t4847
  %t4849 = or i64 %t4848, 4
  %t4850 = getelementptr i64, ptr %t4847, i64 1
  store i64 %t4845, ptr %t4850
  %t4851 = getelementptr i64, ptr %t4847, i64 2
  store i64 %t4846, ptr %t4851
  %t4852 = getelementptr i64, ptr %t4847, i64 3
  store i64 %a0, ptr %t4852
  %t4853 = getelementptr i64, ptr %t4847, i64 4
  store i64 %a1, ptr %t4853
  %t4854 = getelementptr i64, ptr %t4847, i64 5
  store i64 %t4849, ptr %t4854
  %t4855 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %t4849, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4855
else1065:
  %t4856 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4857 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4857)
  %t4858 = and i64 %t4857, -8
  %t4859 = inttoptr i64 %t4858 to ptr
  %t4860 = load i64, ptr %t4859
  %t4861 = inttoptr i64 %t4860 to ptr
  %t4862 = call fastcc i64%t4861(i64 %t4857, i64 1, i64 %t4856, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4863 = call i64 @rt_make_vector(i64 %t4862, i64 0)
  %t4864 = call ptr @rt_alloc_words(i64 6)
  %t4865 = ptrtoint ptr %t4864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_846" to i64), ptr %t4864
  %t4866 = or i64 %t4865, 4
  %t4867 = getelementptr i64, ptr %t4864, i64 1
  store i64 %t4862, ptr %t4867
  %t4868 = getelementptr i64, ptr %t4864, i64 2
  store i64 %t4863, ptr %t4868
  %t4869 = getelementptr i64, ptr %t4864, i64 3
  store i64 %a0, ptr %t4869
  %t4870 = getelementptr i64, ptr %t4864, i64 4
  store i64 %t4856, ptr %t4870
  %t4871 = getelementptr i64, ptr %t4864, i64 5
  store i64 %t4866, ptr %t4871
  %t4872 = musttail call fastcc i64 @"scheme.base:code_846"(i64 %t4866, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4872
}

define fastcc i64 @"scheme.base:code_867"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4877 = icmp eq i64 %argc, 1
  br i1 %t4877, label %argok1067, label %arityerr1066
arityerr1066:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1067:
  %t4878 = and i64 %self, -8
  %t4879 = inttoptr i64 %t4878 to ptr
  %t4880 = getelementptr i64, ptr %t4879, i64 1
  %t4881 = load i64, ptr %t4880
  %t4882 = or i64 %a0, %t4881
  %t4883 = and i64 %t4882, 7
  %t4884 = icmp eq i64 %t4883, 0
  br i1 %t4884, label %fixfast1068, label %fixslow1069
fixfast1068:
  %t4885 = icmp eq i64 %a0, %t4881
  %t4886 = select i1 %t4885, i64 257, i64 1
  br label %fixmerge1070
fixslow1069:
  %t4887 = call i64 @rt_num_eq(i64 %a0, i64 %t4881)
  br label %fixmerge1070
fixmerge1070:
  %t4888 = phi i64 [ %t4886, %fixfast1068 ], [ %t4887, %fixslow1069 ]
  %t4889 = icmp ne i64 %t4888, 1
  br i1 %t4889, label %then1071, label %else1072
then1071:
  %t4890 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4890)
  %t4891 = and i64 %t4890, -8
  %t4892 = inttoptr i64 %t4891 to ptr
  %t4893 = load i64, ptr %t4892
  %t4894 = inttoptr i64 %t4893 to ptr
  %t4895 = musttail call fastcc i64 %t4894(i64 %t4890, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4895
else1072:
  %t4896 = and i64 %self, -8
  %t4897 = inttoptr i64 %t4896 to ptr
  %t4898 = getelementptr i64, ptr %t4897, i64 3
  %t4899 = load i64, ptr %t4898
  %t4900 = call i64 @rt_vector_ref(i64 %t4899, i64 %a0)
  %t4901 = and i64 %self, -8
  %t4902 = inttoptr i64 %t4901 to ptr
  %t4903 = getelementptr i64, ptr %t4902, i64 2
  %t4904 = load i64, ptr %t4903
  call void @rt_check_callable(i64 %t4904)
  %t4905 = and i64 %t4904, -8
  %t4906 = inttoptr i64 %t4905 to ptr
  %t4907 = load i64, ptr %t4906
  %t4908 = inttoptr i64 %t4907 to ptr
  %t4909 = call fastcc i64%t4908(i64 %t4904, i64 1, i64 %t4900, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4910 = or i64 %a0, 8
  %t4911 = and i64 %t4910, 7
  %t4912 = icmp eq i64 %t4911, 0
  br i1 %t4912, label %fixfast1073, label %fixslow1074
fixfast1073:
  %t4913 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4914 = extractvalue {i64, i1} %t4913, 0
  %t4915 = extractvalue {i64, i1} %t4913, 1
  br i1 %t4915, label %fixslow1074, label %fixmerge1075
fixslow1074:
  %t4916 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1075
fixmerge1075:
  %t4917 = phi i64 [ %t4914, %fixfast1073 ], [ %t4916, %fixslow1074 ]
  %t4918 = musttail call fastcc i64 @"scheme.base:code_867"(i64 %self, i64 1, i64 %t4917, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4918
}

define fastcc i64 @"scheme.base:code_869"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4919 = icmp eq i64 %argc, 1
  br i1 %t4919, label %argok1077, label %arityerr1076
arityerr1076:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1077:
  %t4920 = and i64 %self, -8
  %t4921 = inttoptr i64 %t4920 to ptr
  %t4922 = getelementptr i64, ptr %t4921, i64 1
  %t4923 = load i64, ptr %t4922
  %t4924 = or i64 %a0, %t4923
  %t4925 = and i64 %t4924, 7
  %t4926 = icmp eq i64 %t4925, 0
  br i1 %t4926, label %fixfast1078, label %fixslow1079
fixfast1078:
  %t4927 = icmp eq i64 %a0, %t4923
  %t4928 = select i1 %t4927, i64 257, i64 1
  br label %fixmerge1080
fixslow1079:
  %t4929 = call i64 @rt_num_eq(i64 %a0, i64 %t4923)
  br label %fixmerge1080
fixmerge1080:
  %t4930 = phi i64 [ %t4928, %fixfast1078 ], [ %t4929, %fixslow1079 ]
  %t4931 = icmp ne i64 %t4930, 1
  br i1 %t4931, label %then1081, label %else1082
then1081:
  %t4932 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4932)
  %t4933 = and i64 %t4932, -8
  %t4934 = inttoptr i64 %t4933 to ptr
  %t4935 = load i64, ptr %t4934
  %t4936 = inttoptr i64 %t4935 to ptr
  %t4937 = musttail call fastcc i64 %t4936(i64 %t4932, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4937
else1082:
  %t4938 = and i64 %self, -8
  %t4939 = inttoptr i64 %t4938 to ptr
  %t4940 = getelementptr i64, ptr %t4939, i64 3
  %t4941 = load i64, ptr %t4940
  %t4942 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4942)
  %t4943 = and i64 %t4942, -8
  %t4944 = inttoptr i64 %t4943 to ptr
  %t4945 = load i64, ptr %t4944
  %t4946 = inttoptr i64 %t4945 to ptr
  %t4947 = call fastcc i64%t4946(i64 %t4942, i64 2, i64 %t4941, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4948 = and i64 %self, -8
  %t4949 = inttoptr i64 %t4948 to ptr
  %t4950 = getelementptr i64, ptr %t4949, i64 2
  %t4951 = load i64, ptr %t4950
  call void @rt_check_callable(i64 %t4951)
  %t4952 = and i64 %t4951, -8
  %t4953 = inttoptr i64 %t4952 to ptr
  %t4954 = load i64, ptr %t4953
  %t4955 = inttoptr i64 %t4954 to ptr
  %t4956 = call i64 @rt_list_length(i64 %t4947)
  %t4957 = add i64 0, %t4956
  %t4958 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4947, i64 8)
  %t4970 = getelementptr i64, ptr %t4958, i64 0
  %t4962 = load i64, ptr %t4970
  %t4971 = getelementptr i64, ptr %t4958, i64 1
  %t4963 = load i64, ptr %t4971
  %t4972 = getelementptr i64, ptr %t4958, i64 2
  %t4964 = load i64, ptr %t4972
  %t4973 = getelementptr i64, ptr %t4958, i64 3
  %t4965 = load i64, ptr %t4973
  %t4974 = getelementptr i64, ptr %t4958, i64 4
  %t4966 = load i64, ptr %t4974
  %t4975 = getelementptr i64, ptr %t4958, i64 5
  %t4967 = load i64, ptr %t4975
  %t4976 = getelementptr i64, ptr %t4958, i64 6
  %t4968 = load i64, ptr %t4976
  %t4977 = getelementptr i64, ptr %t4958, i64 7
  %t4969 = load i64, ptr %t4977
  %t4959 = icmp sgt i64 %t4957, 8
  %t4960 = getelementptr i64, ptr %t4958, i64 8
  %t4961 = select i1 %t4959, ptr %t4960, ptr null
  %t4978 = call fastcc i64%t4955(i64 %t4951, i64 %t4957, i64 %t4962, i64 %t4963, i64 %t4964, i64 %t4965, i64 %t4966, i64 %t4967, i64 %t4968, i64 %t4969, ptr %t4961)
  %t4979 = or i64 %a0, 8
  %t4980 = and i64 %t4979, 7
  %t4981 = icmp eq i64 %t4980, 0
  br i1 %t4981, label %fixfast1083, label %fixslow1084
fixfast1083:
  %t4982 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4983 = extractvalue {i64, i1} %t4982, 0
  %t4984 = extractvalue {i64, i1} %t4982, 1
  br i1 %t4984, label %fixslow1084, label %fixmerge1085
fixslow1084:
  %t4985 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1085
fixmerge1085:
  %t4986 = phi i64 [ %t4983, %fixfast1083 ], [ %t4985, %fixslow1084 ]
  %t4987 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %self, i64 1, i64 %t4986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4987
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4988 = icmp sge i64 %argc, 2
  br i1 %t4988, label %argok1087, label %arityerr1086
arityerr1086:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1087:
  %t4989 = call ptr @rt_alloc_words(i64 8)
  %t4990 = getelementptr i64, ptr %t4989, i64 0
  store i64 %a0, ptr %t4990
  %t4991 = getelementptr i64, ptr %t4989, i64 1
  store i64 %a1, ptr %t4991
  %t4992 = getelementptr i64, ptr %t4989, i64 2
  store i64 %a2, ptr %t4992
  %t4993 = getelementptr i64, ptr %t4989, i64 3
  store i64 %a3, ptr %t4993
  %t4994 = getelementptr i64, ptr %t4989, i64 4
  store i64 %a4, ptr %t4994
  %t4995 = getelementptr i64, ptr %t4989, i64 5
  store i64 %a5, ptr %t4995
  %t4996 = getelementptr i64, ptr %t4989, i64 6
  store i64 %a6, ptr %t4996
  %t4997 = getelementptr i64, ptr %t4989, i64 7
  store i64 %a7, ptr %t4997
  %t4998 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4989, ptr %overflow)
  %t4999 = call i64 @rt_null_p(i64 %t4998)
  %t5000 = icmp ne i64 %t4999, 1
  br i1 %t5000, label %then1088, label %else1089
then1088:
  %t5001 = call i64 @rt_vector_length(i64 %a1)
  %t5002 = call ptr @rt_alloc_words(i64 5)
  %t5003 = ptrtoint ptr %t5002 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_867" to i64), ptr %t5002
  %t5004 = or i64 %t5003, 4
  %t5005 = getelementptr i64, ptr %t5002, i64 1
  store i64 %t5001, ptr %t5005
  %t5006 = getelementptr i64, ptr %t5002, i64 2
  store i64 %a0, ptr %t5006
  %t5007 = getelementptr i64, ptr %t5002, i64 3
  store i64 %a1, ptr %t5007
  %t5008 = getelementptr i64, ptr %t5002, i64 4
  store i64 %t5004, ptr %t5008
  %t5009 = musttail call fastcc i64 @"scheme.base:code_867"(i64 %t5004, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5009
else1089:
  %t5010 = call i64 @rt_cons(i64 %a1, i64 %t4998)
  %t5011 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5011)
  %t5012 = and i64 %t5011, -8
  %t5013 = inttoptr i64 %t5012 to ptr
  %t5014 = load i64, ptr %t5013
  %t5015 = inttoptr i64 %t5014 to ptr
  %t5016 = call fastcc i64%t5015(i64 %t5011, i64 1, i64 %t5010, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5017 = call ptr @rt_alloc_words(i64 5)
  %t5018 = ptrtoint ptr %t5017 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_869" to i64), ptr %t5017
  %t5019 = or i64 %t5018, 4
  %t5020 = getelementptr i64, ptr %t5017, i64 1
  store i64 %t5016, ptr %t5020
  %t5021 = getelementptr i64, ptr %t5017, i64 2
  store i64 %a0, ptr %t5021
  %t5022 = getelementptr i64, ptr %t5017, i64 3
  store i64 %t5010, ptr %t5022
  %t5023 = getelementptr i64, ptr %t5017, i64 4
  store i64 %t5019, ptr %t5023
  %t5024 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %t5019, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5024
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5025 = call i64 @rt_null_p(i64 2)
  %t5026 = icmp ne i64 %t5025, 1
  br i1 %t5026, label %then1090, label %else1091
then1090:
  %t5027 = call i64 @rt_vector_length(i64 %a1)
  %t5028 = call ptr @rt_alloc_words(i64 5)
  %t5029 = ptrtoint ptr %t5028 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_867" to i64), ptr %t5028
  %t5030 = or i64 %t5029, 4
  %t5031 = getelementptr i64, ptr %t5028, i64 1
  store i64 %t5027, ptr %t5031
  %t5032 = getelementptr i64, ptr %t5028, i64 2
  store i64 %a0, ptr %t5032
  %t5033 = getelementptr i64, ptr %t5028, i64 3
  store i64 %a1, ptr %t5033
  %t5034 = getelementptr i64, ptr %t5028, i64 4
  store i64 %t5030, ptr %t5034
  %t5035 = musttail call fastcc i64 @"scheme.base:code_867"(i64 %t5030, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5035
else1091:
  %t5036 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5037 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5037)
  %t5038 = and i64 %t5037, -8
  %t5039 = inttoptr i64 %t5038 to ptr
  %t5040 = load i64, ptr %t5039
  %t5041 = inttoptr i64 %t5040 to ptr
  %t5042 = call fastcc i64%t5041(i64 %t5037, i64 1, i64 %t5036, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5043 = call ptr @rt_alloc_words(i64 5)
  %t5044 = ptrtoint ptr %t5043 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_869" to i64), ptr %t5043
  %t5045 = or i64 %t5044, 4
  %t5046 = getelementptr i64, ptr %t5043, i64 1
  store i64 %t5042, ptr %t5046
  %t5047 = getelementptr i64, ptr %t5043, i64 2
  store i64 %a0, ptr %t5047
  %t5048 = getelementptr i64, ptr %t5043, i64 3
  store i64 %t5036, ptr %t5048
  %t5049 = getelementptr i64, ptr %t5043, i64 4
  store i64 %t5045, ptr %t5049
  %t5050 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %t5045, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5050
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5055 = icmp eq i64 %argc, 1
  br i1 %t5055, label %argok1093, label %arityerr1092
arityerr1092:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1093:
  %t5056 = call i64 @rt_cdr(i64 %a0)
  %t5057 = call i64 @rt_null_p(i64 %t5056)
  %t5058 = icmp ne i64 %t5057, 1
  br i1 %t5058, label %then1094, label %else1095
then1094:
  %t5059 = call i64 @rt_car(i64 %a0)
  %t5060 = call i64 @rt_vector_length(i64 %t5059)
  ret i64 %t5060
else1095:
  %t5061 = call i64 @rt_car(i64 %a0)
  %t5062 = call i64 @rt_vector_length(i64 %t5061)
  %t5063 = call i64 @rt_cdr(i64 %a0)
  %t5064 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5064)
  %t5065 = and i64 %t5064, -8
  %t5066 = inttoptr i64 %t5065 to ptr
  %t5067 = load i64, ptr %t5066
  %t5068 = inttoptr i64 %t5067 to ptr
  %t5069 = call fastcc i64%t5068(i64 %t5064, i64 1, i64 %t5063, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5070 = or i64 %t5062, %t5069
  %t5071 = and i64 %t5070, 7
  %t5072 = icmp eq i64 %t5071, 0
  br i1 %t5072, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t5073 = icmp slt i64 %t5062, %t5069
  %t5074 = select i1 %t5073, i64 257, i64 1
  br label %fixmerge1098
fixslow1097:
  %t5075 = call i64 @rt_lt(i64 %t5062, i64 %t5069)
  br label %fixmerge1098
fixmerge1098:
  %t5076 = phi i64 [ %t5074, %fixfast1096 ], [ %t5075, %fixslow1097 ]
  %t5077 = icmp ne i64 %t5076, 1
  br i1 %t5077, label %then1099, label %else1100
then1099:
  ret i64 %t5062
else1100:
  ret i64 %t5069
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5082 = icmp eq i64 %argc, 2
  br i1 %t5082, label %argok1102, label %arityerr1101
arityerr1101:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1102:
  %t5083 = call i64 @rt_null_p(i64 %a0)
  %t5084 = icmp ne i64 %t5083, 1
  br i1 %t5084, label %then1103, label %else1104
then1103:
  ret i64 2
else1104:
  %t5085 = call i64 @rt_car(i64 %a0)
  %t5086 = call i64 @rt_vector_ref(i64 %t5085, i64 %a1)
  %t5087 = call i64 @rt_cdr(i64 %a0)
  %t5088 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t5088)
  %t5089 = and i64 %t5088, -8
  %t5090 = inttoptr i64 %t5089 to ptr
  %t5091 = load i64, ptr %t5090
  %t5092 = inttoptr i64 %t5091 to ptr
  %t5093 = call fastcc i64%t5092(i64 %t5088, i64 2, i64 %t5087, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5094 = call i64 @rt_cons(i64 %t5086, i64 %t5093)
  ret i64 %t5094
}

define fastcc i64 @"scheme.base:code_895"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5099 = icmp eq i64 %argc, 1
  br i1 %t5099, label %argok1106, label %arityerr1105
arityerr1105:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1106:
  %t5100 = and i64 %self, -8
  %t5101 = inttoptr i64 %t5100 to ptr
  %t5102 = getelementptr i64, ptr %t5101, i64 1
  %t5103 = load i64, ptr %t5102
  %t5104 = or i64 %a0, %t5103
  %t5105 = and i64 %t5104, 7
  %t5106 = icmp eq i64 %t5105, 0
  br i1 %t5106, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t5107 = icmp eq i64 %a0, %t5103
  %t5108 = select i1 %t5107, i64 257, i64 1
  br label %fixmerge1109
fixslow1108:
  %t5109 = call i64 @rt_num_eq(i64 %a0, i64 %t5103)
  br label %fixmerge1109
fixmerge1109:
  %t5110 = phi i64 [ %t5108, %fixfast1107 ], [ %t5109, %fixslow1108 ]
  %t5111 = icmp ne i64 %t5110, 1
  br i1 %t5111, label %then1110, label %else1111
then1110:
  %t5112 = and i64 %self, -8
  %t5113 = inttoptr i64 %t5112 to ptr
  %t5114 = getelementptr i64, ptr %t5113, i64 2
  %t5115 = load i64, ptr %t5114
  ret i64 %t5115
else1111:
  %t5116 = and i64 %self, -8
  %t5117 = inttoptr i64 %t5116 to ptr
  %t5118 = getelementptr i64, ptr %t5117, i64 2
  %t5119 = load i64, ptr %t5118
  %t5120 = and i64 %self, -8
  %t5121 = inttoptr i64 %t5120 to ptr
  %t5122 = getelementptr i64, ptr %t5121, i64 3
  %t5123 = load i64, ptr %t5122
  %t5124 = or i64 %a0, %t5123
  %t5125 = and i64 %t5124, 7
  %t5126 = icmp eq i64 %t5125, 0
  br i1 %t5126, label %fixfast1112, label %fixslow1113
fixfast1112:
  %t5127 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5123)
  %t5128 = extractvalue {i64, i1} %t5127, 0
  %t5129 = extractvalue {i64, i1} %t5127, 1
  br i1 %t5129, label %fixslow1113, label %fixmerge1114
fixslow1113:
  %t5130 = call i64 @rt_sub(i64 %a0, i64 %t5123)
  br label %fixmerge1114
fixmerge1114:
  %t5131 = phi i64 [ %t5128, %fixfast1112 ], [ %t5130, %fixslow1113 ]
  %t5132 = and i64 %self, -8
  %t5133 = inttoptr i64 %t5132 to ptr
  %t5134 = getelementptr i64, ptr %t5133, i64 4
  %t5135 = load i64, ptr %t5134
  %t5136 = call i64 @rt_string_ref(i64 %t5135, i64 %a0)
  %t5137 = call i64 @rt_vector_set(i64 %t5119, i64 %t5131, i64 %t5136)
  %t5138 = or i64 %a0, 8
  %t5139 = and i64 %t5138, 7
  %t5140 = icmp eq i64 %t5139, 0
  br i1 %t5140, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t5141 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5142 = extractvalue {i64, i1} %t5141, 0
  %t5143 = extractvalue {i64, i1} %t5141, 1
  br i1 %t5143, label %fixslow1116, label %fixmerge1117
fixslow1116:
  %t5144 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1117
fixmerge1117:
  %t5145 = phi i64 [ %t5142, %fixfast1115 ], [ %t5144, %fixslow1116 ]
  %t5146 = musttail call fastcc i64 @"scheme.base:code_895"(i64 %self, i64 1, i64 %t5145, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5146
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5147 = icmp sge i64 %argc, 1
  br i1 %t5147, label %argok1119, label %arityerr1118
arityerr1118:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1119:
  %t5148 = call ptr @rt_alloc_words(i64 8)
  %t5149 = getelementptr i64, ptr %t5148, i64 0
  store i64 %a0, ptr %t5149
  %t5150 = getelementptr i64, ptr %t5148, i64 1
  store i64 %a1, ptr %t5150
  %t5151 = getelementptr i64, ptr %t5148, i64 2
  store i64 %a2, ptr %t5151
  %t5152 = getelementptr i64, ptr %t5148, i64 3
  store i64 %a3, ptr %t5152
  %t5153 = getelementptr i64, ptr %t5148, i64 4
  store i64 %a4, ptr %t5153
  %t5154 = getelementptr i64, ptr %t5148, i64 5
  store i64 %a5, ptr %t5154
  %t5155 = getelementptr i64, ptr %t5148, i64 6
  store i64 %a6, ptr %t5155
  %t5156 = getelementptr i64, ptr %t5148, i64 7
  store i64 %a7, ptr %t5156
  %t5157 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5148, ptr %overflow)
  %t5158 = call i64 @rt_string_length(i64 %a0)
  %t5159 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5159)
  %t5160 = and i64 %t5159, -8
  %t5161 = inttoptr i64 %t5160 to ptr
  %t5162 = load i64, ptr %t5161
  %t5163 = inttoptr i64 %t5162 to ptr
  %t5164 = call fastcc i64%t5163(i64 %t5159, i64 1, i64 %t5157, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5165 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5165)
  %t5166 = and i64 %t5165, -8
  %t5167 = inttoptr i64 %t5166 to ptr
  %t5168 = load i64, ptr %t5167
  %t5169 = inttoptr i64 %t5168 to ptr
  %t5170 = call fastcc i64%t5169(i64 %t5165, i64 2, i64 %t5157, i64 %t5158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5171 = call i64 @rt_intern(ptr @.str.sym.37)
  %t5172 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5172)
  %t5173 = and i64 %t5172, -8
  %t5174 = inttoptr i64 %t5173 to ptr
  %t5175 = load i64, ptr %t5174
  %t5176 = inttoptr i64 %t5175 to ptr
  %t5177 = call fastcc i64%t5176(i64 %t5172, i64 4, i64 %t5171, i64 %t5164, i64 %t5170, i64 %t5158, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5178 = or i64 %t5170, %t5164
  %t5179 = and i64 %t5178, 7
  %t5180 = icmp eq i64 %t5179, 0
  br i1 %t5180, label %fixfast1120, label %fixslow1121
fixfast1120:
  %t5181 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5170, i64 %t5164)
  %t5182 = extractvalue {i64, i1} %t5181, 0
  %t5183 = extractvalue {i64, i1} %t5181, 1
  br i1 %t5183, label %fixslow1121, label %fixmerge1122
fixslow1121:
  %t5184 = call i64 @rt_sub(i64 %t5170, i64 %t5164)
  br label %fixmerge1122
fixmerge1122:
  %t5185 = phi i64 [ %t5182, %fixfast1120 ], [ %t5184, %fixslow1121 ]
  %t5186 = call i64 @rt_make_vector(i64 %t5185, i64 0)
  %t5187 = call ptr @rt_alloc_words(i64 6)
  %t5188 = ptrtoint ptr %t5187 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_895" to i64), ptr %t5187
  %t5189 = or i64 %t5188, 4
  %t5190 = getelementptr i64, ptr %t5187, i64 1
  store i64 %t5170, ptr %t5190
  %t5191 = getelementptr i64, ptr %t5187, i64 2
  store i64 %t5186, ptr %t5191
  %t5192 = getelementptr i64, ptr %t5187, i64 3
  store i64 %t5164, ptr %t5192
  %t5193 = getelementptr i64, ptr %t5187, i64 4
  store i64 %a0, ptr %t5193
  %t5194 = getelementptr i64, ptr %t5187, i64 5
  store i64 %t5189, ptr %t5194
  %t5195 = musttail call fastcc i64 @"scheme.base:code_895"(i64 %t5189, i64 1, i64 %t5164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5195
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5196 = call i64 @rt_string_length(i64 %a0)
  %t5197 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5197)
  %t5198 = and i64 %t5197, -8
  %t5199 = inttoptr i64 %t5198 to ptr
  %t5200 = load i64, ptr %t5199
  %t5201 = inttoptr i64 %t5200 to ptr
  %t5202 = call fastcc i64%t5201(i64 %t5197, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5203 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5203)
  %t5204 = and i64 %t5203, -8
  %t5205 = inttoptr i64 %t5204 to ptr
  %t5206 = load i64, ptr %t5205
  %t5207 = inttoptr i64 %t5206 to ptr
  %t5208 = call fastcc i64%t5207(i64 %t5203, i64 2, i64 2, i64 %t5196, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5209 = call i64 @rt_intern(ptr @.str.sym.37)
  %t5210 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5210)
  %t5211 = and i64 %t5210, -8
  %t5212 = inttoptr i64 %t5211 to ptr
  %t5213 = load i64, ptr %t5212
  %t5214 = inttoptr i64 %t5213 to ptr
  %t5215 = call fastcc i64%t5214(i64 %t5210, i64 4, i64 %t5209, i64 %t5202, i64 %t5208, i64 %t5196, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5216 = or i64 %t5208, %t5202
  %t5217 = and i64 %t5216, 7
  %t5218 = icmp eq i64 %t5217, 0
  br i1 %t5218, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t5219 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5208, i64 %t5202)
  %t5220 = extractvalue {i64, i1} %t5219, 0
  %t5221 = extractvalue {i64, i1} %t5219, 1
  br i1 %t5221, label %fixslow1124, label %fixmerge1125
fixslow1124:
  %t5222 = call i64 @rt_sub(i64 %t5208, i64 %t5202)
  br label %fixmerge1125
fixmerge1125:
  %t5223 = phi i64 [ %t5220, %fixfast1123 ], [ %t5222, %fixslow1124 ]
  %t5224 = call i64 @rt_make_vector(i64 %t5223, i64 0)
  %t5225 = call ptr @rt_alloc_words(i64 6)
  %t5226 = ptrtoint ptr %t5225 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_895" to i64), ptr %t5225
  %t5227 = or i64 %t5226, 4
  %t5228 = getelementptr i64, ptr %t5225, i64 1
  store i64 %t5208, ptr %t5228
  %t5229 = getelementptr i64, ptr %t5225, i64 2
  store i64 %t5224, ptr %t5229
  %t5230 = getelementptr i64, ptr %t5225, i64 3
  store i64 %t5202, ptr %t5230
  %t5231 = getelementptr i64, ptr %t5225, i64 4
  store i64 %a0, ptr %t5231
  %t5232 = getelementptr i64, ptr %t5225, i64 5
  store i64 %t5227, ptr %t5232
  %t5233 = musttail call fastcc i64 @"scheme.base:code_895"(i64 %t5227, i64 1, i64 %t5202, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5233
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5238 = icmp sge i64 %argc, 1
  br i1 %t5238, label %argok1127, label %arityerr1126
arityerr1126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1127:
  %t5239 = call ptr @rt_alloc_words(i64 8)
  %t5240 = getelementptr i64, ptr %t5239, i64 0
  store i64 %a0, ptr %t5240
  %t5241 = getelementptr i64, ptr %t5239, i64 1
  store i64 %a1, ptr %t5241
  %t5242 = getelementptr i64, ptr %t5239, i64 2
  store i64 %a2, ptr %t5242
  %t5243 = getelementptr i64, ptr %t5239, i64 3
  store i64 %a3, ptr %t5243
  %t5244 = getelementptr i64, ptr %t5239, i64 4
  store i64 %a4, ptr %t5244
  %t5245 = getelementptr i64, ptr %t5239, i64 5
  store i64 %a5, ptr %t5245
  %t5246 = getelementptr i64, ptr %t5239, i64 6
  store i64 %a6, ptr %t5246
  %t5247 = getelementptr i64, ptr %t5239, i64 7
  store i64 %a7, ptr %t5247
  %t5248 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5239, ptr %overflow)
  %t5249 = call i64 @rt_vector_length(i64 %a0)
  %t5250 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5250)
  %t5251 = and i64 %t5250, -8
  %t5252 = inttoptr i64 %t5251 to ptr
  %t5253 = load i64, ptr %t5252
  %t5254 = inttoptr i64 %t5253 to ptr
  %t5255 = call fastcc i64%t5254(i64 %t5250, i64 1, i64 %t5248, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5256 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5256)
  %t5257 = and i64 %t5256, -8
  %t5258 = inttoptr i64 %t5257 to ptr
  %t5259 = load i64, ptr %t5258
  %t5260 = inttoptr i64 %t5259 to ptr
  %t5261 = call fastcc i64%t5260(i64 %t5256, i64 2, i64 %t5248, i64 %t5249, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5262 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5263 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5263)
  %t5264 = and i64 %t5263, -8
  %t5265 = inttoptr i64 %t5264 to ptr
  %t5266 = load i64, ptr %t5265
  %t5267 = inttoptr i64 %t5266 to ptr
  %t5268 = call fastcc i64%t5267(i64 %t5263, i64 4, i64 %t5262, i64 %t5255, i64 %t5261, i64 %t5249, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5269 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5269)
  %t5270 = and i64 %t5269, -8
  %t5271 = inttoptr i64 %t5270 to ptr
  %t5272 = load i64, ptr %t5271
  %t5273 = inttoptr i64 %t5272 to ptr
  %t5274 = call fastcc i64%t5273(i64 %t5269, i64 3, i64 %a0, i64 %t5255, i64 %t5261, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5275 = call i64 @rt_list_to_string(i64 %t5274)
  ret i64 %t5275
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5276 = call i64 @rt_vector_length(i64 %a0)
  %t5277 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5277)
  %t5278 = and i64 %t5277, -8
  %t5279 = inttoptr i64 %t5278 to ptr
  %t5280 = load i64, ptr %t5279
  %t5281 = inttoptr i64 %t5280 to ptr
  %t5282 = call fastcc i64%t5281(i64 %t5277, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5283 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5283)
  %t5284 = and i64 %t5283, -8
  %t5285 = inttoptr i64 %t5284 to ptr
  %t5286 = load i64, ptr %t5285
  %t5287 = inttoptr i64 %t5286 to ptr
  %t5288 = call fastcc i64%t5287(i64 %t5283, i64 2, i64 2, i64 %t5276, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5289 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5290 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5290)
  %t5291 = and i64 %t5290, -8
  %t5292 = inttoptr i64 %t5291 to ptr
  %t5293 = load i64, ptr %t5292
  %t5294 = inttoptr i64 %t5293 to ptr
  %t5295 = call fastcc i64%t5294(i64 %t5290, i64 4, i64 %t5289, i64 %t5282, i64 %t5288, i64 %t5276, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5296 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5296)
  %t5297 = and i64 %t5296, -8
  %t5298 = inttoptr i64 %t5297 to ptr
  %t5299 = load i64, ptr %t5298
  %t5300 = inttoptr i64 %t5299 to ptr
  %t5301 = call fastcc i64%t5300(i64 %t5296, i64 3, i64 %a0, i64 %t5282, i64 %t5288, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5302 = call i64 @rt_list_to_string(i64 %t5301)
  ret i64 %t5302
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5307 = icmp sge i64 %argc, 2
  br i1 %t5307, label %argok1129, label %arityerr1128
arityerr1128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1129:
  %t5308 = call ptr @rt_alloc_words(i64 8)
  %t5309 = getelementptr i64, ptr %t5308, i64 0
  store i64 %a0, ptr %t5309
  %t5310 = getelementptr i64, ptr %t5308, i64 1
  store i64 %a1, ptr %t5310
  %t5311 = getelementptr i64, ptr %t5308, i64 2
  store i64 %a2, ptr %t5311
  %t5312 = getelementptr i64, ptr %t5308, i64 3
  store i64 %a3, ptr %t5312
  %t5313 = getelementptr i64, ptr %t5308, i64 4
  store i64 %a4, ptr %t5313
  %t5314 = getelementptr i64, ptr %t5308, i64 5
  store i64 %a5, ptr %t5314
  %t5315 = getelementptr i64, ptr %t5308, i64 6
  store i64 %a6, ptr %t5315
  %t5316 = getelementptr i64, ptr %t5308, i64 7
  store i64 %a7, ptr %t5316
  %t5317 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5308, ptr %overflow)
  %t5318 = call i64 @rt_null_p(i64 %t5317)
  %t5319 = icmp ne i64 %t5318, 1
  br i1 %t5319, label %then1130, label %else1131
then1130:
  %t5320 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5320)
  %t5321 = and i64 %t5320, -8
  %t5322 = inttoptr i64 %t5321 to ptr
  %t5323 = load i64, ptr %t5322
  %t5324 = inttoptr i64 %t5323 to ptr
  %t5325 = call fastcc i64%t5324(i64 %t5320, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5326 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5326)
  %t5327 = and i64 %t5326, -8
  %t5328 = inttoptr i64 %t5327 to ptr
  %t5329 = load i64, ptr %t5328
  %t5330 = inttoptr i64 %t5329 to ptr
  %t5331 = call fastcc i64%t5330(i64 %t5326, i64 2, i64 %a0, i64 %t5325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5332 = call i64 @rt_list_to_string(i64 %t5331)
  ret i64 %t5332
else1131:
  %t5333 = call i64 @rt_cons(i64 %a1, i64 %t5317)
  %t5334 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5334)
  %t5335 = and i64 %t5334, -8
  %t5336 = inttoptr i64 %t5335 to ptr
  %t5337 = load i64, ptr %t5336
  %t5338 = inttoptr i64 %t5337 to ptr
  %t5339 = call fastcc i64%t5338(i64 %t5334, i64 2, i64 %a0, i64 %t5333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5340 = call i64 @rt_list_to_string(i64 %t5339)
  ret i64 %t5340
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5341 = call i64 @rt_null_p(i64 2)
  %t5342 = icmp ne i64 %t5341, 1
  br i1 %t5342, label %then1132, label %else1133
then1132:
  %t5343 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5343)
  %t5344 = and i64 %t5343, -8
  %t5345 = inttoptr i64 %t5344 to ptr
  %t5346 = load i64, ptr %t5345
  %t5347 = inttoptr i64 %t5346 to ptr
  %t5348 = call fastcc i64%t5347(i64 %t5343, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5349 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5349)
  %t5350 = and i64 %t5349, -8
  %t5351 = inttoptr i64 %t5350 to ptr
  %t5352 = load i64, ptr %t5351
  %t5353 = inttoptr i64 %t5352 to ptr
  %t5354 = call fastcc i64%t5353(i64 %t5349, i64 2, i64 %a0, i64 %t5348, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5355 = call i64 @rt_list_to_string(i64 %t5354)
  ret i64 %t5355
else1133:
  %t5356 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5357 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5357)
  %t5358 = and i64 %t5357, -8
  %t5359 = inttoptr i64 %t5358 to ptr
  %t5360 = load i64, ptr %t5359
  %t5361 = inttoptr i64 %t5360 to ptr
  %t5362 = call fastcc i64%t5361(i64 %t5357, i64 2, i64 %a0, i64 %t5356, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5363 = call i64 @rt_list_to_string(i64 %t5362)
  ret i64 %t5363
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5368 = icmp eq i64 %argc, 2
  br i1 %t5368, label %argok1135, label %arityerr1134
arityerr1134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1135:
  %t5369 = call i64 @rt_null_p(i64 %a1)
  %t5370 = icmp ne i64 %t5369, 1
  br i1 %t5370, label %then1136, label %else1137
then1136:
  ret i64 2
else1137:
  %t5371 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t5372 = and i64 %a0, -8
  %t5373 = inttoptr i64 %t5372 to ptr
  %t5374 = load i64, ptr %t5373
  %t5375 = inttoptr i64 %t5374 to ptr
  %t5376 = call fastcc i64%t5375(i64 %a0, i64 1, i64 %t5371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5377 = call i64 @rt_cdr(i64 %a1)
  %t5378 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5378)
  %t5379 = and i64 %t5378, -8
  %t5380 = inttoptr i64 %t5379 to ptr
  %t5381 = load i64, ptr %t5380
  %t5382 = inttoptr i64 %t5381 to ptr
  %t5383 = call fastcc i64%t5382(i64 %t5378, i64 2, i64 %a0, i64 %t5377, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5384 = call i64 @rt_cons(i64 %t5376, i64 %t5383)
  ret i64 %t5384
}

define fastcc i64 @"scheme.base:code_920"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5389 = icmp eq i64 %argc, 1
  br i1 %t5389, label %argok1139, label %arityerr1138
arityerr1138:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1139:
  %t5390 = and i64 %self, -8
  %t5391 = inttoptr i64 %t5390 to ptr
  %t5392 = getelementptr i64, ptr %t5391, i64 1
  %t5393 = load i64, ptr %t5392
  %t5394 = or i64 %a0, %t5393
  %t5395 = and i64 %t5394, 7
  %t5396 = icmp eq i64 %t5395, 0
  br i1 %t5396, label %fixfast1140, label %fixslow1141
fixfast1140:
  %t5397 = icmp eq i64 %a0, %t5393
  %t5398 = select i1 %t5397, i64 257, i64 1
  br label %fixmerge1142
fixslow1141:
  %t5399 = call i64 @rt_num_eq(i64 %a0, i64 %t5393)
  br label %fixmerge1142
fixmerge1142:
  %t5400 = phi i64 [ %t5398, %fixfast1140 ], [ %t5399, %fixslow1141 ]
  %t5401 = icmp ne i64 %t5400, 1
  br i1 %t5401, label %then1143, label %else1144
then1143:
  ret i64 2
else1144:
  %t5402 = and i64 %self, -8
  %t5403 = inttoptr i64 %t5402 to ptr
  %t5404 = getelementptr i64, ptr %t5403, i64 3
  %t5405 = load i64, ptr %t5404
  %t5406 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5406)
  %t5407 = and i64 %t5406, -8
  %t5408 = inttoptr i64 %t5407 to ptr
  %t5409 = load i64, ptr %t5408
  %t5410 = inttoptr i64 %t5409 to ptr
  %t5411 = call fastcc i64%t5410(i64 %t5406, i64 2, i64 %t5405, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5412 = and i64 %self, -8
  %t5413 = inttoptr i64 %t5412 to ptr
  %t5414 = getelementptr i64, ptr %t5413, i64 2
  %t5415 = load i64, ptr %t5414
  call void @rt_check_callable(i64 %t5415)
  %t5416 = and i64 %t5415, -8
  %t5417 = inttoptr i64 %t5416 to ptr
  %t5418 = load i64, ptr %t5417
  %t5419 = inttoptr i64 %t5418 to ptr
  %t5420 = call i64 @rt_list_length(i64 %t5411)
  %t5421 = add i64 0, %t5420
  %t5422 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5411, i64 8)
  %t5434 = getelementptr i64, ptr %t5422, i64 0
  %t5426 = load i64, ptr %t5434
  %t5435 = getelementptr i64, ptr %t5422, i64 1
  %t5427 = load i64, ptr %t5435
  %t5436 = getelementptr i64, ptr %t5422, i64 2
  %t5428 = load i64, ptr %t5436
  %t5437 = getelementptr i64, ptr %t5422, i64 3
  %t5429 = load i64, ptr %t5437
  %t5438 = getelementptr i64, ptr %t5422, i64 4
  %t5430 = load i64, ptr %t5438
  %t5439 = getelementptr i64, ptr %t5422, i64 5
  %t5431 = load i64, ptr %t5439
  %t5440 = getelementptr i64, ptr %t5422, i64 6
  %t5432 = load i64, ptr %t5440
  %t5441 = getelementptr i64, ptr %t5422, i64 7
  %t5433 = load i64, ptr %t5441
  %t5423 = icmp sgt i64 %t5421, 8
  %t5424 = getelementptr i64, ptr %t5422, i64 8
  %t5425 = select i1 %t5423, ptr %t5424, ptr null
  %t5442 = call fastcc i64%t5419(i64 %t5415, i64 %t5421, i64 %t5426, i64 %t5427, i64 %t5428, i64 %t5429, i64 %t5430, i64 %t5431, i64 %t5432, i64 %t5433, ptr %t5425)
  %t5443 = or i64 %a0, 8
  %t5444 = and i64 %t5443, 7
  %t5445 = icmp eq i64 %t5444, 0
  br i1 %t5445, label %fixfast1145, label %fixslow1146
fixfast1145:
  %t5446 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5447 = extractvalue {i64, i1} %t5446, 0
  %t5448 = extractvalue {i64, i1} %t5446, 1
  br i1 %t5448, label %fixslow1146, label %fixmerge1147
fixslow1146:
  %t5449 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1147
fixmerge1147:
  %t5450 = phi i64 [ %t5447, %fixfast1145 ], [ %t5449, %fixslow1146 ]
  %t5451 = call fastcc i64 @"scheme.base:code_920"(i64 %self, i64 1, i64 %t5450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5452 = call i64 @rt_cons(i64 %t5442, i64 %t5451)
  ret i64 %t5452
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5453 = icmp eq i64 %argc, 2
  br i1 %t5453, label %argok1149, label %arityerr1148
arityerr1148:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1149:
  %t5454 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5454)
  %t5455 = and i64 %t5454, -8
  %t5456 = inttoptr i64 %t5455 to ptr
  %t5457 = load i64, ptr %t5456
  %t5458 = inttoptr i64 %t5457 to ptr
  %t5459 = call fastcc i64%t5458(i64 %t5454, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5460 = call ptr @rt_alloc_words(i64 5)
  %t5461 = ptrtoint ptr %t5460 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_920" to i64), ptr %t5460
  %t5462 = or i64 %t5461, 4
  %t5463 = getelementptr i64, ptr %t5460, i64 1
  store i64 %t5459, ptr %t5463
  %t5464 = getelementptr i64, ptr %t5460, i64 2
  store i64 %a0, ptr %t5464
  %t5465 = getelementptr i64, ptr %t5460, i64 3
  store i64 %a1, ptr %t5465
  %t5466 = getelementptr i64, ptr %t5460, i64 4
  store i64 %t5462, ptr %t5466
  %t5467 = musttail call fastcc i64 @"scheme.base:code_920"(i64 %t5462, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5467
}

define fastcc i64 @"scheme.base:code_941"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5472 = icmp eq i64 %argc, 1
  br i1 %t5472, label %argok1151, label %arityerr1150
arityerr1150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1151:
  %t5473 = and i64 %self, -8
  %t5474 = inttoptr i64 %t5473 to ptr
  %t5475 = getelementptr i64, ptr %t5474, i64 1
  %t5476 = load i64, ptr %t5475
  %t5477 = or i64 %a0, %t5476
  %t5478 = and i64 %t5477, 7
  %t5479 = icmp eq i64 %t5478, 0
  br i1 %t5479, label %fixfast1152, label %fixslow1153
fixfast1152:
  %t5480 = icmp eq i64 %a0, %t5476
  %t5481 = select i1 %t5480, i64 257, i64 1
  br label %fixmerge1154
fixslow1153:
  %t5482 = call i64 @rt_num_eq(i64 %a0, i64 %t5476)
  br label %fixmerge1154
fixmerge1154:
  %t5483 = phi i64 [ %t5481, %fixfast1152 ], [ %t5482, %fixslow1153 ]
  %t5484 = icmp ne i64 %t5483, 1
  br i1 %t5484, label %then1155, label %else1156
then1155:
  %t5485 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5485)
  %t5486 = and i64 %t5485, -8
  %t5487 = inttoptr i64 %t5486 to ptr
  %t5488 = load i64, ptr %t5487
  %t5489 = inttoptr i64 %t5488 to ptr
  %t5490 = musttail call fastcc i64 %t5489(i64 %t5485, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5490
else1156:
  %t5491 = and i64 %self, -8
  %t5492 = inttoptr i64 %t5491 to ptr
  %t5493 = getelementptr i64, ptr %t5492, i64 3
  %t5494 = load i64, ptr %t5493
  %t5495 = call i64 @rt_string_ref(i64 %t5494, i64 %a0)
  %t5496 = and i64 %self, -8
  %t5497 = inttoptr i64 %t5496 to ptr
  %t5498 = getelementptr i64, ptr %t5497, i64 2
  %t5499 = load i64, ptr %t5498
  call void @rt_check_callable(i64 %t5499)
  %t5500 = and i64 %t5499, -8
  %t5501 = inttoptr i64 %t5500 to ptr
  %t5502 = load i64, ptr %t5501
  %t5503 = inttoptr i64 %t5502 to ptr
  %t5504 = call fastcc i64%t5503(i64 %t5499, i64 1, i64 %t5495, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5505 = or i64 %a0, 8
  %t5506 = and i64 %t5505, 7
  %t5507 = icmp eq i64 %t5506, 0
  br i1 %t5507, label %fixfast1157, label %fixslow1158
fixfast1157:
  %t5508 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5509 = extractvalue {i64, i1} %t5508, 0
  %t5510 = extractvalue {i64, i1} %t5508, 1
  br i1 %t5510, label %fixslow1158, label %fixmerge1159
fixslow1158:
  %t5511 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1159
fixmerge1159:
  %t5512 = phi i64 [ %t5509, %fixfast1157 ], [ %t5511, %fixslow1158 ]
  %t5513 = musttail call fastcc i64 @"scheme.base:code_941"(i64 %self, i64 1, i64 %t5512, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5513
}

define fastcc i64 @"scheme.base:code_943"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5514 = icmp eq i64 %argc, 1
  br i1 %t5514, label %argok1161, label %arityerr1160
arityerr1160:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1161:
  %t5515 = and i64 %self, -8
  %t5516 = inttoptr i64 %t5515 to ptr
  %t5517 = getelementptr i64, ptr %t5516, i64 1
  %t5518 = load i64, ptr %t5517
  %t5519 = or i64 %a0, %t5518
  %t5520 = and i64 %t5519, 7
  %t5521 = icmp eq i64 %t5520, 0
  br i1 %t5521, label %fixfast1162, label %fixslow1163
fixfast1162:
  %t5522 = icmp eq i64 %a0, %t5518
  %t5523 = select i1 %t5522, i64 257, i64 1
  br label %fixmerge1164
fixslow1163:
  %t5524 = call i64 @rt_num_eq(i64 %a0, i64 %t5518)
  br label %fixmerge1164
fixmerge1164:
  %t5525 = phi i64 [ %t5523, %fixfast1162 ], [ %t5524, %fixslow1163 ]
  %t5526 = icmp ne i64 %t5525, 1
  br i1 %t5526, label %then1165, label %else1166
then1165:
  %t5527 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5527)
  %t5528 = and i64 %t5527, -8
  %t5529 = inttoptr i64 %t5528 to ptr
  %t5530 = load i64, ptr %t5529
  %t5531 = inttoptr i64 %t5530 to ptr
  %t5532 = musttail call fastcc i64 %t5531(i64 %t5527, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5532
else1166:
  %t5533 = and i64 %self, -8
  %t5534 = inttoptr i64 %t5533 to ptr
  %t5535 = getelementptr i64, ptr %t5534, i64 3
  %t5536 = load i64, ptr %t5535
  %t5537 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5537)
  %t5538 = and i64 %t5537, -8
  %t5539 = inttoptr i64 %t5538 to ptr
  %t5540 = load i64, ptr %t5539
  %t5541 = inttoptr i64 %t5540 to ptr
  %t5542 = call fastcc i64%t5541(i64 %t5537, i64 2, i64 %t5536, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5543 = and i64 %self, -8
  %t5544 = inttoptr i64 %t5543 to ptr
  %t5545 = getelementptr i64, ptr %t5544, i64 2
  %t5546 = load i64, ptr %t5545
  call void @rt_check_callable(i64 %t5546)
  %t5547 = and i64 %t5546, -8
  %t5548 = inttoptr i64 %t5547 to ptr
  %t5549 = load i64, ptr %t5548
  %t5550 = inttoptr i64 %t5549 to ptr
  %t5551 = call i64 @rt_list_length(i64 %t5542)
  %t5552 = add i64 0, %t5551
  %t5553 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5542, i64 8)
  %t5565 = getelementptr i64, ptr %t5553, i64 0
  %t5557 = load i64, ptr %t5565
  %t5566 = getelementptr i64, ptr %t5553, i64 1
  %t5558 = load i64, ptr %t5566
  %t5567 = getelementptr i64, ptr %t5553, i64 2
  %t5559 = load i64, ptr %t5567
  %t5568 = getelementptr i64, ptr %t5553, i64 3
  %t5560 = load i64, ptr %t5568
  %t5569 = getelementptr i64, ptr %t5553, i64 4
  %t5561 = load i64, ptr %t5569
  %t5570 = getelementptr i64, ptr %t5553, i64 5
  %t5562 = load i64, ptr %t5570
  %t5571 = getelementptr i64, ptr %t5553, i64 6
  %t5563 = load i64, ptr %t5571
  %t5572 = getelementptr i64, ptr %t5553, i64 7
  %t5564 = load i64, ptr %t5572
  %t5554 = icmp sgt i64 %t5552, 8
  %t5555 = getelementptr i64, ptr %t5553, i64 8
  %t5556 = select i1 %t5554, ptr %t5555, ptr null
  %t5573 = call fastcc i64%t5550(i64 %t5546, i64 %t5552, i64 %t5557, i64 %t5558, i64 %t5559, i64 %t5560, i64 %t5561, i64 %t5562, i64 %t5563, i64 %t5564, ptr %t5556)
  %t5574 = or i64 %a0, 8
  %t5575 = and i64 %t5574, 7
  %t5576 = icmp eq i64 %t5575, 0
  br i1 %t5576, label %fixfast1167, label %fixslow1168
fixfast1167:
  %t5577 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5578 = extractvalue {i64, i1} %t5577, 0
  %t5579 = extractvalue {i64, i1} %t5577, 1
  br i1 %t5579, label %fixslow1168, label %fixmerge1169
fixslow1168:
  %t5580 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1169
fixmerge1169:
  %t5581 = phi i64 [ %t5578, %fixfast1167 ], [ %t5580, %fixslow1168 ]
  %t5582 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %self, i64 1, i64 %t5581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5582
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5583 = icmp sge i64 %argc, 2
  br i1 %t5583, label %argok1171, label %arityerr1170
arityerr1170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1171:
  %t5584 = call ptr @rt_alloc_words(i64 8)
  %t5585 = getelementptr i64, ptr %t5584, i64 0
  store i64 %a0, ptr %t5585
  %t5586 = getelementptr i64, ptr %t5584, i64 1
  store i64 %a1, ptr %t5586
  %t5587 = getelementptr i64, ptr %t5584, i64 2
  store i64 %a2, ptr %t5587
  %t5588 = getelementptr i64, ptr %t5584, i64 3
  store i64 %a3, ptr %t5588
  %t5589 = getelementptr i64, ptr %t5584, i64 4
  store i64 %a4, ptr %t5589
  %t5590 = getelementptr i64, ptr %t5584, i64 5
  store i64 %a5, ptr %t5590
  %t5591 = getelementptr i64, ptr %t5584, i64 6
  store i64 %a6, ptr %t5591
  %t5592 = getelementptr i64, ptr %t5584, i64 7
  store i64 %a7, ptr %t5592
  %t5593 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5584, ptr %overflow)
  %t5594 = call i64 @rt_null_p(i64 %t5593)
  %t5595 = icmp ne i64 %t5594, 1
  br i1 %t5595, label %then1172, label %else1173
then1172:
  %t5596 = call i64 @rt_string_length(i64 %a1)
  %t5597 = call ptr @rt_alloc_words(i64 5)
  %t5598 = ptrtoint ptr %t5597 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_941" to i64), ptr %t5597
  %t5599 = or i64 %t5598, 4
  %t5600 = getelementptr i64, ptr %t5597, i64 1
  store i64 %t5596, ptr %t5600
  %t5601 = getelementptr i64, ptr %t5597, i64 2
  store i64 %a0, ptr %t5601
  %t5602 = getelementptr i64, ptr %t5597, i64 3
  store i64 %a1, ptr %t5602
  %t5603 = getelementptr i64, ptr %t5597, i64 4
  store i64 %t5599, ptr %t5603
  %t5604 = musttail call fastcc i64 @"scheme.base:code_941"(i64 %t5599, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5604
else1173:
  %t5605 = call i64 @rt_cons(i64 %a1, i64 %t5593)
  %t5606 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5606)
  %t5607 = and i64 %t5606, -8
  %t5608 = inttoptr i64 %t5607 to ptr
  %t5609 = load i64, ptr %t5608
  %t5610 = inttoptr i64 %t5609 to ptr
  %t5611 = call fastcc i64%t5610(i64 %t5606, i64 1, i64 %t5605, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5612 = call ptr @rt_alloc_words(i64 5)
  %t5613 = ptrtoint ptr %t5612 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_943" to i64), ptr %t5612
  %t5614 = or i64 %t5613, 4
  %t5615 = getelementptr i64, ptr %t5612, i64 1
  store i64 %t5611, ptr %t5615
  %t5616 = getelementptr i64, ptr %t5612, i64 2
  store i64 %a0, ptr %t5616
  %t5617 = getelementptr i64, ptr %t5612, i64 3
  store i64 %t5605, ptr %t5617
  %t5618 = getelementptr i64, ptr %t5612, i64 4
  store i64 %t5614, ptr %t5618
  %t5619 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %t5614, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5619
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5620 = call i64 @rt_null_p(i64 2)
  %t5621 = icmp ne i64 %t5620, 1
  br i1 %t5621, label %then1174, label %else1175
then1174:
  %t5622 = call i64 @rt_string_length(i64 %a1)
  %t5623 = call ptr @rt_alloc_words(i64 5)
  %t5624 = ptrtoint ptr %t5623 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_941" to i64), ptr %t5623
  %t5625 = or i64 %t5624, 4
  %t5626 = getelementptr i64, ptr %t5623, i64 1
  store i64 %t5622, ptr %t5626
  %t5627 = getelementptr i64, ptr %t5623, i64 2
  store i64 %a0, ptr %t5627
  %t5628 = getelementptr i64, ptr %t5623, i64 3
  store i64 %a1, ptr %t5628
  %t5629 = getelementptr i64, ptr %t5623, i64 4
  store i64 %t5625, ptr %t5629
  %t5630 = musttail call fastcc i64 @"scheme.base:code_941"(i64 %t5625, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5630
else1175:
  %t5631 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5632 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5632)
  %t5633 = and i64 %t5632, -8
  %t5634 = inttoptr i64 %t5633 to ptr
  %t5635 = load i64, ptr %t5634
  %t5636 = inttoptr i64 %t5635 to ptr
  %t5637 = call fastcc i64%t5636(i64 %t5632, i64 1, i64 %t5631, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5638 = call ptr @rt_alloc_words(i64 5)
  %t5639 = ptrtoint ptr %t5638 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_943" to i64), ptr %t5638
  %t5640 = or i64 %t5639, 4
  %t5641 = getelementptr i64, ptr %t5638, i64 1
  store i64 %t5637, ptr %t5641
  %t5642 = getelementptr i64, ptr %t5638, i64 2
  store i64 %a0, ptr %t5642
  %t5643 = getelementptr i64, ptr %t5638, i64 3
  store i64 %t5631, ptr %t5643
  %t5644 = getelementptr i64, ptr %t5638, i64 4
  store i64 %t5640, ptr %t5644
  %t5645 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %t5640, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5645
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5650 = icmp eq i64 %argc, 1
  br i1 %t5650, label %argok1177, label %arityerr1176
arityerr1176:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1177:
  %t5651 = call i64 @rt_cdr(i64 %a0)
  %t5652 = call i64 @rt_null_p(i64 %t5651)
  %t5653 = icmp ne i64 %t5652, 1
  br i1 %t5653, label %then1178, label %else1179
then1178:
  %t5654 = call i64 @rt_car(i64 %a0)
  %t5655 = call i64 @rt_string_length(i64 %t5654)
  ret i64 %t5655
else1179:
  %t5656 = call i64 @rt_car(i64 %a0)
  %t5657 = call i64 @rt_string_length(i64 %t5656)
  %t5658 = call i64 @rt_cdr(i64 %a0)
  %t5659 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5659)
  %t5660 = and i64 %t5659, -8
  %t5661 = inttoptr i64 %t5660 to ptr
  %t5662 = load i64, ptr %t5661
  %t5663 = inttoptr i64 %t5662 to ptr
  %t5664 = call fastcc i64%t5663(i64 %t5659, i64 1, i64 %t5658, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5665 = or i64 %t5657, %t5664
  %t5666 = and i64 %t5665, 7
  %t5667 = icmp eq i64 %t5666, 0
  br i1 %t5667, label %fixfast1180, label %fixslow1181
fixfast1180:
  %t5668 = icmp slt i64 %t5657, %t5664
  %t5669 = select i1 %t5668, i64 257, i64 1
  br label %fixmerge1182
fixslow1181:
  %t5670 = call i64 @rt_lt(i64 %t5657, i64 %t5664)
  br label %fixmerge1182
fixmerge1182:
  %t5671 = phi i64 [ %t5669, %fixfast1180 ], [ %t5670, %fixslow1181 ]
  %t5672 = icmp ne i64 %t5671, 1
  br i1 %t5672, label %then1183, label %else1184
then1183:
  ret i64 %t5657
else1184:
  ret i64 %t5664
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5677 = icmp eq i64 %argc, 2
  br i1 %t5677, label %argok1186, label %arityerr1185
arityerr1185:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1186:
  %t5678 = call i64 @rt_null_p(i64 %a0)
  %t5679 = icmp ne i64 %t5678, 1
  br i1 %t5679, label %then1187, label %else1188
then1187:
  ret i64 2
else1188:
  %t5680 = call i64 @rt_car(i64 %a0)
  %t5681 = call i64 @rt_string_ref(i64 %t5680, i64 %a1)
  %t5682 = call i64 @rt_cdr(i64 %a0)
  %t5683 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5683)
  %t5684 = and i64 %t5683, -8
  %t5685 = inttoptr i64 %t5684 to ptr
  %t5686 = load i64, ptr %t5685
  %t5687 = inttoptr i64 %t5686 to ptr
  %t5688 = call fastcc i64%t5687(i64 %t5683, i64 2, i64 %t5682, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5689 = call i64 @rt_cons(i64 %t5681, i64 %t5688)
  ret i64 %t5689
}

define fastcc i64 @"scheme.base:code_969"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5694 = icmp eq i64 %argc, 1
  br i1 %t5694, label %argok1190, label %arityerr1189
arityerr1189:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1190:
  %t5695 = and i64 %self, -8
  %t5696 = inttoptr i64 %t5695 to ptr
  %t5697 = getelementptr i64, ptr %t5696, i64 1
  %t5698 = load i64, ptr %t5697
  %t5699 = or i64 %a0, %t5698
  %t5700 = and i64 %t5699, 7
  %t5701 = icmp eq i64 %t5700, 0
  br i1 %t5701, label %fixfast1191, label %fixslow1192
fixfast1191:
  %t5702 = icmp eq i64 %a0, %t5698
  %t5703 = select i1 %t5702, i64 257, i64 1
  br label %fixmerge1193
fixslow1192:
  %t5704 = call i64 @rt_num_eq(i64 %a0, i64 %t5698)
  br label %fixmerge1193
fixmerge1193:
  %t5705 = phi i64 [ %t5703, %fixfast1191 ], [ %t5704, %fixslow1192 ]
  %t5706 = icmp ne i64 %t5705, 1
  br i1 %t5706, label %then1194, label %else1195
then1194:
  %t5707 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5707)
  %t5708 = and i64 %t5707, -8
  %t5709 = inttoptr i64 %t5708 to ptr
  %t5710 = load i64, ptr %t5709
  %t5711 = inttoptr i64 %t5710 to ptr
  %t5712 = musttail call fastcc i64 %t5711(i64 %t5707, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5712
else1195:
  %t5713 = and i64 %self, -8
  %t5714 = inttoptr i64 %t5713 to ptr
  %t5715 = getelementptr i64, ptr %t5714, i64 2
  %t5716 = load i64, ptr %t5715
  %t5717 = and i64 %self, -8
  %t5718 = inttoptr i64 %t5717 to ptr
  %t5719 = getelementptr i64, ptr %t5718, i64 3
  %t5720 = load i64, ptr %t5719
  %t5721 = call i64 @rt_string_set(i64 %t5716, i64 %a0, i64 %t5720)
  %t5722 = or i64 %a0, 8
  %t5723 = and i64 %t5722, 7
  %t5724 = icmp eq i64 %t5723, 0
  br i1 %t5724, label %fixfast1196, label %fixslow1197
fixfast1196:
  %t5725 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5726 = extractvalue {i64, i1} %t5725, 0
  %t5727 = extractvalue {i64, i1} %t5725, 1
  br i1 %t5727, label %fixslow1197, label %fixmerge1198
fixslow1197:
  %t5728 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1198
fixmerge1198:
  %t5729 = phi i64 [ %t5726, %fixfast1196 ], [ %t5728, %fixslow1197 ]
  %t5730 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %self, i64 1, i64 %t5729, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5730
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5731 = icmp sge i64 %argc, 2
  br i1 %t5731, label %argok1200, label %arityerr1199
arityerr1199:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1200:
  %t5732 = call ptr @rt_alloc_words(i64 8)
  %t5733 = getelementptr i64, ptr %t5732, i64 0
  store i64 %a0, ptr %t5733
  %t5734 = getelementptr i64, ptr %t5732, i64 1
  store i64 %a1, ptr %t5734
  %t5735 = getelementptr i64, ptr %t5732, i64 2
  store i64 %a2, ptr %t5735
  %t5736 = getelementptr i64, ptr %t5732, i64 3
  store i64 %a3, ptr %t5736
  %t5737 = getelementptr i64, ptr %t5732, i64 4
  store i64 %a4, ptr %t5737
  %t5738 = getelementptr i64, ptr %t5732, i64 5
  store i64 %a5, ptr %t5738
  %t5739 = getelementptr i64, ptr %t5732, i64 6
  store i64 %a6, ptr %t5739
  %t5740 = getelementptr i64, ptr %t5732, i64 7
  store i64 %a7, ptr %t5740
  %t5741 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5732, ptr %overflow)
  %t5742 = call i64 @rt_string_length(i64 %a0)
  %t5743 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5743)
  %t5744 = and i64 %t5743, -8
  %t5745 = inttoptr i64 %t5744 to ptr
  %t5746 = load i64, ptr %t5745
  %t5747 = inttoptr i64 %t5746 to ptr
  %t5748 = call fastcc i64%t5747(i64 %t5743, i64 1, i64 %t5741, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5749 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5749)
  %t5750 = and i64 %t5749, -8
  %t5751 = inttoptr i64 %t5750 to ptr
  %t5752 = load i64, ptr %t5751
  %t5753 = inttoptr i64 %t5752 to ptr
  %t5754 = call fastcc i64%t5753(i64 %t5749, i64 2, i64 %t5741, i64 %t5742, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5755 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5756 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5756)
  %t5757 = and i64 %t5756, -8
  %t5758 = inttoptr i64 %t5757 to ptr
  %t5759 = load i64, ptr %t5758
  %t5760 = inttoptr i64 %t5759 to ptr
  %t5761 = call fastcc i64%t5760(i64 %t5756, i64 4, i64 %t5755, i64 %t5748, i64 %t5754, i64 %t5742, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5762 = call ptr @rt_alloc_words(i64 5)
  %t5763 = ptrtoint ptr %t5762 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_969" to i64), ptr %t5762
  %t5764 = or i64 %t5763, 4
  %t5765 = getelementptr i64, ptr %t5762, i64 1
  store i64 %t5754, ptr %t5765
  %t5766 = getelementptr i64, ptr %t5762, i64 2
  store i64 %a0, ptr %t5766
  %t5767 = getelementptr i64, ptr %t5762, i64 3
  store i64 %a1, ptr %t5767
  %t5768 = getelementptr i64, ptr %t5762, i64 4
  store i64 %t5764, ptr %t5768
  %t5769 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %t5764, i64 1, i64 %t5748, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5769
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5770 = call i64 @rt_string_length(i64 %a0)
  %t5771 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5771)
  %t5772 = and i64 %t5771, -8
  %t5773 = inttoptr i64 %t5772 to ptr
  %t5774 = load i64, ptr %t5773
  %t5775 = inttoptr i64 %t5774 to ptr
  %t5776 = call fastcc i64%t5775(i64 %t5771, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5777 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5777)
  %t5778 = and i64 %t5777, -8
  %t5779 = inttoptr i64 %t5778 to ptr
  %t5780 = load i64, ptr %t5779
  %t5781 = inttoptr i64 %t5780 to ptr
  %t5782 = call fastcc i64%t5781(i64 %t5777, i64 2, i64 2, i64 %t5770, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5783 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5784 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5784)
  %t5785 = and i64 %t5784, -8
  %t5786 = inttoptr i64 %t5785 to ptr
  %t5787 = load i64, ptr %t5786
  %t5788 = inttoptr i64 %t5787 to ptr
  %t5789 = call fastcc i64%t5788(i64 %t5784, i64 4, i64 %t5783, i64 %t5776, i64 %t5782, i64 %t5770, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5790 = call ptr @rt_alloc_words(i64 5)
  %t5791 = ptrtoint ptr %t5790 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_969" to i64), ptr %t5790
  %t5792 = or i64 %t5791, 4
  %t5793 = getelementptr i64, ptr %t5790, i64 1
  store i64 %t5782, ptr %t5793
  %t5794 = getelementptr i64, ptr %t5790, i64 2
  store i64 %a0, ptr %t5794
  %t5795 = getelementptr i64, ptr %t5790, i64 3
  store i64 %a1, ptr %t5795
  %t5796 = getelementptr i64, ptr %t5790, i64 4
  store i64 %t5792, ptr %t5796
  %t5797 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %t5792, i64 1, i64 %t5776, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5797
}

define fastcc i64 @"scheme.base:code_995"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5802 = icmp eq i64 %argc, 1
  br i1 %t5802, label %argok1202, label %arityerr1201
arityerr1201:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1202:
  %t5803 = or i64 %a0, 0
  %t5804 = and i64 %t5803, 7
  %t5805 = icmp eq i64 %t5804, 0
  br i1 %t5805, label %fixfast1203, label %fixslow1204
fixfast1203:
  %t5806 = icmp slt i64 %a0, 0
  %t5807 = select i1 %t5806, i64 257, i64 1
  br label %fixmerge1205
fixslow1204:
  %t5808 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1205
fixmerge1205:
  %t5809 = phi i64 [ %t5807, %fixfast1203 ], [ %t5808, %fixslow1204 ]
  %t5810 = icmp ne i64 %t5809, 1
  br i1 %t5810, label %then1206, label %else1207
then1206:
  %t5811 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5811)
  %t5812 = and i64 %t5811, -8
  %t5813 = inttoptr i64 %t5812 to ptr
  %t5814 = load i64, ptr %t5813
  %t5815 = inttoptr i64 %t5814 to ptr
  %t5816 = musttail call fastcc i64 %t5815(i64 %t5811, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5816
else1207:
  %t5817 = and i64 %self, -8
  %t5818 = inttoptr i64 %t5817 to ptr
  %t5819 = getelementptr i64, ptr %t5818, i64 1
  %t5820 = load i64, ptr %t5819
  %t5821 = and i64 %self, -8
  %t5822 = inttoptr i64 %t5821 to ptr
  %t5823 = getelementptr i64, ptr %t5822, i64 2
  %t5824 = load i64, ptr %t5823
  %t5825 = or i64 %t5824, %a0
  %t5826 = and i64 %t5825, 7
  %t5827 = icmp eq i64 %t5826, 0
  br i1 %t5827, label %fixfast1208, label %fixslow1209
fixfast1208:
  %t5828 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5824, i64 %a0)
  %t5829 = extractvalue {i64, i1} %t5828, 0
  %t5830 = extractvalue {i64, i1} %t5828, 1
  br i1 %t5830, label %fixslow1209, label %fixmerge1210
fixslow1209:
  %t5831 = call i64 @rt_add(i64 %t5824, i64 %a0)
  br label %fixmerge1210
fixmerge1210:
  %t5832 = phi i64 [ %t5829, %fixfast1208 ], [ %t5831, %fixslow1209 ]
  %t5833 = and i64 %self, -8
  %t5834 = inttoptr i64 %t5833 to ptr
  %t5835 = getelementptr i64, ptr %t5834, i64 3
  %t5836 = load i64, ptr %t5835
  %t5837 = and i64 %self, -8
  %t5838 = inttoptr i64 %t5837 to ptr
  %t5839 = getelementptr i64, ptr %t5838, i64 4
  %t5840 = load i64, ptr %t5839
  %t5841 = or i64 %t5840, %a0
  %t5842 = and i64 %t5841, 7
  %t5843 = icmp eq i64 %t5842, 0
  br i1 %t5843, label %fixfast1211, label %fixslow1212
fixfast1211:
  %t5844 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5840, i64 %a0)
  %t5845 = extractvalue {i64, i1} %t5844, 0
  %t5846 = extractvalue {i64, i1} %t5844, 1
  br i1 %t5846, label %fixslow1212, label %fixmerge1213
fixslow1212:
  %t5847 = call i64 @rt_add(i64 %t5840, i64 %a0)
  br label %fixmerge1213
fixmerge1213:
  %t5848 = phi i64 [ %t5845, %fixfast1211 ], [ %t5847, %fixslow1212 ]
  %t5849 = call i64 @rt_string_ref(i64 %t5836, i64 %t5848)
  %t5850 = call i64 @rt_string_set(i64 %t5820, i64 %t5832, i64 %t5849)
  %t5851 = or i64 %a0, 8
  %t5852 = and i64 %t5851, 7
  %t5853 = icmp eq i64 %t5852, 0
  br i1 %t5853, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5854 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5855 = extractvalue {i64, i1} %t5854, 0
  %t5856 = extractvalue {i64, i1} %t5854, 1
  br i1 %t5856, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t5857 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1216
fixmerge1216:
  %t5858 = phi i64 [ %t5855, %fixfast1214 ], [ %t5857, %fixslow1215 ]
  %t5859 = musttail call fastcc i64 @"scheme.base:code_995"(i64 %self, i64 1, i64 %t5858, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5859
}

define fastcc i64 @"scheme.base:code_997"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5860 = icmp eq i64 %argc, 1
  br i1 %t5860, label %argok1218, label %arityerr1217
arityerr1217:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1218:
  %t5861 = and i64 %self, -8
  %t5862 = inttoptr i64 %t5861 to ptr
  %t5863 = getelementptr i64, ptr %t5862, i64 1
  %t5864 = load i64, ptr %t5863
  %t5865 = and i64 %self, -8
  %t5866 = inttoptr i64 %t5865 to ptr
  %t5867 = getelementptr i64, ptr %t5866, i64 2
  %t5868 = load i64, ptr %t5867
  %t5869 = or i64 %t5864, %t5868
  %t5870 = and i64 %t5869, 7
  %t5871 = icmp eq i64 %t5870, 0
  br i1 %t5871, label %fixfast1219, label %fixslow1220
fixfast1219:
  %t5872 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5864, i64 %t5868)
  %t5873 = extractvalue {i64, i1} %t5872, 0
  %t5874 = extractvalue {i64, i1} %t5872, 1
  br i1 %t5874, label %fixslow1220, label %fixmerge1221
fixslow1220:
  %t5875 = call i64 @rt_sub(i64 %t5864, i64 %t5868)
  br label %fixmerge1221
fixmerge1221:
  %t5876 = phi i64 [ %t5873, %fixfast1219 ], [ %t5875, %fixslow1220 ]
  %t5877 = or i64 %a0, %t5876
  %t5878 = and i64 %t5877, 7
  %t5879 = icmp eq i64 %t5878, 0
  br i1 %t5879, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t5880 = icmp eq i64 %a0, %t5876
  %t5881 = select i1 %t5880, i64 257, i64 1
  br label %fixmerge1224
fixslow1223:
  %t5882 = call i64 @rt_num_eq(i64 %a0, i64 %t5876)
  br label %fixmerge1224
fixmerge1224:
  %t5883 = phi i64 [ %t5881, %fixfast1222 ], [ %t5882, %fixslow1223 ]
  %t5884 = icmp ne i64 %t5883, 1
  br i1 %t5884, label %then1225, label %else1226
then1225:
  %t5885 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5885)
  %t5886 = and i64 %t5885, -8
  %t5887 = inttoptr i64 %t5886 to ptr
  %t5888 = load i64, ptr %t5887
  %t5889 = inttoptr i64 %t5888 to ptr
  %t5890 = musttail call fastcc i64 %t5889(i64 %t5885, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5890
else1226:
  %t5891 = and i64 %self, -8
  %t5892 = inttoptr i64 %t5891 to ptr
  %t5893 = getelementptr i64, ptr %t5892, i64 3
  %t5894 = load i64, ptr %t5893
  %t5895 = and i64 %self, -8
  %t5896 = inttoptr i64 %t5895 to ptr
  %t5897 = getelementptr i64, ptr %t5896, i64 4
  %t5898 = load i64, ptr %t5897
  %t5899 = or i64 %t5898, %a0
  %t5900 = and i64 %t5899, 7
  %t5901 = icmp eq i64 %t5900, 0
  br i1 %t5901, label %fixfast1227, label %fixslow1228
fixfast1227:
  %t5902 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5898, i64 %a0)
  %t5903 = extractvalue {i64, i1} %t5902, 0
  %t5904 = extractvalue {i64, i1} %t5902, 1
  br i1 %t5904, label %fixslow1228, label %fixmerge1229
fixslow1228:
  %t5905 = call i64 @rt_add(i64 %t5898, i64 %a0)
  br label %fixmerge1229
fixmerge1229:
  %t5906 = phi i64 [ %t5903, %fixfast1227 ], [ %t5905, %fixslow1228 ]
  %t5907 = and i64 %self, -8
  %t5908 = inttoptr i64 %t5907 to ptr
  %t5909 = getelementptr i64, ptr %t5908, i64 5
  %t5910 = load i64, ptr %t5909
  %t5911 = and i64 %self, -8
  %t5912 = inttoptr i64 %t5911 to ptr
  %t5913 = getelementptr i64, ptr %t5912, i64 2
  %t5914 = load i64, ptr %t5913
  %t5915 = or i64 %t5914, %a0
  %t5916 = and i64 %t5915, 7
  %t5917 = icmp eq i64 %t5916, 0
  br i1 %t5917, label %fixfast1230, label %fixslow1231
fixfast1230:
  %t5918 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5914, i64 %a0)
  %t5919 = extractvalue {i64, i1} %t5918, 0
  %t5920 = extractvalue {i64, i1} %t5918, 1
  br i1 %t5920, label %fixslow1231, label %fixmerge1232
fixslow1231:
  %t5921 = call i64 @rt_add(i64 %t5914, i64 %a0)
  br label %fixmerge1232
fixmerge1232:
  %t5922 = phi i64 [ %t5919, %fixfast1230 ], [ %t5921, %fixslow1231 ]
  %t5923 = call i64 @rt_string_ref(i64 %t5910, i64 %t5922)
  %t5924 = call i64 @rt_string_set(i64 %t5894, i64 %t5906, i64 %t5923)
  %t5925 = or i64 %a0, 8
  %t5926 = and i64 %t5925, 7
  %t5927 = icmp eq i64 %t5926, 0
  br i1 %t5927, label %fixfast1233, label %fixslow1234
fixfast1233:
  %t5928 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5929 = extractvalue {i64, i1} %t5928, 0
  %t5930 = extractvalue {i64, i1} %t5928, 1
  br i1 %t5930, label %fixslow1234, label %fixmerge1235
fixslow1234:
  %t5931 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1235
fixmerge1235:
  %t5932 = phi i64 [ %t5929, %fixfast1233 ], [ %t5931, %fixslow1234 ]
  %t5933 = musttail call fastcc i64 @"scheme.base:code_997"(i64 %self, i64 1, i64 %t5932, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5933
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5934 = icmp sge i64 %argc, 3
  br i1 %t5934, label %argok1237, label %arityerr1236
arityerr1236:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1237:
  %t5935 = call ptr @rt_alloc_words(i64 8)
  %t5936 = getelementptr i64, ptr %t5935, i64 0
  store i64 %a0, ptr %t5936
  %t5937 = getelementptr i64, ptr %t5935, i64 1
  store i64 %a1, ptr %t5937
  %t5938 = getelementptr i64, ptr %t5935, i64 2
  store i64 %a2, ptr %t5938
  %t5939 = getelementptr i64, ptr %t5935, i64 3
  store i64 %a3, ptr %t5939
  %t5940 = getelementptr i64, ptr %t5935, i64 4
  store i64 %a4, ptr %t5940
  %t5941 = getelementptr i64, ptr %t5935, i64 5
  store i64 %a5, ptr %t5941
  %t5942 = getelementptr i64, ptr %t5935, i64 6
  store i64 %a6, ptr %t5942
  %t5943 = getelementptr i64, ptr %t5935, i64 7
  store i64 %a7, ptr %t5943
  %t5944 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5935, ptr %overflow)
  %t5945 = call i64 @rt_string_length(i64 %a2)
  %t5946 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5946)
  %t5947 = and i64 %t5946, -8
  %t5948 = inttoptr i64 %t5947 to ptr
  %t5949 = load i64, ptr %t5948
  %t5950 = inttoptr i64 %t5949 to ptr
  %t5951 = call fastcc i64%t5950(i64 %t5946, i64 1, i64 %t5944, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5952 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5952)
  %t5953 = and i64 %t5952, -8
  %t5954 = inttoptr i64 %t5953 to ptr
  %t5955 = load i64, ptr %t5954
  %t5956 = inttoptr i64 %t5955 to ptr
  %t5957 = call fastcc i64%t5956(i64 %t5952, i64 2, i64 %t5944, i64 %t5945, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5958 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5959 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5959)
  %t5960 = and i64 %t5959, -8
  %t5961 = inttoptr i64 %t5960 to ptr
  %t5962 = load i64, ptr %t5961
  %t5963 = inttoptr i64 %t5962 to ptr
  %t5964 = call fastcc i64%t5963(i64 %t5959, i64 4, i64 %t5958, i64 %t5951, i64 %t5957, i64 %t5945, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5965 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5966 = or i64 %t5957, %t5951
  %t5967 = and i64 %t5966, 7
  %t5968 = icmp eq i64 %t5967, 0
  br i1 %t5968, label %fixfast1238, label %fixslow1239
fixfast1238:
  %t5969 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5957, i64 %t5951)
  %t5970 = extractvalue {i64, i1} %t5969, 0
  %t5971 = extractvalue {i64, i1} %t5969, 1
  br i1 %t5971, label %fixslow1239, label %fixmerge1240
fixslow1239:
  %t5972 = call i64 @rt_sub(i64 %t5957, i64 %t5951)
  br label %fixmerge1240
fixmerge1240:
  %t5973 = phi i64 [ %t5970, %fixfast1238 ], [ %t5972, %fixslow1239 ]
  %t5974 = or i64 %a1, %t5973
  %t5975 = and i64 %t5974, 7
  %t5976 = icmp eq i64 %t5975, 0
  br i1 %t5976, label %fixfast1241, label %fixslow1242
fixfast1241:
  %t5977 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5973)
  %t5978 = extractvalue {i64, i1} %t5977, 0
  %t5979 = extractvalue {i64, i1} %t5977, 1
  br i1 %t5979, label %fixslow1242, label %fixmerge1243
fixslow1242:
  %t5980 = call i64 @rt_add(i64 %a1, i64 %t5973)
  br label %fixmerge1243
fixmerge1243:
  %t5981 = phi i64 [ %t5978, %fixfast1241 ], [ %t5980, %fixslow1242 ]
  %t5982 = call i64 @rt_string_length(i64 %a0)
  %t5983 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5983)
  %t5984 = and i64 %t5983, -8
  %t5985 = inttoptr i64 %t5984 to ptr
  %t5986 = load i64, ptr %t5985
  %t5987 = inttoptr i64 %t5986 to ptr
  %t5988 = call fastcc i64%t5987(i64 %t5983, i64 4, i64 %t5965, i64 %a1, i64 %t5981, i64 %t5982, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5989 = or i64 %t5951, %a1
  %t5990 = and i64 %t5989, 7
  %t5991 = icmp eq i64 %t5990, 0
  br i1 %t5991, label %fixfast1244, label %fixslow1245
fixfast1244:
  %t5992 = icmp slt i64 %t5951, %a1
  %t5993 = select i1 %t5992, i64 257, i64 1
  br label %fixmerge1246
fixslow1245:
  %t5994 = call i64 @rt_lt(i64 %t5951, i64 %a1)
  br label %fixmerge1246
fixmerge1246:
  %t5995 = phi i64 [ %t5993, %fixfast1244 ], [ %t5994, %fixslow1245 ]
  %t5996 = icmp ne i64 %t5995, 1
  br i1 %t5996, label %then1247, label %else1248
then1247:
  %t5997 = call ptr @rt_alloc_words(i64 6)
  %t5998 = ptrtoint ptr %t5997 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_995" to i64), ptr %t5997
  %t5999 = or i64 %t5998, 4
  %t6000 = getelementptr i64, ptr %t5997, i64 1
  store i64 %a0, ptr %t6000
  %t6001 = getelementptr i64, ptr %t5997, i64 2
  store i64 %a1, ptr %t6001
  %t6002 = getelementptr i64, ptr %t5997, i64 3
  store i64 %a2, ptr %t6002
  %t6003 = getelementptr i64, ptr %t5997, i64 4
  store i64 %t5951, ptr %t6003
  %t6004 = getelementptr i64, ptr %t5997, i64 5
  store i64 %t5999, ptr %t6004
  %t6005 = or i64 %t5957, %t5951
  %t6006 = and i64 %t6005, 7
  %t6007 = icmp eq i64 %t6006, 0
  br i1 %t6007, label %fixfast1249, label %fixslow1250
fixfast1249:
  %t6008 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5957, i64 %t5951)
  %t6009 = extractvalue {i64, i1} %t6008, 0
  %t6010 = extractvalue {i64, i1} %t6008, 1
  br i1 %t6010, label %fixslow1250, label %fixmerge1251
fixslow1250:
  %t6011 = call i64 @rt_sub(i64 %t5957, i64 %t5951)
  br label %fixmerge1251
fixmerge1251:
  %t6012 = phi i64 [ %t6009, %fixfast1249 ], [ %t6011, %fixslow1250 ]
  %t6013 = or i64 %t6012, 8
  %t6014 = and i64 %t6013, 7
  %t6015 = icmp eq i64 %t6014, 0
  br i1 %t6015, label %fixfast1252, label %fixslow1253
fixfast1252:
  %t6016 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6012, i64 8)
  %t6017 = extractvalue {i64, i1} %t6016, 0
  %t6018 = extractvalue {i64, i1} %t6016, 1
  br i1 %t6018, label %fixslow1253, label %fixmerge1254
fixslow1253:
  %t6019 = call i64 @rt_sub(i64 %t6012, i64 8)
  br label %fixmerge1254
fixmerge1254:
  %t6020 = phi i64 [ %t6017, %fixfast1252 ], [ %t6019, %fixslow1253 ]
  %t6021 = musttail call fastcc i64 @"scheme.base:code_995"(i64 %t5999, i64 1, i64 %t6020, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6021
else1248:
  %t6022 = call ptr @rt_alloc_words(i64 7)
  %t6023 = ptrtoint ptr %t6022 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_997" to i64), ptr %t6022
  %t6024 = or i64 %t6023, 4
  %t6025 = getelementptr i64, ptr %t6022, i64 1
  store i64 %t5957, ptr %t6025
  %t6026 = getelementptr i64, ptr %t6022, i64 2
  store i64 %t5951, ptr %t6026
  %t6027 = getelementptr i64, ptr %t6022, i64 3
  store i64 %a0, ptr %t6027
  %t6028 = getelementptr i64, ptr %t6022, i64 4
  store i64 %a1, ptr %t6028
  %t6029 = getelementptr i64, ptr %t6022, i64 5
  store i64 %a2, ptr %t6029
  %t6030 = getelementptr i64, ptr %t6022, i64 6
  store i64 %t6024, ptr %t6030
  %t6031 = musttail call fastcc i64 @"scheme.base:code_997"(i64 %t6024, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6031
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6032 = call i64 @rt_string_length(i64 %a2)
  %t6033 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6033)
  %t6034 = and i64 %t6033, -8
  %t6035 = inttoptr i64 %t6034 to ptr
  %t6036 = load i64, ptr %t6035
  %t6037 = inttoptr i64 %t6036 to ptr
  %t6038 = call fastcc i64%t6037(i64 %t6033, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6039 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6039)
  %t6040 = and i64 %t6039, -8
  %t6041 = inttoptr i64 %t6040 to ptr
  %t6042 = load i64, ptr %t6041
  %t6043 = inttoptr i64 %t6042 to ptr
  %t6044 = call fastcc i64%t6043(i64 %t6039, i64 2, i64 2, i64 %t6032, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6045 = call i64 @rt_intern(ptr @.str.sym.40)
  %t6046 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6046)
  %t6047 = and i64 %t6046, -8
  %t6048 = inttoptr i64 %t6047 to ptr
  %t6049 = load i64, ptr %t6048
  %t6050 = inttoptr i64 %t6049 to ptr
  %t6051 = call fastcc i64%t6050(i64 %t6046, i64 4, i64 %t6045, i64 %t6038, i64 %t6044, i64 %t6032, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6052 = call i64 @rt_intern(ptr @.str.sym.40)
  %t6053 = or i64 %t6044, %t6038
  %t6054 = and i64 %t6053, 7
  %t6055 = icmp eq i64 %t6054, 0
  br i1 %t6055, label %fixfast1255, label %fixslow1256
fixfast1255:
  %t6056 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6044, i64 %t6038)
  %t6057 = extractvalue {i64, i1} %t6056, 0
  %t6058 = extractvalue {i64, i1} %t6056, 1
  br i1 %t6058, label %fixslow1256, label %fixmerge1257
fixslow1256:
  %t6059 = call i64 @rt_sub(i64 %t6044, i64 %t6038)
  br label %fixmerge1257
fixmerge1257:
  %t6060 = phi i64 [ %t6057, %fixfast1255 ], [ %t6059, %fixslow1256 ]
  %t6061 = or i64 %a1, %t6060
  %t6062 = and i64 %t6061, 7
  %t6063 = icmp eq i64 %t6062, 0
  br i1 %t6063, label %fixfast1258, label %fixslow1259
fixfast1258:
  %t6064 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6060)
  %t6065 = extractvalue {i64, i1} %t6064, 0
  %t6066 = extractvalue {i64, i1} %t6064, 1
  br i1 %t6066, label %fixslow1259, label %fixmerge1260
fixslow1259:
  %t6067 = call i64 @rt_add(i64 %a1, i64 %t6060)
  br label %fixmerge1260
fixmerge1260:
  %t6068 = phi i64 [ %t6065, %fixfast1258 ], [ %t6067, %fixslow1259 ]
  %t6069 = call i64 @rt_string_length(i64 %a0)
  %t6070 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6070)
  %t6071 = and i64 %t6070, -8
  %t6072 = inttoptr i64 %t6071 to ptr
  %t6073 = load i64, ptr %t6072
  %t6074 = inttoptr i64 %t6073 to ptr
  %t6075 = call fastcc i64%t6074(i64 %t6070, i64 4, i64 %t6052, i64 %a1, i64 %t6068, i64 %t6069, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6076 = or i64 %t6038, %a1
  %t6077 = and i64 %t6076, 7
  %t6078 = icmp eq i64 %t6077, 0
  br i1 %t6078, label %fixfast1261, label %fixslow1262
fixfast1261:
  %t6079 = icmp slt i64 %t6038, %a1
  %t6080 = select i1 %t6079, i64 257, i64 1
  br label %fixmerge1263
fixslow1262:
  %t6081 = call i64 @rt_lt(i64 %t6038, i64 %a1)
  br label %fixmerge1263
fixmerge1263:
  %t6082 = phi i64 [ %t6080, %fixfast1261 ], [ %t6081, %fixslow1262 ]
  %t6083 = icmp ne i64 %t6082, 1
  br i1 %t6083, label %then1264, label %else1265
then1264:
  %t6084 = call ptr @rt_alloc_words(i64 6)
  %t6085 = ptrtoint ptr %t6084 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_995" to i64), ptr %t6084
  %t6086 = or i64 %t6085, 4
  %t6087 = getelementptr i64, ptr %t6084, i64 1
  store i64 %a0, ptr %t6087
  %t6088 = getelementptr i64, ptr %t6084, i64 2
  store i64 %a1, ptr %t6088
  %t6089 = getelementptr i64, ptr %t6084, i64 3
  store i64 %a2, ptr %t6089
  %t6090 = getelementptr i64, ptr %t6084, i64 4
  store i64 %t6038, ptr %t6090
  %t6091 = getelementptr i64, ptr %t6084, i64 5
  store i64 %t6086, ptr %t6091
  %t6092 = or i64 %t6044, %t6038
  %t6093 = and i64 %t6092, 7
  %t6094 = icmp eq i64 %t6093, 0
  br i1 %t6094, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t6095 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6044, i64 %t6038)
  %t6096 = extractvalue {i64, i1} %t6095, 0
  %t6097 = extractvalue {i64, i1} %t6095, 1
  br i1 %t6097, label %fixslow1267, label %fixmerge1268
fixslow1267:
  %t6098 = call i64 @rt_sub(i64 %t6044, i64 %t6038)
  br label %fixmerge1268
fixmerge1268:
  %t6099 = phi i64 [ %t6096, %fixfast1266 ], [ %t6098, %fixslow1267 ]
  %t6100 = or i64 %t6099, 8
  %t6101 = and i64 %t6100, 7
  %t6102 = icmp eq i64 %t6101, 0
  br i1 %t6102, label %fixfast1269, label %fixslow1270
fixfast1269:
  %t6103 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6099, i64 8)
  %t6104 = extractvalue {i64, i1} %t6103, 0
  %t6105 = extractvalue {i64, i1} %t6103, 1
  br i1 %t6105, label %fixslow1270, label %fixmerge1271
fixslow1270:
  %t6106 = call i64 @rt_sub(i64 %t6099, i64 8)
  br label %fixmerge1271
fixmerge1271:
  %t6107 = phi i64 [ %t6104, %fixfast1269 ], [ %t6106, %fixslow1270 ]
  %t6108 = musttail call fastcc i64 @"scheme.base:code_995"(i64 %t6086, i64 1, i64 %t6107, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6108
else1265:
  %t6109 = call ptr @rt_alloc_words(i64 7)
  %t6110 = ptrtoint ptr %t6109 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_997" to i64), ptr %t6109
  %t6111 = or i64 %t6110, 4
  %t6112 = getelementptr i64, ptr %t6109, i64 1
  store i64 %t6044, ptr %t6112
  %t6113 = getelementptr i64, ptr %t6109, i64 2
  store i64 %t6038, ptr %t6113
  %t6114 = getelementptr i64, ptr %t6109, i64 3
  store i64 %a0, ptr %t6114
  %t6115 = getelementptr i64, ptr %t6109, i64 4
  store i64 %a1, ptr %t6115
  %t6116 = getelementptr i64, ptr %t6109, i64 5
  store i64 %a2, ptr %t6116
  %t6117 = getelementptr i64, ptr %t6109, i64 6
  store i64 %t6111, ptr %t6117
  %t6118 = musttail call fastcc i64 @"scheme.base:code_997"(i64 %t6111, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6118
}

define fastcc i64 @"scheme.base:code_1012"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6123 = icmp eq i64 %argc, 1
  br i1 %t6123, label %argok1273, label %arityerr1272
arityerr1272:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1273:
  %t6124 = and i64 %self, -8
  %t6125 = inttoptr i64 %t6124 to ptr
  %t6126 = getelementptr i64, ptr %t6125, i64 1
  %t6127 = load i64, ptr %t6126
  %t6128 = or i64 %a0, %t6127
  %t6129 = and i64 %t6128, 7
  %t6130 = icmp eq i64 %t6129, 0
  br i1 %t6130, label %fixfast1274, label %fixslow1275
fixfast1274:
  %t6131 = icmp eq i64 %a0, %t6127
  %t6132 = select i1 %t6131, i64 257, i64 1
  br label %fixmerge1276
fixslow1275:
  %t6133 = call i64 @rt_num_eq(i64 %a0, i64 %t6127)
  br label %fixmerge1276
fixmerge1276:
  %t6134 = phi i64 [ %t6132, %fixfast1274 ], [ %t6133, %fixslow1275 ]
  %t6135 = icmp ne i64 %t6134, 1
  br i1 %t6135, label %then1277, label %else1278
then1277:
  %t6136 = and i64 %self, -8
  %t6137 = inttoptr i64 %t6136 to ptr
  %t6138 = getelementptr i64, ptr %t6137, i64 2
  %t6139 = load i64, ptr %t6138
  ret i64 %t6139
else1278:
  %t6140 = and i64 %self, -8
  %t6141 = inttoptr i64 %t6140 to ptr
  %t6142 = getelementptr i64, ptr %t6141, i64 2
  %t6143 = load i64, ptr %t6142
  %t6144 = and i64 %self, -8
  %t6145 = inttoptr i64 %t6144 to ptr
  %t6146 = getelementptr i64, ptr %t6145, i64 3
  %t6147 = load i64, ptr %t6146
  %t6148 = or i64 %a0, %t6147
  %t6149 = and i64 %t6148, 7
  %t6150 = icmp eq i64 %t6149, 0
  br i1 %t6150, label %fixfast1279, label %fixslow1280
fixfast1279:
  %t6151 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6147)
  %t6152 = extractvalue {i64, i1} %t6151, 0
  %t6153 = extractvalue {i64, i1} %t6151, 1
  br i1 %t6153, label %fixslow1280, label %fixmerge1281
fixslow1280:
  %t6154 = call i64 @rt_sub(i64 %a0, i64 %t6147)
  br label %fixmerge1281
fixmerge1281:
  %t6155 = phi i64 [ %t6152, %fixfast1279 ], [ %t6154, %fixslow1280 ]
  %t6156 = and i64 %self, -8
  %t6157 = inttoptr i64 %t6156 to ptr
  %t6158 = getelementptr i64, ptr %t6157, i64 4
  %t6159 = load i64, ptr %t6158
  %t6160 = call i64 @rt_bytevector_u8_ref(i64 %t6159, i64 %a0)
  %t6161 = call i64 @rt_bytevector_u8_set(i64 %t6143, i64 %t6155, i64 %t6160)
  %t6162 = or i64 %a0, 8
  %t6163 = and i64 %t6162, 7
  %t6164 = icmp eq i64 %t6163, 0
  br i1 %t6164, label %fixfast1282, label %fixslow1283
fixfast1282:
  %t6165 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6166 = extractvalue {i64, i1} %t6165, 0
  %t6167 = extractvalue {i64, i1} %t6165, 1
  br i1 %t6167, label %fixslow1283, label %fixmerge1284
fixslow1283:
  %t6168 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1284
fixmerge1284:
  %t6169 = phi i64 [ %t6166, %fixfast1282 ], [ %t6168, %fixslow1283 ]
  %t6170 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %self, i64 1, i64 %t6169, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6170
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6171 = icmp sge i64 %argc, 1
  br i1 %t6171, label %argok1286, label %arityerr1285
arityerr1285:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1286:
  %t6172 = call ptr @rt_alloc_words(i64 8)
  %t6173 = getelementptr i64, ptr %t6172, i64 0
  store i64 %a0, ptr %t6173
  %t6174 = getelementptr i64, ptr %t6172, i64 1
  store i64 %a1, ptr %t6174
  %t6175 = getelementptr i64, ptr %t6172, i64 2
  store i64 %a2, ptr %t6175
  %t6176 = getelementptr i64, ptr %t6172, i64 3
  store i64 %a3, ptr %t6176
  %t6177 = getelementptr i64, ptr %t6172, i64 4
  store i64 %a4, ptr %t6177
  %t6178 = getelementptr i64, ptr %t6172, i64 5
  store i64 %a5, ptr %t6178
  %t6179 = getelementptr i64, ptr %t6172, i64 6
  store i64 %a6, ptr %t6179
  %t6180 = getelementptr i64, ptr %t6172, i64 7
  store i64 %a7, ptr %t6180
  %t6181 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t6172, ptr %overflow)
  %t6182 = call i64 @rt_bytevector_length(i64 %a0)
  %t6183 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6183)
  %t6184 = and i64 %t6183, -8
  %t6185 = inttoptr i64 %t6184 to ptr
  %t6186 = load i64, ptr %t6185
  %t6187 = inttoptr i64 %t6186 to ptr
  %t6188 = call fastcc i64%t6187(i64 %t6183, i64 1, i64 %t6181, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6189 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6189)
  %t6190 = and i64 %t6189, -8
  %t6191 = inttoptr i64 %t6190 to ptr
  %t6192 = load i64, ptr %t6191
  %t6193 = inttoptr i64 %t6192 to ptr
  %t6194 = call fastcc i64%t6193(i64 %t6189, i64 2, i64 %t6181, i64 %t6182, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6195 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6196 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6196)
  %t6197 = and i64 %t6196, -8
  %t6198 = inttoptr i64 %t6197 to ptr
  %t6199 = load i64, ptr %t6198
  %t6200 = inttoptr i64 %t6199 to ptr
  %t6201 = call fastcc i64%t6200(i64 %t6196, i64 4, i64 %t6195, i64 %t6188, i64 %t6194, i64 %t6182, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6202 = or i64 %t6194, %t6188
  %t6203 = and i64 %t6202, 7
  %t6204 = icmp eq i64 %t6203, 0
  br i1 %t6204, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t6205 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6194, i64 %t6188)
  %t6206 = extractvalue {i64, i1} %t6205, 0
  %t6207 = extractvalue {i64, i1} %t6205, 1
  br i1 %t6207, label %fixslow1288, label %fixmerge1289
fixslow1288:
  %t6208 = call i64 @rt_sub(i64 %t6194, i64 %t6188)
  br label %fixmerge1289
fixmerge1289:
  %t6209 = phi i64 [ %t6206, %fixfast1287 ], [ %t6208, %fixslow1288 ]
  %t6210 = call i64 @rt_make_bytevector(i64 %t6209, i64 0)
  %t6211 = call ptr @rt_alloc_words(i64 6)
  %t6212 = ptrtoint ptr %t6211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1012" to i64), ptr %t6211
  %t6213 = or i64 %t6212, 4
  %t6214 = getelementptr i64, ptr %t6211, i64 1
  store i64 %t6194, ptr %t6214
  %t6215 = getelementptr i64, ptr %t6211, i64 2
  store i64 %t6210, ptr %t6215
  %t6216 = getelementptr i64, ptr %t6211, i64 3
  store i64 %t6188, ptr %t6216
  %t6217 = getelementptr i64, ptr %t6211, i64 4
  store i64 %a0, ptr %t6217
  %t6218 = getelementptr i64, ptr %t6211, i64 5
  store i64 %t6213, ptr %t6218
  %t6219 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %t6213, i64 1, i64 %t6188, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6219
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6220 = call i64 @rt_bytevector_length(i64 %a0)
  %t6221 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6221)
  %t6222 = and i64 %t6221, -8
  %t6223 = inttoptr i64 %t6222 to ptr
  %t6224 = load i64, ptr %t6223
  %t6225 = inttoptr i64 %t6224 to ptr
  %t6226 = call fastcc i64%t6225(i64 %t6221, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6227 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6227)
  %t6228 = and i64 %t6227, -8
  %t6229 = inttoptr i64 %t6228 to ptr
  %t6230 = load i64, ptr %t6229
  %t6231 = inttoptr i64 %t6230 to ptr
  %t6232 = call fastcc i64%t6231(i64 %t6227, i64 2, i64 2, i64 %t6220, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6233 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6234 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6234)
  %t6235 = and i64 %t6234, -8
  %t6236 = inttoptr i64 %t6235 to ptr
  %t6237 = load i64, ptr %t6236
  %t6238 = inttoptr i64 %t6237 to ptr
  %t6239 = call fastcc i64%t6238(i64 %t6234, i64 4, i64 %t6233, i64 %t6226, i64 %t6232, i64 %t6220, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6240 = or i64 %t6232, %t6226
  %t6241 = and i64 %t6240, 7
  %t6242 = icmp eq i64 %t6241, 0
  br i1 %t6242, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t6243 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6232, i64 %t6226)
  %t6244 = extractvalue {i64, i1} %t6243, 0
  %t6245 = extractvalue {i64, i1} %t6243, 1
  br i1 %t6245, label %fixslow1291, label %fixmerge1292
fixslow1291:
  %t6246 = call i64 @rt_sub(i64 %t6232, i64 %t6226)
  br label %fixmerge1292
fixmerge1292:
  %t6247 = phi i64 [ %t6244, %fixfast1290 ], [ %t6246, %fixslow1291 ]
  %t6248 = call i64 @rt_make_bytevector(i64 %t6247, i64 0)
  %t6249 = call ptr @rt_alloc_words(i64 6)
  %t6250 = ptrtoint ptr %t6249 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1012" to i64), ptr %t6249
  %t6251 = or i64 %t6250, 4
  %t6252 = getelementptr i64, ptr %t6249, i64 1
  store i64 %t6232, ptr %t6252
  %t6253 = getelementptr i64, ptr %t6249, i64 2
  store i64 %t6248, ptr %t6253
  %t6254 = getelementptr i64, ptr %t6249, i64 3
  store i64 %t6226, ptr %t6254
  %t6255 = getelementptr i64, ptr %t6249, i64 4
  store i64 %a0, ptr %t6255
  %t6256 = getelementptr i64, ptr %t6249, i64 5
  store i64 %t6251, ptr %t6256
  %t6257 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %t6251, i64 1, i64 %t6226, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6257
}

define fastcc i64 @"scheme.base:code_1038"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6262 = icmp eq i64 %argc, 1
  br i1 %t6262, label %argok1294, label %arityerr1293
arityerr1293:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1294:
  %t6263 = or i64 %a0, 0
  %t6264 = and i64 %t6263, 7
  %t6265 = icmp eq i64 %t6264, 0
  br i1 %t6265, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t6266 = icmp slt i64 %a0, 0
  %t6267 = select i1 %t6266, i64 257, i64 1
  br label %fixmerge1297
fixslow1296:
  %t6268 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1297
fixmerge1297:
  %t6269 = phi i64 [ %t6267, %fixfast1295 ], [ %t6268, %fixslow1296 ]
  %t6270 = icmp ne i64 %t6269, 1
  br i1 %t6270, label %then1298, label %else1299
then1298:
  %t6271 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6271)
  %t6272 = and i64 %t6271, -8
  %t6273 = inttoptr i64 %t6272 to ptr
  %t6274 = load i64, ptr %t6273
  %t6275 = inttoptr i64 %t6274 to ptr
  %t6276 = musttail call fastcc i64 %t6275(i64 %t6271, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6276
else1299:
  %t6277 = and i64 %self, -8
  %t6278 = inttoptr i64 %t6277 to ptr
  %t6279 = getelementptr i64, ptr %t6278, i64 1
  %t6280 = load i64, ptr %t6279
  %t6281 = and i64 %self, -8
  %t6282 = inttoptr i64 %t6281 to ptr
  %t6283 = getelementptr i64, ptr %t6282, i64 2
  %t6284 = load i64, ptr %t6283
  %t6285 = or i64 %t6284, %a0
  %t6286 = and i64 %t6285, 7
  %t6287 = icmp eq i64 %t6286, 0
  br i1 %t6287, label %fixfast1300, label %fixslow1301
fixfast1300:
  %t6288 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6284, i64 %a0)
  %t6289 = extractvalue {i64, i1} %t6288, 0
  %t6290 = extractvalue {i64, i1} %t6288, 1
  br i1 %t6290, label %fixslow1301, label %fixmerge1302
fixslow1301:
  %t6291 = call i64 @rt_add(i64 %t6284, i64 %a0)
  br label %fixmerge1302
fixmerge1302:
  %t6292 = phi i64 [ %t6289, %fixfast1300 ], [ %t6291, %fixslow1301 ]
  %t6293 = and i64 %self, -8
  %t6294 = inttoptr i64 %t6293 to ptr
  %t6295 = getelementptr i64, ptr %t6294, i64 3
  %t6296 = load i64, ptr %t6295
  %t6297 = and i64 %self, -8
  %t6298 = inttoptr i64 %t6297 to ptr
  %t6299 = getelementptr i64, ptr %t6298, i64 4
  %t6300 = load i64, ptr %t6299
  %t6301 = or i64 %t6300, %a0
  %t6302 = and i64 %t6301, 7
  %t6303 = icmp eq i64 %t6302, 0
  br i1 %t6303, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t6304 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6300, i64 %a0)
  %t6305 = extractvalue {i64, i1} %t6304, 0
  %t6306 = extractvalue {i64, i1} %t6304, 1
  br i1 %t6306, label %fixslow1304, label %fixmerge1305
fixslow1304:
  %t6307 = call i64 @rt_add(i64 %t6300, i64 %a0)
  br label %fixmerge1305
fixmerge1305:
  %t6308 = phi i64 [ %t6305, %fixfast1303 ], [ %t6307, %fixslow1304 ]
  %t6309 = call i64 @rt_bytevector_u8_ref(i64 %t6296, i64 %t6308)
  %t6310 = call i64 @rt_bytevector_u8_set(i64 %t6280, i64 %t6292, i64 %t6309)
  %t6311 = or i64 %a0, 8
  %t6312 = and i64 %t6311, 7
  %t6313 = icmp eq i64 %t6312, 0
  br i1 %t6313, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t6314 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t6315 = extractvalue {i64, i1} %t6314, 0
  %t6316 = extractvalue {i64, i1} %t6314, 1
  br i1 %t6316, label %fixslow1307, label %fixmerge1308
fixslow1307:
  %t6317 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1308
fixmerge1308:
  %t6318 = phi i64 [ %t6315, %fixfast1306 ], [ %t6317, %fixslow1307 ]
  %t6319 = musttail call fastcc i64 @"scheme.base:code_1038"(i64 %self, i64 1, i64 %t6318, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6319
}

define fastcc i64 @"scheme.base:code_1040"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6320 = icmp eq i64 %argc, 1
  br i1 %t6320, label %argok1310, label %arityerr1309
arityerr1309:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1310:
  %t6321 = and i64 %self, -8
  %t6322 = inttoptr i64 %t6321 to ptr
  %t6323 = getelementptr i64, ptr %t6322, i64 1
  %t6324 = load i64, ptr %t6323
  %t6325 = and i64 %self, -8
  %t6326 = inttoptr i64 %t6325 to ptr
  %t6327 = getelementptr i64, ptr %t6326, i64 2
  %t6328 = load i64, ptr %t6327
  %t6329 = or i64 %t6324, %t6328
  %t6330 = and i64 %t6329, 7
  %t6331 = icmp eq i64 %t6330, 0
  br i1 %t6331, label %fixfast1311, label %fixslow1312
fixfast1311:
  %t6332 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6324, i64 %t6328)
  %t6333 = extractvalue {i64, i1} %t6332, 0
  %t6334 = extractvalue {i64, i1} %t6332, 1
  br i1 %t6334, label %fixslow1312, label %fixmerge1313
fixslow1312:
  %t6335 = call i64 @rt_sub(i64 %t6324, i64 %t6328)
  br label %fixmerge1313
fixmerge1313:
  %t6336 = phi i64 [ %t6333, %fixfast1311 ], [ %t6335, %fixslow1312 ]
  %t6337 = or i64 %a0, %t6336
  %t6338 = and i64 %t6337, 7
  %t6339 = icmp eq i64 %t6338, 0
  br i1 %t6339, label %fixfast1314, label %fixslow1315
fixfast1314:
  %t6340 = icmp eq i64 %a0, %t6336
  %t6341 = select i1 %t6340, i64 257, i64 1
  br label %fixmerge1316
fixslow1315:
  %t6342 = call i64 @rt_num_eq(i64 %a0, i64 %t6336)
  br label %fixmerge1316
fixmerge1316:
  %t6343 = phi i64 [ %t6341, %fixfast1314 ], [ %t6342, %fixslow1315 ]
  %t6344 = icmp ne i64 %t6343, 1
  br i1 %t6344, label %then1317, label %else1318
then1317:
  %t6345 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6345)
  %t6346 = and i64 %t6345, -8
  %t6347 = inttoptr i64 %t6346 to ptr
  %t6348 = load i64, ptr %t6347
  %t6349 = inttoptr i64 %t6348 to ptr
  %t6350 = musttail call fastcc i64 %t6349(i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6350
else1318:
  %t6351 = and i64 %self, -8
  %t6352 = inttoptr i64 %t6351 to ptr
  %t6353 = getelementptr i64, ptr %t6352, i64 3
  %t6354 = load i64, ptr %t6353
  %t6355 = and i64 %self, -8
  %t6356 = inttoptr i64 %t6355 to ptr
  %t6357 = getelementptr i64, ptr %t6356, i64 4
  %t6358 = load i64, ptr %t6357
  %t6359 = or i64 %t6358, %a0
  %t6360 = and i64 %t6359, 7
  %t6361 = icmp eq i64 %t6360, 0
  br i1 %t6361, label %fixfast1319, label %fixslow1320
fixfast1319:
  %t6362 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6358, i64 %a0)
  %t6363 = extractvalue {i64, i1} %t6362, 0
  %t6364 = extractvalue {i64, i1} %t6362, 1
  br i1 %t6364, label %fixslow1320, label %fixmerge1321
fixslow1320:
  %t6365 = call i64 @rt_add(i64 %t6358, i64 %a0)
  br label %fixmerge1321
fixmerge1321:
  %t6366 = phi i64 [ %t6363, %fixfast1319 ], [ %t6365, %fixslow1320 ]
  %t6367 = and i64 %self, -8
  %t6368 = inttoptr i64 %t6367 to ptr
  %t6369 = getelementptr i64, ptr %t6368, i64 5
  %t6370 = load i64, ptr %t6369
  %t6371 = and i64 %self, -8
  %t6372 = inttoptr i64 %t6371 to ptr
  %t6373 = getelementptr i64, ptr %t6372, i64 2
  %t6374 = load i64, ptr %t6373
  %t6375 = or i64 %t6374, %a0
  %t6376 = and i64 %t6375, 7
  %t6377 = icmp eq i64 %t6376, 0
  br i1 %t6377, label %fixfast1322, label %fixslow1323
fixfast1322:
  %t6378 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6374, i64 %a0)
  %t6379 = extractvalue {i64, i1} %t6378, 0
  %t6380 = extractvalue {i64, i1} %t6378, 1
  br i1 %t6380, label %fixslow1323, label %fixmerge1324
fixslow1323:
  %t6381 = call i64 @rt_add(i64 %t6374, i64 %a0)
  br label %fixmerge1324
fixmerge1324:
  %t6382 = phi i64 [ %t6379, %fixfast1322 ], [ %t6381, %fixslow1323 ]
  %t6383 = call i64 @rt_bytevector_u8_ref(i64 %t6370, i64 %t6382)
  %t6384 = call i64 @rt_bytevector_u8_set(i64 %t6354, i64 %t6366, i64 %t6383)
  %t6385 = or i64 %a0, 8
  %t6386 = and i64 %t6385, 7
  %t6387 = icmp eq i64 %t6386, 0
  br i1 %t6387, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t6388 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6389 = extractvalue {i64, i1} %t6388, 0
  %t6390 = extractvalue {i64, i1} %t6388, 1
  br i1 %t6390, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t6391 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1327
fixmerge1327:
  %t6392 = phi i64 [ %t6389, %fixfast1325 ], [ %t6391, %fixslow1326 ]
  %t6393 = musttail call fastcc i64 @"scheme.base:code_1040"(i64 %self, i64 1, i64 %t6392, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6393
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6394 = icmp sge i64 %argc, 3
  br i1 %t6394, label %argok1329, label %arityerr1328
arityerr1328:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1329:
  %t6395 = call ptr @rt_alloc_words(i64 8)
  %t6396 = getelementptr i64, ptr %t6395, i64 0
  store i64 %a0, ptr %t6396
  %t6397 = getelementptr i64, ptr %t6395, i64 1
  store i64 %a1, ptr %t6397
  %t6398 = getelementptr i64, ptr %t6395, i64 2
  store i64 %a2, ptr %t6398
  %t6399 = getelementptr i64, ptr %t6395, i64 3
  store i64 %a3, ptr %t6399
  %t6400 = getelementptr i64, ptr %t6395, i64 4
  store i64 %a4, ptr %t6400
  %t6401 = getelementptr i64, ptr %t6395, i64 5
  store i64 %a5, ptr %t6401
  %t6402 = getelementptr i64, ptr %t6395, i64 6
  store i64 %a6, ptr %t6402
  %t6403 = getelementptr i64, ptr %t6395, i64 7
  store i64 %a7, ptr %t6403
  %t6404 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t6395, ptr %overflow)
  %t6405 = call i64 @rt_bytevector_length(i64 %a2)
  %t6406 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6406)
  %t6407 = and i64 %t6406, -8
  %t6408 = inttoptr i64 %t6407 to ptr
  %t6409 = load i64, ptr %t6408
  %t6410 = inttoptr i64 %t6409 to ptr
  %t6411 = call fastcc i64%t6410(i64 %t6406, i64 1, i64 %t6404, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6412 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6412)
  %t6413 = and i64 %t6412, -8
  %t6414 = inttoptr i64 %t6413 to ptr
  %t6415 = load i64, ptr %t6414
  %t6416 = inttoptr i64 %t6415 to ptr
  %t6417 = call fastcc i64%t6416(i64 %t6412, i64 2, i64 %t6404, i64 %t6405, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6418 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6419 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6419)
  %t6420 = and i64 %t6419, -8
  %t6421 = inttoptr i64 %t6420 to ptr
  %t6422 = load i64, ptr %t6421
  %t6423 = inttoptr i64 %t6422 to ptr
  %t6424 = call fastcc i64%t6423(i64 %t6419, i64 4, i64 %t6418, i64 %t6411, i64 %t6417, i64 %t6405, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6425 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6426 = or i64 %t6417, %t6411
  %t6427 = and i64 %t6426, 7
  %t6428 = icmp eq i64 %t6427, 0
  br i1 %t6428, label %fixfast1330, label %fixslow1331
fixfast1330:
  %t6429 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6417, i64 %t6411)
  %t6430 = extractvalue {i64, i1} %t6429, 0
  %t6431 = extractvalue {i64, i1} %t6429, 1
  br i1 %t6431, label %fixslow1331, label %fixmerge1332
fixslow1331:
  %t6432 = call i64 @rt_sub(i64 %t6417, i64 %t6411)
  br label %fixmerge1332
fixmerge1332:
  %t6433 = phi i64 [ %t6430, %fixfast1330 ], [ %t6432, %fixslow1331 ]
  %t6434 = or i64 %a1, %t6433
  %t6435 = and i64 %t6434, 7
  %t6436 = icmp eq i64 %t6435, 0
  br i1 %t6436, label %fixfast1333, label %fixslow1334
fixfast1333:
  %t6437 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6433)
  %t6438 = extractvalue {i64, i1} %t6437, 0
  %t6439 = extractvalue {i64, i1} %t6437, 1
  br i1 %t6439, label %fixslow1334, label %fixmerge1335
fixslow1334:
  %t6440 = call i64 @rt_add(i64 %a1, i64 %t6433)
  br label %fixmerge1335
fixmerge1335:
  %t6441 = phi i64 [ %t6438, %fixfast1333 ], [ %t6440, %fixslow1334 ]
  %t6442 = call i64 @rt_bytevector_length(i64 %a0)
  %t6443 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6443)
  %t6444 = and i64 %t6443, -8
  %t6445 = inttoptr i64 %t6444 to ptr
  %t6446 = load i64, ptr %t6445
  %t6447 = inttoptr i64 %t6446 to ptr
  %t6448 = call fastcc i64%t6447(i64 %t6443, i64 4, i64 %t6425, i64 %a1, i64 %t6441, i64 %t6442, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6449 = or i64 %t6411, %a1
  %t6450 = and i64 %t6449, 7
  %t6451 = icmp eq i64 %t6450, 0
  br i1 %t6451, label %fixfast1336, label %fixslow1337
fixfast1336:
  %t6452 = icmp slt i64 %t6411, %a1
  %t6453 = select i1 %t6452, i64 257, i64 1
  br label %fixmerge1338
fixslow1337:
  %t6454 = call i64 @rt_lt(i64 %t6411, i64 %a1)
  br label %fixmerge1338
fixmerge1338:
  %t6455 = phi i64 [ %t6453, %fixfast1336 ], [ %t6454, %fixslow1337 ]
  %t6456 = icmp ne i64 %t6455, 1
  br i1 %t6456, label %then1339, label %else1340
then1339:
  %t6457 = call ptr @rt_alloc_words(i64 6)
  %t6458 = ptrtoint ptr %t6457 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1038" to i64), ptr %t6457
  %t6459 = or i64 %t6458, 4
  %t6460 = getelementptr i64, ptr %t6457, i64 1
  store i64 %a0, ptr %t6460
  %t6461 = getelementptr i64, ptr %t6457, i64 2
  store i64 %a1, ptr %t6461
  %t6462 = getelementptr i64, ptr %t6457, i64 3
  store i64 %a2, ptr %t6462
  %t6463 = getelementptr i64, ptr %t6457, i64 4
  store i64 %t6411, ptr %t6463
  %t6464 = getelementptr i64, ptr %t6457, i64 5
  store i64 %t6459, ptr %t6464
  %t6465 = or i64 %t6417, %t6411
  %t6466 = and i64 %t6465, 7
  %t6467 = icmp eq i64 %t6466, 0
  br i1 %t6467, label %fixfast1341, label %fixslow1342
fixfast1341:
  %t6468 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6417, i64 %t6411)
  %t6469 = extractvalue {i64, i1} %t6468, 0
  %t6470 = extractvalue {i64, i1} %t6468, 1
  br i1 %t6470, label %fixslow1342, label %fixmerge1343
fixslow1342:
  %t6471 = call i64 @rt_sub(i64 %t6417, i64 %t6411)
  br label %fixmerge1343
fixmerge1343:
  %t6472 = phi i64 [ %t6469, %fixfast1341 ], [ %t6471, %fixslow1342 ]
  %t6473 = or i64 %t6472, 8
  %t6474 = and i64 %t6473, 7
  %t6475 = icmp eq i64 %t6474, 0
  br i1 %t6475, label %fixfast1344, label %fixslow1345
fixfast1344:
  %t6476 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6472, i64 8)
  %t6477 = extractvalue {i64, i1} %t6476, 0
  %t6478 = extractvalue {i64, i1} %t6476, 1
  br i1 %t6478, label %fixslow1345, label %fixmerge1346
fixslow1345:
  %t6479 = call i64 @rt_sub(i64 %t6472, i64 8)
  br label %fixmerge1346
fixmerge1346:
  %t6480 = phi i64 [ %t6477, %fixfast1344 ], [ %t6479, %fixslow1345 ]
  %t6481 = musttail call fastcc i64 @"scheme.base:code_1038"(i64 %t6459, i64 1, i64 %t6480, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6481
else1340:
  %t6482 = call ptr @rt_alloc_words(i64 7)
  %t6483 = ptrtoint ptr %t6482 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1040" to i64), ptr %t6482
  %t6484 = or i64 %t6483, 4
  %t6485 = getelementptr i64, ptr %t6482, i64 1
  store i64 %t6417, ptr %t6485
  %t6486 = getelementptr i64, ptr %t6482, i64 2
  store i64 %t6411, ptr %t6486
  %t6487 = getelementptr i64, ptr %t6482, i64 3
  store i64 %a0, ptr %t6487
  %t6488 = getelementptr i64, ptr %t6482, i64 4
  store i64 %a1, ptr %t6488
  %t6489 = getelementptr i64, ptr %t6482, i64 5
  store i64 %a2, ptr %t6489
  %t6490 = getelementptr i64, ptr %t6482, i64 6
  store i64 %t6484, ptr %t6490
  %t6491 = musttail call fastcc i64 @"scheme.base:code_1040"(i64 %t6484, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6491
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6492 = call i64 @rt_bytevector_length(i64 %a2)
  %t6493 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6493)
  %t6494 = and i64 %t6493, -8
  %t6495 = inttoptr i64 %t6494 to ptr
  %t6496 = load i64, ptr %t6495
  %t6497 = inttoptr i64 %t6496 to ptr
  %t6498 = call fastcc i64%t6497(i64 %t6493, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6499 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6499)
  %t6500 = and i64 %t6499, -8
  %t6501 = inttoptr i64 %t6500 to ptr
  %t6502 = load i64, ptr %t6501
  %t6503 = inttoptr i64 %t6502 to ptr
  %t6504 = call fastcc i64%t6503(i64 %t6499, i64 2, i64 2, i64 %t6492, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6505 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6506 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6506)
  %t6507 = and i64 %t6506, -8
  %t6508 = inttoptr i64 %t6507 to ptr
  %t6509 = load i64, ptr %t6508
  %t6510 = inttoptr i64 %t6509 to ptr
  %t6511 = call fastcc i64%t6510(i64 %t6506, i64 4, i64 %t6505, i64 %t6498, i64 %t6504, i64 %t6492, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6512 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6513 = or i64 %t6504, %t6498
  %t6514 = and i64 %t6513, 7
  %t6515 = icmp eq i64 %t6514, 0
  br i1 %t6515, label %fixfast1347, label %fixslow1348
fixfast1347:
  %t6516 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6504, i64 %t6498)
  %t6517 = extractvalue {i64, i1} %t6516, 0
  %t6518 = extractvalue {i64, i1} %t6516, 1
  br i1 %t6518, label %fixslow1348, label %fixmerge1349
fixslow1348:
  %t6519 = call i64 @rt_sub(i64 %t6504, i64 %t6498)
  br label %fixmerge1349
fixmerge1349:
  %t6520 = phi i64 [ %t6517, %fixfast1347 ], [ %t6519, %fixslow1348 ]
  %t6521 = or i64 %a1, %t6520
  %t6522 = and i64 %t6521, 7
  %t6523 = icmp eq i64 %t6522, 0
  br i1 %t6523, label %fixfast1350, label %fixslow1351
fixfast1350:
  %t6524 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6520)
  %t6525 = extractvalue {i64, i1} %t6524, 0
  %t6526 = extractvalue {i64, i1} %t6524, 1
  br i1 %t6526, label %fixslow1351, label %fixmerge1352
fixslow1351:
  %t6527 = call i64 @rt_add(i64 %a1, i64 %t6520)
  br label %fixmerge1352
fixmerge1352:
  %t6528 = phi i64 [ %t6525, %fixfast1350 ], [ %t6527, %fixslow1351 ]
  %t6529 = call i64 @rt_bytevector_length(i64 %a0)
  %t6530 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6530)
  %t6531 = and i64 %t6530, -8
  %t6532 = inttoptr i64 %t6531 to ptr
  %t6533 = load i64, ptr %t6532
  %t6534 = inttoptr i64 %t6533 to ptr
  %t6535 = call fastcc i64%t6534(i64 %t6530, i64 4, i64 %t6512, i64 %a1, i64 %t6528, i64 %t6529, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6536 = or i64 %t6498, %a1
  %t6537 = and i64 %t6536, 7
  %t6538 = icmp eq i64 %t6537, 0
  br i1 %t6538, label %fixfast1353, label %fixslow1354
fixfast1353:
  %t6539 = icmp slt i64 %t6498, %a1
  %t6540 = select i1 %t6539, i64 257, i64 1
  br label %fixmerge1355
fixslow1354:
  %t6541 = call i64 @rt_lt(i64 %t6498, i64 %a1)
  br label %fixmerge1355
fixmerge1355:
  %t6542 = phi i64 [ %t6540, %fixfast1353 ], [ %t6541, %fixslow1354 ]
  %t6543 = icmp ne i64 %t6542, 1
  br i1 %t6543, label %then1356, label %else1357
then1356:
  %t6544 = call ptr @rt_alloc_words(i64 6)
  %t6545 = ptrtoint ptr %t6544 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1038" to i64), ptr %t6544
  %t6546 = or i64 %t6545, 4
  %t6547 = getelementptr i64, ptr %t6544, i64 1
  store i64 %a0, ptr %t6547
  %t6548 = getelementptr i64, ptr %t6544, i64 2
  store i64 %a1, ptr %t6548
  %t6549 = getelementptr i64, ptr %t6544, i64 3
  store i64 %a2, ptr %t6549
  %t6550 = getelementptr i64, ptr %t6544, i64 4
  store i64 %t6498, ptr %t6550
  %t6551 = getelementptr i64, ptr %t6544, i64 5
  store i64 %t6546, ptr %t6551
  %t6552 = or i64 %t6504, %t6498
  %t6553 = and i64 %t6552, 7
  %t6554 = icmp eq i64 %t6553, 0
  br i1 %t6554, label %fixfast1358, label %fixslow1359
fixfast1358:
  %t6555 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6504, i64 %t6498)
  %t6556 = extractvalue {i64, i1} %t6555, 0
  %t6557 = extractvalue {i64, i1} %t6555, 1
  br i1 %t6557, label %fixslow1359, label %fixmerge1360
fixslow1359:
  %t6558 = call i64 @rt_sub(i64 %t6504, i64 %t6498)
  br label %fixmerge1360
fixmerge1360:
  %t6559 = phi i64 [ %t6556, %fixfast1358 ], [ %t6558, %fixslow1359 ]
  %t6560 = or i64 %t6559, 8
  %t6561 = and i64 %t6560, 7
  %t6562 = icmp eq i64 %t6561, 0
  br i1 %t6562, label %fixfast1361, label %fixslow1362
fixfast1361:
  %t6563 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6559, i64 8)
  %t6564 = extractvalue {i64, i1} %t6563, 0
  %t6565 = extractvalue {i64, i1} %t6563, 1
  br i1 %t6565, label %fixslow1362, label %fixmerge1363
fixslow1362:
  %t6566 = call i64 @rt_sub(i64 %t6559, i64 8)
  br label %fixmerge1363
fixmerge1363:
  %t6567 = phi i64 [ %t6564, %fixfast1361 ], [ %t6566, %fixslow1362 ]
  %t6568 = musttail call fastcc i64 @"scheme.base:code_1038"(i64 %t6546, i64 1, i64 %t6567, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6568
else1357:
  %t6569 = call ptr @rt_alloc_words(i64 7)
  %t6570 = ptrtoint ptr %t6569 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1040" to i64), ptr %t6569
  %t6571 = or i64 %t6570, 4
  %t6572 = getelementptr i64, ptr %t6569, i64 1
  store i64 %t6504, ptr %t6572
  %t6573 = getelementptr i64, ptr %t6569, i64 2
  store i64 %t6498, ptr %t6573
  %t6574 = getelementptr i64, ptr %t6569, i64 3
  store i64 %a0, ptr %t6574
  %t6575 = getelementptr i64, ptr %t6569, i64 4
  store i64 %a1, ptr %t6575
  %t6576 = getelementptr i64, ptr %t6569, i64 5
  store i64 %a2, ptr %t6576
  %t6577 = getelementptr i64, ptr %t6569, i64 6
  store i64 %t6571, ptr %t6577
  %t6578 = musttail call fastcc i64 @"scheme.base:code_1040"(i64 %t6571, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6578
}

define fastcc i64 @"scheme.base:code_1058"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6583 = icmp eq i64 %argc, 1
  br i1 %t6583, label %argok1365, label %arityerr1364
arityerr1364:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1365:
  %t6584 = and i64 %self, -8
  %t6585 = inttoptr i64 %t6584 to ptr
  %t6586 = getelementptr i64, ptr %t6585, i64 1
  %t6587 = load i64, ptr %t6586
  %t6588 = or i64 %a0, %t6587
  %t6589 = and i64 %t6588, 7
  %t6590 = icmp eq i64 %t6589, 0
  br i1 %t6590, label %fixfast1366, label %fixslow1367
fixfast1366:
  %t6591 = icmp eq i64 %a0, %t6587
  %t6592 = select i1 %t6591, i64 257, i64 1
  br label %fixmerge1368
fixslow1367:
  %t6593 = call i64 @rt_num_eq(i64 %a0, i64 %t6587)
  br label %fixmerge1368
fixmerge1368:
  %t6594 = phi i64 [ %t6592, %fixfast1366 ], [ %t6593, %fixslow1367 ]
  %t6595 = icmp ne i64 %t6594, 1
  br i1 %t6595, label %then1369, label %else1370
then1369:
  %t6596 = and i64 %self, -8
  %t6597 = inttoptr i64 %t6596 to ptr
  %t6598 = getelementptr i64, ptr %t6597, i64 3
  %t6599 = load i64, ptr %t6598
  %t6600 = call i64 @rt_cdr(i64 %t6599)
  %t6601 = and i64 %self, -8
  %t6602 = inttoptr i64 %t6601 to ptr
  %t6603 = getelementptr i64, ptr %t6602, i64 4
  %t6604 = load i64, ptr %t6603
  %t6605 = and i64 %self, -8
  %t6606 = inttoptr i64 %t6605 to ptr
  %t6607 = getelementptr i64, ptr %t6606, i64 1
  %t6608 = load i64, ptr %t6607
  %t6609 = or i64 %t6604, %t6608
  %t6610 = and i64 %t6609, 7
  %t6611 = icmp eq i64 %t6610, 0
  br i1 %t6611, label %fixfast1371, label %fixslow1372
fixfast1371:
  %t6612 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6604, i64 %t6608)
  %t6613 = extractvalue {i64, i1} %t6612, 0
  %t6614 = extractvalue {i64, i1} %t6612, 1
  br i1 %t6614, label %fixslow1372, label %fixmerge1373
fixslow1372:
  %t6615 = call i64 @rt_add(i64 %t6604, i64 %t6608)
  br label %fixmerge1373
fixmerge1373:
  %t6616 = phi i64 [ %t6613, %fixfast1371 ], [ %t6615, %fixslow1372 ]
  %t6617 = and i64 %self, -8
  %t6618 = inttoptr i64 %t6617 to ptr
  %t6619 = getelementptr i64, ptr %t6618, i64 2
  %t6620 = load i64, ptr %t6619
  %t6621 = musttail call fastcc i64 @"scheme.base:code_1056"(i64 %t6620, i64 2, i64 %t6600, i64 %t6616, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6621
else1370:
  %t6622 = and i64 %self, -8
  %t6623 = inttoptr i64 %t6622 to ptr
  %t6624 = getelementptr i64, ptr %t6623, i64 5
  %t6625 = load i64, ptr %t6624
  %t6626 = and i64 %self, -8
  %t6627 = inttoptr i64 %t6626 to ptr
  %t6628 = getelementptr i64, ptr %t6627, i64 4
  %t6629 = load i64, ptr %t6628
  %t6630 = or i64 %t6629, %a0
  %t6631 = and i64 %t6630, 7
  %t6632 = icmp eq i64 %t6631, 0
  br i1 %t6632, label %fixfast1374, label %fixslow1375
fixfast1374:
  %t6633 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6629, i64 %a0)
  %t6634 = extractvalue {i64, i1} %t6633, 0
  %t6635 = extractvalue {i64, i1} %t6633, 1
  br i1 %t6635, label %fixslow1375, label %fixmerge1376
fixslow1375:
  %t6636 = call i64 @rt_add(i64 %t6629, i64 %a0)
  br label %fixmerge1376
fixmerge1376:
  %t6637 = phi i64 [ %t6634, %fixfast1374 ], [ %t6636, %fixslow1375 ]
  %t6638 = and i64 %self, -8
  %t6639 = inttoptr i64 %t6638 to ptr
  %t6640 = getelementptr i64, ptr %t6639, i64 6
  %t6641 = load i64, ptr %t6640
  %t6642 = call i64 @rt_bytevector_u8_ref(i64 %t6641, i64 %a0)
  %t6643 = call i64 @rt_bytevector_u8_set(i64 %t6625, i64 %t6637, i64 %t6642)
  %t6644 = or i64 %a0, 8
  %t6645 = and i64 %t6644, 7
  %t6646 = icmp eq i64 %t6645, 0
  br i1 %t6646, label %fixfast1377, label %fixslow1378
fixfast1377:
  %t6647 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6648 = extractvalue {i64, i1} %t6647, 0
  %t6649 = extractvalue {i64, i1} %t6647, 1
  br i1 %t6649, label %fixslow1378, label %fixmerge1379
fixslow1378:
  %t6650 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1379
fixmerge1379:
  %t6651 = phi i64 [ %t6648, %fixfast1377 ], [ %t6650, %fixslow1378 ]
  %t6652 = musttail call fastcc i64 @"scheme.base:code_1058"(i64 %self, i64 1, i64 %t6651, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6652
}

define fastcc i64 @"scheme.base:code_1056"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6653 = icmp eq i64 %argc, 2
  br i1 %t6653, label %argok1381, label %arityerr1380
arityerr1380:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1381:
  %t6654 = call i64 @rt_null_p(i64 %a0)
  %t6655 = icmp ne i64 %t6654, 1
  br i1 %t6655, label %then1382, label %else1383
then1382:
  %t6656 = and i64 %self, -8
  %t6657 = inttoptr i64 %t6656 to ptr
  %t6658 = getelementptr i64, ptr %t6657, i64 1
  %t6659 = load i64, ptr %t6658
  ret i64 %t6659
else1383:
  %t6660 = call i64 @rt_car(i64 %a0)
  %t6661 = call i64 @rt_bytevector_length(i64 %t6660)
  %t6662 = call ptr @rt_alloc_words(i64 8)
  %t6663 = ptrtoint ptr %t6662 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1058" to i64), ptr %t6662
  %t6664 = or i64 %t6663, 4
  %t6665 = getelementptr i64, ptr %t6662, i64 1
  store i64 %t6661, ptr %t6665
  %t6666 = and i64 %self, -8
  %t6667 = inttoptr i64 %t6666 to ptr
  %t6668 = getelementptr i64, ptr %t6667, i64 2
  %t6669 = load i64, ptr %t6668
  %t6670 = getelementptr i64, ptr %t6662, i64 2
  store i64 %t6669, ptr %t6670
  %t6671 = getelementptr i64, ptr %t6662, i64 3
  store i64 %a0, ptr %t6671
  %t6672 = getelementptr i64, ptr %t6662, i64 4
  store i64 %a1, ptr %t6672
  %t6673 = and i64 %self, -8
  %t6674 = inttoptr i64 %t6673 to ptr
  %t6675 = getelementptr i64, ptr %t6674, i64 1
  %t6676 = load i64, ptr %t6675
  %t6677 = getelementptr i64, ptr %t6662, i64 5
  store i64 %t6676, ptr %t6677
  %t6678 = getelementptr i64, ptr %t6662, i64 6
  store i64 %t6660, ptr %t6678
  %t6679 = getelementptr i64, ptr %t6662, i64 7
  store i64 %t6664, ptr %t6679
  %t6680 = musttail call fastcc i64 @"scheme.base:code_1058"(i64 %t6664, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6680
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6681 = icmp sge i64 %argc, 0
  br i1 %t6681, label %argok1385, label %arityerr1384
arityerr1384:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1385:
  %t6682 = call ptr @rt_alloc_words(i64 8)
  %t6683 = getelementptr i64, ptr %t6682, i64 0
  store i64 %a0, ptr %t6683
  %t6684 = getelementptr i64, ptr %t6682, i64 1
  store i64 %a1, ptr %t6684
  %t6685 = getelementptr i64, ptr %t6682, i64 2
  store i64 %a2, ptr %t6685
  %t6686 = getelementptr i64, ptr %t6682, i64 3
  store i64 %a3, ptr %t6686
  %t6687 = getelementptr i64, ptr %t6682, i64 4
  store i64 %a4, ptr %t6687
  %t6688 = getelementptr i64, ptr %t6682, i64 5
  store i64 %a5, ptr %t6688
  %t6689 = getelementptr i64, ptr %t6682, i64 6
  store i64 %a6, ptr %t6689
  %t6690 = getelementptr i64, ptr %t6682, i64 7
  store i64 %a7, ptr %t6690
  %t6691 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6682, ptr %overflow)
  %t6692 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6692)
  %t6693 = and i64 %t6692, -8
  %t6694 = inttoptr i64 %t6693 to ptr
  %t6695 = load i64, ptr %t6694
  %t6696 = inttoptr i64 %t6695 to ptr
  %t6697 = call fastcc i64%t6696(i64 %t6692, i64 1, i64 %t6691, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6698 = call i64 @rt_make_bytevector(i64 %t6697, i64 0)
  %t6699 = call ptr @rt_alloc_words(i64 3)
  %t6700 = ptrtoint ptr %t6699 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1056" to i64), ptr %t6699
  %t6701 = or i64 %t6700, 4
  %t6702 = getelementptr i64, ptr %t6699, i64 1
  store i64 %t6698, ptr %t6702
  %t6703 = getelementptr i64, ptr %t6699, i64 2
  store i64 %t6701, ptr %t6703
  %t6704 = musttail call fastcc i64 @"scheme.base:code_1056"(i64 %t6701, i64 2, i64 %t6691, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6704
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6705 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6705)
  %t6706 = and i64 %t6705, -8
  %t6707 = inttoptr i64 %t6706 to ptr
  %t6708 = load i64, ptr %t6707
  %t6709 = inttoptr i64 %t6708 to ptr
  %t6710 = call fastcc i64%t6709(i64 %t6705, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6711 = call i64 @rt_make_bytevector(i64 %t6710, i64 0)
  %t6712 = call ptr @rt_alloc_words(i64 3)
  %t6713 = ptrtoint ptr %t6712 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1056" to i64), ptr %t6712
  %t6714 = or i64 %t6713, 4
  %t6715 = getelementptr i64, ptr %t6712, i64 1
  store i64 %t6711, ptr %t6715
  %t6716 = getelementptr i64, ptr %t6712, i64 2
  store i64 %t6714, ptr %t6716
  %t6717 = musttail call fastcc i64 @"scheme.base:code_1056"(i64 %t6714, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6717
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6722 = icmp eq i64 %argc, 1
  br i1 %t6722, label %argok1387, label %arityerr1386
arityerr1386:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1387:
  %t6723 = call i64 @rt_null_p(i64 %a0)
  %t6724 = icmp ne i64 %t6723, 1
  br i1 %t6724, label %then1388, label %else1389
then1388:
  ret i64 0
else1389:
  %t6725 = call i64 @rt_car(i64 %a0)
  %t6726 = call i64 @rt_bytevector_length(i64 %t6725)
  %t6727 = call i64 @rt_cdr(i64 %a0)
  %t6728 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6728)
  %t6729 = and i64 %t6728, -8
  %t6730 = inttoptr i64 %t6729 to ptr
  %t6731 = load i64, ptr %t6730
  %t6732 = inttoptr i64 %t6731 to ptr
  %t6733 = call fastcc i64%t6732(i64 %t6728, i64 1, i64 %t6727, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6734 = or i64 %t6726, %t6733
  %t6735 = and i64 %t6734, 7
  %t6736 = icmp eq i64 %t6735, 0
  br i1 %t6736, label %fixfast1390, label %fixslow1391
fixfast1390:
  %t6737 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6726, i64 %t6733)
  %t6738 = extractvalue {i64, i1} %t6737, 0
  %t6739 = extractvalue {i64, i1} %t6737, 1
  br i1 %t6739, label %fixslow1391, label %fixmerge1392
fixslow1391:
  %t6740 = call i64 @rt_add(i64 %t6726, i64 %t6733)
  br label %fixmerge1392
fixmerge1392:
  %t6741 = phi i64 [ %t6738, %fixfast1390 ], [ %t6740, %fixslow1391 ]
  ret i64 %t6741
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6747 = icmp eq i64 %argc, 2
  br i1 %t6747, label %argok1394, label %arityerr1393
arityerr1393:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1394:
  %t6748 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6748)
  %t6749 = and i64 %t6748, -8
  %t6750 = inttoptr i64 %t6749 to ptr
  %t6751 = load i64, ptr %t6750
  %t6752 = inttoptr i64 %t6751 to ptr
  %t6753 = call fastcc i64%t6752(i64 %t6748, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6754 = or i64 %a0, %t6753
  %t6755 = and i64 %t6754, 7
  %t6756 = icmp eq i64 %t6755, 0
  br i1 %t6756, label %fixfast1395, label %fixslow1396
fixfast1395:
  %t6757 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6753)
  %t6758 = extractvalue {i64, i1} %t6757, 0
  %t6759 = extractvalue {i64, i1} %t6757, 1
  br i1 %t6759, label %fixslow1396, label %fixmerge1397
fixslow1396:
  %t6760 = call i64 @rt_sub(i64 %a0, i64 %t6753)
  br label %fixmerge1397
fixmerge1397:
  %t6761 = phi i64 [ %t6758, %fixfast1395 ], [ %t6760, %fixslow1396 ]
  %t6762 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6762)
  %t6763 = and i64 %t6762, -8
  %t6764 = inttoptr i64 %t6763 to ptr
  %t6765 = load i64, ptr %t6764
  %t6766 = inttoptr i64 %t6765 to ptr
  %t6767 = call fastcc i64%t6766(i64 %t6762, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6768 = or i64 %a0, %t6767
  %t6769 = and i64 %t6768, 7
  %t6770 = icmp eq i64 %t6769, 0
  br i1 %t6770, label %fixfast1398, label %fixslow1399
fixfast1398:
  %t6771 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t6767)
  %t6772 = extractvalue {i64, i1} %t6771, 0
  %t6773 = extractvalue {i64, i1} %t6771, 1
  br i1 %t6773, label %fixslow1399, label %fixmerge1400
fixslow1399:
  %t6774 = call i64 @rt_add(i64 %a0, i64 %t6767)
  br label %fixmerge1400
fixmerge1400:
  %t6775 = phi i64 [ %t6772, %fixfast1398 ], [ %t6774, %fixslow1399 ]
  %t6776 = call i64 @rt_exact_p(i64 %a0)
  %t6777 = icmp ne i64 %t6776, 1
  br i1 %t6777, label %then1401, label %else1402
then1401:
  %t6778 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1403
else1402:
  br label %merge1403
merge1403:
  %t6779 = phi i64 [ %t6778, %then1401 ], [ 1, %else1402 ]
  %t6780 = icmp ne i64 %t6779, 1
  br i1 %t6780, label %then1404, label %else1405
then1404:
  %t6781 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t6781)
  %t6782 = and i64 %t6781, -8
  %t6783 = inttoptr i64 %t6782 to ptr
  %t6784 = load i64, ptr %t6783
  %t6785 = inttoptr i64 %t6784 to ptr
  %t6786 = musttail call fastcc i64 %t6785(i64 %t6781, i64 2, i64 %t6761, i64 %t6775, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6786
else1405:
  %t6787 = call i64 @rt_exact_to_inexact(i64 %t6761)
  %t6788 = call i64 @rt_exact_to_inexact(i64 %t6775)
  %t6789 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t6789)
  %t6790 = and i64 %t6789, -8
  %t6791 = inttoptr i64 %t6790 to ptr
  %t6792 = load i64, ptr %t6791
  %t6793 = inttoptr i64 %t6792 to ptr
  %t6794 = musttail call fastcc i64 %t6793(i64 %t6789, i64 2, i64 %t6787, i64 %t6788, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6794
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6799 = icmp eq i64 %argc, 2
  br i1 %t6799, label %argok1407, label %arityerr1406
arityerr1406:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1407:
  %t6800 = or i64 %a0, 0
  %t6801 = and i64 %t6800, 7
  %t6802 = icmp eq i64 %t6801, 0
  br i1 %t6802, label %fixfast1408, label %fixslow1409
fixfast1408:
  %t6803 = icmp slt i64 %a0, 0
  %t6804 = select i1 %t6803, i64 257, i64 1
  br label %fixmerge1410
fixslow1409:
  %t6805 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1410
fixmerge1410:
  %t6806 = phi i64 [ %t6804, %fixfast1408 ], [ %t6805, %fixslow1409 ]
  %t6807 = icmp ne i64 %t6806, 1
  br i1 %t6807, label %then1411, label %else1412
then1411:
  br label %merge1413
else1412:
  %t6808 = or i64 %a0, 0
  %t6809 = and i64 %t6808, 7
  %t6810 = icmp eq i64 %t6809, 0
  br i1 %t6810, label %fixfast1414, label %fixslow1415
fixfast1414:
  %t6811 = icmp eq i64 %a0, 0
  %t6812 = select i1 %t6811, i64 257, i64 1
  br label %fixmerge1416
fixslow1415:
  %t6813 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1416
fixmerge1416:
  %t6814 = phi i64 [ %t6812, %fixfast1414 ], [ %t6813, %fixslow1415 ]
  br label %merge1413
merge1413:
  %t6815 = phi i64 [ 257, %then1411 ], [ %t6814, %fixmerge1416 ]
  %t6816 = icmp ne i64 %t6815, 1
  br i1 %t6816, label %then1417, label %else1418
then1417:
  %t6817 = or i64 0, %a1
  %t6818 = and i64 %t6817, 7
  %t6819 = icmp eq i64 %t6818, 0
  br i1 %t6819, label %fixfast1420, label %fixslow1421
fixfast1420:
  %t6820 = icmp slt i64 0, %a1
  %t6821 = select i1 %t6820, i64 257, i64 1
  br label %fixmerge1422
fixslow1421:
  %t6822 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1422
fixmerge1422:
  %t6823 = phi i64 [ %t6821, %fixfast1420 ], [ %t6822, %fixslow1421 ]
  %t6824 = icmp ne i64 %t6823, 1
  br i1 %t6824, label %then1423, label %else1424
then1423:
  br label %merge1425
else1424:
  %t6825 = or i64 0, %a1
  %t6826 = and i64 %t6825, 7
  %t6827 = icmp eq i64 %t6826, 0
  br i1 %t6827, label %fixfast1426, label %fixslow1427
fixfast1426:
  %t6828 = icmp eq i64 0, %a1
  %t6829 = select i1 %t6828, i64 257, i64 1
  br label %fixmerge1428
fixslow1427:
  %t6830 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1428
fixmerge1428:
  %t6831 = phi i64 [ %t6829, %fixfast1426 ], [ %t6830, %fixslow1427 ]
  br label %merge1425
merge1425:
  %t6832 = phi i64 [ 257, %then1423 ], [ %t6831, %fixmerge1428 ]
  br label %merge1419
else1418:
  br label %merge1419
merge1419:
  %t6833 = phi i64 [ %t6832, %merge1425 ], [ 1, %else1418 ]
  %t6834 = icmp ne i64 %t6833, 1
  br i1 %t6834, label %then1429, label %else1430
then1429:
  ret i64 0
else1430:
  %t6835 = or i64 0, %a0
  %t6836 = and i64 %t6835, 7
  %t6837 = icmp eq i64 %t6836, 0
  br i1 %t6837, label %fixfast1431, label %fixslow1432
fixfast1431:
  %t6838 = icmp slt i64 0, %a0
  %t6839 = select i1 %t6838, i64 257, i64 1
  br label %fixmerge1433
fixslow1432:
  %t6840 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1433
fixmerge1433:
  %t6841 = phi i64 [ %t6839, %fixfast1431 ], [ %t6840, %fixslow1432 ]
  %t6842 = icmp ne i64 %t6841, 1
  br i1 %t6842, label %then1434, label %else1435
then1434:
  %t6843 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6843)
  %t6844 = and i64 %t6843, -8
  %t6845 = inttoptr i64 %t6844 to ptr
  %t6846 = load i64, ptr %t6845
  %t6847 = inttoptr i64 %t6846 to ptr
  %t6848 = call fastcc i64%t6847(i64 %t6843, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6849 = or i64 %t6848, %a1
  %t6850 = and i64 %t6849, 7
  %t6851 = icmp eq i64 %t6850, 0
  br i1 %t6851, label %fixfast1436, label %fixslow1437
fixfast1436:
  %t6852 = icmp slt i64 %t6848, %a1
  %t6853 = select i1 %t6852, i64 257, i64 1
  br label %fixmerge1438
fixslow1437:
  %t6854 = call i64 @rt_lt(i64 %t6848, i64 %a1)
  br label %fixmerge1438
fixmerge1438:
  %t6855 = phi i64 [ %t6853, %fixfast1436 ], [ %t6854, %fixslow1437 ]
  %t6856 = icmp ne i64 %t6855, 1
  br i1 %t6856, label %then1439, label %else1440
then1439:
  br label %merge1441
else1440:
  %t6857 = or i64 %t6848, %a1
  %t6858 = and i64 %t6857, 7
  %t6859 = icmp eq i64 %t6858, 0
  br i1 %t6859, label %fixfast1442, label %fixslow1443
fixfast1442:
  %t6860 = icmp eq i64 %t6848, %a1
  %t6861 = select i1 %t6860, i64 257, i64 1
  br label %fixmerge1444
fixslow1443:
  %t6862 = call i64 @rt_num_eq(i64 %t6848, i64 %a1)
  br label %fixmerge1444
fixmerge1444:
  %t6863 = phi i64 [ %t6861, %fixfast1442 ], [ %t6862, %fixslow1443 ]
  br label %merge1441
merge1441:
  %t6864 = phi i64 [ 257, %then1439 ], [ %t6863, %fixmerge1444 ]
  %t6865 = icmp ne i64 %t6864, 1
  br i1 %t6865, label %then1445, label %else1446
then1445:
  %t6866 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6866)
  %t6867 = and i64 %t6866, -8
  %t6868 = inttoptr i64 %t6867 to ptr
  %t6869 = load i64, ptr %t6868
  %t6870 = inttoptr i64 %t6869 to ptr
  %t6871 = musttail call fastcc i64 %t6870(i64 %t6866, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6871
else1446:
  %t6872 = call i64 @rt_make_string(ptr @.str.lit.43, i64 69)
  %t6873 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6873)
  %t6874 = and i64 %t6873, -8
  %t6875 = inttoptr i64 %t6874 to ptr
  %t6876 = load i64, ptr %t6875
  %t6877 = inttoptr i64 %t6876 to ptr
  %t6878 = musttail call fastcc i64 %t6877(i64 %t6873, i64 3, i64 %t6872, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6878
else1435:
  %t6879 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6879)
  %t6880 = and i64 %t6879, -8
  %t6881 = inttoptr i64 %t6880 to ptr
  %t6882 = load i64, ptr %t6881
  %t6883 = inttoptr i64 %t6882 to ptr
  %t6884 = call fastcc i64%t6883(i64 %t6879, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6885 = or i64 %a0, %t6884
  %t6886 = and i64 %t6885, 7
  %t6887 = icmp eq i64 %t6886, 0
  br i1 %t6887, label %fixfast1447, label %fixslow1448
fixfast1447:
  %t6888 = icmp slt i64 %a0, %t6884
  %t6889 = select i1 %t6888, i64 257, i64 1
  br label %fixmerge1449
fixslow1448:
  %t6890 = call i64 @rt_lt(i64 %a0, i64 %t6884)
  br label %fixmerge1449
fixmerge1449:
  %t6891 = phi i64 [ %t6889, %fixfast1447 ], [ %t6890, %fixslow1448 ]
  %t6892 = icmp ne i64 %t6891, 1
  br i1 %t6892, label %then1450, label %else1451
then1450:
  br label %merge1452
else1451:
  %t6893 = or i64 %a0, %t6884
  %t6894 = and i64 %t6893, 7
  %t6895 = icmp eq i64 %t6894, 0
  br i1 %t6895, label %fixfast1453, label %fixslow1454
fixfast1453:
  %t6896 = icmp eq i64 %a0, %t6884
  %t6897 = select i1 %t6896, i64 257, i64 1
  br label %fixmerge1455
fixslow1454:
  %t6898 = call i64 @rt_num_eq(i64 %a0, i64 %t6884)
  br label %fixmerge1455
fixmerge1455:
  %t6899 = phi i64 [ %t6897, %fixfast1453 ], [ %t6898, %fixslow1454 ]
  br label %merge1452
merge1452:
  %t6900 = phi i64 [ 257, %then1450 ], [ %t6899, %fixmerge1455 ]
  %t6901 = icmp ne i64 %t6900, 1
  br i1 %t6901, label %then1456, label %else1457
then1456:
  %t6902 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6902)
  %t6903 = and i64 %t6902, -8
  %t6904 = inttoptr i64 %t6903 to ptr
  %t6905 = load i64, ptr %t6904
  %t6906 = inttoptr i64 %t6905 to ptr
  %t6907 = musttail call fastcc i64 %t6906(i64 %t6902, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6907
else1457:
  %t6908 = call i64 @rt_make_string(ptr @.str.lit.44, i64 69)
  %t6909 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6909)
  %t6910 = and i64 %t6909, -8
  %t6911 = inttoptr i64 %t6910 to ptr
  %t6912 = load i64, ptr %t6911
  %t6913 = inttoptr i64 %t6912 to ptr
  %t6914 = musttail call fastcc i64 %t6913(i64 %t6909, i64 3, i64 %t6908, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6914
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6919 = icmp eq i64 %argc, 1
  br i1 %t6919, label %argok1459, label %arityerr1458
arityerr1458:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1459:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6924 = icmp eq i64 %argc, 1
  br i1 %t6924, label %argok1461, label %arityerr1460
arityerr1460:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1461:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1112"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6929 = icmp eq i64 %argc, 1
  br i1 %t6929, label %argok1463, label %arityerr1462
arityerr1462:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1463:
  %t6930 = load i64, ptr @"scheme.base:rat-max-denom"
  %t6931 = or i64 %t6930, %a0
  %t6932 = and i64 %t6931, 7
  %t6933 = icmp eq i64 %t6932, 0
  br i1 %t6933, label %fixfast1464, label %fixslow1465
fixfast1464:
  %t6934 = icmp slt i64 %t6930, %a0
  %t6935 = select i1 %t6934, i64 257, i64 1
  br label %fixmerge1466
fixslow1465:
  %t6936 = call i64 @rt_lt(i64 %t6930, i64 %a0)
  br label %fixmerge1466
fixmerge1466:
  %t6937 = phi i64 [ %t6935, %fixfast1464 ], [ %t6936, %fixslow1465 ]
  %t6938 = icmp ne i64 %t6937, 1
  br i1 %t6938, label %then1467, label %else1468
then1467:
  %t6939 = call i64 @rt_make_string(ptr @.str.lit.45, i64 59)
  %t6940 = and i64 %self, -8
  %t6941 = inttoptr i64 %t6940 to ptr
  %t6942 = getelementptr i64, ptr %t6941, i64 1
  %t6943 = load i64, ptr %t6942
  %t6944 = and i64 %self, -8
  %t6945 = inttoptr i64 %t6944 to ptr
  %t6946 = getelementptr i64, ptr %t6945, i64 2
  %t6947 = load i64, ptr %t6946
  %t6948 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6948)
  %t6949 = and i64 %t6948, -8
  %t6950 = inttoptr i64 %t6949 to ptr
  %t6951 = load i64, ptr %t6950
  %t6952 = inttoptr i64 %t6951 to ptr
  %t6953 = musttail call fastcc i64 %t6952(i64 %t6948, i64 3, i64 %t6939, i64 %t6943, i64 %t6947, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6953
else1468:
  %t6954 = and i64 %self, -8
  %t6955 = inttoptr i64 %t6954 to ptr
  %t6956 = getelementptr i64, ptr %t6955, i64 1
  %t6957 = load i64, ptr %t6956
  %t6958 = or i64 %t6957, %a0
  %t6959 = and i64 %t6958, 7
  %t6960 = icmp eq i64 %t6959, 0
  br i1 %t6960, label %fixfast1469, label %fixslow1470
fixfast1469:
  %t6961 = ashr i64 %t6957, 3
  %t6962 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6961, i64 %a0)
  %t6963 = extractvalue {i64, i1} %t6962, 0
  %t6964 = extractvalue {i64, i1} %t6962, 1
  br i1 %t6964, label %fixslow1470, label %fixmerge1471
fixslow1470:
  %t6965 = call i64 @rt_mul(i64 %t6957, i64 %a0)
  br label %fixmerge1471
fixmerge1471:
  %t6966 = phi i64 [ %t6963, %fixfast1469 ], [ %t6965, %fixslow1470 ]
  %t6967 = and i64 %self, -8
  %t6968 = inttoptr i64 %t6967 to ptr
  %t6969 = getelementptr i64, ptr %t6968, i64 2
  %t6970 = load i64, ptr %t6969
  %t6971 = or i64 %t6970, %a0
  %t6972 = and i64 %t6971, 7
  %t6973 = icmp eq i64 %t6972, 0
  br i1 %t6973, label %fixfast1472, label %fixslow1473
fixfast1472:
  %t6974 = ashr i64 %t6970, 3
  %t6975 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6974, i64 %a0)
  %t6976 = extractvalue {i64, i1} %t6975, 0
  %t6977 = extractvalue {i64, i1} %t6975, 1
  br i1 %t6977, label %fixslow1473, label %fixmerge1474
fixslow1473:
  %t6978 = call i64 @rt_mul(i64 %t6970, i64 %a0)
  br label %fixmerge1474
fixmerge1474:
  %t6979 = phi i64 [ %t6976, %fixfast1472 ], [ %t6978, %fixslow1473 ]
  %t6980 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t6980)
  %t6981 = and i64 %t6980, -8
  %t6982 = inttoptr i64 %t6981 to ptr
  %t6983 = load i64, ptr %t6982
  %t6984 = inttoptr i64 %t6983 to ptr
  %t6985 = call fastcc i64%t6984(i64 %t6980, i64 2, i64 %t6966, i64 %t6979, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6986 = icmp ne i64 %t6985, 1
  br i1 %t6986, label %then1475, label %else1476
then1475:
  %t6987 = call i64 @rt_exact_to_inexact(i64 %t6985)
  %t6988 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t6989 = call i64 @rt_div(i64 %t6987, i64 %t6988)
  ret i64 %t6989
else1476:
  %t6990 = or i64 %a0, 8
  %t6991 = and i64 %t6990, 7
  %t6992 = icmp eq i64 %t6991, 0
  br i1 %t6992, label %fixfast1477, label %fixslow1478
fixfast1477:
  %t6993 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6994 = extractvalue {i64, i1} %t6993, 0
  %t6995 = extractvalue {i64, i1} %t6993, 1
  br i1 %t6995, label %fixslow1478, label %fixmerge1479
fixslow1478:
  %t6996 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1479
fixmerge1479:
  %t6997 = phi i64 [ %t6994, %fixfast1477 ], [ %t6996, %fixslow1478 ]
  %t6998 = musttail call fastcc i64 @"scheme.base:code_1112"(i64 %self, i64 1, i64 %t6997, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6998
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6999 = icmp eq i64 %argc, 2
  br i1 %t6999, label %argok1481, label %arityerr1480
arityerr1480:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1481:
  %t7000 = call i64 @rt_flonum_lit(ptr @.flo.lit.46)
  %t7001 = or i64 %a0, %t7000
  %t7002 = and i64 %t7001, 7
  %t7003 = icmp eq i64 %t7002, 0
  br i1 %t7003, label %fixfast1482, label %fixslow1483
fixfast1482:
  %t7004 = icmp slt i64 %a0, %t7000
  %t7005 = select i1 %t7004, i64 257, i64 1
  br label %fixmerge1484
fixslow1483:
  %t7006 = call i64 @rt_lt(i64 %a0, i64 %t7000)
  br label %fixmerge1484
fixmerge1484:
  %t7007 = phi i64 [ %t7005, %fixfast1482 ], [ %t7006, %fixslow1483 ]
  %t7008 = icmp ne i64 %t7007, 1
  br i1 %t7008, label %then1485, label %else1486
then1485:
  br label %merge1487
else1486:
  %t7009 = or i64 %a0, %t7000
  %t7010 = and i64 %t7009, 7
  %t7011 = icmp eq i64 %t7010, 0
  br i1 %t7011, label %fixfast1488, label %fixslow1489
fixfast1488:
  %t7012 = icmp eq i64 %a0, %t7000
  %t7013 = select i1 %t7012, i64 257, i64 1
  br label %fixmerge1490
fixslow1489:
  %t7014 = call i64 @rt_num_eq(i64 %a0, i64 %t7000)
  br label %fixmerge1490
fixmerge1490:
  %t7015 = phi i64 [ %t7013, %fixfast1488 ], [ %t7014, %fixslow1489 ]
  br label %merge1487
merge1487:
  %t7016 = phi i64 [ 257, %then1485 ], [ %t7015, %fixmerge1490 ]
  %t7017 = icmp ne i64 %t7016, 1
  br i1 %t7017, label %then1491, label %else1492
then1491:
  %t7018 = call i64 @rt_flonum_lit(ptr @.flo.lit.47)
  %t7019 = or i64 %t7018, %a1
  %t7020 = and i64 %t7019, 7
  %t7021 = icmp eq i64 %t7020, 0
  br i1 %t7021, label %fixfast1494, label %fixslow1495
fixfast1494:
  %t7022 = icmp slt i64 %t7018, %a1
  %t7023 = select i1 %t7022, i64 257, i64 1
  br label %fixmerge1496
fixslow1495:
  %t7024 = call i64 @rt_lt(i64 %t7018, i64 %a1)
  br label %fixmerge1496
fixmerge1496:
  %t7025 = phi i64 [ %t7023, %fixfast1494 ], [ %t7024, %fixslow1495 ]
  %t7026 = icmp ne i64 %t7025, 1
  br i1 %t7026, label %then1497, label %else1498
then1497:
  br label %merge1499
else1498:
  %t7027 = or i64 %t7018, %a1
  %t7028 = and i64 %t7027, 7
  %t7029 = icmp eq i64 %t7028, 0
  br i1 %t7029, label %fixfast1500, label %fixslow1501
fixfast1500:
  %t7030 = icmp eq i64 %t7018, %a1
  %t7031 = select i1 %t7030, i64 257, i64 1
  br label %fixmerge1502
fixslow1501:
  %t7032 = call i64 @rt_num_eq(i64 %t7018, i64 %a1)
  br label %fixmerge1502
fixmerge1502:
  %t7033 = phi i64 [ %t7031, %fixfast1500 ], [ %t7032, %fixslow1501 ]
  br label %merge1499
merge1499:
  %t7034 = phi i64 [ 257, %then1497 ], [ %t7033, %fixmerge1502 ]
  br label %merge1493
else1492:
  br label %merge1493
merge1493:
  %t7035 = phi i64 [ %t7034, %merge1499 ], [ 1, %else1492 ]
  %t7036 = icmp ne i64 %t7035, 1
  br i1 %t7036, label %then1503, label %else1504
then1503:
  %t7037 = call i64 @rt_flonum_lit(ptr @.flo.lit.48)
  ret i64 %t7037
else1504:
  %t7038 = call ptr @rt_alloc_words(i64 4)
  %t7039 = ptrtoint ptr %t7038 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1112" to i64), ptr %t7038
  %t7040 = or i64 %t7039, 4
  %t7041 = getelementptr i64, ptr %t7038, i64 1
  store i64 %a0, ptr %t7041
  %t7042 = getelementptr i64, ptr %t7038, i64 2
  store i64 %a1, ptr %t7042
  %t7043 = getelementptr i64, ptr %t7038, i64 3
  store i64 %t7040, ptr %t7043
  %t7044 = musttail call fastcc i64 @"scheme.base:code_1112"(i64 %t7040, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7044
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7049 = icmp eq i64 %argc, 2
  br i1 %t7049, label %argok1506, label %arityerr1505
arityerr1505:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1506:
  %t7050 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t7050)
  %t7051 = and i64 %t7050, -8
  %t7052 = inttoptr i64 %t7051 to ptr
  %t7053 = load i64, ptr %t7052
  %t7054 = inttoptr i64 %t7053 to ptr
  %t7055 = call fastcc i64%t7054(i64 %t7050, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7056 = call i64 @rt_exact_to_inexact(i64 %t7055)
  %t7057 = or i64 %t7056, %a1
  %t7058 = and i64 %t7057, 7
  %t7059 = icmp eq i64 %t7058, 0
  br i1 %t7059, label %fixfast1507, label %fixslow1508
fixfast1507:
  %t7060 = icmp slt i64 %t7056, %a1
  %t7061 = select i1 %t7060, i64 257, i64 1
  br label %fixmerge1509
fixslow1508:
  %t7062 = call i64 @rt_lt(i64 %t7056, i64 %a1)
  br label %fixmerge1509
fixmerge1509:
  %t7063 = phi i64 [ %t7061, %fixfast1507 ], [ %t7062, %fixslow1508 ]
  %t7064 = icmp ne i64 %t7063, 1
  br i1 %t7064, label %then1510, label %else1511
then1510:
  br label %merge1512
else1511:
  %t7065 = or i64 %t7056, %a1
  %t7066 = and i64 %t7065, 7
  %t7067 = icmp eq i64 %t7066, 0
  br i1 %t7067, label %fixfast1513, label %fixslow1514
fixfast1513:
  %t7068 = icmp eq i64 %t7056, %a1
  %t7069 = select i1 %t7068, i64 257, i64 1
  br label %fixmerge1515
fixslow1514:
  %t7070 = call i64 @rt_num_eq(i64 %t7056, i64 %a1)
  br label %fixmerge1515
fixmerge1515:
  %t7071 = phi i64 [ %t7069, %fixfast1513 ], [ %t7070, %fixslow1514 ]
  br label %merge1512
merge1512:
  %t7072 = phi i64 [ 257, %then1510 ], [ %t7071, %fixmerge1515 ]
  %t7073 = icmp ne i64 %t7072, 1
  br i1 %t7073, label %then1516, label %else1517
then1516:
  ret i64 %t7055
else1517:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7078 = icmp eq i64 %argc, 1
  br i1 %t7078, label %argok1519, label %arityerr1518
arityerr1518:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1519:
  %t7079 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t7079)
  %t7080 = and i64 %t7079, -8
  %t7081 = inttoptr i64 %t7080 to ptr
  %t7082 = load i64, ptr %t7081
  %t7083 = inttoptr i64 %t7082 to ptr
  %t7084 = call fastcc i64%t7083(i64 %t7079, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7085 = call i64 @rt_inexact_to_exact(i64 %t7084)
  %t7086 = call i64 @rt_exact_to_inexact(i64 %t7085)
  %t7087 = or i64 %t7086, %a0
  %t7088 = and i64 %t7087, 7
  %t7089 = icmp eq i64 %t7088, 0
  br i1 %t7089, label %fixfast1520, label %fixslow1521
fixfast1520:
  %t7090 = icmp slt i64 %t7086, %a0
  %t7091 = select i1 %t7090, i64 257, i64 1
  br label %fixmerge1522
fixslow1521:
  %t7092 = call i64 @rt_lt(i64 %t7086, i64 %a0)
  br label %fixmerge1522
fixmerge1522:
  %t7093 = phi i64 [ %t7091, %fixfast1520 ], [ %t7092, %fixslow1521 ]
  %t7094 = icmp ne i64 %t7093, 1
  br i1 %t7094, label %then1523, label %else1524
then1523:
  %t7095 = or i64 %t7085, 8
  %t7096 = and i64 %t7095, 7
  %t7097 = icmp eq i64 %t7096, 0
  br i1 %t7097, label %fixfast1525, label %fixslow1526
fixfast1525:
  %t7098 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7085, i64 8)
  %t7099 = extractvalue {i64, i1} %t7098, 0
  %t7100 = extractvalue {i64, i1} %t7098, 1
  br i1 %t7100, label %fixslow1526, label %fixmerge1527
fixslow1526:
  %t7101 = call i64 @rt_add(i64 %t7085, i64 8)
  br label %fixmerge1527
fixmerge1527:
  %t7102 = phi i64 [ %t7099, %fixfast1525 ], [ %t7101, %fixslow1526 ]
  ret i64 %t7102
else1524:
  ret i64 %t7085
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7107 = icmp sge i64 %argc, 0
  br i1 %t7107, label %argok1529, label %arityerr1528
arityerr1528:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1529:
  %t7108 = call ptr @rt_alloc_words(i64 8)
  %t7109 = getelementptr i64, ptr %t7108, i64 0
  store i64 %a0, ptr %t7109
  %t7110 = getelementptr i64, ptr %t7108, i64 1
  store i64 %a1, ptr %t7110
  %t7111 = getelementptr i64, ptr %t7108, i64 2
  store i64 %a2, ptr %t7111
  %t7112 = getelementptr i64, ptr %t7108, i64 3
  store i64 %a3, ptr %t7112
  %t7113 = getelementptr i64, ptr %t7108, i64 4
  store i64 %a4, ptr %t7113
  %t7114 = getelementptr i64, ptr %t7108, i64 5
  store i64 %a5, ptr %t7114
  %t7115 = getelementptr i64, ptr %t7108, i64 6
  store i64 %a6, ptr %t7115
  %t7116 = getelementptr i64, ptr %t7108, i64 7
  store i64 %a7, ptr %t7116
  %t7117 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7108, ptr %overflow)
  %t7118 = call i64 @rt_pair_p(i64 %t7117)
  %t7119 = icmp ne i64 %t7118, 1
  br i1 %t7119, label %then1530, label %else1531
then1530:
  %t7120 = call i64 @rt_cdr(i64 %t7117)
  %t7121 = call i64 @rt_null_p(i64 %t7120)
  br label %merge1532
else1531:
  br label %merge1532
merge1532:
  %t7122 = phi i64 [ %t7121, %then1530 ], [ 1, %else1531 ]
  %t7123 = icmp ne i64 %t7122, 1
  br i1 %t7123, label %then1533, label %else1534
then1533:
  %t7124 = call i64 @rt_car(i64 %t7117)
  ret i64 %t7124
else1534:
  %t7125 = call i64 @rt_list_to_mv(i64 %t7117)
  ret i64 %t7125
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvalues"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7126 = call i64 @rt_pair_p(i64 2)
  %t7127 = icmp ne i64 %t7126, 1
  br i1 %t7127, label %then1535, label %else1536
then1535:
  %t7128 = call i64 @rt_cdr(i64 2)
  %t7129 = call i64 @rt_null_p(i64 %t7128)
  br label %merge1537
else1536:
  br label %merge1537
merge1537:
  %t7130 = phi i64 [ %t7129, %then1535 ], [ 1, %else1536 ]
  %t7131 = icmp ne i64 %t7130, 1
  br i1 %t7131, label %then1538, label %else1539
then1538:
  %t7132 = call i64 @rt_car(i64 2)
  ret i64 %t7132
else1539:
  %t7133 = call i64 @rt_list_to_mv(i64 2)
  ret i64 %t7133
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7138 = icmp eq i64 %argc, 2
  br i1 %t7138, label %argok1541, label %arityerr1540
arityerr1540:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1541:
  call void @rt_check_callable(i64 %a0)
  %t7139 = and i64 %a0, -8
  %t7140 = inttoptr i64 %t7139 to ptr
  %t7141 = load i64, ptr %t7140
  %t7142 = inttoptr i64 %t7141 to ptr
  %t7143 = call fastcc i64%t7142(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7144 = call i64 @rt_mv_p(i64 %t7143)
  %t7145 = icmp ne i64 %t7144, 1
  br i1 %t7145, label %then1542, label %else1543
then1542:
  %t7146 = call i64 @rt_mv_to_list(i64 %t7143)
  call void @rt_check_callable(i64 %a1)
  %t7147 = and i64 %a1, -8
  %t7148 = inttoptr i64 %t7147 to ptr
  %t7149 = load i64, ptr %t7148
  %t7150 = inttoptr i64 %t7149 to ptr
  %t7151 = call i64 @rt_list_length(i64 %t7146)
  %t7152 = add i64 0, %t7151
  %t7153 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t7146, i64 8)
  %t7165 = getelementptr i64, ptr %t7153, i64 0
  %t7157 = load i64, ptr %t7165
  %t7166 = getelementptr i64, ptr %t7153, i64 1
  %t7158 = load i64, ptr %t7166
  %t7167 = getelementptr i64, ptr %t7153, i64 2
  %t7159 = load i64, ptr %t7167
  %t7168 = getelementptr i64, ptr %t7153, i64 3
  %t7160 = load i64, ptr %t7168
  %t7169 = getelementptr i64, ptr %t7153, i64 4
  %t7161 = load i64, ptr %t7169
  %t7170 = getelementptr i64, ptr %t7153, i64 5
  %t7162 = load i64, ptr %t7170
  %t7171 = getelementptr i64, ptr %t7153, i64 6
  %t7163 = load i64, ptr %t7171
  %t7172 = getelementptr i64, ptr %t7153, i64 7
  %t7164 = load i64, ptr %t7172
  %t7154 = icmp sgt i64 %t7152, 8
  %t7155 = getelementptr i64, ptr %t7153, i64 8
  %t7156 = select i1 %t7154, ptr %t7155, ptr null
  %t7173 = musttail call fastcc i64 %t7150(i64 %a1, i64 %t7152, i64 %t7157, i64 %t7158, i64 %t7159, i64 %t7160, i64 %t7161, i64 %t7162, i64 %t7163, i64 %t7164, ptr %t7156)
  ret i64 %t7173
else1543:
  call void @rt_check_callable(i64 %a1)
  %t7174 = and i64 %a1, -8
  %t7175 = inttoptr i64 %t7174 to ptr
  %t7176 = load i64, ptr %t7175
  %t7177 = inttoptr i64 %t7176 to ptr
  %t7178 = musttail call fastcc i64 %t7177(i64 %a1, i64 1, i64 %t7143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7178
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7185 = icmp eq i64 %argc, 0
  br i1 %t7185, label %argok1545, label %arityerr1544
arityerr1544:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1545:
  %t7186 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7187 = call i64 @rt_make_vector(i64 %t7186, i64 2)
  %t7188 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7188)
  %t7189 = and i64 %t7188, -8
  %t7190 = inttoptr i64 %t7189 to ptr
  %t7191 = load i64, ptr %t7190
  %t7192 = inttoptr i64 %t7191 to ptr
  %t7193 = call fastcc i64%t7192(i64 %t7188, i64 3, i64 0, i64 %t7187, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7194 = call i64 @rt_make_hash_table(i64 %t7193)
  ret i64 %t7194
}

define fastcc i64 @"scheme.base:code:make-eq-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7199 = icmp eq i64 %argc, 0
  br i1 %t7199, label %argok1547, label %arityerr1546
arityerr1546:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1547:
  %t7200 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7201 = call i64 @rt_make_vector(i64 %t7200, i64 2)
  %t7202 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7202)
  %t7203 = and i64 %t7202, -8
  %t7204 = inttoptr i64 %t7203 to ptr
  %t7205 = load i64, ptr %t7204
  %t7206 = inttoptr i64 %t7205 to ptr
  %t7207 = call fastcc i64%t7206(i64 %t7202, i64 3, i64 0, i64 %t7201, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7208 = call i64 @rt_make_hash_table(i64 %t7207)
  ret i64 %t7208
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7213 = icmp eq i64 %argc, 1
  br i1 %t7213, label %argok1549, label %arityerr1548
arityerr1548:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1549:
  %t7214 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t7214
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7219 = icmp eq i64 %argc, 1
  br i1 %t7219, label %argok1551, label %arityerr1550
arityerr1550:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1551:
  %t7220 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7221 = call i64 @rt_vector_ref(i64 %t7220, i64 0)
  ret i64 %t7221
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7226 = icmp eq i64 %argc, 1
  br i1 %t7226, label %argok1553, label %arityerr1552
arityerr1552:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1553:
  %t7227 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7228 = call i64 @rt_vector_ref(i64 %t7227, i64 8)
  ret i64 %t7228
}

define fastcc i64 @"scheme.base:code:%ht-identity?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7233 = icmp eq i64 %argc, 1
  br i1 %t7233, label %argok1555, label %arityerr1554
arityerr1554:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1555:
  %t7234 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7235 = call i64 @rt_vector_ref(i64 %t7234, i64 16)
  ret i64 %t7235
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7240 = icmp eq i64 %argc, 2
  br i1 %t7240, label %argok1557, label %arityerr1556
arityerr1556:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1557:
  %t7241 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7242 = call i64 @rt_vector_set(i64 %t7241, i64 0, i64 %a1)
  ret i64 %t7242
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7247 = icmp eq i64 %argc, 2
  br i1 %t7247, label %argok1559, label %arityerr1558
arityerr1558:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1559:
  %t7248 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7249 = call i64 @rt_vector_set(i64 %t7248, i64 8, i64 %a1)
  ret i64 %t7249
}

define fastcc i64 @"scheme.base:code:%ht-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7254 = icmp eq i64 %argc, 2
  br i1 %t7254, label %argok1561, label %arityerr1560
arityerr1560:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1561:
  %t7255 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7255)
  %t7256 = and i64 %t7255, -8
  %t7257 = inttoptr i64 %t7256 to ptr
  %t7258 = load i64, ptr %t7257
  %t7259 = inttoptr i64 %t7258 to ptr
  %t7260 = call fastcc i64%t7259(i64 %t7255, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7261 = icmp ne i64 %t7260, 1
  br i1 %t7261, label %then1562, label %else1563
then1562:
  %t7262 = call i64 @rt_eq_hash(i64 %a1)
  ret i64 %t7262
else1563:
  %t7263 = call i64 @rt_hash(i64 %a1)
  ret i64 %t7263
}

define fastcc i64 @"scheme.base:code:%ht-key=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7268 = icmp eq i64 %argc, 3
  br i1 %t7268, label %argok1565, label %arityerr1564
arityerr1564:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1565:
  %t7269 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7269)
  %t7270 = and i64 %t7269, -8
  %t7271 = inttoptr i64 %t7270 to ptr
  %t7272 = load i64, ptr %t7271
  %t7273 = inttoptr i64 %t7272 to ptr
  %t7274 = call fastcc i64%t7273(i64 %t7269, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7275 = icmp ne i64 %t7274, 1
  br i1 %t7275, label %then1566, label %else1567
then1566:
  %t7276 = call i64 @rt_eq_p(i64 %a1, i64 %a2)
  ret i64 %t7276
else1567:
  %t7277 = call i64 @rt_equal(i64 %a1, i64 %a2)
  ret i64 %t7277
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7282 = icmp eq i64 %argc, 3
  br i1 %t7282, label %argok1569, label %arityerr1568
arityerr1568:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1569:
  %t7283 = load i64, ptr @"scheme.base:%ht-hash"
  call void @rt_check_callable(i64 %t7283)
  %t7284 = and i64 %t7283, -8
  %t7285 = inttoptr i64 %t7284 to ptr
  %t7286 = load i64, ptr %t7285
  %t7287 = inttoptr i64 %t7286 to ptr
  %t7288 = call fastcc i64%t7287(i64 %t7283, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7289 = call i64 @rt_remainder(i64 %t7288, i64 %a2)
  ret i64 %t7289
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7294 = icmp eq i64 %argc, 3
  br i1 %t7294, label %argok1571, label %arityerr1570
arityerr1570:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1571:
  %t7295 = call i64 @rt_null_p(i64 %a2)
  %t7296 = icmp ne i64 %t7295, 1
  br i1 %t7296, label %then1572, label %else1573
then1572:
  ret i64 1
else1573:
  %t7297 = call i64 @rt_car(i64 %a2)
  %t7298 = call i64 @rt_car(i64 %t7297)
  %t7299 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7299)
  %t7300 = and i64 %t7299, -8
  %t7301 = inttoptr i64 %t7300 to ptr
  %t7302 = load i64, ptr %t7301
  %t7303 = inttoptr i64 %t7302 to ptr
  %t7304 = call fastcc i64%t7303(i64 %t7299, i64 3, i64 %a0, i64 %a1, i64 %t7298, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7305 = icmp ne i64 %t7304, 1
  br i1 %t7305, label %then1574, label %else1575
then1574:
  %t7306 = call i64 @rt_car(i64 %a2)
  ret i64 %t7306
else1575:
  %t7307 = call i64 @rt_cdr(i64 %a2)
  %t7308 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7308)
  %t7309 = and i64 %t7308, -8
  %t7310 = inttoptr i64 %t7309 to ptr
  %t7311 = load i64, ptr %t7310
  %t7312 = inttoptr i64 %t7311 to ptr
  %t7313 = musttail call fastcc i64 %t7312(i64 %t7308, i64 3, i64 %a0, i64 %a1, i64 %t7307, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7313
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7318 = icmp eq i64 %argc, 3
  br i1 %t7318, label %argok1577, label %arityerr1576
arityerr1576:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1577:
  %t7319 = call i64 @rt_null_p(i64 %a2)
  %t7320 = icmp ne i64 %t7319, 1
  br i1 %t7320, label %then1578, label %else1579
then1578:
  ret i64 2
else1579:
  %t7321 = call i64 @rt_car(i64 %a2)
  %t7322 = call i64 @rt_car(i64 %t7321)
  %t7323 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7323)
  %t7324 = and i64 %t7323, -8
  %t7325 = inttoptr i64 %t7324 to ptr
  %t7326 = load i64, ptr %t7325
  %t7327 = inttoptr i64 %t7326 to ptr
  %t7328 = call fastcc i64%t7327(i64 %t7323, i64 3, i64 %a0, i64 %a1, i64 %t7322, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7329 = icmp ne i64 %t7328, 1
  br i1 %t7329, label %then1580, label %else1581
then1580:
  %t7330 = call i64 @rt_cdr(i64 %a2)
  ret i64 %t7330
else1581:
  %t7331 = call i64 @rt_car(i64 %a2)
  %t7332 = call i64 @rt_cdr(i64 %a2)
  %t7333 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7333)
  %t7334 = and i64 %t7333, -8
  %t7335 = inttoptr i64 %t7334 to ptr
  %t7336 = load i64, ptr %t7335
  %t7337 = inttoptr i64 %t7336 to ptr
  %t7338 = call fastcc i64%t7337(i64 %t7333, i64 3, i64 %a0, i64 %a1, i64 %t7332, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7339 = call i64 @rt_cons(i64 %t7331, i64 %t7338)
  ret i64 %t7339
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7344 = icmp eq i64 %argc, 3
  br i1 %t7344, label %argok1583, label %arityerr1582
arityerr1582:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1583:
  %t7345 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7345)
  %t7346 = and i64 %t7345, -8
  %t7347 = inttoptr i64 %t7346 to ptr
  %t7348 = load i64, ptr %t7347
  %t7349 = inttoptr i64 %t7348 to ptr
  %t7350 = call fastcc i64%t7349(i64 %t7345, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7351 = call i64 @rt_vector_length(i64 %t7350)
  %t7352 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7352)
  %t7353 = and i64 %t7352, -8
  %t7354 = inttoptr i64 %t7353 to ptr
  %t7355 = load i64, ptr %t7354
  %t7356 = inttoptr i64 %t7355 to ptr
  %t7357 = call fastcc i64%t7356(i64 %t7352, i64 3, i64 %a0, i64 %a1, i64 %t7351, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7358 = call i64 @rt_vector_ref(i64 %t7350, i64 %t7357)
  %t7359 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7359)
  %t7360 = and i64 %t7359, -8
  %t7361 = inttoptr i64 %t7360 to ptr
  %t7362 = load i64, ptr %t7361
  %t7363 = inttoptr i64 %t7362 to ptr
  %t7364 = call fastcc i64%t7363(i64 %t7359, i64 3, i64 %a0, i64 %a1, i64 %t7358, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7365 = icmp ne i64 %t7364, 1
  br i1 %t7365, label %then1584, label %else1585
then1584:
  %t7366 = call i64 @rt_cdr(i64 %t7364)
  ret i64 %t7366
else1585:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7371 = icmp eq i64 %argc, 2
  br i1 %t7371, label %argok1587, label %arityerr1586
arityerr1586:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1587:
  %t7372 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7372)
  %t7373 = and i64 %t7372, -8
  %t7374 = inttoptr i64 %t7373 to ptr
  %t7375 = load i64, ptr %t7374
  %t7376 = inttoptr i64 %t7375 to ptr
  %t7377 = call fastcc i64%t7376(i64 %t7372, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7378 = call i64 @rt_vector_length(i64 %t7377)
  %t7379 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7379)
  %t7380 = and i64 %t7379, -8
  %t7381 = inttoptr i64 %t7380 to ptr
  %t7382 = load i64, ptr %t7381
  %t7383 = inttoptr i64 %t7382 to ptr
  %t7384 = call fastcc i64%t7383(i64 %t7379, i64 3, i64 %a0, i64 %a1, i64 %t7378, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7385 = call i64 @rt_vector_ref(i64 %t7377, i64 %t7384)
  %t7386 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7386)
  %t7387 = and i64 %t7386, -8
  %t7388 = inttoptr i64 %t7387 to ptr
  %t7389 = load i64, ptr %t7388
  %t7390 = inttoptr i64 %t7389 to ptr
  %t7391 = call fastcc i64%t7390(i64 %t7386, i64 3, i64 %a0, i64 %a1, i64 %t7385, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7392 = icmp ne i64 %t7391, 1
  br i1 %t7392, label %then1588, label %else1589
then1588:
  ret i64 257
else1589:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7397 = icmp eq i64 %argc, 2
  br i1 %t7397, label %argok1591, label %arityerr1590
arityerr1590:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1591:
  %t7398 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7398)
  %t7399 = and i64 %t7398, -8
  %t7400 = inttoptr i64 %t7399 to ptr
  %t7401 = load i64, ptr %t7400
  %t7402 = inttoptr i64 %t7401 to ptr
  %t7403 = call fastcc i64%t7402(i64 %t7398, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7404 = call i64 @rt_vector_length(i64 %t7403)
  %t7405 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7405)
  %t7406 = and i64 %t7405, -8
  %t7407 = inttoptr i64 %t7406 to ptr
  %t7408 = load i64, ptr %t7407
  %t7409 = inttoptr i64 %t7408 to ptr
  %t7410 = call fastcc i64%t7409(i64 %t7405, i64 3, i64 %a0, i64 %a1, i64 %t7404, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7411 = call i64 @rt_vector_ref(i64 %t7403, i64 %t7410)
  %t7412 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7412)
  %t7413 = and i64 %t7412, -8
  %t7414 = inttoptr i64 %t7413 to ptr
  %t7415 = load i64, ptr %t7414
  %t7416 = inttoptr i64 %t7415 to ptr
  %t7417 = call fastcc i64%t7416(i64 %t7412, i64 3, i64 %a0, i64 %a1, i64 %t7411, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7418 = icmp ne i64 %t7417, 1
  br i1 %t7418, label %then1592, label %else1593
then1592:
  %t7419 = call i64 @rt_cdr(i64 %t7417)
  ret i64 %t7419
else1593:
  %t7420 = call i64 @rt_make_string(ptr @.str.lit.49, i64 29)
  %t7421 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7421)
  %t7422 = and i64 %t7421, -8
  %t7423 = inttoptr i64 %t7422 to ptr
  %t7424 = load i64, ptr %t7423
  %t7425 = inttoptr i64 %t7424 to ptr
  %t7426 = musttail call fastcc i64 %t7425(i64 %t7421, i64 2, i64 %t7420, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7426
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7431 = icmp eq i64 %argc, 3
  br i1 %t7431, label %argok1595, label %arityerr1594
arityerr1594:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1595:
  %t7432 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7432)
  %t7433 = and i64 %t7432, -8
  %t7434 = inttoptr i64 %t7433 to ptr
  %t7435 = load i64, ptr %t7434
  %t7436 = inttoptr i64 %t7435 to ptr
  %t7437 = call fastcc i64%t7436(i64 %t7432, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7438 = call i64 @rt_vector_length(i64 %t7437)
  %t7439 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7439)
  %t7440 = and i64 %t7439, -8
  %t7441 = inttoptr i64 %t7440 to ptr
  %t7442 = load i64, ptr %t7441
  %t7443 = inttoptr i64 %t7442 to ptr
  %t7444 = call fastcc i64%t7443(i64 %t7439, i64 3, i64 %a0, i64 %a1, i64 %t7438, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7445 = call i64 @rt_vector_ref(i64 %t7437, i64 %t7444)
  %t7446 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7446)
  %t7447 = and i64 %t7446, -8
  %t7448 = inttoptr i64 %t7447 to ptr
  %t7449 = load i64, ptr %t7448
  %t7450 = inttoptr i64 %t7449 to ptr
  %t7451 = call fastcc i64%t7450(i64 %t7446, i64 3, i64 %a0, i64 %a1, i64 %t7445, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7452 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t7453 = icmp ne i64 %t7451, 1
  br i1 %t7453, label %then1596, label %else1597
then1596:
  %t7454 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7454)
  %t7455 = and i64 %t7454, -8
  %t7456 = inttoptr i64 %t7455 to ptr
  %t7457 = load i64, ptr %t7456
  %t7458 = inttoptr i64 %t7457 to ptr
  %t7459 = call fastcc i64%t7458(i64 %t7454, i64 3, i64 %a0, i64 %a1, i64 %t7445, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1598
else1597:
  br label %merge1598
merge1598:
  %t7460 = phi i64 [ %t7459, %then1596 ], [ %t7445, %else1597 ]
  %t7461 = call i64 @rt_cons(i64 %t7452, i64 %t7460)
  %t7462 = call i64 @rt_vector_set(i64 %t7437, i64 %t7444, i64 %t7461)
  %t7463 = icmp ne i64 %t7451, 1
  br i1 %t7463, label %then1599, label %else1600
then1599:
  ret i64 1
else1600:
  %t7464 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7464)
  %t7465 = and i64 %t7464, -8
  %t7466 = inttoptr i64 %t7465 to ptr
  %t7467 = load i64, ptr %t7466
  %t7468 = inttoptr i64 %t7467 to ptr
  %t7469 = call fastcc i64%t7468(i64 %t7464, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7470 = or i64 %t7469, 8
  %t7471 = and i64 %t7470, 7
  %t7472 = icmp eq i64 %t7471, 0
  br i1 %t7472, label %fixfast1601, label %fixslow1602
fixfast1601:
  %t7473 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7469, i64 8)
  %t7474 = extractvalue {i64, i1} %t7473, 0
  %t7475 = extractvalue {i64, i1} %t7473, 1
  br i1 %t7475, label %fixslow1602, label %fixmerge1603
fixslow1602:
  %t7476 = call i64 @rt_add(i64 %t7469, i64 8)
  br label %fixmerge1603
fixmerge1603:
  %t7477 = phi i64 [ %t7474, %fixfast1601 ], [ %t7476, %fixslow1602 ]
  %t7478 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7478)
  %t7479 = and i64 %t7478, -8
  %t7480 = inttoptr i64 %t7479 to ptr
  %t7481 = load i64, ptr %t7480
  %t7482 = inttoptr i64 %t7481 to ptr
  %t7483 = call fastcc i64%t7482(i64 %t7478, i64 2, i64 %a0, i64 %t7477, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7484 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7484)
  %t7485 = and i64 %t7484, -8
  %t7486 = inttoptr i64 %t7485 to ptr
  %t7487 = load i64, ptr %t7486
  %t7488 = inttoptr i64 %t7487 to ptr
  %t7489 = call fastcc i64%t7488(i64 %t7484, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7490 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t7491 = or i64 %t7490, %t7438
  %t7492 = and i64 %t7491, 7
  %t7493 = icmp eq i64 %t7492, 0
  br i1 %t7493, label %fixfast1604, label %fixslow1605
fixfast1604:
  %t7494 = ashr i64 %t7490, 3
  %t7495 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7494, i64 %t7438)
  %t7496 = extractvalue {i64, i1} %t7495, 0
  %t7497 = extractvalue {i64, i1} %t7495, 1
  br i1 %t7497, label %fixslow1605, label %fixmerge1606
fixslow1605:
  %t7498 = call i64 @rt_mul(i64 %t7490, i64 %t7438)
  br label %fixmerge1606
fixmerge1606:
  %t7499 = phi i64 [ %t7496, %fixfast1604 ], [ %t7498, %fixslow1605 ]
  %t7500 = or i64 %t7499, %t7489
  %t7501 = and i64 %t7500, 7
  %t7502 = icmp eq i64 %t7501, 0
  br i1 %t7502, label %fixfast1607, label %fixslow1608
fixfast1607:
  %t7503 = icmp slt i64 %t7499, %t7489
  %t7504 = select i1 %t7503, i64 257, i64 1
  br label %fixmerge1609
fixslow1608:
  %t7505 = call i64 @rt_lt(i64 %t7499, i64 %t7489)
  br label %fixmerge1609
fixmerge1609:
  %t7506 = phi i64 [ %t7504, %fixfast1607 ], [ %t7505, %fixslow1608 ]
  %t7507 = icmp ne i64 %t7506, 1
  br i1 %t7507, label %then1610, label %else1611
then1610:
  %t7508 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t7508)
  %t7509 = and i64 %t7508, -8
  %t7510 = inttoptr i64 %t7509 to ptr
  %t7511 = load i64, ptr %t7510
  %t7512 = inttoptr i64 %t7511 to ptr
  %t7513 = musttail call fastcc i64 %t7512(i64 %t7508, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7513
else1611:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7518 = icmp eq i64 %argc, 2
  br i1 %t7518, label %argok1613, label %arityerr1612
arityerr1612:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1613:
  %t7519 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7519)
  %t7520 = and i64 %t7519, -8
  %t7521 = inttoptr i64 %t7520 to ptr
  %t7522 = load i64, ptr %t7521
  %t7523 = inttoptr i64 %t7522 to ptr
  %t7524 = call fastcc i64%t7523(i64 %t7519, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7525 = call i64 @rt_vector_length(i64 %t7524)
  %t7526 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7526)
  %t7527 = and i64 %t7526, -8
  %t7528 = inttoptr i64 %t7527 to ptr
  %t7529 = load i64, ptr %t7528
  %t7530 = inttoptr i64 %t7529 to ptr
  %t7531 = call fastcc i64%t7530(i64 %t7526, i64 3, i64 %a0, i64 %a1, i64 %t7525, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7532 = call i64 @rt_vector_ref(i64 %t7524, i64 %t7531)
  %t7533 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7533)
  %t7534 = and i64 %t7533, -8
  %t7535 = inttoptr i64 %t7534 to ptr
  %t7536 = load i64, ptr %t7535
  %t7537 = inttoptr i64 %t7536 to ptr
  %t7538 = call fastcc i64%t7537(i64 %t7533, i64 3, i64 %a0, i64 %a1, i64 %t7532, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7539 = icmp ne i64 %t7538, 1
  br i1 %t7539, label %then1614, label %else1615
then1614:
  %t7540 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7540)
  %t7541 = and i64 %t7540, -8
  %t7542 = inttoptr i64 %t7541 to ptr
  %t7543 = load i64, ptr %t7542
  %t7544 = inttoptr i64 %t7543 to ptr
  %t7545 = call fastcc i64%t7544(i64 %t7540, i64 3, i64 %a0, i64 %a1, i64 %t7532, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7546 = call i64 @rt_vector_set(i64 %t7524, i64 %t7531, i64 %t7545)
  %t7547 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7547)
  %t7548 = and i64 %t7547, -8
  %t7549 = inttoptr i64 %t7548 to ptr
  %t7550 = load i64, ptr %t7549
  %t7551 = inttoptr i64 %t7550 to ptr
  %t7552 = call fastcc i64%t7551(i64 %t7547, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7553 = or i64 %t7552, 8
  %t7554 = and i64 %t7553, 7
  %t7555 = icmp eq i64 %t7554, 0
  br i1 %t7555, label %fixfast1616, label %fixslow1617
fixfast1616:
  %t7556 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t7552, i64 8)
  %t7557 = extractvalue {i64, i1} %t7556, 0
  %t7558 = extractvalue {i64, i1} %t7556, 1
  br i1 %t7558, label %fixslow1617, label %fixmerge1618
fixslow1617:
  %t7559 = call i64 @rt_sub(i64 %t7552, i64 8)
  br label %fixmerge1618
fixmerge1618:
  %t7560 = phi i64 [ %t7557, %fixfast1616 ], [ %t7559, %fixslow1617 ]
  %t7561 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7561)
  %t7562 = and i64 %t7561, -8
  %t7563 = inttoptr i64 %t7562 to ptr
  %t7564 = load i64, ptr %t7563
  %t7565 = inttoptr i64 %t7564 to ptr
  %t7566 = musttail call fastcc i64 %t7565(i64 %t7561, i64 2, i64 %a0, i64 %t7560, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7566
else1615:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1225"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7571 = icmp eq i64 %argc, 1
  br i1 %t7571, label %argok1620, label %arityerr1619
arityerr1619:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1620:
  %t7572 = call i64 @rt_null_p(i64 %a0)
  %t7573 = icmp ne i64 %t7572, 1
  br i1 %t7573, label %then1621, label %else1622
then1621:
  ret i64 1
else1622:
  %t7574 = call i64 @rt_car(i64 %a0)
  %t7575 = and i64 %self, -8
  %t7576 = inttoptr i64 %t7575 to ptr
  %t7577 = getelementptr i64, ptr %t7576, i64 1
  %t7578 = load i64, ptr %t7577
  %t7579 = call i64 @rt_car(i64 %t7574)
  %t7580 = and i64 %self, -8
  %t7581 = inttoptr i64 %t7580 to ptr
  %t7582 = getelementptr i64, ptr %t7581, i64 2
  %t7583 = load i64, ptr %t7582
  %t7584 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7584)
  %t7585 = and i64 %t7584, -8
  %t7586 = inttoptr i64 %t7585 to ptr
  %t7587 = load i64, ptr %t7586
  %t7588 = inttoptr i64 %t7587 to ptr
  %t7589 = call fastcc i64%t7588(i64 %t7584, i64 3, i64 %t7578, i64 %t7579, i64 %t7583, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7590 = and i64 %self, -8
  %t7591 = inttoptr i64 %t7590 to ptr
  %t7592 = getelementptr i64, ptr %t7591, i64 3
  %t7593 = load i64, ptr %t7592
  %t7594 = and i64 %self, -8
  %t7595 = inttoptr i64 %t7594 to ptr
  %t7596 = getelementptr i64, ptr %t7595, i64 3
  %t7597 = load i64, ptr %t7596
  %t7598 = call i64 @rt_vector_ref(i64 %t7597, i64 %t7589)
  %t7599 = call i64 @rt_cons(i64 %t7574, i64 %t7598)
  %t7600 = call i64 @rt_vector_set(i64 %t7593, i64 %t7589, i64 %t7599)
  %t7601 = call i64 @rt_cdr(i64 %a0)
  %t7602 = musttail call fastcc i64 @"scheme.base:code_1225"(i64 %self, i64 1, i64 %t7601, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7602
}

define fastcc i64 @"scheme.base:code_1223"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7603 = icmp eq i64 %argc, 1
  br i1 %t7603, label %argok1624, label %arityerr1623
arityerr1623:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1624:
  %t7604 = and i64 %self, -8
  %t7605 = inttoptr i64 %t7604 to ptr
  %t7606 = getelementptr i64, ptr %t7605, i64 1
  %t7607 = load i64, ptr %t7606
  %t7608 = call i64 @rt_vector_length(i64 %t7607)
  %t7609 = or i64 %a0, %t7608
  %t7610 = and i64 %t7609, 7
  %t7611 = icmp eq i64 %t7610, 0
  br i1 %t7611, label %fixfast1625, label %fixslow1626
fixfast1625:
  %t7612 = icmp slt i64 %a0, %t7608
  %t7613 = select i1 %t7612, i64 257, i64 1
  br label %fixmerge1627
fixslow1626:
  %t7614 = call i64 @rt_lt(i64 %a0, i64 %t7608)
  br label %fixmerge1627
fixmerge1627:
  %t7615 = phi i64 [ %t7613, %fixfast1625 ], [ %t7614, %fixslow1626 ]
  %t7616 = icmp ne i64 %t7615, 1
  br i1 %t7616, label %then1628, label %else1629
then1628:
  %t7617 = call ptr @rt_alloc_words(i64 5)
  %t7618 = ptrtoint ptr %t7617 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1225" to i64), ptr %t7617
  %t7619 = or i64 %t7618, 4
  %t7620 = and i64 %self, -8
  %t7621 = inttoptr i64 %t7620 to ptr
  %t7622 = getelementptr i64, ptr %t7621, i64 2
  %t7623 = load i64, ptr %t7622
  %t7624 = getelementptr i64, ptr %t7617, i64 1
  store i64 %t7623, ptr %t7624
  %t7625 = and i64 %self, -8
  %t7626 = inttoptr i64 %t7625 to ptr
  %t7627 = getelementptr i64, ptr %t7626, i64 3
  %t7628 = load i64, ptr %t7627
  %t7629 = getelementptr i64, ptr %t7617, i64 2
  store i64 %t7628, ptr %t7629
  %t7630 = and i64 %self, -8
  %t7631 = inttoptr i64 %t7630 to ptr
  %t7632 = getelementptr i64, ptr %t7631, i64 4
  %t7633 = load i64, ptr %t7632
  %t7634 = getelementptr i64, ptr %t7617, i64 3
  store i64 %t7633, ptr %t7634
  %t7635 = getelementptr i64, ptr %t7617, i64 4
  store i64 %t7619, ptr %t7635
  %t7636 = and i64 %self, -8
  %t7637 = inttoptr i64 %t7636 to ptr
  %t7638 = getelementptr i64, ptr %t7637, i64 1
  %t7639 = load i64, ptr %t7638
  %t7640 = call i64 @rt_vector_ref(i64 %t7639, i64 %a0)
  %t7641 = call fastcc i64 @"scheme.base:code_1225"(i64 %t7619, i64 1, i64 %t7640, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7642 = or i64 %a0, 8
  %t7643 = and i64 %t7642, 7
  %t7644 = icmp eq i64 %t7643, 0
  br i1 %t7644, label %fixfast1630, label %fixslow1631
fixfast1630:
  %t7645 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7646 = extractvalue {i64, i1} %t7645, 0
  %t7647 = extractvalue {i64, i1} %t7645, 1
  br i1 %t7647, label %fixslow1631, label %fixmerge1632
fixslow1631:
  %t7648 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1632
fixmerge1632:
  %t7649 = phi i64 [ %t7646, %fixfast1630 ], [ %t7648, %fixslow1631 ]
  %t7650 = musttail call fastcc i64 @"scheme.base:code_1223"(i64 %self, i64 1, i64 %t7649, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7650
else1629:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7651 = icmp eq i64 %argc, 1
  br i1 %t7651, label %argok1634, label %arityerr1633
arityerr1633:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1634:
  %t7652 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7652)
  %t7653 = and i64 %t7652, -8
  %t7654 = inttoptr i64 %t7653 to ptr
  %t7655 = load i64, ptr %t7654
  %t7656 = inttoptr i64 %t7655 to ptr
  %t7657 = call fastcc i64%t7656(i64 %t7652, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7658 = call i64 @rt_vector_length(i64 %t7657)
  %t7659 = or i64 16, %t7658
  %t7660 = and i64 %t7659, 7
  %t7661 = icmp eq i64 %t7660, 0
  br i1 %t7661, label %fixfast1635, label %fixslow1636
fixfast1635:
  %t7662 = ashr i64 16, 3
  %t7663 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7662, i64 %t7658)
  %t7664 = extractvalue {i64, i1} %t7663, 0
  %t7665 = extractvalue {i64, i1} %t7663, 1
  br i1 %t7665, label %fixslow1636, label %fixmerge1637
fixslow1636:
  %t7666 = call i64 @rt_mul(i64 16, i64 %t7658)
  br label %fixmerge1637
fixmerge1637:
  %t7667 = phi i64 [ %t7664, %fixfast1635 ], [ %t7666, %fixslow1636 ]
  %t7668 = call i64 @rt_make_vector(i64 %t7667, i64 2)
  %t7669 = call ptr @rt_alloc_words(i64 6)
  %t7670 = ptrtoint ptr %t7669 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1223" to i64), ptr %t7669
  %t7671 = or i64 %t7670, 4
  %t7672 = getelementptr i64, ptr %t7669, i64 1
  store i64 %t7657, ptr %t7672
  %t7673 = getelementptr i64, ptr %t7669, i64 2
  store i64 %a0, ptr %t7673
  %t7674 = getelementptr i64, ptr %t7669, i64 3
  store i64 %t7667, ptr %t7674
  %t7675 = getelementptr i64, ptr %t7669, i64 4
  store i64 %t7668, ptr %t7675
  %t7676 = getelementptr i64, ptr %t7669, i64 5
  store i64 %t7671, ptr %t7676
  %t7677 = call fastcc i64 @"scheme.base:code_1223"(i64 %t7671, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7678 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t7678)
  %t7679 = and i64 %t7678, -8
  %t7680 = inttoptr i64 %t7679 to ptr
  %t7681 = load i64, ptr %t7680
  %t7682 = inttoptr i64 %t7681 to ptr
  %t7683 = musttail call fastcc i64 %t7682(i64 %t7678, i64 2, i64 %a0, i64 %t7668, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7683
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7688 = icmp eq i64 %argc, 1
  br i1 %t7688, label %argok1639, label %arityerr1638
arityerr1638:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1639:
  %t7689 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7689)
  %t7690 = and i64 %t7689, -8
  %t7691 = inttoptr i64 %t7690 to ptr
  %t7692 = load i64, ptr %t7691
  %t7693 = inttoptr i64 %t7692 to ptr
  %t7694 = musttail call fastcc i64 %t7693(i64 %t7689, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7694
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7699 = icmp eq i64 %argc, 2
  br i1 %t7699, label %argok1641, label %arityerr1640
arityerr1640:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1641:
  %t7700 = call i64 @rt_null_p(i64 %a0)
  %t7701 = icmp ne i64 %t7700, 1
  br i1 %t7701, label %then1642, label %else1643
then1642:
  ret i64 %a1
else1643:
  %t7702 = call i64 @rt_car(i64 %a0)
  %t7703 = call i64 @rt_car(i64 %t7702)
  %t7704 = call i64 @rt_car(i64 %a0)
  %t7705 = call i64 @rt_cdr(i64 %t7704)
  %t7706 = call i64 @rt_cons(i64 %t7703, i64 %t7705)
  %t7707 = call i64 @rt_cdr(i64 %a0)
  %t7708 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7708)
  %t7709 = and i64 %t7708, -8
  %t7710 = inttoptr i64 %t7709 to ptr
  %t7711 = load i64, ptr %t7710
  %t7712 = inttoptr i64 %t7711 to ptr
  %t7713 = call fastcc i64%t7712(i64 %t7708, i64 2, i64 %t7707, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7714 = call i64 @rt_cons(i64 %t7706, i64 %t7713)
  ret i64 %t7714
}

define fastcc i64 @"scheme.base:code_1242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7719 = icmp eq i64 %argc, 2
  br i1 %t7719, label %argok1645, label %arityerr1644
arityerr1644:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1645:
  %t7720 = and i64 %self, -8
  %t7721 = inttoptr i64 %t7720 to ptr
  %t7722 = getelementptr i64, ptr %t7721, i64 1
  %t7723 = load i64, ptr %t7722
  %t7724 = call i64 @rt_vector_length(i64 %t7723)
  %t7725 = or i64 %a0, %t7724
  %t7726 = and i64 %t7725, 7
  %t7727 = icmp eq i64 %t7726, 0
  br i1 %t7727, label %fixfast1646, label %fixslow1647
fixfast1646:
  %t7728 = icmp slt i64 %a0, %t7724
  %t7729 = select i1 %t7728, i64 257, i64 1
  br label %fixmerge1648
fixslow1647:
  %t7730 = call i64 @rt_lt(i64 %a0, i64 %t7724)
  br label %fixmerge1648
fixmerge1648:
  %t7731 = phi i64 [ %t7729, %fixfast1646 ], [ %t7730, %fixslow1647 ]
  %t7732 = icmp ne i64 %t7731, 1
  br i1 %t7732, label %then1649, label %else1650
then1649:
  %t7733 = or i64 %a0, 8
  %t7734 = and i64 %t7733, 7
  %t7735 = icmp eq i64 %t7734, 0
  br i1 %t7735, label %fixfast1651, label %fixslow1652
fixfast1651:
  %t7736 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7737 = extractvalue {i64, i1} %t7736, 0
  %t7738 = extractvalue {i64, i1} %t7736, 1
  br i1 %t7738, label %fixslow1652, label %fixmerge1653
fixslow1652:
  %t7739 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1653
fixmerge1653:
  %t7740 = phi i64 [ %t7737, %fixfast1651 ], [ %t7739, %fixslow1652 ]
  %t7741 = and i64 %self, -8
  %t7742 = inttoptr i64 %t7741 to ptr
  %t7743 = getelementptr i64, ptr %t7742, i64 1
  %t7744 = load i64, ptr %t7743
  %t7745 = call i64 @rt_vector_ref(i64 %t7744, i64 %a0)
  %t7746 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7746)
  %t7747 = and i64 %t7746, -8
  %t7748 = inttoptr i64 %t7747 to ptr
  %t7749 = load i64, ptr %t7748
  %t7750 = inttoptr i64 %t7749 to ptr
  %t7751 = call fastcc i64%t7750(i64 %t7746, i64 2, i64 %t7745, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7752 = musttail call fastcc i64 @"scheme.base:code_1242"(i64 %self, i64 2, i64 %t7740, i64 %t7751, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7752
else1650:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7753 = icmp eq i64 %argc, 1
  br i1 %t7753, label %argok1655, label %arityerr1654
arityerr1654:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1655:
  %t7754 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7754)
  %t7755 = and i64 %t7754, -8
  %t7756 = inttoptr i64 %t7755 to ptr
  %t7757 = load i64, ptr %t7756
  %t7758 = inttoptr i64 %t7757 to ptr
  %t7759 = call fastcc i64%t7758(i64 %t7754, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7760 = call ptr @rt_alloc_words(i64 3)
  %t7761 = ptrtoint ptr %t7760 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1242" to i64), ptr %t7760
  %t7762 = or i64 %t7761, 4
  %t7763 = getelementptr i64, ptr %t7760, i64 1
  store i64 %t7759, ptr %t7763
  %t7764 = getelementptr i64, ptr %t7760, i64 2
  store i64 %t7762, ptr %t7764
  %t7765 = musttail call fastcc i64 @"scheme.base:code_1242"(i64 %t7762, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7765
}

define fastcc i64 @"scheme.base:code_1247"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7770 = icmp eq i64 %argc, 1
  br i1 %t7770, label %argok1657, label %arityerr1656
arityerr1656:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1657:
  %t7771 = call i64 @rt_car(i64 %a0)
  ret i64 %t7771
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7772 = icmp eq i64 %argc, 1
  br i1 %t7772, label %argok1659, label %arityerr1658
arityerr1658:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1659:
  %t7773 = call ptr @rt_alloc_words(i64 1)
  %t7774 = ptrtoint ptr %t7773 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1247" to i64), ptr %t7773
  %t7775 = or i64 %t7774, 4
  %t7776 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7776)
  %t7777 = and i64 %t7776, -8
  %t7778 = inttoptr i64 %t7777 to ptr
  %t7779 = load i64, ptr %t7778
  %t7780 = inttoptr i64 %t7779 to ptr
  %t7781 = call fastcc i64%t7780(i64 %t7776, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7782 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7782)
  %t7783 = and i64 %t7782, -8
  %t7784 = inttoptr i64 %t7783 to ptr
  %t7785 = load i64, ptr %t7784
  %t7786 = inttoptr i64 %t7785 to ptr
  %t7787 = musttail call fastcc i64 %t7786(i64 %t7782, i64 2, i64 %t7775, i64 %t7781, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7787
}

define fastcc i64 @"scheme.base:code_1252"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7792 = icmp eq i64 %argc, 1
  br i1 %t7792, label %argok1661, label %arityerr1660
arityerr1660:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1661:
  %t7793 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t7793
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7794 = icmp eq i64 %argc, 1
  br i1 %t7794, label %argok1663, label %arityerr1662
arityerr1662:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1663:
  %t7795 = call ptr @rt_alloc_words(i64 1)
  %t7796 = ptrtoint ptr %t7795 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1252" to i64), ptr %t7795
  %t7797 = or i64 %t7796, 4
  %t7798 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7798)
  %t7799 = and i64 %t7798, -8
  %t7800 = inttoptr i64 %t7799 to ptr
  %t7801 = load i64, ptr %t7800
  %t7802 = inttoptr i64 %t7801 to ptr
  %t7803 = call fastcc i64%t7802(i64 %t7798, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7804 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7804)
  %t7805 = and i64 %t7804, -8
  %t7806 = inttoptr i64 %t7805 to ptr
  %t7807 = load i64, ptr %t7806
  %t7808 = inttoptr i64 %t7807 to ptr
  %t7809 = musttail call fastcc i64 %t7808(i64 %t7804, i64 2, i64 %t7797, i64 %t7803, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7809
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7814 = icmp eq i64 %argc, 3
  br i1 %t7814, label %argok1665, label %arityerr1664
arityerr1664:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1665:
  %t7815 = call i64 @rt_car(i64 %a2)
  %t7816 = call i64 @rt_cdr(i64 %a2)
  %t7817 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t7818 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t7817, i64 1, i64 %t7816, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7819 = call i64 @rt_intern(ptr @.str.sym.50)
  %t7820 = call i64 @rt_eq_p(i64 %t7815, i64 %t7819)
  %t7821 = icmp ne i64 %t7820, 1
  br i1 %t7821, label %then1666, label %else1667
then1666:
  %t7822 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7823 = call i64 @rt_make_string(ptr @.str.lit.51, i64 45)
  %t7824 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7824)
  %t7825 = and i64 %t7824, -8
  %t7826 = inttoptr i64 %t7825 to ptr
  %t7827 = load i64, ptr %t7826
  %t7828 = inttoptr i64 %t7827 to ptr
  %t7829 = musttail call fastcc i64 %t7828(i64 %t7824, i64 3, i64 %t7822, i64 %t7823, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7829
else1667:
  %t7830 = call i64 @rt_intern(ptr @.str.sym.52)
  %t7831 = call i64 @rt_eq_p(i64 %t7815, i64 %t7830)
  %t7832 = icmp ne i64 %t7831, 1
  br i1 %t7832, label %then1668, label %else1669
then1668:
  %t7833 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7834 = call i64 @rt_make_string(ptr @.str.lit.53, i64 41)
  %t7835 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7835)
  %t7836 = and i64 %t7835, -8
  %t7837 = inttoptr i64 %t7836 to ptr
  %t7838 = load i64, ptr %t7837
  %t7839 = inttoptr i64 %t7838 to ptr
  %t7840 = musttail call fastcc i64 %t7839(i64 %t7835, i64 3, i64 %t7833, i64 %t7834, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7840
else1669:
  %t7841 = call i64 @rt_intern(ptr @.str.sym.54)
  %t7842 = call i64 @rt_eq_p(i64 %t7815, i64 %t7841)
  %t7843 = icmp ne i64 %t7842, 1
  br i1 %t7843, label %then1670, label %else1671
then1670:
  %t7844 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7845 = call i64 @rt_make_string(ptr @.str.lit.55, i64 13)
  %t7846 = call i64 @rt_string_ref(i64 %a0, i64 %t7818)
  %t7847 = call i64 @rt_char_to_integer(i64 %t7846)
  %t7848 = or i64 %t7847, 728
  %t7849 = and i64 %t7848, 7
  %t7850 = icmp eq i64 %t7849, 0
  br i1 %t7850, label %fixfast1672, label %fixslow1673
fixfast1672:
  %t7851 = icmp eq i64 %t7847, 728
  %t7852 = select i1 %t7851, i64 257, i64 1
  br label %fixmerge1674
fixslow1673:
  %t7853 = call i64 @rt_num_eq(i64 %t7847, i64 728)
  br label %fixmerge1674
fixmerge1674:
  %t7854 = phi i64 [ %t7852, %fixfast1672 ], [ %t7853, %fixslow1673 ]
  %t7855 = icmp ne i64 %t7854, 1
  br i1 %t7855, label %then1675, label %else1676
then1675:
  %t7856 = call i64 @rt_make_string(ptr @.str.lit.56, i64 6)
  br label %merge1677
else1676:
  %t7857 = or i64 %t7847, 280
  %t7858 = and i64 %t7857, 7
  %t7859 = icmp eq i64 %t7858, 0
  br i1 %t7859, label %fixfast1678, label %fixslow1679
fixfast1678:
  %t7860 = icmp eq i64 %t7847, 280
  %t7861 = select i1 %t7860, i64 257, i64 1
  br label %fixmerge1680
fixslow1679:
  %t7862 = call i64 @rt_num_eq(i64 %t7847, i64 280)
  br label %fixmerge1680
fixmerge1680:
  %t7863 = phi i64 [ %t7861, %fixfast1678 ], [ %t7862, %fixslow1679 ]
  %t7864 = icmp ne i64 %t7863, 1
  br i1 %t7864, label %then1681, label %else1682
then1681:
  %t7865 = or i64 %t7818, 8
  %t7866 = and i64 %t7865, 7
  %t7867 = icmp eq i64 %t7866, 0
  br i1 %t7867, label %fixfast1684, label %fixslow1685
fixfast1684:
  %t7868 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7818, i64 8)
  %t7869 = extractvalue {i64, i1} %t7868, 0
  %t7870 = extractvalue {i64, i1} %t7868, 1
  br i1 %t7870, label %fixslow1685, label %fixmerge1686
fixslow1685:
  %t7871 = call i64 @rt_add(i64 %t7818, i64 8)
  br label %fixmerge1686
fixmerge1686:
  %t7872 = phi i64 [ %t7869, %fixfast1684 ], [ %t7871, %fixslow1685 ]
  %t7873 = or i64 %t7872, %a1
  %t7874 = and i64 %t7873, 7
  %t7875 = icmp eq i64 %t7874, 0
  br i1 %t7875, label %fixfast1687, label %fixslow1688
fixfast1687:
  %t7876 = icmp slt i64 %t7872, %a1
  %t7877 = select i1 %t7876, i64 257, i64 1
  br label %fixmerge1689
fixslow1688:
  %t7878 = call i64 @rt_lt(i64 %t7872, i64 %a1)
  br label %fixmerge1689
fixmerge1689:
  %t7879 = phi i64 [ %t7877, %fixfast1687 ], [ %t7878, %fixslow1688 ]
  %t7880 = icmp ne i64 %t7879, 1
  br i1 %t7880, label %then1690, label %else1691
then1690:
  %t7881 = or i64 %t7818, 8
  %t7882 = and i64 %t7881, 7
  %t7883 = icmp eq i64 %t7882, 0
  br i1 %t7883, label %fixfast1693, label %fixslow1694
fixfast1693:
  %t7884 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7818, i64 8)
  %t7885 = extractvalue {i64, i1} %t7884, 0
  %t7886 = extractvalue {i64, i1} %t7884, 1
  br i1 %t7886, label %fixslow1694, label %fixmerge1695
fixslow1694:
  %t7887 = call i64 @rt_add(i64 %t7818, i64 8)
  br label %fixmerge1695
fixmerge1695:
  %t7888 = phi i64 [ %t7885, %fixfast1693 ], [ %t7887, %fixslow1694 ]
  %t7889 = call i64 @rt_string_ref(i64 %a0, i64 %t7888)
  %t7890 = call i64 @rt_char_to_integer(i64 %t7889)
  %t7891 = or i64 %t7890, 936
  %t7892 = and i64 %t7891, 7
  %t7893 = icmp eq i64 %t7892, 0
  br i1 %t7893, label %fixfast1696, label %fixslow1697
fixfast1696:
  %t7894 = icmp eq i64 %t7890, 936
  %t7895 = select i1 %t7894, i64 257, i64 1
  br label %fixmerge1698
fixslow1697:
  %t7896 = call i64 @rt_num_eq(i64 %t7890, i64 936)
  br label %fixmerge1698
fixmerge1698:
  %t7897 = phi i64 [ %t7895, %fixfast1696 ], [ %t7896, %fixslow1697 ]
  br label %merge1692
else1691:
  br label %merge1692
merge1692:
  %t7898 = phi i64 [ %t7897, %fixmerge1698 ], [ 1, %else1691 ]
  br label %merge1683
else1682:
  br label %merge1683
merge1683:
  %t7899 = phi i64 [ %t7898, %merge1692 ], [ 1, %else1682 ]
  %t7900 = icmp ne i64 %t7899, 1
  br i1 %t7900, label %then1699, label %else1700
then1699:
  %t7901 = call i64 @rt_make_string(ptr @.str.lit.57, i64 15)
  br label %merge1701
else1700:
  %t7902 = or i64 %t7847, 280
  %t7903 = and i64 %t7902, 7
  %t7904 = icmp eq i64 %t7903, 0
  br i1 %t7904, label %fixfast1702, label %fixslow1703
fixfast1702:
  %t7905 = icmp eq i64 %t7847, 280
  %t7906 = select i1 %t7905, i64 257, i64 1
  br label %fixmerge1704
fixslow1703:
  %t7907 = call i64 @rt_num_eq(i64 %t7847, i64 280)
  br label %fixmerge1704
fixmerge1704:
  %t7908 = phi i64 [ %t7906, %fixfast1702 ], [ %t7907, %fixslow1703 ]
  %t7909 = icmp ne i64 %t7908, 1
  br i1 %t7909, label %then1705, label %else1706
then1705:
  %t7910 = call i64 @rt_make_string(ptr @.str.lit.58, i64 9)
  br label %merge1707
else1706:
  %t7911 = call i64 @rt_make_string(ptr @.str.lit.59, i64 6)
  br label %merge1707
merge1707:
  %t7912 = phi i64 [ %t7910, %then1705 ], [ %t7911, %else1706 ]
  br label %merge1701
merge1701:
  %t7913 = phi i64 [ %t7901, %then1699 ], [ %t7912, %merge1707 ]
  br label %merge1677
merge1677:
  %t7914 = phi i64 [ %t7856, %then1675 ], [ %t7913, %merge1701 ]
  %t7915 = call i64 @rt_string_append(i64 %t7845, i64 %t7914)
  %t7916 = call i64 @rt_make_string(ptr @.str.lit.60, i64 16)
  %t7917 = call i64 @rt_string_append(i64 %t7915, i64 %t7916)
  %t7918 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7918)
  %t7919 = and i64 %t7918, -8
  %t7920 = inttoptr i64 %t7919 to ptr
  %t7921 = load i64, ptr %t7920
  %t7922 = inttoptr i64 %t7921 to ptr
  %t7923 = musttail call fastcc i64 %t7922(i64 %t7918, i64 3, i64 %t7844, i64 %t7917, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7923
else1671:
  %t7924 = call i64 @rt_intern(ptr @.str.sym.61)
  %t7925 = call i64 @rt_eq_p(i64 %t7815, i64 %t7924)
  %t7926 = icmp ne i64 %t7925, 1
  br i1 %t7926, label %then1708, label %else1709
then1708:
  %t7927 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7928 = call i64 @rt_make_string(ptr @.str.lit.62, i64 37)
  %t7929 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7929)
  %t7930 = and i64 %t7929, -8
  %t7931 = inttoptr i64 %t7930 to ptr
  %t7932 = load i64, ptr %t7931
  %t7933 = inttoptr i64 %t7932 to ptr
  %t7934 = musttail call fastcc i64 %t7933(i64 %t7929, i64 3, i64 %t7927, i64 %t7928, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7934
else1709:
  %t7935 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7936 = call i64 @rt_eq_p(i64 %t7815, i64 %t7935)
  %t7937 = icmp ne i64 %t7936, 1
  br i1 %t7937, label %then1710, label %else1711
then1710:
  %t7938 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7939 = call i64 @rt_make_string(ptr @.str.lit.64, i64 22)
  %t7940 = load i64, ptr @"emit.internal:rd-token-at"
  %t7941 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7940, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7942 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7942)
  %t7943 = and i64 %t7942, -8
  %t7944 = inttoptr i64 %t7943 to ptr
  %t7945 = load i64, ptr %t7944
  %t7946 = inttoptr i64 %t7945 to ptr
  %t7947 = musttail call fastcc i64 %t7946(i64 %t7942, i64 3, i64 %t7938, i64 %t7939, i64 %t7941, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7947
else1711:
  %t7948 = call i64 @rt_intern(ptr @.str.sym.65)
  %t7949 = call i64 @rt_eq_p(i64 %t7815, i64 %t7948)
  %t7950 = icmp ne i64 %t7949, 1
  br i1 %t7950, label %then1712, label %else1713
then1712:
  %t7951 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7952 = call i64 @rt_make_string(ptr @.str.lit.66, i64 44)
  %t7953 = load i64, ptr @"emit.internal:rd-token-at"
  %t7954 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7953, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7955 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7955)
  %t7956 = and i64 %t7955, -8
  %t7957 = inttoptr i64 %t7956 to ptr
  %t7958 = load i64, ptr %t7957
  %t7959 = inttoptr i64 %t7958 to ptr
  %t7960 = musttail call fastcc i64 %t7959(i64 %t7955, i64 3, i64 %t7951, i64 %t7952, i64 %t7954, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7960
else1713:
  %t7961 = call i64 @rt_intern(ptr @.str.sym.67)
  %t7962 = call i64 @rt_eq_p(i64 %t7815, i64 %t7961)
  %t7963 = icmp ne i64 %t7962, 1
  br i1 %t7963, label %then1714, label %else1715
then1714:
  %t7964 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7965 = call i64 @rt_make_string(ptr @.str.lit.68, i64 21)
  %t7966 = load i64, ptr @"emit.internal:rd-token-at"
  %t7967 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7966, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7968 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7968)
  %t7969 = and i64 %t7968, -8
  %t7970 = inttoptr i64 %t7969 to ptr
  %t7971 = load i64, ptr %t7970
  %t7972 = inttoptr i64 %t7971 to ptr
  %t7973 = musttail call fastcc i64 %t7972(i64 %t7968, i64 3, i64 %t7964, i64 %t7965, i64 %t7967, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7973
else1715:
  %t7974 = call i64 @rt_intern(ptr @.str.sym.69)
  %t7975 = call i64 @rt_eq_p(i64 %t7815, i64 %t7974)
  %t7976 = icmp ne i64 %t7975, 1
  br i1 %t7976, label %then1716, label %else1717
then1716:
  %t7977 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7978 = call i64 @rt_make_string(ptr @.str.lit.70, i64 47)
  %t7979 = load i64, ptr @"emit.internal:rd-token-at"
  %t7980 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7979, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7981 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7981)
  %t7982 = and i64 %t7981, -8
  %t7983 = inttoptr i64 %t7982 to ptr
  %t7984 = load i64, ptr %t7983
  %t7985 = inttoptr i64 %t7984 to ptr
  %t7986 = musttail call fastcc i64 %t7985(i64 %t7981, i64 3, i64 %t7977, i64 %t7978, i64 %t7980, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7986
else1717:
  %t7987 = call i64 @rt_intern(ptr @.str.sym.71)
  %t7988 = call i64 @rt_eq_p(i64 %t7815, i64 %t7987)
  %t7989 = icmp ne i64 %t7988, 1
  br i1 %t7989, label %then1718, label %else1719
then1718:
  %t7990 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7991 = call i64 @rt_make_string(ptr @.str.lit.72, i64 55)
  %t7992 = load i64, ptr @"emit.internal:rd-token-at"
  %t7993 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7992, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7994 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7994)
  %t7995 = and i64 %t7994, -8
  %t7996 = inttoptr i64 %t7995 to ptr
  %t7997 = load i64, ptr %t7996
  %t7998 = inttoptr i64 %t7997 to ptr
  %t7999 = musttail call fastcc i64 %t7998(i64 %t7994, i64 3, i64 %t7990, i64 %t7991, i64 %t7993, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7999
else1719:
  %t8000 = call i64 @rt_intern(ptr @.str.sym.73)
  %t8001 = call i64 @rt_eq_p(i64 %t7815, i64 %t8000)
  %t8002 = icmp ne i64 %t8001, 1
  br i1 %t8002, label %then1720, label %else1721
then1720:
  %t8003 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8004 = call i64 @rt_make_string(ptr @.str.lit.74, i64 21)
  %t8005 = load i64, ptr @"emit.internal:rd-token-at"
  %t8006 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8005, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8007 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8007)
  %t8008 = and i64 %t8007, -8
  %t8009 = inttoptr i64 %t8008 to ptr
  %t8010 = load i64, ptr %t8009
  %t8011 = inttoptr i64 %t8010 to ptr
  %t8012 = musttail call fastcc i64 %t8011(i64 %t8007, i64 3, i64 %t8003, i64 %t8004, i64 %t8006, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8012
else1721:
  %t8013 = call i64 @rt_intern(ptr @.str.sym.75)
  %t8014 = call i64 @rt_eq_p(i64 %t7815, i64 %t8013)
  %t8015 = icmp ne i64 %t8014, 1
  br i1 %t8015, label %then1722, label %else1723
then1722:
  %t8016 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8017 = call i64 @rt_make_string(ptr @.str.lit.76, i64 49)
  %t8018 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8018)
  %t8019 = and i64 %t8018, -8
  %t8020 = inttoptr i64 %t8019 to ptr
  %t8021 = load i64, ptr %t8020
  %t8022 = inttoptr i64 %t8021 to ptr
  %t8023 = musttail call fastcc i64 %t8022(i64 %t8018, i64 3, i64 %t8016, i64 %t8017, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8023
else1723:
  %t8024 = call i64 @rt_intern(ptr @.str.sym.77)
  %t8025 = call i64 @rt_eq_p(i64 %t7815, i64 %t8024)
  %t8026 = icmp ne i64 %t8025, 1
  br i1 %t8026, label %then1724, label %else1725
then1724:
  %t8027 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8028 = call i64 @rt_make_string(ptr @.str.lit.78, i64 23)
  %t8029 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8029)
  %t8030 = and i64 %t8029, -8
  %t8031 = inttoptr i64 %t8030 to ptr
  %t8032 = load i64, ptr %t8031
  %t8033 = inttoptr i64 %t8032 to ptr
  %t8034 = musttail call fastcc i64 %t8033(i64 %t8029, i64 3, i64 %t8027, i64 %t8028, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8034
else1725:
  %t8035 = call i64 @rt_intern(ptr @.str.sym.79)
  %t8036 = call i64 @rt_eq_p(i64 %t7815, i64 %t8035)
  %t8037 = icmp ne i64 %t8036, 1
  br i1 %t8037, label %then1726, label %else1727
then1726:
  %t8038 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8039 = call i64 @rt_make_string(ptr @.str.lit.80, i64 56)
  %t8040 = call i64 @rt_make_string(ptr @.str.lit.81, i64 38)
  %t8041 = call i64 @rt_string_append(i64 %t8039, i64 %t8040)
  %t8042 = load i64, ptr @"emit.internal:rd-token-at"
  %t8043 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8042, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8044 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8044)
  %t8045 = and i64 %t8044, -8
  %t8046 = inttoptr i64 %t8045 to ptr
  %t8047 = load i64, ptr %t8046
  %t8048 = inttoptr i64 %t8047 to ptr
  %t8049 = musttail call fastcc i64 %t8048(i64 %t8044, i64 3, i64 %t8038, i64 %t8041, i64 %t8043, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8049
else1727:
  %t8050 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8051 = call i64 @rt_make_string(ptr @.str.lit.82, i64 19)
  %t8052 = load i64, ptr @"emit.internal:rd-token-at"
  %t8053 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8052, i64 3, i64 %a0, i64 %a1, i64 %t7818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8054 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8054)
  %t8055 = and i64 %t8054, -8
  %t8056 = inttoptr i64 %t8055 to ptr
  %t8057 = load i64, ptr %t8056
  %t8058 = inttoptr i64 %t8057 to ptr
  %t8059 = musttail call fastcc i64 %t8058(i64 %t8054, i64 3, i64 %t8050, i64 %t8051, i64 %t8053, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8059
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8064 = icmp eq i64 %argc, 1
  br i1 %t8064, label %argok1729, label %arityerr1728
arityerr1728:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1729:
  %t8065 = call i64 @rt_string_length(i64 %a0)
  %t8066 = load i64, ptr @"emit.internal:rd-state"
  %t8067 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8066, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8068 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8069 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8068, i64 4, i64 %a0, i64 %t8065, i64 0, i64 %t8067, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8070 = load i64, ptr @"emit.internal:rd-datum"
  %t8071 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8070, i64 4, i64 %a0, i64 %t8065, i64 %t8069, i64 %t8067, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8072 = load i64, ptr @"emit.internal:rd-finish"
  %t8073 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8072, i64 2, i64 %t8067, i64 %t8071, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8074 = call i64 @rt_cdr(i64 %t8073)
  %t8075 = load i64, ptr @"emit.internal:rd-fail?"
  %t8076 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8075, i64 1, i64 %t8074, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8077 = icmp ne i64 %t8076, 1
  br i1 %t8077, label %then1730, label %else1731
then1730:
  %t8078 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8078)
  %t8079 = and i64 %t8078, -8
  %t8080 = inttoptr i64 %t8079 to ptr
  %t8081 = load i64, ptr %t8080
  %t8082 = inttoptr i64 %t8081 to ptr
  %t8083 = musttail call fastcc i64 %t8082(i64 %t8078, i64 3, i64 %a0, i64 %t8065, i64 %t8073, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8083
else1731:
  %t8084 = call i64 @rt_car(i64 %t8073)
  ret i64 %t8084
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8089 = icmp eq i64 %argc, 1
  br i1 %t8089, label %argok1733, label %arityerr1732
arityerr1732:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1733:
  %t8090 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8090)
  %t8091 = and i64 %t8090, -8
  %t8092 = inttoptr i64 %t8091 to ptr
  %t8093 = load i64, ptr %t8092
  %t8094 = inttoptr i64 %t8093 to ptr
  %t8095 = musttail call fastcc i64 %t8094(i64 %t8090, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8095
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8100 = icmp eq i64 %argc, 1
  br i1 %t8100, label %argok1735, label %arityerr1734
arityerr1734:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1735:
  %t8101 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8101)
  %t8102 = and i64 %t8101, -8
  %t8103 = inttoptr i64 %t8102 to ptr
  %t8104 = load i64, ptr %t8103
  %t8105 = inttoptr i64 %t8104 to ptr
  %t8106 = musttail call fastcc i64 %t8105(i64 %t8101, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8106
}

define fastcc i64 @"scheme.base:code_1356"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8111 = icmp eq i64 %argc, 2
  br i1 %t8111, label %argok1737, label %arityerr1736
arityerr1736:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1737:
  %t8112 = load i64, ptr @"emit.internal:rd-fail?"
  %t8113 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8112, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8114 = icmp ne i64 %t8113, 1
  br i1 %t8114, label %then1738, label %else1739
then1738:
  %t8115 = and i64 %self, -8
  %t8116 = inttoptr i64 %t8115 to ptr
  %t8117 = getelementptr i64, ptr %t8116, i64 1
  %t8118 = load i64, ptr %t8117
  %t8119 = and i64 %self, -8
  %t8120 = inttoptr i64 %t8119 to ptr
  %t8121 = getelementptr i64, ptr %t8120, i64 2
  %t8122 = load i64, ptr %t8121
  %t8123 = call i64 @rt_intern(ptr @.str.sym.50)
  %t8124 = call i64 @rt_cons(i64 %t8123, i64 %a0)
  %t8125 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8125)
  %t8126 = and i64 %t8125, -8
  %t8127 = inttoptr i64 %t8126 to ptr
  %t8128 = load i64, ptr %t8127
  %t8129 = inttoptr i64 %t8128 to ptr
  %t8130 = musttail call fastcc i64 %t8129(i64 %t8125, i64 3, i64 %t8118, i64 %t8122, i64 %t8124, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8130
else1739:
  %t8131 = and i64 %self, -8
  %t8132 = inttoptr i64 %t8131 to ptr
  %t8133 = getelementptr i64, ptr %t8132, i64 2
  %t8134 = load i64, ptr %t8133
  %t8135 = or i64 %a0, %t8134
  %t8136 = and i64 %t8135, 7
  %t8137 = icmp eq i64 %t8136, 0
  br i1 %t8137, label %fixfast1740, label %fixslow1741
fixfast1740:
  %t8138 = icmp slt i64 %a0, %t8134
  %t8139 = select i1 %t8138, i64 257, i64 1
  br label %fixmerge1742
fixslow1741:
  %t8140 = call i64 @rt_lt(i64 %a0, i64 %t8134)
  br label %fixmerge1742
fixmerge1742:
  %t8141 = phi i64 [ %t8139, %fixfast1740 ], [ %t8140, %fixslow1741 ]
  %t8142 = icmp ne i64 %t8141, 1
  br i1 %t8142, label %then1743, label %else1744
then1743:
  %t8143 = and i64 %self, -8
  %t8144 = inttoptr i64 %t8143 to ptr
  %t8145 = getelementptr i64, ptr %t8144, i64 3
  %t8146 = load i64, ptr %t8145
  %t8147 = load i64, ptr @"emit.internal:rd-state-child"
  %t8148 = call fastcc i64 @"emit.internal:code:rd-state-child"(i64 %t8147, i64 1, i64 %t8146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8149 = and i64 %self, -8
  %t8150 = inttoptr i64 %t8149 to ptr
  %t8151 = getelementptr i64, ptr %t8150, i64 1
  %t8152 = load i64, ptr %t8151
  %t8153 = and i64 %self, -8
  %t8154 = inttoptr i64 %t8153 to ptr
  %t8155 = getelementptr i64, ptr %t8154, i64 2
  %t8156 = load i64, ptr %t8155
  %t8157 = load i64, ptr @"emit.internal:rd-datum"
  %t8158 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8157, i64 4, i64 %t8152, i64 %t8156, i64 %a0, i64 %t8148, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8159 = load i64, ptr @"emit.internal:rd-finish"
  %t8160 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8159, i64 2, i64 %t8148, i64 %t8158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8161 = call i64 @rt_cdr(i64 %t8160)
  %t8162 = load i64, ptr @"emit.internal:rd-fail?"
  %t8163 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8162, i64 1, i64 %t8161, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8164 = icmp ne i64 %t8163, 1
  br i1 %t8164, label %then1745, label %else1746
then1745:
  %t8165 = and i64 %self, -8
  %t8166 = inttoptr i64 %t8165 to ptr
  %t8167 = getelementptr i64, ptr %t8166, i64 1
  %t8168 = load i64, ptr %t8167
  %t8169 = and i64 %self, -8
  %t8170 = inttoptr i64 %t8169 to ptr
  %t8171 = getelementptr i64, ptr %t8170, i64 2
  %t8172 = load i64, ptr %t8171
  %t8173 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8173)
  %t8174 = and i64 %t8173, -8
  %t8175 = inttoptr i64 %t8174 to ptr
  %t8176 = load i64, ptr %t8175
  %t8177 = inttoptr i64 %t8176 to ptr
  %t8178 = musttail call fastcc i64 %t8177(i64 %t8173, i64 3, i64 %t8168, i64 %t8172, i64 %t8160, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8178
else1746:
  %t8179 = and i64 %self, -8
  %t8180 = inttoptr i64 %t8179 to ptr
  %t8181 = getelementptr i64, ptr %t8180, i64 1
  %t8182 = load i64, ptr %t8181
  %t8183 = and i64 %self, -8
  %t8184 = inttoptr i64 %t8183 to ptr
  %t8185 = getelementptr i64, ptr %t8184, i64 2
  %t8186 = load i64, ptr %t8185
  %t8187 = call i64 @rt_cdr(i64 %t8160)
  %t8188 = and i64 %self, -8
  %t8189 = inttoptr i64 %t8188 to ptr
  %t8190 = getelementptr i64, ptr %t8189, i64 3
  %t8191 = load i64, ptr %t8190
  %t8192 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8193 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8192, i64 4, i64 %t8182, i64 %t8186, i64 %t8187, i64 %t8191, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8194 = call i64 @rt_car(i64 %t8160)
  %t8195 = call i64 @rt_cons(i64 %t8194, i64 %a1)
  %t8196 = musttail call fastcc i64 @"scheme.base:code_1356"(i64 %self, i64 2, i64 %t8193, i64 %t8195, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8196
else1744:
  %t8197 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t8197)
  %t8198 = and i64 %t8197, -8
  %t8199 = inttoptr i64 %t8198 to ptr
  %t8200 = load i64, ptr %t8199
  %t8201 = inttoptr i64 %t8200 to ptr
  %t8202 = musttail call fastcc i64 %t8201(i64 %t8197, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8202
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8203 = icmp eq i64 %argc, 2
  br i1 %t8203, label %argok1748, label %arityerr1747
arityerr1747:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1748:
  %t8204 = call i64 @rt_string_length(i64 %a0)
  %t8205 = load i64, ptr @"emit.internal:rd-state"
  %t8206 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8205, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8207 = call ptr @rt_alloc_words(i64 5)
  %t8208 = ptrtoint ptr %t8207 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1356" to i64), ptr %t8207
  %t8209 = or i64 %t8208, 4
  %t8210 = getelementptr i64, ptr %t8207, i64 1
  store i64 %a0, ptr %t8210
  %t8211 = getelementptr i64, ptr %t8207, i64 2
  store i64 %t8204, ptr %t8211
  %t8212 = getelementptr i64, ptr %t8207, i64 3
  store i64 %t8206, ptr %t8212
  %t8213 = getelementptr i64, ptr %t8207, i64 4
  store i64 %t8209, ptr %t8213
  %t8214 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8215 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8214, i64 4, i64 %a0, i64 %t8204, i64 0, i64 %t8206, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8216 = musttail call fastcc i64 @"scheme.base:code_1356"(i64 %t8209, i64 2, i64 %t8215, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8216
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8221 = icmp eq i64 %argc, 1
  br i1 %t8221, label %argok1750, label %arityerr1749
arityerr1749:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1750:
  %t8222 = load i64, ptr @"emit.internal:%port-rtd"
  %t8223 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t8222, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8224 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t8223)
  ret i64 %t8224
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8229 = icmp eq i64 %argc, 1
  br i1 %t8229, label %argok1752, label %arityerr1751
arityerr1751:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1752:
  %t8230 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8230)
  %t8231 = and i64 %t8230, -8
  %t8232 = inttoptr i64 %t8231 to ptr
  %t8233 = load i64, ptr %t8232
  %t8234 = inttoptr i64 %t8233 to ptr
  %t8235 = call fastcc i64%t8234(i64 %t8230, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8236 = icmp ne i64 %t8235, 1
  br i1 %t8236, label %then1753, label %else1754
then1753:
  %t8237 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t8237
else1754:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8242 = icmp eq i64 %argc, 1
  br i1 %t8242, label %argok1756, label %arityerr1755
arityerr1755:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1756:
  %t8243 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8243)
  %t8244 = and i64 %t8243, -8
  %t8245 = inttoptr i64 %t8244 to ptr
  %t8246 = load i64, ptr %t8245
  %t8247 = inttoptr i64 %t8246 to ptr
  %t8248 = call fastcc i64%t8247(i64 %t8243, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8249 = icmp ne i64 %t8248, 1
  br i1 %t8249, label %then1757, label %else1758
then1757:
  %t8250 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8251 = call i64 @rt_not(i64 %t8250)
  ret i64 %t8251
else1758:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8256 = icmp eq i64 %argc, 1
  br i1 %t8256, label %argok1760, label %arityerr1759
arityerr1759:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1760:
  %t8257 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8257)
  %t8258 = and i64 %t8257, -8
  %t8259 = inttoptr i64 %t8258 to ptr
  %t8260 = load i64, ptr %t8259
  %t8261 = inttoptr i64 %t8260 to ptr
  %t8262 = musttail call fastcc i64 %t8261(i64 %t8257, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8262
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8267 = icmp eq i64 %argc, 1
  br i1 %t8267, label %argok1762, label %arityerr1761
arityerr1761:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1762:
  %t8268 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t8268
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8273 = icmp eq i64 %argc, 1
  br i1 %t8273, label %argok1764, label %arityerr1763
arityerr1763:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1764:
  %t8274 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8274)
  %t8275 = and i64 %t8274, -8
  %t8276 = inttoptr i64 %t8275 to ptr
  %t8277 = load i64, ptr %t8276
  %t8278 = inttoptr i64 %t8277 to ptr
  %t8279 = call fastcc i64%t8278(i64 %t8274, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8280 = icmp ne i64 %t8279, 1
  br i1 %t8280, label %then1765, label %else1766
then1765:
  %t8281 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8282 = call i64 @rt_not(i64 %t8281)
  ret i64 %t8282
else1766:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8287 = icmp eq i64 %argc, 1
  br i1 %t8287, label %argok1768, label %arityerr1767
arityerr1767:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1768:
  %t8288 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8288)
  %t8289 = and i64 %t8288, -8
  %t8290 = inttoptr i64 %t8289 to ptr
  %t8291 = load i64, ptr %t8290
  %t8292 = inttoptr i64 %t8291 to ptr
  %t8293 = call fastcc i64%t8292(i64 %t8288, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8294 = icmp ne i64 %t8293, 1
  br i1 %t8294, label %then1769, label %else1770
then1769:
  %t8295 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8296 = call i64 @rt_not(i64 %t8295)
  ret i64 %t8296
else1770:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8301 = icmp eq i64 %argc, 2
  br i1 %t8301, label %argok1772, label %arityerr1771
arityerr1771:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1772:
  %t8302 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8302)
  %t8303 = and i64 %t8302, -8
  %t8304 = inttoptr i64 %t8303 to ptr
  %t8305 = load i64, ptr %t8304
  %t8306 = inttoptr i64 %t8305 to ptr
  %t8307 = call fastcc i64%t8306(i64 %t8302, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8308 = call i64 @rt_not(i64 %t8307)
  %t8309 = icmp ne i64 %t8308, 1
  br i1 %t8309, label %then1773, label %else1774
then1773:
  %t8310 = call i64 @rt_make_string(ptr @.str.lit.83, i64 17)
  %t8311 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8311)
  %t8312 = and i64 %t8311, -8
  %t8313 = inttoptr i64 %t8312 to ptr
  %t8314 = load i64, ptr %t8313
  %t8315 = inttoptr i64 %t8314 to ptr
  %t8316 = musttail call fastcc i64 %t8315(i64 %t8311, i64 3, i64 %a1, i64 %t8310, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8316
else1774:
  %t8317 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8318 = icmp ne i64 %t8317, 1
  br i1 %t8318, label %then1775, label %else1776
then1775:
  %t8319 = call i64 @rt_make_string(ptr @.str.lit.84, i64 14)
  %t8320 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8320)
  %t8321 = and i64 %t8320, -8
  %t8322 = inttoptr i64 %t8321 to ptr
  %t8323 = load i64, ptr %t8322
  %t8324 = inttoptr i64 %t8323 to ptr
  %t8325 = musttail call fastcc i64 %t8324(i64 %t8320, i64 3, i64 %a1, i64 %t8319, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8325
else1776:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8330 = icmp eq i64 %argc, 2
  br i1 %t8330, label %argok1778, label %arityerr1777
arityerr1777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1778:
  %t8331 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8331)
  %t8332 = and i64 %t8331, -8
  %t8333 = inttoptr i64 %t8332 to ptr
  %t8334 = load i64, ptr %t8333
  %t8335 = inttoptr i64 %t8334 to ptr
  %t8336 = call fastcc i64%t8335(i64 %t8331, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8337 = call i64 @rt_not(i64 %t8336)
  %t8338 = icmp ne i64 %t8337, 1
  br i1 %t8338, label %then1779, label %else1780
then1779:
  %t8339 = call i64 @rt_make_string(ptr @.str.lit.85, i64 18)
  %t8340 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8340)
  %t8341 = and i64 %t8340, -8
  %t8342 = inttoptr i64 %t8341 to ptr
  %t8343 = load i64, ptr %t8342
  %t8344 = inttoptr i64 %t8343 to ptr
  %t8345 = musttail call fastcc i64 %t8344(i64 %t8340, i64 3, i64 %a1, i64 %t8339, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8345
else1780:
  %t8346 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8347 = icmp ne i64 %t8346, 1
  br i1 %t8347, label %then1781, label %else1782
then1781:
  %t8348 = call i64 @rt_make_string(ptr @.str.lit.86, i64 14)
  %t8349 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8349)
  %t8350 = and i64 %t8349, -8
  %t8351 = inttoptr i64 %t8350 to ptr
  %t8352 = load i64, ptr %t8351
  %t8353 = inttoptr i64 %t8352 to ptr
  %t8354 = musttail call fastcc i64 %t8353(i64 %t8349, i64 3, i64 %a1, i64 %t8348, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8354
else1782:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8359 = icmp eq i64 %argc, 1
  br i1 %t8359, label %argok1784, label %arityerr1783
arityerr1783:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1784:
  %t8360 = load i64, ptr @"emit.internal:%make-port"
  %t8361 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8360, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8361
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8366 = icmp eq i64 %argc, 1
  br i1 %t8366, label %argok1786, label %arityerr1785
arityerr1785:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1786:
  %t8367 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8368 = load i64, ptr @"emit.internal:%port-buf"
  %t8369 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8368, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8370 = call i64 @rt_string_length(i64 %t8369)
  %t8371 = or i64 %t8370, %t8367
  %t8372 = and i64 %t8371, 7
  %t8373 = icmp eq i64 %t8372, 0
  br i1 %t8373, label %fixfast1787, label %fixslow1788
fixfast1787:
  %t8374 = icmp slt i64 %t8370, %t8367
  %t8375 = select i1 %t8374, i64 257, i64 1
  br label %fixmerge1789
fixslow1788:
  %t8376 = call i64 @rt_lt(i64 %t8370, i64 %t8367)
  br label %fixmerge1789
fixmerge1789:
  %t8377 = phi i64 [ %t8375, %fixfast1787 ], [ %t8376, %fixslow1788 ]
  %t8378 = icmp ne i64 %t8377, 1
  br i1 %t8378, label %then1790, label %else1791
then1790:
  ret i64 257
else1791:
  %t8379 = or i64 %t8367, %t8370
  %t8380 = and i64 %t8379, 7
  %t8381 = icmp eq i64 %t8380, 0
  br i1 %t8381, label %fixfast1792, label %fixslow1793
fixfast1792:
  %t8382 = icmp eq i64 %t8367, %t8370
  %t8383 = select i1 %t8382, i64 257, i64 1
  br label %fixmerge1794
fixslow1793:
  %t8384 = call i64 @rt_num_eq(i64 %t8367, i64 %t8370)
  br label %fixmerge1794
fixmerge1794:
  %t8385 = phi i64 [ %t8383, %fixfast1792 ], [ %t8384, %fixslow1793 ]
  ret i64 %t8385
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8390 = icmp eq i64 %argc, 1
  br i1 %t8390, label %argok1796, label %arityerr1795
arityerr1795:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1796:
  %t8391 = call i64 @rt_intern(ptr @.str.sym.87)
  %t8392 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8392)
  %t8393 = and i64 %t8392, -8
  %t8394 = inttoptr i64 %t8393 to ptr
  %t8395 = load i64, ptr %t8394
  %t8396 = inttoptr i64 %t8395 to ptr
  %t8397 = call fastcc i64%t8396(i64 %t8392, i64 2, i64 %a0, i64 %t8391, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8398 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8398)
  %t8399 = and i64 %t8398, -8
  %t8400 = inttoptr i64 %t8399 to ptr
  %t8401 = load i64, ptr %t8400
  %t8402 = inttoptr i64 %t8401 to ptr
  %t8403 = call fastcc i64%t8402(i64 %t8398, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8404 = icmp ne i64 %t8403, 1
  br i1 %t8404, label %then1797, label %else1798
then1797:
  %t8405 = call i64 @rt_eof_object()
  ret i64 %t8405
else1798:
  %t8406 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8407 = or i64 %t8406, 8
  %t8408 = and i64 %t8407, 7
  %t8409 = icmp eq i64 %t8408, 0
  br i1 %t8409, label %fixfast1799, label %fixslow1800
fixfast1799:
  %t8410 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8406, i64 8)
  %t8411 = extractvalue {i64, i1} %t8410, 0
  %t8412 = extractvalue {i64, i1} %t8410, 1
  br i1 %t8412, label %fixslow1800, label %fixmerge1801
fixslow1800:
  %t8413 = call i64 @rt_add(i64 %t8406, i64 8)
  br label %fixmerge1801
fixmerge1801:
  %t8414 = phi i64 [ %t8411, %fixfast1799 ], [ %t8413, %fixslow1800 ]
  %t8415 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t8414)
  %t8416 = load i64, ptr @"emit.internal:%port-buf"
  %t8417 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8416, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8418 = call i64 @rt_string_ref(i64 %t8417, i64 %t8406)
  ret i64 %t8418
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8423 = icmp eq i64 %argc, 1
  br i1 %t8423, label %argok1803, label %arityerr1802
arityerr1802:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1803:
  %t8424 = call i64 @rt_intern(ptr @.str.sym.88)
  %t8425 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8425)
  %t8426 = and i64 %t8425, -8
  %t8427 = inttoptr i64 %t8426 to ptr
  %t8428 = load i64, ptr %t8427
  %t8429 = inttoptr i64 %t8428 to ptr
  %t8430 = call fastcc i64%t8429(i64 %t8425, i64 2, i64 %a0, i64 %t8424, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8431 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8431)
  %t8432 = and i64 %t8431, -8
  %t8433 = inttoptr i64 %t8432 to ptr
  %t8434 = load i64, ptr %t8433
  %t8435 = inttoptr i64 %t8434 to ptr
  %t8436 = call fastcc i64%t8435(i64 %t8431, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8437 = icmp ne i64 %t8436, 1
  br i1 %t8437, label %then1804, label %else1805
then1804:
  %t8438 = call i64 @rt_eof_object()
  ret i64 %t8438
else1805:
  %t8439 = load i64, ptr @"emit.internal:%port-buf"
  %t8440 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8439, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8441 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8442 = call i64 @rt_string_ref(i64 %t8440, i64 %t8441)
  ret i64 %t8442
}

define fastcc i64 @"scheme.base:code_1403"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8447 = icmp eq i64 %argc, 1
  br i1 %t8447, label %argok1807, label %arityerr1806
arityerr1806:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1807:
  %t8448 = and i64 %self, -8
  %t8449 = inttoptr i64 %t8448 to ptr
  %t8450 = getelementptr i64, ptr %t8449, i64 1
  %t8451 = load i64, ptr %t8450
  %t8452 = or i64 %t8451, %a0
  %t8453 = and i64 %t8452, 7
  %t8454 = icmp eq i64 %t8453, 0
  br i1 %t8454, label %fixfast1808, label %fixslow1809
fixfast1808:
  %t8455 = icmp slt i64 %t8451, %a0
  %t8456 = select i1 %t8455, i64 257, i64 1
  br label %fixmerge1810
fixslow1809:
  %t8457 = call i64 @rt_lt(i64 %t8451, i64 %a0)
  br label %fixmerge1810
fixmerge1810:
  %t8458 = phi i64 [ %t8456, %fixfast1808 ], [ %t8457, %fixslow1809 ]
  %t8459 = icmp ne i64 %t8458, 1
  br i1 %t8459, label %then1811, label %else1812
then1811:
  br label %merge1813
else1812:
  %t8460 = or i64 %a0, %t8451
  %t8461 = and i64 %t8460, 7
  %t8462 = icmp eq i64 %t8461, 0
  br i1 %t8462, label %fixfast1814, label %fixslow1815
fixfast1814:
  %t8463 = icmp eq i64 %a0, %t8451
  %t8464 = select i1 %t8463, i64 257, i64 1
  br label %fixmerge1816
fixslow1815:
  %t8465 = call i64 @rt_num_eq(i64 %a0, i64 %t8451)
  br label %fixmerge1816
fixmerge1816:
  %t8466 = phi i64 [ %t8464, %fixfast1814 ], [ %t8465, %fixslow1815 ]
  br label %merge1813
merge1813:
  %t8467 = phi i64 [ 257, %then1811 ], [ %t8466, %fixmerge1816 ]
  %t8468 = icmp ne i64 %t8467, 1
  br i1 %t8468, label %then1817, label %else1818
then1817:
  %t8469 = and i64 %self, -8
  %t8470 = inttoptr i64 %t8469 to ptr
  %t8471 = getelementptr i64, ptr %t8470, i64 2
  %t8472 = load i64, ptr %t8471
  %t8473 = call i64 @rt_record_ref(i64 %t8472, i64 24)
  %t8474 = and i64 %self, -8
  %t8475 = inttoptr i64 %t8474 to ptr
  %t8476 = getelementptr i64, ptr %t8475, i64 2
  %t8477 = load i64, ptr %t8476
  %t8478 = and i64 %self, -8
  %t8479 = inttoptr i64 %t8478 to ptr
  %t8480 = getelementptr i64, ptr %t8479, i64 1
  %t8481 = load i64, ptr %t8480
  %t8482 = call i64 @rt_record_set(i64 %t8477, i64 24, i64 %t8481)
  %t8483 = and i64 %self, -8
  %t8484 = inttoptr i64 %t8483 to ptr
  %t8485 = getelementptr i64, ptr %t8484, i64 3
  %t8486 = load i64, ptr %t8485
  %t8487 = and i64 %self, -8
  %t8488 = inttoptr i64 %t8487 to ptr
  %t8489 = getelementptr i64, ptr %t8488, i64 1
  %t8490 = load i64, ptr %t8489
  %t8491 = call i64 @rt_substring(i64 %t8486, i64 %t8473, i64 %t8490)
  ret i64 %t8491
else1818:
  %t8492 = and i64 %self, -8
  %t8493 = inttoptr i64 %t8492 to ptr
  %t8494 = getelementptr i64, ptr %t8493, i64 3
  %t8495 = load i64, ptr %t8494
  %t8496 = call i64 @rt_string_ref(i64 %t8495, i64 %a0)
  %t8497 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t8497)
  %t8498 = and i64 %t8497, -8
  %t8499 = inttoptr i64 %t8498 to ptr
  %t8500 = load i64, ptr %t8499
  %t8501 = inttoptr i64 %t8500 to ptr
  %t8502 = call fastcc i64%t8501(i64 %t8497, i64 2, i64 %t8496, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8503 = icmp ne i64 %t8502, 1
  br i1 %t8503, label %then1819, label %else1820
then1819:
  %t8504 = and i64 %self, -8
  %t8505 = inttoptr i64 %t8504 to ptr
  %t8506 = getelementptr i64, ptr %t8505, i64 2
  %t8507 = load i64, ptr %t8506
  %t8508 = call i64 @rt_record_ref(i64 %t8507, i64 24)
  %t8509 = and i64 %self, -8
  %t8510 = inttoptr i64 %t8509 to ptr
  %t8511 = getelementptr i64, ptr %t8510, i64 2
  %t8512 = load i64, ptr %t8511
  %t8513 = or i64 %a0, 8
  %t8514 = and i64 %t8513, 7
  %t8515 = icmp eq i64 %t8514, 0
  br i1 %t8515, label %fixfast1821, label %fixslow1822
fixfast1821:
  %t8516 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8517 = extractvalue {i64, i1} %t8516, 0
  %t8518 = extractvalue {i64, i1} %t8516, 1
  br i1 %t8518, label %fixslow1822, label %fixmerge1823
fixslow1822:
  %t8519 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1823
fixmerge1823:
  %t8520 = phi i64 [ %t8517, %fixfast1821 ], [ %t8519, %fixslow1822 ]
  %t8521 = call i64 @rt_record_set(i64 %t8512, i64 24, i64 %t8520)
  %t8522 = and i64 %self, -8
  %t8523 = inttoptr i64 %t8522 to ptr
  %t8524 = getelementptr i64, ptr %t8523, i64 3
  %t8525 = load i64, ptr %t8524
  %t8526 = call i64 @rt_substring(i64 %t8525, i64 %t8508, i64 %a0)
  ret i64 %t8526
else1820:
  %t8527 = or i64 %a0, 8
  %t8528 = and i64 %t8527, 7
  %t8529 = icmp eq i64 %t8528, 0
  br i1 %t8529, label %fixfast1824, label %fixslow1825
fixfast1824:
  %t8530 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8531 = extractvalue {i64, i1} %t8530, 0
  %t8532 = extractvalue {i64, i1} %t8530, 1
  br i1 %t8532, label %fixslow1825, label %fixmerge1826
fixslow1825:
  %t8533 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1826
fixmerge1826:
  %t8534 = phi i64 [ %t8531, %fixfast1824 ], [ %t8533, %fixslow1825 ]
  %t8535 = musttail call fastcc i64 @"scheme.base:code_1403"(i64 %self, i64 1, i64 %t8534, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8535
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8536 = icmp eq i64 %argc, 1
  br i1 %t8536, label %argok1828, label %arityerr1827
arityerr1827:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1828:
  %t8537 = call i64 @rt_intern(ptr @.str.sym.89)
  %t8538 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8538)
  %t8539 = and i64 %t8538, -8
  %t8540 = inttoptr i64 %t8539 to ptr
  %t8541 = load i64, ptr %t8540
  %t8542 = inttoptr i64 %t8541 to ptr
  %t8543 = call fastcc i64%t8542(i64 %t8538, i64 2, i64 %a0, i64 %t8537, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8544 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8544)
  %t8545 = and i64 %t8544, -8
  %t8546 = inttoptr i64 %t8545 to ptr
  %t8547 = load i64, ptr %t8546
  %t8548 = inttoptr i64 %t8547 to ptr
  %t8549 = call fastcc i64%t8548(i64 %t8544, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8550 = icmp ne i64 %t8549, 1
  br i1 %t8550, label %then1829, label %else1830
then1829:
  %t8551 = call i64 @rt_eof_object()
  ret i64 %t8551
else1830:
  %t8552 = load i64, ptr @"emit.internal:%port-buf"
  %t8553 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8552, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8554 = call i64 @rt_string_length(i64 %t8553)
  %t8555 = call ptr @rt_alloc_words(i64 5)
  %t8556 = ptrtoint ptr %t8555 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1403" to i64), ptr %t8555
  %t8557 = or i64 %t8556, 4
  %t8558 = getelementptr i64, ptr %t8555, i64 1
  store i64 %t8554, ptr %t8558
  %t8559 = getelementptr i64, ptr %t8555, i64 2
  store i64 %a0, ptr %t8559
  %t8560 = getelementptr i64, ptr %t8555, i64 3
  store i64 %t8553, ptr %t8560
  %t8561 = getelementptr i64, ptr %t8555, i64 4
  store i64 %t8557, ptr %t8561
  %t8562 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8563 = musttail call fastcc i64 @"scheme.base:code_1403"(i64 %t8557, i64 1, i64 %t8562, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8563
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8568 = icmp eq i64 %argc, 2
  br i1 %t8568, label %argok1832, label %arityerr1831
arityerr1831:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1832:
  %t8569 = call i64 @rt_intern(ptr @.str.sym.90)
  %t8570 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8570)
  %t8571 = and i64 %t8570, -8
  %t8572 = inttoptr i64 %t8571 to ptr
  %t8573 = load i64, ptr %t8572
  %t8574 = inttoptr i64 %t8573 to ptr
  %t8575 = call fastcc i64%t8574(i64 %t8570, i64 2, i64 %a1, i64 %t8569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8576 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8576)
  %t8577 = and i64 %t8576, -8
  %t8578 = inttoptr i64 %t8577 to ptr
  %t8579 = load i64, ptr %t8578
  %t8580 = inttoptr i64 %t8579 to ptr
  %t8581 = call fastcc i64%t8580(i64 %t8576, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8582 = icmp ne i64 %t8581, 1
  br i1 %t8582, label %then1833, label %else1834
then1833:
  %t8583 = call i64 @rt_eof_object()
  ret i64 %t8583
else1834:
  %t8584 = load i64, ptr @"emit.internal:%port-buf"
  %t8585 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8584, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8586 = call i64 @rt_string_length(i64 %t8585)
  %t8587 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t8588 = or i64 %t8587, %a0
  %t8589 = and i64 %t8588, 7
  %t8590 = icmp eq i64 %t8589, 0
  br i1 %t8590, label %fixfast1835, label %fixslow1836
fixfast1835:
  %t8591 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8587, i64 %a0)
  %t8592 = extractvalue {i64, i1} %t8591, 0
  %t8593 = extractvalue {i64, i1} %t8591, 1
  br i1 %t8593, label %fixslow1836, label %fixmerge1837
fixslow1836:
  %t8594 = call i64 @rt_add(i64 %t8587, i64 %a0)
  br label %fixmerge1837
fixmerge1837:
  %t8595 = phi i64 [ %t8592, %fixfast1835 ], [ %t8594, %fixslow1836 ]
  %t8596 = or i64 %t8586, %t8595
  %t8597 = and i64 %t8596, 7
  %t8598 = icmp eq i64 %t8597, 0
  br i1 %t8598, label %fixfast1838, label %fixslow1839
fixfast1838:
  %t8599 = icmp slt i64 %t8586, %t8595
  %t8600 = select i1 %t8599, i64 257, i64 1
  br label %fixmerge1840
fixslow1839:
  %t8601 = call i64 @rt_lt(i64 %t8586, i64 %t8595)
  br label %fixmerge1840
fixmerge1840:
  %t8602 = phi i64 [ %t8600, %fixfast1838 ], [ %t8601, %fixslow1839 ]
  %t8603 = icmp ne i64 %t8602, 1
  br i1 %t8603, label %then1841, label %else1842
then1841:
  br label %merge1843
else1842:
  %t8604 = or i64 %t8587, %a0
  %t8605 = and i64 %t8604, 7
  %t8606 = icmp eq i64 %t8605, 0
  br i1 %t8606, label %fixfast1844, label %fixslow1845
fixfast1844:
  %t8607 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8587, i64 %a0)
  %t8608 = extractvalue {i64, i1} %t8607, 0
  %t8609 = extractvalue {i64, i1} %t8607, 1
  br i1 %t8609, label %fixslow1845, label %fixmerge1846
fixslow1845:
  %t8610 = call i64 @rt_add(i64 %t8587, i64 %a0)
  br label %fixmerge1846
fixmerge1846:
  %t8611 = phi i64 [ %t8608, %fixfast1844 ], [ %t8610, %fixslow1845 ]
  br label %merge1843
merge1843:
  %t8612 = phi i64 [ %t8586, %then1841 ], [ %t8611, %fixmerge1846 ]
  %t8613 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t8612)
  %t8614 = call i64 @rt_substring(i64 %t8585, i64 %t8587, i64 %t8612)
  ret i64 %t8614
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8619 = icmp eq i64 %argc, 0
  br i1 %t8619, label %argok1848, label %arityerr1847
arityerr1847:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1848:
  %t8620 = call i64 @rt_port_open_output_string()
  %t8621 = icmp ne i64 %t8620, 1
  br i1 %t8621, label %then1849, label %else1850
then1849:
  %t8622 = load i64, ptr @"emit.internal:%make-port"
  %t8623 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8622, i64 6, i64 %t8620, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8623
else1850:
  %t8624 = call i64 @rt_intern(ptr @.str.sym.91)
  %t8625 = call i64 @rt_make_string(ptr @.str.lit.92, i64 33)
  %t8626 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8626)
  %t8627 = and i64 %t8626, -8
  %t8628 = inttoptr i64 %t8627 to ptr
  %t8629 = load i64, ptr %t8628
  %t8630 = inttoptr i64 %t8629 to ptr
  %t8631 = musttail call fastcc i64 %t8630(i64 %t8626, i64 2, i64 %t8624, i64 %t8625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8631
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8636 = icmp eq i64 %argc, 1
  br i1 %t8636, label %argok1852, label %arityerr1851
arityerr1851:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1852:
  %t8637 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8637)
  %t8638 = and i64 %t8637, -8
  %t8639 = inttoptr i64 %t8638 to ptr
  %t8640 = load i64, ptr %t8639
  %t8641 = inttoptr i64 %t8640 to ptr
  %t8642 = call fastcc i64%t8641(i64 %t8637, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8643 = call i64 @rt_not(i64 %t8642)
  %t8644 = icmp ne i64 %t8643, 1
  br i1 %t8644, label %then1853, label %else1854
then1853:
  %t8645 = call i64 @rt_intern(ptr @.str.sym.93)
  %t8646 = call i64 @rt_make_string(ptr @.str.lit.94, i64 18)
  %t8647 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8647)
  %t8648 = and i64 %t8647, -8
  %t8649 = inttoptr i64 %t8648 to ptr
  %t8650 = load i64, ptr %t8649
  %t8651 = inttoptr i64 %t8650 to ptr
  %t8652 = musttail call fastcc i64 %t8651(i64 %t8647, i64 3, i64 %t8645, i64 %t8646, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8652
else1854:
  %t8653 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t8654 = call i64 @rt_not(i64 %t8653)
  %t8655 = icmp ne i64 %t8654, 1
  br i1 %t8655, label %then1855, label %else1856
then1855:
  %t8656 = call i64 @rt_intern(ptr @.str.sym.93)
  %t8657 = call i64 @rt_make_string(ptr @.str.lit.95, i64 17)
  %t8658 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8658)
  %t8659 = and i64 %t8658, -8
  %t8660 = inttoptr i64 %t8659 to ptr
  %t8661 = load i64, ptr %t8660
  %t8662 = inttoptr i64 %t8661 to ptr
  %t8663 = musttail call fastcc i64 %t8662(i64 %t8658, i64 3, i64 %t8656, i64 %t8657, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8663
else1856:
  %t8664 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8665 = call i64 @rt_port_get_output_string(i64 %t8664)
  ret i64 %t8665
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8670 = icmp eq i64 %argc, 1
  br i1 %t8670, label %argok1858, label %arityerr1857
arityerr1857:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1858:
  %t8671 = call i64 @rt_intern(ptr @.str.sym.96)
  %t8672 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t8672)
  %t8673 = and i64 %t8672, -8
  %t8674 = inttoptr i64 %t8673 to ptr
  %t8675 = load i64, ptr %t8674
  %t8676 = inttoptr i64 %t8675 to ptr
  %t8677 = call fastcc i64%t8676(i64 %t8672, i64 2, i64 %a0, i64 %t8671, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8678 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8679 = call i64 @rt_port_flush(i64 %t8678)
  ret i64 %t8679
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8684 = icmp eq i64 %argc, 1
  br i1 %t8684, label %argok1860, label %arityerr1859
arityerr1859:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1860:
  %t8685 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8685)
  %t8686 = and i64 %t8685, -8
  %t8687 = inttoptr i64 %t8686 to ptr
  %t8688 = load i64, ptr %t8687
  %t8689 = inttoptr i64 %t8688 to ptr
  %t8690 = call fastcc i64%t8689(i64 %t8685, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8691 = call i64 @rt_not(i64 %t8690)
  %t8692 = icmp ne i64 %t8691, 1
  br i1 %t8692, label %then1861, label %else1862
then1861:
  %t8693 = call i64 @rt_intern(ptr @.str.sym.97)
  %t8694 = call i64 @rt_make_string(ptr @.str.lit.98, i64 10)
  %t8695 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8695)
  %t8696 = and i64 %t8695, -8
  %t8697 = inttoptr i64 %t8696 to ptr
  %t8698 = load i64, ptr %t8697
  %t8699 = inttoptr i64 %t8698 to ptr
  %t8700 = musttail call fastcc i64 %t8699(i64 %t8695, i64 3, i64 %t8693, i64 %t8694, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8700
else1862:
  %t8701 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8702 = icmp ne i64 %t8701, 1
  br i1 %t8702, label %then1863, label %else1864
then1863:
  %t8703 = icmp ne i64 1, 1
  br i1 %t8703, label %then1865, label %else1866
then1865:
  ret i64 1
else1866:
  ret i64 17
else1864:
  %t8704 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8705 = call i64 @rt_not(i64 %t8704)
  %t8706 = icmp ne i64 %t8705, 1
  br i1 %t8706, label %then1867, label %else1868
then1867:
  %t8707 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8708 = call i64 @rt_port_close(i64 %t8707)
  br label %merge1869
else1868:
  br label %merge1869
merge1869:
  %t8709 = phi i64 [ %t8708, %then1867 ], [ 17, %else1868 ]
  %t8710 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t8711 = icmp ne i64 1, 1
  br i1 %t8711, label %then1870, label %else1871
then1870:
  ret i64 1
else1871:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8716 = icmp eq i64 %argc, 1
  br i1 %t8716, label %argok1873, label %arityerr1872
arityerr1872:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1873:
  %t8717 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8717)
  %t8718 = and i64 %t8717, -8
  %t8719 = inttoptr i64 %t8718 to ptr
  %t8720 = load i64, ptr %t8719
  %t8721 = inttoptr i64 %t8720 to ptr
  %t8722 = call fastcc i64%t8721(i64 %t8717, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8723 = icmp ne i64 %t8722, 1
  br i1 %t8723, label %then1874, label %else1875
then1874:
  %t8724 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8724)
  %t8725 = and i64 %t8724, -8
  %t8726 = inttoptr i64 %t8725 to ptr
  %t8727 = load i64, ptr %t8726
  %t8728 = inttoptr i64 %t8727 to ptr
  %t8729 = musttail call fastcc i64 %t8728(i64 %t8724, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8729
else1875:
  %t8730 = call i64 @rt_intern(ptr @.str.sym.99)
  %t8731 = call i64 @rt_make_string(ptr @.str.lit.100, i64 17)
  %t8732 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8732)
  %t8733 = and i64 %t8732, -8
  %t8734 = inttoptr i64 %t8733 to ptr
  %t8735 = load i64, ptr %t8734
  %t8736 = inttoptr i64 %t8735 to ptr
  %t8737 = musttail call fastcc i64 %t8736(i64 %t8732, i64 3, i64 %t8730, i64 %t8731, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8737
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8742 = icmp eq i64 %argc, 1
  br i1 %t8742, label %argok1877, label %arityerr1876
arityerr1876:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1877:
  %t8743 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8743)
  %t8744 = and i64 %t8743, -8
  %t8745 = inttoptr i64 %t8744 to ptr
  %t8746 = load i64, ptr %t8745
  %t8747 = inttoptr i64 %t8746 to ptr
  %t8748 = call fastcc i64%t8747(i64 %t8743, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8749 = icmp ne i64 %t8748, 1
  br i1 %t8749, label %then1878, label %else1879
then1878:
  %t8750 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8750)
  %t8751 = and i64 %t8750, -8
  %t8752 = inttoptr i64 %t8751 to ptr
  %t8753 = load i64, ptr %t8752
  %t8754 = inttoptr i64 %t8753 to ptr
  %t8755 = musttail call fastcc i64 %t8754(i64 %t8750, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8755
else1879:
  %t8756 = call i64 @rt_intern(ptr @.str.sym.101)
  %t8757 = call i64 @rt_make_string(ptr @.str.lit.102, i64 18)
  %t8758 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8758)
  %t8759 = and i64 %t8758, -8
  %t8760 = inttoptr i64 %t8759 to ptr
  %t8761 = load i64, ptr %t8760
  %t8762 = inttoptr i64 %t8761 to ptr
  %t8763 = musttail call fastcc i64 %t8762(i64 %t8758, i64 3, i64 %t8756, i64 %t8757, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8763
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8771 = icmp sge i64 %argc, 0
  br i1 %t8771, label %argok1881, label %arityerr1880
arityerr1880:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1881:
  %t8772 = call ptr @rt_alloc_words(i64 8)
  %t8773 = getelementptr i64, ptr %t8772, i64 0
  store i64 %a0, ptr %t8773
  %t8774 = getelementptr i64, ptr %t8772, i64 1
  store i64 %a1, ptr %t8774
  %t8775 = getelementptr i64, ptr %t8772, i64 2
  store i64 %a2, ptr %t8775
  %t8776 = getelementptr i64, ptr %t8772, i64 3
  store i64 %a3, ptr %t8776
  %t8777 = getelementptr i64, ptr %t8772, i64 4
  store i64 %a4, ptr %t8777
  %t8778 = getelementptr i64, ptr %t8772, i64 5
  store i64 %a5, ptr %t8778
  %t8779 = getelementptr i64, ptr %t8772, i64 6
  store i64 %a6, ptr %t8779
  %t8780 = getelementptr i64, ptr %t8772, i64 7
  store i64 %a7, ptr %t8780
  %t8781 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8772, ptr %overflow)
  %t8782 = call i64 @rt_null_p(i64 %t8781)
  %t8783 = icmp ne i64 %t8782, 1
  br i1 %t8783, label %then1882, label %else1883
then1882:
  %t8784 = load i64, ptr @"scheme.base:%stdout-port"
  %t8785 = call i64 @rt_not(i64 %t8784)
  %t8786 = icmp ne i64 %t8785, 1
  br i1 %t8786, label %then1884, label %else1885
then1884:
  %t8787 = load i64, ptr @"emit.internal:%make-port"
  %t8788 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8787, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8789 = call i64 @rt_root(i64 %t8788)
  store i64 %t8789, ptr @"scheme.base:%stdout-port"
  %t8790 = call i64 @rt_set_current_output(i64 0)
  br label %merge1886
else1885:
  br label %merge1886
merge1886:
  %t8791 = phi i64 [ %t8790, %then1884 ], [ 17, %else1885 ]
  %t8792 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8792
else1883:
  %t8793 = call i64 @rt_car(i64 %t8781)
  %t8794 = call i64 @rt_root(i64 %t8793)
  store i64 %t8794, ptr @"scheme.base:%stdout-port"
  %t8795 = call i64 @rt_record_ref(i64 %t8793, i64 0)
  %t8796 = call i64 @rt_set_current_output(i64 %t8795)
  %t8797 = icmp ne i64 1, 1
  br i1 %t8797, label %then1887, label %else1888
then1887:
  ret i64 1
else1888:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8798 = call i64 @rt_null_p(i64 2)
  %t8799 = icmp ne i64 %t8798, 1
  br i1 %t8799, label %then1889, label %else1890
then1889:
  %t8800 = load i64, ptr @"scheme.base:%stdout-port"
  %t8801 = call i64 @rt_not(i64 %t8800)
  %t8802 = icmp ne i64 %t8801, 1
  br i1 %t8802, label %then1891, label %else1892
then1891:
  %t8803 = load i64, ptr @"emit.internal:%make-port"
  %t8804 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8803, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8805 = call i64 @rt_root(i64 %t8804)
  store i64 %t8805, ptr @"scheme.base:%stdout-port"
  %t8806 = call i64 @rt_set_current_output(i64 0)
  br label %merge1893
else1892:
  br label %merge1893
merge1893:
  %t8807 = phi i64 [ %t8806, %then1891 ], [ 17, %else1892 ]
  %t8808 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8808
else1890:
  %t8809 = call i64 @rt_car(i64 2)
  %t8810 = call i64 @rt_root(i64 %t8809)
  store i64 %t8810, ptr @"scheme.base:%stdout-port"
  %t8811 = call i64 @rt_record_ref(i64 %t8809, i64 0)
  %t8812 = call i64 @rt_set_current_output(i64 %t8811)
  %t8813 = icmp ne i64 1, 1
  br i1 %t8813, label %then1894, label %else1895
then1894:
  ret i64 1
else1895:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8818 = icmp sge i64 %argc, 0
  br i1 %t8818, label %argok1897, label %arityerr1896
arityerr1896:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1897:
  %t8819 = call ptr @rt_alloc_words(i64 8)
  %t8820 = getelementptr i64, ptr %t8819, i64 0
  store i64 %a0, ptr %t8820
  %t8821 = getelementptr i64, ptr %t8819, i64 1
  store i64 %a1, ptr %t8821
  %t8822 = getelementptr i64, ptr %t8819, i64 2
  store i64 %a2, ptr %t8822
  %t8823 = getelementptr i64, ptr %t8819, i64 3
  store i64 %a3, ptr %t8823
  %t8824 = getelementptr i64, ptr %t8819, i64 4
  store i64 %a4, ptr %t8824
  %t8825 = getelementptr i64, ptr %t8819, i64 5
  store i64 %a5, ptr %t8825
  %t8826 = getelementptr i64, ptr %t8819, i64 6
  store i64 %a6, ptr %t8826
  %t8827 = getelementptr i64, ptr %t8819, i64 7
  store i64 %a7, ptr %t8827
  %t8828 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8819, ptr %overflow)
  %t8829 = call i64 @rt_null_p(i64 %t8828)
  %t8830 = icmp ne i64 %t8829, 1
  br i1 %t8830, label %then1898, label %else1899
then1898:
  %t8831 = load i64, ptr @"scheme.base:%stderr-port"
  %t8832 = call i64 @rt_not(i64 %t8831)
  %t8833 = icmp ne i64 %t8832, 1
  br i1 %t8833, label %then1900, label %else1901
then1900:
  %t8834 = load i64, ptr @"emit.internal:%make-port"
  %t8835 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8834, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8836 = call i64 @rt_root(i64 %t8835)
  store i64 %t8836, ptr @"scheme.base:%stderr-port"
  br label %merge1902
else1901:
  br label %merge1902
merge1902:
  %t8837 = phi i64 [ 17, %then1900 ], [ 17, %else1901 ]
  %t8838 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8838
else1899:
  %t8839 = call i64 @rt_car(i64 %t8828)
  %t8840 = call i64 @rt_root(i64 %t8839)
  store i64 %t8840, ptr @"scheme.base:%stderr-port"
  %t8841 = icmp ne i64 1, 1
  br i1 %t8841, label %then1903, label %else1904
then1903:
  ret i64 1
else1904:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8842 = call i64 @rt_null_p(i64 2)
  %t8843 = icmp ne i64 %t8842, 1
  br i1 %t8843, label %then1905, label %else1906
then1905:
  %t8844 = load i64, ptr @"scheme.base:%stderr-port"
  %t8845 = call i64 @rt_not(i64 %t8844)
  %t8846 = icmp ne i64 %t8845, 1
  br i1 %t8846, label %then1907, label %else1908
then1907:
  %t8847 = load i64, ptr @"emit.internal:%make-port"
  %t8848 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8847, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8849 = call i64 @rt_root(i64 %t8848)
  store i64 %t8849, ptr @"scheme.base:%stderr-port"
  br label %merge1909
else1908:
  br label %merge1909
merge1909:
  %t8850 = phi i64 [ 17, %then1907 ], [ 17, %else1908 ]
  %t8851 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8851
else1906:
  %t8852 = call i64 @rt_car(i64 2)
  %t8853 = call i64 @rt_root(i64 %t8852)
  store i64 %t8853, ptr @"scheme.base:%stderr-port"
  %t8854 = icmp ne i64 1, 1
  br i1 %t8854, label %then1910, label %else1911
then1910:
  ret i64 1
else1911:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8859 = icmp sge i64 %argc, 0
  br i1 %t8859, label %argok1913, label %arityerr1912
arityerr1912:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1913:
  %t8860 = call ptr @rt_alloc_words(i64 8)
  %t8861 = getelementptr i64, ptr %t8860, i64 0
  store i64 %a0, ptr %t8861
  %t8862 = getelementptr i64, ptr %t8860, i64 1
  store i64 %a1, ptr %t8862
  %t8863 = getelementptr i64, ptr %t8860, i64 2
  store i64 %a2, ptr %t8863
  %t8864 = getelementptr i64, ptr %t8860, i64 3
  store i64 %a3, ptr %t8864
  %t8865 = getelementptr i64, ptr %t8860, i64 4
  store i64 %a4, ptr %t8865
  %t8866 = getelementptr i64, ptr %t8860, i64 5
  store i64 %a5, ptr %t8866
  %t8867 = getelementptr i64, ptr %t8860, i64 6
  store i64 %a6, ptr %t8867
  %t8868 = getelementptr i64, ptr %t8860, i64 7
  store i64 %a7, ptr %t8868
  %t8869 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8860, ptr %overflow)
  %t8870 = call i64 @rt_null_p(i64 %t8869)
  %t8871 = icmp ne i64 %t8870, 1
  br i1 %t8871, label %then1914, label %else1915
then1914:
  %t8872 = load i64, ptr @"scheme.base:%stdin-port"
  %t8873 = call i64 @rt_not(i64 %t8872)
  %t8874 = icmp ne i64 %t8873, 1
  br i1 %t8874, label %then1916, label %else1917
then1916:
  %t8875 = load i64, ptr @"emit.internal:%make-port"
  %t8876 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8875, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8877 = call i64 @rt_root(i64 %t8876)
  store i64 %t8877, ptr @"scheme.base:%stdin-port"
  br label %merge1918
else1917:
  br label %merge1918
merge1918:
  %t8878 = phi i64 [ 17, %then1916 ], [ 17, %else1917 ]
  %t8879 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8879
else1915:
  %t8880 = call i64 @rt_car(i64 %t8869)
  %t8881 = call i64 @rt_root(i64 %t8880)
  store i64 %t8881, ptr @"scheme.base:%stdin-port"
  %t8882 = icmp ne i64 1, 1
  br i1 %t8882, label %then1919, label %else1920
then1919:
  ret i64 1
else1920:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8883 = call i64 @rt_null_p(i64 2)
  %t8884 = icmp ne i64 %t8883, 1
  br i1 %t8884, label %then1921, label %else1922
then1921:
  %t8885 = load i64, ptr @"scheme.base:%stdin-port"
  %t8886 = call i64 @rt_not(i64 %t8885)
  %t8887 = icmp ne i64 %t8886, 1
  br i1 %t8887, label %then1923, label %else1924
then1923:
  %t8888 = load i64, ptr @"emit.internal:%make-port"
  %t8889 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8888, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8890 = call i64 @rt_root(i64 %t8889)
  store i64 %t8890, ptr @"scheme.base:%stdin-port"
  br label %merge1925
else1924:
  br label %merge1925
merge1925:
  %t8891 = phi i64 [ 17, %then1923 ], [ 17, %else1924 ]
  %t8892 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8892
else1922:
  %t8893 = call i64 @rt_car(i64 2)
  %t8894 = call i64 @rt_root(i64 %t8893)
  store i64 %t8894, ptr @"scheme.base:%stdin-port"
  %t8895 = icmp ne i64 1, 1
  br i1 %t8895, label %then1926, label %else1927
then1926:
  ret i64 1
else1927:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1438"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8900 = icmp eq i64 %argc, 0
  br i1 %t8900, label %argok1929, label %arityerr1928
arityerr1928:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1929:
  %t8901 = icmp ne i64 1, 1
  br i1 %t8901, label %then1930, label %else1931
then1930:
  ret i64 1
else1931:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1440"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8902 = icmp eq i64 %argc, 0
  br i1 %t8902, label %argok1933, label %arityerr1932
arityerr1932:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1933:
  %t8903 = and i64 %self, -8
  %t8904 = inttoptr i64 %t8903 to ptr
  %t8905 = getelementptr i64, ptr %t8904, i64 2
  %t8906 = load i64, ptr %t8905
  %t8907 = and i64 %self, -8
  %t8908 = inttoptr i64 %t8907 to ptr
  %t8909 = getelementptr i64, ptr %t8908, i64 1
  %t8910 = load i64, ptr %t8909
  call void @rt_check_callable(i64 %t8910)
  %t8911 = and i64 %t8910, -8
  %t8912 = inttoptr i64 %t8911 to ptr
  %t8913 = load i64, ptr %t8912
  %t8914 = inttoptr i64 %t8913 to ptr
  %t8915 = musttail call fastcc i64 %t8914(i64 %t8910, i64 1, i64 %t8906, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8915
}

define fastcc i64 @"scheme.base:code_1442"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8916 = icmp eq i64 %argc, 0
  br i1 %t8916, label %argok1935, label %arityerr1934
arityerr1934:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1935:
  %t8917 = and i64 %self, -8
  %t8918 = inttoptr i64 %t8917 to ptr
  %t8919 = getelementptr i64, ptr %t8918, i64 1
  %t8920 = load i64, ptr %t8919
  %t8921 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8921)
  %t8922 = and i64 %t8921, -8
  %t8923 = inttoptr i64 %t8922 to ptr
  %t8924 = load i64, ptr %t8923
  %t8925 = inttoptr i64 %t8924 to ptr
  %t8926 = musttail call fastcc i64 %t8925(i64 %t8921, i64 1, i64 %t8920, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8926
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8927 = icmp eq i64 %argc, 2
  br i1 %t8927, label %argok1937, label %arityerr1936
arityerr1936:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1937:
  %t8928 = call ptr @rt_alloc_words(i64 1)
  %t8929 = ptrtoint ptr %t8928 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1438" to i64), ptr %t8928
  %t8930 = or i64 %t8929, 4
  %t8931 = call ptr @rt_alloc_words(i64 3)
  %t8932 = ptrtoint ptr %t8931 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1440" to i64), ptr %t8931
  %t8933 = getelementptr i64, ptr %t8931, i64 1
  store i64 %a1, ptr %t8933
  %t8934 = getelementptr i64, ptr %t8931, i64 2
  store i64 %a0, ptr %t8934
  %t8935 = or i64 %t8932, 4
  %t8936 = call ptr @rt_alloc_words(i64 2)
  %t8937 = ptrtoint ptr %t8936 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1442" to i64), ptr %t8936
  %t8938 = getelementptr i64, ptr %t8936, i64 1
  store i64 %a0, ptr %t8938
  %t8939 = or i64 %t8937, 4
  %t8940 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t8940)
  %t8941 = and i64 %t8940, -8
  %t8942 = inttoptr i64 %t8941 to ptr
  %t8943 = load i64, ptr %t8942
  %t8944 = inttoptr i64 %t8943 to ptr
  %t8945 = musttail call fastcc i64 %t8944(i64 %t8940, i64 3, i64 %t8930, i64 %t8935, i64 %t8939, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8945
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
  %t2917 = call ptr @rt_alloc_words(i64 1)
  %t2918 = ptrtoint ptr %t2917 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:features" to i64), ptr %t2917
  %t2919 = or i64 %t2918, 4
  %t2920 = call i64 @rt_root(i64 %t2919)
  store i64 %t2920, ptr @"scheme.base:features"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2923 = call ptr @rt_alloc_words(i64 1)
  %t2924 = ptrtoint ptr %t2923 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2923
  %t2925 = or i64 %t2924, 4
  %t2926 = call i64 @rt_root(i64 %t2925)
  store i64 %t2926, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2929 = call ptr @rt_alloc_words(i64 1)
  %t2930 = ptrtoint ptr %t2929 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2929
  %t2931 = or i64 %t2930, 4
  %t2932 = call i64 @rt_root(i64 %t2931)
  store i64 %t2932, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2935 = call ptr @rt_alloc_words(i64 1)
  %t2936 = ptrtoint ptr %t2935 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2935
  %t2937 = or i64 %t2936, 4
  %t2938 = call i64 @rt_root(i64 %t2937)
  store i64 %t2938, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2945 = call ptr @rt_alloc_words(i64 1)
  %t2946 = ptrtoint ptr %t2945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t2945
  %t2947 = or i64 %t2946, 4
  %t2948 = call i64 @rt_root(i64 %t2947)
  store i64 %t2948, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2955 = call ptr @rt_alloc_words(i64 1)
  %t2956 = ptrtoint ptr %t2955 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t2955
  %t2957 = or i64 %t2956, 4
  %t2958 = call i64 @rt_root(i64 %t2957)
  store i64 %t2958, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3097 = call ptr @rt_alloc_words(i64 1)
  %t3098 = ptrtoint ptr %t3097 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t3097
  %t3099 = or i64 %t3098, 4
  %t3100 = call i64 @rt_root(i64 %t3099)
  store i64 %t3100, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3181 = call ptr @rt_alloc_words(i64 1)
  %t3182 = ptrtoint ptr %t3181 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t3181
  %t3183 = or i64 %t3182, 4
  %t3184 = call i64 @rt_root(i64 %t3183)
  store i64 %t3184, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3222 = call ptr @rt_alloc_words(i64 1)
  %t3223 = ptrtoint ptr %t3222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t3222
  %t3224 = or i64 %t3223, 4
  %t3225 = call i64 @rt_root(i64 %t3224)
  store i64 %t3225, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3249 = call ptr @rt_alloc_words(i64 1)
  %t3250 = ptrtoint ptr %t3249 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t3249
  %t3251 = or i64 %t3250, 4
  %t3252 = call i64 @rt_root(i64 %t3251)
  store i64 %t3252, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3290 = call ptr @rt_alloc_words(i64 1)
  %t3291 = ptrtoint ptr %t3290 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t3290
  %t3292 = or i64 %t3291, 4
  %t3293 = call i64 @rt_root(i64 %t3292)
  store i64 %t3293, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3317 = call ptr @rt_alloc_words(i64 1)
  %t3318 = ptrtoint ptr %t3317 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t3317
  %t3319 = or i64 %t3318, 4
  %t3320 = call i64 @rt_root(i64 %t3319)
  store i64 %t3320, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3325 = call ptr @rt_alloc_words(i64 1)
  %t3326 = ptrtoint ptr %t3325 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t3325
  %t3327 = or i64 %t3326, 4
  %t3328 = call i64 @rt_root(i64 %t3327)
  store i64 %t3328, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3338 = call ptr @rt_alloc_words(i64 1)
  %t3339 = ptrtoint ptr %t3338 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t3338
  %t3340 = or i64 %t3339, 4
  %t3341 = call i64 @rt_root(i64 %t3340)
  store i64 %t3341, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3403 = call ptr @rt_alloc_words(i64 1)
  %t3404 = ptrtoint ptr %t3403 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t3403
  %t3405 = or i64 %t3404, 4
  %t3406 = call i64 @rt_root(i64 %t3405)
  store i64 %t3406, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3422 = call ptr @rt_alloc_words(i64 1)
  %t3423 = ptrtoint ptr %t3422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t3422
  %t3424 = or i64 %t3423, 4
  %t3425 = call i64 @rt_root(i64 %t3424)
  store i64 %t3425, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3438 = call ptr @rt_alloc_words(i64 1)
  %t3439 = ptrtoint ptr %t3438 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t3438
  %t3440 = or i64 %t3439, 4
  %t3441 = call i64 @rt_root(i64 %t3440)
  store i64 %t3441, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3467 = call ptr @rt_alloc_words(i64 1)
  %t3468 = ptrtoint ptr %t3467 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t3467
  %t3469 = or i64 %t3468, 4
  %t3470 = call i64 @rt_root(i64 %t3469)
  store i64 %t3470, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3496 = call ptr @rt_alloc_words(i64 1)
  %t3497 = ptrtoint ptr %t3496 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t3496
  %t3498 = or i64 %t3497, 4
  %t3499 = call i64 @rt_root(i64 %t3498)
  store i64 %t3499, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3514 = call ptr @rt_alloc_words(i64 1)
  %t3515 = ptrtoint ptr %t3514 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t3514
  %t3516 = or i64 %t3515, 4
  %t3517 = call i64 @rt_root(i64 %t3516)
  store i64 %t3517, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3617 = call ptr @rt_alloc_words(i64 1)
  %t3618 = ptrtoint ptr %t3617 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t3617
  %t3619 = or i64 %t3618, 4
  %t3620 = call i64 @rt_root(i64 %t3619)
  store i64 %t3620, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3639 = call ptr @rt_alloc_words(i64 1)
  %t3640 = ptrtoint ptr %t3639 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t3639
  %t3641 = or i64 %t3640, 4
  %t3642 = call i64 @rt_root(i64 %t3641)
  store i64 %t3642, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3688 = call ptr @rt_alloc_words(i64 1)
  %t3689 = ptrtoint ptr %t3688 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3688
  %t3690 = or i64 %t3689, 4
  %t3691 = call i64 @rt_root(i64 %t3690)
  store i64 %t3691, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3737 = call ptr @rt_alloc_words(i64 1)
  %t3738 = ptrtoint ptr %t3737 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3737
  %t3739 = or i64 %t3738, 4
  %t3740 = call i64 @rt_root(i64 %t3739)
  store i64 %t3740, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3787 = call ptr @rt_alloc_words(i64 1)
  %t3788 = ptrtoint ptr %t3787 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3787
  %t3789 = or i64 %t3788, 4
  %t3790 = call i64 @rt_root(i64 %t3789)
  store i64 %t3790, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3837 = call ptr @rt_alloc_words(i64 1)
  %t3838 = ptrtoint ptr %t3837 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3837
  %t3839 = or i64 %t3838, 4
  %t3840 = call i64 @rt_root(i64 %t3839)
  store i64 %t3840, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3950 = call ptr @rt_alloc_words(i64 1)
  %t3951 = ptrtoint ptr %t3950 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3950
  %t3952 = or i64 %t3951, 4
  %t3953 = call i64 @rt_root(i64 %t3952)
  store i64 %t3953, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4089 = call ptr @rt_alloc_words(i64 1)
  %t4090 = ptrtoint ptr %t4089 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t4089
  %t4091 = or i64 %t4090, 4
  %t4092 = call i64 @rt_root(i64 %t4091)
  store i64 %t4092, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4228 = call ptr @rt_alloc_words(i64 1)
  %t4229 = ptrtoint ptr %t4228 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t4228
  %t4230 = or i64 %t4229, 4
  %t4231 = call i64 @rt_root(i64 %t4230)
  store i64 %t4231, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4252 = call ptr @rt_alloc_words(i64 1)
  %t4253 = ptrtoint ptr %t4252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t4252
  %t4254 = or i64 %t4253, 4
  %t4255 = call i64 @rt_root(i64 %t4254)
  store i64 %t4255, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4360 = call ptr @rt_alloc_words(i64 1)
  %t4361 = ptrtoint ptr %t4360 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t4360
  %t4362 = or i64 %t4361, 4
  %t4363 = call i64 @rt_root(i64 %t4362)
  store i64 %t4363, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4681 = call ptr @rt_alloc_words(i64 1)
  %t4682 = ptrtoint ptr %t4681 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t4681
  %t4683 = or i64 %t4682, 4
  %t4684 = call i64 @rt_root(i64 %t4683)
  store i64 %t4684, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4873 = call ptr @rt_alloc_words(i64 1)
  %t4874 = ptrtoint ptr %t4873 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t4873
  %t4875 = or i64 %t4874, 4
  %t4876 = call i64 @rt_root(i64 %t4875)
  store i64 %t4876, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t5051 = call ptr @rt_alloc_words(i64 1)
  %t5052 = ptrtoint ptr %t5051 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t5051
  %t5053 = or i64 %t5052, 4
  %t5054 = call i64 @rt_root(i64 %t5053)
  store i64 %t5054, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t5078 = call ptr @rt_alloc_words(i64 1)
  %t5079 = ptrtoint ptr %t5078 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t5078
  %t5080 = or i64 %t5079, 4
  %t5081 = call i64 @rt_root(i64 %t5080)
  store i64 %t5081, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t5095 = call ptr @rt_alloc_words(i64 1)
  %t5096 = ptrtoint ptr %t5095 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t5095
  %t5097 = or i64 %t5096, 4
  %t5098 = call i64 @rt_root(i64 %t5097)
  store i64 %t5098, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t5234 = call ptr @rt_alloc_words(i64 1)
  %t5235 = ptrtoint ptr %t5234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t5234
  %t5236 = or i64 %t5235, 4
  %t5237 = call i64 @rt_root(i64 %t5236)
  store i64 %t5237, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t5303 = call ptr @rt_alloc_words(i64 1)
  %t5304 = ptrtoint ptr %t5303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t5303
  %t5305 = or i64 %t5304, 4
  %t5306 = call i64 @rt_root(i64 %t5305)
  store i64 %t5306, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t5364 = call ptr @rt_alloc_words(i64 1)
  %t5365 = ptrtoint ptr %t5364 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t5364
  %t5366 = or i64 %t5365, 4
  %t5367 = call i64 @rt_root(i64 %t5366)
  store i64 %t5367, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t5385 = call ptr @rt_alloc_words(i64 1)
  %t5386 = ptrtoint ptr %t5385 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t5385
  %t5387 = or i64 %t5386, 4
  %t5388 = call i64 @rt_root(i64 %t5387)
  store i64 %t5388, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5468 = call ptr @rt_alloc_words(i64 1)
  %t5469 = ptrtoint ptr %t5468 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t5468
  %t5470 = or i64 %t5469, 4
  %t5471 = call i64 @rt_root(i64 %t5470)
  store i64 %t5471, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5646 = call ptr @rt_alloc_words(i64 1)
  %t5647 = ptrtoint ptr %t5646 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t5646
  %t5648 = or i64 %t5647, 4
  %t5649 = call i64 @rt_root(i64 %t5648)
  store i64 %t5649, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t5673 = call ptr @rt_alloc_words(i64 1)
  %t5674 = ptrtoint ptr %t5673 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t5673
  %t5675 = or i64 %t5674, 4
  %t5676 = call i64 @rt_root(i64 %t5675)
  store i64 %t5676, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5690 = call ptr @rt_alloc_words(i64 1)
  %t5691 = ptrtoint ptr %t5690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t5690
  %t5692 = or i64 %t5691, 4
  %t5693 = call i64 @rt_root(i64 %t5692)
  store i64 %t5693, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t5798 = call ptr @rt_alloc_words(i64 1)
  %t5799 = ptrtoint ptr %t5798 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t5798
  %t5800 = or i64 %t5799, 4
  %t5801 = call i64 @rt_root(i64 %t5800)
  store i64 %t5801, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t6119 = call ptr @rt_alloc_words(i64 1)
  %t6120 = ptrtoint ptr %t6119 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t6119
  %t6121 = or i64 %t6120, 4
  %t6122 = call i64 @rt_root(i64 %t6121)
  store i64 %t6122, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t6258 = call ptr @rt_alloc_words(i64 1)
  %t6259 = ptrtoint ptr %t6258 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t6258
  %t6260 = or i64 %t6259, 4
  %t6261 = call i64 @rt_root(i64 %t6260)
  store i64 %t6261, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t6579 = call ptr @rt_alloc_words(i64 1)
  %t6580 = ptrtoint ptr %t6579 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t6579
  %t6581 = or i64 %t6580, 4
  %t6582 = call i64 @rt_root(i64 %t6581)
  store i64 %t6582, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t6718 = call ptr @rt_alloc_words(i64 1)
  %t6719 = ptrtoint ptr %t6718 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t6718
  %t6720 = or i64 %t6719, 4
  %t6721 = call i64 @rt_root(i64 %t6720)
  store i64 %t6721, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t6742 = call ptr @rt_alloc_words(i64 1)
  %t6743 = ptrtoint ptr %t6742 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t6742
  %t6744 = or i64 %t6743, 4
  %t6745 = call i64 @rt_root(i64 %t6744)
  store i64 %t6745, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t6746 = call i64 @rt_root(i64 8000000)
  store i64 %t6746, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t6795 = call ptr @rt_alloc_words(i64 1)
  %t6796 = ptrtoint ptr %t6795 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t6795
  %t6797 = or i64 %t6796, 4
  %t6798 = call i64 @rt_root(i64 %t6797)
  store i64 %t6798, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t6915 = call ptr @rt_alloc_words(i64 1)
  %t6916 = ptrtoint ptr %t6915 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t6915
  %t6917 = or i64 %t6916, 4
  %t6918 = call i64 @rt_root(i64 %t6917)
  store i64 %t6918, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t6920 = call ptr @rt_alloc_words(i64 1)
  %t6921 = ptrtoint ptr %t6920 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t6920
  %t6922 = or i64 %t6921, 4
  %t6923 = call i64 @rt_root(i64 %t6922)
  store i64 %t6923, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t6925 = call ptr @rt_alloc_words(i64 1)
  %t6926 = ptrtoint ptr %t6925 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t6925
  %t6927 = or i64 %t6926, 4
  %t6928 = call i64 @rt_root(i64 %t6927)
  store i64 %t6928, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t7045 = call ptr @rt_alloc_words(i64 1)
  %t7046 = ptrtoint ptr %t7045 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t7045
  %t7047 = or i64 %t7046, 4
  %t7048 = call i64 @rt_root(i64 %t7047)
  store i64 %t7048, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t7074 = call ptr @rt_alloc_words(i64 1)
  %t7075 = ptrtoint ptr %t7074 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t7074
  %t7076 = or i64 %t7075, 4
  %t7077 = call i64 @rt_root(i64 %t7076)
  store i64 %t7077, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t7103 = call ptr @rt_alloc_words(i64 1)
  %t7104 = ptrtoint ptr %t7103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t7103
  %t7105 = or i64 %t7104, 4
  %t7106 = call i64 @rt_root(i64 %t7105)
  store i64 %t7106, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t7134 = call ptr @rt_alloc_words(i64 1)
  %t7135 = ptrtoint ptr %t7134 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t7134
  %t7136 = or i64 %t7135, 4
  %t7137 = call i64 @rt_root(i64 %t7136)
  store i64 %t7137, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t7179 = call ptr @rt_alloc_words(i64 1)
  %t7180 = ptrtoint ptr %t7179 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t7179
  %t7181 = or i64 %t7180, 4
  %t7182 = call i64 @rt_root(i64 %t7181)
  store i64 %t7182, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t7183 = call i64 @rt_root(i64 64)
  store i64 %t7183, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t7184 = call i64 @rt_root(i64 24)
  store i64 %t7184, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t7195 = call ptr @rt_alloc_words(i64 1)
  %t7196 = ptrtoint ptr %t7195 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t7195
  %t7197 = or i64 %t7196, 4
  %t7198 = call i64 @rt_root(i64 %t7197)
  store i64 %t7198, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t7209 = call ptr @rt_alloc_words(i64 1)
  %t7210 = ptrtoint ptr %t7209 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-eq-hash-table" to i64), ptr %t7209
  %t7211 = or i64 %t7210, 4
  %t7212 = call i64 @rt_root(i64 %t7211)
  store i64 %t7212, ptr @"scheme.base:make-eq-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t7215 = call ptr @rt_alloc_words(i64 1)
  %t7216 = ptrtoint ptr %t7215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t7215
  %t7217 = or i64 %t7216, 4
  %t7218 = call i64 @rt_root(i64 %t7217)
  store i64 %t7218, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t7222 = call ptr @rt_alloc_words(i64 1)
  %t7223 = ptrtoint ptr %t7222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t7222
  %t7224 = or i64 %t7223, 4
  %t7225 = call i64 @rt_root(i64 %t7224)
  store i64 %t7225, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t7229 = call ptr @rt_alloc_words(i64 1)
  %t7230 = ptrtoint ptr %t7229 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t7229
  %t7231 = or i64 %t7230, 4
  %t7232 = call i64 @rt_root(i64 %t7231)
  store i64 %t7232, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t7236 = call ptr @rt_alloc_words(i64 1)
  %t7237 = ptrtoint ptr %t7236 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-identity?" to i64), ptr %t7236
  %t7238 = or i64 %t7237, 4
  %t7239 = call i64 @rt_root(i64 %t7238)
  store i64 %t7239, ptr @"scheme.base:%ht-identity?"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t7243 = call ptr @rt_alloc_words(i64 1)
  %t7244 = ptrtoint ptr %t7243 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t7243
  %t7245 = or i64 %t7244, 4
  %t7246 = call i64 @rt_root(i64 %t7245)
  store i64 %t7246, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t7250 = call ptr @rt_alloc_words(i64 1)
  %t7251 = ptrtoint ptr %t7250 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t7250
  %t7252 = or i64 %t7251, 4
  %t7253 = call i64 @rt_root(i64 %t7252)
  store i64 %t7253, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t7264 = call ptr @rt_alloc_words(i64 1)
  %t7265 = ptrtoint ptr %t7264 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-hash" to i64), ptr %t7264
  %t7266 = or i64 %t7265, 4
  %t7267 = call i64 @rt_root(i64 %t7266)
  store i64 %t7267, ptr @"scheme.base:%ht-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t7278 = call ptr @rt_alloc_words(i64 1)
  %t7279 = ptrtoint ptr %t7278 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-key=?" to i64), ptr %t7278
  %t7280 = or i64 %t7279, 4
  %t7281 = call i64 @rt_root(i64 %t7280)
  store i64 %t7281, ptr @"scheme.base:%ht-key=?"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t7290 = call ptr @rt_alloc_words(i64 1)
  %t7291 = ptrtoint ptr %t7290 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t7290
  %t7292 = or i64 %t7291, 4
  %t7293 = call i64 @rt_root(i64 %t7292)
  store i64 %t7293, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t7314 = call ptr @rt_alloc_words(i64 1)
  %t7315 = ptrtoint ptr %t7314 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t7314
  %t7316 = or i64 %t7315, 4
  %t7317 = call i64 @rt_root(i64 %t7316)
  store i64 %t7317, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t7340 = call ptr @rt_alloc_words(i64 1)
  %t7341 = ptrtoint ptr %t7340 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t7340
  %t7342 = or i64 %t7341, 4
  %t7343 = call i64 @rt_root(i64 %t7342)
  store i64 %t7343, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t7367 = call ptr @rt_alloc_words(i64 1)
  %t7368 = ptrtoint ptr %t7367 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t7367
  %t7369 = or i64 %t7368, 4
  %t7370 = call i64 @rt_root(i64 %t7369)
  store i64 %t7370, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t7393 = call ptr @rt_alloc_words(i64 1)
  %t7394 = ptrtoint ptr %t7393 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t7393
  %t7395 = or i64 %t7394, 4
  %t7396 = call i64 @rt_root(i64 %t7395)
  store i64 %t7396, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t7427 = call ptr @rt_alloc_words(i64 1)
  %t7428 = ptrtoint ptr %t7427 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t7427
  %t7429 = or i64 %t7428, 4
  %t7430 = call i64 @rt_root(i64 %t7429)
  store i64 %t7430, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t7514 = call ptr @rt_alloc_words(i64 1)
  %t7515 = ptrtoint ptr %t7514 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t7514
  %t7516 = or i64 %t7515, 4
  %t7517 = call i64 @rt_root(i64 %t7516)
  store i64 %t7517, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t7567 = call ptr @rt_alloc_words(i64 1)
  %t7568 = ptrtoint ptr %t7567 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t7567
  %t7569 = or i64 %t7568, 4
  %t7570 = call i64 @rt_root(i64 %t7569)
  store i64 %t7570, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t7684 = call ptr @rt_alloc_words(i64 1)
  %t7685 = ptrtoint ptr %t7684 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t7684
  %t7686 = or i64 %t7685, 4
  %t7687 = call i64 @rt_root(i64 %t7686)
  store i64 %t7687, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t7695 = call ptr @rt_alloc_words(i64 1)
  %t7696 = ptrtoint ptr %t7695 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t7695
  %t7697 = or i64 %t7696, 4
  %t7698 = call i64 @rt_root(i64 %t7697)
  store i64 %t7698, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t7715 = call ptr @rt_alloc_words(i64 1)
  %t7716 = ptrtoint ptr %t7715 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t7715
  %t7717 = or i64 %t7716, 4
  %t7718 = call i64 @rt_root(i64 %t7717)
  store i64 %t7718, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t7766 = call ptr @rt_alloc_words(i64 1)
  %t7767 = ptrtoint ptr %t7766 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t7766
  %t7768 = or i64 %t7767, 4
  %t7769 = call i64 @rt_root(i64 %t7768)
  store i64 %t7769, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t7788 = call ptr @rt_alloc_words(i64 1)
  %t7789 = ptrtoint ptr %t7788 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t7788
  %t7790 = or i64 %t7789, 4
  %t7791 = call i64 @rt_root(i64 %t7790)
  store i64 %t7791, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t7810 = call ptr @rt_alloc_words(i64 1)
  %t7811 = ptrtoint ptr %t7810 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t7810
  %t7812 = or i64 %t7811, 4
  %t7813 = call i64 @rt_root(i64 %t7812)
  store i64 %t7813, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t8060 = call ptr @rt_alloc_words(i64 1)
  %t8061 = ptrtoint ptr %t8060 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t8060
  %t8062 = or i64 %t8061, 4
  %t8063 = call i64 @rt_root(i64 %t8062)
  store i64 %t8063, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t8085 = call ptr @rt_alloc_words(i64 1)
  %t8086 = ptrtoint ptr %t8085 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t8085
  %t8087 = or i64 %t8086, 4
  %t8088 = call i64 @rt_root(i64 %t8087)
  store i64 %t8088, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t8096 = call ptr @rt_alloc_words(i64 1)
  %t8097 = ptrtoint ptr %t8096 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t8096
  %t8098 = or i64 %t8097, 4
  %t8099 = call i64 @rt_root(i64 %t8098)
  store i64 %t8099, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t8107 = call ptr @rt_alloc_words(i64 1)
  %t8108 = ptrtoint ptr %t8107 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t8107
  %t8109 = or i64 %t8108, 4
  %t8110 = call i64 @rt_root(i64 %t8109)
  store i64 %t8110, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t8217 = call ptr @rt_alloc_words(i64 1)
  %t8218 = ptrtoint ptr %t8217 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t8217
  %t8219 = or i64 %t8218, 4
  %t8220 = call i64 @rt_root(i64 %t8219)
  store i64 %t8220, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t8225 = call ptr @rt_alloc_words(i64 1)
  %t8226 = ptrtoint ptr %t8225 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t8225
  %t8227 = or i64 %t8226, 4
  %t8228 = call i64 @rt_root(i64 %t8227)
  store i64 %t8228, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t8238 = call ptr @rt_alloc_words(i64 1)
  %t8239 = ptrtoint ptr %t8238 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t8238
  %t8240 = or i64 %t8239, 4
  %t8241 = call i64 @rt_root(i64 %t8240)
  store i64 %t8241, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t8252 = call ptr @rt_alloc_words(i64 1)
  %t8253 = ptrtoint ptr %t8252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t8252
  %t8254 = or i64 %t8253, 4
  %t8255 = call i64 @rt_root(i64 %t8254)
  store i64 %t8255, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t8263 = call ptr @rt_alloc_words(i64 1)
  %t8264 = ptrtoint ptr %t8263 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t8263
  %t8265 = or i64 %t8264, 4
  %t8266 = call i64 @rt_root(i64 %t8265)
  store i64 %t8266, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t8269 = call ptr @rt_alloc_words(i64 1)
  %t8270 = ptrtoint ptr %t8269 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t8269
  %t8271 = or i64 %t8270, 4
  %t8272 = call i64 @rt_root(i64 %t8271)
  store i64 %t8272, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t8283 = call ptr @rt_alloc_words(i64 1)
  %t8284 = ptrtoint ptr %t8283 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t8283
  %t8285 = or i64 %t8284, 4
  %t8286 = call i64 @rt_root(i64 %t8285)
  store i64 %t8286, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t8297 = call ptr @rt_alloc_words(i64 1)
  %t8298 = ptrtoint ptr %t8297 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t8297
  %t8299 = or i64 %t8298, 4
  %t8300 = call i64 @rt_root(i64 %t8299)
  store i64 %t8300, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t8326 = call ptr @rt_alloc_words(i64 1)
  %t8327 = ptrtoint ptr %t8326 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t8326
  %t8328 = or i64 %t8327, 4
  %t8329 = call i64 @rt_root(i64 %t8328)
  store i64 %t8329, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t8355 = call ptr @rt_alloc_words(i64 1)
  %t8356 = ptrtoint ptr %t8355 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t8355
  %t8357 = or i64 %t8356, 4
  %t8358 = call i64 @rt_root(i64 %t8357)
  store i64 %t8358, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t8362 = call ptr @rt_alloc_words(i64 1)
  %t8363 = ptrtoint ptr %t8362 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t8362
  %t8364 = or i64 %t8363, 4
  %t8365 = call i64 @rt_root(i64 %t8364)
  store i64 %t8365, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t8386 = call ptr @rt_alloc_words(i64 1)
  %t8387 = ptrtoint ptr %t8386 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t8386
  %t8388 = or i64 %t8387, 4
  %t8389 = call i64 @rt_root(i64 %t8388)
  store i64 %t8389, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t8419 = call ptr @rt_alloc_words(i64 1)
  %t8420 = ptrtoint ptr %t8419 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t8419
  %t8421 = or i64 %t8420, 4
  %t8422 = call i64 @rt_root(i64 %t8421)
  store i64 %t8422, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t8443 = call ptr @rt_alloc_words(i64 1)
  %t8444 = ptrtoint ptr %t8443 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t8443
  %t8445 = or i64 %t8444, 4
  %t8446 = call i64 @rt_root(i64 %t8445)
  store i64 %t8446, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t8564 = call ptr @rt_alloc_words(i64 1)
  %t8565 = ptrtoint ptr %t8564 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t8564
  %t8566 = or i64 %t8565, 4
  %t8567 = call i64 @rt_root(i64 %t8566)
  store i64 %t8567, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t8615 = call ptr @rt_alloc_words(i64 1)
  %t8616 = ptrtoint ptr %t8615 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t8615
  %t8617 = or i64 %t8616, 4
  %t8618 = call i64 @rt_root(i64 %t8617)
  store i64 %t8618, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t8632 = call ptr @rt_alloc_words(i64 1)
  %t8633 = ptrtoint ptr %t8632 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t8632
  %t8634 = or i64 %t8633, 4
  %t8635 = call i64 @rt_root(i64 %t8634)
  store i64 %t8635, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t8666 = call ptr @rt_alloc_words(i64 1)
  %t8667 = ptrtoint ptr %t8666 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t8666
  %t8668 = or i64 %t8667, 4
  %t8669 = call i64 @rt_root(i64 %t8668)
  store i64 %t8669, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t8680 = call ptr @rt_alloc_words(i64 1)
  %t8681 = ptrtoint ptr %t8680 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t8680
  %t8682 = or i64 %t8681, 4
  %t8683 = call i64 @rt_root(i64 %t8682)
  store i64 %t8683, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t8712 = call ptr @rt_alloc_words(i64 1)
  %t8713 = ptrtoint ptr %t8712 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t8712
  %t8714 = or i64 %t8713, 4
  %t8715 = call i64 @rt_root(i64 %t8714)
  store i64 %t8715, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t8738 = call ptr @rt_alloc_words(i64 1)
  %t8739 = ptrtoint ptr %t8738 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t8738
  %t8740 = or i64 %t8739, 4
  %t8741 = call i64 @rt_root(i64 %t8740)
  store i64 %t8741, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t8764 = call ptr @rt_alloc_words(i64 1)
  %t8765 = ptrtoint ptr %t8764 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t8764
  %t8766 = or i64 %t8765, 4
  %t8767 = call i64 @rt_root(i64 %t8766)
  store i64 %t8767, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_215"() {
entry:
  %t8768 = call i64 @rt_root(i64 1)
  store i64 %t8768, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_216"() {
entry:
  %t8769 = call i64 @rt_root(i64 1)
  store i64 %t8769, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_217"() {
entry:
  %t8770 = call i64 @rt_root(i64 1)
  store i64 %t8770, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_218"() {
entry:
  %t8814 = call ptr @rt_alloc_words(i64 1)
  %t8815 = ptrtoint ptr %t8814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t8814
  %t8816 = or i64 %t8815, 4
  %t8817 = call i64 @rt_root(i64 %t8816)
  store i64 %t8817, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_219"() {
entry:
  %t8855 = call ptr @rt_alloc_words(i64 1)
  %t8856 = ptrtoint ptr %t8855 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t8855
  %t8857 = or i64 %t8856, 4
  %t8858 = call i64 @rt_root(i64 %t8857)
  store i64 %t8858, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_220"() {
entry:
  %t8896 = call ptr @rt_alloc_words(i64 1)
  %t8897 = ptrtoint ptr %t8896 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t8896
  %t8898 = or i64 %t8897, 4
  %t8899 = call i64 @rt_root(i64 %t8898)
  store i64 %t8899, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_221"() {
entry:
  %t8946 = call ptr @rt_alloc_words(i64 1)
  %t8947 = ptrtoint ptr %t8946 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t8946
  %t8948 = or i64 %t8947, 4
  %t8949 = call i64 @rt_root(i64 %t8948)
  store i64 %t8949, ptr @"scheme.base:call-with-port"
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

