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

@.str.lit.0 = private unnamed_addr constant [12 x i8] c"#!fold-case\00"
@.str.lit.1 = private unnamed_addr constant [15 x i8] c"#!no-fold-case\00"
@.str.lit.2 = private unnamed_addr constant [7 x i8] c"+inf.0\00"
@.str.lit.3 = private unnamed_addr constant [4 x i8] c"inf\00"
@.str.lit.4 = private unnamed_addr constant [7 x i8] c"-inf.0\00"
@.str.lit.5 = private unnamed_addr constant [5 x i8] c"-inf\00"
@.str.lit.6 = private unnamed_addr constant [7 x i8] c"+nan.0\00"
@.str.lit.7 = private unnamed_addr constant [4 x i8] c"nan\00"
@.str.sym.8 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.sym.9 = private unnamed_addr constant [16 x i8] c"rd-not-a-number\00"
@.str.sym.10 = private unnamed_addr constant [14 x i8] c"rd-bad-number\00"
@.str.sym.11 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.12 = private unnamed_addr constant [1 x i8] c"\00"
@.str.sym.13 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.sym.14 = private unnamed_addr constant [8 x i8] c"pending\00"
@.str.sym.15 = private unnamed_addr constant [9 x i8] c"rd-label\00"
@.str.sym.16 = private unnamed_addr constant [19 x i8] c"rd-label-duplicate\00"
@.str.sym.17 = private unnamed_addr constant [14 x i8] c"rd-label-self\00"
@.str.sym.18 = private unnamed_addr constant [5 x i8] c"done\00"
@.str.sym.19 = private unnamed_addr constant [20 x i8] c"rd-label-unresolved\00"
@.str.sym.20 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.21 = private unnamed_addr constant [2 x i8] c"t\00"
@.str.lit.22 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.lit.23 = private unnamed_addr constant [2 x i8] c"f\00"
@.str.lit.24 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.sym.25 = private unnamed_addr constant [14 x i8] c"rd-hash-token\00"
@.str.lit.26 = private unnamed_addr constant [6 x i8] c"alarm\00"
@.str.lit.27 = private unnamed_addr constant [10 x i8] c"backspace\00"
@.str.lit.28 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.29 = private unnamed_addr constant [7 x i8] c"escape\00"
@.str.lit.30 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.31 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.32 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.33 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.34 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.35 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.36 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.37 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.lit.38 = private unnamed_addr constant [5 x i8] c"page\00"
@.str.sym.39 = private unnamed_addr constant [13 x i8] c"rd-char-name\00"
@.str.sym.40 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.sym.41 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.42 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.43 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.44 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.sym.45 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.sym.46 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.47 = private unnamed_addr constant [5 x i8] c"port\00"
@"emit.internal:__inited" = global i64 0
@"emit.internal:list" = global i64 0
@"emit.internal:caar" = global i64 0
@"emit.internal:cadr" = global i64 0
@"emit.internal:cdar" = global i64 0
@"emit.internal:cddr" = global i64 0
@"emit.internal:caaar" = global i64 0
@"emit.internal:caadr" = global i64 0
@"emit.internal:cadar" = global i64 0
@"emit.internal:caddr" = global i64 0
@"emit.internal:cdaar" = global i64 0
@"emit.internal:cdadr" = global i64 0
@"emit.internal:cddar" = global i64 0
@"emit.internal:cdddr" = global i64 0
@"emit.internal:length" = global i64 0
@"emit.internal:reverse" = global i64 0
@"emit.internal:filter" = global i64 0
@"emit.internal:fold-right" = global i64 0
@"emit.internal:cadddr" = global i64 0
@"emit.internal:iota" = global i64 0
@"emit.internal:%digit-in-radix" = global i64 0
@"emit.internal:%radix-digits" = global i64 0
@"emit.internal:%string->int" = global i64 0
@"emit.internal:list->vector" = global i64 0
@"emit.internal:list->bytevector" = global i64 0
@"emit.internal:rd-ws?" = global i64 0
@"emit.internal:rd-digit?" = global i64 0
@"emit.internal:rd-delim?" = global i64 0
@"emit.internal:rd-fail-code" = global i64 0
@"emit.internal:rd-fail?" = global i64 0
@"emit.internal:rd-fail-pos" = global i64 0
@"emit.internal:rd-fail" = global i64 0
@"emit.internal:rd-state" = global i64 0
@"emit.internal:rd-state-from-cell" = global i64 0
@"emit.internal:rd-state-child" = global i64 0
@"emit.internal:rd-fold?" = global i64 0
@"emit.internal:rd-set-fold!" = global i64 0
@"emit.internal:rd-match-at?" = global i64 0
@"emit.internal:rd-directive-end" = global i64 0
@"emit.internal:rd-skip-line" = global i64 0
@"emit.internal:rd-block-open?" = global i64 0
@"emit.internal:rd-skip-block" = global i64 0
@"emit.internal:rd-skip-ws" = global i64 0
@"emit.internal:rd-token-end" = global i64 0
@"emit.internal:rd-all-digits?" = global i64 0
@"emit.internal:rd-numeric?" = global i64 0
@"emit.internal:rd-digits" = global i64 0
@"emit.internal:rd-digits-neg" = global i64 0
@"emit.internal:rd-parse-int" = global i64 0
@"emit.internal:rd-dotchar?" = global i64 0
@"emit.internal:rd-exp-char?" = global i64 0
@"emit.internal:rd-sign-char?" = global i64 0
@"emit.internal:rd-scan-digits" = global i64 0
@"emit.internal:rd-flonum?" = global i64 0
@"emit.internal:rd-ci=?" = global i64 0
@"emit.internal:rd-nonfinite" = global i64 0
@"emit.internal:rd-radix-letter" = global i64 0
@"emit.internal:rd-exactness-letter" = global i64 0
@"emit.internal:rd-scan-prefixes" = global i64 0
@"emit.internal:rd-radix-scan" = global i64 0
@"emit.internal:rd-rational-body?" = global i64 0
@"emit.internal:rd-exactness-apply" = global i64 0
@"emit.internal:rd-body-number" = global i64 0
@"emit.internal:rd-number" = global i64 0
@"emit.internal:rd-number-reason?" = global i64 0
@"emit.internal:rd-fold-char" = global i64 0
@"emit.internal:rd-fold-token" = global i64 0
@"emit.internal:rd-atom" = global i64 0
@"emit.internal:rd-token-at" = global i64 0
@"emit.internal:rd-hex-digit" = global i64 0
@"emit.internal:rd-hex-digit?" = global i64 0
@"emit.internal:rd-hex" = global i64 0
@"emit.internal:rd-str-esc" = global i64 0
@"emit.internal:rd-intraline" = global i64 0
@"emit.internal:rd-line-continuation" = global i64 0
@"emit.internal:rd-string" = global i64 0
@"emit.internal:rd-label-find" = global i64 0
@"emit.internal:rd-label-add!" = global i64 0
@"emit.internal:rd-placeholder" = global i64 0
@"emit.internal:rd-placeholder?" = global i64 0
@"emit.internal:rd-placeholder-entry" = global i64 0
@"emit.internal:rd-seen?" = global i64 0
@"emit.internal:rd-label-scan" = global i64 0
@"emit.internal:rd-resolve" = global i64 0
@"emit.internal:rd-finish" = global i64 0
@"emit.internal:rd-label" = global i64 0
@"emit.internal:rd-hash" = global i64 0
@"emit.internal:rd-char-name" = global i64 0
@"emit.internal:rd-char-hex" = global i64 0
@"emit.internal:rd-char" = global i64 0
@"emit.internal:rd-bar" = global i64 0
@"emit.internal:rd-quote" = global i64 0
@"emit.internal:rd-quasi" = global i64 0
@"emit.internal:rd-unquote" = global i64 0
@"emit.internal:rd-dot?" = global i64 0
@"emit.internal:rd-append-reverse" = global i64 0
@"emit.internal:rd-datum-comment?" = global i64 0
@"emit.internal:rd-list" = global i64 0
@"emit.internal:rd-datum" = global i64 0
@"emit.internal:%port-rtd-cell" = global i64 0
@"emit.internal:%port-rtd" = global i64 0
@"emit.internal:%make-port" = global i64 0
@"emit.internal:%port-buf" = global i64 0
define fastcc i64 @"emit.internal:code:list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"min-entry:$emit.internal$ccode$clist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  ret i64 2
}

define fastcc i64 @"emit.internal:code:caar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"emit.internal:code:cadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"emit.internal:code:cdar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"emit.internal:code:cddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"emit.internal:code:caaar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t44 = icmp eq i64 %argc, 1
  br i1 %t44, label %argok12, label %arityerr11
arityerr11:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok12:
  %t45 = load i64, ptr @"emit.internal:caar"
  call void @rt_check_callable(i64 %t45)
  %t46 = and i64 %t45, -8
  %t47 = inttoptr i64 %t46 to ptr
  %t48 = load i64, ptr %t47
  %t49 = inttoptr i64 %t48 to ptr
  %t50 = call fastcc i64%t49(i64 %t45, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t51 = call i64 @rt_car(i64 %t50)
  ret i64 %t51
}

define fastcc i64 @"emit.internal:code:caadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t56 = icmp eq i64 %argc, 1
  br i1 %t56, label %argok14, label %arityerr13
arityerr13:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok14:
  %t57 = load i64, ptr @"emit.internal:cadr"
  call void @rt_check_callable(i64 %t57)
  %t58 = and i64 %t57, -8
  %t59 = inttoptr i64 %t58 to ptr
  %t60 = load i64, ptr %t59
  %t61 = inttoptr i64 %t60 to ptr
  %t62 = call fastcc i64%t61(i64 %t57, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t63 = call i64 @rt_car(i64 %t62)
  ret i64 %t63
}

define fastcc i64 @"emit.internal:code:cadar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t68 = icmp eq i64 %argc, 1
  br i1 %t68, label %argok16, label %arityerr15
arityerr15:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok16:
  %t69 = load i64, ptr @"emit.internal:cdar"
  call void @rt_check_callable(i64 %t69)
  %t70 = and i64 %t69, -8
  %t71 = inttoptr i64 %t70 to ptr
  %t72 = load i64, ptr %t71
  %t73 = inttoptr i64 %t72 to ptr
  %t74 = call fastcc i64%t73(i64 %t69, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t75 = call i64 @rt_car(i64 %t74)
  ret i64 %t75
}

define fastcc i64 @"emit.internal:code:caddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t80 = icmp eq i64 %argc, 1
  br i1 %t80, label %argok18, label %arityerr17
arityerr17:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok18:
  %t81 = load i64, ptr @"emit.internal:cddr"
  call void @rt_check_callable(i64 %t81)
  %t82 = and i64 %t81, -8
  %t83 = inttoptr i64 %t82 to ptr
  %t84 = load i64, ptr %t83
  %t85 = inttoptr i64 %t84 to ptr
  %t86 = call fastcc i64%t85(i64 %t81, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t87 = call i64 @rt_car(i64 %t86)
  ret i64 %t87
}

define fastcc i64 @"emit.internal:code:cdaar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t92 = icmp eq i64 %argc, 1
  br i1 %t92, label %argok20, label %arityerr19
arityerr19:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok20:
  %t93 = load i64, ptr @"emit.internal:caar"
  call void @rt_check_callable(i64 %t93)
  %t94 = and i64 %t93, -8
  %t95 = inttoptr i64 %t94 to ptr
  %t96 = load i64, ptr %t95
  %t97 = inttoptr i64 %t96 to ptr
  %t98 = call fastcc i64%t97(i64 %t93, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t99 = call i64 @rt_cdr(i64 %t98)
  ret i64 %t99
}

define fastcc i64 @"emit.internal:code:cdadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t104 = icmp eq i64 %argc, 1
  br i1 %t104, label %argok22, label %arityerr21
arityerr21:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok22:
  %t105 = load i64, ptr @"emit.internal:cadr"
  call void @rt_check_callable(i64 %t105)
  %t106 = and i64 %t105, -8
  %t107 = inttoptr i64 %t106 to ptr
  %t108 = load i64, ptr %t107
  %t109 = inttoptr i64 %t108 to ptr
  %t110 = call fastcc i64%t109(i64 %t105, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t111 = call i64 @rt_cdr(i64 %t110)
  ret i64 %t111
}

define fastcc i64 @"emit.internal:code:cddar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t116 = icmp eq i64 %argc, 1
  br i1 %t116, label %argok24, label %arityerr23
arityerr23:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok24:
  %t117 = load i64, ptr @"emit.internal:cdar"
  call void @rt_check_callable(i64 %t117)
  %t118 = and i64 %t117, -8
  %t119 = inttoptr i64 %t118 to ptr
  %t120 = load i64, ptr %t119
  %t121 = inttoptr i64 %t120 to ptr
  %t122 = call fastcc i64%t121(i64 %t117, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t123 = call i64 @rt_cdr(i64 %t122)
  ret i64 %t123
}

define fastcc i64 @"emit.internal:code:cdddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t128 = icmp eq i64 %argc, 1
  br i1 %t128, label %argok26, label %arityerr25
arityerr25:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok26:
  %t129 = load i64, ptr @"emit.internal:cddr"
  call void @rt_check_callable(i64 %t129)
  %t130 = and i64 %t129, -8
  %t131 = inttoptr i64 %t130 to ptr
  %t132 = load i64, ptr %t131
  %t133 = inttoptr i64 %t132 to ptr
  %t134 = call fastcc i64%t133(i64 %t129, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t135 = call i64 @rt_cdr(i64 %t134)
  ret i64 %t135
}

define fastcc i64 @"emit.internal:code_465"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t140 = icmp eq i64 %argc, 2
  br i1 %t140, label %argok28, label %arityerr27
arityerr27:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok28:
  %t141 = call i64 @rt_null_p(i64 %a0)
  %t142 = icmp ne i64 %t141, 1
  br i1 %t142, label %then29, label %else30
then29:
  ret i64 %a1
else30:
  %t143 = call i64 @rt_cdr(i64 %a0)
  %t144 = or i64 %a1, 8
  %t145 = and i64 %t144, 7
  %t146 = icmp eq i64 %t145, 0
  br i1 %t146, label %fixfast31, label %fixslow32
fixfast31:
  %t147 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t148 = extractvalue {i64, i1} %t147, 0
  %t149 = extractvalue {i64, i1} %t147, 1
  br i1 %t149, label %fixslow32, label %fixmerge33
fixslow32:
  %t150 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge33
fixmerge33:
  %t151 = phi i64 [ %t148, %fixfast31 ], [ %t150, %fixslow32 ]
  %t152 = musttail call fastcc i64 @"emit.internal:code_465"(i64 %self, i64 2, i64 %t143, i64 %t151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t152
}

define fastcc i64 @"emit.internal:code:length"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t153 = icmp eq i64 %argc, 1
  br i1 %t153, label %argok35, label %arityerr34
arityerr34:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok35:
  %t154 = call ptr @rt_alloc_words(i64 2)
  %t155 = ptrtoint ptr %t154 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_465" to i64), ptr %t154
  %t156 = or i64 %t155, 4
  %t157 = getelementptr i64, ptr %t154, i64 1
  store i64 %t156, ptr %t157
  %t158 = musttail call fastcc i64 @"emit.internal:code_465"(i64 %t156, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t158
}

define fastcc i64 @"emit.internal:code_472"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t163 = icmp eq i64 %argc, 2
  br i1 %t163, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t164 = call i64 @rt_null_p(i64 %a0)
  %t165 = icmp ne i64 %t164, 1
  br i1 %t165, label %then38, label %else39
then38:
  ret i64 %a1
else39:
  %t166 = call i64 @rt_cdr(i64 %a0)
  %t167 = call i64 @rt_car(i64 %a0)
  %t168 = call i64 @rt_cons(i64 %t167, i64 %a1)
  %t169 = musttail call fastcc i64 @"emit.internal:code_472"(i64 %self, i64 2, i64 %t166, i64 %t168, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t169
}

define fastcc i64 @"emit.internal:code:reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t170 = icmp eq i64 %argc, 1
  br i1 %t170, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t171 = call ptr @rt_alloc_words(i64 2)
  %t172 = ptrtoint ptr %t171 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_472" to i64), ptr %t171
  %t173 = or i64 %t172, 4
  %t174 = getelementptr i64, ptr %t171, i64 1
  store i64 %t173, ptr %t174
  %t175 = musttail call fastcc i64 @"emit.internal:code_472"(i64 %t173, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t175
}

define fastcc i64 @"emit.internal:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t180 = icmp eq i64 %argc, 2
  br i1 %t180, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok43:
  %t181 = call i64 @rt_null_p(i64 %a1)
  %t182 = icmp ne i64 %t181, 1
  br i1 %t182, label %then44, label %else45
then44:
  ret i64 2
else45:
  %t183 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t184 = and i64 %a0, -8
  %t185 = inttoptr i64 %t184 to ptr
  %t186 = load i64, ptr %t185
  %t187 = inttoptr i64 %t186 to ptr
  %t188 = call fastcc i64%t187(i64 %a0, i64 1, i64 %t183, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t189 = icmp ne i64 %t188, 1
  br i1 %t189, label %then46, label %else47
then46:
  %t190 = call i64 @rt_car(i64 %a1)
  %t191 = call i64 @rt_cdr(i64 %a1)
  %t192 = load i64, ptr @"emit.internal:filter"
  call void @rt_check_callable(i64 %t192)
  %t193 = and i64 %t192, -8
  %t194 = inttoptr i64 %t193 to ptr
  %t195 = load i64, ptr %t194
  %t196 = inttoptr i64 %t195 to ptr
  %t197 = call fastcc i64%t196(i64 %t192, i64 2, i64 %a0, i64 %t191, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t198 = call i64 @rt_cons(i64 %t190, i64 %t197)
  ret i64 %t198
else47:
  %t199 = call i64 @rt_cdr(i64 %a1)
  %t200 = load i64, ptr @"emit.internal:filter"
  call void @rt_check_callable(i64 %t200)
  %t201 = and i64 %t200, -8
  %t202 = inttoptr i64 %t201 to ptr
  %t203 = load i64, ptr %t202
  %t204 = inttoptr i64 %t203 to ptr
  %t205 = musttail call fastcc i64 %t204(i64 %t200, i64 2, i64 %a0, i64 %t199, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t205
}

define fastcc i64 @"emit.internal:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t210 = icmp eq i64 %argc, 3
  br i1 %t210, label %argok49, label %arityerr48
arityerr48:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok49:
  %t211 = call i64 @rt_null_p(i64 %a2)
  %t212 = icmp ne i64 %t211, 1
  br i1 %t212, label %then50, label %else51
then50:
  ret i64 %a1
else51:
  %t213 = call i64 @rt_car(i64 %a2)
  %t214 = call i64 @rt_cdr(i64 %a2)
  %t215 = load i64, ptr @"emit.internal:fold-right"
  call void @rt_check_callable(i64 %t215)
  %t216 = and i64 %t215, -8
  %t217 = inttoptr i64 %t216 to ptr
  %t218 = load i64, ptr %t217
  %t219 = inttoptr i64 %t218 to ptr
  %t220 = call fastcc i64%t219(i64 %t215, i64 3, i64 %a0, i64 %a1, i64 %t214, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t221 = and i64 %a0, -8
  %t222 = inttoptr i64 %t221 to ptr
  %t223 = load i64, ptr %t222
  %t224 = inttoptr i64 %t223 to ptr
  %t225 = musttail call fastcc i64 %t224(i64 %a0, i64 2, i64 %t213, i64 %t220, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t225
}

define fastcc i64 @"emit.internal:code:cadddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t230 = icmp eq i64 %argc, 1
  br i1 %t230, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok53:
  %t231 = load i64, ptr @"emit.internal:cdddr"
  call void @rt_check_callable(i64 %t231)
  %t232 = and i64 %t231, -8
  %t233 = inttoptr i64 %t232 to ptr
  %t234 = load i64, ptr %t233
  %t235 = inttoptr i64 %t234 to ptr
  %t236 = call fastcc i64%t235(i64 %t231, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t237 = call i64 @rt_car(i64 %t236)
  ret i64 %t237
}

define fastcc i64 @"emit.internal:code_490"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t242 = icmp eq i64 %argc, 2
  br i1 %t242, label %argok55, label %arityerr54
arityerr54:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok55:
  %t243 = and i64 %self, -8
  %t244 = inttoptr i64 %t243 to ptr
  %t245 = getelementptr i64, ptr %t244, i64 1
  %t246 = load i64, ptr %t245
  %t247 = or i64 %a0, %t246
  %t248 = and i64 %t247, 7
  %t249 = icmp eq i64 %t248, 0
  br i1 %t249, label %fixfast56, label %fixslow57
fixfast56:
  %t250 = icmp eq i64 %a0, %t246
  %t251 = select i1 %t250, i64 257, i64 1
  br label %fixmerge58
fixslow57:
  %t252 = call i64 @rt_num_eq(i64 %a0, i64 %t246)
  br label %fixmerge58
fixmerge58:
  %t253 = phi i64 [ %t251, %fixfast56 ], [ %t252, %fixslow57 ]
  %t254 = icmp ne i64 %t253, 1
  br i1 %t254, label %then59, label %else60
then59:
  %t255 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t255)
  %t256 = and i64 %t255, -8
  %t257 = inttoptr i64 %t256 to ptr
  %t258 = load i64, ptr %t257
  %t259 = inttoptr i64 %t258 to ptr
  %t260 = musttail call fastcc i64 %t259(i64 %t255, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t260
else60:
  %t261 = or i64 %a0, 8
  %t262 = and i64 %t261, 7
  %t263 = icmp eq i64 %t262, 0
  br i1 %t263, label %fixfast61, label %fixslow62
fixfast61:
  %t264 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t265 = extractvalue {i64, i1} %t264, 0
  %t266 = extractvalue {i64, i1} %t264, 1
  br i1 %t266, label %fixslow62, label %fixmerge63
fixslow62:
  %t267 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge63
fixmerge63:
  %t268 = phi i64 [ %t265, %fixfast61 ], [ %t267, %fixslow62 ]
  %t269 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t270 = musttail call fastcc i64 @"emit.internal:code_490"(i64 %self, i64 2, i64 %t268, i64 %t269, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t270
}

define fastcc i64 @"emit.internal:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t271 = icmp eq i64 %argc, 1
  br i1 %t271, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok65:
  %t272 = call ptr @rt_alloc_words(i64 3)
  %t273 = ptrtoint ptr %t272 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_490" to i64), ptr %t272
  %t274 = or i64 %t273, 4
  %t275 = getelementptr i64, ptr %t272, i64 1
  store i64 %a0, ptr %t275
  %t276 = getelementptr i64, ptr %t272, i64 2
  store i64 %t274, ptr %t276
  %t277 = musttail call fastcc i64 @"emit.internal:code_490"(i64 %t274, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t277
}

define fastcc i64 @"emit.internal:code:%digit-in-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t282 = icmp eq i64 %argc, 2
  br i1 %t282, label %argok67, label %arityerr66
arityerr66:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok67:
  %t283 = call i64 @rt_char_to_integer(i64 %a0)
  %t284 = or i64 376, %t283
  %t285 = and i64 %t284, 7
  %t286 = icmp eq i64 %t285, 0
  br i1 %t286, label %fixfast68, label %fixslow69
fixfast68:
  %t287 = icmp slt i64 376, %t283
  %t288 = select i1 %t287, i64 257, i64 1
  br label %fixmerge70
fixslow69:
  %t289 = call i64 @rt_lt(i64 376, i64 %t283)
  br label %fixmerge70
fixmerge70:
  %t290 = phi i64 [ %t288, %fixfast68 ], [ %t289, %fixslow69 ]
  %t291 = icmp ne i64 %t290, 1
  br i1 %t291, label %then71, label %else72
then71:
  %t292 = or i64 %t283, 464
  %t293 = and i64 %t292, 7
  %t294 = icmp eq i64 %t293, 0
  br i1 %t294, label %fixfast74, label %fixslow75
fixfast74:
  %t295 = icmp slt i64 %t283, 464
  %t296 = select i1 %t295, i64 257, i64 1
  br label %fixmerge76
fixslow75:
  %t297 = call i64 @rt_lt(i64 %t283, i64 464)
  br label %fixmerge76
fixmerge76:
  %t298 = phi i64 [ %t296, %fixfast74 ], [ %t297, %fixslow75 ]
  br label %merge73
else72:
  br label %merge73
merge73:
  %t299 = phi i64 [ %t298, %fixmerge76 ], [ 1, %else72 ]
  %t300 = icmp ne i64 %t299, 1
  br i1 %t300, label %then77, label %else78
then77:
  %t301 = or i64 %t283, 384
  %t302 = and i64 %t301, 7
  %t303 = icmp eq i64 %t302, 0
  br i1 %t303, label %fixfast80, label %fixslow81
fixfast80:
  %t304 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t283, i64 384)
  %t305 = extractvalue {i64, i1} %t304, 0
  %t306 = extractvalue {i64, i1} %t304, 1
  br i1 %t306, label %fixslow81, label %fixmerge82
fixslow81:
  %t307 = call i64 @rt_sub(i64 %t283, i64 384)
  br label %fixmerge82
fixmerge82:
  %t308 = phi i64 [ %t305, %fixfast80 ], [ %t307, %fixslow81 ]
  br label %merge79
else78:
  %t309 = or i64 768, %t283
  %t310 = and i64 %t309, 7
  %t311 = icmp eq i64 %t310, 0
  br i1 %t311, label %fixfast83, label %fixslow84
fixfast83:
  %t312 = icmp slt i64 768, %t283
  %t313 = select i1 %t312, i64 257, i64 1
  br label %fixmerge85
fixslow84:
  %t314 = call i64 @rt_lt(i64 768, i64 %t283)
  br label %fixmerge85
fixmerge85:
  %t315 = phi i64 [ %t313, %fixfast83 ], [ %t314, %fixslow84 ]
  %t316 = icmp ne i64 %t315, 1
  br i1 %t316, label %then86, label %else87
then86:
  %t317 = or i64 %t283, 984
  %t318 = and i64 %t317, 7
  %t319 = icmp eq i64 %t318, 0
  br i1 %t319, label %fixfast89, label %fixslow90
fixfast89:
  %t320 = icmp slt i64 %t283, 984
  %t321 = select i1 %t320, i64 257, i64 1
  br label %fixmerge91
fixslow90:
  %t322 = call i64 @rt_lt(i64 %t283, i64 984)
  br label %fixmerge91
fixmerge91:
  %t323 = phi i64 [ %t321, %fixfast89 ], [ %t322, %fixslow90 ]
  br label %merge88
else87:
  br label %merge88
merge88:
  %t324 = phi i64 [ %t323, %fixmerge91 ], [ 1, %else87 ]
  %t325 = icmp ne i64 %t324, 1
  br i1 %t325, label %then92, label %else93
then92:
  %t326 = or i64 %t283, 696
  %t327 = and i64 %t326, 7
  %t328 = icmp eq i64 %t327, 0
  br i1 %t328, label %fixfast95, label %fixslow96
fixfast95:
  %t329 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t283, i64 696)
  %t330 = extractvalue {i64, i1} %t329, 0
  %t331 = extractvalue {i64, i1} %t329, 1
  br i1 %t331, label %fixslow96, label %fixmerge97
fixslow96:
  %t332 = call i64 @rt_sub(i64 %t283, i64 696)
  br label %fixmerge97
fixmerge97:
  %t333 = phi i64 [ %t330, %fixfast95 ], [ %t332, %fixslow96 ]
  br label %merge94
else93:
  %t334 = or i64 512, %t283
  %t335 = and i64 %t334, 7
  %t336 = icmp eq i64 %t335, 0
  br i1 %t336, label %fixfast98, label %fixslow99
fixfast98:
  %t337 = icmp slt i64 512, %t283
  %t338 = select i1 %t337, i64 257, i64 1
  br label %fixmerge100
fixslow99:
  %t339 = call i64 @rt_lt(i64 512, i64 %t283)
  br label %fixmerge100
fixmerge100:
  %t340 = phi i64 [ %t338, %fixfast98 ], [ %t339, %fixslow99 ]
  %t341 = icmp ne i64 %t340, 1
  br i1 %t341, label %then101, label %else102
then101:
  %t342 = or i64 %t283, 728
  %t343 = and i64 %t342, 7
  %t344 = icmp eq i64 %t343, 0
  br i1 %t344, label %fixfast104, label %fixslow105
fixfast104:
  %t345 = icmp slt i64 %t283, 728
  %t346 = select i1 %t345, i64 257, i64 1
  br label %fixmerge106
fixslow105:
  %t347 = call i64 @rt_lt(i64 %t283, i64 728)
  br label %fixmerge106
fixmerge106:
  %t348 = phi i64 [ %t346, %fixfast104 ], [ %t347, %fixslow105 ]
  br label %merge103
else102:
  br label %merge103
merge103:
  %t349 = phi i64 [ %t348, %fixmerge106 ], [ 1, %else102 ]
  %t350 = icmp ne i64 %t349, 1
  br i1 %t350, label %then107, label %else108
then107:
  %t351 = or i64 %t283, 440
  %t352 = and i64 %t351, 7
  %t353 = icmp eq i64 %t352, 0
  br i1 %t353, label %fixfast110, label %fixslow111
fixfast110:
  %t354 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t283, i64 440)
  %t355 = extractvalue {i64, i1} %t354, 0
  %t356 = extractvalue {i64, i1} %t354, 1
  br i1 %t356, label %fixslow111, label %fixmerge112
fixslow111:
  %t357 = call i64 @rt_sub(i64 %t283, i64 440)
  br label %fixmerge112
fixmerge112:
  %t358 = phi i64 [ %t355, %fixfast110 ], [ %t357, %fixslow111 ]
  br label %merge109
else108:
  br label %merge109
merge109:
  %t359 = phi i64 [ %t358, %fixmerge112 ], [ 792, %else108 ]
  br label %merge94
merge94:
  %t360 = phi i64 [ %t333, %fixmerge97 ], [ %t359, %merge109 ]
  br label %merge79
merge79:
  %t361 = phi i64 [ %t308, %fixmerge82 ], [ %t360, %merge94 ]
  %t362 = or i64 %t361, %a1
  %t363 = and i64 %t362, 7
  %t364 = icmp eq i64 %t363, 0
  br i1 %t364, label %fixfast113, label %fixslow114
fixfast113:
  %t365 = icmp slt i64 %t361, %a1
  %t366 = select i1 %t365, i64 257, i64 1
  br label %fixmerge115
fixslow114:
  %t367 = call i64 @rt_lt(i64 %t361, i64 %a1)
  br label %fixmerge115
fixmerge115:
  %t368 = phi i64 [ %t366, %fixfast113 ], [ %t367, %fixslow114 ]
  %t369 = icmp ne i64 %t368, 1
  br i1 %t369, label %then116, label %else117
then116:
  ret i64 %t361
else117:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:%radix-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t374 = icmp eq i64 %argc, 5
  br i1 %t374, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok119:
  %t375 = or i64 %a1, %a2
  %t376 = and i64 %t375, 7
  %t377 = icmp eq i64 %t376, 0
  br i1 %t377, label %fixfast120, label %fixslow121
fixfast120:
  %t378 = icmp slt i64 %a1, %a2
  %t379 = select i1 %t378, i64 257, i64 1
  br label %fixmerge122
fixslow121:
  %t380 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge122
fixmerge122:
  %t381 = phi i64 [ %t379, %fixfast120 ], [ %t380, %fixslow121 ]
  %t382 = icmp ne i64 %t381, 1
  br i1 %t382, label %then123, label %else124
then123:
  %t383 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t384 = load i64, ptr @"emit.internal:%digit-in-radix"
  call void @rt_check_callable(i64 %t384)
  %t385 = and i64 %t384, -8
  %t386 = inttoptr i64 %t385 to ptr
  %t387 = load i64, ptr %t386
  %t388 = inttoptr i64 %t387 to ptr
  %t389 = call fastcc i64%t388(i64 %t384, i64 2, i64 %t383, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t390 = icmp ne i64 %t389, 1
  br i1 %t390, label %then125, label %else126
then125:
  %t391 = or i64 %a1, 8
  %t392 = and i64 %t391, 7
  %t393 = icmp eq i64 %t392, 0
  br i1 %t393, label %fixfast127, label %fixslow128
fixfast127:
  %t394 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t395 = extractvalue {i64, i1} %t394, 0
  %t396 = extractvalue {i64, i1} %t394, 1
  br i1 %t396, label %fixslow128, label %fixmerge129
fixslow128:
  %t397 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge129
fixmerge129:
  %t398 = phi i64 [ %t395, %fixfast127 ], [ %t397, %fixslow128 ]
  %t399 = or i64 %a4, %a3
  %t400 = and i64 %t399, 7
  %t401 = icmp eq i64 %t400, 0
  br i1 %t401, label %fixfast130, label %fixslow131
fixfast130:
  %t402 = ashr i64 %a4, 3
  %t403 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t402, i64 %a3)
  %t404 = extractvalue {i64, i1} %t403, 0
  %t405 = extractvalue {i64, i1} %t403, 1
  br i1 %t405, label %fixslow131, label %fixmerge132
fixslow131:
  %t406 = call i64 @rt_mul(i64 %a4, i64 %a3)
  br label %fixmerge132
fixmerge132:
  %t407 = phi i64 [ %t404, %fixfast130 ], [ %t406, %fixslow131 ]
  %t408 = or i64 %t407, %t389
  %t409 = and i64 %t408, 7
  %t410 = icmp eq i64 %t409, 0
  br i1 %t410, label %fixfast133, label %fixslow134
fixfast133:
  %t411 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t407, i64 %t389)
  %t412 = extractvalue {i64, i1} %t411, 0
  %t413 = extractvalue {i64, i1} %t411, 1
  br i1 %t413, label %fixslow134, label %fixmerge135
fixslow134:
  %t414 = call i64 @rt_sub(i64 %t407, i64 %t389)
  br label %fixmerge135
fixmerge135:
  %t415 = phi i64 [ %t412, %fixfast133 ], [ %t414, %fixslow134 ]
  %t416 = load i64, ptr @"emit.internal:%radix-digits"
  call void @rt_check_callable(i64 %t416)
  %t417 = and i64 %t416, -8
  %t418 = inttoptr i64 %t417 to ptr
  %t419 = load i64, ptr %t418
  %t420 = inttoptr i64 %t419 to ptr
  %t421 = musttail call fastcc i64 %t420(i64 %t416, i64 5, i64 %a0, i64 %t398, i64 %a2, i64 %a3, i64 %t415, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t421
else126:
  ret i64 1
else124:
  ret i64 %a4
}

define fastcc i64 @"emit.internal:code:%string->int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t426 = icmp eq i64 %argc, 2
  br i1 %t426, label %argok137, label %arityerr136
arityerr136:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok137:
  %t427 = call i64 @rt_string_length(i64 %a0)
  %t428 = or i64 %t427, 0
  %t429 = and i64 %t428, 7
  %t430 = icmp eq i64 %t429, 0
  br i1 %t430, label %fixfast138, label %fixslow139
fixfast138:
  %t431 = icmp eq i64 %t427, 0
  %t432 = select i1 %t431, i64 257, i64 1
  br label %fixmerge140
fixslow139:
  %t433 = call i64 @rt_num_eq(i64 %t427, i64 0)
  br label %fixmerge140
fixmerge140:
  %t434 = phi i64 [ %t432, %fixfast138 ], [ %t433, %fixslow139 ]
  %t435 = icmp ne i64 %t434, 1
  br i1 %t435, label %then141, label %else142
then141:
  ret i64 1
else142:
  %t436 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t437 = call i64 @rt_char_to_integer(i64 %t436)
  %t438 = or i64 %t437, 360
  %t439 = and i64 %t438, 7
  %t440 = icmp eq i64 %t439, 0
  br i1 %t440, label %fixfast143, label %fixslow144
fixfast143:
  %t441 = icmp eq i64 %t437, 360
  %t442 = select i1 %t441, i64 257, i64 1
  br label %fixmerge145
fixslow144:
  %t443 = call i64 @rt_num_eq(i64 %t437, i64 360)
  br label %fixmerge145
fixmerge145:
  %t444 = phi i64 [ %t442, %fixfast143 ], [ %t443, %fixslow144 ]
  %t445 = icmp ne i64 %t444, 1
  br i1 %t445, label %then146, label %else147
then146:
  %t446 = or i64 8, %t427
  %t447 = and i64 %t446, 7
  %t448 = icmp eq i64 %t447, 0
  br i1 %t448, label %fixfast148, label %fixslow149
fixfast148:
  %t449 = icmp slt i64 8, %t427
  %t450 = select i1 %t449, i64 257, i64 1
  br label %fixmerge150
fixslow149:
  %t451 = call i64 @rt_lt(i64 8, i64 %t427)
  br label %fixmerge150
fixmerge150:
  %t452 = phi i64 [ %t450, %fixfast148 ], [ %t451, %fixslow149 ]
  %t453 = icmp ne i64 %t452, 1
  br i1 %t453, label %then151, label %else152
then151:
  %t454 = load i64, ptr @"emit.internal:%radix-digits"
  call void @rt_check_callable(i64 %t454)
  %t455 = and i64 %t454, -8
  %t456 = inttoptr i64 %t455 to ptr
  %t457 = load i64, ptr %t456
  %t458 = inttoptr i64 %t457 to ptr
  %t459 = musttail call fastcc i64 %t458(i64 %t454, i64 5, i64 %a0, i64 8, i64 %t427, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t459
else152:
  ret i64 1
else147:
  %t460 = or i64 %t437, 344
  %t461 = and i64 %t460, 7
  %t462 = icmp eq i64 %t461, 0
  br i1 %t462, label %fixfast153, label %fixslow154
fixfast153:
  %t463 = icmp eq i64 %t437, 344
  %t464 = select i1 %t463, i64 257, i64 1
  br label %fixmerge155
fixslow154:
  %t465 = call i64 @rt_num_eq(i64 %t437, i64 344)
  br label %fixmerge155
fixmerge155:
  %t466 = phi i64 [ %t464, %fixfast153 ], [ %t465, %fixslow154 ]
  %t467 = icmp ne i64 %t466, 1
  br i1 %t467, label %then156, label %else157
then156:
  br label %merge158
else157:
  br label %merge158
merge158:
  %t468 = phi i64 [ 8, %then156 ], [ 0, %else157 ]
  %t469 = or i64 %t468, %t427
  %t470 = and i64 %t469, 7
  %t471 = icmp eq i64 %t470, 0
  br i1 %t471, label %fixfast159, label %fixslow160
fixfast159:
  %t472 = icmp slt i64 %t468, %t427
  %t473 = select i1 %t472, i64 257, i64 1
  br label %fixmerge161
fixslow160:
  %t474 = call i64 @rt_lt(i64 %t468, i64 %t427)
  br label %fixmerge161
fixmerge161:
  %t475 = phi i64 [ %t473, %fixfast159 ], [ %t474, %fixslow160 ]
  %t476 = icmp ne i64 %t475, 1
  br i1 %t476, label %then162, label %else163
then162:
  %t477 = load i64, ptr @"emit.internal:%radix-digits"
  call void @rt_check_callable(i64 %t477)
  %t478 = and i64 %t477, -8
  %t479 = inttoptr i64 %t478 to ptr
  %t480 = load i64, ptr %t479
  %t481 = inttoptr i64 %t480 to ptr
  %t482 = call fastcc i64%t481(i64 %t477, i64 5, i64 %a0, i64 %t468, i64 %t427, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t483 = icmp ne i64 %t482, 1
  br i1 %t483, label %then164, label %else165
then164:
  %t484 = or i64 0, %t482
  %t485 = and i64 %t484, 7
  %t486 = icmp eq i64 %t485, 0
  br i1 %t486, label %fixfast166, label %fixslow167
fixfast166:
  %t487 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t482)
  %t488 = extractvalue {i64, i1} %t487, 0
  %t489 = extractvalue {i64, i1} %t487, 1
  br i1 %t489, label %fixslow167, label %fixmerge168
fixslow167:
  %t490 = call i64 @rt_sub(i64 0, i64 %t482)
  br label %fixmerge168
fixmerge168:
  %t491 = phi i64 [ %t488, %fixfast166 ], [ %t490, %fixslow167 ]
  ret i64 %t491
else165:
  ret i64 1
else163:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_543"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t496 = icmp eq i64 %argc, 2
  br i1 %t496, label %argok170, label %arityerr169
arityerr169:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok170:
  %t497 = call i64 @rt_null_p(i64 %a0)
  %t498 = icmp ne i64 %t497, 1
  br i1 %t498, label %then171, label %else172
then171:
  %t499 = and i64 %self, -8
  %t500 = inttoptr i64 %t499 to ptr
  %t501 = getelementptr i64, ptr %t500, i64 1
  %t502 = load i64, ptr %t501
  ret i64 %t502
else172:
  %t503 = and i64 %self, -8
  %t504 = inttoptr i64 %t503 to ptr
  %t505 = getelementptr i64, ptr %t504, i64 1
  %t506 = load i64, ptr %t505
  %t507 = call i64 @rt_car(i64 %a0)
  %t508 = call i64 @rt_vector_set(i64 %t506, i64 %a1, i64 %t507)
  %t509 = call i64 @rt_cdr(i64 %a0)
  %t510 = or i64 %a1, 8
  %t511 = and i64 %t510, 7
  %t512 = icmp eq i64 %t511, 0
  br i1 %t512, label %fixfast173, label %fixslow174
fixfast173:
  %t513 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t514 = extractvalue {i64, i1} %t513, 0
  %t515 = extractvalue {i64, i1} %t513, 1
  br i1 %t515, label %fixslow174, label %fixmerge175
fixslow174:
  %t516 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge175
fixmerge175:
  %t517 = phi i64 [ %t514, %fixfast173 ], [ %t516, %fixslow174 ]
  %t518 = musttail call fastcc i64 @"emit.internal:code_543"(i64 %self, i64 2, i64 %t509, i64 %t517, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t518
}

define fastcc i64 @"emit.internal:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t519 = icmp eq i64 %argc, 1
  br i1 %t519, label %argok177, label %arityerr176
arityerr176:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok177:
  %t520 = load i64, ptr @"emit.internal:length"
  call void @rt_check_callable(i64 %t520)
  %t521 = and i64 %t520, -8
  %t522 = inttoptr i64 %t521 to ptr
  %t523 = load i64, ptr %t522
  %t524 = inttoptr i64 %t523 to ptr
  %t525 = call fastcc i64%t524(i64 %t520, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t526 = call i64 @rt_make_vector(i64 %t525, i64 0)
  %t527 = call ptr @rt_alloc_words(i64 3)
  %t528 = ptrtoint ptr %t527 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_543" to i64), ptr %t527
  %t529 = or i64 %t528, 4
  %t530 = getelementptr i64, ptr %t527, i64 1
  store i64 %t526, ptr %t530
  %t531 = getelementptr i64, ptr %t527, i64 2
  store i64 %t529, ptr %t531
  %t532 = musttail call fastcc i64 @"emit.internal:code_543"(i64 %t529, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t532
}

define fastcc i64 @"emit.internal:code_551"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t537 = icmp eq i64 %argc, 2
  br i1 %t537, label %argok179, label %arityerr178
arityerr178:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok179:
  %t538 = call i64 @rt_null_p(i64 %a0)
  %t539 = icmp ne i64 %t538, 1
  br i1 %t539, label %then180, label %else181
then180:
  %t540 = and i64 %self, -8
  %t541 = inttoptr i64 %t540 to ptr
  %t542 = getelementptr i64, ptr %t541, i64 1
  %t543 = load i64, ptr %t542
  ret i64 %t543
else181:
  %t544 = and i64 %self, -8
  %t545 = inttoptr i64 %t544 to ptr
  %t546 = getelementptr i64, ptr %t545, i64 1
  %t547 = load i64, ptr %t546
  %t548 = call i64 @rt_car(i64 %a0)
  %t549 = call i64 @rt_bytevector_u8_set(i64 %t547, i64 %a1, i64 %t548)
  %t550 = call i64 @rt_cdr(i64 %a0)
  %t551 = or i64 %a1, 8
  %t552 = and i64 %t551, 7
  %t553 = icmp eq i64 %t552, 0
  br i1 %t553, label %fixfast182, label %fixslow183
fixfast182:
  %t554 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t555 = extractvalue {i64, i1} %t554, 0
  %t556 = extractvalue {i64, i1} %t554, 1
  br i1 %t556, label %fixslow183, label %fixmerge184
fixslow183:
  %t557 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge184
fixmerge184:
  %t558 = phi i64 [ %t555, %fixfast182 ], [ %t557, %fixslow183 ]
  %t559 = musttail call fastcc i64 @"emit.internal:code_551"(i64 %self, i64 2, i64 %t550, i64 %t558, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t559
}

define fastcc i64 @"emit.internal:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t560 = icmp eq i64 %argc, 1
  br i1 %t560, label %argok186, label %arityerr185
arityerr185:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok186:
  %t561 = load i64, ptr @"emit.internal:length"
  call void @rt_check_callable(i64 %t561)
  %t562 = and i64 %t561, -8
  %t563 = inttoptr i64 %t562 to ptr
  %t564 = load i64, ptr %t563
  %t565 = inttoptr i64 %t564 to ptr
  %t566 = call fastcc i64%t565(i64 %t561, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t567 = call i64 @rt_make_bytevector(i64 %t566, i64 0)
  %t568 = call ptr @rt_alloc_words(i64 3)
  %t569 = ptrtoint ptr %t568 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_551" to i64), ptr %t568
  %t570 = or i64 %t569, 4
  %t571 = getelementptr i64, ptr %t568, i64 1
  store i64 %t567, ptr %t571
  %t572 = getelementptr i64, ptr %t568, i64 2
  store i64 %t570, ptr %t572
  %t573 = musttail call fastcc i64 @"emit.internal:code_551"(i64 %t570, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t573
}

define fastcc i64 @"emit.internal:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t578 = icmp eq i64 %argc, 1
  br i1 %t578, label %argok188, label %arityerr187
arityerr187:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok188:
  %t579 = call i64 @rt_char_to_integer(i64 %a0)
  %t580 = or i64 %t579, 256
  %t581 = and i64 %t580, 7
  %t582 = icmp eq i64 %t581, 0
  br i1 %t582, label %fixfast189, label %fixslow190
fixfast189:
  %t583 = icmp eq i64 %t579, 256
  %t584 = select i1 %t583, i64 257, i64 1
  br label %fixmerge191
fixslow190:
  %t585 = call i64 @rt_num_eq(i64 %t579, i64 256)
  br label %fixmerge191
fixmerge191:
  %t586 = phi i64 [ %t584, %fixfast189 ], [ %t585, %fixslow190 ]
  %t587 = icmp ne i64 %t586, 1
  br i1 %t587, label %then192, label %else193
then192:
  ret i64 %t586
else193:
  %t588 = or i64 %t579, 72
  %t589 = and i64 %t588, 7
  %t590 = icmp eq i64 %t589, 0
  br i1 %t590, label %fixfast194, label %fixslow195
fixfast194:
  %t591 = icmp eq i64 %t579, 72
  %t592 = select i1 %t591, i64 257, i64 1
  br label %fixmerge196
fixslow195:
  %t593 = call i64 @rt_num_eq(i64 %t579, i64 72)
  br label %fixmerge196
fixmerge196:
  %t594 = phi i64 [ %t592, %fixfast194 ], [ %t593, %fixslow195 ]
  %t595 = icmp ne i64 %t594, 1
  br i1 %t595, label %then197, label %else198
then197:
  ret i64 %t594
else198:
  %t596 = or i64 %t579, 80
  %t597 = and i64 %t596, 7
  %t598 = icmp eq i64 %t597, 0
  br i1 %t598, label %fixfast199, label %fixslow200
fixfast199:
  %t599 = icmp eq i64 %t579, 80
  %t600 = select i1 %t599, i64 257, i64 1
  br label %fixmerge201
fixslow200:
  %t601 = call i64 @rt_num_eq(i64 %t579, i64 80)
  br label %fixmerge201
fixmerge201:
  %t602 = phi i64 [ %t600, %fixfast199 ], [ %t601, %fixslow200 ]
  %t603 = icmp ne i64 %t602, 1
  br i1 %t603, label %then202, label %else203
then202:
  ret i64 %t602
else203:
  %t604 = or i64 %t579, 104
  %t605 = and i64 %t604, 7
  %t606 = icmp eq i64 %t605, 0
  br i1 %t606, label %fixfast204, label %fixslow205
fixfast204:
  %t607 = icmp eq i64 %t579, 104
  %t608 = select i1 %t607, i64 257, i64 1
  br label %fixmerge206
fixslow205:
  %t609 = call i64 @rt_num_eq(i64 %t579, i64 104)
  br label %fixmerge206
fixmerge206:
  %t610 = phi i64 [ %t608, %fixfast204 ], [ %t609, %fixslow205 ]
  ret i64 %t610
}

define fastcc i64 @"emit.internal:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t615 = icmp eq i64 %argc, 1
  br i1 %t615, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok208:
  %t616 = call i64 @rt_char_to_integer(i64 %a0)
  %t617 = or i64 376, %t616
  %t618 = and i64 %t617, 7
  %t619 = icmp eq i64 %t618, 0
  br i1 %t619, label %fixfast209, label %fixslow210
fixfast209:
  %t620 = icmp slt i64 376, %t616
  %t621 = select i1 %t620, i64 257, i64 1
  br label %fixmerge211
fixslow210:
  %t622 = call i64 @rt_lt(i64 376, i64 %t616)
  br label %fixmerge211
fixmerge211:
  %t623 = phi i64 [ %t621, %fixfast209 ], [ %t622, %fixslow210 ]
  %t624 = icmp ne i64 %t623, 1
  br i1 %t624, label %then212, label %else213
then212:
  %t625 = or i64 %t616, 464
  %t626 = and i64 %t625, 7
  %t627 = icmp eq i64 %t626, 0
  br i1 %t627, label %fixfast214, label %fixslow215
fixfast214:
  %t628 = icmp slt i64 %t616, 464
  %t629 = select i1 %t628, i64 257, i64 1
  br label %fixmerge216
fixslow215:
  %t630 = call i64 @rt_lt(i64 %t616, i64 464)
  br label %fixmerge216
fixmerge216:
  %t631 = phi i64 [ %t629, %fixfast214 ], [ %t630, %fixslow215 ]
  ret i64 %t631
else213:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t636 = icmp eq i64 %argc, 1
  br i1 %t636, label %argok218, label %arityerr217
arityerr217:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok218:
  %t637 = call i64 @rt_char_to_integer(i64 %a0)
  %t638 = load i64, ptr @"emit.internal:rd-ws?"
  call void @rt_check_callable(i64 %t638)
  %t639 = and i64 %t638, -8
  %t640 = inttoptr i64 %t639 to ptr
  %t641 = load i64, ptr %t640
  %t642 = inttoptr i64 %t641 to ptr
  %t643 = call fastcc i64%t642(i64 %t638, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t644 = icmp ne i64 %t643, 1
  br i1 %t644, label %then219, label %else220
then219:
  ret i64 %t643
else220:
  %t645 = or i64 %t637, 320
  %t646 = and i64 %t645, 7
  %t647 = icmp eq i64 %t646, 0
  br i1 %t647, label %fixfast221, label %fixslow222
fixfast221:
  %t648 = icmp eq i64 %t637, 320
  %t649 = select i1 %t648, i64 257, i64 1
  br label %fixmerge223
fixslow222:
  %t650 = call i64 @rt_num_eq(i64 %t637, i64 320)
  br label %fixmerge223
fixmerge223:
  %t651 = phi i64 [ %t649, %fixfast221 ], [ %t650, %fixslow222 ]
  %t652 = icmp ne i64 %t651, 1
  br i1 %t652, label %then224, label %else225
then224:
  ret i64 %t651
else225:
  %t653 = or i64 %t637, 328
  %t654 = and i64 %t653, 7
  %t655 = icmp eq i64 %t654, 0
  br i1 %t655, label %fixfast226, label %fixslow227
fixfast226:
  %t656 = icmp eq i64 %t637, 328
  %t657 = select i1 %t656, i64 257, i64 1
  br label %fixmerge228
fixslow227:
  %t658 = call i64 @rt_num_eq(i64 %t637, i64 328)
  br label %fixmerge228
fixmerge228:
  %t659 = phi i64 [ %t657, %fixfast226 ], [ %t658, %fixslow227 ]
  %t660 = icmp ne i64 %t659, 1
  br i1 %t660, label %then229, label %else230
then229:
  ret i64 %t659
else230:
  %t661 = or i64 %t637, 728
  %t662 = and i64 %t661, 7
  %t663 = icmp eq i64 %t662, 0
  br i1 %t663, label %fixfast231, label %fixslow232
fixfast231:
  %t664 = icmp eq i64 %t637, 728
  %t665 = select i1 %t664, i64 257, i64 1
  br label %fixmerge233
fixslow232:
  %t666 = call i64 @rt_num_eq(i64 %t637, i64 728)
  br label %fixmerge233
fixmerge233:
  %t667 = phi i64 [ %t665, %fixfast231 ], [ %t666, %fixslow232 ]
  %t668 = icmp ne i64 %t667, 1
  br i1 %t668, label %then234, label %else235
then234:
  ret i64 %t667
else235:
  %t669 = or i64 %t637, 744
  %t670 = and i64 %t669, 7
  %t671 = icmp eq i64 %t670, 0
  br i1 %t671, label %fixfast236, label %fixslow237
fixfast236:
  %t672 = icmp eq i64 %t637, 744
  %t673 = select i1 %t672, i64 257, i64 1
  br label %fixmerge238
fixslow237:
  %t674 = call i64 @rt_num_eq(i64 %t637, i64 744)
  br label %fixmerge238
fixmerge238:
  %t675 = phi i64 [ %t673, %fixfast236 ], [ %t674, %fixslow237 ]
  %t676 = icmp ne i64 %t675, 1
  br i1 %t676, label %then239, label %else240
then239:
  ret i64 %t675
else240:
  %t677 = or i64 %t637, 272
  %t678 = and i64 %t677, 7
  %t679 = icmp eq i64 %t678, 0
  br i1 %t679, label %fixfast241, label %fixslow242
fixfast241:
  %t680 = icmp eq i64 %t637, 272
  %t681 = select i1 %t680, i64 257, i64 1
  br label %fixmerge243
fixslow242:
  %t682 = call i64 @rt_num_eq(i64 %t637, i64 272)
  br label %fixmerge243
fixmerge243:
  %t683 = phi i64 [ %t681, %fixfast241 ], [ %t682, %fixslow242 ]
  %t684 = icmp ne i64 %t683, 1
  br i1 %t684, label %then244, label %else245
then244:
  ret i64 %t683
else245:
  %t685 = or i64 %t637, 472
  %t686 = and i64 %t685, 7
  %t687 = icmp eq i64 %t686, 0
  br i1 %t687, label %fixfast246, label %fixslow247
fixfast246:
  %t688 = icmp eq i64 %t637, 472
  %t689 = select i1 %t688, i64 257, i64 1
  br label %fixmerge248
fixslow247:
  %t690 = call i64 @rt_num_eq(i64 %t637, i64 472)
  br label %fixmerge248
fixmerge248:
  %t691 = phi i64 [ %t689, %fixfast246 ], [ %t690, %fixslow247 ]
  ret i64 %t691
}

define fastcc i64 @"emit.internal:code:rd-fail-code"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t696 = icmp eq i64 %argc, 1
  br i1 %t696, label %argok250, label %arityerr249
arityerr249:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok250:
  %t697 = or i64 -24, %a0
  %t698 = and i64 %t697, 7
  %t699 = icmp eq i64 %t698, 0
  br i1 %t699, label %fixfast251, label %fixslow252
fixfast251:
  %t700 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 -24, i64 %a0)
  %t701 = extractvalue {i64, i1} %t700, 0
  %t702 = extractvalue {i64, i1} %t700, 1
  br i1 %t702, label %fixslow252, label %fixmerge253
fixslow252:
  %t703 = call i64 @rt_sub(i64 -24, i64 %a0)
  br label %fixmerge253
fixmerge253:
  %t704 = phi i64 [ %t701, %fixfast251 ], [ %t703, %fixslow252 ]
  ret i64 %t704
}

define fastcc i64 @"emit.internal:code:rd-fail?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t709 = icmp eq i64 %argc, 1
  br i1 %t709, label %argok255, label %arityerr254
arityerr254:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok255:
  %t710 = or i64 %a0, 0
  %t711 = and i64 %t710, 7
  %t712 = icmp eq i64 %t711, 0
  br i1 %t712, label %fixfast256, label %fixslow257
fixfast256:
  %t713 = icmp slt i64 %a0, 0
  %t714 = select i1 %t713, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t715 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge258
fixmerge258:
  %t716 = phi i64 [ %t714, %fixfast256 ], [ %t715, %fixslow257 ]
  ret i64 %t716
}

define fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t721 = icmp eq i64 %argc, 1
  br i1 %t721, label %argok260, label %arityerr259
arityerr259:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok260:
  %t722 = or i64 0, %a0
  %t723 = and i64 %t722, 7
  %t724 = icmp eq i64 %t723, 0
  br i1 %t724, label %fixfast261, label %fixslow262
fixfast261:
  %t725 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t726 = extractvalue {i64, i1} %t725, 0
  %t727 = extractvalue {i64, i1} %t725, 1
  br i1 %t727, label %fixslow262, label %fixmerge263
fixslow262:
  %t728 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge263
fixmerge263:
  %t729 = phi i64 [ %t726, %fixfast261 ], [ %t728, %fixslow262 ]
  %t730 = or i64 %t729, 24
  %t731 = and i64 %t730, 7
  %t732 = icmp eq i64 %t731, 0
  br i1 %t732, label %fixfast264, label %fixslow265
fixfast264:
  %t733 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t729, i64 24)
  %t734 = extractvalue {i64, i1} %t733, 0
  %t735 = extractvalue {i64, i1} %t733, 1
  br i1 %t735, label %fixslow265, label %fixmerge266
fixslow265:
  %t736 = call i64 @rt_sub(i64 %t729, i64 24)
  br label %fixmerge266
fixmerge266:
  %t737 = phi i64 [ %t734, %fixfast264 ], [ %t736, %fixslow265 ]
  ret i64 %t737
}

define fastcc i64 @"emit.internal:code:rd-fail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t742 = icmp eq i64 %argc, 2
  br i1 %t742, label %argok268, label %arityerr267
arityerr267:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok268:
  %t743 = load i64, ptr @"emit.internal:rd-fail-code"
  call void @rt_check_callable(i64 %t743)
  %t744 = and i64 %t743, -8
  %t745 = inttoptr i64 %t744 to ptr
  %t746 = load i64, ptr %t745
  %t747 = inttoptr i64 %t746 to ptr
  %t748 = call fastcc i64%t747(i64 %t743, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t749 = call i64 @rt_cons(i64 %a0, i64 %t748)
  ret i64 %t749
}

define fastcc i64 @"emit.internal:code:rd-state"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t754 = icmp eq i64 %argc, 1
  br i1 %t754, label %argok270, label %arityerr269
arityerr269:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok270:
  %t755 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t755)
  %t756 = and i64 %t755, -8
  %t757 = inttoptr i64 %t756 to ptr
  %t758 = load i64, ptr %t757
  %t759 = inttoptr i64 %t758 to ptr
  %t760 = call fastcc i64%t759(i64 %t755, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t761 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t761)
  %t762 = and i64 %t761, -8
  %t763 = inttoptr i64 %t762 to ptr
  %t764 = load i64, ptr %t763
  %t765 = inttoptr i64 %t764 to ptr
  %t766 = call fastcc i64%t765(i64 %t761, i64 1, i64 %t760, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t767 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t767)
  %t768 = and i64 %t767, -8
  %t769 = inttoptr i64 %t768 to ptr
  %t770 = load i64, ptr %t769
  %t771 = inttoptr i64 %t770 to ptr
  %t772 = call fastcc i64%t771(i64 %t767, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t773 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t773)
  %t774 = and i64 %t773, -8
  %t775 = inttoptr i64 %t774 to ptr
  %t776 = load i64, ptr %t775
  %t777 = inttoptr i64 %t776 to ptr
  %t778 = call fastcc i64%t777(i64 %t773, i64 1, i64 %t772, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t779 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t779)
  %t780 = and i64 %t779, -8
  %t781 = inttoptr i64 %t780 to ptr
  %t782 = load i64, ptr %t781
  %t783 = inttoptr i64 %t782 to ptr
  %t784 = call fastcc i64%t783(i64 %t779, i64 3, i64 %t766, i64 2, i64 %t778, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t785 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t785)
  %t786 = and i64 %t785, -8
  %t787 = inttoptr i64 %t786 to ptr
  %t788 = load i64, ptr %t787
  %t789 = inttoptr i64 %t788 to ptr
  %t790 = musttail call fastcc i64 %t789(i64 %t785, i64 1, i64 %t784, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t790
}

define fastcc i64 @"emit.internal:code:rd-state-from-cell"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t795 = icmp eq i64 %argc, 1
  br i1 %t795, label %argok272, label %arityerr271
arityerr271:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok272:
  %t796 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t796)
  %t797 = and i64 %t796, -8
  %t798 = inttoptr i64 %t797 to ptr
  %t799 = load i64, ptr %t798
  %t800 = inttoptr i64 %t799 to ptr
  %t801 = call fastcc i64%t800(i64 %t796, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t802 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t802)
  %t803 = and i64 %t802, -8
  %t804 = inttoptr i64 %t803 to ptr
  %t805 = load i64, ptr %t804
  %t806 = inttoptr i64 %t805 to ptr
  %t807 = call fastcc i64%t806(i64 %t802, i64 1, i64 %t801, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t808 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t808)
  %t809 = and i64 %t808, -8
  %t810 = inttoptr i64 %t809 to ptr
  %t811 = load i64, ptr %t810
  %t812 = inttoptr i64 %t811 to ptr
  %t813 = call fastcc i64%t812(i64 %t808, i64 3, i64 %a0, i64 2, i64 %t807, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t814 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t814)
  %t815 = and i64 %t814, -8
  %t816 = inttoptr i64 %t815 to ptr
  %t817 = load i64, ptr %t816
  %t818 = inttoptr i64 %t817 to ptr
  %t819 = musttail call fastcc i64 %t818(i64 %t814, i64 1, i64 %t813, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t819
}

define fastcc i64 @"emit.internal:code:rd-state-child"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t824 = icmp eq i64 %argc, 1
  br i1 %t824, label %argok274, label %arityerr273
arityerr273:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok274:
  %t825 = call i64 @rt_vector_ref(i64 %a0, i64 0)
  %t826 = load i64, ptr @"emit.internal:rd-state-from-cell"
  call void @rt_check_callable(i64 %t826)
  %t827 = and i64 %t826, -8
  %t828 = inttoptr i64 %t827 to ptr
  %t829 = load i64, ptr %t828
  %t830 = inttoptr i64 %t829 to ptr
  %t831 = musttail call fastcc i64 %t830(i64 %t826, i64 1, i64 %t825, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t831
}

define fastcc i64 @"emit.internal:code:rd-fold?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t836 = icmp eq i64 %argc, 1
  br i1 %t836, label %argok276, label %arityerr275
arityerr275:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok276:
  %t837 = call i64 @rt_vector_ref(i64 %a0, i64 0)
  %t838 = call i64 @rt_vector_ref(i64 %t837, i64 0)
  ret i64 %t838
}

define fastcc i64 @"emit.internal:code:rd-set-fold!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t843 = icmp eq i64 %argc, 2
  br i1 %t843, label %argok278, label %arityerr277
arityerr277:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok278:
  %t844 = call i64 @rt_vector_ref(i64 %a0, i64 0)
  %t845 = call i64 @rt_vector_set(i64 %t844, i64 0, i64 %a1)
  ret i64 %t845
}

define fastcc i64 @"emit.internal:code_631"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t850 = icmp eq i64 %argc, 1
  br i1 %t850, label %argok280, label %arityerr279
arityerr279:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok280:
  %t851 = and i64 %self, -8
  %t852 = inttoptr i64 %t851 to ptr
  %t853 = getelementptr i64, ptr %t852, i64 1
  %t854 = load i64, ptr %t853
  %t855 = or i64 %a0, %t854
  %t856 = and i64 %t855, 7
  %t857 = icmp eq i64 %t856, 0
  br i1 %t857, label %fixfast281, label %fixslow282
fixfast281:
  %t858 = icmp eq i64 %a0, %t854
  %t859 = select i1 %t858, i64 257, i64 1
  br label %fixmerge283
fixslow282:
  %t860 = call i64 @rt_num_eq(i64 %a0, i64 %t854)
  br label %fixmerge283
fixmerge283:
  %t861 = phi i64 [ %t859, %fixfast281 ], [ %t860, %fixslow282 ]
  %t862 = icmp ne i64 %t861, 1
  br i1 %t862, label %then284, label %else285
then284:
  ret i64 257
else285:
  %t863 = and i64 %self, -8
  %t864 = inttoptr i64 %t863 to ptr
  %t865 = getelementptr i64, ptr %t864, i64 2
  %t866 = load i64, ptr %t865
  %t867 = and i64 %self, -8
  %t868 = inttoptr i64 %t867 to ptr
  %t869 = getelementptr i64, ptr %t868, i64 3
  %t870 = load i64, ptr %t869
  %t871 = or i64 %t870, %a0
  %t872 = and i64 %t871, 7
  %t873 = icmp eq i64 %t872, 0
  br i1 %t873, label %fixfast286, label %fixslow287
fixfast286:
  %t874 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t870, i64 %a0)
  %t875 = extractvalue {i64, i1} %t874, 0
  %t876 = extractvalue {i64, i1} %t874, 1
  br i1 %t876, label %fixslow287, label %fixmerge288
fixslow287:
  %t877 = call i64 @rt_add(i64 %t870, i64 %a0)
  br label %fixmerge288
fixmerge288:
  %t878 = phi i64 [ %t875, %fixfast286 ], [ %t877, %fixslow287 ]
  %t879 = call i64 @rt_string_ref(i64 %t866, i64 %t878)
  %t880 = call i64 @rt_char_to_integer(i64 %t879)
  %t881 = and i64 %self, -8
  %t882 = inttoptr i64 %t881 to ptr
  %t883 = getelementptr i64, ptr %t882, i64 4
  %t884 = load i64, ptr %t883
  %t885 = call i64 @rt_string_ref(i64 %t884, i64 %a0)
  %t886 = call i64 @rt_char_to_integer(i64 %t885)
  %t887 = or i64 %t880, %t886
  %t888 = and i64 %t887, 7
  %t889 = icmp eq i64 %t888, 0
  br i1 %t889, label %fixfast289, label %fixslow290
fixfast289:
  %t890 = icmp eq i64 %t880, %t886
  %t891 = select i1 %t890, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t892 = call i64 @rt_num_eq(i64 %t880, i64 %t886)
  br label %fixmerge291
fixmerge291:
  %t893 = phi i64 [ %t891, %fixfast289 ], [ %t892, %fixslow290 ]
  %t894 = icmp ne i64 %t893, 1
  br i1 %t894, label %then292, label %else293
then292:
  %t895 = or i64 %a0, 8
  %t896 = and i64 %t895, 7
  %t897 = icmp eq i64 %t896, 0
  br i1 %t897, label %fixfast294, label %fixslow295
fixfast294:
  %t898 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t899 = extractvalue {i64, i1} %t898, 0
  %t900 = extractvalue {i64, i1} %t898, 1
  br i1 %t900, label %fixslow295, label %fixmerge296
fixslow295:
  %t901 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge296
fixmerge296:
  %t902 = phi i64 [ %t899, %fixfast294 ], [ %t901, %fixslow295 ]
  %t903 = musttail call fastcc i64 @"emit.internal:code_631"(i64 %self, i64 1, i64 %t902, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t903
else293:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-match-at?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t904 = icmp eq i64 %argc, 4
  br i1 %t904, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok298:
  %t905 = call i64 @rt_string_length(i64 %a3)
  %t906 = or i64 %a2, %t905
  %t907 = and i64 %t906, 7
  %t908 = icmp eq i64 %t907, 0
  br i1 %t908, label %fixfast299, label %fixslow300
fixfast299:
  %t909 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 %t905)
  %t910 = extractvalue {i64, i1} %t909, 0
  %t911 = extractvalue {i64, i1} %t909, 1
  br i1 %t911, label %fixslow300, label %fixmerge301
fixslow300:
  %t912 = call i64 @rt_add(i64 %a2, i64 %t905)
  br label %fixmerge301
fixmerge301:
  %t913 = phi i64 [ %t910, %fixfast299 ], [ %t912, %fixslow300 ]
  %t914 = or i64 %t913, %a1
  %t915 = and i64 %t914, 7
  %t916 = icmp eq i64 %t915, 0
  br i1 %t916, label %fixfast302, label %fixslow303
fixfast302:
  %t917 = icmp slt i64 %t913, %a1
  %t918 = select i1 %t917, i64 257, i64 1
  br label %fixmerge304
fixslow303:
  %t919 = call i64 @rt_lt(i64 %t913, i64 %a1)
  br label %fixmerge304
fixmerge304:
  %t920 = phi i64 [ %t918, %fixfast302 ], [ %t919, %fixslow303 ]
  %t921 = icmp ne i64 %t920, 1
  br i1 %t921, label %then305, label %else306
then305:
  br label %merge307
else306:
  %t922 = or i64 %t913, %a1
  %t923 = and i64 %t922, 7
  %t924 = icmp eq i64 %t923, 0
  br i1 %t924, label %fixfast308, label %fixslow309
fixfast308:
  %t925 = icmp eq i64 %t913, %a1
  %t926 = select i1 %t925, i64 257, i64 1
  br label %fixmerge310
fixslow309:
  %t927 = call i64 @rt_num_eq(i64 %t913, i64 %a1)
  br label %fixmerge310
fixmerge310:
  %t928 = phi i64 [ %t926, %fixfast308 ], [ %t927, %fixslow309 ]
  br label %merge307
merge307:
  %t929 = phi i64 [ 257, %then305 ], [ %t928, %fixmerge310 ]
  %t930 = icmp ne i64 %t929, 1
  br i1 %t930, label %then311, label %else312
then311:
  %t931 = call ptr @rt_alloc_words(i64 6)
  %t932 = ptrtoint ptr %t931 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_631" to i64), ptr %t931
  %t933 = or i64 %t932, 4
  %t934 = getelementptr i64, ptr %t931, i64 1
  store i64 %t905, ptr %t934
  %t935 = getelementptr i64, ptr %t931, i64 2
  store i64 %a0, ptr %t935
  %t936 = getelementptr i64, ptr %t931, i64 3
  store i64 %a2, ptr %t936
  %t937 = getelementptr i64, ptr %t931, i64 4
  store i64 %a3, ptr %t937
  %t938 = getelementptr i64, ptr %t931, i64 5
  store i64 %t933, ptr %t938
  %t939 = musttail call fastcc i64 @"emit.internal:code_631"(i64 %t933, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t939
else312:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-directive-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t944 = icmp eq i64 %argc, 4
  br i1 %t944, label %argok314, label %arityerr313
arityerr313:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok314:
  %t945 = call i64 @rt_string_length(i64 %a3)
  %t946 = or i64 %a2, %t945
  %t947 = and i64 %t946, 7
  %t948 = icmp eq i64 %t947, 0
  br i1 %t948, label %fixfast315, label %fixslow316
fixfast315:
  %t949 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 %t945)
  %t950 = extractvalue {i64, i1} %t949, 0
  %t951 = extractvalue {i64, i1} %t949, 1
  br i1 %t951, label %fixslow316, label %fixmerge317
fixslow316:
  %t952 = call i64 @rt_add(i64 %a2, i64 %t945)
  br label %fixmerge317
fixmerge317:
  %t953 = phi i64 [ %t950, %fixfast315 ], [ %t952, %fixslow316 ]
  %t954 = load i64, ptr @"emit.internal:rd-match-at?"
  call void @rt_check_callable(i64 %t954)
  %t955 = and i64 %t954, -8
  %t956 = inttoptr i64 %t955 to ptr
  %t957 = load i64, ptr %t956
  %t958 = inttoptr i64 %t957 to ptr
  %t959 = call fastcc i64%t958(i64 %t954, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t960 = icmp ne i64 %t959, 1
  br i1 %t960, label %then318, label %else319
then318:
  %t961 = or i64 %t953, %a1
  %t962 = and i64 %t961, 7
  %t963 = icmp eq i64 %t962, 0
  br i1 %t963, label %fixfast320, label %fixslow321
fixfast320:
  %t964 = icmp eq i64 %t953, %a1
  %t965 = select i1 %t964, i64 257, i64 1
  br label %fixmerge322
fixslow321:
  %t966 = call i64 @rt_num_eq(i64 %t953, i64 %a1)
  br label %fixmerge322
fixmerge322:
  %t967 = phi i64 [ %t965, %fixfast320 ], [ %t966, %fixslow321 ]
  %t968 = icmp ne i64 %t967, 1
  br i1 %t968, label %then323, label %else324
then323:
  br label %merge325
else324:
  %t969 = call i64 @rt_string_ref(i64 %a0, i64 %t953)
  %t970 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t970)
  %t971 = and i64 %t970, -8
  %t972 = inttoptr i64 %t971 to ptr
  %t973 = load i64, ptr %t972
  %t974 = inttoptr i64 %t973 to ptr
  %t975 = call fastcc i64%t974(i64 %t970, i64 1, i64 %t969, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge325
merge325:
  %t976 = phi i64 [ %t967, %then323 ], [ %t975, %else324 ]
  %t977 = icmp ne i64 %t976, 1
  br i1 %t977, label %then326, label %else327
then326:
  ret i64 %t953
else327:
  ret i64 1
else319:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t982 = icmp eq i64 %argc, 3
  br i1 %t982, label %argok329, label %arityerr328
arityerr328:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok329:
  %t983 = or i64 %a2, %a1
  %t984 = and i64 %t983, 7
  %t985 = icmp eq i64 %t984, 0
  br i1 %t985, label %fixfast330, label %fixslow331
fixfast330:
  %t986 = icmp slt i64 %a2, %a1
  %t987 = select i1 %t986, i64 257, i64 1
  br label %fixmerge332
fixslow331:
  %t988 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge332
fixmerge332:
  %t989 = phi i64 [ %t987, %fixfast330 ], [ %t988, %fixslow331 ]
  %t990 = icmp ne i64 %t989, 1
  br i1 %t990, label %then333, label %else334
then333:
  %t991 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t992 = call i64 @rt_char_to_integer(i64 %t991)
  %t993 = or i64 %t992, 80
  %t994 = and i64 %t993, 7
  %t995 = icmp eq i64 %t994, 0
  br i1 %t995, label %fixfast335, label %fixslow336
fixfast335:
  %t996 = icmp eq i64 %t992, 80
  %t997 = select i1 %t996, i64 257, i64 1
  br label %fixmerge337
fixslow336:
  %t998 = call i64 @rt_num_eq(i64 %t992, i64 80)
  br label %fixmerge337
fixmerge337:
  %t999 = phi i64 [ %t997, %fixfast335 ], [ %t998, %fixslow336 ]
  %t1000 = icmp ne i64 %t999, 1
  br i1 %t1000, label %then338, label %else339
then338:
  %t1001 = or i64 %a2, 8
  %t1002 = and i64 %t1001, 7
  %t1003 = icmp eq i64 %t1002, 0
  br i1 %t1003, label %fixfast340, label %fixslow341
fixfast340:
  %t1004 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1005 = extractvalue {i64, i1} %t1004, 0
  %t1006 = extractvalue {i64, i1} %t1004, 1
  br i1 %t1006, label %fixslow341, label %fixmerge342
fixslow341:
  %t1007 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge342
fixmerge342:
  %t1008 = phi i64 [ %t1005, %fixfast340 ], [ %t1007, %fixslow341 ]
  ret i64 %t1008
else339:
  %t1009 = or i64 %a2, 8
  %t1010 = and i64 %t1009, 7
  %t1011 = icmp eq i64 %t1010, 0
  br i1 %t1011, label %fixfast343, label %fixslow344
fixfast343:
  %t1012 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1013 = extractvalue {i64, i1} %t1012, 0
  %t1014 = extractvalue {i64, i1} %t1012, 1
  br i1 %t1014, label %fixslow344, label %fixmerge345
fixslow344:
  %t1015 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge345
fixmerge345:
  %t1016 = phi i64 [ %t1013, %fixfast343 ], [ %t1015, %fixslow344 ]
  %t1017 = load i64, ptr @"emit.internal:rd-skip-line"
  call void @rt_check_callable(i64 %t1017)
  %t1018 = and i64 %t1017, -8
  %t1019 = inttoptr i64 %t1018 to ptr
  %t1020 = load i64, ptr %t1019
  %t1021 = inttoptr i64 %t1020 to ptr
  %t1022 = musttail call fastcc i64 %t1021(i64 %t1017, i64 3, i64 %a0, i64 %a1, i64 %t1016, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1022
else334:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-block-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1027 = icmp eq i64 %argc, 3
  br i1 %t1027, label %argok347, label %arityerr346
arityerr346:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok347:
  %t1028 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1029 = call i64 @rt_char_to_integer(i64 %t1028)
  %t1030 = or i64 %t1029, 280
  %t1031 = and i64 %t1030, 7
  %t1032 = icmp eq i64 %t1031, 0
  br i1 %t1032, label %fixfast348, label %fixslow349
fixfast348:
  %t1033 = icmp eq i64 %t1029, 280
  %t1034 = select i1 %t1033, i64 257, i64 1
  br label %fixmerge350
fixslow349:
  %t1035 = call i64 @rt_num_eq(i64 %t1029, i64 280)
  br label %fixmerge350
fixmerge350:
  %t1036 = phi i64 [ %t1034, %fixfast348 ], [ %t1035, %fixslow349 ]
  %t1037 = icmp ne i64 %t1036, 1
  br i1 %t1037, label %then351, label %else352
then351:
  %t1038 = or i64 %a2, 8
  %t1039 = and i64 %t1038, 7
  %t1040 = icmp eq i64 %t1039, 0
  br i1 %t1040, label %fixfast353, label %fixslow354
fixfast353:
  %t1041 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1042 = extractvalue {i64, i1} %t1041, 0
  %t1043 = extractvalue {i64, i1} %t1041, 1
  br i1 %t1043, label %fixslow354, label %fixmerge355
fixslow354:
  %t1044 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge355
fixmerge355:
  %t1045 = phi i64 [ %t1042, %fixfast353 ], [ %t1044, %fixslow354 ]
  %t1046 = or i64 %t1045, %a1
  %t1047 = and i64 %t1046, 7
  %t1048 = icmp eq i64 %t1047, 0
  br i1 %t1048, label %fixfast356, label %fixslow357
fixfast356:
  %t1049 = icmp slt i64 %t1045, %a1
  %t1050 = select i1 %t1049, i64 257, i64 1
  br label %fixmerge358
fixslow357:
  %t1051 = call i64 @rt_lt(i64 %t1045, i64 %a1)
  br label %fixmerge358
fixmerge358:
  %t1052 = phi i64 [ %t1050, %fixfast356 ], [ %t1051, %fixslow357 ]
  %t1053 = icmp ne i64 %t1052, 1
  br i1 %t1053, label %then359, label %else360
then359:
  %t1054 = or i64 %a2, 8
  %t1055 = and i64 %t1054, 7
  %t1056 = icmp eq i64 %t1055, 0
  br i1 %t1056, label %fixfast361, label %fixslow362
fixfast361:
  %t1057 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1058 = extractvalue {i64, i1} %t1057, 0
  %t1059 = extractvalue {i64, i1} %t1057, 1
  br i1 %t1059, label %fixslow362, label %fixmerge363
fixslow362:
  %t1060 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge363
fixmerge363:
  %t1061 = phi i64 [ %t1058, %fixfast361 ], [ %t1060, %fixslow362 ]
  %t1062 = call i64 @rt_string_ref(i64 %a0, i64 %t1061)
  %t1063 = call i64 @rt_char_to_integer(i64 %t1062)
  %t1064 = or i64 %t1063, 992
  %t1065 = and i64 %t1064, 7
  %t1066 = icmp eq i64 %t1065, 0
  br i1 %t1066, label %fixfast364, label %fixslow365
fixfast364:
  %t1067 = icmp eq i64 %t1063, 992
  %t1068 = select i1 %t1067, i64 257, i64 1
  br label %fixmerge366
fixslow365:
  %t1069 = call i64 @rt_num_eq(i64 %t1063, i64 992)
  br label %fixmerge366
fixmerge366:
  %t1070 = phi i64 [ %t1068, %fixfast364 ], [ %t1069, %fixslow365 ]
  ret i64 %t1070
else360:
  ret i64 1
else352:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-skip-block"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1075 = icmp eq i64 %argc, 5
  br i1 %t1075, label %argok368, label %arityerr367
arityerr367:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok368:
  %t1076 = or i64 %a2, 8
  %t1077 = and i64 %t1076, 7
  %t1078 = icmp eq i64 %t1077, 0
  br i1 %t1078, label %fixfast369, label %fixslow370
fixfast369:
  %t1079 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1080 = extractvalue {i64, i1} %t1079, 0
  %t1081 = extractvalue {i64, i1} %t1079, 1
  br i1 %t1081, label %fixslow370, label %fixmerge371
fixslow370:
  %t1082 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge371
fixmerge371:
  %t1083 = phi i64 [ %t1080, %fixfast369 ], [ %t1082, %fixslow370 ]
  %t1084 = or i64 %t1083, %a1
  %t1085 = and i64 %t1084, 7
  %t1086 = icmp eq i64 %t1085, 0
  br i1 %t1086, label %fixfast372, label %fixslow373
fixfast372:
  %t1087 = icmp slt i64 %t1083, %a1
  %t1088 = select i1 %t1087, i64 257, i64 1
  br label %fixmerge374
fixslow373:
  %t1089 = call i64 @rt_lt(i64 %t1083, i64 %a1)
  br label %fixmerge374
fixmerge374:
  %t1090 = phi i64 [ %t1088, %fixfast372 ], [ %t1089, %fixslow373 ]
  %t1091 = icmp ne i64 %t1090, 1
  br i1 %t1091, label %then375, label %else376
then375:
  %t1092 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1093 = call i64 @rt_char_to_integer(i64 %t1092)
  %t1094 = or i64 %a2, 8
  %t1095 = and i64 %t1094, 7
  %t1096 = icmp eq i64 %t1095, 0
  br i1 %t1096, label %fixfast377, label %fixslow378
fixfast377:
  %t1097 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1098 = extractvalue {i64, i1} %t1097, 0
  %t1099 = extractvalue {i64, i1} %t1097, 1
  br i1 %t1099, label %fixslow378, label %fixmerge379
fixslow378:
  %t1100 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge379
fixmerge379:
  %t1101 = phi i64 [ %t1098, %fixfast377 ], [ %t1100, %fixslow378 ]
  %t1102 = call i64 @rt_string_ref(i64 %a0, i64 %t1101)
  %t1103 = call i64 @rt_char_to_integer(i64 %t1102)
  %t1104 = or i64 %t1093, 992
  %t1105 = and i64 %t1104, 7
  %t1106 = icmp eq i64 %t1105, 0
  br i1 %t1106, label %fixfast380, label %fixslow381
fixfast380:
  %t1107 = icmp eq i64 %t1093, 992
  %t1108 = select i1 %t1107, i64 257, i64 1
  br label %fixmerge382
fixslow381:
  %t1109 = call i64 @rt_num_eq(i64 %t1093, i64 992)
  br label %fixmerge382
fixmerge382:
  %t1110 = phi i64 [ %t1108, %fixfast380 ], [ %t1109, %fixslow381 ]
  %t1111 = icmp ne i64 %t1110, 1
  br i1 %t1111, label %then383, label %else384
then383:
  %t1112 = or i64 %t1103, 280
  %t1113 = and i64 %t1112, 7
  %t1114 = icmp eq i64 %t1113, 0
  br i1 %t1114, label %fixfast386, label %fixslow387
fixfast386:
  %t1115 = icmp eq i64 %t1103, 280
  %t1116 = select i1 %t1115, i64 257, i64 1
  br label %fixmerge388
fixslow387:
  %t1117 = call i64 @rt_num_eq(i64 %t1103, i64 280)
  br label %fixmerge388
fixmerge388:
  %t1118 = phi i64 [ %t1116, %fixfast386 ], [ %t1117, %fixslow387 ]
  br label %merge385
else384:
  br label %merge385
merge385:
  %t1119 = phi i64 [ %t1118, %fixmerge388 ], [ 1, %else384 ]
  %t1120 = icmp ne i64 %t1119, 1
  br i1 %t1120, label %then389, label %else390
then389:
  %t1121 = or i64 %a3, 8
  %t1122 = and i64 %t1121, 7
  %t1123 = icmp eq i64 %t1122, 0
  br i1 %t1123, label %fixfast391, label %fixslow392
fixfast391:
  %t1124 = icmp eq i64 %a3, 8
  %t1125 = select i1 %t1124, i64 257, i64 1
  br label %fixmerge393
fixslow392:
  %t1126 = call i64 @rt_num_eq(i64 %a3, i64 8)
  br label %fixmerge393
fixmerge393:
  %t1127 = phi i64 [ %t1125, %fixfast391 ], [ %t1126, %fixslow392 ]
  %t1128 = icmp ne i64 %t1127, 1
  br i1 %t1128, label %then394, label %else395
then394:
  %t1129 = or i64 %a2, 16
  %t1130 = and i64 %t1129, 7
  %t1131 = icmp eq i64 %t1130, 0
  br i1 %t1131, label %fixfast396, label %fixslow397
fixfast396:
  %t1132 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1133 = extractvalue {i64, i1} %t1132, 0
  %t1134 = extractvalue {i64, i1} %t1132, 1
  br i1 %t1134, label %fixslow397, label %fixmerge398
fixslow397:
  %t1135 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge398
fixmerge398:
  %t1136 = phi i64 [ %t1133, %fixfast396 ], [ %t1135, %fixslow397 ]
  ret i64 %t1136
else395:
  %t1137 = or i64 %a2, 16
  %t1138 = and i64 %t1137, 7
  %t1139 = icmp eq i64 %t1138, 0
  br i1 %t1139, label %fixfast399, label %fixslow400
fixfast399:
  %t1140 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1141 = extractvalue {i64, i1} %t1140, 0
  %t1142 = extractvalue {i64, i1} %t1140, 1
  br i1 %t1142, label %fixslow400, label %fixmerge401
fixslow400:
  %t1143 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge401
fixmerge401:
  %t1144 = phi i64 [ %t1141, %fixfast399 ], [ %t1143, %fixslow400 ]
  %t1145 = or i64 %a3, 8
  %t1146 = and i64 %t1145, 7
  %t1147 = icmp eq i64 %t1146, 0
  br i1 %t1147, label %fixfast402, label %fixslow403
fixfast402:
  %t1148 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a3, i64 8)
  %t1149 = extractvalue {i64, i1} %t1148, 0
  %t1150 = extractvalue {i64, i1} %t1148, 1
  br i1 %t1150, label %fixslow403, label %fixmerge404
fixslow403:
  %t1151 = call i64 @rt_sub(i64 %a3, i64 8)
  br label %fixmerge404
fixmerge404:
  %t1152 = phi i64 [ %t1149, %fixfast402 ], [ %t1151, %fixslow403 ]
  %t1153 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1153)
  %t1154 = and i64 %t1153, -8
  %t1155 = inttoptr i64 %t1154 to ptr
  %t1156 = load i64, ptr %t1155
  %t1157 = inttoptr i64 %t1156 to ptr
  %t1158 = musttail call fastcc i64 %t1157(i64 %t1153, i64 5, i64 %a0, i64 %a1, i64 %t1144, i64 %t1152, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1158
else390:
  %t1159 = or i64 %t1093, 280
  %t1160 = and i64 %t1159, 7
  %t1161 = icmp eq i64 %t1160, 0
  br i1 %t1161, label %fixfast405, label %fixslow406
fixfast405:
  %t1162 = icmp eq i64 %t1093, 280
  %t1163 = select i1 %t1162, i64 257, i64 1
  br label %fixmerge407
fixslow406:
  %t1164 = call i64 @rt_num_eq(i64 %t1093, i64 280)
  br label %fixmerge407
fixmerge407:
  %t1165 = phi i64 [ %t1163, %fixfast405 ], [ %t1164, %fixslow406 ]
  %t1166 = icmp ne i64 %t1165, 1
  br i1 %t1166, label %then408, label %else409
then408:
  %t1167 = or i64 %t1103, 992
  %t1168 = and i64 %t1167, 7
  %t1169 = icmp eq i64 %t1168, 0
  br i1 %t1169, label %fixfast411, label %fixslow412
fixfast411:
  %t1170 = icmp eq i64 %t1103, 992
  %t1171 = select i1 %t1170, i64 257, i64 1
  br label %fixmerge413
fixslow412:
  %t1172 = call i64 @rt_num_eq(i64 %t1103, i64 992)
  br label %fixmerge413
fixmerge413:
  %t1173 = phi i64 [ %t1171, %fixfast411 ], [ %t1172, %fixslow412 ]
  br label %merge410
else409:
  br label %merge410
merge410:
  %t1174 = phi i64 [ %t1173, %fixmerge413 ], [ 1, %else409 ]
  %t1175 = icmp ne i64 %t1174, 1
  br i1 %t1175, label %then414, label %else415
then414:
  %t1176 = or i64 %a2, 16
  %t1177 = and i64 %t1176, 7
  %t1178 = icmp eq i64 %t1177, 0
  br i1 %t1178, label %fixfast416, label %fixslow417
fixfast416:
  %t1179 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1180 = extractvalue {i64, i1} %t1179, 0
  %t1181 = extractvalue {i64, i1} %t1179, 1
  br i1 %t1181, label %fixslow417, label %fixmerge418
fixslow417:
  %t1182 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge418
fixmerge418:
  %t1183 = phi i64 [ %t1180, %fixfast416 ], [ %t1182, %fixslow417 ]
  %t1184 = or i64 %a3, 8
  %t1185 = and i64 %t1184, 7
  %t1186 = icmp eq i64 %t1185, 0
  br i1 %t1186, label %fixfast419, label %fixslow420
fixfast419:
  %t1187 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a3, i64 8)
  %t1188 = extractvalue {i64, i1} %t1187, 0
  %t1189 = extractvalue {i64, i1} %t1187, 1
  br i1 %t1189, label %fixslow420, label %fixmerge421
fixslow420:
  %t1190 = call i64 @rt_add(i64 %a3, i64 8)
  br label %fixmerge421
fixmerge421:
  %t1191 = phi i64 [ %t1188, %fixfast419 ], [ %t1190, %fixslow420 ]
  %t1192 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1192)
  %t1193 = and i64 %t1192, -8
  %t1194 = inttoptr i64 %t1193 to ptr
  %t1195 = load i64, ptr %t1194
  %t1196 = inttoptr i64 %t1195 to ptr
  %t1197 = musttail call fastcc i64 %t1196(i64 %t1192, i64 5, i64 %a0, i64 %a1, i64 %t1183, i64 %t1191, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1197
else415:
  %t1198 = or i64 %a2, 8
  %t1199 = and i64 %t1198, 7
  %t1200 = icmp eq i64 %t1199, 0
  br i1 %t1200, label %fixfast422, label %fixslow423
fixfast422:
  %t1201 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1202 = extractvalue {i64, i1} %t1201, 0
  %t1203 = extractvalue {i64, i1} %t1201, 1
  br i1 %t1203, label %fixslow423, label %fixmerge424
fixslow423:
  %t1204 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge424
fixmerge424:
  %t1205 = phi i64 [ %t1202, %fixfast422 ], [ %t1204, %fixslow423 ]
  %t1206 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1206)
  %t1207 = and i64 %t1206, -8
  %t1208 = inttoptr i64 %t1207 to ptr
  %t1209 = load i64, ptr %t1208
  %t1210 = inttoptr i64 %t1209 to ptr
  %t1211 = musttail call fastcc i64 %t1210(i64 %t1206, i64 5, i64 %a0, i64 %a1, i64 %t1205, i64 %a3, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1211
else376:
  %t1212 = load i64, ptr @"emit.internal:rd-fail-code"
  call void @rt_check_callable(i64 %t1212)
  %t1213 = and i64 %t1212, -8
  %t1214 = inttoptr i64 %t1213 to ptr
  %t1215 = load i64, ptr %t1214
  %t1216 = inttoptr i64 %t1215 to ptr
  %t1217 = musttail call fastcc i64 %t1216(i64 %t1212, i64 1, i64 %a4, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1217
}

define fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1222 = icmp eq i64 %argc, 4
  br i1 %t1222, label %argok426, label %arityerr425
arityerr425:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok426:
  %t1223 = or i64 0, %a2
  %t1224 = and i64 %t1223, 7
  %t1225 = icmp eq i64 %t1224, 0
  br i1 %t1225, label %fixfast427, label %fixslow428
fixfast427:
  %t1226 = icmp slt i64 0, %a2
  %t1227 = select i1 %t1226, i64 257, i64 1
  br label %fixmerge429
fixslow428:
  %t1228 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge429
fixmerge429:
  %t1229 = phi i64 [ %t1227, %fixfast427 ], [ %t1228, %fixslow428 ]
  %t1230 = icmp ne i64 %t1229, 1
  br i1 %t1230, label %then430, label %else431
then430:
  br label %merge432
else431:
  %t1231 = or i64 0, %a2
  %t1232 = and i64 %t1231, 7
  %t1233 = icmp eq i64 %t1232, 0
  br i1 %t1233, label %fixfast433, label %fixslow434
fixfast433:
  %t1234 = icmp eq i64 0, %a2
  %t1235 = select i1 %t1234, i64 257, i64 1
  br label %fixmerge435
fixslow434:
  %t1236 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge435
fixmerge435:
  %t1237 = phi i64 [ %t1235, %fixfast433 ], [ %t1236, %fixslow434 ]
  br label %merge432
merge432:
  %t1238 = phi i64 [ 257, %then430 ], [ %t1237, %fixmerge435 ]
  %t1239 = icmp ne i64 %t1238, 1
  br i1 %t1239, label %then436, label %else437
then436:
  %t1240 = or i64 %a2, %a1
  %t1241 = and i64 %t1240, 7
  %t1242 = icmp eq i64 %t1241, 0
  br i1 %t1242, label %fixfast439, label %fixslow440
fixfast439:
  %t1243 = icmp slt i64 %a2, %a1
  %t1244 = select i1 %t1243, i64 257, i64 1
  br label %fixmerge441
fixslow440:
  %t1245 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge441
fixmerge441:
  %t1246 = phi i64 [ %t1244, %fixfast439 ], [ %t1245, %fixslow440 ]
  br label %merge438
else437:
  br label %merge438
merge438:
  %t1247 = phi i64 [ %t1246, %fixmerge441 ], [ 1, %else437 ]
  %t1248 = icmp ne i64 %t1247, 1
  br i1 %t1248, label %then442, label %else443
then442:
  %t1249 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1250 = load i64, ptr @"emit.internal:rd-ws?"
  call void @rt_check_callable(i64 %t1250)
  %t1251 = and i64 %t1250, -8
  %t1252 = inttoptr i64 %t1251 to ptr
  %t1253 = load i64, ptr %t1252
  %t1254 = inttoptr i64 %t1253 to ptr
  %t1255 = call fastcc i64%t1254(i64 %t1250, i64 1, i64 %t1249, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1256 = icmp ne i64 %t1255, 1
  br i1 %t1256, label %then444, label %else445
then444:
  %t1257 = or i64 %a2, 8
  %t1258 = and i64 %t1257, 7
  %t1259 = icmp eq i64 %t1258, 0
  br i1 %t1259, label %fixfast446, label %fixslow447
fixfast446:
  %t1260 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1261 = extractvalue {i64, i1} %t1260, 0
  %t1262 = extractvalue {i64, i1} %t1260, 1
  br i1 %t1262, label %fixslow447, label %fixmerge448
fixslow447:
  %t1263 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge448
fixmerge448:
  %t1264 = phi i64 [ %t1261, %fixfast446 ], [ %t1263, %fixslow447 ]
  %t1265 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1265)
  %t1266 = and i64 %t1265, -8
  %t1267 = inttoptr i64 %t1266 to ptr
  %t1268 = load i64, ptr %t1267
  %t1269 = inttoptr i64 %t1268 to ptr
  %t1270 = musttail call fastcc i64 %t1269(i64 %t1265, i64 4, i64 %a0, i64 %a1, i64 %t1264, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1270
else445:
  %t1271 = call i64 @rt_char_to_integer(i64 %t1249)
  %t1272 = or i64 %t1271, 472
  %t1273 = and i64 %t1272, 7
  %t1274 = icmp eq i64 %t1273, 0
  br i1 %t1274, label %fixfast449, label %fixslow450
fixfast449:
  %t1275 = icmp eq i64 %t1271, 472
  %t1276 = select i1 %t1275, i64 257, i64 1
  br label %fixmerge451
fixslow450:
  %t1277 = call i64 @rt_num_eq(i64 %t1271, i64 472)
  br label %fixmerge451
fixmerge451:
  %t1278 = phi i64 [ %t1276, %fixfast449 ], [ %t1277, %fixslow450 ]
  %t1279 = icmp ne i64 %t1278, 1
  br i1 %t1279, label %then452, label %else453
then452:
  %t1280 = or i64 %a2, 8
  %t1281 = and i64 %t1280, 7
  %t1282 = icmp eq i64 %t1281, 0
  br i1 %t1282, label %fixfast454, label %fixslow455
fixfast454:
  %t1283 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1284 = extractvalue {i64, i1} %t1283, 0
  %t1285 = extractvalue {i64, i1} %t1283, 1
  br i1 %t1285, label %fixslow455, label %fixmerge456
fixslow455:
  %t1286 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge456
fixmerge456:
  %t1287 = phi i64 [ %t1284, %fixfast454 ], [ %t1286, %fixslow455 ]
  %t1288 = load i64, ptr @"emit.internal:rd-skip-line"
  call void @rt_check_callable(i64 %t1288)
  %t1289 = and i64 %t1288, -8
  %t1290 = inttoptr i64 %t1289 to ptr
  %t1291 = load i64, ptr %t1290
  %t1292 = inttoptr i64 %t1291 to ptr
  %t1293 = call fastcc i64%t1292(i64 %t1288, i64 3, i64 %a0, i64 %a1, i64 %t1287, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1294 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1294)
  %t1295 = and i64 %t1294, -8
  %t1296 = inttoptr i64 %t1295 to ptr
  %t1297 = load i64, ptr %t1296
  %t1298 = inttoptr i64 %t1297 to ptr
  %t1299 = musttail call fastcc i64 %t1298(i64 %t1294, i64 4, i64 %a0, i64 %a1, i64 %t1293, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1299
else453:
  %t1300 = load i64, ptr @"emit.internal:rd-block-open?"
  call void @rt_check_callable(i64 %t1300)
  %t1301 = and i64 %t1300, -8
  %t1302 = inttoptr i64 %t1301 to ptr
  %t1303 = load i64, ptr %t1302
  %t1304 = inttoptr i64 %t1303 to ptr
  %t1305 = call fastcc i64%t1304(i64 %t1300, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1306 = icmp ne i64 %t1305, 1
  br i1 %t1306, label %then457, label %else458
then457:
  %t1307 = or i64 %a2, 16
  %t1308 = and i64 %t1307, 7
  %t1309 = icmp eq i64 %t1308, 0
  br i1 %t1309, label %fixfast459, label %fixslow460
fixfast459:
  %t1310 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1311 = extractvalue {i64, i1} %t1310, 0
  %t1312 = extractvalue {i64, i1} %t1310, 1
  br i1 %t1312, label %fixslow460, label %fixmerge461
fixslow460:
  %t1313 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge461
fixmerge461:
  %t1314 = phi i64 [ %t1311, %fixfast459 ], [ %t1313, %fixslow460 ]
  %t1315 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1315)
  %t1316 = and i64 %t1315, -8
  %t1317 = inttoptr i64 %t1316 to ptr
  %t1318 = load i64, ptr %t1317
  %t1319 = inttoptr i64 %t1318 to ptr
  %t1320 = call fastcc i64%t1319(i64 %t1315, i64 5, i64 %a0, i64 %a1, i64 %t1314, i64 8, i64 %a2, i64 0, i64 0, i64 0, ptr null)
  %t1321 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t1321)
  %t1322 = and i64 %t1321, -8
  %t1323 = inttoptr i64 %t1322 to ptr
  %t1324 = load i64, ptr %t1323
  %t1325 = inttoptr i64 %t1324 to ptr
  %t1326 = call fastcc i64%t1325(i64 %t1321, i64 1, i64 %t1320, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1327 = icmp ne i64 %t1326, 1
  br i1 %t1327, label %then462, label %else463
then462:
  ret i64 %t1320
else463:
  %t1328 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1328)
  %t1329 = and i64 %t1328, -8
  %t1330 = inttoptr i64 %t1329 to ptr
  %t1331 = load i64, ptr %t1330
  %t1332 = inttoptr i64 %t1331 to ptr
  %t1333 = musttail call fastcc i64 %t1332(i64 %t1328, i64 4, i64 %a0, i64 %a1, i64 %t1320, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1333
else458:
  %t1334 = call i64 @rt_make_string(ptr @.str.lit.0, i64 11)
  %t1335 = load i64, ptr @"emit.internal:rd-directive-end"
  call void @rt_check_callable(i64 %t1335)
  %t1336 = and i64 %t1335, -8
  %t1337 = inttoptr i64 %t1336 to ptr
  %t1338 = load i64, ptr %t1337
  %t1339 = inttoptr i64 %t1338 to ptr
  %t1340 = call fastcc i64%t1339(i64 %t1335, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %t1334, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1341 = icmp ne i64 %t1340, 1
  br i1 %t1341, label %then464, label %else465
then464:
  %t1342 = load i64, ptr @"emit.internal:rd-set-fold!"
  call void @rt_check_callable(i64 %t1342)
  %t1343 = and i64 %t1342, -8
  %t1344 = inttoptr i64 %t1343 to ptr
  %t1345 = load i64, ptr %t1344
  %t1346 = inttoptr i64 %t1345 to ptr
  %t1347 = call fastcc i64%t1346(i64 %t1342, i64 2, i64 %a3, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1348 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1348)
  %t1349 = and i64 %t1348, -8
  %t1350 = inttoptr i64 %t1349 to ptr
  %t1351 = load i64, ptr %t1350
  %t1352 = inttoptr i64 %t1351 to ptr
  %t1353 = musttail call fastcc i64 %t1352(i64 %t1348, i64 4, i64 %a0, i64 %a1, i64 %t1340, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1353
else465:
  %t1354 = call i64 @rt_make_string(ptr @.str.lit.1, i64 14)
  %t1355 = load i64, ptr @"emit.internal:rd-directive-end"
  call void @rt_check_callable(i64 %t1355)
  %t1356 = and i64 %t1355, -8
  %t1357 = inttoptr i64 %t1356 to ptr
  %t1358 = load i64, ptr %t1357
  %t1359 = inttoptr i64 %t1358 to ptr
  %t1360 = call fastcc i64%t1359(i64 %t1355, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %t1354, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1361 = icmp ne i64 %t1360, 1
  br i1 %t1361, label %then466, label %else467
then466:
  %t1362 = load i64, ptr @"emit.internal:rd-set-fold!"
  call void @rt_check_callable(i64 %t1362)
  %t1363 = and i64 %t1362, -8
  %t1364 = inttoptr i64 %t1363 to ptr
  %t1365 = load i64, ptr %t1364
  %t1366 = inttoptr i64 %t1365 to ptr
  %t1367 = call fastcc i64%t1366(i64 %t1362, i64 2, i64 %a3, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1368 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1368)
  %t1369 = and i64 %t1368, -8
  %t1370 = inttoptr i64 %t1369 to ptr
  %t1371 = load i64, ptr %t1370
  %t1372 = inttoptr i64 %t1371 to ptr
  %t1373 = musttail call fastcc i64 %t1372(i64 %t1368, i64 4, i64 %a0, i64 %a1, i64 %t1360, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1373
else467:
  ret i64 %a2
else443:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1378 = icmp eq i64 %argc, 3
  br i1 %t1378, label %argok469, label %arityerr468
arityerr468:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok469:
  %t1379 = or i64 %a2, %a1
  %t1380 = and i64 %t1379, 7
  %t1381 = icmp eq i64 %t1380, 0
  br i1 %t1381, label %fixfast470, label %fixslow471
fixfast470:
  %t1382 = icmp slt i64 %a2, %a1
  %t1383 = select i1 %t1382, i64 257, i64 1
  br label %fixmerge472
fixslow471:
  %t1384 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge472
fixmerge472:
  %t1385 = phi i64 [ %t1383, %fixfast470 ], [ %t1384, %fixslow471 ]
  %t1386 = icmp ne i64 %t1385, 1
  br i1 %t1386, label %then473, label %else474
then473:
  %t1387 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1388 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t1388)
  %t1389 = and i64 %t1388, -8
  %t1390 = inttoptr i64 %t1389 to ptr
  %t1391 = load i64, ptr %t1390
  %t1392 = inttoptr i64 %t1391 to ptr
  %t1393 = call fastcc i64%t1392(i64 %t1388, i64 1, i64 %t1387, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1394 = icmp ne i64 %t1393, 1
  br i1 %t1394, label %then475, label %else476
then475:
  ret i64 %a2
else476:
  %t1395 = or i64 %a2, 8
  %t1396 = and i64 %t1395, 7
  %t1397 = icmp eq i64 %t1396, 0
  br i1 %t1397, label %fixfast477, label %fixslow478
fixfast477:
  %t1398 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1399 = extractvalue {i64, i1} %t1398, 0
  %t1400 = extractvalue {i64, i1} %t1398, 1
  br i1 %t1400, label %fixslow478, label %fixmerge479
fixslow478:
  %t1401 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge479
fixmerge479:
  %t1402 = phi i64 [ %t1399, %fixfast477 ], [ %t1401, %fixslow478 ]
  %t1403 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t1403)
  %t1404 = and i64 %t1403, -8
  %t1405 = inttoptr i64 %t1404 to ptr
  %t1406 = load i64, ptr %t1405
  %t1407 = inttoptr i64 %t1406 to ptr
  %t1408 = musttail call fastcc i64 %t1407(i64 %t1403, i64 3, i64 %a0, i64 %a1, i64 %t1402, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1408
else474:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1413 = icmp eq i64 %argc, 3
  br i1 %t1413, label %argok481, label %arityerr480
arityerr480:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok481:
  %t1414 = or i64 %a1, %a2
  %t1415 = and i64 %t1414, 7
  %t1416 = icmp eq i64 %t1415, 0
  br i1 %t1416, label %fixfast482, label %fixslow483
fixfast482:
  %t1417 = icmp slt i64 %a1, %a2
  %t1418 = select i1 %t1417, i64 257, i64 1
  br label %fixmerge484
fixslow483:
  %t1419 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge484
fixmerge484:
  %t1420 = phi i64 [ %t1418, %fixfast482 ], [ %t1419, %fixslow483 ]
  %t1421 = icmp ne i64 %t1420, 1
  br i1 %t1421, label %then485, label %else486
then485:
  %t1422 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1423 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1423)
  %t1424 = and i64 %t1423, -8
  %t1425 = inttoptr i64 %t1424 to ptr
  %t1426 = load i64, ptr %t1425
  %t1427 = inttoptr i64 %t1426 to ptr
  %t1428 = call fastcc i64%t1427(i64 %t1423, i64 1, i64 %t1422, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1429 = icmp ne i64 %t1428, 1
  br i1 %t1429, label %then487, label %else488
then487:
  %t1430 = or i64 %a1, 8
  %t1431 = and i64 %t1430, 7
  %t1432 = icmp eq i64 %t1431, 0
  br i1 %t1432, label %fixfast489, label %fixslow490
fixfast489:
  %t1433 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1434 = extractvalue {i64, i1} %t1433, 0
  %t1435 = extractvalue {i64, i1} %t1433, 1
  br i1 %t1435, label %fixslow490, label %fixmerge491
fixslow490:
  %t1436 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge491
fixmerge491:
  %t1437 = phi i64 [ %t1434, %fixfast489 ], [ %t1436, %fixslow490 ]
  %t1438 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1438)
  %t1439 = and i64 %t1438, -8
  %t1440 = inttoptr i64 %t1439 to ptr
  %t1441 = load i64, ptr %t1440
  %t1442 = inttoptr i64 %t1441 to ptr
  %t1443 = musttail call fastcc i64 %t1442(i64 %t1438, i64 3, i64 %a0, i64 %t1437, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1443
else488:
  ret i64 1
else486:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1448 = icmp eq i64 %argc, 1
  br i1 %t1448, label %argok493, label %arityerr492
arityerr492:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok493:
  %t1449 = call i64 @rt_string_length(i64 %a0)
  %t1450 = or i64 0, %t1449
  %t1451 = and i64 %t1450, 7
  %t1452 = icmp eq i64 %t1451, 0
  br i1 %t1452, label %fixfast494, label %fixslow495
fixfast494:
  %t1453 = icmp slt i64 0, %t1449
  %t1454 = select i1 %t1453, i64 257, i64 1
  br label %fixmerge496
fixslow495:
  %t1455 = call i64 @rt_lt(i64 0, i64 %t1449)
  br label %fixmerge496
fixmerge496:
  %t1456 = phi i64 [ %t1454, %fixfast494 ], [ %t1455, %fixslow495 ]
  %t1457 = icmp ne i64 %t1456, 1
  br i1 %t1457, label %then497, label %else498
then497:
  %t1458 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1459 = call i64 @rt_char_to_integer(i64 %t1458)
  %t1460 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1461 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1461)
  %t1462 = and i64 %t1461, -8
  %t1463 = inttoptr i64 %t1462 to ptr
  %t1464 = load i64, ptr %t1463
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = call fastcc i64%t1465(i64 %t1461, i64 1, i64 %t1460, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1467 = icmp ne i64 %t1466, 1
  br i1 %t1467, label %then499, label %else500
then499:
  %t1468 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1468)
  %t1469 = and i64 %t1468, -8
  %t1470 = inttoptr i64 %t1469 to ptr
  %t1471 = load i64, ptr %t1470
  %t1472 = inttoptr i64 %t1471 to ptr
  %t1473 = musttail call fastcc i64 %t1472(i64 %t1468, i64 3, i64 %a0, i64 0, i64 %t1449, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1473
else500:
  %t1474 = or i64 %t1459, 360
  %t1475 = and i64 %t1474, 7
  %t1476 = icmp eq i64 %t1475, 0
  br i1 %t1476, label %fixfast501, label %fixslow502
fixfast501:
  %t1477 = icmp eq i64 %t1459, 360
  %t1478 = select i1 %t1477, i64 257, i64 1
  br label %fixmerge503
fixslow502:
  %t1479 = call i64 @rt_num_eq(i64 %t1459, i64 360)
  br label %fixmerge503
fixmerge503:
  %t1480 = phi i64 [ %t1478, %fixfast501 ], [ %t1479, %fixslow502 ]
  %t1481 = icmp ne i64 %t1480, 1
  br i1 %t1481, label %then504, label %else505
then504:
  br label %merge506
else505:
  %t1482 = or i64 %t1459, 344
  %t1483 = and i64 %t1482, 7
  %t1484 = icmp eq i64 %t1483, 0
  br i1 %t1484, label %fixfast507, label %fixslow508
fixfast507:
  %t1485 = icmp eq i64 %t1459, 344
  %t1486 = select i1 %t1485, i64 257, i64 1
  br label %fixmerge509
fixslow508:
  %t1487 = call i64 @rt_num_eq(i64 %t1459, i64 344)
  br label %fixmerge509
fixmerge509:
  %t1488 = phi i64 [ %t1486, %fixfast507 ], [ %t1487, %fixslow508 ]
  br label %merge506
merge506:
  %t1489 = phi i64 [ %t1480, %then504 ], [ %t1488, %fixmerge509 ]
  %t1490 = icmp ne i64 %t1489, 1
  br i1 %t1490, label %then510, label %else511
then510:
  %t1491 = or i64 8, %t1449
  %t1492 = and i64 %t1491, 7
  %t1493 = icmp eq i64 %t1492, 0
  br i1 %t1493, label %fixfast512, label %fixslow513
fixfast512:
  %t1494 = icmp slt i64 8, %t1449
  %t1495 = select i1 %t1494, i64 257, i64 1
  br label %fixmerge514
fixslow513:
  %t1496 = call i64 @rt_lt(i64 8, i64 %t1449)
  br label %fixmerge514
fixmerge514:
  %t1497 = phi i64 [ %t1495, %fixfast512 ], [ %t1496, %fixslow513 ]
  %t1498 = icmp ne i64 %t1497, 1
  br i1 %t1498, label %then515, label %else516
then515:
  %t1499 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1499)
  %t1500 = and i64 %t1499, -8
  %t1501 = inttoptr i64 %t1500 to ptr
  %t1502 = load i64, ptr %t1501
  %t1503 = inttoptr i64 %t1502 to ptr
  %t1504 = musttail call fastcc i64 %t1503(i64 %t1499, i64 3, i64 %a0, i64 8, i64 %t1449, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1504
else516:
  ret i64 1
else511:
  ret i64 1
else498:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1509 = icmp eq i64 %argc, 4
  br i1 %t1509, label %argok518, label %arityerr517
arityerr517:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok518:
  %t1510 = or i64 %a1, %a2
  %t1511 = and i64 %t1510, 7
  %t1512 = icmp eq i64 %t1511, 0
  br i1 %t1512, label %fixfast519, label %fixslow520
fixfast519:
  %t1513 = icmp slt i64 %a1, %a2
  %t1514 = select i1 %t1513, i64 257, i64 1
  br label %fixmerge521
fixslow520:
  %t1515 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge521
fixmerge521:
  %t1516 = phi i64 [ %t1514, %fixfast519 ], [ %t1515, %fixslow520 ]
  %t1517 = icmp ne i64 %t1516, 1
  br i1 %t1517, label %then522, label %else523
then522:
  %t1518 = or i64 %a1, 8
  %t1519 = and i64 %t1518, 7
  %t1520 = icmp eq i64 %t1519, 0
  br i1 %t1520, label %fixfast524, label %fixslow525
fixfast524:
  %t1521 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1522 = extractvalue {i64, i1} %t1521, 0
  %t1523 = extractvalue {i64, i1} %t1521, 1
  br i1 %t1523, label %fixslow525, label %fixmerge526
fixslow525:
  %t1524 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge526
fixmerge526:
  %t1525 = phi i64 [ %t1522, %fixfast524 ], [ %t1524, %fixslow525 ]
  %t1526 = or i64 %a3, 80
  %t1527 = and i64 %t1526, 7
  %t1528 = icmp eq i64 %t1527, 0
  br i1 %t1528, label %fixfast527, label %fixslow528
fixfast527:
  %t1529 = ashr i64 %a3, 3
  %t1530 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1529, i64 80)
  %t1531 = extractvalue {i64, i1} %t1530, 0
  %t1532 = extractvalue {i64, i1} %t1530, 1
  br i1 %t1532, label %fixslow528, label %fixmerge529
fixslow528:
  %t1533 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge529
fixmerge529:
  %t1534 = phi i64 [ %t1531, %fixfast527 ], [ %t1533, %fixslow528 ]
  %t1535 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1536 = call i64 @rt_char_to_integer(i64 %t1535)
  %t1537 = or i64 %t1536, 384
  %t1538 = and i64 %t1537, 7
  %t1539 = icmp eq i64 %t1538, 0
  br i1 %t1539, label %fixfast530, label %fixslow531
fixfast530:
  %t1540 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1536, i64 384)
  %t1541 = extractvalue {i64, i1} %t1540, 0
  %t1542 = extractvalue {i64, i1} %t1540, 1
  br i1 %t1542, label %fixslow531, label %fixmerge532
fixslow531:
  %t1543 = call i64 @rt_sub(i64 %t1536, i64 384)
  br label %fixmerge532
fixmerge532:
  %t1544 = phi i64 [ %t1541, %fixfast530 ], [ %t1543, %fixslow531 ]
  %t1545 = or i64 %t1534, %t1544
  %t1546 = and i64 %t1545, 7
  %t1547 = icmp eq i64 %t1546, 0
  br i1 %t1547, label %fixfast533, label %fixslow534
fixfast533:
  %t1548 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1534, i64 %t1544)
  %t1549 = extractvalue {i64, i1} %t1548, 0
  %t1550 = extractvalue {i64, i1} %t1548, 1
  br i1 %t1550, label %fixslow534, label %fixmerge535
fixslow534:
  %t1551 = call i64 @rt_add(i64 %t1534, i64 %t1544)
  br label %fixmerge535
fixmerge535:
  %t1552 = phi i64 [ %t1549, %fixfast533 ], [ %t1551, %fixslow534 ]
  %t1553 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1553)
  %t1554 = and i64 %t1553, -8
  %t1555 = inttoptr i64 %t1554 to ptr
  %t1556 = load i64, ptr %t1555
  %t1557 = inttoptr i64 %t1556 to ptr
  %t1558 = musttail call fastcc i64 %t1557(i64 %t1553, i64 4, i64 %a0, i64 %t1525, i64 %a2, i64 %t1552, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1558
else523:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1563 = icmp eq i64 %argc, 4
  br i1 %t1563, label %argok537, label %arityerr536
arityerr536:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok537:
  %t1564 = or i64 %a1, %a2
  %t1565 = and i64 %t1564, 7
  %t1566 = icmp eq i64 %t1565, 0
  br i1 %t1566, label %fixfast538, label %fixslow539
fixfast538:
  %t1567 = icmp slt i64 %a1, %a2
  %t1568 = select i1 %t1567, i64 257, i64 1
  br label %fixmerge540
fixslow539:
  %t1569 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge540
fixmerge540:
  %t1570 = phi i64 [ %t1568, %fixfast538 ], [ %t1569, %fixslow539 ]
  %t1571 = icmp ne i64 %t1570, 1
  br i1 %t1571, label %then541, label %else542
then541:
  %t1572 = or i64 %a1, 8
  %t1573 = and i64 %t1572, 7
  %t1574 = icmp eq i64 %t1573, 0
  br i1 %t1574, label %fixfast543, label %fixslow544
fixfast543:
  %t1575 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1576 = extractvalue {i64, i1} %t1575, 0
  %t1577 = extractvalue {i64, i1} %t1575, 1
  br i1 %t1577, label %fixslow544, label %fixmerge545
fixslow544:
  %t1578 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge545
fixmerge545:
  %t1579 = phi i64 [ %t1576, %fixfast543 ], [ %t1578, %fixslow544 ]
  %t1580 = or i64 %a3, 80
  %t1581 = and i64 %t1580, 7
  %t1582 = icmp eq i64 %t1581, 0
  br i1 %t1582, label %fixfast546, label %fixslow547
fixfast546:
  %t1583 = ashr i64 %a3, 3
  %t1584 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1583, i64 80)
  %t1585 = extractvalue {i64, i1} %t1584, 0
  %t1586 = extractvalue {i64, i1} %t1584, 1
  br i1 %t1586, label %fixslow547, label %fixmerge548
fixslow547:
  %t1587 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge548
fixmerge548:
  %t1588 = phi i64 [ %t1585, %fixfast546 ], [ %t1587, %fixslow547 ]
  %t1589 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1590 = call i64 @rt_char_to_integer(i64 %t1589)
  %t1591 = or i64 %t1590, 384
  %t1592 = and i64 %t1591, 7
  %t1593 = icmp eq i64 %t1592, 0
  br i1 %t1593, label %fixfast549, label %fixslow550
fixfast549:
  %t1594 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1590, i64 384)
  %t1595 = extractvalue {i64, i1} %t1594, 0
  %t1596 = extractvalue {i64, i1} %t1594, 1
  br i1 %t1596, label %fixslow550, label %fixmerge551
fixslow550:
  %t1597 = call i64 @rt_sub(i64 %t1590, i64 384)
  br label %fixmerge551
fixmerge551:
  %t1598 = phi i64 [ %t1595, %fixfast549 ], [ %t1597, %fixslow550 ]
  %t1599 = or i64 %t1588, %t1598
  %t1600 = and i64 %t1599, 7
  %t1601 = icmp eq i64 %t1600, 0
  br i1 %t1601, label %fixfast552, label %fixslow553
fixfast552:
  %t1602 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1588, i64 %t1598)
  %t1603 = extractvalue {i64, i1} %t1602, 0
  %t1604 = extractvalue {i64, i1} %t1602, 1
  br i1 %t1604, label %fixslow553, label %fixmerge554
fixslow553:
  %t1605 = call i64 @rt_sub(i64 %t1588, i64 %t1598)
  br label %fixmerge554
fixmerge554:
  %t1606 = phi i64 [ %t1603, %fixfast552 ], [ %t1605, %fixslow553 ]
  %t1607 = load i64, ptr @"emit.internal:rd-digits-neg"
  call void @rt_check_callable(i64 %t1607)
  %t1608 = and i64 %t1607, -8
  %t1609 = inttoptr i64 %t1608 to ptr
  %t1610 = load i64, ptr %t1609
  %t1611 = inttoptr i64 %t1610 to ptr
  %t1612 = musttail call fastcc i64 %t1611(i64 %t1607, i64 4, i64 %a0, i64 %t1579, i64 %a2, i64 %t1606, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1612
else542:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1617 = icmp eq i64 %argc, 1
  br i1 %t1617, label %argok556, label %arityerr555
arityerr555:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok556:
  %t1618 = call i64 @rt_string_length(i64 %a0)
  %t1619 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1620 = call i64 @rt_char_to_integer(i64 %t1619)
  %t1621 = or i64 %t1620, 360
  %t1622 = and i64 %t1621, 7
  %t1623 = icmp eq i64 %t1622, 0
  br i1 %t1623, label %fixfast557, label %fixslow558
fixfast557:
  %t1624 = icmp eq i64 %t1620, 360
  %t1625 = select i1 %t1624, i64 257, i64 1
  br label %fixmerge559
fixslow558:
  %t1626 = call i64 @rt_num_eq(i64 %t1620, i64 360)
  br label %fixmerge559
fixmerge559:
  %t1627 = phi i64 [ %t1625, %fixfast557 ], [ %t1626, %fixslow558 ]
  %t1628 = icmp ne i64 %t1627, 1
  br i1 %t1628, label %then560, label %else561
then560:
  %t1629 = load i64, ptr @"emit.internal:rd-digits-neg"
  call void @rt_check_callable(i64 %t1629)
  %t1630 = and i64 %t1629, -8
  %t1631 = inttoptr i64 %t1630 to ptr
  %t1632 = load i64, ptr %t1631
  %t1633 = inttoptr i64 %t1632 to ptr
  %t1634 = musttail call fastcc i64 %t1633(i64 %t1629, i64 4, i64 %a0, i64 8, i64 %t1618, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1634
else561:
  %t1635 = or i64 %t1620, 344
  %t1636 = and i64 %t1635, 7
  %t1637 = icmp eq i64 %t1636, 0
  br i1 %t1637, label %fixfast562, label %fixslow563
fixfast562:
  %t1638 = icmp eq i64 %t1620, 344
  %t1639 = select i1 %t1638, i64 257, i64 1
  br label %fixmerge564
fixslow563:
  %t1640 = call i64 @rt_num_eq(i64 %t1620, i64 344)
  br label %fixmerge564
fixmerge564:
  %t1641 = phi i64 [ %t1639, %fixfast562 ], [ %t1640, %fixslow563 ]
  %t1642 = icmp ne i64 %t1641, 1
  br i1 %t1642, label %then565, label %else566
then565:
  %t1643 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1643)
  %t1644 = and i64 %t1643, -8
  %t1645 = inttoptr i64 %t1644 to ptr
  %t1646 = load i64, ptr %t1645
  %t1647 = inttoptr i64 %t1646 to ptr
  %t1648 = musttail call fastcc i64 %t1647(i64 %t1643, i64 4, i64 %a0, i64 8, i64 %t1618, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1648
else566:
  %t1649 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1649)
  %t1650 = and i64 %t1649, -8
  %t1651 = inttoptr i64 %t1650 to ptr
  %t1652 = load i64, ptr %t1651
  %t1653 = inttoptr i64 %t1652 to ptr
  %t1654 = musttail call fastcc i64 %t1653(i64 %t1649, i64 4, i64 %a0, i64 0, i64 %t1618, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1654
}

define fastcc i64 @"emit.internal:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1659 = icmp eq i64 %argc, 1
  br i1 %t1659, label %argok568, label %arityerr567
arityerr567:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok568:
  %t1660 = call i64 @rt_char_to_integer(i64 %a0)
  %t1661 = or i64 %t1660, 368
  %t1662 = and i64 %t1661, 7
  %t1663 = icmp eq i64 %t1662, 0
  br i1 %t1663, label %fixfast569, label %fixslow570
fixfast569:
  %t1664 = icmp eq i64 %t1660, 368
  %t1665 = select i1 %t1664, i64 257, i64 1
  br label %fixmerge571
fixslow570:
  %t1666 = call i64 @rt_num_eq(i64 %t1660, i64 368)
  br label %fixmerge571
fixmerge571:
  %t1667 = phi i64 [ %t1665, %fixfast569 ], [ %t1666, %fixslow570 ]
  ret i64 %t1667
}

define fastcc i64 @"emit.internal:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1672 = icmp eq i64 %argc, 1
  br i1 %t1672, label %argok573, label %arityerr572
arityerr572:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok573:
  %t1673 = call i64 @rt_char_to_integer(i64 %a0)
  %t1674 = or i64 %t1673, 808
  %t1675 = and i64 %t1674, 7
  %t1676 = icmp eq i64 %t1675, 0
  br i1 %t1676, label %fixfast574, label %fixslow575
fixfast574:
  %t1677 = icmp eq i64 %t1673, 808
  %t1678 = select i1 %t1677, i64 257, i64 1
  br label %fixmerge576
fixslow575:
  %t1679 = call i64 @rt_num_eq(i64 %t1673, i64 808)
  br label %fixmerge576
fixmerge576:
  %t1680 = phi i64 [ %t1678, %fixfast574 ], [ %t1679, %fixslow575 ]
  %t1681 = icmp ne i64 %t1680, 1
  br i1 %t1681, label %then577, label %else578
then577:
  ret i64 %t1680
else578:
  %t1682 = or i64 %t1673, 552
  %t1683 = and i64 %t1682, 7
  %t1684 = icmp eq i64 %t1683, 0
  br i1 %t1684, label %fixfast579, label %fixslow580
fixfast579:
  %t1685 = icmp eq i64 %t1673, 552
  %t1686 = select i1 %t1685, i64 257, i64 1
  br label %fixmerge581
fixslow580:
  %t1687 = call i64 @rt_num_eq(i64 %t1673, i64 552)
  br label %fixmerge581
fixmerge581:
  %t1688 = phi i64 [ %t1686, %fixfast579 ], [ %t1687, %fixslow580 ]
  ret i64 %t1688
}

define fastcc i64 @"emit.internal:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1693 = icmp eq i64 %argc, 1
  br i1 %t1693, label %argok583, label %arityerr582
arityerr582:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok583:
  %t1694 = call i64 @rt_char_to_integer(i64 %a0)
  %t1695 = or i64 %t1694, 344
  %t1696 = and i64 %t1695, 7
  %t1697 = icmp eq i64 %t1696, 0
  br i1 %t1697, label %fixfast584, label %fixslow585
fixfast584:
  %t1698 = icmp eq i64 %t1694, 344
  %t1699 = select i1 %t1698, i64 257, i64 1
  br label %fixmerge586
fixslow585:
  %t1700 = call i64 @rt_num_eq(i64 %t1694, i64 344)
  br label %fixmerge586
fixmerge586:
  %t1701 = phi i64 [ %t1699, %fixfast584 ], [ %t1700, %fixslow585 ]
  %t1702 = icmp ne i64 %t1701, 1
  br i1 %t1702, label %then587, label %else588
then587:
  ret i64 %t1701
else588:
  %t1703 = or i64 %t1694, 360
  %t1704 = and i64 %t1703, 7
  %t1705 = icmp eq i64 %t1704, 0
  br i1 %t1705, label %fixfast589, label %fixslow590
fixfast589:
  %t1706 = icmp eq i64 %t1694, 360
  %t1707 = select i1 %t1706, i64 257, i64 1
  br label %fixmerge591
fixslow590:
  %t1708 = call i64 @rt_num_eq(i64 %t1694, i64 360)
  br label %fixmerge591
fixmerge591:
  %t1709 = phi i64 [ %t1707, %fixfast589 ], [ %t1708, %fixslow590 ]
  ret i64 %t1709
}

define fastcc i64 @"emit.internal:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1714 = icmp eq i64 %argc, 3
  br i1 %t1714, label %argok593, label %arityerr592
arityerr592:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok593:
  %t1715 = or i64 %a1, %a2
  %t1716 = and i64 %t1715, 7
  %t1717 = icmp eq i64 %t1716, 0
  br i1 %t1717, label %fixfast594, label %fixslow595
fixfast594:
  %t1718 = icmp slt i64 %a1, %a2
  %t1719 = select i1 %t1718, i64 257, i64 1
  br label %fixmerge596
fixslow595:
  %t1720 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge596
fixmerge596:
  %t1721 = phi i64 [ %t1719, %fixfast594 ], [ %t1720, %fixslow595 ]
  %t1722 = icmp ne i64 %t1721, 1
  br i1 %t1722, label %then597, label %else598
then597:
  %t1723 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1724 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1724)
  %t1725 = and i64 %t1724, -8
  %t1726 = inttoptr i64 %t1725 to ptr
  %t1727 = load i64, ptr %t1726
  %t1728 = inttoptr i64 %t1727 to ptr
  %t1729 = call fastcc i64%t1728(i64 %t1724, i64 1, i64 %t1723, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge599
else598:
  br label %merge599
merge599:
  %t1730 = phi i64 [ %t1729, %then597 ], [ 1, %else598 ]
  %t1731 = icmp ne i64 %t1730, 1
  br i1 %t1731, label %then600, label %else601
then600:
  %t1732 = or i64 %a1, 8
  %t1733 = and i64 %t1732, 7
  %t1734 = icmp eq i64 %t1733, 0
  br i1 %t1734, label %fixfast602, label %fixslow603
fixfast602:
  %t1735 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1736 = extractvalue {i64, i1} %t1735, 0
  %t1737 = extractvalue {i64, i1} %t1735, 1
  br i1 %t1737, label %fixslow603, label %fixmerge604
fixslow603:
  %t1738 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge604
fixmerge604:
  %t1739 = phi i64 [ %t1736, %fixfast602 ], [ %t1738, %fixslow603 ]
  %t1740 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1740)
  %t1741 = and i64 %t1740, -8
  %t1742 = inttoptr i64 %t1741 to ptr
  %t1743 = load i64, ptr %t1742
  %t1744 = inttoptr i64 %t1743 to ptr
  %t1745 = musttail call fastcc i64 %t1744(i64 %t1740, i64 3, i64 %a0, i64 %t1739, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1745
else601:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1750 = icmp eq i64 %argc, 1
  br i1 %t1750, label %argok606, label %arityerr605
arityerr605:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok606:
  %t1751 = call i64 @rt_string_length(i64 %a0)
  %t1752 = or i64 0, %t1751
  %t1753 = and i64 %t1752, 7
  %t1754 = icmp eq i64 %t1753, 0
  br i1 %t1754, label %fixfast607, label %fixslow608
fixfast607:
  %t1755 = icmp slt i64 0, %t1751
  %t1756 = select i1 %t1755, i64 257, i64 1
  br label %fixmerge609
fixslow608:
  %t1757 = call i64 @rt_lt(i64 0, i64 %t1751)
  br label %fixmerge609
fixmerge609:
  %t1758 = phi i64 [ %t1756, %fixfast607 ], [ %t1757, %fixslow608 ]
  %t1759 = icmp ne i64 %t1758, 1
  br i1 %t1759, label %then610, label %else611
then610:
  %t1760 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1761 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1761)
  %t1762 = and i64 %t1761, -8
  %t1763 = inttoptr i64 %t1762 to ptr
  %t1764 = load i64, ptr %t1763
  %t1765 = inttoptr i64 %t1764 to ptr
  %t1766 = call fastcc i64%t1765(i64 %t1761, i64 1, i64 %t1760, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1767 = icmp ne i64 %t1766, 1
  br i1 %t1767, label %then612, label %else613
then612:
  br label %merge614
else613:
  br label %merge614
merge614:
  %t1768 = phi i64 [ 8, %then612 ], [ 0, %else613 ]
  %t1769 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1769)
  %t1770 = and i64 %t1769, -8
  %t1771 = inttoptr i64 %t1770 to ptr
  %t1772 = load i64, ptr %t1771
  %t1773 = inttoptr i64 %t1772 to ptr
  %t1774 = call fastcc i64%t1773(i64 %t1769, i64 3, i64 %a0, i64 %t1768, i64 %t1751, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1775 = or i64 %t1774, %t1751
  %t1776 = and i64 %t1775, 7
  %t1777 = icmp eq i64 %t1776, 0
  br i1 %t1777, label %fixfast615, label %fixslow616
fixfast615:
  %t1778 = icmp slt i64 %t1774, %t1751
  %t1779 = select i1 %t1778, i64 257, i64 1
  br label %fixmerge617
fixslow616:
  %t1780 = call i64 @rt_lt(i64 %t1774, i64 %t1751)
  br label %fixmerge617
fixmerge617:
  %t1781 = phi i64 [ %t1779, %fixfast615 ], [ %t1780, %fixslow616 ]
  %t1782 = icmp ne i64 %t1781, 1
  br i1 %t1782, label %then618, label %else619
then618:
  %t1783 = call i64 @rt_string_ref(i64 %a0, i64 %t1774)
  %t1784 = load i64, ptr @"emit.internal:rd-dotchar?"
  call void @rt_check_callable(i64 %t1784)
  %t1785 = and i64 %t1784, -8
  %t1786 = inttoptr i64 %t1785 to ptr
  %t1787 = load i64, ptr %t1786
  %t1788 = inttoptr i64 %t1787 to ptr
  %t1789 = call fastcc i64%t1788(i64 %t1784, i64 1, i64 %t1783, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge620
else619:
  br label %merge620
merge620:
  %t1790 = phi i64 [ %t1789, %then618 ], [ 1, %else619 ]
  %t1791 = icmp ne i64 %t1790, 1
  br i1 %t1791, label %then621, label %else622
then621:
  %t1792 = or i64 %t1774, 8
  %t1793 = and i64 %t1792, 7
  %t1794 = icmp eq i64 %t1793, 0
  br i1 %t1794, label %fixfast624, label %fixslow625
fixfast624:
  %t1795 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1774, i64 8)
  %t1796 = extractvalue {i64, i1} %t1795, 0
  %t1797 = extractvalue {i64, i1} %t1795, 1
  br i1 %t1797, label %fixslow625, label %fixmerge626
fixslow625:
  %t1798 = call i64 @rt_add(i64 %t1774, i64 8)
  br label %fixmerge626
fixmerge626:
  %t1799 = phi i64 [ %t1796, %fixfast624 ], [ %t1798, %fixslow625 ]
  br label %merge623
else622:
  br label %merge623
merge623:
  %t1800 = phi i64 [ %t1799, %fixmerge626 ], [ %t1774, %else622 ]
  %t1801 = or i64 %t1774, %t1800
  %t1802 = and i64 %t1801, 7
  %t1803 = icmp eq i64 %t1802, 0
  br i1 %t1803, label %fixfast627, label %fixslow628
fixfast627:
  %t1804 = icmp slt i64 %t1774, %t1800
  %t1805 = select i1 %t1804, i64 257, i64 1
  br label %fixmerge629
fixslow628:
  %t1806 = call i64 @rt_lt(i64 %t1774, i64 %t1800)
  br label %fixmerge629
fixmerge629:
  %t1807 = phi i64 [ %t1805, %fixfast627 ], [ %t1806, %fixslow628 ]
  %t1808 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1808)
  %t1809 = and i64 %t1808, -8
  %t1810 = inttoptr i64 %t1809 to ptr
  %t1811 = load i64, ptr %t1810
  %t1812 = inttoptr i64 %t1811 to ptr
  %t1813 = call fastcc i64%t1812(i64 %t1808, i64 3, i64 %a0, i64 %t1800, i64 %t1751, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1814 = or i64 %t1768, %t1774
  %t1815 = and i64 %t1814, 7
  %t1816 = icmp eq i64 %t1815, 0
  br i1 %t1816, label %fixfast630, label %fixslow631
fixfast630:
  %t1817 = icmp slt i64 %t1768, %t1774
  %t1818 = select i1 %t1817, i64 257, i64 1
  br label %fixmerge632
fixslow631:
  %t1819 = call i64 @rt_lt(i64 %t1768, i64 %t1774)
  br label %fixmerge632
fixmerge632:
  %t1820 = phi i64 [ %t1818, %fixfast630 ], [ %t1819, %fixslow631 ]
  %t1821 = icmp ne i64 %t1820, 1
  br i1 %t1821, label %then633, label %else634
then633:
  br label %merge635
else634:
  %t1822 = or i64 %t1800, %t1813
  %t1823 = and i64 %t1822, 7
  %t1824 = icmp eq i64 %t1823, 0
  br i1 %t1824, label %fixfast636, label %fixslow637
fixfast636:
  %t1825 = icmp slt i64 %t1800, %t1813
  %t1826 = select i1 %t1825, i64 257, i64 1
  br label %fixmerge638
fixslow637:
  %t1827 = call i64 @rt_lt(i64 %t1800, i64 %t1813)
  br label %fixmerge638
fixmerge638:
  %t1828 = phi i64 [ %t1826, %fixfast636 ], [ %t1827, %fixslow637 ]
  br label %merge635
merge635:
  %t1829 = phi i64 [ %t1820, %then633 ], [ %t1828, %fixmerge638 ]
  %t1830 = icmp ne i64 %t1829, 1
  br i1 %t1830, label %then639, label %else640
then639:
  %t1831 = or i64 %t1813, %t1751
  %t1832 = and i64 %t1831, 7
  %t1833 = icmp eq i64 %t1832, 0
  br i1 %t1833, label %fixfast641, label %fixslow642
fixfast641:
  %t1834 = icmp slt i64 %t1813, %t1751
  %t1835 = select i1 %t1834, i64 257, i64 1
  br label %fixmerge643
fixslow642:
  %t1836 = call i64 @rt_lt(i64 %t1813, i64 %t1751)
  br label %fixmerge643
fixmerge643:
  %t1837 = phi i64 [ %t1835, %fixfast641 ], [ %t1836, %fixslow642 ]
  %t1838 = icmp ne i64 %t1837, 1
  br i1 %t1838, label %then644, label %else645
then644:
  %t1839 = call i64 @rt_string_ref(i64 %a0, i64 %t1813)
  %t1840 = load i64, ptr @"emit.internal:rd-exp-char?"
  call void @rt_check_callable(i64 %t1840)
  %t1841 = and i64 %t1840, -8
  %t1842 = inttoptr i64 %t1841 to ptr
  %t1843 = load i64, ptr %t1842
  %t1844 = inttoptr i64 %t1843 to ptr
  %t1845 = call fastcc i64%t1844(i64 %t1840, i64 1, i64 %t1839, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge646
else645:
  br label %merge646
merge646:
  %t1846 = phi i64 [ %t1845, %then644 ], [ 1, %else645 ]
  %t1847 = icmp ne i64 %t1846, 1
  br i1 %t1847, label %then647, label %else648
then647:
  %t1848 = or i64 %t1813, 8
  %t1849 = and i64 %t1848, 7
  %t1850 = icmp eq i64 %t1849, 0
  br i1 %t1850, label %fixfast650, label %fixslow651
fixfast650:
  %t1851 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1813, i64 8)
  %t1852 = extractvalue {i64, i1} %t1851, 0
  %t1853 = extractvalue {i64, i1} %t1851, 1
  br i1 %t1853, label %fixslow651, label %fixmerge652
fixslow651:
  %t1854 = call i64 @rt_add(i64 %t1813, i64 8)
  br label %fixmerge652
fixmerge652:
  %t1855 = phi i64 [ %t1852, %fixfast650 ], [ %t1854, %fixslow651 ]
  %t1856 = or i64 %t1855, %t1751
  %t1857 = and i64 %t1856, 7
  %t1858 = icmp eq i64 %t1857, 0
  br i1 %t1858, label %fixfast653, label %fixslow654
fixfast653:
  %t1859 = icmp slt i64 %t1855, %t1751
  %t1860 = select i1 %t1859, i64 257, i64 1
  br label %fixmerge655
fixslow654:
  %t1861 = call i64 @rt_lt(i64 %t1855, i64 %t1751)
  br label %fixmerge655
fixmerge655:
  %t1862 = phi i64 [ %t1860, %fixfast653 ], [ %t1861, %fixslow654 ]
  %t1863 = icmp ne i64 %t1862, 1
  br i1 %t1863, label %then656, label %else657
then656:
  %t1864 = or i64 %t1813, 8
  %t1865 = and i64 %t1864, 7
  %t1866 = icmp eq i64 %t1865, 0
  br i1 %t1866, label %fixfast659, label %fixslow660
fixfast659:
  %t1867 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1813, i64 8)
  %t1868 = extractvalue {i64, i1} %t1867, 0
  %t1869 = extractvalue {i64, i1} %t1867, 1
  br i1 %t1869, label %fixslow660, label %fixmerge661
fixslow660:
  %t1870 = call i64 @rt_add(i64 %t1813, i64 8)
  br label %fixmerge661
fixmerge661:
  %t1871 = phi i64 [ %t1868, %fixfast659 ], [ %t1870, %fixslow660 ]
  %t1872 = call i64 @rt_string_ref(i64 %a0, i64 %t1871)
  %t1873 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1873)
  %t1874 = and i64 %t1873, -8
  %t1875 = inttoptr i64 %t1874 to ptr
  %t1876 = load i64, ptr %t1875
  %t1877 = inttoptr i64 %t1876 to ptr
  %t1878 = call fastcc i64%t1877(i64 %t1873, i64 1, i64 %t1872, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge658
else657:
  br label %merge658
merge658:
  %t1879 = phi i64 [ %t1878, %fixmerge661 ], [ 1, %else657 ]
  %t1880 = icmp ne i64 %t1879, 1
  br i1 %t1880, label %then662, label %else663
then662:
  %t1881 = or i64 %t1813, 16
  %t1882 = and i64 %t1881, 7
  %t1883 = icmp eq i64 %t1882, 0
  br i1 %t1883, label %fixfast665, label %fixslow666
fixfast665:
  %t1884 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1813, i64 16)
  %t1885 = extractvalue {i64, i1} %t1884, 0
  %t1886 = extractvalue {i64, i1} %t1884, 1
  br i1 %t1886, label %fixslow666, label %fixmerge667
fixslow666:
  %t1887 = call i64 @rt_add(i64 %t1813, i64 16)
  br label %fixmerge667
fixmerge667:
  %t1888 = phi i64 [ %t1885, %fixfast665 ], [ %t1887, %fixslow666 ]
  br label %merge664
else663:
  %t1889 = or i64 %t1813, 8
  %t1890 = and i64 %t1889, 7
  %t1891 = icmp eq i64 %t1890, 0
  br i1 %t1891, label %fixfast668, label %fixslow669
fixfast668:
  %t1892 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1813, i64 8)
  %t1893 = extractvalue {i64, i1} %t1892, 0
  %t1894 = extractvalue {i64, i1} %t1892, 1
  br i1 %t1894, label %fixslow669, label %fixmerge670
fixslow669:
  %t1895 = call i64 @rt_add(i64 %t1813, i64 8)
  br label %fixmerge670
fixmerge670:
  %t1896 = phi i64 [ %t1893, %fixfast668 ], [ %t1895, %fixslow669 ]
  br label %merge664
merge664:
  %t1897 = phi i64 [ %t1888, %fixmerge667 ], [ %t1896, %fixmerge670 ]
  %t1898 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1898)
  %t1899 = and i64 %t1898, -8
  %t1900 = inttoptr i64 %t1899 to ptr
  %t1901 = load i64, ptr %t1900
  %t1902 = inttoptr i64 %t1901 to ptr
  %t1903 = call fastcc i64%t1902(i64 %t1898, i64 3, i64 %a0, i64 %t1897, i64 %t1751, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1904 = or i64 %t1897, %t1903
  %t1905 = and i64 %t1904, 7
  %t1906 = icmp eq i64 %t1905, 0
  br i1 %t1906, label %fixfast671, label %fixslow672
fixfast671:
  %t1907 = icmp slt i64 %t1897, %t1903
  %t1908 = select i1 %t1907, i64 257, i64 1
  br label %fixmerge673
fixslow672:
  %t1909 = call i64 @rt_lt(i64 %t1897, i64 %t1903)
  br label %fixmerge673
fixmerge673:
  %t1910 = phi i64 [ %t1908, %fixfast671 ], [ %t1909, %fixslow672 ]
  %t1911 = icmp ne i64 %t1910, 1
  br i1 %t1911, label %then674, label %else675
then674:
  br label %merge676
else675:
  br label %merge676
merge676:
  %t1912 = phi i64 [ %t1903, %then674 ], [ -8, %else675 ]
  br label %merge649
else648:
  br label %merge649
merge649:
  %t1913 = phi i64 [ %t1912, %merge676 ], [ %t1813, %else648 ]
  %t1914 = or i64 -8, %t1913
  %t1915 = and i64 %t1914, 7
  %t1916 = icmp eq i64 %t1915, 0
  br i1 %t1916, label %fixfast677, label %fixslow678
fixfast677:
  %t1917 = icmp slt i64 -8, %t1913
  %t1918 = select i1 %t1917, i64 257, i64 1
  br label %fixmerge679
fixslow678:
  %t1919 = call i64 @rt_lt(i64 -8, i64 %t1913)
  br label %fixmerge679
fixmerge679:
  %t1920 = phi i64 [ %t1918, %fixfast677 ], [ %t1919, %fixslow678 ]
  %t1921 = icmp ne i64 %t1920, 1
  br i1 %t1921, label %then680, label %else681
then680:
  %t1922 = or i64 %t1913, %t1751
  %t1923 = and i64 %t1922, 7
  %t1924 = icmp eq i64 %t1923, 0
  br i1 %t1924, label %fixfast682, label %fixslow683
fixfast682:
  %t1925 = icmp eq i64 %t1913, %t1751
  %t1926 = select i1 %t1925, i64 257, i64 1
  br label %fixmerge684
fixslow683:
  %t1927 = call i64 @rt_num_eq(i64 %t1913, i64 %t1751)
  br label %fixmerge684
fixmerge684:
  %t1928 = phi i64 [ %t1926, %fixfast682 ], [ %t1927, %fixslow683 ]
  %t1929 = icmp ne i64 %t1928, 1
  br i1 %t1929, label %then685, label %else686
then685:
  %t1930 = icmp ne i64 %t1807, 1
  br i1 %t1930, label %then687, label %else688
then687:
  ret i64 %t1807
else688:
  %t1931 = or i64 %t1813, %t1913
  %t1932 = and i64 %t1931, 7
  %t1933 = icmp eq i64 %t1932, 0
  br i1 %t1933, label %fixfast689, label %fixslow690
fixfast689:
  %t1934 = icmp slt i64 %t1813, %t1913
  %t1935 = select i1 %t1934, i64 257, i64 1
  br label %fixmerge691
fixslow690:
  %t1936 = call i64 @rt_lt(i64 %t1813, i64 %t1913)
  br label %fixmerge691
fixmerge691:
  %t1937 = phi i64 [ %t1935, %fixfast689 ], [ %t1936, %fixslow690 ]
  ret i64 %t1937
else686:
  ret i64 1
else681:
  ret i64 1
else640:
  ret i64 1
else611:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_817"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1942 = icmp eq i64 %argc, 1
  br i1 %t1942, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok693:
  %t1943 = and i64 %self, -8
  %t1944 = inttoptr i64 %t1943 to ptr
  %t1945 = getelementptr i64, ptr %t1944, i64 1
  %t1946 = load i64, ptr %t1945
  %t1947 = or i64 %a0, %t1946
  %t1948 = and i64 %t1947, 7
  %t1949 = icmp eq i64 %t1948, 0
  br i1 %t1949, label %fixfast694, label %fixslow695
fixfast694:
  %t1950 = icmp slt i64 %a0, %t1946
  %t1951 = select i1 %t1950, i64 257, i64 1
  br label %fixmerge696
fixslow695:
  %t1952 = call i64 @rt_lt(i64 %a0, i64 %t1946)
  br label %fixmerge696
fixmerge696:
  %t1953 = phi i64 [ %t1951, %fixfast694 ], [ %t1952, %fixslow695 ]
  %t1954 = icmp ne i64 %t1953, 1
  br i1 %t1954, label %then697, label %else698
then697:
  %t1955 = and i64 %self, -8
  %t1956 = inttoptr i64 %t1955 to ptr
  %t1957 = getelementptr i64, ptr %t1956, i64 2
  %t1958 = load i64, ptr %t1957
  %t1959 = call i64 @rt_string_ref(i64 %t1958, i64 %a0)
  %t1960 = load i64, ptr @"emit.internal:rd-fold-char"
  call void @rt_check_callable(i64 %t1960)
  %t1961 = and i64 %t1960, -8
  %t1962 = inttoptr i64 %t1961 to ptr
  %t1963 = load i64, ptr %t1962
  %t1964 = inttoptr i64 %t1963 to ptr
  %t1965 = call fastcc i64%t1964(i64 %t1960, i64 1, i64 %t1959, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1966 = call i64 @rt_char_to_integer(i64 %t1965)
  %t1967 = and i64 %self, -8
  %t1968 = inttoptr i64 %t1967 to ptr
  %t1969 = getelementptr i64, ptr %t1968, i64 3
  %t1970 = load i64, ptr %t1969
  %t1971 = call i64 @rt_string_ref(i64 %t1970, i64 %a0)
  %t1972 = call i64 @rt_char_to_integer(i64 %t1971)
  %t1973 = or i64 %t1966, %t1972
  %t1974 = and i64 %t1973, 7
  %t1975 = icmp eq i64 %t1974, 0
  br i1 %t1975, label %fixfast699, label %fixslow700
fixfast699:
  %t1976 = icmp eq i64 %t1966, %t1972
  %t1977 = select i1 %t1976, i64 257, i64 1
  br label %fixmerge701
fixslow700:
  %t1978 = call i64 @rt_num_eq(i64 %t1966, i64 %t1972)
  br label %fixmerge701
fixmerge701:
  %t1979 = phi i64 [ %t1977, %fixfast699 ], [ %t1978, %fixslow700 ]
  %t1980 = icmp ne i64 %t1979, 1
  br i1 %t1980, label %then702, label %else703
then702:
  %t1981 = or i64 %a0, 8
  %t1982 = and i64 %t1981, 7
  %t1983 = icmp eq i64 %t1982, 0
  br i1 %t1983, label %fixfast704, label %fixslow705
fixfast704:
  %t1984 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t1985 = extractvalue {i64, i1} %t1984, 0
  %t1986 = extractvalue {i64, i1} %t1984, 1
  br i1 %t1986, label %fixslow705, label %fixmerge706
fixslow705:
  %t1987 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge706
fixmerge706:
  %t1988 = phi i64 [ %t1985, %fixfast704 ], [ %t1987, %fixslow705 ]
  %t1989 = musttail call fastcc i64 @"emit.internal:code_817"(i64 %self, i64 1, i64 %t1988, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1989
else703:
  ret i64 1
else698:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-ci=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1990 = icmp eq i64 %argc, 2
  br i1 %t1990, label %argok708, label %arityerr707
arityerr707:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok708:
  %t1991 = call i64 @rt_string_length(i64 %a0)
  %t1992 = call i64 @rt_string_length(i64 %a1)
  %t1993 = or i64 %t1991, %t1992
  %t1994 = and i64 %t1993, 7
  %t1995 = icmp eq i64 %t1994, 0
  br i1 %t1995, label %fixfast709, label %fixslow710
fixfast709:
  %t1996 = icmp eq i64 %t1991, %t1992
  %t1997 = select i1 %t1996, i64 257, i64 1
  br label %fixmerge711
fixslow710:
  %t1998 = call i64 @rt_num_eq(i64 %t1991, i64 %t1992)
  br label %fixmerge711
fixmerge711:
  %t1999 = phi i64 [ %t1997, %fixfast709 ], [ %t1998, %fixslow710 ]
  %t2000 = icmp ne i64 %t1999, 1
  br i1 %t2000, label %then712, label %else713
then712:
  %t2001 = call ptr @rt_alloc_words(i64 5)
  %t2002 = ptrtoint ptr %t2001 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_817" to i64), ptr %t2001
  %t2003 = or i64 %t2002, 4
  %t2004 = getelementptr i64, ptr %t2001, i64 1
  store i64 %t1991, ptr %t2004
  %t2005 = getelementptr i64, ptr %t2001, i64 2
  store i64 %a0, ptr %t2005
  %t2006 = getelementptr i64, ptr %t2001, i64 3
  store i64 %a1, ptr %t2006
  %t2007 = getelementptr i64, ptr %t2001, i64 4
  store i64 %t2003, ptr %t2007
  %t2008 = musttail call fastcc i64 @"emit.internal:code_817"(i64 %t2003, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2008
else713:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2013 = icmp eq i64 %argc, 1
  br i1 %t2013, label %argok715, label %arityerr714
arityerr714:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok715:
  %t2014 = call i64 @rt_make_string(ptr @.str.lit.2, i64 6)
  %t2015 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t2015)
  %t2016 = and i64 %t2015, -8
  %t2017 = inttoptr i64 %t2016 to ptr
  %t2018 = load i64, ptr %t2017
  %t2019 = inttoptr i64 %t2018 to ptr
  %t2020 = call fastcc i64%t2019(i64 %t2015, i64 2, i64 %a0, i64 %t2014, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2021 = icmp ne i64 %t2020, 1
  br i1 %t2021, label %then716, label %else717
then716:
  %t2022 = call i64 @rt_make_string(ptr @.str.lit.3, i64 3)
  %t2023 = call i64 @rt_string_to_flonum(i64 %t2022)
  ret i64 %t2023
else717:
  %t2024 = call i64 @rt_make_string(ptr @.str.lit.4, i64 6)
  %t2025 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t2025)
  %t2026 = and i64 %t2025, -8
  %t2027 = inttoptr i64 %t2026 to ptr
  %t2028 = load i64, ptr %t2027
  %t2029 = inttoptr i64 %t2028 to ptr
  %t2030 = call fastcc i64%t2029(i64 %t2025, i64 2, i64 %a0, i64 %t2024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2031 = icmp ne i64 %t2030, 1
  br i1 %t2031, label %then718, label %else719
then718:
  %t2032 = call i64 @rt_make_string(ptr @.str.lit.5, i64 4)
  %t2033 = call i64 @rt_string_to_flonum(i64 %t2032)
  ret i64 %t2033
else719:
  %t2034 = call i64 @rt_make_string(ptr @.str.lit.6, i64 6)
  %t2035 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t2035)
  %t2036 = and i64 %t2035, -8
  %t2037 = inttoptr i64 %t2036 to ptr
  %t2038 = load i64, ptr %t2037
  %t2039 = inttoptr i64 %t2038 to ptr
  %t2040 = call fastcc i64%t2039(i64 %t2035, i64 2, i64 %a0, i64 %t2034, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2041 = icmp ne i64 %t2040, 1
  br i1 %t2041, label %then720, label %else721
then720:
  %t2042 = call i64 @rt_make_string(ptr @.str.lit.7, i64 3)
  %t2043 = call i64 @rt_string_to_flonum(i64 %t2042)
  ret i64 %t2043
else721:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-radix-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2048 = icmp eq i64 %argc, 1
  br i1 %t2048, label %argok723, label %arityerr722
arityerr722:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok723:
  %t2049 = call i64 @rt_char_to_integer(i64 %a0)
  %t2050 = or i64 %t2049, 784
  %t2051 = and i64 %t2050, 7
  %t2052 = icmp eq i64 %t2051, 0
  br i1 %t2052, label %fixfast724, label %fixslow725
fixfast724:
  %t2053 = icmp eq i64 %t2049, 784
  %t2054 = select i1 %t2053, i64 257, i64 1
  br label %fixmerge726
fixslow725:
  %t2055 = call i64 @rt_num_eq(i64 %t2049, i64 784)
  br label %fixmerge726
fixmerge726:
  %t2056 = phi i64 [ %t2054, %fixfast724 ], [ %t2055, %fixslow725 ]
  %t2057 = icmp ne i64 %t2056, 1
  br i1 %t2057, label %then727, label %else728
then727:
  br label %merge729
else728:
  %t2058 = or i64 %t2049, 528
  %t2059 = and i64 %t2058, 7
  %t2060 = icmp eq i64 %t2059, 0
  br i1 %t2060, label %fixfast730, label %fixslow731
fixfast730:
  %t2061 = icmp eq i64 %t2049, 528
  %t2062 = select i1 %t2061, i64 257, i64 1
  br label %fixmerge732
fixslow731:
  %t2063 = call i64 @rt_num_eq(i64 %t2049, i64 528)
  br label %fixmerge732
fixmerge732:
  %t2064 = phi i64 [ %t2062, %fixfast730 ], [ %t2063, %fixslow731 ]
  br label %merge729
merge729:
  %t2065 = phi i64 [ %t2056, %then727 ], [ %t2064, %fixmerge732 ]
  %t2066 = icmp ne i64 %t2065, 1
  br i1 %t2066, label %then733, label %else734
then733:
  ret i64 16
else734:
  %t2067 = or i64 %t2049, 888
  %t2068 = and i64 %t2067, 7
  %t2069 = icmp eq i64 %t2068, 0
  br i1 %t2069, label %fixfast735, label %fixslow736
fixfast735:
  %t2070 = icmp eq i64 %t2049, 888
  %t2071 = select i1 %t2070, i64 257, i64 1
  br label %fixmerge737
fixslow736:
  %t2072 = call i64 @rt_num_eq(i64 %t2049, i64 888)
  br label %fixmerge737
fixmerge737:
  %t2073 = phi i64 [ %t2071, %fixfast735 ], [ %t2072, %fixslow736 ]
  %t2074 = icmp ne i64 %t2073, 1
  br i1 %t2074, label %then738, label %else739
then738:
  br label %merge740
else739:
  %t2075 = or i64 %t2049, 632
  %t2076 = and i64 %t2075, 7
  %t2077 = icmp eq i64 %t2076, 0
  br i1 %t2077, label %fixfast741, label %fixslow742
fixfast741:
  %t2078 = icmp eq i64 %t2049, 632
  %t2079 = select i1 %t2078, i64 257, i64 1
  br label %fixmerge743
fixslow742:
  %t2080 = call i64 @rt_num_eq(i64 %t2049, i64 632)
  br label %fixmerge743
fixmerge743:
  %t2081 = phi i64 [ %t2079, %fixfast741 ], [ %t2080, %fixslow742 ]
  br label %merge740
merge740:
  %t2082 = phi i64 [ %t2073, %then738 ], [ %t2081, %fixmerge743 ]
  %t2083 = icmp ne i64 %t2082, 1
  br i1 %t2083, label %then744, label %else745
then744:
  ret i64 64
else745:
  %t2084 = or i64 %t2049, 800
  %t2085 = and i64 %t2084, 7
  %t2086 = icmp eq i64 %t2085, 0
  br i1 %t2086, label %fixfast746, label %fixslow747
fixfast746:
  %t2087 = icmp eq i64 %t2049, 800
  %t2088 = select i1 %t2087, i64 257, i64 1
  br label %fixmerge748
fixslow747:
  %t2089 = call i64 @rt_num_eq(i64 %t2049, i64 800)
  br label %fixmerge748
fixmerge748:
  %t2090 = phi i64 [ %t2088, %fixfast746 ], [ %t2089, %fixslow747 ]
  %t2091 = icmp ne i64 %t2090, 1
  br i1 %t2091, label %then749, label %else750
then749:
  br label %merge751
else750:
  %t2092 = or i64 %t2049, 544
  %t2093 = and i64 %t2092, 7
  %t2094 = icmp eq i64 %t2093, 0
  br i1 %t2094, label %fixfast752, label %fixslow753
fixfast752:
  %t2095 = icmp eq i64 %t2049, 544
  %t2096 = select i1 %t2095, i64 257, i64 1
  br label %fixmerge754
fixslow753:
  %t2097 = call i64 @rt_num_eq(i64 %t2049, i64 544)
  br label %fixmerge754
fixmerge754:
  %t2098 = phi i64 [ %t2096, %fixfast752 ], [ %t2097, %fixslow753 ]
  br label %merge751
merge751:
  %t2099 = phi i64 [ %t2090, %then749 ], [ %t2098, %fixmerge754 ]
  %t2100 = icmp ne i64 %t2099, 1
  br i1 %t2100, label %then755, label %else756
then755:
  ret i64 80
else756:
  %t2101 = or i64 %t2049, 960
  %t2102 = and i64 %t2101, 7
  %t2103 = icmp eq i64 %t2102, 0
  br i1 %t2103, label %fixfast757, label %fixslow758
fixfast757:
  %t2104 = icmp eq i64 %t2049, 960
  %t2105 = select i1 %t2104, i64 257, i64 1
  br label %fixmerge759
fixslow758:
  %t2106 = call i64 @rt_num_eq(i64 %t2049, i64 960)
  br label %fixmerge759
fixmerge759:
  %t2107 = phi i64 [ %t2105, %fixfast757 ], [ %t2106, %fixslow758 ]
  %t2108 = icmp ne i64 %t2107, 1
  br i1 %t2108, label %then760, label %else761
then760:
  br label %merge762
else761:
  %t2109 = or i64 %t2049, 704
  %t2110 = and i64 %t2109, 7
  %t2111 = icmp eq i64 %t2110, 0
  br i1 %t2111, label %fixfast763, label %fixslow764
fixfast763:
  %t2112 = icmp eq i64 %t2049, 704
  %t2113 = select i1 %t2112, i64 257, i64 1
  br label %fixmerge765
fixslow764:
  %t2114 = call i64 @rt_num_eq(i64 %t2049, i64 704)
  br label %fixmerge765
fixmerge765:
  %t2115 = phi i64 [ %t2113, %fixfast763 ], [ %t2114, %fixslow764 ]
  br label %merge762
merge762:
  %t2116 = phi i64 [ %t2107, %then760 ], [ %t2115, %fixmerge765 ]
  %t2117 = icmp ne i64 %t2116, 1
  br i1 %t2117, label %then766, label %else767
then766:
  ret i64 128
else767:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2122 = icmp eq i64 %argc, 1
  br i1 %t2122, label %argok769, label %arityerr768
arityerr768:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok769:
  %t2123 = call i64 @rt_char_to_integer(i64 %a0)
  %t2124 = or i64 %t2123, 808
  %t2125 = and i64 %t2124, 7
  %t2126 = icmp eq i64 %t2125, 0
  br i1 %t2126, label %fixfast770, label %fixslow771
fixfast770:
  %t2127 = icmp eq i64 %t2123, 808
  %t2128 = select i1 %t2127, i64 257, i64 1
  br label %fixmerge772
fixslow771:
  %t2129 = call i64 @rt_num_eq(i64 %t2123, i64 808)
  br label %fixmerge772
fixmerge772:
  %t2130 = phi i64 [ %t2128, %fixfast770 ], [ %t2129, %fixslow771 ]
  %t2131 = icmp ne i64 %t2130, 1
  br i1 %t2131, label %then773, label %else774
then773:
  br label %merge775
else774:
  %t2132 = or i64 %t2123, 552
  %t2133 = and i64 %t2132, 7
  %t2134 = icmp eq i64 %t2133, 0
  br i1 %t2134, label %fixfast776, label %fixslow777
fixfast776:
  %t2135 = icmp eq i64 %t2123, 552
  %t2136 = select i1 %t2135, i64 257, i64 1
  br label %fixmerge778
fixslow777:
  %t2137 = call i64 @rt_num_eq(i64 %t2123, i64 552)
  br label %fixmerge778
fixmerge778:
  %t2138 = phi i64 [ %t2136, %fixfast776 ], [ %t2137, %fixslow777 ]
  br label %merge775
merge775:
  %t2139 = phi i64 [ %t2130, %then773 ], [ %t2138, %fixmerge778 ]
  %t2140 = icmp ne i64 %t2139, 1
  br i1 %t2140, label %then779, label %else780
then779:
  ret i64 8
else780:
  %t2141 = or i64 %t2123, 840
  %t2142 = and i64 %t2141, 7
  %t2143 = icmp eq i64 %t2142, 0
  br i1 %t2143, label %fixfast781, label %fixslow782
fixfast781:
  %t2144 = icmp eq i64 %t2123, 840
  %t2145 = select i1 %t2144, i64 257, i64 1
  br label %fixmerge783
fixslow782:
  %t2146 = call i64 @rt_num_eq(i64 %t2123, i64 840)
  br label %fixmerge783
fixmerge783:
  %t2147 = phi i64 [ %t2145, %fixfast781 ], [ %t2146, %fixslow782 ]
  %t2148 = icmp ne i64 %t2147, 1
  br i1 %t2148, label %then784, label %else785
then784:
  br label %merge786
else785:
  %t2149 = or i64 %t2123, 584
  %t2150 = and i64 %t2149, 7
  %t2151 = icmp eq i64 %t2150, 0
  br i1 %t2151, label %fixfast787, label %fixslow788
fixfast787:
  %t2152 = icmp eq i64 %t2123, 584
  %t2153 = select i1 %t2152, i64 257, i64 1
  br label %fixmerge789
fixslow788:
  %t2154 = call i64 @rt_num_eq(i64 %t2123, i64 584)
  br label %fixmerge789
fixmerge789:
  %t2155 = phi i64 [ %t2153, %fixfast787 ], [ %t2154, %fixslow788 ]
  br label %merge786
merge786:
  %t2156 = phi i64 [ %t2147, %then784 ], [ %t2155, %fixmerge789 ]
  %t2157 = icmp ne i64 %t2156, 1
  br i1 %t2157, label %then790, label %else791
then790:
  ret i64 16
else791:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-scan-prefixes"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2162 = icmp eq i64 %argc, 5
  br i1 %t2162, label %argok793, label %arityerr792
arityerr792:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok793:
  %t2163 = or i64 %a2, %a1
  %t2164 = and i64 %t2163, 7
  %t2165 = icmp eq i64 %t2164, 0
  br i1 %t2165, label %fixfast794, label %fixslow795
fixfast794:
  %t2166 = icmp slt i64 %a2, %a1
  %t2167 = select i1 %t2166, i64 257, i64 1
  br label %fixmerge796
fixslow795:
  %t2168 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge796
fixmerge796:
  %t2169 = phi i64 [ %t2167, %fixfast794 ], [ %t2168, %fixslow795 ]
  %t2170 = icmp ne i64 %t2169, 1
  br i1 %t2170, label %then797, label %else798
then797:
  %t2171 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2172 = call i64 @rt_char_to_integer(i64 %t2171)
  %t2173 = or i64 %t2172, 280
  %t2174 = and i64 %t2173, 7
  %t2175 = icmp eq i64 %t2174, 0
  br i1 %t2175, label %fixfast800, label %fixslow801
fixfast800:
  %t2176 = icmp eq i64 %t2172, 280
  %t2177 = select i1 %t2176, i64 257, i64 1
  br label %fixmerge802
fixslow801:
  %t2178 = call i64 @rt_num_eq(i64 %t2172, i64 280)
  br label %fixmerge802
fixmerge802:
  %t2179 = phi i64 [ %t2177, %fixfast800 ], [ %t2178, %fixslow801 ]
  br label %merge799
else798:
  br label %merge799
merge799:
  %t2180 = phi i64 [ %t2179, %fixmerge802 ], [ 1, %else798 ]
  %t2181 = icmp ne i64 %t2180, 1
  br i1 %t2181, label %then803, label %else804
then803:
  %t2182 = or i64 %a2, 8
  %t2183 = and i64 %t2182, 7
  %t2184 = icmp eq i64 %t2183, 0
  br i1 %t2184, label %fixfast805, label %fixslow806
fixfast805:
  %t2185 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2186 = extractvalue {i64, i1} %t2185, 0
  %t2187 = extractvalue {i64, i1} %t2185, 1
  br i1 %t2187, label %fixslow806, label %fixmerge807
fixslow806:
  %t2188 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge807
fixmerge807:
  %t2189 = phi i64 [ %t2186, %fixfast805 ], [ %t2188, %fixslow806 ]
  %t2190 = or i64 %t2189, %a1
  %t2191 = and i64 %t2190, 7
  %t2192 = icmp eq i64 %t2191, 0
  br i1 %t2192, label %fixfast808, label %fixslow809
fixfast808:
  %t2193 = icmp slt i64 %t2189, %a1
  %t2194 = select i1 %t2193, i64 257, i64 1
  br label %fixmerge810
fixslow809:
  %t2195 = call i64 @rt_lt(i64 %t2189, i64 %a1)
  br label %fixmerge810
fixmerge810:
  %t2196 = phi i64 [ %t2194, %fixfast808 ], [ %t2195, %fixslow809 ]
  %t2197 = icmp ne i64 %t2196, 1
  br i1 %t2197, label %then811, label %else812
then811:
  %t2198 = or i64 %a2, 8
  %t2199 = and i64 %t2198, 7
  %t2200 = icmp eq i64 %t2199, 0
  br i1 %t2200, label %fixfast813, label %fixslow814
fixfast813:
  %t2201 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2202 = extractvalue {i64, i1} %t2201, 0
  %t2203 = extractvalue {i64, i1} %t2201, 1
  br i1 %t2203, label %fixslow814, label %fixmerge815
fixslow814:
  %t2204 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge815
fixmerge815:
  %t2205 = phi i64 [ %t2202, %fixfast813 ], [ %t2204, %fixslow814 ]
  %t2206 = call i64 @rt_string_ref(i64 %a0, i64 %t2205)
  %t2207 = load i64, ptr @"emit.internal:rd-radix-letter"
  call void @rt_check_callable(i64 %t2207)
  %t2208 = and i64 %t2207, -8
  %t2209 = inttoptr i64 %t2208 to ptr
  %t2210 = load i64, ptr %t2209
  %t2211 = inttoptr i64 %t2210 to ptr
  %t2212 = call fastcc i64%t2211(i64 %t2207, i64 1, i64 %t2206, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2213 = icmp ne i64 %t2212, 1
  br i1 %t2213, label %then816, label %else817
then816:
  %t2214 = icmp ne i64 %a3, 1
  br i1 %t2214, label %then818, label %else819
then818:
  ret i64 1
else819:
  %t2215 = or i64 %a2, 16
  %t2216 = and i64 %t2215, 7
  %t2217 = icmp eq i64 %t2216, 0
  br i1 %t2217, label %fixfast820, label %fixslow821
fixfast820:
  %t2218 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2219 = extractvalue {i64, i1} %t2218, 0
  %t2220 = extractvalue {i64, i1} %t2218, 1
  br i1 %t2220, label %fixslow821, label %fixmerge822
fixslow821:
  %t2221 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge822
fixmerge822:
  %t2222 = phi i64 [ %t2219, %fixfast820 ], [ %t2221, %fixslow821 ]
  %t2223 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2223)
  %t2224 = and i64 %t2223, -8
  %t2225 = inttoptr i64 %t2224 to ptr
  %t2226 = load i64, ptr %t2225
  %t2227 = inttoptr i64 %t2226 to ptr
  %t2228 = musttail call fastcc i64 %t2227(i64 %t2223, i64 5, i64 %a0, i64 %a1, i64 %t2222, i64 %t2212, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2228
else817:
  %t2229 = or i64 %a2, 8
  %t2230 = and i64 %t2229, 7
  %t2231 = icmp eq i64 %t2230, 0
  br i1 %t2231, label %fixfast823, label %fixslow824
fixfast823:
  %t2232 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2233 = extractvalue {i64, i1} %t2232, 0
  %t2234 = extractvalue {i64, i1} %t2232, 1
  br i1 %t2234, label %fixslow824, label %fixmerge825
fixslow824:
  %t2235 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge825
fixmerge825:
  %t2236 = phi i64 [ %t2233, %fixfast823 ], [ %t2235, %fixslow824 ]
  %t2237 = call i64 @rt_string_ref(i64 %a0, i64 %t2236)
  %t2238 = load i64, ptr @"emit.internal:rd-exactness-letter"
  call void @rt_check_callable(i64 %t2238)
  %t2239 = and i64 %t2238, -8
  %t2240 = inttoptr i64 %t2239 to ptr
  %t2241 = load i64, ptr %t2240
  %t2242 = inttoptr i64 %t2241 to ptr
  %t2243 = call fastcc i64%t2242(i64 %t2238, i64 1, i64 %t2237, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2244 = icmp ne i64 %t2243, 1
  br i1 %t2244, label %then826, label %else827
then826:
  %t2245 = icmp ne i64 %a4, 1
  br i1 %t2245, label %then828, label %else829
then828:
  ret i64 1
else829:
  %t2246 = or i64 %a2, 16
  %t2247 = and i64 %t2246, 7
  %t2248 = icmp eq i64 %t2247, 0
  br i1 %t2248, label %fixfast830, label %fixslow831
fixfast830:
  %t2249 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2250 = extractvalue {i64, i1} %t2249, 0
  %t2251 = extractvalue {i64, i1} %t2249, 1
  br i1 %t2251, label %fixslow831, label %fixmerge832
fixslow831:
  %t2252 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge832
fixmerge832:
  %t2253 = phi i64 [ %t2250, %fixfast830 ], [ %t2252, %fixslow831 ]
  %t2254 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2254)
  %t2255 = and i64 %t2254, -8
  %t2256 = inttoptr i64 %t2255 to ptr
  %t2257 = load i64, ptr %t2256
  %t2258 = inttoptr i64 %t2257 to ptr
  %t2259 = musttail call fastcc i64 %t2258(i64 %t2254, i64 5, i64 %a0, i64 %a1, i64 %t2253, i64 %a3, i64 %t2243, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2259
else827:
  ret i64 1
else812:
  ret i64 1
else804:
  %t2260 = call i64 @rt_cons(i64 %a4, i64 %a2)
  %t2261 = call i64 @rt_cons(i64 %a3, i64 %t2260)
  ret i64 %t2261
}

define fastcc i64 @"emit.internal:code:rd-radix-scan"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2266 = icmp eq i64 %argc, 4
  br i1 %t2266, label %argok834, label %arityerr833
arityerr833:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok834:
  %t2267 = or i64 %a2, %a1
  %t2268 = and i64 %t2267, 7
  %t2269 = icmp eq i64 %t2268, 0
  br i1 %t2269, label %fixfast835, label %fixslow836
fixfast835:
  %t2270 = icmp slt i64 %a2, %a1
  %t2271 = select i1 %t2270, i64 257, i64 1
  br label %fixmerge837
fixslow836:
  %t2272 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge837
fixmerge837:
  %t2273 = phi i64 [ %t2271, %fixfast835 ], [ %t2272, %fixslow836 ]
  %t2274 = icmp ne i64 %t2273, 1
  br i1 %t2274, label %then838, label %else839
then838:
  %t2275 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2276 = load i64, ptr @"emit.internal:%digit-in-radix"
  call void @rt_check_callable(i64 %t2276)
  %t2277 = and i64 %t2276, -8
  %t2278 = inttoptr i64 %t2277 to ptr
  %t2279 = load i64, ptr %t2278
  %t2280 = inttoptr i64 %t2279 to ptr
  %t2281 = call fastcc i64%t2280(i64 %t2276, i64 2, i64 %t2275, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge840
else839:
  br label %merge840
merge840:
  %t2282 = phi i64 [ %t2281, %then838 ], [ 1, %else839 ]
  %t2283 = icmp ne i64 %t2282, 1
  br i1 %t2283, label %then841, label %else842
then841:
  %t2284 = or i64 %a2, 8
  %t2285 = and i64 %t2284, 7
  %t2286 = icmp eq i64 %t2285, 0
  br i1 %t2286, label %fixfast843, label %fixslow844
fixfast843:
  %t2287 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2288 = extractvalue {i64, i1} %t2287, 0
  %t2289 = extractvalue {i64, i1} %t2287, 1
  br i1 %t2289, label %fixslow844, label %fixmerge845
fixslow844:
  %t2290 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge845
fixmerge845:
  %t2291 = phi i64 [ %t2288, %fixfast843 ], [ %t2290, %fixslow844 ]
  %t2292 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2292)
  %t2293 = and i64 %t2292, -8
  %t2294 = inttoptr i64 %t2293 to ptr
  %t2295 = load i64, ptr %t2294
  %t2296 = inttoptr i64 %t2295 to ptr
  %t2297 = musttail call fastcc i64 %t2296(i64 %t2292, i64 4, i64 %a0, i64 %a1, i64 %t2291, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2297
else842:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-rational-body?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2302 = icmp eq i64 %argc, 4
  br i1 %t2302, label %argok847, label %arityerr846
arityerr846:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok847:
  %t2303 = or i64 %a2, %a1
  %t2304 = and i64 %t2303, 7
  %t2305 = icmp eq i64 %t2304, 0
  br i1 %t2305, label %fixfast848, label %fixslow849
fixfast848:
  %t2306 = icmp slt i64 %a2, %a1
  %t2307 = select i1 %t2306, i64 257, i64 1
  br label %fixmerge850
fixslow849:
  %t2308 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge850
fixmerge850:
  %t2309 = phi i64 [ %t2307, %fixfast848 ], [ %t2308, %fixslow849 ]
  %t2310 = icmp ne i64 %t2309, 1
  br i1 %t2310, label %then851, label %else852
then851:
  %t2311 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2312 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t2312)
  %t2313 = and i64 %t2312, -8
  %t2314 = inttoptr i64 %t2313 to ptr
  %t2315 = load i64, ptr %t2314
  %t2316 = inttoptr i64 %t2315 to ptr
  %t2317 = call fastcc i64%t2316(i64 %t2312, i64 1, i64 %t2311, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge853
else852:
  br label %merge853
merge853:
  %t2318 = phi i64 [ %t2317, %then851 ], [ 1, %else852 ]
  %t2319 = icmp ne i64 %t2318, 1
  br i1 %t2319, label %then854, label %else855
then854:
  %t2320 = or i64 %a2, 8
  %t2321 = and i64 %t2320, 7
  %t2322 = icmp eq i64 %t2321, 0
  br i1 %t2322, label %fixfast857, label %fixslow858
fixfast857:
  %t2323 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2324 = extractvalue {i64, i1} %t2323, 0
  %t2325 = extractvalue {i64, i1} %t2323, 1
  br i1 %t2325, label %fixslow858, label %fixmerge859
fixslow858:
  %t2326 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge859
fixmerge859:
  %t2327 = phi i64 [ %t2324, %fixfast857 ], [ %t2326, %fixslow858 ]
  br label %merge856
else855:
  br label %merge856
merge856:
  %t2328 = phi i64 [ %t2327, %fixmerge859 ], [ %a2, %else855 ]
  %t2329 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2329)
  %t2330 = and i64 %t2329, -8
  %t2331 = inttoptr i64 %t2330 to ptr
  %t2332 = load i64, ptr %t2331
  %t2333 = inttoptr i64 %t2332 to ptr
  %t2334 = call fastcc i64%t2333(i64 %t2329, i64 4, i64 %a0, i64 %a1, i64 %t2328, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2335 = or i64 %t2328, %t2334
  %t2336 = and i64 %t2335, 7
  %t2337 = icmp eq i64 %t2336, 0
  br i1 %t2337, label %fixfast860, label %fixslow861
fixfast860:
  %t2338 = icmp slt i64 %t2328, %t2334
  %t2339 = select i1 %t2338, i64 257, i64 1
  br label %fixmerge862
fixslow861:
  %t2340 = call i64 @rt_lt(i64 %t2328, i64 %t2334)
  br label %fixmerge862
fixmerge862:
  %t2341 = phi i64 [ %t2339, %fixfast860 ], [ %t2340, %fixslow861 ]
  %t2342 = icmp ne i64 %t2341, 1
  br i1 %t2342, label %then863, label %else864
then863:
  %t2343 = or i64 %t2334, %a1
  %t2344 = and i64 %t2343, 7
  %t2345 = icmp eq i64 %t2344, 0
  br i1 %t2345, label %fixfast865, label %fixslow866
fixfast865:
  %t2346 = icmp slt i64 %t2334, %a1
  %t2347 = select i1 %t2346, i64 257, i64 1
  br label %fixmerge867
fixslow866:
  %t2348 = call i64 @rt_lt(i64 %t2334, i64 %a1)
  br label %fixmerge867
fixmerge867:
  %t2349 = phi i64 [ %t2347, %fixfast865 ], [ %t2348, %fixslow866 ]
  %t2350 = icmp ne i64 %t2349, 1
  br i1 %t2350, label %then868, label %else869
then868:
  %t2351 = call i64 @rt_string_ref(i64 %a0, i64 %t2334)
  %t2352 = call i64 @rt_char_to_integer(i64 %t2351)
  %t2353 = or i64 %t2352, 376
  %t2354 = and i64 %t2353, 7
  %t2355 = icmp eq i64 %t2354, 0
  br i1 %t2355, label %fixfast870, label %fixslow871
fixfast870:
  %t2356 = icmp eq i64 %t2352, 376
  %t2357 = select i1 %t2356, i64 257, i64 1
  br label %fixmerge872
fixslow871:
  %t2358 = call i64 @rt_num_eq(i64 %t2352, i64 376)
  br label %fixmerge872
fixmerge872:
  %t2359 = phi i64 [ %t2357, %fixfast870 ], [ %t2358, %fixslow871 ]
  %t2360 = icmp ne i64 %t2359, 1
  br i1 %t2360, label %then873, label %else874
then873:
  %t2361 = or i64 %t2334, 8
  %t2362 = and i64 %t2361, 7
  %t2363 = icmp eq i64 %t2362, 0
  br i1 %t2363, label %fixfast875, label %fixslow876
fixfast875:
  %t2364 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2334, i64 8)
  %t2365 = extractvalue {i64, i1} %t2364, 0
  %t2366 = extractvalue {i64, i1} %t2364, 1
  br i1 %t2366, label %fixslow876, label %fixmerge877
fixslow876:
  %t2367 = call i64 @rt_add(i64 %t2334, i64 8)
  br label %fixmerge877
fixmerge877:
  %t2368 = phi i64 [ %t2365, %fixfast875 ], [ %t2367, %fixslow876 ]
  %t2369 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2369)
  %t2370 = and i64 %t2369, -8
  %t2371 = inttoptr i64 %t2370 to ptr
  %t2372 = load i64, ptr %t2371
  %t2373 = inttoptr i64 %t2372 to ptr
  %t2374 = call fastcc i64%t2373(i64 %t2369, i64 4, i64 %a0, i64 %a1, i64 %t2368, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2375 = or i64 %t2334, 8
  %t2376 = and i64 %t2375, 7
  %t2377 = icmp eq i64 %t2376, 0
  br i1 %t2377, label %fixfast878, label %fixslow879
fixfast878:
  %t2378 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2334, i64 8)
  %t2379 = extractvalue {i64, i1} %t2378, 0
  %t2380 = extractvalue {i64, i1} %t2378, 1
  br i1 %t2380, label %fixslow879, label %fixmerge880
fixslow879:
  %t2381 = call i64 @rt_add(i64 %t2334, i64 8)
  br label %fixmerge880
fixmerge880:
  %t2382 = phi i64 [ %t2379, %fixfast878 ], [ %t2381, %fixslow879 ]
  %t2383 = or i64 %t2382, %t2374
  %t2384 = and i64 %t2383, 7
  %t2385 = icmp eq i64 %t2384, 0
  br i1 %t2385, label %fixfast881, label %fixslow882
fixfast881:
  %t2386 = icmp slt i64 %t2382, %t2374
  %t2387 = select i1 %t2386, i64 257, i64 1
  br label %fixmerge883
fixslow882:
  %t2388 = call i64 @rt_lt(i64 %t2382, i64 %t2374)
  br label %fixmerge883
fixmerge883:
  %t2389 = phi i64 [ %t2387, %fixfast881 ], [ %t2388, %fixslow882 ]
  %t2390 = icmp ne i64 %t2389, 1
  br i1 %t2390, label %then884, label %else885
then884:
  %t2391 = or i64 %t2374, %a1
  %t2392 = and i64 %t2391, 7
  %t2393 = icmp eq i64 %t2392, 0
  br i1 %t2393, label %fixfast886, label %fixslow887
fixfast886:
  %t2394 = icmp eq i64 %t2374, %a1
  %t2395 = select i1 %t2394, i64 257, i64 1
  br label %fixmerge888
fixslow887:
  %t2396 = call i64 @rt_num_eq(i64 %t2374, i64 %a1)
  br label %fixmerge888
fixmerge888:
  %t2397 = phi i64 [ %t2395, %fixfast886 ], [ %t2396, %fixslow887 ]
  ret i64 %t2397
else885:
  ret i64 1
else874:
  ret i64 1
else869:
  ret i64 1
else864:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-apply"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2402 = icmp eq i64 %argc, 2
  br i1 %t2402, label %argok890, label %arityerr889
arityerr889:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok890:
  %t2403 = call i64 @rt_not(i64 %a1)
  %t2404 = icmp ne i64 %t2403, 1
  br i1 %t2404, label %then891, label %else892
then891:
  ret i64 %a0
else892:
  %t2405 = or i64 %a1, 16
  %t2406 = and i64 %t2405, 7
  %t2407 = icmp eq i64 %t2406, 0
  br i1 %t2407, label %fixfast893, label %fixslow894
fixfast893:
  %t2408 = icmp eq i64 %a1, 16
  %t2409 = select i1 %t2408, i64 257, i64 1
  br label %fixmerge895
fixslow894:
  %t2410 = call i64 @rt_num_eq(i64 %a1, i64 16)
  br label %fixmerge895
fixmerge895:
  %t2411 = phi i64 [ %t2409, %fixfast893 ], [ %t2410, %fixslow894 ]
  %t2412 = icmp ne i64 %t2411, 1
  br i1 %t2412, label %then896, label %else897
then896:
  %t2413 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t2413
else897:
  %t2414 = call i64 @rt_exact_p(i64 %a0)
  %t2415 = icmp ne i64 %t2414, 1
  br i1 %t2415, label %then898, label %else899
then898:
  ret i64 %a0
else899:
  %t2416 = call i64 @rt_flo_truncate(i64 %a0)
  %t2417 = or i64 %a0, %t2416
  %t2418 = and i64 %t2417, 7
  %t2419 = icmp eq i64 %t2418, 0
  br i1 %t2419, label %fixfast900, label %fixslow901
fixfast900:
  %t2420 = icmp eq i64 %a0, %t2416
  %t2421 = select i1 %t2420, i64 257, i64 1
  br label %fixmerge902
fixslow901:
  %t2422 = call i64 @rt_num_eq(i64 %a0, i64 %t2416)
  br label %fixmerge902
fixmerge902:
  %t2423 = phi i64 [ %t2421, %fixfast900 ], [ %t2422, %fixslow901 ]
  %t2424 = icmp ne i64 %t2423, 1
  br i1 %t2424, label %then903, label %else904
then903:
  %t2425 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t2425
else904:
  %t2426 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2426
}

define fastcc i64 @"emit.internal:code:rd-body-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2431 = icmp eq i64 %argc, 3
  br i1 %t2431, label %argok906, label %arityerr905
arityerr905:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok906:
  %t2432 = or i64 %a1, 80
  %t2433 = and i64 %t2432, 7
  %t2434 = icmp eq i64 %t2433, 0
  br i1 %t2434, label %fixfast907, label %fixslow908
fixfast907:
  %t2435 = icmp eq i64 %a1, 80
  %t2436 = select i1 %t2435, i64 257, i64 1
  br label %fixmerge909
fixslow908:
  %t2437 = call i64 @rt_num_eq(i64 %a1, i64 80)
  br label %fixmerge909
fixmerge909:
  %t2438 = phi i64 [ %t2436, %fixfast907 ], [ %t2437, %fixslow908 ]
  %t2439 = icmp ne i64 %t2438, 1
  br i1 %t2439, label %then910, label %else911
then910:
  %t2440 = load i64, ptr @"emit.internal:rd-numeric?"
  call void @rt_check_callable(i64 %t2440)
  %t2441 = and i64 %t2440, -8
  %t2442 = inttoptr i64 %t2441 to ptr
  %t2443 = load i64, ptr %t2442
  %t2444 = inttoptr i64 %t2443 to ptr
  %t2445 = call fastcc i64%t2444(i64 %t2440, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2446 = icmp ne i64 %t2445, 1
  br i1 %t2446, label %then912, label %else913
then912:
  %t2447 = load i64, ptr @"emit.internal:rd-parse-int"
  call void @rt_check_callable(i64 %t2447)
  %t2448 = and i64 %t2447, -8
  %t2449 = inttoptr i64 %t2448 to ptr
  %t2450 = load i64, ptr %t2449
  %t2451 = inttoptr i64 %t2450 to ptr
  %t2452 = call fastcc i64%t2451(i64 %t2447, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2453 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2453)
  %t2454 = and i64 %t2453, -8
  %t2455 = inttoptr i64 %t2454 to ptr
  %t2456 = load i64, ptr %t2455
  %t2457 = inttoptr i64 %t2456 to ptr
  %t2458 = musttail call fastcc i64 %t2457(i64 %t2453, i64 2, i64 %t2452, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2458
else913:
  %t2459 = load i64, ptr @"emit.internal:rd-flonum?"
  call void @rt_check_callable(i64 %t2459)
  %t2460 = and i64 %t2459, -8
  %t2461 = inttoptr i64 %t2460 to ptr
  %t2462 = load i64, ptr %t2461
  %t2463 = inttoptr i64 %t2462 to ptr
  %t2464 = call fastcc i64%t2463(i64 %t2459, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2465 = icmp ne i64 %t2464, 1
  br i1 %t2465, label %then914, label %else915
then914:
  %t2466 = call i64 @rt_string_to_flonum(i64 %a0)
  %t2467 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2467)
  %t2468 = and i64 %t2467, -8
  %t2469 = inttoptr i64 %t2468 to ptr
  %t2470 = load i64, ptr %t2469
  %t2471 = inttoptr i64 %t2470 to ptr
  %t2472 = musttail call fastcc i64 %t2471(i64 %t2467, i64 2, i64 %t2466, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2472
else915:
  %t2473 = load i64, ptr @"emit.internal:rd-nonfinite"
  call void @rt_check_callable(i64 %t2473)
  %t2474 = and i64 %t2473, -8
  %t2475 = inttoptr i64 %t2474 to ptr
  %t2476 = load i64, ptr %t2475
  %t2477 = inttoptr i64 %t2476 to ptr
  %t2478 = call fastcc i64%t2477(i64 %t2473, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2479 = call i64 @rt_not(i64 %t2478)
  %t2480 = icmp ne i64 %t2479, 1
  br i1 %t2480, label %then916, label %else917
then916:
  %t2481 = call i64 @rt_intern(ptr @.str.sym.9)
  ret i64 %t2481
else917:
  %t2482 = icmp ne i64 %a2, 1
  br i1 %t2482, label %then918, label %else919
then918:
  %t2483 = or i64 %a2, 8
  %t2484 = and i64 %t2483, 7
  %t2485 = icmp eq i64 %t2484, 0
  br i1 %t2485, label %fixfast921, label %fixslow922
fixfast921:
  %t2486 = icmp eq i64 %a2, 8
  %t2487 = select i1 %t2486, i64 257, i64 1
  br label %fixmerge923
fixslow922:
  %t2488 = call i64 @rt_num_eq(i64 %a2, i64 8)
  br label %fixmerge923
fixmerge923:
  %t2489 = phi i64 [ %t2487, %fixfast921 ], [ %t2488, %fixslow922 ]
  br label %merge920
else919:
  br label %merge920
merge920:
  %t2490 = phi i64 [ %t2489, %fixmerge923 ], [ 1, %else919 ]
  %t2491 = icmp ne i64 %t2490, 1
  br i1 %t2491, label %then924, label %else925
then924:
  %t2492 = call i64 @rt_intern(ptr @.str.sym.10)
  ret i64 %t2492
else925:
  %t2493 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2493)
  %t2494 = and i64 %t2493, -8
  %t2495 = inttoptr i64 %t2494 to ptr
  %t2496 = load i64, ptr %t2495
  %t2497 = inttoptr i64 %t2496 to ptr
  %t2498 = musttail call fastcc i64 %t2497(i64 %t2493, i64 2, i64 %t2478, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2498
else911:
  %t2499 = load i64, ptr @"emit.internal:%string->int"
  call void @rt_check_callable(i64 %t2499)
  %t2500 = and i64 %t2499, -8
  %t2501 = inttoptr i64 %t2500 to ptr
  %t2502 = load i64, ptr %t2501
  %t2503 = inttoptr i64 %t2502 to ptr
  %t2504 = call fastcc i64%t2503(i64 %t2499, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2505 = icmp ne i64 %t2504, 1
  br i1 %t2505, label %then926, label %else927
then926:
  %t2506 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2506)
  %t2507 = and i64 %t2506, -8
  %t2508 = inttoptr i64 %t2507 to ptr
  %t2509 = load i64, ptr %t2508
  %t2510 = inttoptr i64 %t2509 to ptr
  %t2511 = musttail call fastcc i64 %t2510(i64 %t2506, i64 2, i64 %t2504, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2511
else927:
  %t2512 = call i64 @rt_intern(ptr @.str.sym.9)
  ret i64 %t2512
}

define fastcc i64 @"emit.internal:code:rd-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2517 = icmp eq i64 %argc, 2
  br i1 %t2517, label %argok929, label %arityerr928
arityerr928:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok929:
  %t2518 = call i64 @rt_string_length(i64 %a0)
  %t2519 = or i64 0, %t2518
  %t2520 = and i64 %t2519, 7
  %t2521 = icmp eq i64 %t2520, 0
  br i1 %t2521, label %fixfast930, label %fixslow931
fixfast930:
  %t2522 = icmp slt i64 0, %t2518
  %t2523 = select i1 %t2522, i64 257, i64 1
  br label %fixmerge932
fixslow931:
  %t2524 = call i64 @rt_lt(i64 0, i64 %t2518)
  br label %fixmerge932
fixmerge932:
  %t2525 = phi i64 [ %t2523, %fixfast930 ], [ %t2524, %fixslow931 ]
  %t2526 = icmp ne i64 %t2525, 1
  br i1 %t2526, label %then933, label %else934
then933:
  %t2527 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2528 = call i64 @rt_char_to_integer(i64 %t2527)
  %t2529 = or i64 %t2528, 280
  %t2530 = and i64 %t2529, 7
  %t2531 = icmp eq i64 %t2530, 0
  br i1 %t2531, label %fixfast936, label %fixslow937
fixfast936:
  %t2532 = icmp eq i64 %t2528, 280
  %t2533 = select i1 %t2532, i64 257, i64 1
  br label %fixmerge938
fixslow937:
  %t2534 = call i64 @rt_num_eq(i64 %t2528, i64 280)
  br label %fixmerge938
fixmerge938:
  %t2535 = phi i64 [ %t2533, %fixfast936 ], [ %t2534, %fixslow937 ]
  br label %merge935
else934:
  br label %merge935
merge935:
  %t2536 = phi i64 [ %t2535, %fixmerge938 ], [ 1, %else934 ]
  %t2537 = icmp ne i64 %t2536, 1
  br i1 %t2537, label %then939, label %else940
then939:
  %t2538 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2538)
  %t2539 = and i64 %t2538, -8
  %t2540 = inttoptr i64 %t2539 to ptr
  %t2541 = load i64, ptr %t2540
  %t2542 = inttoptr i64 %t2541 to ptr
  %t2543 = call fastcc i64%t2542(i64 %t2538, i64 5, i64 %a0, i64 %t2518, i64 0, i64 1, i64 1, i64 0, i64 0, i64 0, ptr null)
  %t2544 = call i64 @rt_not(i64 %t2543)
  %t2545 = icmp ne i64 %t2544, 1
  br i1 %t2545, label %then941, label %else942
then941:
  %t2546 = call i64 @rt_intern(ptr @.str.sym.10)
  ret i64 %t2546
else942:
  %t2547 = call i64 @rt_car(i64 %t2543)
  %t2548 = icmp ne i64 %t2547, 1
  br i1 %t2548, label %then943, label %else944
then943:
  %t2549 = call i64 @rt_car(i64 %t2543)
  br label %merge945
else944:
  br label %merge945
merge945:
  %t2550 = phi i64 [ %t2549, %then943 ], [ %a1, %else944 ]
  %t2551 = load i64, ptr @"emit.internal:cadr"
  call void @rt_check_callable(i64 %t2551)
  %t2552 = and i64 %t2551, -8
  %t2553 = inttoptr i64 %t2552 to ptr
  %t2554 = load i64, ptr %t2553
  %t2555 = inttoptr i64 %t2554 to ptr
  %t2556 = call fastcc i64%t2555(i64 %t2551, i64 1, i64 %t2543, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2557 = load i64, ptr @"emit.internal:cddr"
  call void @rt_check_callable(i64 %t2557)
  %t2558 = and i64 %t2557, -8
  %t2559 = inttoptr i64 %t2558 to ptr
  %t2560 = load i64, ptr %t2559
  %t2561 = inttoptr i64 %t2560 to ptr
  %t2562 = call fastcc i64%t2561(i64 %t2557, i64 1, i64 %t2543, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2563 = call i64 @rt_substring(i64 %a0, i64 %t2562, i64 %t2518)
  %t2564 = load i64, ptr @"emit.internal:rd-body-number"
  call void @rt_check_callable(i64 %t2564)
  %t2565 = and i64 %t2564, -8
  %t2566 = inttoptr i64 %t2565 to ptr
  %t2567 = load i64, ptr %t2566
  %t2568 = inttoptr i64 %t2567 to ptr
  %t2569 = call fastcc i64%t2568(i64 %t2564, i64 3, i64 %t2563, i64 %t2550, i64 %t2556, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2570 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2571 = call i64 @rt_eq_p(i64 %t2569, i64 %t2570)
  %t2572 = icmp ne i64 %t2571, 1
  br i1 %t2572, label %then946, label %else947
then946:
  %t2573 = load i64, ptr @"emit.internal:rd-rational-body?"
  call void @rt_check_callable(i64 %t2573)
  %t2574 = and i64 %t2573, -8
  %t2575 = inttoptr i64 %t2574 to ptr
  %t2576 = load i64, ptr %t2575
  %t2577 = inttoptr i64 %t2576 to ptr
  %t2578 = call fastcc i64%t2577(i64 %t2573, i64 4, i64 %a0, i64 %t2518, i64 %t2562, i64 %t2550, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2579 = icmp ne i64 %t2578, 1
  br i1 %t2579, label %then948, label %else949
then948:
  %t2580 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2580
else949:
  %t2581 = call i64 @rt_intern(ptr @.str.sym.10)
  ret i64 %t2581
else947:
  ret i64 %t2569
else940:
  %t2582 = load i64, ptr @"emit.internal:rd-body-number"
  call void @rt_check_callable(i64 %t2582)
  %t2583 = and i64 %t2582, -8
  %t2584 = inttoptr i64 %t2583 to ptr
  %t2585 = load i64, ptr %t2584
  %t2586 = inttoptr i64 %t2585 to ptr
  %t2587 = call fastcc i64%t2586(i64 %t2582, i64 3, i64 %a0, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2588 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2589 = call i64 @rt_eq_p(i64 %t2587, i64 %t2588)
  %t2590 = icmp ne i64 %t2589, 1
  br i1 %t2590, label %then950, label %else951
then950:
  %t2591 = load i64, ptr @"emit.internal:rd-rational-body?"
  call void @rt_check_callable(i64 %t2591)
  %t2592 = and i64 %t2591, -8
  %t2593 = inttoptr i64 %t2592 to ptr
  %t2594 = load i64, ptr %t2593
  %t2595 = inttoptr i64 %t2594 to ptr
  %t2596 = call fastcc i64%t2595(i64 %t2591, i64 4, i64 %a0, i64 %t2518, i64 0, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2597 = icmp ne i64 %t2596, 1
  br i1 %t2597, label %then952, label %else953
then952:
  %t2598 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2598
else953:
  ret i64 %t2587
else951:
  ret i64 %t2587
}

define fastcc i64 @"emit.internal:code:rd-number-reason?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2603 = icmp eq i64 %argc, 1
  br i1 %t2603, label %argok955, label %arityerr954
arityerr954:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok955:
  %t2604 = call i64 @rt_intern(ptr @.str.sym.8)
  %t2605 = call i64 @rt_eq_p(i64 %a0, i64 %t2604)
  %t2606 = icmp ne i64 %t2605, 1
  br i1 %t2606, label %then956, label %else957
then956:
  ret i64 %t2605
else957:
  %t2607 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2608 = call i64 @rt_eq_p(i64 %a0, i64 %t2607)
  ret i64 %t2608
}

define fastcc i64 @"emit.internal:code:rd-fold-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2613 = icmp eq i64 %argc, 1
  br i1 %t2613, label %argok959, label %arityerr958
arityerr958:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok959:
  %t2614 = call i64 @rt_char_to_integer(i64 %a0)
  %t2615 = or i64 512, %t2614
  %t2616 = and i64 %t2615, 7
  %t2617 = icmp eq i64 %t2616, 0
  br i1 %t2617, label %fixfast960, label %fixslow961
fixfast960:
  %t2618 = icmp slt i64 512, %t2614
  %t2619 = select i1 %t2618, i64 257, i64 1
  br label %fixmerge962
fixslow961:
  %t2620 = call i64 @rt_lt(i64 512, i64 %t2614)
  br label %fixmerge962
fixmerge962:
  %t2621 = phi i64 [ %t2619, %fixfast960 ], [ %t2620, %fixslow961 ]
  %t2622 = icmp ne i64 %t2621, 1
  br i1 %t2622, label %then963, label %else964
then963:
  %t2623 = or i64 %t2614, 728
  %t2624 = and i64 %t2623, 7
  %t2625 = icmp eq i64 %t2624, 0
  br i1 %t2625, label %fixfast966, label %fixslow967
fixfast966:
  %t2626 = icmp slt i64 %t2614, 728
  %t2627 = select i1 %t2626, i64 257, i64 1
  br label %fixmerge968
fixslow967:
  %t2628 = call i64 @rt_lt(i64 %t2614, i64 728)
  br label %fixmerge968
fixmerge968:
  %t2629 = phi i64 [ %t2627, %fixfast966 ], [ %t2628, %fixslow967 ]
  br label %merge965
else964:
  br label %merge965
merge965:
  %t2630 = phi i64 [ %t2629, %fixmerge968 ], [ 1, %else964 ]
  %t2631 = icmp ne i64 %t2630, 1
  br i1 %t2631, label %then969, label %else970
then969:
  %t2632 = or i64 %t2614, 256
  %t2633 = and i64 %t2632, 7
  %t2634 = icmp eq i64 %t2633, 0
  br i1 %t2634, label %fixfast971, label %fixslow972
fixfast971:
  %t2635 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2614, i64 256)
  %t2636 = extractvalue {i64, i1} %t2635, 0
  %t2637 = extractvalue {i64, i1} %t2635, 1
  br i1 %t2637, label %fixslow972, label %fixmerge973
fixslow972:
  %t2638 = call i64 @rt_add(i64 %t2614, i64 256)
  br label %fixmerge973
fixmerge973:
  %t2639 = phi i64 [ %t2636, %fixfast971 ], [ %t2638, %fixslow972 ]
  %t2640 = call i64 @rt_integer_to_char(i64 %t2639)
  ret i64 %t2640
else970:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_955"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2645 = icmp eq i64 %argc, 2
  br i1 %t2645, label %argok975, label %arityerr974
arityerr974:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok975:
  %t2646 = and i64 %self, -8
  %t2647 = inttoptr i64 %t2646 to ptr
  %t2648 = getelementptr i64, ptr %t2647, i64 1
  %t2649 = load i64, ptr %t2648
  %t2650 = or i64 %a0, %t2649
  %t2651 = and i64 %t2650, 7
  %t2652 = icmp eq i64 %t2651, 0
  br i1 %t2652, label %fixfast976, label %fixslow977
fixfast976:
  %t2653 = icmp eq i64 %a0, %t2649
  %t2654 = select i1 %t2653, i64 257, i64 1
  br label %fixmerge978
fixslow977:
  %t2655 = call i64 @rt_num_eq(i64 %a0, i64 %t2649)
  br label %fixmerge978
fixmerge978:
  %t2656 = phi i64 [ %t2654, %fixfast976 ], [ %t2655, %fixslow977 ]
  %t2657 = icmp ne i64 %t2656, 1
  br i1 %t2657, label %then979, label %else980
then979:
  %t2658 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t2658)
  %t2659 = and i64 %t2658, -8
  %t2660 = inttoptr i64 %t2659 to ptr
  %t2661 = load i64, ptr %t2660
  %t2662 = inttoptr i64 %t2661 to ptr
  %t2663 = call fastcc i64%t2662(i64 %t2658, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2664 = call i64 @rt_list_to_string(i64 %t2663)
  ret i64 %t2664
else980:
  %t2665 = or i64 %a0, 8
  %t2666 = and i64 %t2665, 7
  %t2667 = icmp eq i64 %t2666, 0
  br i1 %t2667, label %fixfast981, label %fixslow982
fixfast981:
  %t2668 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2669 = extractvalue {i64, i1} %t2668, 0
  %t2670 = extractvalue {i64, i1} %t2668, 1
  br i1 %t2670, label %fixslow982, label %fixmerge983
fixslow982:
  %t2671 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge983
fixmerge983:
  %t2672 = phi i64 [ %t2669, %fixfast981 ], [ %t2671, %fixslow982 ]
  %t2673 = and i64 %self, -8
  %t2674 = inttoptr i64 %t2673 to ptr
  %t2675 = getelementptr i64, ptr %t2674, i64 3
  %t2676 = load i64, ptr %t2675
  %t2677 = call i64 @rt_string_ref(i64 %t2676, i64 %a0)
  %t2678 = load i64, ptr @"emit.internal:rd-fold-char"
  call void @rt_check_callable(i64 %t2678)
  %t2679 = and i64 %t2678, -8
  %t2680 = inttoptr i64 %t2679 to ptr
  %t2681 = load i64, ptr %t2680
  %t2682 = inttoptr i64 %t2681 to ptr
  %t2683 = call fastcc i64%t2682(i64 %t2678, i64 1, i64 %t2677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2684 = call i64 @rt_cons(i64 %t2683, i64 %a1)
  %t2685 = musttail call fastcc i64 @"emit.internal:code_955"(i64 %self, i64 2, i64 %t2672, i64 %t2684, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2685
}

define fastcc i64 @"emit.internal:code:rd-fold-token"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2686 = icmp eq i64 %argc, 1
  br i1 %t2686, label %argok985, label %arityerr984
arityerr984:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok985:
  %t2687 = call i64 @rt_string_length(i64 %a0)
  %t2688 = call ptr @rt_alloc_words(i64 4)
  %t2689 = ptrtoint ptr %t2688 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_955" to i64), ptr %t2688
  %t2690 = or i64 %t2689, 4
  %t2691 = getelementptr i64, ptr %t2688, i64 1
  store i64 %t2687, ptr %t2691
  %t2692 = getelementptr i64, ptr %t2688, i64 2
  store i64 %t2690, ptr %t2692
  %t2693 = getelementptr i64, ptr %t2688, i64 3
  store i64 %a0, ptr %t2693
  %t2694 = musttail call fastcc i64 @"emit.internal:code_955"(i64 %t2690, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2694
}

define fastcc i64 @"emit.internal:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2699 = icmp eq i64 %argc, 4
  br i1 %t2699, label %argok987, label %arityerr986
arityerr986:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok987:
  %t2700 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t2700)
  %t2701 = and i64 %t2700, -8
  %t2702 = inttoptr i64 %t2701 to ptr
  %t2703 = load i64, ptr %t2702
  %t2704 = inttoptr i64 %t2703 to ptr
  %t2705 = call fastcc i64%t2704(i64 %t2700, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2706 = or i64 %a2, %t2705
  %t2707 = and i64 %t2706, 7
  %t2708 = icmp eq i64 %t2707, 0
  br i1 %t2708, label %fixfast988, label %fixslow989
fixfast988:
  %t2709 = icmp eq i64 %a2, %t2705
  %t2710 = select i1 %t2709, i64 257, i64 1
  br label %fixmerge990
fixslow989:
  %t2711 = call i64 @rt_num_eq(i64 %a2, i64 %t2705)
  br label %fixmerge990
fixmerge990:
  %t2712 = phi i64 [ %t2710, %fixfast988 ], [ %t2711, %fixslow989 ]
  %t2713 = icmp ne i64 %t2712, 1
  br i1 %t2713, label %then991, label %else992
then991:
  %t2714 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2715 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2715)
  %t2716 = and i64 %t2715, -8
  %t2717 = inttoptr i64 %t2716 to ptr
  %t2718 = load i64, ptr %t2717
  %t2719 = inttoptr i64 %t2718 to ptr
  %t2720 = musttail call fastcc i64 %t2719(i64 %t2715, i64 2, i64 %t2714, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2720
else992:
  %t2721 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2705)
  %t2722 = load i64, ptr @"emit.internal:rd-number"
  call void @rt_check_callable(i64 %t2722)
  %t2723 = and i64 %t2722, -8
  %t2724 = inttoptr i64 %t2723 to ptr
  %t2725 = load i64, ptr %t2724
  %t2726 = inttoptr i64 %t2725 to ptr
  %t2727 = call fastcc i64%t2726(i64 %t2722, i64 2, i64 %t2721, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2728 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2729 = call i64 @rt_eq_p(i64 %t2727, i64 %t2728)
  %t2730 = icmp ne i64 %t2729, 1
  br i1 %t2730, label %then993, label %else994
then993:
  %t2731 = load i64, ptr @"emit.internal:rd-fold?"
  call void @rt_check_callable(i64 %t2731)
  %t2732 = and i64 %t2731, -8
  %t2733 = inttoptr i64 %t2732 to ptr
  %t2734 = load i64, ptr %t2733
  %t2735 = inttoptr i64 %t2734 to ptr
  %t2736 = call fastcc i64%t2735(i64 %t2731, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2737 = icmp ne i64 %t2736, 1
  br i1 %t2737, label %then995, label %else996
then995:
  %t2738 = load i64, ptr @"emit.internal:rd-fold-token"
  call void @rt_check_callable(i64 %t2738)
  %t2739 = and i64 %t2738, -8
  %t2740 = inttoptr i64 %t2739 to ptr
  %t2741 = load i64, ptr %t2740
  %t2742 = inttoptr i64 %t2741 to ptr
  %t2743 = call fastcc i64%t2742(i64 %t2738, i64 1, i64 %t2721, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge997
else996:
  br label %merge997
merge997:
  %t2744 = phi i64 [ %t2743, %then995 ], [ %t2721, %else996 ]
  %t2745 = call i64 @rt_string_to_symbol(i64 %t2744)
  %t2746 = call i64 @rt_cons(i64 %t2745, i64 %t2705)
  ret i64 %t2746
else994:
  %t2747 = load i64, ptr @"emit.internal:rd-number-reason?"
  call void @rt_check_callable(i64 %t2747)
  %t2748 = and i64 %t2747, -8
  %t2749 = inttoptr i64 %t2748 to ptr
  %t2750 = load i64, ptr %t2749
  %t2751 = inttoptr i64 %t2750 to ptr
  %t2752 = call fastcc i64%t2751(i64 %t2747, i64 1, i64 %t2727, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2753 = icmp ne i64 %t2752, 1
  br i1 %t2753, label %then998, label %else999
then998:
  %t2754 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2754)
  %t2755 = and i64 %t2754, -8
  %t2756 = inttoptr i64 %t2755 to ptr
  %t2757 = load i64, ptr %t2756
  %t2758 = inttoptr i64 %t2757 to ptr
  %t2759 = musttail call fastcc i64 %t2758(i64 %t2754, i64 2, i64 %t2727, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2759
else999:
  %t2760 = call i64 @rt_cons(i64 %t2727, i64 %t2705)
  ret i64 %t2760
}

define fastcc i64 @"emit.internal:code:rd-token-at"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2765 = icmp eq i64 %argc, 3
  br i1 %t2765, label %argok1001, label %arityerr1000
arityerr1000:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1001:
  %t2766 = or i64 0, %a2
  %t2767 = and i64 %t2766, 7
  %t2768 = icmp eq i64 %t2767, 0
  br i1 %t2768, label %fixfast1002, label %fixslow1003
fixfast1002:
  %t2769 = icmp slt i64 0, %a2
  %t2770 = select i1 %t2769, i64 257, i64 1
  br label %fixmerge1004
fixslow1003:
  %t2771 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge1004
fixmerge1004:
  %t2772 = phi i64 [ %t2770, %fixfast1002 ], [ %t2771, %fixslow1003 ]
  %t2773 = icmp ne i64 %t2772, 1
  br i1 %t2773, label %then1005, label %else1006
then1005:
  br label %merge1007
else1006:
  %t2774 = or i64 0, %a2
  %t2775 = and i64 %t2774, 7
  %t2776 = icmp eq i64 %t2775, 0
  br i1 %t2776, label %fixfast1008, label %fixslow1009
fixfast1008:
  %t2777 = icmp eq i64 0, %a2
  %t2778 = select i1 %t2777, i64 257, i64 1
  br label %fixmerge1010
fixslow1009:
  %t2779 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge1010
fixmerge1010:
  %t2780 = phi i64 [ %t2778, %fixfast1008 ], [ %t2779, %fixslow1009 ]
  br label %merge1007
merge1007:
  %t2781 = phi i64 [ 257, %then1005 ], [ %t2780, %fixmerge1010 ]
  %t2782 = icmp ne i64 %t2781, 1
  br i1 %t2782, label %then1011, label %else1012
then1011:
  %t2783 = or i64 %a2, %a1
  %t2784 = and i64 %t2783, 7
  %t2785 = icmp eq i64 %t2784, 0
  br i1 %t2785, label %fixfast1014, label %fixslow1015
fixfast1014:
  %t2786 = icmp slt i64 %a2, %a1
  %t2787 = select i1 %t2786, i64 257, i64 1
  br label %fixmerge1016
fixslow1015:
  %t2788 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1016
fixmerge1016:
  %t2789 = phi i64 [ %t2787, %fixfast1014 ], [ %t2788, %fixslow1015 ]
  br label %merge1013
else1012:
  br label %merge1013
merge1013:
  %t2790 = phi i64 [ %t2789, %fixmerge1016 ], [ 1, %else1012 ]
  %t2791 = icmp ne i64 %t2790, 1
  br i1 %t2791, label %then1017, label %else1018
then1017:
  %t2792 = or i64 %a2, 8
  %t2793 = and i64 %t2792, 7
  %t2794 = icmp eq i64 %t2793, 0
  br i1 %t2794, label %fixfast1019, label %fixslow1020
fixfast1019:
  %t2795 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2796 = extractvalue {i64, i1} %t2795, 0
  %t2797 = extractvalue {i64, i1} %t2795, 1
  br i1 %t2797, label %fixslow1020, label %fixmerge1021
fixslow1020:
  %t2798 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1021
fixmerge1021:
  %t2799 = phi i64 [ %t2796, %fixfast1019 ], [ %t2798, %fixslow1020 ]
  %t2800 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t2800)
  %t2801 = and i64 %t2800, -8
  %t2802 = inttoptr i64 %t2801 to ptr
  %t2803 = load i64, ptr %t2802
  %t2804 = inttoptr i64 %t2803 to ptr
  %t2805 = call fastcc i64%t2804(i64 %t2800, i64 3, i64 %a0, i64 %a1, i64 %t2799, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2806 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2805)
  ret i64 %t2806
else1018:
  %t2807 = call i64 @rt_make_string(ptr @.str.lit.12, i64 0)
  ret i64 %t2807
}

define fastcc i64 @"emit.internal:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2812 = icmp eq i64 %argc, 1
  br i1 %t2812, label %argok1023, label %arityerr1022
arityerr1022:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1023:
  %t2813 = call i64 @rt_char_to_integer(i64 %a0)
  %t2814 = or i64 376, %t2813
  %t2815 = and i64 %t2814, 7
  %t2816 = icmp eq i64 %t2815, 0
  br i1 %t2816, label %fixfast1024, label %fixslow1025
fixfast1024:
  %t2817 = icmp slt i64 376, %t2813
  %t2818 = select i1 %t2817, i64 257, i64 1
  br label %fixmerge1026
fixslow1025:
  %t2819 = call i64 @rt_lt(i64 376, i64 %t2813)
  br label %fixmerge1026
fixmerge1026:
  %t2820 = phi i64 [ %t2818, %fixfast1024 ], [ %t2819, %fixslow1025 ]
  %t2821 = icmp ne i64 %t2820, 1
  br i1 %t2821, label %then1027, label %else1028
then1027:
  %t2822 = or i64 %t2813, 464
  %t2823 = and i64 %t2822, 7
  %t2824 = icmp eq i64 %t2823, 0
  br i1 %t2824, label %fixfast1030, label %fixslow1031
fixfast1030:
  %t2825 = icmp slt i64 %t2813, 464
  %t2826 = select i1 %t2825, i64 257, i64 1
  br label %fixmerge1032
fixslow1031:
  %t2827 = call i64 @rt_lt(i64 %t2813, i64 464)
  br label %fixmerge1032
fixmerge1032:
  %t2828 = phi i64 [ %t2826, %fixfast1030 ], [ %t2827, %fixslow1031 ]
  br label %merge1029
else1028:
  br label %merge1029
merge1029:
  %t2829 = phi i64 [ %t2828, %fixmerge1032 ], [ 1, %else1028 ]
  %t2830 = icmp ne i64 %t2829, 1
  br i1 %t2830, label %then1033, label %else1034
then1033:
  %t2831 = or i64 %t2813, 384
  %t2832 = and i64 %t2831, 7
  %t2833 = icmp eq i64 %t2832, 0
  br i1 %t2833, label %fixfast1035, label %fixslow1036
fixfast1035:
  %t2834 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2813, i64 384)
  %t2835 = extractvalue {i64, i1} %t2834, 0
  %t2836 = extractvalue {i64, i1} %t2834, 1
  br i1 %t2836, label %fixslow1036, label %fixmerge1037
fixslow1036:
  %t2837 = call i64 @rt_sub(i64 %t2813, i64 384)
  br label %fixmerge1037
fixmerge1037:
  %t2838 = phi i64 [ %t2835, %fixfast1035 ], [ %t2837, %fixslow1036 ]
  ret i64 %t2838
else1034:
  %t2839 = or i64 768, %t2813
  %t2840 = and i64 %t2839, 7
  %t2841 = icmp eq i64 %t2840, 0
  br i1 %t2841, label %fixfast1038, label %fixslow1039
fixfast1038:
  %t2842 = icmp slt i64 768, %t2813
  %t2843 = select i1 %t2842, i64 257, i64 1
  br label %fixmerge1040
fixslow1039:
  %t2844 = call i64 @rt_lt(i64 768, i64 %t2813)
  br label %fixmerge1040
fixmerge1040:
  %t2845 = phi i64 [ %t2843, %fixfast1038 ], [ %t2844, %fixslow1039 ]
  %t2846 = icmp ne i64 %t2845, 1
  br i1 %t2846, label %then1041, label %else1042
then1041:
  %t2847 = or i64 %t2813, 824
  %t2848 = and i64 %t2847, 7
  %t2849 = icmp eq i64 %t2848, 0
  br i1 %t2849, label %fixfast1044, label %fixslow1045
fixfast1044:
  %t2850 = icmp slt i64 %t2813, 824
  %t2851 = select i1 %t2850, i64 257, i64 1
  br label %fixmerge1046
fixslow1045:
  %t2852 = call i64 @rt_lt(i64 %t2813, i64 824)
  br label %fixmerge1046
fixmerge1046:
  %t2853 = phi i64 [ %t2851, %fixfast1044 ], [ %t2852, %fixslow1045 ]
  br label %merge1043
else1042:
  br label %merge1043
merge1043:
  %t2854 = phi i64 [ %t2853, %fixmerge1046 ], [ 1, %else1042 ]
  %t2855 = icmp ne i64 %t2854, 1
  br i1 %t2855, label %then1047, label %else1048
then1047:
  %t2856 = or i64 %t2813, 696
  %t2857 = and i64 %t2856, 7
  %t2858 = icmp eq i64 %t2857, 0
  br i1 %t2858, label %fixfast1049, label %fixslow1050
fixfast1049:
  %t2859 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2813, i64 696)
  %t2860 = extractvalue {i64, i1} %t2859, 0
  %t2861 = extractvalue {i64, i1} %t2859, 1
  br i1 %t2861, label %fixslow1050, label %fixmerge1051
fixslow1050:
  %t2862 = call i64 @rt_sub(i64 %t2813, i64 696)
  br label %fixmerge1051
fixmerge1051:
  %t2863 = phi i64 [ %t2860, %fixfast1049 ], [ %t2862, %fixslow1050 ]
  ret i64 %t2863
else1048:
  %t2864 = or i64 512, %t2813
  %t2865 = and i64 %t2864, 7
  %t2866 = icmp eq i64 %t2865, 0
  br i1 %t2866, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t2867 = icmp slt i64 512, %t2813
  %t2868 = select i1 %t2867, i64 257, i64 1
  br label %fixmerge1054
fixslow1053:
  %t2869 = call i64 @rt_lt(i64 512, i64 %t2813)
  br label %fixmerge1054
fixmerge1054:
  %t2870 = phi i64 [ %t2868, %fixfast1052 ], [ %t2869, %fixslow1053 ]
  %t2871 = icmp ne i64 %t2870, 1
  br i1 %t2871, label %then1055, label %else1056
then1055:
  %t2872 = or i64 %t2813, 568
  %t2873 = and i64 %t2872, 7
  %t2874 = icmp eq i64 %t2873, 0
  br i1 %t2874, label %fixfast1058, label %fixslow1059
fixfast1058:
  %t2875 = icmp slt i64 %t2813, 568
  %t2876 = select i1 %t2875, i64 257, i64 1
  br label %fixmerge1060
fixslow1059:
  %t2877 = call i64 @rt_lt(i64 %t2813, i64 568)
  br label %fixmerge1060
fixmerge1060:
  %t2878 = phi i64 [ %t2876, %fixfast1058 ], [ %t2877, %fixslow1059 ]
  br label %merge1057
else1056:
  br label %merge1057
merge1057:
  %t2879 = phi i64 [ %t2878, %fixmerge1060 ], [ 1, %else1056 ]
  %t2880 = icmp ne i64 %t2879, 1
  br i1 %t2880, label %then1061, label %else1062
then1061:
  %t2881 = or i64 %t2813, 440
  %t2882 = and i64 %t2881, 7
  %t2883 = icmp eq i64 %t2882, 0
  br i1 %t2883, label %fixfast1063, label %fixslow1064
fixfast1063:
  %t2884 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2813, i64 440)
  %t2885 = extractvalue {i64, i1} %t2884, 0
  %t2886 = extractvalue {i64, i1} %t2884, 1
  br i1 %t2886, label %fixslow1064, label %fixmerge1065
fixslow1064:
  %t2887 = call i64 @rt_sub(i64 %t2813, i64 440)
  br label %fixmerge1065
fixmerge1065:
  %t2888 = phi i64 [ %t2885, %fixfast1063 ], [ %t2887, %fixslow1064 ]
  ret i64 %t2888
else1062:
  ret i64 0
}

define fastcc i64 @"emit.internal:code:rd-hex-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2893 = icmp eq i64 %argc, 1
  br i1 %t2893, label %argok1067, label %arityerr1066
arityerr1066:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1067:
  %t2894 = call i64 @rt_char_to_integer(i64 %a0)
  %t2895 = or i64 376, %t2894
  %t2896 = and i64 %t2895, 7
  %t2897 = icmp eq i64 %t2896, 0
  br i1 %t2897, label %fixfast1068, label %fixslow1069
fixfast1068:
  %t2898 = icmp slt i64 376, %t2894
  %t2899 = select i1 %t2898, i64 257, i64 1
  br label %fixmerge1070
fixslow1069:
  %t2900 = call i64 @rt_lt(i64 376, i64 %t2894)
  br label %fixmerge1070
fixmerge1070:
  %t2901 = phi i64 [ %t2899, %fixfast1068 ], [ %t2900, %fixslow1069 ]
  %t2902 = icmp ne i64 %t2901, 1
  br i1 %t2902, label %then1071, label %else1072
then1071:
  %t2903 = or i64 %t2894, 464
  %t2904 = and i64 %t2903, 7
  %t2905 = icmp eq i64 %t2904, 0
  br i1 %t2905, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t2906 = icmp slt i64 %t2894, 464
  %t2907 = select i1 %t2906, i64 257, i64 1
  br label %fixmerge1076
fixslow1075:
  %t2908 = call i64 @rt_lt(i64 %t2894, i64 464)
  br label %fixmerge1076
fixmerge1076:
  %t2909 = phi i64 [ %t2907, %fixfast1074 ], [ %t2908, %fixslow1075 ]
  br label %merge1073
else1072:
  br label %merge1073
merge1073:
  %t2910 = phi i64 [ %t2909, %fixmerge1076 ], [ 1, %else1072 ]
  %t2911 = icmp ne i64 %t2910, 1
  br i1 %t2911, label %then1077, label %else1078
then1077:
  ret i64 257
else1078:
  %t2912 = or i64 768, %t2894
  %t2913 = and i64 %t2912, 7
  %t2914 = icmp eq i64 %t2913, 0
  br i1 %t2914, label %fixfast1079, label %fixslow1080
fixfast1079:
  %t2915 = icmp slt i64 768, %t2894
  %t2916 = select i1 %t2915, i64 257, i64 1
  br label %fixmerge1081
fixslow1080:
  %t2917 = call i64 @rt_lt(i64 768, i64 %t2894)
  br label %fixmerge1081
fixmerge1081:
  %t2918 = phi i64 [ %t2916, %fixfast1079 ], [ %t2917, %fixslow1080 ]
  %t2919 = icmp ne i64 %t2918, 1
  br i1 %t2919, label %then1082, label %else1083
then1082:
  %t2920 = or i64 %t2894, 824
  %t2921 = and i64 %t2920, 7
  %t2922 = icmp eq i64 %t2921, 0
  br i1 %t2922, label %fixfast1085, label %fixslow1086
fixfast1085:
  %t2923 = icmp slt i64 %t2894, 824
  %t2924 = select i1 %t2923, i64 257, i64 1
  br label %fixmerge1087
fixslow1086:
  %t2925 = call i64 @rt_lt(i64 %t2894, i64 824)
  br label %fixmerge1087
fixmerge1087:
  %t2926 = phi i64 [ %t2924, %fixfast1085 ], [ %t2925, %fixslow1086 ]
  br label %merge1084
else1083:
  br label %merge1084
merge1084:
  %t2927 = phi i64 [ %t2926, %fixmerge1087 ], [ 1, %else1083 ]
  %t2928 = icmp ne i64 %t2927, 1
  br i1 %t2928, label %then1088, label %else1089
then1088:
  ret i64 257
else1089:
  %t2929 = or i64 512, %t2894
  %t2930 = and i64 %t2929, 7
  %t2931 = icmp eq i64 %t2930, 0
  br i1 %t2931, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t2932 = icmp slt i64 512, %t2894
  %t2933 = select i1 %t2932, i64 257, i64 1
  br label %fixmerge1092
fixslow1091:
  %t2934 = call i64 @rt_lt(i64 512, i64 %t2894)
  br label %fixmerge1092
fixmerge1092:
  %t2935 = phi i64 [ %t2933, %fixfast1090 ], [ %t2934, %fixslow1091 ]
  %t2936 = icmp ne i64 %t2935, 1
  br i1 %t2936, label %then1093, label %else1094
then1093:
  %t2937 = or i64 %t2894, 568
  %t2938 = and i64 %t2937, 7
  %t2939 = icmp eq i64 %t2938, 0
  br i1 %t2939, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t2940 = icmp slt i64 %t2894, 568
  %t2941 = select i1 %t2940, i64 257, i64 1
  br label %fixmerge1098
fixslow1097:
  %t2942 = call i64 @rt_lt(i64 %t2894, i64 568)
  br label %fixmerge1098
fixmerge1098:
  %t2943 = phi i64 [ %t2941, %fixfast1096 ], [ %t2942, %fixslow1097 ]
  br label %merge1095
else1094:
  br label %merge1095
merge1095:
  %t2944 = phi i64 [ %t2943, %fixmerge1098 ], [ 1, %else1094 ]
  %t2945 = icmp ne i64 %t2944, 1
  br i1 %t2945, label %then1099, label %else1100
then1099:
  ret i64 257
else1100:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2950 = icmp eq i64 %argc, 4
  br i1 %t2950, label %argok1102, label %arityerr1101
arityerr1101:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1102:
  %t2951 = or i64 %a2, %a1
  %t2952 = and i64 %t2951, 7
  %t2953 = icmp eq i64 %t2952, 0
  br i1 %t2953, label %fixfast1103, label %fixslow1104
fixfast1103:
  %t2954 = icmp slt i64 %a2, %a1
  %t2955 = select i1 %t2954, i64 257, i64 1
  br label %fixmerge1105
fixslow1104:
  %t2956 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1105
fixmerge1105:
  %t2957 = phi i64 [ %t2955, %fixfast1103 ], [ %t2956, %fixslow1104 ]
  %t2958 = icmp ne i64 %t2957, 1
  br i1 %t2958, label %then1106, label %else1107
then1106:
  %t2959 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2960 = call i64 @rt_char_to_integer(i64 %t2959)
  %t2961 = or i64 %t2960, 472
  %t2962 = and i64 %t2961, 7
  %t2963 = icmp eq i64 %t2962, 0
  br i1 %t2963, label %fixfast1108, label %fixslow1109
fixfast1108:
  %t2964 = icmp eq i64 %t2960, 472
  %t2965 = select i1 %t2964, i64 257, i64 1
  br label %fixmerge1110
fixslow1109:
  %t2966 = call i64 @rt_num_eq(i64 %t2960, i64 472)
  br label %fixmerge1110
fixmerge1110:
  %t2967 = phi i64 [ %t2965, %fixfast1108 ], [ %t2966, %fixslow1109 ]
  %t2968 = icmp ne i64 %t2967, 1
  br i1 %t2968, label %then1111, label %else1112
then1111:
  %t2969 = or i64 %a2, 8
  %t2970 = and i64 %t2969, 7
  %t2971 = icmp eq i64 %t2970, 0
  br i1 %t2971, label %fixfast1113, label %fixslow1114
fixfast1113:
  %t2972 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2973 = extractvalue {i64, i1} %t2972, 0
  %t2974 = extractvalue {i64, i1} %t2972, 1
  br i1 %t2974, label %fixslow1114, label %fixmerge1115
fixslow1114:
  %t2975 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1115
fixmerge1115:
  %t2976 = phi i64 [ %t2973, %fixfast1113 ], [ %t2975, %fixslow1114 ]
  %t2977 = call i64 @rt_cons(i64 %a3, i64 %t2976)
  ret i64 %t2977
else1112:
  %t2978 = or i64 %a2, 8
  %t2979 = and i64 %t2978, 7
  %t2980 = icmp eq i64 %t2979, 0
  br i1 %t2980, label %fixfast1116, label %fixslow1117
fixfast1116:
  %t2981 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2982 = extractvalue {i64, i1} %t2981, 0
  %t2983 = extractvalue {i64, i1} %t2981, 1
  br i1 %t2983, label %fixslow1117, label %fixmerge1118
fixslow1117:
  %t2984 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1118
fixmerge1118:
  %t2985 = phi i64 [ %t2982, %fixfast1116 ], [ %t2984, %fixslow1117 ]
  %t2986 = or i64 %a3, 128
  %t2987 = and i64 %t2986, 7
  %t2988 = icmp eq i64 %t2987, 0
  br i1 %t2988, label %fixfast1119, label %fixslow1120
fixfast1119:
  %t2989 = ashr i64 %a3, 3
  %t2990 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2989, i64 128)
  %t2991 = extractvalue {i64, i1} %t2990, 0
  %t2992 = extractvalue {i64, i1} %t2990, 1
  br i1 %t2992, label %fixslow1120, label %fixmerge1121
fixslow1120:
  %t2993 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge1121
fixmerge1121:
  %t2994 = phi i64 [ %t2991, %fixfast1119 ], [ %t2993, %fixslow1120 ]
  %t2995 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2996 = load i64, ptr @"emit.internal:rd-hex-digit"
  call void @rt_check_callable(i64 %t2996)
  %t2997 = and i64 %t2996, -8
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = load i64, ptr %t2998
  %t3000 = inttoptr i64 %t2999 to ptr
  %t3001 = call fastcc i64%t3000(i64 %t2996, i64 1, i64 %t2995, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3002 = or i64 %t2994, %t3001
  %t3003 = and i64 %t3002, 7
  %t3004 = icmp eq i64 %t3003, 0
  br i1 %t3004, label %fixfast1122, label %fixslow1123
fixfast1122:
  %t3005 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2994, i64 %t3001)
  %t3006 = extractvalue {i64, i1} %t3005, 0
  %t3007 = extractvalue {i64, i1} %t3005, 1
  br i1 %t3007, label %fixslow1123, label %fixmerge1124
fixslow1123:
  %t3008 = call i64 @rt_add(i64 %t2994, i64 %t3001)
  br label %fixmerge1124
fixmerge1124:
  %t3009 = phi i64 [ %t3006, %fixfast1122 ], [ %t3008, %fixslow1123 ]
  %t3010 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t3010)
  %t3011 = and i64 %t3010, -8
  %t3012 = inttoptr i64 %t3011 to ptr
  %t3013 = load i64, ptr %t3012
  %t3014 = inttoptr i64 %t3013 to ptr
  %t3015 = musttail call fastcc i64 %t3014(i64 %t3010, i64 4, i64 %a0, i64 %a1, i64 %t2985, i64 %t3009, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3015
else1107:
  %t3016 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t3016
}

define fastcc i64 @"emit.internal:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3021 = icmp eq i64 %argc, 1
  br i1 %t3021, label %argok1126, label %arityerr1125
arityerr1125:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1126:
  %t3022 = call i64 @rt_char_to_integer(i64 %a0)
  %t3023 = or i64 %t3022, 776
  %t3024 = and i64 %t3023, 7
  %t3025 = icmp eq i64 %t3024, 0
  br i1 %t3025, label %fixfast1127, label %fixslow1128
fixfast1127:
  %t3026 = icmp eq i64 %t3022, 776
  %t3027 = select i1 %t3026, i64 257, i64 1
  br label %fixmerge1129
fixslow1128:
  %t3028 = call i64 @rt_num_eq(i64 %t3022, i64 776)
  br label %fixmerge1129
fixmerge1129:
  %t3029 = phi i64 [ %t3027, %fixfast1127 ], [ %t3028, %fixslow1128 ]
  %t3030 = icmp ne i64 %t3029, 1
  br i1 %t3030, label %then1130, label %else1131
then1130:
  %t3031 = call i64 @rt_integer_to_char(i64 56)
  ret i64 %t3031
else1131:
  %t3032 = or i64 %t3022, 784
  %t3033 = and i64 %t3032, 7
  %t3034 = icmp eq i64 %t3033, 0
  br i1 %t3034, label %fixfast1132, label %fixslow1133
fixfast1132:
  %t3035 = icmp eq i64 %t3022, 784
  %t3036 = select i1 %t3035, i64 257, i64 1
  br label %fixmerge1134
fixslow1133:
  %t3037 = call i64 @rt_num_eq(i64 %t3022, i64 784)
  br label %fixmerge1134
fixmerge1134:
  %t3038 = phi i64 [ %t3036, %fixfast1132 ], [ %t3037, %fixslow1133 ]
  %t3039 = icmp ne i64 %t3038, 1
  br i1 %t3039, label %then1135, label %else1136
then1135:
  %t3040 = call i64 @rt_integer_to_char(i64 64)
  ret i64 %t3040
else1136:
  %t3041 = or i64 %t3022, 880
  %t3042 = and i64 %t3041, 7
  %t3043 = icmp eq i64 %t3042, 0
  br i1 %t3043, label %fixfast1137, label %fixslow1138
fixfast1137:
  %t3044 = icmp eq i64 %t3022, 880
  %t3045 = select i1 %t3044, i64 257, i64 1
  br label %fixmerge1139
fixslow1138:
  %t3046 = call i64 @rt_num_eq(i64 %t3022, i64 880)
  br label %fixmerge1139
fixmerge1139:
  %t3047 = phi i64 [ %t3045, %fixfast1137 ], [ %t3046, %fixslow1138 ]
  %t3048 = icmp ne i64 %t3047, 1
  br i1 %t3048, label %then1140, label %else1141
then1140:
  %t3049 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3049
else1141:
  %t3050 = or i64 %t3022, 928
  %t3051 = and i64 %t3050, 7
  %t3052 = icmp eq i64 %t3051, 0
  br i1 %t3052, label %fixfast1142, label %fixslow1143
fixfast1142:
  %t3053 = icmp eq i64 %t3022, 928
  %t3054 = select i1 %t3053, i64 257, i64 1
  br label %fixmerge1144
fixslow1143:
  %t3055 = call i64 @rt_num_eq(i64 %t3022, i64 928)
  br label %fixmerge1144
fixmerge1144:
  %t3056 = phi i64 [ %t3054, %fixfast1142 ], [ %t3055, %fixslow1143 ]
  %t3057 = icmp ne i64 %t3056, 1
  br i1 %t3057, label %then1145, label %else1146
then1145:
  %t3058 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3058
else1146:
  %t3059 = or i64 %t3022, 912
  %t3060 = and i64 %t3059, 7
  %t3061 = icmp eq i64 %t3060, 0
  br i1 %t3061, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t3062 = icmp eq i64 %t3022, 912
  %t3063 = select i1 %t3062, i64 257, i64 1
  br label %fixmerge1149
fixslow1148:
  %t3064 = call i64 @rt_num_eq(i64 %t3022, i64 912)
  br label %fixmerge1149
fixmerge1149:
  %t3065 = phi i64 [ %t3063, %fixfast1147 ], [ %t3064, %fixslow1148 ]
  %t3066 = icmp ne i64 %t3065, 1
  br i1 %t3066, label %then1150, label %else1151
then1150:
  %t3067 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3067
else1151:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code:rd-intraline"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3072 = icmp eq i64 %argc, 3
  br i1 %t3072, label %argok1153, label %arityerr1152
arityerr1152:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1153:
  %t3073 = or i64 %a2, %a1
  %t3074 = and i64 %t3073, 7
  %t3075 = icmp eq i64 %t3074, 0
  br i1 %t3075, label %fixfast1154, label %fixslow1155
fixfast1154:
  %t3076 = icmp slt i64 %a2, %a1
  %t3077 = select i1 %t3076, i64 257, i64 1
  br label %fixmerge1156
fixslow1155:
  %t3078 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1156
fixmerge1156:
  %t3079 = phi i64 [ %t3077, %fixfast1154 ], [ %t3078, %fixslow1155 ]
  %t3080 = icmp ne i64 %t3079, 1
  br i1 %t3080, label %then1157, label %else1158
then1157:
  %t3081 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3082 = call i64 @rt_char_to_integer(i64 %t3081)
  %t3083 = or i64 %t3082, 256
  %t3084 = and i64 %t3083, 7
  %t3085 = icmp eq i64 %t3084, 0
  br i1 %t3085, label %fixfast1159, label %fixslow1160
fixfast1159:
  %t3086 = icmp eq i64 %t3082, 256
  %t3087 = select i1 %t3086, i64 257, i64 1
  br label %fixmerge1161
fixslow1160:
  %t3088 = call i64 @rt_num_eq(i64 %t3082, i64 256)
  br label %fixmerge1161
fixmerge1161:
  %t3089 = phi i64 [ %t3087, %fixfast1159 ], [ %t3088, %fixslow1160 ]
  %t3090 = icmp ne i64 %t3089, 1
  br i1 %t3090, label %then1162, label %else1163
then1162:
  br label %merge1164
else1163:
  %t3091 = or i64 %t3082, 72
  %t3092 = and i64 %t3091, 7
  %t3093 = icmp eq i64 %t3092, 0
  br i1 %t3093, label %fixfast1165, label %fixslow1166
fixfast1165:
  %t3094 = icmp eq i64 %t3082, 72
  %t3095 = select i1 %t3094, i64 257, i64 1
  br label %fixmerge1167
fixslow1166:
  %t3096 = call i64 @rt_num_eq(i64 %t3082, i64 72)
  br label %fixmerge1167
fixmerge1167:
  %t3097 = phi i64 [ %t3095, %fixfast1165 ], [ %t3096, %fixslow1166 ]
  br label %merge1164
merge1164:
  %t3098 = phi i64 [ 257, %then1162 ], [ %t3097, %fixmerge1167 ]
  %t3099 = icmp ne i64 %t3098, 1
  br i1 %t3099, label %then1168, label %else1169
then1168:
  %t3100 = or i64 %a2, 8
  %t3101 = and i64 %t3100, 7
  %t3102 = icmp eq i64 %t3101, 0
  br i1 %t3102, label %fixfast1170, label %fixslow1171
fixfast1170:
  %t3103 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3104 = extractvalue {i64, i1} %t3103, 0
  %t3105 = extractvalue {i64, i1} %t3103, 1
  br i1 %t3105, label %fixslow1171, label %fixmerge1172
fixslow1171:
  %t3106 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1172
fixmerge1172:
  %t3107 = phi i64 [ %t3104, %fixfast1170 ], [ %t3106, %fixslow1171 ]
  %t3108 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3108)
  %t3109 = and i64 %t3108, -8
  %t3110 = inttoptr i64 %t3109 to ptr
  %t3111 = load i64, ptr %t3110
  %t3112 = inttoptr i64 %t3111 to ptr
  %t3113 = musttail call fastcc i64 %t3112(i64 %t3108, i64 3, i64 %a0, i64 %a1, i64 %t3107, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3113
else1169:
  ret i64 %a2
else1158:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-line-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3118 = icmp eq i64 %argc, 3
  br i1 %t3118, label %argok1174, label %arityerr1173
arityerr1173:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1174:
  %t3119 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3119)
  %t3120 = and i64 %t3119, -8
  %t3121 = inttoptr i64 %t3120 to ptr
  %t3122 = load i64, ptr %t3121
  %t3123 = inttoptr i64 %t3122 to ptr
  %t3124 = call fastcc i64%t3123(i64 %t3119, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3125 = or i64 %t3124, %a1
  %t3126 = and i64 %t3125, 7
  %t3127 = icmp eq i64 %t3126, 0
  br i1 %t3127, label %fixfast1175, label %fixslow1176
fixfast1175:
  %t3128 = icmp slt i64 %t3124, %a1
  %t3129 = select i1 %t3128, i64 257, i64 1
  br label %fixmerge1177
fixslow1176:
  %t3130 = call i64 @rt_lt(i64 %t3124, i64 %a1)
  br label %fixmerge1177
fixmerge1177:
  %t3131 = phi i64 [ %t3129, %fixfast1175 ], [ %t3130, %fixslow1176 ]
  %t3132 = icmp ne i64 %t3131, 1
  br i1 %t3132, label %then1178, label %else1179
then1178:
  %t3133 = call i64 @rt_string_ref(i64 %a0, i64 %t3124)
  %t3134 = call i64 @rt_char_to_integer(i64 %t3133)
  %t3135 = or i64 %t3134, 80
  %t3136 = and i64 %t3135, 7
  %t3137 = icmp eq i64 %t3136, 0
  br i1 %t3137, label %fixfast1180, label %fixslow1181
fixfast1180:
  %t3138 = icmp eq i64 %t3134, 80
  %t3139 = select i1 %t3138, i64 257, i64 1
  br label %fixmerge1182
fixslow1181:
  %t3140 = call i64 @rt_num_eq(i64 %t3134, i64 80)
  br label %fixmerge1182
fixmerge1182:
  %t3141 = phi i64 [ %t3139, %fixfast1180 ], [ %t3140, %fixslow1181 ]
  %t3142 = icmp ne i64 %t3141, 1
  br i1 %t3142, label %then1183, label %else1184
then1183:
  %t3143 = or i64 %t3124, 8
  %t3144 = and i64 %t3143, 7
  %t3145 = icmp eq i64 %t3144, 0
  br i1 %t3145, label %fixfast1185, label %fixslow1186
fixfast1185:
  %t3146 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3124, i64 8)
  %t3147 = extractvalue {i64, i1} %t3146, 0
  %t3148 = extractvalue {i64, i1} %t3146, 1
  br i1 %t3148, label %fixslow1186, label %fixmerge1187
fixslow1186:
  %t3149 = call i64 @rt_add(i64 %t3124, i64 8)
  br label %fixmerge1187
fixmerge1187:
  %t3150 = phi i64 [ %t3147, %fixfast1185 ], [ %t3149, %fixslow1186 ]
  %t3151 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3151)
  %t3152 = and i64 %t3151, -8
  %t3153 = inttoptr i64 %t3152 to ptr
  %t3154 = load i64, ptr %t3153
  %t3155 = inttoptr i64 %t3154 to ptr
  %t3156 = musttail call fastcc i64 %t3155(i64 %t3151, i64 3, i64 %a0, i64 %a1, i64 %t3150, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3156
else1184:
  %t3157 = or i64 %t3134, 104
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast1188, label %fixslow1189
fixfast1188:
  %t3160 = icmp eq i64 %t3134, 104
  %t3161 = select i1 %t3160, i64 257, i64 1
  br label %fixmerge1190
fixslow1189:
  %t3162 = call i64 @rt_num_eq(i64 %t3134, i64 104)
  br label %fixmerge1190
fixmerge1190:
  %t3163 = phi i64 [ %t3161, %fixfast1188 ], [ %t3162, %fixslow1189 ]
  %t3164 = icmp ne i64 %t3163, 1
  br i1 %t3164, label %then1191, label %else1192
then1191:
  %t3165 = or i64 %t3124, 8
  %t3166 = and i64 %t3165, 7
  %t3167 = icmp eq i64 %t3166, 0
  br i1 %t3167, label %fixfast1193, label %fixslow1194
fixfast1193:
  %t3168 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3124, i64 8)
  %t3169 = extractvalue {i64, i1} %t3168, 0
  %t3170 = extractvalue {i64, i1} %t3168, 1
  br i1 %t3170, label %fixslow1194, label %fixmerge1195
fixslow1194:
  %t3171 = call i64 @rt_add(i64 %t3124, i64 8)
  br label %fixmerge1195
fixmerge1195:
  %t3172 = phi i64 [ %t3169, %fixfast1193 ], [ %t3171, %fixslow1194 ]
  %t3173 = or i64 %t3172, %a1
  %t3174 = and i64 %t3173, 7
  %t3175 = icmp eq i64 %t3174, 0
  br i1 %t3175, label %fixfast1196, label %fixslow1197
fixfast1196:
  %t3176 = icmp slt i64 %t3172, %a1
  %t3177 = select i1 %t3176, i64 257, i64 1
  br label %fixmerge1198
fixslow1197:
  %t3178 = call i64 @rt_lt(i64 %t3172, i64 %a1)
  br label %fixmerge1198
fixmerge1198:
  %t3179 = phi i64 [ %t3177, %fixfast1196 ], [ %t3178, %fixslow1197 ]
  %t3180 = icmp ne i64 %t3179, 1
  br i1 %t3180, label %then1199, label %else1200
then1199:
  %t3181 = or i64 %t3124, 8
  %t3182 = and i64 %t3181, 7
  %t3183 = icmp eq i64 %t3182, 0
  br i1 %t3183, label %fixfast1202, label %fixslow1203
fixfast1202:
  %t3184 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3124, i64 8)
  %t3185 = extractvalue {i64, i1} %t3184, 0
  %t3186 = extractvalue {i64, i1} %t3184, 1
  br i1 %t3186, label %fixslow1203, label %fixmerge1204
fixslow1203:
  %t3187 = call i64 @rt_add(i64 %t3124, i64 8)
  br label %fixmerge1204
fixmerge1204:
  %t3188 = phi i64 [ %t3185, %fixfast1202 ], [ %t3187, %fixslow1203 ]
  %t3189 = call i64 @rt_string_ref(i64 %a0, i64 %t3188)
  %t3190 = call i64 @rt_char_to_integer(i64 %t3189)
  %t3191 = or i64 %t3190, 80
  %t3192 = and i64 %t3191, 7
  %t3193 = icmp eq i64 %t3192, 0
  br i1 %t3193, label %fixfast1205, label %fixslow1206
fixfast1205:
  %t3194 = icmp eq i64 %t3190, 80
  %t3195 = select i1 %t3194, i64 257, i64 1
  br label %fixmerge1207
fixslow1206:
  %t3196 = call i64 @rt_num_eq(i64 %t3190, i64 80)
  br label %fixmerge1207
fixmerge1207:
  %t3197 = phi i64 [ %t3195, %fixfast1205 ], [ %t3196, %fixslow1206 ]
  %t3198 = icmp ne i64 %t3197, 1
  br i1 %t3198, label %then1208, label %else1209
then1208:
  %t3199 = or i64 %t3124, 16
  %t3200 = and i64 %t3199, 7
  %t3201 = icmp eq i64 %t3200, 0
  br i1 %t3201, label %fixfast1211, label %fixslow1212
fixfast1211:
  %t3202 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3124, i64 16)
  %t3203 = extractvalue {i64, i1} %t3202, 0
  %t3204 = extractvalue {i64, i1} %t3202, 1
  br i1 %t3204, label %fixslow1212, label %fixmerge1213
fixslow1212:
  %t3205 = call i64 @rt_add(i64 %t3124, i64 16)
  br label %fixmerge1213
fixmerge1213:
  %t3206 = phi i64 [ %t3203, %fixfast1211 ], [ %t3205, %fixslow1212 ]
  br label %merge1210
else1209:
  %t3207 = or i64 %t3124, 8
  %t3208 = and i64 %t3207, 7
  %t3209 = icmp eq i64 %t3208, 0
  br i1 %t3209, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t3210 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3124, i64 8)
  %t3211 = extractvalue {i64, i1} %t3210, 0
  %t3212 = extractvalue {i64, i1} %t3210, 1
  br i1 %t3212, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t3213 = call i64 @rt_add(i64 %t3124, i64 8)
  br label %fixmerge1216
fixmerge1216:
  %t3214 = phi i64 [ %t3211, %fixfast1214 ], [ %t3213, %fixslow1215 ]
  br label %merge1210
merge1210:
  %t3215 = phi i64 [ %t3206, %fixmerge1213 ], [ %t3214, %fixmerge1216 ]
  br label %merge1201
else1200:
  %t3216 = or i64 %t3124, 8
  %t3217 = and i64 %t3216, 7
  %t3218 = icmp eq i64 %t3217, 0
  br i1 %t3218, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t3219 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3124, i64 8)
  %t3220 = extractvalue {i64, i1} %t3219, 0
  %t3221 = extractvalue {i64, i1} %t3219, 1
  br i1 %t3221, label %fixslow1218, label %fixmerge1219
fixslow1218:
  %t3222 = call i64 @rt_add(i64 %t3124, i64 8)
  br label %fixmerge1219
fixmerge1219:
  %t3223 = phi i64 [ %t3220, %fixfast1217 ], [ %t3222, %fixslow1218 ]
  br label %merge1201
merge1201:
  %t3224 = phi i64 [ %t3215, %merge1210 ], [ %t3223, %fixmerge1219 ]
  %t3225 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3225)
  %t3226 = and i64 %t3225, -8
  %t3227 = inttoptr i64 %t3226 to ptr
  %t3228 = load i64, ptr %t3227
  %t3229 = inttoptr i64 %t3228 to ptr
  %t3230 = musttail call fastcc i64 %t3229(i64 %t3225, i64 3, i64 %a0, i64 %a1, i64 %t3224, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3230
else1192:
  ret i64 1
else1179:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_1079"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3235 = icmp eq i64 %argc, 2
  br i1 %t3235, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1221:
  %t3236 = and i64 %self, -8
  %t3237 = inttoptr i64 %t3236 to ptr
  %t3238 = getelementptr i64, ptr %t3237, i64 1
  %t3239 = load i64, ptr %t3238
  %t3240 = or i64 %a0, %t3239
  %t3241 = and i64 %t3240, 7
  %t3242 = icmp eq i64 %t3241, 0
  br i1 %t3242, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t3243 = icmp slt i64 %a0, %t3239
  %t3244 = select i1 %t3243, i64 257, i64 1
  br label %fixmerge1224
fixslow1223:
  %t3245 = call i64 @rt_lt(i64 %a0, i64 %t3239)
  br label %fixmerge1224
fixmerge1224:
  %t3246 = phi i64 [ %t3244, %fixfast1222 ], [ %t3245, %fixslow1223 ]
  %t3247 = icmp ne i64 %t3246, 1
  br i1 %t3247, label %then1225, label %else1226
then1225:
  %t3248 = and i64 %self, -8
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = getelementptr i64, ptr %t3249, i64 2
  %t3251 = load i64, ptr %t3250
  %t3252 = call i64 @rt_string_ref(i64 %t3251, i64 %a0)
  %t3253 = call i64 @rt_char_to_integer(i64 %t3252)
  %t3254 = or i64 %t3253, 272
  %t3255 = and i64 %t3254, 7
  %t3256 = icmp eq i64 %t3255, 0
  br i1 %t3256, label %fixfast1227, label %fixslow1228
fixfast1227:
  %t3257 = icmp eq i64 %t3253, 272
  %t3258 = select i1 %t3257, i64 257, i64 1
  br label %fixmerge1229
fixslow1228:
  %t3259 = call i64 @rt_num_eq(i64 %t3253, i64 272)
  br label %fixmerge1229
fixmerge1229:
  %t3260 = phi i64 [ %t3258, %fixfast1227 ], [ %t3259, %fixslow1228 ]
  %t3261 = icmp ne i64 %t3260, 1
  br i1 %t3261, label %then1230, label %else1231
then1230:
  %t3262 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t3262)
  %t3263 = and i64 %t3262, -8
  %t3264 = inttoptr i64 %t3263 to ptr
  %t3265 = load i64, ptr %t3264
  %t3266 = inttoptr i64 %t3265 to ptr
  %t3267 = call fastcc i64%t3266(i64 %t3262, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3268 = call i64 @rt_list_to_string(i64 %t3267)
  %t3269 = or i64 %a0, 8
  %t3270 = and i64 %t3269, 7
  %t3271 = icmp eq i64 %t3270, 0
  br i1 %t3271, label %fixfast1232, label %fixslow1233
fixfast1232:
  %t3272 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3273 = extractvalue {i64, i1} %t3272, 0
  %t3274 = extractvalue {i64, i1} %t3272, 1
  br i1 %t3274, label %fixslow1233, label %fixmerge1234
fixslow1233:
  %t3275 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1234
fixmerge1234:
  %t3276 = phi i64 [ %t3273, %fixfast1232 ], [ %t3275, %fixslow1233 ]
  %t3277 = call i64 @rt_cons(i64 %t3268, i64 %t3276)
  ret i64 %t3277
else1231:
  %t3278 = or i64 %t3253, 736
  %t3279 = and i64 %t3278, 7
  %t3280 = icmp eq i64 %t3279, 0
  br i1 %t3280, label %fixfast1235, label %fixslow1236
fixfast1235:
  %t3281 = icmp eq i64 %t3253, 736
  %t3282 = select i1 %t3281, i64 257, i64 1
  br label %fixmerge1237
fixslow1236:
  %t3283 = call i64 @rt_num_eq(i64 %t3253, i64 736)
  br label %fixmerge1237
fixmerge1237:
  %t3284 = phi i64 [ %t3282, %fixfast1235 ], [ %t3283, %fixslow1236 ]
  %t3285 = icmp ne i64 %t3284, 1
  br i1 %t3285, label %then1238, label %else1239
then1238:
  %t3286 = and i64 %self, -8
  %t3287 = inttoptr i64 %t3286 to ptr
  %t3288 = getelementptr i64, ptr %t3287, i64 1
  %t3289 = load i64, ptr %t3288
  %t3290 = or i64 %a0, 8
  %t3291 = and i64 %t3290, 7
  %t3292 = icmp eq i64 %t3291, 0
  br i1 %t3292, label %fixfast1240, label %fixslow1241
fixfast1240:
  %t3293 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3294 = extractvalue {i64, i1} %t3293, 0
  %t3295 = extractvalue {i64, i1} %t3293, 1
  br i1 %t3295, label %fixslow1241, label %fixmerge1242
fixslow1241:
  %t3296 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1242
fixmerge1242:
  %t3297 = phi i64 [ %t3294, %fixfast1240 ], [ %t3296, %fixslow1241 ]
  %t3298 = or i64 %t3289, %t3297
  %t3299 = and i64 %t3298, 7
  %t3300 = icmp eq i64 %t3299, 0
  br i1 %t3300, label %fixfast1243, label %fixslow1244
fixfast1243:
  %t3301 = icmp slt i64 %t3289, %t3297
  %t3302 = select i1 %t3301, i64 257, i64 1
  br label %fixmerge1245
fixslow1244:
  %t3303 = call i64 @rt_lt(i64 %t3289, i64 %t3297)
  br label %fixmerge1245
fixmerge1245:
  %t3304 = phi i64 [ %t3302, %fixfast1243 ], [ %t3303, %fixslow1244 ]
  %t3305 = icmp ne i64 %t3304, 1
  br i1 %t3305, label %then1246, label %else1247
then1246:
  br label %merge1248
else1247:
  %t3306 = or i64 %t3289, %t3297
  %t3307 = and i64 %t3306, 7
  %t3308 = icmp eq i64 %t3307, 0
  br i1 %t3308, label %fixfast1249, label %fixslow1250
fixfast1249:
  %t3309 = icmp eq i64 %t3289, %t3297
  %t3310 = select i1 %t3309, i64 257, i64 1
  br label %fixmerge1251
fixslow1250:
  %t3311 = call i64 @rt_num_eq(i64 %t3289, i64 %t3297)
  br label %fixmerge1251
fixmerge1251:
  %t3312 = phi i64 [ %t3310, %fixfast1249 ], [ %t3311, %fixslow1250 ]
  br label %merge1248
merge1248:
  %t3313 = phi i64 [ 257, %then1246 ], [ %t3312, %fixmerge1251 ]
  %t3314 = icmp ne i64 %t3313, 1
  br i1 %t3314, label %then1252, label %else1253
then1252:
  %t3315 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3316 = and i64 %self, -8
  %t3317 = inttoptr i64 %t3316 to ptr
  %t3318 = getelementptr i64, ptr %t3317, i64 3
  %t3319 = load i64, ptr %t3318
  %t3320 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3320)
  %t3321 = and i64 %t3320, -8
  %t3322 = inttoptr i64 %t3321 to ptr
  %t3323 = load i64, ptr %t3322
  %t3324 = inttoptr i64 %t3323 to ptr
  %t3325 = musttail call fastcc i64 %t3324(i64 %t3320, i64 2, i64 %t3315, i64 %t3319, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3325
else1253:
  %t3326 = and i64 %self, -8
  %t3327 = inttoptr i64 %t3326 to ptr
  %t3328 = getelementptr i64, ptr %t3327, i64 2
  %t3329 = load i64, ptr %t3328
  %t3330 = or i64 %a0, 8
  %t3331 = and i64 %t3330, 7
  %t3332 = icmp eq i64 %t3331, 0
  br i1 %t3332, label %fixfast1254, label %fixslow1255
fixfast1254:
  %t3333 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3334 = extractvalue {i64, i1} %t3333, 0
  %t3335 = extractvalue {i64, i1} %t3333, 1
  br i1 %t3335, label %fixslow1255, label %fixmerge1256
fixslow1255:
  %t3336 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1256
fixmerge1256:
  %t3337 = phi i64 [ %t3334, %fixfast1254 ], [ %t3336, %fixslow1255 ]
  %t3338 = call i64 @rt_string_ref(i64 %t3329, i64 %t3337)
  %t3339 = and i64 %self, -8
  %t3340 = inttoptr i64 %t3339 to ptr
  %t3341 = getelementptr i64, ptr %t3340, i64 2
  %t3342 = load i64, ptr %t3341
  %t3343 = and i64 %self, -8
  %t3344 = inttoptr i64 %t3343 to ptr
  %t3345 = getelementptr i64, ptr %t3344, i64 1
  %t3346 = load i64, ptr %t3345
  %t3347 = or i64 %a0, 8
  %t3348 = and i64 %t3347, 7
  %t3349 = icmp eq i64 %t3348, 0
  br i1 %t3349, label %fixfast1257, label %fixslow1258
fixfast1257:
  %t3350 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3351 = extractvalue {i64, i1} %t3350, 0
  %t3352 = extractvalue {i64, i1} %t3350, 1
  br i1 %t3352, label %fixslow1258, label %fixmerge1259
fixslow1258:
  %t3353 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1259
fixmerge1259:
  %t3354 = phi i64 [ %t3351, %fixfast1257 ], [ %t3353, %fixslow1258 ]
  %t3355 = load i64, ptr @"emit.internal:rd-line-continuation"
  call void @rt_check_callable(i64 %t3355)
  %t3356 = and i64 %t3355, -8
  %t3357 = inttoptr i64 %t3356 to ptr
  %t3358 = load i64, ptr %t3357
  %t3359 = inttoptr i64 %t3358 to ptr
  %t3360 = call fastcc i64%t3359(i64 %t3355, i64 3, i64 %t3342, i64 %t3346, i64 %t3354, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3361 = icmp ne i64 %t3360, 1
  br i1 %t3361, label %then1260, label %else1261
then1260:
  %t3362 = musttail call fastcc i64 @"emit.internal:code_1079"(i64 %self, i64 2, i64 %t3360, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3362
else1261:
  %t3363 = call i64 @rt_char_to_integer(i64 %t3338)
  %t3364 = or i64 %t3363, 960
  %t3365 = and i64 %t3364, 7
  %t3366 = icmp eq i64 %t3365, 0
  br i1 %t3366, label %fixfast1262, label %fixslow1263
fixfast1262:
  %t3367 = icmp eq i64 %t3363, 960
  %t3368 = select i1 %t3367, i64 257, i64 1
  br label %fixmerge1264
fixslow1263:
  %t3369 = call i64 @rt_num_eq(i64 %t3363, i64 960)
  br label %fixmerge1264
fixmerge1264:
  %t3370 = phi i64 [ %t3368, %fixfast1262 ], [ %t3369, %fixslow1263 ]
  %t3371 = icmp ne i64 %t3370, 1
  br i1 %t3371, label %then1265, label %else1266
then1265:
  %t3372 = and i64 %self, -8
  %t3373 = inttoptr i64 %t3372 to ptr
  %t3374 = getelementptr i64, ptr %t3373, i64 2
  %t3375 = load i64, ptr %t3374
  %t3376 = and i64 %self, -8
  %t3377 = inttoptr i64 %t3376 to ptr
  %t3378 = getelementptr i64, ptr %t3377, i64 1
  %t3379 = load i64, ptr %t3378
  %t3380 = or i64 %a0, 16
  %t3381 = and i64 %t3380, 7
  %t3382 = icmp eq i64 %t3381, 0
  br i1 %t3382, label %fixfast1267, label %fixslow1268
fixfast1267:
  %t3383 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3384 = extractvalue {i64, i1} %t3383, 0
  %t3385 = extractvalue {i64, i1} %t3383, 1
  br i1 %t3385, label %fixslow1268, label %fixmerge1269
fixslow1268:
  %t3386 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1269
fixmerge1269:
  %t3387 = phi i64 [ %t3384, %fixfast1267 ], [ %t3386, %fixslow1268 ]
  %t3388 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t3388)
  %t3389 = and i64 %t3388, -8
  %t3390 = inttoptr i64 %t3389 to ptr
  %t3391 = load i64, ptr %t3390
  %t3392 = inttoptr i64 %t3391 to ptr
  %t3393 = call fastcc i64%t3392(i64 %t3388, i64 4, i64 %t3375, i64 %t3379, i64 %t3387, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3394 = call i64 @rt_cdr(i64 %t3393)
  %t3395 = call i64 @rt_car(i64 %t3393)
  %t3396 = call i64 @rt_integer_to_char(i64 %t3395)
  %t3397 = call i64 @rt_cons(i64 %t3396, i64 %a1)
  %t3398 = musttail call fastcc i64 @"emit.internal:code_1079"(i64 %self, i64 2, i64 %t3394, i64 %t3397, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3398
else1266:
  %t3399 = or i64 %a0, 16
  %t3400 = and i64 %t3399, 7
  %t3401 = icmp eq i64 %t3400, 0
  br i1 %t3401, label %fixfast1270, label %fixslow1271
fixfast1270:
  %t3402 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3403 = extractvalue {i64, i1} %t3402, 0
  %t3404 = extractvalue {i64, i1} %t3402, 1
  br i1 %t3404, label %fixslow1271, label %fixmerge1272
fixslow1271:
  %t3405 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1272
fixmerge1272:
  %t3406 = phi i64 [ %t3403, %fixfast1270 ], [ %t3405, %fixslow1271 ]
  %t3407 = load i64, ptr @"emit.internal:rd-str-esc"
  call void @rt_check_callable(i64 %t3407)
  %t3408 = and i64 %t3407, -8
  %t3409 = inttoptr i64 %t3408 to ptr
  %t3410 = load i64, ptr %t3409
  %t3411 = inttoptr i64 %t3410 to ptr
  %t3412 = call fastcc i64%t3411(i64 %t3407, i64 1, i64 %t3338, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3413 = call i64 @rt_cons(i64 %t3412, i64 %a1)
  %t3414 = musttail call fastcc i64 @"emit.internal:code_1079"(i64 %self, i64 2, i64 %t3406, i64 %t3413, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3414
else1239:
  %t3415 = or i64 %a0, 8
  %t3416 = and i64 %t3415, 7
  %t3417 = icmp eq i64 %t3416, 0
  br i1 %t3417, label %fixfast1273, label %fixslow1274
fixfast1273:
  %t3418 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3419 = extractvalue {i64, i1} %t3418, 0
  %t3420 = extractvalue {i64, i1} %t3418, 1
  br i1 %t3420, label %fixslow1274, label %fixmerge1275
fixslow1274:
  %t3421 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1275
fixmerge1275:
  %t3422 = phi i64 [ %t3419, %fixfast1273 ], [ %t3421, %fixslow1274 ]
  %t3423 = call i64 @rt_cons(i64 %t3252, i64 %a1)
  %t3424 = musttail call fastcc i64 @"emit.internal:code_1079"(i64 %self, i64 2, i64 %t3422, i64 %t3423, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3424
else1226:
  %t3425 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3426 = and i64 %self, -8
  %t3427 = inttoptr i64 %t3426 to ptr
  %t3428 = getelementptr i64, ptr %t3427, i64 3
  %t3429 = load i64, ptr %t3428
  %t3430 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3430)
  %t3431 = and i64 %t3430, -8
  %t3432 = inttoptr i64 %t3431 to ptr
  %t3433 = load i64, ptr %t3432
  %t3434 = inttoptr i64 %t3433 to ptr
  %t3435 = musttail call fastcc i64 %t3434(i64 %t3430, i64 2, i64 %t3425, i64 %t3429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3435
}

define fastcc i64 @"emit.internal:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3436 = icmp eq i64 %argc, 4
  br i1 %t3436, label %argok1277, label %arityerr1276
arityerr1276:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1277:
  %t3437 = call ptr @rt_alloc_words(i64 5)
  %t3438 = ptrtoint ptr %t3437 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1079" to i64), ptr %t3437
  %t3439 = or i64 %t3438, 4
  %t3440 = getelementptr i64, ptr %t3437, i64 1
  store i64 %a1, ptr %t3440
  %t3441 = getelementptr i64, ptr %t3437, i64 2
  store i64 %a0, ptr %t3441
  %t3442 = getelementptr i64, ptr %t3437, i64 3
  store i64 %a3, ptr %t3442
  %t3443 = getelementptr i64, ptr %t3437, i64 4
  store i64 %t3439, ptr %t3443
  %t3444 = musttail call fastcc i64 @"emit.internal:code_1079"(i64 %t3439, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3444
}

define fastcc i64 @"emit.internal:code_1088"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3449 = icmp eq i64 %argc, 1
  br i1 %t3449, label %argok1279, label %arityerr1278
arityerr1278:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1279:
  %t3450 = call i64 @rt_null_p(i64 %a0)
  %t3451 = icmp ne i64 %t3450, 1
  br i1 %t3451, label %then1280, label %else1281
then1280:
  ret i64 1
else1281:
  %t3452 = and i64 %self, -8
  %t3453 = inttoptr i64 %t3452 to ptr
  %t3454 = getelementptr i64, ptr %t3453, i64 1
  %t3455 = load i64, ptr %t3454
  %t3456 = call i64 @rt_car(i64 %a0)
  %t3457 = call i64 @rt_car(i64 %t3456)
  %t3458 = or i64 %t3455, %t3457
  %t3459 = and i64 %t3458, 7
  %t3460 = icmp eq i64 %t3459, 0
  br i1 %t3460, label %fixfast1282, label %fixslow1283
fixfast1282:
  %t3461 = icmp eq i64 %t3455, %t3457
  %t3462 = select i1 %t3461, i64 257, i64 1
  br label %fixmerge1284
fixslow1283:
  %t3463 = call i64 @rt_num_eq(i64 %t3455, i64 %t3457)
  br label %fixmerge1284
fixmerge1284:
  %t3464 = phi i64 [ %t3462, %fixfast1282 ], [ %t3463, %fixslow1283 ]
  %t3465 = icmp ne i64 %t3464, 1
  br i1 %t3465, label %then1285, label %else1286
then1285:
  %t3466 = call i64 @rt_car(i64 %a0)
  ret i64 %t3466
else1286:
  %t3467 = call i64 @rt_cdr(i64 %a0)
  %t3468 = musttail call fastcc i64 @"emit.internal:code_1088"(i64 %self, i64 1, i64 %t3467, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3468
}

define fastcc i64 @"emit.internal:code:rd-label-find"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3469 = icmp eq i64 %argc, 2
  br i1 %t3469, label %argok1288, label %arityerr1287
arityerr1287:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1288:
  %t3470 = call ptr @rt_alloc_words(i64 3)
  %t3471 = ptrtoint ptr %t3470 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1088" to i64), ptr %t3470
  %t3472 = or i64 %t3471, 4
  %t3473 = getelementptr i64, ptr %t3470, i64 1
  store i64 %a1, ptr %t3473
  %t3474 = getelementptr i64, ptr %t3470, i64 2
  store i64 %t3472, ptr %t3474
  %t3475 = call i64 @rt_vector_ref(i64 %a0, i64 8)
  %t3476 = musttail call fastcc i64 @"emit.internal:code_1088"(i64 %t3472, i64 1, i64 %t3475, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3476
}

define fastcc i64 @"emit.internal:code:rd-label-add!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3481 = icmp eq i64 %argc, 2
  br i1 %t3481, label %argok1290, label %arityerr1289
arityerr1289:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1290:
  %t3482 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3483 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3483)
  %t3484 = and i64 %t3483, -8
  %t3485 = inttoptr i64 %t3484 to ptr
  %t3486 = load i64, ptr %t3485
  %t3487 = inttoptr i64 %t3486 to ptr
  %t3488 = call fastcc i64%t3487(i64 %t3483, i64 2, i64 %t3482, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3489 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t3489)
  %t3490 = and i64 %t3489, -8
  %t3491 = inttoptr i64 %t3490 to ptr
  %t3492 = load i64, ptr %t3491
  %t3493 = inttoptr i64 %t3492 to ptr
  %t3494 = call fastcc i64%t3493(i64 %t3489, i64 1, i64 %t3488, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3495 = call i64 @rt_cons(i64 %a1, i64 %t3494)
  %t3496 = call i64 @rt_vector_ref(i64 %a0, i64 8)
  %t3497 = call i64 @rt_cons(i64 %t3495, i64 %t3496)
  %t3498 = call i64 @rt_vector_set(i64 %a0, i64 8, i64 %t3497)
  ret i64 %t3495
}

define fastcc i64 @"emit.internal:code:rd-placeholder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3503 = icmp eq i64 %argc, 2
  br i1 %t3503, label %argok1292, label %arityerr1291
arityerr1291:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1292:
  %t3504 = call i64 @rt_vector_ref(i64 %a0, i64 16)
  %t3505 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3505)
  %t3506 = and i64 %t3505, -8
  %t3507 = inttoptr i64 %t3506 to ptr
  %t3508 = load i64, ptr %t3507
  %t3509 = inttoptr i64 %t3508 to ptr
  %t3510 = call fastcc i64%t3509(i64 %t3505, i64 2, i64 %t3504, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3511 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t3511)
  %t3512 = and i64 %t3511, -8
  %t3513 = inttoptr i64 %t3512 to ptr
  %t3514 = load i64, ptr %t3513
  %t3515 = inttoptr i64 %t3514 to ptr
  %t3516 = musttail call fastcc i64 %t3515(i64 %t3511, i64 1, i64 %t3510, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3516
}

define fastcc i64 @"emit.internal:code:rd-placeholder?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3521 = icmp eq i64 %argc, 2
  br i1 %t3521, label %argok1294, label %arityerr1293
arityerr1293:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1294:
  %t3522 = call i64 @rt_vector_p(i64 %a1)
  %t3523 = icmp ne i64 %t3522, 1
  br i1 %t3523, label %then1295, label %else1296
then1295:
  %t3524 = call i64 @rt_vector_length(i64 %a1)
  %t3525 = or i64 %t3524, 16
  %t3526 = and i64 %t3525, 7
  %t3527 = icmp eq i64 %t3526, 0
  br i1 %t3527, label %fixfast1297, label %fixslow1298
fixfast1297:
  %t3528 = icmp eq i64 %t3524, 16
  %t3529 = select i1 %t3528, i64 257, i64 1
  br label %fixmerge1299
fixslow1298:
  %t3530 = call i64 @rt_num_eq(i64 %t3524, i64 16)
  br label %fixmerge1299
fixmerge1299:
  %t3531 = phi i64 [ %t3529, %fixfast1297 ], [ %t3530, %fixslow1298 ]
  %t3532 = icmp ne i64 %t3531, 1
  br i1 %t3532, label %then1300, label %else1301
then1300:
  %t3533 = call i64 @rt_vector_ref(i64 %a1, i64 0)
  %t3534 = call i64 @rt_vector_ref(i64 %a0, i64 16)
  %t3535 = call i64 @rt_eq_p(i64 %t3533, i64 %t3534)
  ret i64 %t3535
else1301:
  ret i64 1
else1296:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-placeholder-entry"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3540 = icmp eq i64 %argc, 1
  br i1 %t3540, label %argok1303, label %arityerr1302
arityerr1302:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1303:
  %t3541 = call i64 @rt_vector_ref(i64 %a0, i64 8)
  ret i64 %t3541
}

define fastcc i64 @"emit.internal:code:rd-seen?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3546 = icmp eq i64 %argc, 2
  br i1 %t3546, label %argok1305, label %arityerr1304
arityerr1304:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1305:
  %t3547 = call i64 @rt_null_p(i64 %a1)
  %t3548 = icmp ne i64 %t3547, 1
  br i1 %t3548, label %then1306, label %else1307
then1306:
  ret i64 1
else1307:
  %t3549 = call i64 @rt_car(i64 %a1)
  %t3550 = call i64 @rt_eq_p(i64 %a0, i64 %t3549)
  %t3551 = icmp ne i64 %t3550, 1
  br i1 %t3551, label %then1308, label %else1309
then1308:
  ret i64 257
else1309:
  %t3552 = call i64 @rt_cdr(i64 %a1)
  %t3553 = load i64, ptr @"emit.internal:rd-seen?"
  call void @rt_check_callable(i64 %t3553)
  %t3554 = and i64 %t3553, -8
  %t3555 = inttoptr i64 %t3554 to ptr
  %t3556 = load i64, ptr %t3555
  %t3557 = inttoptr i64 %t3556 to ptr
  %t3558 = musttail call fastcc i64 %t3557(i64 %t3553, i64 2, i64 %a0, i64 %t3552, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3558
}

define fastcc i64 @"emit.internal:code:rd-label-scan"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3563 = icmp eq i64 %argc, 3
  br i1 %t3563, label %argok1311, label %arityerr1310
arityerr1310:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1311:
  %t3564 = or i64 %a2, %a1
  %t3565 = and i64 %t3564, 7
  %t3566 = icmp eq i64 %t3565, 0
  br i1 %t3566, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t3567 = icmp slt i64 %a2, %a1
  %t3568 = select i1 %t3567, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t3569 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1314
fixmerge1314:
  %t3570 = phi i64 [ %t3568, %fixfast1312 ], [ %t3569, %fixslow1313 ]
  %t3571 = icmp ne i64 %t3570, 1
  br i1 %t3571, label %then1315, label %else1316
then1315:
  %t3572 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3573 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t3573)
  %t3574 = and i64 %t3573, -8
  %t3575 = inttoptr i64 %t3574 to ptr
  %t3576 = load i64, ptr %t3575
  %t3577 = inttoptr i64 %t3576 to ptr
  %t3578 = call fastcc i64%t3577(i64 %t3573, i64 1, i64 %t3572, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1317
else1316:
  br label %merge1317
merge1317:
  %t3579 = phi i64 [ %t3578, %then1315 ], [ 1, %else1316 ]
  %t3580 = icmp ne i64 %t3579, 1
  br i1 %t3580, label %then1318, label %else1319
then1318:
  %t3581 = or i64 %a2, 8
  %t3582 = and i64 %t3581, 7
  %t3583 = icmp eq i64 %t3582, 0
  br i1 %t3583, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t3584 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3585 = extractvalue {i64, i1} %t3584, 0
  %t3586 = extractvalue {i64, i1} %t3584, 1
  br i1 %t3586, label %fixslow1321, label %fixmerge1322
fixslow1321:
  %t3587 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1322
fixmerge1322:
  %t3588 = phi i64 [ %t3585, %fixfast1320 ], [ %t3587, %fixslow1321 ]
  %t3589 = load i64, ptr @"emit.internal:rd-label-scan"
  call void @rt_check_callable(i64 %t3589)
  %t3590 = and i64 %t3589, -8
  %t3591 = inttoptr i64 %t3590 to ptr
  %t3592 = load i64, ptr %t3591
  %t3593 = inttoptr i64 %t3592 to ptr
  %t3594 = musttail call fastcc i64 %t3593(i64 %t3589, i64 3, i64 %a0, i64 %a1, i64 %t3588, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3594
else1319:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code_1129"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3599 = icmp eq i64 %argc, 1
  br i1 %t3599, label %argok1324, label %arityerr1323
arityerr1323:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1324:
  %t3600 = and i64 %self, -8
  %t3601 = inttoptr i64 %t3600 to ptr
  %t3602 = getelementptr i64, ptr %t3601, i64 1
  %t3603 = load i64, ptr %t3602
  %t3604 = or i64 %a0, %t3603
  %t3605 = and i64 %t3604, 7
  %t3606 = icmp eq i64 %t3605, 0
  br i1 %t3606, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t3607 = icmp slt i64 %a0, %t3603
  %t3608 = select i1 %t3607, i64 257, i64 1
  br label %fixmerge1327
fixslow1326:
  %t3609 = call i64 @rt_lt(i64 %a0, i64 %t3603)
  br label %fixmerge1327
fixmerge1327:
  %t3610 = phi i64 [ %t3608, %fixfast1325 ], [ %t3609, %fixslow1326 ]
  %t3611 = icmp ne i64 %t3610, 1
  br i1 %t3611, label %then1328, label %else1329
then1328:
  %t3612 = and i64 %self, -8
  %t3613 = inttoptr i64 %t3612 to ptr
  %t3614 = getelementptr i64, ptr %t3613, i64 2
  %t3615 = load i64, ptr %t3614
  %t3616 = and i64 %self, -8
  %t3617 = inttoptr i64 %t3616 to ptr
  %t3618 = getelementptr i64, ptr %t3617, i64 3
  %t3619 = load i64, ptr %t3618
  %t3620 = and i64 %self, -8
  %t3621 = inttoptr i64 %t3620 to ptr
  %t3622 = getelementptr i64, ptr %t3621, i64 2
  %t3623 = load i64, ptr %t3622
  %t3624 = call i64 @rt_vector_ref(i64 %t3623, i64 %a0)
  %t3625 = and i64 %self, -8
  %t3626 = inttoptr i64 %t3625 to ptr
  %t3627 = getelementptr i64, ptr %t3626, i64 4
  %t3628 = load i64, ptr %t3627
  %t3629 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3629)
  %t3630 = and i64 %t3629, -8
  %t3631 = inttoptr i64 %t3630 to ptr
  %t3632 = load i64, ptr %t3631
  %t3633 = inttoptr i64 %t3632 to ptr
  %t3634 = call fastcc i64%t3633(i64 %t3629, i64 3, i64 %t3619, i64 %t3624, i64 %t3628, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3635 = call i64 @rt_vector_set(i64 %t3615, i64 %a0, i64 %t3634)
  %t3636 = or i64 %a0, 8
  %t3637 = and i64 %t3636, 7
  %t3638 = icmp eq i64 %t3637, 0
  br i1 %t3638, label %fixfast1330, label %fixslow1331
fixfast1330:
  %t3639 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3640 = extractvalue {i64, i1} %t3639, 0
  %t3641 = extractvalue {i64, i1} %t3639, 1
  br i1 %t3641, label %fixslow1331, label %fixmerge1332
fixslow1331:
  %t3642 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1332
fixmerge1332:
  %t3643 = phi i64 [ %t3640, %fixfast1330 ], [ %t3642, %fixslow1331 ]
  %t3644 = musttail call fastcc i64 @"emit.internal:code_1129"(i64 %self, i64 1, i64 %t3643, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3644
else1329:
  %t3645 = and i64 %self, -8
  %t3646 = inttoptr i64 %t3645 to ptr
  %t3647 = getelementptr i64, ptr %t3646, i64 2
  %t3648 = load i64, ptr %t3647
  ret i64 %t3648
}

define fastcc i64 @"emit.internal:code:rd-resolve"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3649 = icmp eq i64 %argc, 3
  br i1 %t3649, label %argok1334, label %arityerr1333
arityerr1333:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1334:
  %t3650 = load i64, ptr @"emit.internal:rd-placeholder?"
  call void @rt_check_callable(i64 %t3650)
  %t3651 = and i64 %t3650, -8
  %t3652 = inttoptr i64 %t3651 to ptr
  %t3653 = load i64, ptr %t3652
  %t3654 = inttoptr i64 %t3653 to ptr
  %t3655 = call fastcc i64%t3654(i64 %t3650, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3656 = icmp ne i64 %t3655, 1
  br i1 %t3656, label %then1335, label %else1336
then1335:
  %t3657 = load i64, ptr @"emit.internal:rd-placeholder-entry"
  call void @rt_check_callable(i64 %t3657)
  %t3658 = and i64 %t3657, -8
  %t3659 = inttoptr i64 %t3658 to ptr
  %t3660 = load i64, ptr %t3659
  %t3661 = inttoptr i64 %t3660 to ptr
  %t3662 = call fastcc i64%t3661(i64 %t3657, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3663 = call i64 @rt_cdr(i64 %t3662)
  %t3664 = call i64 @rt_vector_ref(i64 %t3663, i64 8)
  %t3665 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3665)
  %t3666 = and i64 %t3665, -8
  %t3667 = inttoptr i64 %t3666 to ptr
  %t3668 = load i64, ptr %t3667
  %t3669 = inttoptr i64 %t3668 to ptr
  %t3670 = musttail call fastcc i64 %t3669(i64 %t3665, i64 3, i64 %a0, i64 %t3664, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3670
else1336:
  %t3671 = call i64 @rt_pair_p(i64 %a1)
  %t3672 = icmp ne i64 %t3671, 1
  br i1 %t3672, label %then1337, label %else1338
then1337:
  %t3673 = load i64, ptr @"emit.internal:rd-seen?"
  call void @rt_check_callable(i64 %t3673)
  %t3674 = and i64 %t3673, -8
  %t3675 = inttoptr i64 %t3674 to ptr
  %t3676 = load i64, ptr %t3675
  %t3677 = inttoptr i64 %t3676 to ptr
  %t3678 = call fastcc i64%t3677(i64 %t3673, i64 2, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3679 = icmp ne i64 %t3678, 1
  br i1 %t3679, label %then1339, label %else1340
then1339:
  ret i64 %a1
else1340:
  %t3680 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3681 = call i64 @rt_car(i64 %a1)
  %t3682 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3682)
  %t3683 = and i64 %t3682, -8
  %t3684 = inttoptr i64 %t3683 to ptr
  %t3685 = load i64, ptr %t3684
  %t3686 = inttoptr i64 %t3685 to ptr
  %t3687 = call fastcc i64%t3686(i64 %t3682, i64 3, i64 %a0, i64 %t3681, i64 %t3680, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3688 = call i64 @rt_set_car(i64 %a1, i64 %t3687)
  %t3689 = call i64 @rt_cdr(i64 %a1)
  %t3690 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3690)
  %t3691 = and i64 %t3690, -8
  %t3692 = inttoptr i64 %t3691 to ptr
  %t3693 = load i64, ptr %t3692
  %t3694 = inttoptr i64 %t3693 to ptr
  %t3695 = call fastcc i64%t3694(i64 %t3690, i64 3, i64 %a0, i64 %t3689, i64 %t3680, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3696 = call i64 @rt_set_cdr(i64 %a1, i64 %t3695)
  ret i64 %a1
else1338:
  %t3697 = call i64 @rt_vector_p(i64 %a1)
  %t3698 = icmp ne i64 %t3697, 1
  br i1 %t3698, label %then1341, label %else1342
then1341:
  %t3699 = load i64, ptr @"emit.internal:rd-seen?"
  call void @rt_check_callable(i64 %t3699)
  %t3700 = and i64 %t3699, -8
  %t3701 = inttoptr i64 %t3700 to ptr
  %t3702 = load i64, ptr %t3701
  %t3703 = inttoptr i64 %t3702 to ptr
  %t3704 = call fastcc i64%t3703(i64 %t3699, i64 2, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3705 = icmp ne i64 %t3704, 1
  br i1 %t3705, label %then1343, label %else1344
then1343:
  ret i64 %a1
else1344:
  %t3706 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3707 = call i64 @rt_vector_length(i64 %a1)
  %t3708 = call ptr @rt_alloc_words(i64 6)
  %t3709 = ptrtoint ptr %t3708 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1129" to i64), ptr %t3708
  %t3710 = or i64 %t3709, 4
  %t3711 = getelementptr i64, ptr %t3708, i64 1
  store i64 %t3707, ptr %t3711
  %t3712 = getelementptr i64, ptr %t3708, i64 2
  store i64 %a1, ptr %t3712
  %t3713 = getelementptr i64, ptr %t3708, i64 3
  store i64 %a0, ptr %t3713
  %t3714 = getelementptr i64, ptr %t3708, i64 4
  store i64 %t3706, ptr %t3714
  %t3715 = getelementptr i64, ptr %t3708, i64 5
  store i64 %t3710, ptr %t3715
  %t3716 = musttail call fastcc i64 @"emit.internal:code_1129"(i64 %t3710, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3716
else1342:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-finish"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3721 = icmp eq i64 %argc, 2
  br i1 %t3721, label %argok1346, label %arityerr1345
arityerr1345:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1346:
  %t3722 = call i64 @rt_cdr(i64 %a1)
  %t3723 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3723)
  %t3724 = and i64 %t3723, -8
  %t3725 = inttoptr i64 %t3724 to ptr
  %t3726 = load i64, ptr %t3725
  %t3727 = inttoptr i64 %t3726 to ptr
  %t3728 = call fastcc i64%t3727(i64 %t3723, i64 1, i64 %t3722, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3729 = icmp ne i64 %t3728, 1
  br i1 %t3729, label %then1347, label %else1348
then1347:
  ret i64 %a1
else1348:
  %t3730 = call i64 @rt_car(i64 %a1)
  %t3731 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3731)
  %t3732 = and i64 %t3731, -8
  %t3733 = inttoptr i64 %t3732 to ptr
  %t3734 = load i64, ptr %t3733
  %t3735 = inttoptr i64 %t3734 to ptr
  %t3736 = call fastcc i64%t3735(i64 %t3731, i64 3, i64 %a0, i64 %t3730, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3737 = call i64 @rt_cdr(i64 %a1)
  %t3738 = call i64 @rt_cons(i64 %t3736, i64 %t3737)
  ret i64 %t3738
}

define fastcc i64 @"emit.internal:code:rd-label"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3743 = icmp eq i64 %argc, 4
  br i1 %t3743, label %argok1350, label %arityerr1349
arityerr1349:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1350:
  %t3744 = load i64, ptr @"emit.internal:rd-label-scan"
  call void @rt_check_callable(i64 %t3744)
  %t3745 = and i64 %t3744, -8
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = load i64, ptr %t3746
  %t3748 = inttoptr i64 %t3747 to ptr
  %t3749 = call fastcc i64%t3748(i64 %t3744, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3750 = or i64 %a1, %t3749
  %t3751 = and i64 %t3750, 7
  %t3752 = icmp eq i64 %t3751, 0
  br i1 %t3752, label %fixfast1351, label %fixslow1352
fixfast1351:
  %t3753 = icmp slt i64 %a1, %t3749
  %t3754 = select i1 %t3753, i64 257, i64 1
  br label %fixmerge1353
fixslow1352:
  %t3755 = call i64 @rt_lt(i64 %a1, i64 %t3749)
  br label %fixmerge1353
fixmerge1353:
  %t3756 = phi i64 [ %t3754, %fixfast1351 ], [ %t3755, %fixslow1352 ]
  %t3757 = icmp ne i64 %t3756, 1
  br i1 %t3757, label %then1354, label %else1355
then1354:
  br label %merge1356
else1355:
  %t3758 = or i64 %t3749, %a1
  %t3759 = and i64 %t3758, 7
  %t3760 = icmp eq i64 %t3759, 0
  br i1 %t3760, label %fixfast1357, label %fixslow1358
fixfast1357:
  %t3761 = icmp eq i64 %t3749, %a1
  %t3762 = select i1 %t3761, i64 257, i64 1
  br label %fixmerge1359
fixslow1358:
  %t3763 = call i64 @rt_num_eq(i64 %t3749, i64 %a1)
  br label %fixmerge1359
fixmerge1359:
  %t3764 = phi i64 [ %t3762, %fixfast1357 ], [ %t3763, %fixslow1358 ]
  br label %merge1356
merge1356:
  %t3765 = phi i64 [ 257, %then1354 ], [ %t3764, %fixmerge1359 ]
  %t3766 = icmp ne i64 %t3765, 1
  br i1 %t3766, label %then1360, label %else1361
then1360:
  %t3767 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3768 = or i64 %a2, 8
  %t3769 = and i64 %t3768, 7
  %t3770 = icmp eq i64 %t3769, 0
  br i1 %t3770, label %fixfast1362, label %fixslow1363
fixfast1362:
  %t3771 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3772 = extractvalue {i64, i1} %t3771, 0
  %t3773 = extractvalue {i64, i1} %t3771, 1
  br i1 %t3773, label %fixslow1363, label %fixmerge1364
fixslow1363:
  %t3774 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1364
fixmerge1364:
  %t3775 = phi i64 [ %t3772, %fixfast1362 ], [ %t3774, %fixslow1363 ]
  %t3776 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3776)
  %t3777 = and i64 %t3776, -8
  %t3778 = inttoptr i64 %t3777 to ptr
  %t3779 = load i64, ptr %t3778
  %t3780 = inttoptr i64 %t3779 to ptr
  %t3781 = musttail call fastcc i64 %t3780(i64 %t3776, i64 2, i64 %t3767, i64 %t3775, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3781
else1361:
  %t3782 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t3782)
  %t3783 = and i64 %t3782, -8
  %t3784 = inttoptr i64 %t3783 to ptr
  %t3785 = load i64, ptr %t3784
  %t3786 = inttoptr i64 %t3785 to ptr
  %t3787 = call fastcc i64%t3786(i64 %t3782, i64 4, i64 %a0, i64 %a2, i64 %t3749, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3788 = call i64 @rt_string_ref(i64 %a0, i64 %t3749)
  %t3789 = call i64 @rt_char_to_integer(i64 %t3788)
  %t3790 = load i64, ptr @"emit.internal:rd-label-find"
  call void @rt_check_callable(i64 %t3790)
  %t3791 = and i64 %t3790, -8
  %t3792 = inttoptr i64 %t3791 to ptr
  %t3793 = load i64, ptr %t3792
  %t3794 = inttoptr i64 %t3793 to ptr
  %t3795 = call fastcc i64%t3794(i64 %t3790, i64 2, i64 %a3, i64 %t3787, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3796 = or i64 %t3789, 488
  %t3797 = and i64 %t3796, 7
  %t3798 = icmp eq i64 %t3797, 0
  br i1 %t3798, label %fixfast1365, label %fixslow1366
fixfast1365:
  %t3799 = icmp eq i64 %t3789, 488
  %t3800 = select i1 %t3799, i64 257, i64 1
  br label %fixmerge1367
fixslow1366:
  %t3801 = call i64 @rt_num_eq(i64 %t3789, i64 488)
  br label %fixmerge1367
fixmerge1367:
  %t3802 = phi i64 [ %t3800, %fixfast1365 ], [ %t3801, %fixslow1366 ]
  %t3803 = icmp ne i64 %t3802, 1
  br i1 %t3803, label %then1368, label %else1369
then1368:
  %t3804 = icmp ne i64 %t3795, 1
  br i1 %t3804, label %then1370, label %else1371
then1370:
  %t3805 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3806 = or i64 %a2, 8
  %t3807 = and i64 %t3806, 7
  %t3808 = icmp eq i64 %t3807, 0
  br i1 %t3808, label %fixfast1372, label %fixslow1373
fixfast1372:
  %t3809 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3810 = extractvalue {i64, i1} %t3809, 0
  %t3811 = extractvalue {i64, i1} %t3809, 1
  br i1 %t3811, label %fixslow1373, label %fixmerge1374
fixslow1373:
  %t3812 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1374
fixmerge1374:
  %t3813 = phi i64 [ %t3810, %fixfast1372 ], [ %t3812, %fixslow1373 ]
  %t3814 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3814)
  %t3815 = and i64 %t3814, -8
  %t3816 = inttoptr i64 %t3815 to ptr
  %t3817 = load i64, ptr %t3816
  %t3818 = inttoptr i64 %t3817 to ptr
  %t3819 = musttail call fastcc i64 %t3818(i64 %t3814, i64 2, i64 %t3805, i64 %t3813, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3819
else1371:
  %t3820 = load i64, ptr @"emit.internal:rd-label-add!"
  call void @rt_check_callable(i64 %t3820)
  %t3821 = and i64 %t3820, -8
  %t3822 = inttoptr i64 %t3821 to ptr
  %t3823 = load i64, ptr %t3822
  %t3824 = inttoptr i64 %t3823 to ptr
  %t3825 = call fastcc i64%t3824(i64 %t3820, i64 2, i64 %a3, i64 %t3787, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3826 = or i64 %t3749, 8
  %t3827 = and i64 %t3826, 7
  %t3828 = icmp eq i64 %t3827, 0
  br i1 %t3828, label %fixfast1375, label %fixslow1376
fixfast1375:
  %t3829 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3749, i64 8)
  %t3830 = extractvalue {i64, i1} %t3829, 0
  %t3831 = extractvalue {i64, i1} %t3829, 1
  br i1 %t3831, label %fixslow1376, label %fixmerge1377
fixslow1376:
  %t3832 = call i64 @rt_add(i64 %t3749, i64 8)
  br label %fixmerge1377
fixmerge1377:
  %t3833 = phi i64 [ %t3830, %fixfast1375 ], [ %t3832, %fixslow1376 ]
  %t3834 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3834)
  %t3835 = and i64 %t3834, -8
  %t3836 = inttoptr i64 %t3835 to ptr
  %t3837 = load i64, ptr %t3836
  %t3838 = inttoptr i64 %t3837 to ptr
  %t3839 = call fastcc i64%t3838(i64 %t3834, i64 4, i64 %a0, i64 %a1, i64 %t3833, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3840 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3840)
  %t3841 = and i64 %t3840, -8
  %t3842 = inttoptr i64 %t3841 to ptr
  %t3843 = load i64, ptr %t3842
  %t3844 = inttoptr i64 %t3843 to ptr
  %t3845 = call fastcc i64%t3844(i64 %t3840, i64 4, i64 %a0, i64 %a1, i64 %t3839, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3846 = call i64 @rt_cdr(i64 %t3845)
  %t3847 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3847)
  %t3848 = and i64 %t3847, -8
  %t3849 = inttoptr i64 %t3848 to ptr
  %t3850 = load i64, ptr %t3849
  %t3851 = inttoptr i64 %t3850 to ptr
  %t3852 = call fastcc i64%t3851(i64 %t3847, i64 1, i64 %t3846, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3853 = icmp ne i64 %t3852, 1
  br i1 %t3853, label %then1378, label %else1379
then1378:
  ret i64 %t3845
else1379:
  %t3854 = call i64 @rt_car(i64 %t3845)
  %t3855 = call i64 @rt_cdr(i64 %t3825)
  %t3856 = load i64, ptr @"emit.internal:rd-placeholder?"
  call void @rt_check_callable(i64 %t3856)
  %t3857 = and i64 %t3856, -8
  %t3858 = inttoptr i64 %t3857 to ptr
  %t3859 = load i64, ptr %t3858
  %t3860 = inttoptr i64 %t3859 to ptr
  %t3861 = call fastcc i64%t3860(i64 %t3856, i64 2, i64 %a3, i64 %t3854, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3862 = icmp ne i64 %t3861, 1
  br i1 %t3862, label %then1380, label %else1381
then1380:
  %t3863 = load i64, ptr @"emit.internal:rd-placeholder-entry"
  call void @rt_check_callable(i64 %t3863)
  %t3864 = and i64 %t3863, -8
  %t3865 = inttoptr i64 %t3864 to ptr
  %t3866 = load i64, ptr %t3865
  %t3867 = inttoptr i64 %t3866 to ptr
  %t3868 = call fastcc i64%t3867(i64 %t3863, i64 1, i64 %t3854, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3869 = call i64 @rt_eq_p(i64 %t3868, i64 %t3825)
  br label %merge1382
else1381:
  br label %merge1382
merge1382:
  %t3870 = phi i64 [ %t3869, %then1380 ], [ 1, %else1381 ]
  %t3871 = icmp ne i64 %t3870, 1
  br i1 %t3871, label %then1383, label %else1384
then1383:
  %t3872 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3873 = or i64 %a2, 8
  %t3874 = and i64 %t3873, 7
  %t3875 = icmp eq i64 %t3874, 0
  br i1 %t3875, label %fixfast1385, label %fixslow1386
fixfast1385:
  %t3876 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3877 = extractvalue {i64, i1} %t3876, 0
  %t3878 = extractvalue {i64, i1} %t3876, 1
  br i1 %t3878, label %fixslow1386, label %fixmerge1387
fixslow1386:
  %t3879 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1387
fixmerge1387:
  %t3880 = phi i64 [ %t3877, %fixfast1385 ], [ %t3879, %fixslow1386 ]
  %t3881 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3881)
  %t3882 = and i64 %t3881, -8
  %t3883 = inttoptr i64 %t3882 to ptr
  %t3884 = load i64, ptr %t3883
  %t3885 = inttoptr i64 %t3884 to ptr
  %t3886 = musttail call fastcc i64 %t3885(i64 %t3881, i64 2, i64 %t3872, i64 %t3880, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3886
else1384:
  %t3887 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3888 = call i64 @rt_vector_set(i64 %t3855, i64 0, i64 %t3887)
  %t3889 = call i64 @rt_vector_set(i64 %t3855, i64 8, i64 %t3854)
  ret i64 %t3845
else1369:
  %t3890 = or i64 %t3789, 280
  %t3891 = and i64 %t3890, 7
  %t3892 = icmp eq i64 %t3891, 0
  br i1 %t3892, label %fixfast1388, label %fixslow1389
fixfast1388:
  %t3893 = icmp eq i64 %t3789, 280
  %t3894 = select i1 %t3893, i64 257, i64 1
  br label %fixmerge1390
fixslow1389:
  %t3895 = call i64 @rt_num_eq(i64 %t3789, i64 280)
  br label %fixmerge1390
fixmerge1390:
  %t3896 = phi i64 [ %t3894, %fixfast1388 ], [ %t3895, %fixslow1389 ]
  %t3897 = icmp ne i64 %t3896, 1
  br i1 %t3897, label %then1391, label %else1392
then1391:
  %t3898 = or i64 %t3749, 8
  %t3899 = and i64 %t3898, 7
  %t3900 = icmp eq i64 %t3899, 0
  br i1 %t3900, label %fixfast1393, label %fixslow1394
fixfast1393:
  %t3901 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3749, i64 8)
  %t3902 = extractvalue {i64, i1} %t3901, 0
  %t3903 = extractvalue {i64, i1} %t3901, 1
  br i1 %t3903, label %fixslow1394, label %fixmerge1395
fixslow1394:
  %t3904 = call i64 @rt_add(i64 %t3749, i64 8)
  br label %fixmerge1395
fixmerge1395:
  %t3905 = phi i64 [ %t3902, %fixfast1393 ], [ %t3904, %fixslow1394 ]
  %t3906 = or i64 %t3905, %a1
  %t3907 = and i64 %t3906, 7
  %t3908 = icmp eq i64 %t3907, 0
  br i1 %t3908, label %fixfast1396, label %fixslow1397
fixfast1396:
  %t3909 = icmp slt i64 %t3905, %a1
  %t3910 = select i1 %t3909, i64 257, i64 1
  br label %fixmerge1398
fixslow1397:
  %t3911 = call i64 @rt_lt(i64 %t3905, i64 %a1)
  br label %fixmerge1398
fixmerge1398:
  %t3912 = phi i64 [ %t3910, %fixfast1396 ], [ %t3911, %fixslow1397 ]
  %t3913 = icmp ne i64 %t3912, 1
  br i1 %t3913, label %then1399, label %else1400
then1399:
  %t3914 = or i64 %t3749, 8
  %t3915 = and i64 %t3914, 7
  %t3916 = icmp eq i64 %t3915, 0
  br i1 %t3916, label %fixfast1402, label %fixslow1403
fixfast1402:
  %t3917 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3749, i64 8)
  %t3918 = extractvalue {i64, i1} %t3917, 0
  %t3919 = extractvalue {i64, i1} %t3917, 1
  br i1 %t3919, label %fixslow1403, label %fixmerge1404
fixslow1403:
  %t3920 = call i64 @rt_add(i64 %t3749, i64 8)
  br label %fixmerge1404
fixmerge1404:
  %t3921 = phi i64 [ %t3918, %fixfast1402 ], [ %t3920, %fixslow1403 ]
  %t3922 = call i64 @rt_string_ref(i64 %a0, i64 %t3921)
  %t3923 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t3923)
  %t3924 = and i64 %t3923, -8
  %t3925 = inttoptr i64 %t3924 to ptr
  %t3926 = load i64, ptr %t3925
  %t3927 = inttoptr i64 %t3926 to ptr
  %t3928 = call fastcc i64%t3927(i64 %t3923, i64 1, i64 %t3922, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3929 = call i64 @rt_not(i64 %t3928)
  br label %merge1401
else1400:
  br label %merge1401
merge1401:
  %t3930 = phi i64 [ %t3929, %fixmerge1404 ], [ 1, %else1400 ]
  %t3931 = icmp ne i64 %t3930, 1
  br i1 %t3931, label %then1405, label %else1406
then1405:
  %t3932 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3933 = or i64 %a2, 8
  %t3934 = and i64 %t3933, 7
  %t3935 = icmp eq i64 %t3934, 0
  br i1 %t3935, label %fixfast1407, label %fixslow1408
fixfast1407:
  %t3936 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3937 = extractvalue {i64, i1} %t3936, 0
  %t3938 = extractvalue {i64, i1} %t3936, 1
  br i1 %t3938, label %fixslow1408, label %fixmerge1409
fixslow1408:
  %t3939 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1409
fixmerge1409:
  %t3940 = phi i64 [ %t3937, %fixfast1407 ], [ %t3939, %fixslow1408 ]
  %t3941 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3941)
  %t3942 = and i64 %t3941, -8
  %t3943 = inttoptr i64 %t3942 to ptr
  %t3944 = load i64, ptr %t3943
  %t3945 = inttoptr i64 %t3944 to ptr
  %t3946 = musttail call fastcc i64 %t3945(i64 %t3941, i64 2, i64 %t3932, i64 %t3940, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3946
else1406:
  %t3947 = icmp ne i64 %t3795, 1
  br i1 %t3947, label %then1410, label %else1411
then1410:
  %t3948 = call i64 @rt_cdr(i64 %t3795)
  %t3949 = call i64 @rt_vector_ref(i64 %t3948, i64 0)
  %t3950 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3951 = call i64 @rt_eq_p(i64 %t3949, i64 %t3950)
  %t3952 = icmp ne i64 %t3951, 1
  br i1 %t3952, label %then1412, label %else1413
then1412:
  %t3953 = load i64, ptr @"emit.internal:rd-placeholder"
  call void @rt_check_callable(i64 %t3953)
  %t3954 = and i64 %t3953, -8
  %t3955 = inttoptr i64 %t3954 to ptr
  %t3956 = load i64, ptr %t3955
  %t3957 = inttoptr i64 %t3956 to ptr
  %t3958 = call fastcc i64%t3957(i64 %t3953, i64 2, i64 %a3, i64 %t3795, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3959 = or i64 %t3749, 8
  %t3960 = and i64 %t3959, 7
  %t3961 = icmp eq i64 %t3960, 0
  br i1 %t3961, label %fixfast1414, label %fixslow1415
fixfast1414:
  %t3962 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3749, i64 8)
  %t3963 = extractvalue {i64, i1} %t3962, 0
  %t3964 = extractvalue {i64, i1} %t3962, 1
  br i1 %t3964, label %fixslow1415, label %fixmerge1416
fixslow1415:
  %t3965 = call i64 @rt_add(i64 %t3749, i64 8)
  br label %fixmerge1416
fixmerge1416:
  %t3966 = phi i64 [ %t3963, %fixfast1414 ], [ %t3965, %fixslow1415 ]
  %t3967 = call i64 @rt_cons(i64 %t3958, i64 %t3966)
  ret i64 %t3967
else1413:
  %t3968 = call i64 @rt_vector_ref(i64 %t3948, i64 8)
  %t3969 = or i64 %t3749, 8
  %t3970 = and i64 %t3969, 7
  %t3971 = icmp eq i64 %t3970, 0
  br i1 %t3971, label %fixfast1417, label %fixslow1418
fixfast1417:
  %t3972 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3749, i64 8)
  %t3973 = extractvalue {i64, i1} %t3972, 0
  %t3974 = extractvalue {i64, i1} %t3972, 1
  br i1 %t3974, label %fixslow1418, label %fixmerge1419
fixslow1418:
  %t3975 = call i64 @rt_add(i64 %t3749, i64 8)
  br label %fixmerge1419
fixmerge1419:
  %t3976 = phi i64 [ %t3973, %fixfast1417 ], [ %t3975, %fixslow1418 ]
  %t3977 = call i64 @rt_cons(i64 %t3968, i64 %t3976)
  ret i64 %t3977
else1411:
  %t3978 = call i64 @rt_intern(ptr @.str.sym.19)
  %t3979 = or i64 %a2, 8
  %t3980 = and i64 %t3979, 7
  %t3981 = icmp eq i64 %t3980, 0
  br i1 %t3981, label %fixfast1420, label %fixslow1421
fixfast1420:
  %t3982 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3983 = extractvalue {i64, i1} %t3982, 0
  %t3984 = extractvalue {i64, i1} %t3982, 1
  br i1 %t3984, label %fixslow1421, label %fixmerge1422
fixslow1421:
  %t3985 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1422
fixmerge1422:
  %t3986 = phi i64 [ %t3983, %fixfast1420 ], [ %t3985, %fixslow1421 ]
  %t3987 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3987)
  %t3988 = and i64 %t3987, -8
  %t3989 = inttoptr i64 %t3988 to ptr
  %t3990 = load i64, ptr %t3989
  %t3991 = inttoptr i64 %t3990 to ptr
  %t3992 = musttail call fastcc i64 %t3991(i64 %t3987, i64 2, i64 %t3978, i64 %t3986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3992
else1392:
  %t3993 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3994 = or i64 %a2, 8
  %t3995 = and i64 %t3994, 7
  %t3996 = icmp eq i64 %t3995, 0
  br i1 %t3996, label %fixfast1423, label %fixslow1424
fixfast1423:
  %t3997 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3998 = extractvalue {i64, i1} %t3997, 0
  %t3999 = extractvalue {i64, i1} %t3997, 1
  br i1 %t3999, label %fixslow1424, label %fixmerge1425
fixslow1424:
  %t4000 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1425
fixmerge1425:
  %t4001 = phi i64 [ %t3998, %fixfast1423 ], [ %t4000, %fixslow1424 ]
  %t4002 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4002)
  %t4003 = and i64 %t4002, -8
  %t4004 = inttoptr i64 %t4003 to ptr
  %t4005 = load i64, ptr %t4004
  %t4006 = inttoptr i64 %t4005 to ptr
  %t4007 = musttail call fastcc i64 %t4006(i64 %t4002, i64 2, i64 %t3993, i64 %t4001, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4007
}

define fastcc i64 @"emit.internal:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4012 = icmp eq i64 %argc, 4
  br i1 %t4012, label %argok1427, label %arityerr1426
arityerr1426:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1427:
  %t4013 = or i64 %a1, %a2
  %t4014 = and i64 %t4013, 7
  %t4015 = icmp eq i64 %t4014, 0
  br i1 %t4015, label %fixfast1428, label %fixslow1429
fixfast1428:
  %t4016 = icmp slt i64 %a1, %a2
  %t4017 = select i1 %t4016, i64 257, i64 1
  br label %fixmerge1430
fixslow1429:
  %t4018 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1430
fixmerge1430:
  %t4019 = phi i64 [ %t4017, %fixfast1428 ], [ %t4018, %fixslow1429 ]
  %t4020 = icmp ne i64 %t4019, 1
  br i1 %t4020, label %then1431, label %else1432
then1431:
  br label %merge1433
else1432:
  %t4021 = or i64 %a1, %a2
  %t4022 = and i64 %t4021, 7
  %t4023 = icmp eq i64 %t4022, 0
  br i1 %t4023, label %fixfast1434, label %fixslow1435
fixfast1434:
  %t4024 = icmp eq i64 %a1, %a2
  %t4025 = select i1 %t4024, i64 257, i64 1
  br label %fixmerge1436
fixslow1435:
  %t4026 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge1436
fixmerge1436:
  %t4027 = phi i64 [ %t4025, %fixfast1434 ], [ %t4026, %fixslow1435 ]
  br label %merge1433
merge1433:
  %t4028 = phi i64 [ 257, %then1431 ], [ %t4027, %fixmerge1436 ]
  %t4029 = icmp ne i64 %t4028, 1
  br i1 %t4029, label %then1437, label %else1438
then1437:
  %t4030 = call i64 @rt_intern(ptr @.str.sym.20)
  %t4031 = or i64 %a2, 8
  %t4032 = and i64 %t4031, 7
  %t4033 = icmp eq i64 %t4032, 0
  br i1 %t4033, label %fixfast1439, label %fixslow1440
fixfast1439:
  %t4034 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4035 = extractvalue {i64, i1} %t4034, 0
  %t4036 = extractvalue {i64, i1} %t4034, 1
  br i1 %t4036, label %fixslow1440, label %fixmerge1441
fixslow1440:
  %t4037 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1441
fixmerge1441:
  %t4038 = phi i64 [ %t4035, %fixfast1439 ], [ %t4037, %fixslow1440 ]
  %t4039 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4039)
  %t4040 = and i64 %t4039, -8
  %t4041 = inttoptr i64 %t4040 to ptr
  %t4042 = load i64, ptr %t4041
  %t4043 = inttoptr i64 %t4042 to ptr
  %t4044 = musttail call fastcc i64 %t4043(i64 %t4039, i64 2, i64 %t4030, i64 %t4038, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4044
else1438:
  %t4045 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4046 = call i64 @rt_char_to_integer(i64 %t4045)
  %t4047 = or i64 %t4046, 928
  %t4048 = and i64 %t4047, 7
  %t4049 = icmp eq i64 %t4048, 0
  br i1 %t4049, label %fixfast1442, label %fixslow1443
fixfast1442:
  %t4050 = icmp eq i64 %t4046, 928
  %t4051 = select i1 %t4050, i64 257, i64 1
  br label %fixmerge1444
fixslow1443:
  %t4052 = call i64 @rt_num_eq(i64 %t4046, i64 928)
  br label %fixmerge1444
fixmerge1444:
  %t4053 = phi i64 [ %t4051, %fixfast1442 ], [ %t4052, %fixslow1443 ]
  %t4054 = icmp ne i64 %t4053, 1
  br i1 %t4054, label %then1445, label %else1446
then1445:
  br label %merge1447
else1446:
  %t4055 = or i64 %t4046, 816
  %t4056 = and i64 %t4055, 7
  %t4057 = icmp eq i64 %t4056, 0
  br i1 %t4057, label %fixfast1448, label %fixslow1449
fixfast1448:
  %t4058 = icmp eq i64 %t4046, 816
  %t4059 = select i1 %t4058, i64 257, i64 1
  br label %fixmerge1450
fixslow1449:
  %t4060 = call i64 @rt_num_eq(i64 %t4046, i64 816)
  br label %fixmerge1450
fixmerge1450:
  %t4061 = phi i64 [ %t4059, %fixfast1448 ], [ %t4060, %fixslow1449 ]
  br label %merge1447
merge1447:
  %t4062 = phi i64 [ 257, %then1445 ], [ %t4061, %fixmerge1450 ]
  %t4063 = icmp ne i64 %t4062, 1
  br i1 %t4063, label %then1451, label %else1452
then1451:
  %t4064 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4064)
  %t4065 = and i64 %t4064, -8
  %t4066 = inttoptr i64 %t4065 to ptr
  %t4067 = load i64, ptr %t4066
  %t4068 = inttoptr i64 %t4067 to ptr
  %t4069 = call fastcc i64%t4068(i64 %t4064, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4070 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t4069)
  %t4071 = call i64 @rt_make_string(ptr @.str.lit.21, i64 1)
  %t4072 = call i64 @rt_string_eq(i64 %t4070, i64 %t4071)
  %t4073 = icmp ne i64 %t4072, 1
  br i1 %t4073, label %then1453, label %else1454
then1453:
  %t4074 = or i64 %a2, 8
  %t4075 = and i64 %t4074, 7
  %t4076 = icmp eq i64 %t4075, 0
  br i1 %t4076, label %fixfast1455, label %fixslow1456
fixfast1455:
  %t4077 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4078 = extractvalue {i64, i1} %t4077, 0
  %t4079 = extractvalue {i64, i1} %t4077, 1
  br i1 %t4079, label %fixslow1456, label %fixmerge1457
fixslow1456:
  %t4080 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1457
fixmerge1457:
  %t4081 = phi i64 [ %t4078, %fixfast1455 ], [ %t4080, %fixslow1456 ]
  %t4082 = call i64 @rt_cons(i64 257, i64 %t4081)
  ret i64 %t4082
else1454:
  %t4083 = call i64 @rt_make_string(ptr @.str.lit.22, i64 4)
  %t4084 = call i64 @rt_string_eq(i64 %t4070, i64 %t4083)
  %t4085 = icmp ne i64 %t4084, 1
  br i1 %t4085, label %then1458, label %else1459
then1458:
  %t4086 = or i64 %a2, 32
  %t4087 = and i64 %t4086, 7
  %t4088 = icmp eq i64 %t4087, 0
  br i1 %t4088, label %fixfast1460, label %fixslow1461
fixfast1460:
  %t4089 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 32)
  %t4090 = extractvalue {i64, i1} %t4089, 0
  %t4091 = extractvalue {i64, i1} %t4089, 1
  br i1 %t4091, label %fixslow1461, label %fixmerge1462
fixslow1461:
  %t4092 = call i64 @rt_add(i64 %a2, i64 32)
  br label %fixmerge1462
fixmerge1462:
  %t4093 = phi i64 [ %t4090, %fixfast1460 ], [ %t4092, %fixslow1461 ]
  %t4094 = call i64 @rt_cons(i64 257, i64 %t4093)
  ret i64 %t4094
else1459:
  %t4095 = call i64 @rt_make_string(ptr @.str.lit.23, i64 1)
  %t4096 = call i64 @rt_string_eq(i64 %t4070, i64 %t4095)
  %t4097 = icmp ne i64 %t4096, 1
  br i1 %t4097, label %then1463, label %else1464
then1463:
  %t4098 = or i64 %a2, 8
  %t4099 = and i64 %t4098, 7
  %t4100 = icmp eq i64 %t4099, 0
  br i1 %t4100, label %fixfast1465, label %fixslow1466
fixfast1465:
  %t4101 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4102 = extractvalue {i64, i1} %t4101, 0
  %t4103 = extractvalue {i64, i1} %t4101, 1
  br i1 %t4103, label %fixslow1466, label %fixmerge1467
fixslow1466:
  %t4104 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1467
fixmerge1467:
  %t4105 = phi i64 [ %t4102, %fixfast1465 ], [ %t4104, %fixslow1466 ]
  %t4106 = call i64 @rt_cons(i64 1, i64 %t4105)
  ret i64 %t4106
else1464:
  %t4107 = call i64 @rt_make_string(ptr @.str.lit.24, i64 5)
  %t4108 = call i64 @rt_string_eq(i64 %t4070, i64 %t4107)
  %t4109 = icmp ne i64 %t4108, 1
  br i1 %t4109, label %then1468, label %else1469
then1468:
  %t4110 = or i64 %a2, 40
  %t4111 = and i64 %t4110, 7
  %t4112 = icmp eq i64 %t4111, 0
  br i1 %t4112, label %fixfast1470, label %fixslow1471
fixfast1470:
  %t4113 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 40)
  %t4114 = extractvalue {i64, i1} %t4113, 0
  %t4115 = extractvalue {i64, i1} %t4113, 1
  br i1 %t4115, label %fixslow1471, label %fixmerge1472
fixslow1471:
  %t4116 = call i64 @rt_add(i64 %a2, i64 40)
  br label %fixmerge1472
fixmerge1472:
  %t4117 = phi i64 [ %t4114, %fixfast1470 ], [ %t4116, %fixslow1471 ]
  %t4118 = call i64 @rt_cons(i64 1, i64 %t4117)
  ret i64 %t4118
else1469:
  %t4119 = call i64 @rt_intern(ptr @.str.sym.25)
  %t4120 = or i64 %a2, 8
  %t4121 = and i64 %t4120, 7
  %t4122 = icmp eq i64 %t4121, 0
  br i1 %t4122, label %fixfast1473, label %fixslow1474
fixfast1473:
  %t4123 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4124 = extractvalue {i64, i1} %t4123, 0
  %t4125 = extractvalue {i64, i1} %t4123, 1
  br i1 %t4125, label %fixslow1474, label %fixmerge1475
fixslow1474:
  %t4126 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1475
fixmerge1475:
  %t4127 = phi i64 [ %t4124, %fixfast1473 ], [ %t4126, %fixslow1474 ]
  %t4128 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4128)
  %t4129 = and i64 %t4128, -8
  %t4130 = inttoptr i64 %t4129 to ptr
  %t4131 = load i64, ptr %t4130
  %t4132 = inttoptr i64 %t4131 to ptr
  %t4133 = musttail call fastcc i64 %t4132(i64 %t4128, i64 2, i64 %t4119, i64 %t4127, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4133
else1452:
  %t4134 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4135 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t4135)
  %t4136 = and i64 %t4135, -8
  %t4137 = inttoptr i64 %t4136 to ptr
  %t4138 = load i64, ptr %t4137
  %t4139 = inttoptr i64 %t4138 to ptr
  %t4140 = call fastcc i64%t4139(i64 %t4135, i64 1, i64 %t4134, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4141 = icmp ne i64 %t4140, 1
  br i1 %t4141, label %then1476, label %else1477
then1476:
  %t4142 = load i64, ptr @"emit.internal:rd-label"
  call void @rt_check_callable(i64 %t4142)
  %t4143 = and i64 %t4142, -8
  %t4144 = inttoptr i64 %t4143 to ptr
  %t4145 = load i64, ptr %t4144
  %t4146 = inttoptr i64 %t4145 to ptr
  %t4147 = musttail call fastcc i64 %t4146(i64 %t4142, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4147
else1477:
  %t4148 = or i64 %t4046, 736
  %t4149 = and i64 %t4148, 7
  %t4150 = icmp eq i64 %t4149, 0
  br i1 %t4150, label %fixfast1478, label %fixslow1479
fixfast1478:
  %t4151 = icmp eq i64 %t4046, 736
  %t4152 = select i1 %t4151, i64 257, i64 1
  br label %fixmerge1480
fixslow1479:
  %t4153 = call i64 @rt_num_eq(i64 %t4046, i64 736)
  br label %fixmerge1480
fixmerge1480:
  %t4154 = phi i64 [ %t4152, %fixfast1478 ], [ %t4153, %fixslow1479 ]
  %t4155 = icmp ne i64 %t4154, 1
  br i1 %t4155, label %then1481, label %else1482
then1481:
  %t4156 = load i64, ptr @"emit.internal:rd-char"
  call void @rt_check_callable(i64 %t4156)
  %t4157 = and i64 %t4156, -8
  %t4158 = inttoptr i64 %t4157 to ptr
  %t4159 = load i64, ptr %t4158
  %t4160 = inttoptr i64 %t4159 to ptr
  %t4161 = musttail call fastcc i64 %t4160(i64 %t4156, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4161
else1482:
  %t4162 = or i64 %t4046, 320
  %t4163 = and i64 %t4162, 7
  %t4164 = icmp eq i64 %t4163, 0
  br i1 %t4164, label %fixfast1483, label %fixslow1484
fixfast1483:
  %t4165 = icmp eq i64 %t4046, 320
  %t4166 = select i1 %t4165, i64 257, i64 1
  br label %fixmerge1485
fixslow1484:
  %t4167 = call i64 @rt_num_eq(i64 %t4046, i64 320)
  br label %fixmerge1485
fixmerge1485:
  %t4168 = phi i64 [ %t4166, %fixfast1483 ], [ %t4167, %fixslow1484 ]
  %t4169 = icmp ne i64 %t4168, 1
  br i1 %t4169, label %then1486, label %else1487
then1486:
  %t4170 = or i64 %a2, 8
  %t4171 = and i64 %t4170, 7
  %t4172 = icmp eq i64 %t4171, 0
  br i1 %t4172, label %fixfast1488, label %fixslow1489
fixfast1488:
  %t4173 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4174 = extractvalue {i64, i1} %t4173, 0
  %t4175 = extractvalue {i64, i1} %t4173, 1
  br i1 %t4175, label %fixslow1489, label %fixmerge1490
fixslow1489:
  %t4176 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1490
fixmerge1490:
  %t4177 = phi i64 [ %t4174, %fixfast1488 ], [ %t4176, %fixslow1489 ]
  %t4178 = or i64 %a2, 8
  %t4179 = and i64 %t4178, 7
  %t4180 = icmp eq i64 %t4179, 0
  br i1 %t4180, label %fixfast1491, label %fixslow1492
fixfast1491:
  %t4181 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4182 = extractvalue {i64, i1} %t4181, 0
  %t4183 = extractvalue {i64, i1} %t4181, 1
  br i1 %t4183, label %fixslow1492, label %fixmerge1493
fixslow1492:
  %t4184 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1493
fixmerge1493:
  %t4185 = phi i64 [ %t4182, %fixfast1491 ], [ %t4184, %fixslow1492 ]
  %t4186 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4186)
  %t4187 = and i64 %t4186, -8
  %t4188 = inttoptr i64 %t4187 to ptr
  %t4189 = load i64, ptr %t4188
  %t4190 = inttoptr i64 %t4189 to ptr
  %t4191 = call fastcc i64%t4190(i64 %t4186, i64 6, i64 %a0, i64 %a1, i64 %t4177, i64 2, i64 %a3, i64 %t4185, i64 0, i64 0, ptr null)
  %t4192 = call i64 @rt_cdr(i64 %t4191)
  %t4193 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4193)
  %t4194 = and i64 %t4193, -8
  %t4195 = inttoptr i64 %t4194 to ptr
  %t4196 = load i64, ptr %t4195
  %t4197 = inttoptr i64 %t4196 to ptr
  %t4198 = call fastcc i64%t4197(i64 %t4193, i64 1, i64 %t4192, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4199 = icmp ne i64 %t4198, 1
  br i1 %t4199, label %then1494, label %else1495
then1494:
  ret i64 %t4191
else1495:
  %t4200 = call i64 @rt_car(i64 %t4191)
  %t4201 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t4201)
  %t4202 = and i64 %t4201, -8
  %t4203 = inttoptr i64 %t4202 to ptr
  %t4204 = load i64, ptr %t4203
  %t4205 = inttoptr i64 %t4204 to ptr
  %t4206 = call fastcc i64%t4205(i64 %t4201, i64 1, i64 %t4200, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4207 = call i64 @rt_cdr(i64 %t4191)
  %t4208 = call i64 @rt_cons(i64 %t4206, i64 %t4207)
  ret i64 %t4208
else1487:
  %t4209 = or i64 %t4046, 472
  %t4210 = and i64 %t4209, 7
  %t4211 = icmp eq i64 %t4210, 0
  br i1 %t4211, label %fixfast1496, label %fixslow1497
fixfast1496:
  %t4212 = icmp eq i64 %t4046, 472
  %t4213 = select i1 %t4212, i64 257, i64 1
  br label %fixmerge1498
fixslow1497:
  %t4214 = call i64 @rt_num_eq(i64 %t4046, i64 472)
  br label %fixmerge1498
fixmerge1498:
  %t4215 = phi i64 [ %t4213, %fixfast1496 ], [ %t4214, %fixslow1497 ]
  %t4216 = icmp ne i64 %t4215, 1
  br i1 %t4216, label %then1499, label %else1500
then1499:
  %t4217 = load i64, ptr @"emit.internal:rd-state-child"
  call void @rt_check_callable(i64 %t4217)
  %t4218 = and i64 %t4217, -8
  %t4219 = inttoptr i64 %t4218 to ptr
  %t4220 = load i64, ptr %t4219
  %t4221 = inttoptr i64 %t4220 to ptr
  %t4222 = call fastcc i64%t4221(i64 %t4217, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4223 = or i64 %a2, 8
  %t4224 = and i64 %t4223, 7
  %t4225 = icmp eq i64 %t4224, 0
  br i1 %t4225, label %fixfast1501, label %fixslow1502
fixfast1501:
  %t4226 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4227 = extractvalue {i64, i1} %t4226, 0
  %t4228 = extractvalue {i64, i1} %t4226, 1
  br i1 %t4228, label %fixslow1502, label %fixmerge1503
fixslow1502:
  %t4229 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1503
fixmerge1503:
  %t4230 = phi i64 [ %t4227, %fixfast1501 ], [ %t4229, %fixslow1502 ]
  %t4231 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4231)
  %t4232 = and i64 %t4231, -8
  %t4233 = inttoptr i64 %t4232 to ptr
  %t4234 = load i64, ptr %t4233
  %t4235 = inttoptr i64 %t4234 to ptr
  %t4236 = call fastcc i64%t4235(i64 %t4231, i64 4, i64 %a0, i64 %a1, i64 %t4230, i64 %t4222, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4237 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4237)
  %t4238 = and i64 %t4237, -8
  %t4239 = inttoptr i64 %t4238 to ptr
  %t4240 = load i64, ptr %t4239
  %t4241 = inttoptr i64 %t4240 to ptr
  %t4242 = call fastcc i64%t4241(i64 %t4237, i64 4, i64 %a0, i64 %a1, i64 %t4236, i64 %t4222, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4243 = load i64, ptr @"emit.internal:rd-finish"
  call void @rt_check_callable(i64 %t4243)
  %t4244 = and i64 %t4243, -8
  %t4245 = inttoptr i64 %t4244 to ptr
  %t4246 = load i64, ptr %t4245
  %t4247 = inttoptr i64 %t4246 to ptr
  %t4248 = call fastcc i64%t4247(i64 %t4243, i64 2, i64 %t4222, i64 %t4242, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4249 = call i64 @rt_cdr(i64 %t4248)
  %t4250 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4250)
  %t4251 = and i64 %t4250, -8
  %t4252 = inttoptr i64 %t4251 to ptr
  %t4253 = load i64, ptr %t4252
  %t4254 = inttoptr i64 %t4253 to ptr
  %t4255 = call fastcc i64%t4254(i64 %t4250, i64 1, i64 %t4249, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4256 = icmp ne i64 %t4255, 1
  br i1 %t4256, label %then1504, label %else1505
then1504:
  ret i64 %t4248
else1505:
  %t4257 = call i64 @rt_cdr(i64 %t4248)
  %t4258 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4258)
  %t4259 = and i64 %t4258, -8
  %t4260 = inttoptr i64 %t4259 to ptr
  %t4261 = load i64, ptr %t4260
  %t4262 = inttoptr i64 %t4261 to ptr
  %t4263 = call fastcc i64%t4262(i64 %t4258, i64 4, i64 %a0, i64 %a1, i64 %t4257, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4264 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4264)
  %t4265 = and i64 %t4264, -8
  %t4266 = inttoptr i64 %t4265 to ptr
  %t4267 = load i64, ptr %t4266
  %t4268 = inttoptr i64 %t4267 to ptr
  %t4269 = musttail call fastcc i64 %t4268(i64 %t4264, i64 4, i64 %a0, i64 %a1, i64 %t4263, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4269
else1500:
  %t4270 = or i64 %t4046, 936
  %t4271 = and i64 %t4270, 7
  %t4272 = icmp eq i64 %t4271, 0
  br i1 %t4272, label %fixfast1506, label %fixslow1507
fixfast1506:
  %t4273 = icmp eq i64 %t4046, 936
  %t4274 = select i1 %t4273, i64 257, i64 1
  br label %fixmerge1508
fixslow1507:
  %t4275 = call i64 @rt_num_eq(i64 %t4046, i64 936)
  br label %fixmerge1508
fixmerge1508:
  %t4276 = phi i64 [ %t4274, %fixfast1506 ], [ %t4275, %fixslow1507 ]
  %t4277 = icmp ne i64 %t4276, 1
  br i1 %t4277, label %then1509, label %else1510
then1509:
  %t4278 = or i64 %a2, 16
  %t4279 = and i64 %t4278, 7
  %t4280 = icmp eq i64 %t4279, 0
  br i1 %t4280, label %fixfast1512, label %fixslow1513
fixfast1512:
  %t4281 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4282 = extractvalue {i64, i1} %t4281, 0
  %t4283 = extractvalue {i64, i1} %t4281, 1
  br i1 %t4283, label %fixslow1513, label %fixmerge1514
fixslow1513:
  %t4284 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1514
fixmerge1514:
  %t4285 = phi i64 [ %t4282, %fixfast1512 ], [ %t4284, %fixslow1513 ]
  %t4286 = or i64 %t4285, %a1
  %t4287 = and i64 %t4286, 7
  %t4288 = icmp eq i64 %t4287, 0
  br i1 %t4288, label %fixfast1515, label %fixslow1516
fixfast1515:
  %t4289 = icmp slt i64 %t4285, %a1
  %t4290 = select i1 %t4289, i64 257, i64 1
  br label %fixmerge1517
fixslow1516:
  %t4291 = call i64 @rt_lt(i64 %t4285, i64 %a1)
  br label %fixmerge1517
fixmerge1517:
  %t4292 = phi i64 [ %t4290, %fixfast1515 ], [ %t4291, %fixslow1516 ]
  %t4293 = icmp ne i64 %t4292, 1
  br i1 %t4293, label %then1518, label %else1519
then1518:
  %t4294 = or i64 %a2, 8
  %t4295 = and i64 %t4294, 7
  %t4296 = icmp eq i64 %t4295, 0
  br i1 %t4296, label %fixfast1521, label %fixslow1522
fixfast1521:
  %t4297 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4298 = extractvalue {i64, i1} %t4297, 0
  %t4299 = extractvalue {i64, i1} %t4297, 1
  br i1 %t4299, label %fixslow1522, label %fixmerge1523
fixslow1522:
  %t4300 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1523
fixmerge1523:
  %t4301 = phi i64 [ %t4298, %fixfast1521 ], [ %t4300, %fixslow1522 ]
  %t4302 = call i64 @rt_string_ref(i64 %a0, i64 %t4301)
  %t4303 = call i64 @rt_char_to_integer(i64 %t4302)
  %t4304 = or i64 %t4303, 448
  %t4305 = and i64 %t4304, 7
  %t4306 = icmp eq i64 %t4305, 0
  br i1 %t4306, label %fixfast1524, label %fixslow1525
fixfast1524:
  %t4307 = icmp eq i64 %t4303, 448
  %t4308 = select i1 %t4307, i64 257, i64 1
  br label %fixmerge1526
fixslow1525:
  %t4309 = call i64 @rt_num_eq(i64 %t4303, i64 448)
  br label %fixmerge1526
fixmerge1526:
  %t4310 = phi i64 [ %t4308, %fixfast1524 ], [ %t4309, %fixslow1525 ]
  %t4311 = icmp ne i64 %t4310, 1
  br i1 %t4311, label %then1527, label %else1528
then1527:
  %t4312 = or i64 %a2, 16
  %t4313 = and i64 %t4312, 7
  %t4314 = icmp eq i64 %t4313, 0
  br i1 %t4314, label %fixfast1530, label %fixslow1531
fixfast1530:
  %t4315 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4316 = extractvalue {i64, i1} %t4315, 0
  %t4317 = extractvalue {i64, i1} %t4315, 1
  br i1 %t4317, label %fixslow1531, label %fixmerge1532
fixslow1531:
  %t4318 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1532
fixmerge1532:
  %t4319 = phi i64 [ %t4316, %fixfast1530 ], [ %t4318, %fixslow1531 ]
  %t4320 = call i64 @rt_string_ref(i64 %a0, i64 %t4319)
  %t4321 = call i64 @rt_char_to_integer(i64 %t4320)
  %t4322 = or i64 %t4321, 320
  %t4323 = and i64 %t4322, 7
  %t4324 = icmp eq i64 %t4323, 0
  br i1 %t4324, label %fixfast1533, label %fixslow1534
fixfast1533:
  %t4325 = icmp eq i64 %t4321, 320
  %t4326 = select i1 %t4325, i64 257, i64 1
  br label %fixmerge1535
fixslow1534:
  %t4327 = call i64 @rt_num_eq(i64 %t4321, i64 320)
  br label %fixmerge1535
fixmerge1535:
  %t4328 = phi i64 [ %t4326, %fixfast1533 ], [ %t4327, %fixslow1534 ]
  br label %merge1529
else1528:
  br label %merge1529
merge1529:
  %t4329 = phi i64 [ %t4328, %fixmerge1535 ], [ 1, %else1528 ]
  br label %merge1520
else1519:
  br label %merge1520
merge1520:
  %t4330 = phi i64 [ %t4329, %merge1529 ], [ 1, %else1519 ]
  br label %merge1511
else1510:
  br label %merge1511
merge1511:
  %t4331 = phi i64 [ %t4330, %merge1520 ], [ 1, %else1510 ]
  %t4332 = icmp ne i64 %t4331, 1
  br i1 %t4332, label %then1536, label %else1537
then1536:
  %t4333 = or i64 %a2, 24
  %t4334 = and i64 %t4333, 7
  %t4335 = icmp eq i64 %t4334, 0
  br i1 %t4335, label %fixfast1538, label %fixslow1539
fixfast1538:
  %t4336 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t4337 = extractvalue {i64, i1} %t4336, 0
  %t4338 = extractvalue {i64, i1} %t4336, 1
  br i1 %t4338, label %fixslow1539, label %fixmerge1540
fixslow1539:
  %t4339 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1540
fixmerge1540:
  %t4340 = phi i64 [ %t4337, %fixfast1538 ], [ %t4339, %fixslow1539 ]
  %t4341 = or i64 %a2, 8
  %t4342 = and i64 %t4341, 7
  %t4343 = icmp eq i64 %t4342, 0
  br i1 %t4343, label %fixfast1541, label %fixslow1542
fixfast1541:
  %t4344 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4345 = extractvalue {i64, i1} %t4344, 0
  %t4346 = extractvalue {i64, i1} %t4344, 1
  br i1 %t4346, label %fixslow1542, label %fixmerge1543
fixslow1542:
  %t4347 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1543
fixmerge1543:
  %t4348 = phi i64 [ %t4345, %fixfast1541 ], [ %t4347, %fixslow1542 ]
  %t4349 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4349)
  %t4350 = and i64 %t4349, -8
  %t4351 = inttoptr i64 %t4350 to ptr
  %t4352 = load i64, ptr %t4351
  %t4353 = inttoptr i64 %t4352 to ptr
  %t4354 = call fastcc i64%t4353(i64 %t4349, i64 6, i64 %a0, i64 %a1, i64 %t4340, i64 2, i64 %a3, i64 %t4348, i64 0, i64 0, ptr null)
  %t4355 = call i64 @rt_cdr(i64 %t4354)
  %t4356 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4356)
  %t4357 = and i64 %t4356, -8
  %t4358 = inttoptr i64 %t4357 to ptr
  %t4359 = load i64, ptr %t4358
  %t4360 = inttoptr i64 %t4359 to ptr
  %t4361 = call fastcc i64%t4360(i64 %t4356, i64 1, i64 %t4355, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4362 = icmp ne i64 %t4361, 1
  br i1 %t4362, label %then1544, label %else1545
then1544:
  ret i64 %t4354
else1545:
  %t4363 = call i64 @rt_car(i64 %t4354)
  %t4364 = load i64, ptr @"emit.internal:list->bytevector"
  call void @rt_check_callable(i64 %t4364)
  %t4365 = and i64 %t4364, -8
  %t4366 = inttoptr i64 %t4365 to ptr
  %t4367 = load i64, ptr %t4366
  %t4368 = inttoptr i64 %t4367 to ptr
  %t4369 = call fastcc i64%t4368(i64 %t4364, i64 1, i64 %t4363, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4370 = call i64 @rt_cdr(i64 %t4354)
  %t4371 = call i64 @rt_cons(i64 %t4369, i64 %t4370)
  ret i64 %t4371
else1537:
  %t4372 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4372)
  %t4373 = and i64 %t4372, -8
  %t4374 = inttoptr i64 %t4373 to ptr
  %t4375 = load i64, ptr %t4374
  %t4376 = inttoptr i64 %t4375 to ptr
  %t4377 = call fastcc i64%t4376(i64 %t4372, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4378 = or i64 %a2, 8
  %t4379 = and i64 %t4378, 7
  %t4380 = icmp eq i64 %t4379, 0
  br i1 %t4380, label %fixfast1546, label %fixslow1547
fixfast1546:
  %t4381 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4382 = extractvalue {i64, i1} %t4381, 0
  %t4383 = extractvalue {i64, i1} %t4381, 1
  br i1 %t4383, label %fixslow1547, label %fixmerge1548
fixslow1547:
  %t4384 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1548
fixmerge1548:
  %t4385 = phi i64 [ %t4382, %fixfast1546 ], [ %t4384, %fixslow1547 ]
  %t4386 = call i64 @rt_substring(i64 %a0, i64 %t4385, i64 %t4377)
  %t4387 = load i64, ptr @"emit.internal:rd-number"
  call void @rt_check_callable(i64 %t4387)
  %t4388 = and i64 %t4387, -8
  %t4389 = inttoptr i64 %t4388 to ptr
  %t4390 = load i64, ptr %t4389
  %t4391 = inttoptr i64 %t4390 to ptr
  %t4392 = call fastcc i64%t4391(i64 %t4387, i64 2, i64 %t4386, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4393 = load i64, ptr @"emit.internal:rd-number-reason?"
  call void @rt_check_callable(i64 %t4393)
  %t4394 = and i64 %t4393, -8
  %t4395 = inttoptr i64 %t4394 to ptr
  %t4396 = load i64, ptr %t4395
  %t4397 = inttoptr i64 %t4396 to ptr
  %t4398 = call fastcc i64%t4397(i64 %t4393, i64 1, i64 %t4392, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4399 = icmp ne i64 %t4398, 1
  br i1 %t4399, label %then1549, label %else1550
then1549:
  %t4400 = or i64 %a2, 8
  %t4401 = and i64 %t4400, 7
  %t4402 = icmp eq i64 %t4401, 0
  br i1 %t4402, label %fixfast1551, label %fixslow1552
fixfast1551:
  %t4403 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4404 = extractvalue {i64, i1} %t4403, 0
  %t4405 = extractvalue {i64, i1} %t4403, 1
  br i1 %t4405, label %fixslow1552, label %fixmerge1553
fixslow1552:
  %t4406 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1553
fixmerge1553:
  %t4407 = phi i64 [ %t4404, %fixfast1551 ], [ %t4406, %fixslow1552 ]
  %t4408 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4408)
  %t4409 = and i64 %t4408, -8
  %t4410 = inttoptr i64 %t4409 to ptr
  %t4411 = load i64, ptr %t4410
  %t4412 = inttoptr i64 %t4411 to ptr
  %t4413 = musttail call fastcc i64 %t4412(i64 %t4408, i64 2, i64 %t4392, i64 %t4407, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4413
else1550:
  %t4414 = call i64 @rt_cons(i64 %t4392, i64 %t4377)
  ret i64 %t4414
}

define fastcc i64 @"emit.internal:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4419 = icmp eq i64 %argc, 1
  br i1 %t4419, label %argok1555, label %arityerr1554
arityerr1554:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1555:
  %t4420 = call i64 @rt_make_string(ptr @.str.lit.26, i64 5)
  %t4421 = call i64 @rt_string_eq(i64 %a0, i64 %t4420)
  %t4422 = icmp ne i64 %t4421, 1
  br i1 %t4422, label %then1556, label %else1557
then1556:
  %t4423 = call i64 @rt_integer_to_char(i64 56)
  ret i64 %t4423
else1557:
  %t4424 = call i64 @rt_make_string(ptr @.str.lit.27, i64 9)
  %t4425 = call i64 @rt_string_eq(i64 %a0, i64 %t4424)
  %t4426 = icmp ne i64 %t4425, 1
  br i1 %t4426, label %then1558, label %else1559
then1558:
  %t4427 = call i64 @rt_integer_to_char(i64 64)
  ret i64 %t4427
else1559:
  %t4428 = call i64 @rt_make_string(ptr @.str.lit.28, i64 6)
  %t4429 = call i64 @rt_string_eq(i64 %a0, i64 %t4428)
  %t4430 = icmp ne i64 %t4429, 1
  br i1 %t4430, label %then1560, label %else1561
then1560:
  %t4431 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t4431
else1561:
  %t4432 = call i64 @rt_make_string(ptr @.str.lit.29, i64 6)
  %t4433 = call i64 @rt_string_eq(i64 %a0, i64 %t4432)
  %t4434 = icmp ne i64 %t4433, 1
  br i1 %t4434, label %then1562, label %else1563
then1562:
  %t4435 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4435
else1563:
  %t4436 = call i64 @rt_make_string(ptr @.str.lit.30, i64 7)
  %t4437 = call i64 @rt_string_eq(i64 %a0, i64 %t4436)
  %t4438 = icmp ne i64 %t4437, 1
  br i1 %t4438, label %then1564, label %else1565
then1564:
  %t4439 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t4439
else1565:
  %t4440 = call i64 @rt_make_string(ptr @.str.lit.31, i64 4)
  %t4441 = call i64 @rt_string_eq(i64 %a0, i64 %t4440)
  %t4442 = icmp ne i64 %t4441, 1
  br i1 %t4442, label %then1566, label %else1567
then1566:
  %t4443 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4443
else1567:
  %t4444 = call i64 @rt_make_string(ptr @.str.lit.32, i64 6)
  %t4445 = call i64 @rt_string_eq(i64 %a0, i64 %t4444)
  %t4446 = icmp ne i64 %t4445, 1
  br i1 %t4446, label %then1568, label %else1569
then1568:
  %t4447 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t4447
else1569:
  %t4448 = call i64 @rt_make_string(ptr @.str.lit.33, i64 5)
  %t4449 = call i64 @rt_string_eq(i64 %a0, i64 %t4448)
  %t4450 = icmp ne i64 %t4449, 1
  br i1 %t4450, label %then1570, label %else1571
then1570:
  %t4451 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t4451
else1571:
  %t4452 = call i64 @rt_make_string(ptr @.str.lit.34, i64 3)
  %t4453 = call i64 @rt_string_eq(i64 %a0, i64 %t4452)
  %t4454 = icmp ne i64 %t4453, 1
  br i1 %t4454, label %then1572, label %else1573
then1572:
  %t4455 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t4455
else1573:
  %t4456 = call i64 @rt_make_string(ptr @.str.lit.35, i64 3)
  %t4457 = call i64 @rt_string_eq(i64 %a0, i64 %t4456)
  %t4458 = icmp ne i64 %t4457, 1
  br i1 %t4458, label %then1574, label %else1575
then1574:
  %t4459 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4459
else1575:
  %t4460 = call i64 @rt_make_string(ptr @.str.lit.36, i64 7)
  %t4461 = call i64 @rt_string_eq(i64 %a0, i64 %t4460)
  %t4462 = icmp ne i64 %t4461, 1
  br i1 %t4462, label %then1576, label %else1577
then1576:
  %t4463 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4463
else1577:
  %t4464 = call i64 @rt_make_string(ptr @.str.lit.37, i64 3)
  %t4465 = call i64 @rt_string_eq(i64 %a0, i64 %t4464)
  %t4466 = icmp ne i64 %t4465, 1
  br i1 %t4466, label %then1578, label %else1579
then1578:
  %t4467 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4467
else1579:
  %t4468 = call i64 @rt_make_string(ptr @.str.lit.38, i64 4)
  %t4469 = call i64 @rt_string_eq(i64 %a0, i64 %t4468)
  %t4470 = icmp ne i64 %t4469, 1
  br i1 %t4470, label %then1580, label %else1581
then1580:
  %t4471 = call i64 @rt_integer_to_char(i64 96)
  ret i64 %t4471
else1581:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_1241"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4476 = icmp eq i64 %argc, 2
  br i1 %t4476, label %argok1583, label %arityerr1582
arityerr1582:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1583:
  %t4477 = and i64 %self, -8
  %t4478 = inttoptr i64 %t4477 to ptr
  %t4479 = getelementptr i64, ptr %t4478, i64 1
  %t4480 = load i64, ptr %t4479
  %t4481 = or i64 %a0, %t4480
  %t4482 = and i64 %t4481, 7
  %t4483 = icmp eq i64 %t4482, 0
  br i1 %t4483, label %fixfast1584, label %fixslow1585
fixfast1584:
  %t4484 = icmp slt i64 %a0, %t4480
  %t4485 = select i1 %t4484, i64 257, i64 1
  br label %fixmerge1586
fixslow1585:
  %t4486 = call i64 @rt_lt(i64 %a0, i64 %t4480)
  br label %fixmerge1586
fixmerge1586:
  %t4487 = phi i64 [ %t4485, %fixfast1584 ], [ %t4486, %fixslow1585 ]
  %t4488 = icmp ne i64 %t4487, 1
  br i1 %t4488, label %then1587, label %else1588
then1587:
  %t4489 = and i64 %self, -8
  %t4490 = inttoptr i64 %t4489 to ptr
  %t4491 = getelementptr i64, ptr %t4490, i64 2
  %t4492 = load i64, ptr %t4491
  %t4493 = call i64 @rt_string_ref(i64 %t4492, i64 %a0)
  %t4494 = load i64, ptr @"emit.internal:rd-hex-digit?"
  call void @rt_check_callable(i64 %t4494)
  %t4495 = and i64 %t4494, -8
  %t4496 = inttoptr i64 %t4495 to ptr
  %t4497 = load i64, ptr %t4496
  %t4498 = inttoptr i64 %t4497 to ptr
  %t4499 = call fastcc i64%t4498(i64 %t4494, i64 1, i64 %t4493, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4500 = icmp ne i64 %t4499, 1
  br i1 %t4500, label %then1589, label %else1590
then1589:
  %t4501 = or i64 %a0, 8
  %t4502 = and i64 %t4501, 7
  %t4503 = icmp eq i64 %t4502, 0
  br i1 %t4503, label %fixfast1591, label %fixslow1592
fixfast1591:
  %t4504 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4505 = extractvalue {i64, i1} %t4504, 0
  %t4506 = extractvalue {i64, i1} %t4504, 1
  br i1 %t4506, label %fixslow1592, label %fixmerge1593
fixslow1592:
  %t4507 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1593
fixmerge1593:
  %t4508 = phi i64 [ %t4505, %fixfast1591 ], [ %t4507, %fixslow1592 ]
  %t4509 = or i64 %a1, 128
  %t4510 = and i64 %t4509, 7
  %t4511 = icmp eq i64 %t4510, 0
  br i1 %t4511, label %fixfast1594, label %fixslow1595
fixfast1594:
  %t4512 = ashr i64 %a1, 3
  %t4513 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t4512, i64 128)
  %t4514 = extractvalue {i64, i1} %t4513, 0
  %t4515 = extractvalue {i64, i1} %t4513, 1
  br i1 %t4515, label %fixslow1595, label %fixmerge1596
fixslow1595:
  %t4516 = call i64 @rt_mul(i64 %a1, i64 128)
  br label %fixmerge1596
fixmerge1596:
  %t4517 = phi i64 [ %t4514, %fixfast1594 ], [ %t4516, %fixslow1595 ]
  %t4518 = load i64, ptr @"emit.internal:rd-hex-digit"
  call void @rt_check_callable(i64 %t4518)
  %t4519 = and i64 %t4518, -8
  %t4520 = inttoptr i64 %t4519 to ptr
  %t4521 = load i64, ptr %t4520
  %t4522 = inttoptr i64 %t4521 to ptr
  %t4523 = call fastcc i64%t4522(i64 %t4518, i64 1, i64 %t4493, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4524 = or i64 %t4517, %t4523
  %t4525 = and i64 %t4524, 7
  %t4526 = icmp eq i64 %t4525, 0
  br i1 %t4526, label %fixfast1597, label %fixslow1598
fixfast1597:
  %t4527 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4517, i64 %t4523)
  %t4528 = extractvalue {i64, i1} %t4527, 0
  %t4529 = extractvalue {i64, i1} %t4527, 1
  br i1 %t4529, label %fixslow1598, label %fixmerge1599
fixslow1598:
  %t4530 = call i64 @rt_add(i64 %t4517, i64 %t4523)
  br label %fixmerge1599
fixmerge1599:
  %t4531 = phi i64 [ %t4528, %fixfast1597 ], [ %t4530, %fixslow1598 ]
  %t4532 = musttail call fastcc i64 @"emit.internal:code_1241"(i64 %self, i64 2, i64 %t4508, i64 %t4531, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4532
else1590:
  ret i64 1
else1588:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-char-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4533 = icmp eq i64 %argc, 1
  br i1 %t4533, label %argok1601, label %arityerr1600
arityerr1600:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1601:
  %t4534 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t4535 = call i64 @rt_char_to_integer(i64 %t4534)
  %t4536 = or i64 %t4535, 960
  %t4537 = and i64 %t4536, 7
  %t4538 = icmp eq i64 %t4537, 0
  br i1 %t4538, label %fixfast1602, label %fixslow1603
fixfast1602:
  %t4539 = icmp eq i64 %t4535, 960
  %t4540 = select i1 %t4539, i64 257, i64 1
  br label %fixmerge1604
fixslow1603:
  %t4541 = call i64 @rt_num_eq(i64 %t4535, i64 960)
  br label %fixmerge1604
fixmerge1604:
  %t4542 = phi i64 [ %t4540, %fixfast1602 ], [ %t4541, %fixslow1603 ]
  %t4543 = icmp ne i64 %t4542, 1
  br i1 %t4543, label %then1605, label %else1606
then1605:
  %t4544 = call i64 @rt_string_length(i64 %a0)
  %t4545 = call ptr @rt_alloc_words(i64 4)
  %t4546 = ptrtoint ptr %t4545 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1241" to i64), ptr %t4545
  %t4547 = or i64 %t4546, 4
  %t4548 = getelementptr i64, ptr %t4545, i64 1
  store i64 %t4544, ptr %t4548
  %t4549 = getelementptr i64, ptr %t4545, i64 2
  store i64 %a0, ptr %t4549
  %t4550 = getelementptr i64, ptr %t4545, i64 3
  store i64 %t4547, ptr %t4550
  %t4551 = musttail call fastcc i64 @"emit.internal:code_1241"(i64 %t4547, i64 2, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4551
else1606:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4556 = icmp eq i64 %argc, 4
  br i1 %t4556, label %argok1608, label %arityerr1607
arityerr1607:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1608:
  %t4557 = or i64 %a2, 8
  %t4558 = and i64 %t4557, 7
  %t4559 = icmp eq i64 %t4558, 0
  br i1 %t4559, label %fixfast1609, label %fixslow1610
fixfast1609:
  %t4560 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4561 = extractvalue {i64, i1} %t4560, 0
  %t4562 = extractvalue {i64, i1} %t4560, 1
  br i1 %t4562, label %fixslow1610, label %fixmerge1611
fixslow1610:
  %t4563 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1611
fixmerge1611:
  %t4564 = phi i64 [ %t4561, %fixfast1609 ], [ %t4563, %fixslow1610 ]
  %t4565 = or i64 %t4564, 8
  %t4566 = and i64 %t4565, 7
  %t4567 = icmp eq i64 %t4566, 0
  br i1 %t4567, label %fixfast1612, label %fixslow1613
fixfast1612:
  %t4568 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4564, i64 8)
  %t4569 = extractvalue {i64, i1} %t4568, 0
  %t4570 = extractvalue {i64, i1} %t4568, 1
  br i1 %t4570, label %fixslow1613, label %fixmerge1614
fixslow1613:
  %t4571 = call i64 @rt_add(i64 %t4564, i64 8)
  br label %fixmerge1614
fixmerge1614:
  %t4572 = phi i64 [ %t4569, %fixfast1612 ], [ %t4571, %fixslow1613 ]
  %t4573 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4573)
  %t4574 = and i64 %t4573, -8
  %t4575 = inttoptr i64 %t4574 to ptr
  %t4576 = load i64, ptr %t4575
  %t4577 = inttoptr i64 %t4576 to ptr
  %t4578 = call fastcc i64%t4577(i64 %t4573, i64 3, i64 %a0, i64 %a1, i64 %t4572, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4579 = call i64 @rt_substring(i64 %a0, i64 %t4564, i64 %t4578)
  %t4580 = call i64 @rt_string_length(i64 %t4579)
  %t4581 = or i64 %t4580, 8
  %t4582 = and i64 %t4581, 7
  %t4583 = icmp eq i64 %t4582, 0
  br i1 %t4583, label %fixfast1615, label %fixslow1616
fixfast1615:
  %t4584 = icmp eq i64 %t4580, 8
  %t4585 = select i1 %t4584, i64 257, i64 1
  br label %fixmerge1617
fixslow1616:
  %t4586 = call i64 @rt_num_eq(i64 %t4580, i64 8)
  br label %fixmerge1617
fixmerge1617:
  %t4587 = phi i64 [ %t4585, %fixfast1615 ], [ %t4586, %fixslow1616 ]
  %t4588 = icmp ne i64 %t4587, 1
  br i1 %t4588, label %then1618, label %else1619
then1618:
  %t4589 = call i64 @rt_string_ref(i64 %a0, i64 %t4564)
  %t4590 = call i64 @rt_cons(i64 %t4589, i64 %t4578)
  ret i64 %t4590
else1619:
  %t4591 = load i64, ptr @"emit.internal:rd-fold?"
  call void @rt_check_callable(i64 %t4591)
  %t4592 = and i64 %t4591, -8
  %t4593 = inttoptr i64 %t4592 to ptr
  %t4594 = load i64, ptr %t4593
  %t4595 = inttoptr i64 %t4594 to ptr
  %t4596 = call fastcc i64%t4595(i64 %t4591, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4597 = icmp ne i64 %t4596, 1
  br i1 %t4597, label %then1620, label %else1621
then1620:
  %t4598 = load i64, ptr @"emit.internal:rd-fold-token"
  call void @rt_check_callable(i64 %t4598)
  %t4599 = and i64 %t4598, -8
  %t4600 = inttoptr i64 %t4599 to ptr
  %t4601 = load i64, ptr %t4600
  %t4602 = inttoptr i64 %t4601 to ptr
  %t4603 = call fastcc i64%t4602(i64 %t4598, i64 1, i64 %t4579, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1622
else1621:
  br label %merge1622
merge1622:
  %t4604 = phi i64 [ %t4603, %then1620 ], [ %t4579, %else1621 ]
  %t4605 = load i64, ptr @"emit.internal:rd-char-hex"
  call void @rt_check_callable(i64 %t4605)
  %t4606 = and i64 %t4605, -8
  %t4607 = inttoptr i64 %t4606 to ptr
  %t4608 = load i64, ptr %t4607
  %t4609 = inttoptr i64 %t4608 to ptr
  %t4610 = call fastcc i64%t4609(i64 %t4605, i64 1, i64 %t4604, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4611 = icmp ne i64 %t4610, 1
  br i1 %t4611, label %then1623, label %else1624
then1623:
  %t4612 = call i64 @rt_integer_to_char(i64 %t4610)
  %t4613 = call i64 @rt_cons(i64 %t4612, i64 %t4578)
  ret i64 %t4613
else1624:
  %t4614 = load i64, ptr @"emit.internal:rd-char-name"
  call void @rt_check_callable(i64 %t4614)
  %t4615 = and i64 %t4614, -8
  %t4616 = inttoptr i64 %t4615 to ptr
  %t4617 = load i64, ptr %t4616
  %t4618 = inttoptr i64 %t4617 to ptr
  %t4619 = call fastcc i64%t4618(i64 %t4614, i64 1, i64 %t4604, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4620 = icmp ne i64 %t4619, 1
  br i1 %t4620, label %then1625, label %else1626
then1625:
  %t4621 = call i64 @rt_cons(i64 %t4619, i64 %t4578)
  ret i64 %t4621
else1626:
  %t4622 = call i64 @rt_intern(ptr @.str.sym.39)
  %t4623 = or i64 %a2, 8
  %t4624 = and i64 %t4623, 7
  %t4625 = icmp eq i64 %t4624, 0
  br i1 %t4625, label %fixfast1627, label %fixslow1628
fixfast1627:
  %t4626 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4627 = extractvalue {i64, i1} %t4626, 0
  %t4628 = extractvalue {i64, i1} %t4626, 1
  br i1 %t4628, label %fixslow1628, label %fixmerge1629
fixslow1628:
  %t4629 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1629
fixmerge1629:
  %t4630 = phi i64 [ %t4627, %fixfast1627 ], [ %t4629, %fixslow1628 ]
  %t4631 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4631)
  %t4632 = and i64 %t4631, -8
  %t4633 = inttoptr i64 %t4632 to ptr
  %t4634 = load i64, ptr %t4633
  %t4635 = inttoptr i64 %t4634 to ptr
  %t4636 = musttail call fastcc i64 %t4635(i64 %t4631, i64 2, i64 %t4622, i64 %t4630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4636
}

define fastcc i64 @"emit.internal:code_1278"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4641 = icmp eq i64 %argc, 2
  br i1 %t4641, label %argok1631, label %arityerr1630
arityerr1630:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1631:
  %t4642 = and i64 %self, -8
  %t4643 = inttoptr i64 %t4642 to ptr
  %t4644 = getelementptr i64, ptr %t4643, i64 1
  %t4645 = load i64, ptr %t4644
  %t4646 = or i64 %a0, %t4645
  %t4647 = and i64 %t4646, 7
  %t4648 = icmp eq i64 %t4647, 0
  br i1 %t4648, label %fixfast1632, label %fixslow1633
fixfast1632:
  %t4649 = icmp slt i64 %a0, %t4645
  %t4650 = select i1 %t4649, i64 257, i64 1
  br label %fixmerge1634
fixslow1633:
  %t4651 = call i64 @rt_lt(i64 %a0, i64 %t4645)
  br label %fixmerge1634
fixmerge1634:
  %t4652 = phi i64 [ %t4650, %fixfast1632 ], [ %t4651, %fixslow1633 ]
  %t4653 = icmp ne i64 %t4652, 1
  br i1 %t4653, label %then1635, label %else1636
then1635:
  %t4654 = and i64 %self, -8
  %t4655 = inttoptr i64 %t4654 to ptr
  %t4656 = getelementptr i64, ptr %t4655, i64 2
  %t4657 = load i64, ptr %t4656
  %t4658 = call i64 @rt_string_ref(i64 %t4657, i64 %a0)
  %t4659 = call i64 @rt_char_to_integer(i64 %t4658)
  %t4660 = or i64 %t4659, 992
  %t4661 = and i64 %t4660, 7
  %t4662 = icmp eq i64 %t4661, 0
  br i1 %t4662, label %fixfast1637, label %fixslow1638
fixfast1637:
  %t4663 = icmp eq i64 %t4659, 992
  %t4664 = select i1 %t4663, i64 257, i64 1
  br label %fixmerge1639
fixslow1638:
  %t4665 = call i64 @rt_num_eq(i64 %t4659, i64 992)
  br label %fixmerge1639
fixmerge1639:
  %t4666 = phi i64 [ %t4664, %fixfast1637 ], [ %t4665, %fixslow1638 ]
  %t4667 = icmp ne i64 %t4666, 1
  br i1 %t4667, label %then1640, label %else1641
then1640:
  %t4668 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t4668)
  %t4669 = and i64 %t4668, -8
  %t4670 = inttoptr i64 %t4669 to ptr
  %t4671 = load i64, ptr %t4670
  %t4672 = inttoptr i64 %t4671 to ptr
  %t4673 = call fastcc i64%t4672(i64 %t4668, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4674 = call i64 @rt_list_to_string(i64 %t4673)
  %t4675 = call i64 @rt_string_to_symbol(i64 %t4674)
  %t4676 = or i64 %a0, 8
  %t4677 = and i64 %t4676, 7
  %t4678 = icmp eq i64 %t4677, 0
  br i1 %t4678, label %fixfast1642, label %fixslow1643
fixfast1642:
  %t4679 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4680 = extractvalue {i64, i1} %t4679, 0
  %t4681 = extractvalue {i64, i1} %t4679, 1
  br i1 %t4681, label %fixslow1643, label %fixmerge1644
fixslow1643:
  %t4682 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1644
fixmerge1644:
  %t4683 = phi i64 [ %t4680, %fixfast1642 ], [ %t4682, %fixslow1643 ]
  %t4684 = call i64 @rt_cons(i64 %t4675, i64 %t4683)
  ret i64 %t4684
else1641:
  %t4685 = or i64 %t4659, 736
  %t4686 = and i64 %t4685, 7
  %t4687 = icmp eq i64 %t4686, 0
  br i1 %t4687, label %fixfast1645, label %fixslow1646
fixfast1645:
  %t4688 = icmp eq i64 %t4659, 736
  %t4689 = select i1 %t4688, i64 257, i64 1
  br label %fixmerge1647
fixslow1646:
  %t4690 = call i64 @rt_num_eq(i64 %t4659, i64 736)
  br label %fixmerge1647
fixmerge1647:
  %t4691 = phi i64 [ %t4689, %fixfast1645 ], [ %t4690, %fixslow1646 ]
  %t4692 = icmp ne i64 %t4691, 1
  br i1 %t4692, label %then1648, label %else1649
then1648:
  %t4693 = or i64 %a0, 8
  %t4694 = and i64 %t4693, 7
  %t4695 = icmp eq i64 %t4694, 0
  br i1 %t4695, label %fixfast1651, label %fixslow1652
fixfast1651:
  %t4696 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4697 = extractvalue {i64, i1} %t4696, 0
  %t4698 = extractvalue {i64, i1} %t4696, 1
  br i1 %t4698, label %fixslow1652, label %fixmerge1653
fixslow1652:
  %t4699 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1653
fixmerge1653:
  %t4700 = phi i64 [ %t4697, %fixfast1651 ], [ %t4699, %fixslow1652 ]
  %t4701 = and i64 %self, -8
  %t4702 = inttoptr i64 %t4701 to ptr
  %t4703 = getelementptr i64, ptr %t4702, i64 1
  %t4704 = load i64, ptr %t4703
  %t4705 = or i64 %t4700, %t4704
  %t4706 = and i64 %t4705, 7
  %t4707 = icmp eq i64 %t4706, 0
  br i1 %t4707, label %fixfast1654, label %fixslow1655
fixfast1654:
  %t4708 = icmp slt i64 %t4700, %t4704
  %t4709 = select i1 %t4708, i64 257, i64 1
  br label %fixmerge1656
fixslow1655:
  %t4710 = call i64 @rt_lt(i64 %t4700, i64 %t4704)
  br label %fixmerge1656
fixmerge1656:
  %t4711 = phi i64 [ %t4709, %fixfast1654 ], [ %t4710, %fixslow1655 ]
  br label %merge1650
else1649:
  br label %merge1650
merge1650:
  %t4712 = phi i64 [ %t4711, %fixmerge1656 ], [ 1, %else1649 ]
  %t4713 = icmp ne i64 %t4712, 1
  br i1 %t4713, label %then1657, label %else1658
then1657:
  %t4714 = and i64 %self, -8
  %t4715 = inttoptr i64 %t4714 to ptr
  %t4716 = getelementptr i64, ptr %t4715, i64 2
  %t4717 = load i64, ptr %t4716
  %t4718 = or i64 %a0, 8
  %t4719 = and i64 %t4718, 7
  %t4720 = icmp eq i64 %t4719, 0
  br i1 %t4720, label %fixfast1659, label %fixslow1660
fixfast1659:
  %t4721 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4722 = extractvalue {i64, i1} %t4721, 0
  %t4723 = extractvalue {i64, i1} %t4721, 1
  br i1 %t4723, label %fixslow1660, label %fixmerge1661
fixslow1660:
  %t4724 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1661
fixmerge1661:
  %t4725 = phi i64 [ %t4722, %fixfast1659 ], [ %t4724, %fixslow1660 ]
  %t4726 = call i64 @rt_string_ref(i64 %t4717, i64 %t4725)
  %t4727 = call i64 @rt_char_to_integer(i64 %t4726)
  %t4728 = or i64 %t4727, 960
  %t4729 = and i64 %t4728, 7
  %t4730 = icmp eq i64 %t4729, 0
  br i1 %t4730, label %fixfast1662, label %fixslow1663
fixfast1662:
  %t4731 = icmp eq i64 %t4727, 960
  %t4732 = select i1 %t4731, i64 257, i64 1
  br label %fixmerge1664
fixslow1663:
  %t4733 = call i64 @rt_num_eq(i64 %t4727, i64 960)
  br label %fixmerge1664
fixmerge1664:
  %t4734 = phi i64 [ %t4732, %fixfast1662 ], [ %t4733, %fixslow1663 ]
  %t4735 = icmp ne i64 %t4734, 1
  br i1 %t4735, label %then1665, label %else1666
then1665:
  %t4736 = and i64 %self, -8
  %t4737 = inttoptr i64 %t4736 to ptr
  %t4738 = getelementptr i64, ptr %t4737, i64 2
  %t4739 = load i64, ptr %t4738
  %t4740 = and i64 %self, -8
  %t4741 = inttoptr i64 %t4740 to ptr
  %t4742 = getelementptr i64, ptr %t4741, i64 1
  %t4743 = load i64, ptr %t4742
  %t4744 = or i64 %a0, 16
  %t4745 = and i64 %t4744, 7
  %t4746 = icmp eq i64 %t4745, 0
  br i1 %t4746, label %fixfast1667, label %fixslow1668
fixfast1667:
  %t4747 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4748 = extractvalue {i64, i1} %t4747, 0
  %t4749 = extractvalue {i64, i1} %t4747, 1
  br i1 %t4749, label %fixslow1668, label %fixmerge1669
fixslow1668:
  %t4750 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1669
fixmerge1669:
  %t4751 = phi i64 [ %t4748, %fixfast1667 ], [ %t4750, %fixslow1668 ]
  %t4752 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t4752)
  %t4753 = and i64 %t4752, -8
  %t4754 = inttoptr i64 %t4753 to ptr
  %t4755 = load i64, ptr %t4754
  %t4756 = inttoptr i64 %t4755 to ptr
  %t4757 = call fastcc i64%t4756(i64 %t4752, i64 4, i64 %t4739, i64 %t4743, i64 %t4751, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4758 = call i64 @rt_cdr(i64 %t4757)
  %t4759 = call i64 @rt_car(i64 %t4757)
  %t4760 = call i64 @rt_integer_to_char(i64 %t4759)
  %t4761 = call i64 @rt_cons(i64 %t4760, i64 %a1)
  %t4762 = musttail call fastcc i64 @"emit.internal:code_1278"(i64 %self, i64 2, i64 %t4758, i64 %t4761, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4762
else1666:
  %t4763 = or i64 %a0, 16
  %t4764 = and i64 %t4763, 7
  %t4765 = icmp eq i64 %t4764, 0
  br i1 %t4765, label %fixfast1670, label %fixslow1671
fixfast1670:
  %t4766 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4767 = extractvalue {i64, i1} %t4766, 0
  %t4768 = extractvalue {i64, i1} %t4766, 1
  br i1 %t4768, label %fixslow1671, label %fixmerge1672
fixslow1671:
  %t4769 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1672
fixmerge1672:
  %t4770 = phi i64 [ %t4767, %fixfast1670 ], [ %t4769, %fixslow1671 ]
  %t4771 = load i64, ptr @"emit.internal:rd-str-esc"
  call void @rt_check_callable(i64 %t4771)
  %t4772 = and i64 %t4771, -8
  %t4773 = inttoptr i64 %t4772 to ptr
  %t4774 = load i64, ptr %t4773
  %t4775 = inttoptr i64 %t4774 to ptr
  %t4776 = call fastcc i64%t4775(i64 %t4771, i64 1, i64 %t4726, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4777 = call i64 @rt_cons(i64 %t4776, i64 %a1)
  %t4778 = musttail call fastcc i64 @"emit.internal:code_1278"(i64 %self, i64 2, i64 %t4770, i64 %t4777, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4778
else1658:
  %t4779 = or i64 %a0, 8
  %t4780 = and i64 %t4779, 7
  %t4781 = icmp eq i64 %t4780, 0
  br i1 %t4781, label %fixfast1673, label %fixslow1674
fixfast1673:
  %t4782 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4783 = extractvalue {i64, i1} %t4782, 0
  %t4784 = extractvalue {i64, i1} %t4782, 1
  br i1 %t4784, label %fixslow1674, label %fixmerge1675
fixslow1674:
  %t4785 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1675
fixmerge1675:
  %t4786 = phi i64 [ %t4783, %fixfast1673 ], [ %t4785, %fixslow1674 ]
  %t4787 = call i64 @rt_cons(i64 %t4658, i64 %a1)
  %t4788 = musttail call fastcc i64 @"emit.internal:code_1278"(i64 %self, i64 2, i64 %t4786, i64 %t4787, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4788
else1636:
  %t4789 = call i64 @rt_intern(ptr @.str.sym.40)
  %t4790 = and i64 %self, -8
  %t4791 = inttoptr i64 %t4790 to ptr
  %t4792 = getelementptr i64, ptr %t4791, i64 4
  %t4793 = load i64, ptr %t4792
  %t4794 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4794)
  %t4795 = and i64 %t4794, -8
  %t4796 = inttoptr i64 %t4795 to ptr
  %t4797 = load i64, ptr %t4796
  %t4798 = inttoptr i64 %t4797 to ptr
  %t4799 = musttail call fastcc i64 %t4798(i64 %t4794, i64 2, i64 %t4789, i64 %t4793, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4799
}

define fastcc i64 @"emit.internal:code:rd-bar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4800 = icmp eq i64 %argc, 4
  br i1 %t4800, label %argok1677, label %arityerr1676
arityerr1676:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1677:
  %t4801 = call ptr @rt_alloc_words(i64 5)
  %t4802 = ptrtoint ptr %t4801 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1278" to i64), ptr %t4801
  %t4803 = or i64 %t4802, 4
  %t4804 = getelementptr i64, ptr %t4801, i64 1
  store i64 %a1, ptr %t4804
  %t4805 = getelementptr i64, ptr %t4801, i64 2
  store i64 %a0, ptr %t4805
  %t4806 = getelementptr i64, ptr %t4801, i64 3
  store i64 %t4803, ptr %t4806
  %t4807 = getelementptr i64, ptr %t4801, i64 4
  store i64 %a3, ptr %t4807
  %t4808 = musttail call fastcc i64 @"emit.internal:code_1278"(i64 %t4803, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4808
}

define fastcc i64 @"emit.internal:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4813 = icmp eq i64 %argc, 4
  br i1 %t4813, label %argok1679, label %arityerr1678
arityerr1678:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1679:
  %t4814 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4814)
  %t4815 = and i64 %t4814, -8
  %t4816 = inttoptr i64 %t4815 to ptr
  %t4817 = load i64, ptr %t4816
  %t4818 = inttoptr i64 %t4817 to ptr
  %t4819 = call fastcc i64%t4818(i64 %t4814, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4820 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4820)
  %t4821 = and i64 %t4820, -8
  %t4822 = inttoptr i64 %t4821 to ptr
  %t4823 = load i64, ptr %t4822
  %t4824 = inttoptr i64 %t4823 to ptr
  %t4825 = call fastcc i64%t4824(i64 %t4820, i64 4, i64 %a0, i64 %a1, i64 %t4819, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4826 = call i64 @rt_cdr(i64 %t4825)
  %t4827 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4827)
  %t4828 = and i64 %t4827, -8
  %t4829 = inttoptr i64 %t4828 to ptr
  %t4830 = load i64, ptr %t4829
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = call fastcc i64%t4831(i64 %t4827, i64 1, i64 %t4826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4833 = icmp ne i64 %t4832, 1
  br i1 %t4833, label %then1680, label %else1681
then1680:
  ret i64 %t4825
else1681:
  %t4834 = call i64 @rt_intern(ptr @.str.sym.41)
  %t4835 = call i64 @rt_car(i64 %t4825)
  %t4836 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4836)
  %t4837 = and i64 %t4836, -8
  %t4838 = inttoptr i64 %t4837 to ptr
  %t4839 = load i64, ptr %t4838
  %t4840 = inttoptr i64 %t4839 to ptr
  %t4841 = call fastcc i64%t4840(i64 %t4836, i64 2, i64 %t4834, i64 %t4835, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4842 = call i64 @rt_cdr(i64 %t4825)
  %t4843 = call i64 @rt_cons(i64 %t4841, i64 %t4842)
  ret i64 %t4843
}

define fastcc i64 @"emit.internal:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4848 = icmp eq i64 %argc, 4
  br i1 %t4848, label %argok1683, label %arityerr1682
arityerr1682:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1683:
  %t4849 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4849)
  %t4850 = and i64 %t4849, -8
  %t4851 = inttoptr i64 %t4850 to ptr
  %t4852 = load i64, ptr %t4851
  %t4853 = inttoptr i64 %t4852 to ptr
  %t4854 = call fastcc i64%t4853(i64 %t4849, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4855 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4855)
  %t4856 = and i64 %t4855, -8
  %t4857 = inttoptr i64 %t4856 to ptr
  %t4858 = load i64, ptr %t4857
  %t4859 = inttoptr i64 %t4858 to ptr
  %t4860 = call fastcc i64%t4859(i64 %t4855, i64 4, i64 %a0, i64 %a1, i64 %t4854, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4861 = call i64 @rt_cdr(i64 %t4860)
  %t4862 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4862)
  %t4863 = and i64 %t4862, -8
  %t4864 = inttoptr i64 %t4863 to ptr
  %t4865 = load i64, ptr %t4864
  %t4866 = inttoptr i64 %t4865 to ptr
  %t4867 = call fastcc i64%t4866(i64 %t4862, i64 1, i64 %t4861, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4868 = icmp ne i64 %t4867, 1
  br i1 %t4868, label %then1684, label %else1685
then1684:
  ret i64 %t4860
else1685:
  %t4869 = call i64 @rt_intern(ptr @.str.sym.42)
  %t4870 = call i64 @rt_car(i64 %t4860)
  %t4871 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4871)
  %t4872 = and i64 %t4871, -8
  %t4873 = inttoptr i64 %t4872 to ptr
  %t4874 = load i64, ptr %t4873
  %t4875 = inttoptr i64 %t4874 to ptr
  %t4876 = call fastcc i64%t4875(i64 %t4871, i64 2, i64 %t4869, i64 %t4870, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4877 = call i64 @rt_cdr(i64 %t4860)
  %t4878 = call i64 @rt_cons(i64 %t4876, i64 %t4877)
  ret i64 %t4878
}

define fastcc i64 @"emit.internal:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4883 = icmp eq i64 %argc, 4
  br i1 %t4883, label %argok1687, label %arityerr1686
arityerr1686:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1687:
  %t4884 = or i64 %a2, %a1
  %t4885 = and i64 %t4884, 7
  %t4886 = icmp eq i64 %t4885, 0
  br i1 %t4886, label %fixfast1688, label %fixslow1689
fixfast1688:
  %t4887 = icmp slt i64 %a2, %a1
  %t4888 = select i1 %t4887, i64 257, i64 1
  br label %fixmerge1690
fixslow1689:
  %t4889 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1690
fixmerge1690:
  %t4890 = phi i64 [ %t4888, %fixfast1688 ], [ %t4889, %fixslow1689 ]
  %t4891 = icmp ne i64 %t4890, 1
  br i1 %t4891, label %then1691, label %else1692
then1691:
  %t4892 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4893 = call i64 @rt_char_to_integer(i64 %t4892)
  %t4894 = or i64 %t4893, 512
  %t4895 = and i64 %t4894, 7
  %t4896 = icmp eq i64 %t4895, 0
  br i1 %t4896, label %fixfast1694, label %fixslow1695
fixfast1694:
  %t4897 = icmp eq i64 %t4893, 512
  %t4898 = select i1 %t4897, i64 257, i64 1
  br label %fixmerge1696
fixslow1695:
  %t4899 = call i64 @rt_num_eq(i64 %t4893, i64 512)
  br label %fixmerge1696
fixmerge1696:
  %t4900 = phi i64 [ %t4898, %fixfast1694 ], [ %t4899, %fixslow1695 ]
  br label %merge1693
else1692:
  br label %merge1693
merge1693:
  %t4901 = phi i64 [ %t4900, %fixmerge1696 ], [ 1, %else1692 ]
  %t4902 = icmp ne i64 %t4901, 1
  br i1 %t4902, label %then1697, label %else1698
then1697:
  %t4903 = or i64 %a2, 8
  %t4904 = and i64 %t4903, 7
  %t4905 = icmp eq i64 %t4904, 0
  br i1 %t4905, label %fixfast1699, label %fixslow1700
fixfast1699:
  %t4906 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4907 = extractvalue {i64, i1} %t4906, 0
  %t4908 = extractvalue {i64, i1} %t4906, 1
  br i1 %t4908, label %fixslow1700, label %fixmerge1701
fixslow1700:
  %t4909 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1701
fixmerge1701:
  %t4910 = phi i64 [ %t4907, %fixfast1699 ], [ %t4909, %fixslow1700 ]
  %t4911 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4911)
  %t4912 = and i64 %t4911, -8
  %t4913 = inttoptr i64 %t4912 to ptr
  %t4914 = load i64, ptr %t4913
  %t4915 = inttoptr i64 %t4914 to ptr
  %t4916 = call fastcc i64%t4915(i64 %t4911, i64 4, i64 %a0, i64 %a1, i64 %t4910, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4917 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4917)
  %t4918 = and i64 %t4917, -8
  %t4919 = inttoptr i64 %t4918 to ptr
  %t4920 = load i64, ptr %t4919
  %t4921 = inttoptr i64 %t4920 to ptr
  %t4922 = call fastcc i64%t4921(i64 %t4917, i64 4, i64 %a0, i64 %a1, i64 %t4916, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4923 = call i64 @rt_cdr(i64 %t4922)
  %t4924 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4924)
  %t4925 = and i64 %t4924, -8
  %t4926 = inttoptr i64 %t4925 to ptr
  %t4927 = load i64, ptr %t4926
  %t4928 = inttoptr i64 %t4927 to ptr
  %t4929 = call fastcc i64%t4928(i64 %t4924, i64 1, i64 %t4923, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4930 = icmp ne i64 %t4929, 1
  br i1 %t4930, label %then1702, label %else1703
then1702:
  ret i64 %t4922
else1703:
  %t4931 = call i64 @rt_intern(ptr @.str.sym.43)
  %t4932 = call i64 @rt_car(i64 %t4922)
  %t4933 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4933)
  %t4934 = and i64 %t4933, -8
  %t4935 = inttoptr i64 %t4934 to ptr
  %t4936 = load i64, ptr %t4935
  %t4937 = inttoptr i64 %t4936 to ptr
  %t4938 = call fastcc i64%t4937(i64 %t4933, i64 2, i64 %t4931, i64 %t4932, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4939 = call i64 @rt_cdr(i64 %t4922)
  %t4940 = call i64 @rt_cons(i64 %t4938, i64 %t4939)
  ret i64 %t4940
else1698:
  %t4941 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4941)
  %t4942 = and i64 %t4941, -8
  %t4943 = inttoptr i64 %t4942 to ptr
  %t4944 = load i64, ptr %t4943
  %t4945 = inttoptr i64 %t4944 to ptr
  %t4946 = call fastcc i64%t4945(i64 %t4941, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4947 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4947)
  %t4948 = and i64 %t4947, -8
  %t4949 = inttoptr i64 %t4948 to ptr
  %t4950 = load i64, ptr %t4949
  %t4951 = inttoptr i64 %t4950 to ptr
  %t4952 = call fastcc i64%t4951(i64 %t4947, i64 4, i64 %a0, i64 %a1, i64 %t4946, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4953 = call i64 @rt_cdr(i64 %t4952)
  %t4954 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4954)
  %t4955 = and i64 %t4954, -8
  %t4956 = inttoptr i64 %t4955 to ptr
  %t4957 = load i64, ptr %t4956
  %t4958 = inttoptr i64 %t4957 to ptr
  %t4959 = call fastcc i64%t4958(i64 %t4954, i64 1, i64 %t4953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4960 = icmp ne i64 %t4959, 1
  br i1 %t4960, label %then1704, label %else1705
then1704:
  ret i64 %t4952
else1705:
  %t4961 = call i64 @rt_intern(ptr @.str.sym.44)
  %t4962 = call i64 @rt_car(i64 %t4952)
  %t4963 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4963)
  %t4964 = and i64 %t4963, -8
  %t4965 = inttoptr i64 %t4964 to ptr
  %t4966 = load i64, ptr %t4965
  %t4967 = inttoptr i64 %t4966 to ptr
  %t4968 = call fastcc i64%t4967(i64 %t4963, i64 2, i64 %t4961, i64 %t4962, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4969 = call i64 @rt_cdr(i64 %t4952)
  %t4970 = call i64 @rt_cons(i64 %t4968, i64 %t4969)
  ret i64 %t4970
}

define fastcc i64 @"emit.internal:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4975 = icmp eq i64 %argc, 3
  br i1 %t4975, label %argok1707, label %arityerr1706
arityerr1706:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1707:
  %t4976 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4977 = call i64 @rt_char_to_integer(i64 %t4976)
  %t4978 = or i64 %t4977, 368
  %t4979 = and i64 %t4978, 7
  %t4980 = icmp eq i64 %t4979, 0
  br i1 %t4980, label %fixfast1708, label %fixslow1709
fixfast1708:
  %t4981 = icmp eq i64 %t4977, 368
  %t4982 = select i1 %t4981, i64 257, i64 1
  br label %fixmerge1710
fixslow1709:
  %t4983 = call i64 @rt_num_eq(i64 %t4977, i64 368)
  br label %fixmerge1710
fixmerge1710:
  %t4984 = phi i64 [ %t4982, %fixfast1708 ], [ %t4983, %fixslow1709 ]
  %t4985 = icmp ne i64 %t4984, 1
  br i1 %t4985, label %then1711, label %else1712
then1711:
  %t4986 = or i64 %a2, 8
  %t4987 = and i64 %t4986, 7
  %t4988 = icmp eq i64 %t4987, 0
  br i1 %t4988, label %fixfast1713, label %fixslow1714
fixfast1713:
  %t4989 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4990 = extractvalue {i64, i1} %t4989, 0
  %t4991 = extractvalue {i64, i1} %t4989, 1
  br i1 %t4991, label %fixslow1714, label %fixmerge1715
fixslow1714:
  %t4992 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1715
fixmerge1715:
  %t4993 = phi i64 [ %t4990, %fixfast1713 ], [ %t4992, %fixslow1714 ]
  %t4994 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4994)
  %t4995 = and i64 %t4994, -8
  %t4996 = inttoptr i64 %t4995 to ptr
  %t4997 = load i64, ptr %t4996
  %t4998 = inttoptr i64 %t4997 to ptr
  %t4999 = call fastcc i64%t4998(i64 %t4994, i64 3, i64 %a0, i64 %a1, i64 %t4993, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5000 = or i64 %a2, 8
  %t5001 = and i64 %t5000, 7
  %t5002 = icmp eq i64 %t5001, 0
  br i1 %t5002, label %fixfast1716, label %fixslow1717
fixfast1716:
  %t5003 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5004 = extractvalue {i64, i1} %t5003, 0
  %t5005 = extractvalue {i64, i1} %t5003, 1
  br i1 %t5005, label %fixslow1717, label %fixmerge1718
fixslow1717:
  %t5006 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1718
fixmerge1718:
  %t5007 = phi i64 [ %t5004, %fixfast1716 ], [ %t5006, %fixslow1717 ]
  %t5008 = or i64 %t4999, %t5007
  %t5009 = and i64 %t5008, 7
  %t5010 = icmp eq i64 %t5009, 0
  br i1 %t5010, label %fixfast1719, label %fixslow1720
fixfast1719:
  %t5011 = icmp eq i64 %t4999, %t5007
  %t5012 = select i1 %t5011, i64 257, i64 1
  br label %fixmerge1721
fixslow1720:
  %t5013 = call i64 @rt_num_eq(i64 %t4999, i64 %t5007)
  br label %fixmerge1721
fixmerge1721:
  %t5014 = phi i64 [ %t5012, %fixfast1719 ], [ %t5013, %fixslow1720 ]
  ret i64 %t5014
else1712:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5019 = icmp eq i64 %argc, 2
  br i1 %t5019, label %argok1723, label %arityerr1722
arityerr1722:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1723:
  %t5020 = call i64 @rt_null_p(i64 %a0)
  %t5021 = icmp ne i64 %t5020, 1
  br i1 %t5021, label %then1724, label %else1725
then1724:
  ret i64 %a1
else1725:
  %t5022 = call i64 @rt_cdr(i64 %a0)
  %t5023 = call i64 @rt_car(i64 %a0)
  %t5024 = call i64 @rt_cons(i64 %t5023, i64 %a1)
  %t5025 = load i64, ptr @"emit.internal:rd-append-reverse"
  call void @rt_check_callable(i64 %t5025)
  %t5026 = and i64 %t5025, -8
  %t5027 = inttoptr i64 %t5026 to ptr
  %t5028 = load i64, ptr %t5027
  %t5029 = inttoptr i64 %t5028 to ptr
  %t5030 = musttail call fastcc i64 %t5029(i64 %t5025, i64 2, i64 %t5022, i64 %t5024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5030
}

define fastcc i64 @"emit.internal:code:rd-datum-comment?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5035 = icmp eq i64 %argc, 3
  br i1 %t5035, label %argok1727, label %arityerr1726
arityerr1726:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1727:
  %t5036 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5037 = call i64 @rt_char_to_integer(i64 %t5036)
  %t5038 = or i64 %t5037, 280
  %t5039 = and i64 %t5038, 7
  %t5040 = icmp eq i64 %t5039, 0
  br i1 %t5040, label %fixfast1728, label %fixslow1729
fixfast1728:
  %t5041 = icmp eq i64 %t5037, 280
  %t5042 = select i1 %t5041, i64 257, i64 1
  br label %fixmerge1730
fixslow1729:
  %t5043 = call i64 @rt_num_eq(i64 %t5037, i64 280)
  br label %fixmerge1730
fixmerge1730:
  %t5044 = phi i64 [ %t5042, %fixfast1728 ], [ %t5043, %fixslow1729 ]
  %t5045 = icmp ne i64 %t5044, 1
  br i1 %t5045, label %then1731, label %else1732
then1731:
  %t5046 = or i64 %a2, 8
  %t5047 = and i64 %t5046, 7
  %t5048 = icmp eq i64 %t5047, 0
  br i1 %t5048, label %fixfast1733, label %fixslow1734
fixfast1733:
  %t5049 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5050 = extractvalue {i64, i1} %t5049, 0
  %t5051 = extractvalue {i64, i1} %t5049, 1
  br i1 %t5051, label %fixslow1734, label %fixmerge1735
fixslow1734:
  %t5052 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1735
fixmerge1735:
  %t5053 = phi i64 [ %t5050, %fixfast1733 ], [ %t5052, %fixslow1734 ]
  %t5054 = or i64 %t5053, %a1
  %t5055 = and i64 %t5054, 7
  %t5056 = icmp eq i64 %t5055, 0
  br i1 %t5056, label %fixfast1736, label %fixslow1737
fixfast1736:
  %t5057 = icmp slt i64 %t5053, %a1
  %t5058 = select i1 %t5057, i64 257, i64 1
  br label %fixmerge1738
fixslow1737:
  %t5059 = call i64 @rt_lt(i64 %t5053, i64 %a1)
  br label %fixmerge1738
fixmerge1738:
  %t5060 = phi i64 [ %t5058, %fixfast1736 ], [ %t5059, %fixslow1737 ]
  %t5061 = icmp ne i64 %t5060, 1
  br i1 %t5061, label %then1739, label %else1740
then1739:
  %t5062 = or i64 %a2, 8
  %t5063 = and i64 %t5062, 7
  %t5064 = icmp eq i64 %t5063, 0
  br i1 %t5064, label %fixfast1741, label %fixslow1742
fixfast1741:
  %t5065 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5066 = extractvalue {i64, i1} %t5065, 0
  %t5067 = extractvalue {i64, i1} %t5065, 1
  br i1 %t5067, label %fixslow1742, label %fixmerge1743
fixslow1742:
  %t5068 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1743
fixmerge1743:
  %t5069 = phi i64 [ %t5066, %fixfast1741 ], [ %t5068, %fixslow1742 ]
  %t5070 = call i64 @rt_string_ref(i64 %a0, i64 %t5069)
  %t5071 = call i64 @rt_char_to_integer(i64 %t5070)
  %t5072 = or i64 %t5071, 472
  %t5073 = and i64 %t5072, 7
  %t5074 = icmp eq i64 %t5073, 0
  br i1 %t5074, label %fixfast1744, label %fixslow1745
fixfast1744:
  %t5075 = icmp eq i64 %t5071, 472
  %t5076 = select i1 %t5075, i64 257, i64 1
  br label %fixmerge1746
fixslow1745:
  %t5077 = call i64 @rt_num_eq(i64 %t5071, i64 472)
  br label %fixmerge1746
fixmerge1746:
  %t5078 = phi i64 [ %t5076, %fixfast1744 ], [ %t5077, %fixslow1745 ]
  ret i64 %t5078
else1740:
  ret i64 1
else1732:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5083 = icmp eq i64 %argc, 6
  br i1 %t5083, label %argok1748, label %arityerr1747
arityerr1747:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1748:
  %t5084 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5084)
  %t5085 = and i64 %t5084, -8
  %t5086 = inttoptr i64 %t5085 to ptr
  %t5087 = load i64, ptr %t5086
  %t5088 = inttoptr i64 %t5087 to ptr
  %t5089 = call fastcc i64%t5088(i64 %t5084, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5090 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5090)
  %t5091 = and i64 %t5090, -8
  %t5092 = inttoptr i64 %t5091 to ptr
  %t5093 = load i64, ptr %t5092
  %t5094 = inttoptr i64 %t5093 to ptr
  %t5095 = call fastcc i64%t5094(i64 %t5090, i64 1, i64 %t5089, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5096 = icmp ne i64 %t5095, 1
  br i1 %t5096, label %then1749, label %else1750
then1749:
  %t5097 = call i64 @rt_intern(ptr @.str.sym.45)
  %t5098 = call i64 @rt_cons(i64 %t5097, i64 %t5089)
  ret i64 %t5098
else1750:
  %t5099 = or i64 %t5089, %a1
  %t5100 = and i64 %t5099, 7
  %t5101 = icmp eq i64 %t5100, 0
  br i1 %t5101, label %fixfast1751, label %fixslow1752
fixfast1751:
  %t5102 = icmp slt i64 %t5089, %a1
  %t5103 = select i1 %t5102, i64 257, i64 1
  br label %fixmerge1753
fixslow1752:
  %t5104 = call i64 @rt_lt(i64 %t5089, i64 %a1)
  br label %fixmerge1753
fixmerge1753:
  %t5105 = phi i64 [ %t5103, %fixfast1751 ], [ %t5104, %fixslow1752 ]
  %t5106 = icmp ne i64 %t5105, 1
  br i1 %t5106, label %then1754, label %else1755
then1754:
  %t5107 = call i64 @rt_string_ref(i64 %a0, i64 %t5089)
  %t5108 = call i64 @rt_char_to_integer(i64 %t5107)
  %t5109 = or i64 %t5108, 328
  %t5110 = and i64 %t5109, 7
  %t5111 = icmp eq i64 %t5110, 0
  br i1 %t5111, label %fixfast1756, label %fixslow1757
fixfast1756:
  %t5112 = icmp eq i64 %t5108, 328
  %t5113 = select i1 %t5112, i64 257, i64 1
  br label %fixmerge1758
fixslow1757:
  %t5114 = call i64 @rt_num_eq(i64 %t5108, i64 328)
  br label %fixmerge1758
fixmerge1758:
  %t5115 = phi i64 [ %t5113, %fixfast1756 ], [ %t5114, %fixslow1757 ]
  %t5116 = icmp ne i64 %t5115, 1
  br i1 %t5116, label %then1759, label %else1760
then1759:
  br label %merge1761
else1760:
  %t5117 = or i64 %t5108, 744
  %t5118 = and i64 %t5117, 7
  %t5119 = icmp eq i64 %t5118, 0
  br i1 %t5119, label %fixfast1762, label %fixslow1763
fixfast1762:
  %t5120 = icmp eq i64 %t5108, 744
  %t5121 = select i1 %t5120, i64 257, i64 1
  br label %fixmerge1764
fixslow1763:
  %t5122 = call i64 @rt_num_eq(i64 %t5108, i64 744)
  br label %fixmerge1764
fixmerge1764:
  %t5123 = phi i64 [ %t5121, %fixfast1762 ], [ %t5122, %fixslow1763 ]
  br label %merge1761
merge1761:
  %t5124 = phi i64 [ %t5115, %then1759 ], [ %t5123, %fixmerge1764 ]
  %t5125 = icmp ne i64 %t5124, 1
  br i1 %t5125, label %then1765, label %else1766
then1765:
  %t5126 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t5126)
  %t5127 = and i64 %t5126, -8
  %t5128 = inttoptr i64 %t5127 to ptr
  %t5129 = load i64, ptr %t5128
  %t5130 = inttoptr i64 %t5129 to ptr
  %t5131 = call fastcc i64%t5130(i64 %t5126, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5132 = or i64 %t5089, 8
  %t5133 = and i64 %t5132, 7
  %t5134 = icmp eq i64 %t5133, 0
  br i1 %t5134, label %fixfast1767, label %fixslow1768
fixfast1767:
  %t5135 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5089, i64 8)
  %t5136 = extractvalue {i64, i1} %t5135, 0
  %t5137 = extractvalue {i64, i1} %t5135, 1
  br i1 %t5137, label %fixslow1768, label %fixmerge1769
fixslow1768:
  %t5138 = call i64 @rt_add(i64 %t5089, i64 8)
  br label %fixmerge1769
fixmerge1769:
  %t5139 = phi i64 [ %t5136, %fixfast1767 ], [ %t5138, %fixslow1768 ]
  %t5140 = call i64 @rt_cons(i64 %t5131, i64 %t5139)
  ret i64 %t5140
else1766:
  %t5141 = load i64, ptr @"emit.internal:rd-datum-comment?"
  call void @rt_check_callable(i64 %t5141)
  %t5142 = and i64 %t5141, -8
  %t5143 = inttoptr i64 %t5142 to ptr
  %t5144 = load i64, ptr %t5143
  %t5145 = inttoptr i64 %t5144 to ptr
  %t5146 = call fastcc i64%t5145(i64 %t5141, i64 3, i64 %a0, i64 %a1, i64 %t5089, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5147 = icmp ne i64 %t5146, 1
  br i1 %t5147, label %then1770, label %else1771
then1770:
  %t5148 = load i64, ptr @"emit.internal:rd-state-child"
  call void @rt_check_callable(i64 %t5148)
  %t5149 = and i64 %t5148, -8
  %t5150 = inttoptr i64 %t5149 to ptr
  %t5151 = load i64, ptr %t5150
  %t5152 = inttoptr i64 %t5151 to ptr
  %t5153 = call fastcc i64%t5152(i64 %t5148, i64 1, i64 %a4, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5154 = or i64 %t5089, 16
  %t5155 = and i64 %t5154, 7
  %t5156 = icmp eq i64 %t5155, 0
  br i1 %t5156, label %fixfast1772, label %fixslow1773
fixfast1772:
  %t5157 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5089, i64 16)
  %t5158 = extractvalue {i64, i1} %t5157, 0
  %t5159 = extractvalue {i64, i1} %t5157, 1
  br i1 %t5159, label %fixslow1773, label %fixmerge1774
fixslow1773:
  %t5160 = call i64 @rt_add(i64 %t5089, i64 16)
  br label %fixmerge1774
fixmerge1774:
  %t5161 = phi i64 [ %t5158, %fixfast1772 ], [ %t5160, %fixslow1773 ]
  %t5162 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5162)
  %t5163 = and i64 %t5162, -8
  %t5164 = inttoptr i64 %t5163 to ptr
  %t5165 = load i64, ptr %t5164
  %t5166 = inttoptr i64 %t5165 to ptr
  %t5167 = call fastcc i64%t5166(i64 %t5162, i64 4, i64 %a0, i64 %a1, i64 %t5161, i64 %t5153, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5168 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t5168)
  %t5169 = and i64 %t5168, -8
  %t5170 = inttoptr i64 %t5169 to ptr
  %t5171 = load i64, ptr %t5170
  %t5172 = inttoptr i64 %t5171 to ptr
  %t5173 = call fastcc i64%t5172(i64 %t5168, i64 4, i64 %a0, i64 %a1, i64 %t5167, i64 %t5153, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5174 = load i64, ptr @"emit.internal:rd-finish"
  call void @rt_check_callable(i64 %t5174)
  %t5175 = and i64 %t5174, -8
  %t5176 = inttoptr i64 %t5175 to ptr
  %t5177 = load i64, ptr %t5176
  %t5178 = inttoptr i64 %t5177 to ptr
  %t5179 = call fastcc i64%t5178(i64 %t5174, i64 2, i64 %t5153, i64 %t5173, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5180 = call i64 @rt_cdr(i64 %t5179)
  %t5181 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5181)
  %t5182 = and i64 %t5181, -8
  %t5183 = inttoptr i64 %t5182 to ptr
  %t5184 = load i64, ptr %t5183
  %t5185 = inttoptr i64 %t5184 to ptr
  %t5186 = call fastcc i64%t5185(i64 %t5181, i64 1, i64 %t5180, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5187 = icmp ne i64 %t5186, 1
  br i1 %t5187, label %then1775, label %else1776
then1775:
  ret i64 %t5179
else1776:
  %t5188 = call i64 @rt_cdr(i64 %t5179)
  %t5189 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5189)
  %t5190 = and i64 %t5189, -8
  %t5191 = inttoptr i64 %t5190 to ptr
  %t5192 = load i64, ptr %t5191
  %t5193 = inttoptr i64 %t5192 to ptr
  %t5194 = musttail call fastcc i64 %t5193(i64 %t5189, i64 6, i64 %a0, i64 %a1, i64 %t5188, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  ret i64 %t5194
else1771:
  %t5195 = load i64, ptr @"emit.internal:rd-dot?"
  call void @rt_check_callable(i64 %t5195)
  %t5196 = and i64 %t5195, -8
  %t5197 = inttoptr i64 %t5196 to ptr
  %t5198 = load i64, ptr %t5197
  %t5199 = inttoptr i64 %t5198 to ptr
  %t5200 = call fastcc i64%t5199(i64 %t5195, i64 3, i64 %a0, i64 %a1, i64 %t5089, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5201 = icmp ne i64 %t5200, 1
  br i1 %t5201, label %then1777, label %else1778
then1777:
  %t5202 = or i64 %t5089, 8
  %t5203 = and i64 %t5202, 7
  %t5204 = icmp eq i64 %t5203, 0
  br i1 %t5204, label %fixfast1779, label %fixslow1780
fixfast1779:
  %t5205 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5089, i64 8)
  %t5206 = extractvalue {i64, i1} %t5205, 0
  %t5207 = extractvalue {i64, i1} %t5205, 1
  br i1 %t5207, label %fixslow1780, label %fixmerge1781
fixslow1780:
  %t5208 = call i64 @rt_add(i64 %t5089, i64 8)
  br label %fixmerge1781
fixmerge1781:
  %t5209 = phi i64 [ %t5206, %fixfast1779 ], [ %t5208, %fixslow1780 ]
  %t5210 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5210)
  %t5211 = and i64 %t5210, -8
  %t5212 = inttoptr i64 %t5211 to ptr
  %t5213 = load i64, ptr %t5212
  %t5214 = inttoptr i64 %t5213 to ptr
  %t5215 = call fastcc i64%t5214(i64 %t5210, i64 4, i64 %a0, i64 %a1, i64 %t5209, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5216 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t5216)
  %t5217 = and i64 %t5216, -8
  %t5218 = inttoptr i64 %t5217 to ptr
  %t5219 = load i64, ptr %t5218
  %t5220 = inttoptr i64 %t5219 to ptr
  %t5221 = call fastcc i64%t5220(i64 %t5216, i64 4, i64 %a0, i64 %a1, i64 %t5215, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5222 = call i64 @rt_cdr(i64 %t5221)
  %t5223 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5223)
  %t5224 = and i64 %t5223, -8
  %t5225 = inttoptr i64 %t5224 to ptr
  %t5226 = load i64, ptr %t5225
  %t5227 = inttoptr i64 %t5226 to ptr
  %t5228 = call fastcc i64%t5227(i64 %t5223, i64 1, i64 %t5222, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5229 = icmp ne i64 %t5228, 1
  br i1 %t5229, label %then1782, label %else1783
then1782:
  ret i64 %t5221
else1783:
  %t5230 = call i64 @rt_cdr(i64 %t5221)
  %t5231 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5231)
  %t5232 = and i64 %t5231, -8
  %t5233 = inttoptr i64 %t5232 to ptr
  %t5234 = load i64, ptr %t5233
  %t5235 = inttoptr i64 %t5234 to ptr
  %t5236 = call fastcc i64%t5235(i64 %t5231, i64 4, i64 %a0, i64 %a1, i64 %t5230, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5237 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5237)
  %t5238 = and i64 %t5237, -8
  %t5239 = inttoptr i64 %t5238 to ptr
  %t5240 = load i64, ptr %t5239
  %t5241 = inttoptr i64 %t5240 to ptr
  %t5242 = call fastcc i64%t5241(i64 %t5237, i64 1, i64 %t5236, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5243 = icmp ne i64 %t5242, 1
  br i1 %t5243, label %then1784, label %else1785
then1784:
  %t5244 = call i64 @rt_intern(ptr @.str.sym.45)
  %t5245 = call i64 @rt_cons(i64 %t5244, i64 %t5236)
  ret i64 %t5245
else1785:
  %t5246 = or i64 %a1, %t5236
  %t5247 = and i64 %t5246, 7
  %t5248 = icmp eq i64 %t5247, 0
  br i1 %t5248, label %fixfast1786, label %fixslow1787
fixfast1786:
  %t5249 = icmp slt i64 %a1, %t5236
  %t5250 = select i1 %t5249, i64 257, i64 1
  br label %fixmerge1788
fixslow1787:
  %t5251 = call i64 @rt_lt(i64 %a1, i64 %t5236)
  br label %fixmerge1788
fixmerge1788:
  %t5252 = phi i64 [ %t5250, %fixfast1786 ], [ %t5251, %fixslow1787 ]
  %t5253 = icmp ne i64 %t5252, 1
  br i1 %t5253, label %then1789, label %else1790
then1789:
  br label %merge1791
else1790:
  %t5254 = or i64 %a1, %t5236
  %t5255 = and i64 %t5254, 7
  %t5256 = icmp eq i64 %t5255, 0
  br i1 %t5256, label %fixfast1792, label %fixslow1793
fixfast1792:
  %t5257 = icmp eq i64 %a1, %t5236
  %t5258 = select i1 %t5257, i64 257, i64 1
  br label %fixmerge1794
fixslow1793:
  %t5259 = call i64 @rt_num_eq(i64 %a1, i64 %t5236)
  br label %fixmerge1794
fixmerge1794:
  %t5260 = phi i64 [ %t5258, %fixfast1792 ], [ %t5259, %fixslow1793 ]
  br label %merge1791
merge1791:
  %t5261 = phi i64 [ 257, %then1789 ], [ %t5260, %fixmerge1794 ]
  %t5262 = icmp ne i64 %t5261, 1
  br i1 %t5262, label %then1795, label %else1796
then1795:
  %t5263 = call i64 @rt_intern(ptr @.str.sym.46)
  %t5264 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5264)
  %t5265 = and i64 %t5264, -8
  %t5266 = inttoptr i64 %t5265 to ptr
  %t5267 = load i64, ptr %t5266
  %t5268 = inttoptr i64 %t5267 to ptr
  %t5269 = musttail call fastcc i64 %t5268(i64 %t5264, i64 2, i64 %t5263, i64 %a5, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5269
else1796:
  %t5270 = call i64 @rt_car(i64 %t5221)
  %t5271 = load i64, ptr @"emit.internal:rd-append-reverse"
  call void @rt_check_callable(i64 %t5271)
  %t5272 = and i64 %t5271, -8
  %t5273 = inttoptr i64 %t5272 to ptr
  %t5274 = load i64, ptr %t5273
  %t5275 = inttoptr i64 %t5274 to ptr
  %t5276 = call fastcc i64%t5275(i64 %t5271, i64 2, i64 %a3, i64 %t5270, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5277 = or i64 %t5236, 8
  %t5278 = and i64 %t5277, 7
  %t5279 = icmp eq i64 %t5278, 0
  br i1 %t5279, label %fixfast1797, label %fixslow1798
fixfast1797:
  %t5280 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5236, i64 8)
  %t5281 = extractvalue {i64, i1} %t5280, 0
  %t5282 = extractvalue {i64, i1} %t5280, 1
  br i1 %t5282, label %fixslow1798, label %fixmerge1799
fixslow1798:
  %t5283 = call i64 @rt_add(i64 %t5236, i64 8)
  br label %fixmerge1799
fixmerge1799:
  %t5284 = phi i64 [ %t5281, %fixfast1797 ], [ %t5283, %fixslow1798 ]
  %t5285 = call i64 @rt_cons(i64 %t5276, i64 %t5284)
  ret i64 %t5285
else1778:
  %t5286 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t5286)
  %t5287 = and i64 %t5286, -8
  %t5288 = inttoptr i64 %t5287 to ptr
  %t5289 = load i64, ptr %t5288
  %t5290 = inttoptr i64 %t5289 to ptr
  %t5291 = call fastcc i64%t5290(i64 %t5286, i64 4, i64 %a0, i64 %a1, i64 %t5089, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5292 = call i64 @rt_cdr(i64 %t5291)
  %t5293 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5293)
  %t5294 = and i64 %t5293, -8
  %t5295 = inttoptr i64 %t5294 to ptr
  %t5296 = load i64, ptr %t5295
  %t5297 = inttoptr i64 %t5296 to ptr
  %t5298 = call fastcc i64%t5297(i64 %t5293, i64 1, i64 %t5292, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5299 = icmp ne i64 %t5298, 1
  br i1 %t5299, label %then1800, label %else1801
then1800:
  ret i64 %t5291
else1801:
  %t5300 = call i64 @rt_cdr(i64 %t5291)
  %t5301 = call i64 @rt_car(i64 %t5291)
  %t5302 = call i64 @rt_cons(i64 %t5301, i64 %a3)
  %t5303 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5303)
  %t5304 = and i64 %t5303, -8
  %t5305 = inttoptr i64 %t5304 to ptr
  %t5306 = load i64, ptr %t5305
  %t5307 = inttoptr i64 %t5306 to ptr
  %t5308 = musttail call fastcc i64 %t5307(i64 %t5303, i64 6, i64 %a0, i64 %a1, i64 %t5300, i64 %t5302, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  ret i64 %t5308
else1755:
  %t5309 = call i64 @rt_intern(ptr @.str.sym.46)
  %t5310 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5310)
  %t5311 = and i64 %t5310, -8
  %t5312 = inttoptr i64 %t5311 to ptr
  %t5313 = load i64, ptr %t5312
  %t5314 = inttoptr i64 %t5313 to ptr
  %t5315 = musttail call fastcc i64 %t5314(i64 %t5310, i64 2, i64 %t5309, i64 %a5, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5315
}

define fastcc i64 @"emit.internal:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5320 = icmp eq i64 %argc, 4
  br i1 %t5320, label %argok1803, label %arityerr1802
arityerr1802:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1803:
  %t5321 = or i64 0, %a2
  %t5322 = and i64 %t5321, 7
  %t5323 = icmp eq i64 %t5322, 0
  br i1 %t5323, label %fixfast1804, label %fixslow1805
fixfast1804:
  %t5324 = icmp slt i64 0, %a2
  %t5325 = select i1 %t5324, i64 257, i64 1
  br label %fixmerge1806
fixslow1805:
  %t5326 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge1806
fixmerge1806:
  %t5327 = phi i64 [ %t5325, %fixfast1804 ], [ %t5326, %fixslow1805 ]
  %t5328 = icmp ne i64 %t5327, 1
  br i1 %t5328, label %then1807, label %else1808
then1807:
  br label %merge1809
else1808:
  %t5329 = or i64 0, %a2
  %t5330 = and i64 %t5329, 7
  %t5331 = icmp eq i64 %t5330, 0
  br i1 %t5331, label %fixfast1810, label %fixslow1811
fixfast1810:
  %t5332 = icmp eq i64 0, %a2
  %t5333 = select i1 %t5332, i64 257, i64 1
  br label %fixmerge1812
fixslow1811:
  %t5334 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge1812
fixmerge1812:
  %t5335 = phi i64 [ %t5333, %fixfast1810 ], [ %t5334, %fixslow1811 ]
  br label %merge1809
merge1809:
  %t5336 = phi i64 [ 257, %then1807 ], [ %t5335, %fixmerge1812 ]
  %t5337 = icmp ne i64 %t5336, 1
  br i1 %t5337, label %then1813, label %else1814
then1813:
  %t5338 = or i64 %a2, %a1
  %t5339 = and i64 %t5338, 7
  %t5340 = icmp eq i64 %t5339, 0
  br i1 %t5340, label %fixfast1816, label %fixslow1817
fixfast1816:
  %t5341 = icmp slt i64 %a2, %a1
  %t5342 = select i1 %t5341, i64 257, i64 1
  br label %fixmerge1818
fixslow1817:
  %t5343 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1818
fixmerge1818:
  %t5344 = phi i64 [ %t5342, %fixfast1816 ], [ %t5343, %fixslow1817 ]
  br label %merge1815
else1814:
  br label %merge1815
merge1815:
  %t5345 = phi i64 [ %t5344, %fixmerge1818 ], [ 1, %else1814 ]
  %t5346 = icmp ne i64 %t5345, 1
  br i1 %t5346, label %then1819, label %else1820
then1819:
  %t5347 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5348 = call i64 @rt_char_to_integer(i64 %t5347)
  %t5349 = or i64 %t5348, 320
  %t5350 = and i64 %t5349, 7
  %t5351 = icmp eq i64 %t5350, 0
  br i1 %t5351, label %fixfast1821, label %fixslow1822
fixfast1821:
  %t5352 = icmp eq i64 %t5348, 320
  %t5353 = select i1 %t5352, i64 257, i64 1
  br label %fixmerge1823
fixslow1822:
  %t5354 = call i64 @rt_num_eq(i64 %t5348, i64 320)
  br label %fixmerge1823
fixmerge1823:
  %t5355 = phi i64 [ %t5353, %fixfast1821 ], [ %t5354, %fixslow1822 ]
  %t5356 = icmp ne i64 %t5355, 1
  br i1 %t5356, label %then1824, label %else1825
then1824:
  %t5357 = or i64 %a2, 8
  %t5358 = and i64 %t5357, 7
  %t5359 = icmp eq i64 %t5358, 0
  br i1 %t5359, label %fixfast1826, label %fixslow1827
fixfast1826:
  %t5360 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5361 = extractvalue {i64, i1} %t5360, 0
  %t5362 = extractvalue {i64, i1} %t5360, 1
  br i1 %t5362, label %fixslow1827, label %fixmerge1828
fixslow1827:
  %t5363 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1828
fixmerge1828:
  %t5364 = phi i64 [ %t5361, %fixfast1826 ], [ %t5363, %fixslow1827 ]
  %t5365 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5365)
  %t5366 = and i64 %t5365, -8
  %t5367 = inttoptr i64 %t5366 to ptr
  %t5368 = load i64, ptr %t5367
  %t5369 = inttoptr i64 %t5368 to ptr
  %t5370 = musttail call fastcc i64 %t5369(i64 %t5365, i64 6, i64 %a0, i64 %a1, i64 %t5364, i64 2, i64 %a3, i64 %a2, i64 0, i64 0, ptr null)
  ret i64 %t5370
else1825:
  %t5371 = or i64 %t5348, 728
  %t5372 = and i64 %t5371, 7
  %t5373 = icmp eq i64 %t5372, 0
  br i1 %t5373, label %fixfast1829, label %fixslow1830
fixfast1829:
  %t5374 = icmp eq i64 %t5348, 728
  %t5375 = select i1 %t5374, i64 257, i64 1
  br label %fixmerge1831
fixslow1830:
  %t5376 = call i64 @rt_num_eq(i64 %t5348, i64 728)
  br label %fixmerge1831
fixmerge1831:
  %t5377 = phi i64 [ %t5375, %fixfast1829 ], [ %t5376, %fixslow1830 ]
  %t5378 = icmp ne i64 %t5377, 1
  br i1 %t5378, label %then1832, label %else1833
then1832:
  %t5379 = or i64 %a2, 8
  %t5380 = and i64 %t5379, 7
  %t5381 = icmp eq i64 %t5380, 0
  br i1 %t5381, label %fixfast1834, label %fixslow1835
fixfast1834:
  %t5382 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5383 = extractvalue {i64, i1} %t5382, 0
  %t5384 = extractvalue {i64, i1} %t5382, 1
  br i1 %t5384, label %fixslow1835, label %fixmerge1836
fixslow1835:
  %t5385 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1836
fixmerge1836:
  %t5386 = phi i64 [ %t5383, %fixfast1834 ], [ %t5385, %fixslow1835 ]
  %t5387 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5387)
  %t5388 = and i64 %t5387, -8
  %t5389 = inttoptr i64 %t5388 to ptr
  %t5390 = load i64, ptr %t5389
  %t5391 = inttoptr i64 %t5390 to ptr
  %t5392 = musttail call fastcc i64 %t5391(i64 %t5387, i64 6, i64 %a0, i64 %a1, i64 %t5386, i64 2, i64 %a3, i64 %a2, i64 0, i64 0, ptr null)
  ret i64 %t5392
else1833:
  %t5393 = or i64 %t5348, 312
  %t5394 = and i64 %t5393, 7
  %t5395 = icmp eq i64 %t5394, 0
  br i1 %t5395, label %fixfast1837, label %fixslow1838
fixfast1837:
  %t5396 = icmp eq i64 %t5348, 312
  %t5397 = select i1 %t5396, i64 257, i64 1
  br label %fixmerge1839
fixslow1838:
  %t5398 = call i64 @rt_num_eq(i64 %t5348, i64 312)
  br label %fixmerge1839
fixmerge1839:
  %t5399 = phi i64 [ %t5397, %fixfast1837 ], [ %t5398, %fixslow1838 ]
  %t5400 = icmp ne i64 %t5399, 1
  br i1 %t5400, label %then1840, label %else1841
then1840:
  %t5401 = or i64 %a2, 8
  %t5402 = and i64 %t5401, 7
  %t5403 = icmp eq i64 %t5402, 0
  br i1 %t5403, label %fixfast1842, label %fixslow1843
fixfast1842:
  %t5404 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5405 = extractvalue {i64, i1} %t5404, 0
  %t5406 = extractvalue {i64, i1} %t5404, 1
  br i1 %t5406, label %fixslow1843, label %fixmerge1844
fixslow1843:
  %t5407 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1844
fixmerge1844:
  %t5408 = phi i64 [ %t5405, %fixfast1842 ], [ %t5407, %fixslow1843 ]
  %t5409 = load i64, ptr @"emit.internal:rd-quote"
  call void @rt_check_callable(i64 %t5409)
  %t5410 = and i64 %t5409, -8
  %t5411 = inttoptr i64 %t5410 to ptr
  %t5412 = load i64, ptr %t5411
  %t5413 = inttoptr i64 %t5412 to ptr
  %t5414 = musttail call fastcc i64 %t5413(i64 %t5409, i64 4, i64 %a0, i64 %a1, i64 %t5408, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5414
else1841:
  %t5415 = or i64 %t5348, 768
  %t5416 = and i64 %t5415, 7
  %t5417 = icmp eq i64 %t5416, 0
  br i1 %t5417, label %fixfast1845, label %fixslow1846
fixfast1845:
  %t5418 = icmp eq i64 %t5348, 768
  %t5419 = select i1 %t5418, i64 257, i64 1
  br label %fixmerge1847
fixslow1846:
  %t5420 = call i64 @rt_num_eq(i64 %t5348, i64 768)
  br label %fixmerge1847
fixmerge1847:
  %t5421 = phi i64 [ %t5419, %fixfast1845 ], [ %t5420, %fixslow1846 ]
  %t5422 = icmp ne i64 %t5421, 1
  br i1 %t5422, label %then1848, label %else1849
then1848:
  %t5423 = or i64 %a2, 8
  %t5424 = and i64 %t5423, 7
  %t5425 = icmp eq i64 %t5424, 0
  br i1 %t5425, label %fixfast1850, label %fixslow1851
fixfast1850:
  %t5426 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5427 = extractvalue {i64, i1} %t5426, 0
  %t5428 = extractvalue {i64, i1} %t5426, 1
  br i1 %t5428, label %fixslow1851, label %fixmerge1852
fixslow1851:
  %t5429 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1852
fixmerge1852:
  %t5430 = phi i64 [ %t5427, %fixfast1850 ], [ %t5429, %fixslow1851 ]
  %t5431 = load i64, ptr @"emit.internal:rd-quasi"
  call void @rt_check_callable(i64 %t5431)
  %t5432 = and i64 %t5431, -8
  %t5433 = inttoptr i64 %t5432 to ptr
  %t5434 = load i64, ptr %t5433
  %t5435 = inttoptr i64 %t5434 to ptr
  %t5436 = musttail call fastcc i64 %t5435(i64 %t5431, i64 4, i64 %a0, i64 %a1, i64 %t5430, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5436
else1849:
  %t5437 = or i64 %t5348, 352
  %t5438 = and i64 %t5437, 7
  %t5439 = icmp eq i64 %t5438, 0
  br i1 %t5439, label %fixfast1853, label %fixslow1854
fixfast1853:
  %t5440 = icmp eq i64 %t5348, 352
  %t5441 = select i1 %t5440, i64 257, i64 1
  br label %fixmerge1855
fixslow1854:
  %t5442 = call i64 @rt_num_eq(i64 %t5348, i64 352)
  br label %fixmerge1855
fixmerge1855:
  %t5443 = phi i64 [ %t5441, %fixfast1853 ], [ %t5442, %fixslow1854 ]
  %t5444 = icmp ne i64 %t5443, 1
  br i1 %t5444, label %then1856, label %else1857
then1856:
  %t5445 = or i64 %a2, 8
  %t5446 = and i64 %t5445, 7
  %t5447 = icmp eq i64 %t5446, 0
  br i1 %t5447, label %fixfast1858, label %fixslow1859
fixfast1858:
  %t5448 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5449 = extractvalue {i64, i1} %t5448, 0
  %t5450 = extractvalue {i64, i1} %t5448, 1
  br i1 %t5450, label %fixslow1859, label %fixmerge1860
fixslow1859:
  %t5451 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1860
fixmerge1860:
  %t5452 = phi i64 [ %t5449, %fixfast1858 ], [ %t5451, %fixslow1859 ]
  %t5453 = load i64, ptr @"emit.internal:rd-unquote"
  call void @rt_check_callable(i64 %t5453)
  %t5454 = and i64 %t5453, -8
  %t5455 = inttoptr i64 %t5454 to ptr
  %t5456 = load i64, ptr %t5455
  %t5457 = inttoptr i64 %t5456 to ptr
  %t5458 = musttail call fastcc i64 %t5457(i64 %t5453, i64 4, i64 %a0, i64 %a1, i64 %t5452, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5458
else1857:
  %t5459 = or i64 %t5348, 272
  %t5460 = and i64 %t5459, 7
  %t5461 = icmp eq i64 %t5460, 0
  br i1 %t5461, label %fixfast1861, label %fixslow1862
fixfast1861:
  %t5462 = icmp eq i64 %t5348, 272
  %t5463 = select i1 %t5462, i64 257, i64 1
  br label %fixmerge1863
fixslow1862:
  %t5464 = call i64 @rt_num_eq(i64 %t5348, i64 272)
  br label %fixmerge1863
fixmerge1863:
  %t5465 = phi i64 [ %t5463, %fixfast1861 ], [ %t5464, %fixslow1862 ]
  %t5466 = icmp ne i64 %t5465, 1
  br i1 %t5466, label %then1864, label %else1865
then1864:
  %t5467 = or i64 %a2, 8
  %t5468 = and i64 %t5467, 7
  %t5469 = icmp eq i64 %t5468, 0
  br i1 %t5469, label %fixfast1866, label %fixslow1867
fixfast1866:
  %t5470 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5471 = extractvalue {i64, i1} %t5470, 0
  %t5472 = extractvalue {i64, i1} %t5470, 1
  br i1 %t5472, label %fixslow1867, label %fixmerge1868
fixslow1867:
  %t5473 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1868
fixmerge1868:
  %t5474 = phi i64 [ %t5471, %fixfast1866 ], [ %t5473, %fixslow1867 ]
  %t5475 = load i64, ptr @"emit.internal:rd-string"
  call void @rt_check_callable(i64 %t5475)
  %t5476 = and i64 %t5475, -8
  %t5477 = inttoptr i64 %t5476 to ptr
  %t5478 = load i64, ptr %t5477
  %t5479 = inttoptr i64 %t5478 to ptr
  %t5480 = musttail call fastcc i64 %t5479(i64 %t5475, i64 4, i64 %a0, i64 %a1, i64 %t5474, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5480
else1865:
  %t5481 = or i64 %t5348, 280
  %t5482 = and i64 %t5481, 7
  %t5483 = icmp eq i64 %t5482, 0
  br i1 %t5483, label %fixfast1869, label %fixslow1870
fixfast1869:
  %t5484 = icmp eq i64 %t5348, 280
  %t5485 = select i1 %t5484, i64 257, i64 1
  br label %fixmerge1871
fixslow1870:
  %t5486 = call i64 @rt_num_eq(i64 %t5348, i64 280)
  br label %fixmerge1871
fixmerge1871:
  %t5487 = phi i64 [ %t5485, %fixfast1869 ], [ %t5486, %fixslow1870 ]
  %t5488 = icmp ne i64 %t5487, 1
  br i1 %t5488, label %then1872, label %else1873
then1872:
  %t5489 = or i64 %a2, 8
  %t5490 = and i64 %t5489, 7
  %t5491 = icmp eq i64 %t5490, 0
  br i1 %t5491, label %fixfast1874, label %fixslow1875
fixfast1874:
  %t5492 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5493 = extractvalue {i64, i1} %t5492, 0
  %t5494 = extractvalue {i64, i1} %t5492, 1
  br i1 %t5494, label %fixslow1875, label %fixmerge1876
fixslow1875:
  %t5495 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1876
fixmerge1876:
  %t5496 = phi i64 [ %t5493, %fixfast1874 ], [ %t5495, %fixslow1875 ]
  %t5497 = load i64, ptr @"emit.internal:rd-hash"
  call void @rt_check_callable(i64 %t5497)
  %t5498 = and i64 %t5497, -8
  %t5499 = inttoptr i64 %t5498 to ptr
  %t5500 = load i64, ptr %t5499
  %t5501 = inttoptr i64 %t5500 to ptr
  %t5502 = musttail call fastcc i64 %t5501(i64 %t5497, i64 4, i64 %a0, i64 %a1, i64 %t5496, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5502
else1873:
  %t5503 = or i64 %t5348, 992
  %t5504 = and i64 %t5503, 7
  %t5505 = icmp eq i64 %t5504, 0
  br i1 %t5505, label %fixfast1877, label %fixslow1878
fixfast1877:
  %t5506 = icmp eq i64 %t5348, 992
  %t5507 = select i1 %t5506, i64 257, i64 1
  br label %fixmerge1879
fixslow1878:
  %t5508 = call i64 @rt_num_eq(i64 %t5348, i64 992)
  br label %fixmerge1879
fixmerge1879:
  %t5509 = phi i64 [ %t5507, %fixfast1877 ], [ %t5508, %fixslow1878 ]
  %t5510 = icmp ne i64 %t5509, 1
  br i1 %t5510, label %then1880, label %else1881
then1880:
  %t5511 = or i64 %a2, 8
  %t5512 = and i64 %t5511, 7
  %t5513 = icmp eq i64 %t5512, 0
  br i1 %t5513, label %fixfast1882, label %fixslow1883
fixfast1882:
  %t5514 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5515 = extractvalue {i64, i1} %t5514, 0
  %t5516 = extractvalue {i64, i1} %t5514, 1
  br i1 %t5516, label %fixslow1883, label %fixmerge1884
fixslow1883:
  %t5517 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1884
fixmerge1884:
  %t5518 = phi i64 [ %t5515, %fixfast1882 ], [ %t5517, %fixslow1883 ]
  %t5519 = load i64, ptr @"emit.internal:rd-bar"
  call void @rt_check_callable(i64 %t5519)
  %t5520 = and i64 %t5519, -8
  %t5521 = inttoptr i64 %t5520 to ptr
  %t5522 = load i64, ptr %t5521
  %t5523 = inttoptr i64 %t5522 to ptr
  %t5524 = musttail call fastcc i64 %t5523(i64 %t5519, i64 4, i64 %a0, i64 %a1, i64 %t5518, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5524
else1881:
  %t5525 = or i64 %t5348, 328
  %t5526 = and i64 %t5525, 7
  %t5527 = icmp eq i64 %t5526, 0
  br i1 %t5527, label %fixfast1885, label %fixslow1886
fixfast1885:
  %t5528 = icmp eq i64 %t5348, 328
  %t5529 = select i1 %t5528, i64 257, i64 1
  br label %fixmerge1887
fixslow1886:
  %t5530 = call i64 @rt_num_eq(i64 %t5348, i64 328)
  br label %fixmerge1887
fixmerge1887:
  %t5531 = phi i64 [ %t5529, %fixfast1885 ], [ %t5530, %fixslow1886 ]
  %t5532 = icmp ne i64 %t5531, 1
  br i1 %t5532, label %then1888, label %else1889
then1888:
  br label %merge1890
else1889:
  %t5533 = or i64 %t5348, 744
  %t5534 = and i64 %t5533, 7
  %t5535 = icmp eq i64 %t5534, 0
  br i1 %t5535, label %fixfast1891, label %fixslow1892
fixfast1891:
  %t5536 = icmp eq i64 %t5348, 744
  %t5537 = select i1 %t5536, i64 257, i64 1
  br label %fixmerge1893
fixslow1892:
  %t5538 = call i64 @rt_num_eq(i64 %t5348, i64 744)
  br label %fixmerge1893
fixmerge1893:
  %t5539 = phi i64 [ %t5537, %fixfast1891 ], [ %t5538, %fixslow1892 ]
  br label %merge1890
merge1890:
  %t5540 = phi i64 [ %t5531, %then1888 ], [ %t5539, %fixmerge1893 ]
  %t5541 = icmp ne i64 %t5540, 1
  br i1 %t5541, label %then1894, label %else1895
then1894:
  %t5542 = call i64 @rt_intern(ptr @.str.sym.11)
  %t5543 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5543)
  %t5544 = and i64 %t5543, -8
  %t5545 = inttoptr i64 %t5544 to ptr
  %t5546 = load i64, ptr %t5545
  %t5547 = inttoptr i64 %t5546 to ptr
  %t5548 = musttail call fastcc i64 %t5547(i64 %t5543, i64 2, i64 %t5542, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5548
else1895:
  %t5549 = load i64, ptr @"emit.internal:rd-atom"
  call void @rt_check_callable(i64 %t5549)
  %t5550 = and i64 %t5549, -8
  %t5551 = inttoptr i64 %t5550 to ptr
  %t5552 = load i64, ptr %t5551
  %t5553 = inttoptr i64 %t5552 to ptr
  %t5554 = musttail call fastcc i64 %t5553(i64 %t5549, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5554
else1820:
  %t5555 = or i64 %a2, 0
  %t5556 = and i64 %t5555, 7
  %t5557 = icmp eq i64 %t5556, 0
  br i1 %t5557, label %fixfast1896, label %fixslow1897
fixfast1896:
  %t5558 = icmp slt i64 %a2, 0
  %t5559 = select i1 %t5558, i64 257, i64 1
  br label %fixmerge1898
fixslow1897:
  %t5560 = call i64 @rt_lt(i64 %a2, i64 0)
  br label %fixmerge1898
fixmerge1898:
  %t5561 = phi i64 [ %t5559, %fixfast1896 ], [ %t5560, %fixslow1897 ]
  %t5562 = icmp ne i64 %t5561, 1
  br i1 %t5562, label %then1899, label %else1900
then1899:
  %t5563 = call i64 @rt_intern(ptr @.str.sym.45)
  %t5564 = call i64 @rt_cons(i64 %t5563, i64 %a2)
  ret i64 %t5564
else1900:
  %t5565 = call i64 @rt_intern(ptr @.str.sym.20)
  %t5566 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5566)
  %t5567 = and i64 %t5566, -8
  %t5568 = inttoptr i64 %t5567 to ptr
  %t5569 = load i64, ptr %t5568
  %t5570 = inttoptr i64 %t5569 to ptr
  %t5571 = musttail call fastcc i64 %t5570(i64 %t5566, i64 2, i64 %t5565, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5571
}

define fastcc i64 @"emit.internal:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5577 = icmp eq i64 %argc, 0
  br i1 %t5577, label %argok1902, label %arityerr1901
arityerr1901:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1902:
  %t5578 = load i64, ptr @"emit.internal:%port-rtd-cell"
  %t5579 = icmp ne i64 %t5578, 1
  br i1 %t5579, label %then1903, label %else1904
then1903:
  %t5580 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t5580
else1904:
  %t5581 = call i64 @rt_make_string(ptr @.str.lit.47, i64 4)
  %t5582 = call i64 @rt_make_record_type(i64 %t5581)
  %t5583 = call i64 @rt_root(i64 %t5582)
  store i64 %t5583, ptr @"emit.internal:%port-rtd-cell"
  %t5584 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t5584
}

define fastcc i64 @"emit.internal:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5589 = icmp eq i64 %argc, 6
  br i1 %t5589, label %argok1906, label %arityerr1905
arityerr1905:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1906:
  %t5590 = load i64, ptr @"emit.internal:%port-rtd"
  call void @rt_check_callable(i64 %t5590)
  %t5591 = and i64 %t5590, -8
  %t5592 = inttoptr i64 %t5591 to ptr
  %t5593 = load i64, ptr %t5592
  %t5594 = inttoptr i64 %t5593 to ptr
  %t5595 = call fastcc i64%t5594(i64 %t5590, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5596 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t5596)
  %t5597 = and i64 %t5596, -8
  %t5598 = inttoptr i64 %t5597 to ptr
  %t5599 = load i64, ptr %t5598
  %t5600 = inttoptr i64 %t5599 to ptr
  %t5601 = call fastcc i64%t5600(i64 %t5596, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5602 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t5602)
  %t5603 = and i64 %t5602, -8
  %t5604 = inttoptr i64 %t5603 to ptr
  %t5605 = load i64, ptr %t5604
  %t5606 = inttoptr i64 %t5605 to ptr
  %t5607 = call fastcc i64%t5606(i64 %t5602, i64 1, i64 %t5601, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5608 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t5608)
  %t5609 = and i64 %t5608, -8
  %t5610 = inttoptr i64 %t5609 to ptr
  %t5611 = load i64, ptr %t5610
  %t5612 = inttoptr i64 %t5611 to ptr
  %t5613 = call fastcc i64%t5612(i64 %t5608, i64 7, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %t5607, i64 0, ptr null)
  %t5614 = call i64 @rt_make_record(i64 %t5595, i64 %t5613)
  ret i64 %t5614
}

define fastcc i64 @"emit.internal:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5619 = icmp eq i64 %argc, 1
  br i1 %t5619, label %argok1908, label %arityerr1907
arityerr1907:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1908:
  %t5620 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t5621 = icmp ne i64 %t5620, 1
  br i1 %t5621, label %then1909, label %else1910
then1909:
  ret i64 %t5620
else1910:
  %t5622 = call i64 @rt_read_all_stdin()
  %t5623 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t5622)
  ret i64 %t5622
}

define i64 @"emit.internal:__init_1"() {
entry:
  %t12 = call ptr @rt_alloc_words(i64 1)
  %t13 = ptrtoint ptr %t12 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list" to i64), ptr %t12
  %t14 = or i64 %t13, 4
  %t15 = call i64 @rt_root(i64 %t14)
  store i64 %t15, ptr @"emit.internal:list"
  ret i64 17
}

define i64 @"emit.internal:__init_2"() {
entry:
  %t19 = call ptr @rt_alloc_words(i64 1)
  %t20 = ptrtoint ptr %t19 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:caar" to i64), ptr %t19
  %t21 = or i64 %t20, 4
  %t22 = call i64 @rt_root(i64 %t21)
  store i64 %t22, ptr @"emit.internal:caar"
  ret i64 17
}

define i64 @"emit.internal:__init_3"() {
entry:
  %t26 = call ptr @rt_alloc_words(i64 1)
  %t27 = ptrtoint ptr %t26 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cadr" to i64), ptr %t26
  %t28 = or i64 %t27, 4
  %t29 = call i64 @rt_root(i64 %t28)
  store i64 %t29, ptr @"emit.internal:cadr"
  ret i64 17
}

define i64 @"emit.internal:__init_4"() {
entry:
  %t33 = call ptr @rt_alloc_words(i64 1)
  %t34 = ptrtoint ptr %t33 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cdar" to i64), ptr %t33
  %t35 = or i64 %t34, 4
  %t36 = call i64 @rt_root(i64 %t35)
  store i64 %t36, ptr @"emit.internal:cdar"
  ret i64 17
}

define i64 @"emit.internal:__init_5"() {
entry:
  %t40 = call ptr @rt_alloc_words(i64 1)
  %t41 = ptrtoint ptr %t40 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cddr" to i64), ptr %t40
  %t42 = or i64 %t41, 4
  %t43 = call i64 @rt_root(i64 %t42)
  store i64 %t43, ptr @"emit.internal:cddr"
  ret i64 17
}

define i64 @"emit.internal:__init_6"() {
entry:
  %t52 = call ptr @rt_alloc_words(i64 1)
  %t53 = ptrtoint ptr %t52 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:caaar" to i64), ptr %t52
  %t54 = or i64 %t53, 4
  %t55 = call i64 @rt_root(i64 %t54)
  store i64 %t55, ptr @"emit.internal:caaar"
  ret i64 17
}

define i64 @"emit.internal:__init_7"() {
entry:
  %t64 = call ptr @rt_alloc_words(i64 1)
  %t65 = ptrtoint ptr %t64 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:caadr" to i64), ptr %t64
  %t66 = or i64 %t65, 4
  %t67 = call i64 @rt_root(i64 %t66)
  store i64 %t67, ptr @"emit.internal:caadr"
  ret i64 17
}

define i64 @"emit.internal:__init_8"() {
entry:
  %t76 = call ptr @rt_alloc_words(i64 1)
  %t77 = ptrtoint ptr %t76 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cadar" to i64), ptr %t76
  %t78 = or i64 %t77, 4
  %t79 = call i64 @rt_root(i64 %t78)
  store i64 %t79, ptr @"emit.internal:cadar"
  ret i64 17
}

define i64 @"emit.internal:__init_9"() {
entry:
  %t88 = call ptr @rt_alloc_words(i64 1)
  %t89 = ptrtoint ptr %t88 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:caddr" to i64), ptr %t88
  %t90 = or i64 %t89, 4
  %t91 = call i64 @rt_root(i64 %t90)
  store i64 %t91, ptr @"emit.internal:caddr"
  ret i64 17
}

define i64 @"emit.internal:__init_10"() {
entry:
  %t100 = call ptr @rt_alloc_words(i64 1)
  %t101 = ptrtoint ptr %t100 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cdaar" to i64), ptr %t100
  %t102 = or i64 %t101, 4
  %t103 = call i64 @rt_root(i64 %t102)
  store i64 %t103, ptr @"emit.internal:cdaar"
  ret i64 17
}

define i64 @"emit.internal:__init_11"() {
entry:
  %t112 = call ptr @rt_alloc_words(i64 1)
  %t113 = ptrtoint ptr %t112 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cdadr" to i64), ptr %t112
  %t114 = or i64 %t113, 4
  %t115 = call i64 @rt_root(i64 %t114)
  store i64 %t115, ptr @"emit.internal:cdadr"
  ret i64 17
}

define i64 @"emit.internal:__init_12"() {
entry:
  %t124 = call ptr @rt_alloc_words(i64 1)
  %t125 = ptrtoint ptr %t124 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cddar" to i64), ptr %t124
  %t126 = or i64 %t125, 4
  %t127 = call i64 @rt_root(i64 %t126)
  store i64 %t127, ptr @"emit.internal:cddar"
  ret i64 17
}

define i64 @"emit.internal:__init_13"() {
entry:
  %t136 = call ptr @rt_alloc_words(i64 1)
  %t137 = ptrtoint ptr %t136 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cdddr" to i64), ptr %t136
  %t138 = or i64 %t137, 4
  %t139 = call i64 @rt_root(i64 %t138)
  store i64 %t139, ptr @"emit.internal:cdddr"
  ret i64 17
}

define i64 @"emit.internal:__init_14"() {
entry:
  %t159 = call ptr @rt_alloc_words(i64 1)
  %t160 = ptrtoint ptr %t159 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:length" to i64), ptr %t159
  %t161 = or i64 %t160, 4
  %t162 = call i64 @rt_root(i64 %t161)
  store i64 %t162, ptr @"emit.internal:length"
  ret i64 17
}

define i64 @"emit.internal:__init_15"() {
entry:
  %t176 = call ptr @rt_alloc_words(i64 1)
  %t177 = ptrtoint ptr %t176 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:reverse" to i64), ptr %t176
  %t178 = or i64 %t177, 4
  %t179 = call i64 @rt_root(i64 %t178)
  store i64 %t179, ptr @"emit.internal:reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_16"() {
entry:
  %t206 = call ptr @rt_alloc_words(i64 1)
  %t207 = ptrtoint ptr %t206 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:filter" to i64), ptr %t206
  %t208 = or i64 %t207, 4
  %t209 = call i64 @rt_root(i64 %t208)
  store i64 %t209, ptr @"emit.internal:filter"
  ret i64 17
}

define i64 @"emit.internal:__init_17"() {
entry:
  %t226 = call ptr @rt_alloc_words(i64 1)
  %t227 = ptrtoint ptr %t226 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:fold-right" to i64), ptr %t226
  %t228 = or i64 %t227, 4
  %t229 = call i64 @rt_root(i64 %t228)
  store i64 %t229, ptr @"emit.internal:fold-right"
  ret i64 17
}

define i64 @"emit.internal:__init_18"() {
entry:
  %t238 = call ptr @rt_alloc_words(i64 1)
  %t239 = ptrtoint ptr %t238 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cadddr" to i64), ptr %t238
  %t240 = or i64 %t239, 4
  %t241 = call i64 @rt_root(i64 %t240)
  store i64 %t241, ptr @"emit.internal:cadddr"
  ret i64 17
}

define i64 @"emit.internal:__init_19"() {
entry:
  %t278 = call ptr @rt_alloc_words(i64 1)
  %t279 = ptrtoint ptr %t278 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:iota" to i64), ptr %t278
  %t280 = or i64 %t279, 4
  %t281 = call i64 @rt_root(i64 %t280)
  store i64 %t281, ptr @"emit.internal:iota"
  ret i64 17
}

define i64 @"emit.internal:__init_20"() {
entry:
  %t370 = call ptr @rt_alloc_words(i64 1)
  %t371 = ptrtoint ptr %t370 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%digit-in-radix" to i64), ptr %t370
  %t372 = or i64 %t371, 4
  %t373 = call i64 @rt_root(i64 %t372)
  store i64 %t373, ptr @"emit.internal:%digit-in-radix"
  ret i64 17
}

define i64 @"emit.internal:__init_21"() {
entry:
  %t422 = call ptr @rt_alloc_words(i64 1)
  %t423 = ptrtoint ptr %t422 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%radix-digits" to i64), ptr %t422
  %t424 = or i64 %t423, 4
  %t425 = call i64 @rt_root(i64 %t424)
  store i64 %t425, ptr @"emit.internal:%radix-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_22"() {
entry:
  %t492 = call ptr @rt_alloc_words(i64 1)
  %t493 = ptrtoint ptr %t492 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%string->int" to i64), ptr %t492
  %t494 = or i64 %t493, 4
  %t495 = call i64 @rt_root(i64 %t494)
  store i64 %t495, ptr @"emit.internal:%string->int"
  ret i64 17
}

define i64 @"emit.internal:__init_23"() {
entry:
  %t533 = call ptr @rt_alloc_words(i64 1)
  %t534 = ptrtoint ptr %t533 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list->vector" to i64), ptr %t533
  %t535 = or i64 %t534, 4
  %t536 = call i64 @rt_root(i64 %t535)
  store i64 %t536, ptr @"emit.internal:list->vector"
  ret i64 17
}

define i64 @"emit.internal:__init_24"() {
entry:
  %t574 = call ptr @rt_alloc_words(i64 1)
  %t575 = ptrtoint ptr %t574 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list->bytevector" to i64), ptr %t574
  %t576 = or i64 %t575, 4
  %t577 = call i64 @rt_root(i64 %t576)
  store i64 %t577, ptr @"emit.internal:list->bytevector"
  ret i64 17
}

define i64 @"emit.internal:__init_25"() {
entry:
  %t611 = call ptr @rt_alloc_words(i64 1)
  %t612 = ptrtoint ptr %t611 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-ws?" to i64), ptr %t611
  %t613 = or i64 %t612, 4
  %t614 = call i64 @rt_root(i64 %t613)
  store i64 %t614, ptr @"emit.internal:rd-ws?"
  ret i64 17
}

define i64 @"emit.internal:__init_26"() {
entry:
  %t632 = call ptr @rt_alloc_words(i64 1)
  %t633 = ptrtoint ptr %t632 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digit?" to i64), ptr %t632
  %t634 = or i64 %t633, 4
  %t635 = call i64 @rt_root(i64 %t634)
  store i64 %t635, ptr @"emit.internal:rd-digit?"
  ret i64 17
}

define i64 @"emit.internal:__init_27"() {
entry:
  %t692 = call ptr @rt_alloc_words(i64 1)
  %t693 = ptrtoint ptr %t692 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-delim?" to i64), ptr %t692
  %t694 = or i64 %t693, 4
  %t695 = call i64 @rt_root(i64 %t694)
  store i64 %t695, ptr @"emit.internal:rd-delim?"
  ret i64 17
}

define i64 @"emit.internal:__init_28"() {
entry:
  %t705 = call ptr @rt_alloc_words(i64 1)
  %t706 = ptrtoint ptr %t705 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail-code" to i64), ptr %t705
  %t707 = or i64 %t706, 4
  %t708 = call i64 @rt_root(i64 %t707)
  store i64 %t708, ptr @"emit.internal:rd-fail-code"
  ret i64 17
}

define i64 @"emit.internal:__init_29"() {
entry:
  %t717 = call ptr @rt_alloc_words(i64 1)
  %t718 = ptrtoint ptr %t717 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail?" to i64), ptr %t717
  %t719 = or i64 %t718, 4
  %t720 = call i64 @rt_root(i64 %t719)
  store i64 %t720, ptr @"emit.internal:rd-fail?"
  ret i64 17
}

define i64 @"emit.internal:__init_30"() {
entry:
  %t738 = call ptr @rt_alloc_words(i64 1)
  %t739 = ptrtoint ptr %t738 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail-pos" to i64), ptr %t738
  %t740 = or i64 %t739, 4
  %t741 = call i64 @rt_root(i64 %t740)
  store i64 %t741, ptr @"emit.internal:rd-fail-pos"
  ret i64 17
}

define i64 @"emit.internal:__init_31"() {
entry:
  %t750 = call ptr @rt_alloc_words(i64 1)
  %t751 = ptrtoint ptr %t750 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail" to i64), ptr %t750
  %t752 = or i64 %t751, 4
  %t753 = call i64 @rt_root(i64 %t752)
  store i64 %t753, ptr @"emit.internal:rd-fail"
  ret i64 17
}

define i64 @"emit.internal:__init_32"() {
entry:
  %t791 = call ptr @rt_alloc_words(i64 1)
  %t792 = ptrtoint ptr %t791 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-state" to i64), ptr %t791
  %t793 = or i64 %t792, 4
  %t794 = call i64 @rt_root(i64 %t793)
  store i64 %t794, ptr @"emit.internal:rd-state"
  ret i64 17
}

define i64 @"emit.internal:__init_33"() {
entry:
  %t820 = call ptr @rt_alloc_words(i64 1)
  %t821 = ptrtoint ptr %t820 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-state-from-cell" to i64), ptr %t820
  %t822 = or i64 %t821, 4
  %t823 = call i64 @rt_root(i64 %t822)
  store i64 %t823, ptr @"emit.internal:rd-state-from-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_34"() {
entry:
  %t832 = call ptr @rt_alloc_words(i64 1)
  %t833 = ptrtoint ptr %t832 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-state-child" to i64), ptr %t832
  %t834 = or i64 %t833, 4
  %t835 = call i64 @rt_root(i64 %t834)
  store i64 %t835, ptr @"emit.internal:rd-state-child"
  ret i64 17
}

define i64 @"emit.internal:__init_35"() {
entry:
  %t839 = call ptr @rt_alloc_words(i64 1)
  %t840 = ptrtoint ptr %t839 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold?" to i64), ptr %t839
  %t841 = or i64 %t840, 4
  %t842 = call i64 @rt_root(i64 %t841)
  store i64 %t842, ptr @"emit.internal:rd-fold?"
  ret i64 17
}

define i64 @"emit.internal:__init_36"() {
entry:
  %t846 = call ptr @rt_alloc_words(i64 1)
  %t847 = ptrtoint ptr %t846 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-set-fold!" to i64), ptr %t846
  %t848 = or i64 %t847, 4
  %t849 = call i64 @rt_root(i64 %t848)
  store i64 %t849, ptr @"emit.internal:rd-set-fold!"
  ret i64 17
}

define i64 @"emit.internal:__init_37"() {
entry:
  %t940 = call ptr @rt_alloc_words(i64 1)
  %t941 = ptrtoint ptr %t940 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-match-at?" to i64), ptr %t940
  %t942 = or i64 %t941, 4
  %t943 = call i64 @rt_root(i64 %t942)
  store i64 %t943, ptr @"emit.internal:rd-match-at?"
  ret i64 17
}

define i64 @"emit.internal:__init_38"() {
entry:
  %t978 = call ptr @rt_alloc_words(i64 1)
  %t979 = ptrtoint ptr %t978 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-directive-end" to i64), ptr %t978
  %t980 = or i64 %t979, 4
  %t981 = call i64 @rt_root(i64 %t980)
  store i64 %t981, ptr @"emit.internal:rd-directive-end"
  ret i64 17
}

define i64 @"emit.internal:__init_39"() {
entry:
  %t1023 = call ptr @rt_alloc_words(i64 1)
  %t1024 = ptrtoint ptr %t1023 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-line" to i64), ptr %t1023
  %t1025 = or i64 %t1024, 4
  %t1026 = call i64 @rt_root(i64 %t1025)
  store i64 %t1026, ptr @"emit.internal:rd-skip-line"
  ret i64 17
}

define i64 @"emit.internal:__init_40"() {
entry:
  %t1071 = call ptr @rt_alloc_words(i64 1)
  %t1072 = ptrtoint ptr %t1071 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-block-open?" to i64), ptr %t1071
  %t1073 = or i64 %t1072, 4
  %t1074 = call i64 @rt_root(i64 %t1073)
  store i64 %t1074, ptr @"emit.internal:rd-block-open?"
  ret i64 17
}

define i64 @"emit.internal:__init_41"() {
entry:
  %t1218 = call ptr @rt_alloc_words(i64 1)
  %t1219 = ptrtoint ptr %t1218 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-block" to i64), ptr %t1218
  %t1220 = or i64 %t1219, 4
  %t1221 = call i64 @rt_root(i64 %t1220)
  store i64 %t1221, ptr @"emit.internal:rd-skip-block"
  ret i64 17
}

define i64 @"emit.internal:__init_42"() {
entry:
  %t1374 = call ptr @rt_alloc_words(i64 1)
  %t1375 = ptrtoint ptr %t1374 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-ws" to i64), ptr %t1374
  %t1376 = or i64 %t1375, 4
  %t1377 = call i64 @rt_root(i64 %t1376)
  store i64 %t1377, ptr @"emit.internal:rd-skip-ws"
  ret i64 17
}

define i64 @"emit.internal:__init_43"() {
entry:
  %t1409 = call ptr @rt_alloc_words(i64 1)
  %t1410 = ptrtoint ptr %t1409 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-end" to i64), ptr %t1409
  %t1411 = or i64 %t1410, 4
  %t1412 = call i64 @rt_root(i64 %t1411)
  store i64 %t1412, ptr @"emit.internal:rd-token-end"
  ret i64 17
}

define i64 @"emit.internal:__init_44"() {
entry:
  %t1444 = call ptr @rt_alloc_words(i64 1)
  %t1445 = ptrtoint ptr %t1444 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-all-digits?" to i64), ptr %t1444
  %t1446 = or i64 %t1445, 4
  %t1447 = call i64 @rt_root(i64 %t1446)
  store i64 %t1447, ptr @"emit.internal:rd-all-digits?"
  ret i64 17
}

define i64 @"emit.internal:__init_45"() {
entry:
  %t1505 = call ptr @rt_alloc_words(i64 1)
  %t1506 = ptrtoint ptr %t1505 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-numeric?" to i64), ptr %t1505
  %t1507 = or i64 %t1506, 4
  %t1508 = call i64 @rt_root(i64 %t1507)
  store i64 %t1508, ptr @"emit.internal:rd-numeric?"
  ret i64 17
}

define i64 @"emit.internal:__init_46"() {
entry:
  %t1559 = call ptr @rt_alloc_words(i64 1)
  %t1560 = ptrtoint ptr %t1559 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits" to i64), ptr %t1559
  %t1561 = or i64 %t1560, 4
  %t1562 = call i64 @rt_root(i64 %t1561)
  store i64 %t1562, ptr @"emit.internal:rd-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_47"() {
entry:
  %t1613 = call ptr @rt_alloc_words(i64 1)
  %t1614 = ptrtoint ptr %t1613 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits-neg" to i64), ptr %t1613
  %t1615 = or i64 %t1614, 4
  %t1616 = call i64 @rt_root(i64 %t1615)
  store i64 %t1616, ptr @"emit.internal:rd-digits-neg"
  ret i64 17
}

define i64 @"emit.internal:__init_48"() {
entry:
  %t1655 = call ptr @rt_alloc_words(i64 1)
  %t1656 = ptrtoint ptr %t1655 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-parse-int" to i64), ptr %t1655
  %t1657 = or i64 %t1656, 4
  %t1658 = call i64 @rt_root(i64 %t1657)
  store i64 %t1658, ptr @"emit.internal:rd-parse-int"
  ret i64 17
}

define i64 @"emit.internal:__init_49"() {
entry:
  %t1668 = call ptr @rt_alloc_words(i64 1)
  %t1669 = ptrtoint ptr %t1668 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dotchar?" to i64), ptr %t1668
  %t1670 = or i64 %t1669, 4
  %t1671 = call i64 @rt_root(i64 %t1670)
  store i64 %t1671, ptr @"emit.internal:rd-dotchar?"
  ret i64 17
}

define i64 @"emit.internal:__init_50"() {
entry:
  %t1689 = call ptr @rt_alloc_words(i64 1)
  %t1690 = ptrtoint ptr %t1689 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exp-char?" to i64), ptr %t1689
  %t1691 = or i64 %t1690, 4
  %t1692 = call i64 @rt_root(i64 %t1691)
  store i64 %t1692, ptr @"emit.internal:rd-exp-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_51"() {
entry:
  %t1710 = call ptr @rt_alloc_words(i64 1)
  %t1711 = ptrtoint ptr %t1710 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-sign-char?" to i64), ptr %t1710
  %t1712 = or i64 %t1711, 4
  %t1713 = call i64 @rt_root(i64 %t1712)
  store i64 %t1713, ptr @"emit.internal:rd-sign-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_52"() {
entry:
  %t1746 = call ptr @rt_alloc_words(i64 1)
  %t1747 = ptrtoint ptr %t1746 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-digits" to i64), ptr %t1746
  %t1748 = or i64 %t1747, 4
  %t1749 = call i64 @rt_root(i64 %t1748)
  store i64 %t1749, ptr @"emit.internal:rd-scan-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_53"() {
entry:
  %t1938 = call ptr @rt_alloc_words(i64 1)
  %t1939 = ptrtoint ptr %t1938 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-flonum?" to i64), ptr %t1938
  %t1940 = or i64 %t1939, 4
  %t1941 = call i64 @rt_root(i64 %t1940)
  store i64 %t1941, ptr @"emit.internal:rd-flonum?"
  ret i64 17
}

define i64 @"emit.internal:__init_54"() {
entry:
  %t2009 = call ptr @rt_alloc_words(i64 1)
  %t2010 = ptrtoint ptr %t2009 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-ci=?" to i64), ptr %t2009
  %t2011 = or i64 %t2010, 4
  %t2012 = call i64 @rt_root(i64 %t2011)
  store i64 %t2012, ptr @"emit.internal:rd-ci=?"
  ret i64 17
}

define i64 @"emit.internal:__init_55"() {
entry:
  %t2044 = call ptr @rt_alloc_words(i64 1)
  %t2045 = ptrtoint ptr %t2044 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-nonfinite" to i64), ptr %t2044
  %t2046 = or i64 %t2045, 4
  %t2047 = call i64 @rt_root(i64 %t2046)
  store i64 %t2047, ptr @"emit.internal:rd-nonfinite"
  ret i64 17
}

define i64 @"emit.internal:__init_56"() {
entry:
  %t2118 = call ptr @rt_alloc_words(i64 1)
  %t2119 = ptrtoint ptr %t2118 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-letter" to i64), ptr %t2118
  %t2120 = or i64 %t2119, 4
  %t2121 = call i64 @rt_root(i64 %t2120)
  store i64 %t2121, ptr @"emit.internal:rd-radix-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_57"() {
entry:
  %t2158 = call ptr @rt_alloc_words(i64 1)
  %t2159 = ptrtoint ptr %t2158 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-letter" to i64), ptr %t2158
  %t2160 = or i64 %t2159, 4
  %t2161 = call i64 @rt_root(i64 %t2160)
  store i64 %t2161, ptr @"emit.internal:rd-exactness-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_58"() {
entry:
  %t2262 = call ptr @rt_alloc_words(i64 1)
  %t2263 = ptrtoint ptr %t2262 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-prefixes" to i64), ptr %t2262
  %t2264 = or i64 %t2263, 4
  %t2265 = call i64 @rt_root(i64 %t2264)
  store i64 %t2265, ptr @"emit.internal:rd-scan-prefixes"
  ret i64 17
}

define i64 @"emit.internal:__init_59"() {
entry:
  %t2298 = call ptr @rt_alloc_words(i64 1)
  %t2299 = ptrtoint ptr %t2298 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-scan" to i64), ptr %t2298
  %t2300 = or i64 %t2299, 4
  %t2301 = call i64 @rt_root(i64 %t2300)
  store i64 %t2301, ptr @"emit.internal:rd-radix-scan"
  ret i64 17
}

define i64 @"emit.internal:__init_60"() {
entry:
  %t2398 = call ptr @rt_alloc_words(i64 1)
  %t2399 = ptrtoint ptr %t2398 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-rational-body?" to i64), ptr %t2398
  %t2400 = or i64 %t2399, 4
  %t2401 = call i64 @rt_root(i64 %t2400)
  store i64 %t2401, ptr @"emit.internal:rd-rational-body?"
  ret i64 17
}

define i64 @"emit.internal:__init_61"() {
entry:
  %t2427 = call ptr @rt_alloc_words(i64 1)
  %t2428 = ptrtoint ptr %t2427 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-apply" to i64), ptr %t2427
  %t2429 = or i64 %t2428, 4
  %t2430 = call i64 @rt_root(i64 %t2429)
  store i64 %t2430, ptr @"emit.internal:rd-exactness-apply"
  ret i64 17
}

define i64 @"emit.internal:__init_62"() {
entry:
  %t2513 = call ptr @rt_alloc_words(i64 1)
  %t2514 = ptrtoint ptr %t2513 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-body-number" to i64), ptr %t2513
  %t2515 = or i64 %t2514, 4
  %t2516 = call i64 @rt_root(i64 %t2515)
  store i64 %t2516, ptr @"emit.internal:rd-body-number"
  ret i64 17
}

define i64 @"emit.internal:__init_63"() {
entry:
  %t2599 = call ptr @rt_alloc_words(i64 1)
  %t2600 = ptrtoint ptr %t2599 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number" to i64), ptr %t2599
  %t2601 = or i64 %t2600, 4
  %t2602 = call i64 @rt_root(i64 %t2601)
  store i64 %t2602, ptr @"emit.internal:rd-number"
  ret i64 17
}

define i64 @"emit.internal:__init_64"() {
entry:
  %t2609 = call ptr @rt_alloc_words(i64 1)
  %t2610 = ptrtoint ptr %t2609 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number-reason?" to i64), ptr %t2609
  %t2611 = or i64 %t2610, 4
  %t2612 = call i64 @rt_root(i64 %t2611)
  store i64 %t2612, ptr @"emit.internal:rd-number-reason?"
  ret i64 17
}

define i64 @"emit.internal:__init_65"() {
entry:
  %t2641 = call ptr @rt_alloc_words(i64 1)
  %t2642 = ptrtoint ptr %t2641 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-char" to i64), ptr %t2641
  %t2643 = or i64 %t2642, 4
  %t2644 = call i64 @rt_root(i64 %t2643)
  store i64 %t2644, ptr @"emit.internal:rd-fold-char"
  ret i64 17
}

define i64 @"emit.internal:__init_66"() {
entry:
  %t2695 = call ptr @rt_alloc_words(i64 1)
  %t2696 = ptrtoint ptr %t2695 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-token" to i64), ptr %t2695
  %t2697 = or i64 %t2696, 4
  %t2698 = call i64 @rt_root(i64 %t2697)
  store i64 %t2698, ptr @"emit.internal:rd-fold-token"
  ret i64 17
}

define i64 @"emit.internal:__init_67"() {
entry:
  %t2761 = call ptr @rt_alloc_words(i64 1)
  %t2762 = ptrtoint ptr %t2761 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-atom" to i64), ptr %t2761
  %t2763 = or i64 %t2762, 4
  %t2764 = call i64 @rt_root(i64 %t2763)
  store i64 %t2764, ptr @"emit.internal:rd-atom"
  ret i64 17
}

define i64 @"emit.internal:__init_68"() {
entry:
  %t2808 = call ptr @rt_alloc_words(i64 1)
  %t2809 = ptrtoint ptr %t2808 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-at" to i64), ptr %t2808
  %t2810 = or i64 %t2809, 4
  %t2811 = call i64 @rt_root(i64 %t2810)
  store i64 %t2811, ptr @"emit.internal:rd-token-at"
  ret i64 17
}

define i64 @"emit.internal:__init_69"() {
entry:
  %t2889 = call ptr @rt_alloc_words(i64 1)
  %t2890 = ptrtoint ptr %t2889 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit" to i64), ptr %t2889
  %t2891 = or i64 %t2890, 4
  %t2892 = call i64 @rt_root(i64 %t2891)
  store i64 %t2892, ptr @"emit.internal:rd-hex-digit"
  ret i64 17
}

define i64 @"emit.internal:__init_70"() {
entry:
  %t2946 = call ptr @rt_alloc_words(i64 1)
  %t2947 = ptrtoint ptr %t2946 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit?" to i64), ptr %t2946
  %t2948 = or i64 %t2947, 4
  %t2949 = call i64 @rt_root(i64 %t2948)
  store i64 %t2949, ptr @"emit.internal:rd-hex-digit?"
  ret i64 17
}

define i64 @"emit.internal:__init_71"() {
entry:
  %t3017 = call ptr @rt_alloc_words(i64 1)
  %t3018 = ptrtoint ptr %t3017 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex" to i64), ptr %t3017
  %t3019 = or i64 %t3018, 4
  %t3020 = call i64 @rt_root(i64 %t3019)
  store i64 %t3020, ptr @"emit.internal:rd-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_72"() {
entry:
  %t3068 = call ptr @rt_alloc_words(i64 1)
  %t3069 = ptrtoint ptr %t3068 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-str-esc" to i64), ptr %t3068
  %t3070 = or i64 %t3069, 4
  %t3071 = call i64 @rt_root(i64 %t3070)
  store i64 %t3071, ptr @"emit.internal:rd-str-esc"
  ret i64 17
}

define i64 @"emit.internal:__init_73"() {
entry:
  %t3114 = call ptr @rt_alloc_words(i64 1)
  %t3115 = ptrtoint ptr %t3114 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-intraline" to i64), ptr %t3114
  %t3116 = or i64 %t3115, 4
  %t3117 = call i64 @rt_root(i64 %t3116)
  store i64 %t3117, ptr @"emit.internal:rd-intraline"
  ret i64 17
}

define i64 @"emit.internal:__init_74"() {
entry:
  %t3231 = call ptr @rt_alloc_words(i64 1)
  %t3232 = ptrtoint ptr %t3231 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-line-continuation" to i64), ptr %t3231
  %t3233 = or i64 %t3232, 4
  %t3234 = call i64 @rt_root(i64 %t3233)
  store i64 %t3234, ptr @"emit.internal:rd-line-continuation"
  ret i64 17
}

define i64 @"emit.internal:__init_75"() {
entry:
  %t3445 = call ptr @rt_alloc_words(i64 1)
  %t3446 = ptrtoint ptr %t3445 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-string" to i64), ptr %t3445
  %t3447 = or i64 %t3446, 4
  %t3448 = call i64 @rt_root(i64 %t3447)
  store i64 %t3448, ptr @"emit.internal:rd-string"
  ret i64 17
}

define i64 @"emit.internal:__init_76"() {
entry:
  %t3477 = call ptr @rt_alloc_words(i64 1)
  %t3478 = ptrtoint ptr %t3477 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label-find" to i64), ptr %t3477
  %t3479 = or i64 %t3478, 4
  %t3480 = call i64 @rt_root(i64 %t3479)
  store i64 %t3480, ptr @"emit.internal:rd-label-find"
  ret i64 17
}

define i64 @"emit.internal:__init_77"() {
entry:
  %t3499 = call ptr @rt_alloc_words(i64 1)
  %t3500 = ptrtoint ptr %t3499 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label-add!" to i64), ptr %t3499
  %t3501 = or i64 %t3500, 4
  %t3502 = call i64 @rt_root(i64 %t3501)
  store i64 %t3502, ptr @"emit.internal:rd-label-add!"
  ret i64 17
}

define i64 @"emit.internal:__init_78"() {
entry:
  %t3517 = call ptr @rt_alloc_words(i64 1)
  %t3518 = ptrtoint ptr %t3517 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-placeholder" to i64), ptr %t3517
  %t3519 = or i64 %t3518, 4
  %t3520 = call i64 @rt_root(i64 %t3519)
  store i64 %t3520, ptr @"emit.internal:rd-placeholder"
  ret i64 17
}

define i64 @"emit.internal:__init_79"() {
entry:
  %t3536 = call ptr @rt_alloc_words(i64 1)
  %t3537 = ptrtoint ptr %t3536 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-placeholder?" to i64), ptr %t3536
  %t3538 = or i64 %t3537, 4
  %t3539 = call i64 @rt_root(i64 %t3538)
  store i64 %t3539, ptr @"emit.internal:rd-placeholder?"
  ret i64 17
}

define i64 @"emit.internal:__init_80"() {
entry:
  %t3542 = call ptr @rt_alloc_words(i64 1)
  %t3543 = ptrtoint ptr %t3542 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-placeholder-entry" to i64), ptr %t3542
  %t3544 = or i64 %t3543, 4
  %t3545 = call i64 @rt_root(i64 %t3544)
  store i64 %t3545, ptr @"emit.internal:rd-placeholder-entry"
  ret i64 17
}

define i64 @"emit.internal:__init_81"() {
entry:
  %t3559 = call ptr @rt_alloc_words(i64 1)
  %t3560 = ptrtoint ptr %t3559 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-seen?" to i64), ptr %t3559
  %t3561 = or i64 %t3560, 4
  %t3562 = call i64 @rt_root(i64 %t3561)
  store i64 %t3562, ptr @"emit.internal:rd-seen?"
  ret i64 17
}

define i64 @"emit.internal:__init_82"() {
entry:
  %t3595 = call ptr @rt_alloc_words(i64 1)
  %t3596 = ptrtoint ptr %t3595 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label-scan" to i64), ptr %t3595
  %t3597 = or i64 %t3596, 4
  %t3598 = call i64 @rt_root(i64 %t3597)
  store i64 %t3598, ptr @"emit.internal:rd-label-scan"
  ret i64 17
}

define i64 @"emit.internal:__init_83"() {
entry:
  %t3717 = call ptr @rt_alloc_words(i64 1)
  %t3718 = ptrtoint ptr %t3717 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-resolve" to i64), ptr %t3717
  %t3719 = or i64 %t3718, 4
  %t3720 = call i64 @rt_root(i64 %t3719)
  store i64 %t3720, ptr @"emit.internal:rd-resolve"
  ret i64 17
}

define i64 @"emit.internal:__init_84"() {
entry:
  %t3739 = call ptr @rt_alloc_words(i64 1)
  %t3740 = ptrtoint ptr %t3739 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-finish" to i64), ptr %t3739
  %t3741 = or i64 %t3740, 4
  %t3742 = call i64 @rt_root(i64 %t3741)
  store i64 %t3742, ptr @"emit.internal:rd-finish"
  ret i64 17
}

define i64 @"emit.internal:__init_85"() {
entry:
  %t4008 = call ptr @rt_alloc_words(i64 1)
  %t4009 = ptrtoint ptr %t4008 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label" to i64), ptr %t4008
  %t4010 = or i64 %t4009, 4
  %t4011 = call i64 @rt_root(i64 %t4010)
  store i64 %t4011, ptr @"emit.internal:rd-label"
  ret i64 17
}

define i64 @"emit.internal:__init_86"() {
entry:
  %t4415 = call ptr @rt_alloc_words(i64 1)
  %t4416 = ptrtoint ptr %t4415 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hash" to i64), ptr %t4415
  %t4417 = or i64 %t4416, 4
  %t4418 = call i64 @rt_root(i64 %t4417)
  store i64 %t4418, ptr @"emit.internal:rd-hash"
  ret i64 17
}

define i64 @"emit.internal:__init_87"() {
entry:
  %t4472 = call ptr @rt_alloc_words(i64 1)
  %t4473 = ptrtoint ptr %t4472 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-name" to i64), ptr %t4472
  %t4474 = or i64 %t4473, 4
  %t4475 = call i64 @rt_root(i64 %t4474)
  store i64 %t4475, ptr @"emit.internal:rd-char-name"
  ret i64 17
}

define i64 @"emit.internal:__init_88"() {
entry:
  %t4552 = call ptr @rt_alloc_words(i64 1)
  %t4553 = ptrtoint ptr %t4552 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-hex" to i64), ptr %t4552
  %t4554 = or i64 %t4553, 4
  %t4555 = call i64 @rt_root(i64 %t4554)
  store i64 %t4555, ptr @"emit.internal:rd-char-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_89"() {
entry:
  %t4637 = call ptr @rt_alloc_words(i64 1)
  %t4638 = ptrtoint ptr %t4637 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char" to i64), ptr %t4637
  %t4639 = or i64 %t4638, 4
  %t4640 = call i64 @rt_root(i64 %t4639)
  store i64 %t4640, ptr @"emit.internal:rd-char"
  ret i64 17
}

define i64 @"emit.internal:__init_90"() {
entry:
  %t4809 = call ptr @rt_alloc_words(i64 1)
  %t4810 = ptrtoint ptr %t4809 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-bar" to i64), ptr %t4809
  %t4811 = or i64 %t4810, 4
  %t4812 = call i64 @rt_root(i64 %t4811)
  store i64 %t4812, ptr @"emit.internal:rd-bar"
  ret i64 17
}

define i64 @"emit.internal:__init_91"() {
entry:
  %t4844 = call ptr @rt_alloc_words(i64 1)
  %t4845 = ptrtoint ptr %t4844 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quote" to i64), ptr %t4844
  %t4846 = or i64 %t4845, 4
  %t4847 = call i64 @rt_root(i64 %t4846)
  store i64 %t4847, ptr @"emit.internal:rd-quote"
  ret i64 17
}

define i64 @"emit.internal:__init_92"() {
entry:
  %t4879 = call ptr @rt_alloc_words(i64 1)
  %t4880 = ptrtoint ptr %t4879 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quasi" to i64), ptr %t4879
  %t4881 = or i64 %t4880, 4
  %t4882 = call i64 @rt_root(i64 %t4881)
  store i64 %t4882, ptr @"emit.internal:rd-quasi"
  ret i64 17
}

define i64 @"emit.internal:__init_93"() {
entry:
  %t4971 = call ptr @rt_alloc_words(i64 1)
  %t4972 = ptrtoint ptr %t4971 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-unquote" to i64), ptr %t4971
  %t4973 = or i64 %t4972, 4
  %t4974 = call i64 @rt_root(i64 %t4973)
  store i64 %t4974, ptr @"emit.internal:rd-unquote"
  ret i64 17
}

define i64 @"emit.internal:__init_94"() {
entry:
  %t5015 = call ptr @rt_alloc_words(i64 1)
  %t5016 = ptrtoint ptr %t5015 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dot?" to i64), ptr %t5015
  %t5017 = or i64 %t5016, 4
  %t5018 = call i64 @rt_root(i64 %t5017)
  store i64 %t5018, ptr @"emit.internal:rd-dot?"
  ret i64 17
}

define i64 @"emit.internal:__init_95"() {
entry:
  %t5031 = call ptr @rt_alloc_words(i64 1)
  %t5032 = ptrtoint ptr %t5031 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-append-reverse" to i64), ptr %t5031
  %t5033 = or i64 %t5032, 4
  %t5034 = call i64 @rt_root(i64 %t5033)
  store i64 %t5034, ptr @"emit.internal:rd-append-reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_96"() {
entry:
  %t5079 = call ptr @rt_alloc_words(i64 1)
  %t5080 = ptrtoint ptr %t5079 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum-comment?" to i64), ptr %t5079
  %t5081 = or i64 %t5080, 4
  %t5082 = call i64 @rt_root(i64 %t5081)
  store i64 %t5082, ptr @"emit.internal:rd-datum-comment?"
  ret i64 17
}

define i64 @"emit.internal:__init_97"() {
entry:
  %t5316 = call ptr @rt_alloc_words(i64 1)
  %t5317 = ptrtoint ptr %t5316 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-list" to i64), ptr %t5316
  %t5318 = or i64 %t5317, 4
  %t5319 = call i64 @rt_root(i64 %t5318)
  store i64 %t5319, ptr @"emit.internal:rd-list"
  ret i64 17
}

define i64 @"emit.internal:__init_98"() {
entry:
  %t5572 = call ptr @rt_alloc_words(i64 1)
  %t5573 = ptrtoint ptr %t5572 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum" to i64), ptr %t5572
  %t5574 = or i64 %t5573, 4
  %t5575 = call i64 @rt_root(i64 %t5574)
  store i64 %t5575, ptr @"emit.internal:rd-datum"
  ret i64 17
}

define i64 @"emit.internal:__init_99"() {
entry:
  %t5576 = call i64 @rt_root(i64 1)
  store i64 %t5576, ptr @"emit.internal:%port-rtd-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_100"() {
entry:
  %t5585 = call ptr @rt_alloc_words(i64 1)
  %t5586 = ptrtoint ptr %t5585 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-rtd" to i64), ptr %t5585
  %t5587 = or i64 %t5586, 4
  %t5588 = call i64 @rt_root(i64 %t5587)
  store i64 %t5588, ptr @"emit.internal:%port-rtd"
  ret i64 17
}

define i64 @"emit.internal:__init_101"() {
entry:
  %t5615 = call ptr @rt_alloc_words(i64 1)
  %t5616 = ptrtoint ptr %t5615 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%make-port" to i64), ptr %t5615
  %t5617 = or i64 %t5616, 4
  %t5618 = call i64 @rt_root(i64 %t5617)
  store i64 %t5618, ptr @"emit.internal:%make-port"
  ret i64 17
}

define i64 @"emit.internal:__init_102"() {
entry:
  %t5624 = call ptr @rt_alloc_words(i64 1)
  %t5625 = ptrtoint ptr %t5624 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-buf" to i64), ptr %t5624
  %t5626 = or i64 %t5625, 4
  %t5627 = call i64 @rt_root(i64 %t5626)
  store i64 %t5627, ptr @"emit.internal:%port-buf"
  ret i64 17
}

define i64 @"emit.internal:__init"() {
entry:
  %f = load i64, ptr @"emit.internal:__inited"
  %c = icmp ne i64 %f, 0
  br i1 %c, label %already, label %run
already:
  ret i64 2
run:
  store i64 8, ptr @"emit.internal:__inited"
  call i64 @"emit.internal:__init_1"()
  call i64 @"emit.internal:__init_2"()
  call i64 @"emit.internal:__init_3"()
  call i64 @"emit.internal:__init_4"()
  call i64 @"emit.internal:__init_5"()
  call i64 @"emit.internal:__init_6"()
  call i64 @"emit.internal:__init_7"()
  call i64 @"emit.internal:__init_8"()
  call i64 @"emit.internal:__init_9"()
  call i64 @"emit.internal:__init_10"()
  call i64 @"emit.internal:__init_11"()
  call i64 @"emit.internal:__init_12"()
  call i64 @"emit.internal:__init_13"()
  call i64 @"emit.internal:__init_14"()
  call i64 @"emit.internal:__init_15"()
  call i64 @"emit.internal:__init_16"()
  call i64 @"emit.internal:__init_17"()
  call i64 @"emit.internal:__init_18"()
  call i64 @"emit.internal:__init_19"()
  call i64 @"emit.internal:__init_20"()
  call i64 @"emit.internal:__init_21"()
  call i64 @"emit.internal:__init_22"()
  call i64 @"emit.internal:__init_23"()
  call i64 @"emit.internal:__init_24"()
  call i64 @"emit.internal:__init_25"()
  call i64 @"emit.internal:__init_26"()
  call i64 @"emit.internal:__init_27"()
  call i64 @"emit.internal:__init_28"()
  call i64 @"emit.internal:__init_29"()
  call i64 @"emit.internal:__init_30"()
  call i64 @"emit.internal:__init_31"()
  call i64 @"emit.internal:__init_32"()
  call i64 @"emit.internal:__init_33"()
  call i64 @"emit.internal:__init_34"()
  call i64 @"emit.internal:__init_35"()
  call i64 @"emit.internal:__init_36"()
  call i64 @"emit.internal:__init_37"()
  call i64 @"emit.internal:__init_38"()
  call i64 @"emit.internal:__init_39"()
  call i64 @"emit.internal:__init_40"()
  call i64 @"emit.internal:__init_41"()
  call i64 @"emit.internal:__init_42"()
  call i64 @"emit.internal:__init_43"()
  call i64 @"emit.internal:__init_44"()
  call i64 @"emit.internal:__init_45"()
  call i64 @"emit.internal:__init_46"()
  call i64 @"emit.internal:__init_47"()
  call i64 @"emit.internal:__init_48"()
  call i64 @"emit.internal:__init_49"()
  call i64 @"emit.internal:__init_50"()
  call i64 @"emit.internal:__init_51"()
  call i64 @"emit.internal:__init_52"()
  call i64 @"emit.internal:__init_53"()
  call i64 @"emit.internal:__init_54"()
  call i64 @"emit.internal:__init_55"()
  call i64 @"emit.internal:__init_56"()
  call i64 @"emit.internal:__init_57"()
  call i64 @"emit.internal:__init_58"()
  call i64 @"emit.internal:__init_59"()
  call i64 @"emit.internal:__init_60"()
  call i64 @"emit.internal:__init_61"()
  call i64 @"emit.internal:__init_62"()
  call i64 @"emit.internal:__init_63"()
  call i64 @"emit.internal:__init_64"()
  call i64 @"emit.internal:__init_65"()
  call i64 @"emit.internal:__init_66"()
  call i64 @"emit.internal:__init_67"()
  call i64 @"emit.internal:__init_68"()
  call i64 @"emit.internal:__init_69"()
  call i64 @"emit.internal:__init_70"()
  call i64 @"emit.internal:__init_71"()
  call i64 @"emit.internal:__init_72"()
  call i64 @"emit.internal:__init_73"()
  call i64 @"emit.internal:__init_74"()
  call i64 @"emit.internal:__init_75"()
  call i64 @"emit.internal:__init_76"()
  call i64 @"emit.internal:__init_77"()
  call i64 @"emit.internal:__init_78"()
  call i64 @"emit.internal:__init_79"()
  call i64 @"emit.internal:__init_80"()
  call i64 @"emit.internal:__init_81"()
  call i64 @"emit.internal:__init_82"()
  call i64 @"emit.internal:__init_83"()
  call i64 @"emit.internal:__init_84"()
  call i64 @"emit.internal:__init_85"()
  call i64 @"emit.internal:__init_86"()
  call i64 @"emit.internal:__init_87"()
  call i64 @"emit.internal:__init_88"()
  call i64 @"emit.internal:__init_89"()
  call i64 @"emit.internal:__init_90"()
  call i64 @"emit.internal:__init_91"()
  call i64 @"emit.internal:__init_92"()
  call i64 @"emit.internal:__init_93"()
  call i64 @"emit.internal:__init_94"()
  call i64 @"emit.internal:__init_95"()
  call i64 @"emit.internal:__init_96"()
  call i64 @"emit.internal:__init_97"()
  call i64 @"emit.internal:__init_98"()
  call i64 @"emit.internal:__init_99"()
  call i64 @"emit.internal:__init_100"()
  call i64 @"emit.internal:__init_101"()
  call i64 @"emit.internal:__init_102"()
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

