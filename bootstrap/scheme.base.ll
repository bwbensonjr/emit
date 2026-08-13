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
@.str.sym.51 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.52 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.53 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.54 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.55 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.56 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.57 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.58 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.59 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.60 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.61 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.62 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.63 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.64 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.65 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.66 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.67 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.68 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.69 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.70 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.71 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.72 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.73 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.74 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.75 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.76 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.77 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.78 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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

define fastcc i64 @"scheme.base:code:%raise-kinded"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2080 = icmp eq i64 %argc, 3
  br i1 %t2080, label %argok556, label %arityerr555
arityerr555:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok556:
  %t2081 = call i64 @rt_string_p(i64 %a1)
  %t2082 = icmp ne i64 %t2081, 1
  br i1 %t2082, label %then557, label %else558
then557:
  %t2083 = call i64 @rt_make_error_object_kind(i64 %a1, i64 %a2, i64 %a0)
  %t2084 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2084)
  %t2085 = and i64 %t2084, -8
  %t2086 = inttoptr i64 %t2085 to ptr
  %t2087 = load i64, ptr %t2086
  %t2088 = inttoptr i64 %t2087 to ptr
  %t2089 = musttail call fastcc i64 %t2088(i64 %t2084, i64 1, i64 %t2083, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2089
else558:
  %t2090 = call i64 @rt_symbol_to_string(i64 %a1)
  %t2091 = call i64 @rt_make_string(ptr @.str.lit.10, i64 2)
  %t2092 = call i64 @rt_car(i64 %a2)
  %t2093 = call i64 @rt_string_append(i64 %t2091, i64 %t2092)
  %t2094 = call i64 @rt_string_append(i64 %t2090, i64 %t2093)
  %t2095 = call i64 @rt_cdr(i64 %a2)
  %t2096 = call i64 @rt_make_error_object_kind(i64 %t2094, i64 %t2095, i64 %a0)
  %t2097 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2097)
  %t2098 = and i64 %t2097, -8
  %t2099 = inttoptr i64 %t2098 to ptr
  %t2100 = load i64, ptr %t2099
  %t2101 = inttoptr i64 %t2100 to ptr
  %t2102 = musttail call fastcc i64 %t2101(i64 %t2097, i64 1, i64 %t2096, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2102
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2107 = icmp sge i64 %argc, 1
  br i1 %t2107, label %argok560, label %arityerr559
arityerr559:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok560:
  %t2108 = call ptr @rt_alloc_words(i64 8)
  %t2109 = getelementptr i64, ptr %t2108, i64 0
  store i64 %a0, ptr %t2109
  %t2110 = getelementptr i64, ptr %t2108, i64 1
  store i64 %a1, ptr %t2110
  %t2111 = getelementptr i64, ptr %t2108, i64 2
  store i64 %a2, ptr %t2111
  %t2112 = getelementptr i64, ptr %t2108, i64 3
  store i64 %a3, ptr %t2112
  %t2113 = getelementptr i64, ptr %t2108, i64 4
  store i64 %a4, ptr %t2113
  %t2114 = getelementptr i64, ptr %t2108, i64 5
  store i64 %a5, ptr %t2114
  %t2115 = getelementptr i64, ptr %t2108, i64 6
  store i64 %a6, ptr %t2115
  %t2116 = getelementptr i64, ptr %t2108, i64 7
  store i64 %a7, ptr %t2116
  %t2117 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2108, ptr %overflow)
  %t2118 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2119 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2119)
  %t2120 = and i64 %t2119, -8
  %t2121 = inttoptr i64 %t2120 to ptr
  %t2122 = load i64, ptr %t2121
  %t2123 = inttoptr i64 %t2122 to ptr
  %t2124 = musttail call fastcc i64 %t2123(i64 %t2119, i64 3, i64 %t2118, i64 %a0, i64 %t2117, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2124
}

define fastcc i64 @"scheme.base:code:%read-error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2129 = icmp sge i64 %argc, 1
  br i1 %t2129, label %argok562, label %arityerr561
arityerr561:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok562:
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
  %t2140 = call i64 @rt_intern(ptr @.str.sym.12)
  %t2141 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2141)
  %t2142 = and i64 %t2141, -8
  %t2143 = inttoptr i64 %t2142 to ptr
  %t2144 = load i64, ptr %t2143
  %t2145 = inttoptr i64 %t2144 to ptr
  %t2146 = musttail call fastcc i64 %t2145(i64 %t2141, i64 3, i64 %t2140, i64 %a0, i64 %t2139, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2146
}

define fastcc i64 @"scheme.base:code_462"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2152 = icmp eq i64 %argc, 0
  br i1 %t2152, label %argok564, label %arityerr563
arityerr563:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok564:
  %t2153 = call i64 @rt_trap_object()
  %t2154 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2154)
  %t2155 = and i64 %t2154, -8
  %t2156 = inttoptr i64 %t2155 to ptr
  %t2157 = load i64, ptr %t2156
  %t2158 = inttoptr i64 %t2157 to ptr
  %t2159 = musttail call fastcc i64 %t2158(i64 %t2154, i64 1, i64 %t2153, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2159
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2165 = icmp eq i64 %argc, 1
  br i1 %t2165, label %argok566, label %arityerr565
arityerr565:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok566:
  %t2166 = load i64, ptr @"scheme.base:*winds*"
  %t2167 = call i64 @rt_eq_p(i64 %t2166, i64 %a0)
  %t2168 = icmp ne i64 %t2167, 1
  br i1 %t2168, label %then567, label %else568
then567:
  ret i64 257
else568:
  %t2169 = load i64, ptr @"scheme.base:*winds*"
  %t2170 = call i64 @rt_null_p(i64 %t2169)
  %t2171 = icmp ne i64 %t2170, 1
  br i1 %t2171, label %then569, label %else570
then569:
  ret i64 257
else570:
  %t2172 = load i64, ptr @"scheme.base:*winds*"
  %t2173 = call i64 @rt_car(i64 %t2172)
  %t2174 = load i64, ptr @"scheme.base:*winds*"
  %t2175 = call i64 @rt_cdr(i64 %t2174)
  %t2176 = call i64 @rt_root(i64 %t2175)
  store i64 %t2176, ptr @"scheme.base:*winds*"
  %t2177 = call i64 @rt_cdr(i64 %t2173)
  call void @rt_check_callable(i64 %t2177)
  %t2178 = and i64 %t2177, -8
  %t2179 = inttoptr i64 %t2178 to ptr
  %t2180 = load i64, ptr %t2179
  %t2181 = inttoptr i64 %t2180 to ptr
  %t2182 = call fastcc i64%t2181(i64 %t2177, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2183 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2183)
  %t2184 = and i64 %t2183, -8
  %t2185 = inttoptr i64 %t2184 to ptr
  %t2186 = load i64, ptr %t2185
  %t2187 = inttoptr i64 %t2186 to ptr
  %t2188 = musttail call fastcc i64 %t2187(i64 %t2183, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2188
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2193 = icmp eq i64 %argc, 3
  br i1 %t2193, label %argok572, label %arityerr571
arityerr571:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok572:
  call void @rt_check_callable(i64 %a0)
  %t2194 = and i64 %a0, -8
  %t2195 = inttoptr i64 %t2194 to ptr
  %t2196 = load i64, ptr %t2195
  %t2197 = inttoptr i64 %t2196 to ptr
  %t2198 = call fastcc i64%t2197(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2199 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2200 = load i64, ptr @"scheme.base:*winds*"
  %t2201 = call i64 @rt_cons(i64 %t2199, i64 %t2200)
  %t2202 = call i64 @rt_root(i64 %t2201)
  store i64 %t2202, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a1)
  %t2203 = and i64 %a1, -8
  %t2204 = inttoptr i64 %t2203 to ptr
  %t2205 = load i64, ptr %t2204
  %t2206 = inttoptr i64 %t2205 to ptr
  %t2207 = call fastcc i64%t2206(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2208 = load i64, ptr @"scheme.base:*winds*"
  %t2209 = call i64 @rt_cdr(i64 %t2208)
  %t2210 = call i64 @rt_root(i64 %t2209)
  store i64 %t2210, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a2)
  %t2211 = and i64 %a2, -8
  %t2212 = inttoptr i64 %t2211 to ptr
  %t2213 = load i64, ptr %t2212
  %t2214 = inttoptr i64 %t2213 to ptr
  %t2215 = call fastcc i64%t2214(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2207
}

define fastcc i64 @"scheme.base:code_483"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2220 = icmp eq i64 %argc, 1
  br i1 %t2220, label %argok574, label %arityerr573
arityerr573:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok574:
  %t2221 = and i64 %self, -8
  %t2222 = inttoptr i64 %t2221 to ptr
  %t2223 = getelementptr i64, ptr %t2222, i64 1
  %t2224 = load i64, ptr %t2223
  %t2225 = call i64 @rt_escape_live_p(i64 %t2224)
  %t2226 = icmp ne i64 %t2225, 1
  br i1 %t2226, label %then575, label %else576
then575:
  %t2227 = and i64 %self, -8
  %t2228 = inttoptr i64 %t2227 to ptr
  %t2229 = getelementptr i64, ptr %t2228, i64 2
  %t2230 = load i64, ptr %t2229
  %t2231 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2231)
  %t2232 = and i64 %t2231, -8
  %t2233 = inttoptr i64 %t2232 to ptr
  %t2234 = load i64, ptr %t2233
  %t2235 = inttoptr i64 %t2234 to ptr
  %t2236 = call fastcc i64%t2235(i64 %t2231, i64 1, i64 %t2230, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2237 = and i64 %self, -8
  %t2238 = inttoptr i64 %t2237 to ptr
  %t2239 = getelementptr i64, ptr %t2238, i64 1
  %t2240 = load i64, ptr %t2239
  %t2241 = call i64 @rt_escape_to(i64 %t2240, i64 %a0)
  br label %merge577
else576:
  br label %merge577
merge577:
  %t2242 = phi i64 [ %t2241, %then575 ], [ 1, %else576 ]
  %t2243 = call i64 @rt_intern(ptr @.str.sym.13)
  %t2244 = call i64 @rt_make_string(ptr @.str.lit.14, i64 39)
  %t2245 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2245)
  %t2246 = and i64 %t2245, -8
  %t2247 = inttoptr i64 %t2246 to ptr
  %t2248 = load i64, ptr %t2247
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = musttail call fastcc i64 %t2249(i64 %t2245, i64 2, i64 %t2243, i64 %t2244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2250
}

define fastcc i64 @"scheme.base:code_481"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2251 = icmp eq i64 %argc, 0
  br i1 %t2251, label %argok579, label %arityerr578
arityerr578:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok579:
  %t2252 = call i64 @rt_escape_frame()
  %t2253 = and i64 %self, -8
  %t2254 = inttoptr i64 %t2253 to ptr
  %t2255 = getelementptr i64, ptr %t2254, i64 2
  %t2256 = load i64, ptr %t2255
  %t2257 = call ptr @rt_alloc_words(i64 3)
  %t2258 = ptrtoint ptr %t2257 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_483" to i64), ptr %t2257
  %t2259 = getelementptr i64, ptr %t2257, i64 1
  store i64 %t2252, ptr %t2259
  %t2260 = getelementptr i64, ptr %t2257, i64 2
  store i64 %t2256, ptr %t2260
  %t2261 = or i64 %t2258, 4
  %t2262 = and i64 %self, -8
  %t2263 = inttoptr i64 %t2262 to ptr
  %t2264 = getelementptr i64, ptr %t2263, i64 1
  %t2265 = load i64, ptr %t2264
  call void @rt_check_callable(i64 %t2265)
  %t2266 = and i64 %t2265, -8
  %t2267 = inttoptr i64 %t2266 to ptr
  %t2268 = load i64, ptr %t2267
  %t2269 = inttoptr i64 %t2268 to ptr
  %t2270 = musttail call fastcc i64 %t2269(i64 %t2265, i64 1, i64 %t2261, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2270
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2271 = icmp eq i64 %argc, 1
  br i1 %t2271, label %argok581, label %arityerr580
arityerr580:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok581:
  %t2272 = load i64, ptr @"scheme.base:*winds*"
  %t2273 = call ptr @rt_alloc_words(i64 3)
  %t2274 = ptrtoint ptr %t2273 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_481" to i64), ptr %t2273
  %t2275 = getelementptr i64, ptr %t2273, i64 1
  store i64 %a0, ptr %t2275
  %t2276 = getelementptr i64, ptr %t2273, i64 2
  store i64 %t2272, ptr %t2276
  %t2277 = or i64 %t2274, 4
  %t2278 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2277)
  %t2279 = call i64 @rt_cdr(i64 %t2278)
  ret i64 %t2279
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2284 = icmp eq i64 %argc, 1
  br i1 %t2284, label %argok583, label %arityerr582
arityerr582:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok583:
  %t2285 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2285)
  %t2286 = and i64 %t2285, -8
  %t2287 = inttoptr i64 %t2286 to ptr
  %t2288 = load i64, ptr %t2287
  %t2289 = inttoptr i64 %t2288 to ptr
  %t2290 = musttail call fastcc i64 %t2289(i64 %t2285, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2290
}

define fastcc i64 @"scheme.base:code_491"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2295 = icmp eq i64 %argc, 0
  br i1 %t2295, label %argok585, label %arityerr584
arityerr584:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok585:
  %t2296 = and i64 %self, -8
  %t2297 = inttoptr i64 %t2296 to ptr
  %t2298 = getelementptr i64, ptr %t2297, i64 1
  %t2299 = load i64, ptr %t2298
  %t2300 = and i64 %self, -8
  %t2301 = inttoptr i64 %t2300 to ptr
  %t2302 = getelementptr i64, ptr %t2301, i64 2
  %t2303 = load i64, ptr %t2302
  %t2304 = call i64 @rt_cons(i64 %t2299, i64 %t2303)
  %t2305 = call i64 @rt_root(i64 %t2304)
  store i64 %t2305, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_493"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2306 = icmp eq i64 %argc, 0
  br i1 %t2306, label %argok587, label %arityerr586
arityerr586:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok587:
  %t2307 = and i64 %self, -8
  %t2308 = inttoptr i64 %t2307 to ptr
  %t2309 = getelementptr i64, ptr %t2308, i64 1
  %t2310 = load i64, ptr %t2309
  %t2311 = call i64 @rt_root(i64 %t2310)
  store i64 %t2311, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2312 = icmp eq i64 %argc, 2
  br i1 %t2312, label %argok589, label %arityerr588
arityerr588:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok589:
  %t2313 = load i64, ptr @"scheme.base:*handlers*"
  %t2314 = call ptr @rt_alloc_words(i64 3)
  %t2315 = ptrtoint ptr %t2314 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_491" to i64), ptr %t2314
  %t2316 = getelementptr i64, ptr %t2314, i64 1
  store i64 %a0, ptr %t2316
  %t2317 = getelementptr i64, ptr %t2314, i64 2
  store i64 %t2313, ptr %t2317
  %t2318 = or i64 %t2315, 4
  %t2319 = call ptr @rt_alloc_words(i64 2)
  %t2320 = ptrtoint ptr %t2319 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_493" to i64), ptr %t2319
  %t2321 = getelementptr i64, ptr %t2319, i64 1
  store i64 %t2313, ptr %t2321
  %t2322 = or i64 %t2320, 4
  %t2323 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2323)
  %t2324 = and i64 %t2323, -8
  %t2325 = inttoptr i64 %t2324 to ptr
  %t2326 = load i64, ptr %t2325
  %t2327 = inttoptr i64 %t2326 to ptr
  %t2328 = musttail call fastcc i64 %t2327(i64 %t2323, i64 3, i64 %t2318, i64 %a1, i64 %t2322, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2328
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2333 = icmp eq i64 %argc, 1
  br i1 %t2333, label %argok591, label %arityerr590
arityerr590:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok591:
  %t2334 = load i64, ptr @"scheme.base:*handlers*"
  %t2335 = call i64 @rt_null_p(i64 %t2334)
  %t2336 = icmp ne i64 %t2335, 1
  br i1 %t2336, label %then592, label %else593
then592:
  %t2337 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2337
else593:
  %t2338 = load i64, ptr @"scheme.base:*handlers*"
  %t2339 = call i64 @rt_car(i64 %t2338)
  %t2340 = load i64, ptr @"scheme.base:*handlers*"
  %t2341 = load i64, ptr @"scheme.base:*handlers*"
  %t2342 = call i64 @rt_cdr(i64 %t2341)
  %t2343 = call i64 @rt_root(i64 %t2342)
  store i64 %t2343, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2339)
  %t2344 = and i64 %t2339, -8
  %t2345 = inttoptr i64 %t2344 to ptr
  %t2346 = load i64, ptr %t2345
  %t2347 = inttoptr i64 %t2346 to ptr
  %t2348 = call fastcc i64%t2347(i64 %t2339, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2349 = call i64 @rt_root(i64 %t2340)
  store i64 %t2349, ptr @"scheme.base:*handlers*"
  %t2350 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2350
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2355 = icmp eq i64 %argc, 1
  br i1 %t2355, label %argok595, label %arityerr594
arityerr594:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok595:
  %t2356 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2356
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2361 = icmp eq i64 %argc, 1
  br i1 %t2361, label %argok597, label %arityerr596
arityerr596:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok597:
  %t2362 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2362
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2367 = icmp eq i64 %argc, 1
  br i1 %t2367, label %argok599, label %arityerr598
arityerr598:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok599:
  %t2368 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2368
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2373 = icmp eq i64 %argc, 1
  br i1 %t2373, label %argok601, label %arityerr600
arityerr600:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok601:
  %t2374 = call i64 @rt_error_object_p(i64 %a0)
  %t2375 = icmp ne i64 %t2374, 1
  br i1 %t2375, label %then602, label %else603
then602:
  %t2376 = call i64 @rt_error_object_kind(i64 %a0)
  %t2377 = call i64 @rt_intern(ptr @.str.sym.12)
  %t2378 = call i64 @rt_eq_p(i64 %t2376, i64 %t2377)
  ret i64 %t2378
else603:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2383 = icmp eq i64 %argc, 1
  br i1 %t2383, label %argok605, label %arityerr604
arityerr604:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok605:
  %t2384 = call i64 @rt_error_object_p(i64 %a0)
  %t2385 = icmp ne i64 %t2384, 1
  br i1 %t2385, label %then606, label %else607
then606:
  %t2386 = call i64 @rt_error_object_kind(i64 %a0)
  %t2387 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2388 = call i64 @rt_eq_p(i64 %t2386, i64 %t2387)
  ret i64 %t2388
else607:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_525"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2393 = icmp eq i64 %argc, 1
  br i1 %t2393, label %argok609, label %arityerr608
arityerr608:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok609:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_527"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2394 = icmp eq i64 %argc, 1
  br i1 %t2394, label %argok611, label %arityerr610
arityerr610:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok611:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_529"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2395 = icmp sge i64 %argc, 0
  br i1 %t2395, label %argok613, label %arityerr612
arityerr612:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok613:
  %t2396 = call ptr @rt_alloc_words(i64 8)
  %t2397 = getelementptr i64, ptr %t2396, i64 0
  store i64 %a0, ptr %t2397
  %t2398 = getelementptr i64, ptr %t2396, i64 1
  store i64 %a1, ptr %t2398
  %t2399 = getelementptr i64, ptr %t2396, i64 2
  store i64 %a2, ptr %t2399
  %t2400 = getelementptr i64, ptr %t2396, i64 3
  store i64 %a3, ptr %t2400
  %t2401 = getelementptr i64, ptr %t2396, i64 4
  store i64 %a4, ptr %t2401
  %t2402 = getelementptr i64, ptr %t2396, i64 5
  store i64 %a5, ptr %t2402
  %t2403 = getelementptr i64, ptr %t2396, i64 6
  store i64 %a6, ptr %t2403
  %t2404 = getelementptr i64, ptr %t2396, i64 7
  store i64 %a7, ptr %t2404
  %t2405 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2396, ptr %overflow)
  %t2406 = call i64 @rt_null_p(i64 %t2405)
  %t2407 = icmp ne i64 %t2406, 1
  br i1 %t2407, label %then614, label %else615
then614:
  %t2408 = and i64 %self, -8
  %t2409 = inttoptr i64 %t2408 to ptr
  %t2410 = getelementptr i64, ptr %t2409, i64 1
  %t2411 = load i64, ptr %t2410
  %t2412 = call i64 @rt_vector_ref(i64 %t2411, i64 0)
  ret i64 %t2412
else615:
  %t2413 = call i64 @rt_cdr(i64 %t2405)
  %t2414 = call i64 @rt_null_p(i64 %t2413)
  %t2415 = icmp ne i64 %t2414, 1
  br i1 %t2415, label %then616, label %else617
then616:
  %t2416 = and i64 %self, -8
  %t2417 = inttoptr i64 %t2416 to ptr
  %t2418 = getelementptr i64, ptr %t2417, i64 1
  %t2419 = load i64, ptr %t2418
  %t2420 = call i64 @rt_car(i64 %t2405)
  %t2421 = and i64 %self, -8
  %t2422 = inttoptr i64 %t2421 to ptr
  %t2423 = getelementptr i64, ptr %t2422, i64 2
  %t2424 = load i64, ptr %t2423
  call void @rt_check_callable(i64 %t2424)
  %t2425 = and i64 %t2424, -8
  %t2426 = inttoptr i64 %t2425 to ptr
  %t2427 = load i64, ptr %t2426
  %t2428 = inttoptr i64 %t2427 to ptr
  %t2429 = call fastcc i64%t2428(i64 %t2424, i64 1, i64 %t2420, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2430 = call i64 @rt_vector_set(i64 %t2419, i64 0, i64 %t2429)
  ret i64 %t2430
else617:
  %t2431 = and i64 %self, -8
  %t2432 = inttoptr i64 %t2431 to ptr
  %t2433 = getelementptr i64, ptr %t2432, i64 1
  %t2434 = load i64, ptr %t2433
  %t2435 = call i64 @rt_car(i64 %t2405)
  %t2436 = call i64 @rt_vector_set(i64 %t2434, i64 0, i64 %t2435)
  ret i64 %t2436
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2437 = icmp sge i64 %argc, 1
  br i1 %t2437, label %argok619, label %arityerr618
arityerr618:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok619:
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
  %t2447 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2438, ptr %overflow)
  %t2448 = call i64 @rt_null_p(i64 %t2447)
  %t2449 = icmp ne i64 %t2448, 1
  br i1 %t2449, label %then620, label %else621
then620:
  %t2450 = call ptr @rt_alloc_words(i64 1)
  %t2451 = ptrtoint ptr %t2450 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_525" to i64), ptr %t2450
  %t2452 = or i64 %t2451, 4
  br label %merge622
else621:
  %t2453 = call i64 @rt_car(i64 %t2447)
  br label %merge622
merge622:
  %t2454 = phi i64 [ %t2452, %then620 ], [ %t2453, %else621 ]
  %t2455 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2456 = call i64 @rt_null_p(i64 %t2447)
  %t2457 = icmp ne i64 %t2456, 1
  br i1 %t2457, label %then623, label %else624
then623:
  %t2458 = call ptr @rt_alloc_words(i64 1)
  %t2459 = ptrtoint ptr %t2458 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_527" to i64), ptr %t2458
  %t2460 = or i64 %t2459, 4
  br label %merge625
else624:
  %t2461 = call i64 @rt_car(i64 %t2447)
  br label %merge625
merge625:
  %t2462 = phi i64 [ %t2460, %then623 ], [ %t2461, %else624 ]
  call void @rt_check_callable(i64 %t2462)
  %t2463 = and i64 %t2462, -8
  %t2464 = inttoptr i64 %t2463 to ptr
  %t2465 = load i64, ptr %t2464
  %t2466 = inttoptr i64 %t2465 to ptr
  %t2467 = call fastcc i64%t2466(i64 %t2462, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2468 = call i64 @rt_vector_set(i64 %t2455, i64 0, i64 %t2467)
  %t2469 = call ptr @rt_alloc_words(i64 3)
  %t2470 = ptrtoint ptr %t2469 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_529" to i64), ptr %t2469
  %t2471 = getelementptr i64, ptr %t2469, i64 1
  store i64 %t2455, ptr %t2471
  %t2472 = getelementptr i64, ptr %t2469, i64 2
  store i64 %t2454, ptr %t2472
  %t2473 = or i64 %t2470, 4
  ret i64 %t2473
}

define fastcc i64 @"scheme.base:code_541"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2478 = icmp eq i64 %argc, 1
  br i1 %t2478, label %argok627, label %arityerr626
arityerr626:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok627:
  call void @rt_check_callable(i64 %a0)
  %t2479 = and i64 %a0, -8
  %t2480 = inttoptr i64 %t2479 to ptr
  %t2481 = load i64, ptr %t2480
  %t2482 = inttoptr i64 %t2481 to ptr
  %t2483 = musttail call fastcc i64 %t2482(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2483
}

define fastcc i64 @"scheme.base:code_545"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2484 = icmp eq i64 %argc, 2
  br i1 %t2484, label %argok629, label %arityerr628
arityerr628:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok629:
  call void @rt_check_callable(i64 %a0)
  %t2485 = and i64 %a0, -8
  %t2486 = inttoptr i64 %t2485 to ptr
  %t2487 = load i64, ptr %t2486
  %t2488 = inttoptr i64 %t2487 to ptr
  %t2489 = musttail call fastcc i64 %t2488(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2489
}

define fastcc i64 @"scheme.base:code_543"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2490 = icmp eq i64 %argc, 0
  br i1 %t2490, label %argok631, label %arityerr630
arityerr630:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok631:
  %t2491 = call ptr @rt_alloc_words(i64 1)
  %t2492 = ptrtoint ptr %t2491 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_545" to i64), ptr %t2491
  %t2493 = or i64 %t2492, 4
  %t2494 = and i64 %self, -8
  %t2495 = inttoptr i64 %t2494 to ptr
  %t2496 = getelementptr i64, ptr %t2495, i64 1
  %t2497 = load i64, ptr %t2496
  %t2498 = and i64 %self, -8
  %t2499 = inttoptr i64 %t2498 to ptr
  %t2500 = getelementptr i64, ptr %t2499, i64 2
  %t2501 = load i64, ptr %t2500
  %t2502 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2502)
  %t2503 = and i64 %t2502, -8
  %t2504 = inttoptr i64 %t2503 to ptr
  %t2505 = load i64, ptr %t2504
  %t2506 = inttoptr i64 %t2505 to ptr
  %t2507 = musttail call fastcc i64 %t2506(i64 %t2502, i64 3, i64 %t2493, i64 %t2497, i64 %t2501, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2507
}

define fastcc i64 @"scheme.base:code_549"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2508 = icmp eq i64 %argc, 2
  br i1 %t2508, label %argok633, label %arityerr632
arityerr632:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok633:
  call void @rt_check_callable(i64 %a0)
  %t2509 = and i64 %a0, -8
  %t2510 = inttoptr i64 %t2509 to ptr
  %t2511 = load i64, ptr %t2510
  %t2512 = inttoptr i64 %t2511 to ptr
  %t2513 = musttail call fastcc i64 %t2512(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2513
}

define fastcc i64 @"scheme.base:code_547"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2514 = icmp eq i64 %argc, 0
  br i1 %t2514, label %argok635, label %arityerr634
arityerr634:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok635:
  %t2515 = call ptr @rt_alloc_words(i64 1)
  %t2516 = ptrtoint ptr %t2515 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_549" to i64), ptr %t2515
  %t2517 = or i64 %t2516, 4
  %t2518 = and i64 %self, -8
  %t2519 = inttoptr i64 %t2518 to ptr
  %t2520 = getelementptr i64, ptr %t2519, i64 1
  %t2521 = load i64, ptr %t2520
  %t2522 = and i64 %self, -8
  %t2523 = inttoptr i64 %t2522 to ptr
  %t2524 = getelementptr i64, ptr %t2523, i64 2
  %t2525 = load i64, ptr %t2524
  %t2526 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2526)
  %t2527 = and i64 %t2526, -8
  %t2528 = inttoptr i64 %t2527 to ptr
  %t2529 = load i64, ptr %t2528
  %t2530 = inttoptr i64 %t2529 to ptr
  %t2531 = musttail call fastcc i64 %t2530(i64 %t2526, i64 3, i64 %t2517, i64 %t2521, i64 %t2525, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2531
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2532 = icmp eq i64 %argc, 3
  br i1 %t2532, label %argok637, label %arityerr636
arityerr636:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok637:
  %t2533 = call ptr @rt_alloc_words(i64 1)
  %t2534 = ptrtoint ptr %t2533 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_541" to i64), ptr %t2533
  %t2535 = or i64 %t2534, 4
  %t2536 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t2536)
  %t2537 = and i64 %t2536, -8
  %t2538 = inttoptr i64 %t2537 to ptr
  %t2539 = load i64, ptr %t2538
  %t2540 = inttoptr i64 %t2539 to ptr
  %t2541 = call fastcc i64%t2540(i64 %t2536, i64 2, i64 %t2535, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2542 = call ptr @rt_alloc_words(i64 3)
  %t2543 = ptrtoint ptr %t2542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_543" to i64), ptr %t2542
  %t2544 = getelementptr i64, ptr %t2542, i64 1
  store i64 %a0, ptr %t2544
  %t2545 = getelementptr i64, ptr %t2542, i64 2
  store i64 %a1, ptr %t2545
  %t2546 = or i64 %t2543, 4
  %t2547 = call ptr @rt_alloc_words(i64 3)
  %t2548 = ptrtoint ptr %t2547 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_547" to i64), ptr %t2547
  %t2549 = getelementptr i64, ptr %t2547, i64 1
  store i64 %a0, ptr %t2549
  %t2550 = getelementptr i64, ptr %t2547, i64 2
  store i64 %t2541, ptr %t2550
  %t2551 = or i64 %t2548, 4
  %t2552 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2552)
  %t2553 = and i64 %t2552, -8
  %t2554 = inttoptr i64 %t2553 to ptr
  %t2555 = load i64, ptr %t2554
  %t2556 = inttoptr i64 %t2555 to ptr
  %t2557 = musttail call fastcc i64 %t2556(i64 %t2552, i64 3, i64 %t2546, i64 %a2, i64 %t2551, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2557
}

define fastcc i64 @"scheme.base:code_557"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2562 = icmp eq i64 %argc, 2
  br i1 %t2562, label %argok639, label %arityerr638
arityerr638:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok639:
  %t2563 = call i64 @rt_null_p(i64 %a0)
  %t2564 = icmp ne i64 %t2563, 1
  br i1 %t2564, label %then640, label %else641
then640:
  %t2565 = and i64 %self, -8
  %t2566 = inttoptr i64 %t2565 to ptr
  %t2567 = getelementptr i64, ptr %t2566, i64 1
  %t2568 = load i64, ptr %t2567
  ret i64 %t2568
else641:
  %t2569 = and i64 %self, -8
  %t2570 = inttoptr i64 %t2569 to ptr
  %t2571 = getelementptr i64, ptr %t2570, i64 1
  %t2572 = load i64, ptr %t2571
  %t2573 = call i64 @rt_car(i64 %a0)
  %t2574 = call i64 @rt_vector_set(i64 %t2572, i64 %a1, i64 %t2573)
  %t2575 = call i64 @rt_cdr(i64 %a0)
  %t2576 = or i64 %a1, 8
  %t2577 = and i64 %t2576, 7
  %t2578 = icmp eq i64 %t2577, 0
  br i1 %t2578, label %fixfast642, label %fixslow643
fixfast642:
  %t2579 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2580 = extractvalue {i64, i1} %t2579, 0
  %t2581 = extractvalue {i64, i1} %t2579, 1
  br i1 %t2581, label %fixslow643, label %fixmerge644
fixslow643:
  %t2582 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge644
fixmerge644:
  %t2583 = phi i64 [ %t2580, %fixfast642 ], [ %t2582, %fixslow643 ]
  %t2584 = musttail call fastcc i64 @"scheme.base:code_557"(i64 %self, i64 2, i64 %t2575, i64 %t2583, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2584
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2585 = icmp eq i64 %argc, 1
  br i1 %t2585, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok646:
  %t2586 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2586)
  %t2587 = and i64 %t2586, -8
  %t2588 = inttoptr i64 %t2587 to ptr
  %t2589 = load i64, ptr %t2588
  %t2590 = inttoptr i64 %t2589 to ptr
  %t2591 = call fastcc i64%t2590(i64 %t2586, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2592 = call i64 @rt_make_vector(i64 %t2591, i64 0)
  %t2593 = call ptr @rt_alloc_words(i64 3)
  %t2594 = ptrtoint ptr %t2593 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_557" to i64), ptr %t2593
  %t2595 = or i64 %t2594, 4
  %t2596 = getelementptr i64, ptr %t2593, i64 1
  store i64 %t2592, ptr %t2596
  %t2597 = getelementptr i64, ptr %t2593, i64 2
  store i64 %t2595, ptr %t2597
  %t2598 = musttail call fastcc i64 @"scheme.base:code_557"(i64 %t2595, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2598
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2603 = icmp sge i64 %argc, 0
  br i1 %t2603, label %argok648, label %arityerr647
arityerr647:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok648:
  %t2604 = call ptr @rt_alloc_words(i64 8)
  %t2605 = getelementptr i64, ptr %t2604, i64 0
  store i64 %a0, ptr %t2605
  %t2606 = getelementptr i64, ptr %t2604, i64 1
  store i64 %a1, ptr %t2606
  %t2607 = getelementptr i64, ptr %t2604, i64 2
  store i64 %a2, ptr %t2607
  %t2608 = getelementptr i64, ptr %t2604, i64 3
  store i64 %a3, ptr %t2608
  %t2609 = getelementptr i64, ptr %t2604, i64 4
  store i64 %a4, ptr %t2609
  %t2610 = getelementptr i64, ptr %t2604, i64 5
  store i64 %a5, ptr %t2610
  %t2611 = getelementptr i64, ptr %t2604, i64 6
  store i64 %a6, ptr %t2611
  %t2612 = getelementptr i64, ptr %t2604, i64 7
  store i64 %a7, ptr %t2612
  %t2613 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2604, ptr %overflow)
  %t2614 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t2614)
  %t2615 = and i64 %t2614, -8
  %t2616 = inttoptr i64 %t2615 to ptr
  %t2617 = load i64, ptr %t2616
  %t2618 = inttoptr i64 %t2617 to ptr
  %t2619 = musttail call fastcc i64 %t2618(i64 %t2614, i64 1, i64 %t2613, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2619
}

define fastcc i64 @"scheme.base:code_567"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2624 = icmp eq i64 %argc, 2
  br i1 %t2624, label %argok650, label %arityerr649
arityerr649:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok650:
  %t2625 = call i64 @rt_null_p(i64 %a0)
  %t2626 = icmp ne i64 %t2625, 1
  br i1 %t2626, label %then651, label %else652
then651:
  %t2627 = and i64 %self, -8
  %t2628 = inttoptr i64 %t2627 to ptr
  %t2629 = getelementptr i64, ptr %t2628, i64 1
  %t2630 = load i64, ptr %t2629
  ret i64 %t2630
else652:
  %t2631 = and i64 %self, -8
  %t2632 = inttoptr i64 %t2631 to ptr
  %t2633 = getelementptr i64, ptr %t2632, i64 1
  %t2634 = load i64, ptr %t2633
  %t2635 = call i64 @rt_car(i64 %a0)
  %t2636 = call i64 @rt_bytevector_u8_set(i64 %t2634, i64 %a1, i64 %t2635)
  %t2637 = call i64 @rt_cdr(i64 %a0)
  %t2638 = or i64 %a1, 8
  %t2639 = and i64 %t2638, 7
  %t2640 = icmp eq i64 %t2639, 0
  br i1 %t2640, label %fixfast653, label %fixslow654
fixfast653:
  %t2641 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2642 = extractvalue {i64, i1} %t2641, 0
  %t2643 = extractvalue {i64, i1} %t2641, 1
  br i1 %t2643, label %fixslow654, label %fixmerge655
fixslow654:
  %t2644 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge655
fixmerge655:
  %t2645 = phi i64 [ %t2642, %fixfast653 ], [ %t2644, %fixslow654 ]
  %t2646 = musttail call fastcc i64 @"scheme.base:code_567"(i64 %self, i64 2, i64 %t2637, i64 %t2645, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2646
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2647 = icmp eq i64 %argc, 1
  br i1 %t2647, label %argok657, label %arityerr656
arityerr656:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok657:
  %t2648 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2648)
  %t2649 = and i64 %t2648, -8
  %t2650 = inttoptr i64 %t2649 to ptr
  %t2651 = load i64, ptr %t2650
  %t2652 = inttoptr i64 %t2651 to ptr
  %t2653 = call fastcc i64%t2652(i64 %t2648, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2654 = call i64 @rt_make_bytevector(i64 %t2653, i64 0)
  %t2655 = call ptr @rt_alloc_words(i64 3)
  %t2656 = ptrtoint ptr %t2655 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_567" to i64), ptr %t2655
  %t2657 = or i64 %t2656, 4
  %t2658 = getelementptr i64, ptr %t2655, i64 1
  store i64 %t2654, ptr %t2658
  %t2659 = getelementptr i64, ptr %t2655, i64 2
  store i64 %t2657, ptr %t2659
  %t2660 = musttail call fastcc i64 @"scheme.base:code_567"(i64 %t2657, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2660
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2665 = icmp sge i64 %argc, 0
  br i1 %t2665, label %argok659, label %arityerr658
arityerr658:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok659:
  %t2666 = call ptr @rt_alloc_words(i64 8)
  %t2667 = getelementptr i64, ptr %t2666, i64 0
  store i64 %a0, ptr %t2667
  %t2668 = getelementptr i64, ptr %t2666, i64 1
  store i64 %a1, ptr %t2668
  %t2669 = getelementptr i64, ptr %t2666, i64 2
  store i64 %a2, ptr %t2669
  %t2670 = getelementptr i64, ptr %t2666, i64 3
  store i64 %a3, ptr %t2670
  %t2671 = getelementptr i64, ptr %t2666, i64 4
  store i64 %a4, ptr %t2671
  %t2672 = getelementptr i64, ptr %t2666, i64 5
  store i64 %a5, ptr %t2672
  %t2673 = getelementptr i64, ptr %t2666, i64 6
  store i64 %a6, ptr %t2673
  %t2674 = getelementptr i64, ptr %t2666, i64 7
  store i64 %a7, ptr %t2674
  %t2675 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2666, ptr %overflow)
  %t2676 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t2676)
  %t2677 = and i64 %t2676, -8
  %t2678 = inttoptr i64 %t2677 to ptr
  %t2679 = load i64, ptr %t2678
  %t2680 = inttoptr i64 %t2679 to ptr
  %t2681 = musttail call fastcc i64 %t2680(i64 %t2676, i64 1, i64 %t2675, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2681
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2686 = icmp eq i64 %argc, 1
  br i1 %t2686, label %argok661, label %arityerr660
arityerr660:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok661:
  %t2687 = call i64 @rt_pair_p(i64 %a0)
  %t2688 = icmp ne i64 %t2687, 1
  br i1 %t2688, label %then662, label %else663
then662:
  %t2689 = call i64 @rt_car(i64 %a0)
  ret i64 %t2689
else663:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2694 = icmp eq i64 %argc, 2
  br i1 %t2694, label %argok665, label %arityerr664
arityerr664:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok665:
  %t2695 = call i64 @rt_pair_p(i64 %a0)
  %t2696 = icmp ne i64 %t2695, 1
  br i1 %t2696, label %then666, label %else667
then666:
  %t2697 = call i64 @rt_cdr(i64 %a0)
  %t2698 = call i64 @rt_pair_p(i64 %t2697)
  br label %merge668
else667:
  br label %merge668
merge668:
  %t2699 = phi i64 [ %t2698, %then666 ], [ 1, %else667 ]
  %t2700 = icmp ne i64 %t2699, 1
  br i1 %t2700, label %then669, label %else670
then669:
  %t2701 = call i64 @rt_cdr(i64 %a0)
  %t2702 = call i64 @rt_car(i64 %t2701)
  ret i64 %t2702
else670:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2707 = icmp eq i64 %argc, 4
  br i1 %t2707, label %argok672, label %arityerr671
arityerr671:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok672:
  %t2708 = or i64 0, %a1
  %t2709 = and i64 %t2708, 7
  %t2710 = icmp eq i64 %t2709, 0
  br i1 %t2710, label %fixfast673, label %fixslow674
fixfast673:
  %t2711 = icmp slt i64 0, %a1
  %t2712 = select i1 %t2711, i64 257, i64 1
  br label %fixmerge675
fixslow674:
  %t2713 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge675
fixmerge675:
  %t2714 = phi i64 [ %t2712, %fixfast673 ], [ %t2713, %fixslow674 ]
  %t2715 = icmp ne i64 %t2714, 1
  br i1 %t2715, label %then676, label %else677
then676:
  br label %merge678
else677:
  %t2716 = or i64 0, %a1
  %t2717 = and i64 %t2716, 7
  %t2718 = icmp eq i64 %t2717, 0
  br i1 %t2718, label %fixfast679, label %fixslow680
fixfast679:
  %t2719 = icmp eq i64 0, %a1
  %t2720 = select i1 %t2719, i64 257, i64 1
  br label %fixmerge681
fixslow680:
  %t2721 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge681
fixmerge681:
  %t2722 = phi i64 [ %t2720, %fixfast679 ], [ %t2721, %fixslow680 ]
  br label %merge678
merge678:
  %t2723 = phi i64 [ 257, %then676 ], [ %t2722, %fixmerge681 ]
  %t2724 = icmp ne i64 %t2723, 1
  br i1 %t2724, label %then682, label %else683
then682:
  %t2725 = or i64 %a1, %a2
  %t2726 = and i64 %t2725, 7
  %t2727 = icmp eq i64 %t2726, 0
  br i1 %t2727, label %fixfast685, label %fixslow686
fixfast685:
  %t2728 = icmp slt i64 %a1, %a2
  %t2729 = select i1 %t2728, i64 257, i64 1
  br label %fixmerge687
fixslow686:
  %t2730 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge687
fixmerge687:
  %t2731 = phi i64 [ %t2729, %fixfast685 ], [ %t2730, %fixslow686 ]
  %t2732 = icmp ne i64 %t2731, 1
  br i1 %t2732, label %then688, label %else689
then688:
  br label %merge690
else689:
  %t2733 = or i64 %a1, %a2
  %t2734 = and i64 %t2733, 7
  %t2735 = icmp eq i64 %t2734, 0
  br i1 %t2735, label %fixfast691, label %fixslow692
fixfast691:
  %t2736 = icmp eq i64 %a1, %a2
  %t2737 = select i1 %t2736, i64 257, i64 1
  br label %fixmerge693
fixslow692:
  %t2738 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge693
fixmerge693:
  %t2739 = phi i64 [ %t2737, %fixfast691 ], [ %t2738, %fixslow692 ]
  br label %merge690
merge690:
  %t2740 = phi i64 [ 257, %then688 ], [ %t2739, %fixmerge693 ]
  %t2741 = icmp ne i64 %t2740, 1
  br i1 %t2741, label %then694, label %else695
then694:
  %t2742 = or i64 %a2, %a3
  %t2743 = and i64 %t2742, 7
  %t2744 = icmp eq i64 %t2743, 0
  br i1 %t2744, label %fixfast697, label %fixslow698
fixfast697:
  %t2745 = icmp slt i64 %a2, %a3
  %t2746 = select i1 %t2745, i64 257, i64 1
  br label %fixmerge699
fixslow698:
  %t2747 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge699
fixmerge699:
  %t2748 = phi i64 [ %t2746, %fixfast697 ], [ %t2747, %fixslow698 ]
  %t2749 = icmp ne i64 %t2748, 1
  br i1 %t2749, label %then700, label %else701
then700:
  br label %merge702
else701:
  %t2750 = or i64 %a2, %a3
  %t2751 = and i64 %t2750, 7
  %t2752 = icmp eq i64 %t2751, 0
  br i1 %t2752, label %fixfast703, label %fixslow704
fixfast703:
  %t2753 = icmp eq i64 %a2, %a3
  %t2754 = select i1 %t2753, i64 257, i64 1
  br label %fixmerge705
fixslow704:
  %t2755 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge705
fixmerge705:
  %t2756 = phi i64 [ %t2754, %fixfast703 ], [ %t2755, %fixslow704 ]
  br label %merge702
merge702:
  %t2757 = phi i64 [ 257, %then700 ], [ %t2756, %fixmerge705 ]
  br label %merge696
else695:
  br label %merge696
merge696:
  %t2758 = phi i64 [ %t2757, %merge702 ], [ 1, %else695 ]
  br label %merge684
else683:
  br label %merge684
merge684:
  %t2759 = phi i64 [ %t2758, %merge696 ], [ 1, %else683 ]
  %t2760 = icmp ne i64 %t2759, 1
  br i1 %t2760, label %then706, label %else707
then706:
  ret i64 257
else707:
  %t2761 = call i64 @rt_make_string(ptr @.str.lit.16, i64 19)
  %t2762 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2762)
  %t2763 = and i64 %t2762, -8
  %t2764 = inttoptr i64 %t2763 to ptr
  %t2765 = load i64, ptr %t2764
  %t2766 = inttoptr i64 %t2765 to ptr
  %t2767 = musttail call fastcc i64 %t2766(i64 %t2762, i64 5, i64 %t2761, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2767
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2772 = icmp eq i64 %argc, 2
  br i1 %t2772, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok709:
  %t2773 = call i64 @rt_null_p(i64 %a1)
  %t2774 = icmp ne i64 %t2773, 1
  br i1 %t2774, label %then710, label %else711
then710:
  ret i64 1
else711:
  %t2775 = call i64 @rt_car(i64 %a1)
  %t2776 = call i64 @rt_car(i64 %t2775)
  %t2777 = call i64 @rt_eqv_p(i64 %a0, i64 %t2776)
  %t2778 = icmp ne i64 %t2777, 1
  br i1 %t2778, label %then712, label %else713
then712:
  %t2779 = call i64 @rt_car(i64 %a1)
  ret i64 %t2779
else713:
  %t2780 = call i64 @rt_cdr(i64 %a1)
  %t2781 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t2781)
  %t2782 = and i64 %t2781, -8
  %t2783 = inttoptr i64 %t2782 to ptr
  %t2784 = load i64, ptr %t2783
  %t2785 = inttoptr i64 %t2784 to ptr
  %t2786 = musttail call fastcc i64 %t2785(i64 %t2781, i64 2, i64 %a0, i64 %t2780, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2786
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2791 = icmp eq i64 %argc, 1
  br i1 %t2791, label %argok715, label %arityerr714
arityerr714:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok715:
  %t2792 = call i64 @rt_pair_p(i64 %a0)
  %t2793 = icmp ne i64 %t2792, 1
  br i1 %t2793, label %then716, label %else717
then716:
  %t2794 = call i64 @rt_car(i64 %a0)
  %t2795 = call i64 @rt_cdr(i64 %a0)
  %t2796 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t2796)
  %t2797 = and i64 %t2796, -8
  %t2798 = inttoptr i64 %t2797 to ptr
  %t2799 = load i64, ptr %t2798
  %t2800 = inttoptr i64 %t2799 to ptr
  %t2801 = call fastcc i64%t2800(i64 %t2796, i64 1, i64 %t2795, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2802 = call i64 @rt_cons(i64 %t2794, i64 %t2801)
  ret i64 %t2802
else717:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2807 = icmp sge i64 %argc, 2
  br i1 %t2807, label %argok719, label %arityerr718
arityerr718:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok719:
  %t2808 = call ptr @rt_alloc_words(i64 8)
  %t2809 = getelementptr i64, ptr %t2808, i64 0
  store i64 %a0, ptr %t2809
  %t2810 = getelementptr i64, ptr %t2808, i64 1
  store i64 %a1, ptr %t2810
  %t2811 = getelementptr i64, ptr %t2808, i64 2
  store i64 %a2, ptr %t2811
  %t2812 = getelementptr i64, ptr %t2808, i64 3
  store i64 %a3, ptr %t2812
  %t2813 = getelementptr i64, ptr %t2808, i64 4
  store i64 %a4, ptr %t2813
  %t2814 = getelementptr i64, ptr %t2808, i64 5
  store i64 %a5, ptr %t2814
  %t2815 = getelementptr i64, ptr %t2808, i64 6
  store i64 %a6, ptr %t2815
  %t2816 = getelementptr i64, ptr %t2808, i64 7
  store i64 %a7, ptr %t2816
  %t2817 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2808, ptr %overflow)
  %t2818 = call i64 @rt_cons(i64 %a1, i64 %t2817)
  %t2819 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2819)
  %t2820 = and i64 %t2819, -8
  %t2821 = inttoptr i64 %t2820 to ptr
  %t2822 = load i64, ptr %t2821
  %t2823 = inttoptr i64 %t2822 to ptr
  %t2824 = musttail call fastcc i64 %t2823(i64 %t2819, i64 2, i64 %a0, i64 %t2818, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2824
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2829 = icmp sge i64 %argc, 2
  br i1 %t2829, label %argok721, label %arityerr720
arityerr720:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok721:
  %t2830 = call ptr @rt_alloc_words(i64 8)
  %t2831 = getelementptr i64, ptr %t2830, i64 0
  store i64 %a0, ptr %t2831
  %t2832 = getelementptr i64, ptr %t2830, i64 1
  store i64 %a1, ptr %t2832
  %t2833 = getelementptr i64, ptr %t2830, i64 2
  store i64 %a2, ptr %t2833
  %t2834 = getelementptr i64, ptr %t2830, i64 3
  store i64 %a3, ptr %t2834
  %t2835 = getelementptr i64, ptr %t2830, i64 4
  store i64 %a4, ptr %t2835
  %t2836 = getelementptr i64, ptr %t2830, i64 5
  store i64 %a5, ptr %t2836
  %t2837 = getelementptr i64, ptr %t2830, i64 6
  store i64 %a6, ptr %t2837
  %t2838 = getelementptr i64, ptr %t2830, i64 7
  store i64 %a7, ptr %t2838
  %t2839 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2830, ptr %overflow)
  %t2840 = call i64 @rt_cons(i64 %a1, i64 %t2839)
  %t2841 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2841)
  %t2842 = and i64 %t2841, -8
  %t2843 = inttoptr i64 %t2842 to ptr
  %t2844 = load i64, ptr %t2843
  %t2845 = inttoptr i64 %t2844 to ptr
  %t2846 = musttail call fastcc i64 %t2845(i64 %t2841, i64 2, i64 %a0, i64 %t2840, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2846
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2851 = icmp eq i64 %argc, 2
  br i1 %t2851, label %argok723, label %arityerr722
arityerr722:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok723:
  %t2852 = call i64 @rt_null_p(i64 %a1)
  %t2853 = icmp ne i64 %t2852, 1
  br i1 %t2853, label %then724, label %else725
then724:
  ret i64 257
else725:
  %t2854 = call i64 @rt_car(i64 %a1)
  %t2855 = call i64 @rt_eqv_p(i64 %a0, i64 %t2854)
  %t2856 = icmp ne i64 %t2855, 1
  br i1 %t2856, label %then726, label %else727
then726:
  %t2857 = call i64 @rt_car(i64 %a1)
  %t2858 = call i64 @rt_cdr(i64 %a1)
  %t2859 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2859)
  %t2860 = and i64 %t2859, -8
  %t2861 = inttoptr i64 %t2860 to ptr
  %t2862 = load i64, ptr %t2861
  %t2863 = inttoptr i64 %t2862 to ptr
  %t2864 = musttail call fastcc i64 %t2863(i64 %t2859, i64 2, i64 %t2857, i64 %t2858, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2864
else727:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_650"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2869 = icmp eq i64 %argc, 1
  br i1 %t2869, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok729:
  %t2870 = and i64 %self, -8
  %t2871 = inttoptr i64 %t2870 to ptr
  %t2872 = getelementptr i64, ptr %t2871, i64 1
  %t2873 = load i64, ptr %t2872
  %t2874 = or i64 %a0, %t2873
  %t2875 = and i64 %t2874, 7
  %t2876 = icmp eq i64 %t2875, 0
  br i1 %t2876, label %fixfast730, label %fixslow731
fixfast730:
  %t2877 = icmp eq i64 %a0, %t2873
  %t2878 = select i1 %t2877, i64 257, i64 1
  br label %fixmerge732
fixslow731:
  %t2879 = call i64 @rt_num_eq(i64 %a0, i64 %t2873)
  br label %fixmerge732
fixmerge732:
  %t2880 = phi i64 [ %t2878, %fixfast730 ], [ %t2879, %fixslow731 ]
  %t2881 = icmp ne i64 %t2880, 1
  br i1 %t2881, label %then733, label %else734
then733:
  %t2882 = and i64 %self, -8
  %t2883 = inttoptr i64 %t2882 to ptr
  %t2884 = getelementptr i64, ptr %t2883, i64 2
  %t2885 = load i64, ptr %t2884
  %t2886 = or i64 %a0, %t2885
  %t2887 = and i64 %t2886, 7
  %t2888 = icmp eq i64 %t2887, 0
  br i1 %t2888, label %fixfast736, label %fixslow737
fixfast736:
  %t2889 = icmp eq i64 %a0, %t2885
  %t2890 = select i1 %t2889, i64 257, i64 1
  br label %fixmerge738
fixslow737:
  %t2891 = call i64 @rt_num_eq(i64 %a0, i64 %t2885)
  br label %fixmerge738
fixmerge738:
  %t2892 = phi i64 [ %t2890, %fixfast736 ], [ %t2891, %fixslow737 ]
  br label %merge735
else734:
  br label %merge735
merge735:
  %t2893 = phi i64 [ %t2892, %fixmerge738 ], [ 1, %else734 ]
  %t2894 = icmp ne i64 %t2893, 1
  br i1 %t2894, label %then739, label %else740
then739:
  ret i64 0
else740:
  %t2895 = and i64 %self, -8
  %t2896 = inttoptr i64 %t2895 to ptr
  %t2897 = getelementptr i64, ptr %t2896, i64 1
  %t2898 = load i64, ptr %t2897
  %t2899 = or i64 %a0, %t2898
  %t2900 = and i64 %t2899, 7
  %t2901 = icmp eq i64 %t2900, 0
  br i1 %t2901, label %fixfast741, label %fixslow742
fixfast741:
  %t2902 = icmp eq i64 %a0, %t2898
  %t2903 = select i1 %t2902, i64 257, i64 1
  br label %fixmerge743
fixslow742:
  %t2904 = call i64 @rt_num_eq(i64 %a0, i64 %t2898)
  br label %fixmerge743
fixmerge743:
  %t2905 = phi i64 [ %t2903, %fixfast741 ], [ %t2904, %fixslow742 ]
  %t2906 = icmp ne i64 %t2905, 1
  br i1 %t2906, label %then744, label %else745
then744:
  ret i64 -8
else745:
  %t2907 = and i64 %self, -8
  %t2908 = inttoptr i64 %t2907 to ptr
  %t2909 = getelementptr i64, ptr %t2908, i64 2
  %t2910 = load i64, ptr %t2909
  %t2911 = or i64 %a0, %t2910
  %t2912 = and i64 %t2911, 7
  %t2913 = icmp eq i64 %t2912, 0
  br i1 %t2913, label %fixfast746, label %fixslow747
fixfast746:
  %t2914 = icmp eq i64 %a0, %t2910
  %t2915 = select i1 %t2914, i64 257, i64 1
  br label %fixmerge748
fixslow747:
  %t2916 = call i64 @rt_num_eq(i64 %a0, i64 %t2910)
  br label %fixmerge748
fixmerge748:
  %t2917 = phi i64 [ %t2915, %fixfast746 ], [ %t2916, %fixslow747 ]
  %t2918 = icmp ne i64 %t2917, 1
  br i1 %t2918, label %then749, label %else750
then749:
  ret i64 8
else750:
  %t2919 = and i64 %self, -8
  %t2920 = inttoptr i64 %t2919 to ptr
  %t2921 = getelementptr i64, ptr %t2920, i64 3
  %t2922 = load i64, ptr %t2921
  %t2923 = call i64 @rt_string_ref(i64 %t2922, i64 %a0)
  %t2924 = call i64 @rt_char_to_integer(i64 %t2923)
  %t2925 = and i64 %self, -8
  %t2926 = inttoptr i64 %t2925 to ptr
  %t2927 = getelementptr i64, ptr %t2926, i64 4
  %t2928 = load i64, ptr %t2927
  %t2929 = call i64 @rt_string_ref(i64 %t2928, i64 %a0)
  %t2930 = call i64 @rt_char_to_integer(i64 %t2929)
  %t2931 = or i64 %t2924, %t2930
  %t2932 = and i64 %t2931, 7
  %t2933 = icmp eq i64 %t2932, 0
  br i1 %t2933, label %fixfast751, label %fixslow752
fixfast751:
  %t2934 = icmp slt i64 %t2924, %t2930
  %t2935 = select i1 %t2934, i64 257, i64 1
  br label %fixmerge753
fixslow752:
  %t2936 = call i64 @rt_lt(i64 %t2924, i64 %t2930)
  br label %fixmerge753
fixmerge753:
  %t2937 = phi i64 [ %t2935, %fixfast751 ], [ %t2936, %fixslow752 ]
  %t2938 = icmp ne i64 %t2937, 1
  br i1 %t2938, label %then754, label %else755
then754:
  ret i64 -8
else755:
  %t2939 = or i64 %t2930, %t2924
  %t2940 = and i64 %t2939, 7
  %t2941 = icmp eq i64 %t2940, 0
  br i1 %t2941, label %fixfast756, label %fixslow757
fixfast756:
  %t2942 = icmp slt i64 %t2930, %t2924
  %t2943 = select i1 %t2942, i64 257, i64 1
  br label %fixmerge758
fixslow757:
  %t2944 = call i64 @rt_lt(i64 %t2930, i64 %t2924)
  br label %fixmerge758
fixmerge758:
  %t2945 = phi i64 [ %t2943, %fixfast756 ], [ %t2944, %fixslow757 ]
  %t2946 = icmp ne i64 %t2945, 1
  br i1 %t2946, label %then759, label %else760
then759:
  ret i64 8
else760:
  %t2947 = or i64 %a0, 8
  %t2948 = and i64 %t2947, 7
  %t2949 = icmp eq i64 %t2948, 0
  br i1 %t2949, label %fixfast761, label %fixslow762
fixfast761:
  %t2950 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2951 = extractvalue {i64, i1} %t2950, 0
  %t2952 = extractvalue {i64, i1} %t2950, 1
  br i1 %t2952, label %fixslow762, label %fixmerge763
fixslow762:
  %t2953 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge763
fixmerge763:
  %t2954 = phi i64 [ %t2951, %fixfast761 ], [ %t2953, %fixslow762 ]
  %t2955 = musttail call fastcc i64 @"scheme.base:code_650"(i64 %self, i64 1, i64 %t2954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2955
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2956 = icmp eq i64 %argc, 2
  br i1 %t2956, label %argok765, label %arityerr764
arityerr764:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok765:
  %t2957 = call i64 @rt_string_length(i64 %a0)
  %t2958 = call i64 @rt_string_length(i64 %a1)
  %t2959 = call ptr @rt_alloc_words(i64 6)
  %t2960 = ptrtoint ptr %t2959 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_650" to i64), ptr %t2959
  %t2961 = or i64 %t2960, 4
  %t2962 = getelementptr i64, ptr %t2959, i64 1
  store i64 %t2957, ptr %t2962
  %t2963 = getelementptr i64, ptr %t2959, i64 2
  store i64 %t2958, ptr %t2963
  %t2964 = getelementptr i64, ptr %t2959, i64 3
  store i64 %a0, ptr %t2964
  %t2965 = getelementptr i64, ptr %t2959, i64 4
  store i64 %a1, ptr %t2965
  %t2966 = getelementptr i64, ptr %t2959, i64 5
  store i64 %t2961, ptr %t2966
  %t2967 = musttail call fastcc i64 @"scheme.base:code_650"(i64 %t2961, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2967
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2972 = icmp eq i64 %argc, 3
  br i1 %t2972, label %argok767, label %arityerr766
arityerr766:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok767:
  %t2973 = call i64 @rt_null_p(i64 %a2)
  %t2974 = icmp ne i64 %t2973, 1
  br i1 %t2974, label %then768, label %else769
then768:
  ret i64 257
else769:
  %t2975 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t2976 = and i64 %a0, -8
  %t2977 = inttoptr i64 %t2976 to ptr
  %t2978 = load i64, ptr %t2977
  %t2979 = inttoptr i64 %t2978 to ptr
  %t2980 = call fastcc i64%t2979(i64 %a0, i64 2, i64 %a1, i64 %t2975, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2981 = icmp ne i64 %t2980, 1
  br i1 %t2981, label %then770, label %else771
then770:
  %t2982 = call i64 @rt_car(i64 %a2)
  %t2983 = call i64 @rt_cdr(i64 %a2)
  %t2984 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t2984)
  %t2985 = and i64 %t2984, -8
  %t2986 = inttoptr i64 %t2985 to ptr
  %t2987 = load i64, ptr %t2986
  %t2988 = inttoptr i64 %t2987 to ptr
  %t2989 = musttail call fastcc i64 %t2988(i64 %t2984, i64 3, i64 %a0, i64 %t2982, i64 %t2983, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2989
else771:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_666"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2994 = icmp eq i64 %argc, 2
  br i1 %t2994, label %argok773, label %arityerr772
arityerr772:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok773:
  %t2995 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t2995)
  %t2996 = and i64 %t2995, -8
  %t2997 = inttoptr i64 %t2996 to ptr
  %t2998 = load i64, ptr %t2997
  %t2999 = inttoptr i64 %t2998 to ptr
  %t3000 = call fastcc i64%t2999(i64 %t2995, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3001 = or i64 %t3000, 0
  %t3002 = and i64 %t3001, 7
  %t3003 = icmp eq i64 %t3002, 0
  br i1 %t3003, label %fixfast774, label %fixslow775
fixfast774:
  %t3004 = icmp slt i64 %t3000, 0
  %t3005 = select i1 %t3004, i64 257, i64 1
  br label %fixmerge776
fixslow775:
  %t3006 = call i64 @rt_lt(i64 %t3000, i64 0)
  br label %fixmerge776
fixmerge776:
  %t3007 = phi i64 [ %t3005, %fixfast774 ], [ %t3006, %fixslow775 ]
  ret i64 %t3007
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3008 = icmp sge i64 %argc, 2
  br i1 %t3008, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok778:
  %t3009 = call ptr @rt_alloc_words(i64 8)
  %t3010 = getelementptr i64, ptr %t3009, i64 0
  store i64 %a0, ptr %t3010
  %t3011 = getelementptr i64, ptr %t3009, i64 1
  store i64 %a1, ptr %t3011
  %t3012 = getelementptr i64, ptr %t3009, i64 2
  store i64 %a2, ptr %t3012
  %t3013 = getelementptr i64, ptr %t3009, i64 3
  store i64 %a3, ptr %t3013
  %t3014 = getelementptr i64, ptr %t3009, i64 4
  store i64 %a4, ptr %t3014
  %t3015 = getelementptr i64, ptr %t3009, i64 5
  store i64 %a5, ptr %t3015
  %t3016 = getelementptr i64, ptr %t3009, i64 6
  store i64 %a6, ptr %t3016
  %t3017 = getelementptr i64, ptr %t3009, i64 7
  store i64 %a7, ptr %t3017
  %t3018 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3009, ptr %overflow)
  %t3019 = call ptr @rt_alloc_words(i64 1)
  %t3020 = ptrtoint ptr %t3019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_666" to i64), ptr %t3019
  %t3021 = or i64 %t3020, 4
  %t3022 = call i64 @rt_cons(i64 %a1, i64 %t3018)
  %t3023 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3023)
  %t3024 = and i64 %t3023, -8
  %t3025 = inttoptr i64 %t3024 to ptr
  %t3026 = load i64, ptr %t3025
  %t3027 = inttoptr i64 %t3026 to ptr
  %t3028 = musttail call fastcc i64 %t3027(i64 %t3023, i64 3, i64 %t3021, i64 %a0, i64 %t3022, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3028
}

define fastcc i64 @"scheme.base:code_678"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3033 = icmp eq i64 %argc, 2
  br i1 %t3033, label %argok780, label %arityerr779
arityerr779:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok780:
  %t3034 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3034)
  %t3035 = and i64 %t3034, -8
  %t3036 = inttoptr i64 %t3035 to ptr
  %t3037 = load i64, ptr %t3036
  %t3038 = inttoptr i64 %t3037 to ptr
  %t3039 = call fastcc i64%t3038(i64 %t3034, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3040 = or i64 0, %t3039
  %t3041 = and i64 %t3040, 7
  %t3042 = icmp eq i64 %t3041, 0
  br i1 %t3042, label %fixfast781, label %fixslow782
fixfast781:
  %t3043 = icmp slt i64 0, %t3039
  %t3044 = select i1 %t3043, i64 257, i64 1
  br label %fixmerge783
fixslow782:
  %t3045 = call i64 @rt_lt(i64 0, i64 %t3039)
  br label %fixmerge783
fixmerge783:
  %t3046 = phi i64 [ %t3044, %fixfast781 ], [ %t3045, %fixslow782 ]
  ret i64 %t3046
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3047 = icmp sge i64 %argc, 2
  br i1 %t3047, label %argok785, label %arityerr784
arityerr784:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok785:
  %t3048 = call ptr @rt_alloc_words(i64 8)
  %t3049 = getelementptr i64, ptr %t3048, i64 0
  store i64 %a0, ptr %t3049
  %t3050 = getelementptr i64, ptr %t3048, i64 1
  store i64 %a1, ptr %t3050
  %t3051 = getelementptr i64, ptr %t3048, i64 2
  store i64 %a2, ptr %t3051
  %t3052 = getelementptr i64, ptr %t3048, i64 3
  store i64 %a3, ptr %t3052
  %t3053 = getelementptr i64, ptr %t3048, i64 4
  store i64 %a4, ptr %t3053
  %t3054 = getelementptr i64, ptr %t3048, i64 5
  store i64 %a5, ptr %t3054
  %t3055 = getelementptr i64, ptr %t3048, i64 6
  store i64 %a6, ptr %t3055
  %t3056 = getelementptr i64, ptr %t3048, i64 7
  store i64 %a7, ptr %t3056
  %t3057 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3048, ptr %overflow)
  %t3058 = call ptr @rt_alloc_words(i64 1)
  %t3059 = ptrtoint ptr %t3058 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_678" to i64), ptr %t3058
  %t3060 = or i64 %t3059, 4
  %t3061 = call i64 @rt_cons(i64 %a1, i64 %t3057)
  %t3062 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3062)
  %t3063 = and i64 %t3062, -8
  %t3064 = inttoptr i64 %t3063 to ptr
  %t3065 = load i64, ptr %t3064
  %t3066 = inttoptr i64 %t3065 to ptr
  %t3067 = musttail call fastcc i64 %t3066(i64 %t3062, i64 3, i64 %t3060, i64 %a0, i64 %t3061, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3067
}

define fastcc i64 @"scheme.base:code_690"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3072 = icmp eq i64 %argc, 2
  br i1 %t3072, label %argok787, label %arityerr786
arityerr786:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok787:
  %t3073 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3073)
  %t3074 = and i64 %t3073, -8
  %t3075 = inttoptr i64 %t3074 to ptr
  %t3076 = load i64, ptr %t3075
  %t3077 = inttoptr i64 %t3076 to ptr
  %t3078 = call fastcc i64%t3077(i64 %t3073, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3079 = or i64 0, %t3078
  %t3080 = and i64 %t3079, 7
  %t3081 = icmp eq i64 %t3080, 0
  br i1 %t3081, label %fixfast788, label %fixslow789
fixfast788:
  %t3082 = icmp slt i64 0, %t3078
  %t3083 = select i1 %t3082, i64 257, i64 1
  br label %fixmerge790
fixslow789:
  %t3084 = call i64 @rt_lt(i64 0, i64 %t3078)
  br label %fixmerge790
fixmerge790:
  %t3085 = phi i64 [ %t3083, %fixfast788 ], [ %t3084, %fixslow789 ]
  %t3086 = call i64 @rt_not(i64 %t3085)
  ret i64 %t3086
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3087 = icmp sge i64 %argc, 2
  br i1 %t3087, label %argok792, label %arityerr791
arityerr791:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok792:
  %t3088 = call ptr @rt_alloc_words(i64 8)
  %t3089 = getelementptr i64, ptr %t3088, i64 0
  store i64 %a0, ptr %t3089
  %t3090 = getelementptr i64, ptr %t3088, i64 1
  store i64 %a1, ptr %t3090
  %t3091 = getelementptr i64, ptr %t3088, i64 2
  store i64 %a2, ptr %t3091
  %t3092 = getelementptr i64, ptr %t3088, i64 3
  store i64 %a3, ptr %t3092
  %t3093 = getelementptr i64, ptr %t3088, i64 4
  store i64 %a4, ptr %t3093
  %t3094 = getelementptr i64, ptr %t3088, i64 5
  store i64 %a5, ptr %t3094
  %t3095 = getelementptr i64, ptr %t3088, i64 6
  store i64 %a6, ptr %t3095
  %t3096 = getelementptr i64, ptr %t3088, i64 7
  store i64 %a7, ptr %t3096
  %t3097 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3088, ptr %overflow)
  %t3098 = call ptr @rt_alloc_words(i64 1)
  %t3099 = ptrtoint ptr %t3098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t3098
  %t3100 = or i64 %t3099, 4
  %t3101 = call i64 @rt_cons(i64 %a1, i64 %t3097)
  %t3102 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3102)
  %t3103 = and i64 %t3102, -8
  %t3104 = inttoptr i64 %t3103 to ptr
  %t3105 = load i64, ptr %t3104
  %t3106 = inttoptr i64 %t3105 to ptr
  %t3107 = musttail call fastcc i64 %t3106(i64 %t3102, i64 3, i64 %t3100, i64 %a0, i64 %t3101, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3107
}

define fastcc i64 @"scheme.base:code_702"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3112 = icmp eq i64 %argc, 2
  br i1 %t3112, label %argok794, label %arityerr793
arityerr793:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok794:
  %t3113 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3113)
  %t3114 = and i64 %t3113, -8
  %t3115 = inttoptr i64 %t3114 to ptr
  %t3116 = load i64, ptr %t3115
  %t3117 = inttoptr i64 %t3116 to ptr
  %t3118 = call fastcc i64%t3117(i64 %t3113, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3119 = or i64 %t3118, 0
  %t3120 = and i64 %t3119, 7
  %t3121 = icmp eq i64 %t3120, 0
  br i1 %t3121, label %fixfast795, label %fixslow796
fixfast795:
  %t3122 = icmp slt i64 %t3118, 0
  %t3123 = select i1 %t3122, i64 257, i64 1
  br label %fixmerge797
fixslow796:
  %t3124 = call i64 @rt_lt(i64 %t3118, i64 0)
  br label %fixmerge797
fixmerge797:
  %t3125 = phi i64 [ %t3123, %fixfast795 ], [ %t3124, %fixslow796 ]
  %t3126 = call i64 @rt_not(i64 %t3125)
  ret i64 %t3126
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3127 = icmp sge i64 %argc, 2
  br i1 %t3127, label %argok799, label %arityerr798
arityerr798:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok799:
  %t3128 = call ptr @rt_alloc_words(i64 8)
  %t3129 = getelementptr i64, ptr %t3128, i64 0
  store i64 %a0, ptr %t3129
  %t3130 = getelementptr i64, ptr %t3128, i64 1
  store i64 %a1, ptr %t3130
  %t3131 = getelementptr i64, ptr %t3128, i64 2
  store i64 %a2, ptr %t3131
  %t3132 = getelementptr i64, ptr %t3128, i64 3
  store i64 %a3, ptr %t3132
  %t3133 = getelementptr i64, ptr %t3128, i64 4
  store i64 %a4, ptr %t3133
  %t3134 = getelementptr i64, ptr %t3128, i64 5
  store i64 %a5, ptr %t3134
  %t3135 = getelementptr i64, ptr %t3128, i64 6
  store i64 %a6, ptr %t3135
  %t3136 = getelementptr i64, ptr %t3128, i64 7
  store i64 %a7, ptr %t3136
  %t3137 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3128, ptr %overflow)
  %t3138 = call ptr @rt_alloc_words(i64 1)
  %t3139 = ptrtoint ptr %t3138 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_702" to i64), ptr %t3138
  %t3140 = or i64 %t3139, 4
  %t3141 = call i64 @rt_cons(i64 %a1, i64 %t3137)
  %t3142 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3142)
  %t3143 = and i64 %t3142, -8
  %t3144 = inttoptr i64 %t3143 to ptr
  %t3145 = load i64, ptr %t3144
  %t3146 = inttoptr i64 %t3145 to ptr
  %t3147 = musttail call fastcc i64 %t3146(i64 %t3142, i64 3, i64 %t3140, i64 %a0, i64 %t3141, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3147
}

define fastcc i64 @"scheme.base:code_717"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3152 = icmp eq i64 %argc, 2
  br i1 %t3152, label %argok801, label %arityerr800
arityerr800:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok801:
  %t3153 = and i64 %self, -8
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = getelementptr i64, ptr %t3154, i64 1
  %t3156 = load i64, ptr %t3155
  %t3157 = or i64 %a0, %t3156
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast802, label %fixslow803
fixfast802:
  %t3160 = icmp slt i64 %a0, %t3156
  %t3161 = select i1 %t3160, i64 257, i64 1
  br label %fixmerge804
fixslow803:
  %t3162 = call i64 @rt_lt(i64 %a0, i64 %t3156)
  br label %fixmerge804
fixmerge804:
  %t3163 = phi i64 [ %t3161, %fixfast802 ], [ %t3162, %fixslow803 ]
  %t3164 = icmp ne i64 %t3163, 1
  br i1 %t3164, label %then805, label %else806
then805:
  ret i64 %a1
else806:
  %t3165 = or i64 %a0, 8
  %t3166 = and i64 %t3165, 7
  %t3167 = icmp eq i64 %t3166, 0
  br i1 %t3167, label %fixfast807, label %fixslow808
fixfast807:
  %t3168 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3169 = extractvalue {i64, i1} %t3168, 0
  %t3170 = extractvalue {i64, i1} %t3168, 1
  br i1 %t3170, label %fixslow808, label %fixmerge809
fixslow808:
  %t3171 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge809
fixmerge809:
  %t3172 = phi i64 [ %t3169, %fixfast807 ], [ %t3171, %fixslow808 ]
  %t3173 = and i64 %self, -8
  %t3174 = inttoptr i64 %t3173 to ptr
  %t3175 = getelementptr i64, ptr %t3174, i64 3
  %t3176 = load i64, ptr %t3175
  %t3177 = call i64 @rt_vector_ref(i64 %t3176, i64 %a0)
  %t3178 = call i64 @rt_cons(i64 %t3177, i64 %a1)
  %t3179 = musttail call fastcc i64 @"scheme.base:code_717"(i64 %self, i64 2, i64 %t3172, i64 %t3178, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3179
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3180 = icmp sge i64 %argc, 1
  br i1 %t3180, label %argok811, label %arityerr810
arityerr810:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok811:
  %t3181 = call ptr @rt_alloc_words(i64 8)
  %t3182 = getelementptr i64, ptr %t3181, i64 0
  store i64 %a0, ptr %t3182
  %t3183 = getelementptr i64, ptr %t3181, i64 1
  store i64 %a1, ptr %t3183
  %t3184 = getelementptr i64, ptr %t3181, i64 2
  store i64 %a2, ptr %t3184
  %t3185 = getelementptr i64, ptr %t3181, i64 3
  store i64 %a3, ptr %t3185
  %t3186 = getelementptr i64, ptr %t3181, i64 4
  store i64 %a4, ptr %t3186
  %t3187 = getelementptr i64, ptr %t3181, i64 5
  store i64 %a5, ptr %t3187
  %t3188 = getelementptr i64, ptr %t3181, i64 6
  store i64 %a6, ptr %t3188
  %t3189 = getelementptr i64, ptr %t3181, i64 7
  store i64 %a7, ptr %t3189
  %t3190 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3181, ptr %overflow)
  %t3191 = call i64 @rt_vector_length(i64 %a0)
  %t3192 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3192)
  %t3193 = and i64 %t3192, -8
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = load i64, ptr %t3194
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = call fastcc i64%t3196(i64 %t3192, i64 1, i64 %t3190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3198 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3198)
  %t3199 = and i64 %t3198, -8
  %t3200 = inttoptr i64 %t3199 to ptr
  %t3201 = load i64, ptr %t3200
  %t3202 = inttoptr i64 %t3201 to ptr
  %t3203 = call fastcc i64%t3202(i64 %t3198, i64 2, i64 %t3190, i64 %t3191, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3204 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3205 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3205)
  %t3206 = and i64 %t3205, -8
  %t3207 = inttoptr i64 %t3206 to ptr
  %t3208 = load i64, ptr %t3207
  %t3209 = inttoptr i64 %t3208 to ptr
  %t3210 = call fastcc i64%t3209(i64 %t3205, i64 4, i64 %t3204, i64 %t3197, i64 %t3203, i64 %t3191, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3211 = call ptr @rt_alloc_words(i64 4)
  %t3212 = ptrtoint ptr %t3211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_717" to i64), ptr %t3211
  %t3213 = or i64 %t3212, 4
  %t3214 = getelementptr i64, ptr %t3211, i64 1
  store i64 %t3197, ptr %t3214
  %t3215 = getelementptr i64, ptr %t3211, i64 2
  store i64 %t3213, ptr %t3215
  %t3216 = getelementptr i64, ptr %t3211, i64 3
  store i64 %a0, ptr %t3216
  %t3217 = or i64 %t3203, 8
  %t3218 = and i64 %t3217, 7
  %t3219 = icmp eq i64 %t3218, 0
  br i1 %t3219, label %fixfast812, label %fixslow813
fixfast812:
  %t3220 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3203, i64 8)
  %t3221 = extractvalue {i64, i1} %t3220, 0
  %t3222 = extractvalue {i64, i1} %t3220, 1
  br i1 %t3222, label %fixslow813, label %fixmerge814
fixslow813:
  %t3223 = call i64 @rt_sub(i64 %t3203, i64 8)
  br label %fixmerge814
fixmerge814:
  %t3224 = phi i64 [ %t3221, %fixfast812 ], [ %t3223, %fixslow813 ]
  %t3225 = musttail call fastcc i64 @"scheme.base:code_717"(i64 %t3213, i64 2, i64 %t3224, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3225
}

define fastcc i64 @"scheme.base:code_732"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3230 = icmp eq i64 %argc, 1
  br i1 %t3230, label %argok816, label %arityerr815
arityerr815:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok816:
  %t3231 = and i64 %self, -8
  %t3232 = inttoptr i64 %t3231 to ptr
  %t3233 = getelementptr i64, ptr %t3232, i64 1
  %t3234 = load i64, ptr %t3233
  %t3235 = or i64 %a0, %t3234
  %t3236 = and i64 %t3235, 7
  %t3237 = icmp eq i64 %t3236, 0
  br i1 %t3237, label %fixfast817, label %fixslow818
fixfast817:
  %t3238 = icmp eq i64 %a0, %t3234
  %t3239 = select i1 %t3238, i64 257, i64 1
  br label %fixmerge819
fixslow818:
  %t3240 = call i64 @rt_num_eq(i64 %a0, i64 %t3234)
  br label %fixmerge819
fixmerge819:
  %t3241 = phi i64 [ %t3239, %fixfast817 ], [ %t3240, %fixslow818 ]
  %t3242 = icmp ne i64 %t3241, 1
  br i1 %t3242, label %then820, label %else821
then820:
  %t3243 = and i64 %self, -8
  %t3244 = inttoptr i64 %t3243 to ptr
  %t3245 = getelementptr i64, ptr %t3244, i64 2
  %t3246 = load i64, ptr %t3245
  ret i64 %t3246
else821:
  %t3247 = and i64 %self, -8
  %t3248 = inttoptr i64 %t3247 to ptr
  %t3249 = getelementptr i64, ptr %t3248, i64 2
  %t3250 = load i64, ptr %t3249
  %t3251 = and i64 %self, -8
  %t3252 = inttoptr i64 %t3251 to ptr
  %t3253 = getelementptr i64, ptr %t3252, i64 3
  %t3254 = load i64, ptr %t3253
  %t3255 = or i64 %a0, %t3254
  %t3256 = and i64 %t3255, 7
  %t3257 = icmp eq i64 %t3256, 0
  br i1 %t3257, label %fixfast822, label %fixslow823
fixfast822:
  %t3258 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3254)
  %t3259 = extractvalue {i64, i1} %t3258, 0
  %t3260 = extractvalue {i64, i1} %t3258, 1
  br i1 %t3260, label %fixslow823, label %fixmerge824
fixslow823:
  %t3261 = call i64 @rt_sub(i64 %a0, i64 %t3254)
  br label %fixmerge824
fixmerge824:
  %t3262 = phi i64 [ %t3259, %fixfast822 ], [ %t3261, %fixslow823 ]
  %t3263 = and i64 %self, -8
  %t3264 = inttoptr i64 %t3263 to ptr
  %t3265 = getelementptr i64, ptr %t3264, i64 4
  %t3266 = load i64, ptr %t3265
  %t3267 = call i64 @rt_vector_ref(i64 %t3266, i64 %a0)
  %t3268 = call i64 @rt_vector_set(i64 %t3250, i64 %t3262, i64 %t3267)
  %t3269 = or i64 %a0, 8
  %t3270 = and i64 %t3269, 7
  %t3271 = icmp eq i64 %t3270, 0
  br i1 %t3271, label %fixfast825, label %fixslow826
fixfast825:
  %t3272 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3273 = extractvalue {i64, i1} %t3272, 0
  %t3274 = extractvalue {i64, i1} %t3272, 1
  br i1 %t3274, label %fixslow826, label %fixmerge827
fixslow826:
  %t3275 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge827
fixmerge827:
  %t3276 = phi i64 [ %t3273, %fixfast825 ], [ %t3275, %fixslow826 ]
  %t3277 = musttail call fastcc i64 @"scheme.base:code_732"(i64 %self, i64 1, i64 %t3276, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3277
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3278 = icmp sge i64 %argc, 1
  br i1 %t3278, label %argok829, label %arityerr828
arityerr828:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok829:
  %t3279 = call ptr @rt_alloc_words(i64 8)
  %t3280 = getelementptr i64, ptr %t3279, i64 0
  store i64 %a0, ptr %t3280
  %t3281 = getelementptr i64, ptr %t3279, i64 1
  store i64 %a1, ptr %t3281
  %t3282 = getelementptr i64, ptr %t3279, i64 2
  store i64 %a2, ptr %t3282
  %t3283 = getelementptr i64, ptr %t3279, i64 3
  store i64 %a3, ptr %t3283
  %t3284 = getelementptr i64, ptr %t3279, i64 4
  store i64 %a4, ptr %t3284
  %t3285 = getelementptr i64, ptr %t3279, i64 5
  store i64 %a5, ptr %t3285
  %t3286 = getelementptr i64, ptr %t3279, i64 6
  store i64 %a6, ptr %t3286
  %t3287 = getelementptr i64, ptr %t3279, i64 7
  store i64 %a7, ptr %t3287
  %t3288 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3279, ptr %overflow)
  %t3289 = call i64 @rt_vector_length(i64 %a0)
  %t3290 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3290)
  %t3291 = and i64 %t3290, -8
  %t3292 = inttoptr i64 %t3291 to ptr
  %t3293 = load i64, ptr %t3292
  %t3294 = inttoptr i64 %t3293 to ptr
  %t3295 = call fastcc i64%t3294(i64 %t3290, i64 1, i64 %t3288, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3296 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3296)
  %t3297 = and i64 %t3296, -8
  %t3298 = inttoptr i64 %t3297 to ptr
  %t3299 = load i64, ptr %t3298
  %t3300 = inttoptr i64 %t3299 to ptr
  %t3301 = call fastcc i64%t3300(i64 %t3296, i64 2, i64 %t3288, i64 %t3289, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3302 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3303 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3303)
  %t3304 = and i64 %t3303, -8
  %t3305 = inttoptr i64 %t3304 to ptr
  %t3306 = load i64, ptr %t3305
  %t3307 = inttoptr i64 %t3306 to ptr
  %t3308 = call fastcc i64%t3307(i64 %t3303, i64 4, i64 %t3302, i64 %t3295, i64 %t3301, i64 %t3289, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3309 = or i64 %t3301, %t3295
  %t3310 = and i64 %t3309, 7
  %t3311 = icmp eq i64 %t3310, 0
  br i1 %t3311, label %fixfast830, label %fixslow831
fixfast830:
  %t3312 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3301, i64 %t3295)
  %t3313 = extractvalue {i64, i1} %t3312, 0
  %t3314 = extractvalue {i64, i1} %t3312, 1
  br i1 %t3314, label %fixslow831, label %fixmerge832
fixslow831:
  %t3315 = call i64 @rt_sub(i64 %t3301, i64 %t3295)
  br label %fixmerge832
fixmerge832:
  %t3316 = phi i64 [ %t3313, %fixfast830 ], [ %t3315, %fixslow831 ]
  %t3317 = call i64 @rt_make_vector(i64 %t3316, i64 0)
  %t3318 = call ptr @rt_alloc_words(i64 6)
  %t3319 = ptrtoint ptr %t3318 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_732" to i64), ptr %t3318
  %t3320 = or i64 %t3319, 4
  %t3321 = getelementptr i64, ptr %t3318, i64 1
  store i64 %t3301, ptr %t3321
  %t3322 = getelementptr i64, ptr %t3318, i64 2
  store i64 %t3317, ptr %t3322
  %t3323 = getelementptr i64, ptr %t3318, i64 3
  store i64 %t3295, ptr %t3323
  %t3324 = getelementptr i64, ptr %t3318, i64 4
  store i64 %a0, ptr %t3324
  %t3325 = getelementptr i64, ptr %t3318, i64 5
  store i64 %t3320, ptr %t3325
  %t3326 = musttail call fastcc i64 @"scheme.base:code_732"(i64 %t3320, i64 1, i64 %t3295, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3326
}

define fastcc i64 @"scheme.base:code_750"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3331 = icmp eq i64 %argc, 1
  br i1 %t3331, label %argok834, label %arityerr833
arityerr833:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok834:
  %t3332 = and i64 %self, -8
  %t3333 = inttoptr i64 %t3332 to ptr
  %t3334 = getelementptr i64, ptr %t3333, i64 1
  %t3335 = load i64, ptr %t3334
  %t3336 = or i64 %a0, %t3335
  %t3337 = and i64 %t3336, 7
  %t3338 = icmp eq i64 %t3337, 0
  br i1 %t3338, label %fixfast835, label %fixslow836
fixfast835:
  %t3339 = icmp eq i64 %a0, %t3335
  %t3340 = select i1 %t3339, i64 257, i64 1
  br label %fixmerge837
fixslow836:
  %t3341 = call i64 @rt_num_eq(i64 %a0, i64 %t3335)
  br label %fixmerge837
fixmerge837:
  %t3342 = phi i64 [ %t3340, %fixfast835 ], [ %t3341, %fixslow836 ]
  %t3343 = icmp ne i64 %t3342, 1
  br i1 %t3343, label %then838, label %else839
then838:
  %t3344 = and i64 %self, -8
  %t3345 = inttoptr i64 %t3344 to ptr
  %t3346 = getelementptr i64, ptr %t3345, i64 3
  %t3347 = load i64, ptr %t3346
  %t3348 = call i64 @rt_cdr(i64 %t3347)
  %t3349 = and i64 %self, -8
  %t3350 = inttoptr i64 %t3349 to ptr
  %t3351 = getelementptr i64, ptr %t3350, i64 4
  %t3352 = load i64, ptr %t3351
  %t3353 = and i64 %self, -8
  %t3354 = inttoptr i64 %t3353 to ptr
  %t3355 = getelementptr i64, ptr %t3354, i64 1
  %t3356 = load i64, ptr %t3355
  %t3357 = or i64 %t3352, %t3356
  %t3358 = and i64 %t3357, 7
  %t3359 = icmp eq i64 %t3358, 0
  br i1 %t3359, label %fixfast840, label %fixslow841
fixfast840:
  %t3360 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3352, i64 %t3356)
  %t3361 = extractvalue {i64, i1} %t3360, 0
  %t3362 = extractvalue {i64, i1} %t3360, 1
  br i1 %t3362, label %fixslow841, label %fixmerge842
fixslow841:
  %t3363 = call i64 @rt_add(i64 %t3352, i64 %t3356)
  br label %fixmerge842
fixmerge842:
  %t3364 = phi i64 [ %t3361, %fixfast840 ], [ %t3363, %fixslow841 ]
  %t3365 = and i64 %self, -8
  %t3366 = inttoptr i64 %t3365 to ptr
  %t3367 = getelementptr i64, ptr %t3366, i64 2
  %t3368 = load i64, ptr %t3367
  %t3369 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %t3368, i64 2, i64 %t3348, i64 %t3364, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3369
else839:
  %t3370 = and i64 %self, -8
  %t3371 = inttoptr i64 %t3370 to ptr
  %t3372 = getelementptr i64, ptr %t3371, i64 5
  %t3373 = load i64, ptr %t3372
  %t3374 = and i64 %self, -8
  %t3375 = inttoptr i64 %t3374 to ptr
  %t3376 = getelementptr i64, ptr %t3375, i64 4
  %t3377 = load i64, ptr %t3376
  %t3378 = or i64 %t3377, %a0
  %t3379 = and i64 %t3378, 7
  %t3380 = icmp eq i64 %t3379, 0
  br i1 %t3380, label %fixfast843, label %fixslow844
fixfast843:
  %t3381 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3377, i64 %a0)
  %t3382 = extractvalue {i64, i1} %t3381, 0
  %t3383 = extractvalue {i64, i1} %t3381, 1
  br i1 %t3383, label %fixslow844, label %fixmerge845
fixslow844:
  %t3384 = call i64 @rt_add(i64 %t3377, i64 %a0)
  br label %fixmerge845
fixmerge845:
  %t3385 = phi i64 [ %t3382, %fixfast843 ], [ %t3384, %fixslow844 ]
  %t3386 = and i64 %self, -8
  %t3387 = inttoptr i64 %t3386 to ptr
  %t3388 = getelementptr i64, ptr %t3387, i64 6
  %t3389 = load i64, ptr %t3388
  %t3390 = call i64 @rt_vector_ref(i64 %t3389, i64 %a0)
  %t3391 = call i64 @rt_vector_set(i64 %t3373, i64 %t3385, i64 %t3390)
  %t3392 = or i64 %a0, 8
  %t3393 = and i64 %t3392, 7
  %t3394 = icmp eq i64 %t3393, 0
  br i1 %t3394, label %fixfast846, label %fixslow847
fixfast846:
  %t3395 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3396 = extractvalue {i64, i1} %t3395, 0
  %t3397 = extractvalue {i64, i1} %t3395, 1
  br i1 %t3397, label %fixslow847, label %fixmerge848
fixslow847:
  %t3398 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge848
fixmerge848:
  %t3399 = phi i64 [ %t3396, %fixfast846 ], [ %t3398, %fixslow847 ]
  %t3400 = musttail call fastcc i64 @"scheme.base:code_750"(i64 %self, i64 1, i64 %t3399, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3400
}

define fastcc i64 @"scheme.base:code_748"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3401 = icmp eq i64 %argc, 2
  br i1 %t3401, label %argok850, label %arityerr849
arityerr849:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok850:
  %t3402 = call i64 @rt_null_p(i64 %a0)
  %t3403 = icmp ne i64 %t3402, 1
  br i1 %t3403, label %then851, label %else852
then851:
  %t3404 = and i64 %self, -8
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = getelementptr i64, ptr %t3405, i64 1
  %t3407 = load i64, ptr %t3406
  ret i64 %t3407
else852:
  %t3408 = call i64 @rt_car(i64 %a0)
  %t3409 = call i64 @rt_vector_length(i64 %t3408)
  %t3410 = call ptr @rt_alloc_words(i64 8)
  %t3411 = ptrtoint ptr %t3410 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_750" to i64), ptr %t3410
  %t3412 = or i64 %t3411, 4
  %t3413 = getelementptr i64, ptr %t3410, i64 1
  store i64 %t3409, ptr %t3413
  %t3414 = and i64 %self, -8
  %t3415 = inttoptr i64 %t3414 to ptr
  %t3416 = getelementptr i64, ptr %t3415, i64 2
  %t3417 = load i64, ptr %t3416
  %t3418 = getelementptr i64, ptr %t3410, i64 2
  store i64 %t3417, ptr %t3418
  %t3419 = getelementptr i64, ptr %t3410, i64 3
  store i64 %a0, ptr %t3419
  %t3420 = getelementptr i64, ptr %t3410, i64 4
  store i64 %a1, ptr %t3420
  %t3421 = and i64 %self, -8
  %t3422 = inttoptr i64 %t3421 to ptr
  %t3423 = getelementptr i64, ptr %t3422, i64 1
  %t3424 = load i64, ptr %t3423
  %t3425 = getelementptr i64, ptr %t3410, i64 5
  store i64 %t3424, ptr %t3425
  %t3426 = getelementptr i64, ptr %t3410, i64 6
  store i64 %t3408, ptr %t3426
  %t3427 = getelementptr i64, ptr %t3410, i64 7
  store i64 %t3412, ptr %t3427
  %t3428 = musttail call fastcc i64 @"scheme.base:code_750"(i64 %t3412, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3428
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3429 = icmp sge i64 %argc, 0
  br i1 %t3429, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok854:
  %t3430 = call ptr @rt_alloc_words(i64 8)
  %t3431 = getelementptr i64, ptr %t3430, i64 0
  store i64 %a0, ptr %t3431
  %t3432 = getelementptr i64, ptr %t3430, i64 1
  store i64 %a1, ptr %t3432
  %t3433 = getelementptr i64, ptr %t3430, i64 2
  store i64 %a2, ptr %t3433
  %t3434 = getelementptr i64, ptr %t3430, i64 3
  store i64 %a3, ptr %t3434
  %t3435 = getelementptr i64, ptr %t3430, i64 4
  store i64 %a4, ptr %t3435
  %t3436 = getelementptr i64, ptr %t3430, i64 5
  store i64 %a5, ptr %t3436
  %t3437 = getelementptr i64, ptr %t3430, i64 6
  store i64 %a6, ptr %t3437
  %t3438 = getelementptr i64, ptr %t3430, i64 7
  store i64 %a7, ptr %t3438
  %t3439 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3430, ptr %overflow)
  %t3440 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3440)
  %t3441 = and i64 %t3440, -8
  %t3442 = inttoptr i64 %t3441 to ptr
  %t3443 = load i64, ptr %t3442
  %t3444 = inttoptr i64 %t3443 to ptr
  %t3445 = call fastcc i64%t3444(i64 %t3440, i64 1, i64 %t3439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3446 = call i64 @rt_make_vector(i64 %t3445, i64 0)
  %t3447 = call ptr @rt_alloc_words(i64 3)
  %t3448 = ptrtoint ptr %t3447 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_748" to i64), ptr %t3447
  %t3449 = or i64 %t3448, 4
  %t3450 = getelementptr i64, ptr %t3447, i64 1
  store i64 %t3446, ptr %t3450
  %t3451 = getelementptr i64, ptr %t3447, i64 2
  store i64 %t3449, ptr %t3451
  %t3452 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %t3449, i64 2, i64 %t3439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3452
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3457 = icmp eq i64 %argc, 1
  br i1 %t3457, label %argok856, label %arityerr855
arityerr855:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok856:
  %t3458 = call i64 @rt_null_p(i64 %a0)
  %t3459 = icmp ne i64 %t3458, 1
  br i1 %t3459, label %then857, label %else858
then857:
  ret i64 0
else858:
  %t3460 = call i64 @rt_car(i64 %a0)
  %t3461 = call i64 @rt_vector_length(i64 %t3460)
  %t3462 = call i64 @rt_cdr(i64 %a0)
  %t3463 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3463)
  %t3464 = and i64 %t3463, -8
  %t3465 = inttoptr i64 %t3464 to ptr
  %t3466 = load i64, ptr %t3465
  %t3467 = inttoptr i64 %t3466 to ptr
  %t3468 = call fastcc i64%t3467(i64 %t3463, i64 1, i64 %t3462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3469 = or i64 %t3461, %t3468
  %t3470 = and i64 %t3469, 7
  %t3471 = icmp eq i64 %t3470, 0
  br i1 %t3471, label %fixfast859, label %fixslow860
fixfast859:
  %t3472 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3461, i64 %t3468)
  %t3473 = extractvalue {i64, i1} %t3472, 0
  %t3474 = extractvalue {i64, i1} %t3472, 1
  br i1 %t3474, label %fixslow860, label %fixmerge861
fixslow860:
  %t3475 = call i64 @rt_add(i64 %t3461, i64 %t3468)
  br label %fixmerge861
fixmerge861:
  %t3476 = phi i64 [ %t3473, %fixfast859 ], [ %t3475, %fixslow860 ]
  ret i64 %t3476
}

define fastcc i64 @"scheme.base:code_767"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3481 = icmp eq i64 %argc, 1
  br i1 %t3481, label %argok863, label %arityerr862
arityerr862:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok863:
  %t3482 = and i64 %self, -8
  %t3483 = inttoptr i64 %t3482 to ptr
  %t3484 = getelementptr i64, ptr %t3483, i64 1
  %t3485 = load i64, ptr %t3484
  %t3486 = or i64 %a0, %t3485
  %t3487 = and i64 %t3486, 7
  %t3488 = icmp eq i64 %t3487, 0
  br i1 %t3488, label %fixfast864, label %fixslow865
fixfast864:
  %t3489 = icmp eq i64 %a0, %t3485
  %t3490 = select i1 %t3489, i64 257, i64 1
  br label %fixmerge866
fixslow865:
  %t3491 = call i64 @rt_num_eq(i64 %a0, i64 %t3485)
  br label %fixmerge866
fixmerge866:
  %t3492 = phi i64 [ %t3490, %fixfast864 ], [ %t3491, %fixslow865 ]
  %t3493 = icmp ne i64 %t3492, 1
  br i1 %t3493, label %then867, label %else868
then867:
  %t3494 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3494)
  %t3495 = and i64 %t3494, -8
  %t3496 = inttoptr i64 %t3495 to ptr
  %t3497 = load i64, ptr %t3496
  %t3498 = inttoptr i64 %t3497 to ptr
  %t3499 = musttail call fastcc i64 %t3498(i64 %t3494, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3499
else868:
  %t3500 = and i64 %self, -8
  %t3501 = inttoptr i64 %t3500 to ptr
  %t3502 = getelementptr i64, ptr %t3501, i64 2
  %t3503 = load i64, ptr %t3502
  %t3504 = and i64 %self, -8
  %t3505 = inttoptr i64 %t3504 to ptr
  %t3506 = getelementptr i64, ptr %t3505, i64 3
  %t3507 = load i64, ptr %t3506
  %t3508 = call i64 @rt_vector_set(i64 %t3503, i64 %a0, i64 %t3507)
  %t3509 = or i64 %a0, 8
  %t3510 = and i64 %t3509, 7
  %t3511 = icmp eq i64 %t3510, 0
  br i1 %t3511, label %fixfast869, label %fixslow870
fixfast869:
  %t3512 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3513 = extractvalue {i64, i1} %t3512, 0
  %t3514 = extractvalue {i64, i1} %t3512, 1
  br i1 %t3514, label %fixslow870, label %fixmerge871
fixslow870:
  %t3515 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge871
fixmerge871:
  %t3516 = phi i64 [ %t3513, %fixfast869 ], [ %t3515, %fixslow870 ]
  %t3517 = musttail call fastcc i64 @"scheme.base:code_767"(i64 %self, i64 1, i64 %t3516, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3517
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3518 = icmp sge i64 %argc, 2
  br i1 %t3518, label %argok873, label %arityerr872
arityerr872:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok873:
  %t3519 = call ptr @rt_alloc_words(i64 8)
  %t3520 = getelementptr i64, ptr %t3519, i64 0
  store i64 %a0, ptr %t3520
  %t3521 = getelementptr i64, ptr %t3519, i64 1
  store i64 %a1, ptr %t3521
  %t3522 = getelementptr i64, ptr %t3519, i64 2
  store i64 %a2, ptr %t3522
  %t3523 = getelementptr i64, ptr %t3519, i64 3
  store i64 %a3, ptr %t3523
  %t3524 = getelementptr i64, ptr %t3519, i64 4
  store i64 %a4, ptr %t3524
  %t3525 = getelementptr i64, ptr %t3519, i64 5
  store i64 %a5, ptr %t3525
  %t3526 = getelementptr i64, ptr %t3519, i64 6
  store i64 %a6, ptr %t3526
  %t3527 = getelementptr i64, ptr %t3519, i64 7
  store i64 %a7, ptr %t3527
  %t3528 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3519, ptr %overflow)
  %t3529 = call i64 @rt_vector_length(i64 %a0)
  %t3530 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3530)
  %t3531 = and i64 %t3530, -8
  %t3532 = inttoptr i64 %t3531 to ptr
  %t3533 = load i64, ptr %t3532
  %t3534 = inttoptr i64 %t3533 to ptr
  %t3535 = call fastcc i64%t3534(i64 %t3530, i64 1, i64 %t3528, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3536 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3536)
  %t3537 = and i64 %t3536, -8
  %t3538 = inttoptr i64 %t3537 to ptr
  %t3539 = load i64, ptr %t3538
  %t3540 = inttoptr i64 %t3539 to ptr
  %t3541 = call fastcc i64%t3540(i64 %t3536, i64 2, i64 %t3528, i64 %t3529, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3542 = call i64 @rt_intern(ptr @.str.sym.19)
  %t3543 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3543)
  %t3544 = and i64 %t3543, -8
  %t3545 = inttoptr i64 %t3544 to ptr
  %t3546 = load i64, ptr %t3545
  %t3547 = inttoptr i64 %t3546 to ptr
  %t3548 = call fastcc i64%t3547(i64 %t3543, i64 4, i64 %t3542, i64 %t3535, i64 %t3541, i64 %t3529, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3549 = call ptr @rt_alloc_words(i64 5)
  %t3550 = ptrtoint ptr %t3549 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_767" to i64), ptr %t3549
  %t3551 = or i64 %t3550, 4
  %t3552 = getelementptr i64, ptr %t3549, i64 1
  store i64 %t3541, ptr %t3552
  %t3553 = getelementptr i64, ptr %t3549, i64 2
  store i64 %a0, ptr %t3553
  %t3554 = getelementptr i64, ptr %t3549, i64 3
  store i64 %a1, ptr %t3554
  %t3555 = getelementptr i64, ptr %t3549, i64 4
  store i64 %t3551, ptr %t3555
  %t3556 = musttail call fastcc i64 @"scheme.base:code_767"(i64 %t3551, i64 1, i64 %t3535, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3556
}

define fastcc i64 @"scheme.base:code_793"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3561 = icmp eq i64 %argc, 1
  br i1 %t3561, label %argok875, label %arityerr874
arityerr874:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok875:
  %t3562 = or i64 %a0, 0
  %t3563 = and i64 %t3562, 7
  %t3564 = icmp eq i64 %t3563, 0
  br i1 %t3564, label %fixfast876, label %fixslow877
fixfast876:
  %t3565 = icmp slt i64 %a0, 0
  %t3566 = select i1 %t3565, i64 257, i64 1
  br label %fixmerge878
fixslow877:
  %t3567 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge878
fixmerge878:
  %t3568 = phi i64 [ %t3566, %fixfast876 ], [ %t3567, %fixslow877 ]
  %t3569 = icmp ne i64 %t3568, 1
  br i1 %t3569, label %then879, label %else880
then879:
  %t3570 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3570)
  %t3571 = and i64 %t3570, -8
  %t3572 = inttoptr i64 %t3571 to ptr
  %t3573 = load i64, ptr %t3572
  %t3574 = inttoptr i64 %t3573 to ptr
  %t3575 = musttail call fastcc i64 %t3574(i64 %t3570, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3575
else880:
  %t3576 = and i64 %self, -8
  %t3577 = inttoptr i64 %t3576 to ptr
  %t3578 = getelementptr i64, ptr %t3577, i64 1
  %t3579 = load i64, ptr %t3578
  %t3580 = and i64 %self, -8
  %t3581 = inttoptr i64 %t3580 to ptr
  %t3582 = getelementptr i64, ptr %t3581, i64 2
  %t3583 = load i64, ptr %t3582
  %t3584 = or i64 %t3583, %a0
  %t3585 = and i64 %t3584, 7
  %t3586 = icmp eq i64 %t3585, 0
  br i1 %t3586, label %fixfast881, label %fixslow882
fixfast881:
  %t3587 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3583, i64 %a0)
  %t3588 = extractvalue {i64, i1} %t3587, 0
  %t3589 = extractvalue {i64, i1} %t3587, 1
  br i1 %t3589, label %fixslow882, label %fixmerge883
fixslow882:
  %t3590 = call i64 @rt_add(i64 %t3583, i64 %a0)
  br label %fixmerge883
fixmerge883:
  %t3591 = phi i64 [ %t3588, %fixfast881 ], [ %t3590, %fixslow882 ]
  %t3592 = and i64 %self, -8
  %t3593 = inttoptr i64 %t3592 to ptr
  %t3594 = getelementptr i64, ptr %t3593, i64 3
  %t3595 = load i64, ptr %t3594
  %t3596 = and i64 %self, -8
  %t3597 = inttoptr i64 %t3596 to ptr
  %t3598 = getelementptr i64, ptr %t3597, i64 4
  %t3599 = load i64, ptr %t3598
  %t3600 = or i64 %t3599, %a0
  %t3601 = and i64 %t3600, 7
  %t3602 = icmp eq i64 %t3601, 0
  br i1 %t3602, label %fixfast884, label %fixslow885
fixfast884:
  %t3603 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3599, i64 %a0)
  %t3604 = extractvalue {i64, i1} %t3603, 0
  %t3605 = extractvalue {i64, i1} %t3603, 1
  br i1 %t3605, label %fixslow885, label %fixmerge886
fixslow885:
  %t3606 = call i64 @rt_add(i64 %t3599, i64 %a0)
  br label %fixmerge886
fixmerge886:
  %t3607 = phi i64 [ %t3604, %fixfast884 ], [ %t3606, %fixslow885 ]
  %t3608 = call i64 @rt_vector_ref(i64 %t3595, i64 %t3607)
  %t3609 = call i64 @rt_vector_set(i64 %t3579, i64 %t3591, i64 %t3608)
  %t3610 = or i64 %a0, 8
  %t3611 = and i64 %t3610, 7
  %t3612 = icmp eq i64 %t3611, 0
  br i1 %t3612, label %fixfast887, label %fixslow888
fixfast887:
  %t3613 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3614 = extractvalue {i64, i1} %t3613, 0
  %t3615 = extractvalue {i64, i1} %t3613, 1
  br i1 %t3615, label %fixslow888, label %fixmerge889
fixslow888:
  %t3616 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge889
fixmerge889:
  %t3617 = phi i64 [ %t3614, %fixfast887 ], [ %t3616, %fixslow888 ]
  %t3618 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %self, i64 1, i64 %t3617, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3618
}

define fastcc i64 @"scheme.base:code_795"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3619 = icmp eq i64 %argc, 1
  br i1 %t3619, label %argok891, label %arityerr890
arityerr890:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok891:
  %t3620 = and i64 %self, -8
  %t3621 = inttoptr i64 %t3620 to ptr
  %t3622 = getelementptr i64, ptr %t3621, i64 1
  %t3623 = load i64, ptr %t3622
  %t3624 = and i64 %self, -8
  %t3625 = inttoptr i64 %t3624 to ptr
  %t3626 = getelementptr i64, ptr %t3625, i64 2
  %t3627 = load i64, ptr %t3626
  %t3628 = or i64 %t3623, %t3627
  %t3629 = and i64 %t3628, 7
  %t3630 = icmp eq i64 %t3629, 0
  br i1 %t3630, label %fixfast892, label %fixslow893
fixfast892:
  %t3631 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3623, i64 %t3627)
  %t3632 = extractvalue {i64, i1} %t3631, 0
  %t3633 = extractvalue {i64, i1} %t3631, 1
  br i1 %t3633, label %fixslow893, label %fixmerge894
fixslow893:
  %t3634 = call i64 @rt_sub(i64 %t3623, i64 %t3627)
  br label %fixmerge894
fixmerge894:
  %t3635 = phi i64 [ %t3632, %fixfast892 ], [ %t3634, %fixslow893 ]
  %t3636 = or i64 %a0, %t3635
  %t3637 = and i64 %t3636, 7
  %t3638 = icmp eq i64 %t3637, 0
  br i1 %t3638, label %fixfast895, label %fixslow896
fixfast895:
  %t3639 = icmp eq i64 %a0, %t3635
  %t3640 = select i1 %t3639, i64 257, i64 1
  br label %fixmerge897
fixslow896:
  %t3641 = call i64 @rt_num_eq(i64 %a0, i64 %t3635)
  br label %fixmerge897
fixmerge897:
  %t3642 = phi i64 [ %t3640, %fixfast895 ], [ %t3641, %fixslow896 ]
  %t3643 = icmp ne i64 %t3642, 1
  br i1 %t3643, label %then898, label %else899
then898:
  %t3644 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3644)
  %t3645 = and i64 %t3644, -8
  %t3646 = inttoptr i64 %t3645 to ptr
  %t3647 = load i64, ptr %t3646
  %t3648 = inttoptr i64 %t3647 to ptr
  %t3649 = musttail call fastcc i64 %t3648(i64 %t3644, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3649
else899:
  %t3650 = and i64 %self, -8
  %t3651 = inttoptr i64 %t3650 to ptr
  %t3652 = getelementptr i64, ptr %t3651, i64 3
  %t3653 = load i64, ptr %t3652
  %t3654 = and i64 %self, -8
  %t3655 = inttoptr i64 %t3654 to ptr
  %t3656 = getelementptr i64, ptr %t3655, i64 4
  %t3657 = load i64, ptr %t3656
  %t3658 = or i64 %t3657, %a0
  %t3659 = and i64 %t3658, 7
  %t3660 = icmp eq i64 %t3659, 0
  br i1 %t3660, label %fixfast900, label %fixslow901
fixfast900:
  %t3661 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3657, i64 %a0)
  %t3662 = extractvalue {i64, i1} %t3661, 0
  %t3663 = extractvalue {i64, i1} %t3661, 1
  br i1 %t3663, label %fixslow901, label %fixmerge902
fixslow901:
  %t3664 = call i64 @rt_add(i64 %t3657, i64 %a0)
  br label %fixmerge902
fixmerge902:
  %t3665 = phi i64 [ %t3662, %fixfast900 ], [ %t3664, %fixslow901 ]
  %t3666 = and i64 %self, -8
  %t3667 = inttoptr i64 %t3666 to ptr
  %t3668 = getelementptr i64, ptr %t3667, i64 5
  %t3669 = load i64, ptr %t3668
  %t3670 = and i64 %self, -8
  %t3671 = inttoptr i64 %t3670 to ptr
  %t3672 = getelementptr i64, ptr %t3671, i64 2
  %t3673 = load i64, ptr %t3672
  %t3674 = or i64 %t3673, %a0
  %t3675 = and i64 %t3674, 7
  %t3676 = icmp eq i64 %t3675, 0
  br i1 %t3676, label %fixfast903, label %fixslow904
fixfast903:
  %t3677 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3673, i64 %a0)
  %t3678 = extractvalue {i64, i1} %t3677, 0
  %t3679 = extractvalue {i64, i1} %t3677, 1
  br i1 %t3679, label %fixslow904, label %fixmerge905
fixslow904:
  %t3680 = call i64 @rt_add(i64 %t3673, i64 %a0)
  br label %fixmerge905
fixmerge905:
  %t3681 = phi i64 [ %t3678, %fixfast903 ], [ %t3680, %fixslow904 ]
  %t3682 = call i64 @rt_vector_ref(i64 %t3669, i64 %t3681)
  %t3683 = call i64 @rt_vector_set(i64 %t3653, i64 %t3665, i64 %t3682)
  %t3684 = or i64 %a0, 8
  %t3685 = and i64 %t3684, 7
  %t3686 = icmp eq i64 %t3685, 0
  br i1 %t3686, label %fixfast906, label %fixslow907
fixfast906:
  %t3687 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3688 = extractvalue {i64, i1} %t3687, 0
  %t3689 = extractvalue {i64, i1} %t3687, 1
  br i1 %t3689, label %fixslow907, label %fixmerge908
fixslow907:
  %t3690 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge908
fixmerge908:
  %t3691 = phi i64 [ %t3688, %fixfast906 ], [ %t3690, %fixslow907 ]
  %t3692 = musttail call fastcc i64 @"scheme.base:code_795"(i64 %self, i64 1, i64 %t3691, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3692
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3693 = icmp sge i64 %argc, 3
  br i1 %t3693, label %argok910, label %arityerr909
arityerr909:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok910:
  %t3694 = call ptr @rt_alloc_words(i64 8)
  %t3695 = getelementptr i64, ptr %t3694, i64 0
  store i64 %a0, ptr %t3695
  %t3696 = getelementptr i64, ptr %t3694, i64 1
  store i64 %a1, ptr %t3696
  %t3697 = getelementptr i64, ptr %t3694, i64 2
  store i64 %a2, ptr %t3697
  %t3698 = getelementptr i64, ptr %t3694, i64 3
  store i64 %a3, ptr %t3698
  %t3699 = getelementptr i64, ptr %t3694, i64 4
  store i64 %a4, ptr %t3699
  %t3700 = getelementptr i64, ptr %t3694, i64 5
  store i64 %a5, ptr %t3700
  %t3701 = getelementptr i64, ptr %t3694, i64 6
  store i64 %a6, ptr %t3701
  %t3702 = getelementptr i64, ptr %t3694, i64 7
  store i64 %a7, ptr %t3702
  %t3703 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t3694, ptr %overflow)
  %t3704 = call i64 @rt_vector_length(i64 %a2)
  %t3705 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3705)
  %t3706 = and i64 %t3705, -8
  %t3707 = inttoptr i64 %t3706 to ptr
  %t3708 = load i64, ptr %t3707
  %t3709 = inttoptr i64 %t3708 to ptr
  %t3710 = call fastcc i64%t3709(i64 %t3705, i64 1, i64 %t3703, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3711 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3711)
  %t3712 = and i64 %t3711, -8
  %t3713 = inttoptr i64 %t3712 to ptr
  %t3714 = load i64, ptr %t3713
  %t3715 = inttoptr i64 %t3714 to ptr
  %t3716 = call fastcc i64%t3715(i64 %t3711, i64 2, i64 %t3703, i64 %t3704, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3717 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3718 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3718)
  %t3719 = and i64 %t3718, -8
  %t3720 = inttoptr i64 %t3719 to ptr
  %t3721 = load i64, ptr %t3720
  %t3722 = inttoptr i64 %t3721 to ptr
  %t3723 = call fastcc i64%t3722(i64 %t3718, i64 4, i64 %t3717, i64 %t3710, i64 %t3716, i64 %t3704, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3724 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3725 = or i64 %t3716, %t3710
  %t3726 = and i64 %t3725, 7
  %t3727 = icmp eq i64 %t3726, 0
  br i1 %t3727, label %fixfast911, label %fixslow912
fixfast911:
  %t3728 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3716, i64 %t3710)
  %t3729 = extractvalue {i64, i1} %t3728, 0
  %t3730 = extractvalue {i64, i1} %t3728, 1
  br i1 %t3730, label %fixslow912, label %fixmerge913
fixslow912:
  %t3731 = call i64 @rt_sub(i64 %t3716, i64 %t3710)
  br label %fixmerge913
fixmerge913:
  %t3732 = phi i64 [ %t3729, %fixfast911 ], [ %t3731, %fixslow912 ]
  %t3733 = or i64 %a1, %t3732
  %t3734 = and i64 %t3733, 7
  %t3735 = icmp eq i64 %t3734, 0
  br i1 %t3735, label %fixfast914, label %fixslow915
fixfast914:
  %t3736 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t3732)
  %t3737 = extractvalue {i64, i1} %t3736, 0
  %t3738 = extractvalue {i64, i1} %t3736, 1
  br i1 %t3738, label %fixslow915, label %fixmerge916
fixslow915:
  %t3739 = call i64 @rt_add(i64 %a1, i64 %t3732)
  br label %fixmerge916
fixmerge916:
  %t3740 = phi i64 [ %t3737, %fixfast914 ], [ %t3739, %fixslow915 ]
  %t3741 = call i64 @rt_vector_length(i64 %a0)
  %t3742 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3742)
  %t3743 = and i64 %t3742, -8
  %t3744 = inttoptr i64 %t3743 to ptr
  %t3745 = load i64, ptr %t3744
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = call fastcc i64%t3746(i64 %t3742, i64 4, i64 %t3724, i64 %a1, i64 %t3740, i64 %t3741, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3748 = or i64 %t3710, %a1
  %t3749 = and i64 %t3748, 7
  %t3750 = icmp eq i64 %t3749, 0
  br i1 %t3750, label %fixfast917, label %fixslow918
fixfast917:
  %t3751 = icmp slt i64 %t3710, %a1
  %t3752 = select i1 %t3751, i64 257, i64 1
  br label %fixmerge919
fixslow918:
  %t3753 = call i64 @rt_lt(i64 %t3710, i64 %a1)
  br label %fixmerge919
fixmerge919:
  %t3754 = phi i64 [ %t3752, %fixfast917 ], [ %t3753, %fixslow918 ]
  %t3755 = icmp ne i64 %t3754, 1
  br i1 %t3755, label %then920, label %else921
then920:
  %t3756 = call ptr @rt_alloc_words(i64 6)
  %t3757 = ptrtoint ptr %t3756 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_793" to i64), ptr %t3756
  %t3758 = or i64 %t3757, 4
  %t3759 = getelementptr i64, ptr %t3756, i64 1
  store i64 %a0, ptr %t3759
  %t3760 = getelementptr i64, ptr %t3756, i64 2
  store i64 %a1, ptr %t3760
  %t3761 = getelementptr i64, ptr %t3756, i64 3
  store i64 %a2, ptr %t3761
  %t3762 = getelementptr i64, ptr %t3756, i64 4
  store i64 %t3710, ptr %t3762
  %t3763 = getelementptr i64, ptr %t3756, i64 5
  store i64 %t3758, ptr %t3763
  %t3764 = or i64 %t3716, %t3710
  %t3765 = and i64 %t3764, 7
  %t3766 = icmp eq i64 %t3765, 0
  br i1 %t3766, label %fixfast922, label %fixslow923
fixfast922:
  %t3767 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3716, i64 %t3710)
  %t3768 = extractvalue {i64, i1} %t3767, 0
  %t3769 = extractvalue {i64, i1} %t3767, 1
  br i1 %t3769, label %fixslow923, label %fixmerge924
fixslow923:
  %t3770 = call i64 @rt_sub(i64 %t3716, i64 %t3710)
  br label %fixmerge924
fixmerge924:
  %t3771 = phi i64 [ %t3768, %fixfast922 ], [ %t3770, %fixslow923 ]
  %t3772 = or i64 %t3771, 8
  %t3773 = and i64 %t3772, 7
  %t3774 = icmp eq i64 %t3773, 0
  br i1 %t3774, label %fixfast925, label %fixslow926
fixfast925:
  %t3775 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3771, i64 8)
  %t3776 = extractvalue {i64, i1} %t3775, 0
  %t3777 = extractvalue {i64, i1} %t3775, 1
  br i1 %t3777, label %fixslow926, label %fixmerge927
fixslow926:
  %t3778 = call i64 @rt_sub(i64 %t3771, i64 8)
  br label %fixmerge927
fixmerge927:
  %t3779 = phi i64 [ %t3776, %fixfast925 ], [ %t3778, %fixslow926 ]
  %t3780 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %t3758, i64 1, i64 %t3779, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3780
else921:
  %t3781 = call ptr @rt_alloc_words(i64 7)
  %t3782 = ptrtoint ptr %t3781 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_795" to i64), ptr %t3781
  %t3783 = or i64 %t3782, 4
  %t3784 = getelementptr i64, ptr %t3781, i64 1
  store i64 %t3716, ptr %t3784
  %t3785 = getelementptr i64, ptr %t3781, i64 2
  store i64 %t3710, ptr %t3785
  %t3786 = getelementptr i64, ptr %t3781, i64 3
  store i64 %a0, ptr %t3786
  %t3787 = getelementptr i64, ptr %t3781, i64 4
  store i64 %a1, ptr %t3787
  %t3788 = getelementptr i64, ptr %t3781, i64 5
  store i64 %a2, ptr %t3788
  %t3789 = getelementptr i64, ptr %t3781, i64 6
  store i64 %t3783, ptr %t3789
  %t3790 = musttail call fastcc i64 @"scheme.base:code_795"(i64 %t3783, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3790
}

define fastcc i64 @"scheme.base:code_818"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3795 = icmp eq i64 %argc, 1
  br i1 %t3795, label %argok929, label %arityerr928
arityerr928:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok929:
  %t3796 = and i64 %self, -8
  %t3797 = inttoptr i64 %t3796 to ptr
  %t3798 = getelementptr i64, ptr %t3797, i64 1
  %t3799 = load i64, ptr %t3798
  %t3800 = or i64 %a0, %t3799
  %t3801 = and i64 %t3800, 7
  %t3802 = icmp eq i64 %t3801, 0
  br i1 %t3802, label %fixfast930, label %fixslow931
fixfast930:
  %t3803 = icmp eq i64 %a0, %t3799
  %t3804 = select i1 %t3803, i64 257, i64 1
  br label %fixmerge932
fixslow931:
  %t3805 = call i64 @rt_num_eq(i64 %a0, i64 %t3799)
  br label %fixmerge932
fixmerge932:
  %t3806 = phi i64 [ %t3804, %fixfast930 ], [ %t3805, %fixslow931 ]
  %t3807 = icmp ne i64 %t3806, 1
  br i1 %t3807, label %then933, label %else934
then933:
  %t3808 = and i64 %self, -8
  %t3809 = inttoptr i64 %t3808 to ptr
  %t3810 = getelementptr i64, ptr %t3809, i64 2
  %t3811 = load i64, ptr %t3810
  ret i64 %t3811
else934:
  %t3812 = and i64 %self, -8
  %t3813 = inttoptr i64 %t3812 to ptr
  %t3814 = getelementptr i64, ptr %t3813, i64 2
  %t3815 = load i64, ptr %t3814
  %t3816 = and i64 %self, -8
  %t3817 = inttoptr i64 %t3816 to ptr
  %t3818 = getelementptr i64, ptr %t3817, i64 4
  %t3819 = load i64, ptr %t3818
  %t3820 = call i64 @rt_vector_ref(i64 %t3819, i64 %a0)
  %t3821 = and i64 %self, -8
  %t3822 = inttoptr i64 %t3821 to ptr
  %t3823 = getelementptr i64, ptr %t3822, i64 3
  %t3824 = load i64, ptr %t3823
  call void @rt_check_callable(i64 %t3824)
  %t3825 = and i64 %t3824, -8
  %t3826 = inttoptr i64 %t3825 to ptr
  %t3827 = load i64, ptr %t3826
  %t3828 = inttoptr i64 %t3827 to ptr
  %t3829 = call fastcc i64%t3828(i64 %t3824, i64 1, i64 %t3820, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3830 = call i64 @rt_vector_set(i64 %t3815, i64 %a0, i64 %t3829)
  %t3831 = or i64 %a0, 8
  %t3832 = and i64 %t3831, 7
  %t3833 = icmp eq i64 %t3832, 0
  br i1 %t3833, label %fixfast935, label %fixslow936
fixfast935:
  %t3834 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3835 = extractvalue {i64, i1} %t3834, 0
  %t3836 = extractvalue {i64, i1} %t3834, 1
  br i1 %t3836, label %fixslow936, label %fixmerge937
fixslow936:
  %t3837 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge937
fixmerge937:
  %t3838 = phi i64 [ %t3835, %fixfast935 ], [ %t3837, %fixslow936 ]
  %t3839 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %self, i64 1, i64 %t3838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3839
}

define fastcc i64 @"scheme.base:code_820"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3840 = icmp eq i64 %argc, 1
  br i1 %t3840, label %argok939, label %arityerr938
arityerr938:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok939:
  %t3841 = and i64 %self, -8
  %t3842 = inttoptr i64 %t3841 to ptr
  %t3843 = getelementptr i64, ptr %t3842, i64 1
  %t3844 = load i64, ptr %t3843
  %t3845 = or i64 %a0, %t3844
  %t3846 = and i64 %t3845, 7
  %t3847 = icmp eq i64 %t3846, 0
  br i1 %t3847, label %fixfast940, label %fixslow941
fixfast940:
  %t3848 = icmp eq i64 %a0, %t3844
  %t3849 = select i1 %t3848, i64 257, i64 1
  br label %fixmerge942
fixslow941:
  %t3850 = call i64 @rt_num_eq(i64 %a0, i64 %t3844)
  br label %fixmerge942
fixmerge942:
  %t3851 = phi i64 [ %t3849, %fixfast940 ], [ %t3850, %fixslow941 ]
  %t3852 = icmp ne i64 %t3851, 1
  br i1 %t3852, label %then943, label %else944
then943:
  %t3853 = and i64 %self, -8
  %t3854 = inttoptr i64 %t3853 to ptr
  %t3855 = getelementptr i64, ptr %t3854, i64 2
  %t3856 = load i64, ptr %t3855
  ret i64 %t3856
else944:
  %t3857 = and i64 %self, -8
  %t3858 = inttoptr i64 %t3857 to ptr
  %t3859 = getelementptr i64, ptr %t3858, i64 2
  %t3860 = load i64, ptr %t3859
  %t3861 = and i64 %self, -8
  %t3862 = inttoptr i64 %t3861 to ptr
  %t3863 = getelementptr i64, ptr %t3862, i64 4
  %t3864 = load i64, ptr %t3863
  %t3865 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t3865)
  %t3866 = and i64 %t3865, -8
  %t3867 = inttoptr i64 %t3866 to ptr
  %t3868 = load i64, ptr %t3867
  %t3869 = inttoptr i64 %t3868 to ptr
  %t3870 = call fastcc i64%t3869(i64 %t3865, i64 2, i64 %t3864, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3871 = and i64 %self, -8
  %t3872 = inttoptr i64 %t3871 to ptr
  %t3873 = getelementptr i64, ptr %t3872, i64 3
  %t3874 = load i64, ptr %t3873
  call void @rt_check_callable(i64 %t3874)
  %t3875 = and i64 %t3874, -8
  %t3876 = inttoptr i64 %t3875 to ptr
  %t3877 = load i64, ptr %t3876
  %t3878 = inttoptr i64 %t3877 to ptr
  %t3879 = call i64 @rt_list_length(i64 %t3870)
  %t3880 = add i64 0, %t3879
  %t3881 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t3870, i64 8)
  %t3893 = getelementptr i64, ptr %t3881, i64 0
  %t3885 = load i64, ptr %t3893
  %t3894 = getelementptr i64, ptr %t3881, i64 1
  %t3886 = load i64, ptr %t3894
  %t3895 = getelementptr i64, ptr %t3881, i64 2
  %t3887 = load i64, ptr %t3895
  %t3896 = getelementptr i64, ptr %t3881, i64 3
  %t3888 = load i64, ptr %t3896
  %t3897 = getelementptr i64, ptr %t3881, i64 4
  %t3889 = load i64, ptr %t3897
  %t3898 = getelementptr i64, ptr %t3881, i64 5
  %t3890 = load i64, ptr %t3898
  %t3899 = getelementptr i64, ptr %t3881, i64 6
  %t3891 = load i64, ptr %t3899
  %t3900 = getelementptr i64, ptr %t3881, i64 7
  %t3892 = load i64, ptr %t3900
  %t3882 = icmp sgt i64 %t3880, 8
  %t3883 = getelementptr i64, ptr %t3881, i64 8
  %t3884 = select i1 %t3882, ptr %t3883, ptr null
  %t3901 = call fastcc i64%t3878(i64 %t3874, i64 %t3880, i64 %t3885, i64 %t3886, i64 %t3887, i64 %t3888, i64 %t3889, i64 %t3890, i64 %t3891, i64 %t3892, ptr %t3884)
  %t3902 = call i64 @rt_vector_set(i64 %t3860, i64 %a0, i64 %t3901)
  %t3903 = or i64 %a0, 8
  %t3904 = and i64 %t3903, 7
  %t3905 = icmp eq i64 %t3904, 0
  br i1 %t3905, label %fixfast945, label %fixslow946
fixfast945:
  %t3906 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3907 = extractvalue {i64, i1} %t3906, 0
  %t3908 = extractvalue {i64, i1} %t3906, 1
  br i1 %t3908, label %fixslow946, label %fixmerge947
fixslow946:
  %t3909 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge947
fixmerge947:
  %t3910 = phi i64 [ %t3907, %fixfast945 ], [ %t3909, %fixslow946 ]
  %t3911 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %self, i64 1, i64 %t3910, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3911
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3912 = icmp sge i64 %argc, 2
  br i1 %t3912, label %argok949, label %arityerr948
arityerr948:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok949:
  %t3913 = call ptr @rt_alloc_words(i64 8)
  %t3914 = getelementptr i64, ptr %t3913, i64 0
  store i64 %a0, ptr %t3914
  %t3915 = getelementptr i64, ptr %t3913, i64 1
  store i64 %a1, ptr %t3915
  %t3916 = getelementptr i64, ptr %t3913, i64 2
  store i64 %a2, ptr %t3916
  %t3917 = getelementptr i64, ptr %t3913, i64 3
  store i64 %a3, ptr %t3917
  %t3918 = getelementptr i64, ptr %t3913, i64 4
  store i64 %a4, ptr %t3918
  %t3919 = getelementptr i64, ptr %t3913, i64 5
  store i64 %a5, ptr %t3919
  %t3920 = getelementptr i64, ptr %t3913, i64 6
  store i64 %a6, ptr %t3920
  %t3921 = getelementptr i64, ptr %t3913, i64 7
  store i64 %a7, ptr %t3921
  %t3922 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3913, ptr %overflow)
  %t3923 = call i64 @rt_null_p(i64 %t3922)
  %t3924 = icmp ne i64 %t3923, 1
  br i1 %t3924, label %then950, label %else951
then950:
  %t3925 = call i64 @rt_vector_length(i64 %a1)
  %t3926 = call i64 @rt_make_vector(i64 %t3925, i64 0)
  %t3927 = call ptr @rt_alloc_words(i64 6)
  %t3928 = ptrtoint ptr %t3927 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_818" to i64), ptr %t3927
  %t3929 = or i64 %t3928, 4
  %t3930 = getelementptr i64, ptr %t3927, i64 1
  store i64 %t3925, ptr %t3930
  %t3931 = getelementptr i64, ptr %t3927, i64 2
  store i64 %t3926, ptr %t3931
  %t3932 = getelementptr i64, ptr %t3927, i64 3
  store i64 %a0, ptr %t3932
  %t3933 = getelementptr i64, ptr %t3927, i64 4
  store i64 %a1, ptr %t3933
  %t3934 = getelementptr i64, ptr %t3927, i64 5
  store i64 %t3929, ptr %t3934
  %t3935 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %t3929, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3935
else951:
  %t3936 = call i64 @rt_cons(i64 %a1, i64 %t3922)
  %t3937 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t3937)
  %t3938 = and i64 %t3937, -8
  %t3939 = inttoptr i64 %t3938 to ptr
  %t3940 = load i64, ptr %t3939
  %t3941 = inttoptr i64 %t3940 to ptr
  %t3942 = call fastcc i64%t3941(i64 %t3937, i64 1, i64 %t3936, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3943 = call i64 @rt_make_vector(i64 %t3942, i64 0)
  %t3944 = call ptr @rt_alloc_words(i64 6)
  %t3945 = ptrtoint ptr %t3944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_820" to i64), ptr %t3944
  %t3946 = or i64 %t3945, 4
  %t3947 = getelementptr i64, ptr %t3944, i64 1
  store i64 %t3942, ptr %t3947
  %t3948 = getelementptr i64, ptr %t3944, i64 2
  store i64 %t3943, ptr %t3948
  %t3949 = getelementptr i64, ptr %t3944, i64 3
  store i64 %a0, ptr %t3949
  %t3950 = getelementptr i64, ptr %t3944, i64 4
  store i64 %t3936, ptr %t3950
  %t3951 = getelementptr i64, ptr %t3944, i64 5
  store i64 %t3946, ptr %t3951
  %t3952 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %t3946, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3952
}

define fastcc i64 @"scheme.base:code_841"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3957 = icmp eq i64 %argc, 1
  br i1 %t3957, label %argok953, label %arityerr952
arityerr952:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok953:
  %t3958 = and i64 %self, -8
  %t3959 = inttoptr i64 %t3958 to ptr
  %t3960 = getelementptr i64, ptr %t3959, i64 1
  %t3961 = load i64, ptr %t3960
  %t3962 = or i64 %a0, %t3961
  %t3963 = and i64 %t3962, 7
  %t3964 = icmp eq i64 %t3963, 0
  br i1 %t3964, label %fixfast954, label %fixslow955
fixfast954:
  %t3965 = icmp eq i64 %a0, %t3961
  %t3966 = select i1 %t3965, i64 257, i64 1
  br label %fixmerge956
fixslow955:
  %t3967 = call i64 @rt_num_eq(i64 %a0, i64 %t3961)
  br label %fixmerge956
fixmerge956:
  %t3968 = phi i64 [ %t3966, %fixfast954 ], [ %t3967, %fixslow955 ]
  %t3969 = icmp ne i64 %t3968, 1
  br i1 %t3969, label %then957, label %else958
then957:
  %t3970 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3970)
  %t3971 = and i64 %t3970, -8
  %t3972 = inttoptr i64 %t3971 to ptr
  %t3973 = load i64, ptr %t3972
  %t3974 = inttoptr i64 %t3973 to ptr
  %t3975 = musttail call fastcc i64 %t3974(i64 %t3970, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3975
else958:
  %t3976 = and i64 %self, -8
  %t3977 = inttoptr i64 %t3976 to ptr
  %t3978 = getelementptr i64, ptr %t3977, i64 3
  %t3979 = load i64, ptr %t3978
  %t3980 = call i64 @rt_vector_ref(i64 %t3979, i64 %a0)
  %t3981 = and i64 %self, -8
  %t3982 = inttoptr i64 %t3981 to ptr
  %t3983 = getelementptr i64, ptr %t3982, i64 2
  %t3984 = load i64, ptr %t3983
  call void @rt_check_callable(i64 %t3984)
  %t3985 = and i64 %t3984, -8
  %t3986 = inttoptr i64 %t3985 to ptr
  %t3987 = load i64, ptr %t3986
  %t3988 = inttoptr i64 %t3987 to ptr
  %t3989 = call fastcc i64%t3988(i64 %t3984, i64 1, i64 %t3980, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3990 = or i64 %a0, 8
  %t3991 = and i64 %t3990, 7
  %t3992 = icmp eq i64 %t3991, 0
  br i1 %t3992, label %fixfast959, label %fixslow960
fixfast959:
  %t3993 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3994 = extractvalue {i64, i1} %t3993, 0
  %t3995 = extractvalue {i64, i1} %t3993, 1
  br i1 %t3995, label %fixslow960, label %fixmerge961
fixslow960:
  %t3996 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge961
fixmerge961:
  %t3997 = phi i64 [ %t3994, %fixfast959 ], [ %t3996, %fixslow960 ]
  %t3998 = musttail call fastcc i64 @"scheme.base:code_841"(i64 %self, i64 1, i64 %t3997, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3998
}

define fastcc i64 @"scheme.base:code_843"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3999 = icmp eq i64 %argc, 1
  br i1 %t3999, label %argok963, label %arityerr962
arityerr962:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok963:
  %t4000 = and i64 %self, -8
  %t4001 = inttoptr i64 %t4000 to ptr
  %t4002 = getelementptr i64, ptr %t4001, i64 1
  %t4003 = load i64, ptr %t4002
  %t4004 = or i64 %a0, %t4003
  %t4005 = and i64 %t4004, 7
  %t4006 = icmp eq i64 %t4005, 0
  br i1 %t4006, label %fixfast964, label %fixslow965
fixfast964:
  %t4007 = icmp eq i64 %a0, %t4003
  %t4008 = select i1 %t4007, i64 257, i64 1
  br label %fixmerge966
fixslow965:
  %t4009 = call i64 @rt_num_eq(i64 %a0, i64 %t4003)
  br label %fixmerge966
fixmerge966:
  %t4010 = phi i64 [ %t4008, %fixfast964 ], [ %t4009, %fixslow965 ]
  %t4011 = icmp ne i64 %t4010, 1
  br i1 %t4011, label %then967, label %else968
then967:
  %t4012 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4012)
  %t4013 = and i64 %t4012, -8
  %t4014 = inttoptr i64 %t4013 to ptr
  %t4015 = load i64, ptr %t4014
  %t4016 = inttoptr i64 %t4015 to ptr
  %t4017 = musttail call fastcc i64 %t4016(i64 %t4012, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4017
else968:
  %t4018 = and i64 %self, -8
  %t4019 = inttoptr i64 %t4018 to ptr
  %t4020 = getelementptr i64, ptr %t4019, i64 3
  %t4021 = load i64, ptr %t4020
  %t4022 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4022)
  %t4023 = and i64 %t4022, -8
  %t4024 = inttoptr i64 %t4023 to ptr
  %t4025 = load i64, ptr %t4024
  %t4026 = inttoptr i64 %t4025 to ptr
  %t4027 = call fastcc i64%t4026(i64 %t4022, i64 2, i64 %t4021, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4028 = and i64 %self, -8
  %t4029 = inttoptr i64 %t4028 to ptr
  %t4030 = getelementptr i64, ptr %t4029, i64 2
  %t4031 = load i64, ptr %t4030
  call void @rt_check_callable(i64 %t4031)
  %t4032 = and i64 %t4031, -8
  %t4033 = inttoptr i64 %t4032 to ptr
  %t4034 = load i64, ptr %t4033
  %t4035 = inttoptr i64 %t4034 to ptr
  %t4036 = call i64 @rt_list_length(i64 %t4027)
  %t4037 = add i64 0, %t4036
  %t4038 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4027, i64 8)
  %t4050 = getelementptr i64, ptr %t4038, i64 0
  %t4042 = load i64, ptr %t4050
  %t4051 = getelementptr i64, ptr %t4038, i64 1
  %t4043 = load i64, ptr %t4051
  %t4052 = getelementptr i64, ptr %t4038, i64 2
  %t4044 = load i64, ptr %t4052
  %t4053 = getelementptr i64, ptr %t4038, i64 3
  %t4045 = load i64, ptr %t4053
  %t4054 = getelementptr i64, ptr %t4038, i64 4
  %t4046 = load i64, ptr %t4054
  %t4055 = getelementptr i64, ptr %t4038, i64 5
  %t4047 = load i64, ptr %t4055
  %t4056 = getelementptr i64, ptr %t4038, i64 6
  %t4048 = load i64, ptr %t4056
  %t4057 = getelementptr i64, ptr %t4038, i64 7
  %t4049 = load i64, ptr %t4057
  %t4039 = icmp sgt i64 %t4037, 8
  %t4040 = getelementptr i64, ptr %t4038, i64 8
  %t4041 = select i1 %t4039, ptr %t4040, ptr null
  %t4058 = call fastcc i64%t4035(i64 %t4031, i64 %t4037, i64 %t4042, i64 %t4043, i64 %t4044, i64 %t4045, i64 %t4046, i64 %t4047, i64 %t4048, i64 %t4049, ptr %t4041)
  %t4059 = or i64 %a0, 8
  %t4060 = and i64 %t4059, 7
  %t4061 = icmp eq i64 %t4060, 0
  br i1 %t4061, label %fixfast969, label %fixslow970
fixfast969:
  %t4062 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4063 = extractvalue {i64, i1} %t4062, 0
  %t4064 = extractvalue {i64, i1} %t4062, 1
  br i1 %t4064, label %fixslow970, label %fixmerge971
fixslow970:
  %t4065 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge971
fixmerge971:
  %t4066 = phi i64 [ %t4063, %fixfast969 ], [ %t4065, %fixslow970 ]
  %t4067 = musttail call fastcc i64 @"scheme.base:code_843"(i64 %self, i64 1, i64 %t4066, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4067
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4068 = icmp sge i64 %argc, 2
  br i1 %t4068, label %argok973, label %arityerr972
arityerr972:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok973:
  %t4069 = call ptr @rt_alloc_words(i64 8)
  %t4070 = getelementptr i64, ptr %t4069, i64 0
  store i64 %a0, ptr %t4070
  %t4071 = getelementptr i64, ptr %t4069, i64 1
  store i64 %a1, ptr %t4071
  %t4072 = getelementptr i64, ptr %t4069, i64 2
  store i64 %a2, ptr %t4072
  %t4073 = getelementptr i64, ptr %t4069, i64 3
  store i64 %a3, ptr %t4073
  %t4074 = getelementptr i64, ptr %t4069, i64 4
  store i64 %a4, ptr %t4074
  %t4075 = getelementptr i64, ptr %t4069, i64 5
  store i64 %a5, ptr %t4075
  %t4076 = getelementptr i64, ptr %t4069, i64 6
  store i64 %a6, ptr %t4076
  %t4077 = getelementptr i64, ptr %t4069, i64 7
  store i64 %a7, ptr %t4077
  %t4078 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4069, ptr %overflow)
  %t4079 = call i64 @rt_null_p(i64 %t4078)
  %t4080 = icmp ne i64 %t4079, 1
  br i1 %t4080, label %then974, label %else975
then974:
  %t4081 = call i64 @rt_vector_length(i64 %a1)
  %t4082 = call ptr @rt_alloc_words(i64 5)
  %t4083 = ptrtoint ptr %t4082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_841" to i64), ptr %t4082
  %t4084 = or i64 %t4083, 4
  %t4085 = getelementptr i64, ptr %t4082, i64 1
  store i64 %t4081, ptr %t4085
  %t4086 = getelementptr i64, ptr %t4082, i64 2
  store i64 %a0, ptr %t4086
  %t4087 = getelementptr i64, ptr %t4082, i64 3
  store i64 %a1, ptr %t4087
  %t4088 = getelementptr i64, ptr %t4082, i64 4
  store i64 %t4084, ptr %t4088
  %t4089 = musttail call fastcc i64 @"scheme.base:code_841"(i64 %t4084, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4089
else975:
  %t4090 = call i64 @rt_cons(i64 %a1, i64 %t4078)
  %t4091 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4091)
  %t4092 = and i64 %t4091, -8
  %t4093 = inttoptr i64 %t4092 to ptr
  %t4094 = load i64, ptr %t4093
  %t4095 = inttoptr i64 %t4094 to ptr
  %t4096 = call fastcc i64%t4095(i64 %t4091, i64 1, i64 %t4090, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4097 = call ptr @rt_alloc_words(i64 5)
  %t4098 = ptrtoint ptr %t4097 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_843" to i64), ptr %t4097
  %t4099 = or i64 %t4098, 4
  %t4100 = getelementptr i64, ptr %t4097, i64 1
  store i64 %t4096, ptr %t4100
  %t4101 = getelementptr i64, ptr %t4097, i64 2
  store i64 %a0, ptr %t4101
  %t4102 = getelementptr i64, ptr %t4097, i64 3
  store i64 %t4090, ptr %t4102
  %t4103 = getelementptr i64, ptr %t4097, i64 4
  store i64 %t4099, ptr %t4103
  %t4104 = musttail call fastcc i64 @"scheme.base:code_843"(i64 %t4099, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4104
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4109 = icmp eq i64 %argc, 1
  br i1 %t4109, label %argok977, label %arityerr976
arityerr976:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok977:
  %t4110 = call i64 @rt_cdr(i64 %a0)
  %t4111 = call i64 @rt_null_p(i64 %t4110)
  %t4112 = icmp ne i64 %t4111, 1
  br i1 %t4112, label %then978, label %else979
then978:
  %t4113 = call i64 @rt_car(i64 %a0)
  %t4114 = call i64 @rt_vector_length(i64 %t4113)
  ret i64 %t4114
else979:
  %t4115 = call i64 @rt_car(i64 %a0)
  %t4116 = call i64 @rt_vector_length(i64 %t4115)
  %t4117 = call i64 @rt_cdr(i64 %a0)
  %t4118 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4118)
  %t4119 = and i64 %t4118, -8
  %t4120 = inttoptr i64 %t4119 to ptr
  %t4121 = load i64, ptr %t4120
  %t4122 = inttoptr i64 %t4121 to ptr
  %t4123 = call fastcc i64%t4122(i64 %t4118, i64 1, i64 %t4117, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4124 = or i64 %t4116, %t4123
  %t4125 = and i64 %t4124, 7
  %t4126 = icmp eq i64 %t4125, 0
  br i1 %t4126, label %fixfast980, label %fixslow981
fixfast980:
  %t4127 = icmp slt i64 %t4116, %t4123
  %t4128 = select i1 %t4127, i64 257, i64 1
  br label %fixmerge982
fixslow981:
  %t4129 = call i64 @rt_lt(i64 %t4116, i64 %t4123)
  br label %fixmerge982
fixmerge982:
  %t4130 = phi i64 [ %t4128, %fixfast980 ], [ %t4129, %fixslow981 ]
  %t4131 = icmp ne i64 %t4130, 1
  br i1 %t4131, label %then983, label %else984
then983:
  ret i64 %t4116
else984:
  ret i64 %t4123
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4136 = icmp eq i64 %argc, 2
  br i1 %t4136, label %argok986, label %arityerr985
arityerr985:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok986:
  %t4137 = call i64 @rt_null_p(i64 %a0)
  %t4138 = icmp ne i64 %t4137, 1
  br i1 %t4138, label %then987, label %else988
then987:
  ret i64 2
else988:
  %t4139 = call i64 @rt_car(i64 %a0)
  %t4140 = call i64 @rt_vector_ref(i64 %t4139, i64 %a1)
  %t4141 = call i64 @rt_cdr(i64 %a0)
  %t4142 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4142)
  %t4143 = and i64 %t4142, -8
  %t4144 = inttoptr i64 %t4143 to ptr
  %t4145 = load i64, ptr %t4144
  %t4146 = inttoptr i64 %t4145 to ptr
  %t4147 = call fastcc i64%t4146(i64 %t4142, i64 2, i64 %t4141, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4148 = call i64 @rt_cons(i64 %t4140, i64 %t4147)
  ret i64 %t4148
}

define fastcc i64 @"scheme.base:code_869"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4153 = icmp eq i64 %argc, 1
  br i1 %t4153, label %argok990, label %arityerr989
arityerr989:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok990:
  %t4154 = and i64 %self, -8
  %t4155 = inttoptr i64 %t4154 to ptr
  %t4156 = getelementptr i64, ptr %t4155, i64 1
  %t4157 = load i64, ptr %t4156
  %t4158 = or i64 %a0, %t4157
  %t4159 = and i64 %t4158, 7
  %t4160 = icmp eq i64 %t4159, 0
  br i1 %t4160, label %fixfast991, label %fixslow992
fixfast991:
  %t4161 = icmp eq i64 %a0, %t4157
  %t4162 = select i1 %t4161, i64 257, i64 1
  br label %fixmerge993
fixslow992:
  %t4163 = call i64 @rt_num_eq(i64 %a0, i64 %t4157)
  br label %fixmerge993
fixmerge993:
  %t4164 = phi i64 [ %t4162, %fixfast991 ], [ %t4163, %fixslow992 ]
  %t4165 = icmp ne i64 %t4164, 1
  br i1 %t4165, label %then994, label %else995
then994:
  %t4166 = and i64 %self, -8
  %t4167 = inttoptr i64 %t4166 to ptr
  %t4168 = getelementptr i64, ptr %t4167, i64 2
  %t4169 = load i64, ptr %t4168
  ret i64 %t4169
else995:
  %t4170 = and i64 %self, -8
  %t4171 = inttoptr i64 %t4170 to ptr
  %t4172 = getelementptr i64, ptr %t4171, i64 2
  %t4173 = load i64, ptr %t4172
  %t4174 = and i64 %self, -8
  %t4175 = inttoptr i64 %t4174 to ptr
  %t4176 = getelementptr i64, ptr %t4175, i64 3
  %t4177 = load i64, ptr %t4176
  %t4178 = or i64 %a0, %t4177
  %t4179 = and i64 %t4178, 7
  %t4180 = icmp eq i64 %t4179, 0
  br i1 %t4180, label %fixfast996, label %fixslow997
fixfast996:
  %t4181 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4177)
  %t4182 = extractvalue {i64, i1} %t4181, 0
  %t4183 = extractvalue {i64, i1} %t4181, 1
  br i1 %t4183, label %fixslow997, label %fixmerge998
fixslow997:
  %t4184 = call i64 @rt_sub(i64 %a0, i64 %t4177)
  br label %fixmerge998
fixmerge998:
  %t4185 = phi i64 [ %t4182, %fixfast996 ], [ %t4184, %fixslow997 ]
  %t4186 = and i64 %self, -8
  %t4187 = inttoptr i64 %t4186 to ptr
  %t4188 = getelementptr i64, ptr %t4187, i64 4
  %t4189 = load i64, ptr %t4188
  %t4190 = call i64 @rt_string_ref(i64 %t4189, i64 %a0)
  %t4191 = call i64 @rt_vector_set(i64 %t4173, i64 %t4185, i64 %t4190)
  %t4192 = or i64 %a0, 8
  %t4193 = and i64 %t4192, 7
  %t4194 = icmp eq i64 %t4193, 0
  br i1 %t4194, label %fixfast999, label %fixslow1000
fixfast999:
  %t4195 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4196 = extractvalue {i64, i1} %t4195, 0
  %t4197 = extractvalue {i64, i1} %t4195, 1
  br i1 %t4197, label %fixslow1000, label %fixmerge1001
fixslow1000:
  %t4198 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1001
fixmerge1001:
  %t4199 = phi i64 [ %t4196, %fixfast999 ], [ %t4198, %fixslow1000 ]
  %t4200 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %self, i64 1, i64 %t4199, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4200
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4201 = icmp sge i64 %argc, 1
  br i1 %t4201, label %argok1003, label %arityerr1002
arityerr1002:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1003:
  %t4202 = call ptr @rt_alloc_words(i64 8)
  %t4203 = getelementptr i64, ptr %t4202, i64 0
  store i64 %a0, ptr %t4203
  %t4204 = getelementptr i64, ptr %t4202, i64 1
  store i64 %a1, ptr %t4204
  %t4205 = getelementptr i64, ptr %t4202, i64 2
  store i64 %a2, ptr %t4205
  %t4206 = getelementptr i64, ptr %t4202, i64 3
  store i64 %a3, ptr %t4206
  %t4207 = getelementptr i64, ptr %t4202, i64 4
  store i64 %a4, ptr %t4207
  %t4208 = getelementptr i64, ptr %t4202, i64 5
  store i64 %a5, ptr %t4208
  %t4209 = getelementptr i64, ptr %t4202, i64 6
  store i64 %a6, ptr %t4209
  %t4210 = getelementptr i64, ptr %t4202, i64 7
  store i64 %a7, ptr %t4210
  %t4211 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4202, ptr %overflow)
  %t4212 = call i64 @rt_string_length(i64 %a0)
  %t4213 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4213)
  %t4214 = and i64 %t4213, -8
  %t4215 = inttoptr i64 %t4214 to ptr
  %t4216 = load i64, ptr %t4215
  %t4217 = inttoptr i64 %t4216 to ptr
  %t4218 = call fastcc i64%t4217(i64 %t4213, i64 1, i64 %t4211, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4219 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4219)
  %t4220 = and i64 %t4219, -8
  %t4221 = inttoptr i64 %t4220 to ptr
  %t4222 = load i64, ptr %t4221
  %t4223 = inttoptr i64 %t4222 to ptr
  %t4224 = call fastcc i64%t4223(i64 %t4219, i64 2, i64 %t4211, i64 %t4212, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4225 = call i64 @rt_intern(ptr @.str.sym.21)
  %t4226 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4226)
  %t4227 = and i64 %t4226, -8
  %t4228 = inttoptr i64 %t4227 to ptr
  %t4229 = load i64, ptr %t4228
  %t4230 = inttoptr i64 %t4229 to ptr
  %t4231 = call fastcc i64%t4230(i64 %t4226, i64 4, i64 %t4225, i64 %t4218, i64 %t4224, i64 %t4212, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4232 = or i64 %t4224, %t4218
  %t4233 = and i64 %t4232, 7
  %t4234 = icmp eq i64 %t4233, 0
  br i1 %t4234, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t4235 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4224, i64 %t4218)
  %t4236 = extractvalue {i64, i1} %t4235, 0
  %t4237 = extractvalue {i64, i1} %t4235, 1
  br i1 %t4237, label %fixslow1005, label %fixmerge1006
fixslow1005:
  %t4238 = call i64 @rt_sub(i64 %t4224, i64 %t4218)
  br label %fixmerge1006
fixmerge1006:
  %t4239 = phi i64 [ %t4236, %fixfast1004 ], [ %t4238, %fixslow1005 ]
  %t4240 = call i64 @rt_make_vector(i64 %t4239, i64 0)
  %t4241 = call ptr @rt_alloc_words(i64 6)
  %t4242 = ptrtoint ptr %t4241 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_869" to i64), ptr %t4241
  %t4243 = or i64 %t4242, 4
  %t4244 = getelementptr i64, ptr %t4241, i64 1
  store i64 %t4224, ptr %t4244
  %t4245 = getelementptr i64, ptr %t4241, i64 2
  store i64 %t4240, ptr %t4245
  %t4246 = getelementptr i64, ptr %t4241, i64 3
  store i64 %t4218, ptr %t4246
  %t4247 = getelementptr i64, ptr %t4241, i64 4
  store i64 %a0, ptr %t4247
  %t4248 = getelementptr i64, ptr %t4241, i64 5
  store i64 %t4243, ptr %t4248
  %t4249 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %t4243, i64 1, i64 %t4218, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4249
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4254 = icmp sge i64 %argc, 1
  br i1 %t4254, label %argok1008, label %arityerr1007
arityerr1007:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1008:
  %t4255 = call ptr @rt_alloc_words(i64 8)
  %t4256 = getelementptr i64, ptr %t4255, i64 0
  store i64 %a0, ptr %t4256
  %t4257 = getelementptr i64, ptr %t4255, i64 1
  store i64 %a1, ptr %t4257
  %t4258 = getelementptr i64, ptr %t4255, i64 2
  store i64 %a2, ptr %t4258
  %t4259 = getelementptr i64, ptr %t4255, i64 3
  store i64 %a3, ptr %t4259
  %t4260 = getelementptr i64, ptr %t4255, i64 4
  store i64 %a4, ptr %t4260
  %t4261 = getelementptr i64, ptr %t4255, i64 5
  store i64 %a5, ptr %t4261
  %t4262 = getelementptr i64, ptr %t4255, i64 6
  store i64 %a6, ptr %t4262
  %t4263 = getelementptr i64, ptr %t4255, i64 7
  store i64 %a7, ptr %t4263
  %t4264 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4255, ptr %overflow)
  %t4265 = call i64 @rt_vector_length(i64 %a0)
  %t4266 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4266)
  %t4267 = and i64 %t4266, -8
  %t4268 = inttoptr i64 %t4267 to ptr
  %t4269 = load i64, ptr %t4268
  %t4270 = inttoptr i64 %t4269 to ptr
  %t4271 = call fastcc i64%t4270(i64 %t4266, i64 1, i64 %t4264, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4272 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4272)
  %t4273 = and i64 %t4272, -8
  %t4274 = inttoptr i64 %t4273 to ptr
  %t4275 = load i64, ptr %t4274
  %t4276 = inttoptr i64 %t4275 to ptr
  %t4277 = call fastcc i64%t4276(i64 %t4272, i64 2, i64 %t4264, i64 %t4265, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4278 = call i64 @rt_intern(ptr @.str.sym.22)
  %t4279 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4279)
  %t4280 = and i64 %t4279, -8
  %t4281 = inttoptr i64 %t4280 to ptr
  %t4282 = load i64, ptr %t4281
  %t4283 = inttoptr i64 %t4282 to ptr
  %t4284 = call fastcc i64%t4283(i64 %t4279, i64 4, i64 %t4278, i64 %t4271, i64 %t4277, i64 %t4265, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4285 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t4285)
  %t4286 = and i64 %t4285, -8
  %t4287 = inttoptr i64 %t4286 to ptr
  %t4288 = load i64, ptr %t4287
  %t4289 = inttoptr i64 %t4288 to ptr
  %t4290 = call fastcc i64%t4289(i64 %t4285, i64 3, i64 %a0, i64 %t4271, i64 %t4277, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4291 = call i64 @rt_list_to_string(i64 %t4290)
  ret i64 %t4291
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4296 = icmp sge i64 %argc, 2
  br i1 %t4296, label %argok1010, label %arityerr1009
arityerr1009:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1010:
  %t4297 = call ptr @rt_alloc_words(i64 8)
  %t4298 = getelementptr i64, ptr %t4297, i64 0
  store i64 %a0, ptr %t4298
  %t4299 = getelementptr i64, ptr %t4297, i64 1
  store i64 %a1, ptr %t4299
  %t4300 = getelementptr i64, ptr %t4297, i64 2
  store i64 %a2, ptr %t4300
  %t4301 = getelementptr i64, ptr %t4297, i64 3
  store i64 %a3, ptr %t4301
  %t4302 = getelementptr i64, ptr %t4297, i64 4
  store i64 %a4, ptr %t4302
  %t4303 = getelementptr i64, ptr %t4297, i64 5
  store i64 %a5, ptr %t4303
  %t4304 = getelementptr i64, ptr %t4297, i64 6
  store i64 %a6, ptr %t4304
  %t4305 = getelementptr i64, ptr %t4297, i64 7
  store i64 %a7, ptr %t4305
  %t4306 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4297, ptr %overflow)
  %t4307 = call i64 @rt_null_p(i64 %t4306)
  %t4308 = icmp ne i64 %t4307, 1
  br i1 %t4308, label %then1011, label %else1012
then1011:
  %t4309 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t4309)
  %t4310 = and i64 %t4309, -8
  %t4311 = inttoptr i64 %t4310 to ptr
  %t4312 = load i64, ptr %t4311
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = call fastcc i64%t4313(i64 %t4309, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4315 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t4315)
  %t4316 = and i64 %t4315, -8
  %t4317 = inttoptr i64 %t4316 to ptr
  %t4318 = load i64, ptr %t4317
  %t4319 = inttoptr i64 %t4318 to ptr
  %t4320 = call fastcc i64%t4319(i64 %t4315, i64 2, i64 %a0, i64 %t4314, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4321 = call i64 @rt_list_to_string(i64 %t4320)
  ret i64 %t4321
else1012:
  %t4322 = call i64 @rt_cons(i64 %a1, i64 %t4306)
  %t4323 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t4323)
  %t4324 = and i64 %t4323, -8
  %t4325 = inttoptr i64 %t4324 to ptr
  %t4326 = load i64, ptr %t4325
  %t4327 = inttoptr i64 %t4326 to ptr
  %t4328 = call fastcc i64%t4327(i64 %t4323, i64 2, i64 %a0, i64 %t4322, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4329 = call i64 @rt_list_to_string(i64 %t4328)
  ret i64 %t4329
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4334 = icmp eq i64 %argc, 2
  br i1 %t4334, label %argok1014, label %arityerr1013
arityerr1013:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1014:
  %t4335 = call i64 @rt_null_p(i64 %a1)
  %t4336 = icmp ne i64 %t4335, 1
  br i1 %t4336, label %then1015, label %else1016
then1015:
  ret i64 2
else1016:
  %t4337 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t4338 = and i64 %a0, -8
  %t4339 = inttoptr i64 %t4338 to ptr
  %t4340 = load i64, ptr %t4339
  %t4341 = inttoptr i64 %t4340 to ptr
  %t4342 = call fastcc i64%t4341(i64 %a0, i64 1, i64 %t4337, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4343 = call i64 @rt_cdr(i64 %a1)
  %t4344 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t4344)
  %t4345 = and i64 %t4344, -8
  %t4346 = inttoptr i64 %t4345 to ptr
  %t4347 = load i64, ptr %t4346
  %t4348 = inttoptr i64 %t4347 to ptr
  %t4349 = call fastcc i64%t4348(i64 %t4344, i64 2, i64 %a0, i64 %t4343, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4350 = call i64 @rt_cons(i64 %t4342, i64 %t4349)
  ret i64 %t4350
}

define fastcc i64 @"scheme.base:code_894"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4355 = icmp eq i64 %argc, 1
  br i1 %t4355, label %argok1018, label %arityerr1017
arityerr1017:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1018:
  %t4356 = and i64 %self, -8
  %t4357 = inttoptr i64 %t4356 to ptr
  %t4358 = getelementptr i64, ptr %t4357, i64 1
  %t4359 = load i64, ptr %t4358
  %t4360 = or i64 %a0, %t4359
  %t4361 = and i64 %t4360, 7
  %t4362 = icmp eq i64 %t4361, 0
  br i1 %t4362, label %fixfast1019, label %fixslow1020
fixfast1019:
  %t4363 = icmp eq i64 %a0, %t4359
  %t4364 = select i1 %t4363, i64 257, i64 1
  br label %fixmerge1021
fixslow1020:
  %t4365 = call i64 @rt_num_eq(i64 %a0, i64 %t4359)
  br label %fixmerge1021
fixmerge1021:
  %t4366 = phi i64 [ %t4364, %fixfast1019 ], [ %t4365, %fixslow1020 ]
  %t4367 = icmp ne i64 %t4366, 1
  br i1 %t4367, label %then1022, label %else1023
then1022:
  ret i64 2
else1023:
  %t4368 = and i64 %self, -8
  %t4369 = inttoptr i64 %t4368 to ptr
  %t4370 = getelementptr i64, ptr %t4369, i64 3
  %t4371 = load i64, ptr %t4370
  %t4372 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4372)
  %t4373 = and i64 %t4372, -8
  %t4374 = inttoptr i64 %t4373 to ptr
  %t4375 = load i64, ptr %t4374
  %t4376 = inttoptr i64 %t4375 to ptr
  %t4377 = call fastcc i64%t4376(i64 %t4372, i64 2, i64 %t4371, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4378 = and i64 %self, -8
  %t4379 = inttoptr i64 %t4378 to ptr
  %t4380 = getelementptr i64, ptr %t4379, i64 2
  %t4381 = load i64, ptr %t4380
  call void @rt_check_callable(i64 %t4381)
  %t4382 = and i64 %t4381, -8
  %t4383 = inttoptr i64 %t4382 to ptr
  %t4384 = load i64, ptr %t4383
  %t4385 = inttoptr i64 %t4384 to ptr
  %t4386 = call i64 @rt_list_length(i64 %t4377)
  %t4387 = add i64 0, %t4386
  %t4388 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4377, i64 8)
  %t4400 = getelementptr i64, ptr %t4388, i64 0
  %t4392 = load i64, ptr %t4400
  %t4401 = getelementptr i64, ptr %t4388, i64 1
  %t4393 = load i64, ptr %t4401
  %t4402 = getelementptr i64, ptr %t4388, i64 2
  %t4394 = load i64, ptr %t4402
  %t4403 = getelementptr i64, ptr %t4388, i64 3
  %t4395 = load i64, ptr %t4403
  %t4404 = getelementptr i64, ptr %t4388, i64 4
  %t4396 = load i64, ptr %t4404
  %t4405 = getelementptr i64, ptr %t4388, i64 5
  %t4397 = load i64, ptr %t4405
  %t4406 = getelementptr i64, ptr %t4388, i64 6
  %t4398 = load i64, ptr %t4406
  %t4407 = getelementptr i64, ptr %t4388, i64 7
  %t4399 = load i64, ptr %t4407
  %t4389 = icmp sgt i64 %t4387, 8
  %t4390 = getelementptr i64, ptr %t4388, i64 8
  %t4391 = select i1 %t4389, ptr %t4390, ptr null
  %t4408 = call fastcc i64%t4385(i64 %t4381, i64 %t4387, i64 %t4392, i64 %t4393, i64 %t4394, i64 %t4395, i64 %t4396, i64 %t4397, i64 %t4398, i64 %t4399, ptr %t4391)
  %t4409 = or i64 %a0, 8
  %t4410 = and i64 %t4409, 7
  %t4411 = icmp eq i64 %t4410, 0
  br i1 %t4411, label %fixfast1024, label %fixslow1025
fixfast1024:
  %t4412 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4413 = extractvalue {i64, i1} %t4412, 0
  %t4414 = extractvalue {i64, i1} %t4412, 1
  br i1 %t4414, label %fixslow1025, label %fixmerge1026
fixslow1025:
  %t4415 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1026
fixmerge1026:
  %t4416 = phi i64 [ %t4413, %fixfast1024 ], [ %t4415, %fixslow1025 ]
  %t4417 = call fastcc i64 @"scheme.base:code_894"(i64 %self, i64 1, i64 %t4416, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4418 = call i64 @rt_cons(i64 %t4408, i64 %t4417)
  ret i64 %t4418
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4419 = icmp eq i64 %argc, 2
  br i1 %t4419, label %argok1028, label %arityerr1027
arityerr1027:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1028:
  %t4420 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4420)
  %t4421 = and i64 %t4420, -8
  %t4422 = inttoptr i64 %t4421 to ptr
  %t4423 = load i64, ptr %t4422
  %t4424 = inttoptr i64 %t4423 to ptr
  %t4425 = call fastcc i64%t4424(i64 %t4420, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4426 = call ptr @rt_alloc_words(i64 5)
  %t4427 = ptrtoint ptr %t4426 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_894" to i64), ptr %t4426
  %t4428 = or i64 %t4427, 4
  %t4429 = getelementptr i64, ptr %t4426, i64 1
  store i64 %t4425, ptr %t4429
  %t4430 = getelementptr i64, ptr %t4426, i64 2
  store i64 %a0, ptr %t4430
  %t4431 = getelementptr i64, ptr %t4426, i64 3
  store i64 %a1, ptr %t4431
  %t4432 = getelementptr i64, ptr %t4426, i64 4
  store i64 %t4428, ptr %t4432
  %t4433 = musttail call fastcc i64 @"scheme.base:code_894"(i64 %t4428, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4433
}

define fastcc i64 @"scheme.base:code_915"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4438 = icmp eq i64 %argc, 1
  br i1 %t4438, label %argok1030, label %arityerr1029
arityerr1029:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1030:
  %t4439 = and i64 %self, -8
  %t4440 = inttoptr i64 %t4439 to ptr
  %t4441 = getelementptr i64, ptr %t4440, i64 1
  %t4442 = load i64, ptr %t4441
  %t4443 = or i64 %a0, %t4442
  %t4444 = and i64 %t4443, 7
  %t4445 = icmp eq i64 %t4444, 0
  br i1 %t4445, label %fixfast1031, label %fixslow1032
fixfast1031:
  %t4446 = icmp eq i64 %a0, %t4442
  %t4447 = select i1 %t4446, i64 257, i64 1
  br label %fixmerge1033
fixslow1032:
  %t4448 = call i64 @rt_num_eq(i64 %a0, i64 %t4442)
  br label %fixmerge1033
fixmerge1033:
  %t4449 = phi i64 [ %t4447, %fixfast1031 ], [ %t4448, %fixslow1032 ]
  %t4450 = icmp ne i64 %t4449, 1
  br i1 %t4450, label %then1034, label %else1035
then1034:
  %t4451 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4451)
  %t4452 = and i64 %t4451, -8
  %t4453 = inttoptr i64 %t4452 to ptr
  %t4454 = load i64, ptr %t4453
  %t4455 = inttoptr i64 %t4454 to ptr
  %t4456 = musttail call fastcc i64 %t4455(i64 %t4451, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4456
else1035:
  %t4457 = and i64 %self, -8
  %t4458 = inttoptr i64 %t4457 to ptr
  %t4459 = getelementptr i64, ptr %t4458, i64 3
  %t4460 = load i64, ptr %t4459
  %t4461 = call i64 @rt_string_ref(i64 %t4460, i64 %a0)
  %t4462 = and i64 %self, -8
  %t4463 = inttoptr i64 %t4462 to ptr
  %t4464 = getelementptr i64, ptr %t4463, i64 2
  %t4465 = load i64, ptr %t4464
  call void @rt_check_callable(i64 %t4465)
  %t4466 = and i64 %t4465, -8
  %t4467 = inttoptr i64 %t4466 to ptr
  %t4468 = load i64, ptr %t4467
  %t4469 = inttoptr i64 %t4468 to ptr
  %t4470 = call fastcc i64%t4469(i64 %t4465, i64 1, i64 %t4461, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4471 = or i64 %a0, 8
  %t4472 = and i64 %t4471, 7
  %t4473 = icmp eq i64 %t4472, 0
  br i1 %t4473, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t4474 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4475 = extractvalue {i64, i1} %t4474, 0
  %t4476 = extractvalue {i64, i1} %t4474, 1
  br i1 %t4476, label %fixslow1037, label %fixmerge1038
fixslow1037:
  %t4477 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1038
fixmerge1038:
  %t4478 = phi i64 [ %t4475, %fixfast1036 ], [ %t4477, %fixslow1037 ]
  %t4479 = musttail call fastcc i64 @"scheme.base:code_915"(i64 %self, i64 1, i64 %t4478, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4479
}

define fastcc i64 @"scheme.base:code_917"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4480 = icmp eq i64 %argc, 1
  br i1 %t4480, label %argok1040, label %arityerr1039
arityerr1039:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1040:
  %t4481 = and i64 %self, -8
  %t4482 = inttoptr i64 %t4481 to ptr
  %t4483 = getelementptr i64, ptr %t4482, i64 1
  %t4484 = load i64, ptr %t4483
  %t4485 = or i64 %a0, %t4484
  %t4486 = and i64 %t4485, 7
  %t4487 = icmp eq i64 %t4486, 0
  br i1 %t4487, label %fixfast1041, label %fixslow1042
fixfast1041:
  %t4488 = icmp eq i64 %a0, %t4484
  %t4489 = select i1 %t4488, i64 257, i64 1
  br label %fixmerge1043
fixslow1042:
  %t4490 = call i64 @rt_num_eq(i64 %a0, i64 %t4484)
  br label %fixmerge1043
fixmerge1043:
  %t4491 = phi i64 [ %t4489, %fixfast1041 ], [ %t4490, %fixslow1042 ]
  %t4492 = icmp ne i64 %t4491, 1
  br i1 %t4492, label %then1044, label %else1045
then1044:
  %t4493 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4493)
  %t4494 = and i64 %t4493, -8
  %t4495 = inttoptr i64 %t4494 to ptr
  %t4496 = load i64, ptr %t4495
  %t4497 = inttoptr i64 %t4496 to ptr
  %t4498 = musttail call fastcc i64 %t4497(i64 %t4493, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4498
else1045:
  %t4499 = and i64 %self, -8
  %t4500 = inttoptr i64 %t4499 to ptr
  %t4501 = getelementptr i64, ptr %t4500, i64 3
  %t4502 = load i64, ptr %t4501
  %t4503 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4503)
  %t4504 = and i64 %t4503, -8
  %t4505 = inttoptr i64 %t4504 to ptr
  %t4506 = load i64, ptr %t4505
  %t4507 = inttoptr i64 %t4506 to ptr
  %t4508 = call fastcc i64%t4507(i64 %t4503, i64 2, i64 %t4502, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4509 = and i64 %self, -8
  %t4510 = inttoptr i64 %t4509 to ptr
  %t4511 = getelementptr i64, ptr %t4510, i64 2
  %t4512 = load i64, ptr %t4511
  call void @rt_check_callable(i64 %t4512)
  %t4513 = and i64 %t4512, -8
  %t4514 = inttoptr i64 %t4513 to ptr
  %t4515 = load i64, ptr %t4514
  %t4516 = inttoptr i64 %t4515 to ptr
  %t4517 = call i64 @rt_list_length(i64 %t4508)
  %t4518 = add i64 0, %t4517
  %t4519 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4508, i64 8)
  %t4531 = getelementptr i64, ptr %t4519, i64 0
  %t4523 = load i64, ptr %t4531
  %t4532 = getelementptr i64, ptr %t4519, i64 1
  %t4524 = load i64, ptr %t4532
  %t4533 = getelementptr i64, ptr %t4519, i64 2
  %t4525 = load i64, ptr %t4533
  %t4534 = getelementptr i64, ptr %t4519, i64 3
  %t4526 = load i64, ptr %t4534
  %t4535 = getelementptr i64, ptr %t4519, i64 4
  %t4527 = load i64, ptr %t4535
  %t4536 = getelementptr i64, ptr %t4519, i64 5
  %t4528 = load i64, ptr %t4536
  %t4537 = getelementptr i64, ptr %t4519, i64 6
  %t4529 = load i64, ptr %t4537
  %t4538 = getelementptr i64, ptr %t4519, i64 7
  %t4530 = load i64, ptr %t4538
  %t4520 = icmp sgt i64 %t4518, 8
  %t4521 = getelementptr i64, ptr %t4519, i64 8
  %t4522 = select i1 %t4520, ptr %t4521, ptr null
  %t4539 = call fastcc i64%t4516(i64 %t4512, i64 %t4518, i64 %t4523, i64 %t4524, i64 %t4525, i64 %t4526, i64 %t4527, i64 %t4528, i64 %t4529, i64 %t4530, ptr %t4522)
  %t4540 = or i64 %a0, 8
  %t4541 = and i64 %t4540, 7
  %t4542 = icmp eq i64 %t4541, 0
  br i1 %t4542, label %fixfast1046, label %fixslow1047
fixfast1046:
  %t4543 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4544 = extractvalue {i64, i1} %t4543, 0
  %t4545 = extractvalue {i64, i1} %t4543, 1
  br i1 %t4545, label %fixslow1047, label %fixmerge1048
fixslow1047:
  %t4546 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1048
fixmerge1048:
  %t4547 = phi i64 [ %t4544, %fixfast1046 ], [ %t4546, %fixslow1047 ]
  %t4548 = musttail call fastcc i64 @"scheme.base:code_917"(i64 %self, i64 1, i64 %t4547, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4548
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4549 = icmp sge i64 %argc, 2
  br i1 %t4549, label %argok1050, label %arityerr1049
arityerr1049:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1050:
  %t4550 = call ptr @rt_alloc_words(i64 8)
  %t4551 = getelementptr i64, ptr %t4550, i64 0
  store i64 %a0, ptr %t4551
  %t4552 = getelementptr i64, ptr %t4550, i64 1
  store i64 %a1, ptr %t4552
  %t4553 = getelementptr i64, ptr %t4550, i64 2
  store i64 %a2, ptr %t4553
  %t4554 = getelementptr i64, ptr %t4550, i64 3
  store i64 %a3, ptr %t4554
  %t4555 = getelementptr i64, ptr %t4550, i64 4
  store i64 %a4, ptr %t4555
  %t4556 = getelementptr i64, ptr %t4550, i64 5
  store i64 %a5, ptr %t4556
  %t4557 = getelementptr i64, ptr %t4550, i64 6
  store i64 %a6, ptr %t4557
  %t4558 = getelementptr i64, ptr %t4550, i64 7
  store i64 %a7, ptr %t4558
  %t4559 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4550, ptr %overflow)
  %t4560 = call i64 @rt_null_p(i64 %t4559)
  %t4561 = icmp ne i64 %t4560, 1
  br i1 %t4561, label %then1051, label %else1052
then1051:
  %t4562 = call i64 @rt_string_length(i64 %a1)
  %t4563 = call ptr @rt_alloc_words(i64 5)
  %t4564 = ptrtoint ptr %t4563 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_915" to i64), ptr %t4563
  %t4565 = or i64 %t4564, 4
  %t4566 = getelementptr i64, ptr %t4563, i64 1
  store i64 %t4562, ptr %t4566
  %t4567 = getelementptr i64, ptr %t4563, i64 2
  store i64 %a0, ptr %t4567
  %t4568 = getelementptr i64, ptr %t4563, i64 3
  store i64 %a1, ptr %t4568
  %t4569 = getelementptr i64, ptr %t4563, i64 4
  store i64 %t4565, ptr %t4569
  %t4570 = musttail call fastcc i64 @"scheme.base:code_915"(i64 %t4565, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4570
else1052:
  %t4571 = call i64 @rt_cons(i64 %a1, i64 %t4559)
  %t4572 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4572)
  %t4573 = and i64 %t4572, -8
  %t4574 = inttoptr i64 %t4573 to ptr
  %t4575 = load i64, ptr %t4574
  %t4576 = inttoptr i64 %t4575 to ptr
  %t4577 = call fastcc i64%t4576(i64 %t4572, i64 1, i64 %t4571, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4578 = call ptr @rt_alloc_words(i64 5)
  %t4579 = ptrtoint ptr %t4578 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_917" to i64), ptr %t4578
  %t4580 = or i64 %t4579, 4
  %t4581 = getelementptr i64, ptr %t4578, i64 1
  store i64 %t4577, ptr %t4581
  %t4582 = getelementptr i64, ptr %t4578, i64 2
  store i64 %a0, ptr %t4582
  %t4583 = getelementptr i64, ptr %t4578, i64 3
  store i64 %t4571, ptr %t4583
  %t4584 = getelementptr i64, ptr %t4578, i64 4
  store i64 %t4580, ptr %t4584
  %t4585 = musttail call fastcc i64 @"scheme.base:code_917"(i64 %t4580, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4585
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4590 = icmp eq i64 %argc, 1
  br i1 %t4590, label %argok1054, label %arityerr1053
arityerr1053:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1054:
  %t4591 = call i64 @rt_cdr(i64 %a0)
  %t4592 = call i64 @rt_null_p(i64 %t4591)
  %t4593 = icmp ne i64 %t4592, 1
  br i1 %t4593, label %then1055, label %else1056
then1055:
  %t4594 = call i64 @rt_car(i64 %a0)
  %t4595 = call i64 @rt_string_length(i64 %t4594)
  ret i64 %t4595
else1056:
  %t4596 = call i64 @rt_car(i64 %a0)
  %t4597 = call i64 @rt_string_length(i64 %t4596)
  %t4598 = call i64 @rt_cdr(i64 %a0)
  %t4599 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4599)
  %t4600 = and i64 %t4599, -8
  %t4601 = inttoptr i64 %t4600 to ptr
  %t4602 = load i64, ptr %t4601
  %t4603 = inttoptr i64 %t4602 to ptr
  %t4604 = call fastcc i64%t4603(i64 %t4599, i64 1, i64 %t4598, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4605 = or i64 %t4597, %t4604
  %t4606 = and i64 %t4605, 7
  %t4607 = icmp eq i64 %t4606, 0
  br i1 %t4607, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t4608 = icmp slt i64 %t4597, %t4604
  %t4609 = select i1 %t4608, i64 257, i64 1
  br label %fixmerge1059
fixslow1058:
  %t4610 = call i64 @rt_lt(i64 %t4597, i64 %t4604)
  br label %fixmerge1059
fixmerge1059:
  %t4611 = phi i64 [ %t4609, %fixfast1057 ], [ %t4610, %fixslow1058 ]
  %t4612 = icmp ne i64 %t4611, 1
  br i1 %t4612, label %then1060, label %else1061
then1060:
  ret i64 %t4597
else1061:
  ret i64 %t4604
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4617 = icmp eq i64 %argc, 2
  br i1 %t4617, label %argok1063, label %arityerr1062
arityerr1062:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1063:
  %t4618 = call i64 @rt_null_p(i64 %a0)
  %t4619 = icmp ne i64 %t4618, 1
  br i1 %t4619, label %then1064, label %else1065
then1064:
  ret i64 2
else1065:
  %t4620 = call i64 @rt_car(i64 %a0)
  %t4621 = call i64 @rt_string_ref(i64 %t4620, i64 %a1)
  %t4622 = call i64 @rt_cdr(i64 %a0)
  %t4623 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4623)
  %t4624 = and i64 %t4623, -8
  %t4625 = inttoptr i64 %t4624 to ptr
  %t4626 = load i64, ptr %t4625
  %t4627 = inttoptr i64 %t4626 to ptr
  %t4628 = call fastcc i64%t4627(i64 %t4623, i64 2, i64 %t4622, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4629 = call i64 @rt_cons(i64 %t4621, i64 %t4628)
  ret i64 %t4629
}

define fastcc i64 @"scheme.base:code_943"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4634 = icmp eq i64 %argc, 1
  br i1 %t4634, label %argok1067, label %arityerr1066
arityerr1066:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1067:
  %t4635 = and i64 %self, -8
  %t4636 = inttoptr i64 %t4635 to ptr
  %t4637 = getelementptr i64, ptr %t4636, i64 1
  %t4638 = load i64, ptr %t4637
  %t4639 = or i64 %a0, %t4638
  %t4640 = and i64 %t4639, 7
  %t4641 = icmp eq i64 %t4640, 0
  br i1 %t4641, label %fixfast1068, label %fixslow1069
fixfast1068:
  %t4642 = icmp eq i64 %a0, %t4638
  %t4643 = select i1 %t4642, i64 257, i64 1
  br label %fixmerge1070
fixslow1069:
  %t4644 = call i64 @rt_num_eq(i64 %a0, i64 %t4638)
  br label %fixmerge1070
fixmerge1070:
  %t4645 = phi i64 [ %t4643, %fixfast1068 ], [ %t4644, %fixslow1069 ]
  %t4646 = icmp ne i64 %t4645, 1
  br i1 %t4646, label %then1071, label %else1072
then1071:
  %t4647 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4647)
  %t4648 = and i64 %t4647, -8
  %t4649 = inttoptr i64 %t4648 to ptr
  %t4650 = load i64, ptr %t4649
  %t4651 = inttoptr i64 %t4650 to ptr
  %t4652 = musttail call fastcc i64 %t4651(i64 %t4647, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4652
else1072:
  %t4653 = and i64 %self, -8
  %t4654 = inttoptr i64 %t4653 to ptr
  %t4655 = getelementptr i64, ptr %t4654, i64 2
  %t4656 = load i64, ptr %t4655
  %t4657 = and i64 %self, -8
  %t4658 = inttoptr i64 %t4657 to ptr
  %t4659 = getelementptr i64, ptr %t4658, i64 3
  %t4660 = load i64, ptr %t4659
  %t4661 = call i64 @rt_string_set(i64 %t4656, i64 %a0, i64 %t4660)
  %t4662 = or i64 %a0, 8
  %t4663 = and i64 %t4662, 7
  %t4664 = icmp eq i64 %t4663, 0
  br i1 %t4664, label %fixfast1073, label %fixslow1074
fixfast1073:
  %t4665 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4666 = extractvalue {i64, i1} %t4665, 0
  %t4667 = extractvalue {i64, i1} %t4665, 1
  br i1 %t4667, label %fixslow1074, label %fixmerge1075
fixslow1074:
  %t4668 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1075
fixmerge1075:
  %t4669 = phi i64 [ %t4666, %fixfast1073 ], [ %t4668, %fixslow1074 ]
  %t4670 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %self, i64 1, i64 %t4669, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4670
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4671 = icmp sge i64 %argc, 2
  br i1 %t4671, label %argok1077, label %arityerr1076
arityerr1076:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1077:
  %t4672 = call ptr @rt_alloc_words(i64 8)
  %t4673 = getelementptr i64, ptr %t4672, i64 0
  store i64 %a0, ptr %t4673
  %t4674 = getelementptr i64, ptr %t4672, i64 1
  store i64 %a1, ptr %t4674
  %t4675 = getelementptr i64, ptr %t4672, i64 2
  store i64 %a2, ptr %t4675
  %t4676 = getelementptr i64, ptr %t4672, i64 3
  store i64 %a3, ptr %t4676
  %t4677 = getelementptr i64, ptr %t4672, i64 4
  store i64 %a4, ptr %t4677
  %t4678 = getelementptr i64, ptr %t4672, i64 5
  store i64 %a5, ptr %t4678
  %t4679 = getelementptr i64, ptr %t4672, i64 6
  store i64 %a6, ptr %t4679
  %t4680 = getelementptr i64, ptr %t4672, i64 7
  store i64 %a7, ptr %t4680
  %t4681 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4672, ptr %overflow)
  %t4682 = call i64 @rt_string_length(i64 %a0)
  %t4683 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4683)
  %t4684 = and i64 %t4683, -8
  %t4685 = inttoptr i64 %t4684 to ptr
  %t4686 = load i64, ptr %t4685
  %t4687 = inttoptr i64 %t4686 to ptr
  %t4688 = call fastcc i64%t4687(i64 %t4683, i64 1, i64 %t4681, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4689 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4689)
  %t4690 = and i64 %t4689, -8
  %t4691 = inttoptr i64 %t4690 to ptr
  %t4692 = load i64, ptr %t4691
  %t4693 = inttoptr i64 %t4692 to ptr
  %t4694 = call fastcc i64%t4693(i64 %t4689, i64 2, i64 %t4681, i64 %t4682, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4695 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4696 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4696)
  %t4697 = and i64 %t4696, -8
  %t4698 = inttoptr i64 %t4697 to ptr
  %t4699 = load i64, ptr %t4698
  %t4700 = inttoptr i64 %t4699 to ptr
  %t4701 = call fastcc i64%t4700(i64 %t4696, i64 4, i64 %t4695, i64 %t4688, i64 %t4694, i64 %t4682, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4702 = call ptr @rt_alloc_words(i64 5)
  %t4703 = ptrtoint ptr %t4702 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_943" to i64), ptr %t4702
  %t4704 = or i64 %t4703, 4
  %t4705 = getelementptr i64, ptr %t4702, i64 1
  store i64 %t4694, ptr %t4705
  %t4706 = getelementptr i64, ptr %t4702, i64 2
  store i64 %a0, ptr %t4706
  %t4707 = getelementptr i64, ptr %t4702, i64 3
  store i64 %a1, ptr %t4707
  %t4708 = getelementptr i64, ptr %t4702, i64 4
  store i64 %t4704, ptr %t4708
  %t4709 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %t4704, i64 1, i64 %t4688, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4709
}

define fastcc i64 @"scheme.base:code_969"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4714 = icmp eq i64 %argc, 1
  br i1 %t4714, label %argok1079, label %arityerr1078
arityerr1078:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1079:
  %t4715 = or i64 %a0, 0
  %t4716 = and i64 %t4715, 7
  %t4717 = icmp eq i64 %t4716, 0
  br i1 %t4717, label %fixfast1080, label %fixslow1081
fixfast1080:
  %t4718 = icmp slt i64 %a0, 0
  %t4719 = select i1 %t4718, i64 257, i64 1
  br label %fixmerge1082
fixslow1081:
  %t4720 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1082
fixmerge1082:
  %t4721 = phi i64 [ %t4719, %fixfast1080 ], [ %t4720, %fixslow1081 ]
  %t4722 = icmp ne i64 %t4721, 1
  br i1 %t4722, label %then1083, label %else1084
then1083:
  %t4723 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4723)
  %t4724 = and i64 %t4723, -8
  %t4725 = inttoptr i64 %t4724 to ptr
  %t4726 = load i64, ptr %t4725
  %t4727 = inttoptr i64 %t4726 to ptr
  %t4728 = musttail call fastcc i64 %t4727(i64 %t4723, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4728
else1084:
  %t4729 = and i64 %self, -8
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = getelementptr i64, ptr %t4730, i64 1
  %t4732 = load i64, ptr %t4731
  %t4733 = and i64 %self, -8
  %t4734 = inttoptr i64 %t4733 to ptr
  %t4735 = getelementptr i64, ptr %t4734, i64 2
  %t4736 = load i64, ptr %t4735
  %t4737 = or i64 %t4736, %a0
  %t4738 = and i64 %t4737, 7
  %t4739 = icmp eq i64 %t4738, 0
  br i1 %t4739, label %fixfast1085, label %fixslow1086
fixfast1085:
  %t4740 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4736, i64 %a0)
  %t4741 = extractvalue {i64, i1} %t4740, 0
  %t4742 = extractvalue {i64, i1} %t4740, 1
  br i1 %t4742, label %fixslow1086, label %fixmerge1087
fixslow1086:
  %t4743 = call i64 @rt_add(i64 %t4736, i64 %a0)
  br label %fixmerge1087
fixmerge1087:
  %t4744 = phi i64 [ %t4741, %fixfast1085 ], [ %t4743, %fixslow1086 ]
  %t4745 = and i64 %self, -8
  %t4746 = inttoptr i64 %t4745 to ptr
  %t4747 = getelementptr i64, ptr %t4746, i64 3
  %t4748 = load i64, ptr %t4747
  %t4749 = and i64 %self, -8
  %t4750 = inttoptr i64 %t4749 to ptr
  %t4751 = getelementptr i64, ptr %t4750, i64 4
  %t4752 = load i64, ptr %t4751
  %t4753 = or i64 %t4752, %a0
  %t4754 = and i64 %t4753, 7
  %t4755 = icmp eq i64 %t4754, 0
  br i1 %t4755, label %fixfast1088, label %fixslow1089
fixfast1088:
  %t4756 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4752, i64 %a0)
  %t4757 = extractvalue {i64, i1} %t4756, 0
  %t4758 = extractvalue {i64, i1} %t4756, 1
  br i1 %t4758, label %fixslow1089, label %fixmerge1090
fixslow1089:
  %t4759 = call i64 @rt_add(i64 %t4752, i64 %a0)
  br label %fixmerge1090
fixmerge1090:
  %t4760 = phi i64 [ %t4757, %fixfast1088 ], [ %t4759, %fixslow1089 ]
  %t4761 = call i64 @rt_string_ref(i64 %t4748, i64 %t4760)
  %t4762 = call i64 @rt_string_set(i64 %t4732, i64 %t4744, i64 %t4761)
  %t4763 = or i64 %a0, 8
  %t4764 = and i64 %t4763, 7
  %t4765 = icmp eq i64 %t4764, 0
  br i1 %t4765, label %fixfast1091, label %fixslow1092
fixfast1091:
  %t4766 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4767 = extractvalue {i64, i1} %t4766, 0
  %t4768 = extractvalue {i64, i1} %t4766, 1
  br i1 %t4768, label %fixslow1092, label %fixmerge1093
fixslow1092:
  %t4769 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1093
fixmerge1093:
  %t4770 = phi i64 [ %t4767, %fixfast1091 ], [ %t4769, %fixslow1092 ]
  %t4771 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %self, i64 1, i64 %t4770, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4771
}

define fastcc i64 @"scheme.base:code_971"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4772 = icmp eq i64 %argc, 1
  br i1 %t4772, label %argok1095, label %arityerr1094
arityerr1094:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1095:
  %t4773 = and i64 %self, -8
  %t4774 = inttoptr i64 %t4773 to ptr
  %t4775 = getelementptr i64, ptr %t4774, i64 1
  %t4776 = load i64, ptr %t4775
  %t4777 = and i64 %self, -8
  %t4778 = inttoptr i64 %t4777 to ptr
  %t4779 = getelementptr i64, ptr %t4778, i64 2
  %t4780 = load i64, ptr %t4779
  %t4781 = or i64 %t4776, %t4780
  %t4782 = and i64 %t4781, 7
  %t4783 = icmp eq i64 %t4782, 0
  br i1 %t4783, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t4784 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4776, i64 %t4780)
  %t4785 = extractvalue {i64, i1} %t4784, 0
  %t4786 = extractvalue {i64, i1} %t4784, 1
  br i1 %t4786, label %fixslow1097, label %fixmerge1098
fixslow1097:
  %t4787 = call i64 @rt_sub(i64 %t4776, i64 %t4780)
  br label %fixmerge1098
fixmerge1098:
  %t4788 = phi i64 [ %t4785, %fixfast1096 ], [ %t4787, %fixslow1097 ]
  %t4789 = or i64 %a0, %t4788
  %t4790 = and i64 %t4789, 7
  %t4791 = icmp eq i64 %t4790, 0
  br i1 %t4791, label %fixfast1099, label %fixslow1100
fixfast1099:
  %t4792 = icmp eq i64 %a0, %t4788
  %t4793 = select i1 %t4792, i64 257, i64 1
  br label %fixmerge1101
fixslow1100:
  %t4794 = call i64 @rt_num_eq(i64 %a0, i64 %t4788)
  br label %fixmerge1101
fixmerge1101:
  %t4795 = phi i64 [ %t4793, %fixfast1099 ], [ %t4794, %fixslow1100 ]
  %t4796 = icmp ne i64 %t4795, 1
  br i1 %t4796, label %then1102, label %else1103
then1102:
  %t4797 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4797)
  %t4798 = and i64 %t4797, -8
  %t4799 = inttoptr i64 %t4798 to ptr
  %t4800 = load i64, ptr %t4799
  %t4801 = inttoptr i64 %t4800 to ptr
  %t4802 = musttail call fastcc i64 %t4801(i64 %t4797, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4802
else1103:
  %t4803 = and i64 %self, -8
  %t4804 = inttoptr i64 %t4803 to ptr
  %t4805 = getelementptr i64, ptr %t4804, i64 3
  %t4806 = load i64, ptr %t4805
  %t4807 = and i64 %self, -8
  %t4808 = inttoptr i64 %t4807 to ptr
  %t4809 = getelementptr i64, ptr %t4808, i64 4
  %t4810 = load i64, ptr %t4809
  %t4811 = or i64 %t4810, %a0
  %t4812 = and i64 %t4811, 7
  %t4813 = icmp eq i64 %t4812, 0
  br i1 %t4813, label %fixfast1104, label %fixslow1105
fixfast1104:
  %t4814 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4810, i64 %a0)
  %t4815 = extractvalue {i64, i1} %t4814, 0
  %t4816 = extractvalue {i64, i1} %t4814, 1
  br i1 %t4816, label %fixslow1105, label %fixmerge1106
fixslow1105:
  %t4817 = call i64 @rt_add(i64 %t4810, i64 %a0)
  br label %fixmerge1106
fixmerge1106:
  %t4818 = phi i64 [ %t4815, %fixfast1104 ], [ %t4817, %fixslow1105 ]
  %t4819 = and i64 %self, -8
  %t4820 = inttoptr i64 %t4819 to ptr
  %t4821 = getelementptr i64, ptr %t4820, i64 5
  %t4822 = load i64, ptr %t4821
  %t4823 = and i64 %self, -8
  %t4824 = inttoptr i64 %t4823 to ptr
  %t4825 = getelementptr i64, ptr %t4824, i64 2
  %t4826 = load i64, ptr %t4825
  %t4827 = or i64 %t4826, %a0
  %t4828 = and i64 %t4827, 7
  %t4829 = icmp eq i64 %t4828, 0
  br i1 %t4829, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t4830 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4826, i64 %a0)
  %t4831 = extractvalue {i64, i1} %t4830, 0
  %t4832 = extractvalue {i64, i1} %t4830, 1
  br i1 %t4832, label %fixslow1108, label %fixmerge1109
fixslow1108:
  %t4833 = call i64 @rt_add(i64 %t4826, i64 %a0)
  br label %fixmerge1109
fixmerge1109:
  %t4834 = phi i64 [ %t4831, %fixfast1107 ], [ %t4833, %fixslow1108 ]
  %t4835 = call i64 @rt_string_ref(i64 %t4822, i64 %t4834)
  %t4836 = call i64 @rt_string_set(i64 %t4806, i64 %t4818, i64 %t4835)
  %t4837 = or i64 %a0, 8
  %t4838 = and i64 %t4837, 7
  %t4839 = icmp eq i64 %t4838, 0
  br i1 %t4839, label %fixfast1110, label %fixslow1111
fixfast1110:
  %t4840 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4841 = extractvalue {i64, i1} %t4840, 0
  %t4842 = extractvalue {i64, i1} %t4840, 1
  br i1 %t4842, label %fixslow1111, label %fixmerge1112
fixslow1111:
  %t4843 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1112
fixmerge1112:
  %t4844 = phi i64 [ %t4841, %fixfast1110 ], [ %t4843, %fixslow1111 ]
  %t4845 = musttail call fastcc i64 @"scheme.base:code_971"(i64 %self, i64 1, i64 %t4844, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4845
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4846 = icmp sge i64 %argc, 3
  br i1 %t4846, label %argok1114, label %arityerr1113
arityerr1113:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1114:
  %t4847 = call ptr @rt_alloc_words(i64 8)
  %t4848 = getelementptr i64, ptr %t4847, i64 0
  store i64 %a0, ptr %t4848
  %t4849 = getelementptr i64, ptr %t4847, i64 1
  store i64 %a1, ptr %t4849
  %t4850 = getelementptr i64, ptr %t4847, i64 2
  store i64 %a2, ptr %t4850
  %t4851 = getelementptr i64, ptr %t4847, i64 3
  store i64 %a3, ptr %t4851
  %t4852 = getelementptr i64, ptr %t4847, i64 4
  store i64 %a4, ptr %t4852
  %t4853 = getelementptr i64, ptr %t4847, i64 5
  store i64 %a5, ptr %t4853
  %t4854 = getelementptr i64, ptr %t4847, i64 6
  store i64 %a6, ptr %t4854
  %t4855 = getelementptr i64, ptr %t4847, i64 7
  store i64 %a7, ptr %t4855
  %t4856 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4847, ptr %overflow)
  %t4857 = call i64 @rt_string_length(i64 %a2)
  %t4858 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4858)
  %t4859 = and i64 %t4858, -8
  %t4860 = inttoptr i64 %t4859 to ptr
  %t4861 = load i64, ptr %t4860
  %t4862 = inttoptr i64 %t4861 to ptr
  %t4863 = call fastcc i64%t4862(i64 %t4858, i64 1, i64 %t4856, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4864 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4864)
  %t4865 = and i64 %t4864, -8
  %t4866 = inttoptr i64 %t4865 to ptr
  %t4867 = load i64, ptr %t4866
  %t4868 = inttoptr i64 %t4867 to ptr
  %t4869 = call fastcc i64%t4868(i64 %t4864, i64 2, i64 %t4856, i64 %t4857, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4870 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4871 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4871)
  %t4872 = and i64 %t4871, -8
  %t4873 = inttoptr i64 %t4872 to ptr
  %t4874 = load i64, ptr %t4873
  %t4875 = inttoptr i64 %t4874 to ptr
  %t4876 = call fastcc i64%t4875(i64 %t4871, i64 4, i64 %t4870, i64 %t4863, i64 %t4869, i64 %t4857, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4877 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4878 = or i64 %t4869, %t4863
  %t4879 = and i64 %t4878, 7
  %t4880 = icmp eq i64 %t4879, 0
  br i1 %t4880, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t4881 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4869, i64 %t4863)
  %t4882 = extractvalue {i64, i1} %t4881, 0
  %t4883 = extractvalue {i64, i1} %t4881, 1
  br i1 %t4883, label %fixslow1116, label %fixmerge1117
fixslow1116:
  %t4884 = call i64 @rt_sub(i64 %t4869, i64 %t4863)
  br label %fixmerge1117
fixmerge1117:
  %t4885 = phi i64 [ %t4882, %fixfast1115 ], [ %t4884, %fixslow1116 ]
  %t4886 = or i64 %a1, %t4885
  %t4887 = and i64 %t4886, 7
  %t4888 = icmp eq i64 %t4887, 0
  br i1 %t4888, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t4889 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4885)
  %t4890 = extractvalue {i64, i1} %t4889, 0
  %t4891 = extractvalue {i64, i1} %t4889, 1
  br i1 %t4891, label %fixslow1119, label %fixmerge1120
fixslow1119:
  %t4892 = call i64 @rt_add(i64 %a1, i64 %t4885)
  br label %fixmerge1120
fixmerge1120:
  %t4893 = phi i64 [ %t4890, %fixfast1118 ], [ %t4892, %fixslow1119 ]
  %t4894 = call i64 @rt_string_length(i64 %a0)
  %t4895 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4895)
  %t4896 = and i64 %t4895, -8
  %t4897 = inttoptr i64 %t4896 to ptr
  %t4898 = load i64, ptr %t4897
  %t4899 = inttoptr i64 %t4898 to ptr
  %t4900 = call fastcc i64%t4899(i64 %t4895, i64 4, i64 %t4877, i64 %a1, i64 %t4893, i64 %t4894, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4901 = or i64 %t4863, %a1
  %t4902 = and i64 %t4901, 7
  %t4903 = icmp eq i64 %t4902, 0
  br i1 %t4903, label %fixfast1121, label %fixslow1122
fixfast1121:
  %t4904 = icmp slt i64 %t4863, %a1
  %t4905 = select i1 %t4904, i64 257, i64 1
  br label %fixmerge1123
fixslow1122:
  %t4906 = call i64 @rt_lt(i64 %t4863, i64 %a1)
  br label %fixmerge1123
fixmerge1123:
  %t4907 = phi i64 [ %t4905, %fixfast1121 ], [ %t4906, %fixslow1122 ]
  %t4908 = icmp ne i64 %t4907, 1
  br i1 %t4908, label %then1124, label %else1125
then1124:
  %t4909 = call ptr @rt_alloc_words(i64 6)
  %t4910 = ptrtoint ptr %t4909 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_969" to i64), ptr %t4909
  %t4911 = or i64 %t4910, 4
  %t4912 = getelementptr i64, ptr %t4909, i64 1
  store i64 %a0, ptr %t4912
  %t4913 = getelementptr i64, ptr %t4909, i64 2
  store i64 %a1, ptr %t4913
  %t4914 = getelementptr i64, ptr %t4909, i64 3
  store i64 %a2, ptr %t4914
  %t4915 = getelementptr i64, ptr %t4909, i64 4
  store i64 %t4863, ptr %t4915
  %t4916 = getelementptr i64, ptr %t4909, i64 5
  store i64 %t4911, ptr %t4916
  %t4917 = or i64 %t4869, %t4863
  %t4918 = and i64 %t4917, 7
  %t4919 = icmp eq i64 %t4918, 0
  br i1 %t4919, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t4920 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4869, i64 %t4863)
  %t4921 = extractvalue {i64, i1} %t4920, 0
  %t4922 = extractvalue {i64, i1} %t4920, 1
  br i1 %t4922, label %fixslow1127, label %fixmerge1128
fixslow1127:
  %t4923 = call i64 @rt_sub(i64 %t4869, i64 %t4863)
  br label %fixmerge1128
fixmerge1128:
  %t4924 = phi i64 [ %t4921, %fixfast1126 ], [ %t4923, %fixslow1127 ]
  %t4925 = or i64 %t4924, 8
  %t4926 = and i64 %t4925, 7
  %t4927 = icmp eq i64 %t4926, 0
  br i1 %t4927, label %fixfast1129, label %fixslow1130
fixfast1129:
  %t4928 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4924, i64 8)
  %t4929 = extractvalue {i64, i1} %t4928, 0
  %t4930 = extractvalue {i64, i1} %t4928, 1
  br i1 %t4930, label %fixslow1130, label %fixmerge1131
fixslow1130:
  %t4931 = call i64 @rt_sub(i64 %t4924, i64 8)
  br label %fixmerge1131
fixmerge1131:
  %t4932 = phi i64 [ %t4929, %fixfast1129 ], [ %t4931, %fixslow1130 ]
  %t4933 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %t4911, i64 1, i64 %t4932, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4933
else1125:
  %t4934 = call ptr @rt_alloc_words(i64 7)
  %t4935 = ptrtoint ptr %t4934 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_971" to i64), ptr %t4934
  %t4936 = or i64 %t4935, 4
  %t4937 = getelementptr i64, ptr %t4934, i64 1
  store i64 %t4869, ptr %t4937
  %t4938 = getelementptr i64, ptr %t4934, i64 2
  store i64 %t4863, ptr %t4938
  %t4939 = getelementptr i64, ptr %t4934, i64 3
  store i64 %a0, ptr %t4939
  %t4940 = getelementptr i64, ptr %t4934, i64 4
  store i64 %a1, ptr %t4940
  %t4941 = getelementptr i64, ptr %t4934, i64 5
  store i64 %a2, ptr %t4941
  %t4942 = getelementptr i64, ptr %t4934, i64 6
  store i64 %t4936, ptr %t4942
  %t4943 = musttail call fastcc i64 @"scheme.base:code_971"(i64 %t4936, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4943
}

define fastcc i64 @"scheme.base:code_986"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4948 = icmp eq i64 %argc, 1
  br i1 %t4948, label %argok1133, label %arityerr1132
arityerr1132:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1133:
  %t4949 = and i64 %self, -8
  %t4950 = inttoptr i64 %t4949 to ptr
  %t4951 = getelementptr i64, ptr %t4950, i64 1
  %t4952 = load i64, ptr %t4951
  %t4953 = or i64 %a0, %t4952
  %t4954 = and i64 %t4953, 7
  %t4955 = icmp eq i64 %t4954, 0
  br i1 %t4955, label %fixfast1134, label %fixslow1135
fixfast1134:
  %t4956 = icmp eq i64 %a0, %t4952
  %t4957 = select i1 %t4956, i64 257, i64 1
  br label %fixmerge1136
fixslow1135:
  %t4958 = call i64 @rt_num_eq(i64 %a0, i64 %t4952)
  br label %fixmerge1136
fixmerge1136:
  %t4959 = phi i64 [ %t4957, %fixfast1134 ], [ %t4958, %fixslow1135 ]
  %t4960 = icmp ne i64 %t4959, 1
  br i1 %t4960, label %then1137, label %else1138
then1137:
  %t4961 = and i64 %self, -8
  %t4962 = inttoptr i64 %t4961 to ptr
  %t4963 = getelementptr i64, ptr %t4962, i64 2
  %t4964 = load i64, ptr %t4963
  ret i64 %t4964
else1138:
  %t4965 = and i64 %self, -8
  %t4966 = inttoptr i64 %t4965 to ptr
  %t4967 = getelementptr i64, ptr %t4966, i64 2
  %t4968 = load i64, ptr %t4967
  %t4969 = and i64 %self, -8
  %t4970 = inttoptr i64 %t4969 to ptr
  %t4971 = getelementptr i64, ptr %t4970, i64 3
  %t4972 = load i64, ptr %t4971
  %t4973 = or i64 %a0, %t4972
  %t4974 = and i64 %t4973, 7
  %t4975 = icmp eq i64 %t4974, 0
  br i1 %t4975, label %fixfast1139, label %fixslow1140
fixfast1139:
  %t4976 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4972)
  %t4977 = extractvalue {i64, i1} %t4976, 0
  %t4978 = extractvalue {i64, i1} %t4976, 1
  br i1 %t4978, label %fixslow1140, label %fixmerge1141
fixslow1140:
  %t4979 = call i64 @rt_sub(i64 %a0, i64 %t4972)
  br label %fixmerge1141
fixmerge1141:
  %t4980 = phi i64 [ %t4977, %fixfast1139 ], [ %t4979, %fixslow1140 ]
  %t4981 = and i64 %self, -8
  %t4982 = inttoptr i64 %t4981 to ptr
  %t4983 = getelementptr i64, ptr %t4982, i64 4
  %t4984 = load i64, ptr %t4983
  %t4985 = call i64 @rt_bytevector_u8_ref(i64 %t4984, i64 %a0)
  %t4986 = call i64 @rt_bytevector_u8_set(i64 %t4968, i64 %t4980, i64 %t4985)
  %t4987 = or i64 %a0, 8
  %t4988 = and i64 %t4987, 7
  %t4989 = icmp eq i64 %t4988, 0
  br i1 %t4989, label %fixfast1142, label %fixslow1143
fixfast1142:
  %t4990 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4991 = extractvalue {i64, i1} %t4990, 0
  %t4992 = extractvalue {i64, i1} %t4990, 1
  br i1 %t4992, label %fixslow1143, label %fixmerge1144
fixslow1143:
  %t4993 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1144
fixmerge1144:
  %t4994 = phi i64 [ %t4991, %fixfast1142 ], [ %t4993, %fixslow1143 ]
  %t4995 = musttail call fastcc i64 @"scheme.base:code_986"(i64 %self, i64 1, i64 %t4994, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4995
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4996 = icmp sge i64 %argc, 1
  br i1 %t4996, label %argok1146, label %arityerr1145
arityerr1145:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1146:
  %t4997 = call ptr @rt_alloc_words(i64 8)
  %t4998 = getelementptr i64, ptr %t4997, i64 0
  store i64 %a0, ptr %t4998
  %t4999 = getelementptr i64, ptr %t4997, i64 1
  store i64 %a1, ptr %t4999
  %t5000 = getelementptr i64, ptr %t4997, i64 2
  store i64 %a2, ptr %t5000
  %t5001 = getelementptr i64, ptr %t4997, i64 3
  store i64 %a3, ptr %t5001
  %t5002 = getelementptr i64, ptr %t4997, i64 4
  store i64 %a4, ptr %t5002
  %t5003 = getelementptr i64, ptr %t4997, i64 5
  store i64 %a5, ptr %t5003
  %t5004 = getelementptr i64, ptr %t4997, i64 6
  store i64 %a6, ptr %t5004
  %t5005 = getelementptr i64, ptr %t4997, i64 7
  store i64 %a7, ptr %t5005
  %t5006 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4997, ptr %overflow)
  %t5007 = call i64 @rt_bytevector_length(i64 %a0)
  %t5008 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5008)
  %t5009 = and i64 %t5008, -8
  %t5010 = inttoptr i64 %t5009 to ptr
  %t5011 = load i64, ptr %t5010
  %t5012 = inttoptr i64 %t5011 to ptr
  %t5013 = call fastcc i64%t5012(i64 %t5008, i64 1, i64 %t5006, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5014 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5014)
  %t5015 = and i64 %t5014, -8
  %t5016 = inttoptr i64 %t5015 to ptr
  %t5017 = load i64, ptr %t5016
  %t5018 = inttoptr i64 %t5017 to ptr
  %t5019 = call fastcc i64%t5018(i64 %t5014, i64 2, i64 %t5006, i64 %t5007, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5020 = call i64 @rt_intern(ptr @.str.sym.25)
  %t5021 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5021)
  %t5022 = and i64 %t5021, -8
  %t5023 = inttoptr i64 %t5022 to ptr
  %t5024 = load i64, ptr %t5023
  %t5025 = inttoptr i64 %t5024 to ptr
  %t5026 = call fastcc i64%t5025(i64 %t5021, i64 4, i64 %t5020, i64 %t5013, i64 %t5019, i64 %t5007, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5027 = or i64 %t5019, %t5013
  %t5028 = and i64 %t5027, 7
  %t5029 = icmp eq i64 %t5028, 0
  br i1 %t5029, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t5030 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5019, i64 %t5013)
  %t5031 = extractvalue {i64, i1} %t5030, 0
  %t5032 = extractvalue {i64, i1} %t5030, 1
  br i1 %t5032, label %fixslow1148, label %fixmerge1149
fixslow1148:
  %t5033 = call i64 @rt_sub(i64 %t5019, i64 %t5013)
  br label %fixmerge1149
fixmerge1149:
  %t5034 = phi i64 [ %t5031, %fixfast1147 ], [ %t5033, %fixslow1148 ]
  %t5035 = call i64 @rt_make_bytevector(i64 %t5034, i64 0)
  %t5036 = call ptr @rt_alloc_words(i64 6)
  %t5037 = ptrtoint ptr %t5036 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_986" to i64), ptr %t5036
  %t5038 = or i64 %t5037, 4
  %t5039 = getelementptr i64, ptr %t5036, i64 1
  store i64 %t5019, ptr %t5039
  %t5040 = getelementptr i64, ptr %t5036, i64 2
  store i64 %t5035, ptr %t5040
  %t5041 = getelementptr i64, ptr %t5036, i64 3
  store i64 %t5013, ptr %t5041
  %t5042 = getelementptr i64, ptr %t5036, i64 4
  store i64 %a0, ptr %t5042
  %t5043 = getelementptr i64, ptr %t5036, i64 5
  store i64 %t5038, ptr %t5043
  %t5044 = musttail call fastcc i64 @"scheme.base:code_986"(i64 %t5038, i64 1, i64 %t5013, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5044
}

define fastcc i64 @"scheme.base:code_1012"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5049 = icmp eq i64 %argc, 1
  br i1 %t5049, label %argok1151, label %arityerr1150
arityerr1150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1151:
  %t5050 = or i64 %a0, 0
  %t5051 = and i64 %t5050, 7
  %t5052 = icmp eq i64 %t5051, 0
  br i1 %t5052, label %fixfast1152, label %fixslow1153
fixfast1152:
  %t5053 = icmp slt i64 %a0, 0
  %t5054 = select i1 %t5053, i64 257, i64 1
  br label %fixmerge1154
fixslow1153:
  %t5055 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1154
fixmerge1154:
  %t5056 = phi i64 [ %t5054, %fixfast1152 ], [ %t5055, %fixslow1153 ]
  %t5057 = icmp ne i64 %t5056, 1
  br i1 %t5057, label %then1155, label %else1156
then1155:
  %t5058 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5058)
  %t5059 = and i64 %t5058, -8
  %t5060 = inttoptr i64 %t5059 to ptr
  %t5061 = load i64, ptr %t5060
  %t5062 = inttoptr i64 %t5061 to ptr
  %t5063 = musttail call fastcc i64 %t5062(i64 %t5058, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5063
else1156:
  %t5064 = and i64 %self, -8
  %t5065 = inttoptr i64 %t5064 to ptr
  %t5066 = getelementptr i64, ptr %t5065, i64 1
  %t5067 = load i64, ptr %t5066
  %t5068 = and i64 %self, -8
  %t5069 = inttoptr i64 %t5068 to ptr
  %t5070 = getelementptr i64, ptr %t5069, i64 2
  %t5071 = load i64, ptr %t5070
  %t5072 = or i64 %t5071, %a0
  %t5073 = and i64 %t5072, 7
  %t5074 = icmp eq i64 %t5073, 0
  br i1 %t5074, label %fixfast1157, label %fixslow1158
fixfast1157:
  %t5075 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5071, i64 %a0)
  %t5076 = extractvalue {i64, i1} %t5075, 0
  %t5077 = extractvalue {i64, i1} %t5075, 1
  br i1 %t5077, label %fixslow1158, label %fixmerge1159
fixslow1158:
  %t5078 = call i64 @rt_add(i64 %t5071, i64 %a0)
  br label %fixmerge1159
fixmerge1159:
  %t5079 = phi i64 [ %t5076, %fixfast1157 ], [ %t5078, %fixslow1158 ]
  %t5080 = and i64 %self, -8
  %t5081 = inttoptr i64 %t5080 to ptr
  %t5082 = getelementptr i64, ptr %t5081, i64 3
  %t5083 = load i64, ptr %t5082
  %t5084 = and i64 %self, -8
  %t5085 = inttoptr i64 %t5084 to ptr
  %t5086 = getelementptr i64, ptr %t5085, i64 4
  %t5087 = load i64, ptr %t5086
  %t5088 = or i64 %t5087, %a0
  %t5089 = and i64 %t5088, 7
  %t5090 = icmp eq i64 %t5089, 0
  br i1 %t5090, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t5091 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5087, i64 %a0)
  %t5092 = extractvalue {i64, i1} %t5091, 0
  %t5093 = extractvalue {i64, i1} %t5091, 1
  br i1 %t5093, label %fixslow1161, label %fixmerge1162
fixslow1161:
  %t5094 = call i64 @rt_add(i64 %t5087, i64 %a0)
  br label %fixmerge1162
fixmerge1162:
  %t5095 = phi i64 [ %t5092, %fixfast1160 ], [ %t5094, %fixslow1161 ]
  %t5096 = call i64 @rt_bytevector_u8_ref(i64 %t5083, i64 %t5095)
  %t5097 = call i64 @rt_bytevector_u8_set(i64 %t5067, i64 %t5079, i64 %t5096)
  %t5098 = or i64 %a0, 8
  %t5099 = and i64 %t5098, 7
  %t5100 = icmp eq i64 %t5099, 0
  br i1 %t5100, label %fixfast1163, label %fixslow1164
fixfast1163:
  %t5101 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5102 = extractvalue {i64, i1} %t5101, 0
  %t5103 = extractvalue {i64, i1} %t5101, 1
  br i1 %t5103, label %fixslow1164, label %fixmerge1165
fixslow1164:
  %t5104 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1165
fixmerge1165:
  %t5105 = phi i64 [ %t5102, %fixfast1163 ], [ %t5104, %fixslow1164 ]
  %t5106 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %self, i64 1, i64 %t5105, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5106
}

define fastcc i64 @"scheme.base:code_1014"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5107 = icmp eq i64 %argc, 1
  br i1 %t5107, label %argok1167, label %arityerr1166
arityerr1166:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1167:
  %t5108 = and i64 %self, -8
  %t5109 = inttoptr i64 %t5108 to ptr
  %t5110 = getelementptr i64, ptr %t5109, i64 1
  %t5111 = load i64, ptr %t5110
  %t5112 = and i64 %self, -8
  %t5113 = inttoptr i64 %t5112 to ptr
  %t5114 = getelementptr i64, ptr %t5113, i64 2
  %t5115 = load i64, ptr %t5114
  %t5116 = or i64 %t5111, %t5115
  %t5117 = and i64 %t5116, 7
  %t5118 = icmp eq i64 %t5117, 0
  br i1 %t5118, label %fixfast1168, label %fixslow1169
fixfast1168:
  %t5119 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5111, i64 %t5115)
  %t5120 = extractvalue {i64, i1} %t5119, 0
  %t5121 = extractvalue {i64, i1} %t5119, 1
  br i1 %t5121, label %fixslow1169, label %fixmerge1170
fixslow1169:
  %t5122 = call i64 @rt_sub(i64 %t5111, i64 %t5115)
  br label %fixmerge1170
fixmerge1170:
  %t5123 = phi i64 [ %t5120, %fixfast1168 ], [ %t5122, %fixslow1169 ]
  %t5124 = or i64 %a0, %t5123
  %t5125 = and i64 %t5124, 7
  %t5126 = icmp eq i64 %t5125, 0
  br i1 %t5126, label %fixfast1171, label %fixslow1172
fixfast1171:
  %t5127 = icmp eq i64 %a0, %t5123
  %t5128 = select i1 %t5127, i64 257, i64 1
  br label %fixmerge1173
fixslow1172:
  %t5129 = call i64 @rt_num_eq(i64 %a0, i64 %t5123)
  br label %fixmerge1173
fixmerge1173:
  %t5130 = phi i64 [ %t5128, %fixfast1171 ], [ %t5129, %fixslow1172 ]
  %t5131 = icmp ne i64 %t5130, 1
  br i1 %t5131, label %then1174, label %else1175
then1174:
  %t5132 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5132)
  %t5133 = and i64 %t5132, -8
  %t5134 = inttoptr i64 %t5133 to ptr
  %t5135 = load i64, ptr %t5134
  %t5136 = inttoptr i64 %t5135 to ptr
  %t5137 = musttail call fastcc i64 %t5136(i64 %t5132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5137
else1175:
  %t5138 = and i64 %self, -8
  %t5139 = inttoptr i64 %t5138 to ptr
  %t5140 = getelementptr i64, ptr %t5139, i64 3
  %t5141 = load i64, ptr %t5140
  %t5142 = and i64 %self, -8
  %t5143 = inttoptr i64 %t5142 to ptr
  %t5144 = getelementptr i64, ptr %t5143, i64 4
  %t5145 = load i64, ptr %t5144
  %t5146 = or i64 %t5145, %a0
  %t5147 = and i64 %t5146, 7
  %t5148 = icmp eq i64 %t5147, 0
  br i1 %t5148, label %fixfast1176, label %fixslow1177
fixfast1176:
  %t5149 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5145, i64 %a0)
  %t5150 = extractvalue {i64, i1} %t5149, 0
  %t5151 = extractvalue {i64, i1} %t5149, 1
  br i1 %t5151, label %fixslow1177, label %fixmerge1178
fixslow1177:
  %t5152 = call i64 @rt_add(i64 %t5145, i64 %a0)
  br label %fixmerge1178
fixmerge1178:
  %t5153 = phi i64 [ %t5150, %fixfast1176 ], [ %t5152, %fixslow1177 ]
  %t5154 = and i64 %self, -8
  %t5155 = inttoptr i64 %t5154 to ptr
  %t5156 = getelementptr i64, ptr %t5155, i64 5
  %t5157 = load i64, ptr %t5156
  %t5158 = and i64 %self, -8
  %t5159 = inttoptr i64 %t5158 to ptr
  %t5160 = getelementptr i64, ptr %t5159, i64 2
  %t5161 = load i64, ptr %t5160
  %t5162 = or i64 %t5161, %a0
  %t5163 = and i64 %t5162, 7
  %t5164 = icmp eq i64 %t5163, 0
  br i1 %t5164, label %fixfast1179, label %fixslow1180
fixfast1179:
  %t5165 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5161, i64 %a0)
  %t5166 = extractvalue {i64, i1} %t5165, 0
  %t5167 = extractvalue {i64, i1} %t5165, 1
  br i1 %t5167, label %fixslow1180, label %fixmerge1181
fixslow1180:
  %t5168 = call i64 @rt_add(i64 %t5161, i64 %a0)
  br label %fixmerge1181
fixmerge1181:
  %t5169 = phi i64 [ %t5166, %fixfast1179 ], [ %t5168, %fixslow1180 ]
  %t5170 = call i64 @rt_bytevector_u8_ref(i64 %t5157, i64 %t5169)
  %t5171 = call i64 @rt_bytevector_u8_set(i64 %t5141, i64 %t5153, i64 %t5170)
  %t5172 = or i64 %a0, 8
  %t5173 = and i64 %t5172, 7
  %t5174 = icmp eq i64 %t5173, 0
  br i1 %t5174, label %fixfast1182, label %fixslow1183
fixfast1182:
  %t5175 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5176 = extractvalue {i64, i1} %t5175, 0
  %t5177 = extractvalue {i64, i1} %t5175, 1
  br i1 %t5177, label %fixslow1183, label %fixmerge1184
fixslow1183:
  %t5178 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1184
fixmerge1184:
  %t5179 = phi i64 [ %t5176, %fixfast1182 ], [ %t5178, %fixslow1183 ]
  %t5180 = musttail call fastcc i64 @"scheme.base:code_1014"(i64 %self, i64 1, i64 %t5179, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5180
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5181 = icmp sge i64 %argc, 3
  br i1 %t5181, label %argok1186, label %arityerr1185
arityerr1185:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1186:
  %t5182 = call ptr @rt_alloc_words(i64 8)
  %t5183 = getelementptr i64, ptr %t5182, i64 0
  store i64 %a0, ptr %t5183
  %t5184 = getelementptr i64, ptr %t5182, i64 1
  store i64 %a1, ptr %t5184
  %t5185 = getelementptr i64, ptr %t5182, i64 2
  store i64 %a2, ptr %t5185
  %t5186 = getelementptr i64, ptr %t5182, i64 3
  store i64 %a3, ptr %t5186
  %t5187 = getelementptr i64, ptr %t5182, i64 4
  store i64 %a4, ptr %t5187
  %t5188 = getelementptr i64, ptr %t5182, i64 5
  store i64 %a5, ptr %t5188
  %t5189 = getelementptr i64, ptr %t5182, i64 6
  store i64 %a6, ptr %t5189
  %t5190 = getelementptr i64, ptr %t5182, i64 7
  store i64 %a7, ptr %t5190
  %t5191 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5182, ptr %overflow)
  %t5192 = call i64 @rt_bytevector_length(i64 %a2)
  %t5193 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5193)
  %t5194 = and i64 %t5193, -8
  %t5195 = inttoptr i64 %t5194 to ptr
  %t5196 = load i64, ptr %t5195
  %t5197 = inttoptr i64 %t5196 to ptr
  %t5198 = call fastcc i64%t5197(i64 %t5193, i64 1, i64 %t5191, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5199 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5199)
  %t5200 = and i64 %t5199, -8
  %t5201 = inttoptr i64 %t5200 to ptr
  %t5202 = load i64, ptr %t5201
  %t5203 = inttoptr i64 %t5202 to ptr
  %t5204 = call fastcc i64%t5203(i64 %t5199, i64 2, i64 %t5191, i64 %t5192, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5205 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5206 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5206)
  %t5207 = and i64 %t5206, -8
  %t5208 = inttoptr i64 %t5207 to ptr
  %t5209 = load i64, ptr %t5208
  %t5210 = inttoptr i64 %t5209 to ptr
  %t5211 = call fastcc i64%t5210(i64 %t5206, i64 4, i64 %t5205, i64 %t5198, i64 %t5204, i64 %t5192, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5212 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5213 = or i64 %t5204, %t5198
  %t5214 = and i64 %t5213, 7
  %t5215 = icmp eq i64 %t5214, 0
  br i1 %t5215, label %fixfast1187, label %fixslow1188
fixfast1187:
  %t5216 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5204, i64 %t5198)
  %t5217 = extractvalue {i64, i1} %t5216, 0
  %t5218 = extractvalue {i64, i1} %t5216, 1
  br i1 %t5218, label %fixslow1188, label %fixmerge1189
fixslow1188:
  %t5219 = call i64 @rt_sub(i64 %t5204, i64 %t5198)
  br label %fixmerge1189
fixmerge1189:
  %t5220 = phi i64 [ %t5217, %fixfast1187 ], [ %t5219, %fixslow1188 ]
  %t5221 = or i64 %a1, %t5220
  %t5222 = and i64 %t5221, 7
  %t5223 = icmp eq i64 %t5222, 0
  br i1 %t5223, label %fixfast1190, label %fixslow1191
fixfast1190:
  %t5224 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5220)
  %t5225 = extractvalue {i64, i1} %t5224, 0
  %t5226 = extractvalue {i64, i1} %t5224, 1
  br i1 %t5226, label %fixslow1191, label %fixmerge1192
fixslow1191:
  %t5227 = call i64 @rt_add(i64 %a1, i64 %t5220)
  br label %fixmerge1192
fixmerge1192:
  %t5228 = phi i64 [ %t5225, %fixfast1190 ], [ %t5227, %fixslow1191 ]
  %t5229 = call i64 @rt_bytevector_length(i64 %a0)
  %t5230 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5230)
  %t5231 = and i64 %t5230, -8
  %t5232 = inttoptr i64 %t5231 to ptr
  %t5233 = load i64, ptr %t5232
  %t5234 = inttoptr i64 %t5233 to ptr
  %t5235 = call fastcc i64%t5234(i64 %t5230, i64 4, i64 %t5212, i64 %a1, i64 %t5228, i64 %t5229, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5236 = or i64 %t5198, %a1
  %t5237 = and i64 %t5236, 7
  %t5238 = icmp eq i64 %t5237, 0
  br i1 %t5238, label %fixfast1193, label %fixslow1194
fixfast1193:
  %t5239 = icmp slt i64 %t5198, %a1
  %t5240 = select i1 %t5239, i64 257, i64 1
  br label %fixmerge1195
fixslow1194:
  %t5241 = call i64 @rt_lt(i64 %t5198, i64 %a1)
  br label %fixmerge1195
fixmerge1195:
  %t5242 = phi i64 [ %t5240, %fixfast1193 ], [ %t5241, %fixslow1194 ]
  %t5243 = icmp ne i64 %t5242, 1
  br i1 %t5243, label %then1196, label %else1197
then1196:
  %t5244 = call ptr @rt_alloc_words(i64 6)
  %t5245 = ptrtoint ptr %t5244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1012" to i64), ptr %t5244
  %t5246 = or i64 %t5245, 4
  %t5247 = getelementptr i64, ptr %t5244, i64 1
  store i64 %a0, ptr %t5247
  %t5248 = getelementptr i64, ptr %t5244, i64 2
  store i64 %a1, ptr %t5248
  %t5249 = getelementptr i64, ptr %t5244, i64 3
  store i64 %a2, ptr %t5249
  %t5250 = getelementptr i64, ptr %t5244, i64 4
  store i64 %t5198, ptr %t5250
  %t5251 = getelementptr i64, ptr %t5244, i64 5
  store i64 %t5246, ptr %t5251
  %t5252 = or i64 %t5204, %t5198
  %t5253 = and i64 %t5252, 7
  %t5254 = icmp eq i64 %t5253, 0
  br i1 %t5254, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t5255 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5204, i64 %t5198)
  %t5256 = extractvalue {i64, i1} %t5255, 0
  %t5257 = extractvalue {i64, i1} %t5255, 1
  br i1 %t5257, label %fixslow1199, label %fixmerge1200
fixslow1199:
  %t5258 = call i64 @rt_sub(i64 %t5204, i64 %t5198)
  br label %fixmerge1200
fixmerge1200:
  %t5259 = phi i64 [ %t5256, %fixfast1198 ], [ %t5258, %fixslow1199 ]
  %t5260 = or i64 %t5259, 8
  %t5261 = and i64 %t5260, 7
  %t5262 = icmp eq i64 %t5261, 0
  br i1 %t5262, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t5263 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5259, i64 8)
  %t5264 = extractvalue {i64, i1} %t5263, 0
  %t5265 = extractvalue {i64, i1} %t5263, 1
  br i1 %t5265, label %fixslow1202, label %fixmerge1203
fixslow1202:
  %t5266 = call i64 @rt_sub(i64 %t5259, i64 8)
  br label %fixmerge1203
fixmerge1203:
  %t5267 = phi i64 [ %t5264, %fixfast1201 ], [ %t5266, %fixslow1202 ]
  %t5268 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %t5246, i64 1, i64 %t5267, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5268
else1197:
  %t5269 = call ptr @rt_alloc_words(i64 7)
  %t5270 = ptrtoint ptr %t5269 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1014" to i64), ptr %t5269
  %t5271 = or i64 %t5270, 4
  %t5272 = getelementptr i64, ptr %t5269, i64 1
  store i64 %t5204, ptr %t5272
  %t5273 = getelementptr i64, ptr %t5269, i64 2
  store i64 %t5198, ptr %t5273
  %t5274 = getelementptr i64, ptr %t5269, i64 3
  store i64 %a0, ptr %t5274
  %t5275 = getelementptr i64, ptr %t5269, i64 4
  store i64 %a1, ptr %t5275
  %t5276 = getelementptr i64, ptr %t5269, i64 5
  store i64 %a2, ptr %t5276
  %t5277 = getelementptr i64, ptr %t5269, i64 6
  store i64 %t5271, ptr %t5277
  %t5278 = musttail call fastcc i64 @"scheme.base:code_1014"(i64 %t5271, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5278
}

define fastcc i64 @"scheme.base:code_1032"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5283 = icmp eq i64 %argc, 1
  br i1 %t5283, label %argok1205, label %arityerr1204
arityerr1204:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1205:
  %t5284 = and i64 %self, -8
  %t5285 = inttoptr i64 %t5284 to ptr
  %t5286 = getelementptr i64, ptr %t5285, i64 1
  %t5287 = load i64, ptr %t5286
  %t5288 = or i64 %a0, %t5287
  %t5289 = and i64 %t5288, 7
  %t5290 = icmp eq i64 %t5289, 0
  br i1 %t5290, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t5291 = icmp eq i64 %a0, %t5287
  %t5292 = select i1 %t5291, i64 257, i64 1
  br label %fixmerge1208
fixslow1207:
  %t5293 = call i64 @rt_num_eq(i64 %a0, i64 %t5287)
  br label %fixmerge1208
fixmerge1208:
  %t5294 = phi i64 [ %t5292, %fixfast1206 ], [ %t5293, %fixslow1207 ]
  %t5295 = icmp ne i64 %t5294, 1
  br i1 %t5295, label %then1209, label %else1210
then1209:
  %t5296 = and i64 %self, -8
  %t5297 = inttoptr i64 %t5296 to ptr
  %t5298 = getelementptr i64, ptr %t5297, i64 3
  %t5299 = load i64, ptr %t5298
  %t5300 = call i64 @rt_cdr(i64 %t5299)
  %t5301 = and i64 %self, -8
  %t5302 = inttoptr i64 %t5301 to ptr
  %t5303 = getelementptr i64, ptr %t5302, i64 4
  %t5304 = load i64, ptr %t5303
  %t5305 = and i64 %self, -8
  %t5306 = inttoptr i64 %t5305 to ptr
  %t5307 = getelementptr i64, ptr %t5306, i64 1
  %t5308 = load i64, ptr %t5307
  %t5309 = or i64 %t5304, %t5308
  %t5310 = and i64 %t5309, 7
  %t5311 = icmp eq i64 %t5310, 0
  br i1 %t5311, label %fixfast1211, label %fixslow1212
fixfast1211:
  %t5312 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5304, i64 %t5308)
  %t5313 = extractvalue {i64, i1} %t5312, 0
  %t5314 = extractvalue {i64, i1} %t5312, 1
  br i1 %t5314, label %fixslow1212, label %fixmerge1213
fixslow1212:
  %t5315 = call i64 @rt_add(i64 %t5304, i64 %t5308)
  br label %fixmerge1213
fixmerge1213:
  %t5316 = phi i64 [ %t5313, %fixfast1211 ], [ %t5315, %fixslow1212 ]
  %t5317 = and i64 %self, -8
  %t5318 = inttoptr i64 %t5317 to ptr
  %t5319 = getelementptr i64, ptr %t5318, i64 2
  %t5320 = load i64, ptr %t5319
  %t5321 = musttail call fastcc i64 @"scheme.base:code_1030"(i64 %t5320, i64 2, i64 %t5300, i64 %t5316, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5321
else1210:
  %t5322 = and i64 %self, -8
  %t5323 = inttoptr i64 %t5322 to ptr
  %t5324 = getelementptr i64, ptr %t5323, i64 5
  %t5325 = load i64, ptr %t5324
  %t5326 = and i64 %self, -8
  %t5327 = inttoptr i64 %t5326 to ptr
  %t5328 = getelementptr i64, ptr %t5327, i64 4
  %t5329 = load i64, ptr %t5328
  %t5330 = or i64 %t5329, %a0
  %t5331 = and i64 %t5330, 7
  %t5332 = icmp eq i64 %t5331, 0
  br i1 %t5332, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5333 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5329, i64 %a0)
  %t5334 = extractvalue {i64, i1} %t5333, 0
  %t5335 = extractvalue {i64, i1} %t5333, 1
  br i1 %t5335, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t5336 = call i64 @rt_add(i64 %t5329, i64 %a0)
  br label %fixmerge1216
fixmerge1216:
  %t5337 = phi i64 [ %t5334, %fixfast1214 ], [ %t5336, %fixslow1215 ]
  %t5338 = and i64 %self, -8
  %t5339 = inttoptr i64 %t5338 to ptr
  %t5340 = getelementptr i64, ptr %t5339, i64 6
  %t5341 = load i64, ptr %t5340
  %t5342 = call i64 @rt_bytevector_u8_ref(i64 %t5341, i64 %a0)
  %t5343 = call i64 @rt_bytevector_u8_set(i64 %t5325, i64 %t5337, i64 %t5342)
  %t5344 = or i64 %a0, 8
  %t5345 = and i64 %t5344, 7
  %t5346 = icmp eq i64 %t5345, 0
  br i1 %t5346, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t5347 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5348 = extractvalue {i64, i1} %t5347, 0
  %t5349 = extractvalue {i64, i1} %t5347, 1
  br i1 %t5349, label %fixslow1218, label %fixmerge1219
fixslow1218:
  %t5350 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1219
fixmerge1219:
  %t5351 = phi i64 [ %t5348, %fixfast1217 ], [ %t5350, %fixslow1218 ]
  %t5352 = musttail call fastcc i64 @"scheme.base:code_1032"(i64 %self, i64 1, i64 %t5351, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5352
}

define fastcc i64 @"scheme.base:code_1030"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5353 = icmp eq i64 %argc, 2
  br i1 %t5353, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1221:
  %t5354 = call i64 @rt_null_p(i64 %a0)
  %t5355 = icmp ne i64 %t5354, 1
  br i1 %t5355, label %then1222, label %else1223
then1222:
  %t5356 = and i64 %self, -8
  %t5357 = inttoptr i64 %t5356 to ptr
  %t5358 = getelementptr i64, ptr %t5357, i64 1
  %t5359 = load i64, ptr %t5358
  ret i64 %t5359
else1223:
  %t5360 = call i64 @rt_car(i64 %a0)
  %t5361 = call i64 @rt_bytevector_length(i64 %t5360)
  %t5362 = call ptr @rt_alloc_words(i64 8)
  %t5363 = ptrtoint ptr %t5362 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1032" to i64), ptr %t5362
  %t5364 = or i64 %t5363, 4
  %t5365 = getelementptr i64, ptr %t5362, i64 1
  store i64 %t5361, ptr %t5365
  %t5366 = and i64 %self, -8
  %t5367 = inttoptr i64 %t5366 to ptr
  %t5368 = getelementptr i64, ptr %t5367, i64 2
  %t5369 = load i64, ptr %t5368
  %t5370 = getelementptr i64, ptr %t5362, i64 2
  store i64 %t5369, ptr %t5370
  %t5371 = getelementptr i64, ptr %t5362, i64 3
  store i64 %a0, ptr %t5371
  %t5372 = getelementptr i64, ptr %t5362, i64 4
  store i64 %a1, ptr %t5372
  %t5373 = and i64 %self, -8
  %t5374 = inttoptr i64 %t5373 to ptr
  %t5375 = getelementptr i64, ptr %t5374, i64 1
  %t5376 = load i64, ptr %t5375
  %t5377 = getelementptr i64, ptr %t5362, i64 5
  store i64 %t5376, ptr %t5377
  %t5378 = getelementptr i64, ptr %t5362, i64 6
  store i64 %t5360, ptr %t5378
  %t5379 = getelementptr i64, ptr %t5362, i64 7
  store i64 %t5364, ptr %t5379
  %t5380 = musttail call fastcc i64 @"scheme.base:code_1032"(i64 %t5364, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5380
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5381 = icmp sge i64 %argc, 0
  br i1 %t5381, label %argok1225, label %arityerr1224
arityerr1224:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1225:
  %t5382 = call ptr @rt_alloc_words(i64 8)
  %t5383 = getelementptr i64, ptr %t5382, i64 0
  store i64 %a0, ptr %t5383
  %t5384 = getelementptr i64, ptr %t5382, i64 1
  store i64 %a1, ptr %t5384
  %t5385 = getelementptr i64, ptr %t5382, i64 2
  store i64 %a2, ptr %t5385
  %t5386 = getelementptr i64, ptr %t5382, i64 3
  store i64 %a3, ptr %t5386
  %t5387 = getelementptr i64, ptr %t5382, i64 4
  store i64 %a4, ptr %t5387
  %t5388 = getelementptr i64, ptr %t5382, i64 5
  store i64 %a5, ptr %t5388
  %t5389 = getelementptr i64, ptr %t5382, i64 6
  store i64 %a6, ptr %t5389
  %t5390 = getelementptr i64, ptr %t5382, i64 7
  store i64 %a7, ptr %t5390
  %t5391 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5382, ptr %overflow)
  %t5392 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t5392)
  %t5393 = and i64 %t5392, -8
  %t5394 = inttoptr i64 %t5393 to ptr
  %t5395 = load i64, ptr %t5394
  %t5396 = inttoptr i64 %t5395 to ptr
  %t5397 = call fastcc i64%t5396(i64 %t5392, i64 1, i64 %t5391, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5398 = call i64 @rt_make_bytevector(i64 %t5397, i64 0)
  %t5399 = call ptr @rt_alloc_words(i64 3)
  %t5400 = ptrtoint ptr %t5399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1030" to i64), ptr %t5399
  %t5401 = or i64 %t5400, 4
  %t5402 = getelementptr i64, ptr %t5399, i64 1
  store i64 %t5398, ptr %t5402
  %t5403 = getelementptr i64, ptr %t5399, i64 2
  store i64 %t5401, ptr %t5403
  %t5404 = musttail call fastcc i64 @"scheme.base:code_1030"(i64 %t5401, i64 2, i64 %t5391, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5404
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5409 = icmp eq i64 %argc, 1
  br i1 %t5409, label %argok1227, label %arityerr1226
arityerr1226:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1227:
  %t5410 = call i64 @rt_null_p(i64 %a0)
  %t5411 = icmp ne i64 %t5410, 1
  br i1 %t5411, label %then1228, label %else1229
then1228:
  ret i64 0
else1229:
  %t5412 = call i64 @rt_car(i64 %a0)
  %t5413 = call i64 @rt_bytevector_length(i64 %t5412)
  %t5414 = call i64 @rt_cdr(i64 %a0)
  %t5415 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t5415)
  %t5416 = and i64 %t5415, -8
  %t5417 = inttoptr i64 %t5416 to ptr
  %t5418 = load i64, ptr %t5417
  %t5419 = inttoptr i64 %t5418 to ptr
  %t5420 = call fastcc i64%t5419(i64 %t5415, i64 1, i64 %t5414, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5421 = or i64 %t5413, %t5420
  %t5422 = and i64 %t5421, 7
  %t5423 = icmp eq i64 %t5422, 0
  br i1 %t5423, label %fixfast1230, label %fixslow1231
fixfast1230:
  %t5424 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5413, i64 %t5420)
  %t5425 = extractvalue {i64, i1} %t5424, 0
  %t5426 = extractvalue {i64, i1} %t5424, 1
  br i1 %t5426, label %fixslow1231, label %fixmerge1232
fixslow1231:
  %t5427 = call i64 @rt_add(i64 %t5413, i64 %t5420)
  br label %fixmerge1232
fixmerge1232:
  %t5428 = phi i64 [ %t5425, %fixfast1230 ], [ %t5427, %fixslow1231 ]
  ret i64 %t5428
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5434 = icmp eq i64 %argc, 2
  br i1 %t5434, label %argok1234, label %arityerr1233
arityerr1233:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1234:
  %t5435 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t5435)
  %t5436 = and i64 %t5435, -8
  %t5437 = inttoptr i64 %t5436 to ptr
  %t5438 = load i64, ptr %t5437
  %t5439 = inttoptr i64 %t5438 to ptr
  %t5440 = call fastcc i64%t5439(i64 %t5435, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5441 = or i64 %a0, %t5440
  %t5442 = and i64 %t5441, 7
  %t5443 = icmp eq i64 %t5442, 0
  br i1 %t5443, label %fixfast1235, label %fixslow1236
fixfast1235:
  %t5444 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5440)
  %t5445 = extractvalue {i64, i1} %t5444, 0
  %t5446 = extractvalue {i64, i1} %t5444, 1
  br i1 %t5446, label %fixslow1236, label %fixmerge1237
fixslow1236:
  %t5447 = call i64 @rt_sub(i64 %a0, i64 %t5440)
  br label %fixmerge1237
fixmerge1237:
  %t5448 = phi i64 [ %t5445, %fixfast1235 ], [ %t5447, %fixslow1236 ]
  %t5449 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t5449)
  %t5450 = and i64 %t5449, -8
  %t5451 = inttoptr i64 %t5450 to ptr
  %t5452 = load i64, ptr %t5451
  %t5453 = inttoptr i64 %t5452 to ptr
  %t5454 = call fastcc i64%t5453(i64 %t5449, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5455 = or i64 %a0, %t5454
  %t5456 = and i64 %t5455, 7
  %t5457 = icmp eq i64 %t5456, 0
  br i1 %t5457, label %fixfast1238, label %fixslow1239
fixfast1238:
  %t5458 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t5454)
  %t5459 = extractvalue {i64, i1} %t5458, 0
  %t5460 = extractvalue {i64, i1} %t5458, 1
  br i1 %t5460, label %fixslow1239, label %fixmerge1240
fixslow1239:
  %t5461 = call i64 @rt_add(i64 %a0, i64 %t5454)
  br label %fixmerge1240
fixmerge1240:
  %t5462 = phi i64 [ %t5459, %fixfast1238 ], [ %t5461, %fixslow1239 ]
  %t5463 = call i64 @rt_exact_p(i64 %a0)
  %t5464 = icmp ne i64 %t5463, 1
  br i1 %t5464, label %then1241, label %else1242
then1241:
  %t5465 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1243
else1242:
  br label %merge1243
merge1243:
  %t5466 = phi i64 [ %t5465, %then1241 ], [ 1, %else1242 ]
  %t5467 = icmp ne i64 %t5466, 1
  br i1 %t5467, label %then1244, label %else1245
then1244:
  %t5468 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t5468)
  %t5469 = and i64 %t5468, -8
  %t5470 = inttoptr i64 %t5469 to ptr
  %t5471 = load i64, ptr %t5470
  %t5472 = inttoptr i64 %t5471 to ptr
  %t5473 = musttail call fastcc i64 %t5472(i64 %t5468, i64 2, i64 %t5448, i64 %t5462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5473
else1245:
  %t5474 = call i64 @rt_exact_to_inexact(i64 %t5448)
  %t5475 = call i64 @rt_exact_to_inexact(i64 %t5462)
  %t5476 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t5476)
  %t5477 = and i64 %t5476, -8
  %t5478 = inttoptr i64 %t5477 to ptr
  %t5479 = load i64, ptr %t5478
  %t5480 = inttoptr i64 %t5479 to ptr
  %t5481 = musttail call fastcc i64 %t5480(i64 %t5476, i64 2, i64 %t5474, i64 %t5475, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5481
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5486 = icmp eq i64 %argc, 2
  br i1 %t5486, label %argok1247, label %arityerr1246
arityerr1246:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1247:
  %t5487 = or i64 %a0, 0
  %t5488 = and i64 %t5487, 7
  %t5489 = icmp eq i64 %t5488, 0
  br i1 %t5489, label %fixfast1248, label %fixslow1249
fixfast1248:
  %t5490 = icmp slt i64 %a0, 0
  %t5491 = select i1 %t5490, i64 257, i64 1
  br label %fixmerge1250
fixslow1249:
  %t5492 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1250
fixmerge1250:
  %t5493 = phi i64 [ %t5491, %fixfast1248 ], [ %t5492, %fixslow1249 ]
  %t5494 = icmp ne i64 %t5493, 1
  br i1 %t5494, label %then1251, label %else1252
then1251:
  br label %merge1253
else1252:
  %t5495 = or i64 %a0, 0
  %t5496 = and i64 %t5495, 7
  %t5497 = icmp eq i64 %t5496, 0
  br i1 %t5497, label %fixfast1254, label %fixslow1255
fixfast1254:
  %t5498 = icmp eq i64 %a0, 0
  %t5499 = select i1 %t5498, i64 257, i64 1
  br label %fixmerge1256
fixslow1255:
  %t5500 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1256
fixmerge1256:
  %t5501 = phi i64 [ %t5499, %fixfast1254 ], [ %t5500, %fixslow1255 ]
  br label %merge1253
merge1253:
  %t5502 = phi i64 [ 257, %then1251 ], [ %t5501, %fixmerge1256 ]
  %t5503 = icmp ne i64 %t5502, 1
  br i1 %t5503, label %then1257, label %else1258
then1257:
  %t5504 = or i64 0, %a1
  %t5505 = and i64 %t5504, 7
  %t5506 = icmp eq i64 %t5505, 0
  br i1 %t5506, label %fixfast1260, label %fixslow1261
fixfast1260:
  %t5507 = icmp slt i64 0, %a1
  %t5508 = select i1 %t5507, i64 257, i64 1
  br label %fixmerge1262
fixslow1261:
  %t5509 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1262
fixmerge1262:
  %t5510 = phi i64 [ %t5508, %fixfast1260 ], [ %t5509, %fixslow1261 ]
  %t5511 = icmp ne i64 %t5510, 1
  br i1 %t5511, label %then1263, label %else1264
then1263:
  br label %merge1265
else1264:
  %t5512 = or i64 0, %a1
  %t5513 = and i64 %t5512, 7
  %t5514 = icmp eq i64 %t5513, 0
  br i1 %t5514, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t5515 = icmp eq i64 0, %a1
  %t5516 = select i1 %t5515, i64 257, i64 1
  br label %fixmerge1268
fixslow1267:
  %t5517 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1268
fixmerge1268:
  %t5518 = phi i64 [ %t5516, %fixfast1266 ], [ %t5517, %fixslow1267 ]
  br label %merge1265
merge1265:
  %t5519 = phi i64 [ 257, %then1263 ], [ %t5518, %fixmerge1268 ]
  br label %merge1259
else1258:
  br label %merge1259
merge1259:
  %t5520 = phi i64 [ %t5519, %merge1265 ], [ 1, %else1258 ]
  %t5521 = icmp ne i64 %t5520, 1
  br i1 %t5521, label %then1269, label %else1270
then1269:
  ret i64 0
else1270:
  %t5522 = or i64 0, %a0
  %t5523 = and i64 %t5522, 7
  %t5524 = icmp eq i64 %t5523, 0
  br i1 %t5524, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t5525 = icmp slt i64 0, %a0
  %t5526 = select i1 %t5525, i64 257, i64 1
  br label %fixmerge1273
fixslow1272:
  %t5527 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1273
fixmerge1273:
  %t5528 = phi i64 [ %t5526, %fixfast1271 ], [ %t5527, %fixslow1272 ]
  %t5529 = icmp ne i64 %t5528, 1
  br i1 %t5529, label %then1274, label %else1275
then1274:
  %t5530 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t5530)
  %t5531 = and i64 %t5530, -8
  %t5532 = inttoptr i64 %t5531 to ptr
  %t5533 = load i64, ptr %t5532
  %t5534 = inttoptr i64 %t5533 to ptr
  %t5535 = call fastcc i64%t5534(i64 %t5530, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5536 = or i64 %t5535, %a1
  %t5537 = and i64 %t5536, 7
  %t5538 = icmp eq i64 %t5537, 0
  br i1 %t5538, label %fixfast1276, label %fixslow1277
fixfast1276:
  %t5539 = icmp slt i64 %t5535, %a1
  %t5540 = select i1 %t5539, i64 257, i64 1
  br label %fixmerge1278
fixslow1277:
  %t5541 = call i64 @rt_lt(i64 %t5535, i64 %a1)
  br label %fixmerge1278
fixmerge1278:
  %t5542 = phi i64 [ %t5540, %fixfast1276 ], [ %t5541, %fixslow1277 ]
  %t5543 = icmp ne i64 %t5542, 1
  br i1 %t5543, label %then1279, label %else1280
then1279:
  br label %merge1281
else1280:
  %t5544 = or i64 %t5535, %a1
  %t5545 = and i64 %t5544, 7
  %t5546 = icmp eq i64 %t5545, 0
  br i1 %t5546, label %fixfast1282, label %fixslow1283
fixfast1282:
  %t5547 = icmp eq i64 %t5535, %a1
  %t5548 = select i1 %t5547, i64 257, i64 1
  br label %fixmerge1284
fixslow1283:
  %t5549 = call i64 @rt_num_eq(i64 %t5535, i64 %a1)
  br label %fixmerge1284
fixmerge1284:
  %t5550 = phi i64 [ %t5548, %fixfast1282 ], [ %t5549, %fixslow1283 ]
  br label %merge1281
merge1281:
  %t5551 = phi i64 [ 257, %then1279 ], [ %t5550, %fixmerge1284 ]
  %t5552 = icmp ne i64 %t5551, 1
  br i1 %t5552, label %then1285, label %else1286
then1285:
  %t5553 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t5553)
  %t5554 = and i64 %t5553, -8
  %t5555 = inttoptr i64 %t5554 to ptr
  %t5556 = load i64, ptr %t5555
  %t5557 = inttoptr i64 %t5556 to ptr
  %t5558 = musttail call fastcc i64 %t5557(i64 %t5553, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5558
else1286:
  %t5559 = call i64 @rt_make_string(ptr @.str.lit.27, i64 69)
  %t5560 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5560)
  %t5561 = and i64 %t5560, -8
  %t5562 = inttoptr i64 %t5561 to ptr
  %t5563 = load i64, ptr %t5562
  %t5564 = inttoptr i64 %t5563 to ptr
  %t5565 = musttail call fastcc i64 %t5564(i64 %t5560, i64 3, i64 %t5559, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5565
else1275:
  %t5566 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t5566)
  %t5567 = and i64 %t5566, -8
  %t5568 = inttoptr i64 %t5567 to ptr
  %t5569 = load i64, ptr %t5568
  %t5570 = inttoptr i64 %t5569 to ptr
  %t5571 = call fastcc i64%t5570(i64 %t5566, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5572 = or i64 %a0, %t5571
  %t5573 = and i64 %t5572, 7
  %t5574 = icmp eq i64 %t5573, 0
  br i1 %t5574, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t5575 = icmp slt i64 %a0, %t5571
  %t5576 = select i1 %t5575, i64 257, i64 1
  br label %fixmerge1289
fixslow1288:
  %t5577 = call i64 @rt_lt(i64 %a0, i64 %t5571)
  br label %fixmerge1289
fixmerge1289:
  %t5578 = phi i64 [ %t5576, %fixfast1287 ], [ %t5577, %fixslow1288 ]
  %t5579 = icmp ne i64 %t5578, 1
  br i1 %t5579, label %then1290, label %else1291
then1290:
  br label %merge1292
else1291:
  %t5580 = or i64 %a0, %t5571
  %t5581 = and i64 %t5580, 7
  %t5582 = icmp eq i64 %t5581, 0
  br i1 %t5582, label %fixfast1293, label %fixslow1294
fixfast1293:
  %t5583 = icmp eq i64 %a0, %t5571
  %t5584 = select i1 %t5583, i64 257, i64 1
  br label %fixmerge1295
fixslow1294:
  %t5585 = call i64 @rt_num_eq(i64 %a0, i64 %t5571)
  br label %fixmerge1295
fixmerge1295:
  %t5586 = phi i64 [ %t5584, %fixfast1293 ], [ %t5585, %fixslow1294 ]
  br label %merge1292
merge1292:
  %t5587 = phi i64 [ 257, %then1290 ], [ %t5586, %fixmerge1295 ]
  %t5588 = icmp ne i64 %t5587, 1
  br i1 %t5588, label %then1296, label %else1297
then1296:
  %t5589 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t5589)
  %t5590 = and i64 %t5589, -8
  %t5591 = inttoptr i64 %t5590 to ptr
  %t5592 = load i64, ptr %t5591
  %t5593 = inttoptr i64 %t5592 to ptr
  %t5594 = musttail call fastcc i64 %t5593(i64 %t5589, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5594
else1297:
  %t5595 = call i64 @rt_make_string(ptr @.str.lit.28, i64 69)
  %t5596 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5596)
  %t5597 = and i64 %t5596, -8
  %t5598 = inttoptr i64 %t5597 to ptr
  %t5599 = load i64, ptr %t5598
  %t5600 = inttoptr i64 %t5599 to ptr
  %t5601 = musttail call fastcc i64 %t5600(i64 %t5596, i64 3, i64 %t5595, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5601
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5606 = icmp eq i64 %argc, 1
  br i1 %t5606, label %argok1299, label %arityerr1298
arityerr1298:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1299:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5611 = icmp eq i64 %argc, 1
  br i1 %t5611, label %argok1301, label %arityerr1300
arityerr1300:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1301:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1086"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5616 = icmp eq i64 %argc, 1
  br i1 %t5616, label %argok1303, label %arityerr1302
arityerr1302:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1303:
  %t5617 = load i64, ptr @"scheme.base:rat-max-denom"
  %t5618 = or i64 %t5617, %a0
  %t5619 = and i64 %t5618, 7
  %t5620 = icmp eq i64 %t5619, 0
  br i1 %t5620, label %fixfast1304, label %fixslow1305
fixfast1304:
  %t5621 = icmp slt i64 %t5617, %a0
  %t5622 = select i1 %t5621, i64 257, i64 1
  br label %fixmerge1306
fixslow1305:
  %t5623 = call i64 @rt_lt(i64 %t5617, i64 %a0)
  br label %fixmerge1306
fixmerge1306:
  %t5624 = phi i64 [ %t5622, %fixfast1304 ], [ %t5623, %fixslow1305 ]
  %t5625 = icmp ne i64 %t5624, 1
  br i1 %t5625, label %then1307, label %else1308
then1307:
  %t5626 = call i64 @rt_make_string(ptr @.str.lit.29, i64 59)
  %t5627 = and i64 %self, -8
  %t5628 = inttoptr i64 %t5627 to ptr
  %t5629 = getelementptr i64, ptr %t5628, i64 1
  %t5630 = load i64, ptr %t5629
  %t5631 = and i64 %self, -8
  %t5632 = inttoptr i64 %t5631 to ptr
  %t5633 = getelementptr i64, ptr %t5632, i64 2
  %t5634 = load i64, ptr %t5633
  %t5635 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5635)
  %t5636 = and i64 %t5635, -8
  %t5637 = inttoptr i64 %t5636 to ptr
  %t5638 = load i64, ptr %t5637
  %t5639 = inttoptr i64 %t5638 to ptr
  %t5640 = musttail call fastcc i64 %t5639(i64 %t5635, i64 3, i64 %t5626, i64 %t5630, i64 %t5634, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5640
else1308:
  %t5641 = and i64 %self, -8
  %t5642 = inttoptr i64 %t5641 to ptr
  %t5643 = getelementptr i64, ptr %t5642, i64 1
  %t5644 = load i64, ptr %t5643
  %t5645 = or i64 %t5644, %a0
  %t5646 = and i64 %t5645, 7
  %t5647 = icmp eq i64 %t5646, 0
  br i1 %t5647, label %fixfast1309, label %fixslow1310
fixfast1309:
  %t5648 = ashr i64 %t5644, 3
  %t5649 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5648, i64 %a0)
  %t5650 = extractvalue {i64, i1} %t5649, 0
  %t5651 = extractvalue {i64, i1} %t5649, 1
  br i1 %t5651, label %fixslow1310, label %fixmerge1311
fixslow1310:
  %t5652 = call i64 @rt_mul(i64 %t5644, i64 %a0)
  br label %fixmerge1311
fixmerge1311:
  %t5653 = phi i64 [ %t5650, %fixfast1309 ], [ %t5652, %fixslow1310 ]
  %t5654 = and i64 %self, -8
  %t5655 = inttoptr i64 %t5654 to ptr
  %t5656 = getelementptr i64, ptr %t5655, i64 2
  %t5657 = load i64, ptr %t5656
  %t5658 = or i64 %t5657, %a0
  %t5659 = and i64 %t5658, 7
  %t5660 = icmp eq i64 %t5659, 0
  br i1 %t5660, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t5661 = ashr i64 %t5657, 3
  %t5662 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5661, i64 %a0)
  %t5663 = extractvalue {i64, i1} %t5662, 0
  %t5664 = extractvalue {i64, i1} %t5662, 1
  br i1 %t5664, label %fixslow1313, label %fixmerge1314
fixslow1313:
  %t5665 = call i64 @rt_mul(i64 %t5657, i64 %a0)
  br label %fixmerge1314
fixmerge1314:
  %t5666 = phi i64 [ %t5663, %fixfast1312 ], [ %t5665, %fixslow1313 ]
  %t5667 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t5667)
  %t5668 = and i64 %t5667, -8
  %t5669 = inttoptr i64 %t5668 to ptr
  %t5670 = load i64, ptr %t5669
  %t5671 = inttoptr i64 %t5670 to ptr
  %t5672 = call fastcc i64%t5671(i64 %t5667, i64 2, i64 %t5653, i64 %t5666, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5673 = icmp ne i64 %t5672, 1
  br i1 %t5673, label %then1315, label %else1316
then1315:
  %t5674 = call i64 @rt_exact_to_inexact(i64 %t5672)
  %t5675 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t5676 = call i64 @rt_div(i64 %t5674, i64 %t5675)
  ret i64 %t5676
else1316:
  %t5677 = or i64 %a0, 8
  %t5678 = and i64 %t5677, 7
  %t5679 = icmp eq i64 %t5678, 0
  br i1 %t5679, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t5680 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5681 = extractvalue {i64, i1} %t5680, 0
  %t5682 = extractvalue {i64, i1} %t5680, 1
  br i1 %t5682, label %fixslow1318, label %fixmerge1319
fixslow1318:
  %t5683 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1319
fixmerge1319:
  %t5684 = phi i64 [ %t5681, %fixfast1317 ], [ %t5683, %fixslow1318 ]
  %t5685 = musttail call fastcc i64 @"scheme.base:code_1086"(i64 %self, i64 1, i64 %t5684, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5685
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5686 = icmp eq i64 %argc, 2
  br i1 %t5686, label %argok1321, label %arityerr1320
arityerr1320:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1321:
  %t5687 = call i64 @rt_flonum_lit(ptr @.flo.lit.30)
  %t5688 = or i64 %a0, %t5687
  %t5689 = and i64 %t5688, 7
  %t5690 = icmp eq i64 %t5689, 0
  br i1 %t5690, label %fixfast1322, label %fixslow1323
fixfast1322:
  %t5691 = icmp slt i64 %a0, %t5687
  %t5692 = select i1 %t5691, i64 257, i64 1
  br label %fixmerge1324
fixslow1323:
  %t5693 = call i64 @rt_lt(i64 %a0, i64 %t5687)
  br label %fixmerge1324
fixmerge1324:
  %t5694 = phi i64 [ %t5692, %fixfast1322 ], [ %t5693, %fixslow1323 ]
  %t5695 = icmp ne i64 %t5694, 1
  br i1 %t5695, label %then1325, label %else1326
then1325:
  br label %merge1327
else1326:
  %t5696 = or i64 %a0, %t5687
  %t5697 = and i64 %t5696, 7
  %t5698 = icmp eq i64 %t5697, 0
  br i1 %t5698, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t5699 = icmp eq i64 %a0, %t5687
  %t5700 = select i1 %t5699, i64 257, i64 1
  br label %fixmerge1330
fixslow1329:
  %t5701 = call i64 @rt_num_eq(i64 %a0, i64 %t5687)
  br label %fixmerge1330
fixmerge1330:
  %t5702 = phi i64 [ %t5700, %fixfast1328 ], [ %t5701, %fixslow1329 ]
  br label %merge1327
merge1327:
  %t5703 = phi i64 [ 257, %then1325 ], [ %t5702, %fixmerge1330 ]
  %t5704 = icmp ne i64 %t5703, 1
  br i1 %t5704, label %then1331, label %else1332
then1331:
  %t5705 = call i64 @rt_flonum_lit(ptr @.flo.lit.31)
  %t5706 = or i64 %t5705, %a1
  %t5707 = and i64 %t5706, 7
  %t5708 = icmp eq i64 %t5707, 0
  br i1 %t5708, label %fixfast1334, label %fixslow1335
fixfast1334:
  %t5709 = icmp slt i64 %t5705, %a1
  %t5710 = select i1 %t5709, i64 257, i64 1
  br label %fixmerge1336
fixslow1335:
  %t5711 = call i64 @rt_lt(i64 %t5705, i64 %a1)
  br label %fixmerge1336
fixmerge1336:
  %t5712 = phi i64 [ %t5710, %fixfast1334 ], [ %t5711, %fixslow1335 ]
  %t5713 = icmp ne i64 %t5712, 1
  br i1 %t5713, label %then1337, label %else1338
then1337:
  br label %merge1339
else1338:
  %t5714 = or i64 %t5705, %a1
  %t5715 = and i64 %t5714, 7
  %t5716 = icmp eq i64 %t5715, 0
  br i1 %t5716, label %fixfast1340, label %fixslow1341
fixfast1340:
  %t5717 = icmp eq i64 %t5705, %a1
  %t5718 = select i1 %t5717, i64 257, i64 1
  br label %fixmerge1342
fixslow1341:
  %t5719 = call i64 @rt_num_eq(i64 %t5705, i64 %a1)
  br label %fixmerge1342
fixmerge1342:
  %t5720 = phi i64 [ %t5718, %fixfast1340 ], [ %t5719, %fixslow1341 ]
  br label %merge1339
merge1339:
  %t5721 = phi i64 [ 257, %then1337 ], [ %t5720, %fixmerge1342 ]
  br label %merge1333
else1332:
  br label %merge1333
merge1333:
  %t5722 = phi i64 [ %t5721, %merge1339 ], [ 1, %else1332 ]
  %t5723 = icmp ne i64 %t5722, 1
  br i1 %t5723, label %then1343, label %else1344
then1343:
  %t5724 = call i64 @rt_flonum_lit(ptr @.flo.lit.32)
  ret i64 %t5724
else1344:
  %t5725 = call ptr @rt_alloc_words(i64 4)
  %t5726 = ptrtoint ptr %t5725 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1086" to i64), ptr %t5725
  %t5727 = or i64 %t5726, 4
  %t5728 = getelementptr i64, ptr %t5725, i64 1
  store i64 %a0, ptr %t5728
  %t5729 = getelementptr i64, ptr %t5725, i64 2
  store i64 %a1, ptr %t5729
  %t5730 = getelementptr i64, ptr %t5725, i64 3
  store i64 %t5727, ptr %t5730
  %t5731 = musttail call fastcc i64 @"scheme.base:code_1086"(i64 %t5727, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5731
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5736 = icmp eq i64 %argc, 2
  br i1 %t5736, label %argok1346, label %arityerr1345
arityerr1345:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1346:
  %t5737 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t5737)
  %t5738 = and i64 %t5737, -8
  %t5739 = inttoptr i64 %t5738 to ptr
  %t5740 = load i64, ptr %t5739
  %t5741 = inttoptr i64 %t5740 to ptr
  %t5742 = call fastcc i64%t5741(i64 %t5737, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5743 = call i64 @rt_exact_to_inexact(i64 %t5742)
  %t5744 = or i64 %t5743, %a1
  %t5745 = and i64 %t5744, 7
  %t5746 = icmp eq i64 %t5745, 0
  br i1 %t5746, label %fixfast1347, label %fixslow1348
fixfast1347:
  %t5747 = icmp slt i64 %t5743, %a1
  %t5748 = select i1 %t5747, i64 257, i64 1
  br label %fixmerge1349
fixslow1348:
  %t5749 = call i64 @rt_lt(i64 %t5743, i64 %a1)
  br label %fixmerge1349
fixmerge1349:
  %t5750 = phi i64 [ %t5748, %fixfast1347 ], [ %t5749, %fixslow1348 ]
  %t5751 = icmp ne i64 %t5750, 1
  br i1 %t5751, label %then1350, label %else1351
then1350:
  br label %merge1352
else1351:
  %t5752 = or i64 %t5743, %a1
  %t5753 = and i64 %t5752, 7
  %t5754 = icmp eq i64 %t5753, 0
  br i1 %t5754, label %fixfast1353, label %fixslow1354
fixfast1353:
  %t5755 = icmp eq i64 %t5743, %a1
  %t5756 = select i1 %t5755, i64 257, i64 1
  br label %fixmerge1355
fixslow1354:
  %t5757 = call i64 @rt_num_eq(i64 %t5743, i64 %a1)
  br label %fixmerge1355
fixmerge1355:
  %t5758 = phi i64 [ %t5756, %fixfast1353 ], [ %t5757, %fixslow1354 ]
  br label %merge1352
merge1352:
  %t5759 = phi i64 [ 257, %then1350 ], [ %t5758, %fixmerge1355 ]
  %t5760 = icmp ne i64 %t5759, 1
  br i1 %t5760, label %then1356, label %else1357
then1356:
  ret i64 %t5742
else1357:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5765 = icmp eq i64 %argc, 1
  br i1 %t5765, label %argok1359, label %arityerr1358
arityerr1358:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1359:
  %t5766 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t5766)
  %t5767 = and i64 %t5766, -8
  %t5768 = inttoptr i64 %t5767 to ptr
  %t5769 = load i64, ptr %t5768
  %t5770 = inttoptr i64 %t5769 to ptr
  %t5771 = call fastcc i64%t5770(i64 %t5766, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5772 = call i64 @rt_inexact_to_exact(i64 %t5771)
  %t5773 = call i64 @rt_exact_to_inexact(i64 %t5772)
  %t5774 = or i64 %t5773, %a0
  %t5775 = and i64 %t5774, 7
  %t5776 = icmp eq i64 %t5775, 0
  br i1 %t5776, label %fixfast1360, label %fixslow1361
fixfast1360:
  %t5777 = icmp slt i64 %t5773, %a0
  %t5778 = select i1 %t5777, i64 257, i64 1
  br label %fixmerge1362
fixslow1361:
  %t5779 = call i64 @rt_lt(i64 %t5773, i64 %a0)
  br label %fixmerge1362
fixmerge1362:
  %t5780 = phi i64 [ %t5778, %fixfast1360 ], [ %t5779, %fixslow1361 ]
  %t5781 = icmp ne i64 %t5780, 1
  br i1 %t5781, label %then1363, label %else1364
then1363:
  %t5782 = or i64 %t5772, 8
  %t5783 = and i64 %t5782, 7
  %t5784 = icmp eq i64 %t5783, 0
  br i1 %t5784, label %fixfast1365, label %fixslow1366
fixfast1365:
  %t5785 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5772, i64 8)
  %t5786 = extractvalue {i64, i1} %t5785, 0
  %t5787 = extractvalue {i64, i1} %t5785, 1
  br i1 %t5787, label %fixslow1366, label %fixmerge1367
fixslow1366:
  %t5788 = call i64 @rt_add(i64 %t5772, i64 8)
  br label %fixmerge1367
fixmerge1367:
  %t5789 = phi i64 [ %t5786, %fixfast1365 ], [ %t5788, %fixslow1366 ]
  ret i64 %t5789
else1364:
  ret i64 %t5772
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5794 = icmp sge i64 %argc, 0
  br i1 %t5794, label %argok1369, label %arityerr1368
arityerr1368:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1369:
  %t5795 = call ptr @rt_alloc_words(i64 8)
  %t5796 = getelementptr i64, ptr %t5795, i64 0
  store i64 %a0, ptr %t5796
  %t5797 = getelementptr i64, ptr %t5795, i64 1
  store i64 %a1, ptr %t5797
  %t5798 = getelementptr i64, ptr %t5795, i64 2
  store i64 %a2, ptr %t5798
  %t5799 = getelementptr i64, ptr %t5795, i64 3
  store i64 %a3, ptr %t5799
  %t5800 = getelementptr i64, ptr %t5795, i64 4
  store i64 %a4, ptr %t5800
  %t5801 = getelementptr i64, ptr %t5795, i64 5
  store i64 %a5, ptr %t5801
  %t5802 = getelementptr i64, ptr %t5795, i64 6
  store i64 %a6, ptr %t5802
  %t5803 = getelementptr i64, ptr %t5795, i64 7
  store i64 %a7, ptr %t5803
  %t5804 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5795, ptr %overflow)
  %t5805 = call i64 @rt_pair_p(i64 %t5804)
  %t5806 = icmp ne i64 %t5805, 1
  br i1 %t5806, label %then1370, label %else1371
then1370:
  %t5807 = call i64 @rt_cdr(i64 %t5804)
  %t5808 = call i64 @rt_null_p(i64 %t5807)
  br label %merge1372
else1371:
  br label %merge1372
merge1372:
  %t5809 = phi i64 [ %t5808, %then1370 ], [ 1, %else1371 ]
  %t5810 = icmp ne i64 %t5809, 1
  br i1 %t5810, label %then1373, label %else1374
then1373:
  %t5811 = call i64 @rt_car(i64 %t5804)
  ret i64 %t5811
else1374:
  %t5812 = call i64 @rt_list_to_mv(i64 %t5804)
  ret i64 %t5812
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5817 = icmp eq i64 %argc, 2
  br i1 %t5817, label %argok1376, label %arityerr1375
arityerr1375:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1376:
  call void @rt_check_callable(i64 %a0)
  %t5818 = and i64 %a0, -8
  %t5819 = inttoptr i64 %t5818 to ptr
  %t5820 = load i64, ptr %t5819
  %t5821 = inttoptr i64 %t5820 to ptr
  %t5822 = call fastcc i64%t5821(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5823 = call i64 @rt_mv_p(i64 %t5822)
  %t5824 = icmp ne i64 %t5823, 1
  br i1 %t5824, label %then1377, label %else1378
then1377:
  %t5825 = call i64 @rt_mv_to_list(i64 %t5822)
  call void @rt_check_callable(i64 %a1)
  %t5826 = and i64 %a1, -8
  %t5827 = inttoptr i64 %t5826 to ptr
  %t5828 = load i64, ptr %t5827
  %t5829 = inttoptr i64 %t5828 to ptr
  %t5830 = call i64 @rt_list_length(i64 %t5825)
  %t5831 = add i64 0, %t5830
  %t5832 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5825, i64 8)
  %t5844 = getelementptr i64, ptr %t5832, i64 0
  %t5836 = load i64, ptr %t5844
  %t5845 = getelementptr i64, ptr %t5832, i64 1
  %t5837 = load i64, ptr %t5845
  %t5846 = getelementptr i64, ptr %t5832, i64 2
  %t5838 = load i64, ptr %t5846
  %t5847 = getelementptr i64, ptr %t5832, i64 3
  %t5839 = load i64, ptr %t5847
  %t5848 = getelementptr i64, ptr %t5832, i64 4
  %t5840 = load i64, ptr %t5848
  %t5849 = getelementptr i64, ptr %t5832, i64 5
  %t5841 = load i64, ptr %t5849
  %t5850 = getelementptr i64, ptr %t5832, i64 6
  %t5842 = load i64, ptr %t5850
  %t5851 = getelementptr i64, ptr %t5832, i64 7
  %t5843 = load i64, ptr %t5851
  %t5833 = icmp sgt i64 %t5831, 8
  %t5834 = getelementptr i64, ptr %t5832, i64 8
  %t5835 = select i1 %t5833, ptr %t5834, ptr null
  %t5852 = musttail call fastcc i64 %t5829(i64 %a1, i64 %t5831, i64 %t5836, i64 %t5837, i64 %t5838, i64 %t5839, i64 %t5840, i64 %t5841, i64 %t5842, i64 %t5843, ptr %t5835)
  ret i64 %t5852
else1378:
  call void @rt_check_callable(i64 %a1)
  %t5853 = and i64 %a1, -8
  %t5854 = inttoptr i64 %t5853 to ptr
  %t5855 = load i64, ptr %t5854
  %t5856 = inttoptr i64 %t5855 to ptr
  %t5857 = musttail call fastcc i64 %t5856(i64 %a1, i64 1, i64 %t5822, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5857
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5864 = icmp eq i64 %argc, 0
  br i1 %t5864, label %argok1380, label %arityerr1379
arityerr1379:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1380:
  %t5865 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t5866 = call i64 @rt_make_vector(i64 %t5865, i64 2)
  %t5867 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t5867)
  %t5868 = and i64 %t5867, -8
  %t5869 = inttoptr i64 %t5868 to ptr
  %t5870 = load i64, ptr %t5869
  %t5871 = inttoptr i64 %t5870 to ptr
  %t5872 = call fastcc i64%t5871(i64 %t5867, i64 3, i64 0, i64 %t5866, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5873 = call i64 @rt_make_hash_table(i64 %t5872)
  ret i64 %t5873
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5878 = icmp eq i64 %argc, 1
  br i1 %t5878, label %argok1382, label %arityerr1381
arityerr1381:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1382:
  %t5879 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t5879
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5884 = icmp eq i64 %argc, 1
  br i1 %t5884, label %argok1384, label %arityerr1383
arityerr1383:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1384:
  %t5885 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5886 = call i64 @rt_vector_ref(i64 %t5885, i64 0)
  ret i64 %t5886
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5891 = icmp eq i64 %argc, 1
  br i1 %t5891, label %argok1386, label %arityerr1385
arityerr1385:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1386:
  %t5892 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5893 = call i64 @rt_vector_ref(i64 %t5892, i64 8)
  ret i64 %t5893
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5898 = icmp eq i64 %argc, 2
  br i1 %t5898, label %argok1388, label %arityerr1387
arityerr1387:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1388:
  %t5899 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5900 = call i64 @rt_vector_set(i64 %t5899, i64 0, i64 %a1)
  ret i64 %t5900
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5905 = icmp eq i64 %argc, 2
  br i1 %t5905, label %argok1390, label %arityerr1389
arityerr1389:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1390:
  %t5906 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5907 = call i64 @rt_vector_set(i64 %t5906, i64 8, i64 %a1)
  ret i64 %t5907
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5912 = icmp eq i64 %argc, 2
  br i1 %t5912, label %argok1392, label %arityerr1391
arityerr1391:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1392:
  %t5913 = call i64 @rt_hash(i64 %a0)
  %t5914 = call i64 @rt_remainder(i64 %t5913, i64 %a1)
  ret i64 %t5914
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5919 = icmp eq i64 %argc, 2
  br i1 %t5919, label %argok1394, label %arityerr1393
arityerr1393:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1394:
  %t5920 = call i64 @rt_null_p(i64 %a1)
  %t5921 = icmp ne i64 %t5920, 1
  br i1 %t5921, label %then1395, label %else1396
then1395:
  ret i64 1
else1396:
  %t5922 = call i64 @rt_car(i64 %a1)
  %t5923 = call i64 @rt_car(i64 %t5922)
  %t5924 = call i64 @rt_equal(i64 %a0, i64 %t5923)
  %t5925 = icmp ne i64 %t5924, 1
  br i1 %t5925, label %then1397, label %else1398
then1397:
  %t5926 = call i64 @rt_car(i64 %a1)
  ret i64 %t5926
else1398:
  %t5927 = call i64 @rt_cdr(i64 %a1)
  %t5928 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5928)
  %t5929 = and i64 %t5928, -8
  %t5930 = inttoptr i64 %t5929 to ptr
  %t5931 = load i64, ptr %t5930
  %t5932 = inttoptr i64 %t5931 to ptr
  %t5933 = musttail call fastcc i64 %t5932(i64 %t5928, i64 2, i64 %a0, i64 %t5927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5933
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5938 = icmp eq i64 %argc, 2
  br i1 %t5938, label %argok1400, label %arityerr1399
arityerr1399:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1400:
  %t5939 = call i64 @rt_null_p(i64 %a1)
  %t5940 = icmp ne i64 %t5939, 1
  br i1 %t5940, label %then1401, label %else1402
then1401:
  ret i64 2
else1402:
  %t5941 = call i64 @rt_car(i64 %a1)
  %t5942 = call i64 @rt_car(i64 %t5941)
  %t5943 = call i64 @rt_equal(i64 %a0, i64 %t5942)
  %t5944 = icmp ne i64 %t5943, 1
  br i1 %t5944, label %then1403, label %else1404
then1403:
  %t5945 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t5945
else1404:
  %t5946 = call i64 @rt_car(i64 %a1)
  %t5947 = call i64 @rt_cdr(i64 %a1)
  %t5948 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t5948)
  %t5949 = and i64 %t5948, -8
  %t5950 = inttoptr i64 %t5949 to ptr
  %t5951 = load i64, ptr %t5950
  %t5952 = inttoptr i64 %t5951 to ptr
  %t5953 = call fastcc i64%t5952(i64 %t5948, i64 2, i64 %a0, i64 %t5947, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5954 = call i64 @rt_cons(i64 %t5946, i64 %t5953)
  ret i64 %t5954
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5959 = icmp eq i64 %argc, 3
  br i1 %t5959, label %argok1406, label %arityerr1405
arityerr1405:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1406:
  %t5960 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5960)
  %t5961 = and i64 %t5960, -8
  %t5962 = inttoptr i64 %t5961 to ptr
  %t5963 = load i64, ptr %t5962
  %t5964 = inttoptr i64 %t5963 to ptr
  %t5965 = call fastcc i64%t5964(i64 %t5960, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5966 = call i64 @rt_vector_length(i64 %t5965)
  %t5967 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5967)
  %t5968 = and i64 %t5967, -8
  %t5969 = inttoptr i64 %t5968 to ptr
  %t5970 = load i64, ptr %t5969
  %t5971 = inttoptr i64 %t5970 to ptr
  %t5972 = call fastcc i64%t5971(i64 %t5967, i64 2, i64 %a1, i64 %t5966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5973 = call i64 @rt_vector_ref(i64 %t5965, i64 %t5972)
  %t5974 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5974)
  %t5975 = and i64 %t5974, -8
  %t5976 = inttoptr i64 %t5975 to ptr
  %t5977 = load i64, ptr %t5976
  %t5978 = inttoptr i64 %t5977 to ptr
  %t5979 = call fastcc i64%t5978(i64 %t5974, i64 2, i64 %a1, i64 %t5973, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5980 = icmp ne i64 %t5979, 1
  br i1 %t5980, label %then1407, label %else1408
then1407:
  %t5981 = call i64 @rt_cdr(i64 %t5979)
  ret i64 %t5981
else1408:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5986 = icmp eq i64 %argc, 2
  br i1 %t5986, label %argok1410, label %arityerr1409
arityerr1409:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1410:
  %t5987 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5987)
  %t5988 = and i64 %t5987, -8
  %t5989 = inttoptr i64 %t5988 to ptr
  %t5990 = load i64, ptr %t5989
  %t5991 = inttoptr i64 %t5990 to ptr
  %t5992 = call fastcc i64%t5991(i64 %t5987, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5993 = call i64 @rt_vector_length(i64 %t5992)
  %t5994 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5994)
  %t5995 = and i64 %t5994, -8
  %t5996 = inttoptr i64 %t5995 to ptr
  %t5997 = load i64, ptr %t5996
  %t5998 = inttoptr i64 %t5997 to ptr
  %t5999 = call fastcc i64%t5998(i64 %t5994, i64 2, i64 %a1, i64 %t5993, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6000 = call i64 @rt_vector_ref(i64 %t5992, i64 %t5999)
  %t6001 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6001)
  %t6002 = and i64 %t6001, -8
  %t6003 = inttoptr i64 %t6002 to ptr
  %t6004 = load i64, ptr %t6003
  %t6005 = inttoptr i64 %t6004 to ptr
  %t6006 = call fastcc i64%t6005(i64 %t6001, i64 2, i64 %a1, i64 %t6000, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6007 = icmp ne i64 %t6006, 1
  br i1 %t6007, label %then1411, label %else1412
then1411:
  ret i64 257
else1412:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6012 = icmp eq i64 %argc, 2
  br i1 %t6012, label %argok1414, label %arityerr1413
arityerr1413:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1414:
  %t6013 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6013)
  %t6014 = and i64 %t6013, -8
  %t6015 = inttoptr i64 %t6014 to ptr
  %t6016 = load i64, ptr %t6015
  %t6017 = inttoptr i64 %t6016 to ptr
  %t6018 = call fastcc i64%t6017(i64 %t6013, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6019 = call i64 @rt_vector_length(i64 %t6018)
  %t6020 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6020)
  %t6021 = and i64 %t6020, -8
  %t6022 = inttoptr i64 %t6021 to ptr
  %t6023 = load i64, ptr %t6022
  %t6024 = inttoptr i64 %t6023 to ptr
  %t6025 = call fastcc i64%t6024(i64 %t6020, i64 2, i64 %a1, i64 %t6019, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6026 = call i64 @rt_vector_ref(i64 %t6018, i64 %t6025)
  %t6027 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6027)
  %t6028 = and i64 %t6027, -8
  %t6029 = inttoptr i64 %t6028 to ptr
  %t6030 = load i64, ptr %t6029
  %t6031 = inttoptr i64 %t6030 to ptr
  %t6032 = call fastcc i64%t6031(i64 %t6027, i64 2, i64 %a1, i64 %t6026, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6033 = icmp ne i64 %t6032, 1
  br i1 %t6033, label %then1415, label %else1416
then1415:
  %t6034 = call i64 @rt_cdr(i64 %t6032)
  ret i64 %t6034
else1416:
  %t6035 = call i64 @rt_make_string(ptr @.str.lit.33, i64 29)
  %t6036 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6036)
  %t6037 = and i64 %t6036, -8
  %t6038 = inttoptr i64 %t6037 to ptr
  %t6039 = load i64, ptr %t6038
  %t6040 = inttoptr i64 %t6039 to ptr
  %t6041 = musttail call fastcc i64 %t6040(i64 %t6036, i64 2, i64 %t6035, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6041
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6046 = icmp eq i64 %argc, 3
  br i1 %t6046, label %argok1418, label %arityerr1417
arityerr1417:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1418:
  %t6047 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6047)
  %t6048 = and i64 %t6047, -8
  %t6049 = inttoptr i64 %t6048 to ptr
  %t6050 = load i64, ptr %t6049
  %t6051 = inttoptr i64 %t6050 to ptr
  %t6052 = call fastcc i64%t6051(i64 %t6047, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6053 = call i64 @rt_vector_length(i64 %t6052)
  %t6054 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6054)
  %t6055 = and i64 %t6054, -8
  %t6056 = inttoptr i64 %t6055 to ptr
  %t6057 = load i64, ptr %t6056
  %t6058 = inttoptr i64 %t6057 to ptr
  %t6059 = call fastcc i64%t6058(i64 %t6054, i64 2, i64 %a1, i64 %t6053, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6060 = call i64 @rt_vector_ref(i64 %t6052, i64 %t6059)
  %t6061 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6061)
  %t6062 = and i64 %t6061, -8
  %t6063 = inttoptr i64 %t6062 to ptr
  %t6064 = load i64, ptr %t6063
  %t6065 = inttoptr i64 %t6064 to ptr
  %t6066 = call fastcc i64%t6065(i64 %t6061, i64 2, i64 %a1, i64 %t6060, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6067 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t6068 = icmp ne i64 %t6066, 1
  br i1 %t6068, label %then1419, label %else1420
then1419:
  %t6069 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t6069)
  %t6070 = and i64 %t6069, -8
  %t6071 = inttoptr i64 %t6070 to ptr
  %t6072 = load i64, ptr %t6071
  %t6073 = inttoptr i64 %t6072 to ptr
  %t6074 = call fastcc i64%t6073(i64 %t6069, i64 2, i64 %a1, i64 %t6060, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1421
else1420:
  br label %merge1421
merge1421:
  %t6075 = phi i64 [ %t6074, %then1419 ], [ %t6060, %else1420 ]
  %t6076 = call i64 @rt_cons(i64 %t6067, i64 %t6075)
  %t6077 = call i64 @rt_vector_set(i64 %t6052, i64 %t6059, i64 %t6076)
  %t6078 = icmp ne i64 %t6066, 1
  br i1 %t6078, label %then1422, label %else1423
then1422:
  ret i64 1
else1423:
  %t6079 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6079)
  %t6080 = and i64 %t6079, -8
  %t6081 = inttoptr i64 %t6080 to ptr
  %t6082 = load i64, ptr %t6081
  %t6083 = inttoptr i64 %t6082 to ptr
  %t6084 = call fastcc i64%t6083(i64 %t6079, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6085 = or i64 %t6084, 8
  %t6086 = and i64 %t6085, 7
  %t6087 = icmp eq i64 %t6086, 0
  br i1 %t6087, label %fixfast1424, label %fixslow1425
fixfast1424:
  %t6088 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6084, i64 8)
  %t6089 = extractvalue {i64, i1} %t6088, 0
  %t6090 = extractvalue {i64, i1} %t6088, 1
  br i1 %t6090, label %fixslow1425, label %fixmerge1426
fixslow1425:
  %t6091 = call i64 @rt_add(i64 %t6084, i64 8)
  br label %fixmerge1426
fixmerge1426:
  %t6092 = phi i64 [ %t6089, %fixfast1424 ], [ %t6091, %fixslow1425 ]
  %t6093 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t6093)
  %t6094 = and i64 %t6093, -8
  %t6095 = inttoptr i64 %t6094 to ptr
  %t6096 = load i64, ptr %t6095
  %t6097 = inttoptr i64 %t6096 to ptr
  %t6098 = call fastcc i64%t6097(i64 %t6093, i64 2, i64 %a0, i64 %t6092, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6099 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6099)
  %t6100 = and i64 %t6099, -8
  %t6101 = inttoptr i64 %t6100 to ptr
  %t6102 = load i64, ptr %t6101
  %t6103 = inttoptr i64 %t6102 to ptr
  %t6104 = call fastcc i64%t6103(i64 %t6099, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6105 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t6106 = or i64 %t6105, %t6053
  %t6107 = and i64 %t6106, 7
  %t6108 = icmp eq i64 %t6107, 0
  br i1 %t6108, label %fixfast1427, label %fixslow1428
fixfast1427:
  %t6109 = ashr i64 %t6105, 3
  %t6110 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6109, i64 %t6053)
  %t6111 = extractvalue {i64, i1} %t6110, 0
  %t6112 = extractvalue {i64, i1} %t6110, 1
  br i1 %t6112, label %fixslow1428, label %fixmerge1429
fixslow1428:
  %t6113 = call i64 @rt_mul(i64 %t6105, i64 %t6053)
  br label %fixmerge1429
fixmerge1429:
  %t6114 = phi i64 [ %t6111, %fixfast1427 ], [ %t6113, %fixslow1428 ]
  %t6115 = or i64 %t6114, %t6104
  %t6116 = and i64 %t6115, 7
  %t6117 = icmp eq i64 %t6116, 0
  br i1 %t6117, label %fixfast1430, label %fixslow1431
fixfast1430:
  %t6118 = icmp slt i64 %t6114, %t6104
  %t6119 = select i1 %t6118, i64 257, i64 1
  br label %fixmerge1432
fixslow1431:
  %t6120 = call i64 @rt_lt(i64 %t6114, i64 %t6104)
  br label %fixmerge1432
fixmerge1432:
  %t6121 = phi i64 [ %t6119, %fixfast1430 ], [ %t6120, %fixslow1431 ]
  %t6122 = icmp ne i64 %t6121, 1
  br i1 %t6122, label %then1433, label %else1434
then1433:
  %t6123 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t6123)
  %t6124 = and i64 %t6123, -8
  %t6125 = inttoptr i64 %t6124 to ptr
  %t6126 = load i64, ptr %t6125
  %t6127 = inttoptr i64 %t6126 to ptr
  %t6128 = musttail call fastcc i64 %t6127(i64 %t6123, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6128
else1434:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6133 = icmp eq i64 %argc, 2
  br i1 %t6133, label %argok1436, label %arityerr1435
arityerr1435:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1436:
  %t6134 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6134)
  %t6135 = and i64 %t6134, -8
  %t6136 = inttoptr i64 %t6135 to ptr
  %t6137 = load i64, ptr %t6136
  %t6138 = inttoptr i64 %t6137 to ptr
  %t6139 = call fastcc i64%t6138(i64 %t6134, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6140 = call i64 @rt_vector_length(i64 %t6139)
  %t6141 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6141)
  %t6142 = and i64 %t6141, -8
  %t6143 = inttoptr i64 %t6142 to ptr
  %t6144 = load i64, ptr %t6143
  %t6145 = inttoptr i64 %t6144 to ptr
  %t6146 = call fastcc i64%t6145(i64 %t6141, i64 2, i64 %a1, i64 %t6140, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6147 = call i64 @rt_vector_ref(i64 %t6139, i64 %t6146)
  %t6148 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6148)
  %t6149 = and i64 %t6148, -8
  %t6150 = inttoptr i64 %t6149 to ptr
  %t6151 = load i64, ptr %t6150
  %t6152 = inttoptr i64 %t6151 to ptr
  %t6153 = call fastcc i64%t6152(i64 %t6148, i64 2, i64 %a1, i64 %t6147, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6154 = icmp ne i64 %t6153, 1
  br i1 %t6154, label %then1437, label %else1438
then1437:
  %t6155 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t6155)
  %t6156 = and i64 %t6155, -8
  %t6157 = inttoptr i64 %t6156 to ptr
  %t6158 = load i64, ptr %t6157
  %t6159 = inttoptr i64 %t6158 to ptr
  %t6160 = call fastcc i64%t6159(i64 %t6155, i64 2, i64 %a1, i64 %t6147, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6161 = call i64 @rt_vector_set(i64 %t6139, i64 %t6146, i64 %t6160)
  %t6162 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6162)
  %t6163 = and i64 %t6162, -8
  %t6164 = inttoptr i64 %t6163 to ptr
  %t6165 = load i64, ptr %t6164
  %t6166 = inttoptr i64 %t6165 to ptr
  %t6167 = call fastcc i64%t6166(i64 %t6162, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6168 = or i64 %t6167, 8
  %t6169 = and i64 %t6168, 7
  %t6170 = icmp eq i64 %t6169, 0
  br i1 %t6170, label %fixfast1439, label %fixslow1440
fixfast1439:
  %t6171 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6167, i64 8)
  %t6172 = extractvalue {i64, i1} %t6171, 0
  %t6173 = extractvalue {i64, i1} %t6171, 1
  br i1 %t6173, label %fixslow1440, label %fixmerge1441
fixslow1440:
  %t6174 = call i64 @rt_sub(i64 %t6167, i64 8)
  br label %fixmerge1441
fixmerge1441:
  %t6175 = phi i64 [ %t6172, %fixfast1439 ], [ %t6174, %fixslow1440 ]
  %t6176 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t6176)
  %t6177 = and i64 %t6176, -8
  %t6178 = inttoptr i64 %t6177 to ptr
  %t6179 = load i64, ptr %t6178
  %t6180 = inttoptr i64 %t6179 to ptr
  %t6181 = musttail call fastcc i64 %t6180(i64 %t6176, i64 2, i64 %a0, i64 %t6175, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6181
else1438:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1182"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6186 = icmp eq i64 %argc, 1
  br i1 %t6186, label %argok1443, label %arityerr1442
arityerr1442:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1443:
  %t6187 = call i64 @rt_null_p(i64 %a0)
  %t6188 = icmp ne i64 %t6187, 1
  br i1 %t6188, label %then1444, label %else1445
then1444:
  ret i64 1
else1445:
  %t6189 = call i64 @rt_car(i64 %a0)
  %t6190 = call i64 @rt_car(i64 %t6189)
  %t6191 = and i64 %self, -8
  %t6192 = inttoptr i64 %t6191 to ptr
  %t6193 = getelementptr i64, ptr %t6192, i64 1
  %t6194 = load i64, ptr %t6193
  %t6195 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6195)
  %t6196 = and i64 %t6195, -8
  %t6197 = inttoptr i64 %t6196 to ptr
  %t6198 = load i64, ptr %t6197
  %t6199 = inttoptr i64 %t6198 to ptr
  %t6200 = call fastcc i64%t6199(i64 %t6195, i64 2, i64 %t6190, i64 %t6194, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6201 = and i64 %self, -8
  %t6202 = inttoptr i64 %t6201 to ptr
  %t6203 = getelementptr i64, ptr %t6202, i64 2
  %t6204 = load i64, ptr %t6203
  %t6205 = and i64 %self, -8
  %t6206 = inttoptr i64 %t6205 to ptr
  %t6207 = getelementptr i64, ptr %t6206, i64 2
  %t6208 = load i64, ptr %t6207
  %t6209 = call i64 @rt_vector_ref(i64 %t6208, i64 %t6200)
  %t6210 = call i64 @rt_cons(i64 %t6189, i64 %t6209)
  %t6211 = call i64 @rt_vector_set(i64 %t6204, i64 %t6200, i64 %t6210)
  %t6212 = call i64 @rt_cdr(i64 %a0)
  %t6213 = musttail call fastcc i64 @"scheme.base:code_1182"(i64 %self, i64 1, i64 %t6212, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6213
}

define fastcc i64 @"scheme.base:code_1180"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6214 = icmp eq i64 %argc, 1
  br i1 %t6214, label %argok1447, label %arityerr1446
arityerr1446:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1447:
  %t6215 = and i64 %self, -8
  %t6216 = inttoptr i64 %t6215 to ptr
  %t6217 = getelementptr i64, ptr %t6216, i64 1
  %t6218 = load i64, ptr %t6217
  %t6219 = call i64 @rt_vector_length(i64 %t6218)
  %t6220 = or i64 %a0, %t6219
  %t6221 = and i64 %t6220, 7
  %t6222 = icmp eq i64 %t6221, 0
  br i1 %t6222, label %fixfast1448, label %fixslow1449
fixfast1448:
  %t6223 = icmp slt i64 %a0, %t6219
  %t6224 = select i1 %t6223, i64 257, i64 1
  br label %fixmerge1450
fixslow1449:
  %t6225 = call i64 @rt_lt(i64 %a0, i64 %t6219)
  br label %fixmerge1450
fixmerge1450:
  %t6226 = phi i64 [ %t6224, %fixfast1448 ], [ %t6225, %fixslow1449 ]
  %t6227 = icmp ne i64 %t6226, 1
  br i1 %t6227, label %then1451, label %else1452
then1451:
  %t6228 = call ptr @rt_alloc_words(i64 4)
  %t6229 = ptrtoint ptr %t6228 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1182" to i64), ptr %t6228
  %t6230 = or i64 %t6229, 4
  %t6231 = and i64 %self, -8
  %t6232 = inttoptr i64 %t6231 to ptr
  %t6233 = getelementptr i64, ptr %t6232, i64 2
  %t6234 = load i64, ptr %t6233
  %t6235 = getelementptr i64, ptr %t6228, i64 1
  store i64 %t6234, ptr %t6235
  %t6236 = and i64 %self, -8
  %t6237 = inttoptr i64 %t6236 to ptr
  %t6238 = getelementptr i64, ptr %t6237, i64 3
  %t6239 = load i64, ptr %t6238
  %t6240 = getelementptr i64, ptr %t6228, i64 2
  store i64 %t6239, ptr %t6240
  %t6241 = getelementptr i64, ptr %t6228, i64 3
  store i64 %t6230, ptr %t6241
  %t6242 = and i64 %self, -8
  %t6243 = inttoptr i64 %t6242 to ptr
  %t6244 = getelementptr i64, ptr %t6243, i64 1
  %t6245 = load i64, ptr %t6244
  %t6246 = call i64 @rt_vector_ref(i64 %t6245, i64 %a0)
  %t6247 = call fastcc i64 @"scheme.base:code_1182"(i64 %t6230, i64 1, i64 %t6246, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6248 = or i64 %a0, 8
  %t6249 = and i64 %t6248, 7
  %t6250 = icmp eq i64 %t6249, 0
  br i1 %t6250, label %fixfast1453, label %fixslow1454
fixfast1453:
  %t6251 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6252 = extractvalue {i64, i1} %t6251, 0
  %t6253 = extractvalue {i64, i1} %t6251, 1
  br i1 %t6253, label %fixslow1454, label %fixmerge1455
fixslow1454:
  %t6254 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1455
fixmerge1455:
  %t6255 = phi i64 [ %t6252, %fixfast1453 ], [ %t6254, %fixslow1454 ]
  %t6256 = musttail call fastcc i64 @"scheme.base:code_1180"(i64 %self, i64 1, i64 %t6255, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6256
else1452:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6257 = icmp eq i64 %argc, 1
  br i1 %t6257, label %argok1457, label %arityerr1456
arityerr1456:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1457:
  %t6258 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6258)
  %t6259 = and i64 %t6258, -8
  %t6260 = inttoptr i64 %t6259 to ptr
  %t6261 = load i64, ptr %t6260
  %t6262 = inttoptr i64 %t6261 to ptr
  %t6263 = call fastcc i64%t6262(i64 %t6258, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6264 = call i64 @rt_vector_length(i64 %t6263)
  %t6265 = or i64 16, %t6264
  %t6266 = and i64 %t6265, 7
  %t6267 = icmp eq i64 %t6266, 0
  br i1 %t6267, label %fixfast1458, label %fixslow1459
fixfast1458:
  %t6268 = ashr i64 16, 3
  %t6269 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6268, i64 %t6264)
  %t6270 = extractvalue {i64, i1} %t6269, 0
  %t6271 = extractvalue {i64, i1} %t6269, 1
  br i1 %t6271, label %fixslow1459, label %fixmerge1460
fixslow1459:
  %t6272 = call i64 @rt_mul(i64 16, i64 %t6264)
  br label %fixmerge1460
fixmerge1460:
  %t6273 = phi i64 [ %t6270, %fixfast1458 ], [ %t6272, %fixslow1459 ]
  %t6274 = call i64 @rt_make_vector(i64 %t6273, i64 2)
  %t6275 = call ptr @rt_alloc_words(i64 5)
  %t6276 = ptrtoint ptr %t6275 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1180" to i64), ptr %t6275
  %t6277 = or i64 %t6276, 4
  %t6278 = getelementptr i64, ptr %t6275, i64 1
  store i64 %t6263, ptr %t6278
  %t6279 = getelementptr i64, ptr %t6275, i64 2
  store i64 %t6273, ptr %t6279
  %t6280 = getelementptr i64, ptr %t6275, i64 3
  store i64 %t6274, ptr %t6280
  %t6281 = getelementptr i64, ptr %t6275, i64 4
  store i64 %t6277, ptr %t6281
  %t6282 = call fastcc i64 @"scheme.base:code_1180"(i64 %t6277, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6283 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t6283)
  %t6284 = and i64 %t6283, -8
  %t6285 = inttoptr i64 %t6284 to ptr
  %t6286 = load i64, ptr %t6285
  %t6287 = inttoptr i64 %t6286 to ptr
  %t6288 = musttail call fastcc i64 %t6287(i64 %t6283, i64 2, i64 %a0, i64 %t6274, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6288
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6293 = icmp eq i64 %argc, 1
  br i1 %t6293, label %argok1462, label %arityerr1461
arityerr1461:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1462:
  %t6294 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6294)
  %t6295 = and i64 %t6294, -8
  %t6296 = inttoptr i64 %t6295 to ptr
  %t6297 = load i64, ptr %t6296
  %t6298 = inttoptr i64 %t6297 to ptr
  %t6299 = musttail call fastcc i64 %t6298(i64 %t6294, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6299
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6304 = icmp eq i64 %argc, 2
  br i1 %t6304, label %argok1464, label %arityerr1463
arityerr1463:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1464:
  %t6305 = call i64 @rt_null_p(i64 %a0)
  %t6306 = icmp ne i64 %t6305, 1
  br i1 %t6306, label %then1465, label %else1466
then1465:
  ret i64 %a1
else1466:
  %t6307 = call i64 @rt_car(i64 %a0)
  %t6308 = call i64 @rt_car(i64 %t6307)
  %t6309 = call i64 @rt_car(i64 %a0)
  %t6310 = call i64 @rt_cdr(i64 %t6309)
  %t6311 = call i64 @rt_cons(i64 %t6308, i64 %t6310)
  %t6312 = call i64 @rt_cdr(i64 %a0)
  %t6313 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t6313)
  %t6314 = and i64 %t6313, -8
  %t6315 = inttoptr i64 %t6314 to ptr
  %t6316 = load i64, ptr %t6315
  %t6317 = inttoptr i64 %t6316 to ptr
  %t6318 = call fastcc i64%t6317(i64 %t6313, i64 2, i64 %t6312, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6319 = call i64 @rt_cons(i64 %t6311, i64 %t6318)
  ret i64 %t6319
}

define fastcc i64 @"scheme.base:code_1199"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6324 = icmp eq i64 %argc, 2
  br i1 %t6324, label %argok1468, label %arityerr1467
arityerr1467:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1468:
  %t6325 = and i64 %self, -8
  %t6326 = inttoptr i64 %t6325 to ptr
  %t6327 = getelementptr i64, ptr %t6326, i64 1
  %t6328 = load i64, ptr %t6327
  %t6329 = call i64 @rt_vector_length(i64 %t6328)
  %t6330 = or i64 %a0, %t6329
  %t6331 = and i64 %t6330, 7
  %t6332 = icmp eq i64 %t6331, 0
  br i1 %t6332, label %fixfast1469, label %fixslow1470
fixfast1469:
  %t6333 = icmp slt i64 %a0, %t6329
  %t6334 = select i1 %t6333, i64 257, i64 1
  br label %fixmerge1471
fixslow1470:
  %t6335 = call i64 @rt_lt(i64 %a0, i64 %t6329)
  br label %fixmerge1471
fixmerge1471:
  %t6336 = phi i64 [ %t6334, %fixfast1469 ], [ %t6335, %fixslow1470 ]
  %t6337 = icmp ne i64 %t6336, 1
  br i1 %t6337, label %then1472, label %else1473
then1472:
  %t6338 = or i64 %a0, 8
  %t6339 = and i64 %t6338, 7
  %t6340 = icmp eq i64 %t6339, 0
  br i1 %t6340, label %fixfast1474, label %fixslow1475
fixfast1474:
  %t6341 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6342 = extractvalue {i64, i1} %t6341, 0
  %t6343 = extractvalue {i64, i1} %t6341, 1
  br i1 %t6343, label %fixslow1475, label %fixmerge1476
fixslow1475:
  %t6344 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1476
fixmerge1476:
  %t6345 = phi i64 [ %t6342, %fixfast1474 ], [ %t6344, %fixslow1475 ]
  %t6346 = and i64 %self, -8
  %t6347 = inttoptr i64 %t6346 to ptr
  %t6348 = getelementptr i64, ptr %t6347, i64 1
  %t6349 = load i64, ptr %t6348
  %t6350 = call i64 @rt_vector_ref(i64 %t6349, i64 %a0)
  %t6351 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t6351)
  %t6352 = and i64 %t6351, -8
  %t6353 = inttoptr i64 %t6352 to ptr
  %t6354 = load i64, ptr %t6353
  %t6355 = inttoptr i64 %t6354 to ptr
  %t6356 = call fastcc i64%t6355(i64 %t6351, i64 2, i64 %t6350, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6357 = musttail call fastcc i64 @"scheme.base:code_1199"(i64 %self, i64 2, i64 %t6345, i64 %t6356, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6357
else1473:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6358 = icmp eq i64 %argc, 1
  br i1 %t6358, label %argok1478, label %arityerr1477
arityerr1477:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1478:
  %t6359 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6359)
  %t6360 = and i64 %t6359, -8
  %t6361 = inttoptr i64 %t6360 to ptr
  %t6362 = load i64, ptr %t6361
  %t6363 = inttoptr i64 %t6362 to ptr
  %t6364 = call fastcc i64%t6363(i64 %t6359, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6365 = call ptr @rt_alloc_words(i64 3)
  %t6366 = ptrtoint ptr %t6365 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1199" to i64), ptr %t6365
  %t6367 = or i64 %t6366, 4
  %t6368 = getelementptr i64, ptr %t6365, i64 1
  store i64 %t6364, ptr %t6368
  %t6369 = getelementptr i64, ptr %t6365, i64 2
  store i64 %t6367, ptr %t6369
  %t6370 = musttail call fastcc i64 @"scheme.base:code_1199"(i64 %t6367, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6370
}

define fastcc i64 @"scheme.base:code_1204"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6375 = icmp eq i64 %argc, 1
  br i1 %t6375, label %argok1480, label %arityerr1479
arityerr1479:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1480:
  %t6376 = call i64 @rt_car(i64 %a0)
  ret i64 %t6376
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6377 = icmp eq i64 %argc, 1
  br i1 %t6377, label %argok1482, label %arityerr1481
arityerr1481:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1482:
  %t6378 = call ptr @rt_alloc_words(i64 1)
  %t6379 = ptrtoint ptr %t6378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1204" to i64), ptr %t6378
  %t6380 = or i64 %t6379, 4
  %t6381 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t6381)
  %t6382 = and i64 %t6381, -8
  %t6383 = inttoptr i64 %t6382 to ptr
  %t6384 = load i64, ptr %t6383
  %t6385 = inttoptr i64 %t6384 to ptr
  %t6386 = call fastcc i64%t6385(i64 %t6381, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6387 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t6387)
  %t6388 = and i64 %t6387, -8
  %t6389 = inttoptr i64 %t6388 to ptr
  %t6390 = load i64, ptr %t6389
  %t6391 = inttoptr i64 %t6390 to ptr
  %t6392 = musttail call fastcc i64 %t6391(i64 %t6387, i64 2, i64 %t6380, i64 %t6386, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6392
}

define fastcc i64 @"scheme.base:code_1209"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6397 = icmp eq i64 %argc, 1
  br i1 %t6397, label %argok1484, label %arityerr1483
arityerr1483:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1484:
  %t6398 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t6398
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6399 = icmp eq i64 %argc, 1
  br i1 %t6399, label %argok1486, label %arityerr1485
arityerr1485:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1486:
  %t6400 = call ptr @rt_alloc_words(i64 1)
  %t6401 = ptrtoint ptr %t6400 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1209" to i64), ptr %t6400
  %t6402 = or i64 %t6401, 4
  %t6403 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t6403)
  %t6404 = and i64 %t6403, -8
  %t6405 = inttoptr i64 %t6404 to ptr
  %t6406 = load i64, ptr %t6405
  %t6407 = inttoptr i64 %t6406 to ptr
  %t6408 = call fastcc i64%t6407(i64 %t6403, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6409 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t6409)
  %t6410 = and i64 %t6409, -8
  %t6411 = inttoptr i64 %t6410 to ptr
  %t6412 = load i64, ptr %t6411
  %t6413 = inttoptr i64 %t6412 to ptr
  %t6414 = musttail call fastcc i64 %t6413(i64 %t6409, i64 2, i64 %t6402, i64 %t6408, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6414
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6419 = icmp eq i64 %argc, 3
  br i1 %t6419, label %argok1488, label %arityerr1487
arityerr1487:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1488:
  %t6420 = call i64 @rt_car(i64 %a2)
  %t6421 = call i64 @rt_cdr(i64 %a2)
  %t6422 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t6423 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t6422, i64 1, i64 %t6421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6424 = call i64 @rt_intern(ptr @.str.sym.34)
  %t6425 = call i64 @rt_eq_p(i64 %t6420, i64 %t6424)
  %t6426 = icmp ne i64 %t6425, 1
  br i1 %t6426, label %then1489, label %else1490
then1489:
  %t6427 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6428 = call i64 @rt_make_string(ptr @.str.lit.35, i64 45)
  %t6429 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6429)
  %t6430 = and i64 %t6429, -8
  %t6431 = inttoptr i64 %t6430 to ptr
  %t6432 = load i64, ptr %t6431
  %t6433 = inttoptr i64 %t6432 to ptr
  %t6434 = musttail call fastcc i64 %t6433(i64 %t6429, i64 3, i64 %t6427, i64 %t6428, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6434
else1490:
  %t6435 = call i64 @rt_intern(ptr @.str.sym.36)
  %t6436 = call i64 @rt_eq_p(i64 %t6420, i64 %t6435)
  %t6437 = icmp ne i64 %t6436, 1
  br i1 %t6437, label %then1491, label %else1492
then1491:
  %t6438 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6439 = call i64 @rt_make_string(ptr @.str.lit.37, i64 41)
  %t6440 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6440)
  %t6441 = and i64 %t6440, -8
  %t6442 = inttoptr i64 %t6441 to ptr
  %t6443 = load i64, ptr %t6442
  %t6444 = inttoptr i64 %t6443 to ptr
  %t6445 = musttail call fastcc i64 %t6444(i64 %t6440, i64 3, i64 %t6438, i64 %t6439, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6445
else1492:
  %t6446 = call i64 @rt_intern(ptr @.str.sym.38)
  %t6447 = call i64 @rt_eq_p(i64 %t6420, i64 %t6446)
  %t6448 = icmp ne i64 %t6447, 1
  br i1 %t6448, label %then1493, label %else1494
then1493:
  %t6449 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6450 = call i64 @rt_make_string(ptr @.str.lit.39, i64 13)
  %t6451 = call i64 @rt_string_ref(i64 %a0, i64 %t6423)
  %t6452 = call i64 @rt_char_to_integer(i64 %t6451)
  %t6453 = or i64 %t6452, 728
  %t6454 = and i64 %t6453, 7
  %t6455 = icmp eq i64 %t6454, 0
  br i1 %t6455, label %fixfast1495, label %fixslow1496
fixfast1495:
  %t6456 = icmp eq i64 %t6452, 728
  %t6457 = select i1 %t6456, i64 257, i64 1
  br label %fixmerge1497
fixslow1496:
  %t6458 = call i64 @rt_num_eq(i64 %t6452, i64 728)
  br label %fixmerge1497
fixmerge1497:
  %t6459 = phi i64 [ %t6457, %fixfast1495 ], [ %t6458, %fixslow1496 ]
  %t6460 = icmp ne i64 %t6459, 1
  br i1 %t6460, label %then1498, label %else1499
then1498:
  %t6461 = call i64 @rt_make_string(ptr @.str.lit.40, i64 6)
  br label %merge1500
else1499:
  %t6462 = or i64 %t6452, 280
  %t6463 = and i64 %t6462, 7
  %t6464 = icmp eq i64 %t6463, 0
  br i1 %t6464, label %fixfast1501, label %fixslow1502
fixfast1501:
  %t6465 = icmp eq i64 %t6452, 280
  %t6466 = select i1 %t6465, i64 257, i64 1
  br label %fixmerge1503
fixslow1502:
  %t6467 = call i64 @rt_num_eq(i64 %t6452, i64 280)
  br label %fixmerge1503
fixmerge1503:
  %t6468 = phi i64 [ %t6466, %fixfast1501 ], [ %t6467, %fixslow1502 ]
  %t6469 = icmp ne i64 %t6468, 1
  br i1 %t6469, label %then1504, label %else1505
then1504:
  %t6470 = or i64 %t6423, 8
  %t6471 = and i64 %t6470, 7
  %t6472 = icmp eq i64 %t6471, 0
  br i1 %t6472, label %fixfast1507, label %fixslow1508
fixfast1507:
  %t6473 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6423, i64 8)
  %t6474 = extractvalue {i64, i1} %t6473, 0
  %t6475 = extractvalue {i64, i1} %t6473, 1
  br i1 %t6475, label %fixslow1508, label %fixmerge1509
fixslow1508:
  %t6476 = call i64 @rt_add(i64 %t6423, i64 8)
  br label %fixmerge1509
fixmerge1509:
  %t6477 = phi i64 [ %t6474, %fixfast1507 ], [ %t6476, %fixslow1508 ]
  %t6478 = or i64 %t6477, %a1
  %t6479 = and i64 %t6478, 7
  %t6480 = icmp eq i64 %t6479, 0
  br i1 %t6480, label %fixfast1510, label %fixslow1511
fixfast1510:
  %t6481 = icmp slt i64 %t6477, %a1
  %t6482 = select i1 %t6481, i64 257, i64 1
  br label %fixmerge1512
fixslow1511:
  %t6483 = call i64 @rt_lt(i64 %t6477, i64 %a1)
  br label %fixmerge1512
fixmerge1512:
  %t6484 = phi i64 [ %t6482, %fixfast1510 ], [ %t6483, %fixslow1511 ]
  %t6485 = icmp ne i64 %t6484, 1
  br i1 %t6485, label %then1513, label %else1514
then1513:
  %t6486 = or i64 %t6423, 8
  %t6487 = and i64 %t6486, 7
  %t6488 = icmp eq i64 %t6487, 0
  br i1 %t6488, label %fixfast1516, label %fixslow1517
fixfast1516:
  %t6489 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6423, i64 8)
  %t6490 = extractvalue {i64, i1} %t6489, 0
  %t6491 = extractvalue {i64, i1} %t6489, 1
  br i1 %t6491, label %fixslow1517, label %fixmerge1518
fixslow1517:
  %t6492 = call i64 @rt_add(i64 %t6423, i64 8)
  br label %fixmerge1518
fixmerge1518:
  %t6493 = phi i64 [ %t6490, %fixfast1516 ], [ %t6492, %fixslow1517 ]
  %t6494 = call i64 @rt_string_ref(i64 %a0, i64 %t6493)
  %t6495 = call i64 @rt_char_to_integer(i64 %t6494)
  %t6496 = or i64 %t6495, 936
  %t6497 = and i64 %t6496, 7
  %t6498 = icmp eq i64 %t6497, 0
  br i1 %t6498, label %fixfast1519, label %fixslow1520
fixfast1519:
  %t6499 = icmp eq i64 %t6495, 936
  %t6500 = select i1 %t6499, i64 257, i64 1
  br label %fixmerge1521
fixslow1520:
  %t6501 = call i64 @rt_num_eq(i64 %t6495, i64 936)
  br label %fixmerge1521
fixmerge1521:
  %t6502 = phi i64 [ %t6500, %fixfast1519 ], [ %t6501, %fixslow1520 ]
  br label %merge1515
else1514:
  br label %merge1515
merge1515:
  %t6503 = phi i64 [ %t6502, %fixmerge1521 ], [ 1, %else1514 ]
  br label %merge1506
else1505:
  br label %merge1506
merge1506:
  %t6504 = phi i64 [ %t6503, %merge1515 ], [ 1, %else1505 ]
  %t6505 = icmp ne i64 %t6504, 1
  br i1 %t6505, label %then1522, label %else1523
then1522:
  %t6506 = call i64 @rt_make_string(ptr @.str.lit.41, i64 15)
  br label %merge1524
else1523:
  %t6507 = or i64 %t6452, 280
  %t6508 = and i64 %t6507, 7
  %t6509 = icmp eq i64 %t6508, 0
  br i1 %t6509, label %fixfast1525, label %fixslow1526
fixfast1525:
  %t6510 = icmp eq i64 %t6452, 280
  %t6511 = select i1 %t6510, i64 257, i64 1
  br label %fixmerge1527
fixslow1526:
  %t6512 = call i64 @rt_num_eq(i64 %t6452, i64 280)
  br label %fixmerge1527
fixmerge1527:
  %t6513 = phi i64 [ %t6511, %fixfast1525 ], [ %t6512, %fixslow1526 ]
  %t6514 = icmp ne i64 %t6513, 1
  br i1 %t6514, label %then1528, label %else1529
then1528:
  %t6515 = call i64 @rt_make_string(ptr @.str.lit.42, i64 9)
  br label %merge1530
else1529:
  %t6516 = call i64 @rt_make_string(ptr @.str.lit.43, i64 6)
  br label %merge1530
merge1530:
  %t6517 = phi i64 [ %t6515, %then1528 ], [ %t6516, %else1529 ]
  br label %merge1524
merge1524:
  %t6518 = phi i64 [ %t6506, %then1522 ], [ %t6517, %merge1530 ]
  br label %merge1500
merge1500:
  %t6519 = phi i64 [ %t6461, %then1498 ], [ %t6518, %merge1524 ]
  %t6520 = call i64 @rt_string_append(i64 %t6450, i64 %t6519)
  %t6521 = call i64 @rt_make_string(ptr @.str.lit.44, i64 16)
  %t6522 = call i64 @rt_string_append(i64 %t6520, i64 %t6521)
  %t6523 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6523)
  %t6524 = and i64 %t6523, -8
  %t6525 = inttoptr i64 %t6524 to ptr
  %t6526 = load i64, ptr %t6525
  %t6527 = inttoptr i64 %t6526 to ptr
  %t6528 = musttail call fastcc i64 %t6527(i64 %t6523, i64 3, i64 %t6449, i64 %t6522, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6528
else1494:
  %t6529 = call i64 @rt_intern(ptr @.str.sym.45)
  %t6530 = call i64 @rt_eq_p(i64 %t6420, i64 %t6529)
  %t6531 = icmp ne i64 %t6530, 1
  br i1 %t6531, label %then1531, label %else1532
then1531:
  %t6532 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6533 = call i64 @rt_make_string(ptr @.str.lit.46, i64 37)
  %t6534 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6534)
  %t6535 = and i64 %t6534, -8
  %t6536 = inttoptr i64 %t6535 to ptr
  %t6537 = load i64, ptr %t6536
  %t6538 = inttoptr i64 %t6537 to ptr
  %t6539 = musttail call fastcc i64 %t6538(i64 %t6534, i64 3, i64 %t6532, i64 %t6533, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6539
else1532:
  %t6540 = call i64 @rt_intern(ptr @.str.sym.47)
  %t6541 = call i64 @rt_eq_p(i64 %t6420, i64 %t6540)
  %t6542 = icmp ne i64 %t6541, 1
  br i1 %t6542, label %then1533, label %else1534
then1533:
  %t6543 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6544 = call i64 @rt_make_string(ptr @.str.lit.48, i64 22)
  %t6545 = load i64, ptr @"emit.internal:rd-token-at"
  %t6546 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6545, i64 3, i64 %a0, i64 %a1, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6547 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6547)
  %t6548 = and i64 %t6547, -8
  %t6549 = inttoptr i64 %t6548 to ptr
  %t6550 = load i64, ptr %t6549
  %t6551 = inttoptr i64 %t6550 to ptr
  %t6552 = musttail call fastcc i64 %t6551(i64 %t6547, i64 3, i64 %t6543, i64 %t6544, i64 %t6546, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6552
else1534:
  %t6553 = call i64 @rt_intern(ptr @.str.sym.49)
  %t6554 = call i64 @rt_eq_p(i64 %t6420, i64 %t6553)
  %t6555 = icmp ne i64 %t6554, 1
  br i1 %t6555, label %then1535, label %else1536
then1535:
  %t6556 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6557 = call i64 @rt_make_string(ptr @.str.lit.50, i64 44)
  %t6558 = load i64, ptr @"emit.internal:rd-token-at"
  %t6559 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6558, i64 3, i64 %a0, i64 %a1, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6560 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6560)
  %t6561 = and i64 %t6560, -8
  %t6562 = inttoptr i64 %t6561 to ptr
  %t6563 = load i64, ptr %t6562
  %t6564 = inttoptr i64 %t6563 to ptr
  %t6565 = musttail call fastcc i64 %t6564(i64 %t6560, i64 3, i64 %t6556, i64 %t6557, i64 %t6559, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6565
else1536:
  %t6566 = call i64 @rt_intern(ptr @.str.sym.51)
  %t6567 = call i64 @rt_eq_p(i64 %t6420, i64 %t6566)
  %t6568 = icmp ne i64 %t6567, 1
  br i1 %t6568, label %then1537, label %else1538
then1537:
  %t6569 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6570 = call i64 @rt_make_string(ptr @.str.lit.52, i64 49)
  %t6571 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6571)
  %t6572 = and i64 %t6571, -8
  %t6573 = inttoptr i64 %t6572 to ptr
  %t6574 = load i64, ptr %t6573
  %t6575 = inttoptr i64 %t6574 to ptr
  %t6576 = musttail call fastcc i64 %t6575(i64 %t6571, i64 3, i64 %t6569, i64 %t6570, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6576
else1538:
  %t6577 = call i64 @rt_intern(ptr @.str.sym.53)
  %t6578 = call i64 @rt_eq_p(i64 %t6420, i64 %t6577)
  %t6579 = icmp ne i64 %t6578, 1
  br i1 %t6579, label %then1539, label %else1540
then1539:
  %t6580 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6581 = call i64 @rt_make_string(ptr @.str.lit.54, i64 23)
  %t6582 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6582)
  %t6583 = and i64 %t6582, -8
  %t6584 = inttoptr i64 %t6583 to ptr
  %t6585 = load i64, ptr %t6584
  %t6586 = inttoptr i64 %t6585 to ptr
  %t6587 = musttail call fastcc i64 %t6586(i64 %t6582, i64 3, i64 %t6580, i64 %t6581, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6587
else1540:
  %t6588 = call i64 @rt_intern(ptr @.str.sym.55)
  %t6589 = call i64 @rt_eq_p(i64 %t6420, i64 %t6588)
  %t6590 = icmp ne i64 %t6589, 1
  br i1 %t6590, label %then1541, label %else1542
then1541:
  %t6591 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6592 = call i64 @rt_make_string(ptr @.str.lit.56, i64 56)
  %t6593 = call i64 @rt_make_string(ptr @.str.lit.57, i64 38)
  %t6594 = call i64 @rt_string_append(i64 %t6592, i64 %t6593)
  %t6595 = load i64, ptr @"emit.internal:rd-token-at"
  %t6596 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6595, i64 3, i64 %a0, i64 %a1, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6597 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6597)
  %t6598 = and i64 %t6597, -8
  %t6599 = inttoptr i64 %t6598 to ptr
  %t6600 = load i64, ptr %t6599
  %t6601 = inttoptr i64 %t6600 to ptr
  %t6602 = musttail call fastcc i64 %t6601(i64 %t6597, i64 3, i64 %t6591, i64 %t6594, i64 %t6596, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6602
else1542:
  %t6603 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6604 = call i64 @rt_make_string(ptr @.str.lit.58, i64 19)
  %t6605 = load i64, ptr @"emit.internal:rd-token-at"
  %t6606 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6605, i64 3, i64 %a0, i64 %a1, i64 %t6423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6607 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6607)
  %t6608 = and i64 %t6607, -8
  %t6609 = inttoptr i64 %t6608 to ptr
  %t6610 = load i64, ptr %t6609
  %t6611 = inttoptr i64 %t6610 to ptr
  %t6612 = musttail call fastcc i64 %t6611(i64 %t6607, i64 3, i64 %t6603, i64 %t6604, i64 %t6606, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6612
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6617 = icmp eq i64 %argc, 1
  br i1 %t6617, label %argok1544, label %arityerr1543
arityerr1543:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1544:
  %t6618 = call i64 @rt_string_length(i64 %a0)
  %t6619 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6620 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6619, i64 3, i64 %a0, i64 %t6618, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6621 = load i64, ptr @"emit.internal:rd-datum"
  %t6622 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6621, i64 4, i64 %a0, i64 %t6618, i64 %t6620, i64 1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6623 = call i64 @rt_cdr(i64 %t6622)
  %t6624 = load i64, ptr @"emit.internal:rd-fail?"
  %t6625 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6624, i64 1, i64 %t6623, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6626 = icmp ne i64 %t6625, 1
  br i1 %t6626, label %then1545, label %else1546
then1545:
  %t6627 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6627)
  %t6628 = and i64 %t6627, -8
  %t6629 = inttoptr i64 %t6628 to ptr
  %t6630 = load i64, ptr %t6629
  %t6631 = inttoptr i64 %t6630 to ptr
  %t6632 = musttail call fastcc i64 %t6631(i64 %t6627, i64 3, i64 %a0, i64 %t6618, i64 %t6622, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6632
else1546:
  %t6633 = call i64 @rt_car(i64 %t6622)
  ret i64 %t6633
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6638 = icmp eq i64 %argc, 1
  br i1 %t6638, label %argok1548, label %arityerr1547
arityerr1547:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1548:
  %t6639 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t6639)
  %t6640 = and i64 %t6639, -8
  %t6641 = inttoptr i64 %t6640 to ptr
  %t6642 = load i64, ptr %t6641
  %t6643 = inttoptr i64 %t6642 to ptr
  %t6644 = musttail call fastcc i64 %t6643(i64 %t6639, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6644
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6649 = icmp eq i64 %argc, 1
  br i1 %t6649, label %argok1550, label %arityerr1549
arityerr1549:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1550:
  %t6650 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t6650)
  %t6651 = and i64 %t6650, -8
  %t6652 = inttoptr i64 %t6651 to ptr
  %t6653 = load i64, ptr %t6652
  %t6654 = inttoptr i64 %t6653 to ptr
  %t6655 = musttail call fastcc i64 %t6654(i64 %t6650, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6655
}

define fastcc i64 @"scheme.base:code_1294"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6660 = icmp eq i64 %argc, 2
  br i1 %t6660, label %argok1552, label %arityerr1551
arityerr1551:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1552:
  %t6661 = load i64, ptr @"emit.internal:rd-fail?"
  %t6662 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6661, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6663 = icmp ne i64 %t6662, 1
  br i1 %t6663, label %then1553, label %else1554
then1553:
  %t6664 = and i64 %self, -8
  %t6665 = inttoptr i64 %t6664 to ptr
  %t6666 = getelementptr i64, ptr %t6665, i64 1
  %t6667 = load i64, ptr %t6666
  %t6668 = and i64 %self, -8
  %t6669 = inttoptr i64 %t6668 to ptr
  %t6670 = getelementptr i64, ptr %t6669, i64 2
  %t6671 = load i64, ptr %t6670
  %t6672 = call i64 @rt_intern(ptr @.str.sym.34)
  %t6673 = call i64 @rt_cons(i64 %t6672, i64 %a0)
  %t6674 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6674)
  %t6675 = and i64 %t6674, -8
  %t6676 = inttoptr i64 %t6675 to ptr
  %t6677 = load i64, ptr %t6676
  %t6678 = inttoptr i64 %t6677 to ptr
  %t6679 = musttail call fastcc i64 %t6678(i64 %t6674, i64 3, i64 %t6667, i64 %t6671, i64 %t6673, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6679
else1554:
  %t6680 = and i64 %self, -8
  %t6681 = inttoptr i64 %t6680 to ptr
  %t6682 = getelementptr i64, ptr %t6681, i64 2
  %t6683 = load i64, ptr %t6682
  %t6684 = or i64 %a0, %t6683
  %t6685 = and i64 %t6684, 7
  %t6686 = icmp eq i64 %t6685, 0
  br i1 %t6686, label %fixfast1555, label %fixslow1556
fixfast1555:
  %t6687 = icmp slt i64 %a0, %t6683
  %t6688 = select i1 %t6687, i64 257, i64 1
  br label %fixmerge1557
fixslow1556:
  %t6689 = call i64 @rt_lt(i64 %a0, i64 %t6683)
  br label %fixmerge1557
fixmerge1557:
  %t6690 = phi i64 [ %t6688, %fixfast1555 ], [ %t6689, %fixslow1556 ]
  %t6691 = icmp ne i64 %t6690, 1
  br i1 %t6691, label %then1558, label %else1559
then1558:
  %t6692 = and i64 %self, -8
  %t6693 = inttoptr i64 %t6692 to ptr
  %t6694 = getelementptr i64, ptr %t6693, i64 1
  %t6695 = load i64, ptr %t6694
  %t6696 = and i64 %self, -8
  %t6697 = inttoptr i64 %t6696 to ptr
  %t6698 = getelementptr i64, ptr %t6697, i64 2
  %t6699 = load i64, ptr %t6698
  %t6700 = and i64 %self, -8
  %t6701 = inttoptr i64 %t6700 to ptr
  %t6702 = getelementptr i64, ptr %t6701, i64 3
  %t6703 = load i64, ptr %t6702
  %t6704 = load i64, ptr @"emit.internal:rd-datum"
  %t6705 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6704, i64 4, i64 %t6695, i64 %t6699, i64 %a0, i64 %t6703, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6706 = call i64 @rt_cdr(i64 %t6705)
  %t6707 = load i64, ptr @"emit.internal:rd-fail?"
  %t6708 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6707, i64 1, i64 %t6706, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6709 = icmp ne i64 %t6708, 1
  br i1 %t6709, label %then1560, label %else1561
then1560:
  %t6710 = and i64 %self, -8
  %t6711 = inttoptr i64 %t6710 to ptr
  %t6712 = getelementptr i64, ptr %t6711, i64 1
  %t6713 = load i64, ptr %t6712
  %t6714 = and i64 %self, -8
  %t6715 = inttoptr i64 %t6714 to ptr
  %t6716 = getelementptr i64, ptr %t6715, i64 2
  %t6717 = load i64, ptr %t6716
  %t6718 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6718)
  %t6719 = and i64 %t6718, -8
  %t6720 = inttoptr i64 %t6719 to ptr
  %t6721 = load i64, ptr %t6720
  %t6722 = inttoptr i64 %t6721 to ptr
  %t6723 = musttail call fastcc i64 %t6722(i64 %t6718, i64 3, i64 %t6713, i64 %t6717, i64 %t6705, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6723
else1561:
  %t6724 = and i64 %self, -8
  %t6725 = inttoptr i64 %t6724 to ptr
  %t6726 = getelementptr i64, ptr %t6725, i64 1
  %t6727 = load i64, ptr %t6726
  %t6728 = and i64 %self, -8
  %t6729 = inttoptr i64 %t6728 to ptr
  %t6730 = getelementptr i64, ptr %t6729, i64 2
  %t6731 = load i64, ptr %t6730
  %t6732 = call i64 @rt_cdr(i64 %t6705)
  %t6733 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6734 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6733, i64 3, i64 %t6727, i64 %t6731, i64 %t6732, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6735 = call i64 @rt_car(i64 %t6705)
  %t6736 = call i64 @rt_cons(i64 %t6735, i64 %a1)
  %t6737 = musttail call fastcc i64 @"scheme.base:code_1294"(i64 %self, i64 2, i64 %t6734, i64 %t6736, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6737
else1559:
  %t6738 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t6738)
  %t6739 = and i64 %t6738, -8
  %t6740 = inttoptr i64 %t6739 to ptr
  %t6741 = load i64, ptr %t6740
  %t6742 = inttoptr i64 %t6741 to ptr
  %t6743 = musttail call fastcc i64 %t6742(i64 %t6738, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6743
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6744 = icmp eq i64 %argc, 2
  br i1 %t6744, label %argok1563, label %arityerr1562
arityerr1562:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1563:
  %t6745 = call i64 @rt_string_length(i64 %a0)
  %t6746 = call ptr @rt_alloc_words(i64 5)
  %t6747 = ptrtoint ptr %t6746 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1294" to i64), ptr %t6746
  %t6748 = or i64 %t6747, 4
  %t6749 = getelementptr i64, ptr %t6746, i64 1
  store i64 %a0, ptr %t6749
  %t6750 = getelementptr i64, ptr %t6746, i64 2
  store i64 %t6745, ptr %t6750
  %t6751 = getelementptr i64, ptr %t6746, i64 3
  store i64 %a1, ptr %t6751
  %t6752 = getelementptr i64, ptr %t6746, i64 4
  store i64 %t6748, ptr %t6752
  %t6753 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6754 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6753, i64 3, i64 %a0, i64 %t6745, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6755 = musttail call fastcc i64 @"scheme.base:code_1294"(i64 %t6748, i64 2, i64 %t6754, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6755
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6760 = icmp eq i64 %argc, 1
  br i1 %t6760, label %argok1565, label %arityerr1564
arityerr1564:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1565:
  %t6761 = load i64, ptr @"emit.internal:%port-rtd"
  %t6762 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t6761, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6763 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t6762)
  ret i64 %t6763
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6768 = icmp eq i64 %argc, 1
  br i1 %t6768, label %argok1567, label %arityerr1566
arityerr1566:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1567:
  %t6769 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6769)
  %t6770 = and i64 %t6769, -8
  %t6771 = inttoptr i64 %t6770 to ptr
  %t6772 = load i64, ptr %t6771
  %t6773 = inttoptr i64 %t6772 to ptr
  %t6774 = call fastcc i64%t6773(i64 %t6769, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6775 = icmp ne i64 %t6774, 1
  br i1 %t6775, label %then1568, label %else1569
then1568:
  %t6776 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t6776
else1569:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6781 = icmp eq i64 %argc, 1
  br i1 %t6781, label %argok1571, label %arityerr1570
arityerr1570:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1571:
  %t6782 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6782)
  %t6783 = and i64 %t6782, -8
  %t6784 = inttoptr i64 %t6783 to ptr
  %t6785 = load i64, ptr %t6784
  %t6786 = inttoptr i64 %t6785 to ptr
  %t6787 = call fastcc i64%t6786(i64 %t6782, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6788 = icmp ne i64 %t6787, 1
  br i1 %t6788, label %then1572, label %else1573
then1572:
  %t6789 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t6790 = call i64 @rt_not(i64 %t6789)
  ret i64 %t6790
else1573:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6795 = icmp eq i64 %argc, 1
  br i1 %t6795, label %argok1575, label %arityerr1574
arityerr1574:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1575:
  %t6796 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6796)
  %t6797 = and i64 %t6796, -8
  %t6798 = inttoptr i64 %t6797 to ptr
  %t6799 = load i64, ptr %t6798
  %t6800 = inttoptr i64 %t6799 to ptr
  %t6801 = musttail call fastcc i64 %t6800(i64 %t6796, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6801
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6806 = icmp eq i64 %argc, 1
  br i1 %t6806, label %argok1577, label %arityerr1576
arityerr1576:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1577:
  %t6807 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t6807
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6812 = icmp eq i64 %argc, 1
  br i1 %t6812, label %argok1579, label %arityerr1578
arityerr1578:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1579:
  %t6813 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t6813)
  %t6814 = and i64 %t6813, -8
  %t6815 = inttoptr i64 %t6814 to ptr
  %t6816 = load i64, ptr %t6815
  %t6817 = inttoptr i64 %t6816 to ptr
  %t6818 = call fastcc i64%t6817(i64 %t6813, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6819 = icmp ne i64 %t6818, 1
  br i1 %t6819, label %then1580, label %else1581
then1580:
  %t6820 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6821 = call i64 @rt_not(i64 %t6820)
  ret i64 %t6821
else1581:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6826 = icmp eq i64 %argc, 1
  br i1 %t6826, label %argok1583, label %arityerr1582
arityerr1582:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1583:
  %t6827 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t6827)
  %t6828 = and i64 %t6827, -8
  %t6829 = inttoptr i64 %t6828 to ptr
  %t6830 = load i64, ptr %t6829
  %t6831 = inttoptr i64 %t6830 to ptr
  %t6832 = call fastcc i64%t6831(i64 %t6827, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6833 = icmp ne i64 %t6832, 1
  br i1 %t6833, label %then1584, label %else1585
then1584:
  %t6834 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6835 = call i64 @rt_not(i64 %t6834)
  ret i64 %t6835
else1585:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6840 = icmp eq i64 %argc, 2
  br i1 %t6840, label %argok1587, label %arityerr1586
arityerr1586:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1587:
  %t6841 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t6841)
  %t6842 = and i64 %t6841, -8
  %t6843 = inttoptr i64 %t6842 to ptr
  %t6844 = load i64, ptr %t6843
  %t6845 = inttoptr i64 %t6844 to ptr
  %t6846 = call fastcc i64%t6845(i64 %t6841, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6847 = call i64 @rt_not(i64 %t6846)
  %t6848 = icmp ne i64 %t6847, 1
  br i1 %t6848, label %then1588, label %else1589
then1588:
  %t6849 = call i64 @rt_make_string(ptr @.str.lit.59, i64 17)
  %t6850 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6850)
  %t6851 = and i64 %t6850, -8
  %t6852 = inttoptr i64 %t6851 to ptr
  %t6853 = load i64, ptr %t6852
  %t6854 = inttoptr i64 %t6853 to ptr
  %t6855 = musttail call fastcc i64 %t6854(i64 %t6850, i64 3, i64 %a1, i64 %t6849, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6855
else1589:
  %t6856 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6857 = icmp ne i64 %t6856, 1
  br i1 %t6857, label %then1590, label %else1591
then1590:
  %t6858 = call i64 @rt_make_string(ptr @.str.lit.60, i64 14)
  %t6859 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6859)
  %t6860 = and i64 %t6859, -8
  %t6861 = inttoptr i64 %t6860 to ptr
  %t6862 = load i64, ptr %t6861
  %t6863 = inttoptr i64 %t6862 to ptr
  %t6864 = musttail call fastcc i64 %t6863(i64 %t6859, i64 3, i64 %a1, i64 %t6858, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6864
else1591:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6869 = icmp eq i64 %argc, 2
  br i1 %t6869, label %argok1593, label %arityerr1592
arityerr1592:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1593:
  %t6870 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t6870)
  %t6871 = and i64 %t6870, -8
  %t6872 = inttoptr i64 %t6871 to ptr
  %t6873 = load i64, ptr %t6872
  %t6874 = inttoptr i64 %t6873 to ptr
  %t6875 = call fastcc i64%t6874(i64 %t6870, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6876 = call i64 @rt_not(i64 %t6875)
  %t6877 = icmp ne i64 %t6876, 1
  br i1 %t6877, label %then1594, label %else1595
then1594:
  %t6878 = call i64 @rt_make_string(ptr @.str.lit.61, i64 18)
  %t6879 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6879)
  %t6880 = and i64 %t6879, -8
  %t6881 = inttoptr i64 %t6880 to ptr
  %t6882 = load i64, ptr %t6881
  %t6883 = inttoptr i64 %t6882 to ptr
  %t6884 = musttail call fastcc i64 %t6883(i64 %t6879, i64 3, i64 %a1, i64 %t6878, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6884
else1595:
  %t6885 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6886 = icmp ne i64 %t6885, 1
  br i1 %t6886, label %then1596, label %else1597
then1596:
  %t6887 = call i64 @rt_make_string(ptr @.str.lit.62, i64 14)
  %t6888 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6888)
  %t6889 = and i64 %t6888, -8
  %t6890 = inttoptr i64 %t6889 to ptr
  %t6891 = load i64, ptr %t6890
  %t6892 = inttoptr i64 %t6891 to ptr
  %t6893 = musttail call fastcc i64 %t6892(i64 %t6888, i64 3, i64 %a1, i64 %t6887, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6893
else1597:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6898 = icmp eq i64 %argc, 1
  br i1 %t6898, label %argok1599, label %arityerr1598
arityerr1598:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1599:
  %t6899 = load i64, ptr @"emit.internal:%make-port"
  %t6900 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t6899, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6900
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6905 = icmp eq i64 %argc, 1
  br i1 %t6905, label %argok1601, label %arityerr1600
arityerr1600:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1601:
  %t6906 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6907 = load i64, ptr @"emit.internal:%port-buf"
  %t6908 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6907, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6909 = call i64 @rt_string_length(i64 %t6908)
  %t6910 = or i64 %t6909, %t6906
  %t6911 = and i64 %t6910, 7
  %t6912 = icmp eq i64 %t6911, 0
  br i1 %t6912, label %fixfast1602, label %fixslow1603
fixfast1602:
  %t6913 = icmp slt i64 %t6909, %t6906
  %t6914 = select i1 %t6913, i64 257, i64 1
  br label %fixmerge1604
fixslow1603:
  %t6915 = call i64 @rt_lt(i64 %t6909, i64 %t6906)
  br label %fixmerge1604
fixmerge1604:
  %t6916 = phi i64 [ %t6914, %fixfast1602 ], [ %t6915, %fixslow1603 ]
  %t6917 = icmp ne i64 %t6916, 1
  br i1 %t6917, label %then1605, label %else1606
then1605:
  ret i64 257
else1606:
  %t6918 = or i64 %t6906, %t6909
  %t6919 = and i64 %t6918, 7
  %t6920 = icmp eq i64 %t6919, 0
  br i1 %t6920, label %fixfast1607, label %fixslow1608
fixfast1607:
  %t6921 = icmp eq i64 %t6906, %t6909
  %t6922 = select i1 %t6921, i64 257, i64 1
  br label %fixmerge1609
fixslow1608:
  %t6923 = call i64 @rt_num_eq(i64 %t6906, i64 %t6909)
  br label %fixmerge1609
fixmerge1609:
  %t6924 = phi i64 [ %t6922, %fixfast1607 ], [ %t6923, %fixslow1608 ]
  ret i64 %t6924
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6929 = icmp eq i64 %argc, 1
  br i1 %t6929, label %argok1611, label %arityerr1610
arityerr1610:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1611:
  %t6930 = call i64 @rt_intern(ptr @.str.sym.63)
  %t6931 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t6931)
  %t6932 = and i64 %t6931, -8
  %t6933 = inttoptr i64 %t6932 to ptr
  %t6934 = load i64, ptr %t6933
  %t6935 = inttoptr i64 %t6934 to ptr
  %t6936 = call fastcc i64%t6935(i64 %t6931, i64 2, i64 %a0, i64 %t6930, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6937 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t6937)
  %t6938 = and i64 %t6937, -8
  %t6939 = inttoptr i64 %t6938 to ptr
  %t6940 = load i64, ptr %t6939
  %t6941 = inttoptr i64 %t6940 to ptr
  %t6942 = call fastcc i64%t6941(i64 %t6937, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6943 = icmp ne i64 %t6942, 1
  br i1 %t6943, label %then1612, label %else1613
then1612:
  %t6944 = call i64 @rt_eof_object()
  ret i64 %t6944
else1613:
  %t6945 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6946 = or i64 %t6945, 8
  %t6947 = and i64 %t6946, 7
  %t6948 = icmp eq i64 %t6947, 0
  br i1 %t6948, label %fixfast1614, label %fixslow1615
fixfast1614:
  %t6949 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6945, i64 8)
  %t6950 = extractvalue {i64, i1} %t6949, 0
  %t6951 = extractvalue {i64, i1} %t6949, 1
  br i1 %t6951, label %fixslow1615, label %fixmerge1616
fixslow1615:
  %t6952 = call i64 @rt_add(i64 %t6945, i64 8)
  br label %fixmerge1616
fixmerge1616:
  %t6953 = phi i64 [ %t6950, %fixfast1614 ], [ %t6952, %fixslow1615 ]
  %t6954 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t6953)
  %t6955 = load i64, ptr @"emit.internal:%port-buf"
  %t6956 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6955, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6957 = call i64 @rt_string_ref(i64 %t6956, i64 %t6945)
  ret i64 %t6957
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6962 = icmp eq i64 %argc, 1
  br i1 %t6962, label %argok1618, label %arityerr1617
arityerr1617:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1618:
  %t6963 = call i64 @rt_intern(ptr @.str.sym.64)
  %t6964 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t6964)
  %t6965 = and i64 %t6964, -8
  %t6966 = inttoptr i64 %t6965 to ptr
  %t6967 = load i64, ptr %t6966
  %t6968 = inttoptr i64 %t6967 to ptr
  %t6969 = call fastcc i64%t6968(i64 %t6964, i64 2, i64 %a0, i64 %t6963, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6970 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t6970)
  %t6971 = and i64 %t6970, -8
  %t6972 = inttoptr i64 %t6971 to ptr
  %t6973 = load i64, ptr %t6972
  %t6974 = inttoptr i64 %t6973 to ptr
  %t6975 = call fastcc i64%t6974(i64 %t6970, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6976 = icmp ne i64 %t6975, 1
  br i1 %t6976, label %then1619, label %else1620
then1619:
  %t6977 = call i64 @rt_eof_object()
  ret i64 %t6977
else1620:
  %t6978 = load i64, ptr @"emit.internal:%port-buf"
  %t6979 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6978, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6980 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6981 = call i64 @rt_string_ref(i64 %t6979, i64 %t6980)
  ret i64 %t6981
}

define fastcc i64 @"scheme.base:code_1341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6986 = icmp eq i64 %argc, 1
  br i1 %t6986, label %argok1622, label %arityerr1621
arityerr1621:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1622:
  %t6987 = and i64 %self, -8
  %t6988 = inttoptr i64 %t6987 to ptr
  %t6989 = getelementptr i64, ptr %t6988, i64 1
  %t6990 = load i64, ptr %t6989
  %t6991 = or i64 %t6990, %a0
  %t6992 = and i64 %t6991, 7
  %t6993 = icmp eq i64 %t6992, 0
  br i1 %t6993, label %fixfast1623, label %fixslow1624
fixfast1623:
  %t6994 = icmp slt i64 %t6990, %a0
  %t6995 = select i1 %t6994, i64 257, i64 1
  br label %fixmerge1625
fixslow1624:
  %t6996 = call i64 @rt_lt(i64 %t6990, i64 %a0)
  br label %fixmerge1625
fixmerge1625:
  %t6997 = phi i64 [ %t6995, %fixfast1623 ], [ %t6996, %fixslow1624 ]
  %t6998 = icmp ne i64 %t6997, 1
  br i1 %t6998, label %then1626, label %else1627
then1626:
  br label %merge1628
else1627:
  %t6999 = or i64 %a0, %t6990
  %t7000 = and i64 %t6999, 7
  %t7001 = icmp eq i64 %t7000, 0
  br i1 %t7001, label %fixfast1629, label %fixslow1630
fixfast1629:
  %t7002 = icmp eq i64 %a0, %t6990
  %t7003 = select i1 %t7002, i64 257, i64 1
  br label %fixmerge1631
fixslow1630:
  %t7004 = call i64 @rt_num_eq(i64 %a0, i64 %t6990)
  br label %fixmerge1631
fixmerge1631:
  %t7005 = phi i64 [ %t7003, %fixfast1629 ], [ %t7004, %fixslow1630 ]
  br label %merge1628
merge1628:
  %t7006 = phi i64 [ 257, %then1626 ], [ %t7005, %fixmerge1631 ]
  %t7007 = icmp ne i64 %t7006, 1
  br i1 %t7007, label %then1632, label %else1633
then1632:
  %t7008 = and i64 %self, -8
  %t7009 = inttoptr i64 %t7008 to ptr
  %t7010 = getelementptr i64, ptr %t7009, i64 2
  %t7011 = load i64, ptr %t7010
  %t7012 = call i64 @rt_record_ref(i64 %t7011, i64 24)
  %t7013 = and i64 %self, -8
  %t7014 = inttoptr i64 %t7013 to ptr
  %t7015 = getelementptr i64, ptr %t7014, i64 2
  %t7016 = load i64, ptr %t7015
  %t7017 = and i64 %self, -8
  %t7018 = inttoptr i64 %t7017 to ptr
  %t7019 = getelementptr i64, ptr %t7018, i64 1
  %t7020 = load i64, ptr %t7019
  %t7021 = call i64 @rt_record_set(i64 %t7016, i64 24, i64 %t7020)
  %t7022 = and i64 %self, -8
  %t7023 = inttoptr i64 %t7022 to ptr
  %t7024 = getelementptr i64, ptr %t7023, i64 3
  %t7025 = load i64, ptr %t7024
  %t7026 = and i64 %self, -8
  %t7027 = inttoptr i64 %t7026 to ptr
  %t7028 = getelementptr i64, ptr %t7027, i64 1
  %t7029 = load i64, ptr %t7028
  %t7030 = call i64 @rt_substring(i64 %t7025, i64 %t7012, i64 %t7029)
  ret i64 %t7030
else1633:
  %t7031 = and i64 %self, -8
  %t7032 = inttoptr i64 %t7031 to ptr
  %t7033 = getelementptr i64, ptr %t7032, i64 3
  %t7034 = load i64, ptr %t7033
  %t7035 = call i64 @rt_string_ref(i64 %t7034, i64 %a0)
  %t7036 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t7036)
  %t7037 = and i64 %t7036, -8
  %t7038 = inttoptr i64 %t7037 to ptr
  %t7039 = load i64, ptr %t7038
  %t7040 = inttoptr i64 %t7039 to ptr
  %t7041 = call fastcc i64%t7040(i64 %t7036, i64 2, i64 %t7035, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7042 = icmp ne i64 %t7041, 1
  br i1 %t7042, label %then1634, label %else1635
then1634:
  %t7043 = and i64 %self, -8
  %t7044 = inttoptr i64 %t7043 to ptr
  %t7045 = getelementptr i64, ptr %t7044, i64 2
  %t7046 = load i64, ptr %t7045
  %t7047 = call i64 @rt_record_ref(i64 %t7046, i64 24)
  %t7048 = and i64 %self, -8
  %t7049 = inttoptr i64 %t7048 to ptr
  %t7050 = getelementptr i64, ptr %t7049, i64 2
  %t7051 = load i64, ptr %t7050
  %t7052 = or i64 %a0, 8
  %t7053 = and i64 %t7052, 7
  %t7054 = icmp eq i64 %t7053, 0
  br i1 %t7054, label %fixfast1636, label %fixslow1637
fixfast1636:
  %t7055 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7056 = extractvalue {i64, i1} %t7055, 0
  %t7057 = extractvalue {i64, i1} %t7055, 1
  br i1 %t7057, label %fixslow1637, label %fixmerge1638
fixslow1637:
  %t7058 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1638
fixmerge1638:
  %t7059 = phi i64 [ %t7056, %fixfast1636 ], [ %t7058, %fixslow1637 ]
  %t7060 = call i64 @rt_record_set(i64 %t7051, i64 24, i64 %t7059)
  %t7061 = and i64 %self, -8
  %t7062 = inttoptr i64 %t7061 to ptr
  %t7063 = getelementptr i64, ptr %t7062, i64 3
  %t7064 = load i64, ptr %t7063
  %t7065 = call i64 @rt_substring(i64 %t7064, i64 %t7047, i64 %a0)
  ret i64 %t7065
else1635:
  %t7066 = or i64 %a0, 8
  %t7067 = and i64 %t7066, 7
  %t7068 = icmp eq i64 %t7067, 0
  br i1 %t7068, label %fixfast1639, label %fixslow1640
fixfast1639:
  %t7069 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7070 = extractvalue {i64, i1} %t7069, 0
  %t7071 = extractvalue {i64, i1} %t7069, 1
  br i1 %t7071, label %fixslow1640, label %fixmerge1641
fixslow1640:
  %t7072 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1641
fixmerge1641:
  %t7073 = phi i64 [ %t7070, %fixfast1639 ], [ %t7072, %fixslow1640 ]
  %t7074 = musttail call fastcc i64 @"scheme.base:code_1341"(i64 %self, i64 1, i64 %t7073, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7074
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7075 = icmp eq i64 %argc, 1
  br i1 %t7075, label %argok1643, label %arityerr1642
arityerr1642:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1643:
  %t7076 = call i64 @rt_intern(ptr @.str.sym.65)
  %t7077 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7077)
  %t7078 = and i64 %t7077, -8
  %t7079 = inttoptr i64 %t7078 to ptr
  %t7080 = load i64, ptr %t7079
  %t7081 = inttoptr i64 %t7080 to ptr
  %t7082 = call fastcc i64%t7081(i64 %t7077, i64 2, i64 %a0, i64 %t7076, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7083 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7083)
  %t7084 = and i64 %t7083, -8
  %t7085 = inttoptr i64 %t7084 to ptr
  %t7086 = load i64, ptr %t7085
  %t7087 = inttoptr i64 %t7086 to ptr
  %t7088 = call fastcc i64%t7087(i64 %t7083, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7089 = icmp ne i64 %t7088, 1
  br i1 %t7089, label %then1644, label %else1645
then1644:
  %t7090 = call i64 @rt_eof_object()
  ret i64 %t7090
else1645:
  %t7091 = load i64, ptr @"emit.internal:%port-buf"
  %t7092 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7091, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7093 = call i64 @rt_string_length(i64 %t7092)
  %t7094 = call ptr @rt_alloc_words(i64 5)
  %t7095 = ptrtoint ptr %t7094 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1341" to i64), ptr %t7094
  %t7096 = or i64 %t7095, 4
  %t7097 = getelementptr i64, ptr %t7094, i64 1
  store i64 %t7093, ptr %t7097
  %t7098 = getelementptr i64, ptr %t7094, i64 2
  store i64 %a0, ptr %t7098
  %t7099 = getelementptr i64, ptr %t7094, i64 3
  store i64 %t7092, ptr %t7099
  %t7100 = getelementptr i64, ptr %t7094, i64 4
  store i64 %t7096, ptr %t7100
  %t7101 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t7102 = musttail call fastcc i64 @"scheme.base:code_1341"(i64 %t7096, i64 1, i64 %t7101, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7102
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7107 = icmp eq i64 %argc, 2
  br i1 %t7107, label %argok1647, label %arityerr1646
arityerr1646:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1647:
  %t7108 = call i64 @rt_intern(ptr @.str.sym.66)
  %t7109 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7109)
  %t7110 = and i64 %t7109, -8
  %t7111 = inttoptr i64 %t7110 to ptr
  %t7112 = load i64, ptr %t7111
  %t7113 = inttoptr i64 %t7112 to ptr
  %t7114 = call fastcc i64%t7113(i64 %t7109, i64 2, i64 %a1, i64 %t7108, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7115 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7115)
  %t7116 = and i64 %t7115, -8
  %t7117 = inttoptr i64 %t7116 to ptr
  %t7118 = load i64, ptr %t7117
  %t7119 = inttoptr i64 %t7118 to ptr
  %t7120 = call fastcc i64%t7119(i64 %t7115, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7121 = icmp ne i64 %t7120, 1
  br i1 %t7121, label %then1648, label %else1649
then1648:
  %t7122 = call i64 @rt_eof_object()
  ret i64 %t7122
else1649:
  %t7123 = load i64, ptr @"emit.internal:%port-buf"
  %t7124 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7123, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7125 = call i64 @rt_string_length(i64 %t7124)
  %t7126 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t7127 = or i64 %t7126, %a0
  %t7128 = and i64 %t7127, 7
  %t7129 = icmp eq i64 %t7128, 0
  br i1 %t7129, label %fixfast1650, label %fixslow1651
fixfast1650:
  %t7130 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7126, i64 %a0)
  %t7131 = extractvalue {i64, i1} %t7130, 0
  %t7132 = extractvalue {i64, i1} %t7130, 1
  br i1 %t7132, label %fixslow1651, label %fixmerge1652
fixslow1651:
  %t7133 = call i64 @rt_add(i64 %t7126, i64 %a0)
  br label %fixmerge1652
fixmerge1652:
  %t7134 = phi i64 [ %t7131, %fixfast1650 ], [ %t7133, %fixslow1651 ]
  %t7135 = or i64 %t7125, %t7134
  %t7136 = and i64 %t7135, 7
  %t7137 = icmp eq i64 %t7136, 0
  br i1 %t7137, label %fixfast1653, label %fixslow1654
fixfast1653:
  %t7138 = icmp slt i64 %t7125, %t7134
  %t7139 = select i1 %t7138, i64 257, i64 1
  br label %fixmerge1655
fixslow1654:
  %t7140 = call i64 @rt_lt(i64 %t7125, i64 %t7134)
  br label %fixmerge1655
fixmerge1655:
  %t7141 = phi i64 [ %t7139, %fixfast1653 ], [ %t7140, %fixslow1654 ]
  %t7142 = icmp ne i64 %t7141, 1
  br i1 %t7142, label %then1656, label %else1657
then1656:
  br label %merge1658
else1657:
  %t7143 = or i64 %t7126, %a0
  %t7144 = and i64 %t7143, 7
  %t7145 = icmp eq i64 %t7144, 0
  br i1 %t7145, label %fixfast1659, label %fixslow1660
fixfast1659:
  %t7146 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7126, i64 %a0)
  %t7147 = extractvalue {i64, i1} %t7146, 0
  %t7148 = extractvalue {i64, i1} %t7146, 1
  br i1 %t7148, label %fixslow1660, label %fixmerge1661
fixslow1660:
  %t7149 = call i64 @rt_add(i64 %t7126, i64 %a0)
  br label %fixmerge1661
fixmerge1661:
  %t7150 = phi i64 [ %t7147, %fixfast1659 ], [ %t7149, %fixslow1660 ]
  br label %merge1658
merge1658:
  %t7151 = phi i64 [ %t7125, %then1656 ], [ %t7150, %fixmerge1661 ]
  %t7152 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t7151)
  %t7153 = call i64 @rt_substring(i64 %t7124, i64 %t7126, i64 %t7151)
  ret i64 %t7153
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7158 = icmp eq i64 %argc, 0
  br i1 %t7158, label %argok1663, label %arityerr1662
arityerr1662:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1663:
  %t7159 = call i64 @rt_port_open_output_string()
  %t7160 = icmp ne i64 %t7159, 1
  br i1 %t7160, label %then1664, label %else1665
then1664:
  %t7161 = load i64, ptr @"emit.internal:%make-port"
  %t7162 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7161, i64 6, i64 %t7159, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t7162
else1665:
  %t7163 = call i64 @rt_intern(ptr @.str.sym.67)
  %t7164 = call i64 @rt_make_string(ptr @.str.lit.68, i64 33)
  %t7165 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7165)
  %t7166 = and i64 %t7165, -8
  %t7167 = inttoptr i64 %t7166 to ptr
  %t7168 = load i64, ptr %t7167
  %t7169 = inttoptr i64 %t7168 to ptr
  %t7170 = musttail call fastcc i64 %t7169(i64 %t7165, i64 2, i64 %t7163, i64 %t7164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7170
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7175 = icmp eq i64 %argc, 1
  br i1 %t7175, label %argok1667, label %arityerr1666
arityerr1666:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1667:
  %t7176 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7176)
  %t7177 = and i64 %t7176, -8
  %t7178 = inttoptr i64 %t7177 to ptr
  %t7179 = load i64, ptr %t7178
  %t7180 = inttoptr i64 %t7179 to ptr
  %t7181 = call fastcc i64%t7180(i64 %t7176, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7182 = call i64 @rt_not(i64 %t7181)
  %t7183 = icmp ne i64 %t7182, 1
  br i1 %t7183, label %then1668, label %else1669
then1668:
  %t7184 = call i64 @rt_intern(ptr @.str.sym.69)
  %t7185 = call i64 @rt_make_string(ptr @.str.lit.70, i64 18)
  %t7186 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7186)
  %t7187 = and i64 %t7186, -8
  %t7188 = inttoptr i64 %t7187 to ptr
  %t7189 = load i64, ptr %t7188
  %t7190 = inttoptr i64 %t7189 to ptr
  %t7191 = musttail call fastcc i64 %t7190(i64 %t7186, i64 3, i64 %t7184, i64 %t7185, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7191
else1669:
  %t7192 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t7193 = call i64 @rt_not(i64 %t7192)
  %t7194 = icmp ne i64 %t7193, 1
  br i1 %t7194, label %then1670, label %else1671
then1670:
  %t7195 = call i64 @rt_intern(ptr @.str.sym.69)
  %t7196 = call i64 @rt_make_string(ptr @.str.lit.71, i64 17)
  %t7197 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7197)
  %t7198 = and i64 %t7197, -8
  %t7199 = inttoptr i64 %t7198 to ptr
  %t7200 = load i64, ptr %t7199
  %t7201 = inttoptr i64 %t7200 to ptr
  %t7202 = musttail call fastcc i64 %t7201(i64 %t7197, i64 3, i64 %t7195, i64 %t7196, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7202
else1671:
  %t7203 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7204 = call i64 @rt_port_get_output_string(i64 %t7203)
  ret i64 %t7204
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7209 = icmp eq i64 %argc, 1
  br i1 %t7209, label %argok1673, label %arityerr1672
arityerr1672:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1673:
  %t7210 = call i64 @rt_intern(ptr @.str.sym.72)
  %t7211 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t7211)
  %t7212 = and i64 %t7211, -8
  %t7213 = inttoptr i64 %t7212 to ptr
  %t7214 = load i64, ptr %t7213
  %t7215 = inttoptr i64 %t7214 to ptr
  %t7216 = call fastcc i64%t7215(i64 %t7211, i64 2, i64 %a0, i64 %t7210, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7217 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7218 = call i64 @rt_port_flush(i64 %t7217)
  ret i64 %t7218
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7223 = icmp eq i64 %argc, 1
  br i1 %t7223, label %argok1675, label %arityerr1674
arityerr1674:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1675:
  %t7224 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t7224)
  %t7225 = and i64 %t7224, -8
  %t7226 = inttoptr i64 %t7225 to ptr
  %t7227 = load i64, ptr %t7226
  %t7228 = inttoptr i64 %t7227 to ptr
  %t7229 = call fastcc i64%t7228(i64 %t7224, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7230 = call i64 @rt_not(i64 %t7229)
  %t7231 = icmp ne i64 %t7230, 1
  br i1 %t7231, label %then1676, label %else1677
then1676:
  %t7232 = call i64 @rt_intern(ptr @.str.sym.73)
  %t7233 = call i64 @rt_make_string(ptr @.str.lit.74, i64 10)
  %t7234 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7234)
  %t7235 = and i64 %t7234, -8
  %t7236 = inttoptr i64 %t7235 to ptr
  %t7237 = load i64, ptr %t7236
  %t7238 = inttoptr i64 %t7237 to ptr
  %t7239 = musttail call fastcc i64 %t7238(i64 %t7234, i64 3, i64 %t7232, i64 %t7233, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7239
else1677:
  %t7240 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t7241 = icmp ne i64 %t7240, 1
  br i1 %t7241, label %then1678, label %else1679
then1678:
  %t7242 = icmp ne i64 1, 1
  br i1 %t7242, label %then1680, label %else1681
then1680:
  ret i64 1
else1681:
  ret i64 17
else1679:
  %t7243 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t7244 = call i64 @rt_not(i64 %t7243)
  %t7245 = icmp ne i64 %t7244, 1
  br i1 %t7245, label %then1682, label %else1683
then1682:
  %t7246 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7247 = call i64 @rt_port_close(i64 %t7246)
  br label %merge1684
else1683:
  br label %merge1684
merge1684:
  %t7248 = phi i64 [ %t7247, %then1682 ], [ 17, %else1683 ]
  %t7249 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t7250 = icmp ne i64 1, 1
  br i1 %t7250, label %then1685, label %else1686
then1685:
  ret i64 1
else1686:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7255 = icmp eq i64 %argc, 1
  br i1 %t7255, label %argok1688, label %arityerr1687
arityerr1687:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1688:
  %t7256 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t7256)
  %t7257 = and i64 %t7256, -8
  %t7258 = inttoptr i64 %t7257 to ptr
  %t7259 = load i64, ptr %t7258
  %t7260 = inttoptr i64 %t7259 to ptr
  %t7261 = call fastcc i64%t7260(i64 %t7256, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7262 = icmp ne i64 %t7261, 1
  br i1 %t7262, label %then1689, label %else1690
then1689:
  %t7263 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7263)
  %t7264 = and i64 %t7263, -8
  %t7265 = inttoptr i64 %t7264 to ptr
  %t7266 = load i64, ptr %t7265
  %t7267 = inttoptr i64 %t7266 to ptr
  %t7268 = musttail call fastcc i64 %t7267(i64 %t7263, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7268
else1690:
  %t7269 = call i64 @rt_intern(ptr @.str.sym.75)
  %t7270 = call i64 @rt_make_string(ptr @.str.lit.76, i64 17)
  %t7271 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7271)
  %t7272 = and i64 %t7271, -8
  %t7273 = inttoptr i64 %t7272 to ptr
  %t7274 = load i64, ptr %t7273
  %t7275 = inttoptr i64 %t7274 to ptr
  %t7276 = musttail call fastcc i64 %t7275(i64 %t7271, i64 3, i64 %t7269, i64 %t7270, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7276
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7281 = icmp eq i64 %argc, 1
  br i1 %t7281, label %argok1692, label %arityerr1691
arityerr1691:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1692:
  %t7282 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7282)
  %t7283 = and i64 %t7282, -8
  %t7284 = inttoptr i64 %t7283 to ptr
  %t7285 = load i64, ptr %t7284
  %t7286 = inttoptr i64 %t7285 to ptr
  %t7287 = call fastcc i64%t7286(i64 %t7282, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7288 = icmp ne i64 %t7287, 1
  br i1 %t7288, label %then1693, label %else1694
then1693:
  %t7289 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7289)
  %t7290 = and i64 %t7289, -8
  %t7291 = inttoptr i64 %t7290 to ptr
  %t7292 = load i64, ptr %t7291
  %t7293 = inttoptr i64 %t7292 to ptr
  %t7294 = musttail call fastcc i64 %t7293(i64 %t7289, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7294
else1694:
  %t7295 = call i64 @rt_intern(ptr @.str.sym.77)
  %t7296 = call i64 @rt_make_string(ptr @.str.lit.78, i64 18)
  %t7297 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7297)
  %t7298 = and i64 %t7297, -8
  %t7299 = inttoptr i64 %t7298 to ptr
  %t7300 = load i64, ptr %t7299
  %t7301 = inttoptr i64 %t7300 to ptr
  %t7302 = musttail call fastcc i64 %t7301(i64 %t7297, i64 3, i64 %t7295, i64 %t7296, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7302
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7310 = icmp sge i64 %argc, 0
  br i1 %t7310, label %argok1696, label %arityerr1695
arityerr1695:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1696:
  %t7311 = call ptr @rt_alloc_words(i64 8)
  %t7312 = getelementptr i64, ptr %t7311, i64 0
  store i64 %a0, ptr %t7312
  %t7313 = getelementptr i64, ptr %t7311, i64 1
  store i64 %a1, ptr %t7313
  %t7314 = getelementptr i64, ptr %t7311, i64 2
  store i64 %a2, ptr %t7314
  %t7315 = getelementptr i64, ptr %t7311, i64 3
  store i64 %a3, ptr %t7315
  %t7316 = getelementptr i64, ptr %t7311, i64 4
  store i64 %a4, ptr %t7316
  %t7317 = getelementptr i64, ptr %t7311, i64 5
  store i64 %a5, ptr %t7317
  %t7318 = getelementptr i64, ptr %t7311, i64 6
  store i64 %a6, ptr %t7318
  %t7319 = getelementptr i64, ptr %t7311, i64 7
  store i64 %a7, ptr %t7319
  %t7320 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7311, ptr %overflow)
  %t7321 = call i64 @rt_null_p(i64 %t7320)
  %t7322 = icmp ne i64 %t7321, 1
  br i1 %t7322, label %then1697, label %else1698
then1697:
  %t7323 = load i64, ptr @"scheme.base:%stdout-port"
  %t7324 = call i64 @rt_not(i64 %t7323)
  %t7325 = icmp ne i64 %t7324, 1
  br i1 %t7325, label %then1699, label %else1700
then1699:
  %t7326 = load i64, ptr @"emit.internal:%make-port"
  %t7327 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7326, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7328 = call i64 @rt_root(i64 %t7327)
  store i64 %t7328, ptr @"scheme.base:%stdout-port"
  %t7329 = call i64 @rt_set_current_output(i64 0)
  br label %merge1701
else1700:
  br label %merge1701
merge1701:
  %t7330 = phi i64 [ %t7329, %then1699 ], [ 17, %else1700 ]
  %t7331 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t7331
else1698:
  %t7332 = call i64 @rt_car(i64 %t7320)
  %t7333 = call i64 @rt_root(i64 %t7332)
  store i64 %t7333, ptr @"scheme.base:%stdout-port"
  %t7334 = call i64 @rt_record_ref(i64 %t7332, i64 0)
  %t7335 = call i64 @rt_set_current_output(i64 %t7334)
  %t7336 = icmp ne i64 1, 1
  br i1 %t7336, label %then1702, label %else1703
then1702:
  ret i64 1
else1703:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7341 = icmp sge i64 %argc, 0
  br i1 %t7341, label %argok1705, label %arityerr1704
arityerr1704:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1705:
  %t7342 = call ptr @rt_alloc_words(i64 8)
  %t7343 = getelementptr i64, ptr %t7342, i64 0
  store i64 %a0, ptr %t7343
  %t7344 = getelementptr i64, ptr %t7342, i64 1
  store i64 %a1, ptr %t7344
  %t7345 = getelementptr i64, ptr %t7342, i64 2
  store i64 %a2, ptr %t7345
  %t7346 = getelementptr i64, ptr %t7342, i64 3
  store i64 %a3, ptr %t7346
  %t7347 = getelementptr i64, ptr %t7342, i64 4
  store i64 %a4, ptr %t7347
  %t7348 = getelementptr i64, ptr %t7342, i64 5
  store i64 %a5, ptr %t7348
  %t7349 = getelementptr i64, ptr %t7342, i64 6
  store i64 %a6, ptr %t7349
  %t7350 = getelementptr i64, ptr %t7342, i64 7
  store i64 %a7, ptr %t7350
  %t7351 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7342, ptr %overflow)
  %t7352 = call i64 @rt_null_p(i64 %t7351)
  %t7353 = icmp ne i64 %t7352, 1
  br i1 %t7353, label %then1706, label %else1707
then1706:
  %t7354 = load i64, ptr @"scheme.base:%stderr-port"
  %t7355 = call i64 @rt_not(i64 %t7354)
  %t7356 = icmp ne i64 %t7355, 1
  br i1 %t7356, label %then1708, label %else1709
then1708:
  %t7357 = load i64, ptr @"emit.internal:%make-port"
  %t7358 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7357, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7359 = call i64 @rt_root(i64 %t7358)
  store i64 %t7359, ptr @"scheme.base:%stderr-port"
  br label %merge1710
else1709:
  br label %merge1710
merge1710:
  %t7360 = phi i64 [ 17, %then1708 ], [ 17, %else1709 ]
  %t7361 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t7361
else1707:
  %t7362 = call i64 @rt_car(i64 %t7351)
  %t7363 = call i64 @rt_root(i64 %t7362)
  store i64 %t7363, ptr @"scheme.base:%stderr-port"
  %t7364 = icmp ne i64 1, 1
  br i1 %t7364, label %then1711, label %else1712
then1711:
  ret i64 1
else1712:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7369 = icmp sge i64 %argc, 0
  br i1 %t7369, label %argok1714, label %arityerr1713
arityerr1713:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1714:
  %t7370 = call ptr @rt_alloc_words(i64 8)
  %t7371 = getelementptr i64, ptr %t7370, i64 0
  store i64 %a0, ptr %t7371
  %t7372 = getelementptr i64, ptr %t7370, i64 1
  store i64 %a1, ptr %t7372
  %t7373 = getelementptr i64, ptr %t7370, i64 2
  store i64 %a2, ptr %t7373
  %t7374 = getelementptr i64, ptr %t7370, i64 3
  store i64 %a3, ptr %t7374
  %t7375 = getelementptr i64, ptr %t7370, i64 4
  store i64 %a4, ptr %t7375
  %t7376 = getelementptr i64, ptr %t7370, i64 5
  store i64 %a5, ptr %t7376
  %t7377 = getelementptr i64, ptr %t7370, i64 6
  store i64 %a6, ptr %t7377
  %t7378 = getelementptr i64, ptr %t7370, i64 7
  store i64 %a7, ptr %t7378
  %t7379 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7370, ptr %overflow)
  %t7380 = call i64 @rt_null_p(i64 %t7379)
  %t7381 = icmp ne i64 %t7380, 1
  br i1 %t7381, label %then1715, label %else1716
then1715:
  %t7382 = load i64, ptr @"scheme.base:%stdin-port"
  %t7383 = call i64 @rt_not(i64 %t7382)
  %t7384 = icmp ne i64 %t7383, 1
  br i1 %t7384, label %then1717, label %else1718
then1717:
  %t7385 = load i64, ptr @"emit.internal:%make-port"
  %t7386 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7385, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7387 = call i64 @rt_root(i64 %t7386)
  store i64 %t7387, ptr @"scheme.base:%stdin-port"
  br label %merge1719
else1718:
  br label %merge1719
merge1719:
  %t7388 = phi i64 [ 17, %then1717 ], [ 17, %else1718 ]
  %t7389 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t7389
else1716:
  %t7390 = call i64 @rt_car(i64 %t7379)
  %t7391 = call i64 @rt_root(i64 %t7390)
  store i64 %t7391, ptr @"scheme.base:%stdin-port"
  %t7392 = icmp ne i64 1, 1
  br i1 %t7392, label %then1720, label %else1721
then1720:
  ret i64 1
else1721:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1376"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7397 = icmp eq i64 %argc, 0
  br i1 %t7397, label %argok1723, label %arityerr1722
arityerr1722:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1723:
  %t7398 = icmp ne i64 1, 1
  br i1 %t7398, label %then1724, label %else1725
then1724:
  ret i64 1
else1725:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1378"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7399 = icmp eq i64 %argc, 0
  br i1 %t7399, label %argok1727, label %arityerr1726
arityerr1726:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1727:
  %t7400 = and i64 %self, -8
  %t7401 = inttoptr i64 %t7400 to ptr
  %t7402 = getelementptr i64, ptr %t7401, i64 2
  %t7403 = load i64, ptr %t7402
  %t7404 = and i64 %self, -8
  %t7405 = inttoptr i64 %t7404 to ptr
  %t7406 = getelementptr i64, ptr %t7405, i64 1
  %t7407 = load i64, ptr %t7406
  call void @rt_check_callable(i64 %t7407)
  %t7408 = and i64 %t7407, -8
  %t7409 = inttoptr i64 %t7408 to ptr
  %t7410 = load i64, ptr %t7409
  %t7411 = inttoptr i64 %t7410 to ptr
  %t7412 = musttail call fastcc i64 %t7411(i64 %t7407, i64 1, i64 %t7403, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7412
}

define fastcc i64 @"scheme.base:code_1380"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7413 = icmp eq i64 %argc, 0
  br i1 %t7413, label %argok1729, label %arityerr1728
arityerr1728:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1729:
  %t7414 = and i64 %self, -8
  %t7415 = inttoptr i64 %t7414 to ptr
  %t7416 = getelementptr i64, ptr %t7415, i64 1
  %t7417 = load i64, ptr %t7416
  %t7418 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7418)
  %t7419 = and i64 %t7418, -8
  %t7420 = inttoptr i64 %t7419 to ptr
  %t7421 = load i64, ptr %t7420
  %t7422 = inttoptr i64 %t7421 to ptr
  %t7423 = musttail call fastcc i64 %t7422(i64 %t7418, i64 1, i64 %t7417, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7423
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7424 = icmp eq i64 %argc, 2
  br i1 %t7424, label %argok1731, label %arityerr1730
arityerr1730:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1731:
  %t7425 = call ptr @rt_alloc_words(i64 1)
  %t7426 = ptrtoint ptr %t7425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1376" to i64), ptr %t7425
  %t7427 = or i64 %t7426, 4
  %t7428 = call ptr @rt_alloc_words(i64 3)
  %t7429 = ptrtoint ptr %t7428 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1378" to i64), ptr %t7428
  %t7430 = getelementptr i64, ptr %t7428, i64 1
  store i64 %a1, ptr %t7430
  %t7431 = getelementptr i64, ptr %t7428, i64 2
  store i64 %a0, ptr %t7431
  %t7432 = or i64 %t7429, 4
  %t7433 = call ptr @rt_alloc_words(i64 2)
  %t7434 = ptrtoint ptr %t7433 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1380" to i64), ptr %t7433
  %t7435 = getelementptr i64, ptr %t7433, i64 1
  store i64 %a0, ptr %t7435
  %t7436 = or i64 %t7434, 4
  %t7437 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t7437)
  %t7438 = and i64 %t7437, -8
  %t7439 = inttoptr i64 %t7438 to ptr
  %t7440 = load i64, ptr %t7439
  %t7441 = inttoptr i64 %t7440 to ptr
  %t7442 = musttail call fastcc i64 %t7441(i64 %t7437, i64 3, i64 %t7427, i64 %t7432, i64 %t7436, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7442
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
  %t2103 = call ptr @rt_alloc_words(i64 1)
  %t2104 = ptrtoint ptr %t2103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%raise-kinded" to i64), ptr %t2103
  %t2105 = or i64 %t2104, 4
  %t2106 = call i64 @rt_root(i64 %t2105)
  store i64 %t2106, ptr @"scheme.base:%raise-kinded"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2125 = call ptr @rt_alloc_words(i64 1)
  %t2126 = ptrtoint ptr %t2125 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2125
  %t2127 = or i64 %t2126, 4
  %t2128 = call i64 @rt_root(i64 %t2127)
  store i64 %t2128, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2147 = call ptr @rt_alloc_words(i64 1)
  %t2148 = ptrtoint ptr %t2147 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%read-error" to i64), ptr %t2147
  %t2149 = or i64 %t2148, 4
  %t2150 = call i64 @rt_root(i64 %t2149)
  store i64 %t2150, ptr @"scheme.base:%read-error"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2151 = call i64 @rt_root(i64 2)
  store i64 %t2151, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2160 = call ptr @rt_alloc_words(i64 1)
  %t2161 = ptrtoint ptr %t2160 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_462" to i64), ptr %t2160
  %t2162 = or i64 %t2161, 4
  %t2163 = call i64 @rt_set_trap_raiser(ptr @__apply0, i64 %t2162)
  %t2164 = call i64 @rt_root(i64 2)
  store i64 %t2164, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2189 = call ptr @rt_alloc_words(i64 1)
  %t2190 = ptrtoint ptr %t2189 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2189
  %t2191 = or i64 %t2190, 4
  %t2192 = call i64 @rt_root(i64 %t2191)
  store i64 %t2192, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2216 = call ptr @rt_alloc_words(i64 1)
  %t2217 = ptrtoint ptr %t2216 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2216
  %t2218 = or i64 %t2217, 4
  %t2219 = call i64 @rt_root(i64 %t2218)
  store i64 %t2219, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2280 = call ptr @rt_alloc_words(i64 1)
  %t2281 = ptrtoint ptr %t2280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2280
  %t2282 = or i64 %t2281, 4
  %t2283 = call i64 @rt_root(i64 %t2282)
  store i64 %t2283, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2291 = call ptr @rt_alloc_words(i64 1)
  %t2292 = ptrtoint ptr %t2291 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2291
  %t2293 = or i64 %t2292, 4
  %t2294 = call i64 @rt_root(i64 %t2293)
  store i64 %t2294, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2329 = call ptr @rt_alloc_words(i64 1)
  %t2330 = ptrtoint ptr %t2329 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2329
  %t2331 = or i64 %t2330, 4
  %t2332 = call i64 @rt_root(i64 %t2331)
  store i64 %t2332, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2351 = call ptr @rt_alloc_words(i64 1)
  %t2352 = ptrtoint ptr %t2351 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2351
  %t2353 = or i64 %t2352, 4
  %t2354 = call i64 @rt_root(i64 %t2353)
  store i64 %t2354, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2357 = call ptr @rt_alloc_words(i64 1)
  %t2358 = ptrtoint ptr %t2357 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2357
  %t2359 = or i64 %t2358, 4
  %t2360 = call i64 @rt_root(i64 %t2359)
  store i64 %t2360, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2363 = call ptr @rt_alloc_words(i64 1)
  %t2364 = ptrtoint ptr %t2363 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2363
  %t2365 = or i64 %t2364, 4
  %t2366 = call i64 @rt_root(i64 %t2365)
  store i64 %t2366, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2369 = call ptr @rt_alloc_words(i64 1)
  %t2370 = ptrtoint ptr %t2369 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2369
  %t2371 = or i64 %t2370, 4
  %t2372 = call i64 @rt_root(i64 %t2371)
  store i64 %t2372, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2379 = call ptr @rt_alloc_words(i64 1)
  %t2380 = ptrtoint ptr %t2379 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t2379
  %t2381 = or i64 %t2380, 4
  %t2382 = call i64 @rt_root(i64 %t2381)
  store i64 %t2382, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2389 = call ptr @rt_alloc_words(i64 1)
  %t2390 = ptrtoint ptr %t2389 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t2389
  %t2391 = or i64 %t2390, 4
  %t2392 = call i64 @rt_root(i64 %t2391)
  store i64 %t2392, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2474 = call ptr @rt_alloc_words(i64 1)
  %t2475 = ptrtoint ptr %t2474 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2474
  %t2476 = or i64 %t2475, 4
  %t2477 = call i64 @rt_root(i64 %t2476)
  store i64 %t2477, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2558 = call ptr @rt_alloc_words(i64 1)
  %t2559 = ptrtoint ptr %t2558 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2558
  %t2560 = or i64 %t2559, 4
  %t2561 = call i64 @rt_root(i64 %t2560)
  store i64 %t2561, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2599 = call ptr @rt_alloc_words(i64 1)
  %t2600 = ptrtoint ptr %t2599 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2599
  %t2601 = or i64 %t2600, 4
  %t2602 = call i64 @rt_root(i64 %t2601)
  store i64 %t2602, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2620 = call ptr @rt_alloc_words(i64 1)
  %t2621 = ptrtoint ptr %t2620 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2620
  %t2622 = or i64 %t2621, 4
  %t2623 = call i64 @rt_root(i64 %t2622)
  store i64 %t2623, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2661 = call ptr @rt_alloc_words(i64 1)
  %t2662 = ptrtoint ptr %t2661 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2661
  %t2663 = or i64 %t2662, 4
  %t2664 = call i64 @rt_root(i64 %t2663)
  store i64 %t2664, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2682 = call ptr @rt_alloc_words(i64 1)
  %t2683 = ptrtoint ptr %t2682 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2682
  %t2684 = or i64 %t2683, 4
  %t2685 = call i64 @rt_root(i64 %t2684)
  store i64 %t2685, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2690 = call ptr @rt_alloc_words(i64 1)
  %t2691 = ptrtoint ptr %t2690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t2690
  %t2692 = or i64 %t2691, 4
  %t2693 = call i64 @rt_root(i64 %t2692)
  store i64 %t2693, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2703 = call ptr @rt_alloc_words(i64 1)
  %t2704 = ptrtoint ptr %t2703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t2703
  %t2705 = or i64 %t2704, 4
  %t2706 = call i64 @rt_root(i64 %t2705)
  store i64 %t2706, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2768 = call ptr @rt_alloc_words(i64 1)
  %t2769 = ptrtoint ptr %t2768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t2768
  %t2770 = or i64 %t2769, 4
  %t2771 = call i64 @rt_root(i64 %t2770)
  store i64 %t2771, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2787 = call ptr @rt_alloc_words(i64 1)
  %t2788 = ptrtoint ptr %t2787 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t2787
  %t2789 = or i64 %t2788, 4
  %t2790 = call i64 @rt_root(i64 %t2789)
  store i64 %t2790, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2803 = call ptr @rt_alloc_words(i64 1)
  %t2804 = ptrtoint ptr %t2803 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t2803
  %t2805 = or i64 %t2804, 4
  %t2806 = call i64 @rt_root(i64 %t2805)
  store i64 %t2806, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2825 = call ptr @rt_alloc_words(i64 1)
  %t2826 = ptrtoint ptr %t2825 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t2825
  %t2827 = or i64 %t2826, 4
  %t2828 = call i64 @rt_root(i64 %t2827)
  store i64 %t2828, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2847 = call ptr @rt_alloc_words(i64 1)
  %t2848 = ptrtoint ptr %t2847 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t2847
  %t2849 = or i64 %t2848, 4
  %t2850 = call i64 @rt_root(i64 %t2849)
  store i64 %t2850, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2865 = call ptr @rt_alloc_words(i64 1)
  %t2866 = ptrtoint ptr %t2865 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t2865
  %t2867 = or i64 %t2866, 4
  %t2868 = call i64 @rt_root(i64 %t2867)
  store i64 %t2868, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2968 = call ptr @rt_alloc_words(i64 1)
  %t2969 = ptrtoint ptr %t2968 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t2968
  %t2970 = or i64 %t2969, 4
  %t2971 = call i64 @rt_root(i64 %t2970)
  store i64 %t2971, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t2990 = call ptr @rt_alloc_words(i64 1)
  %t2991 = ptrtoint ptr %t2990 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t2990
  %t2992 = or i64 %t2991, 4
  %t2993 = call i64 @rt_root(i64 %t2992)
  store i64 %t2993, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3029 = call ptr @rt_alloc_words(i64 1)
  %t3030 = ptrtoint ptr %t3029 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3029
  %t3031 = or i64 %t3030, 4
  %t3032 = call i64 @rt_root(i64 %t3031)
  store i64 %t3032, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3068 = call ptr @rt_alloc_words(i64 1)
  %t3069 = ptrtoint ptr %t3068 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3068
  %t3070 = or i64 %t3069, 4
  %t3071 = call i64 @rt_root(i64 %t3070)
  store i64 %t3071, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3108 = call ptr @rt_alloc_words(i64 1)
  %t3109 = ptrtoint ptr %t3108 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3108
  %t3110 = or i64 %t3109, 4
  %t3111 = call i64 @rt_root(i64 %t3110)
  store i64 %t3111, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3148 = call ptr @rt_alloc_words(i64 1)
  %t3149 = ptrtoint ptr %t3148 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3148
  %t3150 = or i64 %t3149, 4
  %t3151 = call i64 @rt_root(i64 %t3150)
  store i64 %t3151, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3226 = call ptr @rt_alloc_words(i64 1)
  %t3227 = ptrtoint ptr %t3226 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3226
  %t3228 = or i64 %t3227, 4
  %t3229 = call i64 @rt_root(i64 %t3228)
  store i64 %t3229, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3327 = call ptr @rt_alloc_words(i64 1)
  %t3328 = ptrtoint ptr %t3327 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t3327
  %t3329 = or i64 %t3328, 4
  %t3330 = call i64 @rt_root(i64 %t3329)
  store i64 %t3330, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3453 = call ptr @rt_alloc_words(i64 1)
  %t3454 = ptrtoint ptr %t3453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t3453
  %t3455 = or i64 %t3454, 4
  %t3456 = call i64 @rt_root(i64 %t3455)
  store i64 %t3456, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3477 = call ptr @rt_alloc_words(i64 1)
  %t3478 = ptrtoint ptr %t3477 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t3477
  %t3479 = or i64 %t3478, 4
  %t3480 = call i64 @rt_root(i64 %t3479)
  store i64 %t3480, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3557 = call ptr @rt_alloc_words(i64 1)
  %t3558 = ptrtoint ptr %t3557 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t3557
  %t3559 = or i64 %t3558, 4
  %t3560 = call i64 @rt_root(i64 %t3559)
  store i64 %t3560, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3791 = call ptr @rt_alloc_words(i64 1)
  %t3792 = ptrtoint ptr %t3791 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t3791
  %t3793 = or i64 %t3792, 4
  %t3794 = call i64 @rt_root(i64 %t3793)
  store i64 %t3794, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3953 = call ptr @rt_alloc_words(i64 1)
  %t3954 = ptrtoint ptr %t3953 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t3953
  %t3955 = or i64 %t3954, 4
  %t3956 = call i64 @rt_root(i64 %t3955)
  store i64 %t3956, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4105 = call ptr @rt_alloc_words(i64 1)
  %t4106 = ptrtoint ptr %t4105 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t4105
  %t4107 = or i64 %t4106, 4
  %t4108 = call i64 @rt_root(i64 %t4107)
  store i64 %t4108, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4132 = call ptr @rt_alloc_words(i64 1)
  %t4133 = ptrtoint ptr %t4132 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t4132
  %t4134 = or i64 %t4133, 4
  %t4135 = call i64 @rt_root(i64 %t4134)
  store i64 %t4135, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4149 = call ptr @rt_alloc_words(i64 1)
  %t4150 = ptrtoint ptr %t4149 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t4149
  %t4151 = or i64 %t4150, 4
  %t4152 = call i64 @rt_root(i64 %t4151)
  store i64 %t4152, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4250 = call ptr @rt_alloc_words(i64 1)
  %t4251 = ptrtoint ptr %t4250 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t4250
  %t4252 = or i64 %t4251, 4
  %t4253 = call i64 @rt_root(i64 %t4252)
  store i64 %t4253, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4292 = call ptr @rt_alloc_words(i64 1)
  %t4293 = ptrtoint ptr %t4292 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t4292
  %t4294 = or i64 %t4293, 4
  %t4295 = call i64 @rt_root(i64 %t4294)
  store i64 %t4295, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4330 = call ptr @rt_alloc_words(i64 1)
  %t4331 = ptrtoint ptr %t4330 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t4330
  %t4332 = or i64 %t4331, 4
  %t4333 = call i64 @rt_root(i64 %t4332)
  store i64 %t4333, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4351 = call ptr @rt_alloc_words(i64 1)
  %t4352 = ptrtoint ptr %t4351 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t4351
  %t4353 = or i64 %t4352, 4
  %t4354 = call i64 @rt_root(i64 %t4353)
  store i64 %t4354, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4434 = call ptr @rt_alloc_words(i64 1)
  %t4435 = ptrtoint ptr %t4434 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t4434
  %t4436 = or i64 %t4435, 4
  %t4437 = call i64 @rt_root(i64 %t4436)
  store i64 %t4437, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4586 = call ptr @rt_alloc_words(i64 1)
  %t4587 = ptrtoint ptr %t4586 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t4586
  %t4588 = or i64 %t4587, 4
  %t4589 = call i64 @rt_root(i64 %t4588)
  store i64 %t4589, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t4613 = call ptr @rt_alloc_words(i64 1)
  %t4614 = ptrtoint ptr %t4613 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t4613
  %t4615 = or i64 %t4614, 4
  %t4616 = call i64 @rt_root(i64 %t4615)
  store i64 %t4616, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t4630 = call ptr @rt_alloc_words(i64 1)
  %t4631 = ptrtoint ptr %t4630 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t4630
  %t4632 = or i64 %t4631, 4
  %t4633 = call i64 @rt_root(i64 %t4632)
  store i64 %t4633, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t4710 = call ptr @rt_alloc_words(i64 1)
  %t4711 = ptrtoint ptr %t4710 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t4710
  %t4712 = or i64 %t4711, 4
  %t4713 = call i64 @rt_root(i64 %t4712)
  store i64 %t4713, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t4944 = call ptr @rt_alloc_words(i64 1)
  %t4945 = ptrtoint ptr %t4944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t4944
  %t4946 = or i64 %t4945, 4
  %t4947 = call i64 @rt_root(i64 %t4946)
  store i64 %t4947, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5045 = call ptr @rt_alloc_words(i64 1)
  %t5046 = ptrtoint ptr %t5045 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t5045
  %t5047 = or i64 %t5046, 4
  %t5048 = call i64 @rt_root(i64 %t5047)
  store i64 %t5048, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t5279 = call ptr @rt_alloc_words(i64 1)
  %t5280 = ptrtoint ptr %t5279 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t5279
  %t5281 = or i64 %t5280, 4
  %t5282 = call i64 @rt_root(i64 %t5281)
  store i64 %t5282, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t5405 = call ptr @rt_alloc_words(i64 1)
  %t5406 = ptrtoint ptr %t5405 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t5405
  %t5407 = or i64 %t5406, 4
  %t5408 = call i64 @rt_root(i64 %t5407)
  store i64 %t5408, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t5429 = call ptr @rt_alloc_words(i64 1)
  %t5430 = ptrtoint ptr %t5429 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t5429
  %t5431 = or i64 %t5430, 4
  %t5432 = call i64 @rt_root(i64 %t5431)
  store i64 %t5432, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t5433 = call i64 @rt_root(i64 8000000)
  store i64 %t5433, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t5482 = call ptr @rt_alloc_words(i64 1)
  %t5483 = ptrtoint ptr %t5482 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t5482
  %t5484 = or i64 %t5483, 4
  %t5485 = call i64 @rt_root(i64 %t5484)
  store i64 %t5485, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t5602 = call ptr @rt_alloc_words(i64 1)
  %t5603 = ptrtoint ptr %t5602 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t5602
  %t5604 = or i64 %t5603, 4
  %t5605 = call i64 @rt_root(i64 %t5604)
  store i64 %t5605, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t5607 = call ptr @rt_alloc_words(i64 1)
  %t5608 = ptrtoint ptr %t5607 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t5607
  %t5609 = or i64 %t5608, 4
  %t5610 = call i64 @rt_root(i64 %t5609)
  store i64 %t5610, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t5612 = call ptr @rt_alloc_words(i64 1)
  %t5613 = ptrtoint ptr %t5612 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t5612
  %t5614 = or i64 %t5613, 4
  %t5615 = call i64 @rt_root(i64 %t5614)
  store i64 %t5615, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t5732 = call ptr @rt_alloc_words(i64 1)
  %t5733 = ptrtoint ptr %t5732 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t5732
  %t5734 = or i64 %t5733, 4
  %t5735 = call i64 @rt_root(i64 %t5734)
  store i64 %t5735, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t5761 = call ptr @rt_alloc_words(i64 1)
  %t5762 = ptrtoint ptr %t5761 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t5761
  %t5763 = or i64 %t5762, 4
  %t5764 = call i64 @rt_root(i64 %t5763)
  store i64 %t5764, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t5790 = call ptr @rt_alloc_words(i64 1)
  %t5791 = ptrtoint ptr %t5790 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t5790
  %t5792 = or i64 %t5791, 4
  %t5793 = call i64 @rt_root(i64 %t5792)
  store i64 %t5793, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t5813 = call ptr @rt_alloc_words(i64 1)
  %t5814 = ptrtoint ptr %t5813 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t5813
  %t5815 = or i64 %t5814, 4
  %t5816 = call i64 @rt_root(i64 %t5815)
  store i64 %t5816, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t5858 = call ptr @rt_alloc_words(i64 1)
  %t5859 = ptrtoint ptr %t5858 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t5858
  %t5860 = or i64 %t5859, 4
  %t5861 = call i64 @rt_root(i64 %t5860)
  store i64 %t5861, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t5862 = call i64 @rt_root(i64 64)
  store i64 %t5862, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t5863 = call i64 @rt_root(i64 24)
  store i64 %t5863, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5874 = call ptr @rt_alloc_words(i64 1)
  %t5875 = ptrtoint ptr %t5874 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t5874
  %t5876 = or i64 %t5875, 4
  %t5877 = call i64 @rt_root(i64 %t5876)
  store i64 %t5877, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5880 = call ptr @rt_alloc_words(i64 1)
  %t5881 = ptrtoint ptr %t5880 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t5880
  %t5882 = or i64 %t5881, 4
  %t5883 = call i64 @rt_root(i64 %t5882)
  store i64 %t5883, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5887 = call ptr @rt_alloc_words(i64 1)
  %t5888 = ptrtoint ptr %t5887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t5887
  %t5889 = or i64 %t5888, 4
  %t5890 = call i64 @rt_root(i64 %t5889)
  store i64 %t5890, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5894 = call ptr @rt_alloc_words(i64 1)
  %t5895 = ptrtoint ptr %t5894 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t5894
  %t5896 = or i64 %t5895, 4
  %t5897 = call i64 @rt_root(i64 %t5896)
  store i64 %t5897, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5901 = call ptr @rt_alloc_words(i64 1)
  %t5902 = ptrtoint ptr %t5901 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t5901
  %t5903 = or i64 %t5902, 4
  %t5904 = call i64 @rt_root(i64 %t5903)
  store i64 %t5904, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5908 = call ptr @rt_alloc_words(i64 1)
  %t5909 = ptrtoint ptr %t5908 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t5908
  %t5910 = or i64 %t5909, 4
  %t5911 = call i64 @rt_root(i64 %t5910)
  store i64 %t5911, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5915 = call ptr @rt_alloc_words(i64 1)
  %t5916 = ptrtoint ptr %t5915 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t5915
  %t5917 = or i64 %t5916, 4
  %t5918 = call i64 @rt_root(i64 %t5917)
  store i64 %t5918, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5934 = call ptr @rt_alloc_words(i64 1)
  %t5935 = ptrtoint ptr %t5934 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t5934
  %t5936 = or i64 %t5935, 4
  %t5937 = call i64 @rt_root(i64 %t5936)
  store i64 %t5937, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t5955 = call ptr @rt_alloc_words(i64 1)
  %t5956 = ptrtoint ptr %t5955 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t5955
  %t5957 = or i64 %t5956, 4
  %t5958 = call i64 @rt_root(i64 %t5957)
  store i64 %t5958, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t5982 = call ptr @rt_alloc_words(i64 1)
  %t5983 = ptrtoint ptr %t5982 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t5982
  %t5984 = or i64 %t5983, 4
  %t5985 = call i64 @rt_root(i64 %t5984)
  store i64 %t5985, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t6008 = call ptr @rt_alloc_words(i64 1)
  %t6009 = ptrtoint ptr %t6008 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t6008
  %t6010 = or i64 %t6009, 4
  %t6011 = call i64 @rt_root(i64 %t6010)
  store i64 %t6011, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t6042 = call ptr @rt_alloc_words(i64 1)
  %t6043 = ptrtoint ptr %t6042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t6042
  %t6044 = or i64 %t6043, 4
  %t6045 = call i64 @rt_root(i64 %t6044)
  store i64 %t6045, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t6129 = call ptr @rt_alloc_words(i64 1)
  %t6130 = ptrtoint ptr %t6129 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t6129
  %t6131 = or i64 %t6130, 4
  %t6132 = call i64 @rt_root(i64 %t6131)
  store i64 %t6132, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t6182 = call ptr @rt_alloc_words(i64 1)
  %t6183 = ptrtoint ptr %t6182 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t6182
  %t6184 = or i64 %t6183, 4
  %t6185 = call i64 @rt_root(i64 %t6184)
  store i64 %t6185, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t6289 = call ptr @rt_alloc_words(i64 1)
  %t6290 = ptrtoint ptr %t6289 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t6289
  %t6291 = or i64 %t6290, 4
  %t6292 = call i64 @rt_root(i64 %t6291)
  store i64 %t6292, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t6300 = call ptr @rt_alloc_words(i64 1)
  %t6301 = ptrtoint ptr %t6300 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t6300
  %t6302 = or i64 %t6301, 4
  %t6303 = call i64 @rt_root(i64 %t6302)
  store i64 %t6303, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t6320 = call ptr @rt_alloc_words(i64 1)
  %t6321 = ptrtoint ptr %t6320 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t6320
  %t6322 = or i64 %t6321, 4
  %t6323 = call i64 @rt_root(i64 %t6322)
  store i64 %t6323, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t6371 = call ptr @rt_alloc_words(i64 1)
  %t6372 = ptrtoint ptr %t6371 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t6371
  %t6373 = or i64 %t6372, 4
  %t6374 = call i64 @rt_root(i64 %t6373)
  store i64 %t6374, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t6393 = call ptr @rt_alloc_words(i64 1)
  %t6394 = ptrtoint ptr %t6393 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t6393
  %t6395 = or i64 %t6394, 4
  %t6396 = call i64 @rt_root(i64 %t6395)
  store i64 %t6396, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t6415 = call ptr @rt_alloc_words(i64 1)
  %t6416 = ptrtoint ptr %t6415 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t6415
  %t6417 = or i64 %t6416, 4
  %t6418 = call i64 @rt_root(i64 %t6417)
  store i64 %t6418, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t6613 = call ptr @rt_alloc_words(i64 1)
  %t6614 = ptrtoint ptr %t6613 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t6613
  %t6615 = or i64 %t6614, 4
  %t6616 = call i64 @rt_root(i64 %t6615)
  store i64 %t6616, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t6634 = call ptr @rt_alloc_words(i64 1)
  %t6635 = ptrtoint ptr %t6634 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t6634
  %t6636 = or i64 %t6635, 4
  %t6637 = call i64 @rt_root(i64 %t6636)
  store i64 %t6637, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t6645 = call ptr @rt_alloc_words(i64 1)
  %t6646 = ptrtoint ptr %t6645 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t6645
  %t6647 = or i64 %t6646, 4
  %t6648 = call i64 @rt_root(i64 %t6647)
  store i64 %t6648, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t6656 = call ptr @rt_alloc_words(i64 1)
  %t6657 = ptrtoint ptr %t6656 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t6656
  %t6658 = or i64 %t6657, 4
  %t6659 = call i64 @rt_root(i64 %t6658)
  store i64 %t6659, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t6756 = call ptr @rt_alloc_words(i64 1)
  %t6757 = ptrtoint ptr %t6756 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t6756
  %t6758 = or i64 %t6757, 4
  %t6759 = call i64 @rt_root(i64 %t6758)
  store i64 %t6759, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t6764 = call ptr @rt_alloc_words(i64 1)
  %t6765 = ptrtoint ptr %t6764 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t6764
  %t6766 = or i64 %t6765, 4
  %t6767 = call i64 @rt_root(i64 %t6766)
  store i64 %t6767, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t6777 = call ptr @rt_alloc_words(i64 1)
  %t6778 = ptrtoint ptr %t6777 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t6777
  %t6779 = or i64 %t6778, 4
  %t6780 = call i64 @rt_root(i64 %t6779)
  store i64 %t6780, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t6791 = call ptr @rt_alloc_words(i64 1)
  %t6792 = ptrtoint ptr %t6791 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t6791
  %t6793 = or i64 %t6792, 4
  %t6794 = call i64 @rt_root(i64 %t6793)
  store i64 %t6794, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t6802 = call ptr @rt_alloc_words(i64 1)
  %t6803 = ptrtoint ptr %t6802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t6802
  %t6804 = or i64 %t6803, 4
  %t6805 = call i64 @rt_root(i64 %t6804)
  store i64 %t6805, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t6808 = call ptr @rt_alloc_words(i64 1)
  %t6809 = ptrtoint ptr %t6808 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t6808
  %t6810 = or i64 %t6809, 4
  %t6811 = call i64 @rt_root(i64 %t6810)
  store i64 %t6811, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t6822 = call ptr @rt_alloc_words(i64 1)
  %t6823 = ptrtoint ptr %t6822 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t6822
  %t6824 = or i64 %t6823, 4
  %t6825 = call i64 @rt_root(i64 %t6824)
  store i64 %t6825, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t6836 = call ptr @rt_alloc_words(i64 1)
  %t6837 = ptrtoint ptr %t6836 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t6836
  %t6838 = or i64 %t6837, 4
  %t6839 = call i64 @rt_root(i64 %t6838)
  store i64 %t6839, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t6865 = call ptr @rt_alloc_words(i64 1)
  %t6866 = ptrtoint ptr %t6865 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t6865
  %t6867 = or i64 %t6866, 4
  %t6868 = call i64 @rt_root(i64 %t6867)
  store i64 %t6868, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t6894 = call ptr @rt_alloc_words(i64 1)
  %t6895 = ptrtoint ptr %t6894 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t6894
  %t6896 = or i64 %t6895, 4
  %t6897 = call i64 @rt_root(i64 %t6896)
  store i64 %t6897, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t6901 = call ptr @rt_alloc_words(i64 1)
  %t6902 = ptrtoint ptr %t6901 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t6901
  %t6903 = or i64 %t6902, 4
  %t6904 = call i64 @rt_root(i64 %t6903)
  store i64 %t6904, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t6925 = call ptr @rt_alloc_words(i64 1)
  %t6926 = ptrtoint ptr %t6925 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t6925
  %t6927 = or i64 %t6926, 4
  %t6928 = call i64 @rt_root(i64 %t6927)
  store i64 %t6928, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t6958 = call ptr @rt_alloc_words(i64 1)
  %t6959 = ptrtoint ptr %t6958 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t6958
  %t6960 = or i64 %t6959, 4
  %t6961 = call i64 @rt_root(i64 %t6960)
  store i64 %t6961, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t6982 = call ptr @rt_alloc_words(i64 1)
  %t6983 = ptrtoint ptr %t6982 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t6982
  %t6984 = or i64 %t6983, 4
  %t6985 = call i64 @rt_root(i64 %t6984)
  store i64 %t6985, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t7103 = call ptr @rt_alloc_words(i64 1)
  %t7104 = ptrtoint ptr %t7103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t7103
  %t7105 = or i64 %t7104, 4
  %t7106 = call i64 @rt_root(i64 %t7105)
  store i64 %t7106, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t7154 = call ptr @rt_alloc_words(i64 1)
  %t7155 = ptrtoint ptr %t7154 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t7154
  %t7156 = or i64 %t7155, 4
  %t7157 = call i64 @rt_root(i64 %t7156)
  store i64 %t7157, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t7171 = call ptr @rt_alloc_words(i64 1)
  %t7172 = ptrtoint ptr %t7171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t7171
  %t7173 = or i64 %t7172, 4
  %t7174 = call i64 @rt_root(i64 %t7173)
  store i64 %t7174, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t7205 = call ptr @rt_alloc_words(i64 1)
  %t7206 = ptrtoint ptr %t7205 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t7205
  %t7207 = or i64 %t7206, 4
  %t7208 = call i64 @rt_root(i64 %t7207)
  store i64 %t7208, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t7219 = call ptr @rt_alloc_words(i64 1)
  %t7220 = ptrtoint ptr %t7219 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t7219
  %t7221 = or i64 %t7220, 4
  %t7222 = call i64 @rt_root(i64 %t7221)
  store i64 %t7222, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t7251 = call ptr @rt_alloc_words(i64 1)
  %t7252 = ptrtoint ptr %t7251 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t7251
  %t7253 = or i64 %t7252, 4
  %t7254 = call i64 @rt_root(i64 %t7253)
  store i64 %t7254, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t7277 = call ptr @rt_alloc_words(i64 1)
  %t7278 = ptrtoint ptr %t7277 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t7277
  %t7279 = or i64 %t7278, 4
  %t7280 = call i64 @rt_root(i64 %t7279)
  store i64 %t7280, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t7303 = call ptr @rt_alloc_words(i64 1)
  %t7304 = ptrtoint ptr %t7303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t7303
  %t7305 = or i64 %t7304, 4
  %t7306 = call i64 @rt_root(i64 %t7305)
  store i64 %t7306, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t7307 = call i64 @rt_root(i64 1)
  store i64 %t7307, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t7308 = call i64 @rt_root(i64 1)
  store i64 %t7308, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t7309 = call i64 @rt_root(i64 1)
  store i64 %t7309, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t7337 = call ptr @rt_alloc_words(i64 1)
  %t7338 = ptrtoint ptr %t7337 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t7337
  %t7339 = or i64 %t7338, 4
  %t7340 = call i64 @rt_root(i64 %t7339)
  store i64 %t7340, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t7365 = call ptr @rt_alloc_words(i64 1)
  %t7366 = ptrtoint ptr %t7365 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t7365
  %t7367 = or i64 %t7366, 4
  %t7368 = call i64 @rt_root(i64 %t7367)
  store i64 %t7368, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t7393 = call ptr @rt_alloc_words(i64 1)
  %t7394 = ptrtoint ptr %t7393 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t7393
  %t7395 = or i64 %t7394, 4
  %t7396 = call i64 @rt_root(i64 %t7395)
  store i64 %t7396, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t7443 = call ptr @rt_alloc_words(i64 1)
  %t7444 = ptrtoint ptr %t7443 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t7443
  %t7445 = or i64 %t7444, 4
  %t7446 = call i64 @rt_root(i64 %t7445)
  store i64 %t7446, ptr @"scheme.base:call-with-port"
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

