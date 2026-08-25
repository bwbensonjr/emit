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
@"emit.internal:cadddr" = global i64 0
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

define fastcc i64 @"emit.internal:code_31"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  %t152 = musttail call fastcc i64 @"emit.internal:code_31"(i64 %self, i64 2, i64 %t143, i64 %t151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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
  store i64 ptrtoint (ptr @"emit.internal:code_31" to i64), ptr %t154
  %t156 = or i64 %t155, 4
  %t157 = getelementptr i64, ptr %t154, i64 1
  store i64 %t156, ptr %t157
  %t158 = musttail call fastcc i64 @"emit.internal:code_31"(i64 %t156, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t158
}

define fastcc i64 @"emit.internal:code_38"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  %t169 = musttail call fastcc i64 @"emit.internal:code_38"(i64 %self, i64 2, i64 %t166, i64 %t168, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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
  store i64 ptrtoint (ptr @"emit.internal:code_38" to i64), ptr %t171
  %t173 = or i64 %t172, 4
  %t174 = getelementptr i64, ptr %t171, i64 1
  store i64 %t173, ptr %t174
  %t175 = musttail call fastcc i64 @"emit.internal:code_38"(i64 %t173, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t175
}

define fastcc i64 @"emit.internal:code:cadddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t180 = icmp eq i64 %argc, 1
  br i1 %t180, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok43:
  %t181 = load i64, ptr @"emit.internal:cdddr"
  call void @rt_check_callable(i64 %t181)
  %t182 = and i64 %t181, -8
  %t183 = inttoptr i64 %t182 to ptr
  %t184 = load i64, ptr %t183
  %t185 = inttoptr i64 %t184 to ptr
  %t186 = call fastcc i64%t185(i64 %t181, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t187 = call i64 @rt_car(i64 %t186)
  ret i64 %t187
}

define fastcc i64 @"emit.internal:code:%digit-in-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t192 = icmp eq i64 %argc, 2
  br i1 %t192, label %argok45, label %arityerr44
arityerr44:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok45:
  %t193 = call i64 @rt_char_to_integer(i64 %a0)
  %t194 = or i64 376, %t193
  %t195 = and i64 %t194, 7
  %t196 = icmp eq i64 %t195, 0
  br i1 %t196, label %fixfast46, label %fixslow47
fixfast46:
  %t197 = icmp slt i64 376, %t193
  %t198 = select i1 %t197, i64 257, i64 1
  br label %fixmerge48
fixslow47:
  %t199 = call i64 @rt_lt(i64 376, i64 %t193)
  br label %fixmerge48
fixmerge48:
  %t200 = phi i64 [ %t198, %fixfast46 ], [ %t199, %fixslow47 ]
  %t201 = icmp ne i64 %t200, 1
  br i1 %t201, label %then49, label %else50
then49:
  %t202 = or i64 %t193, 464
  %t203 = and i64 %t202, 7
  %t204 = icmp eq i64 %t203, 0
  br i1 %t204, label %fixfast52, label %fixslow53
fixfast52:
  %t205 = icmp slt i64 %t193, 464
  %t206 = select i1 %t205, i64 257, i64 1
  br label %fixmerge54
fixslow53:
  %t207 = call i64 @rt_lt(i64 %t193, i64 464)
  br label %fixmerge54
fixmerge54:
  %t208 = phi i64 [ %t206, %fixfast52 ], [ %t207, %fixslow53 ]
  br label %merge51
else50:
  br label %merge51
merge51:
  %t209 = phi i64 [ %t208, %fixmerge54 ], [ 1, %else50 ]
  %t210 = icmp ne i64 %t209, 1
  br i1 %t210, label %then55, label %else56
then55:
  %t211 = or i64 %t193, 384
  %t212 = and i64 %t211, 7
  %t213 = icmp eq i64 %t212, 0
  br i1 %t213, label %fixfast58, label %fixslow59
fixfast58:
  %t214 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t193, i64 384)
  %t215 = extractvalue {i64, i1} %t214, 0
  %t216 = extractvalue {i64, i1} %t214, 1
  br i1 %t216, label %fixslow59, label %fixmerge60
fixslow59:
  %t217 = call i64 @rt_sub(i64 %t193, i64 384)
  br label %fixmerge60
fixmerge60:
  %t218 = phi i64 [ %t215, %fixfast58 ], [ %t217, %fixslow59 ]
  br label %merge57
else56:
  %t219 = or i64 768, %t193
  %t220 = and i64 %t219, 7
  %t221 = icmp eq i64 %t220, 0
  br i1 %t221, label %fixfast61, label %fixslow62
fixfast61:
  %t222 = icmp slt i64 768, %t193
  %t223 = select i1 %t222, i64 257, i64 1
  br label %fixmerge63
fixslow62:
  %t224 = call i64 @rt_lt(i64 768, i64 %t193)
  br label %fixmerge63
fixmerge63:
  %t225 = phi i64 [ %t223, %fixfast61 ], [ %t224, %fixslow62 ]
  %t226 = icmp ne i64 %t225, 1
  br i1 %t226, label %then64, label %else65
then64:
  %t227 = or i64 %t193, 984
  %t228 = and i64 %t227, 7
  %t229 = icmp eq i64 %t228, 0
  br i1 %t229, label %fixfast67, label %fixslow68
fixfast67:
  %t230 = icmp slt i64 %t193, 984
  %t231 = select i1 %t230, i64 257, i64 1
  br label %fixmerge69
fixslow68:
  %t232 = call i64 @rt_lt(i64 %t193, i64 984)
  br label %fixmerge69
fixmerge69:
  %t233 = phi i64 [ %t231, %fixfast67 ], [ %t232, %fixslow68 ]
  br label %merge66
else65:
  br label %merge66
merge66:
  %t234 = phi i64 [ %t233, %fixmerge69 ], [ 1, %else65 ]
  %t235 = icmp ne i64 %t234, 1
  br i1 %t235, label %then70, label %else71
then70:
  %t236 = or i64 %t193, 696
  %t237 = and i64 %t236, 7
  %t238 = icmp eq i64 %t237, 0
  br i1 %t238, label %fixfast73, label %fixslow74
fixfast73:
  %t239 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t193, i64 696)
  %t240 = extractvalue {i64, i1} %t239, 0
  %t241 = extractvalue {i64, i1} %t239, 1
  br i1 %t241, label %fixslow74, label %fixmerge75
fixslow74:
  %t242 = call i64 @rt_sub(i64 %t193, i64 696)
  br label %fixmerge75
fixmerge75:
  %t243 = phi i64 [ %t240, %fixfast73 ], [ %t242, %fixslow74 ]
  br label %merge72
else71:
  %t244 = or i64 512, %t193
  %t245 = and i64 %t244, 7
  %t246 = icmp eq i64 %t245, 0
  br i1 %t246, label %fixfast76, label %fixslow77
fixfast76:
  %t247 = icmp slt i64 512, %t193
  %t248 = select i1 %t247, i64 257, i64 1
  br label %fixmerge78
fixslow77:
  %t249 = call i64 @rt_lt(i64 512, i64 %t193)
  br label %fixmerge78
fixmerge78:
  %t250 = phi i64 [ %t248, %fixfast76 ], [ %t249, %fixslow77 ]
  %t251 = icmp ne i64 %t250, 1
  br i1 %t251, label %then79, label %else80
then79:
  %t252 = or i64 %t193, 728
  %t253 = and i64 %t252, 7
  %t254 = icmp eq i64 %t253, 0
  br i1 %t254, label %fixfast82, label %fixslow83
fixfast82:
  %t255 = icmp slt i64 %t193, 728
  %t256 = select i1 %t255, i64 257, i64 1
  br label %fixmerge84
fixslow83:
  %t257 = call i64 @rt_lt(i64 %t193, i64 728)
  br label %fixmerge84
fixmerge84:
  %t258 = phi i64 [ %t256, %fixfast82 ], [ %t257, %fixslow83 ]
  br label %merge81
else80:
  br label %merge81
merge81:
  %t259 = phi i64 [ %t258, %fixmerge84 ], [ 1, %else80 ]
  %t260 = icmp ne i64 %t259, 1
  br i1 %t260, label %then85, label %else86
then85:
  %t261 = or i64 %t193, 440
  %t262 = and i64 %t261, 7
  %t263 = icmp eq i64 %t262, 0
  br i1 %t263, label %fixfast88, label %fixslow89
fixfast88:
  %t264 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t193, i64 440)
  %t265 = extractvalue {i64, i1} %t264, 0
  %t266 = extractvalue {i64, i1} %t264, 1
  br i1 %t266, label %fixslow89, label %fixmerge90
fixslow89:
  %t267 = call i64 @rt_sub(i64 %t193, i64 440)
  br label %fixmerge90
fixmerge90:
  %t268 = phi i64 [ %t265, %fixfast88 ], [ %t267, %fixslow89 ]
  br label %merge87
else86:
  br label %merge87
merge87:
  %t269 = phi i64 [ %t268, %fixmerge90 ], [ 792, %else86 ]
  br label %merge72
merge72:
  %t270 = phi i64 [ %t243, %fixmerge75 ], [ %t269, %merge87 ]
  br label %merge57
merge57:
  %t271 = phi i64 [ %t218, %fixmerge60 ], [ %t270, %merge72 ]
  %t272 = or i64 %t271, %a1
  %t273 = and i64 %t272, 7
  %t274 = icmp eq i64 %t273, 0
  br i1 %t274, label %fixfast91, label %fixslow92
fixfast91:
  %t275 = icmp slt i64 %t271, %a1
  %t276 = select i1 %t275, i64 257, i64 1
  br label %fixmerge93
fixslow92:
  %t277 = call i64 @rt_lt(i64 %t271, i64 %a1)
  br label %fixmerge93
fixmerge93:
  %t278 = phi i64 [ %t276, %fixfast91 ], [ %t277, %fixslow92 ]
  %t279 = icmp ne i64 %t278, 1
  br i1 %t279, label %then94, label %else95
then94:
  ret i64 %t271
else95:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:%radix-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t284 = icmp eq i64 %argc, 5
  br i1 %t284, label %argok97, label %arityerr96
arityerr96:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok97:
  %t285 = or i64 %a1, %a2
  %t286 = and i64 %t285, 7
  %t287 = icmp eq i64 %t286, 0
  br i1 %t287, label %fixfast98, label %fixslow99
fixfast98:
  %t288 = icmp slt i64 %a1, %a2
  %t289 = select i1 %t288, i64 257, i64 1
  br label %fixmerge100
fixslow99:
  %t290 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge100
fixmerge100:
  %t291 = phi i64 [ %t289, %fixfast98 ], [ %t290, %fixslow99 ]
  %t292 = icmp ne i64 %t291, 1
  br i1 %t292, label %then101, label %else102
then101:
  %t293 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t294 = load i64, ptr @"emit.internal:%digit-in-radix"
  call void @rt_check_callable(i64 %t294)
  %t295 = and i64 %t294, -8
  %t296 = inttoptr i64 %t295 to ptr
  %t297 = load i64, ptr %t296
  %t298 = inttoptr i64 %t297 to ptr
  %t299 = call fastcc i64%t298(i64 %t294, i64 2, i64 %t293, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t300 = icmp ne i64 %t299, 1
  br i1 %t300, label %then103, label %else104
then103:
  %t301 = or i64 %a1, 8
  %t302 = and i64 %t301, 7
  %t303 = icmp eq i64 %t302, 0
  br i1 %t303, label %fixfast105, label %fixslow106
fixfast105:
  %t304 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t305 = extractvalue {i64, i1} %t304, 0
  %t306 = extractvalue {i64, i1} %t304, 1
  br i1 %t306, label %fixslow106, label %fixmerge107
fixslow106:
  %t307 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge107
fixmerge107:
  %t308 = phi i64 [ %t305, %fixfast105 ], [ %t307, %fixslow106 ]
  %t309 = or i64 %a4, %a3
  %t310 = and i64 %t309, 7
  %t311 = icmp eq i64 %t310, 0
  br i1 %t311, label %fixfast108, label %fixslow109
fixfast108:
  %t312 = ashr i64 %a4, 3
  %t313 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t312, i64 %a3)
  %t314 = extractvalue {i64, i1} %t313, 0
  %t315 = extractvalue {i64, i1} %t313, 1
  br i1 %t315, label %fixslow109, label %fixmerge110
fixslow109:
  %t316 = call i64 @rt_mul(i64 %a4, i64 %a3)
  br label %fixmerge110
fixmerge110:
  %t317 = phi i64 [ %t314, %fixfast108 ], [ %t316, %fixslow109 ]
  %t318 = or i64 %t317, %t299
  %t319 = and i64 %t318, 7
  %t320 = icmp eq i64 %t319, 0
  br i1 %t320, label %fixfast111, label %fixslow112
fixfast111:
  %t321 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t317, i64 %t299)
  %t322 = extractvalue {i64, i1} %t321, 0
  %t323 = extractvalue {i64, i1} %t321, 1
  br i1 %t323, label %fixslow112, label %fixmerge113
fixslow112:
  %t324 = call i64 @rt_sub(i64 %t317, i64 %t299)
  br label %fixmerge113
fixmerge113:
  %t325 = phi i64 [ %t322, %fixfast111 ], [ %t324, %fixslow112 ]
  %t326 = load i64, ptr @"emit.internal:%radix-digits"
  call void @rt_check_callable(i64 %t326)
  %t327 = and i64 %t326, -8
  %t328 = inttoptr i64 %t327 to ptr
  %t329 = load i64, ptr %t328
  %t330 = inttoptr i64 %t329 to ptr
  %t331 = musttail call fastcc i64 %t330(i64 %t326, i64 5, i64 %a0, i64 %t308, i64 %a2, i64 %a3, i64 %t325, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t331
else104:
  ret i64 1
else102:
  ret i64 %a4
}

define fastcc i64 @"emit.internal:code:%string->int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t336 = icmp eq i64 %argc, 2
  br i1 %t336, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok115:
  %t337 = call i64 @rt_string_length(i64 %a0)
  %t338 = or i64 %t337, 0
  %t339 = and i64 %t338, 7
  %t340 = icmp eq i64 %t339, 0
  br i1 %t340, label %fixfast116, label %fixslow117
fixfast116:
  %t341 = icmp eq i64 %t337, 0
  %t342 = select i1 %t341, i64 257, i64 1
  br label %fixmerge118
fixslow117:
  %t343 = call i64 @rt_num_eq(i64 %t337, i64 0)
  br label %fixmerge118
fixmerge118:
  %t344 = phi i64 [ %t342, %fixfast116 ], [ %t343, %fixslow117 ]
  %t345 = icmp ne i64 %t344, 1
  br i1 %t345, label %then119, label %else120
then119:
  ret i64 1
else120:
  %t346 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t347 = call i64 @rt_char_to_integer(i64 %t346)
  %t348 = or i64 %t347, 360
  %t349 = and i64 %t348, 7
  %t350 = icmp eq i64 %t349, 0
  br i1 %t350, label %fixfast121, label %fixslow122
fixfast121:
  %t351 = icmp eq i64 %t347, 360
  %t352 = select i1 %t351, i64 257, i64 1
  br label %fixmerge123
fixslow122:
  %t353 = call i64 @rt_num_eq(i64 %t347, i64 360)
  br label %fixmerge123
fixmerge123:
  %t354 = phi i64 [ %t352, %fixfast121 ], [ %t353, %fixslow122 ]
  %t355 = icmp ne i64 %t354, 1
  br i1 %t355, label %then124, label %else125
then124:
  %t356 = or i64 8, %t337
  %t357 = and i64 %t356, 7
  %t358 = icmp eq i64 %t357, 0
  br i1 %t358, label %fixfast126, label %fixslow127
fixfast126:
  %t359 = icmp slt i64 8, %t337
  %t360 = select i1 %t359, i64 257, i64 1
  br label %fixmerge128
fixslow127:
  %t361 = call i64 @rt_lt(i64 8, i64 %t337)
  br label %fixmerge128
fixmerge128:
  %t362 = phi i64 [ %t360, %fixfast126 ], [ %t361, %fixslow127 ]
  %t363 = icmp ne i64 %t362, 1
  br i1 %t363, label %then129, label %else130
then129:
  %t364 = load i64, ptr @"emit.internal:%radix-digits"
  call void @rt_check_callable(i64 %t364)
  %t365 = and i64 %t364, -8
  %t366 = inttoptr i64 %t365 to ptr
  %t367 = load i64, ptr %t366
  %t368 = inttoptr i64 %t367 to ptr
  %t369 = musttail call fastcc i64 %t368(i64 %t364, i64 5, i64 %a0, i64 8, i64 %t337, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t369
else130:
  ret i64 1
else125:
  %t370 = or i64 %t347, 344
  %t371 = and i64 %t370, 7
  %t372 = icmp eq i64 %t371, 0
  br i1 %t372, label %fixfast131, label %fixslow132
fixfast131:
  %t373 = icmp eq i64 %t347, 344
  %t374 = select i1 %t373, i64 257, i64 1
  br label %fixmerge133
fixslow132:
  %t375 = call i64 @rt_num_eq(i64 %t347, i64 344)
  br label %fixmerge133
fixmerge133:
  %t376 = phi i64 [ %t374, %fixfast131 ], [ %t375, %fixslow132 ]
  %t377 = icmp ne i64 %t376, 1
  br i1 %t377, label %then134, label %else135
then134:
  br label %merge136
else135:
  br label %merge136
merge136:
  %t378 = phi i64 [ 8, %then134 ], [ 0, %else135 ]
  %t379 = or i64 %t378, %t337
  %t380 = and i64 %t379, 7
  %t381 = icmp eq i64 %t380, 0
  br i1 %t381, label %fixfast137, label %fixslow138
fixfast137:
  %t382 = icmp slt i64 %t378, %t337
  %t383 = select i1 %t382, i64 257, i64 1
  br label %fixmerge139
fixslow138:
  %t384 = call i64 @rt_lt(i64 %t378, i64 %t337)
  br label %fixmerge139
fixmerge139:
  %t385 = phi i64 [ %t383, %fixfast137 ], [ %t384, %fixslow138 ]
  %t386 = icmp ne i64 %t385, 1
  br i1 %t386, label %then140, label %else141
then140:
  %t387 = load i64, ptr @"emit.internal:%radix-digits"
  call void @rt_check_callable(i64 %t387)
  %t388 = and i64 %t387, -8
  %t389 = inttoptr i64 %t388 to ptr
  %t390 = load i64, ptr %t389
  %t391 = inttoptr i64 %t390 to ptr
  %t392 = call fastcc i64%t391(i64 %t387, i64 5, i64 %a0, i64 %t378, i64 %t337, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t393 = icmp ne i64 %t392, 1
  br i1 %t393, label %then142, label %else143
then142:
  %t394 = or i64 0, %t392
  %t395 = and i64 %t394, 7
  %t396 = icmp eq i64 %t395, 0
  br i1 %t396, label %fixfast144, label %fixslow145
fixfast144:
  %t397 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t392)
  %t398 = extractvalue {i64, i1} %t397, 0
  %t399 = extractvalue {i64, i1} %t397, 1
  br i1 %t399, label %fixslow145, label %fixmerge146
fixslow145:
  %t400 = call i64 @rt_sub(i64 0, i64 %t392)
  br label %fixmerge146
fixmerge146:
  %t401 = phi i64 [ %t398, %fixfast144 ], [ %t400, %fixslow145 ]
  ret i64 %t401
else143:
  ret i64 1
else141:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_119"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t406 = icmp eq i64 %argc, 2
  br i1 %t406, label %argok148, label %arityerr147
arityerr147:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok148:
  %t407 = call i64 @rt_null_p(i64 %a0)
  %t408 = icmp ne i64 %t407, 1
  br i1 %t408, label %then149, label %else150
then149:
  %t409 = and i64 %self, -8
  %t410 = inttoptr i64 %t409 to ptr
  %t411 = getelementptr i64, ptr %t410, i64 1
  %t412 = load i64, ptr %t411
  ret i64 %t412
else150:
  %t413 = and i64 %self, -8
  %t414 = inttoptr i64 %t413 to ptr
  %t415 = getelementptr i64, ptr %t414, i64 1
  %t416 = load i64, ptr %t415
  %t417 = call i64 @rt_car(i64 %a0)
  %t418 = call i64 @rt_vector_set(i64 %t416, i64 %a1, i64 %t417)
  %t419 = call i64 @rt_cdr(i64 %a0)
  %t420 = or i64 %a1, 8
  %t421 = and i64 %t420, 7
  %t422 = icmp eq i64 %t421, 0
  br i1 %t422, label %fixfast151, label %fixslow152
fixfast151:
  %t423 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t424 = extractvalue {i64, i1} %t423, 0
  %t425 = extractvalue {i64, i1} %t423, 1
  br i1 %t425, label %fixslow152, label %fixmerge153
fixslow152:
  %t426 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge153
fixmerge153:
  %t427 = phi i64 [ %t424, %fixfast151 ], [ %t426, %fixslow152 ]
  %t428 = musttail call fastcc i64 @"emit.internal:code_119"(i64 %self, i64 2, i64 %t419, i64 %t427, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t428
}

define fastcc i64 @"emit.internal:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t429 = icmp eq i64 %argc, 1
  br i1 %t429, label %argok155, label %arityerr154
arityerr154:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok155:
  %t430 = load i64, ptr @"emit.internal:length"
  call void @rt_check_callable(i64 %t430)
  %t431 = and i64 %t430, -8
  %t432 = inttoptr i64 %t431 to ptr
  %t433 = load i64, ptr %t432
  %t434 = inttoptr i64 %t433 to ptr
  %t435 = call fastcc i64%t434(i64 %t430, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t436 = call i64 @rt_make_vector(i64 %t435, i64 0)
  %t437 = call ptr @rt_alloc_words(i64 3)
  %t438 = ptrtoint ptr %t437 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_119" to i64), ptr %t437
  %t439 = or i64 %t438, 4
  %t440 = getelementptr i64, ptr %t437, i64 1
  store i64 %t436, ptr %t440
  %t441 = getelementptr i64, ptr %t437, i64 2
  store i64 %t439, ptr %t441
  %t442 = musttail call fastcc i64 @"emit.internal:code_119"(i64 %t439, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t442
}

define fastcc i64 @"emit.internal:code_127"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t447 = icmp eq i64 %argc, 2
  br i1 %t447, label %argok157, label %arityerr156
arityerr156:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok157:
  %t448 = call i64 @rt_null_p(i64 %a0)
  %t449 = icmp ne i64 %t448, 1
  br i1 %t449, label %then158, label %else159
then158:
  %t450 = and i64 %self, -8
  %t451 = inttoptr i64 %t450 to ptr
  %t452 = getelementptr i64, ptr %t451, i64 1
  %t453 = load i64, ptr %t452
  ret i64 %t453
else159:
  %t454 = and i64 %self, -8
  %t455 = inttoptr i64 %t454 to ptr
  %t456 = getelementptr i64, ptr %t455, i64 1
  %t457 = load i64, ptr %t456
  %t458 = call i64 @rt_car(i64 %a0)
  %t459 = call i64 @rt_bytevector_u8_set(i64 %t457, i64 %a1, i64 %t458)
  %t460 = call i64 @rt_cdr(i64 %a0)
  %t461 = or i64 %a1, 8
  %t462 = and i64 %t461, 7
  %t463 = icmp eq i64 %t462, 0
  br i1 %t463, label %fixfast160, label %fixslow161
fixfast160:
  %t464 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t465 = extractvalue {i64, i1} %t464, 0
  %t466 = extractvalue {i64, i1} %t464, 1
  br i1 %t466, label %fixslow161, label %fixmerge162
fixslow161:
  %t467 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge162
fixmerge162:
  %t468 = phi i64 [ %t465, %fixfast160 ], [ %t467, %fixslow161 ]
  %t469 = musttail call fastcc i64 @"emit.internal:code_127"(i64 %self, i64 2, i64 %t460, i64 %t468, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t469
}

define fastcc i64 @"emit.internal:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t470 = icmp eq i64 %argc, 1
  br i1 %t470, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok164:
  %t471 = load i64, ptr @"emit.internal:length"
  call void @rt_check_callable(i64 %t471)
  %t472 = and i64 %t471, -8
  %t473 = inttoptr i64 %t472 to ptr
  %t474 = load i64, ptr %t473
  %t475 = inttoptr i64 %t474 to ptr
  %t476 = call fastcc i64%t475(i64 %t471, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t477 = call i64 @rt_make_bytevector(i64 %t476, i64 0)
  %t478 = call ptr @rt_alloc_words(i64 3)
  %t479 = ptrtoint ptr %t478 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_127" to i64), ptr %t478
  %t480 = or i64 %t479, 4
  %t481 = getelementptr i64, ptr %t478, i64 1
  store i64 %t477, ptr %t481
  %t482 = getelementptr i64, ptr %t478, i64 2
  store i64 %t480, ptr %t482
  %t483 = musttail call fastcc i64 @"emit.internal:code_127"(i64 %t480, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t483
}

define fastcc i64 @"emit.internal:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t488 = icmp eq i64 %argc, 1
  br i1 %t488, label %argok166, label %arityerr165
arityerr165:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok166:
  %t489 = call i64 @rt_char_to_integer(i64 %a0)
  %t490 = or i64 %t489, 256
  %t491 = and i64 %t490, 7
  %t492 = icmp eq i64 %t491, 0
  br i1 %t492, label %fixfast167, label %fixslow168
fixfast167:
  %t493 = icmp eq i64 %t489, 256
  %t494 = select i1 %t493, i64 257, i64 1
  br label %fixmerge169
fixslow168:
  %t495 = call i64 @rt_num_eq(i64 %t489, i64 256)
  br label %fixmerge169
fixmerge169:
  %t496 = phi i64 [ %t494, %fixfast167 ], [ %t495, %fixslow168 ]
  %t497 = icmp ne i64 %t496, 1
  br i1 %t497, label %then170, label %else171
then170:
  ret i64 %t496
else171:
  %t498 = or i64 %t489, 72
  %t499 = and i64 %t498, 7
  %t500 = icmp eq i64 %t499, 0
  br i1 %t500, label %fixfast172, label %fixslow173
fixfast172:
  %t501 = icmp eq i64 %t489, 72
  %t502 = select i1 %t501, i64 257, i64 1
  br label %fixmerge174
fixslow173:
  %t503 = call i64 @rt_num_eq(i64 %t489, i64 72)
  br label %fixmerge174
fixmerge174:
  %t504 = phi i64 [ %t502, %fixfast172 ], [ %t503, %fixslow173 ]
  %t505 = icmp ne i64 %t504, 1
  br i1 %t505, label %then175, label %else176
then175:
  ret i64 %t504
else176:
  %t506 = or i64 %t489, 80
  %t507 = and i64 %t506, 7
  %t508 = icmp eq i64 %t507, 0
  br i1 %t508, label %fixfast177, label %fixslow178
fixfast177:
  %t509 = icmp eq i64 %t489, 80
  %t510 = select i1 %t509, i64 257, i64 1
  br label %fixmerge179
fixslow178:
  %t511 = call i64 @rt_num_eq(i64 %t489, i64 80)
  br label %fixmerge179
fixmerge179:
  %t512 = phi i64 [ %t510, %fixfast177 ], [ %t511, %fixslow178 ]
  %t513 = icmp ne i64 %t512, 1
  br i1 %t513, label %then180, label %else181
then180:
  ret i64 %t512
else181:
  %t514 = or i64 %t489, 104
  %t515 = and i64 %t514, 7
  %t516 = icmp eq i64 %t515, 0
  br i1 %t516, label %fixfast182, label %fixslow183
fixfast182:
  %t517 = icmp eq i64 %t489, 104
  %t518 = select i1 %t517, i64 257, i64 1
  br label %fixmerge184
fixslow183:
  %t519 = call i64 @rt_num_eq(i64 %t489, i64 104)
  br label %fixmerge184
fixmerge184:
  %t520 = phi i64 [ %t518, %fixfast182 ], [ %t519, %fixslow183 ]
  ret i64 %t520
}

define fastcc i64 @"emit.internal:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t525 = icmp eq i64 %argc, 1
  br i1 %t525, label %argok186, label %arityerr185
arityerr185:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok186:
  %t526 = call i64 @rt_char_to_integer(i64 %a0)
  %t527 = or i64 376, %t526
  %t528 = and i64 %t527, 7
  %t529 = icmp eq i64 %t528, 0
  br i1 %t529, label %fixfast187, label %fixslow188
fixfast187:
  %t530 = icmp slt i64 376, %t526
  %t531 = select i1 %t530, i64 257, i64 1
  br label %fixmerge189
fixslow188:
  %t532 = call i64 @rt_lt(i64 376, i64 %t526)
  br label %fixmerge189
fixmerge189:
  %t533 = phi i64 [ %t531, %fixfast187 ], [ %t532, %fixslow188 ]
  %t534 = icmp ne i64 %t533, 1
  br i1 %t534, label %then190, label %else191
then190:
  %t535 = or i64 %t526, 464
  %t536 = and i64 %t535, 7
  %t537 = icmp eq i64 %t536, 0
  br i1 %t537, label %fixfast192, label %fixslow193
fixfast192:
  %t538 = icmp slt i64 %t526, 464
  %t539 = select i1 %t538, i64 257, i64 1
  br label %fixmerge194
fixslow193:
  %t540 = call i64 @rt_lt(i64 %t526, i64 464)
  br label %fixmerge194
fixmerge194:
  %t541 = phi i64 [ %t539, %fixfast192 ], [ %t540, %fixslow193 ]
  ret i64 %t541
else191:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t546 = icmp eq i64 %argc, 1
  br i1 %t546, label %argok196, label %arityerr195
arityerr195:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok196:
  %t547 = call i64 @rt_char_to_integer(i64 %a0)
  %t548 = load i64, ptr @"emit.internal:rd-ws?"
  call void @rt_check_callable(i64 %t548)
  %t549 = and i64 %t548, -8
  %t550 = inttoptr i64 %t549 to ptr
  %t551 = load i64, ptr %t550
  %t552 = inttoptr i64 %t551 to ptr
  %t553 = call fastcc i64%t552(i64 %t548, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t554 = icmp ne i64 %t553, 1
  br i1 %t554, label %then197, label %else198
then197:
  ret i64 %t553
else198:
  %t555 = or i64 %t547, 320
  %t556 = and i64 %t555, 7
  %t557 = icmp eq i64 %t556, 0
  br i1 %t557, label %fixfast199, label %fixslow200
fixfast199:
  %t558 = icmp eq i64 %t547, 320
  %t559 = select i1 %t558, i64 257, i64 1
  br label %fixmerge201
fixslow200:
  %t560 = call i64 @rt_num_eq(i64 %t547, i64 320)
  br label %fixmerge201
fixmerge201:
  %t561 = phi i64 [ %t559, %fixfast199 ], [ %t560, %fixslow200 ]
  %t562 = icmp ne i64 %t561, 1
  br i1 %t562, label %then202, label %else203
then202:
  ret i64 %t561
else203:
  %t563 = or i64 %t547, 328
  %t564 = and i64 %t563, 7
  %t565 = icmp eq i64 %t564, 0
  br i1 %t565, label %fixfast204, label %fixslow205
fixfast204:
  %t566 = icmp eq i64 %t547, 328
  %t567 = select i1 %t566, i64 257, i64 1
  br label %fixmerge206
fixslow205:
  %t568 = call i64 @rt_num_eq(i64 %t547, i64 328)
  br label %fixmerge206
fixmerge206:
  %t569 = phi i64 [ %t567, %fixfast204 ], [ %t568, %fixslow205 ]
  %t570 = icmp ne i64 %t569, 1
  br i1 %t570, label %then207, label %else208
then207:
  ret i64 %t569
else208:
  %t571 = or i64 %t547, 728
  %t572 = and i64 %t571, 7
  %t573 = icmp eq i64 %t572, 0
  br i1 %t573, label %fixfast209, label %fixslow210
fixfast209:
  %t574 = icmp eq i64 %t547, 728
  %t575 = select i1 %t574, i64 257, i64 1
  br label %fixmerge211
fixslow210:
  %t576 = call i64 @rt_num_eq(i64 %t547, i64 728)
  br label %fixmerge211
fixmerge211:
  %t577 = phi i64 [ %t575, %fixfast209 ], [ %t576, %fixslow210 ]
  %t578 = icmp ne i64 %t577, 1
  br i1 %t578, label %then212, label %else213
then212:
  ret i64 %t577
else213:
  %t579 = or i64 %t547, 744
  %t580 = and i64 %t579, 7
  %t581 = icmp eq i64 %t580, 0
  br i1 %t581, label %fixfast214, label %fixslow215
fixfast214:
  %t582 = icmp eq i64 %t547, 744
  %t583 = select i1 %t582, i64 257, i64 1
  br label %fixmerge216
fixslow215:
  %t584 = call i64 @rt_num_eq(i64 %t547, i64 744)
  br label %fixmerge216
fixmerge216:
  %t585 = phi i64 [ %t583, %fixfast214 ], [ %t584, %fixslow215 ]
  %t586 = icmp ne i64 %t585, 1
  br i1 %t586, label %then217, label %else218
then217:
  ret i64 %t585
else218:
  %t587 = or i64 %t547, 272
  %t588 = and i64 %t587, 7
  %t589 = icmp eq i64 %t588, 0
  br i1 %t589, label %fixfast219, label %fixslow220
fixfast219:
  %t590 = icmp eq i64 %t547, 272
  %t591 = select i1 %t590, i64 257, i64 1
  br label %fixmerge221
fixslow220:
  %t592 = call i64 @rt_num_eq(i64 %t547, i64 272)
  br label %fixmerge221
fixmerge221:
  %t593 = phi i64 [ %t591, %fixfast219 ], [ %t592, %fixslow220 ]
  %t594 = icmp ne i64 %t593, 1
  br i1 %t594, label %then222, label %else223
then222:
  ret i64 %t593
else223:
  %t595 = or i64 %t547, 472
  %t596 = and i64 %t595, 7
  %t597 = icmp eq i64 %t596, 0
  br i1 %t597, label %fixfast224, label %fixslow225
fixfast224:
  %t598 = icmp eq i64 %t547, 472
  %t599 = select i1 %t598, i64 257, i64 1
  br label %fixmerge226
fixslow225:
  %t600 = call i64 @rt_num_eq(i64 %t547, i64 472)
  br label %fixmerge226
fixmerge226:
  %t601 = phi i64 [ %t599, %fixfast224 ], [ %t600, %fixslow225 ]
  ret i64 %t601
}

define fastcc i64 @"emit.internal:code:rd-fail-code"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t606 = icmp eq i64 %argc, 1
  br i1 %t606, label %argok228, label %arityerr227
arityerr227:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok228:
  %t607 = or i64 -24, %a0
  %t608 = and i64 %t607, 7
  %t609 = icmp eq i64 %t608, 0
  br i1 %t609, label %fixfast229, label %fixslow230
fixfast229:
  %t610 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 -24, i64 %a0)
  %t611 = extractvalue {i64, i1} %t610, 0
  %t612 = extractvalue {i64, i1} %t610, 1
  br i1 %t612, label %fixslow230, label %fixmerge231
fixslow230:
  %t613 = call i64 @rt_sub(i64 -24, i64 %a0)
  br label %fixmerge231
fixmerge231:
  %t614 = phi i64 [ %t611, %fixfast229 ], [ %t613, %fixslow230 ]
  ret i64 %t614
}

define fastcc i64 @"emit.internal:code:rd-fail?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t619 = icmp eq i64 %argc, 1
  br i1 %t619, label %argok233, label %arityerr232
arityerr232:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok233:
  %t620 = or i64 %a0, 0
  %t621 = and i64 %t620, 7
  %t622 = icmp eq i64 %t621, 0
  br i1 %t622, label %fixfast234, label %fixslow235
fixfast234:
  %t623 = icmp slt i64 %a0, 0
  %t624 = select i1 %t623, i64 257, i64 1
  br label %fixmerge236
fixslow235:
  %t625 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge236
fixmerge236:
  %t626 = phi i64 [ %t624, %fixfast234 ], [ %t625, %fixslow235 ]
  ret i64 %t626
}

define fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t631 = icmp eq i64 %argc, 1
  br i1 %t631, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok238:
  %t632 = or i64 0, %a0
  %t633 = and i64 %t632, 7
  %t634 = icmp eq i64 %t633, 0
  br i1 %t634, label %fixfast239, label %fixslow240
fixfast239:
  %t635 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t636 = extractvalue {i64, i1} %t635, 0
  %t637 = extractvalue {i64, i1} %t635, 1
  br i1 %t637, label %fixslow240, label %fixmerge241
fixslow240:
  %t638 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge241
fixmerge241:
  %t639 = phi i64 [ %t636, %fixfast239 ], [ %t638, %fixslow240 ]
  %t640 = or i64 %t639, 24
  %t641 = and i64 %t640, 7
  %t642 = icmp eq i64 %t641, 0
  br i1 %t642, label %fixfast242, label %fixslow243
fixfast242:
  %t643 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t639, i64 24)
  %t644 = extractvalue {i64, i1} %t643, 0
  %t645 = extractvalue {i64, i1} %t643, 1
  br i1 %t645, label %fixslow243, label %fixmerge244
fixslow243:
  %t646 = call i64 @rt_sub(i64 %t639, i64 24)
  br label %fixmerge244
fixmerge244:
  %t647 = phi i64 [ %t644, %fixfast242 ], [ %t646, %fixslow243 ]
  ret i64 %t647
}

define fastcc i64 @"emit.internal:code:rd-fail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t652 = icmp eq i64 %argc, 2
  br i1 %t652, label %argok246, label %arityerr245
arityerr245:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok246:
  %t653 = load i64, ptr @"emit.internal:rd-fail-code"
  call void @rt_check_callable(i64 %t653)
  %t654 = and i64 %t653, -8
  %t655 = inttoptr i64 %t654 to ptr
  %t656 = load i64, ptr %t655
  %t657 = inttoptr i64 %t656 to ptr
  %t658 = call fastcc i64%t657(i64 %t653, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t659 = call i64 @rt_cons(i64 %a0, i64 %t658)
  ret i64 %t659
}

define fastcc i64 @"emit.internal:code:rd-state"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t664 = icmp eq i64 %argc, 1
  br i1 %t664, label %argok248, label %arityerr247
arityerr247:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok248:
  %t665 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t665)
  %t666 = and i64 %t665, -8
  %t667 = inttoptr i64 %t666 to ptr
  %t668 = load i64, ptr %t667
  %t669 = inttoptr i64 %t668 to ptr
  %t670 = call fastcc i64%t669(i64 %t665, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t671 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t671)
  %t672 = and i64 %t671, -8
  %t673 = inttoptr i64 %t672 to ptr
  %t674 = load i64, ptr %t673
  %t675 = inttoptr i64 %t674 to ptr
  %t676 = call fastcc i64%t675(i64 %t671, i64 1, i64 %t670, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t677 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t677)
  %t678 = and i64 %t677, -8
  %t679 = inttoptr i64 %t678 to ptr
  %t680 = load i64, ptr %t679
  %t681 = inttoptr i64 %t680 to ptr
  %t682 = call fastcc i64%t681(i64 %t677, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t683 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t683)
  %t684 = and i64 %t683, -8
  %t685 = inttoptr i64 %t684 to ptr
  %t686 = load i64, ptr %t685
  %t687 = inttoptr i64 %t686 to ptr
  %t688 = call fastcc i64%t687(i64 %t683, i64 1, i64 %t682, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t689 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t689)
  %t690 = and i64 %t689, -8
  %t691 = inttoptr i64 %t690 to ptr
  %t692 = load i64, ptr %t691
  %t693 = inttoptr i64 %t692 to ptr
  %t694 = call fastcc i64%t693(i64 %t689, i64 3, i64 %t676, i64 2, i64 %t688, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t695 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t695)
  %t696 = and i64 %t695, -8
  %t697 = inttoptr i64 %t696 to ptr
  %t698 = load i64, ptr %t697
  %t699 = inttoptr i64 %t698 to ptr
  %t700 = musttail call fastcc i64 %t699(i64 %t695, i64 1, i64 %t694, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t700
}

define fastcc i64 @"emit.internal:code:rd-state-from-cell"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t705 = icmp eq i64 %argc, 1
  br i1 %t705, label %argok250, label %arityerr249
arityerr249:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok250:
  %t706 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t706)
  %t707 = and i64 %t706, -8
  %t708 = inttoptr i64 %t707 to ptr
  %t709 = load i64, ptr %t708
  %t710 = inttoptr i64 %t709 to ptr
  %t711 = call fastcc i64%t710(i64 %t706, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t712 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t712)
  %t713 = and i64 %t712, -8
  %t714 = inttoptr i64 %t713 to ptr
  %t715 = load i64, ptr %t714
  %t716 = inttoptr i64 %t715 to ptr
  %t717 = call fastcc i64%t716(i64 %t712, i64 1, i64 %t711, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t718 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t718)
  %t719 = and i64 %t718, -8
  %t720 = inttoptr i64 %t719 to ptr
  %t721 = load i64, ptr %t720
  %t722 = inttoptr i64 %t721 to ptr
  %t723 = call fastcc i64%t722(i64 %t718, i64 3, i64 %a0, i64 2, i64 %t717, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t724 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t724)
  %t725 = and i64 %t724, -8
  %t726 = inttoptr i64 %t725 to ptr
  %t727 = load i64, ptr %t726
  %t728 = inttoptr i64 %t727 to ptr
  %t729 = musttail call fastcc i64 %t728(i64 %t724, i64 1, i64 %t723, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t729
}

define fastcc i64 @"emit.internal:code:rd-state-child"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t734 = icmp eq i64 %argc, 1
  br i1 %t734, label %argok252, label %arityerr251
arityerr251:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok252:
  %t735 = call i64 @rt_vector_ref(i64 %a0, i64 0)
  %t736 = load i64, ptr @"emit.internal:rd-state-from-cell"
  call void @rt_check_callable(i64 %t736)
  %t737 = and i64 %t736, -8
  %t738 = inttoptr i64 %t737 to ptr
  %t739 = load i64, ptr %t738
  %t740 = inttoptr i64 %t739 to ptr
  %t741 = musttail call fastcc i64 %t740(i64 %t736, i64 1, i64 %t735, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t741
}

define fastcc i64 @"emit.internal:code:rd-fold?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t746 = icmp eq i64 %argc, 1
  br i1 %t746, label %argok254, label %arityerr253
arityerr253:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok254:
  %t747 = call i64 @rt_vector_ref(i64 %a0, i64 0)
  %t748 = call i64 @rt_vector_ref(i64 %t747, i64 0)
  ret i64 %t748
}

define fastcc i64 @"emit.internal:code:rd-set-fold!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t753 = icmp eq i64 %argc, 2
  br i1 %t753, label %argok256, label %arityerr255
arityerr255:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok256:
  %t754 = call i64 @rt_vector_ref(i64 %a0, i64 0)
  %t755 = call i64 @rt_vector_set(i64 %t754, i64 0, i64 %a1)
  ret i64 %t755
}

define fastcc i64 @"emit.internal:code_248"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t760 = icmp eq i64 %argc, 1
  br i1 %t760, label %argok258, label %arityerr257
arityerr257:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok258:
  %t761 = and i64 %self, -8
  %t762 = inttoptr i64 %t761 to ptr
  %t763 = getelementptr i64, ptr %t762, i64 1
  %t764 = load i64, ptr %t763
  %t765 = or i64 %a0, %t764
  %t766 = and i64 %t765, 7
  %t767 = icmp eq i64 %t766, 0
  br i1 %t767, label %fixfast259, label %fixslow260
fixfast259:
  %t768 = icmp eq i64 %a0, %t764
  %t769 = select i1 %t768, i64 257, i64 1
  br label %fixmerge261
fixslow260:
  %t770 = call i64 @rt_num_eq(i64 %a0, i64 %t764)
  br label %fixmerge261
fixmerge261:
  %t771 = phi i64 [ %t769, %fixfast259 ], [ %t770, %fixslow260 ]
  %t772 = icmp ne i64 %t771, 1
  br i1 %t772, label %then262, label %else263
then262:
  ret i64 257
else263:
  %t773 = and i64 %self, -8
  %t774 = inttoptr i64 %t773 to ptr
  %t775 = getelementptr i64, ptr %t774, i64 2
  %t776 = load i64, ptr %t775
  %t777 = and i64 %self, -8
  %t778 = inttoptr i64 %t777 to ptr
  %t779 = getelementptr i64, ptr %t778, i64 3
  %t780 = load i64, ptr %t779
  %t781 = or i64 %t780, %a0
  %t782 = and i64 %t781, 7
  %t783 = icmp eq i64 %t782, 0
  br i1 %t783, label %fixfast264, label %fixslow265
fixfast264:
  %t784 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t780, i64 %a0)
  %t785 = extractvalue {i64, i1} %t784, 0
  %t786 = extractvalue {i64, i1} %t784, 1
  br i1 %t786, label %fixslow265, label %fixmerge266
fixslow265:
  %t787 = call i64 @rt_add(i64 %t780, i64 %a0)
  br label %fixmerge266
fixmerge266:
  %t788 = phi i64 [ %t785, %fixfast264 ], [ %t787, %fixslow265 ]
  %t789 = call i64 @rt_string_ref(i64 %t776, i64 %t788)
  %t790 = call i64 @rt_char_to_integer(i64 %t789)
  %t791 = and i64 %self, -8
  %t792 = inttoptr i64 %t791 to ptr
  %t793 = getelementptr i64, ptr %t792, i64 4
  %t794 = load i64, ptr %t793
  %t795 = call i64 @rt_string_ref(i64 %t794, i64 %a0)
  %t796 = call i64 @rt_char_to_integer(i64 %t795)
  %t797 = or i64 %t790, %t796
  %t798 = and i64 %t797, 7
  %t799 = icmp eq i64 %t798, 0
  br i1 %t799, label %fixfast267, label %fixslow268
fixfast267:
  %t800 = icmp eq i64 %t790, %t796
  %t801 = select i1 %t800, i64 257, i64 1
  br label %fixmerge269
fixslow268:
  %t802 = call i64 @rt_num_eq(i64 %t790, i64 %t796)
  br label %fixmerge269
fixmerge269:
  %t803 = phi i64 [ %t801, %fixfast267 ], [ %t802, %fixslow268 ]
  %t804 = icmp ne i64 %t803, 1
  br i1 %t804, label %then270, label %else271
then270:
  %t805 = or i64 %a0, 8
  %t806 = and i64 %t805, 7
  %t807 = icmp eq i64 %t806, 0
  br i1 %t807, label %fixfast272, label %fixslow273
fixfast272:
  %t808 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t809 = extractvalue {i64, i1} %t808, 0
  %t810 = extractvalue {i64, i1} %t808, 1
  br i1 %t810, label %fixslow273, label %fixmerge274
fixslow273:
  %t811 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge274
fixmerge274:
  %t812 = phi i64 [ %t809, %fixfast272 ], [ %t811, %fixslow273 ]
  %t813 = musttail call fastcc i64 @"emit.internal:code_248"(i64 %self, i64 1, i64 %t812, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t813
else271:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-match-at?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t814 = icmp eq i64 %argc, 4
  br i1 %t814, label %argok276, label %arityerr275
arityerr275:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok276:
  %t815 = call i64 @rt_string_length(i64 %a3)
  %t816 = or i64 %a2, %t815
  %t817 = and i64 %t816, 7
  %t818 = icmp eq i64 %t817, 0
  br i1 %t818, label %fixfast277, label %fixslow278
fixfast277:
  %t819 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 %t815)
  %t820 = extractvalue {i64, i1} %t819, 0
  %t821 = extractvalue {i64, i1} %t819, 1
  br i1 %t821, label %fixslow278, label %fixmerge279
fixslow278:
  %t822 = call i64 @rt_add(i64 %a2, i64 %t815)
  br label %fixmerge279
fixmerge279:
  %t823 = phi i64 [ %t820, %fixfast277 ], [ %t822, %fixslow278 ]
  %t824 = or i64 %t823, %a1
  %t825 = and i64 %t824, 7
  %t826 = icmp eq i64 %t825, 0
  br i1 %t826, label %fixfast280, label %fixslow281
fixfast280:
  %t827 = icmp slt i64 %t823, %a1
  %t828 = select i1 %t827, i64 257, i64 1
  br label %fixmerge282
fixslow281:
  %t829 = call i64 @rt_lt(i64 %t823, i64 %a1)
  br label %fixmerge282
fixmerge282:
  %t830 = phi i64 [ %t828, %fixfast280 ], [ %t829, %fixslow281 ]
  %t831 = icmp ne i64 %t830, 1
  br i1 %t831, label %then283, label %else284
then283:
  br label %merge285
else284:
  %t832 = or i64 %t823, %a1
  %t833 = and i64 %t832, 7
  %t834 = icmp eq i64 %t833, 0
  br i1 %t834, label %fixfast286, label %fixslow287
fixfast286:
  %t835 = icmp eq i64 %t823, %a1
  %t836 = select i1 %t835, i64 257, i64 1
  br label %fixmerge288
fixslow287:
  %t837 = call i64 @rt_num_eq(i64 %t823, i64 %a1)
  br label %fixmerge288
fixmerge288:
  %t838 = phi i64 [ %t836, %fixfast286 ], [ %t837, %fixslow287 ]
  br label %merge285
merge285:
  %t839 = phi i64 [ 257, %then283 ], [ %t838, %fixmerge288 ]
  %t840 = icmp ne i64 %t839, 1
  br i1 %t840, label %then289, label %else290
then289:
  %t841 = call ptr @rt_alloc_words(i64 6)
  %t842 = ptrtoint ptr %t841 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_248" to i64), ptr %t841
  %t843 = or i64 %t842, 4
  %t844 = getelementptr i64, ptr %t841, i64 1
  store i64 %t815, ptr %t844
  %t845 = getelementptr i64, ptr %t841, i64 2
  store i64 %a0, ptr %t845
  %t846 = getelementptr i64, ptr %t841, i64 3
  store i64 %a2, ptr %t846
  %t847 = getelementptr i64, ptr %t841, i64 4
  store i64 %a3, ptr %t847
  %t848 = getelementptr i64, ptr %t841, i64 5
  store i64 %t843, ptr %t848
  %t849 = musttail call fastcc i64 @"emit.internal:code_248"(i64 %t843, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t849
else290:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-directive-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t854 = icmp eq i64 %argc, 4
  br i1 %t854, label %argok292, label %arityerr291
arityerr291:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok292:
  %t855 = call i64 @rt_string_length(i64 %a3)
  %t856 = or i64 %a2, %t855
  %t857 = and i64 %t856, 7
  %t858 = icmp eq i64 %t857, 0
  br i1 %t858, label %fixfast293, label %fixslow294
fixfast293:
  %t859 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 %t855)
  %t860 = extractvalue {i64, i1} %t859, 0
  %t861 = extractvalue {i64, i1} %t859, 1
  br i1 %t861, label %fixslow294, label %fixmerge295
fixslow294:
  %t862 = call i64 @rt_add(i64 %a2, i64 %t855)
  br label %fixmerge295
fixmerge295:
  %t863 = phi i64 [ %t860, %fixfast293 ], [ %t862, %fixslow294 ]
  %t864 = load i64, ptr @"emit.internal:rd-match-at?"
  call void @rt_check_callable(i64 %t864)
  %t865 = and i64 %t864, -8
  %t866 = inttoptr i64 %t865 to ptr
  %t867 = load i64, ptr %t866
  %t868 = inttoptr i64 %t867 to ptr
  %t869 = call fastcc i64%t868(i64 %t864, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t870 = icmp ne i64 %t869, 1
  br i1 %t870, label %then296, label %else297
then296:
  %t871 = or i64 %t863, %a1
  %t872 = and i64 %t871, 7
  %t873 = icmp eq i64 %t872, 0
  br i1 %t873, label %fixfast298, label %fixslow299
fixfast298:
  %t874 = icmp eq i64 %t863, %a1
  %t875 = select i1 %t874, i64 257, i64 1
  br label %fixmerge300
fixslow299:
  %t876 = call i64 @rt_num_eq(i64 %t863, i64 %a1)
  br label %fixmerge300
fixmerge300:
  %t877 = phi i64 [ %t875, %fixfast298 ], [ %t876, %fixslow299 ]
  %t878 = icmp ne i64 %t877, 1
  br i1 %t878, label %then301, label %else302
then301:
  br label %merge303
else302:
  %t879 = call i64 @rt_string_ref(i64 %a0, i64 %t863)
  %t880 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t880)
  %t881 = and i64 %t880, -8
  %t882 = inttoptr i64 %t881 to ptr
  %t883 = load i64, ptr %t882
  %t884 = inttoptr i64 %t883 to ptr
  %t885 = call fastcc i64%t884(i64 %t880, i64 1, i64 %t879, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge303
merge303:
  %t886 = phi i64 [ %t877, %then301 ], [ %t885, %else302 ]
  %t887 = icmp ne i64 %t886, 1
  br i1 %t887, label %then304, label %else305
then304:
  ret i64 %t863
else305:
  ret i64 1
else297:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t892 = icmp eq i64 %argc, 3
  br i1 %t892, label %argok307, label %arityerr306
arityerr306:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok307:
  %t893 = or i64 %a2, %a1
  %t894 = and i64 %t893, 7
  %t895 = icmp eq i64 %t894, 0
  br i1 %t895, label %fixfast308, label %fixslow309
fixfast308:
  %t896 = icmp slt i64 %a2, %a1
  %t897 = select i1 %t896, i64 257, i64 1
  br label %fixmerge310
fixslow309:
  %t898 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge310
fixmerge310:
  %t899 = phi i64 [ %t897, %fixfast308 ], [ %t898, %fixslow309 ]
  %t900 = icmp ne i64 %t899, 1
  br i1 %t900, label %then311, label %else312
then311:
  %t901 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t902 = call i64 @rt_char_to_integer(i64 %t901)
  %t903 = or i64 %t902, 80
  %t904 = and i64 %t903, 7
  %t905 = icmp eq i64 %t904, 0
  br i1 %t905, label %fixfast313, label %fixslow314
fixfast313:
  %t906 = icmp eq i64 %t902, 80
  %t907 = select i1 %t906, i64 257, i64 1
  br label %fixmerge315
fixslow314:
  %t908 = call i64 @rt_num_eq(i64 %t902, i64 80)
  br label %fixmerge315
fixmerge315:
  %t909 = phi i64 [ %t907, %fixfast313 ], [ %t908, %fixslow314 ]
  %t910 = icmp ne i64 %t909, 1
  br i1 %t910, label %then316, label %else317
then316:
  %t911 = or i64 %a2, 8
  %t912 = and i64 %t911, 7
  %t913 = icmp eq i64 %t912, 0
  br i1 %t913, label %fixfast318, label %fixslow319
fixfast318:
  %t914 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t915 = extractvalue {i64, i1} %t914, 0
  %t916 = extractvalue {i64, i1} %t914, 1
  br i1 %t916, label %fixslow319, label %fixmerge320
fixslow319:
  %t917 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge320
fixmerge320:
  %t918 = phi i64 [ %t915, %fixfast318 ], [ %t917, %fixslow319 ]
  ret i64 %t918
else317:
  %t919 = or i64 %a2, 8
  %t920 = and i64 %t919, 7
  %t921 = icmp eq i64 %t920, 0
  br i1 %t921, label %fixfast321, label %fixslow322
fixfast321:
  %t922 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t923 = extractvalue {i64, i1} %t922, 0
  %t924 = extractvalue {i64, i1} %t922, 1
  br i1 %t924, label %fixslow322, label %fixmerge323
fixslow322:
  %t925 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge323
fixmerge323:
  %t926 = phi i64 [ %t923, %fixfast321 ], [ %t925, %fixslow322 ]
  %t927 = load i64, ptr @"emit.internal:rd-skip-line"
  call void @rt_check_callable(i64 %t927)
  %t928 = and i64 %t927, -8
  %t929 = inttoptr i64 %t928 to ptr
  %t930 = load i64, ptr %t929
  %t931 = inttoptr i64 %t930 to ptr
  %t932 = musttail call fastcc i64 %t931(i64 %t927, i64 3, i64 %a0, i64 %a1, i64 %t926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t932
else312:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-block-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t937 = icmp eq i64 %argc, 3
  br i1 %t937, label %argok325, label %arityerr324
arityerr324:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok325:
  %t938 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t939 = call i64 @rt_char_to_integer(i64 %t938)
  %t940 = or i64 %t939, 280
  %t941 = and i64 %t940, 7
  %t942 = icmp eq i64 %t941, 0
  br i1 %t942, label %fixfast326, label %fixslow327
fixfast326:
  %t943 = icmp eq i64 %t939, 280
  %t944 = select i1 %t943, i64 257, i64 1
  br label %fixmerge328
fixslow327:
  %t945 = call i64 @rt_num_eq(i64 %t939, i64 280)
  br label %fixmerge328
fixmerge328:
  %t946 = phi i64 [ %t944, %fixfast326 ], [ %t945, %fixslow327 ]
  %t947 = icmp ne i64 %t946, 1
  br i1 %t947, label %then329, label %else330
then329:
  %t948 = or i64 %a2, 8
  %t949 = and i64 %t948, 7
  %t950 = icmp eq i64 %t949, 0
  br i1 %t950, label %fixfast331, label %fixslow332
fixfast331:
  %t951 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t952 = extractvalue {i64, i1} %t951, 0
  %t953 = extractvalue {i64, i1} %t951, 1
  br i1 %t953, label %fixslow332, label %fixmerge333
fixslow332:
  %t954 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge333
fixmerge333:
  %t955 = phi i64 [ %t952, %fixfast331 ], [ %t954, %fixslow332 ]
  %t956 = or i64 %t955, %a1
  %t957 = and i64 %t956, 7
  %t958 = icmp eq i64 %t957, 0
  br i1 %t958, label %fixfast334, label %fixslow335
fixfast334:
  %t959 = icmp slt i64 %t955, %a1
  %t960 = select i1 %t959, i64 257, i64 1
  br label %fixmerge336
fixslow335:
  %t961 = call i64 @rt_lt(i64 %t955, i64 %a1)
  br label %fixmerge336
fixmerge336:
  %t962 = phi i64 [ %t960, %fixfast334 ], [ %t961, %fixslow335 ]
  %t963 = icmp ne i64 %t962, 1
  br i1 %t963, label %then337, label %else338
then337:
  %t964 = or i64 %a2, 8
  %t965 = and i64 %t964, 7
  %t966 = icmp eq i64 %t965, 0
  br i1 %t966, label %fixfast339, label %fixslow340
fixfast339:
  %t967 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t968 = extractvalue {i64, i1} %t967, 0
  %t969 = extractvalue {i64, i1} %t967, 1
  br i1 %t969, label %fixslow340, label %fixmerge341
fixslow340:
  %t970 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge341
fixmerge341:
  %t971 = phi i64 [ %t968, %fixfast339 ], [ %t970, %fixslow340 ]
  %t972 = call i64 @rt_string_ref(i64 %a0, i64 %t971)
  %t973 = call i64 @rt_char_to_integer(i64 %t972)
  %t974 = or i64 %t973, 992
  %t975 = and i64 %t974, 7
  %t976 = icmp eq i64 %t975, 0
  br i1 %t976, label %fixfast342, label %fixslow343
fixfast342:
  %t977 = icmp eq i64 %t973, 992
  %t978 = select i1 %t977, i64 257, i64 1
  br label %fixmerge344
fixslow343:
  %t979 = call i64 @rt_num_eq(i64 %t973, i64 992)
  br label %fixmerge344
fixmerge344:
  %t980 = phi i64 [ %t978, %fixfast342 ], [ %t979, %fixslow343 ]
  ret i64 %t980
else338:
  ret i64 1
else330:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-skip-block"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t985 = icmp eq i64 %argc, 5
  br i1 %t985, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok346:
  %t986 = or i64 %a2, 8
  %t987 = and i64 %t986, 7
  %t988 = icmp eq i64 %t987, 0
  br i1 %t988, label %fixfast347, label %fixslow348
fixfast347:
  %t989 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t990 = extractvalue {i64, i1} %t989, 0
  %t991 = extractvalue {i64, i1} %t989, 1
  br i1 %t991, label %fixslow348, label %fixmerge349
fixslow348:
  %t992 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge349
fixmerge349:
  %t993 = phi i64 [ %t990, %fixfast347 ], [ %t992, %fixslow348 ]
  %t994 = or i64 %t993, %a1
  %t995 = and i64 %t994, 7
  %t996 = icmp eq i64 %t995, 0
  br i1 %t996, label %fixfast350, label %fixslow351
fixfast350:
  %t997 = icmp slt i64 %t993, %a1
  %t998 = select i1 %t997, i64 257, i64 1
  br label %fixmerge352
fixslow351:
  %t999 = call i64 @rt_lt(i64 %t993, i64 %a1)
  br label %fixmerge352
fixmerge352:
  %t1000 = phi i64 [ %t998, %fixfast350 ], [ %t999, %fixslow351 ]
  %t1001 = icmp ne i64 %t1000, 1
  br i1 %t1001, label %then353, label %else354
then353:
  %t1002 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1003 = call i64 @rt_char_to_integer(i64 %t1002)
  %t1004 = or i64 %a2, 8
  %t1005 = and i64 %t1004, 7
  %t1006 = icmp eq i64 %t1005, 0
  br i1 %t1006, label %fixfast355, label %fixslow356
fixfast355:
  %t1007 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1008 = extractvalue {i64, i1} %t1007, 0
  %t1009 = extractvalue {i64, i1} %t1007, 1
  br i1 %t1009, label %fixslow356, label %fixmerge357
fixslow356:
  %t1010 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge357
fixmerge357:
  %t1011 = phi i64 [ %t1008, %fixfast355 ], [ %t1010, %fixslow356 ]
  %t1012 = call i64 @rt_string_ref(i64 %a0, i64 %t1011)
  %t1013 = call i64 @rt_char_to_integer(i64 %t1012)
  %t1014 = or i64 %t1003, 992
  %t1015 = and i64 %t1014, 7
  %t1016 = icmp eq i64 %t1015, 0
  br i1 %t1016, label %fixfast358, label %fixslow359
fixfast358:
  %t1017 = icmp eq i64 %t1003, 992
  %t1018 = select i1 %t1017, i64 257, i64 1
  br label %fixmerge360
fixslow359:
  %t1019 = call i64 @rt_num_eq(i64 %t1003, i64 992)
  br label %fixmerge360
fixmerge360:
  %t1020 = phi i64 [ %t1018, %fixfast358 ], [ %t1019, %fixslow359 ]
  %t1021 = icmp ne i64 %t1020, 1
  br i1 %t1021, label %then361, label %else362
then361:
  %t1022 = or i64 %t1013, 280
  %t1023 = and i64 %t1022, 7
  %t1024 = icmp eq i64 %t1023, 0
  br i1 %t1024, label %fixfast364, label %fixslow365
fixfast364:
  %t1025 = icmp eq i64 %t1013, 280
  %t1026 = select i1 %t1025, i64 257, i64 1
  br label %fixmerge366
fixslow365:
  %t1027 = call i64 @rt_num_eq(i64 %t1013, i64 280)
  br label %fixmerge366
fixmerge366:
  %t1028 = phi i64 [ %t1026, %fixfast364 ], [ %t1027, %fixslow365 ]
  br label %merge363
else362:
  br label %merge363
merge363:
  %t1029 = phi i64 [ %t1028, %fixmerge366 ], [ 1, %else362 ]
  %t1030 = icmp ne i64 %t1029, 1
  br i1 %t1030, label %then367, label %else368
then367:
  %t1031 = or i64 %a3, 8
  %t1032 = and i64 %t1031, 7
  %t1033 = icmp eq i64 %t1032, 0
  br i1 %t1033, label %fixfast369, label %fixslow370
fixfast369:
  %t1034 = icmp eq i64 %a3, 8
  %t1035 = select i1 %t1034, i64 257, i64 1
  br label %fixmerge371
fixslow370:
  %t1036 = call i64 @rt_num_eq(i64 %a3, i64 8)
  br label %fixmerge371
fixmerge371:
  %t1037 = phi i64 [ %t1035, %fixfast369 ], [ %t1036, %fixslow370 ]
  %t1038 = icmp ne i64 %t1037, 1
  br i1 %t1038, label %then372, label %else373
then372:
  %t1039 = or i64 %a2, 16
  %t1040 = and i64 %t1039, 7
  %t1041 = icmp eq i64 %t1040, 0
  br i1 %t1041, label %fixfast374, label %fixslow375
fixfast374:
  %t1042 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1043 = extractvalue {i64, i1} %t1042, 0
  %t1044 = extractvalue {i64, i1} %t1042, 1
  br i1 %t1044, label %fixslow375, label %fixmerge376
fixslow375:
  %t1045 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge376
fixmerge376:
  %t1046 = phi i64 [ %t1043, %fixfast374 ], [ %t1045, %fixslow375 ]
  ret i64 %t1046
else373:
  %t1047 = or i64 %a2, 16
  %t1048 = and i64 %t1047, 7
  %t1049 = icmp eq i64 %t1048, 0
  br i1 %t1049, label %fixfast377, label %fixslow378
fixfast377:
  %t1050 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1051 = extractvalue {i64, i1} %t1050, 0
  %t1052 = extractvalue {i64, i1} %t1050, 1
  br i1 %t1052, label %fixslow378, label %fixmerge379
fixslow378:
  %t1053 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge379
fixmerge379:
  %t1054 = phi i64 [ %t1051, %fixfast377 ], [ %t1053, %fixslow378 ]
  %t1055 = or i64 %a3, 8
  %t1056 = and i64 %t1055, 7
  %t1057 = icmp eq i64 %t1056, 0
  br i1 %t1057, label %fixfast380, label %fixslow381
fixfast380:
  %t1058 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a3, i64 8)
  %t1059 = extractvalue {i64, i1} %t1058, 0
  %t1060 = extractvalue {i64, i1} %t1058, 1
  br i1 %t1060, label %fixslow381, label %fixmerge382
fixslow381:
  %t1061 = call i64 @rt_sub(i64 %a3, i64 8)
  br label %fixmerge382
fixmerge382:
  %t1062 = phi i64 [ %t1059, %fixfast380 ], [ %t1061, %fixslow381 ]
  %t1063 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1063)
  %t1064 = and i64 %t1063, -8
  %t1065 = inttoptr i64 %t1064 to ptr
  %t1066 = load i64, ptr %t1065
  %t1067 = inttoptr i64 %t1066 to ptr
  %t1068 = musttail call fastcc i64 %t1067(i64 %t1063, i64 5, i64 %a0, i64 %a1, i64 %t1054, i64 %t1062, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1068
else368:
  %t1069 = or i64 %t1003, 280
  %t1070 = and i64 %t1069, 7
  %t1071 = icmp eq i64 %t1070, 0
  br i1 %t1071, label %fixfast383, label %fixslow384
fixfast383:
  %t1072 = icmp eq i64 %t1003, 280
  %t1073 = select i1 %t1072, i64 257, i64 1
  br label %fixmerge385
fixslow384:
  %t1074 = call i64 @rt_num_eq(i64 %t1003, i64 280)
  br label %fixmerge385
fixmerge385:
  %t1075 = phi i64 [ %t1073, %fixfast383 ], [ %t1074, %fixslow384 ]
  %t1076 = icmp ne i64 %t1075, 1
  br i1 %t1076, label %then386, label %else387
then386:
  %t1077 = or i64 %t1013, 992
  %t1078 = and i64 %t1077, 7
  %t1079 = icmp eq i64 %t1078, 0
  br i1 %t1079, label %fixfast389, label %fixslow390
fixfast389:
  %t1080 = icmp eq i64 %t1013, 992
  %t1081 = select i1 %t1080, i64 257, i64 1
  br label %fixmerge391
fixslow390:
  %t1082 = call i64 @rt_num_eq(i64 %t1013, i64 992)
  br label %fixmerge391
fixmerge391:
  %t1083 = phi i64 [ %t1081, %fixfast389 ], [ %t1082, %fixslow390 ]
  br label %merge388
else387:
  br label %merge388
merge388:
  %t1084 = phi i64 [ %t1083, %fixmerge391 ], [ 1, %else387 ]
  %t1085 = icmp ne i64 %t1084, 1
  br i1 %t1085, label %then392, label %else393
then392:
  %t1086 = or i64 %a2, 16
  %t1087 = and i64 %t1086, 7
  %t1088 = icmp eq i64 %t1087, 0
  br i1 %t1088, label %fixfast394, label %fixslow395
fixfast394:
  %t1089 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1090 = extractvalue {i64, i1} %t1089, 0
  %t1091 = extractvalue {i64, i1} %t1089, 1
  br i1 %t1091, label %fixslow395, label %fixmerge396
fixslow395:
  %t1092 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge396
fixmerge396:
  %t1093 = phi i64 [ %t1090, %fixfast394 ], [ %t1092, %fixslow395 ]
  %t1094 = or i64 %a3, 8
  %t1095 = and i64 %t1094, 7
  %t1096 = icmp eq i64 %t1095, 0
  br i1 %t1096, label %fixfast397, label %fixslow398
fixfast397:
  %t1097 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a3, i64 8)
  %t1098 = extractvalue {i64, i1} %t1097, 0
  %t1099 = extractvalue {i64, i1} %t1097, 1
  br i1 %t1099, label %fixslow398, label %fixmerge399
fixslow398:
  %t1100 = call i64 @rt_add(i64 %a3, i64 8)
  br label %fixmerge399
fixmerge399:
  %t1101 = phi i64 [ %t1098, %fixfast397 ], [ %t1100, %fixslow398 ]
  %t1102 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1102)
  %t1103 = and i64 %t1102, -8
  %t1104 = inttoptr i64 %t1103 to ptr
  %t1105 = load i64, ptr %t1104
  %t1106 = inttoptr i64 %t1105 to ptr
  %t1107 = musttail call fastcc i64 %t1106(i64 %t1102, i64 5, i64 %a0, i64 %a1, i64 %t1093, i64 %t1101, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1107
else393:
  %t1108 = or i64 %a2, 8
  %t1109 = and i64 %t1108, 7
  %t1110 = icmp eq i64 %t1109, 0
  br i1 %t1110, label %fixfast400, label %fixslow401
fixfast400:
  %t1111 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1112 = extractvalue {i64, i1} %t1111, 0
  %t1113 = extractvalue {i64, i1} %t1111, 1
  br i1 %t1113, label %fixslow401, label %fixmerge402
fixslow401:
  %t1114 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge402
fixmerge402:
  %t1115 = phi i64 [ %t1112, %fixfast400 ], [ %t1114, %fixslow401 ]
  %t1116 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1116)
  %t1117 = and i64 %t1116, -8
  %t1118 = inttoptr i64 %t1117 to ptr
  %t1119 = load i64, ptr %t1118
  %t1120 = inttoptr i64 %t1119 to ptr
  %t1121 = musttail call fastcc i64 %t1120(i64 %t1116, i64 5, i64 %a0, i64 %a1, i64 %t1115, i64 %a3, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1121
else354:
  %t1122 = load i64, ptr @"emit.internal:rd-fail-code"
  call void @rt_check_callable(i64 %t1122)
  %t1123 = and i64 %t1122, -8
  %t1124 = inttoptr i64 %t1123 to ptr
  %t1125 = load i64, ptr %t1124
  %t1126 = inttoptr i64 %t1125 to ptr
  %t1127 = musttail call fastcc i64 %t1126(i64 %t1122, i64 1, i64 %a4, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1127
}

define fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1132 = icmp eq i64 %argc, 4
  br i1 %t1132, label %argok404, label %arityerr403
arityerr403:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok404:
  %t1133 = or i64 0, %a2
  %t1134 = and i64 %t1133, 7
  %t1135 = icmp eq i64 %t1134, 0
  br i1 %t1135, label %fixfast405, label %fixslow406
fixfast405:
  %t1136 = icmp slt i64 0, %a2
  %t1137 = select i1 %t1136, i64 257, i64 1
  br label %fixmerge407
fixslow406:
  %t1138 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge407
fixmerge407:
  %t1139 = phi i64 [ %t1137, %fixfast405 ], [ %t1138, %fixslow406 ]
  %t1140 = icmp ne i64 %t1139, 1
  br i1 %t1140, label %then408, label %else409
then408:
  br label %merge410
else409:
  %t1141 = or i64 0, %a2
  %t1142 = and i64 %t1141, 7
  %t1143 = icmp eq i64 %t1142, 0
  br i1 %t1143, label %fixfast411, label %fixslow412
fixfast411:
  %t1144 = icmp eq i64 0, %a2
  %t1145 = select i1 %t1144, i64 257, i64 1
  br label %fixmerge413
fixslow412:
  %t1146 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge413
fixmerge413:
  %t1147 = phi i64 [ %t1145, %fixfast411 ], [ %t1146, %fixslow412 ]
  br label %merge410
merge410:
  %t1148 = phi i64 [ 257, %then408 ], [ %t1147, %fixmerge413 ]
  %t1149 = icmp ne i64 %t1148, 1
  br i1 %t1149, label %then414, label %else415
then414:
  %t1150 = or i64 %a2, %a1
  %t1151 = and i64 %t1150, 7
  %t1152 = icmp eq i64 %t1151, 0
  br i1 %t1152, label %fixfast417, label %fixslow418
fixfast417:
  %t1153 = icmp slt i64 %a2, %a1
  %t1154 = select i1 %t1153, i64 257, i64 1
  br label %fixmerge419
fixslow418:
  %t1155 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge419
fixmerge419:
  %t1156 = phi i64 [ %t1154, %fixfast417 ], [ %t1155, %fixslow418 ]
  br label %merge416
else415:
  br label %merge416
merge416:
  %t1157 = phi i64 [ %t1156, %fixmerge419 ], [ 1, %else415 ]
  %t1158 = icmp ne i64 %t1157, 1
  br i1 %t1158, label %then420, label %else421
then420:
  %t1159 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1160 = load i64, ptr @"emit.internal:rd-ws?"
  call void @rt_check_callable(i64 %t1160)
  %t1161 = and i64 %t1160, -8
  %t1162 = inttoptr i64 %t1161 to ptr
  %t1163 = load i64, ptr %t1162
  %t1164 = inttoptr i64 %t1163 to ptr
  %t1165 = call fastcc i64%t1164(i64 %t1160, i64 1, i64 %t1159, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1166 = icmp ne i64 %t1165, 1
  br i1 %t1166, label %then422, label %else423
then422:
  %t1167 = or i64 %a2, 8
  %t1168 = and i64 %t1167, 7
  %t1169 = icmp eq i64 %t1168, 0
  br i1 %t1169, label %fixfast424, label %fixslow425
fixfast424:
  %t1170 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1171 = extractvalue {i64, i1} %t1170, 0
  %t1172 = extractvalue {i64, i1} %t1170, 1
  br i1 %t1172, label %fixslow425, label %fixmerge426
fixslow425:
  %t1173 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge426
fixmerge426:
  %t1174 = phi i64 [ %t1171, %fixfast424 ], [ %t1173, %fixslow425 ]
  %t1175 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1175)
  %t1176 = and i64 %t1175, -8
  %t1177 = inttoptr i64 %t1176 to ptr
  %t1178 = load i64, ptr %t1177
  %t1179 = inttoptr i64 %t1178 to ptr
  %t1180 = musttail call fastcc i64 %t1179(i64 %t1175, i64 4, i64 %a0, i64 %a1, i64 %t1174, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1180
else423:
  %t1181 = call i64 @rt_char_to_integer(i64 %t1159)
  %t1182 = or i64 %t1181, 472
  %t1183 = and i64 %t1182, 7
  %t1184 = icmp eq i64 %t1183, 0
  br i1 %t1184, label %fixfast427, label %fixslow428
fixfast427:
  %t1185 = icmp eq i64 %t1181, 472
  %t1186 = select i1 %t1185, i64 257, i64 1
  br label %fixmerge429
fixslow428:
  %t1187 = call i64 @rt_num_eq(i64 %t1181, i64 472)
  br label %fixmerge429
fixmerge429:
  %t1188 = phi i64 [ %t1186, %fixfast427 ], [ %t1187, %fixslow428 ]
  %t1189 = icmp ne i64 %t1188, 1
  br i1 %t1189, label %then430, label %else431
then430:
  %t1190 = or i64 %a2, 8
  %t1191 = and i64 %t1190, 7
  %t1192 = icmp eq i64 %t1191, 0
  br i1 %t1192, label %fixfast432, label %fixslow433
fixfast432:
  %t1193 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1194 = extractvalue {i64, i1} %t1193, 0
  %t1195 = extractvalue {i64, i1} %t1193, 1
  br i1 %t1195, label %fixslow433, label %fixmerge434
fixslow433:
  %t1196 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge434
fixmerge434:
  %t1197 = phi i64 [ %t1194, %fixfast432 ], [ %t1196, %fixslow433 ]
  %t1198 = load i64, ptr @"emit.internal:rd-skip-line"
  call void @rt_check_callable(i64 %t1198)
  %t1199 = and i64 %t1198, -8
  %t1200 = inttoptr i64 %t1199 to ptr
  %t1201 = load i64, ptr %t1200
  %t1202 = inttoptr i64 %t1201 to ptr
  %t1203 = call fastcc i64%t1202(i64 %t1198, i64 3, i64 %a0, i64 %a1, i64 %t1197, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1204 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1204)
  %t1205 = and i64 %t1204, -8
  %t1206 = inttoptr i64 %t1205 to ptr
  %t1207 = load i64, ptr %t1206
  %t1208 = inttoptr i64 %t1207 to ptr
  %t1209 = musttail call fastcc i64 %t1208(i64 %t1204, i64 4, i64 %a0, i64 %a1, i64 %t1203, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1209
else431:
  %t1210 = load i64, ptr @"emit.internal:rd-block-open?"
  call void @rt_check_callable(i64 %t1210)
  %t1211 = and i64 %t1210, -8
  %t1212 = inttoptr i64 %t1211 to ptr
  %t1213 = load i64, ptr %t1212
  %t1214 = inttoptr i64 %t1213 to ptr
  %t1215 = call fastcc i64%t1214(i64 %t1210, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1216 = icmp ne i64 %t1215, 1
  br i1 %t1216, label %then435, label %else436
then435:
  %t1217 = or i64 %a2, 16
  %t1218 = and i64 %t1217, 7
  %t1219 = icmp eq i64 %t1218, 0
  br i1 %t1219, label %fixfast437, label %fixslow438
fixfast437:
  %t1220 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1221 = extractvalue {i64, i1} %t1220, 0
  %t1222 = extractvalue {i64, i1} %t1220, 1
  br i1 %t1222, label %fixslow438, label %fixmerge439
fixslow438:
  %t1223 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge439
fixmerge439:
  %t1224 = phi i64 [ %t1221, %fixfast437 ], [ %t1223, %fixslow438 ]
  %t1225 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t1225)
  %t1226 = and i64 %t1225, -8
  %t1227 = inttoptr i64 %t1226 to ptr
  %t1228 = load i64, ptr %t1227
  %t1229 = inttoptr i64 %t1228 to ptr
  %t1230 = call fastcc i64%t1229(i64 %t1225, i64 5, i64 %a0, i64 %a1, i64 %t1224, i64 8, i64 %a2, i64 0, i64 0, i64 0, ptr null)
  %t1231 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t1231)
  %t1232 = and i64 %t1231, -8
  %t1233 = inttoptr i64 %t1232 to ptr
  %t1234 = load i64, ptr %t1233
  %t1235 = inttoptr i64 %t1234 to ptr
  %t1236 = call fastcc i64%t1235(i64 %t1231, i64 1, i64 %t1230, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1237 = icmp ne i64 %t1236, 1
  br i1 %t1237, label %then440, label %else441
then440:
  ret i64 %t1230
else441:
  %t1238 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1238)
  %t1239 = and i64 %t1238, -8
  %t1240 = inttoptr i64 %t1239 to ptr
  %t1241 = load i64, ptr %t1240
  %t1242 = inttoptr i64 %t1241 to ptr
  %t1243 = musttail call fastcc i64 %t1242(i64 %t1238, i64 4, i64 %a0, i64 %a1, i64 %t1230, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1243
else436:
  %t1244 = call i64 @rt_make_string(ptr @.str.lit.0, i64 11)
  %t1245 = load i64, ptr @"emit.internal:rd-directive-end"
  call void @rt_check_callable(i64 %t1245)
  %t1246 = and i64 %t1245, -8
  %t1247 = inttoptr i64 %t1246 to ptr
  %t1248 = load i64, ptr %t1247
  %t1249 = inttoptr i64 %t1248 to ptr
  %t1250 = call fastcc i64%t1249(i64 %t1245, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %t1244, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1251 = icmp ne i64 %t1250, 1
  br i1 %t1251, label %then442, label %else443
then442:
  %t1252 = load i64, ptr @"emit.internal:rd-set-fold!"
  call void @rt_check_callable(i64 %t1252)
  %t1253 = and i64 %t1252, -8
  %t1254 = inttoptr i64 %t1253 to ptr
  %t1255 = load i64, ptr %t1254
  %t1256 = inttoptr i64 %t1255 to ptr
  %t1257 = call fastcc i64%t1256(i64 %t1252, i64 2, i64 %a3, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1258 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1258)
  %t1259 = and i64 %t1258, -8
  %t1260 = inttoptr i64 %t1259 to ptr
  %t1261 = load i64, ptr %t1260
  %t1262 = inttoptr i64 %t1261 to ptr
  %t1263 = musttail call fastcc i64 %t1262(i64 %t1258, i64 4, i64 %a0, i64 %a1, i64 %t1250, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1263
else443:
  %t1264 = call i64 @rt_make_string(ptr @.str.lit.1, i64 14)
  %t1265 = load i64, ptr @"emit.internal:rd-directive-end"
  call void @rt_check_callable(i64 %t1265)
  %t1266 = and i64 %t1265, -8
  %t1267 = inttoptr i64 %t1266 to ptr
  %t1268 = load i64, ptr %t1267
  %t1269 = inttoptr i64 %t1268 to ptr
  %t1270 = call fastcc i64%t1269(i64 %t1265, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %t1264, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1271 = icmp ne i64 %t1270, 1
  br i1 %t1271, label %then444, label %else445
then444:
  %t1272 = load i64, ptr @"emit.internal:rd-set-fold!"
  call void @rt_check_callable(i64 %t1272)
  %t1273 = and i64 %t1272, -8
  %t1274 = inttoptr i64 %t1273 to ptr
  %t1275 = load i64, ptr %t1274
  %t1276 = inttoptr i64 %t1275 to ptr
  %t1277 = call fastcc i64%t1276(i64 %t1272, i64 2, i64 %a3, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1278 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1278)
  %t1279 = and i64 %t1278, -8
  %t1280 = inttoptr i64 %t1279 to ptr
  %t1281 = load i64, ptr %t1280
  %t1282 = inttoptr i64 %t1281 to ptr
  %t1283 = musttail call fastcc i64 %t1282(i64 %t1278, i64 4, i64 %a0, i64 %a1, i64 %t1270, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1283
else445:
  ret i64 %a2
else421:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1288 = icmp eq i64 %argc, 3
  br i1 %t1288, label %argok447, label %arityerr446
arityerr446:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok447:
  %t1289 = or i64 %a2, %a1
  %t1290 = and i64 %t1289, 7
  %t1291 = icmp eq i64 %t1290, 0
  br i1 %t1291, label %fixfast448, label %fixslow449
fixfast448:
  %t1292 = icmp slt i64 %a2, %a1
  %t1293 = select i1 %t1292, i64 257, i64 1
  br label %fixmerge450
fixslow449:
  %t1294 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge450
fixmerge450:
  %t1295 = phi i64 [ %t1293, %fixfast448 ], [ %t1294, %fixslow449 ]
  %t1296 = icmp ne i64 %t1295, 1
  br i1 %t1296, label %then451, label %else452
then451:
  %t1297 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1298 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t1298)
  %t1299 = and i64 %t1298, -8
  %t1300 = inttoptr i64 %t1299 to ptr
  %t1301 = load i64, ptr %t1300
  %t1302 = inttoptr i64 %t1301 to ptr
  %t1303 = call fastcc i64%t1302(i64 %t1298, i64 1, i64 %t1297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1304 = icmp ne i64 %t1303, 1
  br i1 %t1304, label %then453, label %else454
then453:
  ret i64 %a2
else454:
  %t1305 = or i64 %a2, 8
  %t1306 = and i64 %t1305, 7
  %t1307 = icmp eq i64 %t1306, 0
  br i1 %t1307, label %fixfast455, label %fixslow456
fixfast455:
  %t1308 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1309 = extractvalue {i64, i1} %t1308, 0
  %t1310 = extractvalue {i64, i1} %t1308, 1
  br i1 %t1310, label %fixslow456, label %fixmerge457
fixslow456:
  %t1311 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge457
fixmerge457:
  %t1312 = phi i64 [ %t1309, %fixfast455 ], [ %t1311, %fixslow456 ]
  %t1313 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t1313)
  %t1314 = and i64 %t1313, -8
  %t1315 = inttoptr i64 %t1314 to ptr
  %t1316 = load i64, ptr %t1315
  %t1317 = inttoptr i64 %t1316 to ptr
  %t1318 = musttail call fastcc i64 %t1317(i64 %t1313, i64 3, i64 %a0, i64 %a1, i64 %t1312, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1318
else452:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1323 = icmp eq i64 %argc, 3
  br i1 %t1323, label %argok459, label %arityerr458
arityerr458:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok459:
  %t1324 = or i64 %a1, %a2
  %t1325 = and i64 %t1324, 7
  %t1326 = icmp eq i64 %t1325, 0
  br i1 %t1326, label %fixfast460, label %fixslow461
fixfast460:
  %t1327 = icmp slt i64 %a1, %a2
  %t1328 = select i1 %t1327, i64 257, i64 1
  br label %fixmerge462
fixslow461:
  %t1329 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge462
fixmerge462:
  %t1330 = phi i64 [ %t1328, %fixfast460 ], [ %t1329, %fixslow461 ]
  %t1331 = icmp ne i64 %t1330, 1
  br i1 %t1331, label %then463, label %else464
then463:
  %t1332 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1333 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1333)
  %t1334 = and i64 %t1333, -8
  %t1335 = inttoptr i64 %t1334 to ptr
  %t1336 = load i64, ptr %t1335
  %t1337 = inttoptr i64 %t1336 to ptr
  %t1338 = call fastcc i64%t1337(i64 %t1333, i64 1, i64 %t1332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1339 = icmp ne i64 %t1338, 1
  br i1 %t1339, label %then465, label %else466
then465:
  %t1340 = or i64 %a1, 8
  %t1341 = and i64 %t1340, 7
  %t1342 = icmp eq i64 %t1341, 0
  br i1 %t1342, label %fixfast467, label %fixslow468
fixfast467:
  %t1343 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1344 = extractvalue {i64, i1} %t1343, 0
  %t1345 = extractvalue {i64, i1} %t1343, 1
  br i1 %t1345, label %fixslow468, label %fixmerge469
fixslow468:
  %t1346 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge469
fixmerge469:
  %t1347 = phi i64 [ %t1344, %fixfast467 ], [ %t1346, %fixslow468 ]
  %t1348 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1348)
  %t1349 = and i64 %t1348, -8
  %t1350 = inttoptr i64 %t1349 to ptr
  %t1351 = load i64, ptr %t1350
  %t1352 = inttoptr i64 %t1351 to ptr
  %t1353 = musttail call fastcc i64 %t1352(i64 %t1348, i64 3, i64 %a0, i64 %t1347, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1353
else466:
  ret i64 1
else464:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1358 = icmp eq i64 %argc, 1
  br i1 %t1358, label %argok471, label %arityerr470
arityerr470:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok471:
  %t1359 = call i64 @rt_string_length(i64 %a0)
  %t1360 = or i64 0, %t1359
  %t1361 = and i64 %t1360, 7
  %t1362 = icmp eq i64 %t1361, 0
  br i1 %t1362, label %fixfast472, label %fixslow473
fixfast472:
  %t1363 = icmp slt i64 0, %t1359
  %t1364 = select i1 %t1363, i64 257, i64 1
  br label %fixmerge474
fixslow473:
  %t1365 = call i64 @rt_lt(i64 0, i64 %t1359)
  br label %fixmerge474
fixmerge474:
  %t1366 = phi i64 [ %t1364, %fixfast472 ], [ %t1365, %fixslow473 ]
  %t1367 = icmp ne i64 %t1366, 1
  br i1 %t1367, label %then475, label %else476
then475:
  %t1368 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1369 = call i64 @rt_char_to_integer(i64 %t1368)
  %t1370 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1371 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1371)
  %t1372 = and i64 %t1371, -8
  %t1373 = inttoptr i64 %t1372 to ptr
  %t1374 = load i64, ptr %t1373
  %t1375 = inttoptr i64 %t1374 to ptr
  %t1376 = call fastcc i64%t1375(i64 %t1371, i64 1, i64 %t1370, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1377 = icmp ne i64 %t1376, 1
  br i1 %t1377, label %then477, label %else478
then477:
  %t1378 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1378)
  %t1379 = and i64 %t1378, -8
  %t1380 = inttoptr i64 %t1379 to ptr
  %t1381 = load i64, ptr %t1380
  %t1382 = inttoptr i64 %t1381 to ptr
  %t1383 = musttail call fastcc i64 %t1382(i64 %t1378, i64 3, i64 %a0, i64 0, i64 %t1359, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1383
else478:
  %t1384 = or i64 %t1369, 360
  %t1385 = and i64 %t1384, 7
  %t1386 = icmp eq i64 %t1385, 0
  br i1 %t1386, label %fixfast479, label %fixslow480
fixfast479:
  %t1387 = icmp eq i64 %t1369, 360
  %t1388 = select i1 %t1387, i64 257, i64 1
  br label %fixmerge481
fixslow480:
  %t1389 = call i64 @rt_num_eq(i64 %t1369, i64 360)
  br label %fixmerge481
fixmerge481:
  %t1390 = phi i64 [ %t1388, %fixfast479 ], [ %t1389, %fixslow480 ]
  %t1391 = icmp ne i64 %t1390, 1
  br i1 %t1391, label %then482, label %else483
then482:
  br label %merge484
else483:
  %t1392 = or i64 %t1369, 344
  %t1393 = and i64 %t1392, 7
  %t1394 = icmp eq i64 %t1393, 0
  br i1 %t1394, label %fixfast485, label %fixslow486
fixfast485:
  %t1395 = icmp eq i64 %t1369, 344
  %t1396 = select i1 %t1395, i64 257, i64 1
  br label %fixmerge487
fixslow486:
  %t1397 = call i64 @rt_num_eq(i64 %t1369, i64 344)
  br label %fixmerge487
fixmerge487:
  %t1398 = phi i64 [ %t1396, %fixfast485 ], [ %t1397, %fixslow486 ]
  br label %merge484
merge484:
  %t1399 = phi i64 [ %t1390, %then482 ], [ %t1398, %fixmerge487 ]
  %t1400 = icmp ne i64 %t1399, 1
  br i1 %t1400, label %then488, label %else489
then488:
  %t1401 = or i64 8, %t1359
  %t1402 = and i64 %t1401, 7
  %t1403 = icmp eq i64 %t1402, 0
  br i1 %t1403, label %fixfast490, label %fixslow491
fixfast490:
  %t1404 = icmp slt i64 8, %t1359
  %t1405 = select i1 %t1404, i64 257, i64 1
  br label %fixmerge492
fixslow491:
  %t1406 = call i64 @rt_lt(i64 8, i64 %t1359)
  br label %fixmerge492
fixmerge492:
  %t1407 = phi i64 [ %t1405, %fixfast490 ], [ %t1406, %fixslow491 ]
  %t1408 = icmp ne i64 %t1407, 1
  br i1 %t1408, label %then493, label %else494
then493:
  %t1409 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1409)
  %t1410 = and i64 %t1409, -8
  %t1411 = inttoptr i64 %t1410 to ptr
  %t1412 = load i64, ptr %t1411
  %t1413 = inttoptr i64 %t1412 to ptr
  %t1414 = musttail call fastcc i64 %t1413(i64 %t1409, i64 3, i64 %a0, i64 8, i64 %t1359, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1414
else494:
  ret i64 1
else489:
  ret i64 1
else476:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1419 = icmp eq i64 %argc, 4
  br i1 %t1419, label %argok496, label %arityerr495
arityerr495:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok496:
  %t1420 = or i64 %a1, %a2
  %t1421 = and i64 %t1420, 7
  %t1422 = icmp eq i64 %t1421, 0
  br i1 %t1422, label %fixfast497, label %fixslow498
fixfast497:
  %t1423 = icmp slt i64 %a1, %a2
  %t1424 = select i1 %t1423, i64 257, i64 1
  br label %fixmerge499
fixslow498:
  %t1425 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge499
fixmerge499:
  %t1426 = phi i64 [ %t1424, %fixfast497 ], [ %t1425, %fixslow498 ]
  %t1427 = icmp ne i64 %t1426, 1
  br i1 %t1427, label %then500, label %else501
then500:
  %t1428 = or i64 %a1, 8
  %t1429 = and i64 %t1428, 7
  %t1430 = icmp eq i64 %t1429, 0
  br i1 %t1430, label %fixfast502, label %fixslow503
fixfast502:
  %t1431 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1432 = extractvalue {i64, i1} %t1431, 0
  %t1433 = extractvalue {i64, i1} %t1431, 1
  br i1 %t1433, label %fixslow503, label %fixmerge504
fixslow503:
  %t1434 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge504
fixmerge504:
  %t1435 = phi i64 [ %t1432, %fixfast502 ], [ %t1434, %fixslow503 ]
  %t1436 = or i64 %a3, 80
  %t1437 = and i64 %t1436, 7
  %t1438 = icmp eq i64 %t1437, 0
  br i1 %t1438, label %fixfast505, label %fixslow506
fixfast505:
  %t1439 = ashr i64 %a3, 3
  %t1440 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1439, i64 80)
  %t1441 = extractvalue {i64, i1} %t1440, 0
  %t1442 = extractvalue {i64, i1} %t1440, 1
  br i1 %t1442, label %fixslow506, label %fixmerge507
fixslow506:
  %t1443 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge507
fixmerge507:
  %t1444 = phi i64 [ %t1441, %fixfast505 ], [ %t1443, %fixslow506 ]
  %t1445 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1446 = call i64 @rt_char_to_integer(i64 %t1445)
  %t1447 = or i64 %t1446, 384
  %t1448 = and i64 %t1447, 7
  %t1449 = icmp eq i64 %t1448, 0
  br i1 %t1449, label %fixfast508, label %fixslow509
fixfast508:
  %t1450 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1446, i64 384)
  %t1451 = extractvalue {i64, i1} %t1450, 0
  %t1452 = extractvalue {i64, i1} %t1450, 1
  br i1 %t1452, label %fixslow509, label %fixmerge510
fixslow509:
  %t1453 = call i64 @rt_sub(i64 %t1446, i64 384)
  br label %fixmerge510
fixmerge510:
  %t1454 = phi i64 [ %t1451, %fixfast508 ], [ %t1453, %fixslow509 ]
  %t1455 = or i64 %t1444, %t1454
  %t1456 = and i64 %t1455, 7
  %t1457 = icmp eq i64 %t1456, 0
  br i1 %t1457, label %fixfast511, label %fixslow512
fixfast511:
  %t1458 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1444, i64 %t1454)
  %t1459 = extractvalue {i64, i1} %t1458, 0
  %t1460 = extractvalue {i64, i1} %t1458, 1
  br i1 %t1460, label %fixslow512, label %fixmerge513
fixslow512:
  %t1461 = call i64 @rt_add(i64 %t1444, i64 %t1454)
  br label %fixmerge513
fixmerge513:
  %t1462 = phi i64 [ %t1459, %fixfast511 ], [ %t1461, %fixslow512 ]
  %t1463 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1463)
  %t1464 = and i64 %t1463, -8
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = load i64, ptr %t1465
  %t1467 = inttoptr i64 %t1466 to ptr
  %t1468 = musttail call fastcc i64 %t1467(i64 %t1463, i64 4, i64 %a0, i64 %t1435, i64 %a2, i64 %t1462, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1468
else501:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1473 = icmp eq i64 %argc, 4
  br i1 %t1473, label %argok515, label %arityerr514
arityerr514:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok515:
  %t1474 = or i64 %a1, %a2
  %t1475 = and i64 %t1474, 7
  %t1476 = icmp eq i64 %t1475, 0
  br i1 %t1476, label %fixfast516, label %fixslow517
fixfast516:
  %t1477 = icmp slt i64 %a1, %a2
  %t1478 = select i1 %t1477, i64 257, i64 1
  br label %fixmerge518
fixslow517:
  %t1479 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge518
fixmerge518:
  %t1480 = phi i64 [ %t1478, %fixfast516 ], [ %t1479, %fixslow517 ]
  %t1481 = icmp ne i64 %t1480, 1
  br i1 %t1481, label %then519, label %else520
then519:
  %t1482 = or i64 %a1, 8
  %t1483 = and i64 %t1482, 7
  %t1484 = icmp eq i64 %t1483, 0
  br i1 %t1484, label %fixfast521, label %fixslow522
fixfast521:
  %t1485 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1486 = extractvalue {i64, i1} %t1485, 0
  %t1487 = extractvalue {i64, i1} %t1485, 1
  br i1 %t1487, label %fixslow522, label %fixmerge523
fixslow522:
  %t1488 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge523
fixmerge523:
  %t1489 = phi i64 [ %t1486, %fixfast521 ], [ %t1488, %fixslow522 ]
  %t1490 = or i64 %a3, 80
  %t1491 = and i64 %t1490, 7
  %t1492 = icmp eq i64 %t1491, 0
  br i1 %t1492, label %fixfast524, label %fixslow525
fixfast524:
  %t1493 = ashr i64 %a3, 3
  %t1494 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1493, i64 80)
  %t1495 = extractvalue {i64, i1} %t1494, 0
  %t1496 = extractvalue {i64, i1} %t1494, 1
  br i1 %t1496, label %fixslow525, label %fixmerge526
fixslow525:
  %t1497 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge526
fixmerge526:
  %t1498 = phi i64 [ %t1495, %fixfast524 ], [ %t1497, %fixslow525 ]
  %t1499 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1500 = call i64 @rt_char_to_integer(i64 %t1499)
  %t1501 = or i64 %t1500, 384
  %t1502 = and i64 %t1501, 7
  %t1503 = icmp eq i64 %t1502, 0
  br i1 %t1503, label %fixfast527, label %fixslow528
fixfast527:
  %t1504 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1500, i64 384)
  %t1505 = extractvalue {i64, i1} %t1504, 0
  %t1506 = extractvalue {i64, i1} %t1504, 1
  br i1 %t1506, label %fixslow528, label %fixmerge529
fixslow528:
  %t1507 = call i64 @rt_sub(i64 %t1500, i64 384)
  br label %fixmerge529
fixmerge529:
  %t1508 = phi i64 [ %t1505, %fixfast527 ], [ %t1507, %fixslow528 ]
  %t1509 = or i64 %t1498, %t1508
  %t1510 = and i64 %t1509, 7
  %t1511 = icmp eq i64 %t1510, 0
  br i1 %t1511, label %fixfast530, label %fixslow531
fixfast530:
  %t1512 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1498, i64 %t1508)
  %t1513 = extractvalue {i64, i1} %t1512, 0
  %t1514 = extractvalue {i64, i1} %t1512, 1
  br i1 %t1514, label %fixslow531, label %fixmerge532
fixslow531:
  %t1515 = call i64 @rt_sub(i64 %t1498, i64 %t1508)
  br label %fixmerge532
fixmerge532:
  %t1516 = phi i64 [ %t1513, %fixfast530 ], [ %t1515, %fixslow531 ]
  %t1517 = load i64, ptr @"emit.internal:rd-digits-neg"
  call void @rt_check_callable(i64 %t1517)
  %t1518 = and i64 %t1517, -8
  %t1519 = inttoptr i64 %t1518 to ptr
  %t1520 = load i64, ptr %t1519
  %t1521 = inttoptr i64 %t1520 to ptr
  %t1522 = musttail call fastcc i64 %t1521(i64 %t1517, i64 4, i64 %a0, i64 %t1489, i64 %a2, i64 %t1516, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1522
else520:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1527 = icmp eq i64 %argc, 1
  br i1 %t1527, label %argok534, label %arityerr533
arityerr533:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok534:
  %t1528 = call i64 @rt_string_length(i64 %a0)
  %t1529 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1530 = call i64 @rt_char_to_integer(i64 %t1529)
  %t1531 = or i64 %t1530, 360
  %t1532 = and i64 %t1531, 7
  %t1533 = icmp eq i64 %t1532, 0
  br i1 %t1533, label %fixfast535, label %fixslow536
fixfast535:
  %t1534 = icmp eq i64 %t1530, 360
  %t1535 = select i1 %t1534, i64 257, i64 1
  br label %fixmerge537
fixslow536:
  %t1536 = call i64 @rt_num_eq(i64 %t1530, i64 360)
  br label %fixmerge537
fixmerge537:
  %t1537 = phi i64 [ %t1535, %fixfast535 ], [ %t1536, %fixslow536 ]
  %t1538 = icmp ne i64 %t1537, 1
  br i1 %t1538, label %then538, label %else539
then538:
  %t1539 = load i64, ptr @"emit.internal:rd-digits-neg"
  call void @rt_check_callable(i64 %t1539)
  %t1540 = and i64 %t1539, -8
  %t1541 = inttoptr i64 %t1540 to ptr
  %t1542 = load i64, ptr %t1541
  %t1543 = inttoptr i64 %t1542 to ptr
  %t1544 = musttail call fastcc i64 %t1543(i64 %t1539, i64 4, i64 %a0, i64 8, i64 %t1528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1544
else539:
  %t1545 = or i64 %t1530, 344
  %t1546 = and i64 %t1545, 7
  %t1547 = icmp eq i64 %t1546, 0
  br i1 %t1547, label %fixfast540, label %fixslow541
fixfast540:
  %t1548 = icmp eq i64 %t1530, 344
  %t1549 = select i1 %t1548, i64 257, i64 1
  br label %fixmerge542
fixslow541:
  %t1550 = call i64 @rt_num_eq(i64 %t1530, i64 344)
  br label %fixmerge542
fixmerge542:
  %t1551 = phi i64 [ %t1549, %fixfast540 ], [ %t1550, %fixslow541 ]
  %t1552 = icmp ne i64 %t1551, 1
  br i1 %t1552, label %then543, label %else544
then543:
  %t1553 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1553)
  %t1554 = and i64 %t1553, -8
  %t1555 = inttoptr i64 %t1554 to ptr
  %t1556 = load i64, ptr %t1555
  %t1557 = inttoptr i64 %t1556 to ptr
  %t1558 = musttail call fastcc i64 %t1557(i64 %t1553, i64 4, i64 %a0, i64 8, i64 %t1528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1558
else544:
  %t1559 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1559)
  %t1560 = and i64 %t1559, -8
  %t1561 = inttoptr i64 %t1560 to ptr
  %t1562 = load i64, ptr %t1561
  %t1563 = inttoptr i64 %t1562 to ptr
  %t1564 = musttail call fastcc i64 %t1563(i64 %t1559, i64 4, i64 %a0, i64 0, i64 %t1528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1564
}

define fastcc i64 @"emit.internal:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1569 = icmp eq i64 %argc, 1
  br i1 %t1569, label %argok546, label %arityerr545
arityerr545:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok546:
  %t1570 = call i64 @rt_char_to_integer(i64 %a0)
  %t1571 = or i64 %t1570, 368
  %t1572 = and i64 %t1571, 7
  %t1573 = icmp eq i64 %t1572, 0
  br i1 %t1573, label %fixfast547, label %fixslow548
fixfast547:
  %t1574 = icmp eq i64 %t1570, 368
  %t1575 = select i1 %t1574, i64 257, i64 1
  br label %fixmerge549
fixslow548:
  %t1576 = call i64 @rt_num_eq(i64 %t1570, i64 368)
  br label %fixmerge549
fixmerge549:
  %t1577 = phi i64 [ %t1575, %fixfast547 ], [ %t1576, %fixslow548 ]
  ret i64 %t1577
}

define fastcc i64 @"emit.internal:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1582 = icmp eq i64 %argc, 1
  br i1 %t1582, label %argok551, label %arityerr550
arityerr550:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok551:
  %t1583 = call i64 @rt_char_to_integer(i64 %a0)
  %t1584 = or i64 %t1583, 808
  %t1585 = and i64 %t1584, 7
  %t1586 = icmp eq i64 %t1585, 0
  br i1 %t1586, label %fixfast552, label %fixslow553
fixfast552:
  %t1587 = icmp eq i64 %t1583, 808
  %t1588 = select i1 %t1587, i64 257, i64 1
  br label %fixmerge554
fixslow553:
  %t1589 = call i64 @rt_num_eq(i64 %t1583, i64 808)
  br label %fixmerge554
fixmerge554:
  %t1590 = phi i64 [ %t1588, %fixfast552 ], [ %t1589, %fixslow553 ]
  %t1591 = icmp ne i64 %t1590, 1
  br i1 %t1591, label %then555, label %else556
then555:
  ret i64 %t1590
else556:
  %t1592 = or i64 %t1583, 552
  %t1593 = and i64 %t1592, 7
  %t1594 = icmp eq i64 %t1593, 0
  br i1 %t1594, label %fixfast557, label %fixslow558
fixfast557:
  %t1595 = icmp eq i64 %t1583, 552
  %t1596 = select i1 %t1595, i64 257, i64 1
  br label %fixmerge559
fixslow558:
  %t1597 = call i64 @rt_num_eq(i64 %t1583, i64 552)
  br label %fixmerge559
fixmerge559:
  %t1598 = phi i64 [ %t1596, %fixfast557 ], [ %t1597, %fixslow558 ]
  ret i64 %t1598
}

define fastcc i64 @"emit.internal:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1603 = icmp eq i64 %argc, 1
  br i1 %t1603, label %argok561, label %arityerr560
arityerr560:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok561:
  %t1604 = call i64 @rt_char_to_integer(i64 %a0)
  %t1605 = or i64 %t1604, 344
  %t1606 = and i64 %t1605, 7
  %t1607 = icmp eq i64 %t1606, 0
  br i1 %t1607, label %fixfast562, label %fixslow563
fixfast562:
  %t1608 = icmp eq i64 %t1604, 344
  %t1609 = select i1 %t1608, i64 257, i64 1
  br label %fixmerge564
fixslow563:
  %t1610 = call i64 @rt_num_eq(i64 %t1604, i64 344)
  br label %fixmerge564
fixmerge564:
  %t1611 = phi i64 [ %t1609, %fixfast562 ], [ %t1610, %fixslow563 ]
  %t1612 = icmp ne i64 %t1611, 1
  br i1 %t1612, label %then565, label %else566
then565:
  ret i64 %t1611
else566:
  %t1613 = or i64 %t1604, 360
  %t1614 = and i64 %t1613, 7
  %t1615 = icmp eq i64 %t1614, 0
  br i1 %t1615, label %fixfast567, label %fixslow568
fixfast567:
  %t1616 = icmp eq i64 %t1604, 360
  %t1617 = select i1 %t1616, i64 257, i64 1
  br label %fixmerge569
fixslow568:
  %t1618 = call i64 @rt_num_eq(i64 %t1604, i64 360)
  br label %fixmerge569
fixmerge569:
  %t1619 = phi i64 [ %t1617, %fixfast567 ], [ %t1618, %fixslow568 ]
  ret i64 %t1619
}

define fastcc i64 @"emit.internal:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1624 = icmp eq i64 %argc, 3
  br i1 %t1624, label %argok571, label %arityerr570
arityerr570:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok571:
  %t1625 = or i64 %a1, %a2
  %t1626 = and i64 %t1625, 7
  %t1627 = icmp eq i64 %t1626, 0
  br i1 %t1627, label %fixfast572, label %fixslow573
fixfast572:
  %t1628 = icmp slt i64 %a1, %a2
  %t1629 = select i1 %t1628, i64 257, i64 1
  br label %fixmerge574
fixslow573:
  %t1630 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge574
fixmerge574:
  %t1631 = phi i64 [ %t1629, %fixfast572 ], [ %t1630, %fixslow573 ]
  %t1632 = icmp ne i64 %t1631, 1
  br i1 %t1632, label %then575, label %else576
then575:
  %t1633 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1634 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1634)
  %t1635 = and i64 %t1634, -8
  %t1636 = inttoptr i64 %t1635 to ptr
  %t1637 = load i64, ptr %t1636
  %t1638 = inttoptr i64 %t1637 to ptr
  %t1639 = call fastcc i64%t1638(i64 %t1634, i64 1, i64 %t1633, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge577
else576:
  br label %merge577
merge577:
  %t1640 = phi i64 [ %t1639, %then575 ], [ 1, %else576 ]
  %t1641 = icmp ne i64 %t1640, 1
  br i1 %t1641, label %then578, label %else579
then578:
  %t1642 = or i64 %a1, 8
  %t1643 = and i64 %t1642, 7
  %t1644 = icmp eq i64 %t1643, 0
  br i1 %t1644, label %fixfast580, label %fixslow581
fixfast580:
  %t1645 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1646 = extractvalue {i64, i1} %t1645, 0
  %t1647 = extractvalue {i64, i1} %t1645, 1
  br i1 %t1647, label %fixslow581, label %fixmerge582
fixslow581:
  %t1648 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge582
fixmerge582:
  %t1649 = phi i64 [ %t1646, %fixfast580 ], [ %t1648, %fixslow581 ]
  %t1650 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1650)
  %t1651 = and i64 %t1650, -8
  %t1652 = inttoptr i64 %t1651 to ptr
  %t1653 = load i64, ptr %t1652
  %t1654 = inttoptr i64 %t1653 to ptr
  %t1655 = musttail call fastcc i64 %t1654(i64 %t1650, i64 3, i64 %a0, i64 %t1649, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1655
else579:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1660 = icmp eq i64 %argc, 1
  br i1 %t1660, label %argok584, label %arityerr583
arityerr583:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok584:
  %t1661 = call i64 @rt_string_length(i64 %a0)
  %t1662 = or i64 0, %t1661
  %t1663 = and i64 %t1662, 7
  %t1664 = icmp eq i64 %t1663, 0
  br i1 %t1664, label %fixfast585, label %fixslow586
fixfast585:
  %t1665 = icmp slt i64 0, %t1661
  %t1666 = select i1 %t1665, i64 257, i64 1
  br label %fixmerge587
fixslow586:
  %t1667 = call i64 @rt_lt(i64 0, i64 %t1661)
  br label %fixmerge587
fixmerge587:
  %t1668 = phi i64 [ %t1666, %fixfast585 ], [ %t1667, %fixslow586 ]
  %t1669 = icmp ne i64 %t1668, 1
  br i1 %t1669, label %then588, label %else589
then588:
  %t1670 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1671 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1671)
  %t1672 = and i64 %t1671, -8
  %t1673 = inttoptr i64 %t1672 to ptr
  %t1674 = load i64, ptr %t1673
  %t1675 = inttoptr i64 %t1674 to ptr
  %t1676 = call fastcc i64%t1675(i64 %t1671, i64 1, i64 %t1670, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1677 = icmp ne i64 %t1676, 1
  br i1 %t1677, label %then590, label %else591
then590:
  br label %merge592
else591:
  br label %merge592
merge592:
  %t1678 = phi i64 [ 8, %then590 ], [ 0, %else591 ]
  %t1679 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1679)
  %t1680 = and i64 %t1679, -8
  %t1681 = inttoptr i64 %t1680 to ptr
  %t1682 = load i64, ptr %t1681
  %t1683 = inttoptr i64 %t1682 to ptr
  %t1684 = call fastcc i64%t1683(i64 %t1679, i64 3, i64 %a0, i64 %t1678, i64 %t1661, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1685 = or i64 %t1684, %t1661
  %t1686 = and i64 %t1685, 7
  %t1687 = icmp eq i64 %t1686, 0
  br i1 %t1687, label %fixfast593, label %fixslow594
fixfast593:
  %t1688 = icmp slt i64 %t1684, %t1661
  %t1689 = select i1 %t1688, i64 257, i64 1
  br label %fixmerge595
fixslow594:
  %t1690 = call i64 @rt_lt(i64 %t1684, i64 %t1661)
  br label %fixmerge595
fixmerge595:
  %t1691 = phi i64 [ %t1689, %fixfast593 ], [ %t1690, %fixslow594 ]
  %t1692 = icmp ne i64 %t1691, 1
  br i1 %t1692, label %then596, label %else597
then596:
  %t1693 = call i64 @rt_string_ref(i64 %a0, i64 %t1684)
  %t1694 = load i64, ptr @"emit.internal:rd-dotchar?"
  call void @rt_check_callable(i64 %t1694)
  %t1695 = and i64 %t1694, -8
  %t1696 = inttoptr i64 %t1695 to ptr
  %t1697 = load i64, ptr %t1696
  %t1698 = inttoptr i64 %t1697 to ptr
  %t1699 = call fastcc i64%t1698(i64 %t1694, i64 1, i64 %t1693, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge598
else597:
  br label %merge598
merge598:
  %t1700 = phi i64 [ %t1699, %then596 ], [ 1, %else597 ]
  %t1701 = icmp ne i64 %t1700, 1
  br i1 %t1701, label %then599, label %else600
then599:
  %t1702 = or i64 %t1684, 8
  %t1703 = and i64 %t1702, 7
  %t1704 = icmp eq i64 %t1703, 0
  br i1 %t1704, label %fixfast602, label %fixslow603
fixfast602:
  %t1705 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1684, i64 8)
  %t1706 = extractvalue {i64, i1} %t1705, 0
  %t1707 = extractvalue {i64, i1} %t1705, 1
  br i1 %t1707, label %fixslow603, label %fixmerge604
fixslow603:
  %t1708 = call i64 @rt_add(i64 %t1684, i64 8)
  br label %fixmerge604
fixmerge604:
  %t1709 = phi i64 [ %t1706, %fixfast602 ], [ %t1708, %fixslow603 ]
  br label %merge601
else600:
  br label %merge601
merge601:
  %t1710 = phi i64 [ %t1709, %fixmerge604 ], [ %t1684, %else600 ]
  %t1711 = or i64 %t1684, %t1710
  %t1712 = and i64 %t1711, 7
  %t1713 = icmp eq i64 %t1712, 0
  br i1 %t1713, label %fixfast605, label %fixslow606
fixfast605:
  %t1714 = icmp slt i64 %t1684, %t1710
  %t1715 = select i1 %t1714, i64 257, i64 1
  br label %fixmerge607
fixslow606:
  %t1716 = call i64 @rt_lt(i64 %t1684, i64 %t1710)
  br label %fixmerge607
fixmerge607:
  %t1717 = phi i64 [ %t1715, %fixfast605 ], [ %t1716, %fixslow606 ]
  %t1718 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1718)
  %t1719 = and i64 %t1718, -8
  %t1720 = inttoptr i64 %t1719 to ptr
  %t1721 = load i64, ptr %t1720
  %t1722 = inttoptr i64 %t1721 to ptr
  %t1723 = call fastcc i64%t1722(i64 %t1718, i64 3, i64 %a0, i64 %t1710, i64 %t1661, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1724 = or i64 %t1678, %t1684
  %t1725 = and i64 %t1724, 7
  %t1726 = icmp eq i64 %t1725, 0
  br i1 %t1726, label %fixfast608, label %fixslow609
fixfast608:
  %t1727 = icmp slt i64 %t1678, %t1684
  %t1728 = select i1 %t1727, i64 257, i64 1
  br label %fixmerge610
fixslow609:
  %t1729 = call i64 @rt_lt(i64 %t1678, i64 %t1684)
  br label %fixmerge610
fixmerge610:
  %t1730 = phi i64 [ %t1728, %fixfast608 ], [ %t1729, %fixslow609 ]
  %t1731 = icmp ne i64 %t1730, 1
  br i1 %t1731, label %then611, label %else612
then611:
  br label %merge613
else612:
  %t1732 = or i64 %t1710, %t1723
  %t1733 = and i64 %t1732, 7
  %t1734 = icmp eq i64 %t1733, 0
  br i1 %t1734, label %fixfast614, label %fixslow615
fixfast614:
  %t1735 = icmp slt i64 %t1710, %t1723
  %t1736 = select i1 %t1735, i64 257, i64 1
  br label %fixmerge616
fixslow615:
  %t1737 = call i64 @rt_lt(i64 %t1710, i64 %t1723)
  br label %fixmerge616
fixmerge616:
  %t1738 = phi i64 [ %t1736, %fixfast614 ], [ %t1737, %fixslow615 ]
  br label %merge613
merge613:
  %t1739 = phi i64 [ %t1730, %then611 ], [ %t1738, %fixmerge616 ]
  %t1740 = icmp ne i64 %t1739, 1
  br i1 %t1740, label %then617, label %else618
then617:
  %t1741 = or i64 %t1723, %t1661
  %t1742 = and i64 %t1741, 7
  %t1743 = icmp eq i64 %t1742, 0
  br i1 %t1743, label %fixfast619, label %fixslow620
fixfast619:
  %t1744 = icmp slt i64 %t1723, %t1661
  %t1745 = select i1 %t1744, i64 257, i64 1
  br label %fixmerge621
fixslow620:
  %t1746 = call i64 @rt_lt(i64 %t1723, i64 %t1661)
  br label %fixmerge621
fixmerge621:
  %t1747 = phi i64 [ %t1745, %fixfast619 ], [ %t1746, %fixslow620 ]
  %t1748 = icmp ne i64 %t1747, 1
  br i1 %t1748, label %then622, label %else623
then622:
  %t1749 = call i64 @rt_string_ref(i64 %a0, i64 %t1723)
  %t1750 = load i64, ptr @"emit.internal:rd-exp-char?"
  call void @rt_check_callable(i64 %t1750)
  %t1751 = and i64 %t1750, -8
  %t1752 = inttoptr i64 %t1751 to ptr
  %t1753 = load i64, ptr %t1752
  %t1754 = inttoptr i64 %t1753 to ptr
  %t1755 = call fastcc i64%t1754(i64 %t1750, i64 1, i64 %t1749, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge624
else623:
  br label %merge624
merge624:
  %t1756 = phi i64 [ %t1755, %then622 ], [ 1, %else623 ]
  %t1757 = icmp ne i64 %t1756, 1
  br i1 %t1757, label %then625, label %else626
then625:
  %t1758 = or i64 %t1723, 8
  %t1759 = and i64 %t1758, 7
  %t1760 = icmp eq i64 %t1759, 0
  br i1 %t1760, label %fixfast628, label %fixslow629
fixfast628:
  %t1761 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1723, i64 8)
  %t1762 = extractvalue {i64, i1} %t1761, 0
  %t1763 = extractvalue {i64, i1} %t1761, 1
  br i1 %t1763, label %fixslow629, label %fixmerge630
fixslow629:
  %t1764 = call i64 @rt_add(i64 %t1723, i64 8)
  br label %fixmerge630
fixmerge630:
  %t1765 = phi i64 [ %t1762, %fixfast628 ], [ %t1764, %fixslow629 ]
  %t1766 = or i64 %t1765, %t1661
  %t1767 = and i64 %t1766, 7
  %t1768 = icmp eq i64 %t1767, 0
  br i1 %t1768, label %fixfast631, label %fixslow632
fixfast631:
  %t1769 = icmp slt i64 %t1765, %t1661
  %t1770 = select i1 %t1769, i64 257, i64 1
  br label %fixmerge633
fixslow632:
  %t1771 = call i64 @rt_lt(i64 %t1765, i64 %t1661)
  br label %fixmerge633
fixmerge633:
  %t1772 = phi i64 [ %t1770, %fixfast631 ], [ %t1771, %fixslow632 ]
  %t1773 = icmp ne i64 %t1772, 1
  br i1 %t1773, label %then634, label %else635
then634:
  %t1774 = or i64 %t1723, 8
  %t1775 = and i64 %t1774, 7
  %t1776 = icmp eq i64 %t1775, 0
  br i1 %t1776, label %fixfast637, label %fixslow638
fixfast637:
  %t1777 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1723, i64 8)
  %t1778 = extractvalue {i64, i1} %t1777, 0
  %t1779 = extractvalue {i64, i1} %t1777, 1
  br i1 %t1779, label %fixslow638, label %fixmerge639
fixslow638:
  %t1780 = call i64 @rt_add(i64 %t1723, i64 8)
  br label %fixmerge639
fixmerge639:
  %t1781 = phi i64 [ %t1778, %fixfast637 ], [ %t1780, %fixslow638 ]
  %t1782 = call i64 @rt_string_ref(i64 %a0, i64 %t1781)
  %t1783 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1783)
  %t1784 = and i64 %t1783, -8
  %t1785 = inttoptr i64 %t1784 to ptr
  %t1786 = load i64, ptr %t1785
  %t1787 = inttoptr i64 %t1786 to ptr
  %t1788 = call fastcc i64%t1787(i64 %t1783, i64 1, i64 %t1782, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge636
else635:
  br label %merge636
merge636:
  %t1789 = phi i64 [ %t1788, %fixmerge639 ], [ 1, %else635 ]
  %t1790 = icmp ne i64 %t1789, 1
  br i1 %t1790, label %then640, label %else641
then640:
  %t1791 = or i64 %t1723, 16
  %t1792 = and i64 %t1791, 7
  %t1793 = icmp eq i64 %t1792, 0
  br i1 %t1793, label %fixfast643, label %fixslow644
fixfast643:
  %t1794 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1723, i64 16)
  %t1795 = extractvalue {i64, i1} %t1794, 0
  %t1796 = extractvalue {i64, i1} %t1794, 1
  br i1 %t1796, label %fixslow644, label %fixmerge645
fixslow644:
  %t1797 = call i64 @rt_add(i64 %t1723, i64 16)
  br label %fixmerge645
fixmerge645:
  %t1798 = phi i64 [ %t1795, %fixfast643 ], [ %t1797, %fixslow644 ]
  br label %merge642
else641:
  %t1799 = or i64 %t1723, 8
  %t1800 = and i64 %t1799, 7
  %t1801 = icmp eq i64 %t1800, 0
  br i1 %t1801, label %fixfast646, label %fixslow647
fixfast646:
  %t1802 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1723, i64 8)
  %t1803 = extractvalue {i64, i1} %t1802, 0
  %t1804 = extractvalue {i64, i1} %t1802, 1
  br i1 %t1804, label %fixslow647, label %fixmerge648
fixslow647:
  %t1805 = call i64 @rt_add(i64 %t1723, i64 8)
  br label %fixmerge648
fixmerge648:
  %t1806 = phi i64 [ %t1803, %fixfast646 ], [ %t1805, %fixslow647 ]
  br label %merge642
merge642:
  %t1807 = phi i64 [ %t1798, %fixmerge645 ], [ %t1806, %fixmerge648 ]
  %t1808 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1808)
  %t1809 = and i64 %t1808, -8
  %t1810 = inttoptr i64 %t1809 to ptr
  %t1811 = load i64, ptr %t1810
  %t1812 = inttoptr i64 %t1811 to ptr
  %t1813 = call fastcc i64%t1812(i64 %t1808, i64 3, i64 %a0, i64 %t1807, i64 %t1661, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1814 = or i64 %t1807, %t1813
  %t1815 = and i64 %t1814, 7
  %t1816 = icmp eq i64 %t1815, 0
  br i1 %t1816, label %fixfast649, label %fixslow650
fixfast649:
  %t1817 = icmp slt i64 %t1807, %t1813
  %t1818 = select i1 %t1817, i64 257, i64 1
  br label %fixmerge651
fixslow650:
  %t1819 = call i64 @rt_lt(i64 %t1807, i64 %t1813)
  br label %fixmerge651
fixmerge651:
  %t1820 = phi i64 [ %t1818, %fixfast649 ], [ %t1819, %fixslow650 ]
  %t1821 = icmp ne i64 %t1820, 1
  br i1 %t1821, label %then652, label %else653
then652:
  br label %merge654
else653:
  br label %merge654
merge654:
  %t1822 = phi i64 [ %t1813, %then652 ], [ -8, %else653 ]
  br label %merge627
else626:
  br label %merge627
merge627:
  %t1823 = phi i64 [ %t1822, %merge654 ], [ %t1723, %else626 ]
  %t1824 = or i64 -8, %t1823
  %t1825 = and i64 %t1824, 7
  %t1826 = icmp eq i64 %t1825, 0
  br i1 %t1826, label %fixfast655, label %fixslow656
fixfast655:
  %t1827 = icmp slt i64 -8, %t1823
  %t1828 = select i1 %t1827, i64 257, i64 1
  br label %fixmerge657
fixslow656:
  %t1829 = call i64 @rt_lt(i64 -8, i64 %t1823)
  br label %fixmerge657
fixmerge657:
  %t1830 = phi i64 [ %t1828, %fixfast655 ], [ %t1829, %fixslow656 ]
  %t1831 = icmp ne i64 %t1830, 1
  br i1 %t1831, label %then658, label %else659
then658:
  %t1832 = or i64 %t1823, %t1661
  %t1833 = and i64 %t1832, 7
  %t1834 = icmp eq i64 %t1833, 0
  br i1 %t1834, label %fixfast660, label %fixslow661
fixfast660:
  %t1835 = icmp eq i64 %t1823, %t1661
  %t1836 = select i1 %t1835, i64 257, i64 1
  br label %fixmerge662
fixslow661:
  %t1837 = call i64 @rt_num_eq(i64 %t1823, i64 %t1661)
  br label %fixmerge662
fixmerge662:
  %t1838 = phi i64 [ %t1836, %fixfast660 ], [ %t1837, %fixslow661 ]
  %t1839 = icmp ne i64 %t1838, 1
  br i1 %t1839, label %then663, label %else664
then663:
  %t1840 = icmp ne i64 %t1717, 1
  br i1 %t1840, label %then665, label %else666
then665:
  ret i64 %t1717
else666:
  %t1841 = or i64 %t1723, %t1823
  %t1842 = and i64 %t1841, 7
  %t1843 = icmp eq i64 %t1842, 0
  br i1 %t1843, label %fixfast667, label %fixslow668
fixfast667:
  %t1844 = icmp slt i64 %t1723, %t1823
  %t1845 = select i1 %t1844, i64 257, i64 1
  br label %fixmerge669
fixslow668:
  %t1846 = call i64 @rt_lt(i64 %t1723, i64 %t1823)
  br label %fixmerge669
fixmerge669:
  %t1847 = phi i64 [ %t1845, %fixfast667 ], [ %t1846, %fixslow668 ]
  ret i64 %t1847
else664:
  ret i64 1
else659:
  ret i64 1
else618:
  ret i64 1
else589:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_532"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1852 = icmp eq i64 %argc, 1
  br i1 %t1852, label %argok671, label %arityerr670
arityerr670:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok671:
  %t1853 = and i64 %self, -8
  %t1854 = inttoptr i64 %t1853 to ptr
  %t1855 = getelementptr i64, ptr %t1854, i64 1
  %t1856 = load i64, ptr %t1855
  %t1857 = or i64 %a0, %t1856
  %t1858 = and i64 %t1857, 7
  %t1859 = icmp eq i64 %t1858, 0
  br i1 %t1859, label %fixfast672, label %fixslow673
fixfast672:
  %t1860 = icmp slt i64 %a0, %t1856
  %t1861 = select i1 %t1860, i64 257, i64 1
  br label %fixmerge674
fixslow673:
  %t1862 = call i64 @rt_lt(i64 %a0, i64 %t1856)
  br label %fixmerge674
fixmerge674:
  %t1863 = phi i64 [ %t1861, %fixfast672 ], [ %t1862, %fixslow673 ]
  %t1864 = icmp ne i64 %t1863, 1
  br i1 %t1864, label %then675, label %else676
then675:
  %t1865 = and i64 %self, -8
  %t1866 = inttoptr i64 %t1865 to ptr
  %t1867 = getelementptr i64, ptr %t1866, i64 2
  %t1868 = load i64, ptr %t1867
  %t1869 = call i64 @rt_string_ref(i64 %t1868, i64 %a0)
  %t1870 = load i64, ptr @"emit.internal:rd-fold-char"
  call void @rt_check_callable(i64 %t1870)
  %t1871 = and i64 %t1870, -8
  %t1872 = inttoptr i64 %t1871 to ptr
  %t1873 = load i64, ptr %t1872
  %t1874 = inttoptr i64 %t1873 to ptr
  %t1875 = call fastcc i64%t1874(i64 %t1870, i64 1, i64 %t1869, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1876 = call i64 @rt_char_to_integer(i64 %t1875)
  %t1877 = and i64 %self, -8
  %t1878 = inttoptr i64 %t1877 to ptr
  %t1879 = getelementptr i64, ptr %t1878, i64 3
  %t1880 = load i64, ptr %t1879
  %t1881 = call i64 @rt_string_ref(i64 %t1880, i64 %a0)
  %t1882 = call i64 @rt_char_to_integer(i64 %t1881)
  %t1883 = or i64 %t1876, %t1882
  %t1884 = and i64 %t1883, 7
  %t1885 = icmp eq i64 %t1884, 0
  br i1 %t1885, label %fixfast677, label %fixslow678
fixfast677:
  %t1886 = icmp eq i64 %t1876, %t1882
  %t1887 = select i1 %t1886, i64 257, i64 1
  br label %fixmerge679
fixslow678:
  %t1888 = call i64 @rt_num_eq(i64 %t1876, i64 %t1882)
  br label %fixmerge679
fixmerge679:
  %t1889 = phi i64 [ %t1887, %fixfast677 ], [ %t1888, %fixslow678 ]
  %t1890 = icmp ne i64 %t1889, 1
  br i1 %t1890, label %then680, label %else681
then680:
  %t1891 = or i64 %a0, 8
  %t1892 = and i64 %t1891, 7
  %t1893 = icmp eq i64 %t1892, 0
  br i1 %t1893, label %fixfast682, label %fixslow683
fixfast682:
  %t1894 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t1895 = extractvalue {i64, i1} %t1894, 0
  %t1896 = extractvalue {i64, i1} %t1894, 1
  br i1 %t1896, label %fixslow683, label %fixmerge684
fixslow683:
  %t1897 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge684
fixmerge684:
  %t1898 = phi i64 [ %t1895, %fixfast682 ], [ %t1897, %fixslow683 ]
  %t1899 = musttail call fastcc i64 @"emit.internal:code_532"(i64 %self, i64 1, i64 %t1898, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1899
else681:
  ret i64 1
else676:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-ci=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1900 = icmp eq i64 %argc, 2
  br i1 %t1900, label %argok686, label %arityerr685
arityerr685:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok686:
  %t1901 = call i64 @rt_string_length(i64 %a0)
  %t1902 = call i64 @rt_string_length(i64 %a1)
  %t1903 = or i64 %t1901, %t1902
  %t1904 = and i64 %t1903, 7
  %t1905 = icmp eq i64 %t1904, 0
  br i1 %t1905, label %fixfast687, label %fixslow688
fixfast687:
  %t1906 = icmp eq i64 %t1901, %t1902
  %t1907 = select i1 %t1906, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t1908 = call i64 @rt_num_eq(i64 %t1901, i64 %t1902)
  br label %fixmerge689
fixmerge689:
  %t1909 = phi i64 [ %t1907, %fixfast687 ], [ %t1908, %fixslow688 ]
  %t1910 = icmp ne i64 %t1909, 1
  br i1 %t1910, label %then690, label %else691
then690:
  %t1911 = call ptr @rt_alloc_words(i64 5)
  %t1912 = ptrtoint ptr %t1911 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_532" to i64), ptr %t1911
  %t1913 = or i64 %t1912, 4
  %t1914 = getelementptr i64, ptr %t1911, i64 1
  store i64 %t1901, ptr %t1914
  %t1915 = getelementptr i64, ptr %t1911, i64 2
  store i64 %a0, ptr %t1915
  %t1916 = getelementptr i64, ptr %t1911, i64 3
  store i64 %a1, ptr %t1916
  %t1917 = getelementptr i64, ptr %t1911, i64 4
  store i64 %t1913, ptr %t1917
  %t1918 = musttail call fastcc i64 @"emit.internal:code_532"(i64 %t1913, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1918
else691:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1923 = icmp eq i64 %argc, 1
  br i1 %t1923, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok693:
  %t1924 = call i64 @rt_make_string(ptr @.str.lit.2, i64 6)
  %t1925 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t1925)
  %t1926 = and i64 %t1925, -8
  %t1927 = inttoptr i64 %t1926 to ptr
  %t1928 = load i64, ptr %t1927
  %t1929 = inttoptr i64 %t1928 to ptr
  %t1930 = call fastcc i64%t1929(i64 %t1925, i64 2, i64 %a0, i64 %t1924, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1931 = icmp ne i64 %t1930, 1
  br i1 %t1931, label %then694, label %else695
then694:
  %t1932 = call i64 @rt_make_string(ptr @.str.lit.3, i64 3)
  %t1933 = call i64 @rt_string_to_flonum(i64 %t1932)
  ret i64 %t1933
else695:
  %t1934 = call i64 @rt_make_string(ptr @.str.lit.4, i64 6)
  %t1935 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t1935)
  %t1936 = and i64 %t1935, -8
  %t1937 = inttoptr i64 %t1936 to ptr
  %t1938 = load i64, ptr %t1937
  %t1939 = inttoptr i64 %t1938 to ptr
  %t1940 = call fastcc i64%t1939(i64 %t1935, i64 2, i64 %a0, i64 %t1934, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1941 = icmp ne i64 %t1940, 1
  br i1 %t1941, label %then696, label %else697
then696:
  %t1942 = call i64 @rt_make_string(ptr @.str.lit.5, i64 4)
  %t1943 = call i64 @rt_string_to_flonum(i64 %t1942)
  ret i64 %t1943
else697:
  %t1944 = call i64 @rt_make_string(ptr @.str.lit.6, i64 6)
  %t1945 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t1945)
  %t1946 = and i64 %t1945, -8
  %t1947 = inttoptr i64 %t1946 to ptr
  %t1948 = load i64, ptr %t1947
  %t1949 = inttoptr i64 %t1948 to ptr
  %t1950 = call fastcc i64%t1949(i64 %t1945, i64 2, i64 %a0, i64 %t1944, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1951 = icmp ne i64 %t1950, 1
  br i1 %t1951, label %then698, label %else699
then698:
  %t1952 = call i64 @rt_make_string(ptr @.str.lit.7, i64 3)
  %t1953 = call i64 @rt_string_to_flonum(i64 %t1952)
  ret i64 %t1953
else699:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-radix-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1958 = icmp eq i64 %argc, 1
  br i1 %t1958, label %argok701, label %arityerr700
arityerr700:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok701:
  %t1959 = call i64 @rt_char_to_integer(i64 %a0)
  %t1960 = or i64 %t1959, 784
  %t1961 = and i64 %t1960, 7
  %t1962 = icmp eq i64 %t1961, 0
  br i1 %t1962, label %fixfast702, label %fixslow703
fixfast702:
  %t1963 = icmp eq i64 %t1959, 784
  %t1964 = select i1 %t1963, i64 257, i64 1
  br label %fixmerge704
fixslow703:
  %t1965 = call i64 @rt_num_eq(i64 %t1959, i64 784)
  br label %fixmerge704
fixmerge704:
  %t1966 = phi i64 [ %t1964, %fixfast702 ], [ %t1965, %fixslow703 ]
  %t1967 = icmp ne i64 %t1966, 1
  br i1 %t1967, label %then705, label %else706
then705:
  br label %merge707
else706:
  %t1968 = or i64 %t1959, 528
  %t1969 = and i64 %t1968, 7
  %t1970 = icmp eq i64 %t1969, 0
  br i1 %t1970, label %fixfast708, label %fixslow709
fixfast708:
  %t1971 = icmp eq i64 %t1959, 528
  %t1972 = select i1 %t1971, i64 257, i64 1
  br label %fixmerge710
fixslow709:
  %t1973 = call i64 @rt_num_eq(i64 %t1959, i64 528)
  br label %fixmerge710
fixmerge710:
  %t1974 = phi i64 [ %t1972, %fixfast708 ], [ %t1973, %fixslow709 ]
  br label %merge707
merge707:
  %t1975 = phi i64 [ %t1966, %then705 ], [ %t1974, %fixmerge710 ]
  %t1976 = icmp ne i64 %t1975, 1
  br i1 %t1976, label %then711, label %else712
then711:
  ret i64 16
else712:
  %t1977 = or i64 %t1959, 888
  %t1978 = and i64 %t1977, 7
  %t1979 = icmp eq i64 %t1978, 0
  br i1 %t1979, label %fixfast713, label %fixslow714
fixfast713:
  %t1980 = icmp eq i64 %t1959, 888
  %t1981 = select i1 %t1980, i64 257, i64 1
  br label %fixmerge715
fixslow714:
  %t1982 = call i64 @rt_num_eq(i64 %t1959, i64 888)
  br label %fixmerge715
fixmerge715:
  %t1983 = phi i64 [ %t1981, %fixfast713 ], [ %t1982, %fixslow714 ]
  %t1984 = icmp ne i64 %t1983, 1
  br i1 %t1984, label %then716, label %else717
then716:
  br label %merge718
else717:
  %t1985 = or i64 %t1959, 632
  %t1986 = and i64 %t1985, 7
  %t1987 = icmp eq i64 %t1986, 0
  br i1 %t1987, label %fixfast719, label %fixslow720
fixfast719:
  %t1988 = icmp eq i64 %t1959, 632
  %t1989 = select i1 %t1988, i64 257, i64 1
  br label %fixmerge721
fixslow720:
  %t1990 = call i64 @rt_num_eq(i64 %t1959, i64 632)
  br label %fixmerge721
fixmerge721:
  %t1991 = phi i64 [ %t1989, %fixfast719 ], [ %t1990, %fixslow720 ]
  br label %merge718
merge718:
  %t1992 = phi i64 [ %t1983, %then716 ], [ %t1991, %fixmerge721 ]
  %t1993 = icmp ne i64 %t1992, 1
  br i1 %t1993, label %then722, label %else723
then722:
  ret i64 64
else723:
  %t1994 = or i64 %t1959, 800
  %t1995 = and i64 %t1994, 7
  %t1996 = icmp eq i64 %t1995, 0
  br i1 %t1996, label %fixfast724, label %fixslow725
fixfast724:
  %t1997 = icmp eq i64 %t1959, 800
  %t1998 = select i1 %t1997, i64 257, i64 1
  br label %fixmerge726
fixslow725:
  %t1999 = call i64 @rt_num_eq(i64 %t1959, i64 800)
  br label %fixmerge726
fixmerge726:
  %t2000 = phi i64 [ %t1998, %fixfast724 ], [ %t1999, %fixslow725 ]
  %t2001 = icmp ne i64 %t2000, 1
  br i1 %t2001, label %then727, label %else728
then727:
  br label %merge729
else728:
  %t2002 = or i64 %t1959, 544
  %t2003 = and i64 %t2002, 7
  %t2004 = icmp eq i64 %t2003, 0
  br i1 %t2004, label %fixfast730, label %fixslow731
fixfast730:
  %t2005 = icmp eq i64 %t1959, 544
  %t2006 = select i1 %t2005, i64 257, i64 1
  br label %fixmerge732
fixslow731:
  %t2007 = call i64 @rt_num_eq(i64 %t1959, i64 544)
  br label %fixmerge732
fixmerge732:
  %t2008 = phi i64 [ %t2006, %fixfast730 ], [ %t2007, %fixslow731 ]
  br label %merge729
merge729:
  %t2009 = phi i64 [ %t2000, %then727 ], [ %t2008, %fixmerge732 ]
  %t2010 = icmp ne i64 %t2009, 1
  br i1 %t2010, label %then733, label %else734
then733:
  ret i64 80
else734:
  %t2011 = or i64 %t1959, 960
  %t2012 = and i64 %t2011, 7
  %t2013 = icmp eq i64 %t2012, 0
  br i1 %t2013, label %fixfast735, label %fixslow736
fixfast735:
  %t2014 = icmp eq i64 %t1959, 960
  %t2015 = select i1 %t2014, i64 257, i64 1
  br label %fixmerge737
fixslow736:
  %t2016 = call i64 @rt_num_eq(i64 %t1959, i64 960)
  br label %fixmerge737
fixmerge737:
  %t2017 = phi i64 [ %t2015, %fixfast735 ], [ %t2016, %fixslow736 ]
  %t2018 = icmp ne i64 %t2017, 1
  br i1 %t2018, label %then738, label %else739
then738:
  br label %merge740
else739:
  %t2019 = or i64 %t1959, 704
  %t2020 = and i64 %t2019, 7
  %t2021 = icmp eq i64 %t2020, 0
  br i1 %t2021, label %fixfast741, label %fixslow742
fixfast741:
  %t2022 = icmp eq i64 %t1959, 704
  %t2023 = select i1 %t2022, i64 257, i64 1
  br label %fixmerge743
fixslow742:
  %t2024 = call i64 @rt_num_eq(i64 %t1959, i64 704)
  br label %fixmerge743
fixmerge743:
  %t2025 = phi i64 [ %t2023, %fixfast741 ], [ %t2024, %fixslow742 ]
  br label %merge740
merge740:
  %t2026 = phi i64 [ %t2017, %then738 ], [ %t2025, %fixmerge743 ]
  %t2027 = icmp ne i64 %t2026, 1
  br i1 %t2027, label %then744, label %else745
then744:
  ret i64 128
else745:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2032 = icmp eq i64 %argc, 1
  br i1 %t2032, label %argok747, label %arityerr746
arityerr746:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok747:
  %t2033 = call i64 @rt_char_to_integer(i64 %a0)
  %t2034 = or i64 %t2033, 808
  %t2035 = and i64 %t2034, 7
  %t2036 = icmp eq i64 %t2035, 0
  br i1 %t2036, label %fixfast748, label %fixslow749
fixfast748:
  %t2037 = icmp eq i64 %t2033, 808
  %t2038 = select i1 %t2037, i64 257, i64 1
  br label %fixmerge750
fixslow749:
  %t2039 = call i64 @rt_num_eq(i64 %t2033, i64 808)
  br label %fixmerge750
fixmerge750:
  %t2040 = phi i64 [ %t2038, %fixfast748 ], [ %t2039, %fixslow749 ]
  %t2041 = icmp ne i64 %t2040, 1
  br i1 %t2041, label %then751, label %else752
then751:
  br label %merge753
else752:
  %t2042 = or i64 %t2033, 552
  %t2043 = and i64 %t2042, 7
  %t2044 = icmp eq i64 %t2043, 0
  br i1 %t2044, label %fixfast754, label %fixslow755
fixfast754:
  %t2045 = icmp eq i64 %t2033, 552
  %t2046 = select i1 %t2045, i64 257, i64 1
  br label %fixmerge756
fixslow755:
  %t2047 = call i64 @rt_num_eq(i64 %t2033, i64 552)
  br label %fixmerge756
fixmerge756:
  %t2048 = phi i64 [ %t2046, %fixfast754 ], [ %t2047, %fixslow755 ]
  br label %merge753
merge753:
  %t2049 = phi i64 [ %t2040, %then751 ], [ %t2048, %fixmerge756 ]
  %t2050 = icmp ne i64 %t2049, 1
  br i1 %t2050, label %then757, label %else758
then757:
  ret i64 8
else758:
  %t2051 = or i64 %t2033, 840
  %t2052 = and i64 %t2051, 7
  %t2053 = icmp eq i64 %t2052, 0
  br i1 %t2053, label %fixfast759, label %fixslow760
fixfast759:
  %t2054 = icmp eq i64 %t2033, 840
  %t2055 = select i1 %t2054, i64 257, i64 1
  br label %fixmerge761
fixslow760:
  %t2056 = call i64 @rt_num_eq(i64 %t2033, i64 840)
  br label %fixmerge761
fixmerge761:
  %t2057 = phi i64 [ %t2055, %fixfast759 ], [ %t2056, %fixslow760 ]
  %t2058 = icmp ne i64 %t2057, 1
  br i1 %t2058, label %then762, label %else763
then762:
  br label %merge764
else763:
  %t2059 = or i64 %t2033, 584
  %t2060 = and i64 %t2059, 7
  %t2061 = icmp eq i64 %t2060, 0
  br i1 %t2061, label %fixfast765, label %fixslow766
fixfast765:
  %t2062 = icmp eq i64 %t2033, 584
  %t2063 = select i1 %t2062, i64 257, i64 1
  br label %fixmerge767
fixslow766:
  %t2064 = call i64 @rt_num_eq(i64 %t2033, i64 584)
  br label %fixmerge767
fixmerge767:
  %t2065 = phi i64 [ %t2063, %fixfast765 ], [ %t2064, %fixslow766 ]
  br label %merge764
merge764:
  %t2066 = phi i64 [ %t2057, %then762 ], [ %t2065, %fixmerge767 ]
  %t2067 = icmp ne i64 %t2066, 1
  br i1 %t2067, label %then768, label %else769
then768:
  ret i64 16
else769:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-scan-prefixes"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2072 = icmp eq i64 %argc, 5
  br i1 %t2072, label %argok771, label %arityerr770
arityerr770:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok771:
  %t2073 = or i64 %a2, %a1
  %t2074 = and i64 %t2073, 7
  %t2075 = icmp eq i64 %t2074, 0
  br i1 %t2075, label %fixfast772, label %fixslow773
fixfast772:
  %t2076 = icmp slt i64 %a2, %a1
  %t2077 = select i1 %t2076, i64 257, i64 1
  br label %fixmerge774
fixslow773:
  %t2078 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge774
fixmerge774:
  %t2079 = phi i64 [ %t2077, %fixfast772 ], [ %t2078, %fixslow773 ]
  %t2080 = icmp ne i64 %t2079, 1
  br i1 %t2080, label %then775, label %else776
then775:
  %t2081 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2082 = call i64 @rt_char_to_integer(i64 %t2081)
  %t2083 = or i64 %t2082, 280
  %t2084 = and i64 %t2083, 7
  %t2085 = icmp eq i64 %t2084, 0
  br i1 %t2085, label %fixfast778, label %fixslow779
fixfast778:
  %t2086 = icmp eq i64 %t2082, 280
  %t2087 = select i1 %t2086, i64 257, i64 1
  br label %fixmerge780
fixslow779:
  %t2088 = call i64 @rt_num_eq(i64 %t2082, i64 280)
  br label %fixmerge780
fixmerge780:
  %t2089 = phi i64 [ %t2087, %fixfast778 ], [ %t2088, %fixslow779 ]
  br label %merge777
else776:
  br label %merge777
merge777:
  %t2090 = phi i64 [ %t2089, %fixmerge780 ], [ 1, %else776 ]
  %t2091 = icmp ne i64 %t2090, 1
  br i1 %t2091, label %then781, label %else782
then781:
  %t2092 = or i64 %a2, 8
  %t2093 = and i64 %t2092, 7
  %t2094 = icmp eq i64 %t2093, 0
  br i1 %t2094, label %fixfast783, label %fixslow784
fixfast783:
  %t2095 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2096 = extractvalue {i64, i1} %t2095, 0
  %t2097 = extractvalue {i64, i1} %t2095, 1
  br i1 %t2097, label %fixslow784, label %fixmerge785
fixslow784:
  %t2098 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge785
fixmerge785:
  %t2099 = phi i64 [ %t2096, %fixfast783 ], [ %t2098, %fixslow784 ]
  %t2100 = or i64 %t2099, %a1
  %t2101 = and i64 %t2100, 7
  %t2102 = icmp eq i64 %t2101, 0
  br i1 %t2102, label %fixfast786, label %fixslow787
fixfast786:
  %t2103 = icmp slt i64 %t2099, %a1
  %t2104 = select i1 %t2103, i64 257, i64 1
  br label %fixmerge788
fixslow787:
  %t2105 = call i64 @rt_lt(i64 %t2099, i64 %a1)
  br label %fixmerge788
fixmerge788:
  %t2106 = phi i64 [ %t2104, %fixfast786 ], [ %t2105, %fixslow787 ]
  %t2107 = icmp ne i64 %t2106, 1
  br i1 %t2107, label %then789, label %else790
then789:
  %t2108 = or i64 %a2, 8
  %t2109 = and i64 %t2108, 7
  %t2110 = icmp eq i64 %t2109, 0
  br i1 %t2110, label %fixfast791, label %fixslow792
fixfast791:
  %t2111 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2112 = extractvalue {i64, i1} %t2111, 0
  %t2113 = extractvalue {i64, i1} %t2111, 1
  br i1 %t2113, label %fixslow792, label %fixmerge793
fixslow792:
  %t2114 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge793
fixmerge793:
  %t2115 = phi i64 [ %t2112, %fixfast791 ], [ %t2114, %fixslow792 ]
  %t2116 = call i64 @rt_string_ref(i64 %a0, i64 %t2115)
  %t2117 = load i64, ptr @"emit.internal:rd-radix-letter"
  call void @rt_check_callable(i64 %t2117)
  %t2118 = and i64 %t2117, -8
  %t2119 = inttoptr i64 %t2118 to ptr
  %t2120 = load i64, ptr %t2119
  %t2121 = inttoptr i64 %t2120 to ptr
  %t2122 = call fastcc i64%t2121(i64 %t2117, i64 1, i64 %t2116, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2123 = icmp ne i64 %t2122, 1
  br i1 %t2123, label %then794, label %else795
then794:
  %t2124 = icmp ne i64 %a3, 1
  br i1 %t2124, label %then796, label %else797
then796:
  ret i64 1
else797:
  %t2125 = or i64 %a2, 16
  %t2126 = and i64 %t2125, 7
  %t2127 = icmp eq i64 %t2126, 0
  br i1 %t2127, label %fixfast798, label %fixslow799
fixfast798:
  %t2128 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2129 = extractvalue {i64, i1} %t2128, 0
  %t2130 = extractvalue {i64, i1} %t2128, 1
  br i1 %t2130, label %fixslow799, label %fixmerge800
fixslow799:
  %t2131 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge800
fixmerge800:
  %t2132 = phi i64 [ %t2129, %fixfast798 ], [ %t2131, %fixslow799 ]
  %t2133 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2133)
  %t2134 = and i64 %t2133, -8
  %t2135 = inttoptr i64 %t2134 to ptr
  %t2136 = load i64, ptr %t2135
  %t2137 = inttoptr i64 %t2136 to ptr
  %t2138 = musttail call fastcc i64 %t2137(i64 %t2133, i64 5, i64 %a0, i64 %a1, i64 %t2132, i64 %t2122, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2138
else795:
  %t2139 = or i64 %a2, 8
  %t2140 = and i64 %t2139, 7
  %t2141 = icmp eq i64 %t2140, 0
  br i1 %t2141, label %fixfast801, label %fixslow802
fixfast801:
  %t2142 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2143 = extractvalue {i64, i1} %t2142, 0
  %t2144 = extractvalue {i64, i1} %t2142, 1
  br i1 %t2144, label %fixslow802, label %fixmerge803
fixslow802:
  %t2145 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge803
fixmerge803:
  %t2146 = phi i64 [ %t2143, %fixfast801 ], [ %t2145, %fixslow802 ]
  %t2147 = call i64 @rt_string_ref(i64 %a0, i64 %t2146)
  %t2148 = load i64, ptr @"emit.internal:rd-exactness-letter"
  call void @rt_check_callable(i64 %t2148)
  %t2149 = and i64 %t2148, -8
  %t2150 = inttoptr i64 %t2149 to ptr
  %t2151 = load i64, ptr %t2150
  %t2152 = inttoptr i64 %t2151 to ptr
  %t2153 = call fastcc i64%t2152(i64 %t2148, i64 1, i64 %t2147, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2154 = icmp ne i64 %t2153, 1
  br i1 %t2154, label %then804, label %else805
then804:
  %t2155 = icmp ne i64 %a4, 1
  br i1 %t2155, label %then806, label %else807
then806:
  ret i64 1
else807:
  %t2156 = or i64 %a2, 16
  %t2157 = and i64 %t2156, 7
  %t2158 = icmp eq i64 %t2157, 0
  br i1 %t2158, label %fixfast808, label %fixslow809
fixfast808:
  %t2159 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2160 = extractvalue {i64, i1} %t2159, 0
  %t2161 = extractvalue {i64, i1} %t2159, 1
  br i1 %t2161, label %fixslow809, label %fixmerge810
fixslow809:
  %t2162 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge810
fixmerge810:
  %t2163 = phi i64 [ %t2160, %fixfast808 ], [ %t2162, %fixslow809 ]
  %t2164 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2164)
  %t2165 = and i64 %t2164, -8
  %t2166 = inttoptr i64 %t2165 to ptr
  %t2167 = load i64, ptr %t2166
  %t2168 = inttoptr i64 %t2167 to ptr
  %t2169 = musttail call fastcc i64 %t2168(i64 %t2164, i64 5, i64 %a0, i64 %a1, i64 %t2163, i64 %a3, i64 %t2153, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2169
else805:
  ret i64 1
else790:
  ret i64 1
else782:
  %t2170 = call i64 @rt_cons(i64 %a4, i64 %a2)
  %t2171 = call i64 @rt_cons(i64 %a3, i64 %t2170)
  ret i64 %t2171
}

define fastcc i64 @"emit.internal:code:rd-radix-scan"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2176 = icmp eq i64 %argc, 4
  br i1 %t2176, label %argok812, label %arityerr811
arityerr811:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok812:
  %t2177 = or i64 %a2, %a1
  %t2178 = and i64 %t2177, 7
  %t2179 = icmp eq i64 %t2178, 0
  br i1 %t2179, label %fixfast813, label %fixslow814
fixfast813:
  %t2180 = icmp slt i64 %a2, %a1
  %t2181 = select i1 %t2180, i64 257, i64 1
  br label %fixmerge815
fixslow814:
  %t2182 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge815
fixmerge815:
  %t2183 = phi i64 [ %t2181, %fixfast813 ], [ %t2182, %fixslow814 ]
  %t2184 = icmp ne i64 %t2183, 1
  br i1 %t2184, label %then816, label %else817
then816:
  %t2185 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2186 = load i64, ptr @"emit.internal:%digit-in-radix"
  call void @rt_check_callable(i64 %t2186)
  %t2187 = and i64 %t2186, -8
  %t2188 = inttoptr i64 %t2187 to ptr
  %t2189 = load i64, ptr %t2188
  %t2190 = inttoptr i64 %t2189 to ptr
  %t2191 = call fastcc i64%t2190(i64 %t2186, i64 2, i64 %t2185, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge818
else817:
  br label %merge818
merge818:
  %t2192 = phi i64 [ %t2191, %then816 ], [ 1, %else817 ]
  %t2193 = icmp ne i64 %t2192, 1
  br i1 %t2193, label %then819, label %else820
then819:
  %t2194 = or i64 %a2, 8
  %t2195 = and i64 %t2194, 7
  %t2196 = icmp eq i64 %t2195, 0
  br i1 %t2196, label %fixfast821, label %fixslow822
fixfast821:
  %t2197 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2198 = extractvalue {i64, i1} %t2197, 0
  %t2199 = extractvalue {i64, i1} %t2197, 1
  br i1 %t2199, label %fixslow822, label %fixmerge823
fixslow822:
  %t2200 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge823
fixmerge823:
  %t2201 = phi i64 [ %t2198, %fixfast821 ], [ %t2200, %fixslow822 ]
  %t2202 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2202)
  %t2203 = and i64 %t2202, -8
  %t2204 = inttoptr i64 %t2203 to ptr
  %t2205 = load i64, ptr %t2204
  %t2206 = inttoptr i64 %t2205 to ptr
  %t2207 = musttail call fastcc i64 %t2206(i64 %t2202, i64 4, i64 %a0, i64 %a1, i64 %t2201, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2207
else820:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-rational-body?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2212 = icmp eq i64 %argc, 4
  br i1 %t2212, label %argok825, label %arityerr824
arityerr824:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok825:
  %t2213 = or i64 %a2, %a1
  %t2214 = and i64 %t2213, 7
  %t2215 = icmp eq i64 %t2214, 0
  br i1 %t2215, label %fixfast826, label %fixslow827
fixfast826:
  %t2216 = icmp slt i64 %a2, %a1
  %t2217 = select i1 %t2216, i64 257, i64 1
  br label %fixmerge828
fixslow827:
  %t2218 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge828
fixmerge828:
  %t2219 = phi i64 [ %t2217, %fixfast826 ], [ %t2218, %fixslow827 ]
  %t2220 = icmp ne i64 %t2219, 1
  br i1 %t2220, label %then829, label %else830
then829:
  %t2221 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2222 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t2222)
  %t2223 = and i64 %t2222, -8
  %t2224 = inttoptr i64 %t2223 to ptr
  %t2225 = load i64, ptr %t2224
  %t2226 = inttoptr i64 %t2225 to ptr
  %t2227 = call fastcc i64%t2226(i64 %t2222, i64 1, i64 %t2221, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge831
else830:
  br label %merge831
merge831:
  %t2228 = phi i64 [ %t2227, %then829 ], [ 1, %else830 ]
  %t2229 = icmp ne i64 %t2228, 1
  br i1 %t2229, label %then832, label %else833
then832:
  %t2230 = or i64 %a2, 8
  %t2231 = and i64 %t2230, 7
  %t2232 = icmp eq i64 %t2231, 0
  br i1 %t2232, label %fixfast835, label %fixslow836
fixfast835:
  %t2233 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2234 = extractvalue {i64, i1} %t2233, 0
  %t2235 = extractvalue {i64, i1} %t2233, 1
  br i1 %t2235, label %fixslow836, label %fixmerge837
fixslow836:
  %t2236 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge837
fixmerge837:
  %t2237 = phi i64 [ %t2234, %fixfast835 ], [ %t2236, %fixslow836 ]
  br label %merge834
else833:
  br label %merge834
merge834:
  %t2238 = phi i64 [ %t2237, %fixmerge837 ], [ %a2, %else833 ]
  %t2239 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2239)
  %t2240 = and i64 %t2239, -8
  %t2241 = inttoptr i64 %t2240 to ptr
  %t2242 = load i64, ptr %t2241
  %t2243 = inttoptr i64 %t2242 to ptr
  %t2244 = call fastcc i64%t2243(i64 %t2239, i64 4, i64 %a0, i64 %a1, i64 %t2238, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2245 = or i64 %t2238, %t2244
  %t2246 = and i64 %t2245, 7
  %t2247 = icmp eq i64 %t2246, 0
  br i1 %t2247, label %fixfast838, label %fixslow839
fixfast838:
  %t2248 = icmp slt i64 %t2238, %t2244
  %t2249 = select i1 %t2248, i64 257, i64 1
  br label %fixmerge840
fixslow839:
  %t2250 = call i64 @rt_lt(i64 %t2238, i64 %t2244)
  br label %fixmerge840
fixmerge840:
  %t2251 = phi i64 [ %t2249, %fixfast838 ], [ %t2250, %fixslow839 ]
  %t2252 = icmp ne i64 %t2251, 1
  br i1 %t2252, label %then841, label %else842
then841:
  %t2253 = or i64 %t2244, %a1
  %t2254 = and i64 %t2253, 7
  %t2255 = icmp eq i64 %t2254, 0
  br i1 %t2255, label %fixfast843, label %fixslow844
fixfast843:
  %t2256 = icmp slt i64 %t2244, %a1
  %t2257 = select i1 %t2256, i64 257, i64 1
  br label %fixmerge845
fixslow844:
  %t2258 = call i64 @rt_lt(i64 %t2244, i64 %a1)
  br label %fixmerge845
fixmerge845:
  %t2259 = phi i64 [ %t2257, %fixfast843 ], [ %t2258, %fixslow844 ]
  %t2260 = icmp ne i64 %t2259, 1
  br i1 %t2260, label %then846, label %else847
then846:
  %t2261 = call i64 @rt_string_ref(i64 %a0, i64 %t2244)
  %t2262 = call i64 @rt_char_to_integer(i64 %t2261)
  %t2263 = or i64 %t2262, 376
  %t2264 = and i64 %t2263, 7
  %t2265 = icmp eq i64 %t2264, 0
  br i1 %t2265, label %fixfast848, label %fixslow849
fixfast848:
  %t2266 = icmp eq i64 %t2262, 376
  %t2267 = select i1 %t2266, i64 257, i64 1
  br label %fixmerge850
fixslow849:
  %t2268 = call i64 @rt_num_eq(i64 %t2262, i64 376)
  br label %fixmerge850
fixmerge850:
  %t2269 = phi i64 [ %t2267, %fixfast848 ], [ %t2268, %fixslow849 ]
  %t2270 = icmp ne i64 %t2269, 1
  br i1 %t2270, label %then851, label %else852
then851:
  %t2271 = or i64 %t2244, 8
  %t2272 = and i64 %t2271, 7
  %t2273 = icmp eq i64 %t2272, 0
  br i1 %t2273, label %fixfast853, label %fixslow854
fixfast853:
  %t2274 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2244, i64 8)
  %t2275 = extractvalue {i64, i1} %t2274, 0
  %t2276 = extractvalue {i64, i1} %t2274, 1
  br i1 %t2276, label %fixslow854, label %fixmerge855
fixslow854:
  %t2277 = call i64 @rt_add(i64 %t2244, i64 8)
  br label %fixmerge855
fixmerge855:
  %t2278 = phi i64 [ %t2275, %fixfast853 ], [ %t2277, %fixslow854 ]
  %t2279 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2279)
  %t2280 = and i64 %t2279, -8
  %t2281 = inttoptr i64 %t2280 to ptr
  %t2282 = load i64, ptr %t2281
  %t2283 = inttoptr i64 %t2282 to ptr
  %t2284 = call fastcc i64%t2283(i64 %t2279, i64 4, i64 %a0, i64 %a1, i64 %t2278, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2285 = or i64 %t2244, 8
  %t2286 = and i64 %t2285, 7
  %t2287 = icmp eq i64 %t2286, 0
  br i1 %t2287, label %fixfast856, label %fixslow857
fixfast856:
  %t2288 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2244, i64 8)
  %t2289 = extractvalue {i64, i1} %t2288, 0
  %t2290 = extractvalue {i64, i1} %t2288, 1
  br i1 %t2290, label %fixslow857, label %fixmerge858
fixslow857:
  %t2291 = call i64 @rt_add(i64 %t2244, i64 8)
  br label %fixmerge858
fixmerge858:
  %t2292 = phi i64 [ %t2289, %fixfast856 ], [ %t2291, %fixslow857 ]
  %t2293 = or i64 %t2292, %t2284
  %t2294 = and i64 %t2293, 7
  %t2295 = icmp eq i64 %t2294, 0
  br i1 %t2295, label %fixfast859, label %fixslow860
fixfast859:
  %t2296 = icmp slt i64 %t2292, %t2284
  %t2297 = select i1 %t2296, i64 257, i64 1
  br label %fixmerge861
fixslow860:
  %t2298 = call i64 @rt_lt(i64 %t2292, i64 %t2284)
  br label %fixmerge861
fixmerge861:
  %t2299 = phi i64 [ %t2297, %fixfast859 ], [ %t2298, %fixslow860 ]
  %t2300 = icmp ne i64 %t2299, 1
  br i1 %t2300, label %then862, label %else863
then862:
  %t2301 = or i64 %t2284, %a1
  %t2302 = and i64 %t2301, 7
  %t2303 = icmp eq i64 %t2302, 0
  br i1 %t2303, label %fixfast864, label %fixslow865
fixfast864:
  %t2304 = icmp eq i64 %t2284, %a1
  %t2305 = select i1 %t2304, i64 257, i64 1
  br label %fixmerge866
fixslow865:
  %t2306 = call i64 @rt_num_eq(i64 %t2284, i64 %a1)
  br label %fixmerge866
fixmerge866:
  %t2307 = phi i64 [ %t2305, %fixfast864 ], [ %t2306, %fixslow865 ]
  ret i64 %t2307
else863:
  ret i64 1
else852:
  ret i64 1
else847:
  ret i64 1
else842:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-apply"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2312 = icmp eq i64 %argc, 2
  br i1 %t2312, label %argok868, label %arityerr867
arityerr867:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok868:
  %t2313 = call i64 @rt_not(i64 %a1)
  %t2314 = icmp ne i64 %t2313, 1
  br i1 %t2314, label %then869, label %else870
then869:
  ret i64 %a0
else870:
  %t2315 = or i64 %a1, 16
  %t2316 = and i64 %t2315, 7
  %t2317 = icmp eq i64 %t2316, 0
  br i1 %t2317, label %fixfast871, label %fixslow872
fixfast871:
  %t2318 = icmp eq i64 %a1, 16
  %t2319 = select i1 %t2318, i64 257, i64 1
  br label %fixmerge873
fixslow872:
  %t2320 = call i64 @rt_num_eq(i64 %a1, i64 16)
  br label %fixmerge873
fixmerge873:
  %t2321 = phi i64 [ %t2319, %fixfast871 ], [ %t2320, %fixslow872 ]
  %t2322 = icmp ne i64 %t2321, 1
  br i1 %t2322, label %then874, label %else875
then874:
  %t2323 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t2323
else875:
  %t2324 = call i64 @rt_exact_p(i64 %a0)
  %t2325 = icmp ne i64 %t2324, 1
  br i1 %t2325, label %then876, label %else877
then876:
  ret i64 %a0
else877:
  %t2326 = call i64 @rt_flo_truncate(i64 %a0)
  %t2327 = or i64 %a0, %t2326
  %t2328 = and i64 %t2327, 7
  %t2329 = icmp eq i64 %t2328, 0
  br i1 %t2329, label %fixfast878, label %fixslow879
fixfast878:
  %t2330 = icmp eq i64 %a0, %t2326
  %t2331 = select i1 %t2330, i64 257, i64 1
  br label %fixmerge880
fixslow879:
  %t2332 = call i64 @rt_num_eq(i64 %a0, i64 %t2326)
  br label %fixmerge880
fixmerge880:
  %t2333 = phi i64 [ %t2331, %fixfast878 ], [ %t2332, %fixslow879 ]
  %t2334 = icmp ne i64 %t2333, 1
  br i1 %t2334, label %then881, label %else882
then881:
  %t2335 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t2335
else882:
  %t2336 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2336
}

define fastcc i64 @"emit.internal:code:rd-body-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2341 = icmp eq i64 %argc, 3
  br i1 %t2341, label %argok884, label %arityerr883
arityerr883:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok884:
  %t2342 = or i64 %a1, 80
  %t2343 = and i64 %t2342, 7
  %t2344 = icmp eq i64 %t2343, 0
  br i1 %t2344, label %fixfast885, label %fixslow886
fixfast885:
  %t2345 = icmp eq i64 %a1, 80
  %t2346 = select i1 %t2345, i64 257, i64 1
  br label %fixmerge887
fixslow886:
  %t2347 = call i64 @rt_num_eq(i64 %a1, i64 80)
  br label %fixmerge887
fixmerge887:
  %t2348 = phi i64 [ %t2346, %fixfast885 ], [ %t2347, %fixslow886 ]
  %t2349 = icmp ne i64 %t2348, 1
  br i1 %t2349, label %then888, label %else889
then888:
  %t2350 = load i64, ptr @"emit.internal:rd-numeric?"
  call void @rt_check_callable(i64 %t2350)
  %t2351 = and i64 %t2350, -8
  %t2352 = inttoptr i64 %t2351 to ptr
  %t2353 = load i64, ptr %t2352
  %t2354 = inttoptr i64 %t2353 to ptr
  %t2355 = call fastcc i64%t2354(i64 %t2350, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2356 = icmp ne i64 %t2355, 1
  br i1 %t2356, label %then890, label %else891
then890:
  %t2357 = load i64, ptr @"emit.internal:rd-parse-int"
  call void @rt_check_callable(i64 %t2357)
  %t2358 = and i64 %t2357, -8
  %t2359 = inttoptr i64 %t2358 to ptr
  %t2360 = load i64, ptr %t2359
  %t2361 = inttoptr i64 %t2360 to ptr
  %t2362 = call fastcc i64%t2361(i64 %t2357, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2363 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2363)
  %t2364 = and i64 %t2363, -8
  %t2365 = inttoptr i64 %t2364 to ptr
  %t2366 = load i64, ptr %t2365
  %t2367 = inttoptr i64 %t2366 to ptr
  %t2368 = musttail call fastcc i64 %t2367(i64 %t2363, i64 2, i64 %t2362, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2368
else891:
  %t2369 = load i64, ptr @"emit.internal:rd-flonum?"
  call void @rt_check_callable(i64 %t2369)
  %t2370 = and i64 %t2369, -8
  %t2371 = inttoptr i64 %t2370 to ptr
  %t2372 = load i64, ptr %t2371
  %t2373 = inttoptr i64 %t2372 to ptr
  %t2374 = call fastcc i64%t2373(i64 %t2369, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2375 = icmp ne i64 %t2374, 1
  br i1 %t2375, label %then892, label %else893
then892:
  %t2376 = call i64 @rt_string_to_flonum(i64 %a0)
  %t2377 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2377)
  %t2378 = and i64 %t2377, -8
  %t2379 = inttoptr i64 %t2378 to ptr
  %t2380 = load i64, ptr %t2379
  %t2381 = inttoptr i64 %t2380 to ptr
  %t2382 = musttail call fastcc i64 %t2381(i64 %t2377, i64 2, i64 %t2376, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2382
else893:
  %t2383 = load i64, ptr @"emit.internal:rd-nonfinite"
  call void @rt_check_callable(i64 %t2383)
  %t2384 = and i64 %t2383, -8
  %t2385 = inttoptr i64 %t2384 to ptr
  %t2386 = load i64, ptr %t2385
  %t2387 = inttoptr i64 %t2386 to ptr
  %t2388 = call fastcc i64%t2387(i64 %t2383, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2389 = call i64 @rt_not(i64 %t2388)
  %t2390 = icmp ne i64 %t2389, 1
  br i1 %t2390, label %then894, label %else895
then894:
  %t2391 = call i64 @rt_intern(ptr @.str.sym.9)
  ret i64 %t2391
else895:
  %t2392 = icmp ne i64 %a2, 1
  br i1 %t2392, label %then896, label %else897
then896:
  %t2393 = or i64 %a2, 8
  %t2394 = and i64 %t2393, 7
  %t2395 = icmp eq i64 %t2394, 0
  br i1 %t2395, label %fixfast899, label %fixslow900
fixfast899:
  %t2396 = icmp eq i64 %a2, 8
  %t2397 = select i1 %t2396, i64 257, i64 1
  br label %fixmerge901
fixslow900:
  %t2398 = call i64 @rt_num_eq(i64 %a2, i64 8)
  br label %fixmerge901
fixmerge901:
  %t2399 = phi i64 [ %t2397, %fixfast899 ], [ %t2398, %fixslow900 ]
  br label %merge898
else897:
  br label %merge898
merge898:
  %t2400 = phi i64 [ %t2399, %fixmerge901 ], [ 1, %else897 ]
  %t2401 = icmp ne i64 %t2400, 1
  br i1 %t2401, label %then902, label %else903
then902:
  %t2402 = call i64 @rt_intern(ptr @.str.sym.10)
  ret i64 %t2402
else903:
  %t2403 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2403)
  %t2404 = and i64 %t2403, -8
  %t2405 = inttoptr i64 %t2404 to ptr
  %t2406 = load i64, ptr %t2405
  %t2407 = inttoptr i64 %t2406 to ptr
  %t2408 = musttail call fastcc i64 %t2407(i64 %t2403, i64 2, i64 %t2388, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2408
else889:
  %t2409 = load i64, ptr @"emit.internal:%string->int"
  call void @rt_check_callable(i64 %t2409)
  %t2410 = and i64 %t2409, -8
  %t2411 = inttoptr i64 %t2410 to ptr
  %t2412 = load i64, ptr %t2411
  %t2413 = inttoptr i64 %t2412 to ptr
  %t2414 = call fastcc i64%t2413(i64 %t2409, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2415 = icmp ne i64 %t2414, 1
  br i1 %t2415, label %then904, label %else905
then904:
  %t2416 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2416)
  %t2417 = and i64 %t2416, -8
  %t2418 = inttoptr i64 %t2417 to ptr
  %t2419 = load i64, ptr %t2418
  %t2420 = inttoptr i64 %t2419 to ptr
  %t2421 = musttail call fastcc i64 %t2420(i64 %t2416, i64 2, i64 %t2414, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2421
else905:
  %t2422 = call i64 @rt_intern(ptr @.str.sym.9)
  ret i64 %t2422
}

define fastcc i64 @"emit.internal:code:rd-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2427 = icmp eq i64 %argc, 2
  br i1 %t2427, label %argok907, label %arityerr906
arityerr906:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok907:
  %t2428 = call i64 @rt_string_length(i64 %a0)
  %t2429 = or i64 0, %t2428
  %t2430 = and i64 %t2429, 7
  %t2431 = icmp eq i64 %t2430, 0
  br i1 %t2431, label %fixfast908, label %fixslow909
fixfast908:
  %t2432 = icmp slt i64 0, %t2428
  %t2433 = select i1 %t2432, i64 257, i64 1
  br label %fixmerge910
fixslow909:
  %t2434 = call i64 @rt_lt(i64 0, i64 %t2428)
  br label %fixmerge910
fixmerge910:
  %t2435 = phi i64 [ %t2433, %fixfast908 ], [ %t2434, %fixslow909 ]
  %t2436 = icmp ne i64 %t2435, 1
  br i1 %t2436, label %then911, label %else912
then911:
  %t2437 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2438 = call i64 @rt_char_to_integer(i64 %t2437)
  %t2439 = or i64 %t2438, 280
  %t2440 = and i64 %t2439, 7
  %t2441 = icmp eq i64 %t2440, 0
  br i1 %t2441, label %fixfast914, label %fixslow915
fixfast914:
  %t2442 = icmp eq i64 %t2438, 280
  %t2443 = select i1 %t2442, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t2444 = call i64 @rt_num_eq(i64 %t2438, i64 280)
  br label %fixmerge916
fixmerge916:
  %t2445 = phi i64 [ %t2443, %fixfast914 ], [ %t2444, %fixslow915 ]
  br label %merge913
else912:
  br label %merge913
merge913:
  %t2446 = phi i64 [ %t2445, %fixmerge916 ], [ 1, %else912 ]
  %t2447 = icmp ne i64 %t2446, 1
  br i1 %t2447, label %then917, label %else918
then917:
  %t2448 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2448)
  %t2449 = and i64 %t2448, -8
  %t2450 = inttoptr i64 %t2449 to ptr
  %t2451 = load i64, ptr %t2450
  %t2452 = inttoptr i64 %t2451 to ptr
  %t2453 = call fastcc i64%t2452(i64 %t2448, i64 5, i64 %a0, i64 %t2428, i64 0, i64 1, i64 1, i64 0, i64 0, i64 0, ptr null)
  %t2454 = call i64 @rt_not(i64 %t2453)
  %t2455 = icmp ne i64 %t2454, 1
  br i1 %t2455, label %then919, label %else920
then919:
  %t2456 = call i64 @rt_intern(ptr @.str.sym.10)
  ret i64 %t2456
else920:
  %t2457 = call i64 @rt_car(i64 %t2453)
  %t2458 = icmp ne i64 %t2457, 1
  br i1 %t2458, label %then921, label %else922
then921:
  %t2459 = call i64 @rt_car(i64 %t2453)
  br label %merge923
else922:
  br label %merge923
merge923:
  %t2460 = phi i64 [ %t2459, %then921 ], [ %a1, %else922 ]
  %t2461 = load i64, ptr @"emit.internal:cadr"
  call void @rt_check_callable(i64 %t2461)
  %t2462 = and i64 %t2461, -8
  %t2463 = inttoptr i64 %t2462 to ptr
  %t2464 = load i64, ptr %t2463
  %t2465 = inttoptr i64 %t2464 to ptr
  %t2466 = call fastcc i64%t2465(i64 %t2461, i64 1, i64 %t2453, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2467 = load i64, ptr @"emit.internal:cddr"
  call void @rt_check_callable(i64 %t2467)
  %t2468 = and i64 %t2467, -8
  %t2469 = inttoptr i64 %t2468 to ptr
  %t2470 = load i64, ptr %t2469
  %t2471 = inttoptr i64 %t2470 to ptr
  %t2472 = call fastcc i64%t2471(i64 %t2467, i64 1, i64 %t2453, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2473 = call i64 @rt_substring(i64 %a0, i64 %t2472, i64 %t2428)
  %t2474 = load i64, ptr @"emit.internal:rd-body-number"
  call void @rt_check_callable(i64 %t2474)
  %t2475 = and i64 %t2474, -8
  %t2476 = inttoptr i64 %t2475 to ptr
  %t2477 = load i64, ptr %t2476
  %t2478 = inttoptr i64 %t2477 to ptr
  %t2479 = call fastcc i64%t2478(i64 %t2474, i64 3, i64 %t2473, i64 %t2460, i64 %t2466, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2480 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2481 = call i64 @rt_eq_p(i64 %t2479, i64 %t2480)
  %t2482 = icmp ne i64 %t2481, 1
  br i1 %t2482, label %then924, label %else925
then924:
  %t2483 = load i64, ptr @"emit.internal:rd-rational-body?"
  call void @rt_check_callable(i64 %t2483)
  %t2484 = and i64 %t2483, -8
  %t2485 = inttoptr i64 %t2484 to ptr
  %t2486 = load i64, ptr %t2485
  %t2487 = inttoptr i64 %t2486 to ptr
  %t2488 = call fastcc i64%t2487(i64 %t2483, i64 4, i64 %a0, i64 %t2428, i64 %t2472, i64 %t2460, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2489 = icmp ne i64 %t2488, 1
  br i1 %t2489, label %then926, label %else927
then926:
  %t2490 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2490
else927:
  %t2491 = call i64 @rt_intern(ptr @.str.sym.10)
  ret i64 %t2491
else925:
  ret i64 %t2479
else918:
  %t2492 = load i64, ptr @"emit.internal:rd-body-number"
  call void @rt_check_callable(i64 %t2492)
  %t2493 = and i64 %t2492, -8
  %t2494 = inttoptr i64 %t2493 to ptr
  %t2495 = load i64, ptr %t2494
  %t2496 = inttoptr i64 %t2495 to ptr
  %t2497 = call fastcc i64%t2496(i64 %t2492, i64 3, i64 %a0, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2498 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2499 = call i64 @rt_eq_p(i64 %t2497, i64 %t2498)
  %t2500 = icmp ne i64 %t2499, 1
  br i1 %t2500, label %then928, label %else929
then928:
  %t2501 = load i64, ptr @"emit.internal:rd-rational-body?"
  call void @rt_check_callable(i64 %t2501)
  %t2502 = and i64 %t2501, -8
  %t2503 = inttoptr i64 %t2502 to ptr
  %t2504 = load i64, ptr %t2503
  %t2505 = inttoptr i64 %t2504 to ptr
  %t2506 = call fastcc i64%t2505(i64 %t2501, i64 4, i64 %a0, i64 %t2428, i64 0, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2507 = icmp ne i64 %t2506, 1
  br i1 %t2507, label %then930, label %else931
then930:
  %t2508 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2508
else931:
  ret i64 %t2497
else929:
  ret i64 %t2497
}

define fastcc i64 @"emit.internal:code:rd-number-reason?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2513 = icmp eq i64 %argc, 1
  br i1 %t2513, label %argok933, label %arityerr932
arityerr932:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok933:
  %t2514 = call i64 @rt_intern(ptr @.str.sym.8)
  %t2515 = call i64 @rt_eq_p(i64 %a0, i64 %t2514)
  %t2516 = icmp ne i64 %t2515, 1
  br i1 %t2516, label %then934, label %else935
then934:
  ret i64 %t2515
else935:
  %t2517 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2518 = call i64 @rt_eq_p(i64 %a0, i64 %t2517)
  ret i64 %t2518
}

define fastcc i64 @"emit.internal:code:rd-fold-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2523 = icmp eq i64 %argc, 1
  br i1 %t2523, label %argok937, label %arityerr936
arityerr936:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok937:
  %t2524 = call i64 @rt_char_to_integer(i64 %a0)
  %t2525 = or i64 512, %t2524
  %t2526 = and i64 %t2525, 7
  %t2527 = icmp eq i64 %t2526, 0
  br i1 %t2527, label %fixfast938, label %fixslow939
fixfast938:
  %t2528 = icmp slt i64 512, %t2524
  %t2529 = select i1 %t2528, i64 257, i64 1
  br label %fixmerge940
fixslow939:
  %t2530 = call i64 @rt_lt(i64 512, i64 %t2524)
  br label %fixmerge940
fixmerge940:
  %t2531 = phi i64 [ %t2529, %fixfast938 ], [ %t2530, %fixslow939 ]
  %t2532 = icmp ne i64 %t2531, 1
  br i1 %t2532, label %then941, label %else942
then941:
  %t2533 = or i64 %t2524, 728
  %t2534 = and i64 %t2533, 7
  %t2535 = icmp eq i64 %t2534, 0
  br i1 %t2535, label %fixfast944, label %fixslow945
fixfast944:
  %t2536 = icmp slt i64 %t2524, 728
  %t2537 = select i1 %t2536, i64 257, i64 1
  br label %fixmerge946
fixslow945:
  %t2538 = call i64 @rt_lt(i64 %t2524, i64 728)
  br label %fixmerge946
fixmerge946:
  %t2539 = phi i64 [ %t2537, %fixfast944 ], [ %t2538, %fixslow945 ]
  br label %merge943
else942:
  br label %merge943
merge943:
  %t2540 = phi i64 [ %t2539, %fixmerge946 ], [ 1, %else942 ]
  %t2541 = icmp ne i64 %t2540, 1
  br i1 %t2541, label %then947, label %else948
then947:
  %t2542 = or i64 %t2524, 256
  %t2543 = and i64 %t2542, 7
  %t2544 = icmp eq i64 %t2543, 0
  br i1 %t2544, label %fixfast949, label %fixslow950
fixfast949:
  %t2545 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2524, i64 256)
  %t2546 = extractvalue {i64, i1} %t2545, 0
  %t2547 = extractvalue {i64, i1} %t2545, 1
  br i1 %t2547, label %fixslow950, label %fixmerge951
fixslow950:
  %t2548 = call i64 @rt_add(i64 %t2524, i64 256)
  br label %fixmerge951
fixmerge951:
  %t2549 = phi i64 [ %t2546, %fixfast949 ], [ %t2548, %fixslow950 ]
  %t2550 = call i64 @rt_integer_to_char(i64 %t2549)
  ret i64 %t2550
else948:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_747"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2555 = icmp eq i64 %argc, 2
  br i1 %t2555, label %argok953, label %arityerr952
arityerr952:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok953:
  %t2556 = and i64 %self, -8
  %t2557 = inttoptr i64 %t2556 to ptr
  %t2558 = getelementptr i64, ptr %t2557, i64 1
  %t2559 = load i64, ptr %t2558
  %t2560 = or i64 %a0, %t2559
  %t2561 = and i64 %t2560, 7
  %t2562 = icmp eq i64 %t2561, 0
  br i1 %t2562, label %fixfast954, label %fixslow955
fixfast954:
  %t2563 = icmp eq i64 %a0, %t2559
  %t2564 = select i1 %t2563, i64 257, i64 1
  br label %fixmerge956
fixslow955:
  %t2565 = call i64 @rt_num_eq(i64 %a0, i64 %t2559)
  br label %fixmerge956
fixmerge956:
  %t2566 = phi i64 [ %t2564, %fixfast954 ], [ %t2565, %fixslow955 ]
  %t2567 = icmp ne i64 %t2566, 1
  br i1 %t2567, label %then957, label %else958
then957:
  %t2568 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t2568)
  %t2569 = and i64 %t2568, -8
  %t2570 = inttoptr i64 %t2569 to ptr
  %t2571 = load i64, ptr %t2570
  %t2572 = inttoptr i64 %t2571 to ptr
  %t2573 = call fastcc i64%t2572(i64 %t2568, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2574 = call i64 @rt_list_to_string(i64 %t2573)
  ret i64 %t2574
else958:
  %t2575 = or i64 %a0, 8
  %t2576 = and i64 %t2575, 7
  %t2577 = icmp eq i64 %t2576, 0
  br i1 %t2577, label %fixfast959, label %fixslow960
fixfast959:
  %t2578 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2579 = extractvalue {i64, i1} %t2578, 0
  %t2580 = extractvalue {i64, i1} %t2578, 1
  br i1 %t2580, label %fixslow960, label %fixmerge961
fixslow960:
  %t2581 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge961
fixmerge961:
  %t2582 = phi i64 [ %t2579, %fixfast959 ], [ %t2581, %fixslow960 ]
  %t2583 = and i64 %self, -8
  %t2584 = inttoptr i64 %t2583 to ptr
  %t2585 = getelementptr i64, ptr %t2584, i64 3
  %t2586 = load i64, ptr %t2585
  %t2587 = call i64 @rt_string_ref(i64 %t2586, i64 %a0)
  %t2588 = load i64, ptr @"emit.internal:rd-fold-char"
  call void @rt_check_callable(i64 %t2588)
  %t2589 = and i64 %t2588, -8
  %t2590 = inttoptr i64 %t2589 to ptr
  %t2591 = load i64, ptr %t2590
  %t2592 = inttoptr i64 %t2591 to ptr
  %t2593 = call fastcc i64%t2592(i64 %t2588, i64 1, i64 %t2587, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2594 = call i64 @rt_cons(i64 %t2593, i64 %a1)
  %t2595 = musttail call fastcc i64 @"emit.internal:code_747"(i64 %self, i64 2, i64 %t2582, i64 %t2594, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2595
}

define fastcc i64 @"emit.internal:code:rd-fold-token"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2596 = icmp eq i64 %argc, 1
  br i1 %t2596, label %argok963, label %arityerr962
arityerr962:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok963:
  %t2597 = call i64 @rt_string_length(i64 %a0)
  %t2598 = call ptr @rt_alloc_words(i64 4)
  %t2599 = ptrtoint ptr %t2598 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_747" to i64), ptr %t2598
  %t2600 = or i64 %t2599, 4
  %t2601 = getelementptr i64, ptr %t2598, i64 1
  store i64 %t2597, ptr %t2601
  %t2602 = getelementptr i64, ptr %t2598, i64 2
  store i64 %t2600, ptr %t2602
  %t2603 = getelementptr i64, ptr %t2598, i64 3
  store i64 %a0, ptr %t2603
  %t2604 = musttail call fastcc i64 @"emit.internal:code_747"(i64 %t2600, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2604
}

define fastcc i64 @"emit.internal:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2609 = icmp eq i64 %argc, 4
  br i1 %t2609, label %argok965, label %arityerr964
arityerr964:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok965:
  %t2610 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t2610)
  %t2611 = and i64 %t2610, -8
  %t2612 = inttoptr i64 %t2611 to ptr
  %t2613 = load i64, ptr %t2612
  %t2614 = inttoptr i64 %t2613 to ptr
  %t2615 = call fastcc i64%t2614(i64 %t2610, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2616 = or i64 %a2, %t2615
  %t2617 = and i64 %t2616, 7
  %t2618 = icmp eq i64 %t2617, 0
  br i1 %t2618, label %fixfast966, label %fixslow967
fixfast966:
  %t2619 = icmp eq i64 %a2, %t2615
  %t2620 = select i1 %t2619, i64 257, i64 1
  br label %fixmerge968
fixslow967:
  %t2621 = call i64 @rt_num_eq(i64 %a2, i64 %t2615)
  br label %fixmerge968
fixmerge968:
  %t2622 = phi i64 [ %t2620, %fixfast966 ], [ %t2621, %fixslow967 ]
  %t2623 = icmp ne i64 %t2622, 1
  br i1 %t2623, label %then969, label %else970
then969:
  %t2624 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2625 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2625)
  %t2626 = and i64 %t2625, -8
  %t2627 = inttoptr i64 %t2626 to ptr
  %t2628 = load i64, ptr %t2627
  %t2629 = inttoptr i64 %t2628 to ptr
  %t2630 = musttail call fastcc i64 %t2629(i64 %t2625, i64 2, i64 %t2624, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2630
else970:
  %t2631 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2615)
  %t2632 = load i64, ptr @"emit.internal:rd-number"
  call void @rt_check_callable(i64 %t2632)
  %t2633 = and i64 %t2632, -8
  %t2634 = inttoptr i64 %t2633 to ptr
  %t2635 = load i64, ptr %t2634
  %t2636 = inttoptr i64 %t2635 to ptr
  %t2637 = call fastcc i64%t2636(i64 %t2632, i64 2, i64 %t2631, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2638 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2639 = call i64 @rt_eq_p(i64 %t2637, i64 %t2638)
  %t2640 = icmp ne i64 %t2639, 1
  br i1 %t2640, label %then971, label %else972
then971:
  %t2641 = load i64, ptr @"emit.internal:rd-fold?"
  call void @rt_check_callable(i64 %t2641)
  %t2642 = and i64 %t2641, -8
  %t2643 = inttoptr i64 %t2642 to ptr
  %t2644 = load i64, ptr %t2643
  %t2645 = inttoptr i64 %t2644 to ptr
  %t2646 = call fastcc i64%t2645(i64 %t2641, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2647 = icmp ne i64 %t2646, 1
  br i1 %t2647, label %then973, label %else974
then973:
  %t2648 = load i64, ptr @"emit.internal:rd-fold-token"
  call void @rt_check_callable(i64 %t2648)
  %t2649 = and i64 %t2648, -8
  %t2650 = inttoptr i64 %t2649 to ptr
  %t2651 = load i64, ptr %t2650
  %t2652 = inttoptr i64 %t2651 to ptr
  %t2653 = call fastcc i64%t2652(i64 %t2648, i64 1, i64 %t2631, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge975
else974:
  br label %merge975
merge975:
  %t2654 = phi i64 [ %t2653, %then973 ], [ %t2631, %else974 ]
  %t2655 = call i64 @rt_string_to_symbol(i64 %t2654)
  %t2656 = call i64 @rt_cons(i64 %t2655, i64 %t2615)
  ret i64 %t2656
else972:
  %t2657 = load i64, ptr @"emit.internal:rd-number-reason?"
  call void @rt_check_callable(i64 %t2657)
  %t2658 = and i64 %t2657, -8
  %t2659 = inttoptr i64 %t2658 to ptr
  %t2660 = load i64, ptr %t2659
  %t2661 = inttoptr i64 %t2660 to ptr
  %t2662 = call fastcc i64%t2661(i64 %t2657, i64 1, i64 %t2637, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2663 = icmp ne i64 %t2662, 1
  br i1 %t2663, label %then976, label %else977
then976:
  %t2664 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2664)
  %t2665 = and i64 %t2664, -8
  %t2666 = inttoptr i64 %t2665 to ptr
  %t2667 = load i64, ptr %t2666
  %t2668 = inttoptr i64 %t2667 to ptr
  %t2669 = musttail call fastcc i64 %t2668(i64 %t2664, i64 2, i64 %t2637, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2669
else977:
  %t2670 = call i64 @rt_cons(i64 %t2637, i64 %t2615)
  ret i64 %t2670
}

define fastcc i64 @"emit.internal:code:rd-token-at"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2675 = icmp eq i64 %argc, 3
  br i1 %t2675, label %argok979, label %arityerr978
arityerr978:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok979:
  %t2676 = or i64 0, %a2
  %t2677 = and i64 %t2676, 7
  %t2678 = icmp eq i64 %t2677, 0
  br i1 %t2678, label %fixfast980, label %fixslow981
fixfast980:
  %t2679 = icmp slt i64 0, %a2
  %t2680 = select i1 %t2679, i64 257, i64 1
  br label %fixmerge982
fixslow981:
  %t2681 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge982
fixmerge982:
  %t2682 = phi i64 [ %t2680, %fixfast980 ], [ %t2681, %fixslow981 ]
  %t2683 = icmp ne i64 %t2682, 1
  br i1 %t2683, label %then983, label %else984
then983:
  br label %merge985
else984:
  %t2684 = or i64 0, %a2
  %t2685 = and i64 %t2684, 7
  %t2686 = icmp eq i64 %t2685, 0
  br i1 %t2686, label %fixfast986, label %fixslow987
fixfast986:
  %t2687 = icmp eq i64 0, %a2
  %t2688 = select i1 %t2687, i64 257, i64 1
  br label %fixmerge988
fixslow987:
  %t2689 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge988
fixmerge988:
  %t2690 = phi i64 [ %t2688, %fixfast986 ], [ %t2689, %fixslow987 ]
  br label %merge985
merge985:
  %t2691 = phi i64 [ 257, %then983 ], [ %t2690, %fixmerge988 ]
  %t2692 = icmp ne i64 %t2691, 1
  br i1 %t2692, label %then989, label %else990
then989:
  %t2693 = or i64 %a2, %a1
  %t2694 = and i64 %t2693, 7
  %t2695 = icmp eq i64 %t2694, 0
  br i1 %t2695, label %fixfast992, label %fixslow993
fixfast992:
  %t2696 = icmp slt i64 %a2, %a1
  %t2697 = select i1 %t2696, i64 257, i64 1
  br label %fixmerge994
fixslow993:
  %t2698 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge994
fixmerge994:
  %t2699 = phi i64 [ %t2697, %fixfast992 ], [ %t2698, %fixslow993 ]
  br label %merge991
else990:
  br label %merge991
merge991:
  %t2700 = phi i64 [ %t2699, %fixmerge994 ], [ 1, %else990 ]
  %t2701 = icmp ne i64 %t2700, 1
  br i1 %t2701, label %then995, label %else996
then995:
  %t2702 = or i64 %a2, 8
  %t2703 = and i64 %t2702, 7
  %t2704 = icmp eq i64 %t2703, 0
  br i1 %t2704, label %fixfast997, label %fixslow998
fixfast997:
  %t2705 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2706 = extractvalue {i64, i1} %t2705, 0
  %t2707 = extractvalue {i64, i1} %t2705, 1
  br i1 %t2707, label %fixslow998, label %fixmerge999
fixslow998:
  %t2708 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge999
fixmerge999:
  %t2709 = phi i64 [ %t2706, %fixfast997 ], [ %t2708, %fixslow998 ]
  %t2710 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t2710)
  %t2711 = and i64 %t2710, -8
  %t2712 = inttoptr i64 %t2711 to ptr
  %t2713 = load i64, ptr %t2712
  %t2714 = inttoptr i64 %t2713 to ptr
  %t2715 = call fastcc i64%t2714(i64 %t2710, i64 3, i64 %a0, i64 %a1, i64 %t2709, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2716 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2715)
  ret i64 %t2716
else996:
  %t2717 = call i64 @rt_make_string(ptr @.str.lit.12, i64 0)
  ret i64 %t2717
}

define fastcc i64 @"emit.internal:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2722 = icmp eq i64 %argc, 1
  br i1 %t2722, label %argok1001, label %arityerr1000
arityerr1000:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1001:
  %t2723 = call i64 @rt_char_to_integer(i64 %a0)
  %t2724 = or i64 376, %t2723
  %t2725 = and i64 %t2724, 7
  %t2726 = icmp eq i64 %t2725, 0
  br i1 %t2726, label %fixfast1002, label %fixslow1003
fixfast1002:
  %t2727 = icmp slt i64 376, %t2723
  %t2728 = select i1 %t2727, i64 257, i64 1
  br label %fixmerge1004
fixslow1003:
  %t2729 = call i64 @rt_lt(i64 376, i64 %t2723)
  br label %fixmerge1004
fixmerge1004:
  %t2730 = phi i64 [ %t2728, %fixfast1002 ], [ %t2729, %fixslow1003 ]
  %t2731 = icmp ne i64 %t2730, 1
  br i1 %t2731, label %then1005, label %else1006
then1005:
  %t2732 = or i64 %t2723, 464
  %t2733 = and i64 %t2732, 7
  %t2734 = icmp eq i64 %t2733, 0
  br i1 %t2734, label %fixfast1008, label %fixslow1009
fixfast1008:
  %t2735 = icmp slt i64 %t2723, 464
  %t2736 = select i1 %t2735, i64 257, i64 1
  br label %fixmerge1010
fixslow1009:
  %t2737 = call i64 @rt_lt(i64 %t2723, i64 464)
  br label %fixmerge1010
fixmerge1010:
  %t2738 = phi i64 [ %t2736, %fixfast1008 ], [ %t2737, %fixslow1009 ]
  br label %merge1007
else1006:
  br label %merge1007
merge1007:
  %t2739 = phi i64 [ %t2738, %fixmerge1010 ], [ 1, %else1006 ]
  %t2740 = icmp ne i64 %t2739, 1
  br i1 %t2740, label %then1011, label %else1012
then1011:
  %t2741 = or i64 %t2723, 384
  %t2742 = and i64 %t2741, 7
  %t2743 = icmp eq i64 %t2742, 0
  br i1 %t2743, label %fixfast1013, label %fixslow1014
fixfast1013:
  %t2744 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2723, i64 384)
  %t2745 = extractvalue {i64, i1} %t2744, 0
  %t2746 = extractvalue {i64, i1} %t2744, 1
  br i1 %t2746, label %fixslow1014, label %fixmerge1015
fixslow1014:
  %t2747 = call i64 @rt_sub(i64 %t2723, i64 384)
  br label %fixmerge1015
fixmerge1015:
  %t2748 = phi i64 [ %t2745, %fixfast1013 ], [ %t2747, %fixslow1014 ]
  ret i64 %t2748
else1012:
  %t2749 = or i64 768, %t2723
  %t2750 = and i64 %t2749, 7
  %t2751 = icmp eq i64 %t2750, 0
  br i1 %t2751, label %fixfast1016, label %fixslow1017
fixfast1016:
  %t2752 = icmp slt i64 768, %t2723
  %t2753 = select i1 %t2752, i64 257, i64 1
  br label %fixmerge1018
fixslow1017:
  %t2754 = call i64 @rt_lt(i64 768, i64 %t2723)
  br label %fixmerge1018
fixmerge1018:
  %t2755 = phi i64 [ %t2753, %fixfast1016 ], [ %t2754, %fixslow1017 ]
  %t2756 = icmp ne i64 %t2755, 1
  br i1 %t2756, label %then1019, label %else1020
then1019:
  %t2757 = or i64 %t2723, 824
  %t2758 = and i64 %t2757, 7
  %t2759 = icmp eq i64 %t2758, 0
  br i1 %t2759, label %fixfast1022, label %fixslow1023
fixfast1022:
  %t2760 = icmp slt i64 %t2723, 824
  %t2761 = select i1 %t2760, i64 257, i64 1
  br label %fixmerge1024
fixslow1023:
  %t2762 = call i64 @rt_lt(i64 %t2723, i64 824)
  br label %fixmerge1024
fixmerge1024:
  %t2763 = phi i64 [ %t2761, %fixfast1022 ], [ %t2762, %fixslow1023 ]
  br label %merge1021
else1020:
  br label %merge1021
merge1021:
  %t2764 = phi i64 [ %t2763, %fixmerge1024 ], [ 1, %else1020 ]
  %t2765 = icmp ne i64 %t2764, 1
  br i1 %t2765, label %then1025, label %else1026
then1025:
  %t2766 = or i64 %t2723, 696
  %t2767 = and i64 %t2766, 7
  %t2768 = icmp eq i64 %t2767, 0
  br i1 %t2768, label %fixfast1027, label %fixslow1028
fixfast1027:
  %t2769 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2723, i64 696)
  %t2770 = extractvalue {i64, i1} %t2769, 0
  %t2771 = extractvalue {i64, i1} %t2769, 1
  br i1 %t2771, label %fixslow1028, label %fixmerge1029
fixslow1028:
  %t2772 = call i64 @rt_sub(i64 %t2723, i64 696)
  br label %fixmerge1029
fixmerge1029:
  %t2773 = phi i64 [ %t2770, %fixfast1027 ], [ %t2772, %fixslow1028 ]
  ret i64 %t2773
else1026:
  %t2774 = or i64 512, %t2723
  %t2775 = and i64 %t2774, 7
  %t2776 = icmp eq i64 %t2775, 0
  br i1 %t2776, label %fixfast1030, label %fixslow1031
fixfast1030:
  %t2777 = icmp slt i64 512, %t2723
  %t2778 = select i1 %t2777, i64 257, i64 1
  br label %fixmerge1032
fixslow1031:
  %t2779 = call i64 @rt_lt(i64 512, i64 %t2723)
  br label %fixmerge1032
fixmerge1032:
  %t2780 = phi i64 [ %t2778, %fixfast1030 ], [ %t2779, %fixslow1031 ]
  %t2781 = icmp ne i64 %t2780, 1
  br i1 %t2781, label %then1033, label %else1034
then1033:
  %t2782 = or i64 %t2723, 568
  %t2783 = and i64 %t2782, 7
  %t2784 = icmp eq i64 %t2783, 0
  br i1 %t2784, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t2785 = icmp slt i64 %t2723, 568
  %t2786 = select i1 %t2785, i64 257, i64 1
  br label %fixmerge1038
fixslow1037:
  %t2787 = call i64 @rt_lt(i64 %t2723, i64 568)
  br label %fixmerge1038
fixmerge1038:
  %t2788 = phi i64 [ %t2786, %fixfast1036 ], [ %t2787, %fixslow1037 ]
  br label %merge1035
else1034:
  br label %merge1035
merge1035:
  %t2789 = phi i64 [ %t2788, %fixmerge1038 ], [ 1, %else1034 ]
  %t2790 = icmp ne i64 %t2789, 1
  br i1 %t2790, label %then1039, label %else1040
then1039:
  %t2791 = or i64 %t2723, 440
  %t2792 = and i64 %t2791, 7
  %t2793 = icmp eq i64 %t2792, 0
  br i1 %t2793, label %fixfast1041, label %fixslow1042
fixfast1041:
  %t2794 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2723, i64 440)
  %t2795 = extractvalue {i64, i1} %t2794, 0
  %t2796 = extractvalue {i64, i1} %t2794, 1
  br i1 %t2796, label %fixslow1042, label %fixmerge1043
fixslow1042:
  %t2797 = call i64 @rt_sub(i64 %t2723, i64 440)
  br label %fixmerge1043
fixmerge1043:
  %t2798 = phi i64 [ %t2795, %fixfast1041 ], [ %t2797, %fixslow1042 ]
  ret i64 %t2798
else1040:
  ret i64 0
}

define fastcc i64 @"emit.internal:code:rd-hex-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2803 = icmp eq i64 %argc, 1
  br i1 %t2803, label %argok1045, label %arityerr1044
arityerr1044:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1045:
  %t2804 = call i64 @rt_char_to_integer(i64 %a0)
  %t2805 = or i64 376, %t2804
  %t2806 = and i64 %t2805, 7
  %t2807 = icmp eq i64 %t2806, 0
  br i1 %t2807, label %fixfast1046, label %fixslow1047
fixfast1046:
  %t2808 = icmp slt i64 376, %t2804
  %t2809 = select i1 %t2808, i64 257, i64 1
  br label %fixmerge1048
fixslow1047:
  %t2810 = call i64 @rt_lt(i64 376, i64 %t2804)
  br label %fixmerge1048
fixmerge1048:
  %t2811 = phi i64 [ %t2809, %fixfast1046 ], [ %t2810, %fixslow1047 ]
  %t2812 = icmp ne i64 %t2811, 1
  br i1 %t2812, label %then1049, label %else1050
then1049:
  %t2813 = or i64 %t2804, 464
  %t2814 = and i64 %t2813, 7
  %t2815 = icmp eq i64 %t2814, 0
  br i1 %t2815, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t2816 = icmp slt i64 %t2804, 464
  %t2817 = select i1 %t2816, i64 257, i64 1
  br label %fixmerge1054
fixslow1053:
  %t2818 = call i64 @rt_lt(i64 %t2804, i64 464)
  br label %fixmerge1054
fixmerge1054:
  %t2819 = phi i64 [ %t2817, %fixfast1052 ], [ %t2818, %fixslow1053 ]
  br label %merge1051
else1050:
  br label %merge1051
merge1051:
  %t2820 = phi i64 [ %t2819, %fixmerge1054 ], [ 1, %else1050 ]
  %t2821 = icmp ne i64 %t2820, 1
  br i1 %t2821, label %then1055, label %else1056
then1055:
  ret i64 257
else1056:
  %t2822 = or i64 768, %t2804
  %t2823 = and i64 %t2822, 7
  %t2824 = icmp eq i64 %t2823, 0
  br i1 %t2824, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t2825 = icmp slt i64 768, %t2804
  %t2826 = select i1 %t2825, i64 257, i64 1
  br label %fixmerge1059
fixslow1058:
  %t2827 = call i64 @rt_lt(i64 768, i64 %t2804)
  br label %fixmerge1059
fixmerge1059:
  %t2828 = phi i64 [ %t2826, %fixfast1057 ], [ %t2827, %fixslow1058 ]
  %t2829 = icmp ne i64 %t2828, 1
  br i1 %t2829, label %then1060, label %else1061
then1060:
  %t2830 = or i64 %t2804, 824
  %t2831 = and i64 %t2830, 7
  %t2832 = icmp eq i64 %t2831, 0
  br i1 %t2832, label %fixfast1063, label %fixslow1064
fixfast1063:
  %t2833 = icmp slt i64 %t2804, 824
  %t2834 = select i1 %t2833, i64 257, i64 1
  br label %fixmerge1065
fixslow1064:
  %t2835 = call i64 @rt_lt(i64 %t2804, i64 824)
  br label %fixmerge1065
fixmerge1065:
  %t2836 = phi i64 [ %t2834, %fixfast1063 ], [ %t2835, %fixslow1064 ]
  br label %merge1062
else1061:
  br label %merge1062
merge1062:
  %t2837 = phi i64 [ %t2836, %fixmerge1065 ], [ 1, %else1061 ]
  %t2838 = icmp ne i64 %t2837, 1
  br i1 %t2838, label %then1066, label %else1067
then1066:
  ret i64 257
else1067:
  %t2839 = or i64 512, %t2804
  %t2840 = and i64 %t2839, 7
  %t2841 = icmp eq i64 %t2840, 0
  br i1 %t2841, label %fixfast1068, label %fixslow1069
fixfast1068:
  %t2842 = icmp slt i64 512, %t2804
  %t2843 = select i1 %t2842, i64 257, i64 1
  br label %fixmerge1070
fixslow1069:
  %t2844 = call i64 @rt_lt(i64 512, i64 %t2804)
  br label %fixmerge1070
fixmerge1070:
  %t2845 = phi i64 [ %t2843, %fixfast1068 ], [ %t2844, %fixslow1069 ]
  %t2846 = icmp ne i64 %t2845, 1
  br i1 %t2846, label %then1071, label %else1072
then1071:
  %t2847 = or i64 %t2804, 568
  %t2848 = and i64 %t2847, 7
  %t2849 = icmp eq i64 %t2848, 0
  br i1 %t2849, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t2850 = icmp slt i64 %t2804, 568
  %t2851 = select i1 %t2850, i64 257, i64 1
  br label %fixmerge1076
fixslow1075:
  %t2852 = call i64 @rt_lt(i64 %t2804, i64 568)
  br label %fixmerge1076
fixmerge1076:
  %t2853 = phi i64 [ %t2851, %fixfast1074 ], [ %t2852, %fixslow1075 ]
  br label %merge1073
else1072:
  br label %merge1073
merge1073:
  %t2854 = phi i64 [ %t2853, %fixmerge1076 ], [ 1, %else1072 ]
  %t2855 = icmp ne i64 %t2854, 1
  br i1 %t2855, label %then1077, label %else1078
then1077:
  ret i64 257
else1078:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2860 = icmp eq i64 %argc, 4
  br i1 %t2860, label %argok1080, label %arityerr1079
arityerr1079:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1080:
  %t2861 = or i64 %a2, %a1
  %t2862 = and i64 %t2861, 7
  %t2863 = icmp eq i64 %t2862, 0
  br i1 %t2863, label %fixfast1081, label %fixslow1082
fixfast1081:
  %t2864 = icmp slt i64 %a2, %a1
  %t2865 = select i1 %t2864, i64 257, i64 1
  br label %fixmerge1083
fixslow1082:
  %t2866 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1083
fixmerge1083:
  %t2867 = phi i64 [ %t2865, %fixfast1081 ], [ %t2866, %fixslow1082 ]
  %t2868 = icmp ne i64 %t2867, 1
  br i1 %t2868, label %then1084, label %else1085
then1084:
  %t2869 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2870 = call i64 @rt_char_to_integer(i64 %t2869)
  %t2871 = or i64 %t2870, 472
  %t2872 = and i64 %t2871, 7
  %t2873 = icmp eq i64 %t2872, 0
  br i1 %t2873, label %fixfast1086, label %fixslow1087
fixfast1086:
  %t2874 = icmp eq i64 %t2870, 472
  %t2875 = select i1 %t2874, i64 257, i64 1
  br label %fixmerge1088
fixslow1087:
  %t2876 = call i64 @rt_num_eq(i64 %t2870, i64 472)
  br label %fixmerge1088
fixmerge1088:
  %t2877 = phi i64 [ %t2875, %fixfast1086 ], [ %t2876, %fixslow1087 ]
  %t2878 = icmp ne i64 %t2877, 1
  br i1 %t2878, label %then1089, label %else1090
then1089:
  %t2879 = or i64 %a2, 8
  %t2880 = and i64 %t2879, 7
  %t2881 = icmp eq i64 %t2880, 0
  br i1 %t2881, label %fixfast1091, label %fixslow1092
fixfast1091:
  %t2882 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2883 = extractvalue {i64, i1} %t2882, 0
  %t2884 = extractvalue {i64, i1} %t2882, 1
  br i1 %t2884, label %fixslow1092, label %fixmerge1093
fixslow1092:
  %t2885 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1093
fixmerge1093:
  %t2886 = phi i64 [ %t2883, %fixfast1091 ], [ %t2885, %fixslow1092 ]
  %t2887 = call i64 @rt_cons(i64 %a3, i64 %t2886)
  ret i64 %t2887
else1090:
  %t2888 = or i64 %a2, 8
  %t2889 = and i64 %t2888, 7
  %t2890 = icmp eq i64 %t2889, 0
  br i1 %t2890, label %fixfast1094, label %fixslow1095
fixfast1094:
  %t2891 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2892 = extractvalue {i64, i1} %t2891, 0
  %t2893 = extractvalue {i64, i1} %t2891, 1
  br i1 %t2893, label %fixslow1095, label %fixmerge1096
fixslow1095:
  %t2894 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1096
fixmerge1096:
  %t2895 = phi i64 [ %t2892, %fixfast1094 ], [ %t2894, %fixslow1095 ]
  %t2896 = or i64 %a3, 128
  %t2897 = and i64 %t2896, 7
  %t2898 = icmp eq i64 %t2897, 0
  br i1 %t2898, label %fixfast1097, label %fixslow1098
fixfast1097:
  %t2899 = ashr i64 %a3, 3
  %t2900 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2899, i64 128)
  %t2901 = extractvalue {i64, i1} %t2900, 0
  %t2902 = extractvalue {i64, i1} %t2900, 1
  br i1 %t2902, label %fixslow1098, label %fixmerge1099
fixslow1098:
  %t2903 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge1099
fixmerge1099:
  %t2904 = phi i64 [ %t2901, %fixfast1097 ], [ %t2903, %fixslow1098 ]
  %t2905 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2906 = load i64, ptr @"emit.internal:rd-hex-digit"
  call void @rt_check_callable(i64 %t2906)
  %t2907 = and i64 %t2906, -8
  %t2908 = inttoptr i64 %t2907 to ptr
  %t2909 = load i64, ptr %t2908
  %t2910 = inttoptr i64 %t2909 to ptr
  %t2911 = call fastcc i64%t2910(i64 %t2906, i64 1, i64 %t2905, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2912 = or i64 %t2904, %t2911
  %t2913 = and i64 %t2912, 7
  %t2914 = icmp eq i64 %t2913, 0
  br i1 %t2914, label %fixfast1100, label %fixslow1101
fixfast1100:
  %t2915 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2904, i64 %t2911)
  %t2916 = extractvalue {i64, i1} %t2915, 0
  %t2917 = extractvalue {i64, i1} %t2915, 1
  br i1 %t2917, label %fixslow1101, label %fixmerge1102
fixslow1101:
  %t2918 = call i64 @rt_add(i64 %t2904, i64 %t2911)
  br label %fixmerge1102
fixmerge1102:
  %t2919 = phi i64 [ %t2916, %fixfast1100 ], [ %t2918, %fixslow1101 ]
  %t2920 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t2920)
  %t2921 = and i64 %t2920, -8
  %t2922 = inttoptr i64 %t2921 to ptr
  %t2923 = load i64, ptr %t2922
  %t2924 = inttoptr i64 %t2923 to ptr
  %t2925 = musttail call fastcc i64 %t2924(i64 %t2920, i64 4, i64 %a0, i64 %a1, i64 %t2895, i64 %t2919, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2925
else1085:
  %t2926 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2926
}

define fastcc i64 @"emit.internal:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2931 = icmp eq i64 %argc, 1
  br i1 %t2931, label %argok1104, label %arityerr1103
arityerr1103:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1104:
  %t2932 = call i64 @rt_char_to_integer(i64 %a0)
  %t2933 = or i64 %t2932, 776
  %t2934 = and i64 %t2933, 7
  %t2935 = icmp eq i64 %t2934, 0
  br i1 %t2935, label %fixfast1105, label %fixslow1106
fixfast1105:
  %t2936 = icmp eq i64 %t2932, 776
  %t2937 = select i1 %t2936, i64 257, i64 1
  br label %fixmerge1107
fixslow1106:
  %t2938 = call i64 @rt_num_eq(i64 %t2932, i64 776)
  br label %fixmerge1107
fixmerge1107:
  %t2939 = phi i64 [ %t2937, %fixfast1105 ], [ %t2938, %fixslow1106 ]
  %t2940 = icmp ne i64 %t2939, 1
  br i1 %t2940, label %then1108, label %else1109
then1108:
  %t2941 = call i64 @rt_integer_to_char(i64 56)
  ret i64 %t2941
else1109:
  %t2942 = or i64 %t2932, 784
  %t2943 = and i64 %t2942, 7
  %t2944 = icmp eq i64 %t2943, 0
  br i1 %t2944, label %fixfast1110, label %fixslow1111
fixfast1110:
  %t2945 = icmp eq i64 %t2932, 784
  %t2946 = select i1 %t2945, i64 257, i64 1
  br label %fixmerge1112
fixslow1111:
  %t2947 = call i64 @rt_num_eq(i64 %t2932, i64 784)
  br label %fixmerge1112
fixmerge1112:
  %t2948 = phi i64 [ %t2946, %fixfast1110 ], [ %t2947, %fixslow1111 ]
  %t2949 = icmp ne i64 %t2948, 1
  br i1 %t2949, label %then1113, label %else1114
then1113:
  %t2950 = call i64 @rt_integer_to_char(i64 64)
  ret i64 %t2950
else1114:
  %t2951 = or i64 %t2932, 880
  %t2952 = and i64 %t2951, 7
  %t2953 = icmp eq i64 %t2952, 0
  br i1 %t2953, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t2954 = icmp eq i64 %t2932, 880
  %t2955 = select i1 %t2954, i64 257, i64 1
  br label %fixmerge1117
fixslow1116:
  %t2956 = call i64 @rt_num_eq(i64 %t2932, i64 880)
  br label %fixmerge1117
fixmerge1117:
  %t2957 = phi i64 [ %t2955, %fixfast1115 ], [ %t2956, %fixslow1116 ]
  %t2958 = icmp ne i64 %t2957, 1
  br i1 %t2958, label %then1118, label %else1119
then1118:
  %t2959 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2959
else1119:
  %t2960 = or i64 %t2932, 928
  %t2961 = and i64 %t2960, 7
  %t2962 = icmp eq i64 %t2961, 0
  br i1 %t2962, label %fixfast1120, label %fixslow1121
fixfast1120:
  %t2963 = icmp eq i64 %t2932, 928
  %t2964 = select i1 %t2963, i64 257, i64 1
  br label %fixmerge1122
fixslow1121:
  %t2965 = call i64 @rt_num_eq(i64 %t2932, i64 928)
  br label %fixmerge1122
fixmerge1122:
  %t2966 = phi i64 [ %t2964, %fixfast1120 ], [ %t2965, %fixslow1121 ]
  %t2967 = icmp ne i64 %t2966, 1
  br i1 %t2967, label %then1123, label %else1124
then1123:
  %t2968 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2968
else1124:
  %t2969 = or i64 %t2932, 912
  %t2970 = and i64 %t2969, 7
  %t2971 = icmp eq i64 %t2970, 0
  br i1 %t2971, label %fixfast1125, label %fixslow1126
fixfast1125:
  %t2972 = icmp eq i64 %t2932, 912
  %t2973 = select i1 %t2972, i64 257, i64 1
  br label %fixmerge1127
fixslow1126:
  %t2974 = call i64 @rt_num_eq(i64 %t2932, i64 912)
  br label %fixmerge1127
fixmerge1127:
  %t2975 = phi i64 [ %t2973, %fixfast1125 ], [ %t2974, %fixslow1126 ]
  %t2976 = icmp ne i64 %t2975, 1
  br i1 %t2976, label %then1128, label %else1129
then1128:
  %t2977 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2977
else1129:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code:rd-intraline"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2982 = icmp eq i64 %argc, 3
  br i1 %t2982, label %argok1131, label %arityerr1130
arityerr1130:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1131:
  %t2983 = or i64 %a2, %a1
  %t2984 = and i64 %t2983, 7
  %t2985 = icmp eq i64 %t2984, 0
  br i1 %t2985, label %fixfast1132, label %fixslow1133
fixfast1132:
  %t2986 = icmp slt i64 %a2, %a1
  %t2987 = select i1 %t2986, i64 257, i64 1
  br label %fixmerge1134
fixslow1133:
  %t2988 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1134
fixmerge1134:
  %t2989 = phi i64 [ %t2987, %fixfast1132 ], [ %t2988, %fixslow1133 ]
  %t2990 = icmp ne i64 %t2989, 1
  br i1 %t2990, label %then1135, label %else1136
then1135:
  %t2991 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2992 = call i64 @rt_char_to_integer(i64 %t2991)
  %t2993 = or i64 %t2992, 256
  %t2994 = and i64 %t2993, 7
  %t2995 = icmp eq i64 %t2994, 0
  br i1 %t2995, label %fixfast1137, label %fixslow1138
fixfast1137:
  %t2996 = icmp eq i64 %t2992, 256
  %t2997 = select i1 %t2996, i64 257, i64 1
  br label %fixmerge1139
fixslow1138:
  %t2998 = call i64 @rt_num_eq(i64 %t2992, i64 256)
  br label %fixmerge1139
fixmerge1139:
  %t2999 = phi i64 [ %t2997, %fixfast1137 ], [ %t2998, %fixslow1138 ]
  %t3000 = icmp ne i64 %t2999, 1
  br i1 %t3000, label %then1140, label %else1141
then1140:
  br label %merge1142
else1141:
  %t3001 = or i64 %t2992, 72
  %t3002 = and i64 %t3001, 7
  %t3003 = icmp eq i64 %t3002, 0
  br i1 %t3003, label %fixfast1143, label %fixslow1144
fixfast1143:
  %t3004 = icmp eq i64 %t2992, 72
  %t3005 = select i1 %t3004, i64 257, i64 1
  br label %fixmerge1145
fixslow1144:
  %t3006 = call i64 @rt_num_eq(i64 %t2992, i64 72)
  br label %fixmerge1145
fixmerge1145:
  %t3007 = phi i64 [ %t3005, %fixfast1143 ], [ %t3006, %fixslow1144 ]
  br label %merge1142
merge1142:
  %t3008 = phi i64 [ 257, %then1140 ], [ %t3007, %fixmerge1145 ]
  %t3009 = icmp ne i64 %t3008, 1
  br i1 %t3009, label %then1146, label %else1147
then1146:
  %t3010 = or i64 %a2, 8
  %t3011 = and i64 %t3010, 7
  %t3012 = icmp eq i64 %t3011, 0
  br i1 %t3012, label %fixfast1148, label %fixslow1149
fixfast1148:
  %t3013 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3014 = extractvalue {i64, i1} %t3013, 0
  %t3015 = extractvalue {i64, i1} %t3013, 1
  br i1 %t3015, label %fixslow1149, label %fixmerge1150
fixslow1149:
  %t3016 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1150
fixmerge1150:
  %t3017 = phi i64 [ %t3014, %fixfast1148 ], [ %t3016, %fixslow1149 ]
  %t3018 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3018)
  %t3019 = and i64 %t3018, -8
  %t3020 = inttoptr i64 %t3019 to ptr
  %t3021 = load i64, ptr %t3020
  %t3022 = inttoptr i64 %t3021 to ptr
  %t3023 = musttail call fastcc i64 %t3022(i64 %t3018, i64 3, i64 %a0, i64 %a1, i64 %t3017, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3023
else1147:
  ret i64 %a2
else1136:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-line-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3028 = icmp eq i64 %argc, 3
  br i1 %t3028, label %argok1152, label %arityerr1151
arityerr1151:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1152:
  %t3029 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3029)
  %t3030 = and i64 %t3029, -8
  %t3031 = inttoptr i64 %t3030 to ptr
  %t3032 = load i64, ptr %t3031
  %t3033 = inttoptr i64 %t3032 to ptr
  %t3034 = call fastcc i64%t3033(i64 %t3029, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3035 = or i64 %t3034, %a1
  %t3036 = and i64 %t3035, 7
  %t3037 = icmp eq i64 %t3036, 0
  br i1 %t3037, label %fixfast1153, label %fixslow1154
fixfast1153:
  %t3038 = icmp slt i64 %t3034, %a1
  %t3039 = select i1 %t3038, i64 257, i64 1
  br label %fixmerge1155
fixslow1154:
  %t3040 = call i64 @rt_lt(i64 %t3034, i64 %a1)
  br label %fixmerge1155
fixmerge1155:
  %t3041 = phi i64 [ %t3039, %fixfast1153 ], [ %t3040, %fixslow1154 ]
  %t3042 = icmp ne i64 %t3041, 1
  br i1 %t3042, label %then1156, label %else1157
then1156:
  %t3043 = call i64 @rt_string_ref(i64 %a0, i64 %t3034)
  %t3044 = call i64 @rt_char_to_integer(i64 %t3043)
  %t3045 = or i64 %t3044, 80
  %t3046 = and i64 %t3045, 7
  %t3047 = icmp eq i64 %t3046, 0
  br i1 %t3047, label %fixfast1158, label %fixslow1159
fixfast1158:
  %t3048 = icmp eq i64 %t3044, 80
  %t3049 = select i1 %t3048, i64 257, i64 1
  br label %fixmerge1160
fixslow1159:
  %t3050 = call i64 @rt_num_eq(i64 %t3044, i64 80)
  br label %fixmerge1160
fixmerge1160:
  %t3051 = phi i64 [ %t3049, %fixfast1158 ], [ %t3050, %fixslow1159 ]
  %t3052 = icmp ne i64 %t3051, 1
  br i1 %t3052, label %then1161, label %else1162
then1161:
  %t3053 = or i64 %t3034, 8
  %t3054 = and i64 %t3053, 7
  %t3055 = icmp eq i64 %t3054, 0
  br i1 %t3055, label %fixfast1163, label %fixslow1164
fixfast1163:
  %t3056 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3034, i64 8)
  %t3057 = extractvalue {i64, i1} %t3056, 0
  %t3058 = extractvalue {i64, i1} %t3056, 1
  br i1 %t3058, label %fixslow1164, label %fixmerge1165
fixslow1164:
  %t3059 = call i64 @rt_add(i64 %t3034, i64 8)
  br label %fixmerge1165
fixmerge1165:
  %t3060 = phi i64 [ %t3057, %fixfast1163 ], [ %t3059, %fixslow1164 ]
  %t3061 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3061)
  %t3062 = and i64 %t3061, -8
  %t3063 = inttoptr i64 %t3062 to ptr
  %t3064 = load i64, ptr %t3063
  %t3065 = inttoptr i64 %t3064 to ptr
  %t3066 = musttail call fastcc i64 %t3065(i64 %t3061, i64 3, i64 %a0, i64 %a1, i64 %t3060, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3066
else1162:
  %t3067 = or i64 %t3044, 104
  %t3068 = and i64 %t3067, 7
  %t3069 = icmp eq i64 %t3068, 0
  br i1 %t3069, label %fixfast1166, label %fixslow1167
fixfast1166:
  %t3070 = icmp eq i64 %t3044, 104
  %t3071 = select i1 %t3070, i64 257, i64 1
  br label %fixmerge1168
fixslow1167:
  %t3072 = call i64 @rt_num_eq(i64 %t3044, i64 104)
  br label %fixmerge1168
fixmerge1168:
  %t3073 = phi i64 [ %t3071, %fixfast1166 ], [ %t3072, %fixslow1167 ]
  %t3074 = icmp ne i64 %t3073, 1
  br i1 %t3074, label %then1169, label %else1170
then1169:
  %t3075 = or i64 %t3034, 8
  %t3076 = and i64 %t3075, 7
  %t3077 = icmp eq i64 %t3076, 0
  br i1 %t3077, label %fixfast1171, label %fixslow1172
fixfast1171:
  %t3078 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3034, i64 8)
  %t3079 = extractvalue {i64, i1} %t3078, 0
  %t3080 = extractvalue {i64, i1} %t3078, 1
  br i1 %t3080, label %fixslow1172, label %fixmerge1173
fixslow1172:
  %t3081 = call i64 @rt_add(i64 %t3034, i64 8)
  br label %fixmerge1173
fixmerge1173:
  %t3082 = phi i64 [ %t3079, %fixfast1171 ], [ %t3081, %fixslow1172 ]
  %t3083 = or i64 %t3082, %a1
  %t3084 = and i64 %t3083, 7
  %t3085 = icmp eq i64 %t3084, 0
  br i1 %t3085, label %fixfast1174, label %fixslow1175
fixfast1174:
  %t3086 = icmp slt i64 %t3082, %a1
  %t3087 = select i1 %t3086, i64 257, i64 1
  br label %fixmerge1176
fixslow1175:
  %t3088 = call i64 @rt_lt(i64 %t3082, i64 %a1)
  br label %fixmerge1176
fixmerge1176:
  %t3089 = phi i64 [ %t3087, %fixfast1174 ], [ %t3088, %fixslow1175 ]
  %t3090 = icmp ne i64 %t3089, 1
  br i1 %t3090, label %then1177, label %else1178
then1177:
  %t3091 = or i64 %t3034, 8
  %t3092 = and i64 %t3091, 7
  %t3093 = icmp eq i64 %t3092, 0
  br i1 %t3093, label %fixfast1180, label %fixslow1181
fixfast1180:
  %t3094 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3034, i64 8)
  %t3095 = extractvalue {i64, i1} %t3094, 0
  %t3096 = extractvalue {i64, i1} %t3094, 1
  br i1 %t3096, label %fixslow1181, label %fixmerge1182
fixslow1181:
  %t3097 = call i64 @rt_add(i64 %t3034, i64 8)
  br label %fixmerge1182
fixmerge1182:
  %t3098 = phi i64 [ %t3095, %fixfast1180 ], [ %t3097, %fixslow1181 ]
  %t3099 = call i64 @rt_string_ref(i64 %a0, i64 %t3098)
  %t3100 = call i64 @rt_char_to_integer(i64 %t3099)
  %t3101 = or i64 %t3100, 80
  %t3102 = and i64 %t3101, 7
  %t3103 = icmp eq i64 %t3102, 0
  br i1 %t3103, label %fixfast1183, label %fixslow1184
fixfast1183:
  %t3104 = icmp eq i64 %t3100, 80
  %t3105 = select i1 %t3104, i64 257, i64 1
  br label %fixmerge1185
fixslow1184:
  %t3106 = call i64 @rt_num_eq(i64 %t3100, i64 80)
  br label %fixmerge1185
fixmerge1185:
  %t3107 = phi i64 [ %t3105, %fixfast1183 ], [ %t3106, %fixslow1184 ]
  %t3108 = icmp ne i64 %t3107, 1
  br i1 %t3108, label %then1186, label %else1187
then1186:
  %t3109 = or i64 %t3034, 16
  %t3110 = and i64 %t3109, 7
  %t3111 = icmp eq i64 %t3110, 0
  br i1 %t3111, label %fixfast1189, label %fixslow1190
fixfast1189:
  %t3112 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3034, i64 16)
  %t3113 = extractvalue {i64, i1} %t3112, 0
  %t3114 = extractvalue {i64, i1} %t3112, 1
  br i1 %t3114, label %fixslow1190, label %fixmerge1191
fixslow1190:
  %t3115 = call i64 @rt_add(i64 %t3034, i64 16)
  br label %fixmerge1191
fixmerge1191:
  %t3116 = phi i64 [ %t3113, %fixfast1189 ], [ %t3115, %fixslow1190 ]
  br label %merge1188
else1187:
  %t3117 = or i64 %t3034, 8
  %t3118 = and i64 %t3117, 7
  %t3119 = icmp eq i64 %t3118, 0
  br i1 %t3119, label %fixfast1192, label %fixslow1193
fixfast1192:
  %t3120 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3034, i64 8)
  %t3121 = extractvalue {i64, i1} %t3120, 0
  %t3122 = extractvalue {i64, i1} %t3120, 1
  br i1 %t3122, label %fixslow1193, label %fixmerge1194
fixslow1193:
  %t3123 = call i64 @rt_add(i64 %t3034, i64 8)
  br label %fixmerge1194
fixmerge1194:
  %t3124 = phi i64 [ %t3121, %fixfast1192 ], [ %t3123, %fixslow1193 ]
  br label %merge1188
merge1188:
  %t3125 = phi i64 [ %t3116, %fixmerge1191 ], [ %t3124, %fixmerge1194 ]
  br label %merge1179
else1178:
  %t3126 = or i64 %t3034, 8
  %t3127 = and i64 %t3126, 7
  %t3128 = icmp eq i64 %t3127, 0
  br i1 %t3128, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t3129 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3034, i64 8)
  %t3130 = extractvalue {i64, i1} %t3129, 0
  %t3131 = extractvalue {i64, i1} %t3129, 1
  br i1 %t3131, label %fixslow1196, label %fixmerge1197
fixslow1196:
  %t3132 = call i64 @rt_add(i64 %t3034, i64 8)
  br label %fixmerge1197
fixmerge1197:
  %t3133 = phi i64 [ %t3130, %fixfast1195 ], [ %t3132, %fixslow1196 ]
  br label %merge1179
merge1179:
  %t3134 = phi i64 [ %t3125, %merge1188 ], [ %t3133, %fixmerge1197 ]
  %t3135 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t3135)
  %t3136 = and i64 %t3135, -8
  %t3137 = inttoptr i64 %t3136 to ptr
  %t3138 = load i64, ptr %t3137
  %t3139 = inttoptr i64 %t3138 to ptr
  %t3140 = musttail call fastcc i64 %t3139(i64 %t3135, i64 3, i64 %a0, i64 %a1, i64 %t3134, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3140
else1170:
  ret i64 1
else1157:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_943"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3145 = icmp eq i64 %argc, 2
  br i1 %t3145, label %argok1199, label %arityerr1198
arityerr1198:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1199:
  %t3146 = and i64 %self, -8
  %t3147 = inttoptr i64 %t3146 to ptr
  %t3148 = getelementptr i64, ptr %t3147, i64 1
  %t3149 = load i64, ptr %t3148
  %t3150 = or i64 %a0, %t3149
  %t3151 = and i64 %t3150, 7
  %t3152 = icmp eq i64 %t3151, 0
  br i1 %t3152, label %fixfast1200, label %fixslow1201
fixfast1200:
  %t3153 = icmp slt i64 %a0, %t3149
  %t3154 = select i1 %t3153, i64 257, i64 1
  br label %fixmerge1202
fixslow1201:
  %t3155 = call i64 @rt_lt(i64 %a0, i64 %t3149)
  br label %fixmerge1202
fixmerge1202:
  %t3156 = phi i64 [ %t3154, %fixfast1200 ], [ %t3155, %fixslow1201 ]
  %t3157 = icmp ne i64 %t3156, 1
  br i1 %t3157, label %then1203, label %else1204
then1203:
  %t3158 = and i64 %self, -8
  %t3159 = inttoptr i64 %t3158 to ptr
  %t3160 = getelementptr i64, ptr %t3159, i64 2
  %t3161 = load i64, ptr %t3160
  %t3162 = call i64 @rt_string_ref(i64 %t3161, i64 %a0)
  %t3163 = call i64 @rt_char_to_integer(i64 %t3162)
  %t3164 = or i64 %t3163, 272
  %t3165 = and i64 %t3164, 7
  %t3166 = icmp eq i64 %t3165, 0
  br i1 %t3166, label %fixfast1205, label %fixslow1206
fixfast1205:
  %t3167 = icmp eq i64 %t3163, 272
  %t3168 = select i1 %t3167, i64 257, i64 1
  br label %fixmerge1207
fixslow1206:
  %t3169 = call i64 @rt_num_eq(i64 %t3163, i64 272)
  br label %fixmerge1207
fixmerge1207:
  %t3170 = phi i64 [ %t3168, %fixfast1205 ], [ %t3169, %fixslow1206 ]
  %t3171 = icmp ne i64 %t3170, 1
  br i1 %t3171, label %then1208, label %else1209
then1208:
  %t3172 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t3172)
  %t3173 = and i64 %t3172, -8
  %t3174 = inttoptr i64 %t3173 to ptr
  %t3175 = load i64, ptr %t3174
  %t3176 = inttoptr i64 %t3175 to ptr
  %t3177 = call fastcc i64%t3176(i64 %t3172, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3178 = call i64 @rt_list_to_string(i64 %t3177)
  %t3179 = or i64 %a0, 8
  %t3180 = and i64 %t3179, 7
  %t3181 = icmp eq i64 %t3180, 0
  br i1 %t3181, label %fixfast1210, label %fixslow1211
fixfast1210:
  %t3182 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3183 = extractvalue {i64, i1} %t3182, 0
  %t3184 = extractvalue {i64, i1} %t3182, 1
  br i1 %t3184, label %fixslow1211, label %fixmerge1212
fixslow1211:
  %t3185 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1212
fixmerge1212:
  %t3186 = phi i64 [ %t3183, %fixfast1210 ], [ %t3185, %fixslow1211 ]
  %t3187 = call i64 @rt_cons(i64 %t3178, i64 %t3186)
  ret i64 %t3187
else1209:
  %t3188 = or i64 %t3163, 736
  %t3189 = and i64 %t3188, 7
  %t3190 = icmp eq i64 %t3189, 0
  br i1 %t3190, label %fixfast1213, label %fixslow1214
fixfast1213:
  %t3191 = icmp eq i64 %t3163, 736
  %t3192 = select i1 %t3191, i64 257, i64 1
  br label %fixmerge1215
fixslow1214:
  %t3193 = call i64 @rt_num_eq(i64 %t3163, i64 736)
  br label %fixmerge1215
fixmerge1215:
  %t3194 = phi i64 [ %t3192, %fixfast1213 ], [ %t3193, %fixslow1214 ]
  %t3195 = icmp ne i64 %t3194, 1
  br i1 %t3195, label %then1216, label %else1217
then1216:
  %t3196 = and i64 %self, -8
  %t3197 = inttoptr i64 %t3196 to ptr
  %t3198 = getelementptr i64, ptr %t3197, i64 1
  %t3199 = load i64, ptr %t3198
  %t3200 = or i64 %a0, 8
  %t3201 = and i64 %t3200, 7
  %t3202 = icmp eq i64 %t3201, 0
  br i1 %t3202, label %fixfast1218, label %fixslow1219
fixfast1218:
  %t3203 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3204 = extractvalue {i64, i1} %t3203, 0
  %t3205 = extractvalue {i64, i1} %t3203, 1
  br i1 %t3205, label %fixslow1219, label %fixmerge1220
fixslow1219:
  %t3206 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1220
fixmerge1220:
  %t3207 = phi i64 [ %t3204, %fixfast1218 ], [ %t3206, %fixslow1219 ]
  %t3208 = or i64 %t3199, %t3207
  %t3209 = and i64 %t3208, 7
  %t3210 = icmp eq i64 %t3209, 0
  br i1 %t3210, label %fixfast1221, label %fixslow1222
fixfast1221:
  %t3211 = icmp slt i64 %t3199, %t3207
  %t3212 = select i1 %t3211, i64 257, i64 1
  br label %fixmerge1223
fixslow1222:
  %t3213 = call i64 @rt_lt(i64 %t3199, i64 %t3207)
  br label %fixmerge1223
fixmerge1223:
  %t3214 = phi i64 [ %t3212, %fixfast1221 ], [ %t3213, %fixslow1222 ]
  %t3215 = icmp ne i64 %t3214, 1
  br i1 %t3215, label %then1224, label %else1225
then1224:
  br label %merge1226
else1225:
  %t3216 = or i64 %t3199, %t3207
  %t3217 = and i64 %t3216, 7
  %t3218 = icmp eq i64 %t3217, 0
  br i1 %t3218, label %fixfast1227, label %fixslow1228
fixfast1227:
  %t3219 = icmp eq i64 %t3199, %t3207
  %t3220 = select i1 %t3219, i64 257, i64 1
  br label %fixmerge1229
fixslow1228:
  %t3221 = call i64 @rt_num_eq(i64 %t3199, i64 %t3207)
  br label %fixmerge1229
fixmerge1229:
  %t3222 = phi i64 [ %t3220, %fixfast1227 ], [ %t3221, %fixslow1228 ]
  br label %merge1226
merge1226:
  %t3223 = phi i64 [ 257, %then1224 ], [ %t3222, %fixmerge1229 ]
  %t3224 = icmp ne i64 %t3223, 1
  br i1 %t3224, label %then1230, label %else1231
then1230:
  %t3225 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3226 = and i64 %self, -8
  %t3227 = inttoptr i64 %t3226 to ptr
  %t3228 = getelementptr i64, ptr %t3227, i64 3
  %t3229 = load i64, ptr %t3228
  %t3230 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3230)
  %t3231 = and i64 %t3230, -8
  %t3232 = inttoptr i64 %t3231 to ptr
  %t3233 = load i64, ptr %t3232
  %t3234 = inttoptr i64 %t3233 to ptr
  %t3235 = musttail call fastcc i64 %t3234(i64 %t3230, i64 2, i64 %t3225, i64 %t3229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3235
else1231:
  %t3236 = and i64 %self, -8
  %t3237 = inttoptr i64 %t3236 to ptr
  %t3238 = getelementptr i64, ptr %t3237, i64 2
  %t3239 = load i64, ptr %t3238
  %t3240 = or i64 %a0, 8
  %t3241 = and i64 %t3240, 7
  %t3242 = icmp eq i64 %t3241, 0
  br i1 %t3242, label %fixfast1232, label %fixslow1233
fixfast1232:
  %t3243 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3244 = extractvalue {i64, i1} %t3243, 0
  %t3245 = extractvalue {i64, i1} %t3243, 1
  br i1 %t3245, label %fixslow1233, label %fixmerge1234
fixslow1233:
  %t3246 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1234
fixmerge1234:
  %t3247 = phi i64 [ %t3244, %fixfast1232 ], [ %t3246, %fixslow1233 ]
  %t3248 = call i64 @rt_string_ref(i64 %t3239, i64 %t3247)
  %t3249 = and i64 %self, -8
  %t3250 = inttoptr i64 %t3249 to ptr
  %t3251 = getelementptr i64, ptr %t3250, i64 2
  %t3252 = load i64, ptr %t3251
  %t3253 = and i64 %self, -8
  %t3254 = inttoptr i64 %t3253 to ptr
  %t3255 = getelementptr i64, ptr %t3254, i64 1
  %t3256 = load i64, ptr %t3255
  %t3257 = or i64 %a0, 8
  %t3258 = and i64 %t3257, 7
  %t3259 = icmp eq i64 %t3258, 0
  br i1 %t3259, label %fixfast1235, label %fixslow1236
fixfast1235:
  %t3260 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3261 = extractvalue {i64, i1} %t3260, 0
  %t3262 = extractvalue {i64, i1} %t3260, 1
  br i1 %t3262, label %fixslow1236, label %fixmerge1237
fixslow1236:
  %t3263 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1237
fixmerge1237:
  %t3264 = phi i64 [ %t3261, %fixfast1235 ], [ %t3263, %fixslow1236 ]
  %t3265 = load i64, ptr @"emit.internal:rd-line-continuation"
  call void @rt_check_callable(i64 %t3265)
  %t3266 = and i64 %t3265, -8
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = load i64, ptr %t3267
  %t3269 = inttoptr i64 %t3268 to ptr
  %t3270 = call fastcc i64%t3269(i64 %t3265, i64 3, i64 %t3252, i64 %t3256, i64 %t3264, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3271 = icmp ne i64 %t3270, 1
  br i1 %t3271, label %then1238, label %else1239
then1238:
  %t3272 = musttail call fastcc i64 @"emit.internal:code_943"(i64 %self, i64 2, i64 %t3270, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3272
else1239:
  %t3273 = call i64 @rt_char_to_integer(i64 %t3248)
  %t3274 = or i64 %t3273, 960
  %t3275 = and i64 %t3274, 7
  %t3276 = icmp eq i64 %t3275, 0
  br i1 %t3276, label %fixfast1240, label %fixslow1241
fixfast1240:
  %t3277 = icmp eq i64 %t3273, 960
  %t3278 = select i1 %t3277, i64 257, i64 1
  br label %fixmerge1242
fixslow1241:
  %t3279 = call i64 @rt_num_eq(i64 %t3273, i64 960)
  br label %fixmerge1242
fixmerge1242:
  %t3280 = phi i64 [ %t3278, %fixfast1240 ], [ %t3279, %fixslow1241 ]
  %t3281 = icmp ne i64 %t3280, 1
  br i1 %t3281, label %then1243, label %else1244
then1243:
  %t3282 = and i64 %self, -8
  %t3283 = inttoptr i64 %t3282 to ptr
  %t3284 = getelementptr i64, ptr %t3283, i64 2
  %t3285 = load i64, ptr %t3284
  %t3286 = and i64 %self, -8
  %t3287 = inttoptr i64 %t3286 to ptr
  %t3288 = getelementptr i64, ptr %t3287, i64 1
  %t3289 = load i64, ptr %t3288
  %t3290 = or i64 %a0, 16
  %t3291 = and i64 %t3290, 7
  %t3292 = icmp eq i64 %t3291, 0
  br i1 %t3292, label %fixfast1245, label %fixslow1246
fixfast1245:
  %t3293 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3294 = extractvalue {i64, i1} %t3293, 0
  %t3295 = extractvalue {i64, i1} %t3293, 1
  br i1 %t3295, label %fixslow1246, label %fixmerge1247
fixslow1246:
  %t3296 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1247
fixmerge1247:
  %t3297 = phi i64 [ %t3294, %fixfast1245 ], [ %t3296, %fixslow1246 ]
  %t3298 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t3298)
  %t3299 = and i64 %t3298, -8
  %t3300 = inttoptr i64 %t3299 to ptr
  %t3301 = load i64, ptr %t3300
  %t3302 = inttoptr i64 %t3301 to ptr
  %t3303 = call fastcc i64%t3302(i64 %t3298, i64 4, i64 %t3285, i64 %t3289, i64 %t3297, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3304 = call i64 @rt_cdr(i64 %t3303)
  %t3305 = call i64 @rt_car(i64 %t3303)
  %t3306 = call i64 @rt_integer_to_char(i64 %t3305)
  %t3307 = call i64 @rt_cons(i64 %t3306, i64 %a1)
  %t3308 = musttail call fastcc i64 @"emit.internal:code_943"(i64 %self, i64 2, i64 %t3304, i64 %t3307, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3308
else1244:
  %t3309 = or i64 %a0, 16
  %t3310 = and i64 %t3309, 7
  %t3311 = icmp eq i64 %t3310, 0
  br i1 %t3311, label %fixfast1248, label %fixslow1249
fixfast1248:
  %t3312 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3313 = extractvalue {i64, i1} %t3312, 0
  %t3314 = extractvalue {i64, i1} %t3312, 1
  br i1 %t3314, label %fixslow1249, label %fixmerge1250
fixslow1249:
  %t3315 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1250
fixmerge1250:
  %t3316 = phi i64 [ %t3313, %fixfast1248 ], [ %t3315, %fixslow1249 ]
  %t3317 = load i64, ptr @"emit.internal:rd-str-esc"
  call void @rt_check_callable(i64 %t3317)
  %t3318 = and i64 %t3317, -8
  %t3319 = inttoptr i64 %t3318 to ptr
  %t3320 = load i64, ptr %t3319
  %t3321 = inttoptr i64 %t3320 to ptr
  %t3322 = call fastcc i64%t3321(i64 %t3317, i64 1, i64 %t3248, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3323 = call i64 @rt_cons(i64 %t3322, i64 %a1)
  %t3324 = musttail call fastcc i64 @"emit.internal:code_943"(i64 %self, i64 2, i64 %t3316, i64 %t3323, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3324
else1217:
  %t3325 = or i64 %a0, 8
  %t3326 = and i64 %t3325, 7
  %t3327 = icmp eq i64 %t3326, 0
  br i1 %t3327, label %fixfast1251, label %fixslow1252
fixfast1251:
  %t3328 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3329 = extractvalue {i64, i1} %t3328, 0
  %t3330 = extractvalue {i64, i1} %t3328, 1
  br i1 %t3330, label %fixslow1252, label %fixmerge1253
fixslow1252:
  %t3331 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1253
fixmerge1253:
  %t3332 = phi i64 [ %t3329, %fixfast1251 ], [ %t3331, %fixslow1252 ]
  %t3333 = call i64 @rt_cons(i64 %t3162, i64 %a1)
  %t3334 = musttail call fastcc i64 @"emit.internal:code_943"(i64 %self, i64 2, i64 %t3332, i64 %t3333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3334
else1204:
  %t3335 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3336 = and i64 %self, -8
  %t3337 = inttoptr i64 %t3336 to ptr
  %t3338 = getelementptr i64, ptr %t3337, i64 3
  %t3339 = load i64, ptr %t3338
  %t3340 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3340)
  %t3341 = and i64 %t3340, -8
  %t3342 = inttoptr i64 %t3341 to ptr
  %t3343 = load i64, ptr %t3342
  %t3344 = inttoptr i64 %t3343 to ptr
  %t3345 = musttail call fastcc i64 %t3344(i64 %t3340, i64 2, i64 %t3335, i64 %t3339, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3345
}

define fastcc i64 @"emit.internal:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3346 = icmp eq i64 %argc, 4
  br i1 %t3346, label %argok1255, label %arityerr1254
arityerr1254:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1255:
  %t3347 = call ptr @rt_alloc_words(i64 5)
  %t3348 = ptrtoint ptr %t3347 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_943" to i64), ptr %t3347
  %t3349 = or i64 %t3348, 4
  %t3350 = getelementptr i64, ptr %t3347, i64 1
  store i64 %a1, ptr %t3350
  %t3351 = getelementptr i64, ptr %t3347, i64 2
  store i64 %a0, ptr %t3351
  %t3352 = getelementptr i64, ptr %t3347, i64 3
  store i64 %a3, ptr %t3352
  %t3353 = getelementptr i64, ptr %t3347, i64 4
  store i64 %t3349, ptr %t3353
  %t3354 = musttail call fastcc i64 @"emit.internal:code_943"(i64 %t3349, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3354
}

define fastcc i64 @"emit.internal:code_954"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3359 = icmp eq i64 %argc, 1
  br i1 %t3359, label %argok1257, label %arityerr1256
arityerr1256:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1257:
  %t3360 = call i64 @rt_null_p(i64 %a0)
  %t3361 = icmp ne i64 %t3360, 1
  br i1 %t3361, label %then1258, label %else1259
then1258:
  ret i64 1
else1259:
  %t3362 = and i64 %self, -8
  %t3363 = inttoptr i64 %t3362 to ptr
  %t3364 = getelementptr i64, ptr %t3363, i64 1
  %t3365 = load i64, ptr %t3364
  %t3366 = call i64 @rt_car(i64 %a0)
  %t3367 = call i64 @rt_car(i64 %t3366)
  %t3368 = or i64 %t3365, %t3367
  %t3369 = and i64 %t3368, 7
  %t3370 = icmp eq i64 %t3369, 0
  br i1 %t3370, label %fixfast1260, label %fixslow1261
fixfast1260:
  %t3371 = icmp eq i64 %t3365, %t3367
  %t3372 = select i1 %t3371, i64 257, i64 1
  br label %fixmerge1262
fixslow1261:
  %t3373 = call i64 @rt_num_eq(i64 %t3365, i64 %t3367)
  br label %fixmerge1262
fixmerge1262:
  %t3374 = phi i64 [ %t3372, %fixfast1260 ], [ %t3373, %fixslow1261 ]
  %t3375 = icmp ne i64 %t3374, 1
  br i1 %t3375, label %then1263, label %else1264
then1263:
  %t3376 = call i64 @rt_car(i64 %a0)
  ret i64 %t3376
else1264:
  %t3377 = call i64 @rt_cdr(i64 %a0)
  %t3378 = musttail call fastcc i64 @"emit.internal:code_954"(i64 %self, i64 1, i64 %t3377, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3378
}

define fastcc i64 @"emit.internal:code:rd-label-find"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3379 = icmp eq i64 %argc, 2
  br i1 %t3379, label %argok1266, label %arityerr1265
arityerr1265:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1266:
  %t3380 = call ptr @rt_alloc_words(i64 3)
  %t3381 = ptrtoint ptr %t3380 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_954" to i64), ptr %t3380
  %t3382 = or i64 %t3381, 4
  %t3383 = getelementptr i64, ptr %t3380, i64 1
  store i64 %a1, ptr %t3383
  %t3384 = getelementptr i64, ptr %t3380, i64 2
  store i64 %t3382, ptr %t3384
  %t3385 = call i64 @rt_vector_ref(i64 %a0, i64 8)
  %t3386 = musttail call fastcc i64 @"emit.internal:code_954"(i64 %t3382, i64 1, i64 %t3385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3386
}

define fastcc i64 @"emit.internal:code:rd-label-add!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3391 = icmp eq i64 %argc, 2
  br i1 %t3391, label %argok1268, label %arityerr1267
arityerr1267:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1268:
  %t3392 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3393 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3393)
  %t3394 = and i64 %t3393, -8
  %t3395 = inttoptr i64 %t3394 to ptr
  %t3396 = load i64, ptr %t3395
  %t3397 = inttoptr i64 %t3396 to ptr
  %t3398 = call fastcc i64%t3397(i64 %t3393, i64 2, i64 %t3392, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3399 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t3399)
  %t3400 = and i64 %t3399, -8
  %t3401 = inttoptr i64 %t3400 to ptr
  %t3402 = load i64, ptr %t3401
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = call fastcc i64%t3403(i64 %t3399, i64 1, i64 %t3398, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3405 = call i64 @rt_cons(i64 %a1, i64 %t3404)
  %t3406 = call i64 @rt_vector_ref(i64 %a0, i64 8)
  %t3407 = call i64 @rt_cons(i64 %t3405, i64 %t3406)
  %t3408 = call i64 @rt_vector_set(i64 %a0, i64 8, i64 %t3407)
  ret i64 %t3405
}

define fastcc i64 @"emit.internal:code:rd-placeholder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3413 = icmp eq i64 %argc, 2
  br i1 %t3413, label %argok1270, label %arityerr1269
arityerr1269:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1270:
  %t3414 = call i64 @rt_vector_ref(i64 %a0, i64 16)
  %t3415 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3415)
  %t3416 = and i64 %t3415, -8
  %t3417 = inttoptr i64 %t3416 to ptr
  %t3418 = load i64, ptr %t3417
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = call fastcc i64%t3419(i64 %t3415, i64 2, i64 %t3414, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3421 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t3421)
  %t3422 = and i64 %t3421, -8
  %t3423 = inttoptr i64 %t3422 to ptr
  %t3424 = load i64, ptr %t3423
  %t3425 = inttoptr i64 %t3424 to ptr
  %t3426 = musttail call fastcc i64 %t3425(i64 %t3421, i64 1, i64 %t3420, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3426
}

define fastcc i64 @"emit.internal:code:rd-placeholder?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3431 = icmp eq i64 %argc, 2
  br i1 %t3431, label %argok1272, label %arityerr1271
arityerr1271:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1272:
  %t3432 = call i64 @rt_vector_p(i64 %a1)
  %t3433 = icmp ne i64 %t3432, 1
  br i1 %t3433, label %then1273, label %else1274
then1273:
  %t3434 = call i64 @rt_vector_length(i64 %a1)
  %t3435 = or i64 %t3434, 16
  %t3436 = and i64 %t3435, 7
  %t3437 = icmp eq i64 %t3436, 0
  br i1 %t3437, label %fixfast1275, label %fixslow1276
fixfast1275:
  %t3438 = icmp eq i64 %t3434, 16
  %t3439 = select i1 %t3438, i64 257, i64 1
  br label %fixmerge1277
fixslow1276:
  %t3440 = call i64 @rt_num_eq(i64 %t3434, i64 16)
  br label %fixmerge1277
fixmerge1277:
  %t3441 = phi i64 [ %t3439, %fixfast1275 ], [ %t3440, %fixslow1276 ]
  %t3442 = icmp ne i64 %t3441, 1
  br i1 %t3442, label %then1278, label %else1279
then1278:
  %t3443 = call i64 @rt_vector_ref(i64 %a1, i64 0)
  %t3444 = call i64 @rt_vector_ref(i64 %a0, i64 16)
  %t3445 = call i64 @rt_eq_p(i64 %t3443, i64 %t3444)
  ret i64 %t3445
else1279:
  ret i64 1
else1274:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-placeholder-entry"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3450 = icmp eq i64 %argc, 1
  br i1 %t3450, label %argok1281, label %arityerr1280
arityerr1280:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1281:
  %t3451 = call i64 @rt_vector_ref(i64 %a0, i64 8)
  ret i64 %t3451
}

define fastcc i64 @"emit.internal:code:rd-seen?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3456 = icmp eq i64 %argc, 2
  br i1 %t3456, label %argok1283, label %arityerr1282
arityerr1282:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1283:
  %t3457 = call i64 @rt_null_p(i64 %a1)
  %t3458 = icmp ne i64 %t3457, 1
  br i1 %t3458, label %then1284, label %else1285
then1284:
  ret i64 1
else1285:
  %t3459 = call i64 @rt_car(i64 %a1)
  %t3460 = call i64 @rt_eq_p(i64 %a0, i64 %t3459)
  %t3461 = icmp ne i64 %t3460, 1
  br i1 %t3461, label %then1286, label %else1287
then1286:
  ret i64 257
else1287:
  %t3462 = call i64 @rt_cdr(i64 %a1)
  %t3463 = load i64, ptr @"emit.internal:rd-seen?"
  call void @rt_check_callable(i64 %t3463)
  %t3464 = and i64 %t3463, -8
  %t3465 = inttoptr i64 %t3464 to ptr
  %t3466 = load i64, ptr %t3465
  %t3467 = inttoptr i64 %t3466 to ptr
  %t3468 = musttail call fastcc i64 %t3467(i64 %t3463, i64 2, i64 %a0, i64 %t3462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3468
}

define fastcc i64 @"emit.internal:code:rd-label-scan"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3473 = icmp eq i64 %argc, 3
  br i1 %t3473, label %argok1289, label %arityerr1288
arityerr1288:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1289:
  %t3474 = or i64 %a2, %a1
  %t3475 = and i64 %t3474, 7
  %t3476 = icmp eq i64 %t3475, 0
  br i1 %t3476, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t3477 = icmp slt i64 %a2, %a1
  %t3478 = select i1 %t3477, i64 257, i64 1
  br label %fixmerge1292
fixslow1291:
  %t3479 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1292
fixmerge1292:
  %t3480 = phi i64 [ %t3478, %fixfast1290 ], [ %t3479, %fixslow1291 ]
  %t3481 = icmp ne i64 %t3480, 1
  br i1 %t3481, label %then1293, label %else1294
then1293:
  %t3482 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3483 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t3483)
  %t3484 = and i64 %t3483, -8
  %t3485 = inttoptr i64 %t3484 to ptr
  %t3486 = load i64, ptr %t3485
  %t3487 = inttoptr i64 %t3486 to ptr
  %t3488 = call fastcc i64%t3487(i64 %t3483, i64 1, i64 %t3482, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1295
else1294:
  br label %merge1295
merge1295:
  %t3489 = phi i64 [ %t3488, %then1293 ], [ 1, %else1294 ]
  %t3490 = icmp ne i64 %t3489, 1
  br i1 %t3490, label %then1296, label %else1297
then1296:
  %t3491 = or i64 %a2, 8
  %t3492 = and i64 %t3491, 7
  %t3493 = icmp eq i64 %t3492, 0
  br i1 %t3493, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t3494 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3495 = extractvalue {i64, i1} %t3494, 0
  %t3496 = extractvalue {i64, i1} %t3494, 1
  br i1 %t3496, label %fixslow1299, label %fixmerge1300
fixslow1299:
  %t3497 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1300
fixmerge1300:
  %t3498 = phi i64 [ %t3495, %fixfast1298 ], [ %t3497, %fixslow1299 ]
  %t3499 = load i64, ptr @"emit.internal:rd-label-scan"
  call void @rt_check_callable(i64 %t3499)
  %t3500 = and i64 %t3499, -8
  %t3501 = inttoptr i64 %t3500 to ptr
  %t3502 = load i64, ptr %t3501
  %t3503 = inttoptr i64 %t3502 to ptr
  %t3504 = musttail call fastcc i64 %t3503(i64 %t3499, i64 3, i64 %a0, i64 %a1, i64 %t3498, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3504
else1297:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code_1005"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3509 = icmp eq i64 %argc, 1
  br i1 %t3509, label %argok1302, label %arityerr1301
arityerr1301:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1302:
  %t3510 = and i64 %self, -8
  %t3511 = inttoptr i64 %t3510 to ptr
  %t3512 = getelementptr i64, ptr %t3511, i64 1
  %t3513 = load i64, ptr %t3512
  %t3514 = or i64 %a0, %t3513
  %t3515 = and i64 %t3514, 7
  %t3516 = icmp eq i64 %t3515, 0
  br i1 %t3516, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t3517 = icmp slt i64 %a0, %t3513
  %t3518 = select i1 %t3517, i64 257, i64 1
  br label %fixmerge1305
fixslow1304:
  %t3519 = call i64 @rt_lt(i64 %a0, i64 %t3513)
  br label %fixmerge1305
fixmerge1305:
  %t3520 = phi i64 [ %t3518, %fixfast1303 ], [ %t3519, %fixslow1304 ]
  %t3521 = icmp ne i64 %t3520, 1
  br i1 %t3521, label %then1306, label %else1307
then1306:
  %t3522 = and i64 %self, -8
  %t3523 = inttoptr i64 %t3522 to ptr
  %t3524 = getelementptr i64, ptr %t3523, i64 2
  %t3525 = load i64, ptr %t3524
  %t3526 = and i64 %self, -8
  %t3527 = inttoptr i64 %t3526 to ptr
  %t3528 = getelementptr i64, ptr %t3527, i64 3
  %t3529 = load i64, ptr %t3528
  %t3530 = and i64 %self, -8
  %t3531 = inttoptr i64 %t3530 to ptr
  %t3532 = getelementptr i64, ptr %t3531, i64 2
  %t3533 = load i64, ptr %t3532
  %t3534 = call i64 @rt_vector_ref(i64 %t3533, i64 %a0)
  %t3535 = and i64 %self, -8
  %t3536 = inttoptr i64 %t3535 to ptr
  %t3537 = getelementptr i64, ptr %t3536, i64 4
  %t3538 = load i64, ptr %t3537
  %t3539 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3539)
  %t3540 = and i64 %t3539, -8
  %t3541 = inttoptr i64 %t3540 to ptr
  %t3542 = load i64, ptr %t3541
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = call fastcc i64%t3543(i64 %t3539, i64 3, i64 %t3529, i64 %t3534, i64 %t3538, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3545 = call i64 @rt_vector_set(i64 %t3525, i64 %a0, i64 %t3544)
  %t3546 = or i64 %a0, 8
  %t3547 = and i64 %t3546, 7
  %t3548 = icmp eq i64 %t3547, 0
  br i1 %t3548, label %fixfast1308, label %fixslow1309
fixfast1308:
  %t3549 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3550 = extractvalue {i64, i1} %t3549, 0
  %t3551 = extractvalue {i64, i1} %t3549, 1
  br i1 %t3551, label %fixslow1309, label %fixmerge1310
fixslow1309:
  %t3552 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1310
fixmerge1310:
  %t3553 = phi i64 [ %t3550, %fixfast1308 ], [ %t3552, %fixslow1309 ]
  %t3554 = musttail call fastcc i64 @"emit.internal:code_1005"(i64 %self, i64 1, i64 %t3553, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3554
else1307:
  %t3555 = and i64 %self, -8
  %t3556 = inttoptr i64 %t3555 to ptr
  %t3557 = getelementptr i64, ptr %t3556, i64 2
  %t3558 = load i64, ptr %t3557
  ret i64 %t3558
}

define fastcc i64 @"emit.internal:code:rd-resolve"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3559 = icmp eq i64 %argc, 3
  br i1 %t3559, label %argok1312, label %arityerr1311
arityerr1311:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1312:
  %t3560 = load i64, ptr @"emit.internal:rd-placeholder?"
  call void @rt_check_callable(i64 %t3560)
  %t3561 = and i64 %t3560, -8
  %t3562 = inttoptr i64 %t3561 to ptr
  %t3563 = load i64, ptr %t3562
  %t3564 = inttoptr i64 %t3563 to ptr
  %t3565 = call fastcc i64%t3564(i64 %t3560, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3566 = icmp ne i64 %t3565, 1
  br i1 %t3566, label %then1313, label %else1314
then1313:
  %t3567 = load i64, ptr @"emit.internal:rd-placeholder-entry"
  call void @rt_check_callable(i64 %t3567)
  %t3568 = and i64 %t3567, -8
  %t3569 = inttoptr i64 %t3568 to ptr
  %t3570 = load i64, ptr %t3569
  %t3571 = inttoptr i64 %t3570 to ptr
  %t3572 = call fastcc i64%t3571(i64 %t3567, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3573 = call i64 @rt_cdr(i64 %t3572)
  %t3574 = call i64 @rt_vector_ref(i64 %t3573, i64 8)
  %t3575 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3575)
  %t3576 = and i64 %t3575, -8
  %t3577 = inttoptr i64 %t3576 to ptr
  %t3578 = load i64, ptr %t3577
  %t3579 = inttoptr i64 %t3578 to ptr
  %t3580 = musttail call fastcc i64 %t3579(i64 %t3575, i64 3, i64 %a0, i64 %t3574, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3580
else1314:
  %t3581 = call i64 @rt_pair_p(i64 %a1)
  %t3582 = icmp ne i64 %t3581, 1
  br i1 %t3582, label %then1315, label %else1316
then1315:
  %t3583 = load i64, ptr @"emit.internal:rd-seen?"
  call void @rt_check_callable(i64 %t3583)
  %t3584 = and i64 %t3583, -8
  %t3585 = inttoptr i64 %t3584 to ptr
  %t3586 = load i64, ptr %t3585
  %t3587 = inttoptr i64 %t3586 to ptr
  %t3588 = call fastcc i64%t3587(i64 %t3583, i64 2, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3589 = icmp ne i64 %t3588, 1
  br i1 %t3589, label %then1317, label %else1318
then1317:
  ret i64 %a1
else1318:
  %t3590 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3591 = call i64 @rt_car(i64 %a1)
  %t3592 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3592)
  %t3593 = and i64 %t3592, -8
  %t3594 = inttoptr i64 %t3593 to ptr
  %t3595 = load i64, ptr %t3594
  %t3596 = inttoptr i64 %t3595 to ptr
  %t3597 = call fastcc i64%t3596(i64 %t3592, i64 3, i64 %a0, i64 %t3591, i64 %t3590, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3598 = call i64 @rt_set_car(i64 %a1, i64 %t3597)
  %t3599 = call i64 @rt_cdr(i64 %a1)
  %t3600 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3600)
  %t3601 = and i64 %t3600, -8
  %t3602 = inttoptr i64 %t3601 to ptr
  %t3603 = load i64, ptr %t3602
  %t3604 = inttoptr i64 %t3603 to ptr
  %t3605 = call fastcc i64%t3604(i64 %t3600, i64 3, i64 %a0, i64 %t3599, i64 %t3590, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3606 = call i64 @rt_set_cdr(i64 %a1, i64 %t3605)
  ret i64 %a1
else1316:
  %t3607 = call i64 @rt_vector_p(i64 %a1)
  %t3608 = icmp ne i64 %t3607, 1
  br i1 %t3608, label %then1319, label %else1320
then1319:
  %t3609 = load i64, ptr @"emit.internal:rd-seen?"
  call void @rt_check_callable(i64 %t3609)
  %t3610 = and i64 %t3609, -8
  %t3611 = inttoptr i64 %t3610 to ptr
  %t3612 = load i64, ptr %t3611
  %t3613 = inttoptr i64 %t3612 to ptr
  %t3614 = call fastcc i64%t3613(i64 %t3609, i64 2, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3615 = icmp ne i64 %t3614, 1
  br i1 %t3615, label %then1321, label %else1322
then1321:
  ret i64 %a1
else1322:
  %t3616 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3617 = call i64 @rt_vector_length(i64 %a1)
  %t3618 = call ptr @rt_alloc_words(i64 6)
  %t3619 = ptrtoint ptr %t3618 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1005" to i64), ptr %t3618
  %t3620 = or i64 %t3619, 4
  %t3621 = getelementptr i64, ptr %t3618, i64 1
  store i64 %t3617, ptr %t3621
  %t3622 = getelementptr i64, ptr %t3618, i64 2
  store i64 %a1, ptr %t3622
  %t3623 = getelementptr i64, ptr %t3618, i64 3
  store i64 %a0, ptr %t3623
  %t3624 = getelementptr i64, ptr %t3618, i64 4
  store i64 %t3616, ptr %t3624
  %t3625 = getelementptr i64, ptr %t3618, i64 5
  store i64 %t3620, ptr %t3625
  %t3626 = musttail call fastcc i64 @"emit.internal:code_1005"(i64 %t3620, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3626
else1320:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-finish"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3631 = icmp eq i64 %argc, 2
  br i1 %t3631, label %argok1324, label %arityerr1323
arityerr1323:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1324:
  %t3632 = call i64 @rt_cdr(i64 %a1)
  %t3633 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3633)
  %t3634 = and i64 %t3633, -8
  %t3635 = inttoptr i64 %t3634 to ptr
  %t3636 = load i64, ptr %t3635
  %t3637 = inttoptr i64 %t3636 to ptr
  %t3638 = call fastcc i64%t3637(i64 %t3633, i64 1, i64 %t3632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3639 = icmp ne i64 %t3638, 1
  br i1 %t3639, label %then1325, label %else1326
then1325:
  ret i64 %a1
else1326:
  %t3640 = call i64 @rt_car(i64 %a1)
  %t3641 = load i64, ptr @"emit.internal:rd-resolve"
  call void @rt_check_callable(i64 %t3641)
  %t3642 = and i64 %t3641, -8
  %t3643 = inttoptr i64 %t3642 to ptr
  %t3644 = load i64, ptr %t3643
  %t3645 = inttoptr i64 %t3644 to ptr
  %t3646 = call fastcc i64%t3645(i64 %t3641, i64 3, i64 %a0, i64 %t3640, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3647 = call i64 @rt_cdr(i64 %a1)
  %t3648 = call i64 @rt_cons(i64 %t3646, i64 %t3647)
  ret i64 %t3648
}

define fastcc i64 @"emit.internal:code:rd-label"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3653 = icmp eq i64 %argc, 4
  br i1 %t3653, label %argok1328, label %arityerr1327
arityerr1327:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1328:
  %t3654 = load i64, ptr @"emit.internal:rd-label-scan"
  call void @rt_check_callable(i64 %t3654)
  %t3655 = and i64 %t3654, -8
  %t3656 = inttoptr i64 %t3655 to ptr
  %t3657 = load i64, ptr %t3656
  %t3658 = inttoptr i64 %t3657 to ptr
  %t3659 = call fastcc i64%t3658(i64 %t3654, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3660 = or i64 %a1, %t3659
  %t3661 = and i64 %t3660, 7
  %t3662 = icmp eq i64 %t3661, 0
  br i1 %t3662, label %fixfast1329, label %fixslow1330
fixfast1329:
  %t3663 = icmp slt i64 %a1, %t3659
  %t3664 = select i1 %t3663, i64 257, i64 1
  br label %fixmerge1331
fixslow1330:
  %t3665 = call i64 @rt_lt(i64 %a1, i64 %t3659)
  br label %fixmerge1331
fixmerge1331:
  %t3666 = phi i64 [ %t3664, %fixfast1329 ], [ %t3665, %fixslow1330 ]
  %t3667 = icmp ne i64 %t3666, 1
  br i1 %t3667, label %then1332, label %else1333
then1332:
  br label %merge1334
else1333:
  %t3668 = or i64 %t3659, %a1
  %t3669 = and i64 %t3668, 7
  %t3670 = icmp eq i64 %t3669, 0
  br i1 %t3670, label %fixfast1335, label %fixslow1336
fixfast1335:
  %t3671 = icmp eq i64 %t3659, %a1
  %t3672 = select i1 %t3671, i64 257, i64 1
  br label %fixmerge1337
fixslow1336:
  %t3673 = call i64 @rt_num_eq(i64 %t3659, i64 %a1)
  br label %fixmerge1337
fixmerge1337:
  %t3674 = phi i64 [ %t3672, %fixfast1335 ], [ %t3673, %fixslow1336 ]
  br label %merge1334
merge1334:
  %t3675 = phi i64 [ 257, %then1332 ], [ %t3674, %fixmerge1337 ]
  %t3676 = icmp ne i64 %t3675, 1
  br i1 %t3676, label %then1338, label %else1339
then1338:
  %t3677 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3678 = or i64 %a2, 8
  %t3679 = and i64 %t3678, 7
  %t3680 = icmp eq i64 %t3679, 0
  br i1 %t3680, label %fixfast1340, label %fixslow1341
fixfast1340:
  %t3681 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3682 = extractvalue {i64, i1} %t3681, 0
  %t3683 = extractvalue {i64, i1} %t3681, 1
  br i1 %t3683, label %fixslow1341, label %fixmerge1342
fixslow1341:
  %t3684 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1342
fixmerge1342:
  %t3685 = phi i64 [ %t3682, %fixfast1340 ], [ %t3684, %fixslow1341 ]
  %t3686 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3686)
  %t3687 = and i64 %t3686, -8
  %t3688 = inttoptr i64 %t3687 to ptr
  %t3689 = load i64, ptr %t3688
  %t3690 = inttoptr i64 %t3689 to ptr
  %t3691 = musttail call fastcc i64 %t3690(i64 %t3686, i64 2, i64 %t3677, i64 %t3685, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3691
else1339:
  %t3692 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t3692)
  %t3693 = and i64 %t3692, -8
  %t3694 = inttoptr i64 %t3693 to ptr
  %t3695 = load i64, ptr %t3694
  %t3696 = inttoptr i64 %t3695 to ptr
  %t3697 = call fastcc i64%t3696(i64 %t3692, i64 4, i64 %a0, i64 %a2, i64 %t3659, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3698 = call i64 @rt_string_ref(i64 %a0, i64 %t3659)
  %t3699 = call i64 @rt_char_to_integer(i64 %t3698)
  %t3700 = load i64, ptr @"emit.internal:rd-label-find"
  call void @rt_check_callable(i64 %t3700)
  %t3701 = and i64 %t3700, -8
  %t3702 = inttoptr i64 %t3701 to ptr
  %t3703 = load i64, ptr %t3702
  %t3704 = inttoptr i64 %t3703 to ptr
  %t3705 = call fastcc i64%t3704(i64 %t3700, i64 2, i64 %a3, i64 %t3697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3706 = or i64 %t3699, 488
  %t3707 = and i64 %t3706, 7
  %t3708 = icmp eq i64 %t3707, 0
  br i1 %t3708, label %fixfast1343, label %fixslow1344
fixfast1343:
  %t3709 = icmp eq i64 %t3699, 488
  %t3710 = select i1 %t3709, i64 257, i64 1
  br label %fixmerge1345
fixslow1344:
  %t3711 = call i64 @rt_num_eq(i64 %t3699, i64 488)
  br label %fixmerge1345
fixmerge1345:
  %t3712 = phi i64 [ %t3710, %fixfast1343 ], [ %t3711, %fixslow1344 ]
  %t3713 = icmp ne i64 %t3712, 1
  br i1 %t3713, label %then1346, label %else1347
then1346:
  %t3714 = icmp ne i64 %t3705, 1
  br i1 %t3714, label %then1348, label %else1349
then1348:
  %t3715 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3716 = or i64 %a2, 8
  %t3717 = and i64 %t3716, 7
  %t3718 = icmp eq i64 %t3717, 0
  br i1 %t3718, label %fixfast1350, label %fixslow1351
fixfast1350:
  %t3719 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3720 = extractvalue {i64, i1} %t3719, 0
  %t3721 = extractvalue {i64, i1} %t3719, 1
  br i1 %t3721, label %fixslow1351, label %fixmerge1352
fixslow1351:
  %t3722 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1352
fixmerge1352:
  %t3723 = phi i64 [ %t3720, %fixfast1350 ], [ %t3722, %fixslow1351 ]
  %t3724 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3724)
  %t3725 = and i64 %t3724, -8
  %t3726 = inttoptr i64 %t3725 to ptr
  %t3727 = load i64, ptr %t3726
  %t3728 = inttoptr i64 %t3727 to ptr
  %t3729 = musttail call fastcc i64 %t3728(i64 %t3724, i64 2, i64 %t3715, i64 %t3723, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3729
else1349:
  %t3730 = load i64, ptr @"emit.internal:rd-label-add!"
  call void @rt_check_callable(i64 %t3730)
  %t3731 = and i64 %t3730, -8
  %t3732 = inttoptr i64 %t3731 to ptr
  %t3733 = load i64, ptr %t3732
  %t3734 = inttoptr i64 %t3733 to ptr
  %t3735 = call fastcc i64%t3734(i64 %t3730, i64 2, i64 %a3, i64 %t3697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3736 = or i64 %t3659, 8
  %t3737 = and i64 %t3736, 7
  %t3738 = icmp eq i64 %t3737, 0
  br i1 %t3738, label %fixfast1353, label %fixslow1354
fixfast1353:
  %t3739 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3659, i64 8)
  %t3740 = extractvalue {i64, i1} %t3739, 0
  %t3741 = extractvalue {i64, i1} %t3739, 1
  br i1 %t3741, label %fixslow1354, label %fixmerge1355
fixslow1354:
  %t3742 = call i64 @rt_add(i64 %t3659, i64 8)
  br label %fixmerge1355
fixmerge1355:
  %t3743 = phi i64 [ %t3740, %fixfast1353 ], [ %t3742, %fixslow1354 ]
  %t3744 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3744)
  %t3745 = and i64 %t3744, -8
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = load i64, ptr %t3746
  %t3748 = inttoptr i64 %t3747 to ptr
  %t3749 = call fastcc i64%t3748(i64 %t3744, i64 4, i64 %a0, i64 %a1, i64 %t3743, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3750 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3750)
  %t3751 = and i64 %t3750, -8
  %t3752 = inttoptr i64 %t3751 to ptr
  %t3753 = load i64, ptr %t3752
  %t3754 = inttoptr i64 %t3753 to ptr
  %t3755 = call fastcc i64%t3754(i64 %t3750, i64 4, i64 %a0, i64 %a1, i64 %t3749, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3756 = call i64 @rt_cdr(i64 %t3755)
  %t3757 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3757)
  %t3758 = and i64 %t3757, -8
  %t3759 = inttoptr i64 %t3758 to ptr
  %t3760 = load i64, ptr %t3759
  %t3761 = inttoptr i64 %t3760 to ptr
  %t3762 = call fastcc i64%t3761(i64 %t3757, i64 1, i64 %t3756, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3763 = icmp ne i64 %t3762, 1
  br i1 %t3763, label %then1356, label %else1357
then1356:
  ret i64 %t3755
else1357:
  %t3764 = call i64 @rt_car(i64 %t3755)
  %t3765 = call i64 @rt_cdr(i64 %t3735)
  %t3766 = load i64, ptr @"emit.internal:rd-placeholder?"
  call void @rt_check_callable(i64 %t3766)
  %t3767 = and i64 %t3766, -8
  %t3768 = inttoptr i64 %t3767 to ptr
  %t3769 = load i64, ptr %t3768
  %t3770 = inttoptr i64 %t3769 to ptr
  %t3771 = call fastcc i64%t3770(i64 %t3766, i64 2, i64 %a3, i64 %t3764, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3772 = icmp ne i64 %t3771, 1
  br i1 %t3772, label %then1358, label %else1359
then1358:
  %t3773 = load i64, ptr @"emit.internal:rd-placeholder-entry"
  call void @rt_check_callable(i64 %t3773)
  %t3774 = and i64 %t3773, -8
  %t3775 = inttoptr i64 %t3774 to ptr
  %t3776 = load i64, ptr %t3775
  %t3777 = inttoptr i64 %t3776 to ptr
  %t3778 = call fastcc i64%t3777(i64 %t3773, i64 1, i64 %t3764, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3779 = call i64 @rt_eq_p(i64 %t3778, i64 %t3735)
  br label %merge1360
else1359:
  br label %merge1360
merge1360:
  %t3780 = phi i64 [ %t3779, %then1358 ], [ 1, %else1359 ]
  %t3781 = icmp ne i64 %t3780, 1
  br i1 %t3781, label %then1361, label %else1362
then1361:
  %t3782 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3783 = or i64 %a2, 8
  %t3784 = and i64 %t3783, 7
  %t3785 = icmp eq i64 %t3784, 0
  br i1 %t3785, label %fixfast1363, label %fixslow1364
fixfast1363:
  %t3786 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3787 = extractvalue {i64, i1} %t3786, 0
  %t3788 = extractvalue {i64, i1} %t3786, 1
  br i1 %t3788, label %fixslow1364, label %fixmerge1365
fixslow1364:
  %t3789 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1365
fixmerge1365:
  %t3790 = phi i64 [ %t3787, %fixfast1363 ], [ %t3789, %fixslow1364 ]
  %t3791 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3791)
  %t3792 = and i64 %t3791, -8
  %t3793 = inttoptr i64 %t3792 to ptr
  %t3794 = load i64, ptr %t3793
  %t3795 = inttoptr i64 %t3794 to ptr
  %t3796 = musttail call fastcc i64 %t3795(i64 %t3791, i64 2, i64 %t3782, i64 %t3790, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3796
else1362:
  %t3797 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3798 = call i64 @rt_vector_set(i64 %t3765, i64 0, i64 %t3797)
  %t3799 = call i64 @rt_vector_set(i64 %t3765, i64 8, i64 %t3764)
  ret i64 %t3755
else1347:
  %t3800 = or i64 %t3699, 280
  %t3801 = and i64 %t3800, 7
  %t3802 = icmp eq i64 %t3801, 0
  br i1 %t3802, label %fixfast1366, label %fixslow1367
fixfast1366:
  %t3803 = icmp eq i64 %t3699, 280
  %t3804 = select i1 %t3803, i64 257, i64 1
  br label %fixmerge1368
fixslow1367:
  %t3805 = call i64 @rt_num_eq(i64 %t3699, i64 280)
  br label %fixmerge1368
fixmerge1368:
  %t3806 = phi i64 [ %t3804, %fixfast1366 ], [ %t3805, %fixslow1367 ]
  %t3807 = icmp ne i64 %t3806, 1
  br i1 %t3807, label %then1369, label %else1370
then1369:
  %t3808 = or i64 %t3659, 8
  %t3809 = and i64 %t3808, 7
  %t3810 = icmp eq i64 %t3809, 0
  br i1 %t3810, label %fixfast1371, label %fixslow1372
fixfast1371:
  %t3811 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3659, i64 8)
  %t3812 = extractvalue {i64, i1} %t3811, 0
  %t3813 = extractvalue {i64, i1} %t3811, 1
  br i1 %t3813, label %fixslow1372, label %fixmerge1373
fixslow1372:
  %t3814 = call i64 @rt_add(i64 %t3659, i64 8)
  br label %fixmerge1373
fixmerge1373:
  %t3815 = phi i64 [ %t3812, %fixfast1371 ], [ %t3814, %fixslow1372 ]
  %t3816 = or i64 %t3815, %a1
  %t3817 = and i64 %t3816, 7
  %t3818 = icmp eq i64 %t3817, 0
  br i1 %t3818, label %fixfast1374, label %fixslow1375
fixfast1374:
  %t3819 = icmp slt i64 %t3815, %a1
  %t3820 = select i1 %t3819, i64 257, i64 1
  br label %fixmerge1376
fixslow1375:
  %t3821 = call i64 @rt_lt(i64 %t3815, i64 %a1)
  br label %fixmerge1376
fixmerge1376:
  %t3822 = phi i64 [ %t3820, %fixfast1374 ], [ %t3821, %fixslow1375 ]
  %t3823 = icmp ne i64 %t3822, 1
  br i1 %t3823, label %then1377, label %else1378
then1377:
  %t3824 = or i64 %t3659, 8
  %t3825 = and i64 %t3824, 7
  %t3826 = icmp eq i64 %t3825, 0
  br i1 %t3826, label %fixfast1380, label %fixslow1381
fixfast1380:
  %t3827 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3659, i64 8)
  %t3828 = extractvalue {i64, i1} %t3827, 0
  %t3829 = extractvalue {i64, i1} %t3827, 1
  br i1 %t3829, label %fixslow1381, label %fixmerge1382
fixslow1381:
  %t3830 = call i64 @rt_add(i64 %t3659, i64 8)
  br label %fixmerge1382
fixmerge1382:
  %t3831 = phi i64 [ %t3828, %fixfast1380 ], [ %t3830, %fixslow1381 ]
  %t3832 = call i64 @rt_string_ref(i64 %a0, i64 %t3831)
  %t3833 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t3833)
  %t3834 = and i64 %t3833, -8
  %t3835 = inttoptr i64 %t3834 to ptr
  %t3836 = load i64, ptr %t3835
  %t3837 = inttoptr i64 %t3836 to ptr
  %t3838 = call fastcc i64%t3837(i64 %t3833, i64 1, i64 %t3832, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3839 = call i64 @rt_not(i64 %t3838)
  br label %merge1379
else1378:
  br label %merge1379
merge1379:
  %t3840 = phi i64 [ %t3839, %fixmerge1382 ], [ 1, %else1378 ]
  %t3841 = icmp ne i64 %t3840, 1
  br i1 %t3841, label %then1383, label %else1384
then1383:
  %t3842 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3843 = or i64 %a2, 8
  %t3844 = and i64 %t3843, 7
  %t3845 = icmp eq i64 %t3844, 0
  br i1 %t3845, label %fixfast1385, label %fixslow1386
fixfast1385:
  %t3846 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3847 = extractvalue {i64, i1} %t3846, 0
  %t3848 = extractvalue {i64, i1} %t3846, 1
  br i1 %t3848, label %fixslow1386, label %fixmerge1387
fixslow1386:
  %t3849 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1387
fixmerge1387:
  %t3850 = phi i64 [ %t3847, %fixfast1385 ], [ %t3849, %fixslow1386 ]
  %t3851 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3851)
  %t3852 = and i64 %t3851, -8
  %t3853 = inttoptr i64 %t3852 to ptr
  %t3854 = load i64, ptr %t3853
  %t3855 = inttoptr i64 %t3854 to ptr
  %t3856 = musttail call fastcc i64 %t3855(i64 %t3851, i64 2, i64 %t3842, i64 %t3850, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3856
else1384:
  %t3857 = icmp ne i64 %t3705, 1
  br i1 %t3857, label %then1388, label %else1389
then1388:
  %t3858 = call i64 @rt_cdr(i64 %t3705)
  %t3859 = call i64 @rt_vector_ref(i64 %t3858, i64 0)
  %t3860 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3861 = call i64 @rt_eq_p(i64 %t3859, i64 %t3860)
  %t3862 = icmp ne i64 %t3861, 1
  br i1 %t3862, label %then1390, label %else1391
then1390:
  %t3863 = load i64, ptr @"emit.internal:rd-placeholder"
  call void @rt_check_callable(i64 %t3863)
  %t3864 = and i64 %t3863, -8
  %t3865 = inttoptr i64 %t3864 to ptr
  %t3866 = load i64, ptr %t3865
  %t3867 = inttoptr i64 %t3866 to ptr
  %t3868 = call fastcc i64%t3867(i64 %t3863, i64 2, i64 %a3, i64 %t3705, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3869 = or i64 %t3659, 8
  %t3870 = and i64 %t3869, 7
  %t3871 = icmp eq i64 %t3870, 0
  br i1 %t3871, label %fixfast1392, label %fixslow1393
fixfast1392:
  %t3872 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3659, i64 8)
  %t3873 = extractvalue {i64, i1} %t3872, 0
  %t3874 = extractvalue {i64, i1} %t3872, 1
  br i1 %t3874, label %fixslow1393, label %fixmerge1394
fixslow1393:
  %t3875 = call i64 @rt_add(i64 %t3659, i64 8)
  br label %fixmerge1394
fixmerge1394:
  %t3876 = phi i64 [ %t3873, %fixfast1392 ], [ %t3875, %fixslow1393 ]
  %t3877 = call i64 @rt_cons(i64 %t3868, i64 %t3876)
  ret i64 %t3877
else1391:
  %t3878 = call i64 @rt_vector_ref(i64 %t3858, i64 8)
  %t3879 = or i64 %t3659, 8
  %t3880 = and i64 %t3879, 7
  %t3881 = icmp eq i64 %t3880, 0
  br i1 %t3881, label %fixfast1395, label %fixslow1396
fixfast1395:
  %t3882 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3659, i64 8)
  %t3883 = extractvalue {i64, i1} %t3882, 0
  %t3884 = extractvalue {i64, i1} %t3882, 1
  br i1 %t3884, label %fixslow1396, label %fixmerge1397
fixslow1396:
  %t3885 = call i64 @rt_add(i64 %t3659, i64 8)
  br label %fixmerge1397
fixmerge1397:
  %t3886 = phi i64 [ %t3883, %fixfast1395 ], [ %t3885, %fixslow1396 ]
  %t3887 = call i64 @rt_cons(i64 %t3878, i64 %t3886)
  ret i64 %t3887
else1389:
  %t3888 = call i64 @rt_intern(ptr @.str.sym.19)
  %t3889 = or i64 %a2, 8
  %t3890 = and i64 %t3889, 7
  %t3891 = icmp eq i64 %t3890, 0
  br i1 %t3891, label %fixfast1398, label %fixslow1399
fixfast1398:
  %t3892 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3893 = extractvalue {i64, i1} %t3892, 0
  %t3894 = extractvalue {i64, i1} %t3892, 1
  br i1 %t3894, label %fixslow1399, label %fixmerge1400
fixslow1399:
  %t3895 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1400
fixmerge1400:
  %t3896 = phi i64 [ %t3893, %fixfast1398 ], [ %t3895, %fixslow1399 ]
  %t3897 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3897)
  %t3898 = and i64 %t3897, -8
  %t3899 = inttoptr i64 %t3898 to ptr
  %t3900 = load i64, ptr %t3899
  %t3901 = inttoptr i64 %t3900 to ptr
  %t3902 = musttail call fastcc i64 %t3901(i64 %t3897, i64 2, i64 %t3888, i64 %t3896, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3902
else1370:
  %t3903 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3904 = or i64 %a2, 8
  %t3905 = and i64 %t3904, 7
  %t3906 = icmp eq i64 %t3905, 0
  br i1 %t3906, label %fixfast1401, label %fixslow1402
fixfast1401:
  %t3907 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3908 = extractvalue {i64, i1} %t3907, 0
  %t3909 = extractvalue {i64, i1} %t3907, 1
  br i1 %t3909, label %fixslow1402, label %fixmerge1403
fixslow1402:
  %t3910 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1403
fixmerge1403:
  %t3911 = phi i64 [ %t3908, %fixfast1401 ], [ %t3910, %fixslow1402 ]
  %t3912 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3912)
  %t3913 = and i64 %t3912, -8
  %t3914 = inttoptr i64 %t3913 to ptr
  %t3915 = load i64, ptr %t3914
  %t3916 = inttoptr i64 %t3915 to ptr
  %t3917 = musttail call fastcc i64 %t3916(i64 %t3912, i64 2, i64 %t3903, i64 %t3911, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3917
}

define fastcc i64 @"emit.internal:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3922 = icmp eq i64 %argc, 4
  br i1 %t3922, label %argok1405, label %arityerr1404
arityerr1404:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1405:
  %t3923 = or i64 %a1, %a2
  %t3924 = and i64 %t3923, 7
  %t3925 = icmp eq i64 %t3924, 0
  br i1 %t3925, label %fixfast1406, label %fixslow1407
fixfast1406:
  %t3926 = icmp slt i64 %a1, %a2
  %t3927 = select i1 %t3926, i64 257, i64 1
  br label %fixmerge1408
fixslow1407:
  %t3928 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1408
fixmerge1408:
  %t3929 = phi i64 [ %t3927, %fixfast1406 ], [ %t3928, %fixslow1407 ]
  %t3930 = icmp ne i64 %t3929, 1
  br i1 %t3930, label %then1409, label %else1410
then1409:
  br label %merge1411
else1410:
  %t3931 = or i64 %a1, %a2
  %t3932 = and i64 %t3931, 7
  %t3933 = icmp eq i64 %t3932, 0
  br i1 %t3933, label %fixfast1412, label %fixslow1413
fixfast1412:
  %t3934 = icmp eq i64 %a1, %a2
  %t3935 = select i1 %t3934, i64 257, i64 1
  br label %fixmerge1414
fixslow1413:
  %t3936 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge1414
fixmerge1414:
  %t3937 = phi i64 [ %t3935, %fixfast1412 ], [ %t3936, %fixslow1413 ]
  br label %merge1411
merge1411:
  %t3938 = phi i64 [ 257, %then1409 ], [ %t3937, %fixmerge1414 ]
  %t3939 = icmp ne i64 %t3938, 1
  br i1 %t3939, label %then1415, label %else1416
then1415:
  %t3940 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3941 = or i64 %a2, 8
  %t3942 = and i64 %t3941, 7
  %t3943 = icmp eq i64 %t3942, 0
  br i1 %t3943, label %fixfast1417, label %fixslow1418
fixfast1417:
  %t3944 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3945 = extractvalue {i64, i1} %t3944, 0
  %t3946 = extractvalue {i64, i1} %t3944, 1
  br i1 %t3946, label %fixslow1418, label %fixmerge1419
fixslow1418:
  %t3947 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1419
fixmerge1419:
  %t3948 = phi i64 [ %t3945, %fixfast1417 ], [ %t3947, %fixslow1418 ]
  %t3949 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3949)
  %t3950 = and i64 %t3949, -8
  %t3951 = inttoptr i64 %t3950 to ptr
  %t3952 = load i64, ptr %t3951
  %t3953 = inttoptr i64 %t3952 to ptr
  %t3954 = musttail call fastcc i64 %t3953(i64 %t3949, i64 2, i64 %t3940, i64 %t3948, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3954
else1416:
  %t3955 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3956 = call i64 @rt_char_to_integer(i64 %t3955)
  %t3957 = or i64 %t3956, 928
  %t3958 = and i64 %t3957, 7
  %t3959 = icmp eq i64 %t3958, 0
  br i1 %t3959, label %fixfast1420, label %fixslow1421
fixfast1420:
  %t3960 = icmp eq i64 %t3956, 928
  %t3961 = select i1 %t3960, i64 257, i64 1
  br label %fixmerge1422
fixslow1421:
  %t3962 = call i64 @rt_num_eq(i64 %t3956, i64 928)
  br label %fixmerge1422
fixmerge1422:
  %t3963 = phi i64 [ %t3961, %fixfast1420 ], [ %t3962, %fixslow1421 ]
  %t3964 = icmp ne i64 %t3963, 1
  br i1 %t3964, label %then1423, label %else1424
then1423:
  br label %merge1425
else1424:
  %t3965 = or i64 %t3956, 816
  %t3966 = and i64 %t3965, 7
  %t3967 = icmp eq i64 %t3966, 0
  br i1 %t3967, label %fixfast1426, label %fixslow1427
fixfast1426:
  %t3968 = icmp eq i64 %t3956, 816
  %t3969 = select i1 %t3968, i64 257, i64 1
  br label %fixmerge1428
fixslow1427:
  %t3970 = call i64 @rt_num_eq(i64 %t3956, i64 816)
  br label %fixmerge1428
fixmerge1428:
  %t3971 = phi i64 [ %t3969, %fixfast1426 ], [ %t3970, %fixslow1427 ]
  br label %merge1425
merge1425:
  %t3972 = phi i64 [ 257, %then1423 ], [ %t3971, %fixmerge1428 ]
  %t3973 = icmp ne i64 %t3972, 1
  br i1 %t3973, label %then1429, label %else1430
then1429:
  %t3974 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t3974)
  %t3975 = and i64 %t3974, -8
  %t3976 = inttoptr i64 %t3975 to ptr
  %t3977 = load i64, ptr %t3976
  %t3978 = inttoptr i64 %t3977 to ptr
  %t3979 = call fastcc i64%t3978(i64 %t3974, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3980 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3979)
  %t3981 = call i64 @rt_make_string(ptr @.str.lit.21, i64 1)
  %t3982 = call i64 @rt_string_eq(i64 %t3980, i64 %t3981)
  %t3983 = icmp ne i64 %t3982, 1
  br i1 %t3983, label %then1431, label %else1432
then1431:
  %t3984 = or i64 %a2, 8
  %t3985 = and i64 %t3984, 7
  %t3986 = icmp eq i64 %t3985, 0
  br i1 %t3986, label %fixfast1433, label %fixslow1434
fixfast1433:
  %t3987 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3988 = extractvalue {i64, i1} %t3987, 0
  %t3989 = extractvalue {i64, i1} %t3987, 1
  br i1 %t3989, label %fixslow1434, label %fixmerge1435
fixslow1434:
  %t3990 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1435
fixmerge1435:
  %t3991 = phi i64 [ %t3988, %fixfast1433 ], [ %t3990, %fixslow1434 ]
  %t3992 = call i64 @rt_cons(i64 257, i64 %t3991)
  ret i64 %t3992
else1432:
  %t3993 = call i64 @rt_make_string(ptr @.str.lit.22, i64 4)
  %t3994 = call i64 @rt_string_eq(i64 %t3980, i64 %t3993)
  %t3995 = icmp ne i64 %t3994, 1
  br i1 %t3995, label %then1436, label %else1437
then1436:
  %t3996 = or i64 %a2, 32
  %t3997 = and i64 %t3996, 7
  %t3998 = icmp eq i64 %t3997, 0
  br i1 %t3998, label %fixfast1438, label %fixslow1439
fixfast1438:
  %t3999 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 32)
  %t4000 = extractvalue {i64, i1} %t3999, 0
  %t4001 = extractvalue {i64, i1} %t3999, 1
  br i1 %t4001, label %fixslow1439, label %fixmerge1440
fixslow1439:
  %t4002 = call i64 @rt_add(i64 %a2, i64 32)
  br label %fixmerge1440
fixmerge1440:
  %t4003 = phi i64 [ %t4000, %fixfast1438 ], [ %t4002, %fixslow1439 ]
  %t4004 = call i64 @rt_cons(i64 257, i64 %t4003)
  ret i64 %t4004
else1437:
  %t4005 = call i64 @rt_make_string(ptr @.str.lit.23, i64 1)
  %t4006 = call i64 @rt_string_eq(i64 %t3980, i64 %t4005)
  %t4007 = icmp ne i64 %t4006, 1
  br i1 %t4007, label %then1441, label %else1442
then1441:
  %t4008 = or i64 %a2, 8
  %t4009 = and i64 %t4008, 7
  %t4010 = icmp eq i64 %t4009, 0
  br i1 %t4010, label %fixfast1443, label %fixslow1444
fixfast1443:
  %t4011 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4012 = extractvalue {i64, i1} %t4011, 0
  %t4013 = extractvalue {i64, i1} %t4011, 1
  br i1 %t4013, label %fixslow1444, label %fixmerge1445
fixslow1444:
  %t4014 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1445
fixmerge1445:
  %t4015 = phi i64 [ %t4012, %fixfast1443 ], [ %t4014, %fixslow1444 ]
  %t4016 = call i64 @rt_cons(i64 1, i64 %t4015)
  ret i64 %t4016
else1442:
  %t4017 = call i64 @rt_make_string(ptr @.str.lit.24, i64 5)
  %t4018 = call i64 @rt_string_eq(i64 %t3980, i64 %t4017)
  %t4019 = icmp ne i64 %t4018, 1
  br i1 %t4019, label %then1446, label %else1447
then1446:
  %t4020 = or i64 %a2, 40
  %t4021 = and i64 %t4020, 7
  %t4022 = icmp eq i64 %t4021, 0
  br i1 %t4022, label %fixfast1448, label %fixslow1449
fixfast1448:
  %t4023 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 40)
  %t4024 = extractvalue {i64, i1} %t4023, 0
  %t4025 = extractvalue {i64, i1} %t4023, 1
  br i1 %t4025, label %fixslow1449, label %fixmerge1450
fixslow1449:
  %t4026 = call i64 @rt_add(i64 %a2, i64 40)
  br label %fixmerge1450
fixmerge1450:
  %t4027 = phi i64 [ %t4024, %fixfast1448 ], [ %t4026, %fixslow1449 ]
  %t4028 = call i64 @rt_cons(i64 1, i64 %t4027)
  ret i64 %t4028
else1447:
  %t4029 = call i64 @rt_intern(ptr @.str.sym.25)
  %t4030 = or i64 %a2, 8
  %t4031 = and i64 %t4030, 7
  %t4032 = icmp eq i64 %t4031, 0
  br i1 %t4032, label %fixfast1451, label %fixslow1452
fixfast1451:
  %t4033 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4034 = extractvalue {i64, i1} %t4033, 0
  %t4035 = extractvalue {i64, i1} %t4033, 1
  br i1 %t4035, label %fixslow1452, label %fixmerge1453
fixslow1452:
  %t4036 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1453
fixmerge1453:
  %t4037 = phi i64 [ %t4034, %fixfast1451 ], [ %t4036, %fixslow1452 ]
  %t4038 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4038)
  %t4039 = and i64 %t4038, -8
  %t4040 = inttoptr i64 %t4039 to ptr
  %t4041 = load i64, ptr %t4040
  %t4042 = inttoptr i64 %t4041 to ptr
  %t4043 = musttail call fastcc i64 %t4042(i64 %t4038, i64 2, i64 %t4029, i64 %t4037, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4043
else1430:
  %t4044 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4045 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t4045)
  %t4046 = and i64 %t4045, -8
  %t4047 = inttoptr i64 %t4046 to ptr
  %t4048 = load i64, ptr %t4047
  %t4049 = inttoptr i64 %t4048 to ptr
  %t4050 = call fastcc i64%t4049(i64 %t4045, i64 1, i64 %t4044, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4051 = icmp ne i64 %t4050, 1
  br i1 %t4051, label %then1454, label %else1455
then1454:
  %t4052 = load i64, ptr @"emit.internal:rd-label"
  call void @rt_check_callable(i64 %t4052)
  %t4053 = and i64 %t4052, -8
  %t4054 = inttoptr i64 %t4053 to ptr
  %t4055 = load i64, ptr %t4054
  %t4056 = inttoptr i64 %t4055 to ptr
  %t4057 = musttail call fastcc i64 %t4056(i64 %t4052, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4057
else1455:
  %t4058 = or i64 %t3956, 736
  %t4059 = and i64 %t4058, 7
  %t4060 = icmp eq i64 %t4059, 0
  br i1 %t4060, label %fixfast1456, label %fixslow1457
fixfast1456:
  %t4061 = icmp eq i64 %t3956, 736
  %t4062 = select i1 %t4061, i64 257, i64 1
  br label %fixmerge1458
fixslow1457:
  %t4063 = call i64 @rt_num_eq(i64 %t3956, i64 736)
  br label %fixmerge1458
fixmerge1458:
  %t4064 = phi i64 [ %t4062, %fixfast1456 ], [ %t4063, %fixslow1457 ]
  %t4065 = icmp ne i64 %t4064, 1
  br i1 %t4065, label %then1459, label %else1460
then1459:
  %t4066 = load i64, ptr @"emit.internal:rd-char"
  call void @rt_check_callable(i64 %t4066)
  %t4067 = and i64 %t4066, -8
  %t4068 = inttoptr i64 %t4067 to ptr
  %t4069 = load i64, ptr %t4068
  %t4070 = inttoptr i64 %t4069 to ptr
  %t4071 = musttail call fastcc i64 %t4070(i64 %t4066, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4071
else1460:
  %t4072 = or i64 %t3956, 320
  %t4073 = and i64 %t4072, 7
  %t4074 = icmp eq i64 %t4073, 0
  br i1 %t4074, label %fixfast1461, label %fixslow1462
fixfast1461:
  %t4075 = icmp eq i64 %t3956, 320
  %t4076 = select i1 %t4075, i64 257, i64 1
  br label %fixmerge1463
fixslow1462:
  %t4077 = call i64 @rt_num_eq(i64 %t3956, i64 320)
  br label %fixmerge1463
fixmerge1463:
  %t4078 = phi i64 [ %t4076, %fixfast1461 ], [ %t4077, %fixslow1462 ]
  %t4079 = icmp ne i64 %t4078, 1
  br i1 %t4079, label %then1464, label %else1465
then1464:
  %t4080 = or i64 %a2, 8
  %t4081 = and i64 %t4080, 7
  %t4082 = icmp eq i64 %t4081, 0
  br i1 %t4082, label %fixfast1466, label %fixslow1467
fixfast1466:
  %t4083 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4084 = extractvalue {i64, i1} %t4083, 0
  %t4085 = extractvalue {i64, i1} %t4083, 1
  br i1 %t4085, label %fixslow1467, label %fixmerge1468
fixslow1467:
  %t4086 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1468
fixmerge1468:
  %t4087 = phi i64 [ %t4084, %fixfast1466 ], [ %t4086, %fixslow1467 ]
  %t4088 = or i64 %a2, 8
  %t4089 = and i64 %t4088, 7
  %t4090 = icmp eq i64 %t4089, 0
  br i1 %t4090, label %fixfast1469, label %fixslow1470
fixfast1469:
  %t4091 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4092 = extractvalue {i64, i1} %t4091, 0
  %t4093 = extractvalue {i64, i1} %t4091, 1
  br i1 %t4093, label %fixslow1470, label %fixmerge1471
fixslow1470:
  %t4094 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1471
fixmerge1471:
  %t4095 = phi i64 [ %t4092, %fixfast1469 ], [ %t4094, %fixslow1470 ]
  %t4096 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4096)
  %t4097 = and i64 %t4096, -8
  %t4098 = inttoptr i64 %t4097 to ptr
  %t4099 = load i64, ptr %t4098
  %t4100 = inttoptr i64 %t4099 to ptr
  %t4101 = call fastcc i64%t4100(i64 %t4096, i64 6, i64 %a0, i64 %a1, i64 %t4087, i64 2, i64 %a3, i64 %t4095, i64 0, i64 0, ptr null)
  %t4102 = call i64 @rt_cdr(i64 %t4101)
  %t4103 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4103)
  %t4104 = and i64 %t4103, -8
  %t4105 = inttoptr i64 %t4104 to ptr
  %t4106 = load i64, ptr %t4105
  %t4107 = inttoptr i64 %t4106 to ptr
  %t4108 = call fastcc i64%t4107(i64 %t4103, i64 1, i64 %t4102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4109 = icmp ne i64 %t4108, 1
  br i1 %t4109, label %then1472, label %else1473
then1472:
  ret i64 %t4101
else1473:
  %t4110 = call i64 @rt_car(i64 %t4101)
  %t4111 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t4111)
  %t4112 = and i64 %t4111, -8
  %t4113 = inttoptr i64 %t4112 to ptr
  %t4114 = load i64, ptr %t4113
  %t4115 = inttoptr i64 %t4114 to ptr
  %t4116 = call fastcc i64%t4115(i64 %t4111, i64 1, i64 %t4110, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4117 = call i64 @rt_cdr(i64 %t4101)
  %t4118 = call i64 @rt_cons(i64 %t4116, i64 %t4117)
  ret i64 %t4118
else1465:
  %t4119 = or i64 %t3956, 472
  %t4120 = and i64 %t4119, 7
  %t4121 = icmp eq i64 %t4120, 0
  br i1 %t4121, label %fixfast1474, label %fixslow1475
fixfast1474:
  %t4122 = icmp eq i64 %t3956, 472
  %t4123 = select i1 %t4122, i64 257, i64 1
  br label %fixmerge1476
fixslow1475:
  %t4124 = call i64 @rt_num_eq(i64 %t3956, i64 472)
  br label %fixmerge1476
fixmerge1476:
  %t4125 = phi i64 [ %t4123, %fixfast1474 ], [ %t4124, %fixslow1475 ]
  %t4126 = icmp ne i64 %t4125, 1
  br i1 %t4126, label %then1477, label %else1478
then1477:
  %t4127 = load i64, ptr @"emit.internal:rd-state-child"
  call void @rt_check_callable(i64 %t4127)
  %t4128 = and i64 %t4127, -8
  %t4129 = inttoptr i64 %t4128 to ptr
  %t4130 = load i64, ptr %t4129
  %t4131 = inttoptr i64 %t4130 to ptr
  %t4132 = call fastcc i64%t4131(i64 %t4127, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4133 = or i64 %a2, 8
  %t4134 = and i64 %t4133, 7
  %t4135 = icmp eq i64 %t4134, 0
  br i1 %t4135, label %fixfast1479, label %fixslow1480
fixfast1479:
  %t4136 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4137 = extractvalue {i64, i1} %t4136, 0
  %t4138 = extractvalue {i64, i1} %t4136, 1
  br i1 %t4138, label %fixslow1480, label %fixmerge1481
fixslow1480:
  %t4139 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1481
fixmerge1481:
  %t4140 = phi i64 [ %t4137, %fixfast1479 ], [ %t4139, %fixslow1480 ]
  %t4141 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4141)
  %t4142 = and i64 %t4141, -8
  %t4143 = inttoptr i64 %t4142 to ptr
  %t4144 = load i64, ptr %t4143
  %t4145 = inttoptr i64 %t4144 to ptr
  %t4146 = call fastcc i64%t4145(i64 %t4141, i64 4, i64 %a0, i64 %a1, i64 %t4140, i64 %t4132, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4147 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4147)
  %t4148 = and i64 %t4147, -8
  %t4149 = inttoptr i64 %t4148 to ptr
  %t4150 = load i64, ptr %t4149
  %t4151 = inttoptr i64 %t4150 to ptr
  %t4152 = call fastcc i64%t4151(i64 %t4147, i64 4, i64 %a0, i64 %a1, i64 %t4146, i64 %t4132, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4153 = load i64, ptr @"emit.internal:rd-finish"
  call void @rt_check_callable(i64 %t4153)
  %t4154 = and i64 %t4153, -8
  %t4155 = inttoptr i64 %t4154 to ptr
  %t4156 = load i64, ptr %t4155
  %t4157 = inttoptr i64 %t4156 to ptr
  %t4158 = call fastcc i64%t4157(i64 %t4153, i64 2, i64 %t4132, i64 %t4152, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4159 = call i64 @rt_cdr(i64 %t4158)
  %t4160 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4160)
  %t4161 = and i64 %t4160, -8
  %t4162 = inttoptr i64 %t4161 to ptr
  %t4163 = load i64, ptr %t4162
  %t4164 = inttoptr i64 %t4163 to ptr
  %t4165 = call fastcc i64%t4164(i64 %t4160, i64 1, i64 %t4159, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4166 = icmp ne i64 %t4165, 1
  br i1 %t4166, label %then1482, label %else1483
then1482:
  ret i64 %t4158
else1483:
  %t4167 = call i64 @rt_cdr(i64 %t4158)
  %t4168 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4168)
  %t4169 = and i64 %t4168, -8
  %t4170 = inttoptr i64 %t4169 to ptr
  %t4171 = load i64, ptr %t4170
  %t4172 = inttoptr i64 %t4171 to ptr
  %t4173 = call fastcc i64%t4172(i64 %t4168, i64 4, i64 %a0, i64 %a1, i64 %t4167, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4174 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4174)
  %t4175 = and i64 %t4174, -8
  %t4176 = inttoptr i64 %t4175 to ptr
  %t4177 = load i64, ptr %t4176
  %t4178 = inttoptr i64 %t4177 to ptr
  %t4179 = musttail call fastcc i64 %t4178(i64 %t4174, i64 4, i64 %a0, i64 %a1, i64 %t4173, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4179
else1478:
  %t4180 = or i64 %t3956, 936
  %t4181 = and i64 %t4180, 7
  %t4182 = icmp eq i64 %t4181, 0
  br i1 %t4182, label %fixfast1484, label %fixslow1485
fixfast1484:
  %t4183 = icmp eq i64 %t3956, 936
  %t4184 = select i1 %t4183, i64 257, i64 1
  br label %fixmerge1486
fixslow1485:
  %t4185 = call i64 @rt_num_eq(i64 %t3956, i64 936)
  br label %fixmerge1486
fixmerge1486:
  %t4186 = phi i64 [ %t4184, %fixfast1484 ], [ %t4185, %fixslow1485 ]
  %t4187 = icmp ne i64 %t4186, 1
  br i1 %t4187, label %then1487, label %else1488
then1487:
  %t4188 = or i64 %a2, 16
  %t4189 = and i64 %t4188, 7
  %t4190 = icmp eq i64 %t4189, 0
  br i1 %t4190, label %fixfast1490, label %fixslow1491
fixfast1490:
  %t4191 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4192 = extractvalue {i64, i1} %t4191, 0
  %t4193 = extractvalue {i64, i1} %t4191, 1
  br i1 %t4193, label %fixslow1491, label %fixmerge1492
fixslow1491:
  %t4194 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1492
fixmerge1492:
  %t4195 = phi i64 [ %t4192, %fixfast1490 ], [ %t4194, %fixslow1491 ]
  %t4196 = or i64 %t4195, %a1
  %t4197 = and i64 %t4196, 7
  %t4198 = icmp eq i64 %t4197, 0
  br i1 %t4198, label %fixfast1493, label %fixslow1494
fixfast1493:
  %t4199 = icmp slt i64 %t4195, %a1
  %t4200 = select i1 %t4199, i64 257, i64 1
  br label %fixmerge1495
fixslow1494:
  %t4201 = call i64 @rt_lt(i64 %t4195, i64 %a1)
  br label %fixmerge1495
fixmerge1495:
  %t4202 = phi i64 [ %t4200, %fixfast1493 ], [ %t4201, %fixslow1494 ]
  %t4203 = icmp ne i64 %t4202, 1
  br i1 %t4203, label %then1496, label %else1497
then1496:
  %t4204 = or i64 %a2, 8
  %t4205 = and i64 %t4204, 7
  %t4206 = icmp eq i64 %t4205, 0
  br i1 %t4206, label %fixfast1499, label %fixslow1500
fixfast1499:
  %t4207 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4208 = extractvalue {i64, i1} %t4207, 0
  %t4209 = extractvalue {i64, i1} %t4207, 1
  br i1 %t4209, label %fixslow1500, label %fixmerge1501
fixslow1500:
  %t4210 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1501
fixmerge1501:
  %t4211 = phi i64 [ %t4208, %fixfast1499 ], [ %t4210, %fixslow1500 ]
  %t4212 = call i64 @rt_string_ref(i64 %a0, i64 %t4211)
  %t4213 = call i64 @rt_char_to_integer(i64 %t4212)
  %t4214 = or i64 %t4213, 448
  %t4215 = and i64 %t4214, 7
  %t4216 = icmp eq i64 %t4215, 0
  br i1 %t4216, label %fixfast1502, label %fixslow1503
fixfast1502:
  %t4217 = icmp eq i64 %t4213, 448
  %t4218 = select i1 %t4217, i64 257, i64 1
  br label %fixmerge1504
fixslow1503:
  %t4219 = call i64 @rt_num_eq(i64 %t4213, i64 448)
  br label %fixmerge1504
fixmerge1504:
  %t4220 = phi i64 [ %t4218, %fixfast1502 ], [ %t4219, %fixslow1503 ]
  %t4221 = icmp ne i64 %t4220, 1
  br i1 %t4221, label %then1505, label %else1506
then1505:
  %t4222 = or i64 %a2, 16
  %t4223 = and i64 %t4222, 7
  %t4224 = icmp eq i64 %t4223, 0
  br i1 %t4224, label %fixfast1508, label %fixslow1509
fixfast1508:
  %t4225 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4226 = extractvalue {i64, i1} %t4225, 0
  %t4227 = extractvalue {i64, i1} %t4225, 1
  br i1 %t4227, label %fixslow1509, label %fixmerge1510
fixslow1509:
  %t4228 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1510
fixmerge1510:
  %t4229 = phi i64 [ %t4226, %fixfast1508 ], [ %t4228, %fixslow1509 ]
  %t4230 = call i64 @rt_string_ref(i64 %a0, i64 %t4229)
  %t4231 = call i64 @rt_char_to_integer(i64 %t4230)
  %t4232 = or i64 %t4231, 320
  %t4233 = and i64 %t4232, 7
  %t4234 = icmp eq i64 %t4233, 0
  br i1 %t4234, label %fixfast1511, label %fixslow1512
fixfast1511:
  %t4235 = icmp eq i64 %t4231, 320
  %t4236 = select i1 %t4235, i64 257, i64 1
  br label %fixmerge1513
fixslow1512:
  %t4237 = call i64 @rt_num_eq(i64 %t4231, i64 320)
  br label %fixmerge1513
fixmerge1513:
  %t4238 = phi i64 [ %t4236, %fixfast1511 ], [ %t4237, %fixslow1512 ]
  br label %merge1507
else1506:
  br label %merge1507
merge1507:
  %t4239 = phi i64 [ %t4238, %fixmerge1513 ], [ 1, %else1506 ]
  br label %merge1498
else1497:
  br label %merge1498
merge1498:
  %t4240 = phi i64 [ %t4239, %merge1507 ], [ 1, %else1497 ]
  br label %merge1489
else1488:
  br label %merge1489
merge1489:
  %t4241 = phi i64 [ %t4240, %merge1498 ], [ 1, %else1488 ]
  %t4242 = icmp ne i64 %t4241, 1
  br i1 %t4242, label %then1514, label %else1515
then1514:
  %t4243 = or i64 %a2, 24
  %t4244 = and i64 %t4243, 7
  %t4245 = icmp eq i64 %t4244, 0
  br i1 %t4245, label %fixfast1516, label %fixslow1517
fixfast1516:
  %t4246 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t4247 = extractvalue {i64, i1} %t4246, 0
  %t4248 = extractvalue {i64, i1} %t4246, 1
  br i1 %t4248, label %fixslow1517, label %fixmerge1518
fixslow1517:
  %t4249 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1518
fixmerge1518:
  %t4250 = phi i64 [ %t4247, %fixfast1516 ], [ %t4249, %fixslow1517 ]
  %t4251 = or i64 %a2, 8
  %t4252 = and i64 %t4251, 7
  %t4253 = icmp eq i64 %t4252, 0
  br i1 %t4253, label %fixfast1519, label %fixslow1520
fixfast1519:
  %t4254 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4255 = extractvalue {i64, i1} %t4254, 0
  %t4256 = extractvalue {i64, i1} %t4254, 1
  br i1 %t4256, label %fixslow1520, label %fixmerge1521
fixslow1520:
  %t4257 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1521
fixmerge1521:
  %t4258 = phi i64 [ %t4255, %fixfast1519 ], [ %t4257, %fixslow1520 ]
  %t4259 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4259)
  %t4260 = and i64 %t4259, -8
  %t4261 = inttoptr i64 %t4260 to ptr
  %t4262 = load i64, ptr %t4261
  %t4263 = inttoptr i64 %t4262 to ptr
  %t4264 = call fastcc i64%t4263(i64 %t4259, i64 6, i64 %a0, i64 %a1, i64 %t4250, i64 2, i64 %a3, i64 %t4258, i64 0, i64 0, ptr null)
  %t4265 = call i64 @rt_cdr(i64 %t4264)
  %t4266 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4266)
  %t4267 = and i64 %t4266, -8
  %t4268 = inttoptr i64 %t4267 to ptr
  %t4269 = load i64, ptr %t4268
  %t4270 = inttoptr i64 %t4269 to ptr
  %t4271 = call fastcc i64%t4270(i64 %t4266, i64 1, i64 %t4265, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4272 = icmp ne i64 %t4271, 1
  br i1 %t4272, label %then1522, label %else1523
then1522:
  ret i64 %t4264
else1523:
  %t4273 = call i64 @rt_car(i64 %t4264)
  %t4274 = load i64, ptr @"emit.internal:list->bytevector"
  call void @rt_check_callable(i64 %t4274)
  %t4275 = and i64 %t4274, -8
  %t4276 = inttoptr i64 %t4275 to ptr
  %t4277 = load i64, ptr %t4276
  %t4278 = inttoptr i64 %t4277 to ptr
  %t4279 = call fastcc i64%t4278(i64 %t4274, i64 1, i64 %t4273, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4280 = call i64 @rt_cdr(i64 %t4264)
  %t4281 = call i64 @rt_cons(i64 %t4279, i64 %t4280)
  ret i64 %t4281
else1515:
  %t4282 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4282)
  %t4283 = and i64 %t4282, -8
  %t4284 = inttoptr i64 %t4283 to ptr
  %t4285 = load i64, ptr %t4284
  %t4286 = inttoptr i64 %t4285 to ptr
  %t4287 = call fastcc i64%t4286(i64 %t4282, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4288 = or i64 %a2, 8
  %t4289 = and i64 %t4288, 7
  %t4290 = icmp eq i64 %t4289, 0
  br i1 %t4290, label %fixfast1524, label %fixslow1525
fixfast1524:
  %t4291 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4292 = extractvalue {i64, i1} %t4291, 0
  %t4293 = extractvalue {i64, i1} %t4291, 1
  br i1 %t4293, label %fixslow1525, label %fixmerge1526
fixslow1525:
  %t4294 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1526
fixmerge1526:
  %t4295 = phi i64 [ %t4292, %fixfast1524 ], [ %t4294, %fixslow1525 ]
  %t4296 = call i64 @rt_substring(i64 %a0, i64 %t4295, i64 %t4287)
  %t4297 = load i64, ptr @"emit.internal:rd-number"
  call void @rt_check_callable(i64 %t4297)
  %t4298 = and i64 %t4297, -8
  %t4299 = inttoptr i64 %t4298 to ptr
  %t4300 = load i64, ptr %t4299
  %t4301 = inttoptr i64 %t4300 to ptr
  %t4302 = call fastcc i64%t4301(i64 %t4297, i64 2, i64 %t4296, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4303 = load i64, ptr @"emit.internal:rd-number-reason?"
  call void @rt_check_callable(i64 %t4303)
  %t4304 = and i64 %t4303, -8
  %t4305 = inttoptr i64 %t4304 to ptr
  %t4306 = load i64, ptr %t4305
  %t4307 = inttoptr i64 %t4306 to ptr
  %t4308 = call fastcc i64%t4307(i64 %t4303, i64 1, i64 %t4302, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4309 = icmp ne i64 %t4308, 1
  br i1 %t4309, label %then1527, label %else1528
then1527:
  %t4310 = or i64 %a2, 8
  %t4311 = and i64 %t4310, 7
  %t4312 = icmp eq i64 %t4311, 0
  br i1 %t4312, label %fixfast1529, label %fixslow1530
fixfast1529:
  %t4313 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4314 = extractvalue {i64, i1} %t4313, 0
  %t4315 = extractvalue {i64, i1} %t4313, 1
  br i1 %t4315, label %fixslow1530, label %fixmerge1531
fixslow1530:
  %t4316 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1531
fixmerge1531:
  %t4317 = phi i64 [ %t4314, %fixfast1529 ], [ %t4316, %fixslow1530 ]
  %t4318 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4318)
  %t4319 = and i64 %t4318, -8
  %t4320 = inttoptr i64 %t4319 to ptr
  %t4321 = load i64, ptr %t4320
  %t4322 = inttoptr i64 %t4321 to ptr
  %t4323 = musttail call fastcc i64 %t4322(i64 %t4318, i64 2, i64 %t4302, i64 %t4317, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4323
else1528:
  %t4324 = call i64 @rt_cons(i64 %t4302, i64 %t4287)
  ret i64 %t4324
}

define fastcc i64 @"emit.internal:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4329 = icmp eq i64 %argc, 1
  br i1 %t4329, label %argok1533, label %arityerr1532
arityerr1532:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1533:
  %t4330 = call i64 @rt_make_string(ptr @.str.lit.26, i64 5)
  %t4331 = call i64 @rt_string_eq(i64 %a0, i64 %t4330)
  %t4332 = icmp ne i64 %t4331, 1
  br i1 %t4332, label %then1534, label %else1535
then1534:
  %t4333 = call i64 @rt_integer_to_char(i64 56)
  ret i64 %t4333
else1535:
  %t4334 = call i64 @rt_make_string(ptr @.str.lit.27, i64 9)
  %t4335 = call i64 @rt_string_eq(i64 %a0, i64 %t4334)
  %t4336 = icmp ne i64 %t4335, 1
  br i1 %t4336, label %then1536, label %else1537
then1536:
  %t4337 = call i64 @rt_integer_to_char(i64 64)
  ret i64 %t4337
else1537:
  %t4338 = call i64 @rt_make_string(ptr @.str.lit.28, i64 6)
  %t4339 = call i64 @rt_string_eq(i64 %a0, i64 %t4338)
  %t4340 = icmp ne i64 %t4339, 1
  br i1 %t4340, label %then1538, label %else1539
then1538:
  %t4341 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t4341
else1539:
  %t4342 = call i64 @rt_make_string(ptr @.str.lit.29, i64 6)
  %t4343 = call i64 @rt_string_eq(i64 %a0, i64 %t4342)
  %t4344 = icmp ne i64 %t4343, 1
  br i1 %t4344, label %then1540, label %else1541
then1540:
  %t4345 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4345
else1541:
  %t4346 = call i64 @rt_make_string(ptr @.str.lit.30, i64 7)
  %t4347 = call i64 @rt_string_eq(i64 %a0, i64 %t4346)
  %t4348 = icmp ne i64 %t4347, 1
  br i1 %t4348, label %then1542, label %else1543
then1542:
  %t4349 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t4349
else1543:
  %t4350 = call i64 @rt_make_string(ptr @.str.lit.31, i64 4)
  %t4351 = call i64 @rt_string_eq(i64 %a0, i64 %t4350)
  %t4352 = icmp ne i64 %t4351, 1
  br i1 %t4352, label %then1544, label %else1545
then1544:
  %t4353 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4353
else1545:
  %t4354 = call i64 @rt_make_string(ptr @.str.lit.32, i64 6)
  %t4355 = call i64 @rt_string_eq(i64 %a0, i64 %t4354)
  %t4356 = icmp ne i64 %t4355, 1
  br i1 %t4356, label %then1546, label %else1547
then1546:
  %t4357 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t4357
else1547:
  %t4358 = call i64 @rt_make_string(ptr @.str.lit.33, i64 5)
  %t4359 = call i64 @rt_string_eq(i64 %a0, i64 %t4358)
  %t4360 = icmp ne i64 %t4359, 1
  br i1 %t4360, label %then1548, label %else1549
then1548:
  %t4361 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t4361
else1549:
  %t4362 = call i64 @rt_make_string(ptr @.str.lit.34, i64 3)
  %t4363 = call i64 @rt_string_eq(i64 %a0, i64 %t4362)
  %t4364 = icmp ne i64 %t4363, 1
  br i1 %t4364, label %then1550, label %else1551
then1550:
  %t4365 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t4365
else1551:
  %t4366 = call i64 @rt_make_string(ptr @.str.lit.35, i64 3)
  %t4367 = call i64 @rt_string_eq(i64 %a0, i64 %t4366)
  %t4368 = icmp ne i64 %t4367, 1
  br i1 %t4368, label %then1552, label %else1553
then1552:
  %t4369 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4369
else1553:
  %t4370 = call i64 @rt_make_string(ptr @.str.lit.36, i64 7)
  %t4371 = call i64 @rt_string_eq(i64 %a0, i64 %t4370)
  %t4372 = icmp ne i64 %t4371, 1
  br i1 %t4372, label %then1554, label %else1555
then1554:
  %t4373 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4373
else1555:
  %t4374 = call i64 @rt_make_string(ptr @.str.lit.37, i64 3)
  %t4375 = call i64 @rt_string_eq(i64 %a0, i64 %t4374)
  %t4376 = icmp ne i64 %t4375, 1
  br i1 %t4376, label %then1556, label %else1557
then1556:
  %t4377 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4377
else1557:
  %t4378 = call i64 @rt_make_string(ptr @.str.lit.38, i64 4)
  %t4379 = call i64 @rt_string_eq(i64 %a0, i64 %t4378)
  %t4380 = icmp ne i64 %t4379, 1
  br i1 %t4380, label %then1558, label %else1559
then1558:
  %t4381 = call i64 @rt_integer_to_char(i64 96)
  ret i64 %t4381
else1559:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_1187"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4386 = icmp eq i64 %argc, 2
  br i1 %t4386, label %argok1561, label %arityerr1560
arityerr1560:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1561:
  %t4387 = and i64 %self, -8
  %t4388 = inttoptr i64 %t4387 to ptr
  %t4389 = getelementptr i64, ptr %t4388, i64 1
  %t4390 = load i64, ptr %t4389
  %t4391 = or i64 %a0, %t4390
  %t4392 = and i64 %t4391, 7
  %t4393 = icmp eq i64 %t4392, 0
  br i1 %t4393, label %fixfast1562, label %fixslow1563
fixfast1562:
  %t4394 = icmp slt i64 %a0, %t4390
  %t4395 = select i1 %t4394, i64 257, i64 1
  br label %fixmerge1564
fixslow1563:
  %t4396 = call i64 @rt_lt(i64 %a0, i64 %t4390)
  br label %fixmerge1564
fixmerge1564:
  %t4397 = phi i64 [ %t4395, %fixfast1562 ], [ %t4396, %fixslow1563 ]
  %t4398 = icmp ne i64 %t4397, 1
  br i1 %t4398, label %then1565, label %else1566
then1565:
  %t4399 = and i64 %self, -8
  %t4400 = inttoptr i64 %t4399 to ptr
  %t4401 = getelementptr i64, ptr %t4400, i64 2
  %t4402 = load i64, ptr %t4401
  %t4403 = call i64 @rt_string_ref(i64 %t4402, i64 %a0)
  %t4404 = load i64, ptr @"emit.internal:rd-hex-digit?"
  call void @rt_check_callable(i64 %t4404)
  %t4405 = and i64 %t4404, -8
  %t4406 = inttoptr i64 %t4405 to ptr
  %t4407 = load i64, ptr %t4406
  %t4408 = inttoptr i64 %t4407 to ptr
  %t4409 = call fastcc i64%t4408(i64 %t4404, i64 1, i64 %t4403, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4410 = icmp ne i64 %t4409, 1
  br i1 %t4410, label %then1567, label %else1568
then1567:
  %t4411 = or i64 %a0, 8
  %t4412 = and i64 %t4411, 7
  %t4413 = icmp eq i64 %t4412, 0
  br i1 %t4413, label %fixfast1569, label %fixslow1570
fixfast1569:
  %t4414 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4415 = extractvalue {i64, i1} %t4414, 0
  %t4416 = extractvalue {i64, i1} %t4414, 1
  br i1 %t4416, label %fixslow1570, label %fixmerge1571
fixslow1570:
  %t4417 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1571
fixmerge1571:
  %t4418 = phi i64 [ %t4415, %fixfast1569 ], [ %t4417, %fixslow1570 ]
  %t4419 = or i64 %a1, 128
  %t4420 = and i64 %t4419, 7
  %t4421 = icmp eq i64 %t4420, 0
  br i1 %t4421, label %fixfast1572, label %fixslow1573
fixfast1572:
  %t4422 = ashr i64 %a1, 3
  %t4423 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t4422, i64 128)
  %t4424 = extractvalue {i64, i1} %t4423, 0
  %t4425 = extractvalue {i64, i1} %t4423, 1
  br i1 %t4425, label %fixslow1573, label %fixmerge1574
fixslow1573:
  %t4426 = call i64 @rt_mul(i64 %a1, i64 128)
  br label %fixmerge1574
fixmerge1574:
  %t4427 = phi i64 [ %t4424, %fixfast1572 ], [ %t4426, %fixslow1573 ]
  %t4428 = load i64, ptr @"emit.internal:rd-hex-digit"
  call void @rt_check_callable(i64 %t4428)
  %t4429 = and i64 %t4428, -8
  %t4430 = inttoptr i64 %t4429 to ptr
  %t4431 = load i64, ptr %t4430
  %t4432 = inttoptr i64 %t4431 to ptr
  %t4433 = call fastcc i64%t4432(i64 %t4428, i64 1, i64 %t4403, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4434 = or i64 %t4427, %t4433
  %t4435 = and i64 %t4434, 7
  %t4436 = icmp eq i64 %t4435, 0
  br i1 %t4436, label %fixfast1575, label %fixslow1576
fixfast1575:
  %t4437 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4427, i64 %t4433)
  %t4438 = extractvalue {i64, i1} %t4437, 0
  %t4439 = extractvalue {i64, i1} %t4437, 1
  br i1 %t4439, label %fixslow1576, label %fixmerge1577
fixslow1576:
  %t4440 = call i64 @rt_add(i64 %t4427, i64 %t4433)
  br label %fixmerge1577
fixmerge1577:
  %t4441 = phi i64 [ %t4438, %fixfast1575 ], [ %t4440, %fixslow1576 ]
  %t4442 = musttail call fastcc i64 @"emit.internal:code_1187"(i64 %self, i64 2, i64 %t4418, i64 %t4441, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4442
else1568:
  ret i64 1
else1566:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-char-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4443 = icmp eq i64 %argc, 1
  br i1 %t4443, label %argok1579, label %arityerr1578
arityerr1578:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1579:
  %t4444 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t4445 = call i64 @rt_char_to_integer(i64 %t4444)
  %t4446 = or i64 %t4445, 960
  %t4447 = and i64 %t4446, 7
  %t4448 = icmp eq i64 %t4447, 0
  br i1 %t4448, label %fixfast1580, label %fixslow1581
fixfast1580:
  %t4449 = icmp eq i64 %t4445, 960
  %t4450 = select i1 %t4449, i64 257, i64 1
  br label %fixmerge1582
fixslow1581:
  %t4451 = call i64 @rt_num_eq(i64 %t4445, i64 960)
  br label %fixmerge1582
fixmerge1582:
  %t4452 = phi i64 [ %t4450, %fixfast1580 ], [ %t4451, %fixslow1581 ]
  %t4453 = icmp ne i64 %t4452, 1
  br i1 %t4453, label %then1583, label %else1584
then1583:
  %t4454 = call i64 @rt_string_length(i64 %a0)
  %t4455 = call ptr @rt_alloc_words(i64 4)
  %t4456 = ptrtoint ptr %t4455 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1187" to i64), ptr %t4455
  %t4457 = or i64 %t4456, 4
  %t4458 = getelementptr i64, ptr %t4455, i64 1
  store i64 %t4454, ptr %t4458
  %t4459 = getelementptr i64, ptr %t4455, i64 2
  store i64 %a0, ptr %t4459
  %t4460 = getelementptr i64, ptr %t4455, i64 3
  store i64 %t4457, ptr %t4460
  %t4461 = musttail call fastcc i64 @"emit.internal:code_1187"(i64 %t4457, i64 2, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4461
else1584:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4466 = icmp eq i64 %argc, 4
  br i1 %t4466, label %argok1586, label %arityerr1585
arityerr1585:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1586:
  %t4467 = or i64 %a2, 8
  %t4468 = and i64 %t4467, 7
  %t4469 = icmp eq i64 %t4468, 0
  br i1 %t4469, label %fixfast1587, label %fixslow1588
fixfast1587:
  %t4470 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4471 = extractvalue {i64, i1} %t4470, 0
  %t4472 = extractvalue {i64, i1} %t4470, 1
  br i1 %t4472, label %fixslow1588, label %fixmerge1589
fixslow1588:
  %t4473 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1589
fixmerge1589:
  %t4474 = phi i64 [ %t4471, %fixfast1587 ], [ %t4473, %fixslow1588 ]
  %t4475 = or i64 %t4474, 8
  %t4476 = and i64 %t4475, 7
  %t4477 = icmp eq i64 %t4476, 0
  br i1 %t4477, label %fixfast1590, label %fixslow1591
fixfast1590:
  %t4478 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4474, i64 8)
  %t4479 = extractvalue {i64, i1} %t4478, 0
  %t4480 = extractvalue {i64, i1} %t4478, 1
  br i1 %t4480, label %fixslow1591, label %fixmerge1592
fixslow1591:
  %t4481 = call i64 @rt_add(i64 %t4474, i64 8)
  br label %fixmerge1592
fixmerge1592:
  %t4482 = phi i64 [ %t4479, %fixfast1590 ], [ %t4481, %fixslow1591 ]
  %t4483 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4483)
  %t4484 = and i64 %t4483, -8
  %t4485 = inttoptr i64 %t4484 to ptr
  %t4486 = load i64, ptr %t4485
  %t4487 = inttoptr i64 %t4486 to ptr
  %t4488 = call fastcc i64%t4487(i64 %t4483, i64 3, i64 %a0, i64 %a1, i64 %t4482, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4489 = call i64 @rt_substring(i64 %a0, i64 %t4474, i64 %t4488)
  %t4490 = call i64 @rt_string_length(i64 %t4489)
  %t4491 = or i64 %t4490, 8
  %t4492 = and i64 %t4491, 7
  %t4493 = icmp eq i64 %t4492, 0
  br i1 %t4493, label %fixfast1593, label %fixslow1594
fixfast1593:
  %t4494 = icmp eq i64 %t4490, 8
  %t4495 = select i1 %t4494, i64 257, i64 1
  br label %fixmerge1595
fixslow1594:
  %t4496 = call i64 @rt_num_eq(i64 %t4490, i64 8)
  br label %fixmerge1595
fixmerge1595:
  %t4497 = phi i64 [ %t4495, %fixfast1593 ], [ %t4496, %fixslow1594 ]
  %t4498 = icmp ne i64 %t4497, 1
  br i1 %t4498, label %then1596, label %else1597
then1596:
  %t4499 = call i64 @rt_string_ref(i64 %a0, i64 %t4474)
  %t4500 = call i64 @rt_cons(i64 %t4499, i64 %t4488)
  ret i64 %t4500
else1597:
  %t4501 = load i64, ptr @"emit.internal:rd-fold?"
  call void @rt_check_callable(i64 %t4501)
  %t4502 = and i64 %t4501, -8
  %t4503 = inttoptr i64 %t4502 to ptr
  %t4504 = load i64, ptr %t4503
  %t4505 = inttoptr i64 %t4504 to ptr
  %t4506 = call fastcc i64%t4505(i64 %t4501, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4507 = icmp ne i64 %t4506, 1
  br i1 %t4507, label %then1598, label %else1599
then1598:
  %t4508 = load i64, ptr @"emit.internal:rd-fold-token"
  call void @rt_check_callable(i64 %t4508)
  %t4509 = and i64 %t4508, -8
  %t4510 = inttoptr i64 %t4509 to ptr
  %t4511 = load i64, ptr %t4510
  %t4512 = inttoptr i64 %t4511 to ptr
  %t4513 = call fastcc i64%t4512(i64 %t4508, i64 1, i64 %t4489, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1600
else1599:
  br label %merge1600
merge1600:
  %t4514 = phi i64 [ %t4513, %then1598 ], [ %t4489, %else1599 ]
  %t4515 = load i64, ptr @"emit.internal:rd-char-hex"
  call void @rt_check_callable(i64 %t4515)
  %t4516 = and i64 %t4515, -8
  %t4517 = inttoptr i64 %t4516 to ptr
  %t4518 = load i64, ptr %t4517
  %t4519 = inttoptr i64 %t4518 to ptr
  %t4520 = call fastcc i64%t4519(i64 %t4515, i64 1, i64 %t4514, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4521 = icmp ne i64 %t4520, 1
  br i1 %t4521, label %then1601, label %else1602
then1601:
  %t4522 = call i64 @rt_integer_to_char(i64 %t4520)
  %t4523 = call i64 @rt_cons(i64 %t4522, i64 %t4488)
  ret i64 %t4523
else1602:
  %t4524 = load i64, ptr @"emit.internal:rd-char-name"
  call void @rt_check_callable(i64 %t4524)
  %t4525 = and i64 %t4524, -8
  %t4526 = inttoptr i64 %t4525 to ptr
  %t4527 = load i64, ptr %t4526
  %t4528 = inttoptr i64 %t4527 to ptr
  %t4529 = call fastcc i64%t4528(i64 %t4524, i64 1, i64 %t4514, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4530 = icmp ne i64 %t4529, 1
  br i1 %t4530, label %then1603, label %else1604
then1603:
  %t4531 = call i64 @rt_cons(i64 %t4529, i64 %t4488)
  ret i64 %t4531
else1604:
  %t4532 = call i64 @rt_intern(ptr @.str.sym.39)
  %t4533 = or i64 %a2, 8
  %t4534 = and i64 %t4533, 7
  %t4535 = icmp eq i64 %t4534, 0
  br i1 %t4535, label %fixfast1605, label %fixslow1606
fixfast1605:
  %t4536 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t4537 = extractvalue {i64, i1} %t4536, 0
  %t4538 = extractvalue {i64, i1} %t4536, 1
  br i1 %t4538, label %fixslow1606, label %fixmerge1607
fixslow1606:
  %t4539 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1607
fixmerge1607:
  %t4540 = phi i64 [ %t4537, %fixfast1605 ], [ %t4539, %fixslow1606 ]
  %t4541 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4541)
  %t4542 = and i64 %t4541, -8
  %t4543 = inttoptr i64 %t4542 to ptr
  %t4544 = load i64, ptr %t4543
  %t4545 = inttoptr i64 %t4544 to ptr
  %t4546 = musttail call fastcc i64 %t4545(i64 %t4541, i64 2, i64 %t4532, i64 %t4540, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4546
}

define fastcc i64 @"emit.internal:code_1236"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4551 = icmp eq i64 %argc, 2
  br i1 %t4551, label %argok1609, label %arityerr1608
arityerr1608:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1609:
  %t4552 = and i64 %self, -8
  %t4553 = inttoptr i64 %t4552 to ptr
  %t4554 = getelementptr i64, ptr %t4553, i64 1
  %t4555 = load i64, ptr %t4554
  %t4556 = or i64 %a0, %t4555
  %t4557 = and i64 %t4556, 7
  %t4558 = icmp eq i64 %t4557, 0
  br i1 %t4558, label %fixfast1610, label %fixslow1611
fixfast1610:
  %t4559 = icmp slt i64 %a0, %t4555
  %t4560 = select i1 %t4559, i64 257, i64 1
  br label %fixmerge1612
fixslow1611:
  %t4561 = call i64 @rt_lt(i64 %a0, i64 %t4555)
  br label %fixmerge1612
fixmerge1612:
  %t4562 = phi i64 [ %t4560, %fixfast1610 ], [ %t4561, %fixslow1611 ]
  %t4563 = icmp ne i64 %t4562, 1
  br i1 %t4563, label %then1613, label %else1614
then1613:
  %t4564 = and i64 %self, -8
  %t4565 = inttoptr i64 %t4564 to ptr
  %t4566 = getelementptr i64, ptr %t4565, i64 2
  %t4567 = load i64, ptr %t4566
  %t4568 = call i64 @rt_string_ref(i64 %t4567, i64 %a0)
  %t4569 = call i64 @rt_char_to_integer(i64 %t4568)
  %t4570 = or i64 %t4569, 992
  %t4571 = and i64 %t4570, 7
  %t4572 = icmp eq i64 %t4571, 0
  br i1 %t4572, label %fixfast1615, label %fixslow1616
fixfast1615:
  %t4573 = icmp eq i64 %t4569, 992
  %t4574 = select i1 %t4573, i64 257, i64 1
  br label %fixmerge1617
fixslow1616:
  %t4575 = call i64 @rt_num_eq(i64 %t4569, i64 992)
  br label %fixmerge1617
fixmerge1617:
  %t4576 = phi i64 [ %t4574, %fixfast1615 ], [ %t4575, %fixslow1616 ]
  %t4577 = icmp ne i64 %t4576, 1
  br i1 %t4577, label %then1618, label %else1619
then1618:
  %t4578 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t4578)
  %t4579 = and i64 %t4578, -8
  %t4580 = inttoptr i64 %t4579 to ptr
  %t4581 = load i64, ptr %t4580
  %t4582 = inttoptr i64 %t4581 to ptr
  %t4583 = call fastcc i64%t4582(i64 %t4578, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4584 = call i64 @rt_list_to_string(i64 %t4583)
  %t4585 = call i64 @rt_string_to_symbol(i64 %t4584)
  %t4586 = or i64 %a0, 8
  %t4587 = and i64 %t4586, 7
  %t4588 = icmp eq i64 %t4587, 0
  br i1 %t4588, label %fixfast1620, label %fixslow1621
fixfast1620:
  %t4589 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4590 = extractvalue {i64, i1} %t4589, 0
  %t4591 = extractvalue {i64, i1} %t4589, 1
  br i1 %t4591, label %fixslow1621, label %fixmerge1622
fixslow1621:
  %t4592 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1622
fixmerge1622:
  %t4593 = phi i64 [ %t4590, %fixfast1620 ], [ %t4592, %fixslow1621 ]
  %t4594 = call i64 @rt_cons(i64 %t4585, i64 %t4593)
  ret i64 %t4594
else1619:
  %t4595 = or i64 %t4569, 736
  %t4596 = and i64 %t4595, 7
  %t4597 = icmp eq i64 %t4596, 0
  br i1 %t4597, label %fixfast1623, label %fixslow1624
fixfast1623:
  %t4598 = icmp eq i64 %t4569, 736
  %t4599 = select i1 %t4598, i64 257, i64 1
  br label %fixmerge1625
fixslow1624:
  %t4600 = call i64 @rt_num_eq(i64 %t4569, i64 736)
  br label %fixmerge1625
fixmerge1625:
  %t4601 = phi i64 [ %t4599, %fixfast1623 ], [ %t4600, %fixslow1624 ]
  %t4602 = icmp ne i64 %t4601, 1
  br i1 %t4602, label %then1626, label %else1627
then1626:
  %t4603 = or i64 %a0, 8
  %t4604 = and i64 %t4603, 7
  %t4605 = icmp eq i64 %t4604, 0
  br i1 %t4605, label %fixfast1629, label %fixslow1630
fixfast1629:
  %t4606 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4607 = extractvalue {i64, i1} %t4606, 0
  %t4608 = extractvalue {i64, i1} %t4606, 1
  br i1 %t4608, label %fixslow1630, label %fixmerge1631
fixslow1630:
  %t4609 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1631
fixmerge1631:
  %t4610 = phi i64 [ %t4607, %fixfast1629 ], [ %t4609, %fixslow1630 ]
  %t4611 = and i64 %self, -8
  %t4612 = inttoptr i64 %t4611 to ptr
  %t4613 = getelementptr i64, ptr %t4612, i64 1
  %t4614 = load i64, ptr %t4613
  %t4615 = or i64 %t4610, %t4614
  %t4616 = and i64 %t4615, 7
  %t4617 = icmp eq i64 %t4616, 0
  br i1 %t4617, label %fixfast1632, label %fixslow1633
fixfast1632:
  %t4618 = icmp slt i64 %t4610, %t4614
  %t4619 = select i1 %t4618, i64 257, i64 1
  br label %fixmerge1634
fixslow1633:
  %t4620 = call i64 @rt_lt(i64 %t4610, i64 %t4614)
  br label %fixmerge1634
fixmerge1634:
  %t4621 = phi i64 [ %t4619, %fixfast1632 ], [ %t4620, %fixslow1633 ]
  br label %merge1628
else1627:
  br label %merge1628
merge1628:
  %t4622 = phi i64 [ %t4621, %fixmerge1634 ], [ 1, %else1627 ]
  %t4623 = icmp ne i64 %t4622, 1
  br i1 %t4623, label %then1635, label %else1636
then1635:
  %t4624 = and i64 %self, -8
  %t4625 = inttoptr i64 %t4624 to ptr
  %t4626 = getelementptr i64, ptr %t4625, i64 2
  %t4627 = load i64, ptr %t4626
  %t4628 = or i64 %a0, 8
  %t4629 = and i64 %t4628, 7
  %t4630 = icmp eq i64 %t4629, 0
  br i1 %t4630, label %fixfast1637, label %fixslow1638
fixfast1637:
  %t4631 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4632 = extractvalue {i64, i1} %t4631, 0
  %t4633 = extractvalue {i64, i1} %t4631, 1
  br i1 %t4633, label %fixslow1638, label %fixmerge1639
fixslow1638:
  %t4634 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1639
fixmerge1639:
  %t4635 = phi i64 [ %t4632, %fixfast1637 ], [ %t4634, %fixslow1638 ]
  %t4636 = call i64 @rt_string_ref(i64 %t4627, i64 %t4635)
  %t4637 = call i64 @rt_char_to_integer(i64 %t4636)
  %t4638 = or i64 %t4637, 960
  %t4639 = and i64 %t4638, 7
  %t4640 = icmp eq i64 %t4639, 0
  br i1 %t4640, label %fixfast1640, label %fixslow1641
fixfast1640:
  %t4641 = icmp eq i64 %t4637, 960
  %t4642 = select i1 %t4641, i64 257, i64 1
  br label %fixmerge1642
fixslow1641:
  %t4643 = call i64 @rt_num_eq(i64 %t4637, i64 960)
  br label %fixmerge1642
fixmerge1642:
  %t4644 = phi i64 [ %t4642, %fixfast1640 ], [ %t4643, %fixslow1641 ]
  %t4645 = icmp ne i64 %t4644, 1
  br i1 %t4645, label %then1643, label %else1644
then1643:
  %t4646 = and i64 %self, -8
  %t4647 = inttoptr i64 %t4646 to ptr
  %t4648 = getelementptr i64, ptr %t4647, i64 2
  %t4649 = load i64, ptr %t4648
  %t4650 = and i64 %self, -8
  %t4651 = inttoptr i64 %t4650 to ptr
  %t4652 = getelementptr i64, ptr %t4651, i64 1
  %t4653 = load i64, ptr %t4652
  %t4654 = or i64 %a0, 16
  %t4655 = and i64 %t4654, 7
  %t4656 = icmp eq i64 %t4655, 0
  br i1 %t4656, label %fixfast1645, label %fixslow1646
fixfast1645:
  %t4657 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4658 = extractvalue {i64, i1} %t4657, 0
  %t4659 = extractvalue {i64, i1} %t4657, 1
  br i1 %t4659, label %fixslow1646, label %fixmerge1647
fixslow1646:
  %t4660 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1647
fixmerge1647:
  %t4661 = phi i64 [ %t4658, %fixfast1645 ], [ %t4660, %fixslow1646 ]
  %t4662 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t4662)
  %t4663 = and i64 %t4662, -8
  %t4664 = inttoptr i64 %t4663 to ptr
  %t4665 = load i64, ptr %t4664
  %t4666 = inttoptr i64 %t4665 to ptr
  %t4667 = call fastcc i64%t4666(i64 %t4662, i64 4, i64 %t4649, i64 %t4653, i64 %t4661, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4668 = call i64 @rt_cdr(i64 %t4667)
  %t4669 = call i64 @rt_car(i64 %t4667)
  %t4670 = call i64 @rt_integer_to_char(i64 %t4669)
  %t4671 = call i64 @rt_cons(i64 %t4670, i64 %a1)
  %t4672 = musttail call fastcc i64 @"emit.internal:code_1236"(i64 %self, i64 2, i64 %t4668, i64 %t4671, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4672
else1644:
  %t4673 = or i64 %a0, 16
  %t4674 = and i64 %t4673, 7
  %t4675 = icmp eq i64 %t4674, 0
  br i1 %t4675, label %fixfast1648, label %fixslow1649
fixfast1648:
  %t4676 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4677 = extractvalue {i64, i1} %t4676, 0
  %t4678 = extractvalue {i64, i1} %t4676, 1
  br i1 %t4678, label %fixslow1649, label %fixmerge1650
fixslow1649:
  %t4679 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1650
fixmerge1650:
  %t4680 = phi i64 [ %t4677, %fixfast1648 ], [ %t4679, %fixslow1649 ]
  %t4681 = load i64, ptr @"emit.internal:rd-str-esc"
  call void @rt_check_callable(i64 %t4681)
  %t4682 = and i64 %t4681, -8
  %t4683 = inttoptr i64 %t4682 to ptr
  %t4684 = load i64, ptr %t4683
  %t4685 = inttoptr i64 %t4684 to ptr
  %t4686 = call fastcc i64%t4685(i64 %t4681, i64 1, i64 %t4636, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4687 = call i64 @rt_cons(i64 %t4686, i64 %a1)
  %t4688 = musttail call fastcc i64 @"emit.internal:code_1236"(i64 %self, i64 2, i64 %t4680, i64 %t4687, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4688
else1636:
  %t4689 = or i64 %a0, 8
  %t4690 = and i64 %t4689, 7
  %t4691 = icmp eq i64 %t4690, 0
  br i1 %t4691, label %fixfast1651, label %fixslow1652
fixfast1651:
  %t4692 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4693 = extractvalue {i64, i1} %t4692, 0
  %t4694 = extractvalue {i64, i1} %t4692, 1
  br i1 %t4694, label %fixslow1652, label %fixmerge1653
fixslow1652:
  %t4695 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1653
fixmerge1653:
  %t4696 = phi i64 [ %t4693, %fixfast1651 ], [ %t4695, %fixslow1652 ]
  %t4697 = call i64 @rt_cons(i64 %t4568, i64 %a1)
  %t4698 = musttail call fastcc i64 @"emit.internal:code_1236"(i64 %self, i64 2, i64 %t4696, i64 %t4697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4698
else1614:
  %t4699 = call i64 @rt_intern(ptr @.str.sym.40)
  %t4700 = and i64 %self, -8
  %t4701 = inttoptr i64 %t4700 to ptr
  %t4702 = getelementptr i64, ptr %t4701, i64 4
  %t4703 = load i64, ptr %t4702
  %t4704 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4704)
  %t4705 = and i64 %t4704, -8
  %t4706 = inttoptr i64 %t4705 to ptr
  %t4707 = load i64, ptr %t4706
  %t4708 = inttoptr i64 %t4707 to ptr
  %t4709 = musttail call fastcc i64 %t4708(i64 %t4704, i64 2, i64 %t4699, i64 %t4703, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4709
}

define fastcc i64 @"emit.internal:code:rd-bar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4710 = icmp eq i64 %argc, 4
  br i1 %t4710, label %argok1655, label %arityerr1654
arityerr1654:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1655:
  %t4711 = call ptr @rt_alloc_words(i64 5)
  %t4712 = ptrtoint ptr %t4711 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1236" to i64), ptr %t4711
  %t4713 = or i64 %t4712, 4
  %t4714 = getelementptr i64, ptr %t4711, i64 1
  store i64 %a1, ptr %t4714
  %t4715 = getelementptr i64, ptr %t4711, i64 2
  store i64 %a0, ptr %t4715
  %t4716 = getelementptr i64, ptr %t4711, i64 3
  store i64 %t4713, ptr %t4716
  %t4717 = getelementptr i64, ptr %t4711, i64 4
  store i64 %a3, ptr %t4717
  %t4718 = musttail call fastcc i64 @"emit.internal:code_1236"(i64 %t4713, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4718
}

define fastcc i64 @"emit.internal:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4723 = icmp eq i64 %argc, 4
  br i1 %t4723, label %argok1657, label %arityerr1656
arityerr1656:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1657:
  %t4724 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4724)
  %t4725 = and i64 %t4724, -8
  %t4726 = inttoptr i64 %t4725 to ptr
  %t4727 = load i64, ptr %t4726
  %t4728 = inttoptr i64 %t4727 to ptr
  %t4729 = call fastcc i64%t4728(i64 %t4724, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4730 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4730)
  %t4731 = and i64 %t4730, -8
  %t4732 = inttoptr i64 %t4731 to ptr
  %t4733 = load i64, ptr %t4732
  %t4734 = inttoptr i64 %t4733 to ptr
  %t4735 = call fastcc i64%t4734(i64 %t4730, i64 4, i64 %a0, i64 %a1, i64 %t4729, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4736 = call i64 @rt_cdr(i64 %t4735)
  %t4737 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4737)
  %t4738 = and i64 %t4737, -8
  %t4739 = inttoptr i64 %t4738 to ptr
  %t4740 = load i64, ptr %t4739
  %t4741 = inttoptr i64 %t4740 to ptr
  %t4742 = call fastcc i64%t4741(i64 %t4737, i64 1, i64 %t4736, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4743 = icmp ne i64 %t4742, 1
  br i1 %t4743, label %then1658, label %else1659
then1658:
  ret i64 %t4735
else1659:
  %t4744 = call i64 @rt_intern(ptr @.str.sym.41)
  %t4745 = call i64 @rt_car(i64 %t4735)
  %t4746 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4746)
  %t4747 = and i64 %t4746, -8
  %t4748 = inttoptr i64 %t4747 to ptr
  %t4749 = load i64, ptr %t4748
  %t4750 = inttoptr i64 %t4749 to ptr
  %t4751 = call fastcc i64%t4750(i64 %t4746, i64 2, i64 %t4744, i64 %t4745, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4752 = call i64 @rt_cdr(i64 %t4735)
  %t4753 = call i64 @rt_cons(i64 %t4751, i64 %t4752)
  ret i64 %t4753
}

define fastcc i64 @"emit.internal:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4758 = icmp eq i64 %argc, 4
  br i1 %t4758, label %argok1661, label %arityerr1660
arityerr1660:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1661:
  %t4759 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4759)
  %t4760 = and i64 %t4759, -8
  %t4761 = inttoptr i64 %t4760 to ptr
  %t4762 = load i64, ptr %t4761
  %t4763 = inttoptr i64 %t4762 to ptr
  %t4764 = call fastcc i64%t4763(i64 %t4759, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4765 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4765)
  %t4766 = and i64 %t4765, -8
  %t4767 = inttoptr i64 %t4766 to ptr
  %t4768 = load i64, ptr %t4767
  %t4769 = inttoptr i64 %t4768 to ptr
  %t4770 = call fastcc i64%t4769(i64 %t4765, i64 4, i64 %a0, i64 %a1, i64 %t4764, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4771 = call i64 @rt_cdr(i64 %t4770)
  %t4772 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4772)
  %t4773 = and i64 %t4772, -8
  %t4774 = inttoptr i64 %t4773 to ptr
  %t4775 = load i64, ptr %t4774
  %t4776 = inttoptr i64 %t4775 to ptr
  %t4777 = call fastcc i64%t4776(i64 %t4772, i64 1, i64 %t4771, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4778 = icmp ne i64 %t4777, 1
  br i1 %t4778, label %then1662, label %else1663
then1662:
  ret i64 %t4770
else1663:
  %t4779 = call i64 @rt_intern(ptr @.str.sym.42)
  %t4780 = call i64 @rt_car(i64 %t4770)
  %t4781 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4781)
  %t4782 = and i64 %t4781, -8
  %t4783 = inttoptr i64 %t4782 to ptr
  %t4784 = load i64, ptr %t4783
  %t4785 = inttoptr i64 %t4784 to ptr
  %t4786 = call fastcc i64%t4785(i64 %t4781, i64 2, i64 %t4779, i64 %t4780, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4787 = call i64 @rt_cdr(i64 %t4770)
  %t4788 = call i64 @rt_cons(i64 %t4786, i64 %t4787)
  ret i64 %t4788
}

define fastcc i64 @"emit.internal:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4793 = icmp eq i64 %argc, 4
  br i1 %t4793, label %argok1665, label %arityerr1664
arityerr1664:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1665:
  %t4794 = or i64 %a2, %a1
  %t4795 = and i64 %t4794, 7
  %t4796 = icmp eq i64 %t4795, 0
  br i1 %t4796, label %fixfast1666, label %fixslow1667
fixfast1666:
  %t4797 = icmp slt i64 %a2, %a1
  %t4798 = select i1 %t4797, i64 257, i64 1
  br label %fixmerge1668
fixslow1667:
  %t4799 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1668
fixmerge1668:
  %t4800 = phi i64 [ %t4798, %fixfast1666 ], [ %t4799, %fixslow1667 ]
  %t4801 = icmp ne i64 %t4800, 1
  br i1 %t4801, label %then1669, label %else1670
then1669:
  %t4802 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4803 = call i64 @rt_char_to_integer(i64 %t4802)
  %t4804 = or i64 %t4803, 512
  %t4805 = and i64 %t4804, 7
  %t4806 = icmp eq i64 %t4805, 0
  br i1 %t4806, label %fixfast1672, label %fixslow1673
fixfast1672:
  %t4807 = icmp eq i64 %t4803, 512
  %t4808 = select i1 %t4807, i64 257, i64 1
  br label %fixmerge1674
fixslow1673:
  %t4809 = call i64 @rt_num_eq(i64 %t4803, i64 512)
  br label %fixmerge1674
fixmerge1674:
  %t4810 = phi i64 [ %t4808, %fixfast1672 ], [ %t4809, %fixslow1673 ]
  br label %merge1671
else1670:
  br label %merge1671
merge1671:
  %t4811 = phi i64 [ %t4810, %fixmerge1674 ], [ 1, %else1670 ]
  %t4812 = icmp ne i64 %t4811, 1
  br i1 %t4812, label %then1675, label %else1676
then1675:
  %t4813 = or i64 %a2, 8
  %t4814 = and i64 %t4813, 7
  %t4815 = icmp eq i64 %t4814, 0
  br i1 %t4815, label %fixfast1677, label %fixslow1678
fixfast1677:
  %t4816 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4817 = extractvalue {i64, i1} %t4816, 0
  %t4818 = extractvalue {i64, i1} %t4816, 1
  br i1 %t4818, label %fixslow1678, label %fixmerge1679
fixslow1678:
  %t4819 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1679
fixmerge1679:
  %t4820 = phi i64 [ %t4817, %fixfast1677 ], [ %t4819, %fixslow1678 ]
  %t4821 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4821)
  %t4822 = and i64 %t4821, -8
  %t4823 = inttoptr i64 %t4822 to ptr
  %t4824 = load i64, ptr %t4823
  %t4825 = inttoptr i64 %t4824 to ptr
  %t4826 = call fastcc i64%t4825(i64 %t4821, i64 4, i64 %a0, i64 %a1, i64 %t4820, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4827 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4827)
  %t4828 = and i64 %t4827, -8
  %t4829 = inttoptr i64 %t4828 to ptr
  %t4830 = load i64, ptr %t4829
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = call fastcc i64%t4831(i64 %t4827, i64 4, i64 %a0, i64 %a1, i64 %t4826, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4833 = call i64 @rt_cdr(i64 %t4832)
  %t4834 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4834)
  %t4835 = and i64 %t4834, -8
  %t4836 = inttoptr i64 %t4835 to ptr
  %t4837 = load i64, ptr %t4836
  %t4838 = inttoptr i64 %t4837 to ptr
  %t4839 = call fastcc i64%t4838(i64 %t4834, i64 1, i64 %t4833, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4840 = icmp ne i64 %t4839, 1
  br i1 %t4840, label %then1680, label %else1681
then1680:
  ret i64 %t4832
else1681:
  %t4841 = call i64 @rt_intern(ptr @.str.sym.43)
  %t4842 = call i64 @rt_car(i64 %t4832)
  %t4843 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4843)
  %t4844 = and i64 %t4843, -8
  %t4845 = inttoptr i64 %t4844 to ptr
  %t4846 = load i64, ptr %t4845
  %t4847 = inttoptr i64 %t4846 to ptr
  %t4848 = call fastcc i64%t4847(i64 %t4843, i64 2, i64 %t4841, i64 %t4842, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4849 = call i64 @rt_cdr(i64 %t4832)
  %t4850 = call i64 @rt_cons(i64 %t4848, i64 %t4849)
  ret i64 %t4850
else1676:
  %t4851 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4851)
  %t4852 = and i64 %t4851, -8
  %t4853 = inttoptr i64 %t4852 to ptr
  %t4854 = load i64, ptr %t4853
  %t4855 = inttoptr i64 %t4854 to ptr
  %t4856 = call fastcc i64%t4855(i64 %t4851, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4857 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4857)
  %t4858 = and i64 %t4857, -8
  %t4859 = inttoptr i64 %t4858 to ptr
  %t4860 = load i64, ptr %t4859
  %t4861 = inttoptr i64 %t4860 to ptr
  %t4862 = call fastcc i64%t4861(i64 %t4857, i64 4, i64 %a0, i64 %a1, i64 %t4856, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4863 = call i64 @rt_cdr(i64 %t4862)
  %t4864 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4864)
  %t4865 = and i64 %t4864, -8
  %t4866 = inttoptr i64 %t4865 to ptr
  %t4867 = load i64, ptr %t4866
  %t4868 = inttoptr i64 %t4867 to ptr
  %t4869 = call fastcc i64%t4868(i64 %t4864, i64 1, i64 %t4863, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4870 = icmp ne i64 %t4869, 1
  br i1 %t4870, label %then1682, label %else1683
then1682:
  ret i64 %t4862
else1683:
  %t4871 = call i64 @rt_intern(ptr @.str.sym.44)
  %t4872 = call i64 @rt_car(i64 %t4862)
  %t4873 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4873)
  %t4874 = and i64 %t4873, -8
  %t4875 = inttoptr i64 %t4874 to ptr
  %t4876 = load i64, ptr %t4875
  %t4877 = inttoptr i64 %t4876 to ptr
  %t4878 = call fastcc i64%t4877(i64 %t4873, i64 2, i64 %t4871, i64 %t4872, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4879 = call i64 @rt_cdr(i64 %t4862)
  %t4880 = call i64 @rt_cons(i64 %t4878, i64 %t4879)
  ret i64 %t4880
}

define fastcc i64 @"emit.internal:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4885 = icmp eq i64 %argc, 3
  br i1 %t4885, label %argok1685, label %arityerr1684
arityerr1684:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1685:
  %t4886 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4887 = call i64 @rt_char_to_integer(i64 %t4886)
  %t4888 = or i64 %t4887, 368
  %t4889 = and i64 %t4888, 7
  %t4890 = icmp eq i64 %t4889, 0
  br i1 %t4890, label %fixfast1686, label %fixslow1687
fixfast1686:
  %t4891 = icmp eq i64 %t4887, 368
  %t4892 = select i1 %t4891, i64 257, i64 1
  br label %fixmerge1688
fixslow1687:
  %t4893 = call i64 @rt_num_eq(i64 %t4887, i64 368)
  br label %fixmerge1688
fixmerge1688:
  %t4894 = phi i64 [ %t4892, %fixfast1686 ], [ %t4893, %fixslow1687 ]
  %t4895 = icmp ne i64 %t4894, 1
  br i1 %t4895, label %then1689, label %else1690
then1689:
  %t4896 = or i64 %a2, 8
  %t4897 = and i64 %t4896, 7
  %t4898 = icmp eq i64 %t4897, 0
  br i1 %t4898, label %fixfast1691, label %fixslow1692
fixfast1691:
  %t4899 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4900 = extractvalue {i64, i1} %t4899, 0
  %t4901 = extractvalue {i64, i1} %t4899, 1
  br i1 %t4901, label %fixslow1692, label %fixmerge1693
fixslow1692:
  %t4902 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1693
fixmerge1693:
  %t4903 = phi i64 [ %t4900, %fixfast1691 ], [ %t4902, %fixslow1692 ]
  %t4904 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4904)
  %t4905 = and i64 %t4904, -8
  %t4906 = inttoptr i64 %t4905 to ptr
  %t4907 = load i64, ptr %t4906
  %t4908 = inttoptr i64 %t4907 to ptr
  %t4909 = call fastcc i64%t4908(i64 %t4904, i64 3, i64 %a0, i64 %a1, i64 %t4903, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4910 = or i64 %a2, 8
  %t4911 = and i64 %t4910, 7
  %t4912 = icmp eq i64 %t4911, 0
  br i1 %t4912, label %fixfast1694, label %fixslow1695
fixfast1694:
  %t4913 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4914 = extractvalue {i64, i1} %t4913, 0
  %t4915 = extractvalue {i64, i1} %t4913, 1
  br i1 %t4915, label %fixslow1695, label %fixmerge1696
fixslow1695:
  %t4916 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1696
fixmerge1696:
  %t4917 = phi i64 [ %t4914, %fixfast1694 ], [ %t4916, %fixslow1695 ]
  %t4918 = or i64 %t4909, %t4917
  %t4919 = and i64 %t4918, 7
  %t4920 = icmp eq i64 %t4919, 0
  br i1 %t4920, label %fixfast1697, label %fixslow1698
fixfast1697:
  %t4921 = icmp eq i64 %t4909, %t4917
  %t4922 = select i1 %t4921, i64 257, i64 1
  br label %fixmerge1699
fixslow1698:
  %t4923 = call i64 @rt_num_eq(i64 %t4909, i64 %t4917)
  br label %fixmerge1699
fixmerge1699:
  %t4924 = phi i64 [ %t4922, %fixfast1697 ], [ %t4923, %fixslow1698 ]
  ret i64 %t4924
else1690:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4929 = icmp eq i64 %argc, 2
  br i1 %t4929, label %argok1701, label %arityerr1700
arityerr1700:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1701:
  %t4930 = call i64 @rt_null_p(i64 %a0)
  %t4931 = icmp ne i64 %t4930, 1
  br i1 %t4931, label %then1702, label %else1703
then1702:
  ret i64 %a1
else1703:
  %t4932 = call i64 @rt_cdr(i64 %a0)
  %t4933 = call i64 @rt_car(i64 %a0)
  %t4934 = call i64 @rt_cons(i64 %t4933, i64 %a1)
  %t4935 = load i64, ptr @"emit.internal:rd-append-reverse"
  call void @rt_check_callable(i64 %t4935)
  %t4936 = and i64 %t4935, -8
  %t4937 = inttoptr i64 %t4936 to ptr
  %t4938 = load i64, ptr %t4937
  %t4939 = inttoptr i64 %t4938 to ptr
  %t4940 = musttail call fastcc i64 %t4939(i64 %t4935, i64 2, i64 %t4932, i64 %t4934, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4940
}

define fastcc i64 @"emit.internal:code:rd-datum-comment?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4945 = icmp eq i64 %argc, 3
  br i1 %t4945, label %argok1705, label %arityerr1704
arityerr1704:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1705:
  %t4946 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4947 = call i64 @rt_char_to_integer(i64 %t4946)
  %t4948 = or i64 %t4947, 280
  %t4949 = and i64 %t4948, 7
  %t4950 = icmp eq i64 %t4949, 0
  br i1 %t4950, label %fixfast1706, label %fixslow1707
fixfast1706:
  %t4951 = icmp eq i64 %t4947, 280
  %t4952 = select i1 %t4951, i64 257, i64 1
  br label %fixmerge1708
fixslow1707:
  %t4953 = call i64 @rt_num_eq(i64 %t4947, i64 280)
  br label %fixmerge1708
fixmerge1708:
  %t4954 = phi i64 [ %t4952, %fixfast1706 ], [ %t4953, %fixslow1707 ]
  %t4955 = icmp ne i64 %t4954, 1
  br i1 %t4955, label %then1709, label %else1710
then1709:
  %t4956 = or i64 %a2, 8
  %t4957 = and i64 %t4956, 7
  %t4958 = icmp eq i64 %t4957, 0
  br i1 %t4958, label %fixfast1711, label %fixslow1712
fixfast1711:
  %t4959 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4960 = extractvalue {i64, i1} %t4959, 0
  %t4961 = extractvalue {i64, i1} %t4959, 1
  br i1 %t4961, label %fixslow1712, label %fixmerge1713
fixslow1712:
  %t4962 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1713
fixmerge1713:
  %t4963 = phi i64 [ %t4960, %fixfast1711 ], [ %t4962, %fixslow1712 ]
  %t4964 = or i64 %t4963, %a1
  %t4965 = and i64 %t4964, 7
  %t4966 = icmp eq i64 %t4965, 0
  br i1 %t4966, label %fixfast1714, label %fixslow1715
fixfast1714:
  %t4967 = icmp slt i64 %t4963, %a1
  %t4968 = select i1 %t4967, i64 257, i64 1
  br label %fixmerge1716
fixslow1715:
  %t4969 = call i64 @rt_lt(i64 %t4963, i64 %a1)
  br label %fixmerge1716
fixmerge1716:
  %t4970 = phi i64 [ %t4968, %fixfast1714 ], [ %t4969, %fixslow1715 ]
  %t4971 = icmp ne i64 %t4970, 1
  br i1 %t4971, label %then1717, label %else1718
then1717:
  %t4972 = or i64 %a2, 8
  %t4973 = and i64 %t4972, 7
  %t4974 = icmp eq i64 %t4973, 0
  br i1 %t4974, label %fixfast1719, label %fixslow1720
fixfast1719:
  %t4975 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4976 = extractvalue {i64, i1} %t4975, 0
  %t4977 = extractvalue {i64, i1} %t4975, 1
  br i1 %t4977, label %fixslow1720, label %fixmerge1721
fixslow1720:
  %t4978 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1721
fixmerge1721:
  %t4979 = phi i64 [ %t4976, %fixfast1719 ], [ %t4978, %fixslow1720 ]
  %t4980 = call i64 @rt_string_ref(i64 %a0, i64 %t4979)
  %t4981 = call i64 @rt_char_to_integer(i64 %t4980)
  %t4982 = or i64 %t4981, 472
  %t4983 = and i64 %t4982, 7
  %t4984 = icmp eq i64 %t4983, 0
  br i1 %t4984, label %fixfast1722, label %fixslow1723
fixfast1722:
  %t4985 = icmp eq i64 %t4981, 472
  %t4986 = select i1 %t4985, i64 257, i64 1
  br label %fixmerge1724
fixslow1723:
  %t4987 = call i64 @rt_num_eq(i64 %t4981, i64 472)
  br label %fixmerge1724
fixmerge1724:
  %t4988 = phi i64 [ %t4986, %fixfast1722 ], [ %t4987, %fixslow1723 ]
  ret i64 %t4988
else1718:
  ret i64 1
else1710:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4993 = icmp eq i64 %argc, 6
  br i1 %t4993, label %argok1726, label %arityerr1725
arityerr1725:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1726:
  %t4994 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4994)
  %t4995 = and i64 %t4994, -8
  %t4996 = inttoptr i64 %t4995 to ptr
  %t4997 = load i64, ptr %t4996
  %t4998 = inttoptr i64 %t4997 to ptr
  %t4999 = call fastcc i64%t4998(i64 %t4994, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5000 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5000)
  %t5001 = and i64 %t5000, -8
  %t5002 = inttoptr i64 %t5001 to ptr
  %t5003 = load i64, ptr %t5002
  %t5004 = inttoptr i64 %t5003 to ptr
  %t5005 = call fastcc i64%t5004(i64 %t5000, i64 1, i64 %t4999, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5006 = icmp ne i64 %t5005, 1
  br i1 %t5006, label %then1727, label %else1728
then1727:
  %t5007 = call i64 @rt_intern(ptr @.str.sym.45)
  %t5008 = call i64 @rt_cons(i64 %t5007, i64 %t4999)
  ret i64 %t5008
else1728:
  %t5009 = or i64 %t4999, %a1
  %t5010 = and i64 %t5009, 7
  %t5011 = icmp eq i64 %t5010, 0
  br i1 %t5011, label %fixfast1729, label %fixslow1730
fixfast1729:
  %t5012 = icmp slt i64 %t4999, %a1
  %t5013 = select i1 %t5012, i64 257, i64 1
  br label %fixmerge1731
fixslow1730:
  %t5014 = call i64 @rt_lt(i64 %t4999, i64 %a1)
  br label %fixmerge1731
fixmerge1731:
  %t5015 = phi i64 [ %t5013, %fixfast1729 ], [ %t5014, %fixslow1730 ]
  %t5016 = icmp ne i64 %t5015, 1
  br i1 %t5016, label %then1732, label %else1733
then1732:
  %t5017 = call i64 @rt_string_ref(i64 %a0, i64 %t4999)
  %t5018 = call i64 @rt_char_to_integer(i64 %t5017)
  %t5019 = or i64 %t5018, 328
  %t5020 = and i64 %t5019, 7
  %t5021 = icmp eq i64 %t5020, 0
  br i1 %t5021, label %fixfast1734, label %fixslow1735
fixfast1734:
  %t5022 = icmp eq i64 %t5018, 328
  %t5023 = select i1 %t5022, i64 257, i64 1
  br label %fixmerge1736
fixslow1735:
  %t5024 = call i64 @rt_num_eq(i64 %t5018, i64 328)
  br label %fixmerge1736
fixmerge1736:
  %t5025 = phi i64 [ %t5023, %fixfast1734 ], [ %t5024, %fixslow1735 ]
  %t5026 = icmp ne i64 %t5025, 1
  br i1 %t5026, label %then1737, label %else1738
then1737:
  br label %merge1739
else1738:
  %t5027 = or i64 %t5018, 744
  %t5028 = and i64 %t5027, 7
  %t5029 = icmp eq i64 %t5028, 0
  br i1 %t5029, label %fixfast1740, label %fixslow1741
fixfast1740:
  %t5030 = icmp eq i64 %t5018, 744
  %t5031 = select i1 %t5030, i64 257, i64 1
  br label %fixmerge1742
fixslow1741:
  %t5032 = call i64 @rt_num_eq(i64 %t5018, i64 744)
  br label %fixmerge1742
fixmerge1742:
  %t5033 = phi i64 [ %t5031, %fixfast1740 ], [ %t5032, %fixslow1741 ]
  br label %merge1739
merge1739:
  %t5034 = phi i64 [ %t5025, %then1737 ], [ %t5033, %fixmerge1742 ]
  %t5035 = icmp ne i64 %t5034, 1
  br i1 %t5035, label %then1743, label %else1744
then1743:
  %t5036 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t5036)
  %t5037 = and i64 %t5036, -8
  %t5038 = inttoptr i64 %t5037 to ptr
  %t5039 = load i64, ptr %t5038
  %t5040 = inttoptr i64 %t5039 to ptr
  %t5041 = call fastcc i64%t5040(i64 %t5036, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5042 = or i64 %t4999, 8
  %t5043 = and i64 %t5042, 7
  %t5044 = icmp eq i64 %t5043, 0
  br i1 %t5044, label %fixfast1745, label %fixslow1746
fixfast1745:
  %t5045 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4999, i64 8)
  %t5046 = extractvalue {i64, i1} %t5045, 0
  %t5047 = extractvalue {i64, i1} %t5045, 1
  br i1 %t5047, label %fixslow1746, label %fixmerge1747
fixslow1746:
  %t5048 = call i64 @rt_add(i64 %t4999, i64 8)
  br label %fixmerge1747
fixmerge1747:
  %t5049 = phi i64 [ %t5046, %fixfast1745 ], [ %t5048, %fixslow1746 ]
  %t5050 = call i64 @rt_cons(i64 %t5041, i64 %t5049)
  ret i64 %t5050
else1744:
  %t5051 = load i64, ptr @"emit.internal:rd-datum-comment?"
  call void @rt_check_callable(i64 %t5051)
  %t5052 = and i64 %t5051, -8
  %t5053 = inttoptr i64 %t5052 to ptr
  %t5054 = load i64, ptr %t5053
  %t5055 = inttoptr i64 %t5054 to ptr
  %t5056 = call fastcc i64%t5055(i64 %t5051, i64 3, i64 %a0, i64 %a1, i64 %t4999, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5057 = icmp ne i64 %t5056, 1
  br i1 %t5057, label %then1748, label %else1749
then1748:
  %t5058 = load i64, ptr @"emit.internal:rd-state-child"
  call void @rt_check_callable(i64 %t5058)
  %t5059 = and i64 %t5058, -8
  %t5060 = inttoptr i64 %t5059 to ptr
  %t5061 = load i64, ptr %t5060
  %t5062 = inttoptr i64 %t5061 to ptr
  %t5063 = call fastcc i64%t5062(i64 %t5058, i64 1, i64 %a4, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5064 = or i64 %t4999, 16
  %t5065 = and i64 %t5064, 7
  %t5066 = icmp eq i64 %t5065, 0
  br i1 %t5066, label %fixfast1750, label %fixslow1751
fixfast1750:
  %t5067 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4999, i64 16)
  %t5068 = extractvalue {i64, i1} %t5067, 0
  %t5069 = extractvalue {i64, i1} %t5067, 1
  br i1 %t5069, label %fixslow1751, label %fixmerge1752
fixslow1751:
  %t5070 = call i64 @rt_add(i64 %t4999, i64 16)
  br label %fixmerge1752
fixmerge1752:
  %t5071 = phi i64 [ %t5068, %fixfast1750 ], [ %t5070, %fixslow1751 ]
  %t5072 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5072)
  %t5073 = and i64 %t5072, -8
  %t5074 = inttoptr i64 %t5073 to ptr
  %t5075 = load i64, ptr %t5074
  %t5076 = inttoptr i64 %t5075 to ptr
  %t5077 = call fastcc i64%t5076(i64 %t5072, i64 4, i64 %a0, i64 %a1, i64 %t5071, i64 %t5063, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5078 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t5078)
  %t5079 = and i64 %t5078, -8
  %t5080 = inttoptr i64 %t5079 to ptr
  %t5081 = load i64, ptr %t5080
  %t5082 = inttoptr i64 %t5081 to ptr
  %t5083 = call fastcc i64%t5082(i64 %t5078, i64 4, i64 %a0, i64 %a1, i64 %t5077, i64 %t5063, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5084 = load i64, ptr @"emit.internal:rd-finish"
  call void @rt_check_callable(i64 %t5084)
  %t5085 = and i64 %t5084, -8
  %t5086 = inttoptr i64 %t5085 to ptr
  %t5087 = load i64, ptr %t5086
  %t5088 = inttoptr i64 %t5087 to ptr
  %t5089 = call fastcc i64%t5088(i64 %t5084, i64 2, i64 %t5063, i64 %t5083, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5090 = call i64 @rt_cdr(i64 %t5089)
  %t5091 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5091)
  %t5092 = and i64 %t5091, -8
  %t5093 = inttoptr i64 %t5092 to ptr
  %t5094 = load i64, ptr %t5093
  %t5095 = inttoptr i64 %t5094 to ptr
  %t5096 = call fastcc i64%t5095(i64 %t5091, i64 1, i64 %t5090, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5097 = icmp ne i64 %t5096, 1
  br i1 %t5097, label %then1753, label %else1754
then1753:
  ret i64 %t5089
else1754:
  %t5098 = call i64 @rt_cdr(i64 %t5089)
  %t5099 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5099)
  %t5100 = and i64 %t5099, -8
  %t5101 = inttoptr i64 %t5100 to ptr
  %t5102 = load i64, ptr %t5101
  %t5103 = inttoptr i64 %t5102 to ptr
  %t5104 = musttail call fastcc i64 %t5103(i64 %t5099, i64 6, i64 %a0, i64 %a1, i64 %t5098, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  ret i64 %t5104
else1749:
  %t5105 = load i64, ptr @"emit.internal:rd-dot?"
  call void @rt_check_callable(i64 %t5105)
  %t5106 = and i64 %t5105, -8
  %t5107 = inttoptr i64 %t5106 to ptr
  %t5108 = load i64, ptr %t5107
  %t5109 = inttoptr i64 %t5108 to ptr
  %t5110 = call fastcc i64%t5109(i64 %t5105, i64 3, i64 %a0, i64 %a1, i64 %t4999, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5111 = icmp ne i64 %t5110, 1
  br i1 %t5111, label %then1755, label %else1756
then1755:
  %t5112 = or i64 %t4999, 8
  %t5113 = and i64 %t5112, 7
  %t5114 = icmp eq i64 %t5113, 0
  br i1 %t5114, label %fixfast1757, label %fixslow1758
fixfast1757:
  %t5115 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4999, i64 8)
  %t5116 = extractvalue {i64, i1} %t5115, 0
  %t5117 = extractvalue {i64, i1} %t5115, 1
  br i1 %t5117, label %fixslow1758, label %fixmerge1759
fixslow1758:
  %t5118 = call i64 @rt_add(i64 %t4999, i64 8)
  br label %fixmerge1759
fixmerge1759:
  %t5119 = phi i64 [ %t5116, %fixfast1757 ], [ %t5118, %fixslow1758 ]
  %t5120 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5120)
  %t5121 = and i64 %t5120, -8
  %t5122 = inttoptr i64 %t5121 to ptr
  %t5123 = load i64, ptr %t5122
  %t5124 = inttoptr i64 %t5123 to ptr
  %t5125 = call fastcc i64%t5124(i64 %t5120, i64 4, i64 %a0, i64 %a1, i64 %t5119, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5126 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t5126)
  %t5127 = and i64 %t5126, -8
  %t5128 = inttoptr i64 %t5127 to ptr
  %t5129 = load i64, ptr %t5128
  %t5130 = inttoptr i64 %t5129 to ptr
  %t5131 = call fastcc i64%t5130(i64 %t5126, i64 4, i64 %a0, i64 %a1, i64 %t5125, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5132 = call i64 @rt_cdr(i64 %t5131)
  %t5133 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5133)
  %t5134 = and i64 %t5133, -8
  %t5135 = inttoptr i64 %t5134 to ptr
  %t5136 = load i64, ptr %t5135
  %t5137 = inttoptr i64 %t5136 to ptr
  %t5138 = call fastcc i64%t5137(i64 %t5133, i64 1, i64 %t5132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5139 = icmp ne i64 %t5138, 1
  br i1 %t5139, label %then1760, label %else1761
then1760:
  ret i64 %t5131
else1761:
  %t5140 = call i64 @rt_cdr(i64 %t5131)
  %t5141 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t5141)
  %t5142 = and i64 %t5141, -8
  %t5143 = inttoptr i64 %t5142 to ptr
  %t5144 = load i64, ptr %t5143
  %t5145 = inttoptr i64 %t5144 to ptr
  %t5146 = call fastcc i64%t5145(i64 %t5141, i64 4, i64 %a0, i64 %a1, i64 %t5140, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5147 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5147)
  %t5148 = and i64 %t5147, -8
  %t5149 = inttoptr i64 %t5148 to ptr
  %t5150 = load i64, ptr %t5149
  %t5151 = inttoptr i64 %t5150 to ptr
  %t5152 = call fastcc i64%t5151(i64 %t5147, i64 1, i64 %t5146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5153 = icmp ne i64 %t5152, 1
  br i1 %t5153, label %then1762, label %else1763
then1762:
  %t5154 = call i64 @rt_intern(ptr @.str.sym.45)
  %t5155 = call i64 @rt_cons(i64 %t5154, i64 %t5146)
  ret i64 %t5155
else1763:
  %t5156 = or i64 %a1, %t5146
  %t5157 = and i64 %t5156, 7
  %t5158 = icmp eq i64 %t5157, 0
  br i1 %t5158, label %fixfast1764, label %fixslow1765
fixfast1764:
  %t5159 = icmp slt i64 %a1, %t5146
  %t5160 = select i1 %t5159, i64 257, i64 1
  br label %fixmerge1766
fixslow1765:
  %t5161 = call i64 @rt_lt(i64 %a1, i64 %t5146)
  br label %fixmerge1766
fixmerge1766:
  %t5162 = phi i64 [ %t5160, %fixfast1764 ], [ %t5161, %fixslow1765 ]
  %t5163 = icmp ne i64 %t5162, 1
  br i1 %t5163, label %then1767, label %else1768
then1767:
  br label %merge1769
else1768:
  %t5164 = or i64 %a1, %t5146
  %t5165 = and i64 %t5164, 7
  %t5166 = icmp eq i64 %t5165, 0
  br i1 %t5166, label %fixfast1770, label %fixslow1771
fixfast1770:
  %t5167 = icmp eq i64 %a1, %t5146
  %t5168 = select i1 %t5167, i64 257, i64 1
  br label %fixmerge1772
fixslow1771:
  %t5169 = call i64 @rt_num_eq(i64 %a1, i64 %t5146)
  br label %fixmerge1772
fixmerge1772:
  %t5170 = phi i64 [ %t5168, %fixfast1770 ], [ %t5169, %fixslow1771 ]
  br label %merge1769
merge1769:
  %t5171 = phi i64 [ 257, %then1767 ], [ %t5170, %fixmerge1772 ]
  %t5172 = icmp ne i64 %t5171, 1
  br i1 %t5172, label %then1773, label %else1774
then1773:
  %t5173 = call i64 @rt_intern(ptr @.str.sym.46)
  %t5174 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5174)
  %t5175 = and i64 %t5174, -8
  %t5176 = inttoptr i64 %t5175 to ptr
  %t5177 = load i64, ptr %t5176
  %t5178 = inttoptr i64 %t5177 to ptr
  %t5179 = musttail call fastcc i64 %t5178(i64 %t5174, i64 2, i64 %t5173, i64 %a5, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5179
else1774:
  %t5180 = call i64 @rt_car(i64 %t5131)
  %t5181 = load i64, ptr @"emit.internal:rd-append-reverse"
  call void @rt_check_callable(i64 %t5181)
  %t5182 = and i64 %t5181, -8
  %t5183 = inttoptr i64 %t5182 to ptr
  %t5184 = load i64, ptr %t5183
  %t5185 = inttoptr i64 %t5184 to ptr
  %t5186 = call fastcc i64%t5185(i64 %t5181, i64 2, i64 %a3, i64 %t5180, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5187 = or i64 %t5146, 8
  %t5188 = and i64 %t5187, 7
  %t5189 = icmp eq i64 %t5188, 0
  br i1 %t5189, label %fixfast1775, label %fixslow1776
fixfast1775:
  %t5190 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5146, i64 8)
  %t5191 = extractvalue {i64, i1} %t5190, 0
  %t5192 = extractvalue {i64, i1} %t5190, 1
  br i1 %t5192, label %fixslow1776, label %fixmerge1777
fixslow1776:
  %t5193 = call i64 @rt_add(i64 %t5146, i64 8)
  br label %fixmerge1777
fixmerge1777:
  %t5194 = phi i64 [ %t5191, %fixfast1775 ], [ %t5193, %fixslow1776 ]
  %t5195 = call i64 @rt_cons(i64 %t5186, i64 %t5194)
  ret i64 %t5195
else1756:
  %t5196 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t5196)
  %t5197 = and i64 %t5196, -8
  %t5198 = inttoptr i64 %t5197 to ptr
  %t5199 = load i64, ptr %t5198
  %t5200 = inttoptr i64 %t5199 to ptr
  %t5201 = call fastcc i64%t5200(i64 %t5196, i64 4, i64 %a0, i64 %a1, i64 %t4999, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5202 = call i64 @rt_cdr(i64 %t5201)
  %t5203 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t5203)
  %t5204 = and i64 %t5203, -8
  %t5205 = inttoptr i64 %t5204 to ptr
  %t5206 = load i64, ptr %t5205
  %t5207 = inttoptr i64 %t5206 to ptr
  %t5208 = call fastcc i64%t5207(i64 %t5203, i64 1, i64 %t5202, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5209 = icmp ne i64 %t5208, 1
  br i1 %t5209, label %then1778, label %else1779
then1778:
  ret i64 %t5201
else1779:
  %t5210 = call i64 @rt_cdr(i64 %t5201)
  %t5211 = call i64 @rt_car(i64 %t5201)
  %t5212 = call i64 @rt_cons(i64 %t5211, i64 %a3)
  %t5213 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5213)
  %t5214 = and i64 %t5213, -8
  %t5215 = inttoptr i64 %t5214 to ptr
  %t5216 = load i64, ptr %t5215
  %t5217 = inttoptr i64 %t5216 to ptr
  %t5218 = musttail call fastcc i64 %t5217(i64 %t5213, i64 6, i64 %a0, i64 %a1, i64 %t5210, i64 %t5212, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  ret i64 %t5218
else1733:
  %t5219 = call i64 @rt_intern(ptr @.str.sym.46)
  %t5220 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5220)
  %t5221 = and i64 %t5220, -8
  %t5222 = inttoptr i64 %t5221 to ptr
  %t5223 = load i64, ptr %t5222
  %t5224 = inttoptr i64 %t5223 to ptr
  %t5225 = musttail call fastcc i64 %t5224(i64 %t5220, i64 2, i64 %t5219, i64 %a5, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5225
}

define fastcc i64 @"emit.internal:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5230 = icmp eq i64 %argc, 4
  br i1 %t5230, label %argok1781, label %arityerr1780
arityerr1780:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1781:
  %t5231 = or i64 0, %a2
  %t5232 = and i64 %t5231, 7
  %t5233 = icmp eq i64 %t5232, 0
  br i1 %t5233, label %fixfast1782, label %fixslow1783
fixfast1782:
  %t5234 = icmp slt i64 0, %a2
  %t5235 = select i1 %t5234, i64 257, i64 1
  br label %fixmerge1784
fixslow1783:
  %t5236 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge1784
fixmerge1784:
  %t5237 = phi i64 [ %t5235, %fixfast1782 ], [ %t5236, %fixslow1783 ]
  %t5238 = icmp ne i64 %t5237, 1
  br i1 %t5238, label %then1785, label %else1786
then1785:
  br label %merge1787
else1786:
  %t5239 = or i64 0, %a2
  %t5240 = and i64 %t5239, 7
  %t5241 = icmp eq i64 %t5240, 0
  br i1 %t5241, label %fixfast1788, label %fixslow1789
fixfast1788:
  %t5242 = icmp eq i64 0, %a2
  %t5243 = select i1 %t5242, i64 257, i64 1
  br label %fixmerge1790
fixslow1789:
  %t5244 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge1790
fixmerge1790:
  %t5245 = phi i64 [ %t5243, %fixfast1788 ], [ %t5244, %fixslow1789 ]
  br label %merge1787
merge1787:
  %t5246 = phi i64 [ 257, %then1785 ], [ %t5245, %fixmerge1790 ]
  %t5247 = icmp ne i64 %t5246, 1
  br i1 %t5247, label %then1791, label %else1792
then1791:
  %t5248 = or i64 %a2, %a1
  %t5249 = and i64 %t5248, 7
  %t5250 = icmp eq i64 %t5249, 0
  br i1 %t5250, label %fixfast1794, label %fixslow1795
fixfast1794:
  %t5251 = icmp slt i64 %a2, %a1
  %t5252 = select i1 %t5251, i64 257, i64 1
  br label %fixmerge1796
fixslow1795:
  %t5253 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1796
fixmerge1796:
  %t5254 = phi i64 [ %t5252, %fixfast1794 ], [ %t5253, %fixslow1795 ]
  br label %merge1793
else1792:
  br label %merge1793
merge1793:
  %t5255 = phi i64 [ %t5254, %fixmerge1796 ], [ 1, %else1792 ]
  %t5256 = icmp ne i64 %t5255, 1
  br i1 %t5256, label %then1797, label %else1798
then1797:
  %t5257 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5258 = call i64 @rt_char_to_integer(i64 %t5257)
  %t5259 = or i64 %t5258, 320
  %t5260 = and i64 %t5259, 7
  %t5261 = icmp eq i64 %t5260, 0
  br i1 %t5261, label %fixfast1799, label %fixslow1800
fixfast1799:
  %t5262 = icmp eq i64 %t5258, 320
  %t5263 = select i1 %t5262, i64 257, i64 1
  br label %fixmerge1801
fixslow1800:
  %t5264 = call i64 @rt_num_eq(i64 %t5258, i64 320)
  br label %fixmerge1801
fixmerge1801:
  %t5265 = phi i64 [ %t5263, %fixfast1799 ], [ %t5264, %fixslow1800 ]
  %t5266 = icmp ne i64 %t5265, 1
  br i1 %t5266, label %then1802, label %else1803
then1802:
  %t5267 = or i64 %a2, 8
  %t5268 = and i64 %t5267, 7
  %t5269 = icmp eq i64 %t5268, 0
  br i1 %t5269, label %fixfast1804, label %fixslow1805
fixfast1804:
  %t5270 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5271 = extractvalue {i64, i1} %t5270, 0
  %t5272 = extractvalue {i64, i1} %t5270, 1
  br i1 %t5272, label %fixslow1805, label %fixmerge1806
fixslow1805:
  %t5273 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1806
fixmerge1806:
  %t5274 = phi i64 [ %t5271, %fixfast1804 ], [ %t5273, %fixslow1805 ]
  %t5275 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5275)
  %t5276 = and i64 %t5275, -8
  %t5277 = inttoptr i64 %t5276 to ptr
  %t5278 = load i64, ptr %t5277
  %t5279 = inttoptr i64 %t5278 to ptr
  %t5280 = musttail call fastcc i64 %t5279(i64 %t5275, i64 6, i64 %a0, i64 %a1, i64 %t5274, i64 2, i64 %a3, i64 %a2, i64 0, i64 0, ptr null)
  ret i64 %t5280
else1803:
  %t5281 = or i64 %t5258, 728
  %t5282 = and i64 %t5281, 7
  %t5283 = icmp eq i64 %t5282, 0
  br i1 %t5283, label %fixfast1807, label %fixslow1808
fixfast1807:
  %t5284 = icmp eq i64 %t5258, 728
  %t5285 = select i1 %t5284, i64 257, i64 1
  br label %fixmerge1809
fixslow1808:
  %t5286 = call i64 @rt_num_eq(i64 %t5258, i64 728)
  br label %fixmerge1809
fixmerge1809:
  %t5287 = phi i64 [ %t5285, %fixfast1807 ], [ %t5286, %fixslow1808 ]
  %t5288 = icmp ne i64 %t5287, 1
  br i1 %t5288, label %then1810, label %else1811
then1810:
  %t5289 = or i64 %a2, 8
  %t5290 = and i64 %t5289, 7
  %t5291 = icmp eq i64 %t5290, 0
  br i1 %t5291, label %fixfast1812, label %fixslow1813
fixfast1812:
  %t5292 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5293 = extractvalue {i64, i1} %t5292, 0
  %t5294 = extractvalue {i64, i1} %t5292, 1
  br i1 %t5294, label %fixslow1813, label %fixmerge1814
fixslow1813:
  %t5295 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1814
fixmerge1814:
  %t5296 = phi i64 [ %t5293, %fixfast1812 ], [ %t5295, %fixslow1813 ]
  %t5297 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t5297)
  %t5298 = and i64 %t5297, -8
  %t5299 = inttoptr i64 %t5298 to ptr
  %t5300 = load i64, ptr %t5299
  %t5301 = inttoptr i64 %t5300 to ptr
  %t5302 = musttail call fastcc i64 %t5301(i64 %t5297, i64 6, i64 %a0, i64 %a1, i64 %t5296, i64 2, i64 %a3, i64 %a2, i64 0, i64 0, ptr null)
  ret i64 %t5302
else1811:
  %t5303 = or i64 %t5258, 312
  %t5304 = and i64 %t5303, 7
  %t5305 = icmp eq i64 %t5304, 0
  br i1 %t5305, label %fixfast1815, label %fixslow1816
fixfast1815:
  %t5306 = icmp eq i64 %t5258, 312
  %t5307 = select i1 %t5306, i64 257, i64 1
  br label %fixmerge1817
fixslow1816:
  %t5308 = call i64 @rt_num_eq(i64 %t5258, i64 312)
  br label %fixmerge1817
fixmerge1817:
  %t5309 = phi i64 [ %t5307, %fixfast1815 ], [ %t5308, %fixslow1816 ]
  %t5310 = icmp ne i64 %t5309, 1
  br i1 %t5310, label %then1818, label %else1819
then1818:
  %t5311 = or i64 %a2, 8
  %t5312 = and i64 %t5311, 7
  %t5313 = icmp eq i64 %t5312, 0
  br i1 %t5313, label %fixfast1820, label %fixslow1821
fixfast1820:
  %t5314 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5315 = extractvalue {i64, i1} %t5314, 0
  %t5316 = extractvalue {i64, i1} %t5314, 1
  br i1 %t5316, label %fixslow1821, label %fixmerge1822
fixslow1821:
  %t5317 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1822
fixmerge1822:
  %t5318 = phi i64 [ %t5315, %fixfast1820 ], [ %t5317, %fixslow1821 ]
  %t5319 = load i64, ptr @"emit.internal:rd-quote"
  call void @rt_check_callable(i64 %t5319)
  %t5320 = and i64 %t5319, -8
  %t5321 = inttoptr i64 %t5320 to ptr
  %t5322 = load i64, ptr %t5321
  %t5323 = inttoptr i64 %t5322 to ptr
  %t5324 = musttail call fastcc i64 %t5323(i64 %t5319, i64 4, i64 %a0, i64 %a1, i64 %t5318, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5324
else1819:
  %t5325 = or i64 %t5258, 768
  %t5326 = and i64 %t5325, 7
  %t5327 = icmp eq i64 %t5326, 0
  br i1 %t5327, label %fixfast1823, label %fixslow1824
fixfast1823:
  %t5328 = icmp eq i64 %t5258, 768
  %t5329 = select i1 %t5328, i64 257, i64 1
  br label %fixmerge1825
fixslow1824:
  %t5330 = call i64 @rt_num_eq(i64 %t5258, i64 768)
  br label %fixmerge1825
fixmerge1825:
  %t5331 = phi i64 [ %t5329, %fixfast1823 ], [ %t5330, %fixslow1824 ]
  %t5332 = icmp ne i64 %t5331, 1
  br i1 %t5332, label %then1826, label %else1827
then1826:
  %t5333 = or i64 %a2, 8
  %t5334 = and i64 %t5333, 7
  %t5335 = icmp eq i64 %t5334, 0
  br i1 %t5335, label %fixfast1828, label %fixslow1829
fixfast1828:
  %t5336 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5337 = extractvalue {i64, i1} %t5336, 0
  %t5338 = extractvalue {i64, i1} %t5336, 1
  br i1 %t5338, label %fixslow1829, label %fixmerge1830
fixslow1829:
  %t5339 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1830
fixmerge1830:
  %t5340 = phi i64 [ %t5337, %fixfast1828 ], [ %t5339, %fixslow1829 ]
  %t5341 = load i64, ptr @"emit.internal:rd-quasi"
  call void @rt_check_callable(i64 %t5341)
  %t5342 = and i64 %t5341, -8
  %t5343 = inttoptr i64 %t5342 to ptr
  %t5344 = load i64, ptr %t5343
  %t5345 = inttoptr i64 %t5344 to ptr
  %t5346 = musttail call fastcc i64 %t5345(i64 %t5341, i64 4, i64 %a0, i64 %a1, i64 %t5340, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5346
else1827:
  %t5347 = or i64 %t5258, 352
  %t5348 = and i64 %t5347, 7
  %t5349 = icmp eq i64 %t5348, 0
  br i1 %t5349, label %fixfast1831, label %fixslow1832
fixfast1831:
  %t5350 = icmp eq i64 %t5258, 352
  %t5351 = select i1 %t5350, i64 257, i64 1
  br label %fixmerge1833
fixslow1832:
  %t5352 = call i64 @rt_num_eq(i64 %t5258, i64 352)
  br label %fixmerge1833
fixmerge1833:
  %t5353 = phi i64 [ %t5351, %fixfast1831 ], [ %t5352, %fixslow1832 ]
  %t5354 = icmp ne i64 %t5353, 1
  br i1 %t5354, label %then1834, label %else1835
then1834:
  %t5355 = or i64 %a2, 8
  %t5356 = and i64 %t5355, 7
  %t5357 = icmp eq i64 %t5356, 0
  br i1 %t5357, label %fixfast1836, label %fixslow1837
fixfast1836:
  %t5358 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5359 = extractvalue {i64, i1} %t5358, 0
  %t5360 = extractvalue {i64, i1} %t5358, 1
  br i1 %t5360, label %fixslow1837, label %fixmerge1838
fixslow1837:
  %t5361 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1838
fixmerge1838:
  %t5362 = phi i64 [ %t5359, %fixfast1836 ], [ %t5361, %fixslow1837 ]
  %t5363 = load i64, ptr @"emit.internal:rd-unquote"
  call void @rt_check_callable(i64 %t5363)
  %t5364 = and i64 %t5363, -8
  %t5365 = inttoptr i64 %t5364 to ptr
  %t5366 = load i64, ptr %t5365
  %t5367 = inttoptr i64 %t5366 to ptr
  %t5368 = musttail call fastcc i64 %t5367(i64 %t5363, i64 4, i64 %a0, i64 %a1, i64 %t5362, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5368
else1835:
  %t5369 = or i64 %t5258, 272
  %t5370 = and i64 %t5369, 7
  %t5371 = icmp eq i64 %t5370, 0
  br i1 %t5371, label %fixfast1839, label %fixslow1840
fixfast1839:
  %t5372 = icmp eq i64 %t5258, 272
  %t5373 = select i1 %t5372, i64 257, i64 1
  br label %fixmerge1841
fixslow1840:
  %t5374 = call i64 @rt_num_eq(i64 %t5258, i64 272)
  br label %fixmerge1841
fixmerge1841:
  %t5375 = phi i64 [ %t5373, %fixfast1839 ], [ %t5374, %fixslow1840 ]
  %t5376 = icmp ne i64 %t5375, 1
  br i1 %t5376, label %then1842, label %else1843
then1842:
  %t5377 = or i64 %a2, 8
  %t5378 = and i64 %t5377, 7
  %t5379 = icmp eq i64 %t5378, 0
  br i1 %t5379, label %fixfast1844, label %fixslow1845
fixfast1844:
  %t5380 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5381 = extractvalue {i64, i1} %t5380, 0
  %t5382 = extractvalue {i64, i1} %t5380, 1
  br i1 %t5382, label %fixslow1845, label %fixmerge1846
fixslow1845:
  %t5383 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1846
fixmerge1846:
  %t5384 = phi i64 [ %t5381, %fixfast1844 ], [ %t5383, %fixslow1845 ]
  %t5385 = load i64, ptr @"emit.internal:rd-string"
  call void @rt_check_callable(i64 %t5385)
  %t5386 = and i64 %t5385, -8
  %t5387 = inttoptr i64 %t5386 to ptr
  %t5388 = load i64, ptr %t5387
  %t5389 = inttoptr i64 %t5388 to ptr
  %t5390 = musttail call fastcc i64 %t5389(i64 %t5385, i64 4, i64 %a0, i64 %a1, i64 %t5384, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5390
else1843:
  %t5391 = or i64 %t5258, 280
  %t5392 = and i64 %t5391, 7
  %t5393 = icmp eq i64 %t5392, 0
  br i1 %t5393, label %fixfast1847, label %fixslow1848
fixfast1847:
  %t5394 = icmp eq i64 %t5258, 280
  %t5395 = select i1 %t5394, i64 257, i64 1
  br label %fixmerge1849
fixslow1848:
  %t5396 = call i64 @rt_num_eq(i64 %t5258, i64 280)
  br label %fixmerge1849
fixmerge1849:
  %t5397 = phi i64 [ %t5395, %fixfast1847 ], [ %t5396, %fixslow1848 ]
  %t5398 = icmp ne i64 %t5397, 1
  br i1 %t5398, label %then1850, label %else1851
then1850:
  %t5399 = or i64 %a2, 8
  %t5400 = and i64 %t5399, 7
  %t5401 = icmp eq i64 %t5400, 0
  br i1 %t5401, label %fixfast1852, label %fixslow1853
fixfast1852:
  %t5402 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5403 = extractvalue {i64, i1} %t5402, 0
  %t5404 = extractvalue {i64, i1} %t5402, 1
  br i1 %t5404, label %fixslow1853, label %fixmerge1854
fixslow1853:
  %t5405 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1854
fixmerge1854:
  %t5406 = phi i64 [ %t5403, %fixfast1852 ], [ %t5405, %fixslow1853 ]
  %t5407 = load i64, ptr @"emit.internal:rd-hash"
  call void @rt_check_callable(i64 %t5407)
  %t5408 = and i64 %t5407, -8
  %t5409 = inttoptr i64 %t5408 to ptr
  %t5410 = load i64, ptr %t5409
  %t5411 = inttoptr i64 %t5410 to ptr
  %t5412 = musttail call fastcc i64 %t5411(i64 %t5407, i64 4, i64 %a0, i64 %a1, i64 %t5406, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5412
else1851:
  %t5413 = or i64 %t5258, 992
  %t5414 = and i64 %t5413, 7
  %t5415 = icmp eq i64 %t5414, 0
  br i1 %t5415, label %fixfast1855, label %fixslow1856
fixfast1855:
  %t5416 = icmp eq i64 %t5258, 992
  %t5417 = select i1 %t5416, i64 257, i64 1
  br label %fixmerge1857
fixslow1856:
  %t5418 = call i64 @rt_num_eq(i64 %t5258, i64 992)
  br label %fixmerge1857
fixmerge1857:
  %t5419 = phi i64 [ %t5417, %fixfast1855 ], [ %t5418, %fixslow1856 ]
  %t5420 = icmp ne i64 %t5419, 1
  br i1 %t5420, label %then1858, label %else1859
then1858:
  %t5421 = or i64 %a2, 8
  %t5422 = and i64 %t5421, 7
  %t5423 = icmp eq i64 %t5422, 0
  br i1 %t5423, label %fixfast1860, label %fixslow1861
fixfast1860:
  %t5424 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5425 = extractvalue {i64, i1} %t5424, 0
  %t5426 = extractvalue {i64, i1} %t5424, 1
  br i1 %t5426, label %fixslow1861, label %fixmerge1862
fixslow1861:
  %t5427 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1862
fixmerge1862:
  %t5428 = phi i64 [ %t5425, %fixfast1860 ], [ %t5427, %fixslow1861 ]
  %t5429 = load i64, ptr @"emit.internal:rd-bar"
  call void @rt_check_callable(i64 %t5429)
  %t5430 = and i64 %t5429, -8
  %t5431 = inttoptr i64 %t5430 to ptr
  %t5432 = load i64, ptr %t5431
  %t5433 = inttoptr i64 %t5432 to ptr
  %t5434 = musttail call fastcc i64 %t5433(i64 %t5429, i64 4, i64 %a0, i64 %a1, i64 %t5428, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5434
else1859:
  %t5435 = or i64 %t5258, 328
  %t5436 = and i64 %t5435, 7
  %t5437 = icmp eq i64 %t5436, 0
  br i1 %t5437, label %fixfast1863, label %fixslow1864
fixfast1863:
  %t5438 = icmp eq i64 %t5258, 328
  %t5439 = select i1 %t5438, i64 257, i64 1
  br label %fixmerge1865
fixslow1864:
  %t5440 = call i64 @rt_num_eq(i64 %t5258, i64 328)
  br label %fixmerge1865
fixmerge1865:
  %t5441 = phi i64 [ %t5439, %fixfast1863 ], [ %t5440, %fixslow1864 ]
  %t5442 = icmp ne i64 %t5441, 1
  br i1 %t5442, label %then1866, label %else1867
then1866:
  br label %merge1868
else1867:
  %t5443 = or i64 %t5258, 744
  %t5444 = and i64 %t5443, 7
  %t5445 = icmp eq i64 %t5444, 0
  br i1 %t5445, label %fixfast1869, label %fixslow1870
fixfast1869:
  %t5446 = icmp eq i64 %t5258, 744
  %t5447 = select i1 %t5446, i64 257, i64 1
  br label %fixmerge1871
fixslow1870:
  %t5448 = call i64 @rt_num_eq(i64 %t5258, i64 744)
  br label %fixmerge1871
fixmerge1871:
  %t5449 = phi i64 [ %t5447, %fixfast1869 ], [ %t5448, %fixslow1870 ]
  br label %merge1868
merge1868:
  %t5450 = phi i64 [ %t5441, %then1866 ], [ %t5449, %fixmerge1871 ]
  %t5451 = icmp ne i64 %t5450, 1
  br i1 %t5451, label %then1872, label %else1873
then1872:
  %t5452 = call i64 @rt_intern(ptr @.str.sym.11)
  %t5453 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5453)
  %t5454 = and i64 %t5453, -8
  %t5455 = inttoptr i64 %t5454 to ptr
  %t5456 = load i64, ptr %t5455
  %t5457 = inttoptr i64 %t5456 to ptr
  %t5458 = musttail call fastcc i64 %t5457(i64 %t5453, i64 2, i64 %t5452, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5458
else1873:
  %t5459 = load i64, ptr @"emit.internal:rd-atom"
  call void @rt_check_callable(i64 %t5459)
  %t5460 = and i64 %t5459, -8
  %t5461 = inttoptr i64 %t5460 to ptr
  %t5462 = load i64, ptr %t5461
  %t5463 = inttoptr i64 %t5462 to ptr
  %t5464 = musttail call fastcc i64 %t5463(i64 %t5459, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5464
else1798:
  %t5465 = or i64 %a2, 0
  %t5466 = and i64 %t5465, 7
  %t5467 = icmp eq i64 %t5466, 0
  br i1 %t5467, label %fixfast1874, label %fixslow1875
fixfast1874:
  %t5468 = icmp slt i64 %a2, 0
  %t5469 = select i1 %t5468, i64 257, i64 1
  br label %fixmerge1876
fixslow1875:
  %t5470 = call i64 @rt_lt(i64 %a2, i64 0)
  br label %fixmerge1876
fixmerge1876:
  %t5471 = phi i64 [ %t5469, %fixfast1874 ], [ %t5470, %fixslow1875 ]
  %t5472 = icmp ne i64 %t5471, 1
  br i1 %t5472, label %then1877, label %else1878
then1877:
  %t5473 = call i64 @rt_intern(ptr @.str.sym.45)
  %t5474 = call i64 @rt_cons(i64 %t5473, i64 %a2)
  ret i64 %t5474
else1878:
  %t5475 = call i64 @rt_intern(ptr @.str.sym.20)
  %t5476 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t5476)
  %t5477 = and i64 %t5476, -8
  %t5478 = inttoptr i64 %t5477 to ptr
  %t5479 = load i64, ptr %t5478
  %t5480 = inttoptr i64 %t5479 to ptr
  %t5481 = musttail call fastcc i64 %t5480(i64 %t5476, i64 2, i64 %t5475, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5481
}

define fastcc i64 @"emit.internal:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5487 = icmp eq i64 %argc, 0
  br i1 %t5487, label %argok1880, label %arityerr1879
arityerr1879:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1880:
  %t5488 = load i64, ptr @"emit.internal:%port-rtd-cell"
  %t5489 = icmp ne i64 %t5488, 1
  br i1 %t5489, label %then1881, label %else1882
then1881:
  %t5490 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t5490
else1882:
  %t5491 = call i64 @rt_make_string(ptr @.str.lit.47, i64 4)
  %t5492 = call i64 @rt_make_record_type(i64 %t5491)
  %t5493 = call i64 @rt_root(i64 %t5492)
  store i64 %t5493, ptr @"emit.internal:%port-rtd-cell"
  %t5494 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t5494
}

define fastcc i64 @"emit.internal:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5499 = icmp eq i64 %argc, 6
  br i1 %t5499, label %argok1884, label %arityerr1883
arityerr1883:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1884:
  %t5500 = load i64, ptr @"emit.internal:%port-rtd"
  call void @rt_check_callable(i64 %t5500)
  %t5501 = and i64 %t5500, -8
  %t5502 = inttoptr i64 %t5501 to ptr
  %t5503 = load i64, ptr %t5502
  %t5504 = inttoptr i64 %t5503 to ptr
  %t5505 = call fastcc i64%t5504(i64 %t5500, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5506 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t5506)
  %t5507 = and i64 %t5506, -8
  %t5508 = inttoptr i64 %t5507 to ptr
  %t5509 = load i64, ptr %t5508
  %t5510 = inttoptr i64 %t5509 to ptr
  %t5511 = call fastcc i64%t5510(i64 %t5506, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5512 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t5512)
  %t5513 = and i64 %t5512, -8
  %t5514 = inttoptr i64 %t5513 to ptr
  %t5515 = load i64, ptr %t5514
  %t5516 = inttoptr i64 %t5515 to ptr
  %t5517 = call fastcc i64%t5516(i64 %t5512, i64 1, i64 %t5511, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5518 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t5518)
  %t5519 = and i64 %t5518, -8
  %t5520 = inttoptr i64 %t5519 to ptr
  %t5521 = load i64, ptr %t5520
  %t5522 = inttoptr i64 %t5521 to ptr
  %t5523 = call fastcc i64%t5522(i64 %t5518, i64 7, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %t5517, i64 0, ptr null)
  %t5524 = call i64 @rt_make_record(i64 %t5505, i64 %t5523)
  ret i64 %t5524
}

define fastcc i64 @"emit.internal:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5529 = icmp eq i64 %argc, 1
  br i1 %t5529, label %argok1886, label %arityerr1885
arityerr1885:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1886:
  %t5530 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t5531 = icmp ne i64 %t5530, 1
  br i1 %t5531, label %then1887, label %else1888
then1887:
  ret i64 %t5530
else1888:
  %t5532 = call i64 @rt_read_all_stdin()
  %t5533 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t5532)
  ret i64 %t5532
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
  %t188 = call ptr @rt_alloc_words(i64 1)
  %t189 = ptrtoint ptr %t188 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:cadddr" to i64), ptr %t188
  %t190 = or i64 %t189, 4
  %t191 = call i64 @rt_root(i64 %t190)
  store i64 %t191, ptr @"emit.internal:cadddr"
  ret i64 17
}

define i64 @"emit.internal:__init_17"() {
entry:
  %t280 = call ptr @rt_alloc_words(i64 1)
  %t281 = ptrtoint ptr %t280 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%digit-in-radix" to i64), ptr %t280
  %t282 = or i64 %t281, 4
  %t283 = call i64 @rt_root(i64 %t282)
  store i64 %t283, ptr @"emit.internal:%digit-in-radix"
  ret i64 17
}

define i64 @"emit.internal:__init_18"() {
entry:
  %t332 = call ptr @rt_alloc_words(i64 1)
  %t333 = ptrtoint ptr %t332 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%radix-digits" to i64), ptr %t332
  %t334 = or i64 %t333, 4
  %t335 = call i64 @rt_root(i64 %t334)
  store i64 %t335, ptr @"emit.internal:%radix-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_19"() {
entry:
  %t402 = call ptr @rt_alloc_words(i64 1)
  %t403 = ptrtoint ptr %t402 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%string->int" to i64), ptr %t402
  %t404 = or i64 %t403, 4
  %t405 = call i64 @rt_root(i64 %t404)
  store i64 %t405, ptr @"emit.internal:%string->int"
  ret i64 17
}

define i64 @"emit.internal:__init_20"() {
entry:
  %t443 = call ptr @rt_alloc_words(i64 1)
  %t444 = ptrtoint ptr %t443 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list->vector" to i64), ptr %t443
  %t445 = or i64 %t444, 4
  %t446 = call i64 @rt_root(i64 %t445)
  store i64 %t446, ptr @"emit.internal:list->vector"
  ret i64 17
}

define i64 @"emit.internal:__init_21"() {
entry:
  %t484 = call ptr @rt_alloc_words(i64 1)
  %t485 = ptrtoint ptr %t484 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list->bytevector" to i64), ptr %t484
  %t486 = or i64 %t485, 4
  %t487 = call i64 @rt_root(i64 %t486)
  store i64 %t487, ptr @"emit.internal:list->bytevector"
  ret i64 17
}

define i64 @"emit.internal:__init_22"() {
entry:
  %t521 = call ptr @rt_alloc_words(i64 1)
  %t522 = ptrtoint ptr %t521 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-ws?" to i64), ptr %t521
  %t523 = or i64 %t522, 4
  %t524 = call i64 @rt_root(i64 %t523)
  store i64 %t524, ptr @"emit.internal:rd-ws?"
  ret i64 17
}

define i64 @"emit.internal:__init_23"() {
entry:
  %t542 = call ptr @rt_alloc_words(i64 1)
  %t543 = ptrtoint ptr %t542 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digit?" to i64), ptr %t542
  %t544 = or i64 %t543, 4
  %t545 = call i64 @rt_root(i64 %t544)
  store i64 %t545, ptr @"emit.internal:rd-digit?"
  ret i64 17
}

define i64 @"emit.internal:__init_24"() {
entry:
  %t602 = call ptr @rt_alloc_words(i64 1)
  %t603 = ptrtoint ptr %t602 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-delim?" to i64), ptr %t602
  %t604 = or i64 %t603, 4
  %t605 = call i64 @rt_root(i64 %t604)
  store i64 %t605, ptr @"emit.internal:rd-delim?"
  ret i64 17
}

define i64 @"emit.internal:__init_25"() {
entry:
  %t615 = call ptr @rt_alloc_words(i64 1)
  %t616 = ptrtoint ptr %t615 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail-code" to i64), ptr %t615
  %t617 = or i64 %t616, 4
  %t618 = call i64 @rt_root(i64 %t617)
  store i64 %t618, ptr @"emit.internal:rd-fail-code"
  ret i64 17
}

define i64 @"emit.internal:__init_26"() {
entry:
  %t627 = call ptr @rt_alloc_words(i64 1)
  %t628 = ptrtoint ptr %t627 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail?" to i64), ptr %t627
  %t629 = or i64 %t628, 4
  %t630 = call i64 @rt_root(i64 %t629)
  store i64 %t630, ptr @"emit.internal:rd-fail?"
  ret i64 17
}

define i64 @"emit.internal:__init_27"() {
entry:
  %t648 = call ptr @rt_alloc_words(i64 1)
  %t649 = ptrtoint ptr %t648 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail-pos" to i64), ptr %t648
  %t650 = or i64 %t649, 4
  %t651 = call i64 @rt_root(i64 %t650)
  store i64 %t651, ptr @"emit.internal:rd-fail-pos"
  ret i64 17
}

define i64 @"emit.internal:__init_28"() {
entry:
  %t660 = call ptr @rt_alloc_words(i64 1)
  %t661 = ptrtoint ptr %t660 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fail" to i64), ptr %t660
  %t662 = or i64 %t661, 4
  %t663 = call i64 @rt_root(i64 %t662)
  store i64 %t663, ptr @"emit.internal:rd-fail"
  ret i64 17
}

define i64 @"emit.internal:__init_29"() {
entry:
  %t701 = call ptr @rt_alloc_words(i64 1)
  %t702 = ptrtoint ptr %t701 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-state" to i64), ptr %t701
  %t703 = or i64 %t702, 4
  %t704 = call i64 @rt_root(i64 %t703)
  store i64 %t704, ptr @"emit.internal:rd-state"
  ret i64 17
}

define i64 @"emit.internal:__init_30"() {
entry:
  %t730 = call ptr @rt_alloc_words(i64 1)
  %t731 = ptrtoint ptr %t730 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-state-from-cell" to i64), ptr %t730
  %t732 = or i64 %t731, 4
  %t733 = call i64 @rt_root(i64 %t732)
  store i64 %t733, ptr @"emit.internal:rd-state-from-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_31"() {
entry:
  %t742 = call ptr @rt_alloc_words(i64 1)
  %t743 = ptrtoint ptr %t742 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-state-child" to i64), ptr %t742
  %t744 = or i64 %t743, 4
  %t745 = call i64 @rt_root(i64 %t744)
  store i64 %t745, ptr @"emit.internal:rd-state-child"
  ret i64 17
}

define i64 @"emit.internal:__init_32"() {
entry:
  %t749 = call ptr @rt_alloc_words(i64 1)
  %t750 = ptrtoint ptr %t749 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold?" to i64), ptr %t749
  %t751 = or i64 %t750, 4
  %t752 = call i64 @rt_root(i64 %t751)
  store i64 %t752, ptr @"emit.internal:rd-fold?"
  ret i64 17
}

define i64 @"emit.internal:__init_33"() {
entry:
  %t756 = call ptr @rt_alloc_words(i64 1)
  %t757 = ptrtoint ptr %t756 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-set-fold!" to i64), ptr %t756
  %t758 = or i64 %t757, 4
  %t759 = call i64 @rt_root(i64 %t758)
  store i64 %t759, ptr @"emit.internal:rd-set-fold!"
  ret i64 17
}

define i64 @"emit.internal:__init_34"() {
entry:
  %t850 = call ptr @rt_alloc_words(i64 1)
  %t851 = ptrtoint ptr %t850 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-match-at?" to i64), ptr %t850
  %t852 = or i64 %t851, 4
  %t853 = call i64 @rt_root(i64 %t852)
  store i64 %t853, ptr @"emit.internal:rd-match-at?"
  ret i64 17
}

define i64 @"emit.internal:__init_35"() {
entry:
  %t888 = call ptr @rt_alloc_words(i64 1)
  %t889 = ptrtoint ptr %t888 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-directive-end" to i64), ptr %t888
  %t890 = or i64 %t889, 4
  %t891 = call i64 @rt_root(i64 %t890)
  store i64 %t891, ptr @"emit.internal:rd-directive-end"
  ret i64 17
}

define i64 @"emit.internal:__init_36"() {
entry:
  %t933 = call ptr @rt_alloc_words(i64 1)
  %t934 = ptrtoint ptr %t933 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-line" to i64), ptr %t933
  %t935 = or i64 %t934, 4
  %t936 = call i64 @rt_root(i64 %t935)
  store i64 %t936, ptr @"emit.internal:rd-skip-line"
  ret i64 17
}

define i64 @"emit.internal:__init_37"() {
entry:
  %t981 = call ptr @rt_alloc_words(i64 1)
  %t982 = ptrtoint ptr %t981 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-block-open?" to i64), ptr %t981
  %t983 = or i64 %t982, 4
  %t984 = call i64 @rt_root(i64 %t983)
  store i64 %t984, ptr @"emit.internal:rd-block-open?"
  ret i64 17
}

define i64 @"emit.internal:__init_38"() {
entry:
  %t1128 = call ptr @rt_alloc_words(i64 1)
  %t1129 = ptrtoint ptr %t1128 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-block" to i64), ptr %t1128
  %t1130 = or i64 %t1129, 4
  %t1131 = call i64 @rt_root(i64 %t1130)
  store i64 %t1131, ptr @"emit.internal:rd-skip-block"
  ret i64 17
}

define i64 @"emit.internal:__init_39"() {
entry:
  %t1284 = call ptr @rt_alloc_words(i64 1)
  %t1285 = ptrtoint ptr %t1284 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-ws" to i64), ptr %t1284
  %t1286 = or i64 %t1285, 4
  %t1287 = call i64 @rt_root(i64 %t1286)
  store i64 %t1287, ptr @"emit.internal:rd-skip-ws"
  ret i64 17
}

define i64 @"emit.internal:__init_40"() {
entry:
  %t1319 = call ptr @rt_alloc_words(i64 1)
  %t1320 = ptrtoint ptr %t1319 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-end" to i64), ptr %t1319
  %t1321 = or i64 %t1320, 4
  %t1322 = call i64 @rt_root(i64 %t1321)
  store i64 %t1322, ptr @"emit.internal:rd-token-end"
  ret i64 17
}

define i64 @"emit.internal:__init_41"() {
entry:
  %t1354 = call ptr @rt_alloc_words(i64 1)
  %t1355 = ptrtoint ptr %t1354 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-all-digits?" to i64), ptr %t1354
  %t1356 = or i64 %t1355, 4
  %t1357 = call i64 @rt_root(i64 %t1356)
  store i64 %t1357, ptr @"emit.internal:rd-all-digits?"
  ret i64 17
}

define i64 @"emit.internal:__init_42"() {
entry:
  %t1415 = call ptr @rt_alloc_words(i64 1)
  %t1416 = ptrtoint ptr %t1415 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-numeric?" to i64), ptr %t1415
  %t1417 = or i64 %t1416, 4
  %t1418 = call i64 @rt_root(i64 %t1417)
  store i64 %t1418, ptr @"emit.internal:rd-numeric?"
  ret i64 17
}

define i64 @"emit.internal:__init_43"() {
entry:
  %t1469 = call ptr @rt_alloc_words(i64 1)
  %t1470 = ptrtoint ptr %t1469 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits" to i64), ptr %t1469
  %t1471 = or i64 %t1470, 4
  %t1472 = call i64 @rt_root(i64 %t1471)
  store i64 %t1472, ptr @"emit.internal:rd-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_44"() {
entry:
  %t1523 = call ptr @rt_alloc_words(i64 1)
  %t1524 = ptrtoint ptr %t1523 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits-neg" to i64), ptr %t1523
  %t1525 = or i64 %t1524, 4
  %t1526 = call i64 @rt_root(i64 %t1525)
  store i64 %t1526, ptr @"emit.internal:rd-digits-neg"
  ret i64 17
}

define i64 @"emit.internal:__init_45"() {
entry:
  %t1565 = call ptr @rt_alloc_words(i64 1)
  %t1566 = ptrtoint ptr %t1565 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-parse-int" to i64), ptr %t1565
  %t1567 = or i64 %t1566, 4
  %t1568 = call i64 @rt_root(i64 %t1567)
  store i64 %t1568, ptr @"emit.internal:rd-parse-int"
  ret i64 17
}

define i64 @"emit.internal:__init_46"() {
entry:
  %t1578 = call ptr @rt_alloc_words(i64 1)
  %t1579 = ptrtoint ptr %t1578 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dotchar?" to i64), ptr %t1578
  %t1580 = or i64 %t1579, 4
  %t1581 = call i64 @rt_root(i64 %t1580)
  store i64 %t1581, ptr @"emit.internal:rd-dotchar?"
  ret i64 17
}

define i64 @"emit.internal:__init_47"() {
entry:
  %t1599 = call ptr @rt_alloc_words(i64 1)
  %t1600 = ptrtoint ptr %t1599 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exp-char?" to i64), ptr %t1599
  %t1601 = or i64 %t1600, 4
  %t1602 = call i64 @rt_root(i64 %t1601)
  store i64 %t1602, ptr @"emit.internal:rd-exp-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_48"() {
entry:
  %t1620 = call ptr @rt_alloc_words(i64 1)
  %t1621 = ptrtoint ptr %t1620 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-sign-char?" to i64), ptr %t1620
  %t1622 = or i64 %t1621, 4
  %t1623 = call i64 @rt_root(i64 %t1622)
  store i64 %t1623, ptr @"emit.internal:rd-sign-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_49"() {
entry:
  %t1656 = call ptr @rt_alloc_words(i64 1)
  %t1657 = ptrtoint ptr %t1656 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-digits" to i64), ptr %t1656
  %t1658 = or i64 %t1657, 4
  %t1659 = call i64 @rt_root(i64 %t1658)
  store i64 %t1659, ptr @"emit.internal:rd-scan-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_50"() {
entry:
  %t1848 = call ptr @rt_alloc_words(i64 1)
  %t1849 = ptrtoint ptr %t1848 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-flonum?" to i64), ptr %t1848
  %t1850 = or i64 %t1849, 4
  %t1851 = call i64 @rt_root(i64 %t1850)
  store i64 %t1851, ptr @"emit.internal:rd-flonum?"
  ret i64 17
}

define i64 @"emit.internal:__init_51"() {
entry:
  %t1919 = call ptr @rt_alloc_words(i64 1)
  %t1920 = ptrtoint ptr %t1919 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-ci=?" to i64), ptr %t1919
  %t1921 = or i64 %t1920, 4
  %t1922 = call i64 @rt_root(i64 %t1921)
  store i64 %t1922, ptr @"emit.internal:rd-ci=?"
  ret i64 17
}

define i64 @"emit.internal:__init_52"() {
entry:
  %t1954 = call ptr @rt_alloc_words(i64 1)
  %t1955 = ptrtoint ptr %t1954 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-nonfinite" to i64), ptr %t1954
  %t1956 = or i64 %t1955, 4
  %t1957 = call i64 @rt_root(i64 %t1956)
  store i64 %t1957, ptr @"emit.internal:rd-nonfinite"
  ret i64 17
}

define i64 @"emit.internal:__init_53"() {
entry:
  %t2028 = call ptr @rt_alloc_words(i64 1)
  %t2029 = ptrtoint ptr %t2028 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-letter" to i64), ptr %t2028
  %t2030 = or i64 %t2029, 4
  %t2031 = call i64 @rt_root(i64 %t2030)
  store i64 %t2031, ptr @"emit.internal:rd-radix-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_54"() {
entry:
  %t2068 = call ptr @rt_alloc_words(i64 1)
  %t2069 = ptrtoint ptr %t2068 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-letter" to i64), ptr %t2068
  %t2070 = or i64 %t2069, 4
  %t2071 = call i64 @rt_root(i64 %t2070)
  store i64 %t2071, ptr @"emit.internal:rd-exactness-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_55"() {
entry:
  %t2172 = call ptr @rt_alloc_words(i64 1)
  %t2173 = ptrtoint ptr %t2172 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-prefixes" to i64), ptr %t2172
  %t2174 = or i64 %t2173, 4
  %t2175 = call i64 @rt_root(i64 %t2174)
  store i64 %t2175, ptr @"emit.internal:rd-scan-prefixes"
  ret i64 17
}

define i64 @"emit.internal:__init_56"() {
entry:
  %t2208 = call ptr @rt_alloc_words(i64 1)
  %t2209 = ptrtoint ptr %t2208 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-scan" to i64), ptr %t2208
  %t2210 = or i64 %t2209, 4
  %t2211 = call i64 @rt_root(i64 %t2210)
  store i64 %t2211, ptr @"emit.internal:rd-radix-scan"
  ret i64 17
}

define i64 @"emit.internal:__init_57"() {
entry:
  %t2308 = call ptr @rt_alloc_words(i64 1)
  %t2309 = ptrtoint ptr %t2308 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-rational-body?" to i64), ptr %t2308
  %t2310 = or i64 %t2309, 4
  %t2311 = call i64 @rt_root(i64 %t2310)
  store i64 %t2311, ptr @"emit.internal:rd-rational-body?"
  ret i64 17
}

define i64 @"emit.internal:__init_58"() {
entry:
  %t2337 = call ptr @rt_alloc_words(i64 1)
  %t2338 = ptrtoint ptr %t2337 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-apply" to i64), ptr %t2337
  %t2339 = or i64 %t2338, 4
  %t2340 = call i64 @rt_root(i64 %t2339)
  store i64 %t2340, ptr @"emit.internal:rd-exactness-apply"
  ret i64 17
}

define i64 @"emit.internal:__init_59"() {
entry:
  %t2423 = call ptr @rt_alloc_words(i64 1)
  %t2424 = ptrtoint ptr %t2423 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-body-number" to i64), ptr %t2423
  %t2425 = or i64 %t2424, 4
  %t2426 = call i64 @rt_root(i64 %t2425)
  store i64 %t2426, ptr @"emit.internal:rd-body-number"
  ret i64 17
}

define i64 @"emit.internal:__init_60"() {
entry:
  %t2509 = call ptr @rt_alloc_words(i64 1)
  %t2510 = ptrtoint ptr %t2509 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number" to i64), ptr %t2509
  %t2511 = or i64 %t2510, 4
  %t2512 = call i64 @rt_root(i64 %t2511)
  store i64 %t2512, ptr @"emit.internal:rd-number"
  ret i64 17
}

define i64 @"emit.internal:__init_61"() {
entry:
  %t2519 = call ptr @rt_alloc_words(i64 1)
  %t2520 = ptrtoint ptr %t2519 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number-reason?" to i64), ptr %t2519
  %t2521 = or i64 %t2520, 4
  %t2522 = call i64 @rt_root(i64 %t2521)
  store i64 %t2522, ptr @"emit.internal:rd-number-reason?"
  ret i64 17
}

define i64 @"emit.internal:__init_62"() {
entry:
  %t2551 = call ptr @rt_alloc_words(i64 1)
  %t2552 = ptrtoint ptr %t2551 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-char" to i64), ptr %t2551
  %t2553 = or i64 %t2552, 4
  %t2554 = call i64 @rt_root(i64 %t2553)
  store i64 %t2554, ptr @"emit.internal:rd-fold-char"
  ret i64 17
}

define i64 @"emit.internal:__init_63"() {
entry:
  %t2605 = call ptr @rt_alloc_words(i64 1)
  %t2606 = ptrtoint ptr %t2605 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-token" to i64), ptr %t2605
  %t2607 = or i64 %t2606, 4
  %t2608 = call i64 @rt_root(i64 %t2607)
  store i64 %t2608, ptr @"emit.internal:rd-fold-token"
  ret i64 17
}

define i64 @"emit.internal:__init_64"() {
entry:
  %t2671 = call ptr @rt_alloc_words(i64 1)
  %t2672 = ptrtoint ptr %t2671 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-atom" to i64), ptr %t2671
  %t2673 = or i64 %t2672, 4
  %t2674 = call i64 @rt_root(i64 %t2673)
  store i64 %t2674, ptr @"emit.internal:rd-atom"
  ret i64 17
}

define i64 @"emit.internal:__init_65"() {
entry:
  %t2718 = call ptr @rt_alloc_words(i64 1)
  %t2719 = ptrtoint ptr %t2718 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-at" to i64), ptr %t2718
  %t2720 = or i64 %t2719, 4
  %t2721 = call i64 @rt_root(i64 %t2720)
  store i64 %t2721, ptr @"emit.internal:rd-token-at"
  ret i64 17
}

define i64 @"emit.internal:__init_66"() {
entry:
  %t2799 = call ptr @rt_alloc_words(i64 1)
  %t2800 = ptrtoint ptr %t2799 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit" to i64), ptr %t2799
  %t2801 = or i64 %t2800, 4
  %t2802 = call i64 @rt_root(i64 %t2801)
  store i64 %t2802, ptr @"emit.internal:rd-hex-digit"
  ret i64 17
}

define i64 @"emit.internal:__init_67"() {
entry:
  %t2856 = call ptr @rt_alloc_words(i64 1)
  %t2857 = ptrtoint ptr %t2856 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit?" to i64), ptr %t2856
  %t2858 = or i64 %t2857, 4
  %t2859 = call i64 @rt_root(i64 %t2858)
  store i64 %t2859, ptr @"emit.internal:rd-hex-digit?"
  ret i64 17
}

define i64 @"emit.internal:__init_68"() {
entry:
  %t2927 = call ptr @rt_alloc_words(i64 1)
  %t2928 = ptrtoint ptr %t2927 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex" to i64), ptr %t2927
  %t2929 = or i64 %t2928, 4
  %t2930 = call i64 @rt_root(i64 %t2929)
  store i64 %t2930, ptr @"emit.internal:rd-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_69"() {
entry:
  %t2978 = call ptr @rt_alloc_words(i64 1)
  %t2979 = ptrtoint ptr %t2978 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-str-esc" to i64), ptr %t2978
  %t2980 = or i64 %t2979, 4
  %t2981 = call i64 @rt_root(i64 %t2980)
  store i64 %t2981, ptr @"emit.internal:rd-str-esc"
  ret i64 17
}

define i64 @"emit.internal:__init_70"() {
entry:
  %t3024 = call ptr @rt_alloc_words(i64 1)
  %t3025 = ptrtoint ptr %t3024 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-intraline" to i64), ptr %t3024
  %t3026 = or i64 %t3025, 4
  %t3027 = call i64 @rt_root(i64 %t3026)
  store i64 %t3027, ptr @"emit.internal:rd-intraline"
  ret i64 17
}

define i64 @"emit.internal:__init_71"() {
entry:
  %t3141 = call ptr @rt_alloc_words(i64 1)
  %t3142 = ptrtoint ptr %t3141 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-line-continuation" to i64), ptr %t3141
  %t3143 = or i64 %t3142, 4
  %t3144 = call i64 @rt_root(i64 %t3143)
  store i64 %t3144, ptr @"emit.internal:rd-line-continuation"
  ret i64 17
}

define i64 @"emit.internal:__init_72"() {
entry:
  %t3355 = call ptr @rt_alloc_words(i64 1)
  %t3356 = ptrtoint ptr %t3355 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-string" to i64), ptr %t3355
  %t3357 = or i64 %t3356, 4
  %t3358 = call i64 @rt_root(i64 %t3357)
  store i64 %t3358, ptr @"emit.internal:rd-string"
  ret i64 17
}

define i64 @"emit.internal:__init_73"() {
entry:
  %t3387 = call ptr @rt_alloc_words(i64 1)
  %t3388 = ptrtoint ptr %t3387 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label-find" to i64), ptr %t3387
  %t3389 = or i64 %t3388, 4
  %t3390 = call i64 @rt_root(i64 %t3389)
  store i64 %t3390, ptr @"emit.internal:rd-label-find"
  ret i64 17
}

define i64 @"emit.internal:__init_74"() {
entry:
  %t3409 = call ptr @rt_alloc_words(i64 1)
  %t3410 = ptrtoint ptr %t3409 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label-add!" to i64), ptr %t3409
  %t3411 = or i64 %t3410, 4
  %t3412 = call i64 @rt_root(i64 %t3411)
  store i64 %t3412, ptr @"emit.internal:rd-label-add!"
  ret i64 17
}

define i64 @"emit.internal:__init_75"() {
entry:
  %t3427 = call ptr @rt_alloc_words(i64 1)
  %t3428 = ptrtoint ptr %t3427 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-placeholder" to i64), ptr %t3427
  %t3429 = or i64 %t3428, 4
  %t3430 = call i64 @rt_root(i64 %t3429)
  store i64 %t3430, ptr @"emit.internal:rd-placeholder"
  ret i64 17
}

define i64 @"emit.internal:__init_76"() {
entry:
  %t3446 = call ptr @rt_alloc_words(i64 1)
  %t3447 = ptrtoint ptr %t3446 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-placeholder?" to i64), ptr %t3446
  %t3448 = or i64 %t3447, 4
  %t3449 = call i64 @rt_root(i64 %t3448)
  store i64 %t3449, ptr @"emit.internal:rd-placeholder?"
  ret i64 17
}

define i64 @"emit.internal:__init_77"() {
entry:
  %t3452 = call ptr @rt_alloc_words(i64 1)
  %t3453 = ptrtoint ptr %t3452 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-placeholder-entry" to i64), ptr %t3452
  %t3454 = or i64 %t3453, 4
  %t3455 = call i64 @rt_root(i64 %t3454)
  store i64 %t3455, ptr @"emit.internal:rd-placeholder-entry"
  ret i64 17
}

define i64 @"emit.internal:__init_78"() {
entry:
  %t3469 = call ptr @rt_alloc_words(i64 1)
  %t3470 = ptrtoint ptr %t3469 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-seen?" to i64), ptr %t3469
  %t3471 = or i64 %t3470, 4
  %t3472 = call i64 @rt_root(i64 %t3471)
  store i64 %t3472, ptr @"emit.internal:rd-seen?"
  ret i64 17
}

define i64 @"emit.internal:__init_79"() {
entry:
  %t3505 = call ptr @rt_alloc_words(i64 1)
  %t3506 = ptrtoint ptr %t3505 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label-scan" to i64), ptr %t3505
  %t3507 = or i64 %t3506, 4
  %t3508 = call i64 @rt_root(i64 %t3507)
  store i64 %t3508, ptr @"emit.internal:rd-label-scan"
  ret i64 17
}

define i64 @"emit.internal:__init_80"() {
entry:
  %t3627 = call ptr @rt_alloc_words(i64 1)
  %t3628 = ptrtoint ptr %t3627 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-resolve" to i64), ptr %t3627
  %t3629 = or i64 %t3628, 4
  %t3630 = call i64 @rt_root(i64 %t3629)
  store i64 %t3630, ptr @"emit.internal:rd-resolve"
  ret i64 17
}

define i64 @"emit.internal:__init_81"() {
entry:
  %t3649 = call ptr @rt_alloc_words(i64 1)
  %t3650 = ptrtoint ptr %t3649 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-finish" to i64), ptr %t3649
  %t3651 = or i64 %t3650, 4
  %t3652 = call i64 @rt_root(i64 %t3651)
  store i64 %t3652, ptr @"emit.internal:rd-finish"
  ret i64 17
}

define i64 @"emit.internal:__init_82"() {
entry:
  %t3918 = call ptr @rt_alloc_words(i64 1)
  %t3919 = ptrtoint ptr %t3918 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-label" to i64), ptr %t3918
  %t3920 = or i64 %t3919, 4
  %t3921 = call i64 @rt_root(i64 %t3920)
  store i64 %t3921, ptr @"emit.internal:rd-label"
  ret i64 17
}

define i64 @"emit.internal:__init_83"() {
entry:
  %t4325 = call ptr @rt_alloc_words(i64 1)
  %t4326 = ptrtoint ptr %t4325 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hash" to i64), ptr %t4325
  %t4327 = or i64 %t4326, 4
  %t4328 = call i64 @rt_root(i64 %t4327)
  store i64 %t4328, ptr @"emit.internal:rd-hash"
  ret i64 17
}

define i64 @"emit.internal:__init_84"() {
entry:
  %t4382 = call ptr @rt_alloc_words(i64 1)
  %t4383 = ptrtoint ptr %t4382 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-name" to i64), ptr %t4382
  %t4384 = or i64 %t4383, 4
  %t4385 = call i64 @rt_root(i64 %t4384)
  store i64 %t4385, ptr @"emit.internal:rd-char-name"
  ret i64 17
}

define i64 @"emit.internal:__init_85"() {
entry:
  %t4462 = call ptr @rt_alloc_words(i64 1)
  %t4463 = ptrtoint ptr %t4462 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-hex" to i64), ptr %t4462
  %t4464 = or i64 %t4463, 4
  %t4465 = call i64 @rt_root(i64 %t4464)
  store i64 %t4465, ptr @"emit.internal:rd-char-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_86"() {
entry:
  %t4547 = call ptr @rt_alloc_words(i64 1)
  %t4548 = ptrtoint ptr %t4547 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char" to i64), ptr %t4547
  %t4549 = or i64 %t4548, 4
  %t4550 = call i64 @rt_root(i64 %t4549)
  store i64 %t4550, ptr @"emit.internal:rd-char"
  ret i64 17
}

define i64 @"emit.internal:__init_87"() {
entry:
  %t4719 = call ptr @rt_alloc_words(i64 1)
  %t4720 = ptrtoint ptr %t4719 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-bar" to i64), ptr %t4719
  %t4721 = or i64 %t4720, 4
  %t4722 = call i64 @rt_root(i64 %t4721)
  store i64 %t4722, ptr @"emit.internal:rd-bar"
  ret i64 17
}

define i64 @"emit.internal:__init_88"() {
entry:
  %t4754 = call ptr @rt_alloc_words(i64 1)
  %t4755 = ptrtoint ptr %t4754 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quote" to i64), ptr %t4754
  %t4756 = or i64 %t4755, 4
  %t4757 = call i64 @rt_root(i64 %t4756)
  store i64 %t4757, ptr @"emit.internal:rd-quote"
  ret i64 17
}

define i64 @"emit.internal:__init_89"() {
entry:
  %t4789 = call ptr @rt_alloc_words(i64 1)
  %t4790 = ptrtoint ptr %t4789 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quasi" to i64), ptr %t4789
  %t4791 = or i64 %t4790, 4
  %t4792 = call i64 @rt_root(i64 %t4791)
  store i64 %t4792, ptr @"emit.internal:rd-quasi"
  ret i64 17
}

define i64 @"emit.internal:__init_90"() {
entry:
  %t4881 = call ptr @rt_alloc_words(i64 1)
  %t4882 = ptrtoint ptr %t4881 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-unquote" to i64), ptr %t4881
  %t4883 = or i64 %t4882, 4
  %t4884 = call i64 @rt_root(i64 %t4883)
  store i64 %t4884, ptr @"emit.internal:rd-unquote"
  ret i64 17
}

define i64 @"emit.internal:__init_91"() {
entry:
  %t4925 = call ptr @rt_alloc_words(i64 1)
  %t4926 = ptrtoint ptr %t4925 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dot?" to i64), ptr %t4925
  %t4927 = or i64 %t4926, 4
  %t4928 = call i64 @rt_root(i64 %t4927)
  store i64 %t4928, ptr @"emit.internal:rd-dot?"
  ret i64 17
}

define i64 @"emit.internal:__init_92"() {
entry:
  %t4941 = call ptr @rt_alloc_words(i64 1)
  %t4942 = ptrtoint ptr %t4941 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-append-reverse" to i64), ptr %t4941
  %t4943 = or i64 %t4942, 4
  %t4944 = call i64 @rt_root(i64 %t4943)
  store i64 %t4944, ptr @"emit.internal:rd-append-reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_93"() {
entry:
  %t4989 = call ptr @rt_alloc_words(i64 1)
  %t4990 = ptrtoint ptr %t4989 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum-comment?" to i64), ptr %t4989
  %t4991 = or i64 %t4990, 4
  %t4992 = call i64 @rt_root(i64 %t4991)
  store i64 %t4992, ptr @"emit.internal:rd-datum-comment?"
  ret i64 17
}

define i64 @"emit.internal:__init_94"() {
entry:
  %t5226 = call ptr @rt_alloc_words(i64 1)
  %t5227 = ptrtoint ptr %t5226 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-list" to i64), ptr %t5226
  %t5228 = or i64 %t5227, 4
  %t5229 = call i64 @rt_root(i64 %t5228)
  store i64 %t5229, ptr @"emit.internal:rd-list"
  ret i64 17
}

define i64 @"emit.internal:__init_95"() {
entry:
  %t5482 = call ptr @rt_alloc_words(i64 1)
  %t5483 = ptrtoint ptr %t5482 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum" to i64), ptr %t5482
  %t5484 = or i64 %t5483, 4
  %t5485 = call i64 @rt_root(i64 %t5484)
  store i64 %t5485, ptr @"emit.internal:rd-datum"
  ret i64 17
}

define i64 @"emit.internal:__init_96"() {
entry:
  %t5486 = call i64 @rt_root(i64 1)
  store i64 %t5486, ptr @"emit.internal:%port-rtd-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_97"() {
entry:
  %t5495 = call ptr @rt_alloc_words(i64 1)
  %t5496 = ptrtoint ptr %t5495 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-rtd" to i64), ptr %t5495
  %t5497 = or i64 %t5496, 4
  %t5498 = call i64 @rt_root(i64 %t5497)
  store i64 %t5498, ptr @"emit.internal:%port-rtd"
  ret i64 17
}

define i64 @"emit.internal:__init_98"() {
entry:
  %t5525 = call ptr @rt_alloc_words(i64 1)
  %t5526 = ptrtoint ptr %t5525 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%make-port" to i64), ptr %t5525
  %t5527 = or i64 %t5526, 4
  %t5528 = call i64 @rt_root(i64 %t5527)
  store i64 %t5528, ptr @"emit.internal:%make-port"
  ret i64 17
}

define i64 @"emit.internal:__init_99"() {
entry:
  %t5534 = call ptr @rt_alloc_words(i64 1)
  %t5535 = ptrtoint ptr %t5534 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-buf" to i64), ptr %t5534
  %t5536 = or i64 %t5535, 4
  %t5537 = call i64 @rt_root(i64 %t5536)
  store i64 %t5537, ptr @"emit.internal:%port-buf"
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

