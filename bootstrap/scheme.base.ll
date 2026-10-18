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
@"scheme.base:fold-left" = global i64 0
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

define fastcc i64 @"scheme.base:code_241"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  %t56 = musttail call fastcc i64 @"scheme.base:code_241"(i64 %self, i64 2, i64 %t47, i64 %t55, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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
  store i64 ptrtoint (ptr @"scheme.base:code_241" to i64), ptr %t58
  %t60 = or i64 %t59, 4
  %t61 = getelementptr i64, ptr %t58, i64 1
  store i64 %t60, ptr %t61
  %t62 = musttail call fastcc i64 @"scheme.base:code_241"(i64 %t60, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t62
}

define fastcc i64 @"scheme.base:code_248"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  %t73 = musttail call fastcc i64 @"scheme.base:code_248"(i64 %self, i64 2, i64 %t70, i64 %t72, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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
  store i64 ptrtoint (ptr @"scheme.base:code_248" to i64), ptr %t75
  %t77 = or i64 %t76, 4
  %t78 = getelementptr i64, ptr %t75, i64 1
  store i64 %t77, ptr %t78
  %t79 = musttail call fastcc i64 @"scheme.base:code_248"(i64 %t77, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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

define fastcc i64 @"scheme.base:code_265"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_267"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  store i64 ptrtoint (ptr @"scheme.base:code_265" to i64), ptr %t249
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
  store i64 ptrtoint (ptr @"scheme.base:code_267" to i64), ptr %t285
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

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t565 = icmp eq i64 %argc, 3
  br i1 %t565, label %argok123, label %arityerr122
arityerr122:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok123:
  %t566 = call i64 @rt_null_p(i64 %a2)
  %t567 = icmp ne i64 %t566, 1
  br i1 %t567, label %then124, label %else125
then124:
  ret i64 %a1
else125:
  %t568 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t569 = and i64 %a0, -8
  %t570 = inttoptr i64 %t569 to ptr
  %t571 = load i64, ptr %t570
  %t572 = inttoptr i64 %t571 to ptr
  %t573 = call fastcc i64%t572(i64 %a0, i64 2, i64 %a1, i64 %t568, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t574 = call i64 @rt_cdr(i64 %a2)
  %t575 = load i64, ptr @"scheme.base:fold-left"
  call void @rt_check_callable(i64 %t575)
  %t576 = and i64 %t575, -8
  %t577 = inttoptr i64 %t576 to ptr
  %t578 = load i64, ptr %t577
  %t579 = inttoptr i64 %t578 to ptr
  %t580 = musttail call fastcc i64 %t579(i64 %t575, i64 3, i64 %a0, i64 %t573, i64 %t574, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t580
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t585 = icmp eq i64 %argc, 2
  br i1 %t585, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok127:
  %t586 = call i64 @rt_null_p(i64 %a1)
  %t587 = icmp ne i64 %t586, 1
  br i1 %t587, label %then128, label %else129
then128:
  %t588 = icmp ne i64 1, 1
  br i1 %t588, label %then130, label %else131
then130:
  ret i64 1
else131:
  ret i64 17
else129:
  %t589 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t590 = and i64 %a0, -8
  %t591 = inttoptr i64 %t590 to ptr
  %t592 = load i64, ptr %t591
  %t593 = inttoptr i64 %t592 to ptr
  %t594 = call fastcc i64%t593(i64 %a0, i64 1, i64 %t589, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t595 = call i64 @rt_cdr(i64 %a1)
  %t596 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t596)
  %t597 = and i64 %t596, -8
  %t598 = inttoptr i64 %t597 to ptr
  %t599 = load i64, ptr %t598
  %t600 = inttoptr i64 %t599 to ptr
  %t601 = musttail call fastcc i64 %t600(i64 %t596, i64 2, i64 %a0, i64 %t595, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t601
}

define fastcc i64 @"scheme.base:code_316"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t606 = icmp eq i64 %argc, 1
  br i1 %t606, label %argok133, label %arityerr132
arityerr132:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok133:
  %t607 = call i64 @rt_car(i64 %a0)
  ret i64 %t607
}

define fastcc i64 @"scheme.base:code_318"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t608 = icmp eq i64 %argc, 1
  br i1 %t608, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok135:
  %t609 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t609
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t610 = icmp eq i64 %argc, 2
  br i1 %t610, label %argok137, label %arityerr136
arityerr136:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok137:
  %t611 = load i64, ptr @"scheme.base:%any-null?"
  call void @rt_check_callable(i64 %t611)
  %t612 = and i64 %t611, -8
  %t613 = inttoptr i64 %t612 to ptr
  %t614 = load i64, ptr %t613
  %t615 = inttoptr i64 %t614 to ptr
  %t616 = call fastcc i64%t615(i64 %t611, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t617 = icmp ne i64 %t616, 1
  br i1 %t617, label %then138, label %else139
then138:
  %t618 = icmp ne i64 1, 1
  br i1 %t618, label %then140, label %else141
then140:
  ret i64 1
else141:
  ret i64 17
else139:
  %t619 = call ptr @rt_alloc_words(i64 1)
  %t620 = ptrtoint ptr %t619 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_316" to i64), ptr %t619
  %t621 = or i64 %t620, 4
  %t622 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t622)
  %t623 = and i64 %t622, -8
  %t624 = inttoptr i64 %t623 to ptr
  %t625 = load i64, ptr %t624
  %t626 = inttoptr i64 %t625 to ptr
  %t627 = call fastcc i64%t626(i64 %t622, i64 2, i64 %t621, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t628 = and i64 %a0, -8
  %t629 = inttoptr i64 %t628 to ptr
  %t630 = load i64, ptr %t629
  %t631 = inttoptr i64 %t630 to ptr
  %t632 = call i64 @rt_list_length(i64 %t627)
  %t633 = add i64 0, %t632
  %t634 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t627, i64 8)
  %t646 = getelementptr i64, ptr %t634, i64 0
  %t638 = load i64, ptr %t646
  %t647 = getelementptr i64, ptr %t634, i64 1
  %t639 = load i64, ptr %t647
  %t648 = getelementptr i64, ptr %t634, i64 2
  %t640 = load i64, ptr %t648
  %t649 = getelementptr i64, ptr %t634, i64 3
  %t641 = load i64, ptr %t649
  %t650 = getelementptr i64, ptr %t634, i64 4
  %t642 = load i64, ptr %t650
  %t651 = getelementptr i64, ptr %t634, i64 5
  %t643 = load i64, ptr %t651
  %t652 = getelementptr i64, ptr %t634, i64 6
  %t644 = load i64, ptr %t652
  %t653 = getelementptr i64, ptr %t634, i64 7
  %t645 = load i64, ptr %t653
  %t635 = icmp sgt i64 %t633, 8
  %t636 = getelementptr i64, ptr %t634, i64 8
  %t637 = select i1 %t635, ptr %t636, ptr null
  %t654 = call fastcc i64%t631(i64 %a0, i64 %t633, i64 %t638, i64 %t639, i64 %t640, i64 %t641, i64 %t642, i64 %t643, i64 %t644, i64 %t645, ptr %t637)
  %t655 = call ptr @rt_alloc_words(i64 1)
  %t656 = ptrtoint ptr %t655 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_318" to i64), ptr %t655
  %t657 = or i64 %t656, 4
  %t658 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t658)
  %t659 = and i64 %t658, -8
  %t660 = inttoptr i64 %t659 to ptr
  %t661 = load i64, ptr %t660
  %t662 = inttoptr i64 %t661 to ptr
  %t663 = call fastcc i64%t662(i64 %t658, i64 2, i64 %t657, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t664 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t664)
  %t665 = and i64 %t664, -8
  %t666 = inttoptr i64 %t665 to ptr
  %t667 = load i64, ptr %t666
  %t668 = inttoptr i64 %t667 to ptr
  %t669 = musttail call fastcc i64 %t668(i64 %t664, i64 2, i64 %a0, i64 %t663, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t669
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t674 = icmp sge i64 %argc, 2
  br i1 %t674, label %argok143, label %arityerr142
arityerr142:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok143:
  %t675 = call ptr @rt_alloc_words(i64 8)
  %t676 = getelementptr i64, ptr %t675, i64 0
  store i64 %a0, ptr %t676
  %t677 = getelementptr i64, ptr %t675, i64 1
  store i64 %a1, ptr %t677
  %t678 = getelementptr i64, ptr %t675, i64 2
  store i64 %a2, ptr %t678
  %t679 = getelementptr i64, ptr %t675, i64 3
  store i64 %a3, ptr %t679
  %t680 = getelementptr i64, ptr %t675, i64 4
  store i64 %a4, ptr %t680
  %t681 = getelementptr i64, ptr %t675, i64 5
  store i64 %a5, ptr %t681
  %t682 = getelementptr i64, ptr %t675, i64 6
  store i64 %a6, ptr %t682
  %t683 = getelementptr i64, ptr %t675, i64 7
  store i64 %a7, ptr %t683
  %t684 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t675, ptr %overflow)
  %t685 = call i64 @rt_null_p(i64 %t684)
  %t686 = icmp ne i64 %t685, 1
  br i1 %t686, label %then144, label %else145
then144:
  %t687 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t687)
  %t688 = and i64 %t687, -8
  %t689 = inttoptr i64 %t688 to ptr
  %t690 = load i64, ptr %t689
  %t691 = inttoptr i64 %t690 to ptr
  %t692 = musttail call fastcc i64 %t691(i64 %t687, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t692
else145:
  %t693 = call i64 @rt_cons(i64 %a1, i64 %t684)
  %t694 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t694)
  %t695 = and i64 %t694, -8
  %t696 = inttoptr i64 %t695 to ptr
  %t697 = load i64, ptr %t696
  %t698 = inttoptr i64 %t697 to ptr
  %t699 = musttail call fastcc i64 %t698(i64 %t694, i64 2, i64 %a0, i64 %t693, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t699
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cfor-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t700 = call i64 @rt_null_p(i64 2)
  %t701 = icmp ne i64 %t700, 1
  br i1 %t701, label %then146, label %else147
then146:
  %t702 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t702)
  %t703 = and i64 %t702, -8
  %t704 = inttoptr i64 %t703 to ptr
  %t705 = load i64, ptr %t704
  %t706 = inttoptr i64 %t705 to ptr
  %t707 = musttail call fastcc i64 %t706(i64 %t702, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t707
else147:
  %t708 = call i64 @rt_cons(i64 %a1, i64 2)
  %t709 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t709)
  %t710 = and i64 %t709, -8
  %t711 = inttoptr i64 %t710 to ptr
  %t712 = load i64, ptr %t711
  %t713 = inttoptr i64 %t712 to ptr
  %t714 = musttail call fastcc i64 %t713(i64 %t709, i64 2, i64 %a0, i64 %t708, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t714
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t719 = icmp eq i64 %argc, 2
  br i1 %t719, label %argok149, label %arityerr148
arityerr148:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok149:
  %t720 = call i64 @rt_null_p(i64 %a1)
  %t721 = icmp ne i64 %t720, 1
  br i1 %t721, label %then150, label %else151
then150:
  ret i64 257
else151:
  %t722 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t723 = and i64 %a0, -8
  %t724 = inttoptr i64 %t723 to ptr
  %t725 = load i64, ptr %t724
  %t726 = inttoptr i64 %t725 to ptr
  %t727 = call fastcc i64%t726(i64 %a0, i64 1, i64 %t722, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t728 = icmp ne i64 %t727, 1
  br i1 %t728, label %then152, label %else153
then152:
  %t729 = call i64 @rt_cdr(i64 %a1)
  %t730 = load i64, ptr @"scheme.base:andmap"
  call void @rt_check_callable(i64 %t730)
  %t731 = and i64 %t730, -8
  %t732 = inttoptr i64 %t731 to ptr
  %t733 = load i64, ptr %t732
  %t734 = inttoptr i64 %t733 to ptr
  %t735 = musttail call fastcc i64 %t734(i64 %t730, i64 2, i64 %a0, i64 %t729, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t735
else153:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t740 = icmp eq i64 %argc, 2
  br i1 %t740, label %argok155, label %arityerr154
arityerr154:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok155:
  %t741 = call i64 @rt_null_p(i64 %a1)
  %t742 = icmp ne i64 %t741, 1
  br i1 %t742, label %then156, label %else157
then156:
  ret i64 1
else157:
  %t743 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t744 = and i64 %a0, -8
  %t745 = inttoptr i64 %t744 to ptr
  %t746 = load i64, ptr %t745
  %t747 = inttoptr i64 %t746 to ptr
  %t748 = call fastcc i64%t747(i64 %a0, i64 1, i64 %t743, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t749 = icmp ne i64 %t748, 1
  br i1 %t749, label %then158, label %else159
then158:
  ret i64 %a1
else159:
  %t750 = call i64 @rt_cdr(i64 %a1)
  %t751 = load i64, ptr @"scheme.base:memp"
  call void @rt_check_callable(i64 %t751)
  %t752 = and i64 %t751, -8
  %t753 = inttoptr i64 %t752 to ptr
  %t754 = load i64, ptr %t753
  %t755 = inttoptr i64 %t754 to ptr
  %t756 = musttail call fastcc i64 %t755(i64 %t751, i64 2, i64 %a0, i64 %t750, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t756
}

define fastcc i64 @"scheme.base:code_340"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t761 = icmp eq i64 %argc, 2
  br i1 %t761, label %argok161, label %arityerr160
arityerr160:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok161:
  %t762 = call i64 @rt_null_p(i64 %a1)
  %t763 = icmp ne i64 %t762, 1
  br i1 %t763, label %then162, label %else163
then162:
  ret i64 257
else163:
  %t764 = call i64 @rt_pair_p(i64 %a1)
  %t765 = call i64 @rt_not(i64 %t764)
  %t766 = icmp ne i64 %t765, 1
  br i1 %t766, label %then164, label %else165
then164:
  ret i64 1
else165:
  %t767 = call i64 @rt_cdr(i64 %a1)
  %t768 = call i64 @rt_null_p(i64 %t767)
  %t769 = icmp ne i64 %t768, 1
  br i1 %t769, label %then166, label %else167
then166:
  ret i64 257
else167:
  %t770 = call i64 @rt_pair_p(i64 %t767)
  %t771 = call i64 @rt_not(i64 %t770)
  %t772 = icmp ne i64 %t771, 1
  br i1 %t772, label %then168, label %else169
then168:
  ret i64 1
else169:
  %t773 = call i64 @rt_cdr(i64 %a0)
  %t774 = call i64 @rt_cdr(i64 %t767)
  %t775 = call i64 @rt_eq_p(i64 %t773, i64 %t774)
  %t776 = icmp ne i64 %t775, 1
  br i1 %t776, label %then170, label %else171
then170:
  ret i64 1
else171:
  %t777 = musttail call fastcc i64 @"scheme.base:code_340"(i64 %self, i64 2, i64 %t773, i64 %t774, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t777
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t778 = icmp eq i64 %argc, 1
  br i1 %t778, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok173:
  %t779 = call ptr @rt_alloc_words(i64 2)
  %t780 = ptrtoint ptr %t779 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_340" to i64), ptr %t779
  %t781 = or i64 %t780, 4
  %t782 = getelementptr i64, ptr %t779, i64 1
  store i64 %t781, ptr %t782
  %t783 = musttail call fastcc i64 @"scheme.base:code_340"(i64 %t781, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t783
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t788 = icmp eq i64 %argc, 1
  br i1 %t788, label %argok175, label %arityerr174
arityerr174:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok175:
  %t789 = or i64 %a0, 0
  %t790 = and i64 %t789, 7
  %t791 = icmp eq i64 %t790, 0
  br i1 %t791, label %fixfast176, label %fixslow177
fixfast176:
  %t792 = icmp eq i64 %a0, 0
  %t793 = select i1 %t792, i64 257, i64 1
  br label %fixmerge178
fixslow177:
  %t794 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge178
fixmerge178:
  %t795 = phi i64 [ %t793, %fixfast176 ], [ %t794, %fixslow177 ]
  ret i64 %t795
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t800 = icmp eq i64 %argc, 2
  br i1 %t800, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t801 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t801)
  %t802 = and i64 %t801, -8
  %t803 = inttoptr i64 %t802 to ptr
  %t804 = load i64, ptr %t803
  %t805 = inttoptr i64 %t804 to ptr
  %t806 = call fastcc i64%t805(i64 %t801, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t807 = icmp ne i64 %t806, 1
  br i1 %t807, label %then181, label %else182
then181:
  ret i64 %a0
else182:
  %t808 = call i64 @rt_cdr(i64 %a0)
  %t809 = or i64 %a1, 8
  %t810 = and i64 %t809, 7
  %t811 = icmp eq i64 %t810, 0
  br i1 %t811, label %fixfast183, label %fixslow184
fixfast183:
  %t812 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t813 = extractvalue {i64, i1} %t812, 0
  %t814 = extractvalue {i64, i1} %t812, 1
  br i1 %t814, label %fixslow184, label %fixmerge185
fixslow184:
  %t815 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge185
fixmerge185:
  %t816 = phi i64 [ %t813, %fixfast183 ], [ %t815, %fixslow184 ]
  %t817 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t817)
  %t818 = and i64 %t817, -8
  %t819 = inttoptr i64 %t818 to ptr
  %t820 = load i64, ptr %t819
  %t821 = inttoptr i64 %t820 to ptr
  %t822 = musttail call fastcc i64 %t821(i64 %t817, i64 2, i64 %t808, i64 %t816, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t822
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t827 = icmp eq i64 %argc, 2
  br i1 %t827, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t828 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t828)
  %t829 = and i64 %t828, -8
  %t830 = inttoptr i64 %t829 to ptr
  %t831 = load i64, ptr %t830
  %t832 = inttoptr i64 %t831 to ptr
  %t833 = call fastcc i64%t832(i64 %t828, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t834 = call i64 @rt_car(i64 %t833)
  ret i64 %t834
}

define fastcc i64 @"scheme.base:code:list-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t839 = icmp eq i64 %argc, 3
  br i1 %t839, label %argok189, label %arityerr188
arityerr188:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok189:
  %t840 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t840)
  %t841 = and i64 %t840, -8
  %t842 = inttoptr i64 %t841 to ptr
  %t843 = load i64, ptr %t842
  %t844 = inttoptr i64 %t843 to ptr
  %t845 = call fastcc i64%t844(i64 %t840, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t846 = call i64 @rt_set_car(i64 %t845, i64 %a2)
  ret i64 %t846
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t851 = icmp eq i64 %argc, 2
  br i1 %t851, label %argok191, label %arityerr190
arityerr190:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok191:
  %t852 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t852)
  %t853 = and i64 %t852, -8
  %t854 = inttoptr i64 %t853 to ptr
  %t855 = load i64, ptr %t854
  %t856 = inttoptr i64 %t855 to ptr
  %t857 = call fastcc i64%t856(i64 %t852, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t858 = icmp ne i64 %t857, 1
  br i1 %t858, label %then192, label %else193
then192:
  ret i64 2
else193:
  %t859 = call i64 @rt_car(i64 %a0)
  %t860 = call i64 @rt_cdr(i64 %a0)
  %t861 = or i64 %a1, 8
  %t862 = and i64 %t861, 7
  %t863 = icmp eq i64 %t862, 0
  br i1 %t863, label %fixfast194, label %fixslow195
fixfast194:
  %t864 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t865 = extractvalue {i64, i1} %t864, 0
  %t866 = extractvalue {i64, i1} %t864, 1
  br i1 %t866, label %fixslow195, label %fixmerge196
fixslow195:
  %t867 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge196
fixmerge196:
  %t868 = phi i64 [ %t865, %fixfast194 ], [ %t867, %fixslow195 ]
  %t869 = load i64, ptr @"scheme.base:list-head"
  call void @rt_check_callable(i64 %t869)
  %t870 = and i64 %t869, -8
  %t871 = inttoptr i64 %t870 to ptr
  %t872 = load i64, ptr %t871
  %t873 = inttoptr i64 %t872 to ptr
  %t874 = call fastcc i64%t873(i64 %t869, i64 2, i64 %t860, i64 %t868, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t875 = call i64 @rt_cons(i64 %t859, i64 %t874)
  ret i64 %t875
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t880 = icmp eq i64 %argc, 2
  br i1 %t880, label %argok198, label %arityerr197
arityerr197:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok198:
  %t881 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t881)
  %t882 = and i64 %t881, -8
  %t883 = inttoptr i64 %t882 to ptr
  %t884 = load i64, ptr %t883
  %t885 = inttoptr i64 %t884 to ptr
  %t886 = call fastcc i64%t885(i64 %t881, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t887 = icmp ne i64 %t886, 1
  br i1 %t887, label %then199, label %else200
then199:
  ret i64 2
else200:
  %t888 = or i64 %a0, 8
  %t889 = and i64 %t888, 7
  %t890 = icmp eq i64 %t889, 0
  br i1 %t890, label %fixfast201, label %fixslow202
fixfast201:
  %t891 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t892 = extractvalue {i64, i1} %t891, 0
  %t893 = extractvalue {i64, i1} %t891, 1
  br i1 %t893, label %fixslow202, label %fixmerge203
fixslow202:
  %t894 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge203
fixmerge203:
  %t895 = phi i64 [ %t892, %fixfast201 ], [ %t894, %fixslow202 ]
  %t896 = load i64, ptr @"scheme.base:make-list"
  call void @rt_check_callable(i64 %t896)
  %t897 = and i64 %t896, -8
  %t898 = inttoptr i64 %t897 to ptr
  %t899 = load i64, ptr %t898
  %t900 = inttoptr i64 %t899 to ptr
  %t901 = call fastcc i64%t900(i64 %t896, i64 2, i64 %t895, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t902 = call i64 @rt_cons(i64 %a1, i64 %t901)
  ret i64 %t902
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t907 = icmp eq i64 %argc, 4
  br i1 %t907, label %argok205, label %arityerr204
arityerr204:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok205:
  %t908 = call i64 @rt_null_p(i64 %a1)
  %t909 = icmp ne i64 %t908, 1
  br i1 %t909, label %then206, label %else207
then206:
  %t910 = icmp ne i64 %a3, 1
  br i1 %t910, label %then208, label %else209
then208:
  %t911 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t911
else209:
  ret i64 %a2
else207:
  %t912 = call i64 @rt_cdr(i64 %a1)
  %t913 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t914 = and i64 %a0, -8
  %t915 = inttoptr i64 %t914 to ptr
  %t916 = load i64, ptr %t915
  %t917 = inttoptr i64 %t916 to ptr
  %t918 = call fastcc i64%t917(i64 %a0, i64 2, i64 %a2, i64 %t913, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t919 = icmp ne i64 %a3, 1
  br i1 %t919, label %then210, label %else211
then210:
  br label %merge212
else211:
  %t920 = call i64 @rt_car(i64 %a1)
  %t921 = call i64 @rt_inexact_p(i64 %t920)
  br label %merge212
merge212:
  %t922 = phi i64 [ 257, %then210 ], [ %t921, %else211 ]
  %t923 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t923)
  %t924 = and i64 %t923, -8
  %t925 = inttoptr i64 %t924 to ptr
  %t926 = load i64, ptr %t925
  %t927 = inttoptr i64 %t926 to ptr
  %t928 = musttail call fastcc i64 %t927(i64 %t923, i64 4, i64 %a0, i64 %t912, i64 %t918, i64 %t922, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t928
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t933 = icmp eq i64 %argc, 3
  br i1 %t933, label %argok214, label %arityerr213
arityerr213:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok214:
  %t934 = call i64 @rt_inexact_p(i64 %a1)
  %t935 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t935)
  %t936 = and i64 %t935, -8
  %t937 = inttoptr i64 %t936 to ptr
  %t938 = load i64, ptr %t937
  %t939 = inttoptr i64 %t938 to ptr
  %t940 = musttail call fastcc i64 %t939(i64 %t935, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t934, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t940
}

define fastcc i64 @"scheme.base:code_378"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t945 = icmp eq i64 %argc, 2
  br i1 %t945, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok216:
  %t946 = or i64 %a0, %a1
  %t947 = and i64 %t946, 7
  %t948 = icmp eq i64 %t947, 0
  br i1 %t948, label %fixfast217, label %fixslow218
fixfast217:
  %t949 = icmp slt i64 %a0, %a1
  %t950 = select i1 %t949, i64 257, i64 1
  br label %fixmerge219
fixslow218:
  %t951 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge219
fixmerge219:
  %t952 = phi i64 [ %t950, %fixfast217 ], [ %t951, %fixslow218 ]
  %t953 = icmp ne i64 %t952, 1
  br i1 %t953, label %then220, label %else221
then220:
  ret i64 %a1
else221:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t954 = icmp sge i64 %argc, 1
  br i1 %t954, label %argok223, label %arityerr222
arityerr222:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok223:
  %t955 = call ptr @rt_alloc_words(i64 8)
  %t956 = getelementptr i64, ptr %t955, i64 0
  store i64 %a0, ptr %t956
  %t957 = getelementptr i64, ptr %t955, i64 1
  store i64 %a1, ptr %t957
  %t958 = getelementptr i64, ptr %t955, i64 2
  store i64 %a2, ptr %t958
  %t959 = getelementptr i64, ptr %t955, i64 3
  store i64 %a3, ptr %t959
  %t960 = getelementptr i64, ptr %t955, i64 4
  store i64 %a4, ptr %t960
  %t961 = getelementptr i64, ptr %t955, i64 5
  store i64 %a5, ptr %t961
  %t962 = getelementptr i64, ptr %t955, i64 6
  store i64 %a6, ptr %t962
  %t963 = getelementptr i64, ptr %t955, i64 7
  store i64 %a7, ptr %t963
  %t964 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t955, ptr %overflow)
  %t965 = call ptr @rt_alloc_words(i64 1)
  %t966 = ptrtoint ptr %t965 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_378" to i64), ptr %t965
  %t967 = or i64 %t966, 4
  %t968 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t968)
  %t969 = and i64 %t968, -8
  %t970 = inttoptr i64 %t969 to ptr
  %t971 = load i64, ptr %t970
  %t972 = inttoptr i64 %t971 to ptr
  %t973 = musttail call fastcc i64 %t972(i64 %t968, i64 3, i64 %t967, i64 %a0, i64 %t964, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t973
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t974 = call ptr @rt_alloc_words(i64 1)
  %t975 = ptrtoint ptr %t974 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_378" to i64), ptr %t974
  %t976 = or i64 %t975, 4
  %t977 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t977)
  %t978 = and i64 %t977, -8
  %t979 = inttoptr i64 %t978 to ptr
  %t980 = load i64, ptr %t979
  %t981 = inttoptr i64 %t980 to ptr
  %t982 = musttail call fastcc i64 %t981(i64 %t977, i64 3, i64 %t976, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t982
}

define fastcc i64 @"scheme.base:code_387"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t987 = icmp eq i64 %argc, 2
  br i1 %t987, label %argok225, label %arityerr224
arityerr224:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok225:
  %t988 = or i64 %a1, %a0
  %t989 = and i64 %t988, 7
  %t990 = icmp eq i64 %t989, 0
  br i1 %t990, label %fixfast226, label %fixslow227
fixfast226:
  %t991 = icmp slt i64 %a1, %a0
  %t992 = select i1 %t991, i64 257, i64 1
  br label %fixmerge228
fixslow227:
  %t993 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge228
fixmerge228:
  %t994 = phi i64 [ %t992, %fixfast226 ], [ %t993, %fixslow227 ]
  %t995 = icmp ne i64 %t994, 1
  br i1 %t995, label %then229, label %else230
then229:
  ret i64 %a1
else230:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t996 = icmp sge i64 %argc, 1
  br i1 %t996, label %argok232, label %arityerr231
arityerr231:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok232:
  %t997 = call ptr @rt_alloc_words(i64 8)
  %t998 = getelementptr i64, ptr %t997, i64 0
  store i64 %a0, ptr %t998
  %t999 = getelementptr i64, ptr %t997, i64 1
  store i64 %a1, ptr %t999
  %t1000 = getelementptr i64, ptr %t997, i64 2
  store i64 %a2, ptr %t1000
  %t1001 = getelementptr i64, ptr %t997, i64 3
  store i64 %a3, ptr %t1001
  %t1002 = getelementptr i64, ptr %t997, i64 4
  store i64 %a4, ptr %t1002
  %t1003 = getelementptr i64, ptr %t997, i64 5
  store i64 %a5, ptr %t1003
  %t1004 = getelementptr i64, ptr %t997, i64 6
  store i64 %a6, ptr %t1004
  %t1005 = getelementptr i64, ptr %t997, i64 7
  store i64 %a7, ptr %t1005
  %t1006 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t997, ptr %overflow)
  %t1007 = call ptr @rt_alloc_words(i64 1)
  %t1008 = ptrtoint ptr %t1007 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_387" to i64), ptr %t1007
  %t1009 = or i64 %t1008, 4
  %t1010 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t1010)
  %t1011 = and i64 %t1010, -8
  %t1012 = inttoptr i64 %t1011 to ptr
  %t1013 = load i64, ptr %t1012
  %t1014 = inttoptr i64 %t1013 to ptr
  %t1015 = musttail call fastcc i64 %t1014(i64 %t1010, i64 3, i64 %t1009, i64 %a0, i64 %t1006, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1015
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmin"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1016 = call ptr @rt_alloc_words(i64 1)
  %t1017 = ptrtoint ptr %t1016 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_387" to i64), ptr %t1016
  %t1018 = or i64 %t1017, 4
  %t1019 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t1019)
  %t1020 = and i64 %t1019, -8
  %t1021 = inttoptr i64 %t1020 to ptr
  %t1022 = load i64, ptr %t1021
  %t1023 = inttoptr i64 %t1022 to ptr
  %t1024 = musttail call fastcc i64 %t1023(i64 %t1019, i64 3, i64 %t1018, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1024
}

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1029 = icmp eq i64 %argc, 1
  br i1 %t1029, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok234:
  %t1030 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t1030
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1035 = icmp eq i64 %argc, 1
  br i1 %t1035, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok236:
  %t1036 = call i64 @rt_exact_p(i64 %a0)
  %t1037 = icmp ne i64 %t1036, 1
  br i1 %t1037, label %then237, label %else238
then237:
  %t1038 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t1038
else238:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1043 = icmp eq i64 %argc, 1
  br i1 %t1043, label %argok240, label %arityerr239
arityerr239:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok240:
  %t1044 = call i64 @rt_number_p(i64 %a0)
  %t1045 = icmp ne i64 %t1044, 1
  br i1 %t1045, label %then241, label %else242
then241:
  %t1046 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t1046
else242:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1051 = icmp eq i64 %argc, 1
  br i1 %t1051, label %argok244, label %arityerr243
arityerr243:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok244:
  %t1052 = or i64 0, %a0
  %t1053 = and i64 %t1052, 7
  %t1054 = icmp eq i64 %t1053, 0
  br i1 %t1054, label %fixfast245, label %fixslow246
fixfast245:
  %t1055 = icmp slt i64 0, %a0
  %t1056 = select i1 %t1055, i64 257, i64 1
  br label %fixmerge247
fixslow246:
  %t1057 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge247
fixmerge247:
  %t1058 = phi i64 [ %t1056, %fixfast245 ], [ %t1057, %fixslow246 ]
  ret i64 %t1058
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1063 = icmp eq i64 %argc, 1
  br i1 %t1063, label %argok249, label %arityerr248
arityerr248:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok249:
  %t1064 = or i64 %a0, 0
  %t1065 = and i64 %t1064, 7
  %t1066 = icmp eq i64 %t1065, 0
  br i1 %t1066, label %fixfast250, label %fixslow251
fixfast250:
  %t1067 = icmp slt i64 %a0, 0
  %t1068 = select i1 %t1067, i64 257, i64 1
  br label %fixmerge252
fixslow251:
  %t1069 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge252
fixmerge252:
  %t1070 = phi i64 [ %t1068, %fixfast250 ], [ %t1069, %fixslow251 ]
  ret i64 %t1070
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1075 = icmp eq i64 %argc, 1
  br i1 %t1075, label %argok254, label %arityerr253
arityerr253:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok254:
  %t1076 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1077 = or i64 0, %t1076
  %t1078 = and i64 %t1077, 7
  %t1079 = icmp eq i64 %t1078, 0
  br i1 %t1079, label %fixfast255, label %fixslow256
fixfast255:
  %t1080 = icmp eq i64 0, %t1076
  %t1081 = select i1 %t1080, i64 257, i64 1
  br label %fixmerge257
fixslow256:
  %t1082 = call i64 @rt_num_eq(i64 0, i64 %t1076)
  br label %fixmerge257
fixmerge257:
  %t1083 = phi i64 [ %t1081, %fixfast255 ], [ %t1082, %fixslow256 ]
  ret i64 %t1083
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1088 = icmp eq i64 %argc, 1
  br i1 %t1088, label %argok259, label %arityerr258
arityerr258:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok259:
  %t1089 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1090 = or i64 0, %t1089
  %t1091 = and i64 %t1090, 7
  %t1092 = icmp eq i64 %t1091, 0
  br i1 %t1092, label %fixfast260, label %fixslow261
fixfast260:
  %t1093 = icmp eq i64 0, %t1089
  %t1094 = select i1 %t1093, i64 257, i64 1
  br label %fixmerge262
fixslow261:
  %t1095 = call i64 @rt_num_eq(i64 0, i64 %t1089)
  br label %fixmerge262
fixmerge262:
  %t1096 = phi i64 [ %t1094, %fixfast260 ], [ %t1095, %fixslow261 ]
  %t1097 = icmp ne i64 %t1096, 1
  br i1 %t1097, label %then263, label %else264
then263:
  ret i64 1
else264:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1102 = icmp eq i64 %argc, 1
  br i1 %t1102, label %argok266, label %arityerr265
arityerr265:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok266:
  %t1103 = or i64 %a0, 0
  %t1104 = and i64 %t1103, 7
  %t1105 = icmp eq i64 %t1104, 0
  br i1 %t1105, label %fixfast267, label %fixslow268
fixfast267:
  %t1106 = icmp slt i64 %a0, 0
  %t1107 = select i1 %t1106, i64 257, i64 1
  br label %fixmerge269
fixslow268:
  %t1108 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge269
fixmerge269:
  %t1109 = phi i64 [ %t1107, %fixfast267 ], [ %t1108, %fixslow268 ]
  %t1110 = icmp ne i64 %t1109, 1
  br i1 %t1110, label %then270, label %else271
then270:
  %t1111 = or i64 0, %a0
  %t1112 = and i64 %t1111, 7
  %t1113 = icmp eq i64 %t1112, 0
  br i1 %t1113, label %fixfast272, label %fixslow273
fixfast272:
  %t1114 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1115 = extractvalue {i64, i1} %t1114, 0
  %t1116 = extractvalue {i64, i1} %t1114, 1
  br i1 %t1116, label %fixslow273, label %fixmerge274
fixslow273:
  %t1117 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge274
fixmerge274:
  %t1118 = phi i64 [ %t1115, %fixfast272 ], [ %t1117, %fixslow273 ]
  ret i64 %t1118
else271:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1123 = icmp eq i64 %argc, 1
  br i1 %t1123, label %argok276, label %arityerr275
arityerr275:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok276:
  %t1124 = or i64 %a0, %a0
  %t1125 = and i64 %t1124, 7
  %t1126 = icmp eq i64 %t1125, 0
  br i1 %t1126, label %fixfast277, label %fixslow278
fixfast277:
  %t1127 = ashr i64 %a0, 3
  %t1128 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1127, i64 %a0)
  %t1129 = extractvalue {i64, i1} %t1128, 0
  %t1130 = extractvalue {i64, i1} %t1128, 1
  br i1 %t1130, label %fixslow278, label %fixmerge279
fixslow278:
  %t1131 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge279
fixmerge279:
  %t1132 = phi i64 [ %t1129, %fixfast277 ], [ %t1131, %fixslow278 ]
  ret i64 %t1132
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1137 = icmp eq i64 %argc, 2
  br i1 %t1137, label %argok281, label %arityerr280
arityerr280:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok281:
  %t1138 = or i64 %a1, 0
  %t1139 = and i64 %t1138, 7
  %t1140 = icmp eq i64 %t1139, 0
  br i1 %t1140, label %fixfast282, label %fixslow283
fixfast282:
  %t1141 = icmp eq i64 %a1, 0
  %t1142 = select i1 %t1141, i64 257, i64 1
  br label %fixmerge284
fixslow283:
  %t1143 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge284
fixmerge284:
  %t1144 = phi i64 [ %t1142, %fixfast282 ], [ %t1143, %fixslow283 ]
  %t1145 = icmp ne i64 %t1144, 1
  br i1 %t1145, label %then285, label %else286
then285:
  ret i64 %a0
else286:
  %t1146 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1147 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1147)
  %t1148 = and i64 %t1147, -8
  %t1149 = inttoptr i64 %t1148 to ptr
  %t1150 = load i64, ptr %t1149
  %t1151 = inttoptr i64 %t1150 to ptr
  %t1152 = musttail call fastcc i64 %t1151(i64 %t1147, i64 2, i64 %a1, i64 %t1146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1152
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1157 = icmp eq i64 %argc, 2
  br i1 %t1157, label %argok288, label %arityerr287
arityerr287:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok288:
  %t1158 = call i64 @rt_null_p(i64 %a0)
  %t1159 = icmp ne i64 %t1158, 1
  br i1 %t1159, label %then289, label %else290
then289:
  ret i64 %a1
else290:
  %t1160 = call i64 @rt_cdr(i64 %a0)
  %t1161 = call i64 @rt_car(i64 %a0)
  %t1162 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1162)
  %t1163 = and i64 %t1162, -8
  %t1164 = inttoptr i64 %t1163 to ptr
  %t1165 = load i64, ptr %t1164
  %t1166 = inttoptr i64 %t1165 to ptr
  %t1167 = call fastcc i64%t1166(i64 %t1162, i64 1, i64 %t1161, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1168 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1168)
  %t1169 = and i64 %t1168, -8
  %t1170 = inttoptr i64 %t1169 to ptr
  %t1171 = load i64, ptr %t1170
  %t1172 = inttoptr i64 %t1171 to ptr
  %t1173 = call fastcc i64%t1172(i64 %t1168, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1174 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1174)
  %t1175 = and i64 %t1174, -8
  %t1176 = inttoptr i64 %t1175 to ptr
  %t1177 = load i64, ptr %t1176
  %t1178 = inttoptr i64 %t1177 to ptr
  %t1179 = call fastcc i64%t1178(i64 %t1174, i64 2, i64 %t1167, i64 %t1173, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1180 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1180)
  %t1181 = and i64 %t1180, -8
  %t1182 = inttoptr i64 %t1181 to ptr
  %t1183 = load i64, ptr %t1182
  %t1184 = inttoptr i64 %t1183 to ptr
  %t1185 = musttail call fastcc i64 %t1184(i64 %t1180, i64 2, i64 %t1160, i64 %t1179, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1185
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1190 = icmp eq i64 %argc, 2
  br i1 %t1190, label %argok292, label %arityerr291
arityerr291:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok292:
  %t1191 = call i64 @rt_null_p(i64 %a0)
  %t1192 = icmp ne i64 %t1191, 1
  br i1 %t1192, label %then293, label %else294
then293:
  ret i64 %a1
else294:
  %t1193 = call i64 @rt_car(i64 %a0)
  %t1194 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1194)
  %t1195 = and i64 %t1194, -8
  %t1196 = inttoptr i64 %t1195 to ptr
  %t1197 = load i64, ptr %t1196
  %t1198 = inttoptr i64 %t1197 to ptr
  %t1199 = call fastcc i64%t1198(i64 %t1194, i64 1, i64 %t1193, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1200 = or i64 %t1199, 0
  %t1201 = and i64 %t1200, 7
  %t1202 = icmp eq i64 %t1201, 0
  br i1 %t1202, label %fixfast295, label %fixslow296
fixfast295:
  %t1203 = icmp eq i64 %t1199, 0
  %t1204 = select i1 %t1203, i64 257, i64 1
  br label %fixmerge297
fixslow296:
  %t1205 = call i64 @rt_num_eq(i64 %t1199, i64 0)
  br label %fixmerge297
fixmerge297:
  %t1206 = phi i64 [ %t1204, %fixfast295 ], [ %t1205, %fixslow296 ]
  %t1207 = icmp ne i64 %t1206, 1
  br i1 %t1207, label %then298, label %else299
then298:
  ret i64 0
else299:
  %t1208 = call i64 @rt_cdr(i64 %a0)
  %t1209 = or i64 %a1, %t1199
  %t1210 = and i64 %t1209, 7
  %t1211 = icmp eq i64 %t1210, 0
  br i1 %t1211, label %fixfast300, label %fixslow301
fixfast300:
  %t1212 = ashr i64 %a1, 3
  %t1213 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1212, i64 %t1199)
  %t1214 = extractvalue {i64, i1} %t1213, 0
  %t1215 = extractvalue {i64, i1} %t1213, 1
  br i1 %t1215, label %fixslow301, label %fixmerge302
fixslow301:
  %t1216 = call i64 @rt_mul(i64 %a1, i64 %t1199)
  br label %fixmerge302
fixmerge302:
  %t1217 = phi i64 [ %t1214, %fixfast300 ], [ %t1216, %fixslow301 ]
  %t1218 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1218)
  %t1219 = and i64 %t1218, -8
  %t1220 = inttoptr i64 %t1219 to ptr
  %t1221 = load i64, ptr %t1220
  %t1222 = inttoptr i64 %t1221 to ptr
  %t1223 = call fastcc i64%t1222(i64 %t1218, i64 2, i64 %a1, i64 %t1199, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1224 = call i64 @rt_quotient(i64 %t1217, i64 %t1223)
  %t1225 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1225)
  %t1226 = and i64 %t1225, -8
  %t1227 = inttoptr i64 %t1226 to ptr
  %t1228 = load i64, ptr %t1227
  %t1229 = inttoptr i64 %t1228 to ptr
  %t1230 = musttail call fastcc i64 %t1229(i64 %t1225, i64 2, i64 %t1208, i64 %t1224, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1230
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1235 = icmp sge i64 %argc, 0
  br i1 %t1235, label %argok304, label %arityerr303
arityerr303:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok304:
  %t1236 = call ptr @rt_alloc_words(i64 8)
  %t1237 = getelementptr i64, ptr %t1236, i64 0
  store i64 %a0, ptr %t1237
  %t1238 = getelementptr i64, ptr %t1236, i64 1
  store i64 %a1, ptr %t1238
  %t1239 = getelementptr i64, ptr %t1236, i64 2
  store i64 %a2, ptr %t1239
  %t1240 = getelementptr i64, ptr %t1236, i64 3
  store i64 %a3, ptr %t1240
  %t1241 = getelementptr i64, ptr %t1236, i64 4
  store i64 %a4, ptr %t1241
  %t1242 = getelementptr i64, ptr %t1236, i64 5
  store i64 %a5, ptr %t1242
  %t1243 = getelementptr i64, ptr %t1236, i64 6
  store i64 %a6, ptr %t1243
  %t1244 = getelementptr i64, ptr %t1236, i64 7
  store i64 %a7, ptr %t1244
  %t1245 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1236, ptr %overflow)
  %t1246 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1246)
  %t1247 = and i64 %t1246, -8
  %t1248 = inttoptr i64 %t1247 to ptr
  %t1249 = load i64, ptr %t1248
  %t1250 = inttoptr i64 %t1249 to ptr
  %t1251 = musttail call fastcc i64 %t1250(i64 %t1246, i64 2, i64 %t1245, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1251
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cgcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1252 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1252)
  %t1253 = and i64 %t1252, -8
  %t1254 = inttoptr i64 %t1253 to ptr
  %t1255 = load i64, ptr %t1254
  %t1256 = inttoptr i64 %t1255 to ptr
  %t1257 = musttail call fastcc i64 %t1256(i64 %t1252, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1257
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1262 = icmp sge i64 %argc, 0
  br i1 %t1262, label %argok306, label %arityerr305
arityerr305:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok306:
  %t1263 = call ptr @rt_alloc_words(i64 8)
  %t1264 = getelementptr i64, ptr %t1263, i64 0
  store i64 %a0, ptr %t1264
  %t1265 = getelementptr i64, ptr %t1263, i64 1
  store i64 %a1, ptr %t1265
  %t1266 = getelementptr i64, ptr %t1263, i64 2
  store i64 %a2, ptr %t1266
  %t1267 = getelementptr i64, ptr %t1263, i64 3
  store i64 %a3, ptr %t1267
  %t1268 = getelementptr i64, ptr %t1263, i64 4
  store i64 %a4, ptr %t1268
  %t1269 = getelementptr i64, ptr %t1263, i64 5
  store i64 %a5, ptr %t1269
  %t1270 = getelementptr i64, ptr %t1263, i64 6
  store i64 %a6, ptr %t1270
  %t1271 = getelementptr i64, ptr %t1263, i64 7
  store i64 %a7, ptr %t1271
  %t1272 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1263, ptr %overflow)
  %t1273 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1273)
  %t1274 = and i64 %t1273, -8
  %t1275 = inttoptr i64 %t1274 to ptr
  %t1276 = load i64, ptr %t1275
  %t1277 = inttoptr i64 %t1276 to ptr
  %t1278 = musttail call fastcc i64 %t1277(i64 %t1273, i64 2, i64 %t1272, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1278
}

define fastcc i64 @"min-entry:$scheme.base$ccode$clcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1279 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1279)
  %t1280 = and i64 %t1279, -8
  %t1281 = inttoptr i64 %t1280 to ptr
  %t1282 = load i64, ptr %t1281
  %t1283 = inttoptr i64 %t1282 to ptr
  %t1284 = musttail call fastcc i64 %t1283(i64 %t1279, i64 2, i64 2, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1284
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1289 = icmp eq i64 %argc, 3
  br i1 %t1289, label %argok308, label %arityerr307
arityerr307:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok308:
  %t1290 = or i64 %a1, 0
  %t1291 = and i64 %t1290, 7
  %t1292 = icmp eq i64 %t1291, 0
  br i1 %t1292, label %fixfast309, label %fixslow310
fixfast309:
  %t1293 = icmp eq i64 %a1, 0
  %t1294 = select i1 %t1293, i64 257, i64 1
  br label %fixmerge311
fixslow310:
  %t1295 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge311
fixmerge311:
  %t1296 = phi i64 [ %t1294, %fixfast309 ], [ %t1295, %fixslow310 ]
  %t1297 = icmp ne i64 %t1296, 1
  br i1 %t1297, label %then312, label %else313
then312:
  ret i64 %a2
else313:
  %t1298 = or i64 %a0, %a0
  %t1299 = and i64 %t1298, 7
  %t1300 = icmp eq i64 %t1299, 0
  br i1 %t1300, label %fixfast314, label %fixslow315
fixfast314:
  %t1301 = ashr i64 %a0, 3
  %t1302 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1301, i64 %a0)
  %t1303 = extractvalue {i64, i1} %t1302, 0
  %t1304 = extractvalue {i64, i1} %t1302, 1
  br i1 %t1304, label %fixslow315, label %fixmerge316
fixslow315:
  %t1305 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge316
fixmerge316:
  %t1306 = phi i64 [ %t1303, %fixfast314 ], [ %t1305, %fixslow315 ]
  %t1307 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1308 = load i64, ptr @"scheme.base:odd?"
  call void @rt_check_callable(i64 %t1308)
  %t1309 = and i64 %t1308, -8
  %t1310 = inttoptr i64 %t1309 to ptr
  %t1311 = load i64, ptr %t1310
  %t1312 = inttoptr i64 %t1311 to ptr
  %t1313 = call fastcc i64%t1312(i64 %t1308, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1314 = icmp ne i64 %t1313, 1
  br i1 %t1314, label %then317, label %else318
then317:
  %t1315 = or i64 %a2, %a0
  %t1316 = and i64 %t1315, 7
  %t1317 = icmp eq i64 %t1316, 0
  br i1 %t1317, label %fixfast320, label %fixslow321
fixfast320:
  %t1318 = ashr i64 %a2, 3
  %t1319 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1318, i64 %a0)
  %t1320 = extractvalue {i64, i1} %t1319, 0
  %t1321 = extractvalue {i64, i1} %t1319, 1
  br i1 %t1321, label %fixslow321, label %fixmerge322
fixslow321:
  %t1322 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge322
fixmerge322:
  %t1323 = phi i64 [ %t1320, %fixfast320 ], [ %t1322, %fixslow321 ]
  br label %merge319
else318:
  br label %merge319
merge319:
  %t1324 = phi i64 [ %t1323, %fixmerge322 ], [ %a2, %else318 ]
  %t1325 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1325)
  %t1326 = and i64 %t1325, -8
  %t1327 = inttoptr i64 %t1326 to ptr
  %t1328 = load i64, ptr %t1327
  %t1329 = inttoptr i64 %t1328 to ptr
  %t1330 = musttail call fastcc i64 %t1329(i64 %t1325, i64 3, i64 %t1306, i64 %t1307, i64 %t1324, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1330
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1335 = icmp eq i64 %argc, 2
  br i1 %t1335, label %argok324, label %arityerr323
arityerr323:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok324:
  %t1336 = call i64 @rt_exact_p(i64 %a1)
  %t1337 = icmp ne i64 %t1336, 1
  br i1 %t1337, label %then325, label %else326
then325:
  %t1338 = or i64 %a1, 0
  %t1339 = and i64 %t1338, 7
  %t1340 = icmp eq i64 %t1339, 0
  br i1 %t1340, label %fixfast327, label %fixslow328
fixfast327:
  %t1341 = icmp slt i64 %a1, 0
  %t1342 = select i1 %t1341, i64 257, i64 1
  br label %fixmerge329
fixslow328:
  %t1343 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge329
fixmerge329:
  %t1344 = phi i64 [ %t1342, %fixfast327 ], [ %t1343, %fixslow328 ]
  %t1345 = icmp ne i64 %t1344, 1
  br i1 %t1345, label %then330, label %else331
then330:
  %t1346 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1346
else331:
  %t1347 = call i64 @rt_exact_p(i64 %a0)
  %t1348 = icmp ne i64 %t1347, 1
  br i1 %t1348, label %then332, label %else333
then332:
  %t1349 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1349)
  %t1350 = and i64 %t1349, -8
  %t1351 = inttoptr i64 %t1350 to ptr
  %t1352 = load i64, ptr %t1351
  %t1353 = inttoptr i64 %t1352 to ptr
  %t1354 = musttail call fastcc i64 %t1353(i64 %t1349, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1354
else333:
  %t1355 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1356 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1356)
  %t1357 = and i64 %t1356, -8
  %t1358 = inttoptr i64 %t1357 to ptr
  %t1359 = load i64, ptr %t1358
  %t1360 = inttoptr i64 %t1359 to ptr
  %t1361 = musttail call fastcc i64 %t1360(i64 %t1356, i64 3, i64 %a0, i64 %a1, i64 %t1355, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1361
else326:
  %t1362 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1362
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1367 = icmp eq i64 %argc, 2
  br i1 %t1367, label %argok335, label %arityerr334
arityerr334:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok335:
  %t1368 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1369 = or i64 %a1, %t1368
  %t1370 = and i64 %t1369, 7
  %t1371 = icmp eq i64 %t1370, 0
  br i1 %t1371, label %fixfast336, label %fixslow337
fixfast336:
  %t1372 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1368)
  %t1373 = extractvalue {i64, i1} %t1372, 0
  %t1374 = extractvalue {i64, i1} %t1372, 1
  br i1 %t1374, label %fixslow337, label %fixmerge338
fixslow337:
  %t1375 = call i64 @rt_add(i64 %a1, i64 %t1368)
  br label %fixmerge338
fixmerge338:
  %t1376 = phi i64 [ %t1373, %fixfast336 ], [ %t1375, %fixslow337 ]
  %t1377 = call i64 @rt_quotient(i64 %t1376, i64 16)
  %t1378 = or i64 %t1377, %a1
  %t1379 = and i64 %t1378, 7
  %t1380 = icmp eq i64 %t1379, 0
  br i1 %t1380, label %fixfast339, label %fixslow340
fixfast339:
  %t1381 = icmp slt i64 %t1377, %a1
  %t1382 = select i1 %t1381, i64 257, i64 1
  br label %fixmerge341
fixslow340:
  %t1383 = call i64 @rt_lt(i64 %t1377, i64 %a1)
  br label %fixmerge341
fixmerge341:
  %t1384 = phi i64 [ %t1382, %fixfast339 ], [ %t1383, %fixslow340 ]
  %t1385 = icmp ne i64 %t1384, 1
  br i1 %t1385, label %then342, label %else343
then342:
  %t1386 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1386)
  %t1387 = and i64 %t1386, -8
  %t1388 = inttoptr i64 %t1387 to ptr
  %t1389 = load i64, ptr %t1388
  %t1390 = inttoptr i64 %t1389 to ptr
  %t1391 = musttail call fastcc i64 %t1390(i64 %t1386, i64 2, i64 %a0, i64 %t1377, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1391
else343:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1396 = icmp eq i64 %argc, 1
  br i1 %t1396, label %argok345, label %arityerr344
arityerr344:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok345:
  %t1397 = or i64 %a0, 0
  %t1398 = and i64 %t1397, 7
  %t1399 = icmp eq i64 %t1398, 0
  br i1 %t1399, label %fixfast346, label %fixslow347
fixfast346:
  %t1400 = icmp eq i64 %a0, 0
  %t1401 = select i1 %t1400, i64 257, i64 1
  br label %fixmerge348
fixslow347:
  %t1402 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge348
fixmerge348:
  %t1403 = phi i64 [ %t1401, %fixfast346 ], [ %t1402, %fixslow347 ]
  %t1404 = icmp ne i64 %t1403, 1
  br i1 %t1404, label %then349, label %else350
then349:
  ret i64 0
else350:
  %t1405 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1405)
  %t1406 = and i64 %t1405, -8
  %t1407 = inttoptr i64 %t1406 to ptr
  %t1408 = load i64, ptr %t1407
  %t1409 = inttoptr i64 %t1408 to ptr
  %t1410 = musttail call fastcc i64 %t1409(i64 %t1405, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1410
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1415 = icmp eq i64 %argc, 1
  br i1 %t1415, label %argok352, label %arityerr351
arityerr351:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok352:
  %t1416 = load i64, ptr @"scheme.base:%isqrt"
  call void @rt_check_callable(i64 %t1416)
  %t1417 = and i64 %t1416, -8
  %t1418 = inttoptr i64 %t1417 to ptr
  %t1419 = load i64, ptr %t1418
  %t1420 = inttoptr i64 %t1419 to ptr
  %t1421 = call fastcc i64%t1420(i64 %t1416, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1422 = or i64 %t1421, %t1421
  %t1423 = and i64 %t1422, 7
  %t1424 = icmp eq i64 %t1423, 0
  br i1 %t1424, label %fixfast353, label %fixslow354
fixfast353:
  %t1425 = ashr i64 %t1421, 3
  %t1426 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1425, i64 %t1421)
  %t1427 = extractvalue {i64, i1} %t1426, 0
  %t1428 = extractvalue {i64, i1} %t1426, 1
  br i1 %t1428, label %fixslow354, label %fixmerge355
fixslow354:
  %t1429 = call i64 @rt_mul(i64 %t1421, i64 %t1421)
  br label %fixmerge355
fixmerge355:
  %t1430 = phi i64 [ %t1427, %fixfast353 ], [ %t1429, %fixslow354 ]
  %t1431 = or i64 %a0, %t1430
  %t1432 = and i64 %t1431, 7
  %t1433 = icmp eq i64 %t1432, 0
  br i1 %t1433, label %fixfast356, label %fixslow357
fixfast356:
  %t1434 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1430)
  %t1435 = extractvalue {i64, i1} %t1434, 0
  %t1436 = extractvalue {i64, i1} %t1434, 1
  br i1 %t1436, label %fixslow357, label %fixmerge358
fixslow357:
  %t1437 = call i64 @rt_sub(i64 %a0, i64 %t1430)
  br label %fixmerge358
fixmerge358:
  %t1438 = phi i64 [ %t1435, %fixfast356 ], [ %t1437, %fixslow357 ]
  %t1439 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1439)
  %t1440 = and i64 %t1439, -8
  %t1441 = inttoptr i64 %t1440 to ptr
  %t1442 = load i64, ptr %t1441
  %t1443 = inttoptr i64 %t1442 to ptr
  %t1444 = musttail call fastcc i64 %t1443(i64 %t1439, i64 2, i64 %t1421, i64 %t1438, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1444
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1449 = icmp eq i64 %argc, 1
  br i1 %t1449, label %argok360, label %arityerr359
arityerr359:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok360:
  %t1450 = call i64 @rt_exact_p(i64 %a0)
  %t1451 = icmp ne i64 %t1450, 1
  br i1 %t1451, label %then361, label %else362
then361:
  ret i64 %a0
else362:
  %t1452 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1452
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1457 = icmp eq i64 %argc, 1
  br i1 %t1457, label %argok364, label %arityerr363
arityerr363:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok364:
  %t1458 = call i64 @rt_exact_p(i64 %a0)
  %t1459 = icmp ne i64 %t1458, 1
  br i1 %t1459, label %then365, label %else366
then365:
  ret i64 %a0
else366:
  %t1460 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1460
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1465 = icmp eq i64 %argc, 1
  br i1 %t1465, label %argok368, label %arityerr367
arityerr367:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok368:
  %t1466 = call i64 @rt_exact_p(i64 %a0)
  %t1467 = icmp ne i64 %t1466, 1
  br i1 %t1467, label %then369, label %else370
then369:
  ret i64 %a0
else370:
  %t1468 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1468
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1473 = icmp eq i64 %argc, 1
  br i1 %t1473, label %argok372, label %arityerr371
arityerr371:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok372:
  %t1474 = call i64 @rt_exact_p(i64 %a0)
  %t1475 = icmp ne i64 %t1474, 1
  br i1 %t1475, label %then373, label %else374
then373:
  ret i64 %a0
else374:
  %t1476 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1476
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1481 = icmp eq i64 %argc, 2
  br i1 %t1481, label %argok376, label %arityerr375
arityerr375:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok376:
  %t1482 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1482
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1487 = icmp eq i64 %argc, 2
  br i1 %t1487, label %argok378, label %arityerr377
arityerr377:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok378:
  %t1488 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1488
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1493 = icmp eq i64 %argc, 2
  br i1 %t1493, label %argok380, label %arityerr379
arityerr379:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok380:
  %t1494 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1494
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1499 = icmp eq i64 %argc, 2
  br i1 %t1499, label %argok382, label %arityerr381
arityerr381:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok382:
  %t1500 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1501 = or i64 %a0, %t1500
  %t1502 = and i64 %t1501, 7
  %t1503 = icmp eq i64 %t1502, 0
  br i1 %t1503, label %fixfast383, label %fixslow384
fixfast383:
  %t1504 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1500)
  %t1505 = extractvalue {i64, i1} %t1504, 0
  %t1506 = extractvalue {i64, i1} %t1504, 1
  br i1 %t1506, label %fixslow384, label %fixmerge385
fixslow384:
  %t1507 = call i64 @rt_sub(i64 %a0, i64 %t1500)
  br label %fixmerge385
fixmerge385:
  %t1508 = phi i64 [ %t1505, %fixfast383 ], [ %t1507, %fixslow384 ]
  %t1509 = call i64 @rt_quotient(i64 %t1508, i64 %a1)
  ret i64 %t1509
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1514 = icmp eq i64 %argc, 2
  br i1 %t1514, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok387:
  %t1515 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1516 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1517 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1517)
  %t1518 = and i64 %t1517, -8
  %t1519 = inttoptr i64 %t1518 to ptr
  %t1520 = load i64, ptr %t1519
  %t1521 = inttoptr i64 %t1520 to ptr
  %t1522 = musttail call fastcc i64 %t1521(i64 %t1517, i64 2, i64 %t1515, i64 %t1516, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1522
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1527 = icmp eq i64 %argc, 2
  br i1 %t1527, label %argok389, label %arityerr388
arityerr388:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok389:
  %t1528 = load i64, ptr @"scheme.base:floor-quotient"
  call void @rt_check_callable(i64 %t1528)
  %t1529 = and i64 %t1528, -8
  %t1530 = inttoptr i64 %t1529 to ptr
  %t1531 = load i64, ptr %t1530
  %t1532 = inttoptr i64 %t1531 to ptr
  %t1533 = call fastcc i64%t1532(i64 %t1528, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1534 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1535 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1535)
  %t1536 = and i64 %t1535, -8
  %t1537 = inttoptr i64 %t1536 to ptr
  %t1538 = load i64, ptr %t1537
  %t1539 = inttoptr i64 %t1538 to ptr
  %t1540 = musttail call fastcc i64 %t1539(i64 %t1535, i64 2, i64 %t1533, i64 %t1534, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1540
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1545 = icmp eq i64 %argc, 1
  br i1 %t1545, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok391:
  %t1546 = call i64 @rt_integer_p(i64 %a0)
  %t1547 = icmp ne i64 %t1546, 1
  br i1 %t1547, label %then392, label %else393
then392:
  ret i64 %a0
else393:
  %t1548 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1549 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1549)
  %t1550 = and i64 %t1549, -8
  %t1551 = inttoptr i64 %t1550 to ptr
  %t1552 = load i64, ptr %t1551
  %t1553 = inttoptr i64 %t1552 to ptr
  %t1554 = musttail call fastcc i64 %t1553(i64 %t1549, i64 2, i64 %t1548, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1554
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1559 = icmp eq i64 %argc, 1
  br i1 %t1559, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok395:
  %t1560 = call i64 @rt_integer_p(i64 %a0)
  %t1561 = icmp ne i64 %t1560, 1
  br i1 %t1561, label %then396, label %else397
then396:
  %t1562 = call i64 @rt_exact_p(i64 %a0)
  %t1563 = icmp ne i64 %t1562, 1
  br i1 %t1563, label %then398, label %else399
then398:
  ret i64 8
else399:
  %t1564 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1564
else397:
  %t1565 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1566 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1566)
  %t1567 = and i64 %t1566, -8
  %t1568 = inttoptr i64 %t1567 to ptr
  %t1569 = load i64, ptr %t1568
  %t1570 = inttoptr i64 %t1569 to ptr
  %t1571 = musttail call fastcc i64 %t1570(i64 %t1566, i64 2, i64 %t1565, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1571
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1576 = icmp eq i64 %argc, 1
  br i1 %t1576, label %argok401, label %arityerr400
arityerr400:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok401:
  %t1577 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1577
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1582 = icmp eq i64 %argc, 1
  br i1 %t1582, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok403:
  %t1583 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1583
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1588 = icmp eq i64 %argc, 0
  br i1 %t1588, label %argok405, label %arityerr404
arityerr404:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok405:
  %t1589 = icmp ne i64 1, 1
  br i1 %t1589, label %then406, label %else407
then406:
  ret i64 1
else407:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1594 = icmp sge i64 %argc, 0
  br i1 %t1594, label %argok409, label %arityerr408
arityerr408:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok409:
  %t1595 = call ptr @rt_alloc_words(i64 8)
  %t1596 = getelementptr i64, ptr %t1595, i64 0
  store i64 %a0, ptr %t1596
  %t1597 = getelementptr i64, ptr %t1595, i64 1
  store i64 %a1, ptr %t1597
  %t1598 = getelementptr i64, ptr %t1595, i64 2
  store i64 %a2, ptr %t1598
  %t1599 = getelementptr i64, ptr %t1595, i64 3
  store i64 %a3, ptr %t1599
  %t1600 = getelementptr i64, ptr %t1595, i64 4
  store i64 %a4, ptr %t1600
  %t1601 = getelementptr i64, ptr %t1595, i64 5
  store i64 %a5, ptr %t1601
  %t1602 = getelementptr i64, ptr %t1595, i64 6
  store i64 %a6, ptr %t1602
  %t1603 = getelementptr i64, ptr %t1595, i64 7
  store i64 %a7, ptr %t1603
  %t1604 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1595, ptr %overflow)
  %t1605 = call i64 @rt_list_to_string(i64 %t1604)
  ret i64 %t1605
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1606 = call i64 @rt_list_to_string(i64 2)
  ret i64 %t1606
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1611 = icmp eq i64 %argc, 1
  br i1 %t1611, label %argok411, label %arityerr410
arityerr410:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok411:
  %t1612 = call i64 @rt_null_p(i64 %a0)
  %t1613 = icmp ne i64 %t1612, 1
  br i1 %t1613, label %then412, label %else413
then412:
  %t1614 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1614
else413:
  %t1615 = call i64 @rt_car(i64 %a0)
  %t1616 = call i64 @rt_cdr(i64 %a0)
  %t1617 = load i64, ptr @"scheme.base:%str-concat"
  call void @rt_check_callable(i64 %t1617)
  %t1618 = and i64 %t1617, -8
  %t1619 = inttoptr i64 %t1618 to ptr
  %t1620 = load i64, ptr %t1619
  %t1621 = inttoptr i64 %t1620 to ptr
  %t1622 = call fastcc i64%t1621(i64 %t1617, i64 1, i64 %t1616, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1623 = call i64 @rt_string_append(i64 %t1615, i64 %t1622)
  ret i64 %t1623
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1628 = icmp eq i64 %argc, 4
  br i1 %t1628, label %argok415, label %arityerr414
arityerr414:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok415:
  %t1629 = call i64 @rt_char_to_integer(i64 %a1)
  %t1630 = call i64 @rt_char_to_integer(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t1631 = and i64 %a0, -8
  %t1632 = inttoptr i64 %t1631 to ptr
  %t1633 = load i64, ptr %t1632
  %t1634 = inttoptr i64 %t1633 to ptr
  %t1635 = call fastcc i64%t1634(i64 %a0, i64 2, i64 %t1629, i64 %t1630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1636 = icmp ne i64 %t1635, 1
  br i1 %t1636, label %then416, label %else417
then416:
  %t1637 = call i64 @rt_null_p(i64 %a3)
  %t1638 = icmp ne i64 %t1637, 1
  br i1 %t1638, label %then418, label %else419
then418:
  ret i64 257
else419:
  %t1639 = call i64 @rt_car(i64 %a3)
  %t1640 = call i64 @rt_cdr(i64 %a3)
  %t1641 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1641)
  %t1642 = and i64 %t1641, -8
  %t1643 = inttoptr i64 %t1642 to ptr
  %t1644 = load i64, ptr %t1643
  %t1645 = inttoptr i64 %t1644 to ptr
  %t1646 = musttail call fastcc i64 %t1645(i64 %t1641, i64 4, i64 %a0, i64 %a2, i64 %t1639, i64 %t1640, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1646
else417:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_511"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1651 = icmp eq i64 %argc, 2
  br i1 %t1651, label %argok421, label %arityerr420
arityerr420:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok421:
  %t1652 = or i64 %a0, %a1
  %t1653 = and i64 %t1652, 7
  %t1654 = icmp eq i64 %t1653, 0
  br i1 %t1654, label %fixfast422, label %fixslow423
fixfast422:
  %t1655 = icmp eq i64 %a0, %a1
  %t1656 = select i1 %t1655, i64 257, i64 1
  br label %fixmerge424
fixslow423:
  %t1657 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge424
fixmerge424:
  %t1658 = phi i64 [ %t1656, %fixfast422 ], [ %t1657, %fixslow423 ]
  ret i64 %t1658
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1659 = icmp sge i64 %argc, 2
  br i1 %t1659, label %argok426, label %arityerr425
arityerr425:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok426:
  %t1660 = call ptr @rt_alloc_words(i64 8)
  %t1661 = getelementptr i64, ptr %t1660, i64 0
  store i64 %a0, ptr %t1661
  %t1662 = getelementptr i64, ptr %t1660, i64 1
  store i64 %a1, ptr %t1662
  %t1663 = getelementptr i64, ptr %t1660, i64 2
  store i64 %a2, ptr %t1663
  %t1664 = getelementptr i64, ptr %t1660, i64 3
  store i64 %a3, ptr %t1664
  %t1665 = getelementptr i64, ptr %t1660, i64 4
  store i64 %a4, ptr %t1665
  %t1666 = getelementptr i64, ptr %t1660, i64 5
  store i64 %a5, ptr %t1666
  %t1667 = getelementptr i64, ptr %t1660, i64 6
  store i64 %a6, ptr %t1667
  %t1668 = getelementptr i64, ptr %t1660, i64 7
  store i64 %a7, ptr %t1668
  %t1669 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1660, ptr %overflow)
  %t1670 = call ptr @rt_alloc_words(i64 1)
  %t1671 = ptrtoint ptr %t1670 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_511" to i64), ptr %t1670
  %t1672 = or i64 %t1671, 4
  %t1673 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1673)
  %t1674 = and i64 %t1673, -8
  %t1675 = inttoptr i64 %t1674 to ptr
  %t1676 = load i64, ptr %t1675
  %t1677 = inttoptr i64 %t1676 to ptr
  %t1678 = musttail call fastcc i64 %t1677(i64 %t1673, i64 4, i64 %t1672, i64 %a0, i64 %a1, i64 %t1669, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1678
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1679 = call ptr @rt_alloc_words(i64 1)
  %t1680 = ptrtoint ptr %t1679 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_511" to i64), ptr %t1679
  %t1681 = or i64 %t1680, 4
  %t1682 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1682)
  %t1683 = and i64 %t1682, -8
  %t1684 = inttoptr i64 %t1683 to ptr
  %t1685 = load i64, ptr %t1684
  %t1686 = inttoptr i64 %t1685 to ptr
  %t1687 = musttail call fastcc i64 %t1686(i64 %t1682, i64 4, i64 %t1681, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1687
}

define fastcc i64 @"scheme.base:code_521"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1692 = icmp eq i64 %argc, 2
  br i1 %t1692, label %argok428, label %arityerr427
arityerr427:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok428:
  %t1693 = or i64 %a0, %a1
  %t1694 = and i64 %t1693, 7
  %t1695 = icmp eq i64 %t1694, 0
  br i1 %t1695, label %fixfast429, label %fixslow430
fixfast429:
  %t1696 = icmp slt i64 %a0, %a1
  %t1697 = select i1 %t1696, i64 257, i64 1
  br label %fixmerge431
fixslow430:
  %t1698 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge431
fixmerge431:
  %t1699 = phi i64 [ %t1697, %fixfast429 ], [ %t1698, %fixslow430 ]
  ret i64 %t1699
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1700 = icmp sge i64 %argc, 2
  br i1 %t1700, label %argok433, label %arityerr432
arityerr432:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok433:
  %t1701 = call ptr @rt_alloc_words(i64 8)
  %t1702 = getelementptr i64, ptr %t1701, i64 0
  store i64 %a0, ptr %t1702
  %t1703 = getelementptr i64, ptr %t1701, i64 1
  store i64 %a1, ptr %t1703
  %t1704 = getelementptr i64, ptr %t1701, i64 2
  store i64 %a2, ptr %t1704
  %t1705 = getelementptr i64, ptr %t1701, i64 3
  store i64 %a3, ptr %t1705
  %t1706 = getelementptr i64, ptr %t1701, i64 4
  store i64 %a4, ptr %t1706
  %t1707 = getelementptr i64, ptr %t1701, i64 5
  store i64 %a5, ptr %t1707
  %t1708 = getelementptr i64, ptr %t1701, i64 6
  store i64 %a6, ptr %t1708
  %t1709 = getelementptr i64, ptr %t1701, i64 7
  store i64 %a7, ptr %t1709
  %t1710 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1701, ptr %overflow)
  %t1711 = call ptr @rt_alloc_words(i64 1)
  %t1712 = ptrtoint ptr %t1711 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_521" to i64), ptr %t1711
  %t1713 = or i64 %t1712, 4
  %t1714 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1714)
  %t1715 = and i64 %t1714, -8
  %t1716 = inttoptr i64 %t1715 to ptr
  %t1717 = load i64, ptr %t1716
  %t1718 = inttoptr i64 %t1717 to ptr
  %t1719 = musttail call fastcc i64 %t1718(i64 %t1714, i64 4, i64 %t1713, i64 %a0, i64 %a1, i64 %t1710, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1719
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1720 = call ptr @rt_alloc_words(i64 1)
  %t1721 = ptrtoint ptr %t1720 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_521" to i64), ptr %t1720
  %t1722 = or i64 %t1721, 4
  %t1723 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1723)
  %t1724 = and i64 %t1723, -8
  %t1725 = inttoptr i64 %t1724 to ptr
  %t1726 = load i64, ptr %t1725
  %t1727 = inttoptr i64 %t1726 to ptr
  %t1728 = musttail call fastcc i64 %t1727(i64 %t1723, i64 4, i64 %t1722, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1728
}

define fastcc i64 @"scheme.base:code_531"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1733 = icmp eq i64 %argc, 2
  br i1 %t1733, label %argok435, label %arityerr434
arityerr434:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok435:
  %t1734 = or i64 %a1, %a0
  %t1735 = and i64 %t1734, 7
  %t1736 = icmp eq i64 %t1735, 0
  br i1 %t1736, label %fixfast436, label %fixslow437
fixfast436:
  %t1737 = icmp slt i64 %a1, %a0
  %t1738 = select i1 %t1737, i64 257, i64 1
  br label %fixmerge438
fixslow437:
  %t1739 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge438
fixmerge438:
  %t1740 = phi i64 [ %t1738, %fixfast436 ], [ %t1739, %fixslow437 ]
  ret i64 %t1740
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1741 = icmp sge i64 %argc, 2
  br i1 %t1741, label %argok440, label %arityerr439
arityerr439:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok440:
  %t1742 = call ptr @rt_alloc_words(i64 8)
  %t1743 = getelementptr i64, ptr %t1742, i64 0
  store i64 %a0, ptr %t1743
  %t1744 = getelementptr i64, ptr %t1742, i64 1
  store i64 %a1, ptr %t1744
  %t1745 = getelementptr i64, ptr %t1742, i64 2
  store i64 %a2, ptr %t1745
  %t1746 = getelementptr i64, ptr %t1742, i64 3
  store i64 %a3, ptr %t1746
  %t1747 = getelementptr i64, ptr %t1742, i64 4
  store i64 %a4, ptr %t1747
  %t1748 = getelementptr i64, ptr %t1742, i64 5
  store i64 %a5, ptr %t1748
  %t1749 = getelementptr i64, ptr %t1742, i64 6
  store i64 %a6, ptr %t1749
  %t1750 = getelementptr i64, ptr %t1742, i64 7
  store i64 %a7, ptr %t1750
  %t1751 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1742, ptr %overflow)
  %t1752 = call ptr @rt_alloc_words(i64 1)
  %t1753 = ptrtoint ptr %t1752 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_531" to i64), ptr %t1752
  %t1754 = or i64 %t1753, 4
  %t1755 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1755)
  %t1756 = and i64 %t1755, -8
  %t1757 = inttoptr i64 %t1756 to ptr
  %t1758 = load i64, ptr %t1757
  %t1759 = inttoptr i64 %t1758 to ptr
  %t1760 = musttail call fastcc i64 %t1759(i64 %t1755, i64 4, i64 %t1754, i64 %a0, i64 %a1, i64 %t1751, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1760
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1761 = call ptr @rt_alloc_words(i64 1)
  %t1762 = ptrtoint ptr %t1761 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_531" to i64), ptr %t1761
  %t1763 = or i64 %t1762, 4
  %t1764 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1764)
  %t1765 = and i64 %t1764, -8
  %t1766 = inttoptr i64 %t1765 to ptr
  %t1767 = load i64, ptr %t1766
  %t1768 = inttoptr i64 %t1767 to ptr
  %t1769 = musttail call fastcc i64 %t1768(i64 %t1764, i64 4, i64 %t1763, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1769
}

define fastcc i64 @"scheme.base:code_541"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1774 = icmp eq i64 %argc, 2
  br i1 %t1774, label %argok442, label %arityerr441
arityerr441:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok442:
  %t1775 = or i64 %a0, %a1
  %t1776 = and i64 %t1775, 7
  %t1777 = icmp eq i64 %t1776, 0
  br i1 %t1777, label %fixfast443, label %fixslow444
fixfast443:
  %t1778 = icmp slt i64 %a0, %a1
  %t1779 = select i1 %t1778, i64 257, i64 1
  br label %fixmerge445
fixslow444:
  %t1780 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge445
fixmerge445:
  %t1781 = phi i64 [ %t1779, %fixfast443 ], [ %t1780, %fixslow444 ]
  %t1782 = icmp ne i64 %t1781, 1
  br i1 %t1782, label %then446, label %else447
then446:
  ret i64 257
else447:
  %t1783 = or i64 %a0, %a1
  %t1784 = and i64 %t1783, 7
  %t1785 = icmp eq i64 %t1784, 0
  br i1 %t1785, label %fixfast448, label %fixslow449
fixfast448:
  %t1786 = icmp eq i64 %a0, %a1
  %t1787 = select i1 %t1786, i64 257, i64 1
  br label %fixmerge450
fixslow449:
  %t1788 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge450
fixmerge450:
  %t1789 = phi i64 [ %t1787, %fixfast448 ], [ %t1788, %fixslow449 ]
  ret i64 %t1789
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1790 = icmp sge i64 %argc, 2
  br i1 %t1790, label %argok452, label %arityerr451
arityerr451:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok452:
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
  store i64 ptrtoint (ptr @"scheme.base:code_541" to i64), ptr %t1801
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

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1810 = call ptr @rt_alloc_words(i64 1)
  %t1811 = ptrtoint ptr %t1810 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_541" to i64), ptr %t1810
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

define fastcc i64 @"scheme.base:code_551"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1823 = icmp eq i64 %argc, 2
  br i1 %t1823, label %argok454, label %arityerr453
arityerr453:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok454:
  %t1824 = or i64 %a1, %a0
  %t1825 = and i64 %t1824, 7
  %t1826 = icmp eq i64 %t1825, 0
  br i1 %t1826, label %fixfast455, label %fixslow456
fixfast455:
  %t1827 = icmp slt i64 %a1, %a0
  %t1828 = select i1 %t1827, i64 257, i64 1
  br label %fixmerge457
fixslow456:
  %t1829 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge457
fixmerge457:
  %t1830 = phi i64 [ %t1828, %fixfast455 ], [ %t1829, %fixslow456 ]
  %t1831 = icmp ne i64 %t1830, 1
  br i1 %t1831, label %then458, label %else459
then458:
  ret i64 257
else459:
  %t1832 = or i64 %a0, %a1
  %t1833 = and i64 %t1832, 7
  %t1834 = icmp eq i64 %t1833, 0
  br i1 %t1834, label %fixfast460, label %fixslow461
fixfast460:
  %t1835 = icmp eq i64 %a0, %a1
  %t1836 = select i1 %t1835, i64 257, i64 1
  br label %fixmerge462
fixslow461:
  %t1837 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge462
fixmerge462:
  %t1838 = phi i64 [ %t1836, %fixfast460 ], [ %t1837, %fixslow461 ]
  ret i64 %t1838
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1839 = icmp sge i64 %argc, 2
  br i1 %t1839, label %argok464, label %arityerr463
arityerr463:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok464:
  %t1840 = call ptr @rt_alloc_words(i64 8)
  %t1841 = getelementptr i64, ptr %t1840, i64 0
  store i64 %a0, ptr %t1841
  %t1842 = getelementptr i64, ptr %t1840, i64 1
  store i64 %a1, ptr %t1842
  %t1843 = getelementptr i64, ptr %t1840, i64 2
  store i64 %a2, ptr %t1843
  %t1844 = getelementptr i64, ptr %t1840, i64 3
  store i64 %a3, ptr %t1844
  %t1845 = getelementptr i64, ptr %t1840, i64 4
  store i64 %a4, ptr %t1845
  %t1846 = getelementptr i64, ptr %t1840, i64 5
  store i64 %a5, ptr %t1846
  %t1847 = getelementptr i64, ptr %t1840, i64 6
  store i64 %a6, ptr %t1847
  %t1848 = getelementptr i64, ptr %t1840, i64 7
  store i64 %a7, ptr %t1848
  %t1849 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1840, ptr %overflow)
  %t1850 = call ptr @rt_alloc_words(i64 1)
  %t1851 = ptrtoint ptr %t1850 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_551" to i64), ptr %t1850
  %t1852 = or i64 %t1851, 4
  %t1853 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1853)
  %t1854 = and i64 %t1853, -8
  %t1855 = inttoptr i64 %t1854 to ptr
  %t1856 = load i64, ptr %t1855
  %t1857 = inttoptr i64 %t1856 to ptr
  %t1858 = musttail call fastcc i64 %t1857(i64 %t1853, i64 4, i64 %t1852, i64 %a0, i64 %a1, i64 %t1849, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1858
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1859 = call ptr @rt_alloc_words(i64 1)
  %t1860 = ptrtoint ptr %t1859 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_551" to i64), ptr %t1859
  %t1861 = or i64 %t1860, 4
  %t1862 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1862)
  %t1863 = and i64 %t1862, -8
  %t1864 = inttoptr i64 %t1863 to ptr
  %t1865 = load i64, ptr %t1864
  %t1866 = inttoptr i64 %t1865 to ptr
  %t1867 = musttail call fastcc i64 %t1866(i64 %t1862, i64 4, i64 %t1861, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1867
}

define fastcc i64 @"scheme.base:code_564"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1872 = icmp eq i64 %argc, 2
  br i1 %t1872, label %argok466, label %arityerr465
arityerr465:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok466:
  %t1873 = and i64 %self, -8
  %t1874 = inttoptr i64 %t1873 to ptr
  %t1875 = getelementptr i64, ptr %t1874, i64 1
  %t1876 = load i64, ptr %t1875
  %t1877 = or i64 %a0, %t1876
  %t1878 = and i64 %t1877, 7
  %t1879 = icmp eq i64 %t1878, 0
  br i1 %t1879, label %fixfast467, label %fixslow468
fixfast467:
  %t1880 = icmp slt i64 %a0, %t1876
  %t1881 = select i1 %t1880, i64 257, i64 1
  br label %fixmerge469
fixslow468:
  %t1882 = call i64 @rt_lt(i64 %a0, i64 %t1876)
  br label %fixmerge469
fixmerge469:
  %t1883 = phi i64 [ %t1881, %fixfast467 ], [ %t1882, %fixslow468 ]
  %t1884 = icmp ne i64 %t1883, 1
  br i1 %t1884, label %then470, label %else471
then470:
  ret i64 %a1
else471:
  %t1885 = or i64 %a0, 8
  %t1886 = and i64 %t1885, 7
  %t1887 = icmp eq i64 %t1886, 0
  br i1 %t1887, label %fixfast472, label %fixslow473
fixfast472:
  %t1888 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1889 = extractvalue {i64, i1} %t1888, 0
  %t1890 = extractvalue {i64, i1} %t1888, 1
  br i1 %t1890, label %fixslow473, label %fixmerge474
fixslow473:
  %t1891 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge474
fixmerge474:
  %t1892 = phi i64 [ %t1889, %fixfast472 ], [ %t1891, %fixslow473 ]
  %t1893 = and i64 %self, -8
  %t1894 = inttoptr i64 %t1893 to ptr
  %t1895 = getelementptr i64, ptr %t1894, i64 3
  %t1896 = load i64, ptr %t1895
  %t1897 = call i64 @rt_string_ref(i64 %t1896, i64 %a0)
  %t1898 = call i64 @rt_cons(i64 %t1897, i64 %a1)
  %t1899 = musttail call fastcc i64 @"scheme.base:code_564"(i64 %self, i64 2, i64 %t1892, i64 %t1898, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1899
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1900 = icmp sge i64 %argc, 1
  br i1 %t1900, label %argok476, label %arityerr475
arityerr475:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok476:
  %t1901 = call ptr @rt_alloc_words(i64 8)
  %t1902 = getelementptr i64, ptr %t1901, i64 0
  store i64 %a0, ptr %t1902
  %t1903 = getelementptr i64, ptr %t1901, i64 1
  store i64 %a1, ptr %t1903
  %t1904 = getelementptr i64, ptr %t1901, i64 2
  store i64 %a2, ptr %t1904
  %t1905 = getelementptr i64, ptr %t1901, i64 3
  store i64 %a3, ptr %t1905
  %t1906 = getelementptr i64, ptr %t1901, i64 4
  store i64 %a4, ptr %t1906
  %t1907 = getelementptr i64, ptr %t1901, i64 5
  store i64 %a5, ptr %t1907
  %t1908 = getelementptr i64, ptr %t1901, i64 6
  store i64 %a6, ptr %t1908
  %t1909 = getelementptr i64, ptr %t1901, i64 7
  store i64 %a7, ptr %t1909
  %t1910 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1901, ptr %overflow)
  %t1911 = call i64 @rt_string_length(i64 %a0)
  %t1912 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t1912)
  %t1913 = and i64 %t1912, -8
  %t1914 = inttoptr i64 %t1913 to ptr
  %t1915 = load i64, ptr %t1914
  %t1916 = inttoptr i64 %t1915 to ptr
  %t1917 = call fastcc i64%t1916(i64 %t1912, i64 1, i64 %t1910, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1918 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t1918)
  %t1919 = and i64 %t1918, -8
  %t1920 = inttoptr i64 %t1919 to ptr
  %t1921 = load i64, ptr %t1920
  %t1922 = inttoptr i64 %t1921 to ptr
  %t1923 = call fastcc i64%t1922(i64 %t1918, i64 2, i64 %t1910, i64 %t1911, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1924 = call i64 @rt_intern(ptr @.str.sym.5)
  %t1925 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t1925)
  %t1926 = and i64 %t1925, -8
  %t1927 = inttoptr i64 %t1926 to ptr
  %t1928 = load i64, ptr %t1927
  %t1929 = inttoptr i64 %t1928 to ptr
  %t1930 = call fastcc i64%t1929(i64 %t1925, i64 4, i64 %t1924, i64 %t1917, i64 %t1923, i64 %t1911, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1931 = call ptr @rt_alloc_words(i64 4)
  %t1932 = ptrtoint ptr %t1931 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_564" to i64), ptr %t1931
  %t1933 = or i64 %t1932, 4
  %t1934 = getelementptr i64, ptr %t1931, i64 1
  store i64 %t1917, ptr %t1934
  %t1935 = getelementptr i64, ptr %t1931, i64 2
  store i64 %t1933, ptr %t1935
  %t1936 = getelementptr i64, ptr %t1931, i64 3
  store i64 %a0, ptr %t1936
  %t1937 = or i64 %t1923, 8
  %t1938 = and i64 %t1937, 7
  %t1939 = icmp eq i64 %t1938, 0
  br i1 %t1939, label %fixfast477, label %fixslow478
fixfast477:
  %t1940 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1923, i64 8)
  %t1941 = extractvalue {i64, i1} %t1940, 0
  %t1942 = extractvalue {i64, i1} %t1940, 1
  br i1 %t1942, label %fixslow478, label %fixmerge479
fixslow478:
  %t1943 = call i64 @rt_sub(i64 %t1923, i64 8)
  br label %fixmerge479
fixmerge479:
  %t1944 = phi i64 [ %t1941, %fixfast477 ], [ %t1943, %fixslow478 ]
  %t1945 = musttail call fastcc i64 @"scheme.base:code_564"(i64 %t1933, i64 2, i64 %t1944, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1945
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1946 = call i64 @rt_string_length(i64 %a0)
  %t1947 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t1947)
  %t1948 = and i64 %t1947, -8
  %t1949 = inttoptr i64 %t1948 to ptr
  %t1950 = load i64, ptr %t1949
  %t1951 = inttoptr i64 %t1950 to ptr
  %t1952 = call fastcc i64%t1951(i64 %t1947, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1953 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t1953)
  %t1954 = and i64 %t1953, -8
  %t1955 = inttoptr i64 %t1954 to ptr
  %t1956 = load i64, ptr %t1955
  %t1957 = inttoptr i64 %t1956 to ptr
  %t1958 = call fastcc i64%t1957(i64 %t1953, i64 2, i64 2, i64 %t1946, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1959 = call i64 @rt_intern(ptr @.str.sym.5)
  %t1960 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t1960)
  %t1961 = and i64 %t1960, -8
  %t1962 = inttoptr i64 %t1961 to ptr
  %t1963 = load i64, ptr %t1962
  %t1964 = inttoptr i64 %t1963 to ptr
  %t1965 = call fastcc i64%t1964(i64 %t1960, i64 4, i64 %t1959, i64 %t1952, i64 %t1958, i64 %t1946, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1966 = call ptr @rt_alloc_words(i64 4)
  %t1967 = ptrtoint ptr %t1966 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_564" to i64), ptr %t1966
  %t1968 = or i64 %t1967, 4
  %t1969 = getelementptr i64, ptr %t1966, i64 1
  store i64 %t1952, ptr %t1969
  %t1970 = getelementptr i64, ptr %t1966, i64 2
  store i64 %t1968, ptr %t1970
  %t1971 = getelementptr i64, ptr %t1966, i64 3
  store i64 %a0, ptr %t1971
  %t1972 = or i64 %t1958, 8
  %t1973 = and i64 %t1972, 7
  %t1974 = icmp eq i64 %t1973, 0
  br i1 %t1974, label %fixfast480, label %fixslow481
fixfast480:
  %t1975 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1958, i64 8)
  %t1976 = extractvalue {i64, i1} %t1975, 0
  %t1977 = extractvalue {i64, i1} %t1975, 1
  br i1 %t1977, label %fixslow481, label %fixmerge482
fixslow481:
  %t1978 = call i64 @rt_sub(i64 %t1958, i64 8)
  br label %fixmerge482
fixmerge482:
  %t1979 = phi i64 [ %t1976, %fixfast480 ], [ %t1978, %fixslow481 ]
  %t1980 = musttail call fastcc i64 @"scheme.base:code_564"(i64 %t1968, i64 2, i64 %t1979, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1980
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1985 = icmp eq i64 %argc, 2
  br i1 %t1985, label %argok484, label %arityerr483
arityerr483:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok484:
  %t1986 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t1986)
  %t1987 = and i64 %t1986, -8
  %t1988 = inttoptr i64 %t1987 to ptr
  %t1989 = load i64, ptr %t1988
  %t1990 = inttoptr i64 %t1989 to ptr
  %t1991 = musttail call fastcc i64 %t1990(i64 %t1986, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1991
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1996 = icmp eq i64 %argc, 1
  br i1 %t1996, label %argok486, label %arityerr485
arityerr485:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok486:
  %t1997 = or i64 %a0, 80
  %t1998 = and i64 %t1997, 7
  %t1999 = icmp eq i64 %t1998, 0
  br i1 %t1999, label %fixfast487, label %fixslow488
fixfast487:
  %t2000 = icmp slt i64 %a0, 80
  %t2001 = select i1 %t2000, i64 257, i64 1
  br label %fixmerge489
fixslow488:
  %t2002 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge489
fixmerge489:
  %t2003 = phi i64 [ %t2001, %fixfast487 ], [ %t2002, %fixslow488 ]
  %t2004 = icmp ne i64 %t2003, 1
  br i1 %t2004, label %then490, label %else491
then490:
  %t2005 = or i64 384, %a0
  %t2006 = and i64 %t2005, 7
  %t2007 = icmp eq i64 %t2006, 0
  br i1 %t2007, label %fixfast492, label %fixslow493
fixfast492:
  %t2008 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t2009 = extractvalue {i64, i1} %t2008, 0
  %t2010 = extractvalue {i64, i1} %t2008, 1
  br i1 %t2010, label %fixslow493, label %fixmerge494
fixslow493:
  %t2011 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge494
fixmerge494:
  %t2012 = phi i64 [ %t2009, %fixfast492 ], [ %t2011, %fixslow493 ]
  %t2013 = call i64 @rt_integer_to_char(i64 %t2012)
  ret i64 %t2013
else491:
  %t2014 = or i64 696, %a0
  %t2015 = and i64 %t2014, 7
  %t2016 = icmp eq i64 %t2015, 0
  br i1 %t2016, label %fixfast495, label %fixslow496
fixfast495:
  %t2017 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t2018 = extractvalue {i64, i1} %t2017, 0
  %t2019 = extractvalue {i64, i1} %t2017, 1
  br i1 %t2019, label %fixslow496, label %fixmerge497
fixslow496:
  %t2020 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge497
fixmerge497:
  %t2021 = phi i64 [ %t2018, %fixfast495 ], [ %t2020, %fixslow496 ]
  %t2022 = call i64 @rt_integer_to_char(i64 %t2021)
  ret i64 %t2022
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2027 = icmp eq i64 %argc, 3
  br i1 %t2027, label %argok499, label %arityerr498
arityerr498:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok499:
  %t2028 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t2029 = or i64 0, %t2028
  %t2030 = and i64 %t2029, 7
  %t2031 = icmp eq i64 %t2030, 0
  br i1 %t2031, label %fixfast500, label %fixslow501
fixfast500:
  %t2032 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t2028)
  %t2033 = extractvalue {i64, i1} %t2032, 0
  %t2034 = extractvalue {i64, i1} %t2032, 1
  br i1 %t2034, label %fixslow501, label %fixmerge502
fixslow501:
  %t2035 = call i64 @rt_sub(i64 0, i64 %t2028)
  br label %fixmerge502
fixmerge502:
  %t2036 = phi i64 [ %t2033, %fixfast500 ], [ %t2035, %fixslow501 ]
  %t2037 = load i64, ptr @"scheme.base:%ns-digit-char"
  call void @rt_check_callable(i64 %t2037)
  %t2038 = and i64 %t2037, -8
  %t2039 = inttoptr i64 %t2038 to ptr
  %t2040 = load i64, ptr %t2039
  %t2041 = inttoptr i64 %t2040 to ptr
  %t2042 = call fastcc i64%t2041(i64 %t2037, i64 1, i64 %t2036, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2043 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t2044 = or i64 %t2043, 0
  %t2045 = and i64 %t2044, 7
  %t2046 = icmp eq i64 %t2045, 0
  br i1 %t2046, label %fixfast503, label %fixslow504
fixfast503:
  %t2047 = icmp eq i64 %t2043, 0
  %t2048 = select i1 %t2047, i64 257, i64 1
  br label %fixmerge505
fixslow504:
  %t2049 = call i64 @rt_num_eq(i64 %t2043, i64 0)
  br label %fixmerge505
fixmerge505:
  %t2050 = phi i64 [ %t2048, %fixfast503 ], [ %t2049, %fixslow504 ]
  %t2051 = icmp ne i64 %t2050, 1
  br i1 %t2051, label %then506, label %else507
then506:
  %t2052 = call i64 @rt_cons(i64 %t2042, i64 %a2)
  ret i64 %t2052
else507:
  %t2053 = call i64 @rt_cons(i64 %t2042, i64 %a2)
  %t2054 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2054)
  %t2055 = and i64 %t2054, -8
  %t2056 = inttoptr i64 %t2055 to ptr
  %t2057 = load i64, ptr %t2056
  %t2058 = inttoptr i64 %t2057 to ptr
  %t2059 = musttail call fastcc i64 %t2058(i64 %t2054, i64 3, i64 %t2043, i64 %a1, i64 %t2053, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2059
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2064 = icmp eq i64 %argc, 1
  br i1 %t2064, label %argok509, label %arityerr508
arityerr508:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok509:
  %t2065 = or i64 %a0, 80
  %t2066 = and i64 %t2065, 7
  %t2067 = icmp eq i64 %t2066, 0
  br i1 %t2067, label %fixfast510, label %fixslow511
fixfast510:
  %t2068 = icmp eq i64 %a0, 80
  %t2069 = select i1 %t2068, i64 257, i64 1
  br label %fixmerge512
fixslow511:
  %t2070 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge512
fixmerge512:
  %t2071 = phi i64 [ %t2069, %fixfast510 ], [ %t2070, %fixslow511 ]
  %t2072 = icmp ne i64 %t2071, 1
  br i1 %t2072, label %then513, label %else514
then513:
  ret i64 257
else514:
  %t2073 = or i64 %a0, 128
  %t2074 = and i64 %t2073, 7
  %t2075 = icmp eq i64 %t2074, 0
  br i1 %t2075, label %fixfast515, label %fixslow516
fixfast515:
  %t2076 = icmp eq i64 %a0, 128
  %t2077 = select i1 %t2076, i64 257, i64 1
  br label %fixmerge517
fixslow516:
  %t2078 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge517
fixmerge517:
  %t2079 = phi i64 [ %t2077, %fixfast515 ], [ %t2078, %fixslow516 ]
  %t2080 = icmp ne i64 %t2079, 1
  br i1 %t2080, label %then518, label %else519
then518:
  ret i64 257
else519:
  %t2081 = or i64 %a0, 64
  %t2082 = and i64 %t2081, 7
  %t2083 = icmp eq i64 %t2082, 0
  br i1 %t2083, label %fixfast520, label %fixslow521
fixfast520:
  %t2084 = icmp eq i64 %a0, 64
  %t2085 = select i1 %t2084, i64 257, i64 1
  br label %fixmerge522
fixslow521:
  %t2086 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge522
fixmerge522:
  %t2087 = phi i64 [ %t2085, %fixfast520 ], [ %t2086, %fixslow521 ]
  %t2088 = icmp ne i64 %t2087, 1
  br i1 %t2088, label %then523, label %else524
then523:
  ret i64 257
else524:
  %t2089 = or i64 %a0, 16
  %t2090 = and i64 %t2089, 7
  %t2091 = icmp eq i64 %t2090, 0
  br i1 %t2091, label %fixfast525, label %fixslow526
fixfast525:
  %t2092 = icmp eq i64 %a0, 16
  %t2093 = select i1 %t2092, i64 257, i64 1
  br label %fixmerge527
fixslow526:
  %t2094 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge527
fixmerge527:
  %t2095 = phi i64 [ %t2093, %fixfast525 ], [ %t2094, %fixslow526 ]
  ret i64 %t2095
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2100 = icmp sge i64 %argc, 1
  br i1 %t2100, label %argok529, label %arityerr528
arityerr528:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok529:
  %t2101 = call ptr @rt_alloc_words(i64 8)
  %t2102 = getelementptr i64, ptr %t2101, i64 0
  store i64 %a0, ptr %t2102
  %t2103 = getelementptr i64, ptr %t2101, i64 1
  store i64 %a1, ptr %t2103
  %t2104 = getelementptr i64, ptr %t2101, i64 2
  store i64 %a2, ptr %t2104
  %t2105 = getelementptr i64, ptr %t2101, i64 3
  store i64 %a3, ptr %t2105
  %t2106 = getelementptr i64, ptr %t2101, i64 4
  store i64 %a4, ptr %t2106
  %t2107 = getelementptr i64, ptr %t2101, i64 5
  store i64 %a5, ptr %t2107
  %t2108 = getelementptr i64, ptr %t2101, i64 6
  store i64 %a6, ptr %t2108
  %t2109 = getelementptr i64, ptr %t2101, i64 7
  store i64 %a7, ptr %t2109
  %t2110 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2101, ptr %overflow)
  %t2111 = call i64 @rt_null_p(i64 %t2110)
  %t2112 = icmp ne i64 %t2111, 1
  br i1 %t2112, label %then530, label %else531
then530:
  br label %merge532
else531:
  %t2113 = call i64 @rt_car(i64 %t2110)
  br label %merge532
merge532:
  %t2114 = phi i64 [ 80, %then530 ], [ %t2113, %else531 ]
  %t2115 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2115)
  %t2116 = and i64 %t2115, -8
  %t2117 = inttoptr i64 %t2116 to ptr
  %t2118 = load i64, ptr %t2117
  %t2119 = inttoptr i64 %t2118 to ptr
  %t2120 = call fastcc i64%t2119(i64 %t2115, i64 1, i64 %t2114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2121 = icmp ne i64 %t2120, 1
  br i1 %t2121, label %then533, label %else534
then533:
  %t2122 = call i64 @rt_exact_p(i64 %a0)
  %t2123 = icmp ne i64 %t2122, 1
  br i1 %t2123, label %then535, label %else536
then535:
  %t2124 = or i64 %a0, 0
  %t2125 = and i64 %t2124, 7
  %t2126 = icmp eq i64 %t2125, 0
  br i1 %t2126, label %fixfast537, label %fixslow538
fixfast537:
  %t2127 = icmp eq i64 %a0, 0
  %t2128 = select i1 %t2127, i64 257, i64 1
  br label %fixmerge539
fixslow538:
  %t2129 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge539
fixmerge539:
  %t2130 = phi i64 [ %t2128, %fixfast537 ], [ %t2129, %fixslow538 ]
  %t2131 = icmp ne i64 %t2130, 1
  br i1 %t2131, label %then540, label %else541
then540:
  %t2132 = call i64 @rt_make_string(ptr @.str.lit.6, i64 1)
  ret i64 %t2132
else541:
  %t2133 = or i64 %a0, 0
  %t2134 = and i64 %t2133, 7
  %t2135 = icmp eq i64 %t2134, 0
  br i1 %t2135, label %fixfast542, label %fixslow543
fixfast542:
  %t2136 = icmp slt i64 %a0, 0
  %t2137 = select i1 %t2136, i64 257, i64 1
  br label %fixmerge544
fixslow543:
  %t2138 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge544
fixmerge544:
  %t2139 = phi i64 [ %t2137, %fixfast542 ], [ %t2138, %fixslow543 ]
  %t2140 = icmp ne i64 %t2139, 1
  br i1 %t2140, label %then545, label %else546
then545:
  %t2141 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2141)
  %t2142 = and i64 %t2141, -8
  %t2143 = inttoptr i64 %t2142 to ptr
  %t2144 = load i64, ptr %t2143
  %t2145 = inttoptr i64 %t2144 to ptr
  %t2146 = call fastcc i64%t2145(i64 %t2141, i64 3, i64 %a0, i64 %t2114, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2147 = call i64 @rt_cons(i64 11529, i64 %t2146)
  %t2148 = call i64 @rt_list_to_string(i64 %t2147)
  ret i64 %t2148
else546:
  %t2149 = or i64 0, %a0
  %t2150 = and i64 %t2149, 7
  %t2151 = icmp eq i64 %t2150, 0
  br i1 %t2151, label %fixfast547, label %fixslow548
fixfast547:
  %t2152 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t2153 = extractvalue {i64, i1} %t2152, 0
  %t2154 = extractvalue {i64, i1} %t2152, 1
  br i1 %t2154, label %fixslow548, label %fixmerge549
fixslow548:
  %t2155 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge549
fixmerge549:
  %t2156 = phi i64 [ %t2153, %fixfast547 ], [ %t2155, %fixslow548 ]
  %t2157 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2157)
  %t2158 = and i64 %t2157, -8
  %t2159 = inttoptr i64 %t2158 to ptr
  %t2160 = load i64, ptr %t2159
  %t2161 = inttoptr i64 %t2160 to ptr
  %t2162 = call fastcc i64%t2161(i64 %t2157, i64 3, i64 %t2156, i64 %t2114, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2163 = call i64 @rt_list_to_string(i64 %t2162)
  ret i64 %t2163
else536:
  %t2164 = or i64 %t2114, 80
  %t2165 = and i64 %t2164, 7
  %t2166 = icmp eq i64 %t2165, 0
  br i1 %t2166, label %fixfast550, label %fixslow551
fixfast550:
  %t2167 = icmp eq i64 %t2114, 80
  %t2168 = select i1 %t2167, i64 257, i64 1
  br label %fixmerge552
fixslow551:
  %t2169 = call i64 @rt_num_eq(i64 %t2114, i64 80)
  br label %fixmerge552
fixmerge552:
  %t2170 = phi i64 [ %t2168, %fixfast550 ], [ %t2169, %fixslow551 ]
  %t2171 = icmp ne i64 %t2170, 1
  br i1 %t2171, label %then553, label %else554
then553:
  %t2172 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2172
else554:
  %t2173 = call i64 @rt_make_string(ptr @.str.lit.7, i64 54)
  %t2174 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2174)
  %t2175 = and i64 %t2174, -8
  %t2176 = inttoptr i64 %t2175 to ptr
  %t2177 = load i64, ptr %t2176
  %t2178 = inttoptr i64 %t2177 to ptr
  %t2179 = musttail call fastcc i64 %t2178(i64 %t2174, i64 2, i64 %t2173, i64 %t2114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2179
else534:
  %t2180 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2181 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2181)
  %t2182 = and i64 %t2181, -8
  %t2183 = inttoptr i64 %t2182 to ptr
  %t2184 = load i64, ptr %t2183
  %t2185 = inttoptr i64 %t2184 to ptr
  %t2186 = musttail call fastcc i64 %t2185(i64 %t2181, i64 2, i64 %t2180, i64 %t2114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2186
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cnumber->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2187 = call i64 @rt_null_p(i64 2)
  %t2188 = icmp ne i64 %t2187, 1
  br i1 %t2188, label %then555, label %else556
then555:
  br label %merge557
else556:
  %t2189 = call i64 @rt_car(i64 2)
  br label %merge557
merge557:
  %t2190 = phi i64 [ 80, %then555 ], [ %t2189, %else556 ]
  %t2191 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2191)
  %t2192 = and i64 %t2191, -8
  %t2193 = inttoptr i64 %t2192 to ptr
  %t2194 = load i64, ptr %t2193
  %t2195 = inttoptr i64 %t2194 to ptr
  %t2196 = call fastcc i64%t2195(i64 %t2191, i64 1, i64 %t2190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2197 = icmp ne i64 %t2196, 1
  br i1 %t2197, label %then558, label %else559
then558:
  %t2198 = call i64 @rt_exact_p(i64 %a0)
  %t2199 = icmp ne i64 %t2198, 1
  br i1 %t2199, label %then560, label %else561
then560:
  %t2200 = or i64 %a0, 0
  %t2201 = and i64 %t2200, 7
  %t2202 = icmp eq i64 %t2201, 0
  br i1 %t2202, label %fixfast562, label %fixslow563
fixfast562:
  %t2203 = icmp eq i64 %a0, 0
  %t2204 = select i1 %t2203, i64 257, i64 1
  br label %fixmerge564
fixslow563:
  %t2205 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge564
fixmerge564:
  %t2206 = phi i64 [ %t2204, %fixfast562 ], [ %t2205, %fixslow563 ]
  %t2207 = icmp ne i64 %t2206, 1
  br i1 %t2207, label %then565, label %else566
then565:
  %t2208 = call i64 @rt_make_string(ptr @.str.lit.9, i64 1)
  ret i64 %t2208
else566:
  %t2209 = or i64 %a0, 0
  %t2210 = and i64 %t2209, 7
  %t2211 = icmp eq i64 %t2210, 0
  br i1 %t2211, label %fixfast567, label %fixslow568
fixfast567:
  %t2212 = icmp slt i64 %a0, 0
  %t2213 = select i1 %t2212, i64 257, i64 1
  br label %fixmerge569
fixslow568:
  %t2214 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge569
fixmerge569:
  %t2215 = phi i64 [ %t2213, %fixfast567 ], [ %t2214, %fixslow568 ]
  %t2216 = icmp ne i64 %t2215, 1
  br i1 %t2216, label %then570, label %else571
then570:
  %t2217 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2217)
  %t2218 = and i64 %t2217, -8
  %t2219 = inttoptr i64 %t2218 to ptr
  %t2220 = load i64, ptr %t2219
  %t2221 = inttoptr i64 %t2220 to ptr
  %t2222 = call fastcc i64%t2221(i64 %t2217, i64 3, i64 %a0, i64 %t2190, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2223 = call i64 @rt_cons(i64 11529, i64 %t2222)
  %t2224 = call i64 @rt_list_to_string(i64 %t2223)
  ret i64 %t2224
else571:
  %t2225 = or i64 0, %a0
  %t2226 = and i64 %t2225, 7
  %t2227 = icmp eq i64 %t2226, 0
  br i1 %t2227, label %fixfast572, label %fixslow573
fixfast572:
  %t2228 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t2229 = extractvalue {i64, i1} %t2228, 0
  %t2230 = extractvalue {i64, i1} %t2228, 1
  br i1 %t2230, label %fixslow573, label %fixmerge574
fixslow573:
  %t2231 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge574
fixmerge574:
  %t2232 = phi i64 [ %t2229, %fixfast572 ], [ %t2231, %fixslow573 ]
  %t2233 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2233)
  %t2234 = and i64 %t2233, -8
  %t2235 = inttoptr i64 %t2234 to ptr
  %t2236 = load i64, ptr %t2235
  %t2237 = inttoptr i64 %t2236 to ptr
  %t2238 = call fastcc i64%t2237(i64 %t2233, i64 3, i64 %t2232, i64 %t2190, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2239 = call i64 @rt_list_to_string(i64 %t2238)
  ret i64 %t2239
else561:
  %t2240 = or i64 %t2190, 80
  %t2241 = and i64 %t2240, 7
  %t2242 = icmp eq i64 %t2241, 0
  br i1 %t2242, label %fixfast575, label %fixslow576
fixfast575:
  %t2243 = icmp eq i64 %t2190, 80
  %t2244 = select i1 %t2243, i64 257, i64 1
  br label %fixmerge577
fixslow576:
  %t2245 = call i64 @rt_num_eq(i64 %t2190, i64 80)
  br label %fixmerge577
fixmerge577:
  %t2246 = phi i64 [ %t2244, %fixfast575 ], [ %t2245, %fixslow576 ]
  %t2247 = icmp ne i64 %t2246, 1
  br i1 %t2247, label %then578, label %else579
then578:
  %t2248 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2248
else579:
  %t2249 = call i64 @rt_make_string(ptr @.str.lit.10, i64 54)
  %t2250 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2250)
  %t2251 = and i64 %t2250, -8
  %t2252 = inttoptr i64 %t2251 to ptr
  %t2253 = load i64, ptr %t2252
  %t2254 = inttoptr i64 %t2253 to ptr
  %t2255 = musttail call fastcc i64 %t2254(i64 %t2250, i64 2, i64 %t2249, i64 %t2190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2255
else559:
  %t2256 = call i64 @rt_make_string(ptr @.str.lit.11, i64 33)
  %t2257 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2257)
  %t2258 = and i64 %t2257, -8
  %t2259 = inttoptr i64 %t2258 to ptr
  %t2260 = load i64, ptr %t2259
  %t2261 = inttoptr i64 %t2260 to ptr
  %t2262 = musttail call fastcc i64 %t2261(i64 %t2257, i64 2, i64 %t2256, i64 %t2190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2262
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2267 = icmp sge i64 %argc, 1
  br i1 %t2267, label %argok581, label %arityerr580
arityerr580:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok581:
  %t2268 = call ptr @rt_alloc_words(i64 8)
  %t2269 = getelementptr i64, ptr %t2268, i64 0
  store i64 %a0, ptr %t2269
  %t2270 = getelementptr i64, ptr %t2268, i64 1
  store i64 %a1, ptr %t2270
  %t2271 = getelementptr i64, ptr %t2268, i64 2
  store i64 %a2, ptr %t2271
  %t2272 = getelementptr i64, ptr %t2268, i64 3
  store i64 %a3, ptr %t2272
  %t2273 = getelementptr i64, ptr %t2268, i64 4
  store i64 %a4, ptr %t2273
  %t2274 = getelementptr i64, ptr %t2268, i64 5
  store i64 %a5, ptr %t2274
  %t2275 = getelementptr i64, ptr %t2268, i64 6
  store i64 %a6, ptr %t2275
  %t2276 = getelementptr i64, ptr %t2268, i64 7
  store i64 %a7, ptr %t2276
  %t2277 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2268, ptr %overflow)
  %t2278 = call i64 @rt_null_p(i64 %t2277)
  %t2279 = icmp ne i64 %t2278, 1
  br i1 %t2279, label %then582, label %else583
then582:
  br label %merge584
else583:
  %t2280 = call i64 @rt_car(i64 %t2277)
  br label %merge584
merge584:
  %t2281 = phi i64 [ 80, %then582 ], [ %t2280, %else583 ]
  %t2282 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2282)
  %t2283 = and i64 %t2282, -8
  %t2284 = inttoptr i64 %t2283 to ptr
  %t2285 = load i64, ptr %t2284
  %t2286 = inttoptr i64 %t2285 to ptr
  %t2287 = call fastcc i64%t2286(i64 %t2282, i64 1, i64 %t2281, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2288 = icmp ne i64 %t2287, 1
  br i1 %t2288, label %then585, label %else586
then585:
  %t2289 = load i64, ptr @"emit.internal:rd-number"
  %t2290 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2289, i64 2, i64 %a0, i64 %t2281, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2291 = call i64 @rt_symbol_p(i64 %t2290)
  %t2292 = icmp ne i64 %t2291, 1
  br i1 %t2292, label %then587, label %else588
then587:
  ret i64 1
else588:
  ret i64 %t2290
else586:
  %t2293 = call i64 @rt_make_string(ptr @.str.lit.12, i64 33)
  %t2294 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2294)
  %t2295 = and i64 %t2294, -8
  %t2296 = inttoptr i64 %t2295 to ptr
  %t2297 = load i64, ptr %t2296
  %t2298 = inttoptr i64 %t2297 to ptr
  %t2299 = musttail call fastcc i64 %t2298(i64 %t2294, i64 2, i64 %t2293, i64 %t2281, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2299
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2300 = call i64 @rt_null_p(i64 2)
  %t2301 = icmp ne i64 %t2300, 1
  br i1 %t2301, label %then589, label %else590
then589:
  br label %merge591
else590:
  %t2302 = call i64 @rt_car(i64 2)
  br label %merge591
merge591:
  %t2303 = phi i64 [ 80, %then589 ], [ %t2302, %else590 ]
  %t2304 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2304)
  %t2305 = and i64 %t2304, -8
  %t2306 = inttoptr i64 %t2305 to ptr
  %t2307 = load i64, ptr %t2306
  %t2308 = inttoptr i64 %t2307 to ptr
  %t2309 = call fastcc i64%t2308(i64 %t2304, i64 1, i64 %t2303, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2310 = icmp ne i64 %t2309, 1
  br i1 %t2310, label %then592, label %else593
then592:
  %t2311 = load i64, ptr @"emit.internal:rd-number"
  %t2312 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2311, i64 2, i64 %a0, i64 %t2303, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2313 = call i64 @rt_symbol_p(i64 %t2312)
  %t2314 = icmp ne i64 %t2313, 1
  br i1 %t2314, label %then594, label %else595
then594:
  ret i64 1
else595:
  ret i64 %t2312
else593:
  %t2315 = call i64 @rt_make_string(ptr @.str.lit.13, i64 33)
  %t2316 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2316)
  %t2317 = and i64 %t2316, -8
  %t2318 = inttoptr i64 %t2317 to ptr
  %t2319 = load i64, ptr %t2318
  %t2320 = inttoptr i64 %t2319 to ptr
  %t2321 = musttail call fastcc i64 %t2320(i64 %t2316, i64 2, i64 %t2315, i64 %t2303, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2321
}

define fastcc i64 @"scheme.base:code:%raise-kinded"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2326 = icmp eq i64 %argc, 3
  br i1 %t2326, label %argok597, label %arityerr596
arityerr596:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok597:
  %t2327 = call i64 @rt_string_p(i64 %a1)
  %t2328 = icmp ne i64 %t2327, 1
  br i1 %t2328, label %then598, label %else599
then598:
  %t2329 = call i64 @rt_make_error_object_kind(i64 %a1, i64 %a2, i64 %a0)
  %t2330 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2330)
  %t2331 = and i64 %t2330, -8
  %t2332 = inttoptr i64 %t2331 to ptr
  %t2333 = load i64, ptr %t2332
  %t2334 = inttoptr i64 %t2333 to ptr
  %t2335 = musttail call fastcc i64 %t2334(i64 %t2330, i64 1, i64 %t2329, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2335
else599:
  %t2336 = call i64 @rt_symbol_to_string(i64 %a1)
  %t2337 = call i64 @rt_make_string(ptr @.str.lit.14, i64 2)
  %t2338 = call i64 @rt_car(i64 %a2)
  %t2339 = call i64 @rt_string_append(i64 %t2337, i64 %t2338)
  %t2340 = call i64 @rt_string_append(i64 %t2336, i64 %t2339)
  %t2341 = call i64 @rt_cdr(i64 %a2)
  %t2342 = call i64 @rt_make_error_object_kind(i64 %t2340, i64 %t2341, i64 %a0)
  %t2343 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2343)
  %t2344 = and i64 %t2343, -8
  %t2345 = inttoptr i64 %t2344 to ptr
  %t2346 = load i64, ptr %t2345
  %t2347 = inttoptr i64 %t2346 to ptr
  %t2348 = musttail call fastcc i64 %t2347(i64 %t2343, i64 1, i64 %t2342, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2348
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2353 = icmp sge i64 %argc, 1
  br i1 %t2353, label %argok601, label %arityerr600
arityerr600:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok601:
  %t2354 = call ptr @rt_alloc_words(i64 8)
  %t2355 = getelementptr i64, ptr %t2354, i64 0
  store i64 %a0, ptr %t2355
  %t2356 = getelementptr i64, ptr %t2354, i64 1
  store i64 %a1, ptr %t2356
  %t2357 = getelementptr i64, ptr %t2354, i64 2
  store i64 %a2, ptr %t2357
  %t2358 = getelementptr i64, ptr %t2354, i64 3
  store i64 %a3, ptr %t2358
  %t2359 = getelementptr i64, ptr %t2354, i64 4
  store i64 %a4, ptr %t2359
  %t2360 = getelementptr i64, ptr %t2354, i64 5
  store i64 %a5, ptr %t2360
  %t2361 = getelementptr i64, ptr %t2354, i64 6
  store i64 %a6, ptr %t2361
  %t2362 = getelementptr i64, ptr %t2354, i64 7
  store i64 %a7, ptr %t2362
  %t2363 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2354, ptr %overflow)
  %t2364 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2365 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2365)
  %t2366 = and i64 %t2365, -8
  %t2367 = inttoptr i64 %t2366 to ptr
  %t2368 = load i64, ptr %t2367
  %t2369 = inttoptr i64 %t2368 to ptr
  %t2370 = musttail call fastcc i64 %t2369(i64 %t2365, i64 3, i64 %t2364, i64 %a0, i64 %t2363, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2370
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cerror"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2371 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2372 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2372)
  %t2373 = and i64 %t2372, -8
  %t2374 = inttoptr i64 %t2373 to ptr
  %t2375 = load i64, ptr %t2374
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = musttail call fastcc i64 %t2376(i64 %t2372, i64 3, i64 %t2371, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2377
}

define fastcc i64 @"scheme.base:code:%read-error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2382 = icmp sge i64 %argc, 1
  br i1 %t2382, label %argok603, label %arityerr602
arityerr602:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok603:
  %t2383 = call ptr @rt_alloc_words(i64 8)
  %t2384 = getelementptr i64, ptr %t2383, i64 0
  store i64 %a0, ptr %t2384
  %t2385 = getelementptr i64, ptr %t2383, i64 1
  store i64 %a1, ptr %t2385
  %t2386 = getelementptr i64, ptr %t2383, i64 2
  store i64 %a2, ptr %t2386
  %t2387 = getelementptr i64, ptr %t2383, i64 3
  store i64 %a3, ptr %t2387
  %t2388 = getelementptr i64, ptr %t2383, i64 4
  store i64 %a4, ptr %t2388
  %t2389 = getelementptr i64, ptr %t2383, i64 5
  store i64 %a5, ptr %t2389
  %t2390 = getelementptr i64, ptr %t2383, i64 6
  store i64 %a6, ptr %t2390
  %t2391 = getelementptr i64, ptr %t2383, i64 7
  store i64 %a7, ptr %t2391
  %t2392 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2383, ptr %overflow)
  %t2393 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2394 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2394)
  %t2395 = and i64 %t2394, -8
  %t2396 = inttoptr i64 %t2395 to ptr
  %t2397 = load i64, ptr %t2396
  %t2398 = inttoptr i64 %t2397 to ptr
  %t2399 = musttail call fastcc i64 %t2398(i64 %t2394, i64 3, i64 %t2393, i64 %a0, i64 %t2392, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2399
}

define fastcc i64 @"min-entry:$scheme.base$ccode$c%read-error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2400 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2401 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2401)
  %t2402 = and i64 %t2401, -8
  %t2403 = inttoptr i64 %t2402 to ptr
  %t2404 = load i64, ptr %t2403
  %t2405 = inttoptr i64 %t2404 to ptr
  %t2406 = musttail call fastcc i64 %t2405(i64 %t2401, i64 3, i64 %t2400, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2406
}

define fastcc i64 @"scheme.base:code_616"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2412 = icmp eq i64 %argc, 0
  br i1 %t2412, label %argok605, label %arityerr604
arityerr604:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok605:
  %t2413 = call i64 @rt_trap_object()
  %t2414 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2414)
  %t2415 = and i64 %t2414, -8
  %t2416 = inttoptr i64 %t2415 to ptr
  %t2417 = load i64, ptr %t2416
  %t2418 = inttoptr i64 %t2417 to ptr
  %t2419 = musttail call fastcc i64 %t2418(i64 %t2414, i64 1, i64 %t2413, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2419
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2425 = icmp eq i64 %argc, 1
  br i1 %t2425, label %argok607, label %arityerr606
arityerr606:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok607:
  %t2426 = load i64, ptr @"scheme.base:*winds*"
  %t2427 = call i64 @rt_eq_p(i64 %t2426, i64 %a0)
  %t2428 = icmp ne i64 %t2427, 1
  br i1 %t2428, label %then608, label %else609
then608:
  ret i64 257
else609:
  %t2429 = load i64, ptr @"scheme.base:*winds*"
  %t2430 = call i64 @rt_null_p(i64 %t2429)
  %t2431 = icmp ne i64 %t2430, 1
  br i1 %t2431, label %then610, label %else611
then610:
  ret i64 257
else611:
  %t2432 = load i64, ptr @"scheme.base:*winds*"
  %t2433 = call i64 @rt_car(i64 %t2432)
  %t2434 = load i64, ptr @"scheme.base:*winds*"
  %t2435 = call i64 @rt_cdr(i64 %t2434)
  %t2436 = call i64 @rt_root(i64 %t2435)
  store i64 %t2436, ptr @"scheme.base:*winds*"
  %t2437 = call i64 @rt_cdr(i64 %t2433)
  call void @rt_check_callable(i64 %t2437)
  %t2438 = and i64 %t2437, -8
  %t2439 = inttoptr i64 %t2438 to ptr
  %t2440 = load i64, ptr %t2439
  %t2441 = inttoptr i64 %t2440 to ptr
  %t2442 = call fastcc i64%t2441(i64 %t2437, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2443 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2443)
  %t2444 = and i64 %t2443, -8
  %t2445 = inttoptr i64 %t2444 to ptr
  %t2446 = load i64, ptr %t2445
  %t2447 = inttoptr i64 %t2446 to ptr
  %t2448 = musttail call fastcc i64 %t2447(i64 %t2443, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2448
}

define fastcc i64 @"scheme.base:code:unwind-all!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2453 = icmp eq i64 %argc, 0
  br i1 %t2453, label %argok613, label %arityerr612
arityerr612:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok613:
  %t2454 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2454)
  %t2455 = and i64 %t2454, -8
  %t2456 = inttoptr i64 %t2455 to ptr
  %t2457 = load i64, ptr %t2456
  %t2458 = inttoptr i64 %t2457 to ptr
  %t2459 = musttail call fastcc i64 %t2458(i64 %t2454, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2459
}

define fastcc i64 @"scheme.base:code_629"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2464 = icmp sge i64 %argc, 0
  br i1 %t2464, label %argok615, label %arityerr614
arityerr614:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok615:
  %t2465 = call ptr @rt_alloc_words(i64 8)
  %t2466 = getelementptr i64, ptr %t2465, i64 0
  store i64 %a0, ptr %t2466
  %t2467 = getelementptr i64, ptr %t2465, i64 1
  store i64 %a1, ptr %t2467
  %t2468 = getelementptr i64, ptr %t2465, i64 2
  store i64 %a2, ptr %t2468
  %t2469 = getelementptr i64, ptr %t2465, i64 3
  store i64 %a3, ptr %t2469
  %t2470 = getelementptr i64, ptr %t2465, i64 4
  store i64 %a4, ptr %t2470
  %t2471 = getelementptr i64, ptr %t2465, i64 5
  store i64 %a5, ptr %t2471
  %t2472 = getelementptr i64, ptr %t2465, i64 6
  store i64 %a6, ptr %t2472
  %t2473 = getelementptr i64, ptr %t2465, i64 7
  store i64 %a7, ptr %t2473
  %t2474 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2465, ptr %overflow)
  %t2475 = load i64, ptr @"scheme.base:*winds*"
  %t2476 = call i64 @rt_cdr(i64 %t2475)
  %t2477 = call i64 @rt_root(i64 %t2476)
  store i64 %t2477, ptr @"scheme.base:*winds*"
  %t2478 = and i64 %self, -8
  %t2479 = inttoptr i64 %t2478 to ptr
  %t2480 = getelementptr i64, ptr %t2479, i64 1
  %t2481 = load i64, ptr %t2480
  call void @rt_check_callable(i64 %t2481)
  %t2482 = and i64 %t2481, -8
  %t2483 = inttoptr i64 %t2482 to ptr
  %t2484 = load i64, ptr %t2483
  %t2485 = inttoptr i64 %t2484 to ptr
  %t2486 = call fastcc i64%t2485(i64 %t2481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2487 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2487)
  %t2488 = and i64 %t2487, -8
  %t2489 = inttoptr i64 %t2488 to ptr
  %t2490 = load i64, ptr %t2489
  %t2491 = inttoptr i64 %t2490 to ptr
  %t2492 = call i64 @rt_list_length(i64 %t2474)
  %t2493 = add i64 0, %t2492
  %t2494 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2474, i64 8)
  %t2506 = getelementptr i64, ptr %t2494, i64 0
  %t2498 = load i64, ptr %t2506
  %t2507 = getelementptr i64, ptr %t2494, i64 1
  %t2499 = load i64, ptr %t2507
  %t2508 = getelementptr i64, ptr %t2494, i64 2
  %t2500 = load i64, ptr %t2508
  %t2509 = getelementptr i64, ptr %t2494, i64 3
  %t2501 = load i64, ptr %t2509
  %t2510 = getelementptr i64, ptr %t2494, i64 4
  %t2502 = load i64, ptr %t2510
  %t2511 = getelementptr i64, ptr %t2494, i64 5
  %t2503 = load i64, ptr %t2511
  %t2512 = getelementptr i64, ptr %t2494, i64 6
  %t2504 = load i64, ptr %t2512
  %t2513 = getelementptr i64, ptr %t2494, i64 7
  %t2505 = load i64, ptr %t2513
  %t2495 = icmp sgt i64 %t2493, 8
  %t2496 = getelementptr i64, ptr %t2494, i64 8
  %t2497 = select i1 %t2495, ptr %t2496, ptr null
  %t2514 = musttail call fastcc i64 %t2491(i64 %t2487, i64 %t2493, i64 %t2498, i64 %t2499, i64 %t2500, i64 %t2501, i64 %t2502, i64 %t2503, i64 %t2504, i64 %t2505, ptr %t2497)
  ret i64 %t2514
}

define fastcc i64 @"min-entry:$scheme.base$ccode_629"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2515 = load i64, ptr @"scheme.base:*winds*"
  %t2516 = call i64 @rt_cdr(i64 %t2515)
  %t2517 = call i64 @rt_root(i64 %t2516)
  store i64 %t2517, ptr @"scheme.base:*winds*"
  %t2518 = and i64 %self, -8
  %t2519 = inttoptr i64 %t2518 to ptr
  %t2520 = getelementptr i64, ptr %t2519, i64 1
  %t2521 = load i64, ptr %t2520
  call void @rt_check_callable(i64 %t2521)
  %t2522 = and i64 %t2521, -8
  %t2523 = inttoptr i64 %t2522 to ptr
  %t2524 = load i64, ptr %t2523
  %t2525 = inttoptr i64 %t2524 to ptr
  %t2526 = call fastcc i64%t2525(i64 %t2521, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2527 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2527)
  %t2528 = and i64 %t2527, -8
  %t2529 = inttoptr i64 %t2528 to ptr
  %t2530 = load i64, ptr %t2529
  %t2531 = inttoptr i64 %t2530 to ptr
  %t2532 = call i64 @rt_list_length(i64 2)
  %t2533 = add i64 0, %t2532
  %t2534 = call ptr @rt_apply_argv(i64 0, ptr null, i64 2, i64 8)
  %t2546 = getelementptr i64, ptr %t2534, i64 0
  %t2538 = load i64, ptr %t2546
  %t2547 = getelementptr i64, ptr %t2534, i64 1
  %t2539 = load i64, ptr %t2547
  %t2548 = getelementptr i64, ptr %t2534, i64 2
  %t2540 = load i64, ptr %t2548
  %t2549 = getelementptr i64, ptr %t2534, i64 3
  %t2541 = load i64, ptr %t2549
  %t2550 = getelementptr i64, ptr %t2534, i64 4
  %t2542 = load i64, ptr %t2550
  %t2551 = getelementptr i64, ptr %t2534, i64 5
  %t2543 = load i64, ptr %t2551
  %t2552 = getelementptr i64, ptr %t2534, i64 6
  %t2544 = load i64, ptr %t2552
  %t2553 = getelementptr i64, ptr %t2534, i64 7
  %t2545 = load i64, ptr %t2553
  %t2535 = icmp sgt i64 %t2533, 8
  %t2536 = getelementptr i64, ptr %t2534, i64 8
  %t2537 = select i1 %t2535, ptr %t2536, ptr null
  %t2554 = musttail call fastcc i64 %t2531(i64 %t2527, i64 %t2533, i64 %t2538, i64 %t2539, i64 %t2540, i64 %t2541, i64 %t2542, i64 %t2543, i64 %t2544, i64 %t2545, ptr %t2537)
  ret i64 %t2554
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2555 = icmp eq i64 %argc, 3
  br i1 %t2555, label %argok617, label %arityerr616
arityerr616:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok617:
  call void @rt_check_callable(i64 %a0)
  %t2556 = and i64 %a0, -8
  %t2557 = inttoptr i64 %t2556 to ptr
  %t2558 = load i64, ptr %t2557
  %t2559 = inttoptr i64 %t2558 to ptr
  %t2560 = call fastcc i64%t2559(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2561 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2562 = load i64, ptr @"scheme.base:*winds*"
  %t2563 = call i64 @rt_cons(i64 %t2561, i64 %t2562)
  %t2564 = call i64 @rt_root(i64 %t2563)
  store i64 %t2564, ptr @"scheme.base:*winds*"
  %t2565 = call ptr @rt_alloc_words(i64 2)
  %t2566 = ptrtoint ptr %t2565 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_629" to i64), ptr %t2565
  %t2567 = getelementptr i64, ptr %t2565, i64 1
  store i64 %a2, ptr %t2567
  %t2568 = or i64 %t2566, 4
  %t2569 = load i64, ptr @"scheme.base:call-with-values"
  call void @rt_check_callable(i64 %t2569)
  %t2570 = and i64 %t2569, -8
  %t2571 = inttoptr i64 %t2570 to ptr
  %t2572 = load i64, ptr %t2571
  %t2573 = inttoptr i64 %t2572 to ptr
  %t2574 = musttail call fastcc i64 %t2573(i64 %t2569, i64 2, i64 %a1, i64 %t2568, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2574
}

define fastcc i64 @"scheme.base:code_638"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2579 = icmp sge i64 %argc, 0
  br i1 %t2579, label %argok619, label %arityerr618
arityerr618:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok619:
  %t2580 = call ptr @rt_alloc_words(i64 8)
  %t2581 = getelementptr i64, ptr %t2580, i64 0
  store i64 %a0, ptr %t2581
  %t2582 = getelementptr i64, ptr %t2580, i64 1
  store i64 %a1, ptr %t2582
  %t2583 = getelementptr i64, ptr %t2580, i64 2
  store i64 %a2, ptr %t2583
  %t2584 = getelementptr i64, ptr %t2580, i64 3
  store i64 %a3, ptr %t2584
  %t2585 = getelementptr i64, ptr %t2580, i64 4
  store i64 %a4, ptr %t2585
  %t2586 = getelementptr i64, ptr %t2580, i64 5
  store i64 %a5, ptr %t2586
  %t2587 = getelementptr i64, ptr %t2580, i64 6
  store i64 %a6, ptr %t2587
  %t2588 = getelementptr i64, ptr %t2580, i64 7
  store i64 %a7, ptr %t2588
  %t2589 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2580, ptr %overflow)
  %t2590 = and i64 %self, -8
  %t2591 = inttoptr i64 %t2590 to ptr
  %t2592 = getelementptr i64, ptr %t2591, i64 1
  %t2593 = load i64, ptr %t2592
  %t2594 = call i64 @rt_escape_live_p(i64 %t2593)
  %t2595 = icmp ne i64 %t2594, 1
  br i1 %t2595, label %then620, label %else621
then620:
  %t2596 = and i64 %self, -8
  %t2597 = inttoptr i64 %t2596 to ptr
  %t2598 = getelementptr i64, ptr %t2597, i64 2
  %t2599 = load i64, ptr %t2598
  %t2600 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2600)
  %t2601 = and i64 %t2600, -8
  %t2602 = inttoptr i64 %t2601 to ptr
  %t2603 = load i64, ptr %t2602
  %t2604 = inttoptr i64 %t2603 to ptr
  %t2605 = call fastcc i64%t2604(i64 %t2600, i64 1, i64 %t2599, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2606 = and i64 %self, -8
  %t2607 = inttoptr i64 %t2606 to ptr
  %t2608 = getelementptr i64, ptr %t2607, i64 1
  %t2609 = load i64, ptr %t2608
  %t2610 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2610)
  %t2611 = and i64 %t2610, -8
  %t2612 = inttoptr i64 %t2611 to ptr
  %t2613 = load i64, ptr %t2612
  %t2614 = inttoptr i64 %t2613 to ptr
  %t2615 = call i64 @rt_list_length(i64 %t2589)
  %t2616 = add i64 0, %t2615
  %t2617 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2589, i64 8)
  %t2629 = getelementptr i64, ptr %t2617, i64 0
  %t2621 = load i64, ptr %t2629
  %t2630 = getelementptr i64, ptr %t2617, i64 1
  %t2622 = load i64, ptr %t2630
  %t2631 = getelementptr i64, ptr %t2617, i64 2
  %t2623 = load i64, ptr %t2631
  %t2632 = getelementptr i64, ptr %t2617, i64 3
  %t2624 = load i64, ptr %t2632
  %t2633 = getelementptr i64, ptr %t2617, i64 4
  %t2625 = load i64, ptr %t2633
  %t2634 = getelementptr i64, ptr %t2617, i64 5
  %t2626 = load i64, ptr %t2634
  %t2635 = getelementptr i64, ptr %t2617, i64 6
  %t2627 = load i64, ptr %t2635
  %t2636 = getelementptr i64, ptr %t2617, i64 7
  %t2628 = load i64, ptr %t2636
  %t2618 = icmp sgt i64 %t2616, 8
  %t2619 = getelementptr i64, ptr %t2617, i64 8
  %t2620 = select i1 %t2618, ptr %t2619, ptr null
  %t2637 = call fastcc i64%t2614(i64 %t2610, i64 %t2616, i64 %t2621, i64 %t2622, i64 %t2623, i64 %t2624, i64 %t2625, i64 %t2626, i64 %t2627, i64 %t2628, ptr %t2620)
  %t2638 = call i64 @rt_escape_to(i64 %t2609, i64 %t2637)
  br label %merge622
else621:
  br label %merge622
merge622:
  %t2639 = phi i64 [ %t2638, %then620 ], [ 1, %else621 ]
  %t2640 = call i64 @rt_intern(ptr @.str.sym.17)
  %t2641 = call i64 @rt_make_string(ptr @.str.lit.18, i64 39)
  %t2642 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2642)
  %t2643 = and i64 %t2642, -8
  %t2644 = inttoptr i64 %t2643 to ptr
  %t2645 = load i64, ptr %t2644
  %t2646 = inttoptr i64 %t2645 to ptr
  %t2647 = musttail call fastcc i64 %t2646(i64 %t2642, i64 2, i64 %t2640, i64 %t2641, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2647
}

define fastcc i64 @"min-entry:$scheme.base$ccode_638"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2648 = and i64 %self, -8
  %t2649 = inttoptr i64 %t2648 to ptr
  %t2650 = getelementptr i64, ptr %t2649, i64 1
  %t2651 = load i64, ptr %t2650
  %t2652 = call i64 @rt_escape_live_p(i64 %t2651)
  %t2653 = icmp ne i64 %t2652, 1
  br i1 %t2653, label %then623, label %else624
then623:
  %t2654 = and i64 %self, -8
  %t2655 = inttoptr i64 %t2654 to ptr
  %t2656 = getelementptr i64, ptr %t2655, i64 2
  %t2657 = load i64, ptr %t2656
  %t2658 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2658)
  %t2659 = and i64 %t2658, -8
  %t2660 = inttoptr i64 %t2659 to ptr
  %t2661 = load i64, ptr %t2660
  %t2662 = inttoptr i64 %t2661 to ptr
  %t2663 = call fastcc i64%t2662(i64 %t2658, i64 1, i64 %t2657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2664 = and i64 %self, -8
  %t2665 = inttoptr i64 %t2664 to ptr
  %t2666 = getelementptr i64, ptr %t2665, i64 1
  %t2667 = load i64, ptr %t2666
  %t2668 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2668)
  %t2669 = and i64 %t2668, -8
  %t2670 = inttoptr i64 %t2669 to ptr
  %t2671 = load i64, ptr %t2670
  %t2672 = inttoptr i64 %t2671 to ptr
  %t2673 = call i64 @rt_list_length(i64 2)
  %t2674 = add i64 0, %t2673
  %t2675 = call ptr @rt_apply_argv(i64 0, ptr null, i64 2, i64 8)
  %t2687 = getelementptr i64, ptr %t2675, i64 0
  %t2679 = load i64, ptr %t2687
  %t2688 = getelementptr i64, ptr %t2675, i64 1
  %t2680 = load i64, ptr %t2688
  %t2689 = getelementptr i64, ptr %t2675, i64 2
  %t2681 = load i64, ptr %t2689
  %t2690 = getelementptr i64, ptr %t2675, i64 3
  %t2682 = load i64, ptr %t2690
  %t2691 = getelementptr i64, ptr %t2675, i64 4
  %t2683 = load i64, ptr %t2691
  %t2692 = getelementptr i64, ptr %t2675, i64 5
  %t2684 = load i64, ptr %t2692
  %t2693 = getelementptr i64, ptr %t2675, i64 6
  %t2685 = load i64, ptr %t2693
  %t2694 = getelementptr i64, ptr %t2675, i64 7
  %t2686 = load i64, ptr %t2694
  %t2676 = icmp sgt i64 %t2674, 8
  %t2677 = getelementptr i64, ptr %t2675, i64 8
  %t2678 = select i1 %t2676, ptr %t2677, ptr null
  %t2695 = call fastcc i64%t2672(i64 %t2668, i64 %t2674, i64 %t2679, i64 %t2680, i64 %t2681, i64 %t2682, i64 %t2683, i64 %t2684, i64 %t2685, i64 %t2686, ptr %t2678)
  %t2696 = call i64 @rt_escape_to(i64 %t2667, i64 %t2695)
  br label %merge625
else624:
  br label %merge625
merge625:
  %t2697 = phi i64 [ %t2696, %then623 ], [ 1, %else624 ]
  %t2698 = call i64 @rt_intern(ptr @.str.sym.17)
  %t2699 = call i64 @rt_make_string(ptr @.str.lit.19, i64 39)
  %t2700 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2700)
  %t2701 = and i64 %t2700, -8
  %t2702 = inttoptr i64 %t2701 to ptr
  %t2703 = load i64, ptr %t2702
  %t2704 = inttoptr i64 %t2703 to ptr
  %t2705 = musttail call fastcc i64 %t2704(i64 %t2700, i64 2, i64 %t2698, i64 %t2699, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2705
}

define fastcc i64 @"scheme.base:code_636"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2706 = icmp eq i64 %argc, 0
  br i1 %t2706, label %argok627, label %arityerr626
arityerr626:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok627:
  %t2707 = call i64 @rt_escape_frame()
  %t2708 = and i64 %self, -8
  %t2709 = inttoptr i64 %t2708 to ptr
  %t2710 = getelementptr i64, ptr %t2709, i64 2
  %t2711 = load i64, ptr %t2710
  %t2712 = call ptr @rt_alloc_words(i64 3)
  %t2713 = ptrtoint ptr %t2712 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_638" to i64), ptr %t2712
  %t2714 = getelementptr i64, ptr %t2712, i64 1
  store i64 %t2707, ptr %t2714
  %t2715 = getelementptr i64, ptr %t2712, i64 2
  store i64 %t2711, ptr %t2715
  %t2716 = or i64 %t2713, 4
  %t2717 = and i64 %self, -8
  %t2718 = inttoptr i64 %t2717 to ptr
  %t2719 = getelementptr i64, ptr %t2718, i64 1
  %t2720 = load i64, ptr %t2719
  call void @rt_check_callable(i64 %t2720)
  %t2721 = and i64 %t2720, -8
  %t2722 = inttoptr i64 %t2721 to ptr
  %t2723 = load i64, ptr %t2722
  %t2724 = inttoptr i64 %t2723 to ptr
  %t2725 = musttail call fastcc i64 %t2724(i64 %t2720, i64 1, i64 %t2716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2725
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2726 = icmp eq i64 %argc, 1
  br i1 %t2726, label %argok629, label %arityerr628
arityerr628:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok629:
  %t2727 = load i64, ptr @"scheme.base:*winds*"
  %t2728 = call ptr @rt_alloc_words(i64 3)
  %t2729 = ptrtoint ptr %t2728 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_636" to i64), ptr %t2728
  %t2730 = getelementptr i64, ptr %t2728, i64 1
  store i64 %a0, ptr %t2730
  %t2731 = getelementptr i64, ptr %t2728, i64 2
  store i64 %t2727, ptr %t2731
  %t2732 = or i64 %t2729, 4
  %t2733 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2732)
  %t2734 = call i64 @rt_cdr(i64 %t2733)
  ret i64 %t2734
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2739 = icmp eq i64 %argc, 1
  br i1 %t2739, label %argok631, label %arityerr630
arityerr630:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok631:
  %t2740 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2740)
  %t2741 = and i64 %t2740, -8
  %t2742 = inttoptr i64 %t2741 to ptr
  %t2743 = load i64, ptr %t2742
  %t2744 = inttoptr i64 %t2743 to ptr
  %t2745 = musttail call fastcc i64 %t2744(i64 %t2740, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2745
}

define fastcc i64 @"scheme.base:code_646"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2750 = icmp eq i64 %argc, 0
  br i1 %t2750, label %argok633, label %arityerr632
arityerr632:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok633:
  %t2751 = and i64 %self, -8
  %t2752 = inttoptr i64 %t2751 to ptr
  %t2753 = getelementptr i64, ptr %t2752, i64 1
  %t2754 = load i64, ptr %t2753
  %t2755 = and i64 %self, -8
  %t2756 = inttoptr i64 %t2755 to ptr
  %t2757 = getelementptr i64, ptr %t2756, i64 2
  %t2758 = load i64, ptr %t2757
  %t2759 = call i64 @rt_cons(i64 %t2754, i64 %t2758)
  %t2760 = call i64 @rt_root(i64 %t2759)
  store i64 %t2760, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_648"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2761 = icmp eq i64 %argc, 0
  br i1 %t2761, label %argok635, label %arityerr634
arityerr634:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok635:
  %t2762 = and i64 %self, -8
  %t2763 = inttoptr i64 %t2762 to ptr
  %t2764 = getelementptr i64, ptr %t2763, i64 1
  %t2765 = load i64, ptr %t2764
  %t2766 = call i64 @rt_root(i64 %t2765)
  store i64 %t2766, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2767 = icmp eq i64 %argc, 2
  br i1 %t2767, label %argok637, label %arityerr636
arityerr636:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok637:
  %t2768 = load i64, ptr @"scheme.base:*handlers*"
  %t2769 = call ptr @rt_alloc_words(i64 3)
  %t2770 = ptrtoint ptr %t2769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_646" to i64), ptr %t2769
  %t2771 = getelementptr i64, ptr %t2769, i64 1
  store i64 %a0, ptr %t2771
  %t2772 = getelementptr i64, ptr %t2769, i64 2
  store i64 %t2768, ptr %t2772
  %t2773 = or i64 %t2770, 4
  %t2774 = call ptr @rt_alloc_words(i64 2)
  %t2775 = ptrtoint ptr %t2774 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_648" to i64), ptr %t2774
  %t2776 = getelementptr i64, ptr %t2774, i64 1
  store i64 %t2768, ptr %t2776
  %t2777 = or i64 %t2775, 4
  %t2778 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2778)
  %t2779 = and i64 %t2778, -8
  %t2780 = inttoptr i64 %t2779 to ptr
  %t2781 = load i64, ptr %t2780
  %t2782 = inttoptr i64 %t2781 to ptr
  %t2783 = musttail call fastcc i64 %t2782(i64 %t2778, i64 3, i64 %t2773, i64 %a1, i64 %t2777, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2783
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2788 = icmp eq i64 %argc, 1
  br i1 %t2788, label %argok639, label %arityerr638
arityerr638:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok639:
  %t2789 = load i64, ptr @"scheme.base:*handlers*"
  %t2790 = call i64 @rt_null_p(i64 %t2789)
  %t2791 = icmp ne i64 %t2790, 1
  br i1 %t2791, label %then640, label %else641
then640:
  %t2792 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2792
else641:
  %t2793 = load i64, ptr @"scheme.base:*handlers*"
  %t2794 = call i64 @rt_car(i64 %t2793)
  %t2795 = load i64, ptr @"scheme.base:*handlers*"
  %t2796 = load i64, ptr @"scheme.base:*handlers*"
  %t2797 = call i64 @rt_cdr(i64 %t2796)
  %t2798 = call i64 @rt_root(i64 %t2797)
  store i64 %t2798, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2794)
  %t2799 = and i64 %t2794, -8
  %t2800 = inttoptr i64 %t2799 to ptr
  %t2801 = load i64, ptr %t2800
  %t2802 = inttoptr i64 %t2801 to ptr
  %t2803 = call fastcc i64%t2802(i64 %t2794, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2804 = call i64 @rt_root(i64 %t2795)
  store i64 %t2804, ptr @"scheme.base:*handlers*"
  %t2805 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2805
}

define fastcc i64 @"scheme.base:code_658"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2810 = icmp eq i64 %argc, 0
  br i1 %t2810, label %argok643, label %arityerr642
arityerr642:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok643:
  %t2811 = and i64 %self, -8
  %t2812 = inttoptr i64 %t2811 to ptr
  %t2813 = getelementptr i64, ptr %t2812, i64 1
  %t2814 = load i64, ptr %t2813
  %t2815 = call i64 @rt_cdr(i64 %t2814)
  %t2816 = call i64 @rt_root(i64 %t2815)
  store i64 %t2816, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_660"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2817 = icmp eq i64 %argc, 0
  br i1 %t2817, label %argok645, label %arityerr644
arityerr644:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok645:
  %t2818 = and i64 %self, -8
  %t2819 = inttoptr i64 %t2818 to ptr
  %t2820 = getelementptr i64, ptr %t2819, i64 2
  %t2821 = load i64, ptr %t2820
  %t2822 = and i64 %self, -8
  %t2823 = inttoptr i64 %t2822 to ptr
  %t2824 = getelementptr i64, ptr %t2823, i64 1
  %t2825 = load i64, ptr %t2824
  call void @rt_check_callable(i64 %t2825)
  %t2826 = and i64 %t2825, -8
  %t2827 = inttoptr i64 %t2826 to ptr
  %t2828 = load i64, ptr %t2827
  %t2829 = inttoptr i64 %t2828 to ptr
  %t2830 = musttail call fastcc i64 %t2829(i64 %t2825, i64 1, i64 %t2821, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2830
}

define fastcc i64 @"scheme.base:code_662"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2831 = icmp eq i64 %argc, 0
  br i1 %t2831, label %argok647, label %arityerr646
arityerr646:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok647:
  %t2832 = and i64 %self, -8
  %t2833 = inttoptr i64 %t2832 to ptr
  %t2834 = getelementptr i64, ptr %t2833, i64 1
  %t2835 = load i64, ptr %t2834
  %t2836 = call i64 @rt_root(i64 %t2835)
  store i64 %t2836, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:raise-continuable"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2837 = icmp eq i64 %argc, 1
  br i1 %t2837, label %argok649, label %arityerr648
arityerr648:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok649:
  %t2838 = load i64, ptr @"scheme.base:*handlers*"
  %t2839 = call i64 @rt_null_p(i64 %t2838)
  %t2840 = icmp ne i64 %t2839, 1
  br i1 %t2840, label %then650, label %else651
then650:
  %t2841 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2841
else651:
  %t2842 = load i64, ptr @"scheme.base:*handlers*"
  %t2843 = call i64 @rt_car(i64 %t2842)
  %t2844 = load i64, ptr @"scheme.base:*handlers*"
  %t2845 = call ptr @rt_alloc_words(i64 2)
  %t2846 = ptrtoint ptr %t2845 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_658" to i64), ptr %t2845
  %t2847 = getelementptr i64, ptr %t2845, i64 1
  store i64 %t2844, ptr %t2847
  %t2848 = or i64 %t2846, 4
  %t2849 = call ptr @rt_alloc_words(i64 3)
  %t2850 = ptrtoint ptr %t2849 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_660" to i64), ptr %t2849
  %t2851 = getelementptr i64, ptr %t2849, i64 1
  store i64 %t2843, ptr %t2851
  %t2852 = getelementptr i64, ptr %t2849, i64 2
  store i64 %a0, ptr %t2852
  %t2853 = or i64 %t2850, 4
  %t2854 = call ptr @rt_alloc_words(i64 2)
  %t2855 = ptrtoint ptr %t2854 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_662" to i64), ptr %t2854
  %t2856 = getelementptr i64, ptr %t2854, i64 1
  store i64 %t2844, ptr %t2856
  %t2857 = or i64 %t2855, 4
  %t2858 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2858)
  %t2859 = and i64 %t2858, -8
  %t2860 = inttoptr i64 %t2859 to ptr
  %t2861 = load i64, ptr %t2860
  %t2862 = inttoptr i64 %t2861 to ptr
  %t2863 = musttail call fastcc i64 %t2862(i64 %t2858, i64 3, i64 %t2848, i64 %t2853, i64 %t2857, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2863
}

define fastcc i64 @"scheme.base:code:features"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2868 = icmp eq i64 %argc, 0
  br i1 %t2868, label %argok653, label %arityerr652
arityerr652:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok653:
  %t2869 = call i64 @rt_cons(i64 17, i64 17)
  %t2870 = call i64 @rt_intern(ptr @.str.sym.20)
  %t2871 = call i64 @rt_set_car(i64 %t2869, i64 %t2870)
  %t2872 = call i64 @rt_cons(i64 17, i64 17)
  %t2873 = call i64 @rt_intern(ptr @.str.sym.21)
  %t2874 = call i64 @rt_set_car(i64 %t2872, i64 %t2873)
  %t2875 = call i64 @rt_cons(i64 17, i64 17)
  %t2876 = call i64 @rt_intern(ptr @.str.sym.22)
  %t2877 = call i64 @rt_set_car(i64 %t2875, i64 %t2876)
  %t2878 = call i64 @rt_cons(i64 17, i64 17)
  %t2879 = call i64 @rt_intern(ptr @.str.sym.23)
  %t2880 = call i64 @rt_set_car(i64 %t2878, i64 %t2879)
  %t2881 = call i64 @rt_cons(i64 17, i64 17)
  %t2882 = call i64 @rt_intern(ptr @.str.sym.24)
  %t2883 = call i64 @rt_set_car(i64 %t2881, i64 %t2882)
  %t2884 = call i64 @rt_cons(i64 17, i64 17)
  %t2885 = call i64 @rt_intern(ptr @.str.sym.25)
  %t2886 = call i64 @rt_set_car(i64 %t2884, i64 %t2885)
  %t2887 = call i64 @rt_cons(i64 17, i64 17)
  %t2888 = call i64 @rt_intern(ptr @.str.sym.26)
  %t2889 = call i64 @rt_set_car(i64 %t2887, i64 %t2888)
  %t2890 = call i64 @rt_cons(i64 17, i64 17)
  %t2891 = call i64 @rt_intern(ptr @.str.sym.27)
  %t2892 = call i64 @rt_set_car(i64 %t2890, i64 %t2891)
  %t2893 = call i64 @rt_cons(i64 17, i64 17)
  %t2894 = call i64 @rt_intern(ptr @.str.sym.28)
  %t2895 = call i64 @rt_set_car(i64 %t2893, i64 %t2894)
  %t2896 = call i64 @rt_cons(i64 17, i64 17)
  %t2897 = call i64 @rt_intern(ptr @.str.sym.29)
  %t2898 = call i64 @rt_set_car(i64 %t2896, i64 %t2897)
  %t2899 = call i64 @rt_cons(i64 17, i64 17)
  %t2900 = call i64 @rt_intern(ptr @.str.sym.30)
  %t2901 = call i64 @rt_set_car(i64 %t2899, i64 %t2900)
  %t2902 = call i64 @rt_cons(i64 17, i64 17)
  %t2903 = call i64 @rt_intern(ptr @.str.sym.31)
  %t2904 = call i64 @rt_set_car(i64 %t2902, i64 %t2903)
  %t2905 = call i64 @rt_set_cdr(i64 %t2902, i64 2)
  %t2906 = call i64 @rt_set_cdr(i64 %t2899, i64 %t2902)
  %t2907 = call i64 @rt_set_cdr(i64 %t2896, i64 %t2899)
  %t2908 = call i64 @rt_set_cdr(i64 %t2893, i64 %t2896)
  %t2909 = call i64 @rt_set_cdr(i64 %t2890, i64 %t2893)
  %t2910 = call i64 @rt_set_cdr(i64 %t2887, i64 %t2890)
  %t2911 = call i64 @rt_set_cdr(i64 %t2884, i64 %t2887)
  %t2912 = call i64 @rt_set_cdr(i64 %t2881, i64 %t2884)
  %t2913 = call i64 @rt_set_cdr(i64 %t2878, i64 %t2881)
  %t2914 = call i64 @rt_set_cdr(i64 %t2875, i64 %t2878)
  %t2915 = call i64 @rt_set_cdr(i64 %t2872, i64 %t2875)
  %t2916 = call i64 @rt_set_cdr(i64 %t2869, i64 %t2872)
  %t2917 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t2917)
  %t2918 = and i64 %t2917, -8
  %t2919 = inttoptr i64 %t2918 to ptr
  %t2920 = load i64, ptr %t2919
  %t2921 = inttoptr i64 %t2920 to ptr
  %t2922 = musttail call fastcc i64 %t2921(i64 %t2917, i64 1, i64 %t2869, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2922
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2927 = icmp eq i64 %argc, 1
  br i1 %t2927, label %argok655, label %arityerr654
arityerr654:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok655:
  %t2928 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2928
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2933 = icmp eq i64 %argc, 1
  br i1 %t2933, label %argok657, label %arityerr656
arityerr656:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok657:
  %t2934 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2934
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2939 = icmp eq i64 %argc, 1
  br i1 %t2939, label %argok659, label %arityerr658
arityerr658:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok659:
  %t2940 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2940
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2945 = icmp eq i64 %argc, 1
  br i1 %t2945, label %argok661, label %arityerr660
arityerr660:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok661:
  %t2946 = call i64 @rt_error_object_p(i64 %a0)
  %t2947 = icmp ne i64 %t2946, 1
  br i1 %t2947, label %then662, label %else663
then662:
  %t2948 = call i64 @rt_error_object_kind(i64 %a0)
  %t2949 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2950 = call i64 @rt_eq_p(i64 %t2948, i64 %t2949)
  ret i64 %t2950
else663:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2955 = icmp eq i64 %argc, 1
  br i1 %t2955, label %argok665, label %arityerr664
arityerr664:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok665:
  %t2956 = call i64 @rt_error_object_p(i64 %a0)
  %t2957 = icmp ne i64 %t2956, 1
  br i1 %t2957, label %then666, label %else667
then666:
  %t2958 = call i64 @rt_error_object_kind(i64 %a0)
  %t2959 = call i64 @rt_intern(ptr @.str.sym.32)
  %t2960 = call i64 @rt_eq_p(i64 %t2958, i64 %t2959)
  ret i64 %t2960
else667:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_687"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2965 = icmp eq i64 %argc, 1
  br i1 %t2965, label %argok669, label %arityerr668
arityerr668:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok669:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_689"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2966 = icmp eq i64 %argc, 1
  br i1 %t2966, label %argok671, label %arityerr670
arityerr670:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok671:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_691"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2967 = icmp sge i64 %argc, 0
  br i1 %t2967, label %argok673, label %arityerr672
arityerr672:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok673:
  %t2968 = call ptr @rt_alloc_words(i64 8)
  %t2969 = getelementptr i64, ptr %t2968, i64 0
  store i64 %a0, ptr %t2969
  %t2970 = getelementptr i64, ptr %t2968, i64 1
  store i64 %a1, ptr %t2970
  %t2971 = getelementptr i64, ptr %t2968, i64 2
  store i64 %a2, ptr %t2971
  %t2972 = getelementptr i64, ptr %t2968, i64 3
  store i64 %a3, ptr %t2972
  %t2973 = getelementptr i64, ptr %t2968, i64 4
  store i64 %a4, ptr %t2973
  %t2974 = getelementptr i64, ptr %t2968, i64 5
  store i64 %a5, ptr %t2974
  %t2975 = getelementptr i64, ptr %t2968, i64 6
  store i64 %a6, ptr %t2975
  %t2976 = getelementptr i64, ptr %t2968, i64 7
  store i64 %a7, ptr %t2976
  %t2977 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2968, ptr %overflow)
  %t2978 = call i64 @rt_null_p(i64 %t2977)
  %t2979 = icmp ne i64 %t2978, 1
  br i1 %t2979, label %then674, label %else675
then674:
  %t2980 = and i64 %self, -8
  %t2981 = inttoptr i64 %t2980 to ptr
  %t2982 = getelementptr i64, ptr %t2981, i64 1
  %t2983 = load i64, ptr %t2982
  %t2984 = call i64 @rt_vector_ref(i64 %t2983, i64 0)
  ret i64 %t2984
else675:
  %t2985 = call i64 @rt_cdr(i64 %t2977)
  %t2986 = call i64 @rt_null_p(i64 %t2985)
  %t2987 = icmp ne i64 %t2986, 1
  br i1 %t2987, label %then676, label %else677
then676:
  %t2988 = and i64 %self, -8
  %t2989 = inttoptr i64 %t2988 to ptr
  %t2990 = getelementptr i64, ptr %t2989, i64 1
  %t2991 = load i64, ptr %t2990
  %t2992 = call i64 @rt_car(i64 %t2977)
  %t2993 = and i64 %self, -8
  %t2994 = inttoptr i64 %t2993 to ptr
  %t2995 = getelementptr i64, ptr %t2994, i64 2
  %t2996 = load i64, ptr %t2995
  call void @rt_check_callable(i64 %t2996)
  %t2997 = and i64 %t2996, -8
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = load i64, ptr %t2998
  %t3000 = inttoptr i64 %t2999 to ptr
  %t3001 = call fastcc i64%t3000(i64 %t2996, i64 1, i64 %t2992, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3002 = call i64 @rt_vector_set(i64 %t2991, i64 0, i64 %t3001)
  ret i64 %t3002
else677:
  %t3003 = and i64 %self, -8
  %t3004 = inttoptr i64 %t3003 to ptr
  %t3005 = getelementptr i64, ptr %t3004, i64 1
  %t3006 = load i64, ptr %t3005
  %t3007 = call i64 @rt_car(i64 %t2977)
  %t3008 = call i64 @rt_vector_set(i64 %t3006, i64 0, i64 %t3007)
  ret i64 %t3008
}

define fastcc i64 @"min-entry:$scheme.base$ccode_691"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3009 = call i64 @rt_null_p(i64 2)
  %t3010 = icmp ne i64 %t3009, 1
  br i1 %t3010, label %then678, label %else679
then678:
  %t3011 = and i64 %self, -8
  %t3012 = inttoptr i64 %t3011 to ptr
  %t3013 = getelementptr i64, ptr %t3012, i64 1
  %t3014 = load i64, ptr %t3013
  %t3015 = call i64 @rt_vector_ref(i64 %t3014, i64 0)
  ret i64 %t3015
else679:
  %t3016 = call i64 @rt_cdr(i64 2)
  %t3017 = call i64 @rt_null_p(i64 %t3016)
  %t3018 = icmp ne i64 %t3017, 1
  br i1 %t3018, label %then680, label %else681
then680:
  %t3019 = and i64 %self, -8
  %t3020 = inttoptr i64 %t3019 to ptr
  %t3021 = getelementptr i64, ptr %t3020, i64 1
  %t3022 = load i64, ptr %t3021
  %t3023 = call i64 @rt_car(i64 2)
  %t3024 = and i64 %self, -8
  %t3025 = inttoptr i64 %t3024 to ptr
  %t3026 = getelementptr i64, ptr %t3025, i64 2
  %t3027 = load i64, ptr %t3026
  call void @rt_check_callable(i64 %t3027)
  %t3028 = and i64 %t3027, -8
  %t3029 = inttoptr i64 %t3028 to ptr
  %t3030 = load i64, ptr %t3029
  %t3031 = inttoptr i64 %t3030 to ptr
  %t3032 = call fastcc i64%t3031(i64 %t3027, i64 1, i64 %t3023, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3033 = call i64 @rt_vector_set(i64 %t3022, i64 0, i64 %t3032)
  ret i64 %t3033
else681:
  %t3034 = and i64 %self, -8
  %t3035 = inttoptr i64 %t3034 to ptr
  %t3036 = getelementptr i64, ptr %t3035, i64 1
  %t3037 = load i64, ptr %t3036
  %t3038 = call i64 @rt_car(i64 2)
  %t3039 = call i64 @rt_vector_set(i64 %t3037, i64 0, i64 %t3038)
  ret i64 %t3039
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3040 = icmp sge i64 %argc, 1
  br i1 %t3040, label %argok683, label %arityerr682
arityerr682:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok683:
  %t3041 = call ptr @rt_alloc_words(i64 8)
  %t3042 = getelementptr i64, ptr %t3041, i64 0
  store i64 %a0, ptr %t3042
  %t3043 = getelementptr i64, ptr %t3041, i64 1
  store i64 %a1, ptr %t3043
  %t3044 = getelementptr i64, ptr %t3041, i64 2
  store i64 %a2, ptr %t3044
  %t3045 = getelementptr i64, ptr %t3041, i64 3
  store i64 %a3, ptr %t3045
  %t3046 = getelementptr i64, ptr %t3041, i64 4
  store i64 %a4, ptr %t3046
  %t3047 = getelementptr i64, ptr %t3041, i64 5
  store i64 %a5, ptr %t3047
  %t3048 = getelementptr i64, ptr %t3041, i64 6
  store i64 %a6, ptr %t3048
  %t3049 = getelementptr i64, ptr %t3041, i64 7
  store i64 %a7, ptr %t3049
  %t3050 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3041, ptr %overflow)
  %t3051 = call i64 @rt_null_p(i64 %t3050)
  %t3052 = icmp ne i64 %t3051, 1
  br i1 %t3052, label %then684, label %else685
then684:
  %t3053 = call ptr @rt_alloc_words(i64 1)
  %t3054 = ptrtoint ptr %t3053 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_687" to i64), ptr %t3053
  %t3055 = or i64 %t3054, 4
  br label %merge686
else685:
  %t3056 = call i64 @rt_car(i64 %t3050)
  br label %merge686
merge686:
  %t3057 = phi i64 [ %t3055, %then684 ], [ %t3056, %else685 ]
  %t3058 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3059 = call i64 @rt_null_p(i64 %t3050)
  %t3060 = icmp ne i64 %t3059, 1
  br i1 %t3060, label %then687, label %else688
then687:
  %t3061 = call ptr @rt_alloc_words(i64 1)
  %t3062 = ptrtoint ptr %t3061 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_689" to i64), ptr %t3061
  %t3063 = or i64 %t3062, 4
  br label %merge689
else688:
  %t3064 = call i64 @rt_car(i64 %t3050)
  br label %merge689
merge689:
  %t3065 = phi i64 [ %t3063, %then687 ], [ %t3064, %else688 ]
  call void @rt_check_callable(i64 %t3065)
  %t3066 = and i64 %t3065, -8
  %t3067 = inttoptr i64 %t3066 to ptr
  %t3068 = load i64, ptr %t3067
  %t3069 = inttoptr i64 %t3068 to ptr
  %t3070 = call fastcc i64%t3069(i64 %t3065, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3071 = call i64 @rt_vector_set(i64 %t3058, i64 0, i64 %t3070)
  %t3072 = call ptr @rt_alloc_words(i64 3)
  %t3073 = ptrtoint ptr %t3072 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_691" to i64), ptr %t3072
  %t3074 = getelementptr i64, ptr %t3072, i64 1
  store i64 %t3058, ptr %t3074
  %t3075 = getelementptr i64, ptr %t3072, i64 2
  store i64 %t3057, ptr %t3075
  %t3076 = or i64 %t3073, 4
  ret i64 %t3076
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmake-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3077 = call i64 @rt_null_p(i64 2)
  %t3078 = icmp ne i64 %t3077, 1
  br i1 %t3078, label %then690, label %else691
then690:
  %t3079 = call ptr @rt_alloc_words(i64 1)
  %t3080 = ptrtoint ptr %t3079 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_687" to i64), ptr %t3079
  %t3081 = or i64 %t3080, 4
  br label %merge692
else691:
  %t3082 = call i64 @rt_car(i64 2)
  br label %merge692
merge692:
  %t3083 = phi i64 [ %t3081, %then690 ], [ %t3082, %else691 ]
  %t3084 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3085 = call i64 @rt_null_p(i64 2)
  %t3086 = icmp ne i64 %t3085, 1
  br i1 %t3086, label %then693, label %else694
then693:
  %t3087 = call ptr @rt_alloc_words(i64 1)
  %t3088 = ptrtoint ptr %t3087 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_689" to i64), ptr %t3087
  %t3089 = or i64 %t3088, 4
  br label %merge695
else694:
  %t3090 = call i64 @rt_car(i64 2)
  br label %merge695
merge695:
  %t3091 = phi i64 [ %t3089, %then693 ], [ %t3090, %else694 ]
  call void @rt_check_callable(i64 %t3091)
  %t3092 = and i64 %t3091, -8
  %t3093 = inttoptr i64 %t3092 to ptr
  %t3094 = load i64, ptr %t3093
  %t3095 = inttoptr i64 %t3094 to ptr
  %t3096 = call fastcc i64%t3095(i64 %t3091, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3097 = call i64 @rt_vector_set(i64 %t3084, i64 0, i64 %t3096)
  %t3098 = call ptr @rt_alloc_words(i64 3)
  %t3099 = ptrtoint ptr %t3098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_691" to i64), ptr %t3098
  %t3100 = getelementptr i64, ptr %t3098, i64 1
  store i64 %t3084, ptr %t3100
  %t3101 = getelementptr i64, ptr %t3098, i64 2
  store i64 %t3083, ptr %t3101
  %t3102 = or i64 %t3099, 4
  ret i64 %t3102
}

define fastcc i64 @"scheme.base:code_703"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3107 = icmp eq i64 %argc, 1
  br i1 %t3107, label %argok697, label %arityerr696
arityerr696:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok697:
  call void @rt_check_callable(i64 %a0)
  %t3108 = and i64 %a0, -8
  %t3109 = inttoptr i64 %t3108 to ptr
  %t3110 = load i64, ptr %t3109
  %t3111 = inttoptr i64 %t3110 to ptr
  %t3112 = musttail call fastcc i64 %t3111(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3112
}

define fastcc i64 @"scheme.base:code_707"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3113 = icmp eq i64 %argc, 2
  br i1 %t3113, label %argok699, label %arityerr698
arityerr698:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok699:
  call void @rt_check_callable(i64 %a0)
  %t3114 = and i64 %a0, -8
  %t3115 = inttoptr i64 %t3114 to ptr
  %t3116 = load i64, ptr %t3115
  %t3117 = inttoptr i64 %t3116 to ptr
  %t3118 = musttail call fastcc i64 %t3117(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3118
}

define fastcc i64 @"scheme.base:code_705"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3119 = icmp eq i64 %argc, 0
  br i1 %t3119, label %argok701, label %arityerr700
arityerr700:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok701:
  %t3120 = call ptr @rt_alloc_words(i64 1)
  %t3121 = ptrtoint ptr %t3120 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_707" to i64), ptr %t3120
  %t3122 = or i64 %t3121, 4
  %t3123 = and i64 %self, -8
  %t3124 = inttoptr i64 %t3123 to ptr
  %t3125 = getelementptr i64, ptr %t3124, i64 1
  %t3126 = load i64, ptr %t3125
  %t3127 = and i64 %self, -8
  %t3128 = inttoptr i64 %t3127 to ptr
  %t3129 = getelementptr i64, ptr %t3128, i64 2
  %t3130 = load i64, ptr %t3129
  %t3131 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3131)
  %t3132 = and i64 %t3131, -8
  %t3133 = inttoptr i64 %t3132 to ptr
  %t3134 = load i64, ptr %t3133
  %t3135 = inttoptr i64 %t3134 to ptr
  %t3136 = musttail call fastcc i64 %t3135(i64 %t3131, i64 3, i64 %t3122, i64 %t3126, i64 %t3130, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3136
}

define fastcc i64 @"scheme.base:code_711"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3137 = icmp eq i64 %argc, 2
  br i1 %t3137, label %argok703, label %arityerr702
arityerr702:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok703:
  call void @rt_check_callable(i64 %a0)
  %t3138 = and i64 %a0, -8
  %t3139 = inttoptr i64 %t3138 to ptr
  %t3140 = load i64, ptr %t3139
  %t3141 = inttoptr i64 %t3140 to ptr
  %t3142 = musttail call fastcc i64 %t3141(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3142
}

define fastcc i64 @"scheme.base:code_709"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3143 = icmp eq i64 %argc, 0
  br i1 %t3143, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok705:
  %t3144 = call ptr @rt_alloc_words(i64 1)
  %t3145 = ptrtoint ptr %t3144 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_711" to i64), ptr %t3144
  %t3146 = or i64 %t3145, 4
  %t3147 = and i64 %self, -8
  %t3148 = inttoptr i64 %t3147 to ptr
  %t3149 = getelementptr i64, ptr %t3148, i64 1
  %t3150 = load i64, ptr %t3149
  %t3151 = and i64 %self, -8
  %t3152 = inttoptr i64 %t3151 to ptr
  %t3153 = getelementptr i64, ptr %t3152, i64 2
  %t3154 = load i64, ptr %t3153
  %t3155 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3155)
  %t3156 = and i64 %t3155, -8
  %t3157 = inttoptr i64 %t3156 to ptr
  %t3158 = load i64, ptr %t3157
  %t3159 = inttoptr i64 %t3158 to ptr
  %t3160 = musttail call fastcc i64 %t3159(i64 %t3155, i64 3, i64 %t3146, i64 %t3150, i64 %t3154, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3160
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3161 = icmp eq i64 %argc, 3
  br i1 %t3161, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok707:
  %t3162 = call ptr @rt_alloc_words(i64 1)
  %t3163 = ptrtoint ptr %t3162 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_703" to i64), ptr %t3162
  %t3164 = or i64 %t3163, 4
  %t3165 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t3165)
  %t3166 = and i64 %t3165, -8
  %t3167 = inttoptr i64 %t3166 to ptr
  %t3168 = load i64, ptr %t3167
  %t3169 = inttoptr i64 %t3168 to ptr
  %t3170 = call fastcc i64%t3169(i64 %t3165, i64 2, i64 %t3164, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3171 = call ptr @rt_alloc_words(i64 3)
  %t3172 = ptrtoint ptr %t3171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_705" to i64), ptr %t3171
  %t3173 = getelementptr i64, ptr %t3171, i64 1
  store i64 %a0, ptr %t3173
  %t3174 = getelementptr i64, ptr %t3171, i64 2
  store i64 %a1, ptr %t3174
  %t3175 = or i64 %t3172, 4
  %t3176 = call ptr @rt_alloc_words(i64 3)
  %t3177 = ptrtoint ptr %t3176 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_709" to i64), ptr %t3176
  %t3178 = getelementptr i64, ptr %t3176, i64 1
  store i64 %a0, ptr %t3178
  %t3179 = getelementptr i64, ptr %t3176, i64 2
  store i64 %t3170, ptr %t3179
  %t3180 = or i64 %t3177, 4
  %t3181 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t3181)
  %t3182 = and i64 %t3181, -8
  %t3183 = inttoptr i64 %t3182 to ptr
  %t3184 = load i64, ptr %t3183
  %t3185 = inttoptr i64 %t3184 to ptr
  %t3186 = musttail call fastcc i64 %t3185(i64 %t3181, i64 3, i64 %t3175, i64 %a2, i64 %t3180, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3186
}

define fastcc i64 @"scheme.base:code_719"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3191 = icmp eq i64 %argc, 2
  br i1 %t3191, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok709:
  %t3192 = call i64 @rt_null_p(i64 %a0)
  %t3193 = icmp ne i64 %t3192, 1
  br i1 %t3193, label %then710, label %else711
then710:
  %t3194 = and i64 %self, -8
  %t3195 = inttoptr i64 %t3194 to ptr
  %t3196 = getelementptr i64, ptr %t3195, i64 1
  %t3197 = load i64, ptr %t3196
  ret i64 %t3197
else711:
  %t3198 = and i64 %self, -8
  %t3199 = inttoptr i64 %t3198 to ptr
  %t3200 = getelementptr i64, ptr %t3199, i64 1
  %t3201 = load i64, ptr %t3200
  %t3202 = call i64 @rt_car(i64 %a0)
  %t3203 = call i64 @rt_vector_set(i64 %t3201, i64 %a1, i64 %t3202)
  %t3204 = call i64 @rt_cdr(i64 %a0)
  %t3205 = or i64 %a1, 8
  %t3206 = and i64 %t3205, 7
  %t3207 = icmp eq i64 %t3206, 0
  br i1 %t3207, label %fixfast712, label %fixslow713
fixfast712:
  %t3208 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3209 = extractvalue {i64, i1} %t3208, 0
  %t3210 = extractvalue {i64, i1} %t3208, 1
  br i1 %t3210, label %fixslow713, label %fixmerge714
fixslow713:
  %t3211 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge714
fixmerge714:
  %t3212 = phi i64 [ %t3209, %fixfast712 ], [ %t3211, %fixslow713 ]
  %t3213 = musttail call fastcc i64 @"scheme.base:code_719"(i64 %self, i64 2, i64 %t3204, i64 %t3212, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3213
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3214 = icmp eq i64 %argc, 1
  br i1 %t3214, label %argok716, label %arityerr715
arityerr715:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok716:
  %t3215 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3215)
  %t3216 = and i64 %t3215, -8
  %t3217 = inttoptr i64 %t3216 to ptr
  %t3218 = load i64, ptr %t3217
  %t3219 = inttoptr i64 %t3218 to ptr
  %t3220 = call fastcc i64%t3219(i64 %t3215, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3221 = call i64 @rt_make_vector(i64 %t3220, i64 0)
  %t3222 = call ptr @rt_alloc_words(i64 3)
  %t3223 = ptrtoint ptr %t3222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_719" to i64), ptr %t3222
  %t3224 = or i64 %t3223, 4
  %t3225 = getelementptr i64, ptr %t3222, i64 1
  store i64 %t3221, ptr %t3225
  %t3226 = getelementptr i64, ptr %t3222, i64 2
  store i64 %t3224, ptr %t3226
  %t3227 = musttail call fastcc i64 @"scheme.base:code_719"(i64 %t3224, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3227
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3232 = icmp sge i64 %argc, 0
  br i1 %t3232, label %argok718, label %arityerr717
arityerr717:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok718:
  %t3233 = call ptr @rt_alloc_words(i64 8)
  %t3234 = getelementptr i64, ptr %t3233, i64 0
  store i64 %a0, ptr %t3234
  %t3235 = getelementptr i64, ptr %t3233, i64 1
  store i64 %a1, ptr %t3235
  %t3236 = getelementptr i64, ptr %t3233, i64 2
  store i64 %a2, ptr %t3236
  %t3237 = getelementptr i64, ptr %t3233, i64 3
  store i64 %a3, ptr %t3237
  %t3238 = getelementptr i64, ptr %t3233, i64 4
  store i64 %a4, ptr %t3238
  %t3239 = getelementptr i64, ptr %t3233, i64 5
  store i64 %a5, ptr %t3239
  %t3240 = getelementptr i64, ptr %t3233, i64 6
  store i64 %a6, ptr %t3240
  %t3241 = getelementptr i64, ptr %t3233, i64 7
  store i64 %a7, ptr %t3241
  %t3242 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3233, ptr %overflow)
  %t3243 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3243)
  %t3244 = and i64 %t3243, -8
  %t3245 = inttoptr i64 %t3244 to ptr
  %t3246 = load i64, ptr %t3245
  %t3247 = inttoptr i64 %t3246 to ptr
  %t3248 = musttail call fastcc i64 %t3247(i64 %t3243, i64 1, i64 %t3242, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3248
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3249 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3249)
  %t3250 = and i64 %t3249, -8
  %t3251 = inttoptr i64 %t3250 to ptr
  %t3252 = load i64, ptr %t3251
  %t3253 = inttoptr i64 %t3252 to ptr
  %t3254 = musttail call fastcc i64 %t3253(i64 %t3249, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3254
}

define fastcc i64 @"scheme.base:code_729"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3259 = icmp eq i64 %argc, 2
  br i1 %t3259, label %argok720, label %arityerr719
arityerr719:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok720:
  %t3260 = call i64 @rt_null_p(i64 %a0)
  %t3261 = icmp ne i64 %t3260, 1
  br i1 %t3261, label %then721, label %else722
then721:
  %t3262 = and i64 %self, -8
  %t3263 = inttoptr i64 %t3262 to ptr
  %t3264 = getelementptr i64, ptr %t3263, i64 1
  %t3265 = load i64, ptr %t3264
  ret i64 %t3265
else722:
  %t3266 = and i64 %self, -8
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = getelementptr i64, ptr %t3267, i64 1
  %t3269 = load i64, ptr %t3268
  %t3270 = call i64 @rt_car(i64 %a0)
  %t3271 = call i64 @rt_bytevector_u8_set(i64 %t3269, i64 %a1, i64 %t3270)
  %t3272 = call i64 @rt_cdr(i64 %a0)
  %t3273 = or i64 %a1, 8
  %t3274 = and i64 %t3273, 7
  %t3275 = icmp eq i64 %t3274, 0
  br i1 %t3275, label %fixfast723, label %fixslow724
fixfast723:
  %t3276 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3277 = extractvalue {i64, i1} %t3276, 0
  %t3278 = extractvalue {i64, i1} %t3276, 1
  br i1 %t3278, label %fixslow724, label %fixmerge725
fixslow724:
  %t3279 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge725
fixmerge725:
  %t3280 = phi i64 [ %t3277, %fixfast723 ], [ %t3279, %fixslow724 ]
  %t3281 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %self, i64 2, i64 %t3272, i64 %t3280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3281
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3282 = icmp eq i64 %argc, 1
  br i1 %t3282, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok727:
  %t3283 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3283)
  %t3284 = and i64 %t3283, -8
  %t3285 = inttoptr i64 %t3284 to ptr
  %t3286 = load i64, ptr %t3285
  %t3287 = inttoptr i64 %t3286 to ptr
  %t3288 = call fastcc i64%t3287(i64 %t3283, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3289 = call i64 @rt_make_bytevector(i64 %t3288, i64 0)
  %t3290 = call ptr @rt_alloc_words(i64 3)
  %t3291 = ptrtoint ptr %t3290 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_729" to i64), ptr %t3290
  %t3292 = or i64 %t3291, 4
  %t3293 = getelementptr i64, ptr %t3290, i64 1
  store i64 %t3289, ptr %t3293
  %t3294 = getelementptr i64, ptr %t3290, i64 2
  store i64 %t3292, ptr %t3294
  %t3295 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %t3292, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3295
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3300 = icmp sge i64 %argc, 0
  br i1 %t3300, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok729:
  %t3301 = call ptr @rt_alloc_words(i64 8)
  %t3302 = getelementptr i64, ptr %t3301, i64 0
  store i64 %a0, ptr %t3302
  %t3303 = getelementptr i64, ptr %t3301, i64 1
  store i64 %a1, ptr %t3303
  %t3304 = getelementptr i64, ptr %t3301, i64 2
  store i64 %a2, ptr %t3304
  %t3305 = getelementptr i64, ptr %t3301, i64 3
  store i64 %a3, ptr %t3305
  %t3306 = getelementptr i64, ptr %t3301, i64 4
  store i64 %a4, ptr %t3306
  %t3307 = getelementptr i64, ptr %t3301, i64 5
  store i64 %a5, ptr %t3307
  %t3308 = getelementptr i64, ptr %t3301, i64 6
  store i64 %a6, ptr %t3308
  %t3309 = getelementptr i64, ptr %t3301, i64 7
  store i64 %a7, ptr %t3309
  %t3310 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3301, ptr %overflow)
  %t3311 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3311)
  %t3312 = and i64 %t3311, -8
  %t3313 = inttoptr i64 %t3312 to ptr
  %t3314 = load i64, ptr %t3313
  %t3315 = inttoptr i64 %t3314 to ptr
  %t3316 = musttail call fastcc i64 %t3315(i64 %t3311, i64 1, i64 %t3310, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3316
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3317 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3317)
  %t3318 = and i64 %t3317, -8
  %t3319 = inttoptr i64 %t3318 to ptr
  %t3320 = load i64, ptr %t3319
  %t3321 = inttoptr i64 %t3320 to ptr
  %t3322 = musttail call fastcc i64 %t3321(i64 %t3317, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3322
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3327 = icmp eq i64 %argc, 1
  br i1 %t3327, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok731:
  %t3328 = call i64 @rt_pair_p(i64 %a0)
  %t3329 = icmp ne i64 %t3328, 1
  br i1 %t3329, label %then732, label %else733
then732:
  %t3330 = call i64 @rt_car(i64 %a0)
  ret i64 %t3330
else733:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3335 = icmp eq i64 %argc, 2
  br i1 %t3335, label %argok735, label %arityerr734
arityerr734:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok735:
  %t3336 = call i64 @rt_pair_p(i64 %a0)
  %t3337 = icmp ne i64 %t3336, 1
  br i1 %t3337, label %then736, label %else737
then736:
  %t3338 = call i64 @rt_cdr(i64 %a0)
  %t3339 = call i64 @rt_pair_p(i64 %t3338)
  br label %merge738
else737:
  br label %merge738
merge738:
  %t3340 = phi i64 [ %t3339, %then736 ], [ 1, %else737 ]
  %t3341 = icmp ne i64 %t3340, 1
  br i1 %t3341, label %then739, label %else740
then739:
  %t3342 = call i64 @rt_cdr(i64 %a0)
  %t3343 = call i64 @rt_car(i64 %t3342)
  ret i64 %t3343
else740:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3348 = icmp eq i64 %argc, 4
  br i1 %t3348, label %argok742, label %arityerr741
arityerr741:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok742:
  %t3349 = or i64 0, %a1
  %t3350 = and i64 %t3349, 7
  %t3351 = icmp eq i64 %t3350, 0
  br i1 %t3351, label %fixfast743, label %fixslow744
fixfast743:
  %t3352 = icmp slt i64 0, %a1
  %t3353 = select i1 %t3352, i64 257, i64 1
  br label %fixmerge745
fixslow744:
  %t3354 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge745
fixmerge745:
  %t3355 = phi i64 [ %t3353, %fixfast743 ], [ %t3354, %fixslow744 ]
  %t3356 = icmp ne i64 %t3355, 1
  br i1 %t3356, label %then746, label %else747
then746:
  br label %merge748
else747:
  %t3357 = or i64 0, %a1
  %t3358 = and i64 %t3357, 7
  %t3359 = icmp eq i64 %t3358, 0
  br i1 %t3359, label %fixfast749, label %fixslow750
fixfast749:
  %t3360 = icmp eq i64 0, %a1
  %t3361 = select i1 %t3360, i64 257, i64 1
  br label %fixmerge751
fixslow750:
  %t3362 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge751
fixmerge751:
  %t3363 = phi i64 [ %t3361, %fixfast749 ], [ %t3362, %fixslow750 ]
  br label %merge748
merge748:
  %t3364 = phi i64 [ 257, %then746 ], [ %t3363, %fixmerge751 ]
  %t3365 = icmp ne i64 %t3364, 1
  br i1 %t3365, label %then752, label %else753
then752:
  %t3366 = or i64 %a1, %a2
  %t3367 = and i64 %t3366, 7
  %t3368 = icmp eq i64 %t3367, 0
  br i1 %t3368, label %fixfast755, label %fixslow756
fixfast755:
  %t3369 = icmp slt i64 %a1, %a2
  %t3370 = select i1 %t3369, i64 257, i64 1
  br label %fixmerge757
fixslow756:
  %t3371 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge757
fixmerge757:
  %t3372 = phi i64 [ %t3370, %fixfast755 ], [ %t3371, %fixslow756 ]
  %t3373 = icmp ne i64 %t3372, 1
  br i1 %t3373, label %then758, label %else759
then758:
  br label %merge760
else759:
  %t3374 = or i64 %a1, %a2
  %t3375 = and i64 %t3374, 7
  %t3376 = icmp eq i64 %t3375, 0
  br i1 %t3376, label %fixfast761, label %fixslow762
fixfast761:
  %t3377 = icmp eq i64 %a1, %a2
  %t3378 = select i1 %t3377, i64 257, i64 1
  br label %fixmerge763
fixslow762:
  %t3379 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge763
fixmerge763:
  %t3380 = phi i64 [ %t3378, %fixfast761 ], [ %t3379, %fixslow762 ]
  br label %merge760
merge760:
  %t3381 = phi i64 [ 257, %then758 ], [ %t3380, %fixmerge763 ]
  %t3382 = icmp ne i64 %t3381, 1
  br i1 %t3382, label %then764, label %else765
then764:
  %t3383 = or i64 %a2, %a3
  %t3384 = and i64 %t3383, 7
  %t3385 = icmp eq i64 %t3384, 0
  br i1 %t3385, label %fixfast767, label %fixslow768
fixfast767:
  %t3386 = icmp slt i64 %a2, %a3
  %t3387 = select i1 %t3386, i64 257, i64 1
  br label %fixmerge769
fixslow768:
  %t3388 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge769
fixmerge769:
  %t3389 = phi i64 [ %t3387, %fixfast767 ], [ %t3388, %fixslow768 ]
  %t3390 = icmp ne i64 %t3389, 1
  br i1 %t3390, label %then770, label %else771
then770:
  br label %merge772
else771:
  %t3391 = or i64 %a2, %a3
  %t3392 = and i64 %t3391, 7
  %t3393 = icmp eq i64 %t3392, 0
  br i1 %t3393, label %fixfast773, label %fixslow774
fixfast773:
  %t3394 = icmp eq i64 %a2, %a3
  %t3395 = select i1 %t3394, i64 257, i64 1
  br label %fixmerge775
fixslow774:
  %t3396 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge775
fixmerge775:
  %t3397 = phi i64 [ %t3395, %fixfast773 ], [ %t3396, %fixslow774 ]
  br label %merge772
merge772:
  %t3398 = phi i64 [ 257, %then770 ], [ %t3397, %fixmerge775 ]
  br label %merge766
else765:
  br label %merge766
merge766:
  %t3399 = phi i64 [ %t3398, %merge772 ], [ 1, %else765 ]
  br label %merge754
else753:
  br label %merge754
merge754:
  %t3400 = phi i64 [ %t3399, %merge766 ], [ 1, %else753 ]
  %t3401 = icmp ne i64 %t3400, 1
  br i1 %t3401, label %then776, label %else777
then776:
  ret i64 257
else777:
  %t3402 = call i64 @rt_make_string(ptr @.str.lit.33, i64 19)
  %t3403 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t3403)
  %t3404 = and i64 %t3403, -8
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = load i64, ptr %t3405
  %t3407 = inttoptr i64 %t3406 to ptr
  %t3408 = musttail call fastcc i64 %t3407(i64 %t3403, i64 5, i64 %t3402, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3408
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3413 = icmp eq i64 %argc, 2
  br i1 %t3413, label %argok779, label %arityerr778
arityerr778:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok779:
  %t3414 = call i64 @rt_null_p(i64 %a1)
  %t3415 = icmp ne i64 %t3414, 1
  br i1 %t3415, label %then780, label %else781
then780:
  ret i64 1
else781:
  %t3416 = call i64 @rt_car(i64 %a1)
  %t3417 = call i64 @rt_car(i64 %t3416)
  %t3418 = call i64 @rt_eqv_p(i64 %a0, i64 %t3417)
  %t3419 = icmp ne i64 %t3418, 1
  br i1 %t3419, label %then782, label %else783
then782:
  %t3420 = call i64 @rt_car(i64 %a1)
  ret i64 %t3420
else783:
  %t3421 = call i64 @rt_cdr(i64 %a1)
  %t3422 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t3422)
  %t3423 = and i64 %t3422, -8
  %t3424 = inttoptr i64 %t3423 to ptr
  %t3425 = load i64, ptr %t3424
  %t3426 = inttoptr i64 %t3425 to ptr
  %t3427 = musttail call fastcc i64 %t3426(i64 %t3422, i64 2, i64 %a0, i64 %t3421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3427
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3432 = icmp eq i64 %argc, 1
  br i1 %t3432, label %argok785, label %arityerr784
arityerr784:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok785:
  %t3433 = call i64 @rt_pair_p(i64 %a0)
  %t3434 = icmp ne i64 %t3433, 1
  br i1 %t3434, label %then786, label %else787
then786:
  %t3435 = call i64 @rt_car(i64 %a0)
  %t3436 = call i64 @rt_cdr(i64 %a0)
  %t3437 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t3437)
  %t3438 = and i64 %t3437, -8
  %t3439 = inttoptr i64 %t3438 to ptr
  %t3440 = load i64, ptr %t3439
  %t3441 = inttoptr i64 %t3440 to ptr
  %t3442 = call fastcc i64%t3441(i64 %t3437, i64 1, i64 %t3436, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3443 = call i64 @rt_cons(i64 %t3435, i64 %t3442)
  ret i64 %t3443
else787:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3448 = icmp sge i64 %argc, 2
  br i1 %t3448, label %argok789, label %arityerr788
arityerr788:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok789:
  %t3449 = call ptr @rt_alloc_words(i64 8)
  %t3450 = getelementptr i64, ptr %t3449, i64 0
  store i64 %a0, ptr %t3450
  %t3451 = getelementptr i64, ptr %t3449, i64 1
  store i64 %a1, ptr %t3451
  %t3452 = getelementptr i64, ptr %t3449, i64 2
  store i64 %a2, ptr %t3452
  %t3453 = getelementptr i64, ptr %t3449, i64 3
  store i64 %a3, ptr %t3453
  %t3454 = getelementptr i64, ptr %t3449, i64 4
  store i64 %a4, ptr %t3454
  %t3455 = getelementptr i64, ptr %t3449, i64 5
  store i64 %a5, ptr %t3455
  %t3456 = getelementptr i64, ptr %t3449, i64 6
  store i64 %a6, ptr %t3456
  %t3457 = getelementptr i64, ptr %t3449, i64 7
  store i64 %a7, ptr %t3457
  %t3458 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3449, ptr %overflow)
  %t3459 = call i64 @rt_cons(i64 %a1, i64 %t3458)
  %t3460 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3460)
  %t3461 = and i64 %t3460, -8
  %t3462 = inttoptr i64 %t3461 to ptr
  %t3463 = load i64, ptr %t3462
  %t3464 = inttoptr i64 %t3463 to ptr
  %t3465 = musttail call fastcc i64 %t3464(i64 %t3460, i64 2, i64 %a0, i64 %t3459, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3465
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cboolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3466 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3467 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3467)
  %t3468 = and i64 %t3467, -8
  %t3469 = inttoptr i64 %t3468 to ptr
  %t3470 = load i64, ptr %t3469
  %t3471 = inttoptr i64 %t3470 to ptr
  %t3472 = musttail call fastcc i64 %t3471(i64 %t3467, i64 2, i64 %a0, i64 %t3466, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3472
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3477 = icmp sge i64 %argc, 2
  br i1 %t3477, label %argok791, label %arityerr790
arityerr790:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok791:
  %t3478 = call ptr @rt_alloc_words(i64 8)
  %t3479 = getelementptr i64, ptr %t3478, i64 0
  store i64 %a0, ptr %t3479
  %t3480 = getelementptr i64, ptr %t3478, i64 1
  store i64 %a1, ptr %t3480
  %t3481 = getelementptr i64, ptr %t3478, i64 2
  store i64 %a2, ptr %t3481
  %t3482 = getelementptr i64, ptr %t3478, i64 3
  store i64 %a3, ptr %t3482
  %t3483 = getelementptr i64, ptr %t3478, i64 4
  store i64 %a4, ptr %t3483
  %t3484 = getelementptr i64, ptr %t3478, i64 5
  store i64 %a5, ptr %t3484
  %t3485 = getelementptr i64, ptr %t3478, i64 6
  store i64 %a6, ptr %t3485
  %t3486 = getelementptr i64, ptr %t3478, i64 7
  store i64 %a7, ptr %t3486
  %t3487 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3478, ptr %overflow)
  %t3488 = call i64 @rt_cons(i64 %a1, i64 %t3487)
  %t3489 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3489)
  %t3490 = and i64 %t3489, -8
  %t3491 = inttoptr i64 %t3490 to ptr
  %t3492 = load i64, ptr %t3491
  %t3493 = inttoptr i64 %t3492 to ptr
  %t3494 = musttail call fastcc i64 %t3493(i64 %t3489, i64 2, i64 %a0, i64 %t3488, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3494
}

define fastcc i64 @"min-entry:$scheme.base$ccode$csymbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3495 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3496 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3496)
  %t3497 = and i64 %t3496, -8
  %t3498 = inttoptr i64 %t3497 to ptr
  %t3499 = load i64, ptr %t3498
  %t3500 = inttoptr i64 %t3499 to ptr
  %t3501 = musttail call fastcc i64 %t3500(i64 %t3496, i64 2, i64 %a0, i64 %t3495, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3501
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3506 = icmp eq i64 %argc, 2
  br i1 %t3506, label %argok793, label %arityerr792
arityerr792:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok793:
  %t3507 = call i64 @rt_null_p(i64 %a1)
  %t3508 = icmp ne i64 %t3507, 1
  br i1 %t3508, label %then794, label %else795
then794:
  ret i64 257
else795:
  %t3509 = call i64 @rt_car(i64 %a1)
  %t3510 = call i64 @rt_eqv_p(i64 %a0, i64 %t3509)
  %t3511 = icmp ne i64 %t3510, 1
  br i1 %t3511, label %then796, label %else797
then796:
  %t3512 = call i64 @rt_car(i64 %a1)
  %t3513 = call i64 @rt_cdr(i64 %a1)
  %t3514 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3514)
  %t3515 = and i64 %t3514, -8
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = load i64, ptr %t3516
  %t3518 = inttoptr i64 %t3517 to ptr
  %t3519 = musttail call fastcc i64 %t3518(i64 %t3514, i64 2, i64 %t3512, i64 %t3513, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3519
else797:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_790"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3524 = icmp eq i64 %argc, 1
  br i1 %t3524, label %argok799, label %arityerr798
arityerr798:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok799:
  %t3525 = and i64 %self, -8
  %t3526 = inttoptr i64 %t3525 to ptr
  %t3527 = getelementptr i64, ptr %t3526, i64 1
  %t3528 = load i64, ptr %t3527
  %t3529 = or i64 %a0, %t3528
  %t3530 = and i64 %t3529, 7
  %t3531 = icmp eq i64 %t3530, 0
  br i1 %t3531, label %fixfast800, label %fixslow801
fixfast800:
  %t3532 = icmp eq i64 %a0, %t3528
  %t3533 = select i1 %t3532, i64 257, i64 1
  br label %fixmerge802
fixslow801:
  %t3534 = call i64 @rt_num_eq(i64 %a0, i64 %t3528)
  br label %fixmerge802
fixmerge802:
  %t3535 = phi i64 [ %t3533, %fixfast800 ], [ %t3534, %fixslow801 ]
  %t3536 = icmp ne i64 %t3535, 1
  br i1 %t3536, label %then803, label %else804
then803:
  %t3537 = and i64 %self, -8
  %t3538 = inttoptr i64 %t3537 to ptr
  %t3539 = getelementptr i64, ptr %t3538, i64 2
  %t3540 = load i64, ptr %t3539
  %t3541 = or i64 %a0, %t3540
  %t3542 = and i64 %t3541, 7
  %t3543 = icmp eq i64 %t3542, 0
  br i1 %t3543, label %fixfast806, label %fixslow807
fixfast806:
  %t3544 = icmp eq i64 %a0, %t3540
  %t3545 = select i1 %t3544, i64 257, i64 1
  br label %fixmerge808
fixslow807:
  %t3546 = call i64 @rt_num_eq(i64 %a0, i64 %t3540)
  br label %fixmerge808
fixmerge808:
  %t3547 = phi i64 [ %t3545, %fixfast806 ], [ %t3546, %fixslow807 ]
  br label %merge805
else804:
  br label %merge805
merge805:
  %t3548 = phi i64 [ %t3547, %fixmerge808 ], [ 1, %else804 ]
  %t3549 = icmp ne i64 %t3548, 1
  br i1 %t3549, label %then809, label %else810
then809:
  ret i64 0
else810:
  %t3550 = and i64 %self, -8
  %t3551 = inttoptr i64 %t3550 to ptr
  %t3552 = getelementptr i64, ptr %t3551, i64 1
  %t3553 = load i64, ptr %t3552
  %t3554 = or i64 %a0, %t3553
  %t3555 = and i64 %t3554, 7
  %t3556 = icmp eq i64 %t3555, 0
  br i1 %t3556, label %fixfast811, label %fixslow812
fixfast811:
  %t3557 = icmp eq i64 %a0, %t3553
  %t3558 = select i1 %t3557, i64 257, i64 1
  br label %fixmerge813
fixslow812:
  %t3559 = call i64 @rt_num_eq(i64 %a0, i64 %t3553)
  br label %fixmerge813
fixmerge813:
  %t3560 = phi i64 [ %t3558, %fixfast811 ], [ %t3559, %fixslow812 ]
  %t3561 = icmp ne i64 %t3560, 1
  br i1 %t3561, label %then814, label %else815
then814:
  ret i64 -8
else815:
  %t3562 = and i64 %self, -8
  %t3563 = inttoptr i64 %t3562 to ptr
  %t3564 = getelementptr i64, ptr %t3563, i64 2
  %t3565 = load i64, ptr %t3564
  %t3566 = or i64 %a0, %t3565
  %t3567 = and i64 %t3566, 7
  %t3568 = icmp eq i64 %t3567, 0
  br i1 %t3568, label %fixfast816, label %fixslow817
fixfast816:
  %t3569 = icmp eq i64 %a0, %t3565
  %t3570 = select i1 %t3569, i64 257, i64 1
  br label %fixmerge818
fixslow817:
  %t3571 = call i64 @rt_num_eq(i64 %a0, i64 %t3565)
  br label %fixmerge818
fixmerge818:
  %t3572 = phi i64 [ %t3570, %fixfast816 ], [ %t3571, %fixslow817 ]
  %t3573 = icmp ne i64 %t3572, 1
  br i1 %t3573, label %then819, label %else820
then819:
  ret i64 8
else820:
  %t3574 = and i64 %self, -8
  %t3575 = inttoptr i64 %t3574 to ptr
  %t3576 = getelementptr i64, ptr %t3575, i64 3
  %t3577 = load i64, ptr %t3576
  %t3578 = call i64 @rt_string_ref(i64 %t3577, i64 %a0)
  %t3579 = call i64 @rt_char_to_integer(i64 %t3578)
  %t3580 = and i64 %self, -8
  %t3581 = inttoptr i64 %t3580 to ptr
  %t3582 = getelementptr i64, ptr %t3581, i64 4
  %t3583 = load i64, ptr %t3582
  %t3584 = call i64 @rt_string_ref(i64 %t3583, i64 %a0)
  %t3585 = call i64 @rt_char_to_integer(i64 %t3584)
  %t3586 = or i64 %t3579, %t3585
  %t3587 = and i64 %t3586, 7
  %t3588 = icmp eq i64 %t3587, 0
  br i1 %t3588, label %fixfast821, label %fixslow822
fixfast821:
  %t3589 = icmp slt i64 %t3579, %t3585
  %t3590 = select i1 %t3589, i64 257, i64 1
  br label %fixmerge823
fixslow822:
  %t3591 = call i64 @rt_lt(i64 %t3579, i64 %t3585)
  br label %fixmerge823
fixmerge823:
  %t3592 = phi i64 [ %t3590, %fixfast821 ], [ %t3591, %fixslow822 ]
  %t3593 = icmp ne i64 %t3592, 1
  br i1 %t3593, label %then824, label %else825
then824:
  ret i64 -8
else825:
  %t3594 = or i64 %t3585, %t3579
  %t3595 = and i64 %t3594, 7
  %t3596 = icmp eq i64 %t3595, 0
  br i1 %t3596, label %fixfast826, label %fixslow827
fixfast826:
  %t3597 = icmp slt i64 %t3585, %t3579
  %t3598 = select i1 %t3597, i64 257, i64 1
  br label %fixmerge828
fixslow827:
  %t3599 = call i64 @rt_lt(i64 %t3585, i64 %t3579)
  br label %fixmerge828
fixmerge828:
  %t3600 = phi i64 [ %t3598, %fixfast826 ], [ %t3599, %fixslow827 ]
  %t3601 = icmp ne i64 %t3600, 1
  br i1 %t3601, label %then829, label %else830
then829:
  ret i64 8
else830:
  %t3602 = or i64 %a0, 8
  %t3603 = and i64 %t3602, 7
  %t3604 = icmp eq i64 %t3603, 0
  br i1 %t3604, label %fixfast831, label %fixslow832
fixfast831:
  %t3605 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3606 = extractvalue {i64, i1} %t3605, 0
  %t3607 = extractvalue {i64, i1} %t3605, 1
  br i1 %t3607, label %fixslow832, label %fixmerge833
fixslow832:
  %t3608 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge833
fixmerge833:
  %t3609 = phi i64 [ %t3606, %fixfast831 ], [ %t3608, %fixslow832 ]
  %t3610 = musttail call fastcc i64 @"scheme.base:code_790"(i64 %self, i64 1, i64 %t3609, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3610
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3611 = icmp eq i64 %argc, 2
  br i1 %t3611, label %argok835, label %arityerr834
arityerr834:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok835:
  %t3612 = call i64 @rt_string_length(i64 %a0)
  %t3613 = call i64 @rt_string_length(i64 %a1)
  %t3614 = call ptr @rt_alloc_words(i64 6)
  %t3615 = ptrtoint ptr %t3614 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_790" to i64), ptr %t3614
  %t3616 = or i64 %t3615, 4
  %t3617 = getelementptr i64, ptr %t3614, i64 1
  store i64 %t3612, ptr %t3617
  %t3618 = getelementptr i64, ptr %t3614, i64 2
  store i64 %t3613, ptr %t3618
  %t3619 = getelementptr i64, ptr %t3614, i64 3
  store i64 %a0, ptr %t3619
  %t3620 = getelementptr i64, ptr %t3614, i64 4
  store i64 %a1, ptr %t3620
  %t3621 = getelementptr i64, ptr %t3614, i64 5
  store i64 %t3616, ptr %t3621
  %t3622 = musttail call fastcc i64 @"scheme.base:code_790"(i64 %t3616, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3622
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3627 = icmp eq i64 %argc, 3
  br i1 %t3627, label %argok837, label %arityerr836
arityerr836:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok837:
  %t3628 = call i64 @rt_null_p(i64 %a2)
  %t3629 = icmp ne i64 %t3628, 1
  br i1 %t3629, label %then838, label %else839
then838:
  ret i64 257
else839:
  %t3630 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t3631 = and i64 %a0, -8
  %t3632 = inttoptr i64 %t3631 to ptr
  %t3633 = load i64, ptr %t3632
  %t3634 = inttoptr i64 %t3633 to ptr
  %t3635 = call fastcc i64%t3634(i64 %a0, i64 2, i64 %a1, i64 %t3630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3636 = icmp ne i64 %t3635, 1
  br i1 %t3636, label %then840, label %else841
then840:
  %t3637 = call i64 @rt_car(i64 %a2)
  %t3638 = call i64 @rt_cdr(i64 %a2)
  %t3639 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3639)
  %t3640 = and i64 %t3639, -8
  %t3641 = inttoptr i64 %t3640 to ptr
  %t3642 = load i64, ptr %t3641
  %t3643 = inttoptr i64 %t3642 to ptr
  %t3644 = musttail call fastcc i64 %t3643(i64 %t3639, i64 3, i64 %a0, i64 %t3637, i64 %t3638, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3644
else841:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_804"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3649 = icmp eq i64 %argc, 2
  br i1 %t3649, label %argok843, label %arityerr842
arityerr842:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok843:
  %t3650 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3650)
  %t3651 = and i64 %t3650, -8
  %t3652 = inttoptr i64 %t3651 to ptr
  %t3653 = load i64, ptr %t3652
  %t3654 = inttoptr i64 %t3653 to ptr
  %t3655 = call fastcc i64%t3654(i64 %t3650, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3656 = or i64 %t3655, 0
  %t3657 = and i64 %t3656, 7
  %t3658 = icmp eq i64 %t3657, 0
  br i1 %t3658, label %fixfast844, label %fixslow845
fixfast844:
  %t3659 = icmp slt i64 %t3655, 0
  %t3660 = select i1 %t3659, i64 257, i64 1
  br label %fixmerge846
fixslow845:
  %t3661 = call i64 @rt_lt(i64 %t3655, i64 0)
  br label %fixmerge846
fixmerge846:
  %t3662 = phi i64 [ %t3660, %fixfast844 ], [ %t3661, %fixslow845 ]
  ret i64 %t3662
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3663 = icmp sge i64 %argc, 2
  br i1 %t3663, label %argok848, label %arityerr847
arityerr847:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok848:
  %t3664 = call ptr @rt_alloc_words(i64 8)
  %t3665 = getelementptr i64, ptr %t3664, i64 0
  store i64 %a0, ptr %t3665
  %t3666 = getelementptr i64, ptr %t3664, i64 1
  store i64 %a1, ptr %t3666
  %t3667 = getelementptr i64, ptr %t3664, i64 2
  store i64 %a2, ptr %t3667
  %t3668 = getelementptr i64, ptr %t3664, i64 3
  store i64 %a3, ptr %t3668
  %t3669 = getelementptr i64, ptr %t3664, i64 4
  store i64 %a4, ptr %t3669
  %t3670 = getelementptr i64, ptr %t3664, i64 5
  store i64 %a5, ptr %t3670
  %t3671 = getelementptr i64, ptr %t3664, i64 6
  store i64 %a6, ptr %t3671
  %t3672 = getelementptr i64, ptr %t3664, i64 7
  store i64 %a7, ptr %t3672
  %t3673 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3664, ptr %overflow)
  %t3674 = call ptr @rt_alloc_words(i64 1)
  %t3675 = ptrtoint ptr %t3674 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_804" to i64), ptr %t3674
  %t3676 = or i64 %t3675, 4
  %t3677 = call i64 @rt_cons(i64 %a1, i64 %t3673)
  %t3678 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3678)
  %t3679 = and i64 %t3678, -8
  %t3680 = inttoptr i64 %t3679 to ptr
  %t3681 = load i64, ptr %t3680
  %t3682 = inttoptr i64 %t3681 to ptr
  %t3683 = musttail call fastcc i64 %t3682(i64 %t3678, i64 3, i64 %t3676, i64 %a0, i64 %t3677, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3683
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3684 = call ptr @rt_alloc_words(i64 1)
  %t3685 = ptrtoint ptr %t3684 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_804" to i64), ptr %t3684
  %t3686 = or i64 %t3685, 4
  %t3687 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3688 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3688)
  %t3689 = and i64 %t3688, -8
  %t3690 = inttoptr i64 %t3689 to ptr
  %t3691 = load i64, ptr %t3690
  %t3692 = inttoptr i64 %t3691 to ptr
  %t3693 = musttail call fastcc i64 %t3692(i64 %t3688, i64 3, i64 %t3686, i64 %a0, i64 %t3687, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3693
}

define fastcc i64 @"scheme.base:code_814"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3698 = icmp eq i64 %argc, 2
  br i1 %t3698, label %argok850, label %arityerr849
arityerr849:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok850:
  %t3699 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3699)
  %t3700 = and i64 %t3699, -8
  %t3701 = inttoptr i64 %t3700 to ptr
  %t3702 = load i64, ptr %t3701
  %t3703 = inttoptr i64 %t3702 to ptr
  %t3704 = call fastcc i64%t3703(i64 %t3699, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3705 = or i64 0, %t3704
  %t3706 = and i64 %t3705, 7
  %t3707 = icmp eq i64 %t3706, 0
  br i1 %t3707, label %fixfast851, label %fixslow852
fixfast851:
  %t3708 = icmp slt i64 0, %t3704
  %t3709 = select i1 %t3708, i64 257, i64 1
  br label %fixmerge853
fixslow852:
  %t3710 = call i64 @rt_lt(i64 0, i64 %t3704)
  br label %fixmerge853
fixmerge853:
  %t3711 = phi i64 [ %t3709, %fixfast851 ], [ %t3710, %fixslow852 ]
  ret i64 %t3711
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3712 = icmp sge i64 %argc, 2
  br i1 %t3712, label %argok855, label %arityerr854
arityerr854:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok855:
  %t3713 = call ptr @rt_alloc_words(i64 8)
  %t3714 = getelementptr i64, ptr %t3713, i64 0
  store i64 %a0, ptr %t3714
  %t3715 = getelementptr i64, ptr %t3713, i64 1
  store i64 %a1, ptr %t3715
  %t3716 = getelementptr i64, ptr %t3713, i64 2
  store i64 %a2, ptr %t3716
  %t3717 = getelementptr i64, ptr %t3713, i64 3
  store i64 %a3, ptr %t3717
  %t3718 = getelementptr i64, ptr %t3713, i64 4
  store i64 %a4, ptr %t3718
  %t3719 = getelementptr i64, ptr %t3713, i64 5
  store i64 %a5, ptr %t3719
  %t3720 = getelementptr i64, ptr %t3713, i64 6
  store i64 %a6, ptr %t3720
  %t3721 = getelementptr i64, ptr %t3713, i64 7
  store i64 %a7, ptr %t3721
  %t3722 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3713, ptr %overflow)
  %t3723 = call ptr @rt_alloc_words(i64 1)
  %t3724 = ptrtoint ptr %t3723 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_814" to i64), ptr %t3723
  %t3725 = or i64 %t3724, 4
  %t3726 = call i64 @rt_cons(i64 %a1, i64 %t3722)
  %t3727 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3727)
  %t3728 = and i64 %t3727, -8
  %t3729 = inttoptr i64 %t3728 to ptr
  %t3730 = load i64, ptr %t3729
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = musttail call fastcc i64 %t3731(i64 %t3727, i64 3, i64 %t3725, i64 %a0, i64 %t3726, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3732
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3733 = call ptr @rt_alloc_words(i64 1)
  %t3734 = ptrtoint ptr %t3733 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_814" to i64), ptr %t3733
  %t3735 = or i64 %t3734, 4
  %t3736 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3737 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3737)
  %t3738 = and i64 %t3737, -8
  %t3739 = inttoptr i64 %t3738 to ptr
  %t3740 = load i64, ptr %t3739
  %t3741 = inttoptr i64 %t3740 to ptr
  %t3742 = musttail call fastcc i64 %t3741(i64 %t3737, i64 3, i64 %t3735, i64 %a0, i64 %t3736, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3742
}

define fastcc i64 @"scheme.base:code_824"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3747 = icmp eq i64 %argc, 2
  br i1 %t3747, label %argok857, label %arityerr856
arityerr856:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok857:
  %t3748 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3748)
  %t3749 = and i64 %t3748, -8
  %t3750 = inttoptr i64 %t3749 to ptr
  %t3751 = load i64, ptr %t3750
  %t3752 = inttoptr i64 %t3751 to ptr
  %t3753 = call fastcc i64%t3752(i64 %t3748, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3754 = or i64 0, %t3753
  %t3755 = and i64 %t3754, 7
  %t3756 = icmp eq i64 %t3755, 0
  br i1 %t3756, label %fixfast858, label %fixslow859
fixfast858:
  %t3757 = icmp slt i64 0, %t3753
  %t3758 = select i1 %t3757, i64 257, i64 1
  br label %fixmerge860
fixslow859:
  %t3759 = call i64 @rt_lt(i64 0, i64 %t3753)
  br label %fixmerge860
fixmerge860:
  %t3760 = phi i64 [ %t3758, %fixfast858 ], [ %t3759, %fixslow859 ]
  %t3761 = call i64 @rt_not(i64 %t3760)
  ret i64 %t3761
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3762 = icmp sge i64 %argc, 2
  br i1 %t3762, label %argok862, label %arityerr861
arityerr861:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok862:
  %t3763 = call ptr @rt_alloc_words(i64 8)
  %t3764 = getelementptr i64, ptr %t3763, i64 0
  store i64 %a0, ptr %t3764
  %t3765 = getelementptr i64, ptr %t3763, i64 1
  store i64 %a1, ptr %t3765
  %t3766 = getelementptr i64, ptr %t3763, i64 2
  store i64 %a2, ptr %t3766
  %t3767 = getelementptr i64, ptr %t3763, i64 3
  store i64 %a3, ptr %t3767
  %t3768 = getelementptr i64, ptr %t3763, i64 4
  store i64 %a4, ptr %t3768
  %t3769 = getelementptr i64, ptr %t3763, i64 5
  store i64 %a5, ptr %t3769
  %t3770 = getelementptr i64, ptr %t3763, i64 6
  store i64 %a6, ptr %t3770
  %t3771 = getelementptr i64, ptr %t3763, i64 7
  store i64 %a7, ptr %t3771
  %t3772 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3763, ptr %overflow)
  %t3773 = call ptr @rt_alloc_words(i64 1)
  %t3774 = ptrtoint ptr %t3773 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_824" to i64), ptr %t3773
  %t3775 = or i64 %t3774, 4
  %t3776 = call i64 @rt_cons(i64 %a1, i64 %t3772)
  %t3777 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3777)
  %t3778 = and i64 %t3777, -8
  %t3779 = inttoptr i64 %t3778 to ptr
  %t3780 = load i64, ptr %t3779
  %t3781 = inttoptr i64 %t3780 to ptr
  %t3782 = musttail call fastcc i64 %t3781(i64 %t3777, i64 3, i64 %t3775, i64 %a0, i64 %t3776, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3782
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3783 = call ptr @rt_alloc_words(i64 1)
  %t3784 = ptrtoint ptr %t3783 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_824" to i64), ptr %t3783
  %t3785 = or i64 %t3784, 4
  %t3786 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3787 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3787)
  %t3788 = and i64 %t3787, -8
  %t3789 = inttoptr i64 %t3788 to ptr
  %t3790 = load i64, ptr %t3789
  %t3791 = inttoptr i64 %t3790 to ptr
  %t3792 = musttail call fastcc i64 %t3791(i64 %t3787, i64 3, i64 %t3785, i64 %a0, i64 %t3786, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3792
}

define fastcc i64 @"scheme.base:code_834"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3797 = icmp eq i64 %argc, 2
  br i1 %t3797, label %argok864, label %arityerr863
arityerr863:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok864:
  %t3798 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3798)
  %t3799 = and i64 %t3798, -8
  %t3800 = inttoptr i64 %t3799 to ptr
  %t3801 = load i64, ptr %t3800
  %t3802 = inttoptr i64 %t3801 to ptr
  %t3803 = call fastcc i64%t3802(i64 %t3798, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3804 = or i64 %t3803, 0
  %t3805 = and i64 %t3804, 7
  %t3806 = icmp eq i64 %t3805, 0
  br i1 %t3806, label %fixfast865, label %fixslow866
fixfast865:
  %t3807 = icmp slt i64 %t3803, 0
  %t3808 = select i1 %t3807, i64 257, i64 1
  br label %fixmerge867
fixslow866:
  %t3809 = call i64 @rt_lt(i64 %t3803, i64 0)
  br label %fixmerge867
fixmerge867:
  %t3810 = phi i64 [ %t3808, %fixfast865 ], [ %t3809, %fixslow866 ]
  %t3811 = call i64 @rt_not(i64 %t3810)
  ret i64 %t3811
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3812 = icmp sge i64 %argc, 2
  br i1 %t3812, label %argok869, label %arityerr868
arityerr868:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok869:
  %t3813 = call ptr @rt_alloc_words(i64 8)
  %t3814 = getelementptr i64, ptr %t3813, i64 0
  store i64 %a0, ptr %t3814
  %t3815 = getelementptr i64, ptr %t3813, i64 1
  store i64 %a1, ptr %t3815
  %t3816 = getelementptr i64, ptr %t3813, i64 2
  store i64 %a2, ptr %t3816
  %t3817 = getelementptr i64, ptr %t3813, i64 3
  store i64 %a3, ptr %t3817
  %t3818 = getelementptr i64, ptr %t3813, i64 4
  store i64 %a4, ptr %t3818
  %t3819 = getelementptr i64, ptr %t3813, i64 5
  store i64 %a5, ptr %t3819
  %t3820 = getelementptr i64, ptr %t3813, i64 6
  store i64 %a6, ptr %t3820
  %t3821 = getelementptr i64, ptr %t3813, i64 7
  store i64 %a7, ptr %t3821
  %t3822 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3813, ptr %overflow)
  %t3823 = call ptr @rt_alloc_words(i64 1)
  %t3824 = ptrtoint ptr %t3823 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_834" to i64), ptr %t3823
  %t3825 = or i64 %t3824, 4
  %t3826 = call i64 @rt_cons(i64 %a1, i64 %t3822)
  %t3827 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3827)
  %t3828 = and i64 %t3827, -8
  %t3829 = inttoptr i64 %t3828 to ptr
  %t3830 = load i64, ptr %t3829
  %t3831 = inttoptr i64 %t3830 to ptr
  %t3832 = musttail call fastcc i64 %t3831(i64 %t3827, i64 3, i64 %t3825, i64 %a0, i64 %t3826, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3832
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3833 = call ptr @rt_alloc_words(i64 1)
  %t3834 = ptrtoint ptr %t3833 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_834" to i64), ptr %t3833
  %t3835 = or i64 %t3834, 4
  %t3836 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3837 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3837)
  %t3838 = and i64 %t3837, -8
  %t3839 = inttoptr i64 %t3838 to ptr
  %t3840 = load i64, ptr %t3839
  %t3841 = inttoptr i64 %t3840 to ptr
  %t3842 = musttail call fastcc i64 %t3841(i64 %t3837, i64 3, i64 %t3835, i64 %a0, i64 %t3836, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3842
}

define fastcc i64 @"scheme.base:code_847"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3847 = icmp eq i64 %argc, 2
  br i1 %t3847, label %argok871, label %arityerr870
arityerr870:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok871:
  %t3848 = and i64 %self, -8
  %t3849 = inttoptr i64 %t3848 to ptr
  %t3850 = getelementptr i64, ptr %t3849, i64 1
  %t3851 = load i64, ptr %t3850
  %t3852 = or i64 %a0, %t3851
  %t3853 = and i64 %t3852, 7
  %t3854 = icmp eq i64 %t3853, 0
  br i1 %t3854, label %fixfast872, label %fixslow873
fixfast872:
  %t3855 = icmp slt i64 %a0, %t3851
  %t3856 = select i1 %t3855, i64 257, i64 1
  br label %fixmerge874
fixslow873:
  %t3857 = call i64 @rt_lt(i64 %a0, i64 %t3851)
  br label %fixmerge874
fixmerge874:
  %t3858 = phi i64 [ %t3856, %fixfast872 ], [ %t3857, %fixslow873 ]
  %t3859 = icmp ne i64 %t3858, 1
  br i1 %t3859, label %then875, label %else876
then875:
  ret i64 %a1
else876:
  %t3860 = or i64 %a0, 8
  %t3861 = and i64 %t3860, 7
  %t3862 = icmp eq i64 %t3861, 0
  br i1 %t3862, label %fixfast877, label %fixslow878
fixfast877:
  %t3863 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3864 = extractvalue {i64, i1} %t3863, 0
  %t3865 = extractvalue {i64, i1} %t3863, 1
  br i1 %t3865, label %fixslow878, label %fixmerge879
fixslow878:
  %t3866 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge879
fixmerge879:
  %t3867 = phi i64 [ %t3864, %fixfast877 ], [ %t3866, %fixslow878 ]
  %t3868 = and i64 %self, -8
  %t3869 = inttoptr i64 %t3868 to ptr
  %t3870 = getelementptr i64, ptr %t3869, i64 3
  %t3871 = load i64, ptr %t3870
  %t3872 = call i64 @rt_vector_ref(i64 %t3871, i64 %a0)
  %t3873 = call i64 @rt_cons(i64 %t3872, i64 %a1)
  %t3874 = musttail call fastcc i64 @"scheme.base:code_847"(i64 %self, i64 2, i64 %t3867, i64 %t3873, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3874
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3875 = icmp sge i64 %argc, 1
  br i1 %t3875, label %argok881, label %arityerr880
arityerr880:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok881:
  %t3876 = call ptr @rt_alloc_words(i64 8)
  %t3877 = getelementptr i64, ptr %t3876, i64 0
  store i64 %a0, ptr %t3877
  %t3878 = getelementptr i64, ptr %t3876, i64 1
  store i64 %a1, ptr %t3878
  %t3879 = getelementptr i64, ptr %t3876, i64 2
  store i64 %a2, ptr %t3879
  %t3880 = getelementptr i64, ptr %t3876, i64 3
  store i64 %a3, ptr %t3880
  %t3881 = getelementptr i64, ptr %t3876, i64 4
  store i64 %a4, ptr %t3881
  %t3882 = getelementptr i64, ptr %t3876, i64 5
  store i64 %a5, ptr %t3882
  %t3883 = getelementptr i64, ptr %t3876, i64 6
  store i64 %a6, ptr %t3883
  %t3884 = getelementptr i64, ptr %t3876, i64 7
  store i64 %a7, ptr %t3884
  %t3885 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3876, ptr %overflow)
  %t3886 = call i64 @rt_vector_length(i64 %a0)
  %t3887 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3887)
  %t3888 = and i64 %t3887, -8
  %t3889 = inttoptr i64 %t3888 to ptr
  %t3890 = load i64, ptr %t3889
  %t3891 = inttoptr i64 %t3890 to ptr
  %t3892 = call fastcc i64%t3891(i64 %t3887, i64 1, i64 %t3885, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3893 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3893)
  %t3894 = and i64 %t3893, -8
  %t3895 = inttoptr i64 %t3894 to ptr
  %t3896 = load i64, ptr %t3895
  %t3897 = inttoptr i64 %t3896 to ptr
  %t3898 = call fastcc i64%t3897(i64 %t3893, i64 2, i64 %t3885, i64 %t3886, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3899 = call i64 @rt_intern(ptr @.str.sym.34)
  %t3900 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3900)
  %t3901 = and i64 %t3900, -8
  %t3902 = inttoptr i64 %t3901 to ptr
  %t3903 = load i64, ptr %t3902
  %t3904 = inttoptr i64 %t3903 to ptr
  %t3905 = call fastcc i64%t3904(i64 %t3900, i64 4, i64 %t3899, i64 %t3892, i64 %t3898, i64 %t3886, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3906 = call ptr @rt_alloc_words(i64 4)
  %t3907 = ptrtoint ptr %t3906 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_847" to i64), ptr %t3906
  %t3908 = or i64 %t3907, 4
  %t3909 = getelementptr i64, ptr %t3906, i64 1
  store i64 %t3892, ptr %t3909
  %t3910 = getelementptr i64, ptr %t3906, i64 2
  store i64 %t3908, ptr %t3910
  %t3911 = getelementptr i64, ptr %t3906, i64 3
  store i64 %a0, ptr %t3911
  %t3912 = or i64 %t3898, 8
  %t3913 = and i64 %t3912, 7
  %t3914 = icmp eq i64 %t3913, 0
  br i1 %t3914, label %fixfast882, label %fixslow883
fixfast882:
  %t3915 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3898, i64 8)
  %t3916 = extractvalue {i64, i1} %t3915, 0
  %t3917 = extractvalue {i64, i1} %t3915, 1
  br i1 %t3917, label %fixslow883, label %fixmerge884
fixslow883:
  %t3918 = call i64 @rt_sub(i64 %t3898, i64 8)
  br label %fixmerge884
fixmerge884:
  %t3919 = phi i64 [ %t3916, %fixfast882 ], [ %t3918, %fixslow883 ]
  %t3920 = musttail call fastcc i64 @"scheme.base:code_847"(i64 %t3908, i64 2, i64 %t3919, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3920
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3921 = call i64 @rt_vector_length(i64 %a0)
  %t3922 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3922)
  %t3923 = and i64 %t3922, -8
  %t3924 = inttoptr i64 %t3923 to ptr
  %t3925 = load i64, ptr %t3924
  %t3926 = inttoptr i64 %t3925 to ptr
  %t3927 = call fastcc i64%t3926(i64 %t3922, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3928 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3928)
  %t3929 = and i64 %t3928, -8
  %t3930 = inttoptr i64 %t3929 to ptr
  %t3931 = load i64, ptr %t3930
  %t3932 = inttoptr i64 %t3931 to ptr
  %t3933 = call fastcc i64%t3932(i64 %t3928, i64 2, i64 2, i64 %t3921, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3934 = call i64 @rt_intern(ptr @.str.sym.34)
  %t3935 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3935)
  %t3936 = and i64 %t3935, -8
  %t3937 = inttoptr i64 %t3936 to ptr
  %t3938 = load i64, ptr %t3937
  %t3939 = inttoptr i64 %t3938 to ptr
  %t3940 = call fastcc i64%t3939(i64 %t3935, i64 4, i64 %t3934, i64 %t3927, i64 %t3933, i64 %t3921, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3941 = call ptr @rt_alloc_words(i64 4)
  %t3942 = ptrtoint ptr %t3941 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_847" to i64), ptr %t3941
  %t3943 = or i64 %t3942, 4
  %t3944 = getelementptr i64, ptr %t3941, i64 1
  store i64 %t3927, ptr %t3944
  %t3945 = getelementptr i64, ptr %t3941, i64 2
  store i64 %t3943, ptr %t3945
  %t3946 = getelementptr i64, ptr %t3941, i64 3
  store i64 %a0, ptr %t3946
  %t3947 = or i64 %t3933, 8
  %t3948 = and i64 %t3947, 7
  %t3949 = icmp eq i64 %t3948, 0
  br i1 %t3949, label %fixfast885, label %fixslow886
fixfast885:
  %t3950 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3933, i64 8)
  %t3951 = extractvalue {i64, i1} %t3950, 0
  %t3952 = extractvalue {i64, i1} %t3950, 1
  br i1 %t3952, label %fixslow886, label %fixmerge887
fixslow886:
  %t3953 = call i64 @rt_sub(i64 %t3933, i64 8)
  br label %fixmerge887
fixmerge887:
  %t3954 = phi i64 [ %t3951, %fixfast885 ], [ %t3953, %fixslow886 ]
  %t3955 = musttail call fastcc i64 @"scheme.base:code_847"(i64 %t3943, i64 2, i64 %t3954, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3955
}

define fastcc i64 @"scheme.base:code_860"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3960 = icmp eq i64 %argc, 1
  br i1 %t3960, label %argok889, label %arityerr888
arityerr888:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok889:
  %t3961 = and i64 %self, -8
  %t3962 = inttoptr i64 %t3961 to ptr
  %t3963 = getelementptr i64, ptr %t3962, i64 1
  %t3964 = load i64, ptr %t3963
  %t3965 = or i64 %a0, %t3964
  %t3966 = and i64 %t3965, 7
  %t3967 = icmp eq i64 %t3966, 0
  br i1 %t3967, label %fixfast890, label %fixslow891
fixfast890:
  %t3968 = icmp eq i64 %a0, %t3964
  %t3969 = select i1 %t3968, i64 257, i64 1
  br label %fixmerge892
fixslow891:
  %t3970 = call i64 @rt_num_eq(i64 %a0, i64 %t3964)
  br label %fixmerge892
fixmerge892:
  %t3971 = phi i64 [ %t3969, %fixfast890 ], [ %t3970, %fixslow891 ]
  %t3972 = icmp ne i64 %t3971, 1
  br i1 %t3972, label %then893, label %else894
then893:
  %t3973 = and i64 %self, -8
  %t3974 = inttoptr i64 %t3973 to ptr
  %t3975 = getelementptr i64, ptr %t3974, i64 2
  %t3976 = load i64, ptr %t3975
  ret i64 %t3976
else894:
  %t3977 = and i64 %self, -8
  %t3978 = inttoptr i64 %t3977 to ptr
  %t3979 = getelementptr i64, ptr %t3978, i64 2
  %t3980 = load i64, ptr %t3979
  %t3981 = and i64 %self, -8
  %t3982 = inttoptr i64 %t3981 to ptr
  %t3983 = getelementptr i64, ptr %t3982, i64 3
  %t3984 = load i64, ptr %t3983
  %t3985 = or i64 %a0, %t3984
  %t3986 = and i64 %t3985, 7
  %t3987 = icmp eq i64 %t3986, 0
  br i1 %t3987, label %fixfast895, label %fixslow896
fixfast895:
  %t3988 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3984)
  %t3989 = extractvalue {i64, i1} %t3988, 0
  %t3990 = extractvalue {i64, i1} %t3988, 1
  br i1 %t3990, label %fixslow896, label %fixmerge897
fixslow896:
  %t3991 = call i64 @rt_sub(i64 %a0, i64 %t3984)
  br label %fixmerge897
fixmerge897:
  %t3992 = phi i64 [ %t3989, %fixfast895 ], [ %t3991, %fixslow896 ]
  %t3993 = and i64 %self, -8
  %t3994 = inttoptr i64 %t3993 to ptr
  %t3995 = getelementptr i64, ptr %t3994, i64 4
  %t3996 = load i64, ptr %t3995
  %t3997 = call i64 @rt_vector_ref(i64 %t3996, i64 %a0)
  %t3998 = call i64 @rt_vector_set(i64 %t3980, i64 %t3992, i64 %t3997)
  %t3999 = or i64 %a0, 8
  %t4000 = and i64 %t3999, 7
  %t4001 = icmp eq i64 %t4000, 0
  br i1 %t4001, label %fixfast898, label %fixslow899
fixfast898:
  %t4002 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4003 = extractvalue {i64, i1} %t4002, 0
  %t4004 = extractvalue {i64, i1} %t4002, 1
  br i1 %t4004, label %fixslow899, label %fixmerge900
fixslow899:
  %t4005 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge900
fixmerge900:
  %t4006 = phi i64 [ %t4003, %fixfast898 ], [ %t4005, %fixslow899 ]
  %t4007 = musttail call fastcc i64 @"scheme.base:code_860"(i64 %self, i64 1, i64 %t4006, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4007
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4008 = icmp sge i64 %argc, 1
  br i1 %t4008, label %argok902, label %arityerr901
arityerr901:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok902:
  %t4009 = call ptr @rt_alloc_words(i64 8)
  %t4010 = getelementptr i64, ptr %t4009, i64 0
  store i64 %a0, ptr %t4010
  %t4011 = getelementptr i64, ptr %t4009, i64 1
  store i64 %a1, ptr %t4011
  %t4012 = getelementptr i64, ptr %t4009, i64 2
  store i64 %a2, ptr %t4012
  %t4013 = getelementptr i64, ptr %t4009, i64 3
  store i64 %a3, ptr %t4013
  %t4014 = getelementptr i64, ptr %t4009, i64 4
  store i64 %a4, ptr %t4014
  %t4015 = getelementptr i64, ptr %t4009, i64 5
  store i64 %a5, ptr %t4015
  %t4016 = getelementptr i64, ptr %t4009, i64 6
  store i64 %a6, ptr %t4016
  %t4017 = getelementptr i64, ptr %t4009, i64 7
  store i64 %a7, ptr %t4017
  %t4018 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4009, ptr %overflow)
  %t4019 = call i64 @rt_vector_length(i64 %a0)
  %t4020 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4020)
  %t4021 = and i64 %t4020, -8
  %t4022 = inttoptr i64 %t4021 to ptr
  %t4023 = load i64, ptr %t4022
  %t4024 = inttoptr i64 %t4023 to ptr
  %t4025 = call fastcc i64%t4024(i64 %t4020, i64 1, i64 %t4018, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4026 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4026)
  %t4027 = and i64 %t4026, -8
  %t4028 = inttoptr i64 %t4027 to ptr
  %t4029 = load i64, ptr %t4028
  %t4030 = inttoptr i64 %t4029 to ptr
  %t4031 = call fastcc i64%t4030(i64 %t4026, i64 2, i64 %t4018, i64 %t4019, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4032 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4033 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4033)
  %t4034 = and i64 %t4033, -8
  %t4035 = inttoptr i64 %t4034 to ptr
  %t4036 = load i64, ptr %t4035
  %t4037 = inttoptr i64 %t4036 to ptr
  %t4038 = call fastcc i64%t4037(i64 %t4033, i64 4, i64 %t4032, i64 %t4025, i64 %t4031, i64 %t4019, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4039 = or i64 %t4031, %t4025
  %t4040 = and i64 %t4039, 7
  %t4041 = icmp eq i64 %t4040, 0
  br i1 %t4041, label %fixfast903, label %fixslow904
fixfast903:
  %t4042 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4031, i64 %t4025)
  %t4043 = extractvalue {i64, i1} %t4042, 0
  %t4044 = extractvalue {i64, i1} %t4042, 1
  br i1 %t4044, label %fixslow904, label %fixmerge905
fixslow904:
  %t4045 = call i64 @rt_sub(i64 %t4031, i64 %t4025)
  br label %fixmerge905
fixmerge905:
  %t4046 = phi i64 [ %t4043, %fixfast903 ], [ %t4045, %fixslow904 ]
  %t4047 = call i64 @rt_make_vector(i64 %t4046, i64 0)
  %t4048 = call ptr @rt_alloc_words(i64 6)
  %t4049 = ptrtoint ptr %t4048 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_860" to i64), ptr %t4048
  %t4050 = or i64 %t4049, 4
  %t4051 = getelementptr i64, ptr %t4048, i64 1
  store i64 %t4031, ptr %t4051
  %t4052 = getelementptr i64, ptr %t4048, i64 2
  store i64 %t4047, ptr %t4052
  %t4053 = getelementptr i64, ptr %t4048, i64 3
  store i64 %t4025, ptr %t4053
  %t4054 = getelementptr i64, ptr %t4048, i64 4
  store i64 %a0, ptr %t4054
  %t4055 = getelementptr i64, ptr %t4048, i64 5
  store i64 %t4050, ptr %t4055
  %t4056 = musttail call fastcc i64 @"scheme.base:code_860"(i64 %t4050, i64 1, i64 %t4025, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4056
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4057 = call i64 @rt_vector_length(i64 %a0)
  %t4058 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4058)
  %t4059 = and i64 %t4058, -8
  %t4060 = inttoptr i64 %t4059 to ptr
  %t4061 = load i64, ptr %t4060
  %t4062 = inttoptr i64 %t4061 to ptr
  %t4063 = call fastcc i64%t4062(i64 %t4058, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4064 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4064)
  %t4065 = and i64 %t4064, -8
  %t4066 = inttoptr i64 %t4065 to ptr
  %t4067 = load i64, ptr %t4066
  %t4068 = inttoptr i64 %t4067 to ptr
  %t4069 = call fastcc i64%t4068(i64 %t4064, i64 2, i64 2, i64 %t4057, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4070 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4071 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4071)
  %t4072 = and i64 %t4071, -8
  %t4073 = inttoptr i64 %t4072 to ptr
  %t4074 = load i64, ptr %t4073
  %t4075 = inttoptr i64 %t4074 to ptr
  %t4076 = call fastcc i64%t4075(i64 %t4071, i64 4, i64 %t4070, i64 %t4063, i64 %t4069, i64 %t4057, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4077 = or i64 %t4069, %t4063
  %t4078 = and i64 %t4077, 7
  %t4079 = icmp eq i64 %t4078, 0
  br i1 %t4079, label %fixfast906, label %fixslow907
fixfast906:
  %t4080 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4069, i64 %t4063)
  %t4081 = extractvalue {i64, i1} %t4080, 0
  %t4082 = extractvalue {i64, i1} %t4080, 1
  br i1 %t4082, label %fixslow907, label %fixmerge908
fixslow907:
  %t4083 = call i64 @rt_sub(i64 %t4069, i64 %t4063)
  br label %fixmerge908
fixmerge908:
  %t4084 = phi i64 [ %t4081, %fixfast906 ], [ %t4083, %fixslow907 ]
  %t4085 = call i64 @rt_make_vector(i64 %t4084, i64 0)
  %t4086 = call ptr @rt_alloc_words(i64 6)
  %t4087 = ptrtoint ptr %t4086 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_860" to i64), ptr %t4086
  %t4088 = or i64 %t4087, 4
  %t4089 = getelementptr i64, ptr %t4086, i64 1
  store i64 %t4069, ptr %t4089
  %t4090 = getelementptr i64, ptr %t4086, i64 2
  store i64 %t4085, ptr %t4090
  %t4091 = getelementptr i64, ptr %t4086, i64 3
  store i64 %t4063, ptr %t4091
  %t4092 = getelementptr i64, ptr %t4086, i64 4
  store i64 %a0, ptr %t4092
  %t4093 = getelementptr i64, ptr %t4086, i64 5
  store i64 %t4088, ptr %t4093
  %t4094 = musttail call fastcc i64 @"scheme.base:code_860"(i64 %t4088, i64 1, i64 %t4063, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4094
}

define fastcc i64 @"scheme.base:code_876"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4099 = icmp eq i64 %argc, 1
  br i1 %t4099, label %argok910, label %arityerr909
arityerr909:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok910:
  %t4100 = and i64 %self, -8
  %t4101 = inttoptr i64 %t4100 to ptr
  %t4102 = getelementptr i64, ptr %t4101, i64 1
  %t4103 = load i64, ptr %t4102
  %t4104 = or i64 %a0, %t4103
  %t4105 = and i64 %t4104, 7
  %t4106 = icmp eq i64 %t4105, 0
  br i1 %t4106, label %fixfast911, label %fixslow912
fixfast911:
  %t4107 = icmp eq i64 %a0, %t4103
  %t4108 = select i1 %t4107, i64 257, i64 1
  br label %fixmerge913
fixslow912:
  %t4109 = call i64 @rt_num_eq(i64 %a0, i64 %t4103)
  br label %fixmerge913
fixmerge913:
  %t4110 = phi i64 [ %t4108, %fixfast911 ], [ %t4109, %fixslow912 ]
  %t4111 = icmp ne i64 %t4110, 1
  br i1 %t4111, label %then914, label %else915
then914:
  %t4112 = and i64 %self, -8
  %t4113 = inttoptr i64 %t4112 to ptr
  %t4114 = getelementptr i64, ptr %t4113, i64 3
  %t4115 = load i64, ptr %t4114
  %t4116 = call i64 @rt_cdr(i64 %t4115)
  %t4117 = and i64 %self, -8
  %t4118 = inttoptr i64 %t4117 to ptr
  %t4119 = getelementptr i64, ptr %t4118, i64 4
  %t4120 = load i64, ptr %t4119
  %t4121 = and i64 %self, -8
  %t4122 = inttoptr i64 %t4121 to ptr
  %t4123 = getelementptr i64, ptr %t4122, i64 1
  %t4124 = load i64, ptr %t4123
  %t4125 = or i64 %t4120, %t4124
  %t4126 = and i64 %t4125, 7
  %t4127 = icmp eq i64 %t4126, 0
  br i1 %t4127, label %fixfast916, label %fixslow917
fixfast916:
  %t4128 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4120, i64 %t4124)
  %t4129 = extractvalue {i64, i1} %t4128, 0
  %t4130 = extractvalue {i64, i1} %t4128, 1
  br i1 %t4130, label %fixslow917, label %fixmerge918
fixslow917:
  %t4131 = call i64 @rt_add(i64 %t4120, i64 %t4124)
  br label %fixmerge918
fixmerge918:
  %t4132 = phi i64 [ %t4129, %fixfast916 ], [ %t4131, %fixslow917 ]
  %t4133 = and i64 %self, -8
  %t4134 = inttoptr i64 %t4133 to ptr
  %t4135 = getelementptr i64, ptr %t4134, i64 2
  %t4136 = load i64, ptr %t4135
  %t4137 = musttail call fastcc i64 @"scheme.base:code_874"(i64 %t4136, i64 2, i64 %t4116, i64 %t4132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4137
else915:
  %t4138 = and i64 %self, -8
  %t4139 = inttoptr i64 %t4138 to ptr
  %t4140 = getelementptr i64, ptr %t4139, i64 5
  %t4141 = load i64, ptr %t4140
  %t4142 = and i64 %self, -8
  %t4143 = inttoptr i64 %t4142 to ptr
  %t4144 = getelementptr i64, ptr %t4143, i64 4
  %t4145 = load i64, ptr %t4144
  %t4146 = or i64 %t4145, %a0
  %t4147 = and i64 %t4146, 7
  %t4148 = icmp eq i64 %t4147, 0
  br i1 %t4148, label %fixfast919, label %fixslow920
fixfast919:
  %t4149 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4145, i64 %a0)
  %t4150 = extractvalue {i64, i1} %t4149, 0
  %t4151 = extractvalue {i64, i1} %t4149, 1
  br i1 %t4151, label %fixslow920, label %fixmerge921
fixslow920:
  %t4152 = call i64 @rt_add(i64 %t4145, i64 %a0)
  br label %fixmerge921
fixmerge921:
  %t4153 = phi i64 [ %t4150, %fixfast919 ], [ %t4152, %fixslow920 ]
  %t4154 = and i64 %self, -8
  %t4155 = inttoptr i64 %t4154 to ptr
  %t4156 = getelementptr i64, ptr %t4155, i64 6
  %t4157 = load i64, ptr %t4156
  %t4158 = call i64 @rt_vector_ref(i64 %t4157, i64 %a0)
  %t4159 = call i64 @rt_vector_set(i64 %t4141, i64 %t4153, i64 %t4158)
  %t4160 = or i64 %a0, 8
  %t4161 = and i64 %t4160, 7
  %t4162 = icmp eq i64 %t4161, 0
  br i1 %t4162, label %fixfast922, label %fixslow923
fixfast922:
  %t4163 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4164 = extractvalue {i64, i1} %t4163, 0
  %t4165 = extractvalue {i64, i1} %t4163, 1
  br i1 %t4165, label %fixslow923, label %fixmerge924
fixslow923:
  %t4166 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge924
fixmerge924:
  %t4167 = phi i64 [ %t4164, %fixfast922 ], [ %t4166, %fixslow923 ]
  %t4168 = musttail call fastcc i64 @"scheme.base:code_876"(i64 %self, i64 1, i64 %t4167, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4168
}

define fastcc i64 @"scheme.base:code_874"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4169 = icmp eq i64 %argc, 2
  br i1 %t4169, label %argok926, label %arityerr925
arityerr925:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok926:
  %t4170 = call i64 @rt_null_p(i64 %a0)
  %t4171 = icmp ne i64 %t4170, 1
  br i1 %t4171, label %then927, label %else928
then927:
  %t4172 = and i64 %self, -8
  %t4173 = inttoptr i64 %t4172 to ptr
  %t4174 = getelementptr i64, ptr %t4173, i64 1
  %t4175 = load i64, ptr %t4174
  ret i64 %t4175
else928:
  %t4176 = call i64 @rt_car(i64 %a0)
  %t4177 = call i64 @rt_vector_length(i64 %t4176)
  %t4178 = call ptr @rt_alloc_words(i64 8)
  %t4179 = ptrtoint ptr %t4178 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_876" to i64), ptr %t4178
  %t4180 = or i64 %t4179, 4
  %t4181 = getelementptr i64, ptr %t4178, i64 1
  store i64 %t4177, ptr %t4181
  %t4182 = and i64 %self, -8
  %t4183 = inttoptr i64 %t4182 to ptr
  %t4184 = getelementptr i64, ptr %t4183, i64 2
  %t4185 = load i64, ptr %t4184
  %t4186 = getelementptr i64, ptr %t4178, i64 2
  store i64 %t4185, ptr %t4186
  %t4187 = getelementptr i64, ptr %t4178, i64 3
  store i64 %a0, ptr %t4187
  %t4188 = getelementptr i64, ptr %t4178, i64 4
  store i64 %a1, ptr %t4188
  %t4189 = and i64 %self, -8
  %t4190 = inttoptr i64 %t4189 to ptr
  %t4191 = getelementptr i64, ptr %t4190, i64 1
  %t4192 = load i64, ptr %t4191
  %t4193 = getelementptr i64, ptr %t4178, i64 5
  store i64 %t4192, ptr %t4193
  %t4194 = getelementptr i64, ptr %t4178, i64 6
  store i64 %t4176, ptr %t4194
  %t4195 = getelementptr i64, ptr %t4178, i64 7
  store i64 %t4180, ptr %t4195
  %t4196 = musttail call fastcc i64 @"scheme.base:code_876"(i64 %t4180, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4196
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4197 = icmp sge i64 %argc, 0
  br i1 %t4197, label %argok930, label %arityerr929
arityerr929:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok930:
  %t4198 = call ptr @rt_alloc_words(i64 8)
  %t4199 = getelementptr i64, ptr %t4198, i64 0
  store i64 %a0, ptr %t4199
  %t4200 = getelementptr i64, ptr %t4198, i64 1
  store i64 %a1, ptr %t4200
  %t4201 = getelementptr i64, ptr %t4198, i64 2
  store i64 %a2, ptr %t4201
  %t4202 = getelementptr i64, ptr %t4198, i64 3
  store i64 %a3, ptr %t4202
  %t4203 = getelementptr i64, ptr %t4198, i64 4
  store i64 %a4, ptr %t4203
  %t4204 = getelementptr i64, ptr %t4198, i64 5
  store i64 %a5, ptr %t4204
  %t4205 = getelementptr i64, ptr %t4198, i64 6
  store i64 %a6, ptr %t4205
  %t4206 = getelementptr i64, ptr %t4198, i64 7
  store i64 %a7, ptr %t4206
  %t4207 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4198, ptr %overflow)
  %t4208 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4208)
  %t4209 = and i64 %t4208, -8
  %t4210 = inttoptr i64 %t4209 to ptr
  %t4211 = load i64, ptr %t4210
  %t4212 = inttoptr i64 %t4211 to ptr
  %t4213 = call fastcc i64%t4212(i64 %t4208, i64 1, i64 %t4207, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4214 = call i64 @rt_make_vector(i64 %t4213, i64 0)
  %t4215 = call ptr @rt_alloc_words(i64 3)
  %t4216 = ptrtoint ptr %t4215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_874" to i64), ptr %t4215
  %t4217 = or i64 %t4216, 4
  %t4218 = getelementptr i64, ptr %t4215, i64 1
  store i64 %t4214, ptr %t4218
  %t4219 = getelementptr i64, ptr %t4215, i64 2
  store i64 %t4217, ptr %t4219
  %t4220 = musttail call fastcc i64 @"scheme.base:code_874"(i64 %t4217, i64 2, i64 %t4207, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4220
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4221 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4221)
  %t4222 = and i64 %t4221, -8
  %t4223 = inttoptr i64 %t4222 to ptr
  %t4224 = load i64, ptr %t4223
  %t4225 = inttoptr i64 %t4224 to ptr
  %t4226 = call fastcc i64%t4225(i64 %t4221, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4227 = call i64 @rt_make_vector(i64 %t4226, i64 0)
  %t4228 = call ptr @rt_alloc_words(i64 3)
  %t4229 = ptrtoint ptr %t4228 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_874" to i64), ptr %t4228
  %t4230 = or i64 %t4229, 4
  %t4231 = getelementptr i64, ptr %t4228, i64 1
  store i64 %t4227, ptr %t4231
  %t4232 = getelementptr i64, ptr %t4228, i64 2
  store i64 %t4230, ptr %t4232
  %t4233 = musttail call fastcc i64 @"scheme.base:code_874"(i64 %t4230, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4233
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4238 = icmp eq i64 %argc, 1
  br i1 %t4238, label %argok932, label %arityerr931
arityerr931:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok932:
  %t4239 = call i64 @rt_null_p(i64 %a0)
  %t4240 = icmp ne i64 %t4239, 1
  br i1 %t4240, label %then933, label %else934
then933:
  ret i64 0
else934:
  %t4241 = call i64 @rt_car(i64 %a0)
  %t4242 = call i64 @rt_vector_length(i64 %t4241)
  %t4243 = call i64 @rt_cdr(i64 %a0)
  %t4244 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4244)
  %t4245 = and i64 %t4244, -8
  %t4246 = inttoptr i64 %t4245 to ptr
  %t4247 = load i64, ptr %t4246
  %t4248 = inttoptr i64 %t4247 to ptr
  %t4249 = call fastcc i64%t4248(i64 %t4244, i64 1, i64 %t4243, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4250 = or i64 %t4242, %t4249
  %t4251 = and i64 %t4250, 7
  %t4252 = icmp eq i64 %t4251, 0
  br i1 %t4252, label %fixfast935, label %fixslow936
fixfast935:
  %t4253 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4242, i64 %t4249)
  %t4254 = extractvalue {i64, i1} %t4253, 0
  %t4255 = extractvalue {i64, i1} %t4253, 1
  br i1 %t4255, label %fixslow936, label %fixmerge937
fixslow936:
  %t4256 = call i64 @rt_add(i64 %t4242, i64 %t4249)
  br label %fixmerge937
fixmerge937:
  %t4257 = phi i64 [ %t4254, %fixfast935 ], [ %t4256, %fixslow936 ]
  ret i64 %t4257
}

define fastcc i64 @"scheme.base:code_891"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4262 = icmp eq i64 %argc, 1
  br i1 %t4262, label %argok939, label %arityerr938
arityerr938:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok939:
  %t4263 = and i64 %self, -8
  %t4264 = inttoptr i64 %t4263 to ptr
  %t4265 = getelementptr i64, ptr %t4264, i64 1
  %t4266 = load i64, ptr %t4265
  %t4267 = or i64 %a0, %t4266
  %t4268 = and i64 %t4267, 7
  %t4269 = icmp eq i64 %t4268, 0
  br i1 %t4269, label %fixfast940, label %fixslow941
fixfast940:
  %t4270 = icmp eq i64 %a0, %t4266
  %t4271 = select i1 %t4270, i64 257, i64 1
  br label %fixmerge942
fixslow941:
  %t4272 = call i64 @rt_num_eq(i64 %a0, i64 %t4266)
  br label %fixmerge942
fixmerge942:
  %t4273 = phi i64 [ %t4271, %fixfast940 ], [ %t4272, %fixslow941 ]
  %t4274 = icmp ne i64 %t4273, 1
  br i1 %t4274, label %then943, label %else944
then943:
  %t4275 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4275)
  %t4276 = and i64 %t4275, -8
  %t4277 = inttoptr i64 %t4276 to ptr
  %t4278 = load i64, ptr %t4277
  %t4279 = inttoptr i64 %t4278 to ptr
  %t4280 = musttail call fastcc i64 %t4279(i64 %t4275, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4280
else944:
  %t4281 = and i64 %self, -8
  %t4282 = inttoptr i64 %t4281 to ptr
  %t4283 = getelementptr i64, ptr %t4282, i64 2
  %t4284 = load i64, ptr %t4283
  %t4285 = and i64 %self, -8
  %t4286 = inttoptr i64 %t4285 to ptr
  %t4287 = getelementptr i64, ptr %t4286, i64 3
  %t4288 = load i64, ptr %t4287
  %t4289 = call i64 @rt_vector_set(i64 %t4284, i64 %a0, i64 %t4288)
  %t4290 = or i64 %a0, 8
  %t4291 = and i64 %t4290, 7
  %t4292 = icmp eq i64 %t4291, 0
  br i1 %t4292, label %fixfast945, label %fixslow946
fixfast945:
  %t4293 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4294 = extractvalue {i64, i1} %t4293, 0
  %t4295 = extractvalue {i64, i1} %t4293, 1
  br i1 %t4295, label %fixslow946, label %fixmerge947
fixslow946:
  %t4296 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge947
fixmerge947:
  %t4297 = phi i64 [ %t4294, %fixfast945 ], [ %t4296, %fixslow946 ]
  %t4298 = musttail call fastcc i64 @"scheme.base:code_891"(i64 %self, i64 1, i64 %t4297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4298
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4299 = icmp sge i64 %argc, 2
  br i1 %t4299, label %argok949, label %arityerr948
arityerr948:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok949:
  %t4300 = call ptr @rt_alloc_words(i64 8)
  %t4301 = getelementptr i64, ptr %t4300, i64 0
  store i64 %a0, ptr %t4301
  %t4302 = getelementptr i64, ptr %t4300, i64 1
  store i64 %a1, ptr %t4302
  %t4303 = getelementptr i64, ptr %t4300, i64 2
  store i64 %a2, ptr %t4303
  %t4304 = getelementptr i64, ptr %t4300, i64 3
  store i64 %a3, ptr %t4304
  %t4305 = getelementptr i64, ptr %t4300, i64 4
  store i64 %a4, ptr %t4305
  %t4306 = getelementptr i64, ptr %t4300, i64 5
  store i64 %a5, ptr %t4306
  %t4307 = getelementptr i64, ptr %t4300, i64 6
  store i64 %a6, ptr %t4307
  %t4308 = getelementptr i64, ptr %t4300, i64 7
  store i64 %a7, ptr %t4308
  %t4309 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4300, ptr %overflow)
  %t4310 = call i64 @rt_vector_length(i64 %a0)
  %t4311 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4311)
  %t4312 = and i64 %t4311, -8
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = load i64, ptr %t4313
  %t4315 = inttoptr i64 %t4314 to ptr
  %t4316 = call fastcc i64%t4315(i64 %t4311, i64 1, i64 %t4309, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4317 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4317)
  %t4318 = and i64 %t4317, -8
  %t4319 = inttoptr i64 %t4318 to ptr
  %t4320 = load i64, ptr %t4319
  %t4321 = inttoptr i64 %t4320 to ptr
  %t4322 = call fastcc i64%t4321(i64 %t4317, i64 2, i64 %t4309, i64 %t4310, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4323 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4324 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4324)
  %t4325 = and i64 %t4324, -8
  %t4326 = inttoptr i64 %t4325 to ptr
  %t4327 = load i64, ptr %t4326
  %t4328 = inttoptr i64 %t4327 to ptr
  %t4329 = call fastcc i64%t4328(i64 %t4324, i64 4, i64 %t4323, i64 %t4316, i64 %t4322, i64 %t4310, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4330 = call ptr @rt_alloc_words(i64 5)
  %t4331 = ptrtoint ptr %t4330 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_891" to i64), ptr %t4330
  %t4332 = or i64 %t4331, 4
  %t4333 = getelementptr i64, ptr %t4330, i64 1
  store i64 %t4322, ptr %t4333
  %t4334 = getelementptr i64, ptr %t4330, i64 2
  store i64 %a0, ptr %t4334
  %t4335 = getelementptr i64, ptr %t4330, i64 3
  store i64 %a1, ptr %t4335
  %t4336 = getelementptr i64, ptr %t4330, i64 4
  store i64 %t4332, ptr %t4336
  %t4337 = musttail call fastcc i64 @"scheme.base:code_891"(i64 %t4332, i64 1, i64 %t4316, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4337
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4338 = call i64 @rt_vector_length(i64 %a0)
  %t4339 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4339)
  %t4340 = and i64 %t4339, -8
  %t4341 = inttoptr i64 %t4340 to ptr
  %t4342 = load i64, ptr %t4341
  %t4343 = inttoptr i64 %t4342 to ptr
  %t4344 = call fastcc i64%t4343(i64 %t4339, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4345 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4345)
  %t4346 = and i64 %t4345, -8
  %t4347 = inttoptr i64 %t4346 to ptr
  %t4348 = load i64, ptr %t4347
  %t4349 = inttoptr i64 %t4348 to ptr
  %t4350 = call fastcc i64%t4349(i64 %t4345, i64 2, i64 2, i64 %t4338, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4351 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4352 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4352)
  %t4353 = and i64 %t4352, -8
  %t4354 = inttoptr i64 %t4353 to ptr
  %t4355 = load i64, ptr %t4354
  %t4356 = inttoptr i64 %t4355 to ptr
  %t4357 = call fastcc i64%t4356(i64 %t4352, i64 4, i64 %t4351, i64 %t4344, i64 %t4350, i64 %t4338, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4358 = call ptr @rt_alloc_words(i64 5)
  %t4359 = ptrtoint ptr %t4358 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_891" to i64), ptr %t4358
  %t4360 = or i64 %t4359, 4
  %t4361 = getelementptr i64, ptr %t4358, i64 1
  store i64 %t4350, ptr %t4361
  %t4362 = getelementptr i64, ptr %t4358, i64 2
  store i64 %a0, ptr %t4362
  %t4363 = getelementptr i64, ptr %t4358, i64 3
  store i64 %a1, ptr %t4363
  %t4364 = getelementptr i64, ptr %t4358, i64 4
  store i64 %t4360, ptr %t4364
  %t4365 = musttail call fastcc i64 @"scheme.base:code_891"(i64 %t4360, i64 1, i64 %t4344, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4365
}

define fastcc i64 @"scheme.base:code_911"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4370 = icmp eq i64 %argc, 1
  br i1 %t4370, label %argok951, label %arityerr950
arityerr950:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok951:
  %t4371 = or i64 %a0, 0
  %t4372 = and i64 %t4371, 7
  %t4373 = icmp eq i64 %t4372, 0
  br i1 %t4373, label %fixfast952, label %fixslow953
fixfast952:
  %t4374 = icmp slt i64 %a0, 0
  %t4375 = select i1 %t4374, i64 257, i64 1
  br label %fixmerge954
fixslow953:
  %t4376 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge954
fixmerge954:
  %t4377 = phi i64 [ %t4375, %fixfast952 ], [ %t4376, %fixslow953 ]
  %t4378 = icmp ne i64 %t4377, 1
  br i1 %t4378, label %then955, label %else956
then955:
  %t4379 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4379)
  %t4380 = and i64 %t4379, -8
  %t4381 = inttoptr i64 %t4380 to ptr
  %t4382 = load i64, ptr %t4381
  %t4383 = inttoptr i64 %t4382 to ptr
  %t4384 = musttail call fastcc i64 %t4383(i64 %t4379, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4384
else956:
  %t4385 = and i64 %self, -8
  %t4386 = inttoptr i64 %t4385 to ptr
  %t4387 = getelementptr i64, ptr %t4386, i64 1
  %t4388 = load i64, ptr %t4387
  %t4389 = and i64 %self, -8
  %t4390 = inttoptr i64 %t4389 to ptr
  %t4391 = getelementptr i64, ptr %t4390, i64 2
  %t4392 = load i64, ptr %t4391
  %t4393 = or i64 %t4392, %a0
  %t4394 = and i64 %t4393, 7
  %t4395 = icmp eq i64 %t4394, 0
  br i1 %t4395, label %fixfast957, label %fixslow958
fixfast957:
  %t4396 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4392, i64 %a0)
  %t4397 = extractvalue {i64, i1} %t4396, 0
  %t4398 = extractvalue {i64, i1} %t4396, 1
  br i1 %t4398, label %fixslow958, label %fixmerge959
fixslow958:
  %t4399 = call i64 @rt_add(i64 %t4392, i64 %a0)
  br label %fixmerge959
fixmerge959:
  %t4400 = phi i64 [ %t4397, %fixfast957 ], [ %t4399, %fixslow958 ]
  %t4401 = and i64 %self, -8
  %t4402 = inttoptr i64 %t4401 to ptr
  %t4403 = getelementptr i64, ptr %t4402, i64 3
  %t4404 = load i64, ptr %t4403
  %t4405 = and i64 %self, -8
  %t4406 = inttoptr i64 %t4405 to ptr
  %t4407 = getelementptr i64, ptr %t4406, i64 4
  %t4408 = load i64, ptr %t4407
  %t4409 = or i64 %t4408, %a0
  %t4410 = and i64 %t4409, 7
  %t4411 = icmp eq i64 %t4410, 0
  br i1 %t4411, label %fixfast960, label %fixslow961
fixfast960:
  %t4412 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4408, i64 %a0)
  %t4413 = extractvalue {i64, i1} %t4412, 0
  %t4414 = extractvalue {i64, i1} %t4412, 1
  br i1 %t4414, label %fixslow961, label %fixmerge962
fixslow961:
  %t4415 = call i64 @rt_add(i64 %t4408, i64 %a0)
  br label %fixmerge962
fixmerge962:
  %t4416 = phi i64 [ %t4413, %fixfast960 ], [ %t4415, %fixslow961 ]
  %t4417 = call i64 @rt_vector_ref(i64 %t4404, i64 %t4416)
  %t4418 = call i64 @rt_vector_set(i64 %t4388, i64 %t4400, i64 %t4417)
  %t4419 = or i64 %a0, 8
  %t4420 = and i64 %t4419, 7
  %t4421 = icmp eq i64 %t4420, 0
  br i1 %t4421, label %fixfast963, label %fixslow964
fixfast963:
  %t4422 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4423 = extractvalue {i64, i1} %t4422, 0
  %t4424 = extractvalue {i64, i1} %t4422, 1
  br i1 %t4424, label %fixslow964, label %fixmerge965
fixslow964:
  %t4425 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge965
fixmerge965:
  %t4426 = phi i64 [ %t4423, %fixfast963 ], [ %t4425, %fixslow964 ]
  %t4427 = musttail call fastcc i64 @"scheme.base:code_911"(i64 %self, i64 1, i64 %t4426, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4427
}

define fastcc i64 @"scheme.base:code_913"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4428 = icmp eq i64 %argc, 1
  br i1 %t4428, label %argok967, label %arityerr966
arityerr966:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok967:
  %t4429 = and i64 %self, -8
  %t4430 = inttoptr i64 %t4429 to ptr
  %t4431 = getelementptr i64, ptr %t4430, i64 1
  %t4432 = load i64, ptr %t4431
  %t4433 = and i64 %self, -8
  %t4434 = inttoptr i64 %t4433 to ptr
  %t4435 = getelementptr i64, ptr %t4434, i64 2
  %t4436 = load i64, ptr %t4435
  %t4437 = or i64 %t4432, %t4436
  %t4438 = and i64 %t4437, 7
  %t4439 = icmp eq i64 %t4438, 0
  br i1 %t4439, label %fixfast968, label %fixslow969
fixfast968:
  %t4440 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4432, i64 %t4436)
  %t4441 = extractvalue {i64, i1} %t4440, 0
  %t4442 = extractvalue {i64, i1} %t4440, 1
  br i1 %t4442, label %fixslow969, label %fixmerge970
fixslow969:
  %t4443 = call i64 @rt_sub(i64 %t4432, i64 %t4436)
  br label %fixmerge970
fixmerge970:
  %t4444 = phi i64 [ %t4441, %fixfast968 ], [ %t4443, %fixslow969 ]
  %t4445 = or i64 %a0, %t4444
  %t4446 = and i64 %t4445, 7
  %t4447 = icmp eq i64 %t4446, 0
  br i1 %t4447, label %fixfast971, label %fixslow972
fixfast971:
  %t4448 = icmp eq i64 %a0, %t4444
  %t4449 = select i1 %t4448, i64 257, i64 1
  br label %fixmerge973
fixslow972:
  %t4450 = call i64 @rt_num_eq(i64 %a0, i64 %t4444)
  br label %fixmerge973
fixmerge973:
  %t4451 = phi i64 [ %t4449, %fixfast971 ], [ %t4450, %fixslow972 ]
  %t4452 = icmp ne i64 %t4451, 1
  br i1 %t4452, label %then974, label %else975
then974:
  %t4453 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4453)
  %t4454 = and i64 %t4453, -8
  %t4455 = inttoptr i64 %t4454 to ptr
  %t4456 = load i64, ptr %t4455
  %t4457 = inttoptr i64 %t4456 to ptr
  %t4458 = musttail call fastcc i64 %t4457(i64 %t4453, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4458
else975:
  %t4459 = and i64 %self, -8
  %t4460 = inttoptr i64 %t4459 to ptr
  %t4461 = getelementptr i64, ptr %t4460, i64 3
  %t4462 = load i64, ptr %t4461
  %t4463 = and i64 %self, -8
  %t4464 = inttoptr i64 %t4463 to ptr
  %t4465 = getelementptr i64, ptr %t4464, i64 4
  %t4466 = load i64, ptr %t4465
  %t4467 = or i64 %t4466, %a0
  %t4468 = and i64 %t4467, 7
  %t4469 = icmp eq i64 %t4468, 0
  br i1 %t4469, label %fixfast976, label %fixslow977
fixfast976:
  %t4470 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4466, i64 %a0)
  %t4471 = extractvalue {i64, i1} %t4470, 0
  %t4472 = extractvalue {i64, i1} %t4470, 1
  br i1 %t4472, label %fixslow977, label %fixmerge978
fixslow977:
  %t4473 = call i64 @rt_add(i64 %t4466, i64 %a0)
  br label %fixmerge978
fixmerge978:
  %t4474 = phi i64 [ %t4471, %fixfast976 ], [ %t4473, %fixslow977 ]
  %t4475 = and i64 %self, -8
  %t4476 = inttoptr i64 %t4475 to ptr
  %t4477 = getelementptr i64, ptr %t4476, i64 5
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
  %t4491 = call i64 @rt_vector_ref(i64 %t4478, i64 %t4490)
  %t4492 = call i64 @rt_vector_set(i64 %t4462, i64 %t4474, i64 %t4491)
  %t4493 = or i64 %a0, 8
  %t4494 = and i64 %t4493, 7
  %t4495 = icmp eq i64 %t4494, 0
  br i1 %t4495, label %fixfast982, label %fixslow983
fixfast982:
  %t4496 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4497 = extractvalue {i64, i1} %t4496, 0
  %t4498 = extractvalue {i64, i1} %t4496, 1
  br i1 %t4498, label %fixslow983, label %fixmerge984
fixslow983:
  %t4499 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge984
fixmerge984:
  %t4500 = phi i64 [ %t4497, %fixfast982 ], [ %t4499, %fixslow983 ]
  %t4501 = musttail call fastcc i64 @"scheme.base:code_913"(i64 %self, i64 1, i64 %t4500, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4501
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4502 = icmp sge i64 %argc, 3
  br i1 %t4502, label %argok986, label %arityerr985
arityerr985:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok986:
  %t4503 = call ptr @rt_alloc_words(i64 8)
  %t4504 = getelementptr i64, ptr %t4503, i64 0
  store i64 %a0, ptr %t4504
  %t4505 = getelementptr i64, ptr %t4503, i64 1
  store i64 %a1, ptr %t4505
  %t4506 = getelementptr i64, ptr %t4503, i64 2
  store i64 %a2, ptr %t4506
  %t4507 = getelementptr i64, ptr %t4503, i64 3
  store i64 %a3, ptr %t4507
  %t4508 = getelementptr i64, ptr %t4503, i64 4
  store i64 %a4, ptr %t4508
  %t4509 = getelementptr i64, ptr %t4503, i64 5
  store i64 %a5, ptr %t4509
  %t4510 = getelementptr i64, ptr %t4503, i64 6
  store i64 %a6, ptr %t4510
  %t4511 = getelementptr i64, ptr %t4503, i64 7
  store i64 %a7, ptr %t4511
  %t4512 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4503, ptr %overflow)
  %t4513 = call i64 @rt_vector_length(i64 %a2)
  %t4514 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4514)
  %t4515 = and i64 %t4514, -8
  %t4516 = inttoptr i64 %t4515 to ptr
  %t4517 = load i64, ptr %t4516
  %t4518 = inttoptr i64 %t4517 to ptr
  %t4519 = call fastcc i64%t4518(i64 %t4514, i64 1, i64 %t4512, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4520 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4520)
  %t4521 = and i64 %t4520, -8
  %t4522 = inttoptr i64 %t4521 to ptr
  %t4523 = load i64, ptr %t4522
  %t4524 = inttoptr i64 %t4523 to ptr
  %t4525 = call fastcc i64%t4524(i64 %t4520, i64 2, i64 %t4512, i64 %t4513, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4526 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4527 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4527)
  %t4528 = and i64 %t4527, -8
  %t4529 = inttoptr i64 %t4528 to ptr
  %t4530 = load i64, ptr %t4529
  %t4531 = inttoptr i64 %t4530 to ptr
  %t4532 = call fastcc i64%t4531(i64 %t4527, i64 4, i64 %t4526, i64 %t4519, i64 %t4525, i64 %t4513, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4533 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4534 = or i64 %t4525, %t4519
  %t4535 = and i64 %t4534, 7
  %t4536 = icmp eq i64 %t4535, 0
  br i1 %t4536, label %fixfast987, label %fixslow988
fixfast987:
  %t4537 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4525, i64 %t4519)
  %t4538 = extractvalue {i64, i1} %t4537, 0
  %t4539 = extractvalue {i64, i1} %t4537, 1
  br i1 %t4539, label %fixslow988, label %fixmerge989
fixslow988:
  %t4540 = call i64 @rt_sub(i64 %t4525, i64 %t4519)
  br label %fixmerge989
fixmerge989:
  %t4541 = phi i64 [ %t4538, %fixfast987 ], [ %t4540, %fixslow988 ]
  %t4542 = or i64 %a1, %t4541
  %t4543 = and i64 %t4542, 7
  %t4544 = icmp eq i64 %t4543, 0
  br i1 %t4544, label %fixfast990, label %fixslow991
fixfast990:
  %t4545 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4541)
  %t4546 = extractvalue {i64, i1} %t4545, 0
  %t4547 = extractvalue {i64, i1} %t4545, 1
  br i1 %t4547, label %fixslow991, label %fixmerge992
fixslow991:
  %t4548 = call i64 @rt_add(i64 %a1, i64 %t4541)
  br label %fixmerge992
fixmerge992:
  %t4549 = phi i64 [ %t4546, %fixfast990 ], [ %t4548, %fixslow991 ]
  %t4550 = call i64 @rt_vector_length(i64 %a0)
  %t4551 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4551)
  %t4552 = and i64 %t4551, -8
  %t4553 = inttoptr i64 %t4552 to ptr
  %t4554 = load i64, ptr %t4553
  %t4555 = inttoptr i64 %t4554 to ptr
  %t4556 = call fastcc i64%t4555(i64 %t4551, i64 4, i64 %t4533, i64 %a1, i64 %t4549, i64 %t4550, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4557 = or i64 %t4519, %a1
  %t4558 = and i64 %t4557, 7
  %t4559 = icmp eq i64 %t4558, 0
  br i1 %t4559, label %fixfast993, label %fixslow994
fixfast993:
  %t4560 = icmp slt i64 %t4519, %a1
  %t4561 = select i1 %t4560, i64 257, i64 1
  br label %fixmerge995
fixslow994:
  %t4562 = call i64 @rt_lt(i64 %t4519, i64 %a1)
  br label %fixmerge995
fixmerge995:
  %t4563 = phi i64 [ %t4561, %fixfast993 ], [ %t4562, %fixslow994 ]
  %t4564 = icmp ne i64 %t4563, 1
  br i1 %t4564, label %then996, label %else997
then996:
  %t4565 = call ptr @rt_alloc_words(i64 6)
  %t4566 = ptrtoint ptr %t4565 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_911" to i64), ptr %t4565
  %t4567 = or i64 %t4566, 4
  %t4568 = getelementptr i64, ptr %t4565, i64 1
  store i64 %a0, ptr %t4568
  %t4569 = getelementptr i64, ptr %t4565, i64 2
  store i64 %a1, ptr %t4569
  %t4570 = getelementptr i64, ptr %t4565, i64 3
  store i64 %a2, ptr %t4570
  %t4571 = getelementptr i64, ptr %t4565, i64 4
  store i64 %t4519, ptr %t4571
  %t4572 = getelementptr i64, ptr %t4565, i64 5
  store i64 %t4567, ptr %t4572
  %t4573 = or i64 %t4525, %t4519
  %t4574 = and i64 %t4573, 7
  %t4575 = icmp eq i64 %t4574, 0
  br i1 %t4575, label %fixfast998, label %fixslow999
fixfast998:
  %t4576 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4525, i64 %t4519)
  %t4577 = extractvalue {i64, i1} %t4576, 0
  %t4578 = extractvalue {i64, i1} %t4576, 1
  br i1 %t4578, label %fixslow999, label %fixmerge1000
fixslow999:
  %t4579 = call i64 @rt_sub(i64 %t4525, i64 %t4519)
  br label %fixmerge1000
fixmerge1000:
  %t4580 = phi i64 [ %t4577, %fixfast998 ], [ %t4579, %fixslow999 ]
  %t4581 = or i64 %t4580, 8
  %t4582 = and i64 %t4581, 7
  %t4583 = icmp eq i64 %t4582, 0
  br i1 %t4583, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t4584 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4580, i64 8)
  %t4585 = extractvalue {i64, i1} %t4584, 0
  %t4586 = extractvalue {i64, i1} %t4584, 1
  br i1 %t4586, label %fixslow1002, label %fixmerge1003
fixslow1002:
  %t4587 = call i64 @rt_sub(i64 %t4580, i64 8)
  br label %fixmerge1003
fixmerge1003:
  %t4588 = phi i64 [ %t4585, %fixfast1001 ], [ %t4587, %fixslow1002 ]
  %t4589 = musttail call fastcc i64 @"scheme.base:code_911"(i64 %t4567, i64 1, i64 %t4588, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4589
else997:
  %t4590 = call ptr @rt_alloc_words(i64 7)
  %t4591 = ptrtoint ptr %t4590 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_913" to i64), ptr %t4590
  %t4592 = or i64 %t4591, 4
  %t4593 = getelementptr i64, ptr %t4590, i64 1
  store i64 %t4525, ptr %t4593
  %t4594 = getelementptr i64, ptr %t4590, i64 2
  store i64 %t4519, ptr %t4594
  %t4595 = getelementptr i64, ptr %t4590, i64 3
  store i64 %a0, ptr %t4595
  %t4596 = getelementptr i64, ptr %t4590, i64 4
  store i64 %a1, ptr %t4596
  %t4597 = getelementptr i64, ptr %t4590, i64 5
  store i64 %a2, ptr %t4597
  %t4598 = getelementptr i64, ptr %t4590, i64 6
  store i64 %t4592, ptr %t4598
  %t4599 = musttail call fastcc i64 @"scheme.base:code_913"(i64 %t4592, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4599
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4600 = call i64 @rt_vector_length(i64 %a2)
  %t4601 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4601)
  %t4602 = and i64 %t4601, -8
  %t4603 = inttoptr i64 %t4602 to ptr
  %t4604 = load i64, ptr %t4603
  %t4605 = inttoptr i64 %t4604 to ptr
  %t4606 = call fastcc i64%t4605(i64 %t4601, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4607 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4607)
  %t4608 = and i64 %t4607, -8
  %t4609 = inttoptr i64 %t4608 to ptr
  %t4610 = load i64, ptr %t4609
  %t4611 = inttoptr i64 %t4610 to ptr
  %t4612 = call fastcc i64%t4611(i64 %t4607, i64 2, i64 2, i64 %t4600, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4613 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4614 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4614)
  %t4615 = and i64 %t4614, -8
  %t4616 = inttoptr i64 %t4615 to ptr
  %t4617 = load i64, ptr %t4616
  %t4618 = inttoptr i64 %t4617 to ptr
  %t4619 = call fastcc i64%t4618(i64 %t4614, i64 4, i64 %t4613, i64 %t4606, i64 %t4612, i64 %t4600, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4620 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4621 = or i64 %t4612, %t4606
  %t4622 = and i64 %t4621, 7
  %t4623 = icmp eq i64 %t4622, 0
  br i1 %t4623, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t4624 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4612, i64 %t4606)
  %t4625 = extractvalue {i64, i1} %t4624, 0
  %t4626 = extractvalue {i64, i1} %t4624, 1
  br i1 %t4626, label %fixslow1005, label %fixmerge1006
fixslow1005:
  %t4627 = call i64 @rt_sub(i64 %t4612, i64 %t4606)
  br label %fixmerge1006
fixmerge1006:
  %t4628 = phi i64 [ %t4625, %fixfast1004 ], [ %t4627, %fixslow1005 ]
  %t4629 = or i64 %a1, %t4628
  %t4630 = and i64 %t4629, 7
  %t4631 = icmp eq i64 %t4630, 0
  br i1 %t4631, label %fixfast1007, label %fixslow1008
fixfast1007:
  %t4632 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4628)
  %t4633 = extractvalue {i64, i1} %t4632, 0
  %t4634 = extractvalue {i64, i1} %t4632, 1
  br i1 %t4634, label %fixslow1008, label %fixmerge1009
fixslow1008:
  %t4635 = call i64 @rt_add(i64 %a1, i64 %t4628)
  br label %fixmerge1009
fixmerge1009:
  %t4636 = phi i64 [ %t4633, %fixfast1007 ], [ %t4635, %fixslow1008 ]
  %t4637 = call i64 @rt_vector_length(i64 %a0)
  %t4638 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4638)
  %t4639 = and i64 %t4638, -8
  %t4640 = inttoptr i64 %t4639 to ptr
  %t4641 = load i64, ptr %t4640
  %t4642 = inttoptr i64 %t4641 to ptr
  %t4643 = call fastcc i64%t4642(i64 %t4638, i64 4, i64 %t4620, i64 %a1, i64 %t4636, i64 %t4637, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4644 = or i64 %t4606, %a1
  %t4645 = and i64 %t4644, 7
  %t4646 = icmp eq i64 %t4645, 0
  br i1 %t4646, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t4647 = icmp slt i64 %t4606, %a1
  %t4648 = select i1 %t4647, i64 257, i64 1
  br label %fixmerge1012
fixslow1011:
  %t4649 = call i64 @rt_lt(i64 %t4606, i64 %a1)
  br label %fixmerge1012
fixmerge1012:
  %t4650 = phi i64 [ %t4648, %fixfast1010 ], [ %t4649, %fixslow1011 ]
  %t4651 = icmp ne i64 %t4650, 1
  br i1 %t4651, label %then1013, label %else1014
then1013:
  %t4652 = call ptr @rt_alloc_words(i64 6)
  %t4653 = ptrtoint ptr %t4652 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_911" to i64), ptr %t4652
  %t4654 = or i64 %t4653, 4
  %t4655 = getelementptr i64, ptr %t4652, i64 1
  store i64 %a0, ptr %t4655
  %t4656 = getelementptr i64, ptr %t4652, i64 2
  store i64 %a1, ptr %t4656
  %t4657 = getelementptr i64, ptr %t4652, i64 3
  store i64 %a2, ptr %t4657
  %t4658 = getelementptr i64, ptr %t4652, i64 4
  store i64 %t4606, ptr %t4658
  %t4659 = getelementptr i64, ptr %t4652, i64 5
  store i64 %t4654, ptr %t4659
  %t4660 = or i64 %t4612, %t4606
  %t4661 = and i64 %t4660, 7
  %t4662 = icmp eq i64 %t4661, 0
  br i1 %t4662, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t4663 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4612, i64 %t4606)
  %t4664 = extractvalue {i64, i1} %t4663, 0
  %t4665 = extractvalue {i64, i1} %t4663, 1
  br i1 %t4665, label %fixslow1016, label %fixmerge1017
fixslow1016:
  %t4666 = call i64 @rt_sub(i64 %t4612, i64 %t4606)
  br label %fixmerge1017
fixmerge1017:
  %t4667 = phi i64 [ %t4664, %fixfast1015 ], [ %t4666, %fixslow1016 ]
  %t4668 = or i64 %t4667, 8
  %t4669 = and i64 %t4668, 7
  %t4670 = icmp eq i64 %t4669, 0
  br i1 %t4670, label %fixfast1018, label %fixslow1019
fixfast1018:
  %t4671 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4667, i64 8)
  %t4672 = extractvalue {i64, i1} %t4671, 0
  %t4673 = extractvalue {i64, i1} %t4671, 1
  br i1 %t4673, label %fixslow1019, label %fixmerge1020
fixslow1019:
  %t4674 = call i64 @rt_sub(i64 %t4667, i64 8)
  br label %fixmerge1020
fixmerge1020:
  %t4675 = phi i64 [ %t4672, %fixfast1018 ], [ %t4674, %fixslow1019 ]
  %t4676 = musttail call fastcc i64 @"scheme.base:code_911"(i64 %t4654, i64 1, i64 %t4675, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4676
else1014:
  %t4677 = call ptr @rt_alloc_words(i64 7)
  %t4678 = ptrtoint ptr %t4677 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_913" to i64), ptr %t4677
  %t4679 = or i64 %t4678, 4
  %t4680 = getelementptr i64, ptr %t4677, i64 1
  store i64 %t4612, ptr %t4680
  %t4681 = getelementptr i64, ptr %t4677, i64 2
  store i64 %t4606, ptr %t4681
  %t4682 = getelementptr i64, ptr %t4677, i64 3
  store i64 %a0, ptr %t4682
  %t4683 = getelementptr i64, ptr %t4677, i64 4
  store i64 %a1, ptr %t4683
  %t4684 = getelementptr i64, ptr %t4677, i64 5
  store i64 %a2, ptr %t4684
  %t4685 = getelementptr i64, ptr %t4677, i64 6
  store i64 %t4679, ptr %t4685
  %t4686 = musttail call fastcc i64 @"scheme.base:code_913"(i64 %t4679, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4686
}

define fastcc i64 @"scheme.base:code_932"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4691 = icmp eq i64 %argc, 1
  br i1 %t4691, label %argok1022, label %arityerr1021
arityerr1021:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1022:
  %t4692 = and i64 %self, -8
  %t4693 = inttoptr i64 %t4692 to ptr
  %t4694 = getelementptr i64, ptr %t4693, i64 1
  %t4695 = load i64, ptr %t4694
  %t4696 = or i64 %a0, %t4695
  %t4697 = and i64 %t4696, 7
  %t4698 = icmp eq i64 %t4697, 0
  br i1 %t4698, label %fixfast1023, label %fixslow1024
fixfast1023:
  %t4699 = icmp eq i64 %a0, %t4695
  %t4700 = select i1 %t4699, i64 257, i64 1
  br label %fixmerge1025
fixslow1024:
  %t4701 = call i64 @rt_num_eq(i64 %a0, i64 %t4695)
  br label %fixmerge1025
fixmerge1025:
  %t4702 = phi i64 [ %t4700, %fixfast1023 ], [ %t4701, %fixslow1024 ]
  %t4703 = icmp ne i64 %t4702, 1
  br i1 %t4703, label %then1026, label %else1027
then1026:
  %t4704 = and i64 %self, -8
  %t4705 = inttoptr i64 %t4704 to ptr
  %t4706 = getelementptr i64, ptr %t4705, i64 2
  %t4707 = load i64, ptr %t4706
  ret i64 %t4707
else1027:
  %t4708 = and i64 %self, -8
  %t4709 = inttoptr i64 %t4708 to ptr
  %t4710 = getelementptr i64, ptr %t4709, i64 2
  %t4711 = load i64, ptr %t4710
  %t4712 = and i64 %self, -8
  %t4713 = inttoptr i64 %t4712 to ptr
  %t4714 = getelementptr i64, ptr %t4713, i64 4
  %t4715 = load i64, ptr %t4714
  %t4716 = call i64 @rt_vector_ref(i64 %t4715, i64 %a0)
  %t4717 = and i64 %self, -8
  %t4718 = inttoptr i64 %t4717 to ptr
  %t4719 = getelementptr i64, ptr %t4718, i64 3
  %t4720 = load i64, ptr %t4719
  call void @rt_check_callable(i64 %t4720)
  %t4721 = and i64 %t4720, -8
  %t4722 = inttoptr i64 %t4721 to ptr
  %t4723 = load i64, ptr %t4722
  %t4724 = inttoptr i64 %t4723 to ptr
  %t4725 = call fastcc i64%t4724(i64 %t4720, i64 1, i64 %t4716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4726 = call i64 @rt_vector_set(i64 %t4711, i64 %a0, i64 %t4725)
  %t4727 = or i64 %a0, 8
  %t4728 = and i64 %t4727, 7
  %t4729 = icmp eq i64 %t4728, 0
  br i1 %t4729, label %fixfast1028, label %fixslow1029
fixfast1028:
  %t4730 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4731 = extractvalue {i64, i1} %t4730, 0
  %t4732 = extractvalue {i64, i1} %t4730, 1
  br i1 %t4732, label %fixslow1029, label %fixmerge1030
fixslow1029:
  %t4733 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1030
fixmerge1030:
  %t4734 = phi i64 [ %t4731, %fixfast1028 ], [ %t4733, %fixslow1029 ]
  %t4735 = musttail call fastcc i64 @"scheme.base:code_932"(i64 %self, i64 1, i64 %t4734, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4735
}

define fastcc i64 @"scheme.base:code_934"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4736 = icmp eq i64 %argc, 1
  br i1 %t4736, label %argok1032, label %arityerr1031
arityerr1031:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1032:
  %t4737 = and i64 %self, -8
  %t4738 = inttoptr i64 %t4737 to ptr
  %t4739 = getelementptr i64, ptr %t4738, i64 1
  %t4740 = load i64, ptr %t4739
  %t4741 = or i64 %a0, %t4740
  %t4742 = and i64 %t4741, 7
  %t4743 = icmp eq i64 %t4742, 0
  br i1 %t4743, label %fixfast1033, label %fixslow1034
fixfast1033:
  %t4744 = icmp eq i64 %a0, %t4740
  %t4745 = select i1 %t4744, i64 257, i64 1
  br label %fixmerge1035
fixslow1034:
  %t4746 = call i64 @rt_num_eq(i64 %a0, i64 %t4740)
  br label %fixmerge1035
fixmerge1035:
  %t4747 = phi i64 [ %t4745, %fixfast1033 ], [ %t4746, %fixslow1034 ]
  %t4748 = icmp ne i64 %t4747, 1
  br i1 %t4748, label %then1036, label %else1037
then1036:
  %t4749 = and i64 %self, -8
  %t4750 = inttoptr i64 %t4749 to ptr
  %t4751 = getelementptr i64, ptr %t4750, i64 2
  %t4752 = load i64, ptr %t4751
  ret i64 %t4752
else1037:
  %t4753 = and i64 %self, -8
  %t4754 = inttoptr i64 %t4753 to ptr
  %t4755 = getelementptr i64, ptr %t4754, i64 2
  %t4756 = load i64, ptr %t4755
  %t4757 = and i64 %self, -8
  %t4758 = inttoptr i64 %t4757 to ptr
  %t4759 = getelementptr i64, ptr %t4758, i64 4
  %t4760 = load i64, ptr %t4759
  %t4761 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4761)
  %t4762 = and i64 %t4761, -8
  %t4763 = inttoptr i64 %t4762 to ptr
  %t4764 = load i64, ptr %t4763
  %t4765 = inttoptr i64 %t4764 to ptr
  %t4766 = call fastcc i64%t4765(i64 %t4761, i64 2, i64 %t4760, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4767 = and i64 %self, -8
  %t4768 = inttoptr i64 %t4767 to ptr
  %t4769 = getelementptr i64, ptr %t4768, i64 3
  %t4770 = load i64, ptr %t4769
  call void @rt_check_callable(i64 %t4770)
  %t4771 = and i64 %t4770, -8
  %t4772 = inttoptr i64 %t4771 to ptr
  %t4773 = load i64, ptr %t4772
  %t4774 = inttoptr i64 %t4773 to ptr
  %t4775 = call i64 @rt_list_length(i64 %t4766)
  %t4776 = add i64 0, %t4775
  %t4777 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4766, i64 8)
  %t4789 = getelementptr i64, ptr %t4777, i64 0
  %t4781 = load i64, ptr %t4789
  %t4790 = getelementptr i64, ptr %t4777, i64 1
  %t4782 = load i64, ptr %t4790
  %t4791 = getelementptr i64, ptr %t4777, i64 2
  %t4783 = load i64, ptr %t4791
  %t4792 = getelementptr i64, ptr %t4777, i64 3
  %t4784 = load i64, ptr %t4792
  %t4793 = getelementptr i64, ptr %t4777, i64 4
  %t4785 = load i64, ptr %t4793
  %t4794 = getelementptr i64, ptr %t4777, i64 5
  %t4786 = load i64, ptr %t4794
  %t4795 = getelementptr i64, ptr %t4777, i64 6
  %t4787 = load i64, ptr %t4795
  %t4796 = getelementptr i64, ptr %t4777, i64 7
  %t4788 = load i64, ptr %t4796
  %t4778 = icmp sgt i64 %t4776, 8
  %t4779 = getelementptr i64, ptr %t4777, i64 8
  %t4780 = select i1 %t4778, ptr %t4779, ptr null
  %t4797 = call fastcc i64%t4774(i64 %t4770, i64 %t4776, i64 %t4781, i64 %t4782, i64 %t4783, i64 %t4784, i64 %t4785, i64 %t4786, i64 %t4787, i64 %t4788, ptr %t4780)
  %t4798 = call i64 @rt_vector_set(i64 %t4756, i64 %a0, i64 %t4797)
  %t4799 = or i64 %a0, 8
  %t4800 = and i64 %t4799, 7
  %t4801 = icmp eq i64 %t4800, 0
  br i1 %t4801, label %fixfast1038, label %fixslow1039
fixfast1038:
  %t4802 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4803 = extractvalue {i64, i1} %t4802, 0
  %t4804 = extractvalue {i64, i1} %t4802, 1
  br i1 %t4804, label %fixslow1039, label %fixmerge1040
fixslow1039:
  %t4805 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1040
fixmerge1040:
  %t4806 = phi i64 [ %t4803, %fixfast1038 ], [ %t4805, %fixslow1039 ]
  %t4807 = musttail call fastcc i64 @"scheme.base:code_934"(i64 %self, i64 1, i64 %t4806, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4807
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4808 = icmp sge i64 %argc, 2
  br i1 %t4808, label %argok1042, label %arityerr1041
arityerr1041:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1042:
  %t4809 = call ptr @rt_alloc_words(i64 8)
  %t4810 = getelementptr i64, ptr %t4809, i64 0
  store i64 %a0, ptr %t4810
  %t4811 = getelementptr i64, ptr %t4809, i64 1
  store i64 %a1, ptr %t4811
  %t4812 = getelementptr i64, ptr %t4809, i64 2
  store i64 %a2, ptr %t4812
  %t4813 = getelementptr i64, ptr %t4809, i64 3
  store i64 %a3, ptr %t4813
  %t4814 = getelementptr i64, ptr %t4809, i64 4
  store i64 %a4, ptr %t4814
  %t4815 = getelementptr i64, ptr %t4809, i64 5
  store i64 %a5, ptr %t4815
  %t4816 = getelementptr i64, ptr %t4809, i64 6
  store i64 %a6, ptr %t4816
  %t4817 = getelementptr i64, ptr %t4809, i64 7
  store i64 %a7, ptr %t4817
  %t4818 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4809, ptr %overflow)
  %t4819 = call i64 @rt_null_p(i64 %t4818)
  %t4820 = icmp ne i64 %t4819, 1
  br i1 %t4820, label %then1043, label %else1044
then1043:
  %t4821 = call i64 @rt_vector_length(i64 %a1)
  %t4822 = call i64 @rt_make_vector(i64 %t4821, i64 0)
  %t4823 = call ptr @rt_alloc_words(i64 6)
  %t4824 = ptrtoint ptr %t4823 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_932" to i64), ptr %t4823
  %t4825 = or i64 %t4824, 4
  %t4826 = getelementptr i64, ptr %t4823, i64 1
  store i64 %t4821, ptr %t4826
  %t4827 = getelementptr i64, ptr %t4823, i64 2
  store i64 %t4822, ptr %t4827
  %t4828 = getelementptr i64, ptr %t4823, i64 3
  store i64 %a0, ptr %t4828
  %t4829 = getelementptr i64, ptr %t4823, i64 4
  store i64 %a1, ptr %t4829
  %t4830 = getelementptr i64, ptr %t4823, i64 5
  store i64 %t4825, ptr %t4830
  %t4831 = musttail call fastcc i64 @"scheme.base:code_932"(i64 %t4825, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4831
else1044:
  %t4832 = call i64 @rt_cons(i64 %a1, i64 %t4818)
  %t4833 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4833)
  %t4834 = and i64 %t4833, -8
  %t4835 = inttoptr i64 %t4834 to ptr
  %t4836 = load i64, ptr %t4835
  %t4837 = inttoptr i64 %t4836 to ptr
  %t4838 = call fastcc i64%t4837(i64 %t4833, i64 1, i64 %t4832, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4839 = call i64 @rt_make_vector(i64 %t4838, i64 0)
  %t4840 = call ptr @rt_alloc_words(i64 6)
  %t4841 = ptrtoint ptr %t4840 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_934" to i64), ptr %t4840
  %t4842 = or i64 %t4841, 4
  %t4843 = getelementptr i64, ptr %t4840, i64 1
  store i64 %t4838, ptr %t4843
  %t4844 = getelementptr i64, ptr %t4840, i64 2
  store i64 %t4839, ptr %t4844
  %t4845 = getelementptr i64, ptr %t4840, i64 3
  store i64 %a0, ptr %t4845
  %t4846 = getelementptr i64, ptr %t4840, i64 4
  store i64 %t4832, ptr %t4846
  %t4847 = getelementptr i64, ptr %t4840, i64 5
  store i64 %t4842, ptr %t4847
  %t4848 = musttail call fastcc i64 @"scheme.base:code_934"(i64 %t4842, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4848
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4849 = call i64 @rt_null_p(i64 2)
  %t4850 = icmp ne i64 %t4849, 1
  br i1 %t4850, label %then1045, label %else1046
then1045:
  %t4851 = call i64 @rt_vector_length(i64 %a1)
  %t4852 = call i64 @rt_make_vector(i64 %t4851, i64 0)
  %t4853 = call ptr @rt_alloc_words(i64 6)
  %t4854 = ptrtoint ptr %t4853 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_932" to i64), ptr %t4853
  %t4855 = or i64 %t4854, 4
  %t4856 = getelementptr i64, ptr %t4853, i64 1
  store i64 %t4851, ptr %t4856
  %t4857 = getelementptr i64, ptr %t4853, i64 2
  store i64 %t4852, ptr %t4857
  %t4858 = getelementptr i64, ptr %t4853, i64 3
  store i64 %a0, ptr %t4858
  %t4859 = getelementptr i64, ptr %t4853, i64 4
  store i64 %a1, ptr %t4859
  %t4860 = getelementptr i64, ptr %t4853, i64 5
  store i64 %t4855, ptr %t4860
  %t4861 = musttail call fastcc i64 @"scheme.base:code_932"(i64 %t4855, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4861
else1046:
  %t4862 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4863 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4863)
  %t4864 = and i64 %t4863, -8
  %t4865 = inttoptr i64 %t4864 to ptr
  %t4866 = load i64, ptr %t4865
  %t4867 = inttoptr i64 %t4866 to ptr
  %t4868 = call fastcc i64%t4867(i64 %t4863, i64 1, i64 %t4862, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4869 = call i64 @rt_make_vector(i64 %t4868, i64 0)
  %t4870 = call ptr @rt_alloc_words(i64 6)
  %t4871 = ptrtoint ptr %t4870 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_934" to i64), ptr %t4870
  %t4872 = or i64 %t4871, 4
  %t4873 = getelementptr i64, ptr %t4870, i64 1
  store i64 %t4868, ptr %t4873
  %t4874 = getelementptr i64, ptr %t4870, i64 2
  store i64 %t4869, ptr %t4874
  %t4875 = getelementptr i64, ptr %t4870, i64 3
  store i64 %a0, ptr %t4875
  %t4876 = getelementptr i64, ptr %t4870, i64 4
  store i64 %t4862, ptr %t4876
  %t4877 = getelementptr i64, ptr %t4870, i64 5
  store i64 %t4872, ptr %t4877
  %t4878 = musttail call fastcc i64 @"scheme.base:code_934"(i64 %t4872, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4878
}

define fastcc i64 @"scheme.base:code_951"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4883 = icmp eq i64 %argc, 1
  br i1 %t4883, label %argok1048, label %arityerr1047
arityerr1047:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1048:
  %t4884 = and i64 %self, -8
  %t4885 = inttoptr i64 %t4884 to ptr
  %t4886 = getelementptr i64, ptr %t4885, i64 1
  %t4887 = load i64, ptr %t4886
  %t4888 = or i64 %a0, %t4887
  %t4889 = and i64 %t4888, 7
  %t4890 = icmp eq i64 %t4889, 0
  br i1 %t4890, label %fixfast1049, label %fixslow1050
fixfast1049:
  %t4891 = icmp eq i64 %a0, %t4887
  %t4892 = select i1 %t4891, i64 257, i64 1
  br label %fixmerge1051
fixslow1050:
  %t4893 = call i64 @rt_num_eq(i64 %a0, i64 %t4887)
  br label %fixmerge1051
fixmerge1051:
  %t4894 = phi i64 [ %t4892, %fixfast1049 ], [ %t4893, %fixslow1050 ]
  %t4895 = icmp ne i64 %t4894, 1
  br i1 %t4895, label %then1052, label %else1053
then1052:
  %t4896 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4896)
  %t4897 = and i64 %t4896, -8
  %t4898 = inttoptr i64 %t4897 to ptr
  %t4899 = load i64, ptr %t4898
  %t4900 = inttoptr i64 %t4899 to ptr
  %t4901 = musttail call fastcc i64 %t4900(i64 %t4896, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4901
else1053:
  %t4902 = and i64 %self, -8
  %t4903 = inttoptr i64 %t4902 to ptr
  %t4904 = getelementptr i64, ptr %t4903, i64 3
  %t4905 = load i64, ptr %t4904
  %t4906 = call i64 @rt_vector_ref(i64 %t4905, i64 %a0)
  %t4907 = and i64 %self, -8
  %t4908 = inttoptr i64 %t4907 to ptr
  %t4909 = getelementptr i64, ptr %t4908, i64 2
  %t4910 = load i64, ptr %t4909
  call void @rt_check_callable(i64 %t4910)
  %t4911 = and i64 %t4910, -8
  %t4912 = inttoptr i64 %t4911 to ptr
  %t4913 = load i64, ptr %t4912
  %t4914 = inttoptr i64 %t4913 to ptr
  %t4915 = call fastcc i64%t4914(i64 %t4910, i64 1, i64 %t4906, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4916 = or i64 %a0, 8
  %t4917 = and i64 %t4916, 7
  %t4918 = icmp eq i64 %t4917, 0
  br i1 %t4918, label %fixfast1054, label %fixslow1055
fixfast1054:
  %t4919 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4920 = extractvalue {i64, i1} %t4919, 0
  %t4921 = extractvalue {i64, i1} %t4919, 1
  br i1 %t4921, label %fixslow1055, label %fixmerge1056
fixslow1055:
  %t4922 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1056
fixmerge1056:
  %t4923 = phi i64 [ %t4920, %fixfast1054 ], [ %t4922, %fixslow1055 ]
  %t4924 = musttail call fastcc i64 @"scheme.base:code_951"(i64 %self, i64 1, i64 %t4923, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4924
}

define fastcc i64 @"scheme.base:code_953"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4925 = icmp eq i64 %argc, 1
  br i1 %t4925, label %argok1058, label %arityerr1057
arityerr1057:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1058:
  %t4926 = and i64 %self, -8
  %t4927 = inttoptr i64 %t4926 to ptr
  %t4928 = getelementptr i64, ptr %t4927, i64 1
  %t4929 = load i64, ptr %t4928
  %t4930 = or i64 %a0, %t4929
  %t4931 = and i64 %t4930, 7
  %t4932 = icmp eq i64 %t4931, 0
  br i1 %t4932, label %fixfast1059, label %fixslow1060
fixfast1059:
  %t4933 = icmp eq i64 %a0, %t4929
  %t4934 = select i1 %t4933, i64 257, i64 1
  br label %fixmerge1061
fixslow1060:
  %t4935 = call i64 @rt_num_eq(i64 %a0, i64 %t4929)
  br label %fixmerge1061
fixmerge1061:
  %t4936 = phi i64 [ %t4934, %fixfast1059 ], [ %t4935, %fixslow1060 ]
  %t4937 = icmp ne i64 %t4936, 1
  br i1 %t4937, label %then1062, label %else1063
then1062:
  %t4938 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4938)
  %t4939 = and i64 %t4938, -8
  %t4940 = inttoptr i64 %t4939 to ptr
  %t4941 = load i64, ptr %t4940
  %t4942 = inttoptr i64 %t4941 to ptr
  %t4943 = musttail call fastcc i64 %t4942(i64 %t4938, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4943
else1063:
  %t4944 = and i64 %self, -8
  %t4945 = inttoptr i64 %t4944 to ptr
  %t4946 = getelementptr i64, ptr %t4945, i64 3
  %t4947 = load i64, ptr %t4946
  %t4948 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4948)
  %t4949 = and i64 %t4948, -8
  %t4950 = inttoptr i64 %t4949 to ptr
  %t4951 = load i64, ptr %t4950
  %t4952 = inttoptr i64 %t4951 to ptr
  %t4953 = call fastcc i64%t4952(i64 %t4948, i64 2, i64 %t4947, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4954 = and i64 %self, -8
  %t4955 = inttoptr i64 %t4954 to ptr
  %t4956 = getelementptr i64, ptr %t4955, i64 2
  %t4957 = load i64, ptr %t4956
  call void @rt_check_callable(i64 %t4957)
  %t4958 = and i64 %t4957, -8
  %t4959 = inttoptr i64 %t4958 to ptr
  %t4960 = load i64, ptr %t4959
  %t4961 = inttoptr i64 %t4960 to ptr
  %t4962 = call i64 @rt_list_length(i64 %t4953)
  %t4963 = add i64 0, %t4962
  %t4964 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4953, i64 8)
  %t4976 = getelementptr i64, ptr %t4964, i64 0
  %t4968 = load i64, ptr %t4976
  %t4977 = getelementptr i64, ptr %t4964, i64 1
  %t4969 = load i64, ptr %t4977
  %t4978 = getelementptr i64, ptr %t4964, i64 2
  %t4970 = load i64, ptr %t4978
  %t4979 = getelementptr i64, ptr %t4964, i64 3
  %t4971 = load i64, ptr %t4979
  %t4980 = getelementptr i64, ptr %t4964, i64 4
  %t4972 = load i64, ptr %t4980
  %t4981 = getelementptr i64, ptr %t4964, i64 5
  %t4973 = load i64, ptr %t4981
  %t4982 = getelementptr i64, ptr %t4964, i64 6
  %t4974 = load i64, ptr %t4982
  %t4983 = getelementptr i64, ptr %t4964, i64 7
  %t4975 = load i64, ptr %t4983
  %t4965 = icmp sgt i64 %t4963, 8
  %t4966 = getelementptr i64, ptr %t4964, i64 8
  %t4967 = select i1 %t4965, ptr %t4966, ptr null
  %t4984 = call fastcc i64%t4961(i64 %t4957, i64 %t4963, i64 %t4968, i64 %t4969, i64 %t4970, i64 %t4971, i64 %t4972, i64 %t4973, i64 %t4974, i64 %t4975, ptr %t4967)
  %t4985 = or i64 %a0, 8
  %t4986 = and i64 %t4985, 7
  %t4987 = icmp eq i64 %t4986, 0
  br i1 %t4987, label %fixfast1064, label %fixslow1065
fixfast1064:
  %t4988 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4989 = extractvalue {i64, i1} %t4988, 0
  %t4990 = extractvalue {i64, i1} %t4988, 1
  br i1 %t4990, label %fixslow1065, label %fixmerge1066
fixslow1065:
  %t4991 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1066
fixmerge1066:
  %t4992 = phi i64 [ %t4989, %fixfast1064 ], [ %t4991, %fixslow1065 ]
  %t4993 = musttail call fastcc i64 @"scheme.base:code_953"(i64 %self, i64 1, i64 %t4992, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4993
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4994 = icmp sge i64 %argc, 2
  br i1 %t4994, label %argok1068, label %arityerr1067
arityerr1067:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1068:
  %t4995 = call ptr @rt_alloc_words(i64 8)
  %t4996 = getelementptr i64, ptr %t4995, i64 0
  store i64 %a0, ptr %t4996
  %t4997 = getelementptr i64, ptr %t4995, i64 1
  store i64 %a1, ptr %t4997
  %t4998 = getelementptr i64, ptr %t4995, i64 2
  store i64 %a2, ptr %t4998
  %t4999 = getelementptr i64, ptr %t4995, i64 3
  store i64 %a3, ptr %t4999
  %t5000 = getelementptr i64, ptr %t4995, i64 4
  store i64 %a4, ptr %t5000
  %t5001 = getelementptr i64, ptr %t4995, i64 5
  store i64 %a5, ptr %t5001
  %t5002 = getelementptr i64, ptr %t4995, i64 6
  store i64 %a6, ptr %t5002
  %t5003 = getelementptr i64, ptr %t4995, i64 7
  store i64 %a7, ptr %t5003
  %t5004 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4995, ptr %overflow)
  %t5005 = call i64 @rt_null_p(i64 %t5004)
  %t5006 = icmp ne i64 %t5005, 1
  br i1 %t5006, label %then1069, label %else1070
then1069:
  %t5007 = call i64 @rt_vector_length(i64 %a1)
  %t5008 = call ptr @rt_alloc_words(i64 5)
  %t5009 = ptrtoint ptr %t5008 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_951" to i64), ptr %t5008
  %t5010 = or i64 %t5009, 4
  %t5011 = getelementptr i64, ptr %t5008, i64 1
  store i64 %t5007, ptr %t5011
  %t5012 = getelementptr i64, ptr %t5008, i64 2
  store i64 %a0, ptr %t5012
  %t5013 = getelementptr i64, ptr %t5008, i64 3
  store i64 %a1, ptr %t5013
  %t5014 = getelementptr i64, ptr %t5008, i64 4
  store i64 %t5010, ptr %t5014
  %t5015 = musttail call fastcc i64 @"scheme.base:code_951"(i64 %t5010, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5015
else1070:
  %t5016 = call i64 @rt_cons(i64 %a1, i64 %t5004)
  %t5017 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5017)
  %t5018 = and i64 %t5017, -8
  %t5019 = inttoptr i64 %t5018 to ptr
  %t5020 = load i64, ptr %t5019
  %t5021 = inttoptr i64 %t5020 to ptr
  %t5022 = call fastcc i64%t5021(i64 %t5017, i64 1, i64 %t5016, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5023 = call ptr @rt_alloc_words(i64 5)
  %t5024 = ptrtoint ptr %t5023 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_953" to i64), ptr %t5023
  %t5025 = or i64 %t5024, 4
  %t5026 = getelementptr i64, ptr %t5023, i64 1
  store i64 %t5022, ptr %t5026
  %t5027 = getelementptr i64, ptr %t5023, i64 2
  store i64 %a0, ptr %t5027
  %t5028 = getelementptr i64, ptr %t5023, i64 3
  store i64 %t5016, ptr %t5028
  %t5029 = getelementptr i64, ptr %t5023, i64 4
  store i64 %t5025, ptr %t5029
  %t5030 = musttail call fastcc i64 @"scheme.base:code_953"(i64 %t5025, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5030
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5031 = call i64 @rt_null_p(i64 2)
  %t5032 = icmp ne i64 %t5031, 1
  br i1 %t5032, label %then1071, label %else1072
then1071:
  %t5033 = call i64 @rt_vector_length(i64 %a1)
  %t5034 = call ptr @rt_alloc_words(i64 5)
  %t5035 = ptrtoint ptr %t5034 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_951" to i64), ptr %t5034
  %t5036 = or i64 %t5035, 4
  %t5037 = getelementptr i64, ptr %t5034, i64 1
  store i64 %t5033, ptr %t5037
  %t5038 = getelementptr i64, ptr %t5034, i64 2
  store i64 %a0, ptr %t5038
  %t5039 = getelementptr i64, ptr %t5034, i64 3
  store i64 %a1, ptr %t5039
  %t5040 = getelementptr i64, ptr %t5034, i64 4
  store i64 %t5036, ptr %t5040
  %t5041 = musttail call fastcc i64 @"scheme.base:code_951"(i64 %t5036, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5041
else1072:
  %t5042 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5043 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5043)
  %t5044 = and i64 %t5043, -8
  %t5045 = inttoptr i64 %t5044 to ptr
  %t5046 = load i64, ptr %t5045
  %t5047 = inttoptr i64 %t5046 to ptr
  %t5048 = call fastcc i64%t5047(i64 %t5043, i64 1, i64 %t5042, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5049 = call ptr @rt_alloc_words(i64 5)
  %t5050 = ptrtoint ptr %t5049 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_953" to i64), ptr %t5049
  %t5051 = or i64 %t5050, 4
  %t5052 = getelementptr i64, ptr %t5049, i64 1
  store i64 %t5048, ptr %t5052
  %t5053 = getelementptr i64, ptr %t5049, i64 2
  store i64 %a0, ptr %t5053
  %t5054 = getelementptr i64, ptr %t5049, i64 3
  store i64 %t5042, ptr %t5054
  %t5055 = getelementptr i64, ptr %t5049, i64 4
  store i64 %t5051, ptr %t5055
  %t5056 = musttail call fastcc i64 @"scheme.base:code_953"(i64 %t5051, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5056
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5061 = icmp eq i64 %argc, 1
  br i1 %t5061, label %argok1074, label %arityerr1073
arityerr1073:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1074:
  %t5062 = call i64 @rt_cdr(i64 %a0)
  %t5063 = call i64 @rt_null_p(i64 %t5062)
  %t5064 = icmp ne i64 %t5063, 1
  br i1 %t5064, label %then1075, label %else1076
then1075:
  %t5065 = call i64 @rt_car(i64 %a0)
  %t5066 = call i64 @rt_vector_length(i64 %t5065)
  ret i64 %t5066
else1076:
  %t5067 = call i64 @rt_car(i64 %a0)
  %t5068 = call i64 @rt_vector_length(i64 %t5067)
  %t5069 = call i64 @rt_cdr(i64 %a0)
  %t5070 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5070)
  %t5071 = and i64 %t5070, -8
  %t5072 = inttoptr i64 %t5071 to ptr
  %t5073 = load i64, ptr %t5072
  %t5074 = inttoptr i64 %t5073 to ptr
  %t5075 = call fastcc i64%t5074(i64 %t5070, i64 1, i64 %t5069, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5076 = or i64 %t5068, %t5075
  %t5077 = and i64 %t5076, 7
  %t5078 = icmp eq i64 %t5077, 0
  br i1 %t5078, label %fixfast1077, label %fixslow1078
fixfast1077:
  %t5079 = icmp slt i64 %t5068, %t5075
  %t5080 = select i1 %t5079, i64 257, i64 1
  br label %fixmerge1079
fixslow1078:
  %t5081 = call i64 @rt_lt(i64 %t5068, i64 %t5075)
  br label %fixmerge1079
fixmerge1079:
  %t5082 = phi i64 [ %t5080, %fixfast1077 ], [ %t5081, %fixslow1078 ]
  %t5083 = icmp ne i64 %t5082, 1
  br i1 %t5083, label %then1080, label %else1081
then1080:
  ret i64 %t5068
else1081:
  ret i64 %t5075
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5088 = icmp eq i64 %argc, 2
  br i1 %t5088, label %argok1083, label %arityerr1082
arityerr1082:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1083:
  %t5089 = call i64 @rt_null_p(i64 %a0)
  %t5090 = icmp ne i64 %t5089, 1
  br i1 %t5090, label %then1084, label %else1085
then1084:
  ret i64 2
else1085:
  %t5091 = call i64 @rt_car(i64 %a0)
  %t5092 = call i64 @rt_vector_ref(i64 %t5091, i64 %a1)
  %t5093 = call i64 @rt_cdr(i64 %a0)
  %t5094 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t5094)
  %t5095 = and i64 %t5094, -8
  %t5096 = inttoptr i64 %t5095 to ptr
  %t5097 = load i64, ptr %t5096
  %t5098 = inttoptr i64 %t5097 to ptr
  %t5099 = call fastcc i64%t5098(i64 %t5094, i64 2, i64 %t5093, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5100 = call i64 @rt_cons(i64 %t5092, i64 %t5099)
  ret i64 %t5100
}

define fastcc i64 @"scheme.base:code_975"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5105 = icmp eq i64 %argc, 1
  br i1 %t5105, label %argok1087, label %arityerr1086
arityerr1086:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1087:
  %t5106 = and i64 %self, -8
  %t5107 = inttoptr i64 %t5106 to ptr
  %t5108 = getelementptr i64, ptr %t5107, i64 1
  %t5109 = load i64, ptr %t5108
  %t5110 = or i64 %a0, %t5109
  %t5111 = and i64 %t5110, 7
  %t5112 = icmp eq i64 %t5111, 0
  br i1 %t5112, label %fixfast1088, label %fixslow1089
fixfast1088:
  %t5113 = icmp eq i64 %a0, %t5109
  %t5114 = select i1 %t5113, i64 257, i64 1
  br label %fixmerge1090
fixslow1089:
  %t5115 = call i64 @rt_num_eq(i64 %a0, i64 %t5109)
  br label %fixmerge1090
fixmerge1090:
  %t5116 = phi i64 [ %t5114, %fixfast1088 ], [ %t5115, %fixslow1089 ]
  %t5117 = icmp ne i64 %t5116, 1
  br i1 %t5117, label %then1091, label %else1092
then1091:
  %t5118 = and i64 %self, -8
  %t5119 = inttoptr i64 %t5118 to ptr
  %t5120 = getelementptr i64, ptr %t5119, i64 2
  %t5121 = load i64, ptr %t5120
  ret i64 %t5121
else1092:
  %t5122 = and i64 %self, -8
  %t5123 = inttoptr i64 %t5122 to ptr
  %t5124 = getelementptr i64, ptr %t5123, i64 2
  %t5125 = load i64, ptr %t5124
  %t5126 = and i64 %self, -8
  %t5127 = inttoptr i64 %t5126 to ptr
  %t5128 = getelementptr i64, ptr %t5127, i64 3
  %t5129 = load i64, ptr %t5128
  %t5130 = or i64 %a0, %t5129
  %t5131 = and i64 %t5130, 7
  %t5132 = icmp eq i64 %t5131, 0
  br i1 %t5132, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t5133 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5129)
  %t5134 = extractvalue {i64, i1} %t5133, 0
  %t5135 = extractvalue {i64, i1} %t5133, 1
  br i1 %t5135, label %fixslow1094, label %fixmerge1095
fixslow1094:
  %t5136 = call i64 @rt_sub(i64 %a0, i64 %t5129)
  br label %fixmerge1095
fixmerge1095:
  %t5137 = phi i64 [ %t5134, %fixfast1093 ], [ %t5136, %fixslow1094 ]
  %t5138 = and i64 %self, -8
  %t5139 = inttoptr i64 %t5138 to ptr
  %t5140 = getelementptr i64, ptr %t5139, i64 4
  %t5141 = load i64, ptr %t5140
  %t5142 = call i64 @rt_string_ref(i64 %t5141, i64 %a0)
  %t5143 = call i64 @rt_vector_set(i64 %t5125, i64 %t5137, i64 %t5142)
  %t5144 = or i64 %a0, 8
  %t5145 = and i64 %t5144, 7
  %t5146 = icmp eq i64 %t5145, 0
  br i1 %t5146, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t5147 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5148 = extractvalue {i64, i1} %t5147, 0
  %t5149 = extractvalue {i64, i1} %t5147, 1
  br i1 %t5149, label %fixslow1097, label %fixmerge1098
fixslow1097:
  %t5150 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1098
fixmerge1098:
  %t5151 = phi i64 [ %t5148, %fixfast1096 ], [ %t5150, %fixslow1097 ]
  %t5152 = musttail call fastcc i64 @"scheme.base:code_975"(i64 %self, i64 1, i64 %t5151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5152
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5153 = icmp sge i64 %argc, 1
  br i1 %t5153, label %argok1100, label %arityerr1099
arityerr1099:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1100:
  %t5154 = call ptr @rt_alloc_words(i64 8)
  %t5155 = getelementptr i64, ptr %t5154, i64 0
  store i64 %a0, ptr %t5155
  %t5156 = getelementptr i64, ptr %t5154, i64 1
  store i64 %a1, ptr %t5156
  %t5157 = getelementptr i64, ptr %t5154, i64 2
  store i64 %a2, ptr %t5157
  %t5158 = getelementptr i64, ptr %t5154, i64 3
  store i64 %a3, ptr %t5158
  %t5159 = getelementptr i64, ptr %t5154, i64 4
  store i64 %a4, ptr %t5159
  %t5160 = getelementptr i64, ptr %t5154, i64 5
  store i64 %a5, ptr %t5160
  %t5161 = getelementptr i64, ptr %t5154, i64 6
  store i64 %a6, ptr %t5161
  %t5162 = getelementptr i64, ptr %t5154, i64 7
  store i64 %a7, ptr %t5162
  %t5163 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5154, ptr %overflow)
  %t5164 = call i64 @rt_string_length(i64 %a0)
  %t5165 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5165)
  %t5166 = and i64 %t5165, -8
  %t5167 = inttoptr i64 %t5166 to ptr
  %t5168 = load i64, ptr %t5167
  %t5169 = inttoptr i64 %t5168 to ptr
  %t5170 = call fastcc i64%t5169(i64 %t5165, i64 1, i64 %t5163, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5171 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5171)
  %t5172 = and i64 %t5171, -8
  %t5173 = inttoptr i64 %t5172 to ptr
  %t5174 = load i64, ptr %t5173
  %t5175 = inttoptr i64 %t5174 to ptr
  %t5176 = call fastcc i64%t5175(i64 %t5171, i64 2, i64 %t5163, i64 %t5164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5177 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5178 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5178)
  %t5179 = and i64 %t5178, -8
  %t5180 = inttoptr i64 %t5179 to ptr
  %t5181 = load i64, ptr %t5180
  %t5182 = inttoptr i64 %t5181 to ptr
  %t5183 = call fastcc i64%t5182(i64 %t5178, i64 4, i64 %t5177, i64 %t5170, i64 %t5176, i64 %t5164, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5184 = or i64 %t5176, %t5170
  %t5185 = and i64 %t5184, 7
  %t5186 = icmp eq i64 %t5185, 0
  br i1 %t5186, label %fixfast1101, label %fixslow1102
fixfast1101:
  %t5187 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5176, i64 %t5170)
  %t5188 = extractvalue {i64, i1} %t5187, 0
  %t5189 = extractvalue {i64, i1} %t5187, 1
  br i1 %t5189, label %fixslow1102, label %fixmerge1103
fixslow1102:
  %t5190 = call i64 @rt_sub(i64 %t5176, i64 %t5170)
  br label %fixmerge1103
fixmerge1103:
  %t5191 = phi i64 [ %t5188, %fixfast1101 ], [ %t5190, %fixslow1102 ]
  %t5192 = call i64 @rt_make_vector(i64 %t5191, i64 0)
  %t5193 = call ptr @rt_alloc_words(i64 6)
  %t5194 = ptrtoint ptr %t5193 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_975" to i64), ptr %t5193
  %t5195 = or i64 %t5194, 4
  %t5196 = getelementptr i64, ptr %t5193, i64 1
  store i64 %t5176, ptr %t5196
  %t5197 = getelementptr i64, ptr %t5193, i64 2
  store i64 %t5192, ptr %t5197
  %t5198 = getelementptr i64, ptr %t5193, i64 3
  store i64 %t5170, ptr %t5198
  %t5199 = getelementptr i64, ptr %t5193, i64 4
  store i64 %a0, ptr %t5199
  %t5200 = getelementptr i64, ptr %t5193, i64 5
  store i64 %t5195, ptr %t5200
  %t5201 = musttail call fastcc i64 @"scheme.base:code_975"(i64 %t5195, i64 1, i64 %t5170, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5201
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5202 = call i64 @rt_string_length(i64 %a0)
  %t5203 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5203)
  %t5204 = and i64 %t5203, -8
  %t5205 = inttoptr i64 %t5204 to ptr
  %t5206 = load i64, ptr %t5205
  %t5207 = inttoptr i64 %t5206 to ptr
  %t5208 = call fastcc i64%t5207(i64 %t5203, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5209 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5209)
  %t5210 = and i64 %t5209, -8
  %t5211 = inttoptr i64 %t5210 to ptr
  %t5212 = load i64, ptr %t5211
  %t5213 = inttoptr i64 %t5212 to ptr
  %t5214 = call fastcc i64%t5213(i64 %t5209, i64 2, i64 2, i64 %t5202, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5215 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5216 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5216)
  %t5217 = and i64 %t5216, -8
  %t5218 = inttoptr i64 %t5217 to ptr
  %t5219 = load i64, ptr %t5218
  %t5220 = inttoptr i64 %t5219 to ptr
  %t5221 = call fastcc i64%t5220(i64 %t5216, i64 4, i64 %t5215, i64 %t5208, i64 %t5214, i64 %t5202, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5222 = or i64 %t5214, %t5208
  %t5223 = and i64 %t5222, 7
  %t5224 = icmp eq i64 %t5223, 0
  br i1 %t5224, label %fixfast1104, label %fixslow1105
fixfast1104:
  %t5225 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5214, i64 %t5208)
  %t5226 = extractvalue {i64, i1} %t5225, 0
  %t5227 = extractvalue {i64, i1} %t5225, 1
  br i1 %t5227, label %fixslow1105, label %fixmerge1106
fixslow1105:
  %t5228 = call i64 @rt_sub(i64 %t5214, i64 %t5208)
  br label %fixmerge1106
fixmerge1106:
  %t5229 = phi i64 [ %t5226, %fixfast1104 ], [ %t5228, %fixslow1105 ]
  %t5230 = call i64 @rt_make_vector(i64 %t5229, i64 0)
  %t5231 = call ptr @rt_alloc_words(i64 6)
  %t5232 = ptrtoint ptr %t5231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_975" to i64), ptr %t5231
  %t5233 = or i64 %t5232, 4
  %t5234 = getelementptr i64, ptr %t5231, i64 1
  store i64 %t5214, ptr %t5234
  %t5235 = getelementptr i64, ptr %t5231, i64 2
  store i64 %t5230, ptr %t5235
  %t5236 = getelementptr i64, ptr %t5231, i64 3
  store i64 %t5208, ptr %t5236
  %t5237 = getelementptr i64, ptr %t5231, i64 4
  store i64 %a0, ptr %t5237
  %t5238 = getelementptr i64, ptr %t5231, i64 5
  store i64 %t5233, ptr %t5238
  %t5239 = musttail call fastcc i64 @"scheme.base:code_975"(i64 %t5233, i64 1, i64 %t5208, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5239
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5244 = icmp sge i64 %argc, 1
  br i1 %t5244, label %argok1108, label %arityerr1107
arityerr1107:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1108:
  %t5245 = call ptr @rt_alloc_words(i64 8)
  %t5246 = getelementptr i64, ptr %t5245, i64 0
  store i64 %a0, ptr %t5246
  %t5247 = getelementptr i64, ptr %t5245, i64 1
  store i64 %a1, ptr %t5247
  %t5248 = getelementptr i64, ptr %t5245, i64 2
  store i64 %a2, ptr %t5248
  %t5249 = getelementptr i64, ptr %t5245, i64 3
  store i64 %a3, ptr %t5249
  %t5250 = getelementptr i64, ptr %t5245, i64 4
  store i64 %a4, ptr %t5250
  %t5251 = getelementptr i64, ptr %t5245, i64 5
  store i64 %a5, ptr %t5251
  %t5252 = getelementptr i64, ptr %t5245, i64 6
  store i64 %a6, ptr %t5252
  %t5253 = getelementptr i64, ptr %t5245, i64 7
  store i64 %a7, ptr %t5253
  %t5254 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5245, ptr %overflow)
  %t5255 = call i64 @rt_vector_length(i64 %a0)
  %t5256 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5256)
  %t5257 = and i64 %t5256, -8
  %t5258 = inttoptr i64 %t5257 to ptr
  %t5259 = load i64, ptr %t5258
  %t5260 = inttoptr i64 %t5259 to ptr
  %t5261 = call fastcc i64%t5260(i64 %t5256, i64 1, i64 %t5254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5262 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5262)
  %t5263 = and i64 %t5262, -8
  %t5264 = inttoptr i64 %t5263 to ptr
  %t5265 = load i64, ptr %t5264
  %t5266 = inttoptr i64 %t5265 to ptr
  %t5267 = call fastcc i64%t5266(i64 %t5262, i64 2, i64 %t5254, i64 %t5255, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5268 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5269 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5269)
  %t5270 = and i64 %t5269, -8
  %t5271 = inttoptr i64 %t5270 to ptr
  %t5272 = load i64, ptr %t5271
  %t5273 = inttoptr i64 %t5272 to ptr
  %t5274 = call fastcc i64%t5273(i64 %t5269, i64 4, i64 %t5268, i64 %t5261, i64 %t5267, i64 %t5255, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5275 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5275)
  %t5276 = and i64 %t5275, -8
  %t5277 = inttoptr i64 %t5276 to ptr
  %t5278 = load i64, ptr %t5277
  %t5279 = inttoptr i64 %t5278 to ptr
  %t5280 = call fastcc i64%t5279(i64 %t5275, i64 3, i64 %a0, i64 %t5261, i64 %t5267, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5281 = call i64 @rt_list_to_string(i64 %t5280)
  ret i64 %t5281
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5282 = call i64 @rt_vector_length(i64 %a0)
  %t5283 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5283)
  %t5284 = and i64 %t5283, -8
  %t5285 = inttoptr i64 %t5284 to ptr
  %t5286 = load i64, ptr %t5285
  %t5287 = inttoptr i64 %t5286 to ptr
  %t5288 = call fastcc i64%t5287(i64 %t5283, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5289 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5289)
  %t5290 = and i64 %t5289, -8
  %t5291 = inttoptr i64 %t5290 to ptr
  %t5292 = load i64, ptr %t5291
  %t5293 = inttoptr i64 %t5292 to ptr
  %t5294 = call fastcc i64%t5293(i64 %t5289, i64 2, i64 2, i64 %t5282, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5295 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5296 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5296)
  %t5297 = and i64 %t5296, -8
  %t5298 = inttoptr i64 %t5297 to ptr
  %t5299 = load i64, ptr %t5298
  %t5300 = inttoptr i64 %t5299 to ptr
  %t5301 = call fastcc i64%t5300(i64 %t5296, i64 4, i64 %t5295, i64 %t5288, i64 %t5294, i64 %t5282, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5302 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5302)
  %t5303 = and i64 %t5302, -8
  %t5304 = inttoptr i64 %t5303 to ptr
  %t5305 = load i64, ptr %t5304
  %t5306 = inttoptr i64 %t5305 to ptr
  %t5307 = call fastcc i64%t5306(i64 %t5302, i64 3, i64 %a0, i64 %t5288, i64 %t5294, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5308 = call i64 @rt_list_to_string(i64 %t5307)
  ret i64 %t5308
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5313 = icmp sge i64 %argc, 2
  br i1 %t5313, label %argok1110, label %arityerr1109
arityerr1109:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1110:
  %t5314 = call ptr @rt_alloc_words(i64 8)
  %t5315 = getelementptr i64, ptr %t5314, i64 0
  store i64 %a0, ptr %t5315
  %t5316 = getelementptr i64, ptr %t5314, i64 1
  store i64 %a1, ptr %t5316
  %t5317 = getelementptr i64, ptr %t5314, i64 2
  store i64 %a2, ptr %t5317
  %t5318 = getelementptr i64, ptr %t5314, i64 3
  store i64 %a3, ptr %t5318
  %t5319 = getelementptr i64, ptr %t5314, i64 4
  store i64 %a4, ptr %t5319
  %t5320 = getelementptr i64, ptr %t5314, i64 5
  store i64 %a5, ptr %t5320
  %t5321 = getelementptr i64, ptr %t5314, i64 6
  store i64 %a6, ptr %t5321
  %t5322 = getelementptr i64, ptr %t5314, i64 7
  store i64 %a7, ptr %t5322
  %t5323 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5314, ptr %overflow)
  %t5324 = call i64 @rt_null_p(i64 %t5323)
  %t5325 = icmp ne i64 %t5324, 1
  br i1 %t5325, label %then1111, label %else1112
then1111:
  %t5326 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5326)
  %t5327 = and i64 %t5326, -8
  %t5328 = inttoptr i64 %t5327 to ptr
  %t5329 = load i64, ptr %t5328
  %t5330 = inttoptr i64 %t5329 to ptr
  %t5331 = call fastcc i64%t5330(i64 %t5326, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5332 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5332)
  %t5333 = and i64 %t5332, -8
  %t5334 = inttoptr i64 %t5333 to ptr
  %t5335 = load i64, ptr %t5334
  %t5336 = inttoptr i64 %t5335 to ptr
  %t5337 = call fastcc i64%t5336(i64 %t5332, i64 2, i64 %a0, i64 %t5331, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5338 = call i64 @rt_list_to_string(i64 %t5337)
  ret i64 %t5338
else1112:
  %t5339 = call i64 @rt_cons(i64 %a1, i64 %t5323)
  %t5340 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5340)
  %t5341 = and i64 %t5340, -8
  %t5342 = inttoptr i64 %t5341 to ptr
  %t5343 = load i64, ptr %t5342
  %t5344 = inttoptr i64 %t5343 to ptr
  %t5345 = call fastcc i64%t5344(i64 %t5340, i64 2, i64 %a0, i64 %t5339, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5346 = call i64 @rt_list_to_string(i64 %t5345)
  ret i64 %t5346
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5347 = call i64 @rt_null_p(i64 2)
  %t5348 = icmp ne i64 %t5347, 1
  br i1 %t5348, label %then1113, label %else1114
then1113:
  %t5349 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5349)
  %t5350 = and i64 %t5349, -8
  %t5351 = inttoptr i64 %t5350 to ptr
  %t5352 = load i64, ptr %t5351
  %t5353 = inttoptr i64 %t5352 to ptr
  %t5354 = call fastcc i64%t5353(i64 %t5349, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5355 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5355)
  %t5356 = and i64 %t5355, -8
  %t5357 = inttoptr i64 %t5356 to ptr
  %t5358 = load i64, ptr %t5357
  %t5359 = inttoptr i64 %t5358 to ptr
  %t5360 = call fastcc i64%t5359(i64 %t5355, i64 2, i64 %a0, i64 %t5354, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5361 = call i64 @rt_list_to_string(i64 %t5360)
  ret i64 %t5361
else1114:
  %t5362 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5363 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5363)
  %t5364 = and i64 %t5363, -8
  %t5365 = inttoptr i64 %t5364 to ptr
  %t5366 = load i64, ptr %t5365
  %t5367 = inttoptr i64 %t5366 to ptr
  %t5368 = call fastcc i64%t5367(i64 %t5363, i64 2, i64 %a0, i64 %t5362, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5369 = call i64 @rt_list_to_string(i64 %t5368)
  ret i64 %t5369
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5374 = icmp eq i64 %argc, 2
  br i1 %t5374, label %argok1116, label %arityerr1115
arityerr1115:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1116:
  %t5375 = call i64 @rt_null_p(i64 %a1)
  %t5376 = icmp ne i64 %t5375, 1
  br i1 %t5376, label %then1117, label %else1118
then1117:
  ret i64 2
else1118:
  %t5377 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t5378 = and i64 %a0, -8
  %t5379 = inttoptr i64 %t5378 to ptr
  %t5380 = load i64, ptr %t5379
  %t5381 = inttoptr i64 %t5380 to ptr
  %t5382 = call fastcc i64%t5381(i64 %a0, i64 1, i64 %t5377, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5383 = call i64 @rt_cdr(i64 %a1)
  %t5384 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5384)
  %t5385 = and i64 %t5384, -8
  %t5386 = inttoptr i64 %t5385 to ptr
  %t5387 = load i64, ptr %t5386
  %t5388 = inttoptr i64 %t5387 to ptr
  %t5389 = call fastcc i64%t5388(i64 %t5384, i64 2, i64 %a0, i64 %t5383, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5390 = call i64 @rt_cons(i64 %t5382, i64 %t5389)
  ret i64 %t5390
}

define fastcc i64 @"scheme.base:code_998"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5395 = icmp eq i64 %argc, 1
  br i1 %t5395, label %argok1120, label %arityerr1119
arityerr1119:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1120:
  %t5396 = and i64 %self, -8
  %t5397 = inttoptr i64 %t5396 to ptr
  %t5398 = getelementptr i64, ptr %t5397, i64 1
  %t5399 = load i64, ptr %t5398
  %t5400 = or i64 %a0, %t5399
  %t5401 = and i64 %t5400, 7
  %t5402 = icmp eq i64 %t5401, 0
  br i1 %t5402, label %fixfast1121, label %fixslow1122
fixfast1121:
  %t5403 = icmp eq i64 %a0, %t5399
  %t5404 = select i1 %t5403, i64 257, i64 1
  br label %fixmerge1123
fixslow1122:
  %t5405 = call i64 @rt_num_eq(i64 %a0, i64 %t5399)
  br label %fixmerge1123
fixmerge1123:
  %t5406 = phi i64 [ %t5404, %fixfast1121 ], [ %t5405, %fixslow1122 ]
  %t5407 = icmp ne i64 %t5406, 1
  br i1 %t5407, label %then1124, label %else1125
then1124:
  ret i64 2
else1125:
  %t5408 = and i64 %self, -8
  %t5409 = inttoptr i64 %t5408 to ptr
  %t5410 = getelementptr i64, ptr %t5409, i64 3
  %t5411 = load i64, ptr %t5410
  %t5412 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5412)
  %t5413 = and i64 %t5412, -8
  %t5414 = inttoptr i64 %t5413 to ptr
  %t5415 = load i64, ptr %t5414
  %t5416 = inttoptr i64 %t5415 to ptr
  %t5417 = call fastcc i64%t5416(i64 %t5412, i64 2, i64 %t5411, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5418 = and i64 %self, -8
  %t5419 = inttoptr i64 %t5418 to ptr
  %t5420 = getelementptr i64, ptr %t5419, i64 2
  %t5421 = load i64, ptr %t5420
  call void @rt_check_callable(i64 %t5421)
  %t5422 = and i64 %t5421, -8
  %t5423 = inttoptr i64 %t5422 to ptr
  %t5424 = load i64, ptr %t5423
  %t5425 = inttoptr i64 %t5424 to ptr
  %t5426 = call i64 @rt_list_length(i64 %t5417)
  %t5427 = add i64 0, %t5426
  %t5428 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5417, i64 8)
  %t5440 = getelementptr i64, ptr %t5428, i64 0
  %t5432 = load i64, ptr %t5440
  %t5441 = getelementptr i64, ptr %t5428, i64 1
  %t5433 = load i64, ptr %t5441
  %t5442 = getelementptr i64, ptr %t5428, i64 2
  %t5434 = load i64, ptr %t5442
  %t5443 = getelementptr i64, ptr %t5428, i64 3
  %t5435 = load i64, ptr %t5443
  %t5444 = getelementptr i64, ptr %t5428, i64 4
  %t5436 = load i64, ptr %t5444
  %t5445 = getelementptr i64, ptr %t5428, i64 5
  %t5437 = load i64, ptr %t5445
  %t5446 = getelementptr i64, ptr %t5428, i64 6
  %t5438 = load i64, ptr %t5446
  %t5447 = getelementptr i64, ptr %t5428, i64 7
  %t5439 = load i64, ptr %t5447
  %t5429 = icmp sgt i64 %t5427, 8
  %t5430 = getelementptr i64, ptr %t5428, i64 8
  %t5431 = select i1 %t5429, ptr %t5430, ptr null
  %t5448 = call fastcc i64%t5425(i64 %t5421, i64 %t5427, i64 %t5432, i64 %t5433, i64 %t5434, i64 %t5435, i64 %t5436, i64 %t5437, i64 %t5438, i64 %t5439, ptr %t5431)
  %t5449 = or i64 %a0, 8
  %t5450 = and i64 %t5449, 7
  %t5451 = icmp eq i64 %t5450, 0
  br i1 %t5451, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t5452 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5453 = extractvalue {i64, i1} %t5452, 0
  %t5454 = extractvalue {i64, i1} %t5452, 1
  br i1 %t5454, label %fixslow1127, label %fixmerge1128
fixslow1127:
  %t5455 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1128
fixmerge1128:
  %t5456 = phi i64 [ %t5453, %fixfast1126 ], [ %t5455, %fixslow1127 ]
  %t5457 = call fastcc i64 @"scheme.base:code_998"(i64 %self, i64 1, i64 %t5456, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5458 = call i64 @rt_cons(i64 %t5448, i64 %t5457)
  ret i64 %t5458
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5459 = icmp eq i64 %argc, 2
  br i1 %t5459, label %argok1130, label %arityerr1129
arityerr1129:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1130:
  %t5460 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5460)
  %t5461 = and i64 %t5460, -8
  %t5462 = inttoptr i64 %t5461 to ptr
  %t5463 = load i64, ptr %t5462
  %t5464 = inttoptr i64 %t5463 to ptr
  %t5465 = call fastcc i64%t5464(i64 %t5460, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5466 = call ptr @rt_alloc_words(i64 5)
  %t5467 = ptrtoint ptr %t5466 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_998" to i64), ptr %t5466
  %t5468 = or i64 %t5467, 4
  %t5469 = getelementptr i64, ptr %t5466, i64 1
  store i64 %t5465, ptr %t5469
  %t5470 = getelementptr i64, ptr %t5466, i64 2
  store i64 %a0, ptr %t5470
  %t5471 = getelementptr i64, ptr %t5466, i64 3
  store i64 %a1, ptr %t5471
  %t5472 = getelementptr i64, ptr %t5466, i64 4
  store i64 %t5468, ptr %t5472
  %t5473 = musttail call fastcc i64 @"scheme.base:code_998"(i64 %t5468, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5473
}

define fastcc i64 @"scheme.base:code_1015"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5478 = icmp eq i64 %argc, 1
  br i1 %t5478, label %argok1132, label %arityerr1131
arityerr1131:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1132:
  %t5479 = and i64 %self, -8
  %t5480 = inttoptr i64 %t5479 to ptr
  %t5481 = getelementptr i64, ptr %t5480, i64 1
  %t5482 = load i64, ptr %t5481
  %t5483 = or i64 %a0, %t5482
  %t5484 = and i64 %t5483, 7
  %t5485 = icmp eq i64 %t5484, 0
  br i1 %t5485, label %fixfast1133, label %fixslow1134
fixfast1133:
  %t5486 = icmp eq i64 %a0, %t5482
  %t5487 = select i1 %t5486, i64 257, i64 1
  br label %fixmerge1135
fixslow1134:
  %t5488 = call i64 @rt_num_eq(i64 %a0, i64 %t5482)
  br label %fixmerge1135
fixmerge1135:
  %t5489 = phi i64 [ %t5487, %fixfast1133 ], [ %t5488, %fixslow1134 ]
  %t5490 = icmp ne i64 %t5489, 1
  br i1 %t5490, label %then1136, label %else1137
then1136:
  %t5491 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5491)
  %t5492 = and i64 %t5491, -8
  %t5493 = inttoptr i64 %t5492 to ptr
  %t5494 = load i64, ptr %t5493
  %t5495 = inttoptr i64 %t5494 to ptr
  %t5496 = musttail call fastcc i64 %t5495(i64 %t5491, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5496
else1137:
  %t5497 = and i64 %self, -8
  %t5498 = inttoptr i64 %t5497 to ptr
  %t5499 = getelementptr i64, ptr %t5498, i64 3
  %t5500 = load i64, ptr %t5499
  %t5501 = call i64 @rt_string_ref(i64 %t5500, i64 %a0)
  %t5502 = and i64 %self, -8
  %t5503 = inttoptr i64 %t5502 to ptr
  %t5504 = getelementptr i64, ptr %t5503, i64 2
  %t5505 = load i64, ptr %t5504
  call void @rt_check_callable(i64 %t5505)
  %t5506 = and i64 %t5505, -8
  %t5507 = inttoptr i64 %t5506 to ptr
  %t5508 = load i64, ptr %t5507
  %t5509 = inttoptr i64 %t5508 to ptr
  %t5510 = call fastcc i64%t5509(i64 %t5505, i64 1, i64 %t5501, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5511 = or i64 %a0, 8
  %t5512 = and i64 %t5511, 7
  %t5513 = icmp eq i64 %t5512, 0
  br i1 %t5513, label %fixfast1138, label %fixslow1139
fixfast1138:
  %t5514 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5515 = extractvalue {i64, i1} %t5514, 0
  %t5516 = extractvalue {i64, i1} %t5514, 1
  br i1 %t5516, label %fixslow1139, label %fixmerge1140
fixslow1139:
  %t5517 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1140
fixmerge1140:
  %t5518 = phi i64 [ %t5515, %fixfast1138 ], [ %t5517, %fixslow1139 ]
  %t5519 = musttail call fastcc i64 @"scheme.base:code_1015"(i64 %self, i64 1, i64 %t5518, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5519
}

define fastcc i64 @"scheme.base:code_1017"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5520 = icmp eq i64 %argc, 1
  br i1 %t5520, label %argok1142, label %arityerr1141
arityerr1141:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1142:
  %t5521 = and i64 %self, -8
  %t5522 = inttoptr i64 %t5521 to ptr
  %t5523 = getelementptr i64, ptr %t5522, i64 1
  %t5524 = load i64, ptr %t5523
  %t5525 = or i64 %a0, %t5524
  %t5526 = and i64 %t5525, 7
  %t5527 = icmp eq i64 %t5526, 0
  br i1 %t5527, label %fixfast1143, label %fixslow1144
fixfast1143:
  %t5528 = icmp eq i64 %a0, %t5524
  %t5529 = select i1 %t5528, i64 257, i64 1
  br label %fixmerge1145
fixslow1144:
  %t5530 = call i64 @rt_num_eq(i64 %a0, i64 %t5524)
  br label %fixmerge1145
fixmerge1145:
  %t5531 = phi i64 [ %t5529, %fixfast1143 ], [ %t5530, %fixslow1144 ]
  %t5532 = icmp ne i64 %t5531, 1
  br i1 %t5532, label %then1146, label %else1147
then1146:
  %t5533 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5533)
  %t5534 = and i64 %t5533, -8
  %t5535 = inttoptr i64 %t5534 to ptr
  %t5536 = load i64, ptr %t5535
  %t5537 = inttoptr i64 %t5536 to ptr
  %t5538 = musttail call fastcc i64 %t5537(i64 %t5533, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5538
else1147:
  %t5539 = and i64 %self, -8
  %t5540 = inttoptr i64 %t5539 to ptr
  %t5541 = getelementptr i64, ptr %t5540, i64 3
  %t5542 = load i64, ptr %t5541
  %t5543 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5543)
  %t5544 = and i64 %t5543, -8
  %t5545 = inttoptr i64 %t5544 to ptr
  %t5546 = load i64, ptr %t5545
  %t5547 = inttoptr i64 %t5546 to ptr
  %t5548 = call fastcc i64%t5547(i64 %t5543, i64 2, i64 %t5542, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5549 = and i64 %self, -8
  %t5550 = inttoptr i64 %t5549 to ptr
  %t5551 = getelementptr i64, ptr %t5550, i64 2
  %t5552 = load i64, ptr %t5551
  call void @rt_check_callable(i64 %t5552)
  %t5553 = and i64 %t5552, -8
  %t5554 = inttoptr i64 %t5553 to ptr
  %t5555 = load i64, ptr %t5554
  %t5556 = inttoptr i64 %t5555 to ptr
  %t5557 = call i64 @rt_list_length(i64 %t5548)
  %t5558 = add i64 0, %t5557
  %t5559 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5548, i64 8)
  %t5571 = getelementptr i64, ptr %t5559, i64 0
  %t5563 = load i64, ptr %t5571
  %t5572 = getelementptr i64, ptr %t5559, i64 1
  %t5564 = load i64, ptr %t5572
  %t5573 = getelementptr i64, ptr %t5559, i64 2
  %t5565 = load i64, ptr %t5573
  %t5574 = getelementptr i64, ptr %t5559, i64 3
  %t5566 = load i64, ptr %t5574
  %t5575 = getelementptr i64, ptr %t5559, i64 4
  %t5567 = load i64, ptr %t5575
  %t5576 = getelementptr i64, ptr %t5559, i64 5
  %t5568 = load i64, ptr %t5576
  %t5577 = getelementptr i64, ptr %t5559, i64 6
  %t5569 = load i64, ptr %t5577
  %t5578 = getelementptr i64, ptr %t5559, i64 7
  %t5570 = load i64, ptr %t5578
  %t5560 = icmp sgt i64 %t5558, 8
  %t5561 = getelementptr i64, ptr %t5559, i64 8
  %t5562 = select i1 %t5560, ptr %t5561, ptr null
  %t5579 = call fastcc i64%t5556(i64 %t5552, i64 %t5558, i64 %t5563, i64 %t5564, i64 %t5565, i64 %t5566, i64 %t5567, i64 %t5568, i64 %t5569, i64 %t5570, ptr %t5562)
  %t5580 = or i64 %a0, 8
  %t5581 = and i64 %t5580, 7
  %t5582 = icmp eq i64 %t5581, 0
  br i1 %t5582, label %fixfast1148, label %fixslow1149
fixfast1148:
  %t5583 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5584 = extractvalue {i64, i1} %t5583, 0
  %t5585 = extractvalue {i64, i1} %t5583, 1
  br i1 %t5585, label %fixslow1149, label %fixmerge1150
fixslow1149:
  %t5586 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1150
fixmerge1150:
  %t5587 = phi i64 [ %t5584, %fixfast1148 ], [ %t5586, %fixslow1149 ]
  %t5588 = musttail call fastcc i64 @"scheme.base:code_1017"(i64 %self, i64 1, i64 %t5587, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5588
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5589 = icmp sge i64 %argc, 2
  br i1 %t5589, label %argok1152, label %arityerr1151
arityerr1151:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1152:
  %t5590 = call ptr @rt_alloc_words(i64 8)
  %t5591 = getelementptr i64, ptr %t5590, i64 0
  store i64 %a0, ptr %t5591
  %t5592 = getelementptr i64, ptr %t5590, i64 1
  store i64 %a1, ptr %t5592
  %t5593 = getelementptr i64, ptr %t5590, i64 2
  store i64 %a2, ptr %t5593
  %t5594 = getelementptr i64, ptr %t5590, i64 3
  store i64 %a3, ptr %t5594
  %t5595 = getelementptr i64, ptr %t5590, i64 4
  store i64 %a4, ptr %t5595
  %t5596 = getelementptr i64, ptr %t5590, i64 5
  store i64 %a5, ptr %t5596
  %t5597 = getelementptr i64, ptr %t5590, i64 6
  store i64 %a6, ptr %t5597
  %t5598 = getelementptr i64, ptr %t5590, i64 7
  store i64 %a7, ptr %t5598
  %t5599 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5590, ptr %overflow)
  %t5600 = call i64 @rt_null_p(i64 %t5599)
  %t5601 = icmp ne i64 %t5600, 1
  br i1 %t5601, label %then1153, label %else1154
then1153:
  %t5602 = call i64 @rt_string_length(i64 %a1)
  %t5603 = call ptr @rt_alloc_words(i64 5)
  %t5604 = ptrtoint ptr %t5603 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1015" to i64), ptr %t5603
  %t5605 = or i64 %t5604, 4
  %t5606 = getelementptr i64, ptr %t5603, i64 1
  store i64 %t5602, ptr %t5606
  %t5607 = getelementptr i64, ptr %t5603, i64 2
  store i64 %a0, ptr %t5607
  %t5608 = getelementptr i64, ptr %t5603, i64 3
  store i64 %a1, ptr %t5608
  %t5609 = getelementptr i64, ptr %t5603, i64 4
  store i64 %t5605, ptr %t5609
  %t5610 = musttail call fastcc i64 @"scheme.base:code_1015"(i64 %t5605, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5610
else1154:
  %t5611 = call i64 @rt_cons(i64 %a1, i64 %t5599)
  %t5612 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5612)
  %t5613 = and i64 %t5612, -8
  %t5614 = inttoptr i64 %t5613 to ptr
  %t5615 = load i64, ptr %t5614
  %t5616 = inttoptr i64 %t5615 to ptr
  %t5617 = call fastcc i64%t5616(i64 %t5612, i64 1, i64 %t5611, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5618 = call ptr @rt_alloc_words(i64 5)
  %t5619 = ptrtoint ptr %t5618 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1017" to i64), ptr %t5618
  %t5620 = or i64 %t5619, 4
  %t5621 = getelementptr i64, ptr %t5618, i64 1
  store i64 %t5617, ptr %t5621
  %t5622 = getelementptr i64, ptr %t5618, i64 2
  store i64 %a0, ptr %t5622
  %t5623 = getelementptr i64, ptr %t5618, i64 3
  store i64 %t5611, ptr %t5623
  %t5624 = getelementptr i64, ptr %t5618, i64 4
  store i64 %t5620, ptr %t5624
  %t5625 = musttail call fastcc i64 @"scheme.base:code_1017"(i64 %t5620, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5625
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5626 = call i64 @rt_null_p(i64 2)
  %t5627 = icmp ne i64 %t5626, 1
  br i1 %t5627, label %then1155, label %else1156
then1155:
  %t5628 = call i64 @rt_string_length(i64 %a1)
  %t5629 = call ptr @rt_alloc_words(i64 5)
  %t5630 = ptrtoint ptr %t5629 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1015" to i64), ptr %t5629
  %t5631 = or i64 %t5630, 4
  %t5632 = getelementptr i64, ptr %t5629, i64 1
  store i64 %t5628, ptr %t5632
  %t5633 = getelementptr i64, ptr %t5629, i64 2
  store i64 %a0, ptr %t5633
  %t5634 = getelementptr i64, ptr %t5629, i64 3
  store i64 %a1, ptr %t5634
  %t5635 = getelementptr i64, ptr %t5629, i64 4
  store i64 %t5631, ptr %t5635
  %t5636 = musttail call fastcc i64 @"scheme.base:code_1015"(i64 %t5631, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5636
else1156:
  %t5637 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5638 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5638)
  %t5639 = and i64 %t5638, -8
  %t5640 = inttoptr i64 %t5639 to ptr
  %t5641 = load i64, ptr %t5640
  %t5642 = inttoptr i64 %t5641 to ptr
  %t5643 = call fastcc i64%t5642(i64 %t5638, i64 1, i64 %t5637, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5644 = call ptr @rt_alloc_words(i64 5)
  %t5645 = ptrtoint ptr %t5644 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1017" to i64), ptr %t5644
  %t5646 = or i64 %t5645, 4
  %t5647 = getelementptr i64, ptr %t5644, i64 1
  store i64 %t5643, ptr %t5647
  %t5648 = getelementptr i64, ptr %t5644, i64 2
  store i64 %a0, ptr %t5648
  %t5649 = getelementptr i64, ptr %t5644, i64 3
  store i64 %t5637, ptr %t5649
  %t5650 = getelementptr i64, ptr %t5644, i64 4
  store i64 %t5646, ptr %t5650
  %t5651 = musttail call fastcc i64 @"scheme.base:code_1017"(i64 %t5646, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5651
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5656 = icmp eq i64 %argc, 1
  br i1 %t5656, label %argok1158, label %arityerr1157
arityerr1157:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1158:
  %t5657 = call i64 @rt_cdr(i64 %a0)
  %t5658 = call i64 @rt_null_p(i64 %t5657)
  %t5659 = icmp ne i64 %t5658, 1
  br i1 %t5659, label %then1159, label %else1160
then1159:
  %t5660 = call i64 @rt_car(i64 %a0)
  %t5661 = call i64 @rt_string_length(i64 %t5660)
  ret i64 %t5661
else1160:
  %t5662 = call i64 @rt_car(i64 %a0)
  %t5663 = call i64 @rt_string_length(i64 %t5662)
  %t5664 = call i64 @rt_cdr(i64 %a0)
  %t5665 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5665)
  %t5666 = and i64 %t5665, -8
  %t5667 = inttoptr i64 %t5666 to ptr
  %t5668 = load i64, ptr %t5667
  %t5669 = inttoptr i64 %t5668 to ptr
  %t5670 = call fastcc i64%t5669(i64 %t5665, i64 1, i64 %t5664, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5671 = or i64 %t5663, %t5670
  %t5672 = and i64 %t5671, 7
  %t5673 = icmp eq i64 %t5672, 0
  br i1 %t5673, label %fixfast1161, label %fixslow1162
fixfast1161:
  %t5674 = icmp slt i64 %t5663, %t5670
  %t5675 = select i1 %t5674, i64 257, i64 1
  br label %fixmerge1163
fixslow1162:
  %t5676 = call i64 @rt_lt(i64 %t5663, i64 %t5670)
  br label %fixmerge1163
fixmerge1163:
  %t5677 = phi i64 [ %t5675, %fixfast1161 ], [ %t5676, %fixslow1162 ]
  %t5678 = icmp ne i64 %t5677, 1
  br i1 %t5678, label %then1164, label %else1165
then1164:
  ret i64 %t5663
else1165:
  ret i64 %t5670
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5683 = icmp eq i64 %argc, 2
  br i1 %t5683, label %argok1167, label %arityerr1166
arityerr1166:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1167:
  %t5684 = call i64 @rt_null_p(i64 %a0)
  %t5685 = icmp ne i64 %t5684, 1
  br i1 %t5685, label %then1168, label %else1169
then1168:
  ret i64 2
else1169:
  %t5686 = call i64 @rt_car(i64 %a0)
  %t5687 = call i64 @rt_string_ref(i64 %t5686, i64 %a1)
  %t5688 = call i64 @rt_cdr(i64 %a0)
  %t5689 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5689)
  %t5690 = and i64 %t5689, -8
  %t5691 = inttoptr i64 %t5690 to ptr
  %t5692 = load i64, ptr %t5691
  %t5693 = inttoptr i64 %t5692 to ptr
  %t5694 = call fastcc i64%t5693(i64 %t5689, i64 2, i64 %t5688, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5695 = call i64 @rt_cons(i64 %t5687, i64 %t5694)
  ret i64 %t5695
}

define fastcc i64 @"scheme.base:code_1039"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5700 = icmp eq i64 %argc, 1
  br i1 %t5700, label %argok1171, label %arityerr1170
arityerr1170:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1171:
  %t5701 = and i64 %self, -8
  %t5702 = inttoptr i64 %t5701 to ptr
  %t5703 = getelementptr i64, ptr %t5702, i64 1
  %t5704 = load i64, ptr %t5703
  %t5705 = or i64 %a0, %t5704
  %t5706 = and i64 %t5705, 7
  %t5707 = icmp eq i64 %t5706, 0
  br i1 %t5707, label %fixfast1172, label %fixslow1173
fixfast1172:
  %t5708 = icmp eq i64 %a0, %t5704
  %t5709 = select i1 %t5708, i64 257, i64 1
  br label %fixmerge1174
fixslow1173:
  %t5710 = call i64 @rt_num_eq(i64 %a0, i64 %t5704)
  br label %fixmerge1174
fixmerge1174:
  %t5711 = phi i64 [ %t5709, %fixfast1172 ], [ %t5710, %fixslow1173 ]
  %t5712 = icmp ne i64 %t5711, 1
  br i1 %t5712, label %then1175, label %else1176
then1175:
  %t5713 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5713)
  %t5714 = and i64 %t5713, -8
  %t5715 = inttoptr i64 %t5714 to ptr
  %t5716 = load i64, ptr %t5715
  %t5717 = inttoptr i64 %t5716 to ptr
  %t5718 = musttail call fastcc i64 %t5717(i64 %t5713, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5718
else1176:
  %t5719 = and i64 %self, -8
  %t5720 = inttoptr i64 %t5719 to ptr
  %t5721 = getelementptr i64, ptr %t5720, i64 2
  %t5722 = load i64, ptr %t5721
  %t5723 = and i64 %self, -8
  %t5724 = inttoptr i64 %t5723 to ptr
  %t5725 = getelementptr i64, ptr %t5724, i64 3
  %t5726 = load i64, ptr %t5725
  %t5727 = call i64 @rt_string_set(i64 %t5722, i64 %a0, i64 %t5726)
  %t5728 = or i64 %a0, 8
  %t5729 = and i64 %t5728, 7
  %t5730 = icmp eq i64 %t5729, 0
  br i1 %t5730, label %fixfast1177, label %fixslow1178
fixfast1177:
  %t5731 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5732 = extractvalue {i64, i1} %t5731, 0
  %t5733 = extractvalue {i64, i1} %t5731, 1
  br i1 %t5733, label %fixslow1178, label %fixmerge1179
fixslow1178:
  %t5734 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1179
fixmerge1179:
  %t5735 = phi i64 [ %t5732, %fixfast1177 ], [ %t5734, %fixslow1178 ]
  %t5736 = musttail call fastcc i64 @"scheme.base:code_1039"(i64 %self, i64 1, i64 %t5735, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5736
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5737 = icmp sge i64 %argc, 2
  br i1 %t5737, label %argok1181, label %arityerr1180
arityerr1180:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1181:
  %t5738 = call ptr @rt_alloc_words(i64 8)
  %t5739 = getelementptr i64, ptr %t5738, i64 0
  store i64 %a0, ptr %t5739
  %t5740 = getelementptr i64, ptr %t5738, i64 1
  store i64 %a1, ptr %t5740
  %t5741 = getelementptr i64, ptr %t5738, i64 2
  store i64 %a2, ptr %t5741
  %t5742 = getelementptr i64, ptr %t5738, i64 3
  store i64 %a3, ptr %t5742
  %t5743 = getelementptr i64, ptr %t5738, i64 4
  store i64 %a4, ptr %t5743
  %t5744 = getelementptr i64, ptr %t5738, i64 5
  store i64 %a5, ptr %t5744
  %t5745 = getelementptr i64, ptr %t5738, i64 6
  store i64 %a6, ptr %t5745
  %t5746 = getelementptr i64, ptr %t5738, i64 7
  store i64 %a7, ptr %t5746
  %t5747 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5738, ptr %overflow)
  %t5748 = call i64 @rt_string_length(i64 %a0)
  %t5749 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5749)
  %t5750 = and i64 %t5749, -8
  %t5751 = inttoptr i64 %t5750 to ptr
  %t5752 = load i64, ptr %t5751
  %t5753 = inttoptr i64 %t5752 to ptr
  %t5754 = call fastcc i64%t5753(i64 %t5749, i64 1, i64 %t5747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5755 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5755)
  %t5756 = and i64 %t5755, -8
  %t5757 = inttoptr i64 %t5756 to ptr
  %t5758 = load i64, ptr %t5757
  %t5759 = inttoptr i64 %t5758 to ptr
  %t5760 = call fastcc i64%t5759(i64 %t5755, i64 2, i64 %t5747, i64 %t5748, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5761 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5762 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5762)
  %t5763 = and i64 %t5762, -8
  %t5764 = inttoptr i64 %t5763 to ptr
  %t5765 = load i64, ptr %t5764
  %t5766 = inttoptr i64 %t5765 to ptr
  %t5767 = call fastcc i64%t5766(i64 %t5762, i64 4, i64 %t5761, i64 %t5754, i64 %t5760, i64 %t5748, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5768 = call ptr @rt_alloc_words(i64 5)
  %t5769 = ptrtoint ptr %t5768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1039" to i64), ptr %t5768
  %t5770 = or i64 %t5769, 4
  %t5771 = getelementptr i64, ptr %t5768, i64 1
  store i64 %t5760, ptr %t5771
  %t5772 = getelementptr i64, ptr %t5768, i64 2
  store i64 %a0, ptr %t5772
  %t5773 = getelementptr i64, ptr %t5768, i64 3
  store i64 %a1, ptr %t5773
  %t5774 = getelementptr i64, ptr %t5768, i64 4
  store i64 %t5770, ptr %t5774
  %t5775 = musttail call fastcc i64 @"scheme.base:code_1039"(i64 %t5770, i64 1, i64 %t5754, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5775
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5776 = call i64 @rt_string_length(i64 %a0)
  %t5777 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5777)
  %t5778 = and i64 %t5777, -8
  %t5779 = inttoptr i64 %t5778 to ptr
  %t5780 = load i64, ptr %t5779
  %t5781 = inttoptr i64 %t5780 to ptr
  %t5782 = call fastcc i64%t5781(i64 %t5777, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5783 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5783)
  %t5784 = and i64 %t5783, -8
  %t5785 = inttoptr i64 %t5784 to ptr
  %t5786 = load i64, ptr %t5785
  %t5787 = inttoptr i64 %t5786 to ptr
  %t5788 = call fastcc i64%t5787(i64 %t5783, i64 2, i64 2, i64 %t5776, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5789 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5790 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5790)
  %t5791 = and i64 %t5790, -8
  %t5792 = inttoptr i64 %t5791 to ptr
  %t5793 = load i64, ptr %t5792
  %t5794 = inttoptr i64 %t5793 to ptr
  %t5795 = call fastcc i64%t5794(i64 %t5790, i64 4, i64 %t5789, i64 %t5782, i64 %t5788, i64 %t5776, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5796 = call ptr @rt_alloc_words(i64 5)
  %t5797 = ptrtoint ptr %t5796 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1039" to i64), ptr %t5796
  %t5798 = or i64 %t5797, 4
  %t5799 = getelementptr i64, ptr %t5796, i64 1
  store i64 %t5788, ptr %t5799
  %t5800 = getelementptr i64, ptr %t5796, i64 2
  store i64 %a0, ptr %t5800
  %t5801 = getelementptr i64, ptr %t5796, i64 3
  store i64 %a1, ptr %t5801
  %t5802 = getelementptr i64, ptr %t5796, i64 4
  store i64 %t5798, ptr %t5802
  %t5803 = musttail call fastcc i64 @"scheme.base:code_1039"(i64 %t5798, i64 1, i64 %t5782, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5803
}

define fastcc i64 @"scheme.base:code_1059"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5808 = icmp eq i64 %argc, 1
  br i1 %t5808, label %argok1183, label %arityerr1182
arityerr1182:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1183:
  %t5809 = or i64 %a0, 0
  %t5810 = and i64 %t5809, 7
  %t5811 = icmp eq i64 %t5810, 0
  br i1 %t5811, label %fixfast1184, label %fixslow1185
fixfast1184:
  %t5812 = icmp slt i64 %a0, 0
  %t5813 = select i1 %t5812, i64 257, i64 1
  br label %fixmerge1186
fixslow1185:
  %t5814 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1186
fixmerge1186:
  %t5815 = phi i64 [ %t5813, %fixfast1184 ], [ %t5814, %fixslow1185 ]
  %t5816 = icmp ne i64 %t5815, 1
  br i1 %t5816, label %then1187, label %else1188
then1187:
  %t5817 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5817)
  %t5818 = and i64 %t5817, -8
  %t5819 = inttoptr i64 %t5818 to ptr
  %t5820 = load i64, ptr %t5819
  %t5821 = inttoptr i64 %t5820 to ptr
  %t5822 = musttail call fastcc i64 %t5821(i64 %t5817, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5822
else1188:
  %t5823 = and i64 %self, -8
  %t5824 = inttoptr i64 %t5823 to ptr
  %t5825 = getelementptr i64, ptr %t5824, i64 1
  %t5826 = load i64, ptr %t5825
  %t5827 = and i64 %self, -8
  %t5828 = inttoptr i64 %t5827 to ptr
  %t5829 = getelementptr i64, ptr %t5828, i64 2
  %t5830 = load i64, ptr %t5829
  %t5831 = or i64 %t5830, %a0
  %t5832 = and i64 %t5831, 7
  %t5833 = icmp eq i64 %t5832, 0
  br i1 %t5833, label %fixfast1189, label %fixslow1190
fixfast1189:
  %t5834 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5830, i64 %a0)
  %t5835 = extractvalue {i64, i1} %t5834, 0
  %t5836 = extractvalue {i64, i1} %t5834, 1
  br i1 %t5836, label %fixslow1190, label %fixmerge1191
fixslow1190:
  %t5837 = call i64 @rt_add(i64 %t5830, i64 %a0)
  br label %fixmerge1191
fixmerge1191:
  %t5838 = phi i64 [ %t5835, %fixfast1189 ], [ %t5837, %fixslow1190 ]
  %t5839 = and i64 %self, -8
  %t5840 = inttoptr i64 %t5839 to ptr
  %t5841 = getelementptr i64, ptr %t5840, i64 3
  %t5842 = load i64, ptr %t5841
  %t5843 = and i64 %self, -8
  %t5844 = inttoptr i64 %t5843 to ptr
  %t5845 = getelementptr i64, ptr %t5844, i64 4
  %t5846 = load i64, ptr %t5845
  %t5847 = or i64 %t5846, %a0
  %t5848 = and i64 %t5847, 7
  %t5849 = icmp eq i64 %t5848, 0
  br i1 %t5849, label %fixfast1192, label %fixslow1193
fixfast1192:
  %t5850 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5846, i64 %a0)
  %t5851 = extractvalue {i64, i1} %t5850, 0
  %t5852 = extractvalue {i64, i1} %t5850, 1
  br i1 %t5852, label %fixslow1193, label %fixmerge1194
fixslow1193:
  %t5853 = call i64 @rt_add(i64 %t5846, i64 %a0)
  br label %fixmerge1194
fixmerge1194:
  %t5854 = phi i64 [ %t5851, %fixfast1192 ], [ %t5853, %fixslow1193 ]
  %t5855 = call i64 @rt_string_ref(i64 %t5842, i64 %t5854)
  %t5856 = call i64 @rt_string_set(i64 %t5826, i64 %t5838, i64 %t5855)
  %t5857 = or i64 %a0, 8
  %t5858 = and i64 %t5857, 7
  %t5859 = icmp eq i64 %t5858, 0
  br i1 %t5859, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t5860 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5861 = extractvalue {i64, i1} %t5860, 0
  %t5862 = extractvalue {i64, i1} %t5860, 1
  br i1 %t5862, label %fixslow1196, label %fixmerge1197
fixslow1196:
  %t5863 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1197
fixmerge1197:
  %t5864 = phi i64 [ %t5861, %fixfast1195 ], [ %t5863, %fixslow1196 ]
  %t5865 = musttail call fastcc i64 @"scheme.base:code_1059"(i64 %self, i64 1, i64 %t5864, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5865
}

define fastcc i64 @"scheme.base:code_1061"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5866 = icmp eq i64 %argc, 1
  br i1 %t5866, label %argok1199, label %arityerr1198
arityerr1198:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1199:
  %t5867 = and i64 %self, -8
  %t5868 = inttoptr i64 %t5867 to ptr
  %t5869 = getelementptr i64, ptr %t5868, i64 1
  %t5870 = load i64, ptr %t5869
  %t5871 = and i64 %self, -8
  %t5872 = inttoptr i64 %t5871 to ptr
  %t5873 = getelementptr i64, ptr %t5872, i64 2
  %t5874 = load i64, ptr %t5873
  %t5875 = or i64 %t5870, %t5874
  %t5876 = and i64 %t5875, 7
  %t5877 = icmp eq i64 %t5876, 0
  br i1 %t5877, label %fixfast1200, label %fixslow1201
fixfast1200:
  %t5878 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5870, i64 %t5874)
  %t5879 = extractvalue {i64, i1} %t5878, 0
  %t5880 = extractvalue {i64, i1} %t5878, 1
  br i1 %t5880, label %fixslow1201, label %fixmerge1202
fixslow1201:
  %t5881 = call i64 @rt_sub(i64 %t5870, i64 %t5874)
  br label %fixmerge1202
fixmerge1202:
  %t5882 = phi i64 [ %t5879, %fixfast1200 ], [ %t5881, %fixslow1201 ]
  %t5883 = or i64 %a0, %t5882
  %t5884 = and i64 %t5883, 7
  %t5885 = icmp eq i64 %t5884, 0
  br i1 %t5885, label %fixfast1203, label %fixslow1204
fixfast1203:
  %t5886 = icmp eq i64 %a0, %t5882
  %t5887 = select i1 %t5886, i64 257, i64 1
  br label %fixmerge1205
fixslow1204:
  %t5888 = call i64 @rt_num_eq(i64 %a0, i64 %t5882)
  br label %fixmerge1205
fixmerge1205:
  %t5889 = phi i64 [ %t5887, %fixfast1203 ], [ %t5888, %fixslow1204 ]
  %t5890 = icmp ne i64 %t5889, 1
  br i1 %t5890, label %then1206, label %else1207
then1206:
  %t5891 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5891)
  %t5892 = and i64 %t5891, -8
  %t5893 = inttoptr i64 %t5892 to ptr
  %t5894 = load i64, ptr %t5893
  %t5895 = inttoptr i64 %t5894 to ptr
  %t5896 = musttail call fastcc i64 %t5895(i64 %t5891, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5896
else1207:
  %t5897 = and i64 %self, -8
  %t5898 = inttoptr i64 %t5897 to ptr
  %t5899 = getelementptr i64, ptr %t5898, i64 3
  %t5900 = load i64, ptr %t5899
  %t5901 = and i64 %self, -8
  %t5902 = inttoptr i64 %t5901 to ptr
  %t5903 = getelementptr i64, ptr %t5902, i64 4
  %t5904 = load i64, ptr %t5903
  %t5905 = or i64 %t5904, %a0
  %t5906 = and i64 %t5905, 7
  %t5907 = icmp eq i64 %t5906, 0
  br i1 %t5907, label %fixfast1208, label %fixslow1209
fixfast1208:
  %t5908 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5904, i64 %a0)
  %t5909 = extractvalue {i64, i1} %t5908, 0
  %t5910 = extractvalue {i64, i1} %t5908, 1
  br i1 %t5910, label %fixslow1209, label %fixmerge1210
fixslow1209:
  %t5911 = call i64 @rt_add(i64 %t5904, i64 %a0)
  br label %fixmerge1210
fixmerge1210:
  %t5912 = phi i64 [ %t5909, %fixfast1208 ], [ %t5911, %fixslow1209 ]
  %t5913 = and i64 %self, -8
  %t5914 = inttoptr i64 %t5913 to ptr
  %t5915 = getelementptr i64, ptr %t5914, i64 5
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
  %t5929 = call i64 @rt_string_ref(i64 %t5916, i64 %t5928)
  %t5930 = call i64 @rt_string_set(i64 %t5900, i64 %t5912, i64 %t5929)
  %t5931 = or i64 %a0, 8
  %t5932 = and i64 %t5931, 7
  %t5933 = icmp eq i64 %t5932, 0
  br i1 %t5933, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5934 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5935 = extractvalue {i64, i1} %t5934, 0
  %t5936 = extractvalue {i64, i1} %t5934, 1
  br i1 %t5936, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t5937 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1216
fixmerge1216:
  %t5938 = phi i64 [ %t5935, %fixfast1214 ], [ %t5937, %fixslow1215 ]
  %t5939 = musttail call fastcc i64 @"scheme.base:code_1061"(i64 %self, i64 1, i64 %t5938, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5939
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5940 = icmp sge i64 %argc, 3
  br i1 %t5940, label %argok1218, label %arityerr1217
arityerr1217:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1218:
  %t5941 = call ptr @rt_alloc_words(i64 8)
  %t5942 = getelementptr i64, ptr %t5941, i64 0
  store i64 %a0, ptr %t5942
  %t5943 = getelementptr i64, ptr %t5941, i64 1
  store i64 %a1, ptr %t5943
  %t5944 = getelementptr i64, ptr %t5941, i64 2
  store i64 %a2, ptr %t5944
  %t5945 = getelementptr i64, ptr %t5941, i64 3
  store i64 %a3, ptr %t5945
  %t5946 = getelementptr i64, ptr %t5941, i64 4
  store i64 %a4, ptr %t5946
  %t5947 = getelementptr i64, ptr %t5941, i64 5
  store i64 %a5, ptr %t5947
  %t5948 = getelementptr i64, ptr %t5941, i64 6
  store i64 %a6, ptr %t5948
  %t5949 = getelementptr i64, ptr %t5941, i64 7
  store i64 %a7, ptr %t5949
  %t5950 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5941, ptr %overflow)
  %t5951 = call i64 @rt_string_length(i64 %a2)
  %t5952 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5952)
  %t5953 = and i64 %t5952, -8
  %t5954 = inttoptr i64 %t5953 to ptr
  %t5955 = load i64, ptr %t5954
  %t5956 = inttoptr i64 %t5955 to ptr
  %t5957 = call fastcc i64%t5956(i64 %t5952, i64 1, i64 %t5950, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5958 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5958)
  %t5959 = and i64 %t5958, -8
  %t5960 = inttoptr i64 %t5959 to ptr
  %t5961 = load i64, ptr %t5960
  %t5962 = inttoptr i64 %t5961 to ptr
  %t5963 = call fastcc i64%t5962(i64 %t5958, i64 2, i64 %t5950, i64 %t5951, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5964 = call i64 @rt_intern(ptr @.str.sym.41)
  %t5965 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5965)
  %t5966 = and i64 %t5965, -8
  %t5967 = inttoptr i64 %t5966 to ptr
  %t5968 = load i64, ptr %t5967
  %t5969 = inttoptr i64 %t5968 to ptr
  %t5970 = call fastcc i64%t5969(i64 %t5965, i64 4, i64 %t5964, i64 %t5957, i64 %t5963, i64 %t5951, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5971 = call i64 @rt_intern(ptr @.str.sym.41)
  %t5972 = or i64 %t5963, %t5957
  %t5973 = and i64 %t5972, 7
  %t5974 = icmp eq i64 %t5973, 0
  br i1 %t5974, label %fixfast1219, label %fixslow1220
fixfast1219:
  %t5975 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5963, i64 %t5957)
  %t5976 = extractvalue {i64, i1} %t5975, 0
  %t5977 = extractvalue {i64, i1} %t5975, 1
  br i1 %t5977, label %fixslow1220, label %fixmerge1221
fixslow1220:
  %t5978 = call i64 @rt_sub(i64 %t5963, i64 %t5957)
  br label %fixmerge1221
fixmerge1221:
  %t5979 = phi i64 [ %t5976, %fixfast1219 ], [ %t5978, %fixslow1220 ]
  %t5980 = or i64 %a1, %t5979
  %t5981 = and i64 %t5980, 7
  %t5982 = icmp eq i64 %t5981, 0
  br i1 %t5982, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t5983 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5979)
  %t5984 = extractvalue {i64, i1} %t5983, 0
  %t5985 = extractvalue {i64, i1} %t5983, 1
  br i1 %t5985, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t5986 = call i64 @rt_add(i64 %a1, i64 %t5979)
  br label %fixmerge1224
fixmerge1224:
  %t5987 = phi i64 [ %t5984, %fixfast1222 ], [ %t5986, %fixslow1223 ]
  %t5988 = call i64 @rt_string_length(i64 %a0)
  %t5989 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5989)
  %t5990 = and i64 %t5989, -8
  %t5991 = inttoptr i64 %t5990 to ptr
  %t5992 = load i64, ptr %t5991
  %t5993 = inttoptr i64 %t5992 to ptr
  %t5994 = call fastcc i64%t5993(i64 %t5989, i64 4, i64 %t5971, i64 %a1, i64 %t5987, i64 %t5988, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5995 = or i64 %t5957, %a1
  %t5996 = and i64 %t5995, 7
  %t5997 = icmp eq i64 %t5996, 0
  br i1 %t5997, label %fixfast1225, label %fixslow1226
fixfast1225:
  %t5998 = icmp slt i64 %t5957, %a1
  %t5999 = select i1 %t5998, i64 257, i64 1
  br label %fixmerge1227
fixslow1226:
  %t6000 = call i64 @rt_lt(i64 %t5957, i64 %a1)
  br label %fixmerge1227
fixmerge1227:
  %t6001 = phi i64 [ %t5999, %fixfast1225 ], [ %t6000, %fixslow1226 ]
  %t6002 = icmp ne i64 %t6001, 1
  br i1 %t6002, label %then1228, label %else1229
then1228:
  %t6003 = call ptr @rt_alloc_words(i64 6)
  %t6004 = ptrtoint ptr %t6003 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1059" to i64), ptr %t6003
  %t6005 = or i64 %t6004, 4
  %t6006 = getelementptr i64, ptr %t6003, i64 1
  store i64 %a0, ptr %t6006
  %t6007 = getelementptr i64, ptr %t6003, i64 2
  store i64 %a1, ptr %t6007
  %t6008 = getelementptr i64, ptr %t6003, i64 3
  store i64 %a2, ptr %t6008
  %t6009 = getelementptr i64, ptr %t6003, i64 4
  store i64 %t5957, ptr %t6009
  %t6010 = getelementptr i64, ptr %t6003, i64 5
  store i64 %t6005, ptr %t6010
  %t6011 = or i64 %t5963, %t5957
  %t6012 = and i64 %t6011, 7
  %t6013 = icmp eq i64 %t6012, 0
  br i1 %t6013, label %fixfast1230, label %fixslow1231
fixfast1230:
  %t6014 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5963, i64 %t5957)
  %t6015 = extractvalue {i64, i1} %t6014, 0
  %t6016 = extractvalue {i64, i1} %t6014, 1
  br i1 %t6016, label %fixslow1231, label %fixmerge1232
fixslow1231:
  %t6017 = call i64 @rt_sub(i64 %t5963, i64 %t5957)
  br label %fixmerge1232
fixmerge1232:
  %t6018 = phi i64 [ %t6015, %fixfast1230 ], [ %t6017, %fixslow1231 ]
  %t6019 = or i64 %t6018, 8
  %t6020 = and i64 %t6019, 7
  %t6021 = icmp eq i64 %t6020, 0
  br i1 %t6021, label %fixfast1233, label %fixslow1234
fixfast1233:
  %t6022 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6018, i64 8)
  %t6023 = extractvalue {i64, i1} %t6022, 0
  %t6024 = extractvalue {i64, i1} %t6022, 1
  br i1 %t6024, label %fixslow1234, label %fixmerge1235
fixslow1234:
  %t6025 = call i64 @rt_sub(i64 %t6018, i64 8)
  br label %fixmerge1235
fixmerge1235:
  %t6026 = phi i64 [ %t6023, %fixfast1233 ], [ %t6025, %fixslow1234 ]
  %t6027 = musttail call fastcc i64 @"scheme.base:code_1059"(i64 %t6005, i64 1, i64 %t6026, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6027
else1229:
  %t6028 = call ptr @rt_alloc_words(i64 7)
  %t6029 = ptrtoint ptr %t6028 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1061" to i64), ptr %t6028
  %t6030 = or i64 %t6029, 4
  %t6031 = getelementptr i64, ptr %t6028, i64 1
  store i64 %t5963, ptr %t6031
  %t6032 = getelementptr i64, ptr %t6028, i64 2
  store i64 %t5957, ptr %t6032
  %t6033 = getelementptr i64, ptr %t6028, i64 3
  store i64 %a0, ptr %t6033
  %t6034 = getelementptr i64, ptr %t6028, i64 4
  store i64 %a1, ptr %t6034
  %t6035 = getelementptr i64, ptr %t6028, i64 5
  store i64 %a2, ptr %t6035
  %t6036 = getelementptr i64, ptr %t6028, i64 6
  store i64 %t6030, ptr %t6036
  %t6037 = musttail call fastcc i64 @"scheme.base:code_1061"(i64 %t6030, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6037
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6038 = call i64 @rt_string_length(i64 %a2)
  %t6039 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6039)
  %t6040 = and i64 %t6039, -8
  %t6041 = inttoptr i64 %t6040 to ptr
  %t6042 = load i64, ptr %t6041
  %t6043 = inttoptr i64 %t6042 to ptr
  %t6044 = call fastcc i64%t6043(i64 %t6039, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6045 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6045)
  %t6046 = and i64 %t6045, -8
  %t6047 = inttoptr i64 %t6046 to ptr
  %t6048 = load i64, ptr %t6047
  %t6049 = inttoptr i64 %t6048 to ptr
  %t6050 = call fastcc i64%t6049(i64 %t6045, i64 2, i64 2, i64 %t6038, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6051 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6052 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6052)
  %t6053 = and i64 %t6052, -8
  %t6054 = inttoptr i64 %t6053 to ptr
  %t6055 = load i64, ptr %t6054
  %t6056 = inttoptr i64 %t6055 to ptr
  %t6057 = call fastcc i64%t6056(i64 %t6052, i64 4, i64 %t6051, i64 %t6044, i64 %t6050, i64 %t6038, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6058 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6059 = or i64 %t6050, %t6044
  %t6060 = and i64 %t6059, 7
  %t6061 = icmp eq i64 %t6060, 0
  br i1 %t6061, label %fixfast1236, label %fixslow1237
fixfast1236:
  %t6062 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6050, i64 %t6044)
  %t6063 = extractvalue {i64, i1} %t6062, 0
  %t6064 = extractvalue {i64, i1} %t6062, 1
  br i1 %t6064, label %fixslow1237, label %fixmerge1238
fixslow1237:
  %t6065 = call i64 @rt_sub(i64 %t6050, i64 %t6044)
  br label %fixmerge1238
fixmerge1238:
  %t6066 = phi i64 [ %t6063, %fixfast1236 ], [ %t6065, %fixslow1237 ]
  %t6067 = or i64 %a1, %t6066
  %t6068 = and i64 %t6067, 7
  %t6069 = icmp eq i64 %t6068, 0
  br i1 %t6069, label %fixfast1239, label %fixslow1240
fixfast1239:
  %t6070 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6066)
  %t6071 = extractvalue {i64, i1} %t6070, 0
  %t6072 = extractvalue {i64, i1} %t6070, 1
  br i1 %t6072, label %fixslow1240, label %fixmerge1241
fixslow1240:
  %t6073 = call i64 @rt_add(i64 %a1, i64 %t6066)
  br label %fixmerge1241
fixmerge1241:
  %t6074 = phi i64 [ %t6071, %fixfast1239 ], [ %t6073, %fixslow1240 ]
  %t6075 = call i64 @rt_string_length(i64 %a0)
  %t6076 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6076)
  %t6077 = and i64 %t6076, -8
  %t6078 = inttoptr i64 %t6077 to ptr
  %t6079 = load i64, ptr %t6078
  %t6080 = inttoptr i64 %t6079 to ptr
  %t6081 = call fastcc i64%t6080(i64 %t6076, i64 4, i64 %t6058, i64 %a1, i64 %t6074, i64 %t6075, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6082 = or i64 %t6044, %a1
  %t6083 = and i64 %t6082, 7
  %t6084 = icmp eq i64 %t6083, 0
  br i1 %t6084, label %fixfast1242, label %fixslow1243
fixfast1242:
  %t6085 = icmp slt i64 %t6044, %a1
  %t6086 = select i1 %t6085, i64 257, i64 1
  br label %fixmerge1244
fixslow1243:
  %t6087 = call i64 @rt_lt(i64 %t6044, i64 %a1)
  br label %fixmerge1244
fixmerge1244:
  %t6088 = phi i64 [ %t6086, %fixfast1242 ], [ %t6087, %fixslow1243 ]
  %t6089 = icmp ne i64 %t6088, 1
  br i1 %t6089, label %then1245, label %else1246
then1245:
  %t6090 = call ptr @rt_alloc_words(i64 6)
  %t6091 = ptrtoint ptr %t6090 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1059" to i64), ptr %t6090
  %t6092 = or i64 %t6091, 4
  %t6093 = getelementptr i64, ptr %t6090, i64 1
  store i64 %a0, ptr %t6093
  %t6094 = getelementptr i64, ptr %t6090, i64 2
  store i64 %a1, ptr %t6094
  %t6095 = getelementptr i64, ptr %t6090, i64 3
  store i64 %a2, ptr %t6095
  %t6096 = getelementptr i64, ptr %t6090, i64 4
  store i64 %t6044, ptr %t6096
  %t6097 = getelementptr i64, ptr %t6090, i64 5
  store i64 %t6092, ptr %t6097
  %t6098 = or i64 %t6050, %t6044
  %t6099 = and i64 %t6098, 7
  %t6100 = icmp eq i64 %t6099, 0
  br i1 %t6100, label %fixfast1247, label %fixslow1248
fixfast1247:
  %t6101 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6050, i64 %t6044)
  %t6102 = extractvalue {i64, i1} %t6101, 0
  %t6103 = extractvalue {i64, i1} %t6101, 1
  br i1 %t6103, label %fixslow1248, label %fixmerge1249
fixslow1248:
  %t6104 = call i64 @rt_sub(i64 %t6050, i64 %t6044)
  br label %fixmerge1249
fixmerge1249:
  %t6105 = phi i64 [ %t6102, %fixfast1247 ], [ %t6104, %fixslow1248 ]
  %t6106 = or i64 %t6105, 8
  %t6107 = and i64 %t6106, 7
  %t6108 = icmp eq i64 %t6107, 0
  br i1 %t6108, label %fixfast1250, label %fixslow1251
fixfast1250:
  %t6109 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6105, i64 8)
  %t6110 = extractvalue {i64, i1} %t6109, 0
  %t6111 = extractvalue {i64, i1} %t6109, 1
  br i1 %t6111, label %fixslow1251, label %fixmerge1252
fixslow1251:
  %t6112 = call i64 @rt_sub(i64 %t6105, i64 8)
  br label %fixmerge1252
fixmerge1252:
  %t6113 = phi i64 [ %t6110, %fixfast1250 ], [ %t6112, %fixslow1251 ]
  %t6114 = musttail call fastcc i64 @"scheme.base:code_1059"(i64 %t6092, i64 1, i64 %t6113, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6114
else1246:
  %t6115 = call ptr @rt_alloc_words(i64 7)
  %t6116 = ptrtoint ptr %t6115 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1061" to i64), ptr %t6115
  %t6117 = or i64 %t6116, 4
  %t6118 = getelementptr i64, ptr %t6115, i64 1
  store i64 %t6050, ptr %t6118
  %t6119 = getelementptr i64, ptr %t6115, i64 2
  store i64 %t6044, ptr %t6119
  %t6120 = getelementptr i64, ptr %t6115, i64 3
  store i64 %a0, ptr %t6120
  %t6121 = getelementptr i64, ptr %t6115, i64 4
  store i64 %a1, ptr %t6121
  %t6122 = getelementptr i64, ptr %t6115, i64 5
  store i64 %a2, ptr %t6122
  %t6123 = getelementptr i64, ptr %t6115, i64 6
  store i64 %t6117, ptr %t6123
  %t6124 = musttail call fastcc i64 @"scheme.base:code_1061"(i64 %t6117, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6124
}

define fastcc i64 @"scheme.base:code_1074"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6129 = icmp eq i64 %argc, 1
  br i1 %t6129, label %argok1254, label %arityerr1253
arityerr1253:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1254:
  %t6130 = and i64 %self, -8
  %t6131 = inttoptr i64 %t6130 to ptr
  %t6132 = getelementptr i64, ptr %t6131, i64 1
  %t6133 = load i64, ptr %t6132
  %t6134 = or i64 %a0, %t6133
  %t6135 = and i64 %t6134, 7
  %t6136 = icmp eq i64 %t6135, 0
  br i1 %t6136, label %fixfast1255, label %fixslow1256
fixfast1255:
  %t6137 = icmp eq i64 %a0, %t6133
  %t6138 = select i1 %t6137, i64 257, i64 1
  br label %fixmerge1257
fixslow1256:
  %t6139 = call i64 @rt_num_eq(i64 %a0, i64 %t6133)
  br label %fixmerge1257
fixmerge1257:
  %t6140 = phi i64 [ %t6138, %fixfast1255 ], [ %t6139, %fixslow1256 ]
  %t6141 = icmp ne i64 %t6140, 1
  br i1 %t6141, label %then1258, label %else1259
then1258:
  %t6142 = and i64 %self, -8
  %t6143 = inttoptr i64 %t6142 to ptr
  %t6144 = getelementptr i64, ptr %t6143, i64 2
  %t6145 = load i64, ptr %t6144
  ret i64 %t6145
else1259:
  %t6146 = and i64 %self, -8
  %t6147 = inttoptr i64 %t6146 to ptr
  %t6148 = getelementptr i64, ptr %t6147, i64 2
  %t6149 = load i64, ptr %t6148
  %t6150 = and i64 %self, -8
  %t6151 = inttoptr i64 %t6150 to ptr
  %t6152 = getelementptr i64, ptr %t6151, i64 3
  %t6153 = load i64, ptr %t6152
  %t6154 = or i64 %a0, %t6153
  %t6155 = and i64 %t6154, 7
  %t6156 = icmp eq i64 %t6155, 0
  br i1 %t6156, label %fixfast1260, label %fixslow1261
fixfast1260:
  %t6157 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6153)
  %t6158 = extractvalue {i64, i1} %t6157, 0
  %t6159 = extractvalue {i64, i1} %t6157, 1
  br i1 %t6159, label %fixslow1261, label %fixmerge1262
fixslow1261:
  %t6160 = call i64 @rt_sub(i64 %a0, i64 %t6153)
  br label %fixmerge1262
fixmerge1262:
  %t6161 = phi i64 [ %t6158, %fixfast1260 ], [ %t6160, %fixslow1261 ]
  %t6162 = and i64 %self, -8
  %t6163 = inttoptr i64 %t6162 to ptr
  %t6164 = getelementptr i64, ptr %t6163, i64 4
  %t6165 = load i64, ptr %t6164
  %t6166 = call i64 @rt_bytevector_u8_ref(i64 %t6165, i64 %a0)
  %t6167 = call i64 @rt_bytevector_u8_set(i64 %t6149, i64 %t6161, i64 %t6166)
  %t6168 = or i64 %a0, 8
  %t6169 = and i64 %t6168, 7
  %t6170 = icmp eq i64 %t6169, 0
  br i1 %t6170, label %fixfast1263, label %fixslow1264
fixfast1263:
  %t6171 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6172 = extractvalue {i64, i1} %t6171, 0
  %t6173 = extractvalue {i64, i1} %t6171, 1
  br i1 %t6173, label %fixslow1264, label %fixmerge1265
fixslow1264:
  %t6174 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1265
fixmerge1265:
  %t6175 = phi i64 [ %t6172, %fixfast1263 ], [ %t6174, %fixslow1264 ]
  %t6176 = musttail call fastcc i64 @"scheme.base:code_1074"(i64 %self, i64 1, i64 %t6175, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6176
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6177 = icmp sge i64 %argc, 1
  br i1 %t6177, label %argok1267, label %arityerr1266
arityerr1266:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1267:
  %t6178 = call ptr @rt_alloc_words(i64 8)
  %t6179 = getelementptr i64, ptr %t6178, i64 0
  store i64 %a0, ptr %t6179
  %t6180 = getelementptr i64, ptr %t6178, i64 1
  store i64 %a1, ptr %t6180
  %t6181 = getelementptr i64, ptr %t6178, i64 2
  store i64 %a2, ptr %t6181
  %t6182 = getelementptr i64, ptr %t6178, i64 3
  store i64 %a3, ptr %t6182
  %t6183 = getelementptr i64, ptr %t6178, i64 4
  store i64 %a4, ptr %t6183
  %t6184 = getelementptr i64, ptr %t6178, i64 5
  store i64 %a5, ptr %t6184
  %t6185 = getelementptr i64, ptr %t6178, i64 6
  store i64 %a6, ptr %t6185
  %t6186 = getelementptr i64, ptr %t6178, i64 7
  store i64 %a7, ptr %t6186
  %t6187 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t6178, ptr %overflow)
  %t6188 = call i64 @rt_bytevector_length(i64 %a0)
  %t6189 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6189)
  %t6190 = and i64 %t6189, -8
  %t6191 = inttoptr i64 %t6190 to ptr
  %t6192 = load i64, ptr %t6191
  %t6193 = inttoptr i64 %t6192 to ptr
  %t6194 = call fastcc i64%t6193(i64 %t6189, i64 1, i64 %t6187, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6195 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6195)
  %t6196 = and i64 %t6195, -8
  %t6197 = inttoptr i64 %t6196 to ptr
  %t6198 = load i64, ptr %t6197
  %t6199 = inttoptr i64 %t6198 to ptr
  %t6200 = call fastcc i64%t6199(i64 %t6195, i64 2, i64 %t6187, i64 %t6188, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6201 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6202 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6202)
  %t6203 = and i64 %t6202, -8
  %t6204 = inttoptr i64 %t6203 to ptr
  %t6205 = load i64, ptr %t6204
  %t6206 = inttoptr i64 %t6205 to ptr
  %t6207 = call fastcc i64%t6206(i64 %t6202, i64 4, i64 %t6201, i64 %t6194, i64 %t6200, i64 %t6188, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6208 = or i64 %t6200, %t6194
  %t6209 = and i64 %t6208, 7
  %t6210 = icmp eq i64 %t6209, 0
  br i1 %t6210, label %fixfast1268, label %fixslow1269
fixfast1268:
  %t6211 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6200, i64 %t6194)
  %t6212 = extractvalue {i64, i1} %t6211, 0
  %t6213 = extractvalue {i64, i1} %t6211, 1
  br i1 %t6213, label %fixslow1269, label %fixmerge1270
fixslow1269:
  %t6214 = call i64 @rt_sub(i64 %t6200, i64 %t6194)
  br label %fixmerge1270
fixmerge1270:
  %t6215 = phi i64 [ %t6212, %fixfast1268 ], [ %t6214, %fixslow1269 ]
  %t6216 = call i64 @rt_make_bytevector(i64 %t6215, i64 0)
  %t6217 = call ptr @rt_alloc_words(i64 6)
  %t6218 = ptrtoint ptr %t6217 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1074" to i64), ptr %t6217
  %t6219 = or i64 %t6218, 4
  %t6220 = getelementptr i64, ptr %t6217, i64 1
  store i64 %t6200, ptr %t6220
  %t6221 = getelementptr i64, ptr %t6217, i64 2
  store i64 %t6216, ptr %t6221
  %t6222 = getelementptr i64, ptr %t6217, i64 3
  store i64 %t6194, ptr %t6222
  %t6223 = getelementptr i64, ptr %t6217, i64 4
  store i64 %a0, ptr %t6223
  %t6224 = getelementptr i64, ptr %t6217, i64 5
  store i64 %t6219, ptr %t6224
  %t6225 = musttail call fastcc i64 @"scheme.base:code_1074"(i64 %t6219, i64 1, i64 %t6194, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6225
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6226 = call i64 @rt_bytevector_length(i64 %a0)
  %t6227 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6227)
  %t6228 = and i64 %t6227, -8
  %t6229 = inttoptr i64 %t6228 to ptr
  %t6230 = load i64, ptr %t6229
  %t6231 = inttoptr i64 %t6230 to ptr
  %t6232 = call fastcc i64%t6231(i64 %t6227, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6233 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6233)
  %t6234 = and i64 %t6233, -8
  %t6235 = inttoptr i64 %t6234 to ptr
  %t6236 = load i64, ptr %t6235
  %t6237 = inttoptr i64 %t6236 to ptr
  %t6238 = call fastcc i64%t6237(i64 %t6233, i64 2, i64 2, i64 %t6226, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6239 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6240 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6240)
  %t6241 = and i64 %t6240, -8
  %t6242 = inttoptr i64 %t6241 to ptr
  %t6243 = load i64, ptr %t6242
  %t6244 = inttoptr i64 %t6243 to ptr
  %t6245 = call fastcc i64%t6244(i64 %t6240, i64 4, i64 %t6239, i64 %t6232, i64 %t6238, i64 %t6226, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6246 = or i64 %t6238, %t6232
  %t6247 = and i64 %t6246, 7
  %t6248 = icmp eq i64 %t6247, 0
  br i1 %t6248, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t6249 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6238, i64 %t6232)
  %t6250 = extractvalue {i64, i1} %t6249, 0
  %t6251 = extractvalue {i64, i1} %t6249, 1
  br i1 %t6251, label %fixslow1272, label %fixmerge1273
fixslow1272:
  %t6252 = call i64 @rt_sub(i64 %t6238, i64 %t6232)
  br label %fixmerge1273
fixmerge1273:
  %t6253 = phi i64 [ %t6250, %fixfast1271 ], [ %t6252, %fixslow1272 ]
  %t6254 = call i64 @rt_make_bytevector(i64 %t6253, i64 0)
  %t6255 = call ptr @rt_alloc_words(i64 6)
  %t6256 = ptrtoint ptr %t6255 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1074" to i64), ptr %t6255
  %t6257 = or i64 %t6256, 4
  %t6258 = getelementptr i64, ptr %t6255, i64 1
  store i64 %t6238, ptr %t6258
  %t6259 = getelementptr i64, ptr %t6255, i64 2
  store i64 %t6254, ptr %t6259
  %t6260 = getelementptr i64, ptr %t6255, i64 3
  store i64 %t6232, ptr %t6260
  %t6261 = getelementptr i64, ptr %t6255, i64 4
  store i64 %a0, ptr %t6261
  %t6262 = getelementptr i64, ptr %t6255, i64 5
  store i64 %t6257, ptr %t6262
  %t6263 = musttail call fastcc i64 @"scheme.base:code_1074"(i64 %t6257, i64 1, i64 %t6232, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6263
}

define fastcc i64 @"scheme.base:code_1094"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6268 = icmp eq i64 %argc, 1
  br i1 %t6268, label %argok1275, label %arityerr1274
arityerr1274:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1275:
  %t6269 = or i64 %a0, 0
  %t6270 = and i64 %t6269, 7
  %t6271 = icmp eq i64 %t6270, 0
  br i1 %t6271, label %fixfast1276, label %fixslow1277
fixfast1276:
  %t6272 = icmp slt i64 %a0, 0
  %t6273 = select i1 %t6272, i64 257, i64 1
  br label %fixmerge1278
fixslow1277:
  %t6274 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1278
fixmerge1278:
  %t6275 = phi i64 [ %t6273, %fixfast1276 ], [ %t6274, %fixslow1277 ]
  %t6276 = icmp ne i64 %t6275, 1
  br i1 %t6276, label %then1279, label %else1280
then1279:
  %t6277 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6277)
  %t6278 = and i64 %t6277, -8
  %t6279 = inttoptr i64 %t6278 to ptr
  %t6280 = load i64, ptr %t6279
  %t6281 = inttoptr i64 %t6280 to ptr
  %t6282 = musttail call fastcc i64 %t6281(i64 %t6277, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6282
else1280:
  %t6283 = and i64 %self, -8
  %t6284 = inttoptr i64 %t6283 to ptr
  %t6285 = getelementptr i64, ptr %t6284, i64 1
  %t6286 = load i64, ptr %t6285
  %t6287 = and i64 %self, -8
  %t6288 = inttoptr i64 %t6287 to ptr
  %t6289 = getelementptr i64, ptr %t6288, i64 2
  %t6290 = load i64, ptr %t6289
  %t6291 = or i64 %t6290, %a0
  %t6292 = and i64 %t6291, 7
  %t6293 = icmp eq i64 %t6292, 0
  br i1 %t6293, label %fixfast1281, label %fixslow1282
fixfast1281:
  %t6294 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6290, i64 %a0)
  %t6295 = extractvalue {i64, i1} %t6294, 0
  %t6296 = extractvalue {i64, i1} %t6294, 1
  br i1 %t6296, label %fixslow1282, label %fixmerge1283
fixslow1282:
  %t6297 = call i64 @rt_add(i64 %t6290, i64 %a0)
  br label %fixmerge1283
fixmerge1283:
  %t6298 = phi i64 [ %t6295, %fixfast1281 ], [ %t6297, %fixslow1282 ]
  %t6299 = and i64 %self, -8
  %t6300 = inttoptr i64 %t6299 to ptr
  %t6301 = getelementptr i64, ptr %t6300, i64 3
  %t6302 = load i64, ptr %t6301
  %t6303 = and i64 %self, -8
  %t6304 = inttoptr i64 %t6303 to ptr
  %t6305 = getelementptr i64, ptr %t6304, i64 4
  %t6306 = load i64, ptr %t6305
  %t6307 = or i64 %t6306, %a0
  %t6308 = and i64 %t6307, 7
  %t6309 = icmp eq i64 %t6308, 0
  br i1 %t6309, label %fixfast1284, label %fixslow1285
fixfast1284:
  %t6310 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6306, i64 %a0)
  %t6311 = extractvalue {i64, i1} %t6310, 0
  %t6312 = extractvalue {i64, i1} %t6310, 1
  br i1 %t6312, label %fixslow1285, label %fixmerge1286
fixslow1285:
  %t6313 = call i64 @rt_add(i64 %t6306, i64 %a0)
  br label %fixmerge1286
fixmerge1286:
  %t6314 = phi i64 [ %t6311, %fixfast1284 ], [ %t6313, %fixslow1285 ]
  %t6315 = call i64 @rt_bytevector_u8_ref(i64 %t6302, i64 %t6314)
  %t6316 = call i64 @rt_bytevector_u8_set(i64 %t6286, i64 %t6298, i64 %t6315)
  %t6317 = or i64 %a0, 8
  %t6318 = and i64 %t6317, 7
  %t6319 = icmp eq i64 %t6318, 0
  br i1 %t6319, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t6320 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t6321 = extractvalue {i64, i1} %t6320, 0
  %t6322 = extractvalue {i64, i1} %t6320, 1
  br i1 %t6322, label %fixslow1288, label %fixmerge1289
fixslow1288:
  %t6323 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1289
fixmerge1289:
  %t6324 = phi i64 [ %t6321, %fixfast1287 ], [ %t6323, %fixslow1288 ]
  %t6325 = musttail call fastcc i64 @"scheme.base:code_1094"(i64 %self, i64 1, i64 %t6324, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6325
}

define fastcc i64 @"scheme.base:code_1096"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6326 = icmp eq i64 %argc, 1
  br i1 %t6326, label %argok1291, label %arityerr1290
arityerr1290:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1291:
  %t6327 = and i64 %self, -8
  %t6328 = inttoptr i64 %t6327 to ptr
  %t6329 = getelementptr i64, ptr %t6328, i64 1
  %t6330 = load i64, ptr %t6329
  %t6331 = and i64 %self, -8
  %t6332 = inttoptr i64 %t6331 to ptr
  %t6333 = getelementptr i64, ptr %t6332, i64 2
  %t6334 = load i64, ptr %t6333
  %t6335 = or i64 %t6330, %t6334
  %t6336 = and i64 %t6335, 7
  %t6337 = icmp eq i64 %t6336, 0
  br i1 %t6337, label %fixfast1292, label %fixslow1293
fixfast1292:
  %t6338 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6330, i64 %t6334)
  %t6339 = extractvalue {i64, i1} %t6338, 0
  %t6340 = extractvalue {i64, i1} %t6338, 1
  br i1 %t6340, label %fixslow1293, label %fixmerge1294
fixslow1293:
  %t6341 = call i64 @rt_sub(i64 %t6330, i64 %t6334)
  br label %fixmerge1294
fixmerge1294:
  %t6342 = phi i64 [ %t6339, %fixfast1292 ], [ %t6341, %fixslow1293 ]
  %t6343 = or i64 %a0, %t6342
  %t6344 = and i64 %t6343, 7
  %t6345 = icmp eq i64 %t6344, 0
  br i1 %t6345, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t6346 = icmp eq i64 %a0, %t6342
  %t6347 = select i1 %t6346, i64 257, i64 1
  br label %fixmerge1297
fixslow1296:
  %t6348 = call i64 @rt_num_eq(i64 %a0, i64 %t6342)
  br label %fixmerge1297
fixmerge1297:
  %t6349 = phi i64 [ %t6347, %fixfast1295 ], [ %t6348, %fixslow1296 ]
  %t6350 = icmp ne i64 %t6349, 1
  br i1 %t6350, label %then1298, label %else1299
then1298:
  %t6351 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6351)
  %t6352 = and i64 %t6351, -8
  %t6353 = inttoptr i64 %t6352 to ptr
  %t6354 = load i64, ptr %t6353
  %t6355 = inttoptr i64 %t6354 to ptr
  %t6356 = musttail call fastcc i64 %t6355(i64 %t6351, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6356
else1299:
  %t6357 = and i64 %self, -8
  %t6358 = inttoptr i64 %t6357 to ptr
  %t6359 = getelementptr i64, ptr %t6358, i64 3
  %t6360 = load i64, ptr %t6359
  %t6361 = and i64 %self, -8
  %t6362 = inttoptr i64 %t6361 to ptr
  %t6363 = getelementptr i64, ptr %t6362, i64 4
  %t6364 = load i64, ptr %t6363
  %t6365 = or i64 %t6364, %a0
  %t6366 = and i64 %t6365, 7
  %t6367 = icmp eq i64 %t6366, 0
  br i1 %t6367, label %fixfast1300, label %fixslow1301
fixfast1300:
  %t6368 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6364, i64 %a0)
  %t6369 = extractvalue {i64, i1} %t6368, 0
  %t6370 = extractvalue {i64, i1} %t6368, 1
  br i1 %t6370, label %fixslow1301, label %fixmerge1302
fixslow1301:
  %t6371 = call i64 @rt_add(i64 %t6364, i64 %a0)
  br label %fixmerge1302
fixmerge1302:
  %t6372 = phi i64 [ %t6369, %fixfast1300 ], [ %t6371, %fixslow1301 ]
  %t6373 = and i64 %self, -8
  %t6374 = inttoptr i64 %t6373 to ptr
  %t6375 = getelementptr i64, ptr %t6374, i64 5
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
  %t6389 = call i64 @rt_bytevector_u8_ref(i64 %t6376, i64 %t6388)
  %t6390 = call i64 @rt_bytevector_u8_set(i64 %t6360, i64 %t6372, i64 %t6389)
  %t6391 = or i64 %a0, 8
  %t6392 = and i64 %t6391, 7
  %t6393 = icmp eq i64 %t6392, 0
  br i1 %t6393, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t6394 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6395 = extractvalue {i64, i1} %t6394, 0
  %t6396 = extractvalue {i64, i1} %t6394, 1
  br i1 %t6396, label %fixslow1307, label %fixmerge1308
fixslow1307:
  %t6397 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1308
fixmerge1308:
  %t6398 = phi i64 [ %t6395, %fixfast1306 ], [ %t6397, %fixslow1307 ]
  %t6399 = musttail call fastcc i64 @"scheme.base:code_1096"(i64 %self, i64 1, i64 %t6398, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6399
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6400 = icmp sge i64 %argc, 3
  br i1 %t6400, label %argok1310, label %arityerr1309
arityerr1309:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1310:
  %t6401 = call ptr @rt_alloc_words(i64 8)
  %t6402 = getelementptr i64, ptr %t6401, i64 0
  store i64 %a0, ptr %t6402
  %t6403 = getelementptr i64, ptr %t6401, i64 1
  store i64 %a1, ptr %t6403
  %t6404 = getelementptr i64, ptr %t6401, i64 2
  store i64 %a2, ptr %t6404
  %t6405 = getelementptr i64, ptr %t6401, i64 3
  store i64 %a3, ptr %t6405
  %t6406 = getelementptr i64, ptr %t6401, i64 4
  store i64 %a4, ptr %t6406
  %t6407 = getelementptr i64, ptr %t6401, i64 5
  store i64 %a5, ptr %t6407
  %t6408 = getelementptr i64, ptr %t6401, i64 6
  store i64 %a6, ptr %t6408
  %t6409 = getelementptr i64, ptr %t6401, i64 7
  store i64 %a7, ptr %t6409
  %t6410 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t6401, ptr %overflow)
  %t6411 = call i64 @rt_bytevector_length(i64 %a2)
  %t6412 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6412)
  %t6413 = and i64 %t6412, -8
  %t6414 = inttoptr i64 %t6413 to ptr
  %t6415 = load i64, ptr %t6414
  %t6416 = inttoptr i64 %t6415 to ptr
  %t6417 = call fastcc i64%t6416(i64 %t6412, i64 1, i64 %t6410, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6418 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6418)
  %t6419 = and i64 %t6418, -8
  %t6420 = inttoptr i64 %t6419 to ptr
  %t6421 = load i64, ptr %t6420
  %t6422 = inttoptr i64 %t6421 to ptr
  %t6423 = call fastcc i64%t6422(i64 %t6418, i64 2, i64 %t6410, i64 %t6411, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6424 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6425 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6425)
  %t6426 = and i64 %t6425, -8
  %t6427 = inttoptr i64 %t6426 to ptr
  %t6428 = load i64, ptr %t6427
  %t6429 = inttoptr i64 %t6428 to ptr
  %t6430 = call fastcc i64%t6429(i64 %t6425, i64 4, i64 %t6424, i64 %t6417, i64 %t6423, i64 %t6411, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6431 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6432 = or i64 %t6423, %t6417
  %t6433 = and i64 %t6432, 7
  %t6434 = icmp eq i64 %t6433, 0
  br i1 %t6434, label %fixfast1311, label %fixslow1312
fixfast1311:
  %t6435 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6423, i64 %t6417)
  %t6436 = extractvalue {i64, i1} %t6435, 0
  %t6437 = extractvalue {i64, i1} %t6435, 1
  br i1 %t6437, label %fixslow1312, label %fixmerge1313
fixslow1312:
  %t6438 = call i64 @rt_sub(i64 %t6423, i64 %t6417)
  br label %fixmerge1313
fixmerge1313:
  %t6439 = phi i64 [ %t6436, %fixfast1311 ], [ %t6438, %fixslow1312 ]
  %t6440 = or i64 %a1, %t6439
  %t6441 = and i64 %t6440, 7
  %t6442 = icmp eq i64 %t6441, 0
  br i1 %t6442, label %fixfast1314, label %fixslow1315
fixfast1314:
  %t6443 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6439)
  %t6444 = extractvalue {i64, i1} %t6443, 0
  %t6445 = extractvalue {i64, i1} %t6443, 1
  br i1 %t6445, label %fixslow1315, label %fixmerge1316
fixslow1315:
  %t6446 = call i64 @rt_add(i64 %a1, i64 %t6439)
  br label %fixmerge1316
fixmerge1316:
  %t6447 = phi i64 [ %t6444, %fixfast1314 ], [ %t6446, %fixslow1315 ]
  %t6448 = call i64 @rt_bytevector_length(i64 %a0)
  %t6449 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6449)
  %t6450 = and i64 %t6449, -8
  %t6451 = inttoptr i64 %t6450 to ptr
  %t6452 = load i64, ptr %t6451
  %t6453 = inttoptr i64 %t6452 to ptr
  %t6454 = call fastcc i64%t6453(i64 %t6449, i64 4, i64 %t6431, i64 %a1, i64 %t6447, i64 %t6448, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6455 = or i64 %t6417, %a1
  %t6456 = and i64 %t6455, 7
  %t6457 = icmp eq i64 %t6456, 0
  br i1 %t6457, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t6458 = icmp slt i64 %t6417, %a1
  %t6459 = select i1 %t6458, i64 257, i64 1
  br label %fixmerge1319
fixslow1318:
  %t6460 = call i64 @rt_lt(i64 %t6417, i64 %a1)
  br label %fixmerge1319
fixmerge1319:
  %t6461 = phi i64 [ %t6459, %fixfast1317 ], [ %t6460, %fixslow1318 ]
  %t6462 = icmp ne i64 %t6461, 1
  br i1 %t6462, label %then1320, label %else1321
then1320:
  %t6463 = call ptr @rt_alloc_words(i64 6)
  %t6464 = ptrtoint ptr %t6463 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1094" to i64), ptr %t6463
  %t6465 = or i64 %t6464, 4
  %t6466 = getelementptr i64, ptr %t6463, i64 1
  store i64 %a0, ptr %t6466
  %t6467 = getelementptr i64, ptr %t6463, i64 2
  store i64 %a1, ptr %t6467
  %t6468 = getelementptr i64, ptr %t6463, i64 3
  store i64 %a2, ptr %t6468
  %t6469 = getelementptr i64, ptr %t6463, i64 4
  store i64 %t6417, ptr %t6469
  %t6470 = getelementptr i64, ptr %t6463, i64 5
  store i64 %t6465, ptr %t6470
  %t6471 = or i64 %t6423, %t6417
  %t6472 = and i64 %t6471, 7
  %t6473 = icmp eq i64 %t6472, 0
  br i1 %t6473, label %fixfast1322, label %fixslow1323
fixfast1322:
  %t6474 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6423, i64 %t6417)
  %t6475 = extractvalue {i64, i1} %t6474, 0
  %t6476 = extractvalue {i64, i1} %t6474, 1
  br i1 %t6476, label %fixslow1323, label %fixmerge1324
fixslow1323:
  %t6477 = call i64 @rt_sub(i64 %t6423, i64 %t6417)
  br label %fixmerge1324
fixmerge1324:
  %t6478 = phi i64 [ %t6475, %fixfast1322 ], [ %t6477, %fixslow1323 ]
  %t6479 = or i64 %t6478, 8
  %t6480 = and i64 %t6479, 7
  %t6481 = icmp eq i64 %t6480, 0
  br i1 %t6481, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t6482 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6478, i64 8)
  %t6483 = extractvalue {i64, i1} %t6482, 0
  %t6484 = extractvalue {i64, i1} %t6482, 1
  br i1 %t6484, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t6485 = call i64 @rt_sub(i64 %t6478, i64 8)
  br label %fixmerge1327
fixmerge1327:
  %t6486 = phi i64 [ %t6483, %fixfast1325 ], [ %t6485, %fixslow1326 ]
  %t6487 = musttail call fastcc i64 @"scheme.base:code_1094"(i64 %t6465, i64 1, i64 %t6486, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6487
else1321:
  %t6488 = call ptr @rt_alloc_words(i64 7)
  %t6489 = ptrtoint ptr %t6488 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1096" to i64), ptr %t6488
  %t6490 = or i64 %t6489, 4
  %t6491 = getelementptr i64, ptr %t6488, i64 1
  store i64 %t6423, ptr %t6491
  %t6492 = getelementptr i64, ptr %t6488, i64 2
  store i64 %t6417, ptr %t6492
  %t6493 = getelementptr i64, ptr %t6488, i64 3
  store i64 %a0, ptr %t6493
  %t6494 = getelementptr i64, ptr %t6488, i64 4
  store i64 %a1, ptr %t6494
  %t6495 = getelementptr i64, ptr %t6488, i64 5
  store i64 %a2, ptr %t6495
  %t6496 = getelementptr i64, ptr %t6488, i64 6
  store i64 %t6490, ptr %t6496
  %t6497 = musttail call fastcc i64 @"scheme.base:code_1096"(i64 %t6490, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6497
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6498 = call i64 @rt_bytevector_length(i64 %a2)
  %t6499 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6499)
  %t6500 = and i64 %t6499, -8
  %t6501 = inttoptr i64 %t6500 to ptr
  %t6502 = load i64, ptr %t6501
  %t6503 = inttoptr i64 %t6502 to ptr
  %t6504 = call fastcc i64%t6503(i64 %t6499, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6505 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6505)
  %t6506 = and i64 %t6505, -8
  %t6507 = inttoptr i64 %t6506 to ptr
  %t6508 = load i64, ptr %t6507
  %t6509 = inttoptr i64 %t6508 to ptr
  %t6510 = call fastcc i64%t6509(i64 %t6505, i64 2, i64 2, i64 %t6498, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6511 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6512 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6512)
  %t6513 = and i64 %t6512, -8
  %t6514 = inttoptr i64 %t6513 to ptr
  %t6515 = load i64, ptr %t6514
  %t6516 = inttoptr i64 %t6515 to ptr
  %t6517 = call fastcc i64%t6516(i64 %t6512, i64 4, i64 %t6511, i64 %t6504, i64 %t6510, i64 %t6498, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6518 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6519 = or i64 %t6510, %t6504
  %t6520 = and i64 %t6519, 7
  %t6521 = icmp eq i64 %t6520, 0
  br i1 %t6521, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t6522 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6510, i64 %t6504)
  %t6523 = extractvalue {i64, i1} %t6522, 0
  %t6524 = extractvalue {i64, i1} %t6522, 1
  br i1 %t6524, label %fixslow1329, label %fixmerge1330
fixslow1329:
  %t6525 = call i64 @rt_sub(i64 %t6510, i64 %t6504)
  br label %fixmerge1330
fixmerge1330:
  %t6526 = phi i64 [ %t6523, %fixfast1328 ], [ %t6525, %fixslow1329 ]
  %t6527 = or i64 %a1, %t6526
  %t6528 = and i64 %t6527, 7
  %t6529 = icmp eq i64 %t6528, 0
  br i1 %t6529, label %fixfast1331, label %fixslow1332
fixfast1331:
  %t6530 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6526)
  %t6531 = extractvalue {i64, i1} %t6530, 0
  %t6532 = extractvalue {i64, i1} %t6530, 1
  br i1 %t6532, label %fixslow1332, label %fixmerge1333
fixslow1332:
  %t6533 = call i64 @rt_add(i64 %a1, i64 %t6526)
  br label %fixmerge1333
fixmerge1333:
  %t6534 = phi i64 [ %t6531, %fixfast1331 ], [ %t6533, %fixslow1332 ]
  %t6535 = call i64 @rt_bytevector_length(i64 %a0)
  %t6536 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6536)
  %t6537 = and i64 %t6536, -8
  %t6538 = inttoptr i64 %t6537 to ptr
  %t6539 = load i64, ptr %t6538
  %t6540 = inttoptr i64 %t6539 to ptr
  %t6541 = call fastcc i64%t6540(i64 %t6536, i64 4, i64 %t6518, i64 %a1, i64 %t6534, i64 %t6535, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6542 = or i64 %t6504, %a1
  %t6543 = and i64 %t6542, 7
  %t6544 = icmp eq i64 %t6543, 0
  br i1 %t6544, label %fixfast1334, label %fixslow1335
fixfast1334:
  %t6545 = icmp slt i64 %t6504, %a1
  %t6546 = select i1 %t6545, i64 257, i64 1
  br label %fixmerge1336
fixslow1335:
  %t6547 = call i64 @rt_lt(i64 %t6504, i64 %a1)
  br label %fixmerge1336
fixmerge1336:
  %t6548 = phi i64 [ %t6546, %fixfast1334 ], [ %t6547, %fixslow1335 ]
  %t6549 = icmp ne i64 %t6548, 1
  br i1 %t6549, label %then1337, label %else1338
then1337:
  %t6550 = call ptr @rt_alloc_words(i64 6)
  %t6551 = ptrtoint ptr %t6550 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1094" to i64), ptr %t6550
  %t6552 = or i64 %t6551, 4
  %t6553 = getelementptr i64, ptr %t6550, i64 1
  store i64 %a0, ptr %t6553
  %t6554 = getelementptr i64, ptr %t6550, i64 2
  store i64 %a1, ptr %t6554
  %t6555 = getelementptr i64, ptr %t6550, i64 3
  store i64 %a2, ptr %t6555
  %t6556 = getelementptr i64, ptr %t6550, i64 4
  store i64 %t6504, ptr %t6556
  %t6557 = getelementptr i64, ptr %t6550, i64 5
  store i64 %t6552, ptr %t6557
  %t6558 = or i64 %t6510, %t6504
  %t6559 = and i64 %t6558, 7
  %t6560 = icmp eq i64 %t6559, 0
  br i1 %t6560, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t6561 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6510, i64 %t6504)
  %t6562 = extractvalue {i64, i1} %t6561, 0
  %t6563 = extractvalue {i64, i1} %t6561, 1
  br i1 %t6563, label %fixslow1340, label %fixmerge1341
fixslow1340:
  %t6564 = call i64 @rt_sub(i64 %t6510, i64 %t6504)
  br label %fixmerge1341
fixmerge1341:
  %t6565 = phi i64 [ %t6562, %fixfast1339 ], [ %t6564, %fixslow1340 ]
  %t6566 = or i64 %t6565, 8
  %t6567 = and i64 %t6566, 7
  %t6568 = icmp eq i64 %t6567, 0
  br i1 %t6568, label %fixfast1342, label %fixslow1343
fixfast1342:
  %t6569 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6565, i64 8)
  %t6570 = extractvalue {i64, i1} %t6569, 0
  %t6571 = extractvalue {i64, i1} %t6569, 1
  br i1 %t6571, label %fixslow1343, label %fixmerge1344
fixslow1343:
  %t6572 = call i64 @rt_sub(i64 %t6565, i64 8)
  br label %fixmerge1344
fixmerge1344:
  %t6573 = phi i64 [ %t6570, %fixfast1342 ], [ %t6572, %fixslow1343 ]
  %t6574 = musttail call fastcc i64 @"scheme.base:code_1094"(i64 %t6552, i64 1, i64 %t6573, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6574
else1338:
  %t6575 = call ptr @rt_alloc_words(i64 7)
  %t6576 = ptrtoint ptr %t6575 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1096" to i64), ptr %t6575
  %t6577 = or i64 %t6576, 4
  %t6578 = getelementptr i64, ptr %t6575, i64 1
  store i64 %t6510, ptr %t6578
  %t6579 = getelementptr i64, ptr %t6575, i64 2
  store i64 %t6504, ptr %t6579
  %t6580 = getelementptr i64, ptr %t6575, i64 3
  store i64 %a0, ptr %t6580
  %t6581 = getelementptr i64, ptr %t6575, i64 4
  store i64 %a1, ptr %t6581
  %t6582 = getelementptr i64, ptr %t6575, i64 5
  store i64 %a2, ptr %t6582
  %t6583 = getelementptr i64, ptr %t6575, i64 6
  store i64 %t6577, ptr %t6583
  %t6584 = musttail call fastcc i64 @"scheme.base:code_1096"(i64 %t6577, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6584
}

define fastcc i64 @"scheme.base:code_1112"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6589 = icmp eq i64 %argc, 1
  br i1 %t6589, label %argok1346, label %arityerr1345
arityerr1345:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1346:
  %t6590 = and i64 %self, -8
  %t6591 = inttoptr i64 %t6590 to ptr
  %t6592 = getelementptr i64, ptr %t6591, i64 1
  %t6593 = load i64, ptr %t6592
  %t6594 = or i64 %a0, %t6593
  %t6595 = and i64 %t6594, 7
  %t6596 = icmp eq i64 %t6595, 0
  br i1 %t6596, label %fixfast1347, label %fixslow1348
fixfast1347:
  %t6597 = icmp eq i64 %a0, %t6593
  %t6598 = select i1 %t6597, i64 257, i64 1
  br label %fixmerge1349
fixslow1348:
  %t6599 = call i64 @rt_num_eq(i64 %a0, i64 %t6593)
  br label %fixmerge1349
fixmerge1349:
  %t6600 = phi i64 [ %t6598, %fixfast1347 ], [ %t6599, %fixslow1348 ]
  %t6601 = icmp ne i64 %t6600, 1
  br i1 %t6601, label %then1350, label %else1351
then1350:
  %t6602 = and i64 %self, -8
  %t6603 = inttoptr i64 %t6602 to ptr
  %t6604 = getelementptr i64, ptr %t6603, i64 3
  %t6605 = load i64, ptr %t6604
  %t6606 = call i64 @rt_cdr(i64 %t6605)
  %t6607 = and i64 %self, -8
  %t6608 = inttoptr i64 %t6607 to ptr
  %t6609 = getelementptr i64, ptr %t6608, i64 4
  %t6610 = load i64, ptr %t6609
  %t6611 = and i64 %self, -8
  %t6612 = inttoptr i64 %t6611 to ptr
  %t6613 = getelementptr i64, ptr %t6612, i64 1
  %t6614 = load i64, ptr %t6613
  %t6615 = or i64 %t6610, %t6614
  %t6616 = and i64 %t6615, 7
  %t6617 = icmp eq i64 %t6616, 0
  br i1 %t6617, label %fixfast1352, label %fixslow1353
fixfast1352:
  %t6618 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6610, i64 %t6614)
  %t6619 = extractvalue {i64, i1} %t6618, 0
  %t6620 = extractvalue {i64, i1} %t6618, 1
  br i1 %t6620, label %fixslow1353, label %fixmerge1354
fixslow1353:
  %t6621 = call i64 @rt_add(i64 %t6610, i64 %t6614)
  br label %fixmerge1354
fixmerge1354:
  %t6622 = phi i64 [ %t6619, %fixfast1352 ], [ %t6621, %fixslow1353 ]
  %t6623 = and i64 %self, -8
  %t6624 = inttoptr i64 %t6623 to ptr
  %t6625 = getelementptr i64, ptr %t6624, i64 2
  %t6626 = load i64, ptr %t6625
  %t6627 = musttail call fastcc i64 @"scheme.base:code_1110"(i64 %t6626, i64 2, i64 %t6606, i64 %t6622, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6627
else1351:
  %t6628 = and i64 %self, -8
  %t6629 = inttoptr i64 %t6628 to ptr
  %t6630 = getelementptr i64, ptr %t6629, i64 5
  %t6631 = load i64, ptr %t6630
  %t6632 = and i64 %self, -8
  %t6633 = inttoptr i64 %t6632 to ptr
  %t6634 = getelementptr i64, ptr %t6633, i64 4
  %t6635 = load i64, ptr %t6634
  %t6636 = or i64 %t6635, %a0
  %t6637 = and i64 %t6636, 7
  %t6638 = icmp eq i64 %t6637, 0
  br i1 %t6638, label %fixfast1355, label %fixslow1356
fixfast1355:
  %t6639 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6635, i64 %a0)
  %t6640 = extractvalue {i64, i1} %t6639, 0
  %t6641 = extractvalue {i64, i1} %t6639, 1
  br i1 %t6641, label %fixslow1356, label %fixmerge1357
fixslow1356:
  %t6642 = call i64 @rt_add(i64 %t6635, i64 %a0)
  br label %fixmerge1357
fixmerge1357:
  %t6643 = phi i64 [ %t6640, %fixfast1355 ], [ %t6642, %fixslow1356 ]
  %t6644 = and i64 %self, -8
  %t6645 = inttoptr i64 %t6644 to ptr
  %t6646 = getelementptr i64, ptr %t6645, i64 6
  %t6647 = load i64, ptr %t6646
  %t6648 = call i64 @rt_bytevector_u8_ref(i64 %t6647, i64 %a0)
  %t6649 = call i64 @rt_bytevector_u8_set(i64 %t6631, i64 %t6643, i64 %t6648)
  %t6650 = or i64 %a0, 8
  %t6651 = and i64 %t6650, 7
  %t6652 = icmp eq i64 %t6651, 0
  br i1 %t6652, label %fixfast1358, label %fixslow1359
fixfast1358:
  %t6653 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6654 = extractvalue {i64, i1} %t6653, 0
  %t6655 = extractvalue {i64, i1} %t6653, 1
  br i1 %t6655, label %fixslow1359, label %fixmerge1360
fixslow1359:
  %t6656 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1360
fixmerge1360:
  %t6657 = phi i64 [ %t6654, %fixfast1358 ], [ %t6656, %fixslow1359 ]
  %t6658 = musttail call fastcc i64 @"scheme.base:code_1112"(i64 %self, i64 1, i64 %t6657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6658
}

define fastcc i64 @"scheme.base:code_1110"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6659 = icmp eq i64 %argc, 2
  br i1 %t6659, label %argok1362, label %arityerr1361
arityerr1361:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1362:
  %t6660 = call i64 @rt_null_p(i64 %a0)
  %t6661 = icmp ne i64 %t6660, 1
  br i1 %t6661, label %then1363, label %else1364
then1363:
  %t6662 = and i64 %self, -8
  %t6663 = inttoptr i64 %t6662 to ptr
  %t6664 = getelementptr i64, ptr %t6663, i64 1
  %t6665 = load i64, ptr %t6664
  ret i64 %t6665
else1364:
  %t6666 = call i64 @rt_car(i64 %a0)
  %t6667 = call i64 @rt_bytevector_length(i64 %t6666)
  %t6668 = call ptr @rt_alloc_words(i64 8)
  %t6669 = ptrtoint ptr %t6668 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1112" to i64), ptr %t6668
  %t6670 = or i64 %t6669, 4
  %t6671 = getelementptr i64, ptr %t6668, i64 1
  store i64 %t6667, ptr %t6671
  %t6672 = and i64 %self, -8
  %t6673 = inttoptr i64 %t6672 to ptr
  %t6674 = getelementptr i64, ptr %t6673, i64 2
  %t6675 = load i64, ptr %t6674
  %t6676 = getelementptr i64, ptr %t6668, i64 2
  store i64 %t6675, ptr %t6676
  %t6677 = getelementptr i64, ptr %t6668, i64 3
  store i64 %a0, ptr %t6677
  %t6678 = getelementptr i64, ptr %t6668, i64 4
  store i64 %a1, ptr %t6678
  %t6679 = and i64 %self, -8
  %t6680 = inttoptr i64 %t6679 to ptr
  %t6681 = getelementptr i64, ptr %t6680, i64 1
  %t6682 = load i64, ptr %t6681
  %t6683 = getelementptr i64, ptr %t6668, i64 5
  store i64 %t6682, ptr %t6683
  %t6684 = getelementptr i64, ptr %t6668, i64 6
  store i64 %t6666, ptr %t6684
  %t6685 = getelementptr i64, ptr %t6668, i64 7
  store i64 %t6670, ptr %t6685
  %t6686 = musttail call fastcc i64 @"scheme.base:code_1112"(i64 %t6670, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6686
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6687 = icmp sge i64 %argc, 0
  br i1 %t6687, label %argok1366, label %arityerr1365
arityerr1365:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1366:
  %t6688 = call ptr @rt_alloc_words(i64 8)
  %t6689 = getelementptr i64, ptr %t6688, i64 0
  store i64 %a0, ptr %t6689
  %t6690 = getelementptr i64, ptr %t6688, i64 1
  store i64 %a1, ptr %t6690
  %t6691 = getelementptr i64, ptr %t6688, i64 2
  store i64 %a2, ptr %t6691
  %t6692 = getelementptr i64, ptr %t6688, i64 3
  store i64 %a3, ptr %t6692
  %t6693 = getelementptr i64, ptr %t6688, i64 4
  store i64 %a4, ptr %t6693
  %t6694 = getelementptr i64, ptr %t6688, i64 5
  store i64 %a5, ptr %t6694
  %t6695 = getelementptr i64, ptr %t6688, i64 6
  store i64 %a6, ptr %t6695
  %t6696 = getelementptr i64, ptr %t6688, i64 7
  store i64 %a7, ptr %t6696
  %t6697 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6688, ptr %overflow)
  %t6698 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6698)
  %t6699 = and i64 %t6698, -8
  %t6700 = inttoptr i64 %t6699 to ptr
  %t6701 = load i64, ptr %t6700
  %t6702 = inttoptr i64 %t6701 to ptr
  %t6703 = call fastcc i64%t6702(i64 %t6698, i64 1, i64 %t6697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6704 = call i64 @rt_make_bytevector(i64 %t6703, i64 0)
  %t6705 = call ptr @rt_alloc_words(i64 3)
  %t6706 = ptrtoint ptr %t6705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1110" to i64), ptr %t6705
  %t6707 = or i64 %t6706, 4
  %t6708 = getelementptr i64, ptr %t6705, i64 1
  store i64 %t6704, ptr %t6708
  %t6709 = getelementptr i64, ptr %t6705, i64 2
  store i64 %t6707, ptr %t6709
  %t6710 = musttail call fastcc i64 @"scheme.base:code_1110"(i64 %t6707, i64 2, i64 %t6697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6710
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6711 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6711)
  %t6712 = and i64 %t6711, -8
  %t6713 = inttoptr i64 %t6712 to ptr
  %t6714 = load i64, ptr %t6713
  %t6715 = inttoptr i64 %t6714 to ptr
  %t6716 = call fastcc i64%t6715(i64 %t6711, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6717 = call i64 @rt_make_bytevector(i64 %t6716, i64 0)
  %t6718 = call ptr @rt_alloc_words(i64 3)
  %t6719 = ptrtoint ptr %t6718 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1110" to i64), ptr %t6718
  %t6720 = or i64 %t6719, 4
  %t6721 = getelementptr i64, ptr %t6718, i64 1
  store i64 %t6717, ptr %t6721
  %t6722 = getelementptr i64, ptr %t6718, i64 2
  store i64 %t6720, ptr %t6722
  %t6723 = musttail call fastcc i64 @"scheme.base:code_1110"(i64 %t6720, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6723
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6728 = icmp eq i64 %argc, 1
  br i1 %t6728, label %argok1368, label %arityerr1367
arityerr1367:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1368:
  %t6729 = call i64 @rt_null_p(i64 %a0)
  %t6730 = icmp ne i64 %t6729, 1
  br i1 %t6730, label %then1369, label %else1370
then1369:
  ret i64 0
else1370:
  %t6731 = call i64 @rt_car(i64 %a0)
  %t6732 = call i64 @rt_bytevector_length(i64 %t6731)
  %t6733 = call i64 @rt_cdr(i64 %a0)
  %t6734 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6734)
  %t6735 = and i64 %t6734, -8
  %t6736 = inttoptr i64 %t6735 to ptr
  %t6737 = load i64, ptr %t6736
  %t6738 = inttoptr i64 %t6737 to ptr
  %t6739 = call fastcc i64%t6738(i64 %t6734, i64 1, i64 %t6733, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6740 = or i64 %t6732, %t6739
  %t6741 = and i64 %t6740, 7
  %t6742 = icmp eq i64 %t6741, 0
  br i1 %t6742, label %fixfast1371, label %fixslow1372
fixfast1371:
  %t6743 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6732, i64 %t6739)
  %t6744 = extractvalue {i64, i1} %t6743, 0
  %t6745 = extractvalue {i64, i1} %t6743, 1
  br i1 %t6745, label %fixslow1372, label %fixmerge1373
fixslow1372:
  %t6746 = call i64 @rt_add(i64 %t6732, i64 %t6739)
  br label %fixmerge1373
fixmerge1373:
  %t6747 = phi i64 [ %t6744, %fixfast1371 ], [ %t6746, %fixslow1372 ]
  ret i64 %t6747
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6753 = icmp eq i64 %argc, 2
  br i1 %t6753, label %argok1375, label %arityerr1374
arityerr1374:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1375:
  %t6754 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6754)
  %t6755 = and i64 %t6754, -8
  %t6756 = inttoptr i64 %t6755 to ptr
  %t6757 = load i64, ptr %t6756
  %t6758 = inttoptr i64 %t6757 to ptr
  %t6759 = call fastcc i64%t6758(i64 %t6754, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6760 = or i64 %a0, %t6759
  %t6761 = and i64 %t6760, 7
  %t6762 = icmp eq i64 %t6761, 0
  br i1 %t6762, label %fixfast1376, label %fixslow1377
fixfast1376:
  %t6763 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6759)
  %t6764 = extractvalue {i64, i1} %t6763, 0
  %t6765 = extractvalue {i64, i1} %t6763, 1
  br i1 %t6765, label %fixslow1377, label %fixmerge1378
fixslow1377:
  %t6766 = call i64 @rt_sub(i64 %a0, i64 %t6759)
  br label %fixmerge1378
fixmerge1378:
  %t6767 = phi i64 [ %t6764, %fixfast1376 ], [ %t6766, %fixslow1377 ]
  %t6768 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6768)
  %t6769 = and i64 %t6768, -8
  %t6770 = inttoptr i64 %t6769 to ptr
  %t6771 = load i64, ptr %t6770
  %t6772 = inttoptr i64 %t6771 to ptr
  %t6773 = call fastcc i64%t6772(i64 %t6768, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6774 = or i64 %a0, %t6773
  %t6775 = and i64 %t6774, 7
  %t6776 = icmp eq i64 %t6775, 0
  br i1 %t6776, label %fixfast1379, label %fixslow1380
fixfast1379:
  %t6777 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t6773)
  %t6778 = extractvalue {i64, i1} %t6777, 0
  %t6779 = extractvalue {i64, i1} %t6777, 1
  br i1 %t6779, label %fixslow1380, label %fixmerge1381
fixslow1380:
  %t6780 = call i64 @rt_add(i64 %a0, i64 %t6773)
  br label %fixmerge1381
fixmerge1381:
  %t6781 = phi i64 [ %t6778, %fixfast1379 ], [ %t6780, %fixslow1380 ]
  %t6782 = call i64 @rt_exact_p(i64 %a0)
  %t6783 = icmp ne i64 %t6782, 1
  br i1 %t6783, label %then1382, label %else1383
then1382:
  %t6784 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1384
else1383:
  br label %merge1384
merge1384:
  %t6785 = phi i64 [ %t6784, %then1382 ], [ 1, %else1383 ]
  %t6786 = icmp ne i64 %t6785, 1
  br i1 %t6786, label %then1385, label %else1386
then1385:
  %t6787 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t6787)
  %t6788 = and i64 %t6787, -8
  %t6789 = inttoptr i64 %t6788 to ptr
  %t6790 = load i64, ptr %t6789
  %t6791 = inttoptr i64 %t6790 to ptr
  %t6792 = musttail call fastcc i64 %t6791(i64 %t6787, i64 2, i64 %t6767, i64 %t6781, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6792
else1386:
  %t6793 = call i64 @rt_exact_to_inexact(i64 %t6767)
  %t6794 = call i64 @rt_exact_to_inexact(i64 %t6781)
  %t6795 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t6795)
  %t6796 = and i64 %t6795, -8
  %t6797 = inttoptr i64 %t6796 to ptr
  %t6798 = load i64, ptr %t6797
  %t6799 = inttoptr i64 %t6798 to ptr
  %t6800 = musttail call fastcc i64 %t6799(i64 %t6795, i64 2, i64 %t6793, i64 %t6794, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6800
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6805 = icmp eq i64 %argc, 2
  br i1 %t6805, label %argok1388, label %arityerr1387
arityerr1387:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1388:
  %t6806 = or i64 %a0, 0
  %t6807 = and i64 %t6806, 7
  %t6808 = icmp eq i64 %t6807, 0
  br i1 %t6808, label %fixfast1389, label %fixslow1390
fixfast1389:
  %t6809 = icmp slt i64 %a0, 0
  %t6810 = select i1 %t6809, i64 257, i64 1
  br label %fixmerge1391
fixslow1390:
  %t6811 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1391
fixmerge1391:
  %t6812 = phi i64 [ %t6810, %fixfast1389 ], [ %t6811, %fixslow1390 ]
  %t6813 = icmp ne i64 %t6812, 1
  br i1 %t6813, label %then1392, label %else1393
then1392:
  br label %merge1394
else1393:
  %t6814 = or i64 %a0, 0
  %t6815 = and i64 %t6814, 7
  %t6816 = icmp eq i64 %t6815, 0
  br i1 %t6816, label %fixfast1395, label %fixslow1396
fixfast1395:
  %t6817 = icmp eq i64 %a0, 0
  %t6818 = select i1 %t6817, i64 257, i64 1
  br label %fixmerge1397
fixslow1396:
  %t6819 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1397
fixmerge1397:
  %t6820 = phi i64 [ %t6818, %fixfast1395 ], [ %t6819, %fixslow1396 ]
  br label %merge1394
merge1394:
  %t6821 = phi i64 [ 257, %then1392 ], [ %t6820, %fixmerge1397 ]
  %t6822 = icmp ne i64 %t6821, 1
  br i1 %t6822, label %then1398, label %else1399
then1398:
  %t6823 = or i64 0, %a1
  %t6824 = and i64 %t6823, 7
  %t6825 = icmp eq i64 %t6824, 0
  br i1 %t6825, label %fixfast1401, label %fixslow1402
fixfast1401:
  %t6826 = icmp slt i64 0, %a1
  %t6827 = select i1 %t6826, i64 257, i64 1
  br label %fixmerge1403
fixslow1402:
  %t6828 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1403
fixmerge1403:
  %t6829 = phi i64 [ %t6827, %fixfast1401 ], [ %t6828, %fixslow1402 ]
  %t6830 = icmp ne i64 %t6829, 1
  br i1 %t6830, label %then1404, label %else1405
then1404:
  br label %merge1406
else1405:
  %t6831 = or i64 0, %a1
  %t6832 = and i64 %t6831, 7
  %t6833 = icmp eq i64 %t6832, 0
  br i1 %t6833, label %fixfast1407, label %fixslow1408
fixfast1407:
  %t6834 = icmp eq i64 0, %a1
  %t6835 = select i1 %t6834, i64 257, i64 1
  br label %fixmerge1409
fixslow1408:
  %t6836 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1409
fixmerge1409:
  %t6837 = phi i64 [ %t6835, %fixfast1407 ], [ %t6836, %fixslow1408 ]
  br label %merge1406
merge1406:
  %t6838 = phi i64 [ 257, %then1404 ], [ %t6837, %fixmerge1409 ]
  br label %merge1400
else1399:
  br label %merge1400
merge1400:
  %t6839 = phi i64 [ %t6838, %merge1406 ], [ 1, %else1399 ]
  %t6840 = icmp ne i64 %t6839, 1
  br i1 %t6840, label %then1410, label %else1411
then1410:
  ret i64 0
else1411:
  %t6841 = or i64 0, %a0
  %t6842 = and i64 %t6841, 7
  %t6843 = icmp eq i64 %t6842, 0
  br i1 %t6843, label %fixfast1412, label %fixslow1413
fixfast1412:
  %t6844 = icmp slt i64 0, %a0
  %t6845 = select i1 %t6844, i64 257, i64 1
  br label %fixmerge1414
fixslow1413:
  %t6846 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1414
fixmerge1414:
  %t6847 = phi i64 [ %t6845, %fixfast1412 ], [ %t6846, %fixslow1413 ]
  %t6848 = icmp ne i64 %t6847, 1
  br i1 %t6848, label %then1415, label %else1416
then1415:
  %t6849 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6849)
  %t6850 = and i64 %t6849, -8
  %t6851 = inttoptr i64 %t6850 to ptr
  %t6852 = load i64, ptr %t6851
  %t6853 = inttoptr i64 %t6852 to ptr
  %t6854 = call fastcc i64%t6853(i64 %t6849, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6855 = or i64 %t6854, %a1
  %t6856 = and i64 %t6855, 7
  %t6857 = icmp eq i64 %t6856, 0
  br i1 %t6857, label %fixfast1417, label %fixslow1418
fixfast1417:
  %t6858 = icmp slt i64 %t6854, %a1
  %t6859 = select i1 %t6858, i64 257, i64 1
  br label %fixmerge1419
fixslow1418:
  %t6860 = call i64 @rt_lt(i64 %t6854, i64 %a1)
  br label %fixmerge1419
fixmerge1419:
  %t6861 = phi i64 [ %t6859, %fixfast1417 ], [ %t6860, %fixslow1418 ]
  %t6862 = icmp ne i64 %t6861, 1
  br i1 %t6862, label %then1420, label %else1421
then1420:
  br label %merge1422
else1421:
  %t6863 = or i64 %t6854, %a1
  %t6864 = and i64 %t6863, 7
  %t6865 = icmp eq i64 %t6864, 0
  br i1 %t6865, label %fixfast1423, label %fixslow1424
fixfast1423:
  %t6866 = icmp eq i64 %t6854, %a1
  %t6867 = select i1 %t6866, i64 257, i64 1
  br label %fixmerge1425
fixslow1424:
  %t6868 = call i64 @rt_num_eq(i64 %t6854, i64 %a1)
  br label %fixmerge1425
fixmerge1425:
  %t6869 = phi i64 [ %t6867, %fixfast1423 ], [ %t6868, %fixslow1424 ]
  br label %merge1422
merge1422:
  %t6870 = phi i64 [ 257, %then1420 ], [ %t6869, %fixmerge1425 ]
  %t6871 = icmp ne i64 %t6870, 1
  br i1 %t6871, label %then1426, label %else1427
then1426:
  %t6872 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6872)
  %t6873 = and i64 %t6872, -8
  %t6874 = inttoptr i64 %t6873 to ptr
  %t6875 = load i64, ptr %t6874
  %t6876 = inttoptr i64 %t6875 to ptr
  %t6877 = musttail call fastcc i64 %t6876(i64 %t6872, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6877
else1427:
  %t6878 = call i64 @rt_make_string(ptr @.str.lit.44, i64 69)
  %t6879 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6879)
  %t6880 = and i64 %t6879, -8
  %t6881 = inttoptr i64 %t6880 to ptr
  %t6882 = load i64, ptr %t6881
  %t6883 = inttoptr i64 %t6882 to ptr
  %t6884 = musttail call fastcc i64 %t6883(i64 %t6879, i64 3, i64 %t6878, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6884
else1416:
  %t6885 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6885)
  %t6886 = and i64 %t6885, -8
  %t6887 = inttoptr i64 %t6886 to ptr
  %t6888 = load i64, ptr %t6887
  %t6889 = inttoptr i64 %t6888 to ptr
  %t6890 = call fastcc i64%t6889(i64 %t6885, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6891 = or i64 %a0, %t6890
  %t6892 = and i64 %t6891, 7
  %t6893 = icmp eq i64 %t6892, 0
  br i1 %t6893, label %fixfast1428, label %fixslow1429
fixfast1428:
  %t6894 = icmp slt i64 %a0, %t6890
  %t6895 = select i1 %t6894, i64 257, i64 1
  br label %fixmerge1430
fixslow1429:
  %t6896 = call i64 @rt_lt(i64 %a0, i64 %t6890)
  br label %fixmerge1430
fixmerge1430:
  %t6897 = phi i64 [ %t6895, %fixfast1428 ], [ %t6896, %fixslow1429 ]
  %t6898 = icmp ne i64 %t6897, 1
  br i1 %t6898, label %then1431, label %else1432
then1431:
  br label %merge1433
else1432:
  %t6899 = or i64 %a0, %t6890
  %t6900 = and i64 %t6899, 7
  %t6901 = icmp eq i64 %t6900, 0
  br i1 %t6901, label %fixfast1434, label %fixslow1435
fixfast1434:
  %t6902 = icmp eq i64 %a0, %t6890
  %t6903 = select i1 %t6902, i64 257, i64 1
  br label %fixmerge1436
fixslow1435:
  %t6904 = call i64 @rt_num_eq(i64 %a0, i64 %t6890)
  br label %fixmerge1436
fixmerge1436:
  %t6905 = phi i64 [ %t6903, %fixfast1434 ], [ %t6904, %fixslow1435 ]
  br label %merge1433
merge1433:
  %t6906 = phi i64 [ 257, %then1431 ], [ %t6905, %fixmerge1436 ]
  %t6907 = icmp ne i64 %t6906, 1
  br i1 %t6907, label %then1437, label %else1438
then1437:
  %t6908 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6908)
  %t6909 = and i64 %t6908, -8
  %t6910 = inttoptr i64 %t6909 to ptr
  %t6911 = load i64, ptr %t6910
  %t6912 = inttoptr i64 %t6911 to ptr
  %t6913 = musttail call fastcc i64 %t6912(i64 %t6908, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6913
else1438:
  %t6914 = call i64 @rt_make_string(ptr @.str.lit.45, i64 69)
  %t6915 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6915)
  %t6916 = and i64 %t6915, -8
  %t6917 = inttoptr i64 %t6916 to ptr
  %t6918 = load i64, ptr %t6917
  %t6919 = inttoptr i64 %t6918 to ptr
  %t6920 = musttail call fastcc i64 %t6919(i64 %t6915, i64 3, i64 %t6914, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6920
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6925 = icmp eq i64 %argc, 1
  br i1 %t6925, label %argok1440, label %arityerr1439
arityerr1439:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1440:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6930 = icmp eq i64 %argc, 1
  br i1 %t6930, label %argok1442, label %arityerr1441
arityerr1441:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1442:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1150"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6935 = icmp eq i64 %argc, 1
  br i1 %t6935, label %argok1444, label %arityerr1443
arityerr1443:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1444:
  %t6936 = load i64, ptr @"scheme.base:rat-max-denom"
  %t6937 = or i64 %t6936, %a0
  %t6938 = and i64 %t6937, 7
  %t6939 = icmp eq i64 %t6938, 0
  br i1 %t6939, label %fixfast1445, label %fixslow1446
fixfast1445:
  %t6940 = icmp slt i64 %t6936, %a0
  %t6941 = select i1 %t6940, i64 257, i64 1
  br label %fixmerge1447
fixslow1446:
  %t6942 = call i64 @rt_lt(i64 %t6936, i64 %a0)
  br label %fixmerge1447
fixmerge1447:
  %t6943 = phi i64 [ %t6941, %fixfast1445 ], [ %t6942, %fixslow1446 ]
  %t6944 = icmp ne i64 %t6943, 1
  br i1 %t6944, label %then1448, label %else1449
then1448:
  %t6945 = call i64 @rt_make_string(ptr @.str.lit.46, i64 59)
  %t6946 = and i64 %self, -8
  %t6947 = inttoptr i64 %t6946 to ptr
  %t6948 = getelementptr i64, ptr %t6947, i64 1
  %t6949 = load i64, ptr %t6948
  %t6950 = and i64 %self, -8
  %t6951 = inttoptr i64 %t6950 to ptr
  %t6952 = getelementptr i64, ptr %t6951, i64 2
  %t6953 = load i64, ptr %t6952
  %t6954 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6954)
  %t6955 = and i64 %t6954, -8
  %t6956 = inttoptr i64 %t6955 to ptr
  %t6957 = load i64, ptr %t6956
  %t6958 = inttoptr i64 %t6957 to ptr
  %t6959 = musttail call fastcc i64 %t6958(i64 %t6954, i64 3, i64 %t6945, i64 %t6949, i64 %t6953, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6959
else1449:
  %t6960 = and i64 %self, -8
  %t6961 = inttoptr i64 %t6960 to ptr
  %t6962 = getelementptr i64, ptr %t6961, i64 1
  %t6963 = load i64, ptr %t6962
  %t6964 = or i64 %t6963, %a0
  %t6965 = and i64 %t6964, 7
  %t6966 = icmp eq i64 %t6965, 0
  br i1 %t6966, label %fixfast1450, label %fixslow1451
fixfast1450:
  %t6967 = ashr i64 %t6963, 3
  %t6968 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6967, i64 %a0)
  %t6969 = extractvalue {i64, i1} %t6968, 0
  %t6970 = extractvalue {i64, i1} %t6968, 1
  br i1 %t6970, label %fixslow1451, label %fixmerge1452
fixslow1451:
  %t6971 = call i64 @rt_mul(i64 %t6963, i64 %a0)
  br label %fixmerge1452
fixmerge1452:
  %t6972 = phi i64 [ %t6969, %fixfast1450 ], [ %t6971, %fixslow1451 ]
  %t6973 = and i64 %self, -8
  %t6974 = inttoptr i64 %t6973 to ptr
  %t6975 = getelementptr i64, ptr %t6974, i64 2
  %t6976 = load i64, ptr %t6975
  %t6977 = or i64 %t6976, %a0
  %t6978 = and i64 %t6977, 7
  %t6979 = icmp eq i64 %t6978, 0
  br i1 %t6979, label %fixfast1453, label %fixslow1454
fixfast1453:
  %t6980 = ashr i64 %t6976, 3
  %t6981 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6980, i64 %a0)
  %t6982 = extractvalue {i64, i1} %t6981, 0
  %t6983 = extractvalue {i64, i1} %t6981, 1
  br i1 %t6983, label %fixslow1454, label %fixmerge1455
fixslow1454:
  %t6984 = call i64 @rt_mul(i64 %t6976, i64 %a0)
  br label %fixmerge1455
fixmerge1455:
  %t6985 = phi i64 [ %t6982, %fixfast1453 ], [ %t6984, %fixslow1454 ]
  %t6986 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t6986)
  %t6987 = and i64 %t6986, -8
  %t6988 = inttoptr i64 %t6987 to ptr
  %t6989 = load i64, ptr %t6988
  %t6990 = inttoptr i64 %t6989 to ptr
  %t6991 = call fastcc i64%t6990(i64 %t6986, i64 2, i64 %t6972, i64 %t6985, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6992 = icmp ne i64 %t6991, 1
  br i1 %t6992, label %then1456, label %else1457
then1456:
  %t6993 = call i64 @rt_exact_to_inexact(i64 %t6991)
  %t6994 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t6995 = call i64 @rt_div(i64 %t6993, i64 %t6994)
  ret i64 %t6995
else1457:
  %t6996 = or i64 %a0, 8
  %t6997 = and i64 %t6996, 7
  %t6998 = icmp eq i64 %t6997, 0
  br i1 %t6998, label %fixfast1458, label %fixslow1459
fixfast1458:
  %t6999 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7000 = extractvalue {i64, i1} %t6999, 0
  %t7001 = extractvalue {i64, i1} %t6999, 1
  br i1 %t7001, label %fixslow1459, label %fixmerge1460
fixslow1459:
  %t7002 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1460
fixmerge1460:
  %t7003 = phi i64 [ %t7000, %fixfast1458 ], [ %t7002, %fixslow1459 ]
  %t7004 = musttail call fastcc i64 @"scheme.base:code_1150"(i64 %self, i64 1, i64 %t7003, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7004
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7005 = icmp eq i64 %argc, 2
  br i1 %t7005, label %argok1462, label %arityerr1461
arityerr1461:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1462:
  %t7006 = call i64 @rt_flonum_lit(ptr @.flo.lit.47)
  %t7007 = or i64 %a0, %t7006
  %t7008 = and i64 %t7007, 7
  %t7009 = icmp eq i64 %t7008, 0
  br i1 %t7009, label %fixfast1463, label %fixslow1464
fixfast1463:
  %t7010 = icmp slt i64 %a0, %t7006
  %t7011 = select i1 %t7010, i64 257, i64 1
  br label %fixmerge1465
fixslow1464:
  %t7012 = call i64 @rt_lt(i64 %a0, i64 %t7006)
  br label %fixmerge1465
fixmerge1465:
  %t7013 = phi i64 [ %t7011, %fixfast1463 ], [ %t7012, %fixslow1464 ]
  %t7014 = icmp ne i64 %t7013, 1
  br i1 %t7014, label %then1466, label %else1467
then1466:
  br label %merge1468
else1467:
  %t7015 = or i64 %a0, %t7006
  %t7016 = and i64 %t7015, 7
  %t7017 = icmp eq i64 %t7016, 0
  br i1 %t7017, label %fixfast1469, label %fixslow1470
fixfast1469:
  %t7018 = icmp eq i64 %a0, %t7006
  %t7019 = select i1 %t7018, i64 257, i64 1
  br label %fixmerge1471
fixslow1470:
  %t7020 = call i64 @rt_num_eq(i64 %a0, i64 %t7006)
  br label %fixmerge1471
fixmerge1471:
  %t7021 = phi i64 [ %t7019, %fixfast1469 ], [ %t7020, %fixslow1470 ]
  br label %merge1468
merge1468:
  %t7022 = phi i64 [ 257, %then1466 ], [ %t7021, %fixmerge1471 ]
  %t7023 = icmp ne i64 %t7022, 1
  br i1 %t7023, label %then1472, label %else1473
then1472:
  %t7024 = call i64 @rt_flonum_lit(ptr @.flo.lit.48)
  %t7025 = or i64 %t7024, %a1
  %t7026 = and i64 %t7025, 7
  %t7027 = icmp eq i64 %t7026, 0
  br i1 %t7027, label %fixfast1475, label %fixslow1476
fixfast1475:
  %t7028 = icmp slt i64 %t7024, %a1
  %t7029 = select i1 %t7028, i64 257, i64 1
  br label %fixmerge1477
fixslow1476:
  %t7030 = call i64 @rt_lt(i64 %t7024, i64 %a1)
  br label %fixmerge1477
fixmerge1477:
  %t7031 = phi i64 [ %t7029, %fixfast1475 ], [ %t7030, %fixslow1476 ]
  %t7032 = icmp ne i64 %t7031, 1
  br i1 %t7032, label %then1478, label %else1479
then1478:
  br label %merge1480
else1479:
  %t7033 = or i64 %t7024, %a1
  %t7034 = and i64 %t7033, 7
  %t7035 = icmp eq i64 %t7034, 0
  br i1 %t7035, label %fixfast1481, label %fixslow1482
fixfast1481:
  %t7036 = icmp eq i64 %t7024, %a1
  %t7037 = select i1 %t7036, i64 257, i64 1
  br label %fixmerge1483
fixslow1482:
  %t7038 = call i64 @rt_num_eq(i64 %t7024, i64 %a1)
  br label %fixmerge1483
fixmerge1483:
  %t7039 = phi i64 [ %t7037, %fixfast1481 ], [ %t7038, %fixslow1482 ]
  br label %merge1480
merge1480:
  %t7040 = phi i64 [ 257, %then1478 ], [ %t7039, %fixmerge1483 ]
  br label %merge1474
else1473:
  br label %merge1474
merge1474:
  %t7041 = phi i64 [ %t7040, %merge1480 ], [ 1, %else1473 ]
  %t7042 = icmp ne i64 %t7041, 1
  br i1 %t7042, label %then1484, label %else1485
then1484:
  %t7043 = call i64 @rt_flonum_lit(ptr @.flo.lit.49)
  ret i64 %t7043
else1485:
  %t7044 = call ptr @rt_alloc_words(i64 4)
  %t7045 = ptrtoint ptr %t7044 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1150" to i64), ptr %t7044
  %t7046 = or i64 %t7045, 4
  %t7047 = getelementptr i64, ptr %t7044, i64 1
  store i64 %a0, ptr %t7047
  %t7048 = getelementptr i64, ptr %t7044, i64 2
  store i64 %a1, ptr %t7048
  %t7049 = getelementptr i64, ptr %t7044, i64 3
  store i64 %t7046, ptr %t7049
  %t7050 = musttail call fastcc i64 @"scheme.base:code_1150"(i64 %t7046, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7050
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7055 = icmp eq i64 %argc, 2
  br i1 %t7055, label %argok1487, label %arityerr1486
arityerr1486:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1487:
  %t7056 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t7056)
  %t7057 = and i64 %t7056, -8
  %t7058 = inttoptr i64 %t7057 to ptr
  %t7059 = load i64, ptr %t7058
  %t7060 = inttoptr i64 %t7059 to ptr
  %t7061 = call fastcc i64%t7060(i64 %t7056, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7062 = call i64 @rt_exact_to_inexact(i64 %t7061)
  %t7063 = or i64 %t7062, %a1
  %t7064 = and i64 %t7063, 7
  %t7065 = icmp eq i64 %t7064, 0
  br i1 %t7065, label %fixfast1488, label %fixslow1489
fixfast1488:
  %t7066 = icmp slt i64 %t7062, %a1
  %t7067 = select i1 %t7066, i64 257, i64 1
  br label %fixmerge1490
fixslow1489:
  %t7068 = call i64 @rt_lt(i64 %t7062, i64 %a1)
  br label %fixmerge1490
fixmerge1490:
  %t7069 = phi i64 [ %t7067, %fixfast1488 ], [ %t7068, %fixslow1489 ]
  %t7070 = icmp ne i64 %t7069, 1
  br i1 %t7070, label %then1491, label %else1492
then1491:
  br label %merge1493
else1492:
  %t7071 = or i64 %t7062, %a1
  %t7072 = and i64 %t7071, 7
  %t7073 = icmp eq i64 %t7072, 0
  br i1 %t7073, label %fixfast1494, label %fixslow1495
fixfast1494:
  %t7074 = icmp eq i64 %t7062, %a1
  %t7075 = select i1 %t7074, i64 257, i64 1
  br label %fixmerge1496
fixslow1495:
  %t7076 = call i64 @rt_num_eq(i64 %t7062, i64 %a1)
  br label %fixmerge1496
fixmerge1496:
  %t7077 = phi i64 [ %t7075, %fixfast1494 ], [ %t7076, %fixslow1495 ]
  br label %merge1493
merge1493:
  %t7078 = phi i64 [ 257, %then1491 ], [ %t7077, %fixmerge1496 ]
  %t7079 = icmp ne i64 %t7078, 1
  br i1 %t7079, label %then1497, label %else1498
then1497:
  ret i64 %t7061
else1498:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7084 = icmp eq i64 %argc, 1
  br i1 %t7084, label %argok1500, label %arityerr1499
arityerr1499:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1500:
  %t7085 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t7085)
  %t7086 = and i64 %t7085, -8
  %t7087 = inttoptr i64 %t7086 to ptr
  %t7088 = load i64, ptr %t7087
  %t7089 = inttoptr i64 %t7088 to ptr
  %t7090 = call fastcc i64%t7089(i64 %t7085, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7091 = call i64 @rt_inexact_to_exact(i64 %t7090)
  %t7092 = call i64 @rt_exact_to_inexact(i64 %t7091)
  %t7093 = or i64 %t7092, %a0
  %t7094 = and i64 %t7093, 7
  %t7095 = icmp eq i64 %t7094, 0
  br i1 %t7095, label %fixfast1501, label %fixslow1502
fixfast1501:
  %t7096 = icmp slt i64 %t7092, %a0
  %t7097 = select i1 %t7096, i64 257, i64 1
  br label %fixmerge1503
fixslow1502:
  %t7098 = call i64 @rt_lt(i64 %t7092, i64 %a0)
  br label %fixmerge1503
fixmerge1503:
  %t7099 = phi i64 [ %t7097, %fixfast1501 ], [ %t7098, %fixslow1502 ]
  %t7100 = icmp ne i64 %t7099, 1
  br i1 %t7100, label %then1504, label %else1505
then1504:
  %t7101 = or i64 %t7091, 8
  %t7102 = and i64 %t7101, 7
  %t7103 = icmp eq i64 %t7102, 0
  br i1 %t7103, label %fixfast1506, label %fixslow1507
fixfast1506:
  %t7104 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7091, i64 8)
  %t7105 = extractvalue {i64, i1} %t7104, 0
  %t7106 = extractvalue {i64, i1} %t7104, 1
  br i1 %t7106, label %fixslow1507, label %fixmerge1508
fixslow1507:
  %t7107 = call i64 @rt_add(i64 %t7091, i64 8)
  br label %fixmerge1508
fixmerge1508:
  %t7108 = phi i64 [ %t7105, %fixfast1506 ], [ %t7107, %fixslow1507 ]
  ret i64 %t7108
else1505:
  ret i64 %t7091
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7113 = icmp sge i64 %argc, 0
  br i1 %t7113, label %argok1510, label %arityerr1509
arityerr1509:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1510:
  %t7114 = call ptr @rt_alloc_words(i64 8)
  %t7115 = getelementptr i64, ptr %t7114, i64 0
  store i64 %a0, ptr %t7115
  %t7116 = getelementptr i64, ptr %t7114, i64 1
  store i64 %a1, ptr %t7116
  %t7117 = getelementptr i64, ptr %t7114, i64 2
  store i64 %a2, ptr %t7117
  %t7118 = getelementptr i64, ptr %t7114, i64 3
  store i64 %a3, ptr %t7118
  %t7119 = getelementptr i64, ptr %t7114, i64 4
  store i64 %a4, ptr %t7119
  %t7120 = getelementptr i64, ptr %t7114, i64 5
  store i64 %a5, ptr %t7120
  %t7121 = getelementptr i64, ptr %t7114, i64 6
  store i64 %a6, ptr %t7121
  %t7122 = getelementptr i64, ptr %t7114, i64 7
  store i64 %a7, ptr %t7122
  %t7123 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7114, ptr %overflow)
  %t7124 = call i64 @rt_pair_p(i64 %t7123)
  %t7125 = icmp ne i64 %t7124, 1
  br i1 %t7125, label %then1511, label %else1512
then1511:
  %t7126 = call i64 @rt_cdr(i64 %t7123)
  %t7127 = call i64 @rt_null_p(i64 %t7126)
  br label %merge1513
else1512:
  br label %merge1513
merge1513:
  %t7128 = phi i64 [ %t7127, %then1511 ], [ 1, %else1512 ]
  %t7129 = icmp ne i64 %t7128, 1
  br i1 %t7129, label %then1514, label %else1515
then1514:
  %t7130 = call i64 @rt_car(i64 %t7123)
  ret i64 %t7130
else1515:
  %t7131 = call i64 @rt_list_to_mv(i64 %t7123)
  ret i64 %t7131
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvalues"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7132 = call i64 @rt_pair_p(i64 2)
  %t7133 = icmp ne i64 %t7132, 1
  br i1 %t7133, label %then1516, label %else1517
then1516:
  %t7134 = call i64 @rt_cdr(i64 2)
  %t7135 = call i64 @rt_null_p(i64 %t7134)
  br label %merge1518
else1517:
  br label %merge1518
merge1518:
  %t7136 = phi i64 [ %t7135, %then1516 ], [ 1, %else1517 ]
  %t7137 = icmp ne i64 %t7136, 1
  br i1 %t7137, label %then1519, label %else1520
then1519:
  %t7138 = call i64 @rt_car(i64 2)
  ret i64 %t7138
else1520:
  %t7139 = call i64 @rt_list_to_mv(i64 2)
  ret i64 %t7139
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7144 = icmp eq i64 %argc, 2
  br i1 %t7144, label %argok1522, label %arityerr1521
arityerr1521:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1522:
  call void @rt_check_callable(i64 %a0)
  %t7145 = and i64 %a0, -8
  %t7146 = inttoptr i64 %t7145 to ptr
  %t7147 = load i64, ptr %t7146
  %t7148 = inttoptr i64 %t7147 to ptr
  %t7149 = call fastcc i64%t7148(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7150 = call i64 @rt_mv_p(i64 %t7149)
  %t7151 = icmp ne i64 %t7150, 1
  br i1 %t7151, label %then1523, label %else1524
then1523:
  %t7152 = call i64 @rt_mv_to_list(i64 %t7149)
  call void @rt_check_callable(i64 %a1)
  %t7153 = and i64 %a1, -8
  %t7154 = inttoptr i64 %t7153 to ptr
  %t7155 = load i64, ptr %t7154
  %t7156 = inttoptr i64 %t7155 to ptr
  %t7157 = call i64 @rt_list_length(i64 %t7152)
  %t7158 = add i64 0, %t7157
  %t7159 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t7152, i64 8)
  %t7171 = getelementptr i64, ptr %t7159, i64 0
  %t7163 = load i64, ptr %t7171
  %t7172 = getelementptr i64, ptr %t7159, i64 1
  %t7164 = load i64, ptr %t7172
  %t7173 = getelementptr i64, ptr %t7159, i64 2
  %t7165 = load i64, ptr %t7173
  %t7174 = getelementptr i64, ptr %t7159, i64 3
  %t7166 = load i64, ptr %t7174
  %t7175 = getelementptr i64, ptr %t7159, i64 4
  %t7167 = load i64, ptr %t7175
  %t7176 = getelementptr i64, ptr %t7159, i64 5
  %t7168 = load i64, ptr %t7176
  %t7177 = getelementptr i64, ptr %t7159, i64 6
  %t7169 = load i64, ptr %t7177
  %t7178 = getelementptr i64, ptr %t7159, i64 7
  %t7170 = load i64, ptr %t7178
  %t7160 = icmp sgt i64 %t7158, 8
  %t7161 = getelementptr i64, ptr %t7159, i64 8
  %t7162 = select i1 %t7160, ptr %t7161, ptr null
  %t7179 = musttail call fastcc i64 %t7156(i64 %a1, i64 %t7158, i64 %t7163, i64 %t7164, i64 %t7165, i64 %t7166, i64 %t7167, i64 %t7168, i64 %t7169, i64 %t7170, ptr %t7162)
  ret i64 %t7179
else1524:
  call void @rt_check_callable(i64 %a1)
  %t7180 = and i64 %a1, -8
  %t7181 = inttoptr i64 %t7180 to ptr
  %t7182 = load i64, ptr %t7181
  %t7183 = inttoptr i64 %t7182 to ptr
  %t7184 = musttail call fastcc i64 %t7183(i64 %a1, i64 1, i64 %t7149, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7184
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7191 = icmp eq i64 %argc, 0
  br i1 %t7191, label %argok1526, label %arityerr1525
arityerr1525:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1526:
  %t7192 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7193 = call i64 @rt_make_vector(i64 %t7192, i64 2)
  %t7194 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7194)
  %t7195 = and i64 %t7194, -8
  %t7196 = inttoptr i64 %t7195 to ptr
  %t7197 = load i64, ptr %t7196
  %t7198 = inttoptr i64 %t7197 to ptr
  %t7199 = call fastcc i64%t7198(i64 %t7194, i64 3, i64 0, i64 %t7193, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7200 = call i64 @rt_make_hash_table(i64 %t7199)
  ret i64 %t7200
}

define fastcc i64 @"scheme.base:code:make-eq-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7205 = icmp eq i64 %argc, 0
  br i1 %t7205, label %argok1528, label %arityerr1527
arityerr1527:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1528:
  %t7206 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7207 = call i64 @rt_make_vector(i64 %t7206, i64 2)
  %t7208 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7208)
  %t7209 = and i64 %t7208, -8
  %t7210 = inttoptr i64 %t7209 to ptr
  %t7211 = load i64, ptr %t7210
  %t7212 = inttoptr i64 %t7211 to ptr
  %t7213 = call fastcc i64%t7212(i64 %t7208, i64 3, i64 0, i64 %t7207, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7214 = call i64 @rt_make_hash_table(i64 %t7213)
  ret i64 %t7214
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7219 = icmp eq i64 %argc, 1
  br i1 %t7219, label %argok1530, label %arityerr1529
arityerr1529:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1530:
  %t7220 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t7220
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7225 = icmp eq i64 %argc, 1
  br i1 %t7225, label %argok1532, label %arityerr1531
arityerr1531:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1532:
  %t7226 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7227 = call i64 @rt_vector_ref(i64 %t7226, i64 0)
  ret i64 %t7227
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7232 = icmp eq i64 %argc, 1
  br i1 %t7232, label %argok1534, label %arityerr1533
arityerr1533:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1534:
  %t7233 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7234 = call i64 @rt_vector_ref(i64 %t7233, i64 8)
  ret i64 %t7234
}

define fastcc i64 @"scheme.base:code:%ht-identity?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7239 = icmp eq i64 %argc, 1
  br i1 %t7239, label %argok1536, label %arityerr1535
arityerr1535:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1536:
  %t7240 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7241 = call i64 @rt_vector_ref(i64 %t7240, i64 16)
  ret i64 %t7241
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7246 = icmp eq i64 %argc, 2
  br i1 %t7246, label %argok1538, label %arityerr1537
arityerr1537:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1538:
  %t7247 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7248 = call i64 @rt_vector_set(i64 %t7247, i64 0, i64 %a1)
  ret i64 %t7248
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7253 = icmp eq i64 %argc, 2
  br i1 %t7253, label %argok1540, label %arityerr1539
arityerr1539:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1540:
  %t7254 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7255 = call i64 @rt_vector_set(i64 %t7254, i64 8, i64 %a1)
  ret i64 %t7255
}

define fastcc i64 @"scheme.base:code:%ht-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7260 = icmp eq i64 %argc, 2
  br i1 %t7260, label %argok1542, label %arityerr1541
arityerr1541:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1542:
  %t7261 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7261)
  %t7262 = and i64 %t7261, -8
  %t7263 = inttoptr i64 %t7262 to ptr
  %t7264 = load i64, ptr %t7263
  %t7265 = inttoptr i64 %t7264 to ptr
  %t7266 = call fastcc i64%t7265(i64 %t7261, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7267 = icmp ne i64 %t7266, 1
  br i1 %t7267, label %then1543, label %else1544
then1543:
  %t7268 = call i64 @rt_eq_hash(i64 %a1)
  ret i64 %t7268
else1544:
  %t7269 = call i64 @rt_hash(i64 %a1)
  ret i64 %t7269
}

define fastcc i64 @"scheme.base:code:%ht-key=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7274 = icmp eq i64 %argc, 3
  br i1 %t7274, label %argok1546, label %arityerr1545
arityerr1545:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1546:
  %t7275 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7275)
  %t7276 = and i64 %t7275, -8
  %t7277 = inttoptr i64 %t7276 to ptr
  %t7278 = load i64, ptr %t7277
  %t7279 = inttoptr i64 %t7278 to ptr
  %t7280 = call fastcc i64%t7279(i64 %t7275, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7281 = icmp ne i64 %t7280, 1
  br i1 %t7281, label %then1547, label %else1548
then1547:
  %t7282 = call i64 @rt_eq_p(i64 %a1, i64 %a2)
  ret i64 %t7282
else1548:
  %t7283 = call i64 @rt_equal(i64 %a1, i64 %a2)
  ret i64 %t7283
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7288 = icmp eq i64 %argc, 3
  br i1 %t7288, label %argok1550, label %arityerr1549
arityerr1549:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1550:
  %t7289 = load i64, ptr @"scheme.base:%ht-hash"
  call void @rt_check_callable(i64 %t7289)
  %t7290 = and i64 %t7289, -8
  %t7291 = inttoptr i64 %t7290 to ptr
  %t7292 = load i64, ptr %t7291
  %t7293 = inttoptr i64 %t7292 to ptr
  %t7294 = call fastcc i64%t7293(i64 %t7289, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7295 = call i64 @rt_remainder(i64 %t7294, i64 %a2)
  ret i64 %t7295
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7300 = icmp eq i64 %argc, 3
  br i1 %t7300, label %argok1552, label %arityerr1551
arityerr1551:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1552:
  %t7301 = call i64 @rt_null_p(i64 %a2)
  %t7302 = icmp ne i64 %t7301, 1
  br i1 %t7302, label %then1553, label %else1554
then1553:
  ret i64 1
else1554:
  %t7303 = call i64 @rt_car(i64 %a2)
  %t7304 = call i64 @rt_car(i64 %t7303)
  %t7305 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7305)
  %t7306 = and i64 %t7305, -8
  %t7307 = inttoptr i64 %t7306 to ptr
  %t7308 = load i64, ptr %t7307
  %t7309 = inttoptr i64 %t7308 to ptr
  %t7310 = call fastcc i64%t7309(i64 %t7305, i64 3, i64 %a0, i64 %a1, i64 %t7304, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7311 = icmp ne i64 %t7310, 1
  br i1 %t7311, label %then1555, label %else1556
then1555:
  %t7312 = call i64 @rt_car(i64 %a2)
  ret i64 %t7312
else1556:
  %t7313 = call i64 @rt_cdr(i64 %a2)
  %t7314 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7314)
  %t7315 = and i64 %t7314, -8
  %t7316 = inttoptr i64 %t7315 to ptr
  %t7317 = load i64, ptr %t7316
  %t7318 = inttoptr i64 %t7317 to ptr
  %t7319 = musttail call fastcc i64 %t7318(i64 %t7314, i64 3, i64 %a0, i64 %a1, i64 %t7313, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7319
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7324 = icmp eq i64 %argc, 3
  br i1 %t7324, label %argok1558, label %arityerr1557
arityerr1557:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1558:
  %t7325 = call i64 @rt_null_p(i64 %a2)
  %t7326 = icmp ne i64 %t7325, 1
  br i1 %t7326, label %then1559, label %else1560
then1559:
  ret i64 2
else1560:
  %t7327 = call i64 @rt_car(i64 %a2)
  %t7328 = call i64 @rt_car(i64 %t7327)
  %t7329 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7329)
  %t7330 = and i64 %t7329, -8
  %t7331 = inttoptr i64 %t7330 to ptr
  %t7332 = load i64, ptr %t7331
  %t7333 = inttoptr i64 %t7332 to ptr
  %t7334 = call fastcc i64%t7333(i64 %t7329, i64 3, i64 %a0, i64 %a1, i64 %t7328, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7335 = icmp ne i64 %t7334, 1
  br i1 %t7335, label %then1561, label %else1562
then1561:
  %t7336 = call i64 @rt_cdr(i64 %a2)
  ret i64 %t7336
else1562:
  %t7337 = call i64 @rt_car(i64 %a2)
  %t7338 = call i64 @rt_cdr(i64 %a2)
  %t7339 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7339)
  %t7340 = and i64 %t7339, -8
  %t7341 = inttoptr i64 %t7340 to ptr
  %t7342 = load i64, ptr %t7341
  %t7343 = inttoptr i64 %t7342 to ptr
  %t7344 = call fastcc i64%t7343(i64 %t7339, i64 3, i64 %a0, i64 %a1, i64 %t7338, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7345 = call i64 @rt_cons(i64 %t7337, i64 %t7344)
  ret i64 %t7345
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7350 = icmp eq i64 %argc, 3
  br i1 %t7350, label %argok1564, label %arityerr1563
arityerr1563:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1564:
  %t7351 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7351)
  %t7352 = and i64 %t7351, -8
  %t7353 = inttoptr i64 %t7352 to ptr
  %t7354 = load i64, ptr %t7353
  %t7355 = inttoptr i64 %t7354 to ptr
  %t7356 = call fastcc i64%t7355(i64 %t7351, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7357 = call i64 @rt_vector_length(i64 %t7356)
  %t7358 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7358)
  %t7359 = and i64 %t7358, -8
  %t7360 = inttoptr i64 %t7359 to ptr
  %t7361 = load i64, ptr %t7360
  %t7362 = inttoptr i64 %t7361 to ptr
  %t7363 = call fastcc i64%t7362(i64 %t7358, i64 3, i64 %a0, i64 %a1, i64 %t7357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7364 = call i64 @rt_vector_ref(i64 %t7356, i64 %t7363)
  %t7365 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7365)
  %t7366 = and i64 %t7365, -8
  %t7367 = inttoptr i64 %t7366 to ptr
  %t7368 = load i64, ptr %t7367
  %t7369 = inttoptr i64 %t7368 to ptr
  %t7370 = call fastcc i64%t7369(i64 %t7365, i64 3, i64 %a0, i64 %a1, i64 %t7364, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7371 = icmp ne i64 %t7370, 1
  br i1 %t7371, label %then1565, label %else1566
then1565:
  %t7372 = call i64 @rt_cdr(i64 %t7370)
  ret i64 %t7372
else1566:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7377 = icmp eq i64 %argc, 2
  br i1 %t7377, label %argok1568, label %arityerr1567
arityerr1567:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1568:
  %t7378 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7378)
  %t7379 = and i64 %t7378, -8
  %t7380 = inttoptr i64 %t7379 to ptr
  %t7381 = load i64, ptr %t7380
  %t7382 = inttoptr i64 %t7381 to ptr
  %t7383 = call fastcc i64%t7382(i64 %t7378, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7384 = call i64 @rt_vector_length(i64 %t7383)
  %t7385 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7385)
  %t7386 = and i64 %t7385, -8
  %t7387 = inttoptr i64 %t7386 to ptr
  %t7388 = load i64, ptr %t7387
  %t7389 = inttoptr i64 %t7388 to ptr
  %t7390 = call fastcc i64%t7389(i64 %t7385, i64 3, i64 %a0, i64 %a1, i64 %t7384, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7391 = call i64 @rt_vector_ref(i64 %t7383, i64 %t7390)
  %t7392 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7392)
  %t7393 = and i64 %t7392, -8
  %t7394 = inttoptr i64 %t7393 to ptr
  %t7395 = load i64, ptr %t7394
  %t7396 = inttoptr i64 %t7395 to ptr
  %t7397 = call fastcc i64%t7396(i64 %t7392, i64 3, i64 %a0, i64 %a1, i64 %t7391, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7398 = icmp ne i64 %t7397, 1
  br i1 %t7398, label %then1569, label %else1570
then1569:
  ret i64 257
else1570:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7403 = icmp eq i64 %argc, 2
  br i1 %t7403, label %argok1572, label %arityerr1571
arityerr1571:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1572:
  %t7404 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7404)
  %t7405 = and i64 %t7404, -8
  %t7406 = inttoptr i64 %t7405 to ptr
  %t7407 = load i64, ptr %t7406
  %t7408 = inttoptr i64 %t7407 to ptr
  %t7409 = call fastcc i64%t7408(i64 %t7404, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7410 = call i64 @rt_vector_length(i64 %t7409)
  %t7411 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7411)
  %t7412 = and i64 %t7411, -8
  %t7413 = inttoptr i64 %t7412 to ptr
  %t7414 = load i64, ptr %t7413
  %t7415 = inttoptr i64 %t7414 to ptr
  %t7416 = call fastcc i64%t7415(i64 %t7411, i64 3, i64 %a0, i64 %a1, i64 %t7410, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7417 = call i64 @rt_vector_ref(i64 %t7409, i64 %t7416)
  %t7418 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7418)
  %t7419 = and i64 %t7418, -8
  %t7420 = inttoptr i64 %t7419 to ptr
  %t7421 = load i64, ptr %t7420
  %t7422 = inttoptr i64 %t7421 to ptr
  %t7423 = call fastcc i64%t7422(i64 %t7418, i64 3, i64 %a0, i64 %a1, i64 %t7417, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7424 = icmp ne i64 %t7423, 1
  br i1 %t7424, label %then1573, label %else1574
then1573:
  %t7425 = call i64 @rt_cdr(i64 %t7423)
  ret i64 %t7425
else1574:
  %t7426 = call i64 @rt_make_string(ptr @.str.lit.50, i64 29)
  %t7427 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7427)
  %t7428 = and i64 %t7427, -8
  %t7429 = inttoptr i64 %t7428 to ptr
  %t7430 = load i64, ptr %t7429
  %t7431 = inttoptr i64 %t7430 to ptr
  %t7432 = musttail call fastcc i64 %t7431(i64 %t7427, i64 2, i64 %t7426, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7432
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7437 = icmp eq i64 %argc, 3
  br i1 %t7437, label %argok1576, label %arityerr1575
arityerr1575:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1576:
  %t7438 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7438)
  %t7439 = and i64 %t7438, -8
  %t7440 = inttoptr i64 %t7439 to ptr
  %t7441 = load i64, ptr %t7440
  %t7442 = inttoptr i64 %t7441 to ptr
  %t7443 = call fastcc i64%t7442(i64 %t7438, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7444 = call i64 @rt_vector_length(i64 %t7443)
  %t7445 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7445)
  %t7446 = and i64 %t7445, -8
  %t7447 = inttoptr i64 %t7446 to ptr
  %t7448 = load i64, ptr %t7447
  %t7449 = inttoptr i64 %t7448 to ptr
  %t7450 = call fastcc i64%t7449(i64 %t7445, i64 3, i64 %a0, i64 %a1, i64 %t7444, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7451 = call i64 @rt_vector_ref(i64 %t7443, i64 %t7450)
  %t7452 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7452)
  %t7453 = and i64 %t7452, -8
  %t7454 = inttoptr i64 %t7453 to ptr
  %t7455 = load i64, ptr %t7454
  %t7456 = inttoptr i64 %t7455 to ptr
  %t7457 = call fastcc i64%t7456(i64 %t7452, i64 3, i64 %a0, i64 %a1, i64 %t7451, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7458 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t7459 = icmp ne i64 %t7457, 1
  br i1 %t7459, label %then1577, label %else1578
then1577:
  %t7460 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7460)
  %t7461 = and i64 %t7460, -8
  %t7462 = inttoptr i64 %t7461 to ptr
  %t7463 = load i64, ptr %t7462
  %t7464 = inttoptr i64 %t7463 to ptr
  %t7465 = call fastcc i64%t7464(i64 %t7460, i64 3, i64 %a0, i64 %a1, i64 %t7451, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1579
else1578:
  br label %merge1579
merge1579:
  %t7466 = phi i64 [ %t7465, %then1577 ], [ %t7451, %else1578 ]
  %t7467 = call i64 @rt_cons(i64 %t7458, i64 %t7466)
  %t7468 = call i64 @rt_vector_set(i64 %t7443, i64 %t7450, i64 %t7467)
  %t7469 = icmp ne i64 %t7457, 1
  br i1 %t7469, label %then1580, label %else1581
then1580:
  ret i64 1
else1581:
  %t7470 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7470)
  %t7471 = and i64 %t7470, -8
  %t7472 = inttoptr i64 %t7471 to ptr
  %t7473 = load i64, ptr %t7472
  %t7474 = inttoptr i64 %t7473 to ptr
  %t7475 = call fastcc i64%t7474(i64 %t7470, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7476 = or i64 %t7475, 8
  %t7477 = and i64 %t7476, 7
  %t7478 = icmp eq i64 %t7477, 0
  br i1 %t7478, label %fixfast1582, label %fixslow1583
fixfast1582:
  %t7479 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7475, i64 8)
  %t7480 = extractvalue {i64, i1} %t7479, 0
  %t7481 = extractvalue {i64, i1} %t7479, 1
  br i1 %t7481, label %fixslow1583, label %fixmerge1584
fixslow1583:
  %t7482 = call i64 @rt_add(i64 %t7475, i64 8)
  br label %fixmerge1584
fixmerge1584:
  %t7483 = phi i64 [ %t7480, %fixfast1582 ], [ %t7482, %fixslow1583 ]
  %t7484 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7484)
  %t7485 = and i64 %t7484, -8
  %t7486 = inttoptr i64 %t7485 to ptr
  %t7487 = load i64, ptr %t7486
  %t7488 = inttoptr i64 %t7487 to ptr
  %t7489 = call fastcc i64%t7488(i64 %t7484, i64 2, i64 %a0, i64 %t7483, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7490 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7490)
  %t7491 = and i64 %t7490, -8
  %t7492 = inttoptr i64 %t7491 to ptr
  %t7493 = load i64, ptr %t7492
  %t7494 = inttoptr i64 %t7493 to ptr
  %t7495 = call fastcc i64%t7494(i64 %t7490, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7496 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t7497 = or i64 %t7496, %t7444
  %t7498 = and i64 %t7497, 7
  %t7499 = icmp eq i64 %t7498, 0
  br i1 %t7499, label %fixfast1585, label %fixslow1586
fixfast1585:
  %t7500 = ashr i64 %t7496, 3
  %t7501 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7500, i64 %t7444)
  %t7502 = extractvalue {i64, i1} %t7501, 0
  %t7503 = extractvalue {i64, i1} %t7501, 1
  br i1 %t7503, label %fixslow1586, label %fixmerge1587
fixslow1586:
  %t7504 = call i64 @rt_mul(i64 %t7496, i64 %t7444)
  br label %fixmerge1587
fixmerge1587:
  %t7505 = phi i64 [ %t7502, %fixfast1585 ], [ %t7504, %fixslow1586 ]
  %t7506 = or i64 %t7505, %t7495
  %t7507 = and i64 %t7506, 7
  %t7508 = icmp eq i64 %t7507, 0
  br i1 %t7508, label %fixfast1588, label %fixslow1589
fixfast1588:
  %t7509 = icmp slt i64 %t7505, %t7495
  %t7510 = select i1 %t7509, i64 257, i64 1
  br label %fixmerge1590
fixslow1589:
  %t7511 = call i64 @rt_lt(i64 %t7505, i64 %t7495)
  br label %fixmerge1590
fixmerge1590:
  %t7512 = phi i64 [ %t7510, %fixfast1588 ], [ %t7511, %fixslow1589 ]
  %t7513 = icmp ne i64 %t7512, 1
  br i1 %t7513, label %then1591, label %else1592
then1591:
  %t7514 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t7514)
  %t7515 = and i64 %t7514, -8
  %t7516 = inttoptr i64 %t7515 to ptr
  %t7517 = load i64, ptr %t7516
  %t7518 = inttoptr i64 %t7517 to ptr
  %t7519 = musttail call fastcc i64 %t7518(i64 %t7514, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7519
else1592:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7524 = icmp eq i64 %argc, 2
  br i1 %t7524, label %argok1594, label %arityerr1593
arityerr1593:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1594:
  %t7525 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7525)
  %t7526 = and i64 %t7525, -8
  %t7527 = inttoptr i64 %t7526 to ptr
  %t7528 = load i64, ptr %t7527
  %t7529 = inttoptr i64 %t7528 to ptr
  %t7530 = call fastcc i64%t7529(i64 %t7525, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7531 = call i64 @rt_vector_length(i64 %t7530)
  %t7532 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7532)
  %t7533 = and i64 %t7532, -8
  %t7534 = inttoptr i64 %t7533 to ptr
  %t7535 = load i64, ptr %t7534
  %t7536 = inttoptr i64 %t7535 to ptr
  %t7537 = call fastcc i64%t7536(i64 %t7532, i64 3, i64 %a0, i64 %a1, i64 %t7531, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7538 = call i64 @rt_vector_ref(i64 %t7530, i64 %t7537)
  %t7539 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7539)
  %t7540 = and i64 %t7539, -8
  %t7541 = inttoptr i64 %t7540 to ptr
  %t7542 = load i64, ptr %t7541
  %t7543 = inttoptr i64 %t7542 to ptr
  %t7544 = call fastcc i64%t7543(i64 %t7539, i64 3, i64 %a0, i64 %a1, i64 %t7538, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7545 = icmp ne i64 %t7544, 1
  br i1 %t7545, label %then1595, label %else1596
then1595:
  %t7546 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7546)
  %t7547 = and i64 %t7546, -8
  %t7548 = inttoptr i64 %t7547 to ptr
  %t7549 = load i64, ptr %t7548
  %t7550 = inttoptr i64 %t7549 to ptr
  %t7551 = call fastcc i64%t7550(i64 %t7546, i64 3, i64 %a0, i64 %a1, i64 %t7538, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7552 = call i64 @rt_vector_set(i64 %t7530, i64 %t7537, i64 %t7551)
  %t7553 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7553)
  %t7554 = and i64 %t7553, -8
  %t7555 = inttoptr i64 %t7554 to ptr
  %t7556 = load i64, ptr %t7555
  %t7557 = inttoptr i64 %t7556 to ptr
  %t7558 = call fastcc i64%t7557(i64 %t7553, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7559 = or i64 %t7558, 8
  %t7560 = and i64 %t7559, 7
  %t7561 = icmp eq i64 %t7560, 0
  br i1 %t7561, label %fixfast1597, label %fixslow1598
fixfast1597:
  %t7562 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t7558, i64 8)
  %t7563 = extractvalue {i64, i1} %t7562, 0
  %t7564 = extractvalue {i64, i1} %t7562, 1
  br i1 %t7564, label %fixslow1598, label %fixmerge1599
fixslow1598:
  %t7565 = call i64 @rt_sub(i64 %t7558, i64 8)
  br label %fixmerge1599
fixmerge1599:
  %t7566 = phi i64 [ %t7563, %fixfast1597 ], [ %t7565, %fixslow1598 ]
  %t7567 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7567)
  %t7568 = and i64 %t7567, -8
  %t7569 = inttoptr i64 %t7568 to ptr
  %t7570 = load i64, ptr %t7569
  %t7571 = inttoptr i64 %t7570 to ptr
  %t7572 = musttail call fastcc i64 %t7571(i64 %t7567, i64 2, i64 %a0, i64 %t7566, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7572
else1596:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1253"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7577 = icmp eq i64 %argc, 1
  br i1 %t7577, label %argok1601, label %arityerr1600
arityerr1600:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1601:
  %t7578 = call i64 @rt_null_p(i64 %a0)
  %t7579 = icmp ne i64 %t7578, 1
  br i1 %t7579, label %then1602, label %else1603
then1602:
  ret i64 1
else1603:
  %t7580 = call i64 @rt_car(i64 %a0)
  %t7581 = and i64 %self, -8
  %t7582 = inttoptr i64 %t7581 to ptr
  %t7583 = getelementptr i64, ptr %t7582, i64 1
  %t7584 = load i64, ptr %t7583
  %t7585 = call i64 @rt_car(i64 %t7580)
  %t7586 = and i64 %self, -8
  %t7587 = inttoptr i64 %t7586 to ptr
  %t7588 = getelementptr i64, ptr %t7587, i64 2
  %t7589 = load i64, ptr %t7588
  %t7590 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7590)
  %t7591 = and i64 %t7590, -8
  %t7592 = inttoptr i64 %t7591 to ptr
  %t7593 = load i64, ptr %t7592
  %t7594 = inttoptr i64 %t7593 to ptr
  %t7595 = call fastcc i64%t7594(i64 %t7590, i64 3, i64 %t7584, i64 %t7585, i64 %t7589, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7596 = and i64 %self, -8
  %t7597 = inttoptr i64 %t7596 to ptr
  %t7598 = getelementptr i64, ptr %t7597, i64 3
  %t7599 = load i64, ptr %t7598
  %t7600 = and i64 %self, -8
  %t7601 = inttoptr i64 %t7600 to ptr
  %t7602 = getelementptr i64, ptr %t7601, i64 3
  %t7603 = load i64, ptr %t7602
  %t7604 = call i64 @rt_vector_ref(i64 %t7603, i64 %t7595)
  %t7605 = call i64 @rt_cons(i64 %t7580, i64 %t7604)
  %t7606 = call i64 @rt_vector_set(i64 %t7599, i64 %t7595, i64 %t7605)
  %t7607 = call i64 @rt_cdr(i64 %a0)
  %t7608 = musttail call fastcc i64 @"scheme.base:code_1253"(i64 %self, i64 1, i64 %t7607, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7608
}

define fastcc i64 @"scheme.base:code_1251"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7609 = icmp eq i64 %argc, 1
  br i1 %t7609, label %argok1605, label %arityerr1604
arityerr1604:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1605:
  %t7610 = and i64 %self, -8
  %t7611 = inttoptr i64 %t7610 to ptr
  %t7612 = getelementptr i64, ptr %t7611, i64 1
  %t7613 = load i64, ptr %t7612
  %t7614 = call i64 @rt_vector_length(i64 %t7613)
  %t7615 = or i64 %a0, %t7614
  %t7616 = and i64 %t7615, 7
  %t7617 = icmp eq i64 %t7616, 0
  br i1 %t7617, label %fixfast1606, label %fixslow1607
fixfast1606:
  %t7618 = icmp slt i64 %a0, %t7614
  %t7619 = select i1 %t7618, i64 257, i64 1
  br label %fixmerge1608
fixslow1607:
  %t7620 = call i64 @rt_lt(i64 %a0, i64 %t7614)
  br label %fixmerge1608
fixmerge1608:
  %t7621 = phi i64 [ %t7619, %fixfast1606 ], [ %t7620, %fixslow1607 ]
  %t7622 = icmp ne i64 %t7621, 1
  br i1 %t7622, label %then1609, label %else1610
then1609:
  %t7623 = call ptr @rt_alloc_words(i64 5)
  %t7624 = ptrtoint ptr %t7623 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1253" to i64), ptr %t7623
  %t7625 = or i64 %t7624, 4
  %t7626 = and i64 %self, -8
  %t7627 = inttoptr i64 %t7626 to ptr
  %t7628 = getelementptr i64, ptr %t7627, i64 2
  %t7629 = load i64, ptr %t7628
  %t7630 = getelementptr i64, ptr %t7623, i64 1
  store i64 %t7629, ptr %t7630
  %t7631 = and i64 %self, -8
  %t7632 = inttoptr i64 %t7631 to ptr
  %t7633 = getelementptr i64, ptr %t7632, i64 3
  %t7634 = load i64, ptr %t7633
  %t7635 = getelementptr i64, ptr %t7623, i64 2
  store i64 %t7634, ptr %t7635
  %t7636 = and i64 %self, -8
  %t7637 = inttoptr i64 %t7636 to ptr
  %t7638 = getelementptr i64, ptr %t7637, i64 4
  %t7639 = load i64, ptr %t7638
  %t7640 = getelementptr i64, ptr %t7623, i64 3
  store i64 %t7639, ptr %t7640
  %t7641 = getelementptr i64, ptr %t7623, i64 4
  store i64 %t7625, ptr %t7641
  %t7642 = and i64 %self, -8
  %t7643 = inttoptr i64 %t7642 to ptr
  %t7644 = getelementptr i64, ptr %t7643, i64 1
  %t7645 = load i64, ptr %t7644
  %t7646 = call i64 @rt_vector_ref(i64 %t7645, i64 %a0)
  %t7647 = call fastcc i64 @"scheme.base:code_1253"(i64 %t7625, i64 1, i64 %t7646, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7648 = or i64 %a0, 8
  %t7649 = and i64 %t7648, 7
  %t7650 = icmp eq i64 %t7649, 0
  br i1 %t7650, label %fixfast1611, label %fixslow1612
fixfast1611:
  %t7651 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7652 = extractvalue {i64, i1} %t7651, 0
  %t7653 = extractvalue {i64, i1} %t7651, 1
  br i1 %t7653, label %fixslow1612, label %fixmerge1613
fixslow1612:
  %t7654 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1613
fixmerge1613:
  %t7655 = phi i64 [ %t7652, %fixfast1611 ], [ %t7654, %fixslow1612 ]
  %t7656 = musttail call fastcc i64 @"scheme.base:code_1251"(i64 %self, i64 1, i64 %t7655, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7656
else1610:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7657 = icmp eq i64 %argc, 1
  br i1 %t7657, label %argok1615, label %arityerr1614
arityerr1614:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1615:
  %t7658 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7658)
  %t7659 = and i64 %t7658, -8
  %t7660 = inttoptr i64 %t7659 to ptr
  %t7661 = load i64, ptr %t7660
  %t7662 = inttoptr i64 %t7661 to ptr
  %t7663 = call fastcc i64%t7662(i64 %t7658, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7664 = call i64 @rt_vector_length(i64 %t7663)
  %t7665 = or i64 16, %t7664
  %t7666 = and i64 %t7665, 7
  %t7667 = icmp eq i64 %t7666, 0
  br i1 %t7667, label %fixfast1616, label %fixslow1617
fixfast1616:
  %t7668 = ashr i64 16, 3
  %t7669 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7668, i64 %t7664)
  %t7670 = extractvalue {i64, i1} %t7669, 0
  %t7671 = extractvalue {i64, i1} %t7669, 1
  br i1 %t7671, label %fixslow1617, label %fixmerge1618
fixslow1617:
  %t7672 = call i64 @rt_mul(i64 16, i64 %t7664)
  br label %fixmerge1618
fixmerge1618:
  %t7673 = phi i64 [ %t7670, %fixfast1616 ], [ %t7672, %fixslow1617 ]
  %t7674 = call i64 @rt_make_vector(i64 %t7673, i64 2)
  %t7675 = call ptr @rt_alloc_words(i64 6)
  %t7676 = ptrtoint ptr %t7675 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1251" to i64), ptr %t7675
  %t7677 = or i64 %t7676, 4
  %t7678 = getelementptr i64, ptr %t7675, i64 1
  store i64 %t7663, ptr %t7678
  %t7679 = getelementptr i64, ptr %t7675, i64 2
  store i64 %a0, ptr %t7679
  %t7680 = getelementptr i64, ptr %t7675, i64 3
  store i64 %t7673, ptr %t7680
  %t7681 = getelementptr i64, ptr %t7675, i64 4
  store i64 %t7674, ptr %t7681
  %t7682 = getelementptr i64, ptr %t7675, i64 5
  store i64 %t7677, ptr %t7682
  %t7683 = call fastcc i64 @"scheme.base:code_1251"(i64 %t7677, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7684 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t7684)
  %t7685 = and i64 %t7684, -8
  %t7686 = inttoptr i64 %t7685 to ptr
  %t7687 = load i64, ptr %t7686
  %t7688 = inttoptr i64 %t7687 to ptr
  %t7689 = musttail call fastcc i64 %t7688(i64 %t7684, i64 2, i64 %a0, i64 %t7674, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7689
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7694 = icmp eq i64 %argc, 1
  br i1 %t7694, label %argok1620, label %arityerr1619
arityerr1619:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1620:
  %t7695 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7695)
  %t7696 = and i64 %t7695, -8
  %t7697 = inttoptr i64 %t7696 to ptr
  %t7698 = load i64, ptr %t7697
  %t7699 = inttoptr i64 %t7698 to ptr
  %t7700 = musttail call fastcc i64 %t7699(i64 %t7695, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7700
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7705 = icmp eq i64 %argc, 2
  br i1 %t7705, label %argok1622, label %arityerr1621
arityerr1621:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1622:
  %t7706 = call i64 @rt_null_p(i64 %a0)
  %t7707 = icmp ne i64 %t7706, 1
  br i1 %t7707, label %then1623, label %else1624
then1623:
  ret i64 %a1
else1624:
  %t7708 = call i64 @rt_car(i64 %a0)
  %t7709 = call i64 @rt_car(i64 %t7708)
  %t7710 = call i64 @rt_car(i64 %a0)
  %t7711 = call i64 @rt_cdr(i64 %t7710)
  %t7712 = call i64 @rt_cons(i64 %t7709, i64 %t7711)
  %t7713 = call i64 @rt_cdr(i64 %a0)
  %t7714 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7714)
  %t7715 = and i64 %t7714, -8
  %t7716 = inttoptr i64 %t7715 to ptr
  %t7717 = load i64, ptr %t7716
  %t7718 = inttoptr i64 %t7717 to ptr
  %t7719 = call fastcc i64%t7718(i64 %t7714, i64 2, i64 %t7713, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7720 = call i64 @rt_cons(i64 %t7712, i64 %t7719)
  ret i64 %t7720
}

define fastcc i64 @"scheme.base:code_1268"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7725 = icmp eq i64 %argc, 2
  br i1 %t7725, label %argok1626, label %arityerr1625
arityerr1625:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1626:
  %t7726 = and i64 %self, -8
  %t7727 = inttoptr i64 %t7726 to ptr
  %t7728 = getelementptr i64, ptr %t7727, i64 1
  %t7729 = load i64, ptr %t7728
  %t7730 = call i64 @rt_vector_length(i64 %t7729)
  %t7731 = or i64 %a0, %t7730
  %t7732 = and i64 %t7731, 7
  %t7733 = icmp eq i64 %t7732, 0
  br i1 %t7733, label %fixfast1627, label %fixslow1628
fixfast1627:
  %t7734 = icmp slt i64 %a0, %t7730
  %t7735 = select i1 %t7734, i64 257, i64 1
  br label %fixmerge1629
fixslow1628:
  %t7736 = call i64 @rt_lt(i64 %a0, i64 %t7730)
  br label %fixmerge1629
fixmerge1629:
  %t7737 = phi i64 [ %t7735, %fixfast1627 ], [ %t7736, %fixslow1628 ]
  %t7738 = icmp ne i64 %t7737, 1
  br i1 %t7738, label %then1630, label %else1631
then1630:
  %t7739 = or i64 %a0, 8
  %t7740 = and i64 %t7739, 7
  %t7741 = icmp eq i64 %t7740, 0
  br i1 %t7741, label %fixfast1632, label %fixslow1633
fixfast1632:
  %t7742 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7743 = extractvalue {i64, i1} %t7742, 0
  %t7744 = extractvalue {i64, i1} %t7742, 1
  br i1 %t7744, label %fixslow1633, label %fixmerge1634
fixslow1633:
  %t7745 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1634
fixmerge1634:
  %t7746 = phi i64 [ %t7743, %fixfast1632 ], [ %t7745, %fixslow1633 ]
  %t7747 = and i64 %self, -8
  %t7748 = inttoptr i64 %t7747 to ptr
  %t7749 = getelementptr i64, ptr %t7748, i64 1
  %t7750 = load i64, ptr %t7749
  %t7751 = call i64 @rt_vector_ref(i64 %t7750, i64 %a0)
  %t7752 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7752)
  %t7753 = and i64 %t7752, -8
  %t7754 = inttoptr i64 %t7753 to ptr
  %t7755 = load i64, ptr %t7754
  %t7756 = inttoptr i64 %t7755 to ptr
  %t7757 = call fastcc i64%t7756(i64 %t7752, i64 2, i64 %t7751, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7758 = musttail call fastcc i64 @"scheme.base:code_1268"(i64 %self, i64 2, i64 %t7746, i64 %t7757, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7758
else1631:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7759 = icmp eq i64 %argc, 1
  br i1 %t7759, label %argok1636, label %arityerr1635
arityerr1635:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1636:
  %t7760 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7760)
  %t7761 = and i64 %t7760, -8
  %t7762 = inttoptr i64 %t7761 to ptr
  %t7763 = load i64, ptr %t7762
  %t7764 = inttoptr i64 %t7763 to ptr
  %t7765 = call fastcc i64%t7764(i64 %t7760, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7766 = call ptr @rt_alloc_words(i64 3)
  %t7767 = ptrtoint ptr %t7766 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1268" to i64), ptr %t7766
  %t7768 = or i64 %t7767, 4
  %t7769 = getelementptr i64, ptr %t7766, i64 1
  store i64 %t7765, ptr %t7769
  %t7770 = getelementptr i64, ptr %t7766, i64 2
  store i64 %t7768, ptr %t7770
  %t7771 = musttail call fastcc i64 @"scheme.base:code_1268"(i64 %t7768, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7771
}

define fastcc i64 @"scheme.base:code_1273"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7776 = icmp eq i64 %argc, 1
  br i1 %t7776, label %argok1638, label %arityerr1637
arityerr1637:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1638:
  %t7777 = call i64 @rt_car(i64 %a0)
  ret i64 %t7777
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7778 = icmp eq i64 %argc, 1
  br i1 %t7778, label %argok1640, label %arityerr1639
arityerr1639:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1640:
  %t7779 = call ptr @rt_alloc_words(i64 1)
  %t7780 = ptrtoint ptr %t7779 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1273" to i64), ptr %t7779
  %t7781 = or i64 %t7780, 4
  %t7782 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7782)
  %t7783 = and i64 %t7782, -8
  %t7784 = inttoptr i64 %t7783 to ptr
  %t7785 = load i64, ptr %t7784
  %t7786 = inttoptr i64 %t7785 to ptr
  %t7787 = call fastcc i64%t7786(i64 %t7782, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7788 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7788)
  %t7789 = and i64 %t7788, -8
  %t7790 = inttoptr i64 %t7789 to ptr
  %t7791 = load i64, ptr %t7790
  %t7792 = inttoptr i64 %t7791 to ptr
  %t7793 = musttail call fastcc i64 %t7792(i64 %t7788, i64 2, i64 %t7781, i64 %t7787, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7793
}

define fastcc i64 @"scheme.base:code_1278"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7798 = icmp eq i64 %argc, 1
  br i1 %t7798, label %argok1642, label %arityerr1641
arityerr1641:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1642:
  %t7799 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t7799
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7800 = icmp eq i64 %argc, 1
  br i1 %t7800, label %argok1644, label %arityerr1643
arityerr1643:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1644:
  %t7801 = call ptr @rt_alloc_words(i64 1)
  %t7802 = ptrtoint ptr %t7801 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1278" to i64), ptr %t7801
  %t7803 = or i64 %t7802, 4
  %t7804 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7804)
  %t7805 = and i64 %t7804, -8
  %t7806 = inttoptr i64 %t7805 to ptr
  %t7807 = load i64, ptr %t7806
  %t7808 = inttoptr i64 %t7807 to ptr
  %t7809 = call fastcc i64%t7808(i64 %t7804, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7810 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7810)
  %t7811 = and i64 %t7810, -8
  %t7812 = inttoptr i64 %t7811 to ptr
  %t7813 = load i64, ptr %t7812
  %t7814 = inttoptr i64 %t7813 to ptr
  %t7815 = musttail call fastcc i64 %t7814(i64 %t7810, i64 2, i64 %t7803, i64 %t7809, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7815
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7820 = icmp eq i64 %argc, 3
  br i1 %t7820, label %argok1646, label %arityerr1645
arityerr1645:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1646:
  %t7821 = call i64 @rt_car(i64 %a2)
  %t7822 = call i64 @rt_cdr(i64 %a2)
  %t7823 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t7824 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t7823, i64 1, i64 %t7822, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7825 = call i64 @rt_intern(ptr @.str.sym.51)
  %t7826 = call i64 @rt_eq_p(i64 %t7821, i64 %t7825)
  %t7827 = icmp ne i64 %t7826, 1
  br i1 %t7827, label %then1647, label %else1648
then1647:
  %t7828 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7829 = call i64 @rt_make_string(ptr @.str.lit.52, i64 45)
  %t7830 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7830)
  %t7831 = and i64 %t7830, -8
  %t7832 = inttoptr i64 %t7831 to ptr
  %t7833 = load i64, ptr %t7832
  %t7834 = inttoptr i64 %t7833 to ptr
  %t7835 = musttail call fastcc i64 %t7834(i64 %t7830, i64 3, i64 %t7828, i64 %t7829, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7835
else1648:
  %t7836 = call i64 @rt_intern(ptr @.str.sym.53)
  %t7837 = call i64 @rt_eq_p(i64 %t7821, i64 %t7836)
  %t7838 = icmp ne i64 %t7837, 1
  br i1 %t7838, label %then1649, label %else1650
then1649:
  %t7839 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7840 = call i64 @rt_make_string(ptr @.str.lit.54, i64 41)
  %t7841 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7841)
  %t7842 = and i64 %t7841, -8
  %t7843 = inttoptr i64 %t7842 to ptr
  %t7844 = load i64, ptr %t7843
  %t7845 = inttoptr i64 %t7844 to ptr
  %t7846 = musttail call fastcc i64 %t7845(i64 %t7841, i64 3, i64 %t7839, i64 %t7840, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7846
else1650:
  %t7847 = call i64 @rt_intern(ptr @.str.sym.55)
  %t7848 = call i64 @rt_eq_p(i64 %t7821, i64 %t7847)
  %t7849 = icmp ne i64 %t7848, 1
  br i1 %t7849, label %then1651, label %else1652
then1651:
  %t7850 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7851 = call i64 @rt_make_string(ptr @.str.lit.56, i64 13)
  %t7852 = call i64 @rt_string_ref(i64 %a0, i64 %t7824)
  %t7853 = call i64 @rt_char_to_integer(i64 %t7852)
  %t7854 = or i64 %t7853, 728
  %t7855 = and i64 %t7854, 7
  %t7856 = icmp eq i64 %t7855, 0
  br i1 %t7856, label %fixfast1653, label %fixslow1654
fixfast1653:
  %t7857 = icmp eq i64 %t7853, 728
  %t7858 = select i1 %t7857, i64 257, i64 1
  br label %fixmerge1655
fixslow1654:
  %t7859 = call i64 @rt_num_eq(i64 %t7853, i64 728)
  br label %fixmerge1655
fixmerge1655:
  %t7860 = phi i64 [ %t7858, %fixfast1653 ], [ %t7859, %fixslow1654 ]
  %t7861 = icmp ne i64 %t7860, 1
  br i1 %t7861, label %then1656, label %else1657
then1656:
  %t7862 = call i64 @rt_make_string(ptr @.str.lit.57, i64 6)
  br label %merge1658
else1657:
  %t7863 = or i64 %t7853, 280
  %t7864 = and i64 %t7863, 7
  %t7865 = icmp eq i64 %t7864, 0
  br i1 %t7865, label %fixfast1659, label %fixslow1660
fixfast1659:
  %t7866 = icmp eq i64 %t7853, 280
  %t7867 = select i1 %t7866, i64 257, i64 1
  br label %fixmerge1661
fixslow1660:
  %t7868 = call i64 @rt_num_eq(i64 %t7853, i64 280)
  br label %fixmerge1661
fixmerge1661:
  %t7869 = phi i64 [ %t7867, %fixfast1659 ], [ %t7868, %fixslow1660 ]
  %t7870 = icmp ne i64 %t7869, 1
  br i1 %t7870, label %then1662, label %else1663
then1662:
  %t7871 = or i64 %t7824, 8
  %t7872 = and i64 %t7871, 7
  %t7873 = icmp eq i64 %t7872, 0
  br i1 %t7873, label %fixfast1665, label %fixslow1666
fixfast1665:
  %t7874 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7824, i64 8)
  %t7875 = extractvalue {i64, i1} %t7874, 0
  %t7876 = extractvalue {i64, i1} %t7874, 1
  br i1 %t7876, label %fixslow1666, label %fixmerge1667
fixslow1666:
  %t7877 = call i64 @rt_add(i64 %t7824, i64 8)
  br label %fixmerge1667
fixmerge1667:
  %t7878 = phi i64 [ %t7875, %fixfast1665 ], [ %t7877, %fixslow1666 ]
  %t7879 = or i64 %t7878, %a1
  %t7880 = and i64 %t7879, 7
  %t7881 = icmp eq i64 %t7880, 0
  br i1 %t7881, label %fixfast1668, label %fixslow1669
fixfast1668:
  %t7882 = icmp slt i64 %t7878, %a1
  %t7883 = select i1 %t7882, i64 257, i64 1
  br label %fixmerge1670
fixslow1669:
  %t7884 = call i64 @rt_lt(i64 %t7878, i64 %a1)
  br label %fixmerge1670
fixmerge1670:
  %t7885 = phi i64 [ %t7883, %fixfast1668 ], [ %t7884, %fixslow1669 ]
  %t7886 = icmp ne i64 %t7885, 1
  br i1 %t7886, label %then1671, label %else1672
then1671:
  %t7887 = or i64 %t7824, 8
  %t7888 = and i64 %t7887, 7
  %t7889 = icmp eq i64 %t7888, 0
  br i1 %t7889, label %fixfast1674, label %fixslow1675
fixfast1674:
  %t7890 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7824, i64 8)
  %t7891 = extractvalue {i64, i1} %t7890, 0
  %t7892 = extractvalue {i64, i1} %t7890, 1
  br i1 %t7892, label %fixslow1675, label %fixmerge1676
fixslow1675:
  %t7893 = call i64 @rt_add(i64 %t7824, i64 8)
  br label %fixmerge1676
fixmerge1676:
  %t7894 = phi i64 [ %t7891, %fixfast1674 ], [ %t7893, %fixslow1675 ]
  %t7895 = call i64 @rt_string_ref(i64 %a0, i64 %t7894)
  %t7896 = call i64 @rt_char_to_integer(i64 %t7895)
  %t7897 = or i64 %t7896, 936
  %t7898 = and i64 %t7897, 7
  %t7899 = icmp eq i64 %t7898, 0
  br i1 %t7899, label %fixfast1677, label %fixslow1678
fixfast1677:
  %t7900 = icmp eq i64 %t7896, 936
  %t7901 = select i1 %t7900, i64 257, i64 1
  br label %fixmerge1679
fixslow1678:
  %t7902 = call i64 @rt_num_eq(i64 %t7896, i64 936)
  br label %fixmerge1679
fixmerge1679:
  %t7903 = phi i64 [ %t7901, %fixfast1677 ], [ %t7902, %fixslow1678 ]
  br label %merge1673
else1672:
  br label %merge1673
merge1673:
  %t7904 = phi i64 [ %t7903, %fixmerge1679 ], [ 1, %else1672 ]
  br label %merge1664
else1663:
  br label %merge1664
merge1664:
  %t7905 = phi i64 [ %t7904, %merge1673 ], [ 1, %else1663 ]
  %t7906 = icmp ne i64 %t7905, 1
  br i1 %t7906, label %then1680, label %else1681
then1680:
  %t7907 = call i64 @rt_make_string(ptr @.str.lit.58, i64 15)
  br label %merge1682
else1681:
  %t7908 = or i64 %t7853, 280
  %t7909 = and i64 %t7908, 7
  %t7910 = icmp eq i64 %t7909, 0
  br i1 %t7910, label %fixfast1683, label %fixslow1684
fixfast1683:
  %t7911 = icmp eq i64 %t7853, 280
  %t7912 = select i1 %t7911, i64 257, i64 1
  br label %fixmerge1685
fixslow1684:
  %t7913 = call i64 @rt_num_eq(i64 %t7853, i64 280)
  br label %fixmerge1685
fixmerge1685:
  %t7914 = phi i64 [ %t7912, %fixfast1683 ], [ %t7913, %fixslow1684 ]
  %t7915 = icmp ne i64 %t7914, 1
  br i1 %t7915, label %then1686, label %else1687
then1686:
  %t7916 = call i64 @rt_make_string(ptr @.str.lit.59, i64 9)
  br label %merge1688
else1687:
  %t7917 = call i64 @rt_make_string(ptr @.str.lit.60, i64 6)
  br label %merge1688
merge1688:
  %t7918 = phi i64 [ %t7916, %then1686 ], [ %t7917, %else1687 ]
  br label %merge1682
merge1682:
  %t7919 = phi i64 [ %t7907, %then1680 ], [ %t7918, %merge1688 ]
  br label %merge1658
merge1658:
  %t7920 = phi i64 [ %t7862, %then1656 ], [ %t7919, %merge1682 ]
  %t7921 = call i64 @rt_string_append(i64 %t7851, i64 %t7920)
  %t7922 = call i64 @rt_make_string(ptr @.str.lit.61, i64 16)
  %t7923 = call i64 @rt_string_append(i64 %t7921, i64 %t7922)
  %t7924 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7924)
  %t7925 = and i64 %t7924, -8
  %t7926 = inttoptr i64 %t7925 to ptr
  %t7927 = load i64, ptr %t7926
  %t7928 = inttoptr i64 %t7927 to ptr
  %t7929 = musttail call fastcc i64 %t7928(i64 %t7924, i64 3, i64 %t7850, i64 %t7923, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7929
else1652:
  %t7930 = call i64 @rt_intern(ptr @.str.sym.62)
  %t7931 = call i64 @rt_eq_p(i64 %t7821, i64 %t7930)
  %t7932 = icmp ne i64 %t7931, 1
  br i1 %t7932, label %then1689, label %else1690
then1689:
  %t7933 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7934 = call i64 @rt_make_string(ptr @.str.lit.63, i64 37)
  %t7935 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7935)
  %t7936 = and i64 %t7935, -8
  %t7937 = inttoptr i64 %t7936 to ptr
  %t7938 = load i64, ptr %t7937
  %t7939 = inttoptr i64 %t7938 to ptr
  %t7940 = musttail call fastcc i64 %t7939(i64 %t7935, i64 3, i64 %t7933, i64 %t7934, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7940
else1690:
  %t7941 = call i64 @rt_intern(ptr @.str.sym.64)
  %t7942 = call i64 @rt_eq_p(i64 %t7821, i64 %t7941)
  %t7943 = icmp ne i64 %t7942, 1
  br i1 %t7943, label %then1691, label %else1692
then1691:
  %t7944 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7945 = call i64 @rt_make_string(ptr @.str.lit.65, i64 22)
  %t7946 = load i64, ptr @"emit.internal:rd-token-at"
  %t7947 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7946, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7948 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7948)
  %t7949 = and i64 %t7948, -8
  %t7950 = inttoptr i64 %t7949 to ptr
  %t7951 = load i64, ptr %t7950
  %t7952 = inttoptr i64 %t7951 to ptr
  %t7953 = musttail call fastcc i64 %t7952(i64 %t7948, i64 3, i64 %t7944, i64 %t7945, i64 %t7947, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7953
else1692:
  %t7954 = call i64 @rt_intern(ptr @.str.sym.66)
  %t7955 = call i64 @rt_eq_p(i64 %t7821, i64 %t7954)
  %t7956 = icmp ne i64 %t7955, 1
  br i1 %t7956, label %then1693, label %else1694
then1693:
  %t7957 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7958 = call i64 @rt_make_string(ptr @.str.lit.67, i64 44)
  %t7959 = load i64, ptr @"emit.internal:rd-token-at"
  %t7960 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7959, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7961 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7961)
  %t7962 = and i64 %t7961, -8
  %t7963 = inttoptr i64 %t7962 to ptr
  %t7964 = load i64, ptr %t7963
  %t7965 = inttoptr i64 %t7964 to ptr
  %t7966 = musttail call fastcc i64 %t7965(i64 %t7961, i64 3, i64 %t7957, i64 %t7958, i64 %t7960, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7966
else1694:
  %t7967 = call i64 @rt_intern(ptr @.str.sym.68)
  %t7968 = call i64 @rt_eq_p(i64 %t7821, i64 %t7967)
  %t7969 = icmp ne i64 %t7968, 1
  br i1 %t7969, label %then1695, label %else1696
then1695:
  %t7970 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7971 = call i64 @rt_make_string(ptr @.str.lit.69, i64 21)
  %t7972 = load i64, ptr @"emit.internal:rd-token-at"
  %t7973 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7972, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7974 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7974)
  %t7975 = and i64 %t7974, -8
  %t7976 = inttoptr i64 %t7975 to ptr
  %t7977 = load i64, ptr %t7976
  %t7978 = inttoptr i64 %t7977 to ptr
  %t7979 = musttail call fastcc i64 %t7978(i64 %t7974, i64 3, i64 %t7970, i64 %t7971, i64 %t7973, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7979
else1696:
  %t7980 = call i64 @rt_intern(ptr @.str.sym.70)
  %t7981 = call i64 @rt_eq_p(i64 %t7821, i64 %t7980)
  %t7982 = icmp ne i64 %t7981, 1
  br i1 %t7982, label %then1697, label %else1698
then1697:
  %t7983 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7984 = call i64 @rt_make_string(ptr @.str.lit.71, i64 47)
  %t7985 = load i64, ptr @"emit.internal:rd-token-at"
  %t7986 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7985, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7987 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7987)
  %t7988 = and i64 %t7987, -8
  %t7989 = inttoptr i64 %t7988 to ptr
  %t7990 = load i64, ptr %t7989
  %t7991 = inttoptr i64 %t7990 to ptr
  %t7992 = musttail call fastcc i64 %t7991(i64 %t7987, i64 3, i64 %t7983, i64 %t7984, i64 %t7986, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7992
else1698:
  %t7993 = call i64 @rt_intern(ptr @.str.sym.72)
  %t7994 = call i64 @rt_eq_p(i64 %t7821, i64 %t7993)
  %t7995 = icmp ne i64 %t7994, 1
  br i1 %t7995, label %then1699, label %else1700
then1699:
  %t7996 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7997 = call i64 @rt_make_string(ptr @.str.lit.73, i64 55)
  %t7998 = load i64, ptr @"emit.internal:rd-token-at"
  %t7999 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7998, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8000 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8000)
  %t8001 = and i64 %t8000, -8
  %t8002 = inttoptr i64 %t8001 to ptr
  %t8003 = load i64, ptr %t8002
  %t8004 = inttoptr i64 %t8003 to ptr
  %t8005 = musttail call fastcc i64 %t8004(i64 %t8000, i64 3, i64 %t7996, i64 %t7997, i64 %t7999, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8005
else1700:
  %t8006 = call i64 @rt_intern(ptr @.str.sym.74)
  %t8007 = call i64 @rt_eq_p(i64 %t7821, i64 %t8006)
  %t8008 = icmp ne i64 %t8007, 1
  br i1 %t8008, label %then1701, label %else1702
then1701:
  %t8009 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8010 = call i64 @rt_make_string(ptr @.str.lit.75, i64 21)
  %t8011 = load i64, ptr @"emit.internal:rd-token-at"
  %t8012 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8011, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8013 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8013)
  %t8014 = and i64 %t8013, -8
  %t8015 = inttoptr i64 %t8014 to ptr
  %t8016 = load i64, ptr %t8015
  %t8017 = inttoptr i64 %t8016 to ptr
  %t8018 = musttail call fastcc i64 %t8017(i64 %t8013, i64 3, i64 %t8009, i64 %t8010, i64 %t8012, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8018
else1702:
  %t8019 = call i64 @rt_intern(ptr @.str.sym.76)
  %t8020 = call i64 @rt_eq_p(i64 %t7821, i64 %t8019)
  %t8021 = icmp ne i64 %t8020, 1
  br i1 %t8021, label %then1703, label %else1704
then1703:
  %t8022 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8023 = call i64 @rt_make_string(ptr @.str.lit.77, i64 49)
  %t8024 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8024)
  %t8025 = and i64 %t8024, -8
  %t8026 = inttoptr i64 %t8025 to ptr
  %t8027 = load i64, ptr %t8026
  %t8028 = inttoptr i64 %t8027 to ptr
  %t8029 = musttail call fastcc i64 %t8028(i64 %t8024, i64 3, i64 %t8022, i64 %t8023, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8029
else1704:
  %t8030 = call i64 @rt_intern(ptr @.str.sym.78)
  %t8031 = call i64 @rt_eq_p(i64 %t7821, i64 %t8030)
  %t8032 = icmp ne i64 %t8031, 1
  br i1 %t8032, label %then1705, label %else1706
then1705:
  %t8033 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8034 = call i64 @rt_make_string(ptr @.str.lit.79, i64 23)
  %t8035 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8035)
  %t8036 = and i64 %t8035, -8
  %t8037 = inttoptr i64 %t8036 to ptr
  %t8038 = load i64, ptr %t8037
  %t8039 = inttoptr i64 %t8038 to ptr
  %t8040 = musttail call fastcc i64 %t8039(i64 %t8035, i64 3, i64 %t8033, i64 %t8034, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8040
else1706:
  %t8041 = call i64 @rt_intern(ptr @.str.sym.80)
  %t8042 = call i64 @rt_eq_p(i64 %t7821, i64 %t8041)
  %t8043 = icmp ne i64 %t8042, 1
  br i1 %t8043, label %then1707, label %else1708
then1707:
  %t8044 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8045 = call i64 @rt_make_string(ptr @.str.lit.81, i64 56)
  %t8046 = call i64 @rt_make_string(ptr @.str.lit.82, i64 38)
  %t8047 = call i64 @rt_string_append(i64 %t8045, i64 %t8046)
  %t8048 = load i64, ptr @"emit.internal:rd-token-at"
  %t8049 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8048, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8050 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8050)
  %t8051 = and i64 %t8050, -8
  %t8052 = inttoptr i64 %t8051 to ptr
  %t8053 = load i64, ptr %t8052
  %t8054 = inttoptr i64 %t8053 to ptr
  %t8055 = musttail call fastcc i64 %t8054(i64 %t8050, i64 3, i64 %t8044, i64 %t8047, i64 %t8049, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8055
else1708:
  %t8056 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8057 = call i64 @rt_make_string(ptr @.str.lit.83, i64 19)
  %t8058 = load i64, ptr @"emit.internal:rd-token-at"
  %t8059 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8058, i64 3, i64 %a0, i64 %a1, i64 %t7824, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8060 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8060)
  %t8061 = and i64 %t8060, -8
  %t8062 = inttoptr i64 %t8061 to ptr
  %t8063 = load i64, ptr %t8062
  %t8064 = inttoptr i64 %t8063 to ptr
  %t8065 = musttail call fastcc i64 %t8064(i64 %t8060, i64 3, i64 %t8056, i64 %t8057, i64 %t8059, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8065
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8070 = icmp eq i64 %argc, 1
  br i1 %t8070, label %argok1710, label %arityerr1709
arityerr1709:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1710:
  %t8071 = call i64 @rt_string_length(i64 %a0)
  %t8072 = load i64, ptr @"emit.internal:rd-state"
  %t8073 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8072, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8074 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8075 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8074, i64 4, i64 %a0, i64 %t8071, i64 0, i64 %t8073, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8076 = load i64, ptr @"emit.internal:rd-datum"
  %t8077 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8076, i64 4, i64 %a0, i64 %t8071, i64 %t8075, i64 %t8073, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8078 = load i64, ptr @"emit.internal:rd-finish"
  %t8079 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8078, i64 2, i64 %t8073, i64 %t8077, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8080 = call i64 @rt_cdr(i64 %t8079)
  %t8081 = load i64, ptr @"emit.internal:rd-fail?"
  %t8082 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8081, i64 1, i64 %t8080, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8083 = icmp ne i64 %t8082, 1
  br i1 %t8083, label %then1711, label %else1712
then1711:
  %t8084 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8084)
  %t8085 = and i64 %t8084, -8
  %t8086 = inttoptr i64 %t8085 to ptr
  %t8087 = load i64, ptr %t8086
  %t8088 = inttoptr i64 %t8087 to ptr
  %t8089 = musttail call fastcc i64 %t8088(i64 %t8084, i64 3, i64 %a0, i64 %t8071, i64 %t8079, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8089
else1712:
  %t8090 = call i64 @rt_car(i64 %t8079)
  ret i64 %t8090
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8095 = icmp eq i64 %argc, 1
  br i1 %t8095, label %argok1714, label %arityerr1713
arityerr1713:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1714:
  %t8096 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8096)
  %t8097 = and i64 %t8096, -8
  %t8098 = inttoptr i64 %t8097 to ptr
  %t8099 = load i64, ptr %t8098
  %t8100 = inttoptr i64 %t8099 to ptr
  %t8101 = musttail call fastcc i64 %t8100(i64 %t8096, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8101
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8106 = icmp eq i64 %argc, 1
  br i1 %t8106, label %argok1716, label %arityerr1715
arityerr1715:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1716:
  %t8107 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8107)
  %t8108 = and i64 %t8107, -8
  %t8109 = inttoptr i64 %t8108 to ptr
  %t8110 = load i64, ptr %t8109
  %t8111 = inttoptr i64 %t8110 to ptr
  %t8112 = musttail call fastcc i64 %t8111(i64 %t8107, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8112
}

define fastcc i64 @"scheme.base:code_1344"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8117 = icmp eq i64 %argc, 2
  br i1 %t8117, label %argok1718, label %arityerr1717
arityerr1717:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1718:
  %t8118 = load i64, ptr @"emit.internal:rd-fail?"
  %t8119 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8118, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8120 = icmp ne i64 %t8119, 1
  br i1 %t8120, label %then1719, label %else1720
then1719:
  %t8121 = and i64 %self, -8
  %t8122 = inttoptr i64 %t8121 to ptr
  %t8123 = getelementptr i64, ptr %t8122, i64 1
  %t8124 = load i64, ptr %t8123
  %t8125 = and i64 %self, -8
  %t8126 = inttoptr i64 %t8125 to ptr
  %t8127 = getelementptr i64, ptr %t8126, i64 2
  %t8128 = load i64, ptr %t8127
  %t8129 = call i64 @rt_intern(ptr @.str.sym.51)
  %t8130 = call i64 @rt_cons(i64 %t8129, i64 %a0)
  %t8131 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8131)
  %t8132 = and i64 %t8131, -8
  %t8133 = inttoptr i64 %t8132 to ptr
  %t8134 = load i64, ptr %t8133
  %t8135 = inttoptr i64 %t8134 to ptr
  %t8136 = musttail call fastcc i64 %t8135(i64 %t8131, i64 3, i64 %t8124, i64 %t8128, i64 %t8130, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8136
else1720:
  %t8137 = and i64 %self, -8
  %t8138 = inttoptr i64 %t8137 to ptr
  %t8139 = getelementptr i64, ptr %t8138, i64 2
  %t8140 = load i64, ptr %t8139
  %t8141 = or i64 %a0, %t8140
  %t8142 = and i64 %t8141, 7
  %t8143 = icmp eq i64 %t8142, 0
  br i1 %t8143, label %fixfast1721, label %fixslow1722
fixfast1721:
  %t8144 = icmp slt i64 %a0, %t8140
  %t8145 = select i1 %t8144, i64 257, i64 1
  br label %fixmerge1723
fixslow1722:
  %t8146 = call i64 @rt_lt(i64 %a0, i64 %t8140)
  br label %fixmerge1723
fixmerge1723:
  %t8147 = phi i64 [ %t8145, %fixfast1721 ], [ %t8146, %fixslow1722 ]
  %t8148 = icmp ne i64 %t8147, 1
  br i1 %t8148, label %then1724, label %else1725
then1724:
  %t8149 = and i64 %self, -8
  %t8150 = inttoptr i64 %t8149 to ptr
  %t8151 = getelementptr i64, ptr %t8150, i64 3
  %t8152 = load i64, ptr %t8151
  %t8153 = load i64, ptr @"emit.internal:rd-state-child"
  %t8154 = call fastcc i64 @"emit.internal:code:rd-state-child"(i64 %t8153, i64 1, i64 %t8152, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8155 = and i64 %self, -8
  %t8156 = inttoptr i64 %t8155 to ptr
  %t8157 = getelementptr i64, ptr %t8156, i64 1
  %t8158 = load i64, ptr %t8157
  %t8159 = and i64 %self, -8
  %t8160 = inttoptr i64 %t8159 to ptr
  %t8161 = getelementptr i64, ptr %t8160, i64 2
  %t8162 = load i64, ptr %t8161
  %t8163 = load i64, ptr @"emit.internal:rd-datum"
  %t8164 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8163, i64 4, i64 %t8158, i64 %t8162, i64 %a0, i64 %t8154, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8165 = load i64, ptr @"emit.internal:rd-finish"
  %t8166 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8165, i64 2, i64 %t8154, i64 %t8164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8167 = call i64 @rt_cdr(i64 %t8166)
  %t8168 = load i64, ptr @"emit.internal:rd-fail?"
  %t8169 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8168, i64 1, i64 %t8167, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8170 = icmp ne i64 %t8169, 1
  br i1 %t8170, label %then1726, label %else1727
then1726:
  %t8171 = and i64 %self, -8
  %t8172 = inttoptr i64 %t8171 to ptr
  %t8173 = getelementptr i64, ptr %t8172, i64 1
  %t8174 = load i64, ptr %t8173
  %t8175 = and i64 %self, -8
  %t8176 = inttoptr i64 %t8175 to ptr
  %t8177 = getelementptr i64, ptr %t8176, i64 2
  %t8178 = load i64, ptr %t8177
  %t8179 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8179)
  %t8180 = and i64 %t8179, -8
  %t8181 = inttoptr i64 %t8180 to ptr
  %t8182 = load i64, ptr %t8181
  %t8183 = inttoptr i64 %t8182 to ptr
  %t8184 = musttail call fastcc i64 %t8183(i64 %t8179, i64 3, i64 %t8174, i64 %t8178, i64 %t8166, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8184
else1727:
  %t8185 = and i64 %self, -8
  %t8186 = inttoptr i64 %t8185 to ptr
  %t8187 = getelementptr i64, ptr %t8186, i64 1
  %t8188 = load i64, ptr %t8187
  %t8189 = and i64 %self, -8
  %t8190 = inttoptr i64 %t8189 to ptr
  %t8191 = getelementptr i64, ptr %t8190, i64 2
  %t8192 = load i64, ptr %t8191
  %t8193 = call i64 @rt_cdr(i64 %t8166)
  %t8194 = and i64 %self, -8
  %t8195 = inttoptr i64 %t8194 to ptr
  %t8196 = getelementptr i64, ptr %t8195, i64 3
  %t8197 = load i64, ptr %t8196
  %t8198 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8199 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8198, i64 4, i64 %t8188, i64 %t8192, i64 %t8193, i64 %t8197, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8200 = call i64 @rt_car(i64 %t8166)
  %t8201 = call i64 @rt_cons(i64 %t8200, i64 %a1)
  %t8202 = musttail call fastcc i64 @"scheme.base:code_1344"(i64 %self, i64 2, i64 %t8199, i64 %t8201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8202
else1725:
  %t8203 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t8203)
  %t8204 = and i64 %t8203, -8
  %t8205 = inttoptr i64 %t8204 to ptr
  %t8206 = load i64, ptr %t8205
  %t8207 = inttoptr i64 %t8206 to ptr
  %t8208 = musttail call fastcc i64 %t8207(i64 %t8203, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8208
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8209 = icmp eq i64 %argc, 2
  br i1 %t8209, label %argok1729, label %arityerr1728
arityerr1728:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1729:
  %t8210 = call i64 @rt_string_length(i64 %a0)
  %t8211 = load i64, ptr @"emit.internal:rd-state"
  %t8212 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8211, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8213 = call ptr @rt_alloc_words(i64 5)
  %t8214 = ptrtoint ptr %t8213 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1344" to i64), ptr %t8213
  %t8215 = or i64 %t8214, 4
  %t8216 = getelementptr i64, ptr %t8213, i64 1
  store i64 %a0, ptr %t8216
  %t8217 = getelementptr i64, ptr %t8213, i64 2
  store i64 %t8210, ptr %t8217
  %t8218 = getelementptr i64, ptr %t8213, i64 3
  store i64 %t8212, ptr %t8218
  %t8219 = getelementptr i64, ptr %t8213, i64 4
  store i64 %t8215, ptr %t8219
  %t8220 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8221 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8220, i64 4, i64 %a0, i64 %t8210, i64 0, i64 %t8212, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8222 = musttail call fastcc i64 @"scheme.base:code_1344"(i64 %t8215, i64 2, i64 %t8221, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8222
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8227 = icmp eq i64 %argc, 1
  br i1 %t8227, label %argok1731, label %arityerr1730
arityerr1730:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1731:
  %t8228 = load i64, ptr @"emit.internal:%port-rtd"
  %t8229 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t8228, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8230 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t8229)
  ret i64 %t8230
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8235 = icmp eq i64 %argc, 1
  br i1 %t8235, label %argok1733, label %arityerr1732
arityerr1732:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1733:
  %t8236 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8236)
  %t8237 = and i64 %t8236, -8
  %t8238 = inttoptr i64 %t8237 to ptr
  %t8239 = load i64, ptr %t8238
  %t8240 = inttoptr i64 %t8239 to ptr
  %t8241 = call fastcc i64%t8240(i64 %t8236, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8242 = icmp ne i64 %t8241, 1
  br i1 %t8242, label %then1734, label %else1735
then1734:
  %t8243 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t8243
else1735:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8248 = icmp eq i64 %argc, 1
  br i1 %t8248, label %argok1737, label %arityerr1736
arityerr1736:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1737:
  %t8249 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8249)
  %t8250 = and i64 %t8249, -8
  %t8251 = inttoptr i64 %t8250 to ptr
  %t8252 = load i64, ptr %t8251
  %t8253 = inttoptr i64 %t8252 to ptr
  %t8254 = call fastcc i64%t8253(i64 %t8249, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8255 = icmp ne i64 %t8254, 1
  br i1 %t8255, label %then1738, label %else1739
then1738:
  %t8256 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8257 = call i64 @rt_not(i64 %t8256)
  ret i64 %t8257
else1739:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8262 = icmp eq i64 %argc, 1
  br i1 %t8262, label %argok1741, label %arityerr1740
arityerr1740:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1741:
  %t8263 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8263)
  %t8264 = and i64 %t8263, -8
  %t8265 = inttoptr i64 %t8264 to ptr
  %t8266 = load i64, ptr %t8265
  %t8267 = inttoptr i64 %t8266 to ptr
  %t8268 = musttail call fastcc i64 %t8267(i64 %t8263, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8268
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8273 = icmp eq i64 %argc, 1
  br i1 %t8273, label %argok1743, label %arityerr1742
arityerr1742:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1743:
  %t8274 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t8274
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8279 = icmp eq i64 %argc, 1
  br i1 %t8279, label %argok1745, label %arityerr1744
arityerr1744:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1745:
  %t8280 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8280)
  %t8281 = and i64 %t8280, -8
  %t8282 = inttoptr i64 %t8281 to ptr
  %t8283 = load i64, ptr %t8282
  %t8284 = inttoptr i64 %t8283 to ptr
  %t8285 = call fastcc i64%t8284(i64 %t8280, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8286 = icmp ne i64 %t8285, 1
  br i1 %t8286, label %then1746, label %else1747
then1746:
  %t8287 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8288 = call i64 @rt_not(i64 %t8287)
  ret i64 %t8288
else1747:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8293 = icmp eq i64 %argc, 1
  br i1 %t8293, label %argok1749, label %arityerr1748
arityerr1748:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1749:
  %t8294 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8294)
  %t8295 = and i64 %t8294, -8
  %t8296 = inttoptr i64 %t8295 to ptr
  %t8297 = load i64, ptr %t8296
  %t8298 = inttoptr i64 %t8297 to ptr
  %t8299 = call fastcc i64%t8298(i64 %t8294, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8300 = icmp ne i64 %t8299, 1
  br i1 %t8300, label %then1750, label %else1751
then1750:
  %t8301 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8302 = call i64 @rt_not(i64 %t8301)
  ret i64 %t8302
else1751:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8307 = icmp eq i64 %argc, 2
  br i1 %t8307, label %argok1753, label %arityerr1752
arityerr1752:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1753:
  %t8308 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8308)
  %t8309 = and i64 %t8308, -8
  %t8310 = inttoptr i64 %t8309 to ptr
  %t8311 = load i64, ptr %t8310
  %t8312 = inttoptr i64 %t8311 to ptr
  %t8313 = call fastcc i64%t8312(i64 %t8308, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8314 = call i64 @rt_not(i64 %t8313)
  %t8315 = icmp ne i64 %t8314, 1
  br i1 %t8315, label %then1754, label %else1755
then1754:
  %t8316 = call i64 @rt_make_string(ptr @.str.lit.84, i64 17)
  %t8317 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8317)
  %t8318 = and i64 %t8317, -8
  %t8319 = inttoptr i64 %t8318 to ptr
  %t8320 = load i64, ptr %t8319
  %t8321 = inttoptr i64 %t8320 to ptr
  %t8322 = musttail call fastcc i64 %t8321(i64 %t8317, i64 3, i64 %a1, i64 %t8316, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8322
else1755:
  %t8323 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8324 = icmp ne i64 %t8323, 1
  br i1 %t8324, label %then1756, label %else1757
then1756:
  %t8325 = call i64 @rt_make_string(ptr @.str.lit.85, i64 14)
  %t8326 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8326)
  %t8327 = and i64 %t8326, -8
  %t8328 = inttoptr i64 %t8327 to ptr
  %t8329 = load i64, ptr %t8328
  %t8330 = inttoptr i64 %t8329 to ptr
  %t8331 = musttail call fastcc i64 %t8330(i64 %t8326, i64 3, i64 %a1, i64 %t8325, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8331
else1757:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8336 = icmp eq i64 %argc, 2
  br i1 %t8336, label %argok1759, label %arityerr1758
arityerr1758:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1759:
  %t8337 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8337)
  %t8338 = and i64 %t8337, -8
  %t8339 = inttoptr i64 %t8338 to ptr
  %t8340 = load i64, ptr %t8339
  %t8341 = inttoptr i64 %t8340 to ptr
  %t8342 = call fastcc i64%t8341(i64 %t8337, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8343 = call i64 @rt_not(i64 %t8342)
  %t8344 = icmp ne i64 %t8343, 1
  br i1 %t8344, label %then1760, label %else1761
then1760:
  %t8345 = call i64 @rt_make_string(ptr @.str.lit.86, i64 18)
  %t8346 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8346)
  %t8347 = and i64 %t8346, -8
  %t8348 = inttoptr i64 %t8347 to ptr
  %t8349 = load i64, ptr %t8348
  %t8350 = inttoptr i64 %t8349 to ptr
  %t8351 = musttail call fastcc i64 %t8350(i64 %t8346, i64 3, i64 %a1, i64 %t8345, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8351
else1761:
  %t8352 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8353 = icmp ne i64 %t8352, 1
  br i1 %t8353, label %then1762, label %else1763
then1762:
  %t8354 = call i64 @rt_make_string(ptr @.str.lit.87, i64 14)
  %t8355 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8355)
  %t8356 = and i64 %t8355, -8
  %t8357 = inttoptr i64 %t8356 to ptr
  %t8358 = load i64, ptr %t8357
  %t8359 = inttoptr i64 %t8358 to ptr
  %t8360 = musttail call fastcc i64 %t8359(i64 %t8355, i64 3, i64 %a1, i64 %t8354, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8360
else1763:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8365 = icmp eq i64 %argc, 1
  br i1 %t8365, label %argok1765, label %arityerr1764
arityerr1764:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1765:
  %t8366 = load i64, ptr @"emit.internal:%make-port"
  %t8367 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8366, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8367
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8372 = icmp eq i64 %argc, 1
  br i1 %t8372, label %argok1767, label %arityerr1766
arityerr1766:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1767:
  %t8373 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8374 = load i64, ptr @"emit.internal:%port-buf"
  %t8375 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8374, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8376 = call i64 @rt_string_length(i64 %t8375)
  %t8377 = or i64 %t8376, %t8373
  %t8378 = and i64 %t8377, 7
  %t8379 = icmp eq i64 %t8378, 0
  br i1 %t8379, label %fixfast1768, label %fixslow1769
fixfast1768:
  %t8380 = icmp slt i64 %t8376, %t8373
  %t8381 = select i1 %t8380, i64 257, i64 1
  br label %fixmerge1770
fixslow1769:
  %t8382 = call i64 @rt_lt(i64 %t8376, i64 %t8373)
  br label %fixmerge1770
fixmerge1770:
  %t8383 = phi i64 [ %t8381, %fixfast1768 ], [ %t8382, %fixslow1769 ]
  %t8384 = icmp ne i64 %t8383, 1
  br i1 %t8384, label %then1771, label %else1772
then1771:
  ret i64 257
else1772:
  %t8385 = or i64 %t8373, %t8376
  %t8386 = and i64 %t8385, 7
  %t8387 = icmp eq i64 %t8386, 0
  br i1 %t8387, label %fixfast1773, label %fixslow1774
fixfast1773:
  %t8388 = icmp eq i64 %t8373, %t8376
  %t8389 = select i1 %t8388, i64 257, i64 1
  br label %fixmerge1775
fixslow1774:
  %t8390 = call i64 @rt_num_eq(i64 %t8373, i64 %t8376)
  br label %fixmerge1775
fixmerge1775:
  %t8391 = phi i64 [ %t8389, %fixfast1773 ], [ %t8390, %fixslow1774 ]
  ret i64 %t8391
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8396 = icmp eq i64 %argc, 1
  br i1 %t8396, label %argok1777, label %arityerr1776
arityerr1776:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1777:
  %t8397 = call i64 @rt_intern(ptr @.str.sym.88)
  %t8398 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8398)
  %t8399 = and i64 %t8398, -8
  %t8400 = inttoptr i64 %t8399 to ptr
  %t8401 = load i64, ptr %t8400
  %t8402 = inttoptr i64 %t8401 to ptr
  %t8403 = call fastcc i64%t8402(i64 %t8398, i64 2, i64 %a0, i64 %t8397, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8404 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8404)
  %t8405 = and i64 %t8404, -8
  %t8406 = inttoptr i64 %t8405 to ptr
  %t8407 = load i64, ptr %t8406
  %t8408 = inttoptr i64 %t8407 to ptr
  %t8409 = call fastcc i64%t8408(i64 %t8404, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8410 = icmp ne i64 %t8409, 1
  br i1 %t8410, label %then1778, label %else1779
then1778:
  %t8411 = call i64 @rt_eof_object()
  ret i64 %t8411
else1779:
  %t8412 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8413 = or i64 %t8412, 8
  %t8414 = and i64 %t8413, 7
  %t8415 = icmp eq i64 %t8414, 0
  br i1 %t8415, label %fixfast1780, label %fixslow1781
fixfast1780:
  %t8416 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8412, i64 8)
  %t8417 = extractvalue {i64, i1} %t8416, 0
  %t8418 = extractvalue {i64, i1} %t8416, 1
  br i1 %t8418, label %fixslow1781, label %fixmerge1782
fixslow1781:
  %t8419 = call i64 @rt_add(i64 %t8412, i64 8)
  br label %fixmerge1782
fixmerge1782:
  %t8420 = phi i64 [ %t8417, %fixfast1780 ], [ %t8419, %fixslow1781 ]
  %t8421 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t8420)
  %t8422 = load i64, ptr @"emit.internal:%port-buf"
  %t8423 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8422, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8424 = call i64 @rt_string_ref(i64 %t8423, i64 %t8412)
  ret i64 %t8424
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8429 = icmp eq i64 %argc, 1
  br i1 %t8429, label %argok1784, label %arityerr1783
arityerr1783:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1784:
  %t8430 = call i64 @rt_intern(ptr @.str.sym.89)
  %t8431 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8431)
  %t8432 = and i64 %t8431, -8
  %t8433 = inttoptr i64 %t8432 to ptr
  %t8434 = load i64, ptr %t8433
  %t8435 = inttoptr i64 %t8434 to ptr
  %t8436 = call fastcc i64%t8435(i64 %t8431, i64 2, i64 %a0, i64 %t8430, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8437 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8437)
  %t8438 = and i64 %t8437, -8
  %t8439 = inttoptr i64 %t8438 to ptr
  %t8440 = load i64, ptr %t8439
  %t8441 = inttoptr i64 %t8440 to ptr
  %t8442 = call fastcc i64%t8441(i64 %t8437, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8443 = icmp ne i64 %t8442, 1
  br i1 %t8443, label %then1785, label %else1786
then1785:
  %t8444 = call i64 @rt_eof_object()
  ret i64 %t8444
else1786:
  %t8445 = load i64, ptr @"emit.internal:%port-buf"
  %t8446 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8445, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8447 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8448 = call i64 @rt_string_ref(i64 %t8446, i64 %t8447)
  ret i64 %t8448
}

define fastcc i64 @"scheme.base:code_1387"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8453 = icmp eq i64 %argc, 1
  br i1 %t8453, label %argok1788, label %arityerr1787
arityerr1787:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1788:
  %t8454 = and i64 %self, -8
  %t8455 = inttoptr i64 %t8454 to ptr
  %t8456 = getelementptr i64, ptr %t8455, i64 1
  %t8457 = load i64, ptr %t8456
  %t8458 = or i64 %t8457, %a0
  %t8459 = and i64 %t8458, 7
  %t8460 = icmp eq i64 %t8459, 0
  br i1 %t8460, label %fixfast1789, label %fixslow1790
fixfast1789:
  %t8461 = icmp slt i64 %t8457, %a0
  %t8462 = select i1 %t8461, i64 257, i64 1
  br label %fixmerge1791
fixslow1790:
  %t8463 = call i64 @rt_lt(i64 %t8457, i64 %a0)
  br label %fixmerge1791
fixmerge1791:
  %t8464 = phi i64 [ %t8462, %fixfast1789 ], [ %t8463, %fixslow1790 ]
  %t8465 = icmp ne i64 %t8464, 1
  br i1 %t8465, label %then1792, label %else1793
then1792:
  br label %merge1794
else1793:
  %t8466 = or i64 %a0, %t8457
  %t8467 = and i64 %t8466, 7
  %t8468 = icmp eq i64 %t8467, 0
  br i1 %t8468, label %fixfast1795, label %fixslow1796
fixfast1795:
  %t8469 = icmp eq i64 %a0, %t8457
  %t8470 = select i1 %t8469, i64 257, i64 1
  br label %fixmerge1797
fixslow1796:
  %t8471 = call i64 @rt_num_eq(i64 %a0, i64 %t8457)
  br label %fixmerge1797
fixmerge1797:
  %t8472 = phi i64 [ %t8470, %fixfast1795 ], [ %t8471, %fixslow1796 ]
  br label %merge1794
merge1794:
  %t8473 = phi i64 [ 257, %then1792 ], [ %t8472, %fixmerge1797 ]
  %t8474 = icmp ne i64 %t8473, 1
  br i1 %t8474, label %then1798, label %else1799
then1798:
  %t8475 = and i64 %self, -8
  %t8476 = inttoptr i64 %t8475 to ptr
  %t8477 = getelementptr i64, ptr %t8476, i64 2
  %t8478 = load i64, ptr %t8477
  %t8479 = call i64 @rt_record_ref(i64 %t8478, i64 24)
  %t8480 = and i64 %self, -8
  %t8481 = inttoptr i64 %t8480 to ptr
  %t8482 = getelementptr i64, ptr %t8481, i64 2
  %t8483 = load i64, ptr %t8482
  %t8484 = and i64 %self, -8
  %t8485 = inttoptr i64 %t8484 to ptr
  %t8486 = getelementptr i64, ptr %t8485, i64 1
  %t8487 = load i64, ptr %t8486
  %t8488 = call i64 @rt_record_set(i64 %t8483, i64 24, i64 %t8487)
  %t8489 = and i64 %self, -8
  %t8490 = inttoptr i64 %t8489 to ptr
  %t8491 = getelementptr i64, ptr %t8490, i64 3
  %t8492 = load i64, ptr %t8491
  %t8493 = and i64 %self, -8
  %t8494 = inttoptr i64 %t8493 to ptr
  %t8495 = getelementptr i64, ptr %t8494, i64 1
  %t8496 = load i64, ptr %t8495
  %t8497 = call i64 @rt_substring(i64 %t8492, i64 %t8479, i64 %t8496)
  ret i64 %t8497
else1799:
  %t8498 = and i64 %self, -8
  %t8499 = inttoptr i64 %t8498 to ptr
  %t8500 = getelementptr i64, ptr %t8499, i64 3
  %t8501 = load i64, ptr %t8500
  %t8502 = call i64 @rt_string_ref(i64 %t8501, i64 %a0)
  %t8503 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t8503)
  %t8504 = and i64 %t8503, -8
  %t8505 = inttoptr i64 %t8504 to ptr
  %t8506 = load i64, ptr %t8505
  %t8507 = inttoptr i64 %t8506 to ptr
  %t8508 = call fastcc i64%t8507(i64 %t8503, i64 2, i64 %t8502, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8509 = icmp ne i64 %t8508, 1
  br i1 %t8509, label %then1800, label %else1801
then1800:
  %t8510 = and i64 %self, -8
  %t8511 = inttoptr i64 %t8510 to ptr
  %t8512 = getelementptr i64, ptr %t8511, i64 2
  %t8513 = load i64, ptr %t8512
  %t8514 = call i64 @rt_record_ref(i64 %t8513, i64 24)
  %t8515 = and i64 %self, -8
  %t8516 = inttoptr i64 %t8515 to ptr
  %t8517 = getelementptr i64, ptr %t8516, i64 2
  %t8518 = load i64, ptr %t8517
  %t8519 = or i64 %a0, 8
  %t8520 = and i64 %t8519, 7
  %t8521 = icmp eq i64 %t8520, 0
  br i1 %t8521, label %fixfast1802, label %fixslow1803
fixfast1802:
  %t8522 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8523 = extractvalue {i64, i1} %t8522, 0
  %t8524 = extractvalue {i64, i1} %t8522, 1
  br i1 %t8524, label %fixslow1803, label %fixmerge1804
fixslow1803:
  %t8525 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1804
fixmerge1804:
  %t8526 = phi i64 [ %t8523, %fixfast1802 ], [ %t8525, %fixslow1803 ]
  %t8527 = call i64 @rt_record_set(i64 %t8518, i64 24, i64 %t8526)
  %t8528 = and i64 %self, -8
  %t8529 = inttoptr i64 %t8528 to ptr
  %t8530 = getelementptr i64, ptr %t8529, i64 3
  %t8531 = load i64, ptr %t8530
  %t8532 = call i64 @rt_substring(i64 %t8531, i64 %t8514, i64 %a0)
  ret i64 %t8532
else1801:
  %t8533 = or i64 %a0, 8
  %t8534 = and i64 %t8533, 7
  %t8535 = icmp eq i64 %t8534, 0
  br i1 %t8535, label %fixfast1805, label %fixslow1806
fixfast1805:
  %t8536 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8537 = extractvalue {i64, i1} %t8536, 0
  %t8538 = extractvalue {i64, i1} %t8536, 1
  br i1 %t8538, label %fixslow1806, label %fixmerge1807
fixslow1806:
  %t8539 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1807
fixmerge1807:
  %t8540 = phi i64 [ %t8537, %fixfast1805 ], [ %t8539, %fixslow1806 ]
  %t8541 = musttail call fastcc i64 @"scheme.base:code_1387"(i64 %self, i64 1, i64 %t8540, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8541
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8542 = icmp eq i64 %argc, 1
  br i1 %t8542, label %argok1809, label %arityerr1808
arityerr1808:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1809:
  %t8543 = call i64 @rt_intern(ptr @.str.sym.90)
  %t8544 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8544)
  %t8545 = and i64 %t8544, -8
  %t8546 = inttoptr i64 %t8545 to ptr
  %t8547 = load i64, ptr %t8546
  %t8548 = inttoptr i64 %t8547 to ptr
  %t8549 = call fastcc i64%t8548(i64 %t8544, i64 2, i64 %a0, i64 %t8543, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8550 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8550)
  %t8551 = and i64 %t8550, -8
  %t8552 = inttoptr i64 %t8551 to ptr
  %t8553 = load i64, ptr %t8552
  %t8554 = inttoptr i64 %t8553 to ptr
  %t8555 = call fastcc i64%t8554(i64 %t8550, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8556 = icmp ne i64 %t8555, 1
  br i1 %t8556, label %then1810, label %else1811
then1810:
  %t8557 = call i64 @rt_eof_object()
  ret i64 %t8557
else1811:
  %t8558 = load i64, ptr @"emit.internal:%port-buf"
  %t8559 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8558, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8560 = call i64 @rt_string_length(i64 %t8559)
  %t8561 = call ptr @rt_alloc_words(i64 5)
  %t8562 = ptrtoint ptr %t8561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1387" to i64), ptr %t8561
  %t8563 = or i64 %t8562, 4
  %t8564 = getelementptr i64, ptr %t8561, i64 1
  store i64 %t8560, ptr %t8564
  %t8565 = getelementptr i64, ptr %t8561, i64 2
  store i64 %a0, ptr %t8565
  %t8566 = getelementptr i64, ptr %t8561, i64 3
  store i64 %t8559, ptr %t8566
  %t8567 = getelementptr i64, ptr %t8561, i64 4
  store i64 %t8563, ptr %t8567
  %t8568 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8569 = musttail call fastcc i64 @"scheme.base:code_1387"(i64 %t8563, i64 1, i64 %t8568, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8569
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8574 = icmp eq i64 %argc, 2
  br i1 %t8574, label %argok1813, label %arityerr1812
arityerr1812:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1813:
  %t8575 = call i64 @rt_intern(ptr @.str.sym.91)
  %t8576 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8576)
  %t8577 = and i64 %t8576, -8
  %t8578 = inttoptr i64 %t8577 to ptr
  %t8579 = load i64, ptr %t8578
  %t8580 = inttoptr i64 %t8579 to ptr
  %t8581 = call fastcc i64%t8580(i64 %t8576, i64 2, i64 %a1, i64 %t8575, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8582 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8582)
  %t8583 = and i64 %t8582, -8
  %t8584 = inttoptr i64 %t8583 to ptr
  %t8585 = load i64, ptr %t8584
  %t8586 = inttoptr i64 %t8585 to ptr
  %t8587 = call fastcc i64%t8586(i64 %t8582, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8588 = icmp ne i64 %t8587, 1
  br i1 %t8588, label %then1814, label %else1815
then1814:
  %t8589 = call i64 @rt_eof_object()
  ret i64 %t8589
else1815:
  %t8590 = load i64, ptr @"emit.internal:%port-buf"
  %t8591 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8590, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8592 = call i64 @rt_string_length(i64 %t8591)
  %t8593 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t8594 = or i64 %t8593, %a0
  %t8595 = and i64 %t8594, 7
  %t8596 = icmp eq i64 %t8595, 0
  br i1 %t8596, label %fixfast1816, label %fixslow1817
fixfast1816:
  %t8597 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8593, i64 %a0)
  %t8598 = extractvalue {i64, i1} %t8597, 0
  %t8599 = extractvalue {i64, i1} %t8597, 1
  br i1 %t8599, label %fixslow1817, label %fixmerge1818
fixslow1817:
  %t8600 = call i64 @rt_add(i64 %t8593, i64 %a0)
  br label %fixmerge1818
fixmerge1818:
  %t8601 = phi i64 [ %t8598, %fixfast1816 ], [ %t8600, %fixslow1817 ]
  %t8602 = or i64 %t8592, %t8601
  %t8603 = and i64 %t8602, 7
  %t8604 = icmp eq i64 %t8603, 0
  br i1 %t8604, label %fixfast1819, label %fixslow1820
fixfast1819:
  %t8605 = icmp slt i64 %t8592, %t8601
  %t8606 = select i1 %t8605, i64 257, i64 1
  br label %fixmerge1821
fixslow1820:
  %t8607 = call i64 @rt_lt(i64 %t8592, i64 %t8601)
  br label %fixmerge1821
fixmerge1821:
  %t8608 = phi i64 [ %t8606, %fixfast1819 ], [ %t8607, %fixslow1820 ]
  %t8609 = icmp ne i64 %t8608, 1
  br i1 %t8609, label %then1822, label %else1823
then1822:
  br label %merge1824
else1823:
  %t8610 = or i64 %t8593, %a0
  %t8611 = and i64 %t8610, 7
  %t8612 = icmp eq i64 %t8611, 0
  br i1 %t8612, label %fixfast1825, label %fixslow1826
fixfast1825:
  %t8613 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8593, i64 %a0)
  %t8614 = extractvalue {i64, i1} %t8613, 0
  %t8615 = extractvalue {i64, i1} %t8613, 1
  br i1 %t8615, label %fixslow1826, label %fixmerge1827
fixslow1826:
  %t8616 = call i64 @rt_add(i64 %t8593, i64 %a0)
  br label %fixmerge1827
fixmerge1827:
  %t8617 = phi i64 [ %t8614, %fixfast1825 ], [ %t8616, %fixslow1826 ]
  br label %merge1824
merge1824:
  %t8618 = phi i64 [ %t8592, %then1822 ], [ %t8617, %fixmerge1827 ]
  %t8619 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t8618)
  %t8620 = call i64 @rt_substring(i64 %t8591, i64 %t8593, i64 %t8618)
  ret i64 %t8620
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8625 = icmp eq i64 %argc, 0
  br i1 %t8625, label %argok1829, label %arityerr1828
arityerr1828:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1829:
  %t8626 = call i64 @rt_port_open_output_string()
  %t8627 = icmp ne i64 %t8626, 1
  br i1 %t8627, label %then1830, label %else1831
then1830:
  %t8628 = load i64, ptr @"emit.internal:%make-port"
  %t8629 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8628, i64 6, i64 %t8626, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8629
else1831:
  %t8630 = call i64 @rt_intern(ptr @.str.sym.92)
  %t8631 = call i64 @rt_make_string(ptr @.str.lit.93, i64 33)
  %t8632 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8632)
  %t8633 = and i64 %t8632, -8
  %t8634 = inttoptr i64 %t8633 to ptr
  %t8635 = load i64, ptr %t8634
  %t8636 = inttoptr i64 %t8635 to ptr
  %t8637 = musttail call fastcc i64 %t8636(i64 %t8632, i64 2, i64 %t8630, i64 %t8631, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8637
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8642 = icmp eq i64 %argc, 1
  br i1 %t8642, label %argok1833, label %arityerr1832
arityerr1832:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1833:
  %t8643 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8643)
  %t8644 = and i64 %t8643, -8
  %t8645 = inttoptr i64 %t8644 to ptr
  %t8646 = load i64, ptr %t8645
  %t8647 = inttoptr i64 %t8646 to ptr
  %t8648 = call fastcc i64%t8647(i64 %t8643, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8649 = call i64 @rt_not(i64 %t8648)
  %t8650 = icmp ne i64 %t8649, 1
  br i1 %t8650, label %then1834, label %else1835
then1834:
  %t8651 = call i64 @rt_intern(ptr @.str.sym.94)
  %t8652 = call i64 @rt_make_string(ptr @.str.lit.95, i64 18)
  %t8653 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8653)
  %t8654 = and i64 %t8653, -8
  %t8655 = inttoptr i64 %t8654 to ptr
  %t8656 = load i64, ptr %t8655
  %t8657 = inttoptr i64 %t8656 to ptr
  %t8658 = musttail call fastcc i64 %t8657(i64 %t8653, i64 3, i64 %t8651, i64 %t8652, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8658
else1835:
  %t8659 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t8660 = call i64 @rt_not(i64 %t8659)
  %t8661 = icmp ne i64 %t8660, 1
  br i1 %t8661, label %then1836, label %else1837
then1836:
  %t8662 = call i64 @rt_intern(ptr @.str.sym.94)
  %t8663 = call i64 @rt_make_string(ptr @.str.lit.96, i64 17)
  %t8664 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8664)
  %t8665 = and i64 %t8664, -8
  %t8666 = inttoptr i64 %t8665 to ptr
  %t8667 = load i64, ptr %t8666
  %t8668 = inttoptr i64 %t8667 to ptr
  %t8669 = musttail call fastcc i64 %t8668(i64 %t8664, i64 3, i64 %t8662, i64 %t8663, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8669
else1837:
  %t8670 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8671 = call i64 @rt_port_get_output_string(i64 %t8670)
  ret i64 %t8671
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8676 = icmp eq i64 %argc, 1
  br i1 %t8676, label %argok1839, label %arityerr1838
arityerr1838:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1839:
  %t8677 = call i64 @rt_intern(ptr @.str.sym.97)
  %t8678 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t8678)
  %t8679 = and i64 %t8678, -8
  %t8680 = inttoptr i64 %t8679 to ptr
  %t8681 = load i64, ptr %t8680
  %t8682 = inttoptr i64 %t8681 to ptr
  %t8683 = call fastcc i64%t8682(i64 %t8678, i64 2, i64 %a0, i64 %t8677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8684 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8685 = call i64 @rt_port_flush(i64 %t8684)
  ret i64 %t8685
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8690 = icmp eq i64 %argc, 1
  br i1 %t8690, label %argok1841, label %arityerr1840
arityerr1840:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1841:
  %t8691 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8691)
  %t8692 = and i64 %t8691, -8
  %t8693 = inttoptr i64 %t8692 to ptr
  %t8694 = load i64, ptr %t8693
  %t8695 = inttoptr i64 %t8694 to ptr
  %t8696 = call fastcc i64%t8695(i64 %t8691, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8697 = call i64 @rt_not(i64 %t8696)
  %t8698 = icmp ne i64 %t8697, 1
  br i1 %t8698, label %then1842, label %else1843
then1842:
  %t8699 = call i64 @rt_intern(ptr @.str.sym.98)
  %t8700 = call i64 @rt_make_string(ptr @.str.lit.99, i64 10)
  %t8701 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8701)
  %t8702 = and i64 %t8701, -8
  %t8703 = inttoptr i64 %t8702 to ptr
  %t8704 = load i64, ptr %t8703
  %t8705 = inttoptr i64 %t8704 to ptr
  %t8706 = musttail call fastcc i64 %t8705(i64 %t8701, i64 3, i64 %t8699, i64 %t8700, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8706
else1843:
  %t8707 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8708 = icmp ne i64 %t8707, 1
  br i1 %t8708, label %then1844, label %else1845
then1844:
  %t8709 = icmp ne i64 1, 1
  br i1 %t8709, label %then1846, label %else1847
then1846:
  ret i64 1
else1847:
  ret i64 17
else1845:
  %t8710 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8711 = call i64 @rt_not(i64 %t8710)
  %t8712 = icmp ne i64 %t8711, 1
  br i1 %t8712, label %then1848, label %else1849
then1848:
  %t8713 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8714 = call i64 @rt_port_close(i64 %t8713)
  br label %merge1850
else1849:
  br label %merge1850
merge1850:
  %t8715 = phi i64 [ %t8714, %then1848 ], [ 17, %else1849 ]
  %t8716 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t8717 = icmp ne i64 1, 1
  br i1 %t8717, label %then1851, label %else1852
then1851:
  ret i64 1
else1852:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8722 = icmp eq i64 %argc, 1
  br i1 %t8722, label %argok1854, label %arityerr1853
arityerr1853:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1854:
  %t8723 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8723)
  %t8724 = and i64 %t8723, -8
  %t8725 = inttoptr i64 %t8724 to ptr
  %t8726 = load i64, ptr %t8725
  %t8727 = inttoptr i64 %t8726 to ptr
  %t8728 = call fastcc i64%t8727(i64 %t8723, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8729 = icmp ne i64 %t8728, 1
  br i1 %t8729, label %then1855, label %else1856
then1855:
  %t8730 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8730)
  %t8731 = and i64 %t8730, -8
  %t8732 = inttoptr i64 %t8731 to ptr
  %t8733 = load i64, ptr %t8732
  %t8734 = inttoptr i64 %t8733 to ptr
  %t8735 = musttail call fastcc i64 %t8734(i64 %t8730, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8735
else1856:
  %t8736 = call i64 @rt_intern(ptr @.str.sym.100)
  %t8737 = call i64 @rt_make_string(ptr @.str.lit.101, i64 17)
  %t8738 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8738)
  %t8739 = and i64 %t8738, -8
  %t8740 = inttoptr i64 %t8739 to ptr
  %t8741 = load i64, ptr %t8740
  %t8742 = inttoptr i64 %t8741 to ptr
  %t8743 = musttail call fastcc i64 %t8742(i64 %t8738, i64 3, i64 %t8736, i64 %t8737, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8743
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8748 = icmp eq i64 %argc, 1
  br i1 %t8748, label %argok1858, label %arityerr1857
arityerr1857:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1858:
  %t8749 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8749)
  %t8750 = and i64 %t8749, -8
  %t8751 = inttoptr i64 %t8750 to ptr
  %t8752 = load i64, ptr %t8751
  %t8753 = inttoptr i64 %t8752 to ptr
  %t8754 = call fastcc i64%t8753(i64 %t8749, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8755 = icmp ne i64 %t8754, 1
  br i1 %t8755, label %then1859, label %else1860
then1859:
  %t8756 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8756)
  %t8757 = and i64 %t8756, -8
  %t8758 = inttoptr i64 %t8757 to ptr
  %t8759 = load i64, ptr %t8758
  %t8760 = inttoptr i64 %t8759 to ptr
  %t8761 = musttail call fastcc i64 %t8760(i64 %t8756, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8761
else1860:
  %t8762 = call i64 @rt_intern(ptr @.str.sym.102)
  %t8763 = call i64 @rt_make_string(ptr @.str.lit.103, i64 18)
  %t8764 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8764)
  %t8765 = and i64 %t8764, -8
  %t8766 = inttoptr i64 %t8765 to ptr
  %t8767 = load i64, ptr %t8766
  %t8768 = inttoptr i64 %t8767 to ptr
  %t8769 = musttail call fastcc i64 %t8768(i64 %t8764, i64 3, i64 %t8762, i64 %t8763, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8769
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8777 = icmp sge i64 %argc, 0
  br i1 %t8777, label %argok1862, label %arityerr1861
arityerr1861:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1862:
  %t8778 = call ptr @rt_alloc_words(i64 8)
  %t8779 = getelementptr i64, ptr %t8778, i64 0
  store i64 %a0, ptr %t8779
  %t8780 = getelementptr i64, ptr %t8778, i64 1
  store i64 %a1, ptr %t8780
  %t8781 = getelementptr i64, ptr %t8778, i64 2
  store i64 %a2, ptr %t8781
  %t8782 = getelementptr i64, ptr %t8778, i64 3
  store i64 %a3, ptr %t8782
  %t8783 = getelementptr i64, ptr %t8778, i64 4
  store i64 %a4, ptr %t8783
  %t8784 = getelementptr i64, ptr %t8778, i64 5
  store i64 %a5, ptr %t8784
  %t8785 = getelementptr i64, ptr %t8778, i64 6
  store i64 %a6, ptr %t8785
  %t8786 = getelementptr i64, ptr %t8778, i64 7
  store i64 %a7, ptr %t8786
  %t8787 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8778, ptr %overflow)
  %t8788 = call i64 @rt_null_p(i64 %t8787)
  %t8789 = icmp ne i64 %t8788, 1
  br i1 %t8789, label %then1863, label %else1864
then1863:
  %t8790 = load i64, ptr @"scheme.base:%stdout-port"
  %t8791 = call i64 @rt_not(i64 %t8790)
  %t8792 = icmp ne i64 %t8791, 1
  br i1 %t8792, label %then1865, label %else1866
then1865:
  %t8793 = load i64, ptr @"emit.internal:%make-port"
  %t8794 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8793, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8795 = call i64 @rt_root(i64 %t8794)
  store i64 %t8795, ptr @"scheme.base:%stdout-port"
  %t8796 = call i64 @rt_set_current_output(i64 0)
  br label %merge1867
else1866:
  br label %merge1867
merge1867:
  %t8797 = phi i64 [ %t8796, %then1865 ], [ 17, %else1866 ]
  %t8798 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8798
else1864:
  %t8799 = call i64 @rt_car(i64 %t8787)
  %t8800 = call i64 @rt_root(i64 %t8799)
  store i64 %t8800, ptr @"scheme.base:%stdout-port"
  %t8801 = call i64 @rt_record_ref(i64 %t8799, i64 0)
  %t8802 = call i64 @rt_set_current_output(i64 %t8801)
  %t8803 = icmp ne i64 1, 1
  br i1 %t8803, label %then1868, label %else1869
then1868:
  ret i64 1
else1869:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8804 = call i64 @rt_null_p(i64 2)
  %t8805 = icmp ne i64 %t8804, 1
  br i1 %t8805, label %then1870, label %else1871
then1870:
  %t8806 = load i64, ptr @"scheme.base:%stdout-port"
  %t8807 = call i64 @rt_not(i64 %t8806)
  %t8808 = icmp ne i64 %t8807, 1
  br i1 %t8808, label %then1872, label %else1873
then1872:
  %t8809 = load i64, ptr @"emit.internal:%make-port"
  %t8810 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8809, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8811 = call i64 @rt_root(i64 %t8810)
  store i64 %t8811, ptr @"scheme.base:%stdout-port"
  %t8812 = call i64 @rt_set_current_output(i64 0)
  br label %merge1874
else1873:
  br label %merge1874
merge1874:
  %t8813 = phi i64 [ %t8812, %then1872 ], [ 17, %else1873 ]
  %t8814 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8814
else1871:
  %t8815 = call i64 @rt_car(i64 2)
  %t8816 = call i64 @rt_root(i64 %t8815)
  store i64 %t8816, ptr @"scheme.base:%stdout-port"
  %t8817 = call i64 @rt_record_ref(i64 %t8815, i64 0)
  %t8818 = call i64 @rt_set_current_output(i64 %t8817)
  %t8819 = icmp ne i64 1, 1
  br i1 %t8819, label %then1875, label %else1876
then1875:
  ret i64 1
else1876:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8824 = icmp sge i64 %argc, 0
  br i1 %t8824, label %argok1878, label %arityerr1877
arityerr1877:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1878:
  %t8825 = call ptr @rt_alloc_words(i64 8)
  %t8826 = getelementptr i64, ptr %t8825, i64 0
  store i64 %a0, ptr %t8826
  %t8827 = getelementptr i64, ptr %t8825, i64 1
  store i64 %a1, ptr %t8827
  %t8828 = getelementptr i64, ptr %t8825, i64 2
  store i64 %a2, ptr %t8828
  %t8829 = getelementptr i64, ptr %t8825, i64 3
  store i64 %a3, ptr %t8829
  %t8830 = getelementptr i64, ptr %t8825, i64 4
  store i64 %a4, ptr %t8830
  %t8831 = getelementptr i64, ptr %t8825, i64 5
  store i64 %a5, ptr %t8831
  %t8832 = getelementptr i64, ptr %t8825, i64 6
  store i64 %a6, ptr %t8832
  %t8833 = getelementptr i64, ptr %t8825, i64 7
  store i64 %a7, ptr %t8833
  %t8834 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8825, ptr %overflow)
  %t8835 = call i64 @rt_null_p(i64 %t8834)
  %t8836 = icmp ne i64 %t8835, 1
  br i1 %t8836, label %then1879, label %else1880
then1879:
  %t8837 = load i64, ptr @"scheme.base:%stderr-port"
  %t8838 = call i64 @rt_not(i64 %t8837)
  %t8839 = icmp ne i64 %t8838, 1
  br i1 %t8839, label %then1881, label %else1882
then1881:
  %t8840 = load i64, ptr @"emit.internal:%make-port"
  %t8841 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8840, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8842 = call i64 @rt_root(i64 %t8841)
  store i64 %t8842, ptr @"scheme.base:%stderr-port"
  br label %merge1883
else1882:
  br label %merge1883
merge1883:
  %t8843 = phi i64 [ 17, %then1881 ], [ 17, %else1882 ]
  %t8844 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8844
else1880:
  %t8845 = call i64 @rt_car(i64 %t8834)
  %t8846 = call i64 @rt_root(i64 %t8845)
  store i64 %t8846, ptr @"scheme.base:%stderr-port"
  %t8847 = icmp ne i64 1, 1
  br i1 %t8847, label %then1884, label %else1885
then1884:
  ret i64 1
else1885:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8848 = call i64 @rt_null_p(i64 2)
  %t8849 = icmp ne i64 %t8848, 1
  br i1 %t8849, label %then1886, label %else1887
then1886:
  %t8850 = load i64, ptr @"scheme.base:%stderr-port"
  %t8851 = call i64 @rt_not(i64 %t8850)
  %t8852 = icmp ne i64 %t8851, 1
  br i1 %t8852, label %then1888, label %else1889
then1888:
  %t8853 = load i64, ptr @"emit.internal:%make-port"
  %t8854 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8853, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8855 = call i64 @rt_root(i64 %t8854)
  store i64 %t8855, ptr @"scheme.base:%stderr-port"
  br label %merge1890
else1889:
  br label %merge1890
merge1890:
  %t8856 = phi i64 [ 17, %then1888 ], [ 17, %else1889 ]
  %t8857 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8857
else1887:
  %t8858 = call i64 @rt_car(i64 2)
  %t8859 = call i64 @rt_root(i64 %t8858)
  store i64 %t8859, ptr @"scheme.base:%stderr-port"
  %t8860 = icmp ne i64 1, 1
  br i1 %t8860, label %then1891, label %else1892
then1891:
  ret i64 1
else1892:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8865 = icmp sge i64 %argc, 0
  br i1 %t8865, label %argok1894, label %arityerr1893
arityerr1893:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1894:
  %t8866 = call ptr @rt_alloc_words(i64 8)
  %t8867 = getelementptr i64, ptr %t8866, i64 0
  store i64 %a0, ptr %t8867
  %t8868 = getelementptr i64, ptr %t8866, i64 1
  store i64 %a1, ptr %t8868
  %t8869 = getelementptr i64, ptr %t8866, i64 2
  store i64 %a2, ptr %t8869
  %t8870 = getelementptr i64, ptr %t8866, i64 3
  store i64 %a3, ptr %t8870
  %t8871 = getelementptr i64, ptr %t8866, i64 4
  store i64 %a4, ptr %t8871
  %t8872 = getelementptr i64, ptr %t8866, i64 5
  store i64 %a5, ptr %t8872
  %t8873 = getelementptr i64, ptr %t8866, i64 6
  store i64 %a6, ptr %t8873
  %t8874 = getelementptr i64, ptr %t8866, i64 7
  store i64 %a7, ptr %t8874
  %t8875 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8866, ptr %overflow)
  %t8876 = call i64 @rt_null_p(i64 %t8875)
  %t8877 = icmp ne i64 %t8876, 1
  br i1 %t8877, label %then1895, label %else1896
then1895:
  %t8878 = load i64, ptr @"scheme.base:%stdin-port"
  %t8879 = call i64 @rt_not(i64 %t8878)
  %t8880 = icmp ne i64 %t8879, 1
  br i1 %t8880, label %then1897, label %else1898
then1897:
  %t8881 = load i64, ptr @"emit.internal:%make-port"
  %t8882 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8881, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8883 = call i64 @rt_root(i64 %t8882)
  store i64 %t8883, ptr @"scheme.base:%stdin-port"
  br label %merge1899
else1898:
  br label %merge1899
merge1899:
  %t8884 = phi i64 [ 17, %then1897 ], [ 17, %else1898 ]
  %t8885 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8885
else1896:
  %t8886 = call i64 @rt_car(i64 %t8875)
  %t8887 = call i64 @rt_root(i64 %t8886)
  store i64 %t8887, ptr @"scheme.base:%stdin-port"
  %t8888 = icmp ne i64 1, 1
  br i1 %t8888, label %then1900, label %else1901
then1900:
  ret i64 1
else1901:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8889 = call i64 @rt_null_p(i64 2)
  %t8890 = icmp ne i64 %t8889, 1
  br i1 %t8890, label %then1902, label %else1903
then1902:
  %t8891 = load i64, ptr @"scheme.base:%stdin-port"
  %t8892 = call i64 @rt_not(i64 %t8891)
  %t8893 = icmp ne i64 %t8892, 1
  br i1 %t8893, label %then1904, label %else1905
then1904:
  %t8894 = load i64, ptr @"emit.internal:%make-port"
  %t8895 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8894, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8896 = call i64 @rt_root(i64 %t8895)
  store i64 %t8896, ptr @"scheme.base:%stdin-port"
  br label %merge1906
else1905:
  br label %merge1906
merge1906:
  %t8897 = phi i64 [ 17, %then1904 ], [ 17, %else1905 ]
  %t8898 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8898
else1903:
  %t8899 = call i64 @rt_car(i64 2)
  %t8900 = call i64 @rt_root(i64 %t8899)
  store i64 %t8900, ptr @"scheme.base:%stdin-port"
  %t8901 = icmp ne i64 1, 1
  br i1 %t8901, label %then1907, label %else1908
then1907:
  ret i64 1
else1908:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1420"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8906 = icmp eq i64 %argc, 0
  br i1 %t8906, label %argok1910, label %arityerr1909
arityerr1909:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1910:
  %t8907 = icmp ne i64 1, 1
  br i1 %t8907, label %then1911, label %else1912
then1911:
  ret i64 1
else1912:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1422"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8908 = icmp eq i64 %argc, 0
  br i1 %t8908, label %argok1914, label %arityerr1913
arityerr1913:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1914:
  %t8909 = and i64 %self, -8
  %t8910 = inttoptr i64 %t8909 to ptr
  %t8911 = getelementptr i64, ptr %t8910, i64 2
  %t8912 = load i64, ptr %t8911
  %t8913 = and i64 %self, -8
  %t8914 = inttoptr i64 %t8913 to ptr
  %t8915 = getelementptr i64, ptr %t8914, i64 1
  %t8916 = load i64, ptr %t8915
  call void @rt_check_callable(i64 %t8916)
  %t8917 = and i64 %t8916, -8
  %t8918 = inttoptr i64 %t8917 to ptr
  %t8919 = load i64, ptr %t8918
  %t8920 = inttoptr i64 %t8919 to ptr
  %t8921 = musttail call fastcc i64 %t8920(i64 %t8916, i64 1, i64 %t8912, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8921
}

define fastcc i64 @"scheme.base:code_1424"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8922 = icmp eq i64 %argc, 0
  br i1 %t8922, label %argok1916, label %arityerr1915
arityerr1915:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1916:
  %t8923 = and i64 %self, -8
  %t8924 = inttoptr i64 %t8923 to ptr
  %t8925 = getelementptr i64, ptr %t8924, i64 1
  %t8926 = load i64, ptr %t8925
  %t8927 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8927)
  %t8928 = and i64 %t8927, -8
  %t8929 = inttoptr i64 %t8928 to ptr
  %t8930 = load i64, ptr %t8929
  %t8931 = inttoptr i64 %t8930 to ptr
  %t8932 = musttail call fastcc i64 %t8931(i64 %t8927, i64 1, i64 %t8926, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8932
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8933 = icmp eq i64 %argc, 2
  br i1 %t8933, label %argok1918, label %arityerr1917
arityerr1917:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1918:
  %t8934 = call ptr @rt_alloc_words(i64 1)
  %t8935 = ptrtoint ptr %t8934 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1420" to i64), ptr %t8934
  %t8936 = or i64 %t8935, 4
  %t8937 = call ptr @rt_alloc_words(i64 3)
  %t8938 = ptrtoint ptr %t8937 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1422" to i64), ptr %t8937
  %t8939 = getelementptr i64, ptr %t8937, i64 1
  store i64 %a1, ptr %t8939
  %t8940 = getelementptr i64, ptr %t8937, i64 2
  store i64 %a0, ptr %t8940
  %t8941 = or i64 %t8938, 4
  %t8942 = call ptr @rt_alloc_words(i64 2)
  %t8943 = ptrtoint ptr %t8942 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1424" to i64), ptr %t8942
  %t8944 = getelementptr i64, ptr %t8942, i64 1
  store i64 %a0, ptr %t8944
  %t8945 = or i64 %t8943, 4
  %t8946 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t8946)
  %t8947 = and i64 %t8946, -8
  %t8948 = inttoptr i64 %t8947 to ptr
  %t8949 = load i64, ptr %t8948
  %t8950 = inttoptr i64 %t8949 to ptr
  %t8951 = musttail call fastcc i64 %t8950(i64 %t8946, i64 3, i64 %t8936, i64 %t8941, i64 %t8945, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8951
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
  %t581 = call ptr @rt_alloc_words(i64 1)
  %t582 = ptrtoint ptr %t581 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t581
  %t583 = or i64 %t582, 4
  %t584 = call i64 @rt_root(i64 %t583)
  store i64 %t584, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t602 = call ptr @rt_alloc_words(i64 1)
  %t603 = ptrtoint ptr %t602 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t602
  %t604 = or i64 %t603, 4
  %t605 = call i64 @rt_root(i64 %t604)
  store i64 %t605, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t670 = call ptr @rt_alloc_words(i64 1)
  %t671 = ptrtoint ptr %t670 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t670
  %t672 = or i64 %t671, 4
  %t673 = call i64 @rt_root(i64 %t672)
  store i64 %t673, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t715 = call ptr @rt_alloc_words(i64 1)
  %t716 = ptrtoint ptr %t715 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t715
  %t717 = or i64 %t716, 4
  %t718 = call i64 @rt_root(i64 %t717)
  store i64 %t718, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t736 = call ptr @rt_alloc_words(i64 1)
  %t737 = ptrtoint ptr %t736 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t736
  %t738 = or i64 %t737, 4
  %t739 = call i64 @rt_root(i64 %t738)
  store i64 %t739, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t757 = call ptr @rt_alloc_words(i64 1)
  %t758 = ptrtoint ptr %t757 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t757
  %t759 = or i64 %t758, 4
  %t760 = call i64 @rt_root(i64 %t759)
  store i64 %t760, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t784 = call ptr @rt_alloc_words(i64 1)
  %t785 = ptrtoint ptr %t784 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t784
  %t786 = or i64 %t785, 4
  %t787 = call i64 @rt_root(i64 %t786)
  store i64 %t787, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t796 = call ptr @rt_alloc_words(i64 1)
  %t797 = ptrtoint ptr %t796 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t796
  %t798 = or i64 %t797, 4
  %t799 = call i64 @rt_root(i64 %t798)
  store i64 %t799, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t823 = call ptr @rt_alloc_words(i64 1)
  %t824 = ptrtoint ptr %t823 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t823
  %t825 = or i64 %t824, 4
  %t826 = call i64 @rt_root(i64 %t825)
  store i64 %t826, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t835 = call ptr @rt_alloc_words(i64 1)
  %t836 = ptrtoint ptr %t835 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t835
  %t837 = or i64 %t836, 4
  %t838 = call i64 @rt_root(i64 %t837)
  store i64 %t838, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t847 = call ptr @rt_alloc_words(i64 1)
  %t848 = ptrtoint ptr %t847 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-set!" to i64), ptr %t847
  %t849 = or i64 %t848, 4
  %t850 = call i64 @rt_root(i64 %t849)
  store i64 %t850, ptr @"scheme.base:list-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t876 = call ptr @rt_alloc_words(i64 1)
  %t877 = ptrtoint ptr %t876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t876
  %t878 = or i64 %t877, 4
  %t879 = call i64 @rt_root(i64 %t878)
  store i64 %t879, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t903 = call ptr @rt_alloc_words(i64 1)
  %t904 = ptrtoint ptr %t903 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t903
  %t905 = or i64 %t904, 4
  %t906 = call i64 @rt_root(i64 %t905)
  store i64 %t906, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t929 = call ptr @rt_alloc_words(i64 1)
  %t930 = ptrtoint ptr %t929 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t929
  %t931 = or i64 %t930, 4
  %t932 = call i64 @rt_root(i64 %t931)
  store i64 %t932, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t941 = call ptr @rt_alloc_words(i64 1)
  %t942 = ptrtoint ptr %t941 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t941
  %t943 = or i64 %t942, 4
  %t944 = call i64 @rt_root(i64 %t943)
  store i64 %t944, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t983 = call ptr @rt_alloc_words(i64 1)
  %t984 = ptrtoint ptr %t983 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t983
  %t985 = or i64 %t984, 4
  %t986 = call i64 @rt_root(i64 %t985)
  store i64 %t986, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t1025 = call ptr @rt_alloc_words(i64 1)
  %t1026 = ptrtoint ptr %t1025 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t1025
  %t1027 = or i64 %t1026, 4
  %t1028 = call i64 @rt_root(i64 %t1027)
  store i64 %t1028, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t1031 = call ptr @rt_alloc_words(i64 1)
  %t1032 = ptrtoint ptr %t1031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t1031
  %t1033 = or i64 %t1032, 4
  %t1034 = call i64 @rt_root(i64 %t1033)
  store i64 %t1034, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t1039 = call ptr @rt_alloc_words(i64 1)
  %t1040 = ptrtoint ptr %t1039 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t1039
  %t1041 = or i64 %t1040, 4
  %t1042 = call i64 @rt_root(i64 %t1041)
  store i64 %t1042, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t1047 = call ptr @rt_alloc_words(i64 1)
  %t1048 = ptrtoint ptr %t1047 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t1047
  %t1049 = or i64 %t1048, 4
  %t1050 = call i64 @rt_root(i64 %t1049)
  store i64 %t1050, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t1059 = call ptr @rt_alloc_words(i64 1)
  %t1060 = ptrtoint ptr %t1059 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t1059
  %t1061 = or i64 %t1060, 4
  %t1062 = call i64 @rt_root(i64 %t1061)
  store i64 %t1062, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t1071 = call ptr @rt_alloc_words(i64 1)
  %t1072 = ptrtoint ptr %t1071 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t1071
  %t1073 = or i64 %t1072, 4
  %t1074 = call i64 @rt_root(i64 %t1073)
  store i64 %t1074, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t1084 = call ptr @rt_alloc_words(i64 1)
  %t1085 = ptrtoint ptr %t1084 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t1084
  %t1086 = or i64 %t1085, 4
  %t1087 = call i64 @rt_root(i64 %t1086)
  store i64 %t1087, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t1098 = call ptr @rt_alloc_words(i64 1)
  %t1099 = ptrtoint ptr %t1098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t1098
  %t1100 = or i64 %t1099, 4
  %t1101 = call i64 @rt_root(i64 %t1100)
  store i64 %t1101, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t1119 = call ptr @rt_alloc_words(i64 1)
  %t1120 = ptrtoint ptr %t1119 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t1119
  %t1121 = or i64 %t1120, 4
  %t1122 = call i64 @rt_root(i64 %t1121)
  store i64 %t1122, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t1133 = call ptr @rt_alloc_words(i64 1)
  %t1134 = ptrtoint ptr %t1133 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t1133
  %t1135 = or i64 %t1134, 4
  %t1136 = call i64 @rt_root(i64 %t1135)
  store i64 %t1136, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t1153 = call ptr @rt_alloc_words(i64 1)
  %t1154 = ptrtoint ptr %t1153 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1153
  %t1155 = or i64 %t1154, 4
  %t1156 = call i64 @rt_root(i64 %t1155)
  store i64 %t1156, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1186 = call ptr @rt_alloc_words(i64 1)
  %t1187 = ptrtoint ptr %t1186 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1186
  %t1188 = or i64 %t1187, 4
  %t1189 = call i64 @rt_root(i64 %t1188)
  store i64 %t1189, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1231 = call ptr @rt_alloc_words(i64 1)
  %t1232 = ptrtoint ptr %t1231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1231
  %t1233 = or i64 %t1232, 4
  %t1234 = call i64 @rt_root(i64 %t1233)
  store i64 %t1234, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1258 = call ptr @rt_alloc_words(i64 1)
  %t1259 = ptrtoint ptr %t1258 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1258
  %t1260 = or i64 %t1259, 4
  %t1261 = call i64 @rt_root(i64 %t1260)
  store i64 %t1261, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1285 = call ptr @rt_alloc_words(i64 1)
  %t1286 = ptrtoint ptr %t1285 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1285
  %t1287 = or i64 %t1286, 4
  %t1288 = call i64 @rt_root(i64 %t1287)
  store i64 %t1288, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1331 = call ptr @rt_alloc_words(i64 1)
  %t1332 = ptrtoint ptr %t1331 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1331
  %t1333 = or i64 %t1332, 4
  %t1334 = call i64 @rt_root(i64 %t1333)
  store i64 %t1334, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1363 = call ptr @rt_alloc_words(i64 1)
  %t1364 = ptrtoint ptr %t1363 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1363
  %t1365 = or i64 %t1364, 4
  %t1366 = call i64 @rt_root(i64 %t1365)
  store i64 %t1366, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1392 = call ptr @rt_alloc_words(i64 1)
  %t1393 = ptrtoint ptr %t1392 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1392
  %t1394 = or i64 %t1393, 4
  %t1395 = call i64 @rt_root(i64 %t1394)
  store i64 %t1395, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1411 = call ptr @rt_alloc_words(i64 1)
  %t1412 = ptrtoint ptr %t1411 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1411
  %t1413 = or i64 %t1412, 4
  %t1414 = call i64 @rt_root(i64 %t1413)
  store i64 %t1414, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1445 = call ptr @rt_alloc_words(i64 1)
  %t1446 = ptrtoint ptr %t1445 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1445
  %t1447 = or i64 %t1446, 4
  %t1448 = call i64 @rt_root(i64 %t1447)
  store i64 %t1448, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1453 = call ptr @rt_alloc_words(i64 1)
  %t1454 = ptrtoint ptr %t1453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1453
  %t1455 = or i64 %t1454, 4
  %t1456 = call i64 @rt_root(i64 %t1455)
  store i64 %t1456, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1461 = call ptr @rt_alloc_words(i64 1)
  %t1462 = ptrtoint ptr %t1461 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1461
  %t1463 = or i64 %t1462, 4
  %t1464 = call i64 @rt_root(i64 %t1463)
  store i64 %t1464, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1469 = call ptr @rt_alloc_words(i64 1)
  %t1470 = ptrtoint ptr %t1469 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1469
  %t1471 = or i64 %t1470, 4
  %t1472 = call i64 @rt_root(i64 %t1471)
  store i64 %t1472, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1477 = call ptr @rt_alloc_words(i64 1)
  %t1478 = ptrtoint ptr %t1477 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1477
  %t1479 = or i64 %t1478, 4
  %t1480 = call i64 @rt_root(i64 %t1479)
  store i64 %t1480, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1483 = call ptr @rt_alloc_words(i64 1)
  %t1484 = ptrtoint ptr %t1483 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1483
  %t1485 = or i64 %t1484, 4
  %t1486 = call i64 @rt_root(i64 %t1485)
  store i64 %t1486, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1489 = call ptr @rt_alloc_words(i64 1)
  %t1490 = ptrtoint ptr %t1489 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1489
  %t1491 = or i64 %t1490, 4
  %t1492 = call i64 @rt_root(i64 %t1491)
  store i64 %t1492, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1495 = call ptr @rt_alloc_words(i64 1)
  %t1496 = ptrtoint ptr %t1495 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1495
  %t1497 = or i64 %t1496, 4
  %t1498 = call i64 @rt_root(i64 %t1497)
  store i64 %t1498, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1510 = call ptr @rt_alloc_words(i64 1)
  %t1511 = ptrtoint ptr %t1510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1510
  %t1512 = or i64 %t1511, 4
  %t1513 = call i64 @rt_root(i64 %t1512)
  store i64 %t1513, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1523 = call ptr @rt_alloc_words(i64 1)
  %t1524 = ptrtoint ptr %t1523 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1523
  %t1525 = or i64 %t1524, 4
  %t1526 = call i64 @rt_root(i64 %t1525)
  store i64 %t1526, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1541 = call ptr @rt_alloc_words(i64 1)
  %t1542 = ptrtoint ptr %t1541 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1541
  %t1543 = or i64 %t1542, 4
  %t1544 = call i64 @rt_root(i64 %t1543)
  store i64 %t1544, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1555 = call ptr @rt_alloc_words(i64 1)
  %t1556 = ptrtoint ptr %t1555 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1555
  %t1557 = or i64 %t1556, 4
  %t1558 = call i64 @rt_root(i64 %t1557)
  store i64 %t1558, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1572 = call ptr @rt_alloc_words(i64 1)
  %t1573 = ptrtoint ptr %t1572 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1572
  %t1574 = or i64 %t1573, 4
  %t1575 = call i64 @rt_root(i64 %t1574)
  store i64 %t1575, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1578 = call ptr @rt_alloc_words(i64 1)
  %t1579 = ptrtoint ptr %t1578 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1578
  %t1580 = or i64 %t1579, 4
  %t1581 = call i64 @rt_root(i64 %t1580)
  store i64 %t1581, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1584 = call ptr @rt_alloc_words(i64 1)
  %t1585 = ptrtoint ptr %t1584 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1584
  %t1586 = or i64 %t1585, 4
  %t1587 = call i64 @rt_root(i64 %t1586)
  store i64 %t1587, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1590 = call ptr @rt_alloc_words(i64 1)
  %t1591 = ptrtoint ptr %t1590 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1590
  %t1592 = or i64 %t1591, 4
  %t1593 = call i64 @rt_root(i64 %t1592)
  store i64 %t1593, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1607 = call ptr @rt_alloc_words(i64 1)
  %t1608 = ptrtoint ptr %t1607 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1607
  %t1609 = or i64 %t1608, 4
  %t1610 = call i64 @rt_root(i64 %t1609)
  store i64 %t1610, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1624 = call ptr @rt_alloc_words(i64 1)
  %t1625 = ptrtoint ptr %t1624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1624
  %t1626 = or i64 %t1625, 4
  %t1627 = call i64 @rt_root(i64 %t1626)
  store i64 %t1627, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1647 = call ptr @rt_alloc_words(i64 1)
  %t1648 = ptrtoint ptr %t1647 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1647
  %t1649 = or i64 %t1648, 4
  %t1650 = call i64 @rt_root(i64 %t1649)
  store i64 %t1650, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1688 = call ptr @rt_alloc_words(i64 1)
  %t1689 = ptrtoint ptr %t1688 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1688
  %t1690 = or i64 %t1689, 4
  %t1691 = call i64 @rt_root(i64 %t1690)
  store i64 %t1691, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1729 = call ptr @rt_alloc_words(i64 1)
  %t1730 = ptrtoint ptr %t1729 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1729
  %t1731 = or i64 %t1730, 4
  %t1732 = call i64 @rt_root(i64 %t1731)
  store i64 %t1732, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1770 = call ptr @rt_alloc_words(i64 1)
  %t1771 = ptrtoint ptr %t1770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1770
  %t1772 = or i64 %t1771, 4
  %t1773 = call i64 @rt_root(i64 %t1772)
  store i64 %t1773, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1819 = call ptr @rt_alloc_words(i64 1)
  %t1820 = ptrtoint ptr %t1819 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1819
  %t1821 = or i64 %t1820, 4
  %t1822 = call i64 @rt_root(i64 %t1821)
  store i64 %t1822, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1868 = call ptr @rt_alloc_words(i64 1)
  %t1869 = ptrtoint ptr %t1868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1868
  %t1870 = or i64 %t1869, 4
  %t1871 = call i64 @rt_root(i64 %t1870)
  store i64 %t1871, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1981 = call ptr @rt_alloc_words(i64 1)
  %t1982 = ptrtoint ptr %t1981 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1981
  %t1983 = or i64 %t1982, 4
  %t1984 = call i64 @rt_root(i64 %t1983)
  store i64 %t1984, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1992 = call ptr @rt_alloc_words(i64 1)
  %t1993 = ptrtoint ptr %t1992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1992
  %t1994 = or i64 %t1993, 4
  %t1995 = call i64 @rt_root(i64 %t1994)
  store i64 %t1995, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t2023 = call ptr @rt_alloc_words(i64 1)
  %t2024 = ptrtoint ptr %t2023 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t2023
  %t2025 = or i64 %t2024, 4
  %t2026 = call i64 @rt_root(i64 %t2025)
  store i64 %t2026, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t2060 = call ptr @rt_alloc_words(i64 1)
  %t2061 = ptrtoint ptr %t2060 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t2060
  %t2062 = or i64 %t2061, 4
  %t2063 = call i64 @rt_root(i64 %t2062)
  store i64 %t2063, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t2096 = call ptr @rt_alloc_words(i64 1)
  %t2097 = ptrtoint ptr %t2096 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t2096
  %t2098 = or i64 %t2097, 4
  %t2099 = call i64 @rt_root(i64 %t2098)
  store i64 %t2099, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t2263 = call ptr @rt_alloc_words(i64 1)
  %t2264 = ptrtoint ptr %t2263 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t2263
  %t2265 = or i64 %t2264, 4
  %t2266 = call i64 @rt_root(i64 %t2265)
  store i64 %t2266, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2322 = call ptr @rt_alloc_words(i64 1)
  %t2323 = ptrtoint ptr %t2322 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2322
  %t2324 = or i64 %t2323, 4
  %t2325 = call i64 @rt_root(i64 %t2324)
  store i64 %t2325, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2349 = call ptr @rt_alloc_words(i64 1)
  %t2350 = ptrtoint ptr %t2349 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%raise-kinded" to i64), ptr %t2349
  %t2351 = or i64 %t2350, 4
  %t2352 = call i64 @rt_root(i64 %t2351)
  store i64 %t2352, ptr @"scheme.base:%raise-kinded"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2378 = call ptr @rt_alloc_words(i64 1)
  %t2379 = ptrtoint ptr %t2378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2378
  %t2380 = or i64 %t2379, 4
  %t2381 = call i64 @rt_root(i64 %t2380)
  store i64 %t2381, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2407 = call ptr @rt_alloc_words(i64 1)
  %t2408 = ptrtoint ptr %t2407 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%read-error" to i64), ptr %t2407
  %t2409 = or i64 %t2408, 4
  %t2410 = call i64 @rt_root(i64 %t2409)
  store i64 %t2410, ptr @"scheme.base:%read-error"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2411 = call i64 @rt_root(i64 2)
  store i64 %t2411, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2420 = call ptr @rt_alloc_words(i64 1)
  %t2421 = ptrtoint ptr %t2420 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_616" to i64), ptr %t2420
  %t2422 = or i64 %t2421, 4
  %t2423 = call i64 @rt_set_trap_raiser(ptr @__apply0, i64 %t2422)
  %t2424 = call i64 @rt_root(i64 2)
  store i64 %t2424, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2449 = call ptr @rt_alloc_words(i64 1)
  %t2450 = ptrtoint ptr %t2449 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2449
  %t2451 = or i64 %t2450, 4
  %t2452 = call i64 @rt_root(i64 %t2451)
  store i64 %t2452, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2460 = call ptr @rt_alloc_words(i64 1)
  %t2461 = ptrtoint ptr %t2460 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:unwind-all!" to i64), ptr %t2460
  %t2462 = or i64 %t2461, 4
  %t2463 = call i64 @rt_root(i64 %t2462)
  store i64 %t2463, ptr @"scheme.base:unwind-all!"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2575 = call ptr @rt_alloc_words(i64 1)
  %t2576 = ptrtoint ptr %t2575 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2575
  %t2577 = or i64 %t2576, 4
  %t2578 = call i64 @rt_root(i64 %t2577)
  store i64 %t2578, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2735 = call ptr @rt_alloc_words(i64 1)
  %t2736 = ptrtoint ptr %t2735 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2735
  %t2737 = or i64 %t2736, 4
  %t2738 = call i64 @rt_root(i64 %t2737)
  store i64 %t2738, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2746 = call ptr @rt_alloc_words(i64 1)
  %t2747 = ptrtoint ptr %t2746 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2746
  %t2748 = or i64 %t2747, 4
  %t2749 = call i64 @rt_root(i64 %t2748)
  store i64 %t2749, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2784 = call ptr @rt_alloc_words(i64 1)
  %t2785 = ptrtoint ptr %t2784 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2784
  %t2786 = or i64 %t2785, 4
  %t2787 = call i64 @rt_root(i64 %t2786)
  store i64 %t2787, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2806 = call ptr @rt_alloc_words(i64 1)
  %t2807 = ptrtoint ptr %t2806 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2806
  %t2808 = or i64 %t2807, 4
  %t2809 = call i64 @rt_root(i64 %t2808)
  store i64 %t2809, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2864 = call ptr @rt_alloc_words(i64 1)
  %t2865 = ptrtoint ptr %t2864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise-continuable" to i64), ptr %t2864
  %t2866 = or i64 %t2865, 4
  %t2867 = call i64 @rt_root(i64 %t2866)
  store i64 %t2867, ptr @"scheme.base:raise-continuable"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2923 = call ptr @rt_alloc_words(i64 1)
  %t2924 = ptrtoint ptr %t2923 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:features" to i64), ptr %t2923
  %t2925 = or i64 %t2924, 4
  %t2926 = call i64 @rt_root(i64 %t2925)
  store i64 %t2926, ptr @"scheme.base:features"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2929 = call ptr @rt_alloc_words(i64 1)
  %t2930 = ptrtoint ptr %t2929 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2929
  %t2931 = or i64 %t2930, 4
  %t2932 = call i64 @rt_root(i64 %t2931)
  store i64 %t2932, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2935 = call ptr @rt_alloc_words(i64 1)
  %t2936 = ptrtoint ptr %t2935 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2935
  %t2937 = or i64 %t2936, 4
  %t2938 = call i64 @rt_root(i64 %t2937)
  store i64 %t2938, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2941 = call ptr @rt_alloc_words(i64 1)
  %t2942 = ptrtoint ptr %t2941 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2941
  %t2943 = or i64 %t2942, 4
  %t2944 = call i64 @rt_root(i64 %t2943)
  store i64 %t2944, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2951 = call ptr @rt_alloc_words(i64 1)
  %t2952 = ptrtoint ptr %t2951 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t2951
  %t2953 = or i64 %t2952, 4
  %t2954 = call i64 @rt_root(i64 %t2953)
  store i64 %t2954, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2961 = call ptr @rt_alloc_words(i64 1)
  %t2962 = ptrtoint ptr %t2961 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t2961
  %t2963 = or i64 %t2962, 4
  %t2964 = call i64 @rt_root(i64 %t2963)
  store i64 %t2964, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t3103 = call ptr @rt_alloc_words(i64 1)
  %t3104 = ptrtoint ptr %t3103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t3103
  %t3105 = or i64 %t3104, 4
  %t3106 = call i64 @rt_root(i64 %t3105)
  store i64 %t3106, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t3187 = call ptr @rt_alloc_words(i64 1)
  %t3188 = ptrtoint ptr %t3187 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t3187
  %t3189 = or i64 %t3188, 4
  %t3190 = call i64 @rt_root(i64 %t3189)
  store i64 %t3190, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3228 = call ptr @rt_alloc_words(i64 1)
  %t3229 = ptrtoint ptr %t3228 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t3228
  %t3230 = or i64 %t3229, 4
  %t3231 = call i64 @rt_root(i64 %t3230)
  store i64 %t3231, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3255 = call ptr @rt_alloc_words(i64 1)
  %t3256 = ptrtoint ptr %t3255 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t3255
  %t3257 = or i64 %t3256, 4
  %t3258 = call i64 @rt_root(i64 %t3257)
  store i64 %t3258, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3296 = call ptr @rt_alloc_words(i64 1)
  %t3297 = ptrtoint ptr %t3296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t3296
  %t3298 = or i64 %t3297, 4
  %t3299 = call i64 @rt_root(i64 %t3298)
  store i64 %t3299, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3323 = call ptr @rt_alloc_words(i64 1)
  %t3324 = ptrtoint ptr %t3323 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t3323
  %t3325 = or i64 %t3324, 4
  %t3326 = call i64 @rt_root(i64 %t3325)
  store i64 %t3326, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3331 = call ptr @rt_alloc_words(i64 1)
  %t3332 = ptrtoint ptr %t3331 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t3331
  %t3333 = or i64 %t3332, 4
  %t3334 = call i64 @rt_root(i64 %t3333)
  store i64 %t3334, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3344 = call ptr @rt_alloc_words(i64 1)
  %t3345 = ptrtoint ptr %t3344 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t3344
  %t3346 = or i64 %t3345, 4
  %t3347 = call i64 @rt_root(i64 %t3346)
  store i64 %t3347, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3409 = call ptr @rt_alloc_words(i64 1)
  %t3410 = ptrtoint ptr %t3409 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t3409
  %t3411 = or i64 %t3410, 4
  %t3412 = call i64 @rt_root(i64 %t3411)
  store i64 %t3412, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3428 = call ptr @rt_alloc_words(i64 1)
  %t3429 = ptrtoint ptr %t3428 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t3428
  %t3430 = or i64 %t3429, 4
  %t3431 = call i64 @rt_root(i64 %t3430)
  store i64 %t3431, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3444 = call ptr @rt_alloc_words(i64 1)
  %t3445 = ptrtoint ptr %t3444 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t3444
  %t3446 = or i64 %t3445, 4
  %t3447 = call i64 @rt_root(i64 %t3446)
  store i64 %t3447, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3473 = call ptr @rt_alloc_words(i64 1)
  %t3474 = ptrtoint ptr %t3473 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t3473
  %t3475 = or i64 %t3474, 4
  %t3476 = call i64 @rt_root(i64 %t3475)
  store i64 %t3476, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3502 = call ptr @rt_alloc_words(i64 1)
  %t3503 = ptrtoint ptr %t3502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t3502
  %t3504 = or i64 %t3503, 4
  %t3505 = call i64 @rt_root(i64 %t3504)
  store i64 %t3505, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3520 = call ptr @rt_alloc_words(i64 1)
  %t3521 = ptrtoint ptr %t3520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t3520
  %t3522 = or i64 %t3521, 4
  %t3523 = call i64 @rt_root(i64 %t3522)
  store i64 %t3523, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3623 = call ptr @rt_alloc_words(i64 1)
  %t3624 = ptrtoint ptr %t3623 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t3623
  %t3625 = or i64 %t3624, 4
  %t3626 = call i64 @rt_root(i64 %t3625)
  store i64 %t3626, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3645 = call ptr @rt_alloc_words(i64 1)
  %t3646 = ptrtoint ptr %t3645 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t3645
  %t3647 = or i64 %t3646, 4
  %t3648 = call i64 @rt_root(i64 %t3647)
  store i64 %t3648, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3694 = call ptr @rt_alloc_words(i64 1)
  %t3695 = ptrtoint ptr %t3694 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3694
  %t3696 = or i64 %t3695, 4
  %t3697 = call i64 @rt_root(i64 %t3696)
  store i64 %t3697, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3743 = call ptr @rt_alloc_words(i64 1)
  %t3744 = ptrtoint ptr %t3743 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3743
  %t3745 = or i64 %t3744, 4
  %t3746 = call i64 @rt_root(i64 %t3745)
  store i64 %t3746, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3793 = call ptr @rt_alloc_words(i64 1)
  %t3794 = ptrtoint ptr %t3793 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3793
  %t3795 = or i64 %t3794, 4
  %t3796 = call i64 @rt_root(i64 %t3795)
  store i64 %t3796, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3843 = call ptr @rt_alloc_words(i64 1)
  %t3844 = ptrtoint ptr %t3843 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3843
  %t3845 = or i64 %t3844, 4
  %t3846 = call i64 @rt_root(i64 %t3845)
  store i64 %t3846, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3956 = call ptr @rt_alloc_words(i64 1)
  %t3957 = ptrtoint ptr %t3956 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3956
  %t3958 = or i64 %t3957, 4
  %t3959 = call i64 @rt_root(i64 %t3958)
  store i64 %t3959, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t4095 = call ptr @rt_alloc_words(i64 1)
  %t4096 = ptrtoint ptr %t4095 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t4095
  %t4097 = or i64 %t4096, 4
  %t4098 = call i64 @rt_root(i64 %t4097)
  store i64 %t4098, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t4234 = call ptr @rt_alloc_words(i64 1)
  %t4235 = ptrtoint ptr %t4234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t4234
  %t4236 = or i64 %t4235, 4
  %t4237 = call i64 @rt_root(i64 %t4236)
  store i64 %t4237, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4258 = call ptr @rt_alloc_words(i64 1)
  %t4259 = ptrtoint ptr %t4258 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t4258
  %t4260 = or i64 %t4259, 4
  %t4261 = call i64 @rt_root(i64 %t4260)
  store i64 %t4261, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4366 = call ptr @rt_alloc_words(i64 1)
  %t4367 = ptrtoint ptr %t4366 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t4366
  %t4368 = or i64 %t4367, 4
  %t4369 = call i64 @rt_root(i64 %t4368)
  store i64 %t4369, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4687 = call ptr @rt_alloc_words(i64 1)
  %t4688 = ptrtoint ptr %t4687 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t4687
  %t4689 = or i64 %t4688, 4
  %t4690 = call i64 @rt_root(i64 %t4689)
  store i64 %t4690, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4879 = call ptr @rt_alloc_words(i64 1)
  %t4880 = ptrtoint ptr %t4879 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t4879
  %t4881 = or i64 %t4880, 4
  %t4882 = call i64 @rt_root(i64 %t4881)
  store i64 %t4882, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t5057 = call ptr @rt_alloc_words(i64 1)
  %t5058 = ptrtoint ptr %t5057 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t5057
  %t5059 = or i64 %t5058, 4
  %t5060 = call i64 @rt_root(i64 %t5059)
  store i64 %t5060, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t5084 = call ptr @rt_alloc_words(i64 1)
  %t5085 = ptrtoint ptr %t5084 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t5084
  %t5086 = or i64 %t5085, 4
  %t5087 = call i64 @rt_root(i64 %t5086)
  store i64 %t5087, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t5101 = call ptr @rt_alloc_words(i64 1)
  %t5102 = ptrtoint ptr %t5101 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t5101
  %t5103 = or i64 %t5102, 4
  %t5104 = call i64 @rt_root(i64 %t5103)
  store i64 %t5104, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t5240 = call ptr @rt_alloc_words(i64 1)
  %t5241 = ptrtoint ptr %t5240 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t5240
  %t5242 = or i64 %t5241, 4
  %t5243 = call i64 @rt_root(i64 %t5242)
  store i64 %t5243, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t5309 = call ptr @rt_alloc_words(i64 1)
  %t5310 = ptrtoint ptr %t5309 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t5309
  %t5311 = or i64 %t5310, 4
  %t5312 = call i64 @rt_root(i64 %t5311)
  store i64 %t5312, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t5370 = call ptr @rt_alloc_words(i64 1)
  %t5371 = ptrtoint ptr %t5370 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t5370
  %t5372 = or i64 %t5371, 4
  %t5373 = call i64 @rt_root(i64 %t5372)
  store i64 %t5373, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t5391 = call ptr @rt_alloc_words(i64 1)
  %t5392 = ptrtoint ptr %t5391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t5391
  %t5393 = or i64 %t5392, 4
  %t5394 = call i64 @rt_root(i64 %t5393)
  store i64 %t5394, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t5474 = call ptr @rt_alloc_words(i64 1)
  %t5475 = ptrtoint ptr %t5474 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t5474
  %t5476 = or i64 %t5475, 4
  %t5477 = call i64 @rt_root(i64 %t5476)
  store i64 %t5477, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t5652 = call ptr @rt_alloc_words(i64 1)
  %t5653 = ptrtoint ptr %t5652 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t5652
  %t5654 = or i64 %t5653, 4
  %t5655 = call i64 @rt_root(i64 %t5654)
  store i64 %t5655, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t5679 = call ptr @rt_alloc_words(i64 1)
  %t5680 = ptrtoint ptr %t5679 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t5679
  %t5681 = or i64 %t5680, 4
  %t5682 = call i64 @rt_root(i64 %t5681)
  store i64 %t5682, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5696 = call ptr @rt_alloc_words(i64 1)
  %t5697 = ptrtoint ptr %t5696 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t5696
  %t5698 = or i64 %t5697, 4
  %t5699 = call i64 @rt_root(i64 %t5698)
  store i64 %t5699, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5804 = call ptr @rt_alloc_words(i64 1)
  %t5805 = ptrtoint ptr %t5804 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t5804
  %t5806 = or i64 %t5805, 4
  %t5807 = call i64 @rt_root(i64 %t5806)
  store i64 %t5807, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t6125 = call ptr @rt_alloc_words(i64 1)
  %t6126 = ptrtoint ptr %t6125 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t6125
  %t6127 = or i64 %t6126, 4
  %t6128 = call i64 @rt_root(i64 %t6127)
  store i64 %t6128, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t6264 = call ptr @rt_alloc_words(i64 1)
  %t6265 = ptrtoint ptr %t6264 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t6264
  %t6266 = or i64 %t6265, 4
  %t6267 = call i64 @rt_root(i64 %t6266)
  store i64 %t6267, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t6585 = call ptr @rt_alloc_words(i64 1)
  %t6586 = ptrtoint ptr %t6585 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t6585
  %t6587 = or i64 %t6586, 4
  %t6588 = call i64 @rt_root(i64 %t6587)
  store i64 %t6588, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t6724 = call ptr @rt_alloc_words(i64 1)
  %t6725 = ptrtoint ptr %t6724 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t6724
  %t6726 = or i64 %t6725, 4
  %t6727 = call i64 @rt_root(i64 %t6726)
  store i64 %t6727, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t6748 = call ptr @rt_alloc_words(i64 1)
  %t6749 = ptrtoint ptr %t6748 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t6748
  %t6750 = or i64 %t6749, 4
  %t6751 = call i64 @rt_root(i64 %t6750)
  store i64 %t6751, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t6752 = call i64 @rt_root(i64 8000000)
  store i64 %t6752, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t6801 = call ptr @rt_alloc_words(i64 1)
  %t6802 = ptrtoint ptr %t6801 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t6801
  %t6803 = or i64 %t6802, 4
  %t6804 = call i64 @rt_root(i64 %t6803)
  store i64 %t6804, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t6921 = call ptr @rt_alloc_words(i64 1)
  %t6922 = ptrtoint ptr %t6921 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t6921
  %t6923 = or i64 %t6922, 4
  %t6924 = call i64 @rt_root(i64 %t6923)
  store i64 %t6924, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t6926 = call ptr @rt_alloc_words(i64 1)
  %t6927 = ptrtoint ptr %t6926 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t6926
  %t6928 = or i64 %t6927, 4
  %t6929 = call i64 @rt_root(i64 %t6928)
  store i64 %t6929, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t6931 = call ptr @rt_alloc_words(i64 1)
  %t6932 = ptrtoint ptr %t6931 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t6931
  %t6933 = or i64 %t6932, 4
  %t6934 = call i64 @rt_root(i64 %t6933)
  store i64 %t6934, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t7051 = call ptr @rt_alloc_words(i64 1)
  %t7052 = ptrtoint ptr %t7051 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t7051
  %t7053 = or i64 %t7052, 4
  %t7054 = call i64 @rt_root(i64 %t7053)
  store i64 %t7054, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t7080 = call ptr @rt_alloc_words(i64 1)
  %t7081 = ptrtoint ptr %t7080 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t7080
  %t7082 = or i64 %t7081, 4
  %t7083 = call i64 @rt_root(i64 %t7082)
  store i64 %t7083, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t7109 = call ptr @rt_alloc_words(i64 1)
  %t7110 = ptrtoint ptr %t7109 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t7109
  %t7111 = or i64 %t7110, 4
  %t7112 = call i64 @rt_root(i64 %t7111)
  store i64 %t7112, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t7140 = call ptr @rt_alloc_words(i64 1)
  %t7141 = ptrtoint ptr %t7140 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t7140
  %t7142 = or i64 %t7141, 4
  %t7143 = call i64 @rt_root(i64 %t7142)
  store i64 %t7143, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t7185 = call ptr @rt_alloc_words(i64 1)
  %t7186 = ptrtoint ptr %t7185 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t7185
  %t7187 = or i64 %t7186, 4
  %t7188 = call i64 @rt_root(i64 %t7187)
  store i64 %t7188, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t7189 = call i64 @rt_root(i64 64)
  store i64 %t7189, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t7190 = call i64 @rt_root(i64 24)
  store i64 %t7190, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t7201 = call ptr @rt_alloc_words(i64 1)
  %t7202 = ptrtoint ptr %t7201 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t7201
  %t7203 = or i64 %t7202, 4
  %t7204 = call i64 @rt_root(i64 %t7203)
  store i64 %t7204, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t7215 = call ptr @rt_alloc_words(i64 1)
  %t7216 = ptrtoint ptr %t7215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-eq-hash-table" to i64), ptr %t7215
  %t7217 = or i64 %t7216, 4
  %t7218 = call i64 @rt_root(i64 %t7217)
  store i64 %t7218, ptr @"scheme.base:make-eq-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t7221 = call ptr @rt_alloc_words(i64 1)
  %t7222 = ptrtoint ptr %t7221 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t7221
  %t7223 = or i64 %t7222, 4
  %t7224 = call i64 @rt_root(i64 %t7223)
  store i64 %t7224, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t7228 = call ptr @rt_alloc_words(i64 1)
  %t7229 = ptrtoint ptr %t7228 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t7228
  %t7230 = or i64 %t7229, 4
  %t7231 = call i64 @rt_root(i64 %t7230)
  store i64 %t7231, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t7235 = call ptr @rt_alloc_words(i64 1)
  %t7236 = ptrtoint ptr %t7235 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t7235
  %t7237 = or i64 %t7236, 4
  %t7238 = call i64 @rt_root(i64 %t7237)
  store i64 %t7238, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t7242 = call ptr @rt_alloc_words(i64 1)
  %t7243 = ptrtoint ptr %t7242 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-identity?" to i64), ptr %t7242
  %t7244 = or i64 %t7243, 4
  %t7245 = call i64 @rt_root(i64 %t7244)
  store i64 %t7245, ptr @"scheme.base:%ht-identity?"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t7249 = call ptr @rt_alloc_words(i64 1)
  %t7250 = ptrtoint ptr %t7249 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t7249
  %t7251 = or i64 %t7250, 4
  %t7252 = call i64 @rt_root(i64 %t7251)
  store i64 %t7252, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t7256 = call ptr @rt_alloc_words(i64 1)
  %t7257 = ptrtoint ptr %t7256 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t7256
  %t7258 = or i64 %t7257, 4
  %t7259 = call i64 @rt_root(i64 %t7258)
  store i64 %t7259, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t7270 = call ptr @rt_alloc_words(i64 1)
  %t7271 = ptrtoint ptr %t7270 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-hash" to i64), ptr %t7270
  %t7272 = or i64 %t7271, 4
  %t7273 = call i64 @rt_root(i64 %t7272)
  store i64 %t7273, ptr @"scheme.base:%ht-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t7284 = call ptr @rt_alloc_words(i64 1)
  %t7285 = ptrtoint ptr %t7284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-key=?" to i64), ptr %t7284
  %t7286 = or i64 %t7285, 4
  %t7287 = call i64 @rt_root(i64 %t7286)
  store i64 %t7287, ptr @"scheme.base:%ht-key=?"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t7296 = call ptr @rt_alloc_words(i64 1)
  %t7297 = ptrtoint ptr %t7296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t7296
  %t7298 = or i64 %t7297, 4
  %t7299 = call i64 @rt_root(i64 %t7298)
  store i64 %t7299, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t7320 = call ptr @rt_alloc_words(i64 1)
  %t7321 = ptrtoint ptr %t7320 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t7320
  %t7322 = or i64 %t7321, 4
  %t7323 = call i64 @rt_root(i64 %t7322)
  store i64 %t7323, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t7346 = call ptr @rt_alloc_words(i64 1)
  %t7347 = ptrtoint ptr %t7346 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t7346
  %t7348 = or i64 %t7347, 4
  %t7349 = call i64 @rt_root(i64 %t7348)
  store i64 %t7349, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t7373 = call ptr @rt_alloc_words(i64 1)
  %t7374 = ptrtoint ptr %t7373 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t7373
  %t7375 = or i64 %t7374, 4
  %t7376 = call i64 @rt_root(i64 %t7375)
  store i64 %t7376, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t7399 = call ptr @rt_alloc_words(i64 1)
  %t7400 = ptrtoint ptr %t7399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t7399
  %t7401 = or i64 %t7400, 4
  %t7402 = call i64 @rt_root(i64 %t7401)
  store i64 %t7402, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t7433 = call ptr @rt_alloc_words(i64 1)
  %t7434 = ptrtoint ptr %t7433 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t7433
  %t7435 = or i64 %t7434, 4
  %t7436 = call i64 @rt_root(i64 %t7435)
  store i64 %t7436, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t7520 = call ptr @rt_alloc_words(i64 1)
  %t7521 = ptrtoint ptr %t7520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t7520
  %t7522 = or i64 %t7521, 4
  %t7523 = call i64 @rt_root(i64 %t7522)
  store i64 %t7523, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t7573 = call ptr @rt_alloc_words(i64 1)
  %t7574 = ptrtoint ptr %t7573 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t7573
  %t7575 = or i64 %t7574, 4
  %t7576 = call i64 @rt_root(i64 %t7575)
  store i64 %t7576, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t7690 = call ptr @rt_alloc_words(i64 1)
  %t7691 = ptrtoint ptr %t7690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t7690
  %t7692 = or i64 %t7691, 4
  %t7693 = call i64 @rt_root(i64 %t7692)
  store i64 %t7693, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t7701 = call ptr @rt_alloc_words(i64 1)
  %t7702 = ptrtoint ptr %t7701 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t7701
  %t7703 = or i64 %t7702, 4
  %t7704 = call i64 @rt_root(i64 %t7703)
  store i64 %t7704, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t7721 = call ptr @rt_alloc_words(i64 1)
  %t7722 = ptrtoint ptr %t7721 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t7721
  %t7723 = or i64 %t7722, 4
  %t7724 = call i64 @rt_root(i64 %t7723)
  store i64 %t7724, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t7772 = call ptr @rt_alloc_words(i64 1)
  %t7773 = ptrtoint ptr %t7772 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t7772
  %t7774 = or i64 %t7773, 4
  %t7775 = call i64 @rt_root(i64 %t7774)
  store i64 %t7775, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t7794 = call ptr @rt_alloc_words(i64 1)
  %t7795 = ptrtoint ptr %t7794 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t7794
  %t7796 = or i64 %t7795, 4
  %t7797 = call i64 @rt_root(i64 %t7796)
  store i64 %t7797, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t7816 = call ptr @rt_alloc_words(i64 1)
  %t7817 = ptrtoint ptr %t7816 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t7816
  %t7818 = or i64 %t7817, 4
  %t7819 = call i64 @rt_root(i64 %t7818)
  store i64 %t7819, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t8066 = call ptr @rt_alloc_words(i64 1)
  %t8067 = ptrtoint ptr %t8066 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t8066
  %t8068 = or i64 %t8067, 4
  %t8069 = call i64 @rt_root(i64 %t8068)
  store i64 %t8069, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t8091 = call ptr @rt_alloc_words(i64 1)
  %t8092 = ptrtoint ptr %t8091 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t8091
  %t8093 = or i64 %t8092, 4
  %t8094 = call i64 @rt_root(i64 %t8093)
  store i64 %t8094, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t8102 = call ptr @rt_alloc_words(i64 1)
  %t8103 = ptrtoint ptr %t8102 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t8102
  %t8104 = or i64 %t8103, 4
  %t8105 = call i64 @rt_root(i64 %t8104)
  store i64 %t8105, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t8113 = call ptr @rt_alloc_words(i64 1)
  %t8114 = ptrtoint ptr %t8113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t8113
  %t8115 = or i64 %t8114, 4
  %t8116 = call i64 @rt_root(i64 %t8115)
  store i64 %t8116, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t8223 = call ptr @rt_alloc_words(i64 1)
  %t8224 = ptrtoint ptr %t8223 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t8223
  %t8225 = or i64 %t8224, 4
  %t8226 = call i64 @rt_root(i64 %t8225)
  store i64 %t8226, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t8231 = call ptr @rt_alloc_words(i64 1)
  %t8232 = ptrtoint ptr %t8231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t8231
  %t8233 = or i64 %t8232, 4
  %t8234 = call i64 @rt_root(i64 %t8233)
  store i64 %t8234, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t8244 = call ptr @rt_alloc_words(i64 1)
  %t8245 = ptrtoint ptr %t8244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t8244
  %t8246 = or i64 %t8245, 4
  %t8247 = call i64 @rt_root(i64 %t8246)
  store i64 %t8247, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t8258 = call ptr @rt_alloc_words(i64 1)
  %t8259 = ptrtoint ptr %t8258 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t8258
  %t8260 = or i64 %t8259, 4
  %t8261 = call i64 @rt_root(i64 %t8260)
  store i64 %t8261, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t8269 = call ptr @rt_alloc_words(i64 1)
  %t8270 = ptrtoint ptr %t8269 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t8269
  %t8271 = or i64 %t8270, 4
  %t8272 = call i64 @rt_root(i64 %t8271)
  store i64 %t8272, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t8275 = call ptr @rt_alloc_words(i64 1)
  %t8276 = ptrtoint ptr %t8275 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t8275
  %t8277 = or i64 %t8276, 4
  %t8278 = call i64 @rt_root(i64 %t8277)
  store i64 %t8278, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t8289 = call ptr @rt_alloc_words(i64 1)
  %t8290 = ptrtoint ptr %t8289 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t8289
  %t8291 = or i64 %t8290, 4
  %t8292 = call i64 @rt_root(i64 %t8291)
  store i64 %t8292, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t8303 = call ptr @rt_alloc_words(i64 1)
  %t8304 = ptrtoint ptr %t8303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t8303
  %t8305 = or i64 %t8304, 4
  %t8306 = call i64 @rt_root(i64 %t8305)
  store i64 %t8306, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t8332 = call ptr @rt_alloc_words(i64 1)
  %t8333 = ptrtoint ptr %t8332 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t8332
  %t8334 = or i64 %t8333, 4
  %t8335 = call i64 @rt_root(i64 %t8334)
  store i64 %t8335, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t8361 = call ptr @rt_alloc_words(i64 1)
  %t8362 = ptrtoint ptr %t8361 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t8361
  %t8363 = or i64 %t8362, 4
  %t8364 = call i64 @rt_root(i64 %t8363)
  store i64 %t8364, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t8368 = call ptr @rt_alloc_words(i64 1)
  %t8369 = ptrtoint ptr %t8368 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t8368
  %t8370 = or i64 %t8369, 4
  %t8371 = call i64 @rt_root(i64 %t8370)
  store i64 %t8371, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t8392 = call ptr @rt_alloc_words(i64 1)
  %t8393 = ptrtoint ptr %t8392 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t8392
  %t8394 = or i64 %t8393, 4
  %t8395 = call i64 @rt_root(i64 %t8394)
  store i64 %t8395, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t8425 = call ptr @rt_alloc_words(i64 1)
  %t8426 = ptrtoint ptr %t8425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t8425
  %t8427 = or i64 %t8426, 4
  %t8428 = call i64 @rt_root(i64 %t8427)
  store i64 %t8428, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t8449 = call ptr @rt_alloc_words(i64 1)
  %t8450 = ptrtoint ptr %t8449 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t8449
  %t8451 = or i64 %t8450, 4
  %t8452 = call i64 @rt_root(i64 %t8451)
  store i64 %t8452, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t8570 = call ptr @rt_alloc_words(i64 1)
  %t8571 = ptrtoint ptr %t8570 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t8570
  %t8572 = or i64 %t8571, 4
  %t8573 = call i64 @rt_root(i64 %t8572)
  store i64 %t8573, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t8621 = call ptr @rt_alloc_words(i64 1)
  %t8622 = ptrtoint ptr %t8621 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t8621
  %t8623 = or i64 %t8622, 4
  %t8624 = call i64 @rt_root(i64 %t8623)
  store i64 %t8624, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t8638 = call ptr @rt_alloc_words(i64 1)
  %t8639 = ptrtoint ptr %t8638 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t8638
  %t8640 = or i64 %t8639, 4
  %t8641 = call i64 @rt_root(i64 %t8640)
  store i64 %t8641, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t8672 = call ptr @rt_alloc_words(i64 1)
  %t8673 = ptrtoint ptr %t8672 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t8672
  %t8674 = or i64 %t8673, 4
  %t8675 = call i64 @rt_root(i64 %t8674)
  store i64 %t8675, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t8686 = call ptr @rt_alloc_words(i64 1)
  %t8687 = ptrtoint ptr %t8686 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t8686
  %t8688 = or i64 %t8687, 4
  %t8689 = call i64 @rt_root(i64 %t8688)
  store i64 %t8689, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t8718 = call ptr @rt_alloc_words(i64 1)
  %t8719 = ptrtoint ptr %t8718 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t8718
  %t8720 = or i64 %t8719, 4
  %t8721 = call i64 @rt_root(i64 %t8720)
  store i64 %t8721, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t8744 = call ptr @rt_alloc_words(i64 1)
  %t8745 = ptrtoint ptr %t8744 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t8744
  %t8746 = or i64 %t8745, 4
  %t8747 = call i64 @rt_root(i64 %t8746)
  store i64 %t8747, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t8770 = call ptr @rt_alloc_words(i64 1)
  %t8771 = ptrtoint ptr %t8770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t8770
  %t8772 = or i64 %t8771, 4
  %t8773 = call i64 @rt_root(i64 %t8772)
  store i64 %t8773, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t8774 = call i64 @rt_root(i64 1)
  store i64 %t8774, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t8775 = call i64 @rt_root(i64 1)
  store i64 %t8775, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t8776 = call i64 @rt_root(i64 1)
  store i64 %t8776, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_215"() {
entry:
  %t8820 = call ptr @rt_alloc_words(i64 1)
  %t8821 = ptrtoint ptr %t8820 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t8820
  %t8822 = or i64 %t8821, 4
  %t8823 = call i64 @rt_root(i64 %t8822)
  store i64 %t8823, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_216"() {
entry:
  %t8861 = call ptr @rt_alloc_words(i64 1)
  %t8862 = ptrtoint ptr %t8861 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t8861
  %t8863 = or i64 %t8862, 4
  %t8864 = call i64 @rt_root(i64 %t8863)
  store i64 %t8864, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_217"() {
entry:
  %t8902 = call ptr @rt_alloc_words(i64 1)
  %t8903 = ptrtoint ptr %t8902 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t8902
  %t8904 = or i64 %t8903, 4
  %t8905 = call i64 @rt_root(i64 %t8904)
  store i64 %t8905, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_218"() {
entry:
  %t8952 = call ptr @rt_alloc_words(i64 1)
  %t8953 = ptrtoint ptr %t8952 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t8952
  %t8954 = or i64 %t8953, 4
  %t8955 = call i64 @rt_root(i64 %t8954)
  store i64 %t8955, ptr @"scheme.base:call-with-port"
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

