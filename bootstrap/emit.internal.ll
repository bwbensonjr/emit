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

@.str.lit.0 = private unnamed_addr constant [7 x i8] c"+inf.0\00"
@.str.lit.1 = private unnamed_addr constant [4 x i8] c"inf\00"
@.str.lit.2 = private unnamed_addr constant [7 x i8] c"-inf.0\00"
@.str.lit.3 = private unnamed_addr constant [5 x i8] c"-inf\00"
@.str.lit.4 = private unnamed_addr constant [7 x i8] c"+nan.0\00"
@.str.lit.5 = private unnamed_addr constant [4 x i8] c"nan\00"
@.str.sym.6 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.sym.7 = private unnamed_addr constant [16 x i8] c"rd-not-a-number\00"
@.str.sym.8 = private unnamed_addr constant [14 x i8] c"rd-bad-number\00"
@.str.sym.9 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.10 = private unnamed_addr constant [1 x i8] c"\00"
@.str.sym.11 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.sym.12 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.13 = private unnamed_addr constant [2 x i8] c"t\00"
@.str.lit.14 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.lit.15 = private unnamed_addr constant [2 x i8] c"f\00"
@.str.lit.16 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.sym.17 = private unnamed_addr constant [14 x i8] c"rd-hash-token\00"
@.str.lit.18 = private unnamed_addr constant [6 x i8] c"alarm\00"
@.str.lit.19 = private unnamed_addr constant [10 x i8] c"backspace\00"
@.str.lit.20 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.21 = private unnamed_addr constant [7 x i8] c"escape\00"
@.str.lit.22 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.23 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.24 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.25 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.26 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.27 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.28 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.29 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.lit.30 = private unnamed_addr constant [5 x i8] c"page\00"
@.str.sym.31 = private unnamed_addr constant [13 x i8] c"rd-char-name\00"
@.str.sym.32 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.sym.33 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.34 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.35 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.36 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.sym.37 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.sym.38 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.39 = private unnamed_addr constant [5 x i8] c"port\00"
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

define fastcc i64 @"emit.internal:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t664 = icmp eq i64 %argc, 3
  br i1 %t664, label %argok248, label %arityerr247
arityerr247:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok248:
  %t665 = or i64 %a2, %a1
  %t666 = and i64 %t665, 7
  %t667 = icmp eq i64 %t666, 0
  br i1 %t667, label %fixfast249, label %fixslow250
fixfast249:
  %t668 = icmp slt i64 %a2, %a1
  %t669 = select i1 %t668, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t670 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge251
fixmerge251:
  %t671 = phi i64 [ %t669, %fixfast249 ], [ %t670, %fixslow250 ]
  %t672 = icmp ne i64 %t671, 1
  br i1 %t672, label %then252, label %else253
then252:
  %t673 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t674 = call i64 @rt_char_to_integer(i64 %t673)
  %t675 = or i64 %t674, 80
  %t676 = and i64 %t675, 7
  %t677 = icmp eq i64 %t676, 0
  br i1 %t677, label %fixfast254, label %fixslow255
fixfast254:
  %t678 = icmp eq i64 %t674, 80
  %t679 = select i1 %t678, i64 257, i64 1
  br label %fixmerge256
fixslow255:
  %t680 = call i64 @rt_num_eq(i64 %t674, i64 80)
  br label %fixmerge256
fixmerge256:
  %t681 = phi i64 [ %t679, %fixfast254 ], [ %t680, %fixslow255 ]
  %t682 = icmp ne i64 %t681, 1
  br i1 %t682, label %then257, label %else258
then257:
  %t683 = or i64 %a2, 8
  %t684 = and i64 %t683, 7
  %t685 = icmp eq i64 %t684, 0
  br i1 %t685, label %fixfast259, label %fixslow260
fixfast259:
  %t686 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t687 = extractvalue {i64, i1} %t686, 0
  %t688 = extractvalue {i64, i1} %t686, 1
  br i1 %t688, label %fixslow260, label %fixmerge261
fixslow260:
  %t689 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge261
fixmerge261:
  %t690 = phi i64 [ %t687, %fixfast259 ], [ %t689, %fixslow260 ]
  ret i64 %t690
else258:
  %t691 = or i64 %a2, 8
  %t692 = and i64 %t691, 7
  %t693 = icmp eq i64 %t692, 0
  br i1 %t693, label %fixfast262, label %fixslow263
fixfast262:
  %t694 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t695 = extractvalue {i64, i1} %t694, 0
  %t696 = extractvalue {i64, i1} %t694, 1
  br i1 %t696, label %fixslow263, label %fixmerge264
fixslow263:
  %t697 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge264
fixmerge264:
  %t698 = phi i64 [ %t695, %fixfast262 ], [ %t697, %fixslow263 ]
  %t699 = load i64, ptr @"emit.internal:rd-skip-line"
  call void @rt_check_callable(i64 %t699)
  %t700 = and i64 %t699, -8
  %t701 = inttoptr i64 %t700 to ptr
  %t702 = load i64, ptr %t701
  %t703 = inttoptr i64 %t702 to ptr
  %t704 = musttail call fastcc i64 %t703(i64 %t699, i64 3, i64 %a0, i64 %a1, i64 %t698, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t704
else253:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-block-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t709 = icmp eq i64 %argc, 3
  br i1 %t709, label %argok266, label %arityerr265
arityerr265:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok266:
  %t710 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t711 = call i64 @rt_char_to_integer(i64 %t710)
  %t712 = or i64 %t711, 280
  %t713 = and i64 %t712, 7
  %t714 = icmp eq i64 %t713, 0
  br i1 %t714, label %fixfast267, label %fixslow268
fixfast267:
  %t715 = icmp eq i64 %t711, 280
  %t716 = select i1 %t715, i64 257, i64 1
  br label %fixmerge269
fixslow268:
  %t717 = call i64 @rt_num_eq(i64 %t711, i64 280)
  br label %fixmerge269
fixmerge269:
  %t718 = phi i64 [ %t716, %fixfast267 ], [ %t717, %fixslow268 ]
  %t719 = icmp ne i64 %t718, 1
  br i1 %t719, label %then270, label %else271
then270:
  %t720 = or i64 %a2, 8
  %t721 = and i64 %t720, 7
  %t722 = icmp eq i64 %t721, 0
  br i1 %t722, label %fixfast272, label %fixslow273
fixfast272:
  %t723 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t724 = extractvalue {i64, i1} %t723, 0
  %t725 = extractvalue {i64, i1} %t723, 1
  br i1 %t725, label %fixslow273, label %fixmerge274
fixslow273:
  %t726 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge274
fixmerge274:
  %t727 = phi i64 [ %t724, %fixfast272 ], [ %t726, %fixslow273 ]
  %t728 = or i64 %t727, %a1
  %t729 = and i64 %t728, 7
  %t730 = icmp eq i64 %t729, 0
  br i1 %t730, label %fixfast275, label %fixslow276
fixfast275:
  %t731 = icmp slt i64 %t727, %a1
  %t732 = select i1 %t731, i64 257, i64 1
  br label %fixmerge277
fixslow276:
  %t733 = call i64 @rt_lt(i64 %t727, i64 %a1)
  br label %fixmerge277
fixmerge277:
  %t734 = phi i64 [ %t732, %fixfast275 ], [ %t733, %fixslow276 ]
  %t735 = icmp ne i64 %t734, 1
  br i1 %t735, label %then278, label %else279
then278:
  %t736 = or i64 %a2, 8
  %t737 = and i64 %t736, 7
  %t738 = icmp eq i64 %t737, 0
  br i1 %t738, label %fixfast280, label %fixslow281
fixfast280:
  %t739 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t740 = extractvalue {i64, i1} %t739, 0
  %t741 = extractvalue {i64, i1} %t739, 1
  br i1 %t741, label %fixslow281, label %fixmerge282
fixslow281:
  %t742 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge282
fixmerge282:
  %t743 = phi i64 [ %t740, %fixfast280 ], [ %t742, %fixslow281 ]
  %t744 = call i64 @rt_string_ref(i64 %a0, i64 %t743)
  %t745 = call i64 @rt_char_to_integer(i64 %t744)
  %t746 = or i64 %t745, 992
  %t747 = and i64 %t746, 7
  %t748 = icmp eq i64 %t747, 0
  br i1 %t748, label %fixfast283, label %fixslow284
fixfast283:
  %t749 = icmp eq i64 %t745, 992
  %t750 = select i1 %t749, i64 257, i64 1
  br label %fixmerge285
fixslow284:
  %t751 = call i64 @rt_num_eq(i64 %t745, i64 992)
  br label %fixmerge285
fixmerge285:
  %t752 = phi i64 [ %t750, %fixfast283 ], [ %t751, %fixslow284 ]
  ret i64 %t752
else279:
  ret i64 1
else271:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-skip-block"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t757 = icmp eq i64 %argc, 5
  br i1 %t757, label %argok287, label %arityerr286
arityerr286:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok287:
  %t758 = or i64 %a2, 8
  %t759 = and i64 %t758, 7
  %t760 = icmp eq i64 %t759, 0
  br i1 %t760, label %fixfast288, label %fixslow289
fixfast288:
  %t761 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t762 = extractvalue {i64, i1} %t761, 0
  %t763 = extractvalue {i64, i1} %t761, 1
  br i1 %t763, label %fixslow289, label %fixmerge290
fixslow289:
  %t764 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge290
fixmerge290:
  %t765 = phi i64 [ %t762, %fixfast288 ], [ %t764, %fixslow289 ]
  %t766 = or i64 %t765, %a1
  %t767 = and i64 %t766, 7
  %t768 = icmp eq i64 %t767, 0
  br i1 %t768, label %fixfast291, label %fixslow292
fixfast291:
  %t769 = icmp slt i64 %t765, %a1
  %t770 = select i1 %t769, i64 257, i64 1
  br label %fixmerge293
fixslow292:
  %t771 = call i64 @rt_lt(i64 %t765, i64 %a1)
  br label %fixmerge293
fixmerge293:
  %t772 = phi i64 [ %t770, %fixfast291 ], [ %t771, %fixslow292 ]
  %t773 = icmp ne i64 %t772, 1
  br i1 %t773, label %then294, label %else295
then294:
  %t774 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t775 = call i64 @rt_char_to_integer(i64 %t774)
  %t776 = or i64 %a2, 8
  %t777 = and i64 %t776, 7
  %t778 = icmp eq i64 %t777, 0
  br i1 %t778, label %fixfast296, label %fixslow297
fixfast296:
  %t779 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t780 = extractvalue {i64, i1} %t779, 0
  %t781 = extractvalue {i64, i1} %t779, 1
  br i1 %t781, label %fixslow297, label %fixmerge298
fixslow297:
  %t782 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge298
fixmerge298:
  %t783 = phi i64 [ %t780, %fixfast296 ], [ %t782, %fixslow297 ]
  %t784 = call i64 @rt_string_ref(i64 %a0, i64 %t783)
  %t785 = call i64 @rt_char_to_integer(i64 %t784)
  %t786 = or i64 %t775, 992
  %t787 = and i64 %t786, 7
  %t788 = icmp eq i64 %t787, 0
  br i1 %t788, label %fixfast299, label %fixslow300
fixfast299:
  %t789 = icmp eq i64 %t775, 992
  %t790 = select i1 %t789, i64 257, i64 1
  br label %fixmerge301
fixslow300:
  %t791 = call i64 @rt_num_eq(i64 %t775, i64 992)
  br label %fixmerge301
fixmerge301:
  %t792 = phi i64 [ %t790, %fixfast299 ], [ %t791, %fixslow300 ]
  %t793 = icmp ne i64 %t792, 1
  br i1 %t793, label %then302, label %else303
then302:
  %t794 = or i64 %t785, 280
  %t795 = and i64 %t794, 7
  %t796 = icmp eq i64 %t795, 0
  br i1 %t796, label %fixfast305, label %fixslow306
fixfast305:
  %t797 = icmp eq i64 %t785, 280
  %t798 = select i1 %t797, i64 257, i64 1
  br label %fixmerge307
fixslow306:
  %t799 = call i64 @rt_num_eq(i64 %t785, i64 280)
  br label %fixmerge307
fixmerge307:
  %t800 = phi i64 [ %t798, %fixfast305 ], [ %t799, %fixslow306 ]
  br label %merge304
else303:
  br label %merge304
merge304:
  %t801 = phi i64 [ %t800, %fixmerge307 ], [ 1, %else303 ]
  %t802 = icmp ne i64 %t801, 1
  br i1 %t802, label %then308, label %else309
then308:
  %t803 = or i64 %a3, 8
  %t804 = and i64 %t803, 7
  %t805 = icmp eq i64 %t804, 0
  br i1 %t805, label %fixfast310, label %fixslow311
fixfast310:
  %t806 = icmp eq i64 %a3, 8
  %t807 = select i1 %t806, i64 257, i64 1
  br label %fixmerge312
fixslow311:
  %t808 = call i64 @rt_num_eq(i64 %a3, i64 8)
  br label %fixmerge312
fixmerge312:
  %t809 = phi i64 [ %t807, %fixfast310 ], [ %t808, %fixslow311 ]
  %t810 = icmp ne i64 %t809, 1
  br i1 %t810, label %then313, label %else314
then313:
  %t811 = or i64 %a2, 16
  %t812 = and i64 %t811, 7
  %t813 = icmp eq i64 %t812, 0
  br i1 %t813, label %fixfast315, label %fixslow316
fixfast315:
  %t814 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t815 = extractvalue {i64, i1} %t814, 0
  %t816 = extractvalue {i64, i1} %t814, 1
  br i1 %t816, label %fixslow316, label %fixmerge317
fixslow316:
  %t817 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge317
fixmerge317:
  %t818 = phi i64 [ %t815, %fixfast315 ], [ %t817, %fixslow316 ]
  ret i64 %t818
else314:
  %t819 = or i64 %a2, 16
  %t820 = and i64 %t819, 7
  %t821 = icmp eq i64 %t820, 0
  br i1 %t821, label %fixfast318, label %fixslow319
fixfast318:
  %t822 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t823 = extractvalue {i64, i1} %t822, 0
  %t824 = extractvalue {i64, i1} %t822, 1
  br i1 %t824, label %fixslow319, label %fixmerge320
fixslow319:
  %t825 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge320
fixmerge320:
  %t826 = phi i64 [ %t823, %fixfast318 ], [ %t825, %fixslow319 ]
  %t827 = or i64 %a3, 8
  %t828 = and i64 %t827, 7
  %t829 = icmp eq i64 %t828, 0
  br i1 %t829, label %fixfast321, label %fixslow322
fixfast321:
  %t830 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a3, i64 8)
  %t831 = extractvalue {i64, i1} %t830, 0
  %t832 = extractvalue {i64, i1} %t830, 1
  br i1 %t832, label %fixslow322, label %fixmerge323
fixslow322:
  %t833 = call i64 @rt_sub(i64 %a3, i64 8)
  br label %fixmerge323
fixmerge323:
  %t834 = phi i64 [ %t831, %fixfast321 ], [ %t833, %fixslow322 ]
  %t835 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t835)
  %t836 = and i64 %t835, -8
  %t837 = inttoptr i64 %t836 to ptr
  %t838 = load i64, ptr %t837
  %t839 = inttoptr i64 %t838 to ptr
  %t840 = musttail call fastcc i64 %t839(i64 %t835, i64 5, i64 %a0, i64 %a1, i64 %t826, i64 %t834, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t840
else309:
  %t841 = or i64 %t775, 280
  %t842 = and i64 %t841, 7
  %t843 = icmp eq i64 %t842, 0
  br i1 %t843, label %fixfast324, label %fixslow325
fixfast324:
  %t844 = icmp eq i64 %t775, 280
  %t845 = select i1 %t844, i64 257, i64 1
  br label %fixmerge326
fixslow325:
  %t846 = call i64 @rt_num_eq(i64 %t775, i64 280)
  br label %fixmerge326
fixmerge326:
  %t847 = phi i64 [ %t845, %fixfast324 ], [ %t846, %fixslow325 ]
  %t848 = icmp ne i64 %t847, 1
  br i1 %t848, label %then327, label %else328
then327:
  %t849 = or i64 %t785, 992
  %t850 = and i64 %t849, 7
  %t851 = icmp eq i64 %t850, 0
  br i1 %t851, label %fixfast330, label %fixslow331
fixfast330:
  %t852 = icmp eq i64 %t785, 992
  %t853 = select i1 %t852, i64 257, i64 1
  br label %fixmerge332
fixslow331:
  %t854 = call i64 @rt_num_eq(i64 %t785, i64 992)
  br label %fixmerge332
fixmerge332:
  %t855 = phi i64 [ %t853, %fixfast330 ], [ %t854, %fixslow331 ]
  br label %merge329
else328:
  br label %merge329
merge329:
  %t856 = phi i64 [ %t855, %fixmerge332 ], [ 1, %else328 ]
  %t857 = icmp ne i64 %t856, 1
  br i1 %t857, label %then333, label %else334
then333:
  %t858 = or i64 %a2, 16
  %t859 = and i64 %t858, 7
  %t860 = icmp eq i64 %t859, 0
  br i1 %t860, label %fixfast335, label %fixslow336
fixfast335:
  %t861 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t862 = extractvalue {i64, i1} %t861, 0
  %t863 = extractvalue {i64, i1} %t861, 1
  br i1 %t863, label %fixslow336, label %fixmerge337
fixslow336:
  %t864 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge337
fixmerge337:
  %t865 = phi i64 [ %t862, %fixfast335 ], [ %t864, %fixslow336 ]
  %t866 = or i64 %a3, 8
  %t867 = and i64 %t866, 7
  %t868 = icmp eq i64 %t867, 0
  br i1 %t868, label %fixfast338, label %fixslow339
fixfast338:
  %t869 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a3, i64 8)
  %t870 = extractvalue {i64, i1} %t869, 0
  %t871 = extractvalue {i64, i1} %t869, 1
  br i1 %t871, label %fixslow339, label %fixmerge340
fixslow339:
  %t872 = call i64 @rt_add(i64 %a3, i64 8)
  br label %fixmerge340
fixmerge340:
  %t873 = phi i64 [ %t870, %fixfast338 ], [ %t872, %fixslow339 ]
  %t874 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t874)
  %t875 = and i64 %t874, -8
  %t876 = inttoptr i64 %t875 to ptr
  %t877 = load i64, ptr %t876
  %t878 = inttoptr i64 %t877 to ptr
  %t879 = musttail call fastcc i64 %t878(i64 %t874, i64 5, i64 %a0, i64 %a1, i64 %t865, i64 %t873, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t879
else334:
  %t880 = or i64 %a2, 8
  %t881 = and i64 %t880, 7
  %t882 = icmp eq i64 %t881, 0
  br i1 %t882, label %fixfast341, label %fixslow342
fixfast341:
  %t883 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t884 = extractvalue {i64, i1} %t883, 0
  %t885 = extractvalue {i64, i1} %t883, 1
  br i1 %t885, label %fixslow342, label %fixmerge343
fixslow342:
  %t886 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge343
fixmerge343:
  %t887 = phi i64 [ %t884, %fixfast341 ], [ %t886, %fixslow342 ]
  %t888 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t888)
  %t889 = and i64 %t888, -8
  %t890 = inttoptr i64 %t889 to ptr
  %t891 = load i64, ptr %t890
  %t892 = inttoptr i64 %t891 to ptr
  %t893 = musttail call fastcc i64 %t892(i64 %t888, i64 5, i64 %a0, i64 %a1, i64 %t887, i64 %a3, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t893
else295:
  %t894 = load i64, ptr @"emit.internal:rd-fail-code"
  call void @rt_check_callable(i64 %t894)
  %t895 = and i64 %t894, -8
  %t896 = inttoptr i64 %t895 to ptr
  %t897 = load i64, ptr %t896
  %t898 = inttoptr i64 %t897 to ptr
  %t899 = musttail call fastcc i64 %t898(i64 %t894, i64 1, i64 %a4, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t899
}

define fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t904 = icmp eq i64 %argc, 3
  br i1 %t904, label %argok345, label %arityerr344
arityerr344:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok345:
  %t905 = or i64 0, %a2
  %t906 = and i64 %t905, 7
  %t907 = icmp eq i64 %t906, 0
  br i1 %t907, label %fixfast346, label %fixslow347
fixfast346:
  %t908 = icmp slt i64 0, %a2
  %t909 = select i1 %t908, i64 257, i64 1
  br label %fixmerge348
fixslow347:
  %t910 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge348
fixmerge348:
  %t911 = phi i64 [ %t909, %fixfast346 ], [ %t910, %fixslow347 ]
  %t912 = icmp ne i64 %t911, 1
  br i1 %t912, label %then349, label %else350
then349:
  br label %merge351
else350:
  %t913 = or i64 0, %a2
  %t914 = and i64 %t913, 7
  %t915 = icmp eq i64 %t914, 0
  br i1 %t915, label %fixfast352, label %fixslow353
fixfast352:
  %t916 = icmp eq i64 0, %a2
  %t917 = select i1 %t916, i64 257, i64 1
  br label %fixmerge354
fixslow353:
  %t918 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge354
fixmerge354:
  %t919 = phi i64 [ %t917, %fixfast352 ], [ %t918, %fixslow353 ]
  br label %merge351
merge351:
  %t920 = phi i64 [ 257, %then349 ], [ %t919, %fixmerge354 ]
  %t921 = icmp ne i64 %t920, 1
  br i1 %t921, label %then355, label %else356
then355:
  %t922 = or i64 %a2, %a1
  %t923 = and i64 %t922, 7
  %t924 = icmp eq i64 %t923, 0
  br i1 %t924, label %fixfast358, label %fixslow359
fixfast358:
  %t925 = icmp slt i64 %a2, %a1
  %t926 = select i1 %t925, i64 257, i64 1
  br label %fixmerge360
fixslow359:
  %t927 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge360
fixmerge360:
  %t928 = phi i64 [ %t926, %fixfast358 ], [ %t927, %fixslow359 ]
  br label %merge357
else356:
  br label %merge357
merge357:
  %t929 = phi i64 [ %t928, %fixmerge360 ], [ 1, %else356 ]
  %t930 = icmp ne i64 %t929, 1
  br i1 %t930, label %then361, label %else362
then361:
  %t931 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t932 = load i64, ptr @"emit.internal:rd-ws?"
  call void @rt_check_callable(i64 %t932)
  %t933 = and i64 %t932, -8
  %t934 = inttoptr i64 %t933 to ptr
  %t935 = load i64, ptr %t934
  %t936 = inttoptr i64 %t935 to ptr
  %t937 = call fastcc i64%t936(i64 %t932, i64 1, i64 %t931, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t938 = icmp ne i64 %t937, 1
  br i1 %t938, label %then363, label %else364
then363:
  %t939 = or i64 %a2, 8
  %t940 = and i64 %t939, 7
  %t941 = icmp eq i64 %t940, 0
  br i1 %t941, label %fixfast365, label %fixslow366
fixfast365:
  %t942 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t943 = extractvalue {i64, i1} %t942, 0
  %t944 = extractvalue {i64, i1} %t942, 1
  br i1 %t944, label %fixslow366, label %fixmerge367
fixslow366:
  %t945 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge367
fixmerge367:
  %t946 = phi i64 [ %t943, %fixfast365 ], [ %t945, %fixslow366 ]
  %t947 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t947)
  %t948 = and i64 %t947, -8
  %t949 = inttoptr i64 %t948 to ptr
  %t950 = load i64, ptr %t949
  %t951 = inttoptr i64 %t950 to ptr
  %t952 = musttail call fastcc i64 %t951(i64 %t947, i64 3, i64 %a0, i64 %a1, i64 %t946, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t952
else364:
  %t953 = call i64 @rt_char_to_integer(i64 %t931)
  %t954 = or i64 %t953, 472
  %t955 = and i64 %t954, 7
  %t956 = icmp eq i64 %t955, 0
  br i1 %t956, label %fixfast368, label %fixslow369
fixfast368:
  %t957 = icmp eq i64 %t953, 472
  %t958 = select i1 %t957, i64 257, i64 1
  br label %fixmerge370
fixslow369:
  %t959 = call i64 @rt_num_eq(i64 %t953, i64 472)
  br label %fixmerge370
fixmerge370:
  %t960 = phi i64 [ %t958, %fixfast368 ], [ %t959, %fixslow369 ]
  %t961 = icmp ne i64 %t960, 1
  br i1 %t961, label %then371, label %else372
then371:
  %t962 = or i64 %a2, 8
  %t963 = and i64 %t962, 7
  %t964 = icmp eq i64 %t963, 0
  br i1 %t964, label %fixfast373, label %fixslow374
fixfast373:
  %t965 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t966 = extractvalue {i64, i1} %t965, 0
  %t967 = extractvalue {i64, i1} %t965, 1
  br i1 %t967, label %fixslow374, label %fixmerge375
fixslow374:
  %t968 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge375
fixmerge375:
  %t969 = phi i64 [ %t966, %fixfast373 ], [ %t968, %fixslow374 ]
  %t970 = load i64, ptr @"emit.internal:rd-skip-line"
  call void @rt_check_callable(i64 %t970)
  %t971 = and i64 %t970, -8
  %t972 = inttoptr i64 %t971 to ptr
  %t973 = load i64, ptr %t972
  %t974 = inttoptr i64 %t973 to ptr
  %t975 = call fastcc i64%t974(i64 %t970, i64 3, i64 %a0, i64 %a1, i64 %t969, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t976 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t976)
  %t977 = and i64 %t976, -8
  %t978 = inttoptr i64 %t977 to ptr
  %t979 = load i64, ptr %t978
  %t980 = inttoptr i64 %t979 to ptr
  %t981 = musttail call fastcc i64 %t980(i64 %t976, i64 3, i64 %a0, i64 %a1, i64 %t975, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t981
else372:
  %t982 = load i64, ptr @"emit.internal:rd-block-open?"
  call void @rt_check_callable(i64 %t982)
  %t983 = and i64 %t982, -8
  %t984 = inttoptr i64 %t983 to ptr
  %t985 = load i64, ptr %t984
  %t986 = inttoptr i64 %t985 to ptr
  %t987 = call fastcc i64%t986(i64 %t982, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t988 = icmp ne i64 %t987, 1
  br i1 %t988, label %then376, label %else377
then376:
  %t989 = or i64 %a2, 16
  %t990 = and i64 %t989, 7
  %t991 = icmp eq i64 %t990, 0
  br i1 %t991, label %fixfast378, label %fixslow379
fixfast378:
  %t992 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t993 = extractvalue {i64, i1} %t992, 0
  %t994 = extractvalue {i64, i1} %t992, 1
  br i1 %t994, label %fixslow379, label %fixmerge380
fixslow379:
  %t995 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge380
fixmerge380:
  %t996 = phi i64 [ %t993, %fixfast378 ], [ %t995, %fixslow379 ]
  %t997 = load i64, ptr @"emit.internal:rd-skip-block"
  call void @rt_check_callable(i64 %t997)
  %t998 = and i64 %t997, -8
  %t999 = inttoptr i64 %t998 to ptr
  %t1000 = load i64, ptr %t999
  %t1001 = inttoptr i64 %t1000 to ptr
  %t1002 = call fastcc i64%t1001(i64 %t997, i64 5, i64 %a0, i64 %a1, i64 %t996, i64 8, i64 %a2, i64 0, i64 0, i64 0, ptr null)
  %t1003 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t1003)
  %t1004 = and i64 %t1003, -8
  %t1005 = inttoptr i64 %t1004 to ptr
  %t1006 = load i64, ptr %t1005
  %t1007 = inttoptr i64 %t1006 to ptr
  %t1008 = call fastcc i64%t1007(i64 %t1003, i64 1, i64 %t1002, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1009 = icmp ne i64 %t1008, 1
  br i1 %t1009, label %then381, label %else382
then381:
  ret i64 %t1002
else382:
  %t1010 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t1010)
  %t1011 = and i64 %t1010, -8
  %t1012 = inttoptr i64 %t1011 to ptr
  %t1013 = load i64, ptr %t1012
  %t1014 = inttoptr i64 %t1013 to ptr
  %t1015 = musttail call fastcc i64 %t1014(i64 %t1010, i64 3, i64 %a0, i64 %a1, i64 %t1002, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1015
else377:
  ret i64 %a2
else362:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1020 = icmp eq i64 %argc, 3
  br i1 %t1020, label %argok384, label %arityerr383
arityerr383:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok384:
  %t1021 = or i64 %a2, %a1
  %t1022 = and i64 %t1021, 7
  %t1023 = icmp eq i64 %t1022, 0
  br i1 %t1023, label %fixfast385, label %fixslow386
fixfast385:
  %t1024 = icmp slt i64 %a2, %a1
  %t1025 = select i1 %t1024, i64 257, i64 1
  br label %fixmerge387
fixslow386:
  %t1026 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge387
fixmerge387:
  %t1027 = phi i64 [ %t1025, %fixfast385 ], [ %t1026, %fixslow386 ]
  %t1028 = icmp ne i64 %t1027, 1
  br i1 %t1028, label %then388, label %else389
then388:
  %t1029 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1030 = load i64, ptr @"emit.internal:rd-delim?"
  call void @rt_check_callable(i64 %t1030)
  %t1031 = and i64 %t1030, -8
  %t1032 = inttoptr i64 %t1031 to ptr
  %t1033 = load i64, ptr %t1032
  %t1034 = inttoptr i64 %t1033 to ptr
  %t1035 = call fastcc i64%t1034(i64 %t1030, i64 1, i64 %t1029, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1036 = icmp ne i64 %t1035, 1
  br i1 %t1036, label %then390, label %else391
then390:
  ret i64 %a2
else391:
  %t1037 = or i64 %a2, 8
  %t1038 = and i64 %t1037, 7
  %t1039 = icmp eq i64 %t1038, 0
  br i1 %t1039, label %fixfast392, label %fixslow393
fixfast392:
  %t1040 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1041 = extractvalue {i64, i1} %t1040, 0
  %t1042 = extractvalue {i64, i1} %t1040, 1
  br i1 %t1042, label %fixslow393, label %fixmerge394
fixslow393:
  %t1043 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge394
fixmerge394:
  %t1044 = phi i64 [ %t1041, %fixfast392 ], [ %t1043, %fixslow393 ]
  %t1045 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t1045)
  %t1046 = and i64 %t1045, -8
  %t1047 = inttoptr i64 %t1046 to ptr
  %t1048 = load i64, ptr %t1047
  %t1049 = inttoptr i64 %t1048 to ptr
  %t1050 = musttail call fastcc i64 %t1049(i64 %t1045, i64 3, i64 %a0, i64 %a1, i64 %t1044, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1050
else389:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1055 = icmp eq i64 %argc, 3
  br i1 %t1055, label %argok396, label %arityerr395
arityerr395:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok396:
  %t1056 = or i64 %a1, %a2
  %t1057 = and i64 %t1056, 7
  %t1058 = icmp eq i64 %t1057, 0
  br i1 %t1058, label %fixfast397, label %fixslow398
fixfast397:
  %t1059 = icmp slt i64 %a1, %a2
  %t1060 = select i1 %t1059, i64 257, i64 1
  br label %fixmerge399
fixslow398:
  %t1061 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge399
fixmerge399:
  %t1062 = phi i64 [ %t1060, %fixfast397 ], [ %t1061, %fixslow398 ]
  %t1063 = icmp ne i64 %t1062, 1
  br i1 %t1063, label %then400, label %else401
then400:
  %t1064 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1065 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1065)
  %t1066 = and i64 %t1065, -8
  %t1067 = inttoptr i64 %t1066 to ptr
  %t1068 = load i64, ptr %t1067
  %t1069 = inttoptr i64 %t1068 to ptr
  %t1070 = call fastcc i64%t1069(i64 %t1065, i64 1, i64 %t1064, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1071 = icmp ne i64 %t1070, 1
  br i1 %t1071, label %then402, label %else403
then402:
  %t1072 = or i64 %a1, 8
  %t1073 = and i64 %t1072, 7
  %t1074 = icmp eq i64 %t1073, 0
  br i1 %t1074, label %fixfast404, label %fixslow405
fixfast404:
  %t1075 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1076 = extractvalue {i64, i1} %t1075, 0
  %t1077 = extractvalue {i64, i1} %t1075, 1
  br i1 %t1077, label %fixslow405, label %fixmerge406
fixslow405:
  %t1078 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge406
fixmerge406:
  %t1079 = phi i64 [ %t1076, %fixfast404 ], [ %t1078, %fixslow405 ]
  %t1080 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1080)
  %t1081 = and i64 %t1080, -8
  %t1082 = inttoptr i64 %t1081 to ptr
  %t1083 = load i64, ptr %t1082
  %t1084 = inttoptr i64 %t1083 to ptr
  %t1085 = musttail call fastcc i64 %t1084(i64 %t1080, i64 3, i64 %a0, i64 %t1079, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1085
else403:
  ret i64 1
else401:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1090 = icmp eq i64 %argc, 1
  br i1 %t1090, label %argok408, label %arityerr407
arityerr407:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok408:
  %t1091 = call i64 @rt_string_length(i64 %a0)
  %t1092 = or i64 0, %t1091
  %t1093 = and i64 %t1092, 7
  %t1094 = icmp eq i64 %t1093, 0
  br i1 %t1094, label %fixfast409, label %fixslow410
fixfast409:
  %t1095 = icmp slt i64 0, %t1091
  %t1096 = select i1 %t1095, i64 257, i64 1
  br label %fixmerge411
fixslow410:
  %t1097 = call i64 @rt_lt(i64 0, i64 %t1091)
  br label %fixmerge411
fixmerge411:
  %t1098 = phi i64 [ %t1096, %fixfast409 ], [ %t1097, %fixslow410 ]
  %t1099 = icmp ne i64 %t1098, 1
  br i1 %t1099, label %then412, label %else413
then412:
  %t1100 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1101 = call i64 @rt_char_to_integer(i64 %t1100)
  %t1102 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1103 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1103)
  %t1104 = and i64 %t1103, -8
  %t1105 = inttoptr i64 %t1104 to ptr
  %t1106 = load i64, ptr %t1105
  %t1107 = inttoptr i64 %t1106 to ptr
  %t1108 = call fastcc i64%t1107(i64 %t1103, i64 1, i64 %t1102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1109 = icmp ne i64 %t1108, 1
  br i1 %t1109, label %then414, label %else415
then414:
  %t1110 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1110)
  %t1111 = and i64 %t1110, -8
  %t1112 = inttoptr i64 %t1111 to ptr
  %t1113 = load i64, ptr %t1112
  %t1114 = inttoptr i64 %t1113 to ptr
  %t1115 = musttail call fastcc i64 %t1114(i64 %t1110, i64 3, i64 %a0, i64 0, i64 %t1091, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1115
else415:
  %t1116 = or i64 %t1101, 360
  %t1117 = and i64 %t1116, 7
  %t1118 = icmp eq i64 %t1117, 0
  br i1 %t1118, label %fixfast416, label %fixslow417
fixfast416:
  %t1119 = icmp eq i64 %t1101, 360
  %t1120 = select i1 %t1119, i64 257, i64 1
  br label %fixmerge418
fixslow417:
  %t1121 = call i64 @rt_num_eq(i64 %t1101, i64 360)
  br label %fixmerge418
fixmerge418:
  %t1122 = phi i64 [ %t1120, %fixfast416 ], [ %t1121, %fixslow417 ]
  %t1123 = icmp ne i64 %t1122, 1
  br i1 %t1123, label %then419, label %else420
then419:
  br label %merge421
else420:
  %t1124 = or i64 %t1101, 344
  %t1125 = and i64 %t1124, 7
  %t1126 = icmp eq i64 %t1125, 0
  br i1 %t1126, label %fixfast422, label %fixslow423
fixfast422:
  %t1127 = icmp eq i64 %t1101, 344
  %t1128 = select i1 %t1127, i64 257, i64 1
  br label %fixmerge424
fixslow423:
  %t1129 = call i64 @rt_num_eq(i64 %t1101, i64 344)
  br label %fixmerge424
fixmerge424:
  %t1130 = phi i64 [ %t1128, %fixfast422 ], [ %t1129, %fixslow423 ]
  br label %merge421
merge421:
  %t1131 = phi i64 [ %t1122, %then419 ], [ %t1130, %fixmerge424 ]
  %t1132 = icmp ne i64 %t1131, 1
  br i1 %t1132, label %then425, label %else426
then425:
  %t1133 = or i64 8, %t1091
  %t1134 = and i64 %t1133, 7
  %t1135 = icmp eq i64 %t1134, 0
  br i1 %t1135, label %fixfast427, label %fixslow428
fixfast427:
  %t1136 = icmp slt i64 8, %t1091
  %t1137 = select i1 %t1136, i64 257, i64 1
  br label %fixmerge429
fixslow428:
  %t1138 = call i64 @rt_lt(i64 8, i64 %t1091)
  br label %fixmerge429
fixmerge429:
  %t1139 = phi i64 [ %t1137, %fixfast427 ], [ %t1138, %fixslow428 ]
  %t1140 = icmp ne i64 %t1139, 1
  br i1 %t1140, label %then430, label %else431
then430:
  %t1141 = load i64, ptr @"emit.internal:rd-all-digits?"
  call void @rt_check_callable(i64 %t1141)
  %t1142 = and i64 %t1141, -8
  %t1143 = inttoptr i64 %t1142 to ptr
  %t1144 = load i64, ptr %t1143
  %t1145 = inttoptr i64 %t1144 to ptr
  %t1146 = musttail call fastcc i64 %t1145(i64 %t1141, i64 3, i64 %a0, i64 8, i64 %t1091, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1146
else431:
  ret i64 1
else426:
  ret i64 1
else413:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1151 = icmp eq i64 %argc, 4
  br i1 %t1151, label %argok433, label %arityerr432
arityerr432:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok433:
  %t1152 = or i64 %a1, %a2
  %t1153 = and i64 %t1152, 7
  %t1154 = icmp eq i64 %t1153, 0
  br i1 %t1154, label %fixfast434, label %fixslow435
fixfast434:
  %t1155 = icmp slt i64 %a1, %a2
  %t1156 = select i1 %t1155, i64 257, i64 1
  br label %fixmerge436
fixslow435:
  %t1157 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge436
fixmerge436:
  %t1158 = phi i64 [ %t1156, %fixfast434 ], [ %t1157, %fixslow435 ]
  %t1159 = icmp ne i64 %t1158, 1
  br i1 %t1159, label %then437, label %else438
then437:
  %t1160 = or i64 %a1, 8
  %t1161 = and i64 %t1160, 7
  %t1162 = icmp eq i64 %t1161, 0
  br i1 %t1162, label %fixfast439, label %fixslow440
fixfast439:
  %t1163 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1164 = extractvalue {i64, i1} %t1163, 0
  %t1165 = extractvalue {i64, i1} %t1163, 1
  br i1 %t1165, label %fixslow440, label %fixmerge441
fixslow440:
  %t1166 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge441
fixmerge441:
  %t1167 = phi i64 [ %t1164, %fixfast439 ], [ %t1166, %fixslow440 ]
  %t1168 = or i64 %a3, 80
  %t1169 = and i64 %t1168, 7
  %t1170 = icmp eq i64 %t1169, 0
  br i1 %t1170, label %fixfast442, label %fixslow443
fixfast442:
  %t1171 = ashr i64 %a3, 3
  %t1172 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1171, i64 80)
  %t1173 = extractvalue {i64, i1} %t1172, 0
  %t1174 = extractvalue {i64, i1} %t1172, 1
  br i1 %t1174, label %fixslow443, label %fixmerge444
fixslow443:
  %t1175 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge444
fixmerge444:
  %t1176 = phi i64 [ %t1173, %fixfast442 ], [ %t1175, %fixslow443 ]
  %t1177 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1178 = call i64 @rt_char_to_integer(i64 %t1177)
  %t1179 = or i64 %t1178, 384
  %t1180 = and i64 %t1179, 7
  %t1181 = icmp eq i64 %t1180, 0
  br i1 %t1181, label %fixfast445, label %fixslow446
fixfast445:
  %t1182 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1178, i64 384)
  %t1183 = extractvalue {i64, i1} %t1182, 0
  %t1184 = extractvalue {i64, i1} %t1182, 1
  br i1 %t1184, label %fixslow446, label %fixmerge447
fixslow446:
  %t1185 = call i64 @rt_sub(i64 %t1178, i64 384)
  br label %fixmerge447
fixmerge447:
  %t1186 = phi i64 [ %t1183, %fixfast445 ], [ %t1185, %fixslow446 ]
  %t1187 = or i64 %t1176, %t1186
  %t1188 = and i64 %t1187, 7
  %t1189 = icmp eq i64 %t1188, 0
  br i1 %t1189, label %fixfast448, label %fixslow449
fixfast448:
  %t1190 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1176, i64 %t1186)
  %t1191 = extractvalue {i64, i1} %t1190, 0
  %t1192 = extractvalue {i64, i1} %t1190, 1
  br i1 %t1192, label %fixslow449, label %fixmerge450
fixslow449:
  %t1193 = call i64 @rt_add(i64 %t1176, i64 %t1186)
  br label %fixmerge450
fixmerge450:
  %t1194 = phi i64 [ %t1191, %fixfast448 ], [ %t1193, %fixslow449 ]
  %t1195 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1195)
  %t1196 = and i64 %t1195, -8
  %t1197 = inttoptr i64 %t1196 to ptr
  %t1198 = load i64, ptr %t1197
  %t1199 = inttoptr i64 %t1198 to ptr
  %t1200 = musttail call fastcc i64 %t1199(i64 %t1195, i64 4, i64 %a0, i64 %t1167, i64 %a2, i64 %t1194, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1200
else438:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1205 = icmp eq i64 %argc, 4
  br i1 %t1205, label %argok452, label %arityerr451
arityerr451:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok452:
  %t1206 = or i64 %a1, %a2
  %t1207 = and i64 %t1206, 7
  %t1208 = icmp eq i64 %t1207, 0
  br i1 %t1208, label %fixfast453, label %fixslow454
fixfast453:
  %t1209 = icmp slt i64 %a1, %a2
  %t1210 = select i1 %t1209, i64 257, i64 1
  br label %fixmerge455
fixslow454:
  %t1211 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge455
fixmerge455:
  %t1212 = phi i64 [ %t1210, %fixfast453 ], [ %t1211, %fixslow454 ]
  %t1213 = icmp ne i64 %t1212, 1
  br i1 %t1213, label %then456, label %else457
then456:
  %t1214 = or i64 %a1, 8
  %t1215 = and i64 %t1214, 7
  %t1216 = icmp eq i64 %t1215, 0
  br i1 %t1216, label %fixfast458, label %fixslow459
fixfast458:
  %t1217 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1218 = extractvalue {i64, i1} %t1217, 0
  %t1219 = extractvalue {i64, i1} %t1217, 1
  br i1 %t1219, label %fixslow459, label %fixmerge460
fixslow459:
  %t1220 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge460
fixmerge460:
  %t1221 = phi i64 [ %t1218, %fixfast458 ], [ %t1220, %fixslow459 ]
  %t1222 = or i64 %a3, 80
  %t1223 = and i64 %t1222, 7
  %t1224 = icmp eq i64 %t1223, 0
  br i1 %t1224, label %fixfast461, label %fixslow462
fixfast461:
  %t1225 = ashr i64 %a3, 3
  %t1226 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1225, i64 80)
  %t1227 = extractvalue {i64, i1} %t1226, 0
  %t1228 = extractvalue {i64, i1} %t1226, 1
  br i1 %t1228, label %fixslow462, label %fixmerge463
fixslow462:
  %t1229 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge463
fixmerge463:
  %t1230 = phi i64 [ %t1227, %fixfast461 ], [ %t1229, %fixslow462 ]
  %t1231 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1232 = call i64 @rt_char_to_integer(i64 %t1231)
  %t1233 = or i64 %t1232, 384
  %t1234 = and i64 %t1233, 7
  %t1235 = icmp eq i64 %t1234, 0
  br i1 %t1235, label %fixfast464, label %fixslow465
fixfast464:
  %t1236 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1232, i64 384)
  %t1237 = extractvalue {i64, i1} %t1236, 0
  %t1238 = extractvalue {i64, i1} %t1236, 1
  br i1 %t1238, label %fixslow465, label %fixmerge466
fixslow465:
  %t1239 = call i64 @rt_sub(i64 %t1232, i64 384)
  br label %fixmerge466
fixmerge466:
  %t1240 = phi i64 [ %t1237, %fixfast464 ], [ %t1239, %fixslow465 ]
  %t1241 = or i64 %t1230, %t1240
  %t1242 = and i64 %t1241, 7
  %t1243 = icmp eq i64 %t1242, 0
  br i1 %t1243, label %fixfast467, label %fixslow468
fixfast467:
  %t1244 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1230, i64 %t1240)
  %t1245 = extractvalue {i64, i1} %t1244, 0
  %t1246 = extractvalue {i64, i1} %t1244, 1
  br i1 %t1246, label %fixslow468, label %fixmerge469
fixslow468:
  %t1247 = call i64 @rt_sub(i64 %t1230, i64 %t1240)
  br label %fixmerge469
fixmerge469:
  %t1248 = phi i64 [ %t1245, %fixfast467 ], [ %t1247, %fixslow468 ]
  %t1249 = load i64, ptr @"emit.internal:rd-digits-neg"
  call void @rt_check_callable(i64 %t1249)
  %t1250 = and i64 %t1249, -8
  %t1251 = inttoptr i64 %t1250 to ptr
  %t1252 = load i64, ptr %t1251
  %t1253 = inttoptr i64 %t1252 to ptr
  %t1254 = musttail call fastcc i64 %t1253(i64 %t1249, i64 4, i64 %a0, i64 %t1221, i64 %a2, i64 %t1248, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1254
else457:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1259 = icmp eq i64 %argc, 1
  br i1 %t1259, label %argok471, label %arityerr470
arityerr470:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok471:
  %t1260 = call i64 @rt_string_length(i64 %a0)
  %t1261 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1262 = call i64 @rt_char_to_integer(i64 %t1261)
  %t1263 = or i64 %t1262, 360
  %t1264 = and i64 %t1263, 7
  %t1265 = icmp eq i64 %t1264, 0
  br i1 %t1265, label %fixfast472, label %fixslow473
fixfast472:
  %t1266 = icmp eq i64 %t1262, 360
  %t1267 = select i1 %t1266, i64 257, i64 1
  br label %fixmerge474
fixslow473:
  %t1268 = call i64 @rt_num_eq(i64 %t1262, i64 360)
  br label %fixmerge474
fixmerge474:
  %t1269 = phi i64 [ %t1267, %fixfast472 ], [ %t1268, %fixslow473 ]
  %t1270 = icmp ne i64 %t1269, 1
  br i1 %t1270, label %then475, label %else476
then475:
  %t1271 = load i64, ptr @"emit.internal:rd-digits-neg"
  call void @rt_check_callable(i64 %t1271)
  %t1272 = and i64 %t1271, -8
  %t1273 = inttoptr i64 %t1272 to ptr
  %t1274 = load i64, ptr %t1273
  %t1275 = inttoptr i64 %t1274 to ptr
  %t1276 = musttail call fastcc i64 %t1275(i64 %t1271, i64 4, i64 %a0, i64 8, i64 %t1260, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1276
else476:
  %t1277 = or i64 %t1262, 344
  %t1278 = and i64 %t1277, 7
  %t1279 = icmp eq i64 %t1278, 0
  br i1 %t1279, label %fixfast477, label %fixslow478
fixfast477:
  %t1280 = icmp eq i64 %t1262, 344
  %t1281 = select i1 %t1280, i64 257, i64 1
  br label %fixmerge479
fixslow478:
  %t1282 = call i64 @rt_num_eq(i64 %t1262, i64 344)
  br label %fixmerge479
fixmerge479:
  %t1283 = phi i64 [ %t1281, %fixfast477 ], [ %t1282, %fixslow478 ]
  %t1284 = icmp ne i64 %t1283, 1
  br i1 %t1284, label %then480, label %else481
then480:
  %t1285 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1285)
  %t1286 = and i64 %t1285, -8
  %t1287 = inttoptr i64 %t1286 to ptr
  %t1288 = load i64, ptr %t1287
  %t1289 = inttoptr i64 %t1288 to ptr
  %t1290 = musttail call fastcc i64 %t1289(i64 %t1285, i64 4, i64 %a0, i64 8, i64 %t1260, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1290
else481:
  %t1291 = load i64, ptr @"emit.internal:rd-digits"
  call void @rt_check_callable(i64 %t1291)
  %t1292 = and i64 %t1291, -8
  %t1293 = inttoptr i64 %t1292 to ptr
  %t1294 = load i64, ptr %t1293
  %t1295 = inttoptr i64 %t1294 to ptr
  %t1296 = musttail call fastcc i64 %t1295(i64 %t1291, i64 4, i64 %a0, i64 0, i64 %t1260, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1296
}

define fastcc i64 @"emit.internal:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1301 = icmp eq i64 %argc, 1
  br i1 %t1301, label %argok483, label %arityerr482
arityerr482:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok483:
  %t1302 = call i64 @rt_char_to_integer(i64 %a0)
  %t1303 = or i64 %t1302, 368
  %t1304 = and i64 %t1303, 7
  %t1305 = icmp eq i64 %t1304, 0
  br i1 %t1305, label %fixfast484, label %fixslow485
fixfast484:
  %t1306 = icmp eq i64 %t1302, 368
  %t1307 = select i1 %t1306, i64 257, i64 1
  br label %fixmerge486
fixslow485:
  %t1308 = call i64 @rt_num_eq(i64 %t1302, i64 368)
  br label %fixmerge486
fixmerge486:
  %t1309 = phi i64 [ %t1307, %fixfast484 ], [ %t1308, %fixslow485 ]
  ret i64 %t1309
}

define fastcc i64 @"emit.internal:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1314 = icmp eq i64 %argc, 1
  br i1 %t1314, label %argok488, label %arityerr487
arityerr487:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok488:
  %t1315 = call i64 @rt_char_to_integer(i64 %a0)
  %t1316 = or i64 %t1315, 808
  %t1317 = and i64 %t1316, 7
  %t1318 = icmp eq i64 %t1317, 0
  br i1 %t1318, label %fixfast489, label %fixslow490
fixfast489:
  %t1319 = icmp eq i64 %t1315, 808
  %t1320 = select i1 %t1319, i64 257, i64 1
  br label %fixmerge491
fixslow490:
  %t1321 = call i64 @rt_num_eq(i64 %t1315, i64 808)
  br label %fixmerge491
fixmerge491:
  %t1322 = phi i64 [ %t1320, %fixfast489 ], [ %t1321, %fixslow490 ]
  %t1323 = icmp ne i64 %t1322, 1
  br i1 %t1323, label %then492, label %else493
then492:
  ret i64 %t1322
else493:
  %t1324 = or i64 %t1315, 552
  %t1325 = and i64 %t1324, 7
  %t1326 = icmp eq i64 %t1325, 0
  br i1 %t1326, label %fixfast494, label %fixslow495
fixfast494:
  %t1327 = icmp eq i64 %t1315, 552
  %t1328 = select i1 %t1327, i64 257, i64 1
  br label %fixmerge496
fixslow495:
  %t1329 = call i64 @rt_num_eq(i64 %t1315, i64 552)
  br label %fixmerge496
fixmerge496:
  %t1330 = phi i64 [ %t1328, %fixfast494 ], [ %t1329, %fixslow495 ]
  ret i64 %t1330
}

define fastcc i64 @"emit.internal:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1335 = icmp eq i64 %argc, 1
  br i1 %t1335, label %argok498, label %arityerr497
arityerr497:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok498:
  %t1336 = call i64 @rt_char_to_integer(i64 %a0)
  %t1337 = or i64 %t1336, 344
  %t1338 = and i64 %t1337, 7
  %t1339 = icmp eq i64 %t1338, 0
  br i1 %t1339, label %fixfast499, label %fixslow500
fixfast499:
  %t1340 = icmp eq i64 %t1336, 344
  %t1341 = select i1 %t1340, i64 257, i64 1
  br label %fixmerge501
fixslow500:
  %t1342 = call i64 @rt_num_eq(i64 %t1336, i64 344)
  br label %fixmerge501
fixmerge501:
  %t1343 = phi i64 [ %t1341, %fixfast499 ], [ %t1342, %fixslow500 ]
  %t1344 = icmp ne i64 %t1343, 1
  br i1 %t1344, label %then502, label %else503
then502:
  ret i64 %t1343
else503:
  %t1345 = or i64 %t1336, 360
  %t1346 = and i64 %t1345, 7
  %t1347 = icmp eq i64 %t1346, 0
  br i1 %t1347, label %fixfast504, label %fixslow505
fixfast504:
  %t1348 = icmp eq i64 %t1336, 360
  %t1349 = select i1 %t1348, i64 257, i64 1
  br label %fixmerge506
fixslow505:
  %t1350 = call i64 @rt_num_eq(i64 %t1336, i64 360)
  br label %fixmerge506
fixmerge506:
  %t1351 = phi i64 [ %t1349, %fixfast504 ], [ %t1350, %fixslow505 ]
  ret i64 %t1351
}

define fastcc i64 @"emit.internal:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1356 = icmp eq i64 %argc, 3
  br i1 %t1356, label %argok508, label %arityerr507
arityerr507:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok508:
  %t1357 = or i64 %a1, %a2
  %t1358 = and i64 %t1357, 7
  %t1359 = icmp eq i64 %t1358, 0
  br i1 %t1359, label %fixfast509, label %fixslow510
fixfast509:
  %t1360 = icmp slt i64 %a1, %a2
  %t1361 = select i1 %t1360, i64 257, i64 1
  br label %fixmerge511
fixslow510:
  %t1362 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge511
fixmerge511:
  %t1363 = phi i64 [ %t1361, %fixfast509 ], [ %t1362, %fixslow510 ]
  %t1364 = icmp ne i64 %t1363, 1
  br i1 %t1364, label %then512, label %else513
then512:
  %t1365 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1366 = load i64, ptr @"emit.internal:rd-digit?"
  call void @rt_check_callable(i64 %t1366)
  %t1367 = and i64 %t1366, -8
  %t1368 = inttoptr i64 %t1367 to ptr
  %t1369 = load i64, ptr %t1368
  %t1370 = inttoptr i64 %t1369 to ptr
  %t1371 = call fastcc i64%t1370(i64 %t1366, i64 1, i64 %t1365, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge514
else513:
  br label %merge514
merge514:
  %t1372 = phi i64 [ %t1371, %then512 ], [ 1, %else513 ]
  %t1373 = icmp ne i64 %t1372, 1
  br i1 %t1373, label %then515, label %else516
then515:
  %t1374 = or i64 %a1, 8
  %t1375 = and i64 %t1374, 7
  %t1376 = icmp eq i64 %t1375, 0
  br i1 %t1376, label %fixfast517, label %fixslow518
fixfast517:
  %t1377 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1378 = extractvalue {i64, i1} %t1377, 0
  %t1379 = extractvalue {i64, i1} %t1377, 1
  br i1 %t1379, label %fixslow518, label %fixmerge519
fixslow518:
  %t1380 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge519
fixmerge519:
  %t1381 = phi i64 [ %t1378, %fixfast517 ], [ %t1380, %fixslow518 ]
  %t1382 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1382)
  %t1383 = and i64 %t1382, -8
  %t1384 = inttoptr i64 %t1383 to ptr
  %t1385 = load i64, ptr %t1384
  %t1386 = inttoptr i64 %t1385 to ptr
  %t1387 = musttail call fastcc i64 %t1386(i64 %t1382, i64 3, i64 %a0, i64 %t1381, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1387
else516:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1392 = icmp eq i64 %argc, 1
  br i1 %t1392, label %argok521, label %arityerr520
arityerr520:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok521:
  %t1393 = call i64 @rt_string_length(i64 %a0)
  %t1394 = or i64 0, %t1393
  %t1395 = and i64 %t1394, 7
  %t1396 = icmp eq i64 %t1395, 0
  br i1 %t1396, label %fixfast522, label %fixslow523
fixfast522:
  %t1397 = icmp slt i64 0, %t1393
  %t1398 = select i1 %t1397, i64 257, i64 1
  br label %fixmerge524
fixslow523:
  %t1399 = call i64 @rt_lt(i64 0, i64 %t1393)
  br label %fixmerge524
fixmerge524:
  %t1400 = phi i64 [ %t1398, %fixfast522 ], [ %t1399, %fixslow523 ]
  %t1401 = icmp ne i64 %t1400, 1
  br i1 %t1401, label %then525, label %else526
then525:
  %t1402 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1403 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1403)
  %t1404 = and i64 %t1403, -8
  %t1405 = inttoptr i64 %t1404 to ptr
  %t1406 = load i64, ptr %t1405
  %t1407 = inttoptr i64 %t1406 to ptr
  %t1408 = call fastcc i64%t1407(i64 %t1403, i64 1, i64 %t1402, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1409 = icmp ne i64 %t1408, 1
  br i1 %t1409, label %then527, label %else528
then527:
  br label %merge529
else528:
  br label %merge529
merge529:
  %t1410 = phi i64 [ 8, %then527 ], [ 0, %else528 ]
  %t1411 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1411)
  %t1412 = and i64 %t1411, -8
  %t1413 = inttoptr i64 %t1412 to ptr
  %t1414 = load i64, ptr %t1413
  %t1415 = inttoptr i64 %t1414 to ptr
  %t1416 = call fastcc i64%t1415(i64 %t1411, i64 3, i64 %a0, i64 %t1410, i64 %t1393, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1417 = or i64 %t1416, %t1393
  %t1418 = and i64 %t1417, 7
  %t1419 = icmp eq i64 %t1418, 0
  br i1 %t1419, label %fixfast530, label %fixslow531
fixfast530:
  %t1420 = icmp slt i64 %t1416, %t1393
  %t1421 = select i1 %t1420, i64 257, i64 1
  br label %fixmerge532
fixslow531:
  %t1422 = call i64 @rt_lt(i64 %t1416, i64 %t1393)
  br label %fixmerge532
fixmerge532:
  %t1423 = phi i64 [ %t1421, %fixfast530 ], [ %t1422, %fixslow531 ]
  %t1424 = icmp ne i64 %t1423, 1
  br i1 %t1424, label %then533, label %else534
then533:
  %t1425 = call i64 @rt_string_ref(i64 %a0, i64 %t1416)
  %t1426 = load i64, ptr @"emit.internal:rd-dotchar?"
  call void @rt_check_callable(i64 %t1426)
  %t1427 = and i64 %t1426, -8
  %t1428 = inttoptr i64 %t1427 to ptr
  %t1429 = load i64, ptr %t1428
  %t1430 = inttoptr i64 %t1429 to ptr
  %t1431 = call fastcc i64%t1430(i64 %t1426, i64 1, i64 %t1425, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge535
else534:
  br label %merge535
merge535:
  %t1432 = phi i64 [ %t1431, %then533 ], [ 1, %else534 ]
  %t1433 = icmp ne i64 %t1432, 1
  br i1 %t1433, label %then536, label %else537
then536:
  %t1434 = or i64 %t1416, 8
  %t1435 = and i64 %t1434, 7
  %t1436 = icmp eq i64 %t1435, 0
  br i1 %t1436, label %fixfast539, label %fixslow540
fixfast539:
  %t1437 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1416, i64 8)
  %t1438 = extractvalue {i64, i1} %t1437, 0
  %t1439 = extractvalue {i64, i1} %t1437, 1
  br i1 %t1439, label %fixslow540, label %fixmerge541
fixslow540:
  %t1440 = call i64 @rt_add(i64 %t1416, i64 8)
  br label %fixmerge541
fixmerge541:
  %t1441 = phi i64 [ %t1438, %fixfast539 ], [ %t1440, %fixslow540 ]
  br label %merge538
else537:
  br label %merge538
merge538:
  %t1442 = phi i64 [ %t1441, %fixmerge541 ], [ %t1416, %else537 ]
  %t1443 = or i64 %t1416, %t1442
  %t1444 = and i64 %t1443, 7
  %t1445 = icmp eq i64 %t1444, 0
  br i1 %t1445, label %fixfast542, label %fixslow543
fixfast542:
  %t1446 = icmp slt i64 %t1416, %t1442
  %t1447 = select i1 %t1446, i64 257, i64 1
  br label %fixmerge544
fixslow543:
  %t1448 = call i64 @rt_lt(i64 %t1416, i64 %t1442)
  br label %fixmerge544
fixmerge544:
  %t1449 = phi i64 [ %t1447, %fixfast542 ], [ %t1448, %fixslow543 ]
  %t1450 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1450)
  %t1451 = and i64 %t1450, -8
  %t1452 = inttoptr i64 %t1451 to ptr
  %t1453 = load i64, ptr %t1452
  %t1454 = inttoptr i64 %t1453 to ptr
  %t1455 = call fastcc i64%t1454(i64 %t1450, i64 3, i64 %a0, i64 %t1442, i64 %t1393, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1456 = or i64 %t1410, %t1416
  %t1457 = and i64 %t1456, 7
  %t1458 = icmp eq i64 %t1457, 0
  br i1 %t1458, label %fixfast545, label %fixslow546
fixfast545:
  %t1459 = icmp slt i64 %t1410, %t1416
  %t1460 = select i1 %t1459, i64 257, i64 1
  br label %fixmerge547
fixslow546:
  %t1461 = call i64 @rt_lt(i64 %t1410, i64 %t1416)
  br label %fixmerge547
fixmerge547:
  %t1462 = phi i64 [ %t1460, %fixfast545 ], [ %t1461, %fixslow546 ]
  %t1463 = icmp ne i64 %t1462, 1
  br i1 %t1463, label %then548, label %else549
then548:
  br label %merge550
else549:
  %t1464 = or i64 %t1442, %t1455
  %t1465 = and i64 %t1464, 7
  %t1466 = icmp eq i64 %t1465, 0
  br i1 %t1466, label %fixfast551, label %fixslow552
fixfast551:
  %t1467 = icmp slt i64 %t1442, %t1455
  %t1468 = select i1 %t1467, i64 257, i64 1
  br label %fixmerge553
fixslow552:
  %t1469 = call i64 @rt_lt(i64 %t1442, i64 %t1455)
  br label %fixmerge553
fixmerge553:
  %t1470 = phi i64 [ %t1468, %fixfast551 ], [ %t1469, %fixslow552 ]
  br label %merge550
merge550:
  %t1471 = phi i64 [ %t1462, %then548 ], [ %t1470, %fixmerge553 ]
  %t1472 = icmp ne i64 %t1471, 1
  br i1 %t1472, label %then554, label %else555
then554:
  %t1473 = or i64 %t1455, %t1393
  %t1474 = and i64 %t1473, 7
  %t1475 = icmp eq i64 %t1474, 0
  br i1 %t1475, label %fixfast556, label %fixslow557
fixfast556:
  %t1476 = icmp slt i64 %t1455, %t1393
  %t1477 = select i1 %t1476, i64 257, i64 1
  br label %fixmerge558
fixslow557:
  %t1478 = call i64 @rt_lt(i64 %t1455, i64 %t1393)
  br label %fixmerge558
fixmerge558:
  %t1479 = phi i64 [ %t1477, %fixfast556 ], [ %t1478, %fixslow557 ]
  %t1480 = icmp ne i64 %t1479, 1
  br i1 %t1480, label %then559, label %else560
then559:
  %t1481 = call i64 @rt_string_ref(i64 %a0, i64 %t1455)
  %t1482 = load i64, ptr @"emit.internal:rd-exp-char?"
  call void @rt_check_callable(i64 %t1482)
  %t1483 = and i64 %t1482, -8
  %t1484 = inttoptr i64 %t1483 to ptr
  %t1485 = load i64, ptr %t1484
  %t1486 = inttoptr i64 %t1485 to ptr
  %t1487 = call fastcc i64%t1486(i64 %t1482, i64 1, i64 %t1481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge561
else560:
  br label %merge561
merge561:
  %t1488 = phi i64 [ %t1487, %then559 ], [ 1, %else560 ]
  %t1489 = icmp ne i64 %t1488, 1
  br i1 %t1489, label %then562, label %else563
then562:
  %t1490 = or i64 %t1455, 8
  %t1491 = and i64 %t1490, 7
  %t1492 = icmp eq i64 %t1491, 0
  br i1 %t1492, label %fixfast565, label %fixslow566
fixfast565:
  %t1493 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1455, i64 8)
  %t1494 = extractvalue {i64, i1} %t1493, 0
  %t1495 = extractvalue {i64, i1} %t1493, 1
  br i1 %t1495, label %fixslow566, label %fixmerge567
fixslow566:
  %t1496 = call i64 @rt_add(i64 %t1455, i64 8)
  br label %fixmerge567
fixmerge567:
  %t1497 = phi i64 [ %t1494, %fixfast565 ], [ %t1496, %fixslow566 ]
  %t1498 = or i64 %t1497, %t1393
  %t1499 = and i64 %t1498, 7
  %t1500 = icmp eq i64 %t1499, 0
  br i1 %t1500, label %fixfast568, label %fixslow569
fixfast568:
  %t1501 = icmp slt i64 %t1497, %t1393
  %t1502 = select i1 %t1501, i64 257, i64 1
  br label %fixmerge570
fixslow569:
  %t1503 = call i64 @rt_lt(i64 %t1497, i64 %t1393)
  br label %fixmerge570
fixmerge570:
  %t1504 = phi i64 [ %t1502, %fixfast568 ], [ %t1503, %fixslow569 ]
  %t1505 = icmp ne i64 %t1504, 1
  br i1 %t1505, label %then571, label %else572
then571:
  %t1506 = or i64 %t1455, 8
  %t1507 = and i64 %t1506, 7
  %t1508 = icmp eq i64 %t1507, 0
  br i1 %t1508, label %fixfast574, label %fixslow575
fixfast574:
  %t1509 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1455, i64 8)
  %t1510 = extractvalue {i64, i1} %t1509, 0
  %t1511 = extractvalue {i64, i1} %t1509, 1
  br i1 %t1511, label %fixslow575, label %fixmerge576
fixslow575:
  %t1512 = call i64 @rt_add(i64 %t1455, i64 8)
  br label %fixmerge576
fixmerge576:
  %t1513 = phi i64 [ %t1510, %fixfast574 ], [ %t1512, %fixslow575 ]
  %t1514 = call i64 @rt_string_ref(i64 %a0, i64 %t1513)
  %t1515 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1515)
  %t1516 = and i64 %t1515, -8
  %t1517 = inttoptr i64 %t1516 to ptr
  %t1518 = load i64, ptr %t1517
  %t1519 = inttoptr i64 %t1518 to ptr
  %t1520 = call fastcc i64%t1519(i64 %t1515, i64 1, i64 %t1514, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge573
else572:
  br label %merge573
merge573:
  %t1521 = phi i64 [ %t1520, %fixmerge576 ], [ 1, %else572 ]
  %t1522 = icmp ne i64 %t1521, 1
  br i1 %t1522, label %then577, label %else578
then577:
  %t1523 = or i64 %t1455, 16
  %t1524 = and i64 %t1523, 7
  %t1525 = icmp eq i64 %t1524, 0
  br i1 %t1525, label %fixfast580, label %fixslow581
fixfast580:
  %t1526 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1455, i64 16)
  %t1527 = extractvalue {i64, i1} %t1526, 0
  %t1528 = extractvalue {i64, i1} %t1526, 1
  br i1 %t1528, label %fixslow581, label %fixmerge582
fixslow581:
  %t1529 = call i64 @rt_add(i64 %t1455, i64 16)
  br label %fixmerge582
fixmerge582:
  %t1530 = phi i64 [ %t1527, %fixfast580 ], [ %t1529, %fixslow581 ]
  br label %merge579
else578:
  %t1531 = or i64 %t1455, 8
  %t1532 = and i64 %t1531, 7
  %t1533 = icmp eq i64 %t1532, 0
  br i1 %t1533, label %fixfast583, label %fixslow584
fixfast583:
  %t1534 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1455, i64 8)
  %t1535 = extractvalue {i64, i1} %t1534, 0
  %t1536 = extractvalue {i64, i1} %t1534, 1
  br i1 %t1536, label %fixslow584, label %fixmerge585
fixslow584:
  %t1537 = call i64 @rt_add(i64 %t1455, i64 8)
  br label %fixmerge585
fixmerge585:
  %t1538 = phi i64 [ %t1535, %fixfast583 ], [ %t1537, %fixslow584 ]
  br label %merge579
merge579:
  %t1539 = phi i64 [ %t1530, %fixmerge582 ], [ %t1538, %fixmerge585 ]
  %t1540 = load i64, ptr @"emit.internal:rd-scan-digits"
  call void @rt_check_callable(i64 %t1540)
  %t1541 = and i64 %t1540, -8
  %t1542 = inttoptr i64 %t1541 to ptr
  %t1543 = load i64, ptr %t1542
  %t1544 = inttoptr i64 %t1543 to ptr
  %t1545 = call fastcc i64%t1544(i64 %t1540, i64 3, i64 %a0, i64 %t1539, i64 %t1393, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1546 = or i64 %t1539, %t1545
  %t1547 = and i64 %t1546, 7
  %t1548 = icmp eq i64 %t1547, 0
  br i1 %t1548, label %fixfast586, label %fixslow587
fixfast586:
  %t1549 = icmp slt i64 %t1539, %t1545
  %t1550 = select i1 %t1549, i64 257, i64 1
  br label %fixmerge588
fixslow587:
  %t1551 = call i64 @rt_lt(i64 %t1539, i64 %t1545)
  br label %fixmerge588
fixmerge588:
  %t1552 = phi i64 [ %t1550, %fixfast586 ], [ %t1551, %fixslow587 ]
  %t1553 = icmp ne i64 %t1552, 1
  br i1 %t1553, label %then589, label %else590
then589:
  br label %merge591
else590:
  br label %merge591
merge591:
  %t1554 = phi i64 [ %t1545, %then589 ], [ -8, %else590 ]
  br label %merge564
else563:
  br label %merge564
merge564:
  %t1555 = phi i64 [ %t1554, %merge591 ], [ %t1455, %else563 ]
  %t1556 = or i64 -8, %t1555
  %t1557 = and i64 %t1556, 7
  %t1558 = icmp eq i64 %t1557, 0
  br i1 %t1558, label %fixfast592, label %fixslow593
fixfast592:
  %t1559 = icmp slt i64 -8, %t1555
  %t1560 = select i1 %t1559, i64 257, i64 1
  br label %fixmerge594
fixslow593:
  %t1561 = call i64 @rt_lt(i64 -8, i64 %t1555)
  br label %fixmerge594
fixmerge594:
  %t1562 = phi i64 [ %t1560, %fixfast592 ], [ %t1561, %fixslow593 ]
  %t1563 = icmp ne i64 %t1562, 1
  br i1 %t1563, label %then595, label %else596
then595:
  %t1564 = or i64 %t1555, %t1393
  %t1565 = and i64 %t1564, 7
  %t1566 = icmp eq i64 %t1565, 0
  br i1 %t1566, label %fixfast597, label %fixslow598
fixfast597:
  %t1567 = icmp eq i64 %t1555, %t1393
  %t1568 = select i1 %t1567, i64 257, i64 1
  br label %fixmerge599
fixslow598:
  %t1569 = call i64 @rt_num_eq(i64 %t1555, i64 %t1393)
  br label %fixmerge599
fixmerge599:
  %t1570 = phi i64 [ %t1568, %fixfast597 ], [ %t1569, %fixslow598 ]
  %t1571 = icmp ne i64 %t1570, 1
  br i1 %t1571, label %then600, label %else601
then600:
  %t1572 = icmp ne i64 %t1449, 1
  br i1 %t1572, label %then602, label %else603
then602:
  ret i64 %t1449
else603:
  %t1573 = or i64 %t1455, %t1555
  %t1574 = and i64 %t1573, 7
  %t1575 = icmp eq i64 %t1574, 0
  br i1 %t1575, label %fixfast604, label %fixslow605
fixfast604:
  %t1576 = icmp slt i64 %t1455, %t1555
  %t1577 = select i1 %t1576, i64 257, i64 1
  br label %fixmerge606
fixslow605:
  %t1578 = call i64 @rt_lt(i64 %t1455, i64 %t1555)
  br label %fixmerge606
fixmerge606:
  %t1579 = phi i64 [ %t1577, %fixfast604 ], [ %t1578, %fixslow605 ]
  ret i64 %t1579
else601:
  ret i64 1
else596:
  ret i64 1
else555:
  ret i64 1
else526:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_480"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1584 = icmp eq i64 %argc, 1
  br i1 %t1584, label %argok608, label %arityerr607
arityerr607:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok608:
  %t1585 = and i64 %self, -8
  %t1586 = inttoptr i64 %t1585 to ptr
  %t1587 = getelementptr i64, ptr %t1586, i64 1
  %t1588 = load i64, ptr %t1587
  %t1589 = or i64 %a0, %t1588
  %t1590 = and i64 %t1589, 7
  %t1591 = icmp eq i64 %t1590, 0
  br i1 %t1591, label %fixfast609, label %fixslow610
fixfast609:
  %t1592 = icmp slt i64 %a0, %t1588
  %t1593 = select i1 %t1592, i64 257, i64 1
  br label %fixmerge611
fixslow610:
  %t1594 = call i64 @rt_lt(i64 %a0, i64 %t1588)
  br label %fixmerge611
fixmerge611:
  %t1595 = phi i64 [ %t1593, %fixfast609 ], [ %t1594, %fixslow610 ]
  %t1596 = icmp ne i64 %t1595, 1
  br i1 %t1596, label %then612, label %else613
then612:
  %t1597 = and i64 %self, -8
  %t1598 = inttoptr i64 %t1597 to ptr
  %t1599 = getelementptr i64, ptr %t1598, i64 2
  %t1600 = load i64, ptr %t1599
  %t1601 = call i64 @rt_string_ref(i64 %t1600, i64 %a0)
  %t1602 = load i64, ptr @"emit.internal:rd-fold-char"
  call void @rt_check_callable(i64 %t1602)
  %t1603 = and i64 %t1602, -8
  %t1604 = inttoptr i64 %t1603 to ptr
  %t1605 = load i64, ptr %t1604
  %t1606 = inttoptr i64 %t1605 to ptr
  %t1607 = call fastcc i64%t1606(i64 %t1602, i64 1, i64 %t1601, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1608 = call i64 @rt_char_to_integer(i64 %t1607)
  %t1609 = and i64 %self, -8
  %t1610 = inttoptr i64 %t1609 to ptr
  %t1611 = getelementptr i64, ptr %t1610, i64 3
  %t1612 = load i64, ptr %t1611
  %t1613 = call i64 @rt_string_ref(i64 %t1612, i64 %a0)
  %t1614 = call i64 @rt_char_to_integer(i64 %t1613)
  %t1615 = or i64 %t1608, %t1614
  %t1616 = and i64 %t1615, 7
  %t1617 = icmp eq i64 %t1616, 0
  br i1 %t1617, label %fixfast614, label %fixslow615
fixfast614:
  %t1618 = icmp eq i64 %t1608, %t1614
  %t1619 = select i1 %t1618, i64 257, i64 1
  br label %fixmerge616
fixslow615:
  %t1620 = call i64 @rt_num_eq(i64 %t1608, i64 %t1614)
  br label %fixmerge616
fixmerge616:
  %t1621 = phi i64 [ %t1619, %fixfast614 ], [ %t1620, %fixslow615 ]
  %t1622 = icmp ne i64 %t1621, 1
  br i1 %t1622, label %then617, label %else618
then617:
  %t1623 = or i64 %a0, 8
  %t1624 = and i64 %t1623, 7
  %t1625 = icmp eq i64 %t1624, 0
  br i1 %t1625, label %fixfast619, label %fixslow620
fixfast619:
  %t1626 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t1627 = extractvalue {i64, i1} %t1626, 0
  %t1628 = extractvalue {i64, i1} %t1626, 1
  br i1 %t1628, label %fixslow620, label %fixmerge621
fixslow620:
  %t1629 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge621
fixmerge621:
  %t1630 = phi i64 [ %t1627, %fixfast619 ], [ %t1629, %fixslow620 ]
  %t1631 = musttail call fastcc i64 @"emit.internal:code_480"(i64 %self, i64 1, i64 %t1630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1631
else618:
  ret i64 1
else613:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-ci=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1632 = icmp eq i64 %argc, 2
  br i1 %t1632, label %argok623, label %arityerr622
arityerr622:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok623:
  %t1633 = call i64 @rt_string_length(i64 %a0)
  %t1634 = call i64 @rt_string_length(i64 %a1)
  %t1635 = or i64 %t1633, %t1634
  %t1636 = and i64 %t1635, 7
  %t1637 = icmp eq i64 %t1636, 0
  br i1 %t1637, label %fixfast624, label %fixslow625
fixfast624:
  %t1638 = icmp eq i64 %t1633, %t1634
  %t1639 = select i1 %t1638, i64 257, i64 1
  br label %fixmerge626
fixslow625:
  %t1640 = call i64 @rt_num_eq(i64 %t1633, i64 %t1634)
  br label %fixmerge626
fixmerge626:
  %t1641 = phi i64 [ %t1639, %fixfast624 ], [ %t1640, %fixslow625 ]
  %t1642 = icmp ne i64 %t1641, 1
  br i1 %t1642, label %then627, label %else628
then627:
  %t1643 = call ptr @rt_alloc_words(i64 5)
  %t1644 = ptrtoint ptr %t1643 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_480" to i64), ptr %t1643
  %t1645 = or i64 %t1644, 4
  %t1646 = getelementptr i64, ptr %t1643, i64 1
  store i64 %t1633, ptr %t1646
  %t1647 = getelementptr i64, ptr %t1643, i64 2
  store i64 %a0, ptr %t1647
  %t1648 = getelementptr i64, ptr %t1643, i64 3
  store i64 %a1, ptr %t1648
  %t1649 = getelementptr i64, ptr %t1643, i64 4
  store i64 %t1645, ptr %t1649
  %t1650 = musttail call fastcc i64 @"emit.internal:code_480"(i64 %t1645, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1650
else628:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1655 = icmp eq i64 %argc, 1
  br i1 %t1655, label %argok630, label %arityerr629
arityerr629:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok630:
  %t1656 = call i64 @rt_make_string(ptr @.str.lit.0, i64 6)
  %t1657 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t1657)
  %t1658 = and i64 %t1657, -8
  %t1659 = inttoptr i64 %t1658 to ptr
  %t1660 = load i64, ptr %t1659
  %t1661 = inttoptr i64 %t1660 to ptr
  %t1662 = call fastcc i64%t1661(i64 %t1657, i64 2, i64 %a0, i64 %t1656, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1663 = icmp ne i64 %t1662, 1
  br i1 %t1663, label %then631, label %else632
then631:
  %t1664 = call i64 @rt_make_string(ptr @.str.lit.1, i64 3)
  %t1665 = call i64 @rt_string_to_flonum(i64 %t1664)
  ret i64 %t1665
else632:
  %t1666 = call i64 @rt_make_string(ptr @.str.lit.2, i64 6)
  %t1667 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t1667)
  %t1668 = and i64 %t1667, -8
  %t1669 = inttoptr i64 %t1668 to ptr
  %t1670 = load i64, ptr %t1669
  %t1671 = inttoptr i64 %t1670 to ptr
  %t1672 = call fastcc i64%t1671(i64 %t1667, i64 2, i64 %a0, i64 %t1666, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1673 = icmp ne i64 %t1672, 1
  br i1 %t1673, label %then633, label %else634
then633:
  %t1674 = call i64 @rt_make_string(ptr @.str.lit.3, i64 4)
  %t1675 = call i64 @rt_string_to_flonum(i64 %t1674)
  ret i64 %t1675
else634:
  %t1676 = call i64 @rt_make_string(ptr @.str.lit.4, i64 6)
  %t1677 = load i64, ptr @"emit.internal:rd-ci=?"
  call void @rt_check_callable(i64 %t1677)
  %t1678 = and i64 %t1677, -8
  %t1679 = inttoptr i64 %t1678 to ptr
  %t1680 = load i64, ptr %t1679
  %t1681 = inttoptr i64 %t1680 to ptr
  %t1682 = call fastcc i64%t1681(i64 %t1677, i64 2, i64 %a0, i64 %t1676, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1683 = icmp ne i64 %t1682, 1
  br i1 %t1683, label %then635, label %else636
then635:
  %t1684 = call i64 @rt_make_string(ptr @.str.lit.5, i64 3)
  %t1685 = call i64 @rt_string_to_flonum(i64 %t1684)
  ret i64 %t1685
else636:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-radix-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1690 = icmp eq i64 %argc, 1
  br i1 %t1690, label %argok638, label %arityerr637
arityerr637:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok638:
  %t1691 = call i64 @rt_char_to_integer(i64 %a0)
  %t1692 = or i64 %t1691, 784
  %t1693 = and i64 %t1692, 7
  %t1694 = icmp eq i64 %t1693, 0
  br i1 %t1694, label %fixfast639, label %fixslow640
fixfast639:
  %t1695 = icmp eq i64 %t1691, 784
  %t1696 = select i1 %t1695, i64 257, i64 1
  br label %fixmerge641
fixslow640:
  %t1697 = call i64 @rt_num_eq(i64 %t1691, i64 784)
  br label %fixmerge641
fixmerge641:
  %t1698 = phi i64 [ %t1696, %fixfast639 ], [ %t1697, %fixslow640 ]
  %t1699 = icmp ne i64 %t1698, 1
  br i1 %t1699, label %then642, label %else643
then642:
  br label %merge644
else643:
  %t1700 = or i64 %t1691, 528
  %t1701 = and i64 %t1700, 7
  %t1702 = icmp eq i64 %t1701, 0
  br i1 %t1702, label %fixfast645, label %fixslow646
fixfast645:
  %t1703 = icmp eq i64 %t1691, 528
  %t1704 = select i1 %t1703, i64 257, i64 1
  br label %fixmerge647
fixslow646:
  %t1705 = call i64 @rt_num_eq(i64 %t1691, i64 528)
  br label %fixmerge647
fixmerge647:
  %t1706 = phi i64 [ %t1704, %fixfast645 ], [ %t1705, %fixslow646 ]
  br label %merge644
merge644:
  %t1707 = phi i64 [ %t1698, %then642 ], [ %t1706, %fixmerge647 ]
  %t1708 = icmp ne i64 %t1707, 1
  br i1 %t1708, label %then648, label %else649
then648:
  ret i64 16
else649:
  %t1709 = or i64 %t1691, 888
  %t1710 = and i64 %t1709, 7
  %t1711 = icmp eq i64 %t1710, 0
  br i1 %t1711, label %fixfast650, label %fixslow651
fixfast650:
  %t1712 = icmp eq i64 %t1691, 888
  %t1713 = select i1 %t1712, i64 257, i64 1
  br label %fixmerge652
fixslow651:
  %t1714 = call i64 @rt_num_eq(i64 %t1691, i64 888)
  br label %fixmerge652
fixmerge652:
  %t1715 = phi i64 [ %t1713, %fixfast650 ], [ %t1714, %fixslow651 ]
  %t1716 = icmp ne i64 %t1715, 1
  br i1 %t1716, label %then653, label %else654
then653:
  br label %merge655
else654:
  %t1717 = or i64 %t1691, 632
  %t1718 = and i64 %t1717, 7
  %t1719 = icmp eq i64 %t1718, 0
  br i1 %t1719, label %fixfast656, label %fixslow657
fixfast656:
  %t1720 = icmp eq i64 %t1691, 632
  %t1721 = select i1 %t1720, i64 257, i64 1
  br label %fixmerge658
fixslow657:
  %t1722 = call i64 @rt_num_eq(i64 %t1691, i64 632)
  br label %fixmerge658
fixmerge658:
  %t1723 = phi i64 [ %t1721, %fixfast656 ], [ %t1722, %fixslow657 ]
  br label %merge655
merge655:
  %t1724 = phi i64 [ %t1715, %then653 ], [ %t1723, %fixmerge658 ]
  %t1725 = icmp ne i64 %t1724, 1
  br i1 %t1725, label %then659, label %else660
then659:
  ret i64 64
else660:
  %t1726 = or i64 %t1691, 800
  %t1727 = and i64 %t1726, 7
  %t1728 = icmp eq i64 %t1727, 0
  br i1 %t1728, label %fixfast661, label %fixslow662
fixfast661:
  %t1729 = icmp eq i64 %t1691, 800
  %t1730 = select i1 %t1729, i64 257, i64 1
  br label %fixmerge663
fixslow662:
  %t1731 = call i64 @rt_num_eq(i64 %t1691, i64 800)
  br label %fixmerge663
fixmerge663:
  %t1732 = phi i64 [ %t1730, %fixfast661 ], [ %t1731, %fixslow662 ]
  %t1733 = icmp ne i64 %t1732, 1
  br i1 %t1733, label %then664, label %else665
then664:
  br label %merge666
else665:
  %t1734 = or i64 %t1691, 544
  %t1735 = and i64 %t1734, 7
  %t1736 = icmp eq i64 %t1735, 0
  br i1 %t1736, label %fixfast667, label %fixslow668
fixfast667:
  %t1737 = icmp eq i64 %t1691, 544
  %t1738 = select i1 %t1737, i64 257, i64 1
  br label %fixmerge669
fixslow668:
  %t1739 = call i64 @rt_num_eq(i64 %t1691, i64 544)
  br label %fixmerge669
fixmerge669:
  %t1740 = phi i64 [ %t1738, %fixfast667 ], [ %t1739, %fixslow668 ]
  br label %merge666
merge666:
  %t1741 = phi i64 [ %t1732, %then664 ], [ %t1740, %fixmerge669 ]
  %t1742 = icmp ne i64 %t1741, 1
  br i1 %t1742, label %then670, label %else671
then670:
  ret i64 80
else671:
  %t1743 = or i64 %t1691, 960
  %t1744 = and i64 %t1743, 7
  %t1745 = icmp eq i64 %t1744, 0
  br i1 %t1745, label %fixfast672, label %fixslow673
fixfast672:
  %t1746 = icmp eq i64 %t1691, 960
  %t1747 = select i1 %t1746, i64 257, i64 1
  br label %fixmerge674
fixslow673:
  %t1748 = call i64 @rt_num_eq(i64 %t1691, i64 960)
  br label %fixmerge674
fixmerge674:
  %t1749 = phi i64 [ %t1747, %fixfast672 ], [ %t1748, %fixslow673 ]
  %t1750 = icmp ne i64 %t1749, 1
  br i1 %t1750, label %then675, label %else676
then675:
  br label %merge677
else676:
  %t1751 = or i64 %t1691, 704
  %t1752 = and i64 %t1751, 7
  %t1753 = icmp eq i64 %t1752, 0
  br i1 %t1753, label %fixfast678, label %fixslow679
fixfast678:
  %t1754 = icmp eq i64 %t1691, 704
  %t1755 = select i1 %t1754, i64 257, i64 1
  br label %fixmerge680
fixslow679:
  %t1756 = call i64 @rt_num_eq(i64 %t1691, i64 704)
  br label %fixmerge680
fixmerge680:
  %t1757 = phi i64 [ %t1755, %fixfast678 ], [ %t1756, %fixslow679 ]
  br label %merge677
merge677:
  %t1758 = phi i64 [ %t1749, %then675 ], [ %t1757, %fixmerge680 ]
  %t1759 = icmp ne i64 %t1758, 1
  br i1 %t1759, label %then681, label %else682
then681:
  ret i64 128
else682:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1764 = icmp eq i64 %argc, 1
  br i1 %t1764, label %argok684, label %arityerr683
arityerr683:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok684:
  %t1765 = call i64 @rt_char_to_integer(i64 %a0)
  %t1766 = or i64 %t1765, 808
  %t1767 = and i64 %t1766, 7
  %t1768 = icmp eq i64 %t1767, 0
  br i1 %t1768, label %fixfast685, label %fixslow686
fixfast685:
  %t1769 = icmp eq i64 %t1765, 808
  %t1770 = select i1 %t1769, i64 257, i64 1
  br label %fixmerge687
fixslow686:
  %t1771 = call i64 @rt_num_eq(i64 %t1765, i64 808)
  br label %fixmerge687
fixmerge687:
  %t1772 = phi i64 [ %t1770, %fixfast685 ], [ %t1771, %fixslow686 ]
  %t1773 = icmp ne i64 %t1772, 1
  br i1 %t1773, label %then688, label %else689
then688:
  br label %merge690
else689:
  %t1774 = or i64 %t1765, 552
  %t1775 = and i64 %t1774, 7
  %t1776 = icmp eq i64 %t1775, 0
  br i1 %t1776, label %fixfast691, label %fixslow692
fixfast691:
  %t1777 = icmp eq i64 %t1765, 552
  %t1778 = select i1 %t1777, i64 257, i64 1
  br label %fixmerge693
fixslow692:
  %t1779 = call i64 @rt_num_eq(i64 %t1765, i64 552)
  br label %fixmerge693
fixmerge693:
  %t1780 = phi i64 [ %t1778, %fixfast691 ], [ %t1779, %fixslow692 ]
  br label %merge690
merge690:
  %t1781 = phi i64 [ %t1772, %then688 ], [ %t1780, %fixmerge693 ]
  %t1782 = icmp ne i64 %t1781, 1
  br i1 %t1782, label %then694, label %else695
then694:
  ret i64 8
else695:
  %t1783 = or i64 %t1765, 840
  %t1784 = and i64 %t1783, 7
  %t1785 = icmp eq i64 %t1784, 0
  br i1 %t1785, label %fixfast696, label %fixslow697
fixfast696:
  %t1786 = icmp eq i64 %t1765, 840
  %t1787 = select i1 %t1786, i64 257, i64 1
  br label %fixmerge698
fixslow697:
  %t1788 = call i64 @rt_num_eq(i64 %t1765, i64 840)
  br label %fixmerge698
fixmerge698:
  %t1789 = phi i64 [ %t1787, %fixfast696 ], [ %t1788, %fixslow697 ]
  %t1790 = icmp ne i64 %t1789, 1
  br i1 %t1790, label %then699, label %else700
then699:
  br label %merge701
else700:
  %t1791 = or i64 %t1765, 584
  %t1792 = and i64 %t1791, 7
  %t1793 = icmp eq i64 %t1792, 0
  br i1 %t1793, label %fixfast702, label %fixslow703
fixfast702:
  %t1794 = icmp eq i64 %t1765, 584
  %t1795 = select i1 %t1794, i64 257, i64 1
  br label %fixmerge704
fixslow703:
  %t1796 = call i64 @rt_num_eq(i64 %t1765, i64 584)
  br label %fixmerge704
fixmerge704:
  %t1797 = phi i64 [ %t1795, %fixfast702 ], [ %t1796, %fixslow703 ]
  br label %merge701
merge701:
  %t1798 = phi i64 [ %t1789, %then699 ], [ %t1797, %fixmerge704 ]
  %t1799 = icmp ne i64 %t1798, 1
  br i1 %t1799, label %then705, label %else706
then705:
  ret i64 16
else706:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-scan-prefixes"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1804 = icmp eq i64 %argc, 5
  br i1 %t1804, label %argok708, label %arityerr707
arityerr707:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok708:
  %t1805 = or i64 %a2, %a1
  %t1806 = and i64 %t1805, 7
  %t1807 = icmp eq i64 %t1806, 0
  br i1 %t1807, label %fixfast709, label %fixslow710
fixfast709:
  %t1808 = icmp slt i64 %a2, %a1
  %t1809 = select i1 %t1808, i64 257, i64 1
  br label %fixmerge711
fixslow710:
  %t1810 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge711
fixmerge711:
  %t1811 = phi i64 [ %t1809, %fixfast709 ], [ %t1810, %fixslow710 ]
  %t1812 = icmp ne i64 %t1811, 1
  br i1 %t1812, label %then712, label %else713
then712:
  %t1813 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1814 = call i64 @rt_char_to_integer(i64 %t1813)
  %t1815 = or i64 %t1814, 280
  %t1816 = and i64 %t1815, 7
  %t1817 = icmp eq i64 %t1816, 0
  br i1 %t1817, label %fixfast715, label %fixslow716
fixfast715:
  %t1818 = icmp eq i64 %t1814, 280
  %t1819 = select i1 %t1818, i64 257, i64 1
  br label %fixmerge717
fixslow716:
  %t1820 = call i64 @rt_num_eq(i64 %t1814, i64 280)
  br label %fixmerge717
fixmerge717:
  %t1821 = phi i64 [ %t1819, %fixfast715 ], [ %t1820, %fixslow716 ]
  br label %merge714
else713:
  br label %merge714
merge714:
  %t1822 = phi i64 [ %t1821, %fixmerge717 ], [ 1, %else713 ]
  %t1823 = icmp ne i64 %t1822, 1
  br i1 %t1823, label %then718, label %else719
then718:
  %t1824 = or i64 %a2, 8
  %t1825 = and i64 %t1824, 7
  %t1826 = icmp eq i64 %t1825, 0
  br i1 %t1826, label %fixfast720, label %fixslow721
fixfast720:
  %t1827 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1828 = extractvalue {i64, i1} %t1827, 0
  %t1829 = extractvalue {i64, i1} %t1827, 1
  br i1 %t1829, label %fixslow721, label %fixmerge722
fixslow721:
  %t1830 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge722
fixmerge722:
  %t1831 = phi i64 [ %t1828, %fixfast720 ], [ %t1830, %fixslow721 ]
  %t1832 = or i64 %t1831, %a1
  %t1833 = and i64 %t1832, 7
  %t1834 = icmp eq i64 %t1833, 0
  br i1 %t1834, label %fixfast723, label %fixslow724
fixfast723:
  %t1835 = icmp slt i64 %t1831, %a1
  %t1836 = select i1 %t1835, i64 257, i64 1
  br label %fixmerge725
fixslow724:
  %t1837 = call i64 @rt_lt(i64 %t1831, i64 %a1)
  br label %fixmerge725
fixmerge725:
  %t1838 = phi i64 [ %t1836, %fixfast723 ], [ %t1837, %fixslow724 ]
  %t1839 = icmp ne i64 %t1838, 1
  br i1 %t1839, label %then726, label %else727
then726:
  %t1840 = or i64 %a2, 8
  %t1841 = and i64 %t1840, 7
  %t1842 = icmp eq i64 %t1841, 0
  br i1 %t1842, label %fixfast728, label %fixslow729
fixfast728:
  %t1843 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1844 = extractvalue {i64, i1} %t1843, 0
  %t1845 = extractvalue {i64, i1} %t1843, 1
  br i1 %t1845, label %fixslow729, label %fixmerge730
fixslow729:
  %t1846 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge730
fixmerge730:
  %t1847 = phi i64 [ %t1844, %fixfast728 ], [ %t1846, %fixslow729 ]
  %t1848 = call i64 @rt_string_ref(i64 %a0, i64 %t1847)
  %t1849 = load i64, ptr @"emit.internal:rd-radix-letter"
  call void @rt_check_callable(i64 %t1849)
  %t1850 = and i64 %t1849, -8
  %t1851 = inttoptr i64 %t1850 to ptr
  %t1852 = load i64, ptr %t1851
  %t1853 = inttoptr i64 %t1852 to ptr
  %t1854 = call fastcc i64%t1853(i64 %t1849, i64 1, i64 %t1848, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1855 = icmp ne i64 %t1854, 1
  br i1 %t1855, label %then731, label %else732
then731:
  %t1856 = icmp ne i64 %a3, 1
  br i1 %t1856, label %then733, label %else734
then733:
  ret i64 1
else734:
  %t1857 = or i64 %a2, 16
  %t1858 = and i64 %t1857, 7
  %t1859 = icmp eq i64 %t1858, 0
  br i1 %t1859, label %fixfast735, label %fixslow736
fixfast735:
  %t1860 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1861 = extractvalue {i64, i1} %t1860, 0
  %t1862 = extractvalue {i64, i1} %t1860, 1
  br i1 %t1862, label %fixslow736, label %fixmerge737
fixslow736:
  %t1863 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge737
fixmerge737:
  %t1864 = phi i64 [ %t1861, %fixfast735 ], [ %t1863, %fixslow736 ]
  %t1865 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t1865)
  %t1866 = and i64 %t1865, -8
  %t1867 = inttoptr i64 %t1866 to ptr
  %t1868 = load i64, ptr %t1867
  %t1869 = inttoptr i64 %t1868 to ptr
  %t1870 = musttail call fastcc i64 %t1869(i64 %t1865, i64 5, i64 %a0, i64 %a1, i64 %t1864, i64 %t1854, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1870
else732:
  %t1871 = or i64 %a2, 8
  %t1872 = and i64 %t1871, 7
  %t1873 = icmp eq i64 %t1872, 0
  br i1 %t1873, label %fixfast738, label %fixslow739
fixfast738:
  %t1874 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1875 = extractvalue {i64, i1} %t1874, 0
  %t1876 = extractvalue {i64, i1} %t1874, 1
  br i1 %t1876, label %fixslow739, label %fixmerge740
fixslow739:
  %t1877 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge740
fixmerge740:
  %t1878 = phi i64 [ %t1875, %fixfast738 ], [ %t1877, %fixslow739 ]
  %t1879 = call i64 @rt_string_ref(i64 %a0, i64 %t1878)
  %t1880 = load i64, ptr @"emit.internal:rd-exactness-letter"
  call void @rt_check_callable(i64 %t1880)
  %t1881 = and i64 %t1880, -8
  %t1882 = inttoptr i64 %t1881 to ptr
  %t1883 = load i64, ptr %t1882
  %t1884 = inttoptr i64 %t1883 to ptr
  %t1885 = call fastcc i64%t1884(i64 %t1880, i64 1, i64 %t1879, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1886 = icmp ne i64 %t1885, 1
  br i1 %t1886, label %then741, label %else742
then741:
  %t1887 = icmp ne i64 %a4, 1
  br i1 %t1887, label %then743, label %else744
then743:
  ret i64 1
else744:
  %t1888 = or i64 %a2, 16
  %t1889 = and i64 %t1888, 7
  %t1890 = icmp eq i64 %t1889, 0
  br i1 %t1890, label %fixfast745, label %fixslow746
fixfast745:
  %t1891 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1892 = extractvalue {i64, i1} %t1891, 0
  %t1893 = extractvalue {i64, i1} %t1891, 1
  br i1 %t1893, label %fixslow746, label %fixmerge747
fixslow746:
  %t1894 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge747
fixmerge747:
  %t1895 = phi i64 [ %t1892, %fixfast745 ], [ %t1894, %fixslow746 ]
  %t1896 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t1896)
  %t1897 = and i64 %t1896, -8
  %t1898 = inttoptr i64 %t1897 to ptr
  %t1899 = load i64, ptr %t1898
  %t1900 = inttoptr i64 %t1899 to ptr
  %t1901 = musttail call fastcc i64 %t1900(i64 %t1896, i64 5, i64 %a0, i64 %a1, i64 %t1895, i64 %a3, i64 %t1885, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1901
else742:
  ret i64 1
else727:
  ret i64 1
else719:
  %t1902 = call i64 @rt_cons(i64 %a4, i64 %a2)
  %t1903 = call i64 @rt_cons(i64 %a3, i64 %t1902)
  ret i64 %t1903
}

define fastcc i64 @"emit.internal:code:rd-radix-scan"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1908 = icmp eq i64 %argc, 4
  br i1 %t1908, label %argok749, label %arityerr748
arityerr748:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok749:
  %t1909 = or i64 %a2, %a1
  %t1910 = and i64 %t1909, 7
  %t1911 = icmp eq i64 %t1910, 0
  br i1 %t1911, label %fixfast750, label %fixslow751
fixfast750:
  %t1912 = icmp slt i64 %a2, %a1
  %t1913 = select i1 %t1912, i64 257, i64 1
  br label %fixmerge752
fixslow751:
  %t1914 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge752
fixmerge752:
  %t1915 = phi i64 [ %t1913, %fixfast750 ], [ %t1914, %fixslow751 ]
  %t1916 = icmp ne i64 %t1915, 1
  br i1 %t1916, label %then753, label %else754
then753:
  %t1917 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1918 = load i64, ptr @"emit.internal:%digit-in-radix"
  call void @rt_check_callable(i64 %t1918)
  %t1919 = and i64 %t1918, -8
  %t1920 = inttoptr i64 %t1919 to ptr
  %t1921 = load i64, ptr %t1920
  %t1922 = inttoptr i64 %t1921 to ptr
  %t1923 = call fastcc i64%t1922(i64 %t1918, i64 2, i64 %t1917, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge755
else754:
  br label %merge755
merge755:
  %t1924 = phi i64 [ %t1923, %then753 ], [ 1, %else754 ]
  %t1925 = icmp ne i64 %t1924, 1
  br i1 %t1925, label %then756, label %else757
then756:
  %t1926 = or i64 %a2, 8
  %t1927 = and i64 %t1926, 7
  %t1928 = icmp eq i64 %t1927, 0
  br i1 %t1928, label %fixfast758, label %fixslow759
fixfast758:
  %t1929 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1930 = extractvalue {i64, i1} %t1929, 0
  %t1931 = extractvalue {i64, i1} %t1929, 1
  br i1 %t1931, label %fixslow759, label %fixmerge760
fixslow759:
  %t1932 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge760
fixmerge760:
  %t1933 = phi i64 [ %t1930, %fixfast758 ], [ %t1932, %fixslow759 ]
  %t1934 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t1934)
  %t1935 = and i64 %t1934, -8
  %t1936 = inttoptr i64 %t1935 to ptr
  %t1937 = load i64, ptr %t1936
  %t1938 = inttoptr i64 %t1937 to ptr
  %t1939 = musttail call fastcc i64 %t1938(i64 %t1934, i64 4, i64 %a0, i64 %a1, i64 %t1933, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1939
else757:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-rational-body?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1944 = icmp eq i64 %argc, 4
  br i1 %t1944, label %argok762, label %arityerr761
arityerr761:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok762:
  %t1945 = or i64 %a2, %a1
  %t1946 = and i64 %t1945, 7
  %t1947 = icmp eq i64 %t1946, 0
  br i1 %t1947, label %fixfast763, label %fixslow764
fixfast763:
  %t1948 = icmp slt i64 %a2, %a1
  %t1949 = select i1 %t1948, i64 257, i64 1
  br label %fixmerge765
fixslow764:
  %t1950 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge765
fixmerge765:
  %t1951 = phi i64 [ %t1949, %fixfast763 ], [ %t1950, %fixslow764 ]
  %t1952 = icmp ne i64 %t1951, 1
  br i1 %t1952, label %then766, label %else767
then766:
  %t1953 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1954 = load i64, ptr @"emit.internal:rd-sign-char?"
  call void @rt_check_callable(i64 %t1954)
  %t1955 = and i64 %t1954, -8
  %t1956 = inttoptr i64 %t1955 to ptr
  %t1957 = load i64, ptr %t1956
  %t1958 = inttoptr i64 %t1957 to ptr
  %t1959 = call fastcc i64%t1958(i64 %t1954, i64 1, i64 %t1953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge768
else767:
  br label %merge768
merge768:
  %t1960 = phi i64 [ %t1959, %then766 ], [ 1, %else767 ]
  %t1961 = icmp ne i64 %t1960, 1
  br i1 %t1961, label %then769, label %else770
then769:
  %t1962 = or i64 %a2, 8
  %t1963 = and i64 %t1962, 7
  %t1964 = icmp eq i64 %t1963, 0
  br i1 %t1964, label %fixfast772, label %fixslow773
fixfast772:
  %t1965 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1966 = extractvalue {i64, i1} %t1965, 0
  %t1967 = extractvalue {i64, i1} %t1965, 1
  br i1 %t1967, label %fixslow773, label %fixmerge774
fixslow773:
  %t1968 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge774
fixmerge774:
  %t1969 = phi i64 [ %t1966, %fixfast772 ], [ %t1968, %fixslow773 ]
  br label %merge771
else770:
  br label %merge771
merge771:
  %t1970 = phi i64 [ %t1969, %fixmerge774 ], [ %a2, %else770 ]
  %t1971 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t1971)
  %t1972 = and i64 %t1971, -8
  %t1973 = inttoptr i64 %t1972 to ptr
  %t1974 = load i64, ptr %t1973
  %t1975 = inttoptr i64 %t1974 to ptr
  %t1976 = call fastcc i64%t1975(i64 %t1971, i64 4, i64 %a0, i64 %a1, i64 %t1970, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1977 = or i64 %t1970, %t1976
  %t1978 = and i64 %t1977, 7
  %t1979 = icmp eq i64 %t1978, 0
  br i1 %t1979, label %fixfast775, label %fixslow776
fixfast775:
  %t1980 = icmp slt i64 %t1970, %t1976
  %t1981 = select i1 %t1980, i64 257, i64 1
  br label %fixmerge777
fixslow776:
  %t1982 = call i64 @rt_lt(i64 %t1970, i64 %t1976)
  br label %fixmerge777
fixmerge777:
  %t1983 = phi i64 [ %t1981, %fixfast775 ], [ %t1982, %fixslow776 ]
  %t1984 = icmp ne i64 %t1983, 1
  br i1 %t1984, label %then778, label %else779
then778:
  %t1985 = or i64 %t1976, %a1
  %t1986 = and i64 %t1985, 7
  %t1987 = icmp eq i64 %t1986, 0
  br i1 %t1987, label %fixfast780, label %fixslow781
fixfast780:
  %t1988 = icmp slt i64 %t1976, %a1
  %t1989 = select i1 %t1988, i64 257, i64 1
  br label %fixmerge782
fixslow781:
  %t1990 = call i64 @rt_lt(i64 %t1976, i64 %a1)
  br label %fixmerge782
fixmerge782:
  %t1991 = phi i64 [ %t1989, %fixfast780 ], [ %t1990, %fixslow781 ]
  %t1992 = icmp ne i64 %t1991, 1
  br i1 %t1992, label %then783, label %else784
then783:
  %t1993 = call i64 @rt_string_ref(i64 %a0, i64 %t1976)
  %t1994 = call i64 @rt_char_to_integer(i64 %t1993)
  %t1995 = or i64 %t1994, 376
  %t1996 = and i64 %t1995, 7
  %t1997 = icmp eq i64 %t1996, 0
  br i1 %t1997, label %fixfast785, label %fixslow786
fixfast785:
  %t1998 = icmp eq i64 %t1994, 376
  %t1999 = select i1 %t1998, i64 257, i64 1
  br label %fixmerge787
fixslow786:
  %t2000 = call i64 @rt_num_eq(i64 %t1994, i64 376)
  br label %fixmerge787
fixmerge787:
  %t2001 = phi i64 [ %t1999, %fixfast785 ], [ %t2000, %fixslow786 ]
  %t2002 = icmp ne i64 %t2001, 1
  br i1 %t2002, label %then788, label %else789
then788:
  %t2003 = or i64 %t1976, 8
  %t2004 = and i64 %t2003, 7
  %t2005 = icmp eq i64 %t2004, 0
  br i1 %t2005, label %fixfast790, label %fixslow791
fixfast790:
  %t2006 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1976, i64 8)
  %t2007 = extractvalue {i64, i1} %t2006, 0
  %t2008 = extractvalue {i64, i1} %t2006, 1
  br i1 %t2008, label %fixslow791, label %fixmerge792
fixslow791:
  %t2009 = call i64 @rt_add(i64 %t1976, i64 8)
  br label %fixmerge792
fixmerge792:
  %t2010 = phi i64 [ %t2007, %fixfast790 ], [ %t2009, %fixslow791 ]
  %t2011 = load i64, ptr @"emit.internal:rd-radix-scan"
  call void @rt_check_callable(i64 %t2011)
  %t2012 = and i64 %t2011, -8
  %t2013 = inttoptr i64 %t2012 to ptr
  %t2014 = load i64, ptr %t2013
  %t2015 = inttoptr i64 %t2014 to ptr
  %t2016 = call fastcc i64%t2015(i64 %t2011, i64 4, i64 %a0, i64 %a1, i64 %t2010, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2017 = or i64 %t1976, 8
  %t2018 = and i64 %t2017, 7
  %t2019 = icmp eq i64 %t2018, 0
  br i1 %t2019, label %fixfast793, label %fixslow794
fixfast793:
  %t2020 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1976, i64 8)
  %t2021 = extractvalue {i64, i1} %t2020, 0
  %t2022 = extractvalue {i64, i1} %t2020, 1
  br i1 %t2022, label %fixslow794, label %fixmerge795
fixslow794:
  %t2023 = call i64 @rt_add(i64 %t1976, i64 8)
  br label %fixmerge795
fixmerge795:
  %t2024 = phi i64 [ %t2021, %fixfast793 ], [ %t2023, %fixslow794 ]
  %t2025 = or i64 %t2024, %t2016
  %t2026 = and i64 %t2025, 7
  %t2027 = icmp eq i64 %t2026, 0
  br i1 %t2027, label %fixfast796, label %fixslow797
fixfast796:
  %t2028 = icmp slt i64 %t2024, %t2016
  %t2029 = select i1 %t2028, i64 257, i64 1
  br label %fixmerge798
fixslow797:
  %t2030 = call i64 @rt_lt(i64 %t2024, i64 %t2016)
  br label %fixmerge798
fixmerge798:
  %t2031 = phi i64 [ %t2029, %fixfast796 ], [ %t2030, %fixslow797 ]
  %t2032 = icmp ne i64 %t2031, 1
  br i1 %t2032, label %then799, label %else800
then799:
  %t2033 = or i64 %t2016, %a1
  %t2034 = and i64 %t2033, 7
  %t2035 = icmp eq i64 %t2034, 0
  br i1 %t2035, label %fixfast801, label %fixslow802
fixfast801:
  %t2036 = icmp eq i64 %t2016, %a1
  %t2037 = select i1 %t2036, i64 257, i64 1
  br label %fixmerge803
fixslow802:
  %t2038 = call i64 @rt_num_eq(i64 %t2016, i64 %a1)
  br label %fixmerge803
fixmerge803:
  %t2039 = phi i64 [ %t2037, %fixfast801 ], [ %t2038, %fixslow802 ]
  ret i64 %t2039
else800:
  ret i64 1
else789:
  ret i64 1
else784:
  ret i64 1
else779:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-apply"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2044 = icmp eq i64 %argc, 2
  br i1 %t2044, label %argok805, label %arityerr804
arityerr804:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok805:
  %t2045 = call i64 @rt_not(i64 %a1)
  %t2046 = icmp ne i64 %t2045, 1
  br i1 %t2046, label %then806, label %else807
then806:
  ret i64 %a0
else807:
  %t2047 = or i64 %a1, 16
  %t2048 = and i64 %t2047, 7
  %t2049 = icmp eq i64 %t2048, 0
  br i1 %t2049, label %fixfast808, label %fixslow809
fixfast808:
  %t2050 = icmp eq i64 %a1, 16
  %t2051 = select i1 %t2050, i64 257, i64 1
  br label %fixmerge810
fixslow809:
  %t2052 = call i64 @rt_num_eq(i64 %a1, i64 16)
  br label %fixmerge810
fixmerge810:
  %t2053 = phi i64 [ %t2051, %fixfast808 ], [ %t2052, %fixslow809 ]
  %t2054 = icmp ne i64 %t2053, 1
  br i1 %t2054, label %then811, label %else812
then811:
  %t2055 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t2055
else812:
  %t2056 = call i64 @rt_exact_p(i64 %a0)
  %t2057 = icmp ne i64 %t2056, 1
  br i1 %t2057, label %then813, label %else814
then813:
  ret i64 %a0
else814:
  %t2058 = call i64 @rt_flo_truncate(i64 %a0)
  %t2059 = or i64 %a0, %t2058
  %t2060 = and i64 %t2059, 7
  %t2061 = icmp eq i64 %t2060, 0
  br i1 %t2061, label %fixfast815, label %fixslow816
fixfast815:
  %t2062 = icmp eq i64 %a0, %t2058
  %t2063 = select i1 %t2062, i64 257, i64 1
  br label %fixmerge817
fixslow816:
  %t2064 = call i64 @rt_num_eq(i64 %a0, i64 %t2058)
  br label %fixmerge817
fixmerge817:
  %t2065 = phi i64 [ %t2063, %fixfast815 ], [ %t2064, %fixslow816 ]
  %t2066 = icmp ne i64 %t2065, 1
  br i1 %t2066, label %then818, label %else819
then818:
  %t2067 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t2067
else819:
  %t2068 = call i64 @rt_intern(ptr @.str.sym.6)
  ret i64 %t2068
}

define fastcc i64 @"emit.internal:code:rd-body-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2073 = icmp eq i64 %argc, 3
  br i1 %t2073, label %argok821, label %arityerr820
arityerr820:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok821:
  %t2074 = or i64 %a1, 80
  %t2075 = and i64 %t2074, 7
  %t2076 = icmp eq i64 %t2075, 0
  br i1 %t2076, label %fixfast822, label %fixslow823
fixfast822:
  %t2077 = icmp eq i64 %a1, 80
  %t2078 = select i1 %t2077, i64 257, i64 1
  br label %fixmerge824
fixslow823:
  %t2079 = call i64 @rt_num_eq(i64 %a1, i64 80)
  br label %fixmerge824
fixmerge824:
  %t2080 = phi i64 [ %t2078, %fixfast822 ], [ %t2079, %fixslow823 ]
  %t2081 = icmp ne i64 %t2080, 1
  br i1 %t2081, label %then825, label %else826
then825:
  %t2082 = load i64, ptr @"emit.internal:rd-numeric?"
  call void @rt_check_callable(i64 %t2082)
  %t2083 = and i64 %t2082, -8
  %t2084 = inttoptr i64 %t2083 to ptr
  %t2085 = load i64, ptr %t2084
  %t2086 = inttoptr i64 %t2085 to ptr
  %t2087 = call fastcc i64%t2086(i64 %t2082, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2088 = icmp ne i64 %t2087, 1
  br i1 %t2088, label %then827, label %else828
then827:
  %t2089 = load i64, ptr @"emit.internal:rd-parse-int"
  call void @rt_check_callable(i64 %t2089)
  %t2090 = and i64 %t2089, -8
  %t2091 = inttoptr i64 %t2090 to ptr
  %t2092 = load i64, ptr %t2091
  %t2093 = inttoptr i64 %t2092 to ptr
  %t2094 = call fastcc i64%t2093(i64 %t2089, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2095 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2095)
  %t2096 = and i64 %t2095, -8
  %t2097 = inttoptr i64 %t2096 to ptr
  %t2098 = load i64, ptr %t2097
  %t2099 = inttoptr i64 %t2098 to ptr
  %t2100 = musttail call fastcc i64 %t2099(i64 %t2095, i64 2, i64 %t2094, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2100
else828:
  %t2101 = load i64, ptr @"emit.internal:rd-flonum?"
  call void @rt_check_callable(i64 %t2101)
  %t2102 = and i64 %t2101, -8
  %t2103 = inttoptr i64 %t2102 to ptr
  %t2104 = load i64, ptr %t2103
  %t2105 = inttoptr i64 %t2104 to ptr
  %t2106 = call fastcc i64%t2105(i64 %t2101, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2107 = icmp ne i64 %t2106, 1
  br i1 %t2107, label %then829, label %else830
then829:
  %t2108 = call i64 @rt_string_to_flonum(i64 %a0)
  %t2109 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2109)
  %t2110 = and i64 %t2109, -8
  %t2111 = inttoptr i64 %t2110 to ptr
  %t2112 = load i64, ptr %t2111
  %t2113 = inttoptr i64 %t2112 to ptr
  %t2114 = musttail call fastcc i64 %t2113(i64 %t2109, i64 2, i64 %t2108, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2114
else830:
  %t2115 = load i64, ptr @"emit.internal:rd-nonfinite"
  call void @rt_check_callable(i64 %t2115)
  %t2116 = and i64 %t2115, -8
  %t2117 = inttoptr i64 %t2116 to ptr
  %t2118 = load i64, ptr %t2117
  %t2119 = inttoptr i64 %t2118 to ptr
  %t2120 = call fastcc i64%t2119(i64 %t2115, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2121 = call i64 @rt_not(i64 %t2120)
  %t2122 = icmp ne i64 %t2121, 1
  br i1 %t2122, label %then831, label %else832
then831:
  %t2123 = call i64 @rt_intern(ptr @.str.sym.7)
  ret i64 %t2123
else832:
  %t2124 = icmp ne i64 %a2, 1
  br i1 %t2124, label %then833, label %else834
then833:
  %t2125 = or i64 %a2, 8
  %t2126 = and i64 %t2125, 7
  %t2127 = icmp eq i64 %t2126, 0
  br i1 %t2127, label %fixfast836, label %fixslow837
fixfast836:
  %t2128 = icmp eq i64 %a2, 8
  %t2129 = select i1 %t2128, i64 257, i64 1
  br label %fixmerge838
fixslow837:
  %t2130 = call i64 @rt_num_eq(i64 %a2, i64 8)
  br label %fixmerge838
fixmerge838:
  %t2131 = phi i64 [ %t2129, %fixfast836 ], [ %t2130, %fixslow837 ]
  br label %merge835
else834:
  br label %merge835
merge835:
  %t2132 = phi i64 [ %t2131, %fixmerge838 ], [ 1, %else834 ]
  %t2133 = icmp ne i64 %t2132, 1
  br i1 %t2133, label %then839, label %else840
then839:
  %t2134 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2134
else840:
  %t2135 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2135)
  %t2136 = and i64 %t2135, -8
  %t2137 = inttoptr i64 %t2136 to ptr
  %t2138 = load i64, ptr %t2137
  %t2139 = inttoptr i64 %t2138 to ptr
  %t2140 = musttail call fastcc i64 %t2139(i64 %t2135, i64 2, i64 %t2120, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2140
else826:
  %t2141 = load i64, ptr @"emit.internal:%string->int"
  call void @rt_check_callable(i64 %t2141)
  %t2142 = and i64 %t2141, -8
  %t2143 = inttoptr i64 %t2142 to ptr
  %t2144 = load i64, ptr %t2143
  %t2145 = inttoptr i64 %t2144 to ptr
  %t2146 = call fastcc i64%t2145(i64 %t2141, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2147 = icmp ne i64 %t2146, 1
  br i1 %t2147, label %then841, label %else842
then841:
  %t2148 = load i64, ptr @"emit.internal:rd-exactness-apply"
  call void @rt_check_callable(i64 %t2148)
  %t2149 = and i64 %t2148, -8
  %t2150 = inttoptr i64 %t2149 to ptr
  %t2151 = load i64, ptr %t2150
  %t2152 = inttoptr i64 %t2151 to ptr
  %t2153 = musttail call fastcc i64 %t2152(i64 %t2148, i64 2, i64 %t2146, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2153
else842:
  %t2154 = call i64 @rt_intern(ptr @.str.sym.7)
  ret i64 %t2154
}

define fastcc i64 @"emit.internal:code:rd-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2159 = icmp eq i64 %argc, 2
  br i1 %t2159, label %argok844, label %arityerr843
arityerr843:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok844:
  %t2160 = call i64 @rt_string_length(i64 %a0)
  %t2161 = or i64 0, %t2160
  %t2162 = and i64 %t2161, 7
  %t2163 = icmp eq i64 %t2162, 0
  br i1 %t2163, label %fixfast845, label %fixslow846
fixfast845:
  %t2164 = icmp slt i64 0, %t2160
  %t2165 = select i1 %t2164, i64 257, i64 1
  br label %fixmerge847
fixslow846:
  %t2166 = call i64 @rt_lt(i64 0, i64 %t2160)
  br label %fixmerge847
fixmerge847:
  %t2167 = phi i64 [ %t2165, %fixfast845 ], [ %t2166, %fixslow846 ]
  %t2168 = icmp ne i64 %t2167, 1
  br i1 %t2168, label %then848, label %else849
then848:
  %t2169 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2170 = call i64 @rt_char_to_integer(i64 %t2169)
  %t2171 = or i64 %t2170, 280
  %t2172 = and i64 %t2171, 7
  %t2173 = icmp eq i64 %t2172, 0
  br i1 %t2173, label %fixfast851, label %fixslow852
fixfast851:
  %t2174 = icmp eq i64 %t2170, 280
  %t2175 = select i1 %t2174, i64 257, i64 1
  br label %fixmerge853
fixslow852:
  %t2176 = call i64 @rt_num_eq(i64 %t2170, i64 280)
  br label %fixmerge853
fixmerge853:
  %t2177 = phi i64 [ %t2175, %fixfast851 ], [ %t2176, %fixslow852 ]
  br label %merge850
else849:
  br label %merge850
merge850:
  %t2178 = phi i64 [ %t2177, %fixmerge853 ], [ 1, %else849 ]
  %t2179 = icmp ne i64 %t2178, 1
  br i1 %t2179, label %then854, label %else855
then854:
  %t2180 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  call void @rt_check_callable(i64 %t2180)
  %t2181 = and i64 %t2180, -8
  %t2182 = inttoptr i64 %t2181 to ptr
  %t2183 = load i64, ptr %t2182
  %t2184 = inttoptr i64 %t2183 to ptr
  %t2185 = call fastcc i64%t2184(i64 %t2180, i64 5, i64 %a0, i64 %t2160, i64 0, i64 1, i64 1, i64 0, i64 0, i64 0, ptr null)
  %t2186 = call i64 @rt_not(i64 %t2185)
  %t2187 = icmp ne i64 %t2186, 1
  br i1 %t2187, label %then856, label %else857
then856:
  %t2188 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2188
else857:
  %t2189 = call i64 @rt_car(i64 %t2185)
  %t2190 = icmp ne i64 %t2189, 1
  br i1 %t2190, label %then858, label %else859
then858:
  %t2191 = call i64 @rt_car(i64 %t2185)
  br label %merge860
else859:
  br label %merge860
merge860:
  %t2192 = phi i64 [ %t2191, %then858 ], [ %a1, %else859 ]
  %t2193 = load i64, ptr @"emit.internal:cadr"
  call void @rt_check_callable(i64 %t2193)
  %t2194 = and i64 %t2193, -8
  %t2195 = inttoptr i64 %t2194 to ptr
  %t2196 = load i64, ptr %t2195
  %t2197 = inttoptr i64 %t2196 to ptr
  %t2198 = call fastcc i64%t2197(i64 %t2193, i64 1, i64 %t2185, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2199 = load i64, ptr @"emit.internal:cddr"
  call void @rt_check_callable(i64 %t2199)
  %t2200 = and i64 %t2199, -8
  %t2201 = inttoptr i64 %t2200 to ptr
  %t2202 = load i64, ptr %t2201
  %t2203 = inttoptr i64 %t2202 to ptr
  %t2204 = call fastcc i64%t2203(i64 %t2199, i64 1, i64 %t2185, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2205 = call i64 @rt_substring(i64 %a0, i64 %t2204, i64 %t2160)
  %t2206 = load i64, ptr @"emit.internal:rd-body-number"
  call void @rt_check_callable(i64 %t2206)
  %t2207 = and i64 %t2206, -8
  %t2208 = inttoptr i64 %t2207 to ptr
  %t2209 = load i64, ptr %t2208
  %t2210 = inttoptr i64 %t2209 to ptr
  %t2211 = call fastcc i64%t2210(i64 %t2206, i64 3, i64 %t2205, i64 %t2192, i64 %t2198, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2212 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2213 = call i64 @rt_eq_p(i64 %t2211, i64 %t2212)
  %t2214 = icmp ne i64 %t2213, 1
  br i1 %t2214, label %then861, label %else862
then861:
  %t2215 = load i64, ptr @"emit.internal:rd-rational-body?"
  call void @rt_check_callable(i64 %t2215)
  %t2216 = and i64 %t2215, -8
  %t2217 = inttoptr i64 %t2216 to ptr
  %t2218 = load i64, ptr %t2217
  %t2219 = inttoptr i64 %t2218 to ptr
  %t2220 = call fastcc i64%t2219(i64 %t2215, i64 4, i64 %a0, i64 %t2160, i64 %t2204, i64 %t2192, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2221 = icmp ne i64 %t2220, 1
  br i1 %t2221, label %then863, label %else864
then863:
  %t2222 = call i64 @rt_intern(ptr @.str.sym.6)
  ret i64 %t2222
else864:
  %t2223 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2223
else862:
  ret i64 %t2211
else855:
  %t2224 = load i64, ptr @"emit.internal:rd-body-number"
  call void @rt_check_callable(i64 %t2224)
  %t2225 = and i64 %t2224, -8
  %t2226 = inttoptr i64 %t2225 to ptr
  %t2227 = load i64, ptr %t2226
  %t2228 = inttoptr i64 %t2227 to ptr
  %t2229 = call fastcc i64%t2228(i64 %t2224, i64 3, i64 %a0, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2230 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2231 = call i64 @rt_eq_p(i64 %t2229, i64 %t2230)
  %t2232 = icmp ne i64 %t2231, 1
  br i1 %t2232, label %then865, label %else866
then865:
  %t2233 = load i64, ptr @"emit.internal:rd-rational-body?"
  call void @rt_check_callable(i64 %t2233)
  %t2234 = and i64 %t2233, -8
  %t2235 = inttoptr i64 %t2234 to ptr
  %t2236 = load i64, ptr %t2235
  %t2237 = inttoptr i64 %t2236 to ptr
  %t2238 = call fastcc i64%t2237(i64 %t2233, i64 4, i64 %a0, i64 %t2160, i64 0, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2239 = icmp ne i64 %t2238, 1
  br i1 %t2239, label %then867, label %else868
then867:
  %t2240 = call i64 @rt_intern(ptr @.str.sym.6)
  ret i64 %t2240
else868:
  ret i64 %t2229
else866:
  ret i64 %t2229
}

define fastcc i64 @"emit.internal:code:rd-number-reason?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2245 = icmp eq i64 %argc, 1
  br i1 %t2245, label %argok870, label %arityerr869
arityerr869:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok870:
  %t2246 = call i64 @rt_intern(ptr @.str.sym.6)
  %t2247 = call i64 @rt_eq_p(i64 %a0, i64 %t2246)
  %t2248 = icmp ne i64 %t2247, 1
  br i1 %t2248, label %then871, label %else872
then871:
  ret i64 %t2247
else872:
  %t2249 = call i64 @rt_intern(ptr @.str.sym.8)
  %t2250 = call i64 @rt_eq_p(i64 %a0, i64 %t2249)
  ret i64 %t2250
}

define fastcc i64 @"emit.internal:code:rd-fold-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2255 = icmp eq i64 %argc, 1
  br i1 %t2255, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok874:
  %t2256 = call i64 @rt_char_to_integer(i64 %a0)
  %t2257 = or i64 512, %t2256
  %t2258 = and i64 %t2257, 7
  %t2259 = icmp eq i64 %t2258, 0
  br i1 %t2259, label %fixfast875, label %fixslow876
fixfast875:
  %t2260 = icmp slt i64 512, %t2256
  %t2261 = select i1 %t2260, i64 257, i64 1
  br label %fixmerge877
fixslow876:
  %t2262 = call i64 @rt_lt(i64 512, i64 %t2256)
  br label %fixmerge877
fixmerge877:
  %t2263 = phi i64 [ %t2261, %fixfast875 ], [ %t2262, %fixslow876 ]
  %t2264 = icmp ne i64 %t2263, 1
  br i1 %t2264, label %then878, label %else879
then878:
  %t2265 = or i64 %t2256, 728
  %t2266 = and i64 %t2265, 7
  %t2267 = icmp eq i64 %t2266, 0
  br i1 %t2267, label %fixfast881, label %fixslow882
fixfast881:
  %t2268 = icmp slt i64 %t2256, 728
  %t2269 = select i1 %t2268, i64 257, i64 1
  br label %fixmerge883
fixslow882:
  %t2270 = call i64 @rt_lt(i64 %t2256, i64 728)
  br label %fixmerge883
fixmerge883:
  %t2271 = phi i64 [ %t2269, %fixfast881 ], [ %t2270, %fixslow882 ]
  br label %merge880
else879:
  br label %merge880
merge880:
  %t2272 = phi i64 [ %t2271, %fixmerge883 ], [ 1, %else879 ]
  %t2273 = icmp ne i64 %t2272, 1
  br i1 %t2273, label %then884, label %else885
then884:
  %t2274 = or i64 %t2256, 256
  %t2275 = and i64 %t2274, 7
  %t2276 = icmp eq i64 %t2275, 0
  br i1 %t2276, label %fixfast886, label %fixslow887
fixfast886:
  %t2277 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2256, i64 256)
  %t2278 = extractvalue {i64, i1} %t2277, 0
  %t2279 = extractvalue {i64, i1} %t2277, 1
  br i1 %t2279, label %fixslow887, label %fixmerge888
fixslow887:
  %t2280 = call i64 @rt_add(i64 %t2256, i64 256)
  br label %fixmerge888
fixmerge888:
  %t2281 = phi i64 [ %t2278, %fixfast886 ], [ %t2280, %fixslow887 ]
  %t2282 = call i64 @rt_integer_to_char(i64 %t2281)
  ret i64 %t2282
else885:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_695"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2287 = icmp eq i64 %argc, 2
  br i1 %t2287, label %argok890, label %arityerr889
arityerr889:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok890:
  %t2288 = and i64 %self, -8
  %t2289 = inttoptr i64 %t2288 to ptr
  %t2290 = getelementptr i64, ptr %t2289, i64 1
  %t2291 = load i64, ptr %t2290
  %t2292 = or i64 %a0, %t2291
  %t2293 = and i64 %t2292, 7
  %t2294 = icmp eq i64 %t2293, 0
  br i1 %t2294, label %fixfast891, label %fixslow892
fixfast891:
  %t2295 = icmp eq i64 %a0, %t2291
  %t2296 = select i1 %t2295, i64 257, i64 1
  br label %fixmerge893
fixslow892:
  %t2297 = call i64 @rt_num_eq(i64 %a0, i64 %t2291)
  br label %fixmerge893
fixmerge893:
  %t2298 = phi i64 [ %t2296, %fixfast891 ], [ %t2297, %fixslow892 ]
  %t2299 = icmp ne i64 %t2298, 1
  br i1 %t2299, label %then894, label %else895
then894:
  %t2300 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t2300)
  %t2301 = and i64 %t2300, -8
  %t2302 = inttoptr i64 %t2301 to ptr
  %t2303 = load i64, ptr %t2302
  %t2304 = inttoptr i64 %t2303 to ptr
  %t2305 = call fastcc i64%t2304(i64 %t2300, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2306 = call i64 @rt_list_to_string(i64 %t2305)
  ret i64 %t2306
else895:
  %t2307 = or i64 %a0, 8
  %t2308 = and i64 %t2307, 7
  %t2309 = icmp eq i64 %t2308, 0
  br i1 %t2309, label %fixfast896, label %fixslow897
fixfast896:
  %t2310 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2311 = extractvalue {i64, i1} %t2310, 0
  %t2312 = extractvalue {i64, i1} %t2310, 1
  br i1 %t2312, label %fixslow897, label %fixmerge898
fixslow897:
  %t2313 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge898
fixmerge898:
  %t2314 = phi i64 [ %t2311, %fixfast896 ], [ %t2313, %fixslow897 ]
  %t2315 = and i64 %self, -8
  %t2316 = inttoptr i64 %t2315 to ptr
  %t2317 = getelementptr i64, ptr %t2316, i64 3
  %t2318 = load i64, ptr %t2317
  %t2319 = call i64 @rt_string_ref(i64 %t2318, i64 %a0)
  %t2320 = load i64, ptr @"emit.internal:rd-fold-char"
  call void @rt_check_callable(i64 %t2320)
  %t2321 = and i64 %t2320, -8
  %t2322 = inttoptr i64 %t2321 to ptr
  %t2323 = load i64, ptr %t2322
  %t2324 = inttoptr i64 %t2323 to ptr
  %t2325 = call fastcc i64%t2324(i64 %t2320, i64 1, i64 %t2319, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2326 = call i64 @rt_cons(i64 %t2325, i64 %a1)
  %t2327 = musttail call fastcc i64 @"emit.internal:code_695"(i64 %self, i64 2, i64 %t2314, i64 %t2326, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2327
}

define fastcc i64 @"emit.internal:code:rd-fold-token"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2328 = icmp eq i64 %argc, 1
  br i1 %t2328, label %argok900, label %arityerr899
arityerr899:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok900:
  %t2329 = call i64 @rt_string_length(i64 %a0)
  %t2330 = call ptr @rt_alloc_words(i64 4)
  %t2331 = ptrtoint ptr %t2330 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_695" to i64), ptr %t2330
  %t2332 = or i64 %t2331, 4
  %t2333 = getelementptr i64, ptr %t2330, i64 1
  store i64 %t2329, ptr %t2333
  %t2334 = getelementptr i64, ptr %t2330, i64 2
  store i64 %t2332, ptr %t2334
  %t2335 = getelementptr i64, ptr %t2330, i64 3
  store i64 %a0, ptr %t2335
  %t2336 = musttail call fastcc i64 @"emit.internal:code_695"(i64 %t2332, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2336
}

define fastcc i64 @"emit.internal:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2341 = icmp eq i64 %argc, 4
  br i1 %t2341, label %argok902, label %arityerr901
arityerr901:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok902:
  %t2342 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t2342)
  %t2343 = and i64 %t2342, -8
  %t2344 = inttoptr i64 %t2343 to ptr
  %t2345 = load i64, ptr %t2344
  %t2346 = inttoptr i64 %t2345 to ptr
  %t2347 = call fastcc i64%t2346(i64 %t2342, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2348 = or i64 %a2, %t2347
  %t2349 = and i64 %t2348, 7
  %t2350 = icmp eq i64 %t2349, 0
  br i1 %t2350, label %fixfast903, label %fixslow904
fixfast903:
  %t2351 = icmp eq i64 %a2, %t2347
  %t2352 = select i1 %t2351, i64 257, i64 1
  br label %fixmerge905
fixslow904:
  %t2353 = call i64 @rt_num_eq(i64 %a2, i64 %t2347)
  br label %fixmerge905
fixmerge905:
  %t2354 = phi i64 [ %t2352, %fixfast903 ], [ %t2353, %fixslow904 ]
  %t2355 = icmp ne i64 %t2354, 1
  br i1 %t2355, label %then906, label %else907
then906:
  %t2356 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2357 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2357)
  %t2358 = and i64 %t2357, -8
  %t2359 = inttoptr i64 %t2358 to ptr
  %t2360 = load i64, ptr %t2359
  %t2361 = inttoptr i64 %t2360 to ptr
  %t2362 = musttail call fastcc i64 %t2361(i64 %t2357, i64 2, i64 %t2356, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2362
else907:
  %t2363 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2347)
  %t2364 = load i64, ptr @"emit.internal:rd-number"
  call void @rt_check_callable(i64 %t2364)
  %t2365 = and i64 %t2364, -8
  %t2366 = inttoptr i64 %t2365 to ptr
  %t2367 = load i64, ptr %t2366
  %t2368 = inttoptr i64 %t2367 to ptr
  %t2369 = call fastcc i64%t2368(i64 %t2364, i64 2, i64 %t2363, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2370 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2371 = call i64 @rt_eq_p(i64 %t2369, i64 %t2370)
  %t2372 = icmp ne i64 %t2371, 1
  br i1 %t2372, label %then908, label %else909
then908:
  %t2373 = icmp ne i64 %a3, 1
  br i1 %t2373, label %then910, label %else911
then910:
  %t2374 = load i64, ptr @"emit.internal:rd-fold-token"
  call void @rt_check_callable(i64 %t2374)
  %t2375 = and i64 %t2374, -8
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = load i64, ptr %t2376
  %t2378 = inttoptr i64 %t2377 to ptr
  %t2379 = call fastcc i64%t2378(i64 %t2374, i64 1, i64 %t2363, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge912
else911:
  br label %merge912
merge912:
  %t2380 = phi i64 [ %t2379, %then910 ], [ %t2363, %else911 ]
  %t2381 = call i64 @rt_string_to_symbol(i64 %t2380)
  %t2382 = call i64 @rt_cons(i64 %t2381, i64 %t2347)
  ret i64 %t2382
else909:
  %t2383 = load i64, ptr @"emit.internal:rd-number-reason?"
  call void @rt_check_callable(i64 %t2383)
  %t2384 = and i64 %t2383, -8
  %t2385 = inttoptr i64 %t2384 to ptr
  %t2386 = load i64, ptr %t2385
  %t2387 = inttoptr i64 %t2386 to ptr
  %t2388 = call fastcc i64%t2387(i64 %t2383, i64 1, i64 %t2369, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2389 = icmp ne i64 %t2388, 1
  br i1 %t2389, label %then913, label %else914
then913:
  %t2390 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2390)
  %t2391 = and i64 %t2390, -8
  %t2392 = inttoptr i64 %t2391 to ptr
  %t2393 = load i64, ptr %t2392
  %t2394 = inttoptr i64 %t2393 to ptr
  %t2395 = musttail call fastcc i64 %t2394(i64 %t2390, i64 2, i64 %t2369, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2395
else914:
  %t2396 = call i64 @rt_cons(i64 %t2369, i64 %t2347)
  ret i64 %t2396
}

define fastcc i64 @"emit.internal:code:rd-token-at"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2401 = icmp eq i64 %argc, 3
  br i1 %t2401, label %argok916, label %arityerr915
arityerr915:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok916:
  %t2402 = or i64 0, %a2
  %t2403 = and i64 %t2402, 7
  %t2404 = icmp eq i64 %t2403, 0
  br i1 %t2404, label %fixfast917, label %fixslow918
fixfast917:
  %t2405 = icmp slt i64 0, %a2
  %t2406 = select i1 %t2405, i64 257, i64 1
  br label %fixmerge919
fixslow918:
  %t2407 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge919
fixmerge919:
  %t2408 = phi i64 [ %t2406, %fixfast917 ], [ %t2407, %fixslow918 ]
  %t2409 = icmp ne i64 %t2408, 1
  br i1 %t2409, label %then920, label %else921
then920:
  br label %merge922
else921:
  %t2410 = or i64 0, %a2
  %t2411 = and i64 %t2410, 7
  %t2412 = icmp eq i64 %t2411, 0
  br i1 %t2412, label %fixfast923, label %fixslow924
fixfast923:
  %t2413 = icmp eq i64 0, %a2
  %t2414 = select i1 %t2413, i64 257, i64 1
  br label %fixmerge925
fixslow924:
  %t2415 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge925
fixmerge925:
  %t2416 = phi i64 [ %t2414, %fixfast923 ], [ %t2415, %fixslow924 ]
  br label %merge922
merge922:
  %t2417 = phi i64 [ 257, %then920 ], [ %t2416, %fixmerge925 ]
  %t2418 = icmp ne i64 %t2417, 1
  br i1 %t2418, label %then926, label %else927
then926:
  %t2419 = or i64 %a2, %a1
  %t2420 = and i64 %t2419, 7
  %t2421 = icmp eq i64 %t2420, 0
  br i1 %t2421, label %fixfast929, label %fixslow930
fixfast929:
  %t2422 = icmp slt i64 %a2, %a1
  %t2423 = select i1 %t2422, i64 257, i64 1
  br label %fixmerge931
fixslow930:
  %t2424 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge931
fixmerge931:
  %t2425 = phi i64 [ %t2423, %fixfast929 ], [ %t2424, %fixslow930 ]
  br label %merge928
else927:
  br label %merge928
merge928:
  %t2426 = phi i64 [ %t2425, %fixmerge931 ], [ 1, %else927 ]
  %t2427 = icmp ne i64 %t2426, 1
  br i1 %t2427, label %then932, label %else933
then932:
  %t2428 = or i64 %a2, 8
  %t2429 = and i64 %t2428, 7
  %t2430 = icmp eq i64 %t2429, 0
  br i1 %t2430, label %fixfast934, label %fixslow935
fixfast934:
  %t2431 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2432 = extractvalue {i64, i1} %t2431, 0
  %t2433 = extractvalue {i64, i1} %t2431, 1
  br i1 %t2433, label %fixslow935, label %fixmerge936
fixslow935:
  %t2434 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge936
fixmerge936:
  %t2435 = phi i64 [ %t2432, %fixfast934 ], [ %t2434, %fixslow935 ]
  %t2436 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t2436)
  %t2437 = and i64 %t2436, -8
  %t2438 = inttoptr i64 %t2437 to ptr
  %t2439 = load i64, ptr %t2438
  %t2440 = inttoptr i64 %t2439 to ptr
  %t2441 = call fastcc i64%t2440(i64 %t2436, i64 3, i64 %a0, i64 %a1, i64 %t2435, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2442 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2441)
  ret i64 %t2442
else933:
  %t2443 = call i64 @rt_make_string(ptr @.str.lit.10, i64 0)
  ret i64 %t2443
}

define fastcc i64 @"emit.internal:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2448 = icmp eq i64 %argc, 1
  br i1 %t2448, label %argok938, label %arityerr937
arityerr937:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok938:
  %t2449 = call i64 @rt_char_to_integer(i64 %a0)
  %t2450 = or i64 376, %t2449
  %t2451 = and i64 %t2450, 7
  %t2452 = icmp eq i64 %t2451, 0
  br i1 %t2452, label %fixfast939, label %fixslow940
fixfast939:
  %t2453 = icmp slt i64 376, %t2449
  %t2454 = select i1 %t2453, i64 257, i64 1
  br label %fixmerge941
fixslow940:
  %t2455 = call i64 @rt_lt(i64 376, i64 %t2449)
  br label %fixmerge941
fixmerge941:
  %t2456 = phi i64 [ %t2454, %fixfast939 ], [ %t2455, %fixslow940 ]
  %t2457 = icmp ne i64 %t2456, 1
  br i1 %t2457, label %then942, label %else943
then942:
  %t2458 = or i64 %t2449, 464
  %t2459 = and i64 %t2458, 7
  %t2460 = icmp eq i64 %t2459, 0
  br i1 %t2460, label %fixfast945, label %fixslow946
fixfast945:
  %t2461 = icmp slt i64 %t2449, 464
  %t2462 = select i1 %t2461, i64 257, i64 1
  br label %fixmerge947
fixslow946:
  %t2463 = call i64 @rt_lt(i64 %t2449, i64 464)
  br label %fixmerge947
fixmerge947:
  %t2464 = phi i64 [ %t2462, %fixfast945 ], [ %t2463, %fixslow946 ]
  br label %merge944
else943:
  br label %merge944
merge944:
  %t2465 = phi i64 [ %t2464, %fixmerge947 ], [ 1, %else943 ]
  %t2466 = icmp ne i64 %t2465, 1
  br i1 %t2466, label %then948, label %else949
then948:
  %t2467 = or i64 %t2449, 384
  %t2468 = and i64 %t2467, 7
  %t2469 = icmp eq i64 %t2468, 0
  br i1 %t2469, label %fixfast950, label %fixslow951
fixfast950:
  %t2470 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2449, i64 384)
  %t2471 = extractvalue {i64, i1} %t2470, 0
  %t2472 = extractvalue {i64, i1} %t2470, 1
  br i1 %t2472, label %fixslow951, label %fixmerge952
fixslow951:
  %t2473 = call i64 @rt_sub(i64 %t2449, i64 384)
  br label %fixmerge952
fixmerge952:
  %t2474 = phi i64 [ %t2471, %fixfast950 ], [ %t2473, %fixslow951 ]
  ret i64 %t2474
else949:
  %t2475 = or i64 768, %t2449
  %t2476 = and i64 %t2475, 7
  %t2477 = icmp eq i64 %t2476, 0
  br i1 %t2477, label %fixfast953, label %fixslow954
fixfast953:
  %t2478 = icmp slt i64 768, %t2449
  %t2479 = select i1 %t2478, i64 257, i64 1
  br label %fixmerge955
fixslow954:
  %t2480 = call i64 @rt_lt(i64 768, i64 %t2449)
  br label %fixmerge955
fixmerge955:
  %t2481 = phi i64 [ %t2479, %fixfast953 ], [ %t2480, %fixslow954 ]
  %t2482 = icmp ne i64 %t2481, 1
  br i1 %t2482, label %then956, label %else957
then956:
  %t2483 = or i64 %t2449, 824
  %t2484 = and i64 %t2483, 7
  %t2485 = icmp eq i64 %t2484, 0
  br i1 %t2485, label %fixfast959, label %fixslow960
fixfast959:
  %t2486 = icmp slt i64 %t2449, 824
  %t2487 = select i1 %t2486, i64 257, i64 1
  br label %fixmerge961
fixslow960:
  %t2488 = call i64 @rt_lt(i64 %t2449, i64 824)
  br label %fixmerge961
fixmerge961:
  %t2489 = phi i64 [ %t2487, %fixfast959 ], [ %t2488, %fixslow960 ]
  br label %merge958
else957:
  br label %merge958
merge958:
  %t2490 = phi i64 [ %t2489, %fixmerge961 ], [ 1, %else957 ]
  %t2491 = icmp ne i64 %t2490, 1
  br i1 %t2491, label %then962, label %else963
then962:
  %t2492 = or i64 %t2449, 696
  %t2493 = and i64 %t2492, 7
  %t2494 = icmp eq i64 %t2493, 0
  br i1 %t2494, label %fixfast964, label %fixslow965
fixfast964:
  %t2495 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2449, i64 696)
  %t2496 = extractvalue {i64, i1} %t2495, 0
  %t2497 = extractvalue {i64, i1} %t2495, 1
  br i1 %t2497, label %fixslow965, label %fixmerge966
fixslow965:
  %t2498 = call i64 @rt_sub(i64 %t2449, i64 696)
  br label %fixmerge966
fixmerge966:
  %t2499 = phi i64 [ %t2496, %fixfast964 ], [ %t2498, %fixslow965 ]
  ret i64 %t2499
else963:
  %t2500 = or i64 512, %t2449
  %t2501 = and i64 %t2500, 7
  %t2502 = icmp eq i64 %t2501, 0
  br i1 %t2502, label %fixfast967, label %fixslow968
fixfast967:
  %t2503 = icmp slt i64 512, %t2449
  %t2504 = select i1 %t2503, i64 257, i64 1
  br label %fixmerge969
fixslow968:
  %t2505 = call i64 @rt_lt(i64 512, i64 %t2449)
  br label %fixmerge969
fixmerge969:
  %t2506 = phi i64 [ %t2504, %fixfast967 ], [ %t2505, %fixslow968 ]
  %t2507 = icmp ne i64 %t2506, 1
  br i1 %t2507, label %then970, label %else971
then970:
  %t2508 = or i64 %t2449, 568
  %t2509 = and i64 %t2508, 7
  %t2510 = icmp eq i64 %t2509, 0
  br i1 %t2510, label %fixfast973, label %fixslow974
fixfast973:
  %t2511 = icmp slt i64 %t2449, 568
  %t2512 = select i1 %t2511, i64 257, i64 1
  br label %fixmerge975
fixslow974:
  %t2513 = call i64 @rt_lt(i64 %t2449, i64 568)
  br label %fixmerge975
fixmerge975:
  %t2514 = phi i64 [ %t2512, %fixfast973 ], [ %t2513, %fixslow974 ]
  br label %merge972
else971:
  br label %merge972
merge972:
  %t2515 = phi i64 [ %t2514, %fixmerge975 ], [ 1, %else971 ]
  %t2516 = icmp ne i64 %t2515, 1
  br i1 %t2516, label %then976, label %else977
then976:
  %t2517 = or i64 %t2449, 440
  %t2518 = and i64 %t2517, 7
  %t2519 = icmp eq i64 %t2518, 0
  br i1 %t2519, label %fixfast978, label %fixslow979
fixfast978:
  %t2520 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2449, i64 440)
  %t2521 = extractvalue {i64, i1} %t2520, 0
  %t2522 = extractvalue {i64, i1} %t2520, 1
  br i1 %t2522, label %fixslow979, label %fixmerge980
fixslow979:
  %t2523 = call i64 @rt_sub(i64 %t2449, i64 440)
  br label %fixmerge980
fixmerge980:
  %t2524 = phi i64 [ %t2521, %fixfast978 ], [ %t2523, %fixslow979 ]
  ret i64 %t2524
else977:
  ret i64 0
}

define fastcc i64 @"emit.internal:code:rd-hex-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2529 = icmp eq i64 %argc, 1
  br i1 %t2529, label %argok982, label %arityerr981
arityerr981:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok982:
  %t2530 = call i64 @rt_char_to_integer(i64 %a0)
  %t2531 = or i64 376, %t2530
  %t2532 = and i64 %t2531, 7
  %t2533 = icmp eq i64 %t2532, 0
  br i1 %t2533, label %fixfast983, label %fixslow984
fixfast983:
  %t2534 = icmp slt i64 376, %t2530
  %t2535 = select i1 %t2534, i64 257, i64 1
  br label %fixmerge985
fixslow984:
  %t2536 = call i64 @rt_lt(i64 376, i64 %t2530)
  br label %fixmerge985
fixmerge985:
  %t2537 = phi i64 [ %t2535, %fixfast983 ], [ %t2536, %fixslow984 ]
  %t2538 = icmp ne i64 %t2537, 1
  br i1 %t2538, label %then986, label %else987
then986:
  %t2539 = or i64 %t2530, 464
  %t2540 = and i64 %t2539, 7
  %t2541 = icmp eq i64 %t2540, 0
  br i1 %t2541, label %fixfast989, label %fixslow990
fixfast989:
  %t2542 = icmp slt i64 %t2530, 464
  %t2543 = select i1 %t2542, i64 257, i64 1
  br label %fixmerge991
fixslow990:
  %t2544 = call i64 @rt_lt(i64 %t2530, i64 464)
  br label %fixmerge991
fixmerge991:
  %t2545 = phi i64 [ %t2543, %fixfast989 ], [ %t2544, %fixslow990 ]
  br label %merge988
else987:
  br label %merge988
merge988:
  %t2546 = phi i64 [ %t2545, %fixmerge991 ], [ 1, %else987 ]
  %t2547 = icmp ne i64 %t2546, 1
  br i1 %t2547, label %then992, label %else993
then992:
  ret i64 257
else993:
  %t2548 = or i64 768, %t2530
  %t2549 = and i64 %t2548, 7
  %t2550 = icmp eq i64 %t2549, 0
  br i1 %t2550, label %fixfast994, label %fixslow995
fixfast994:
  %t2551 = icmp slt i64 768, %t2530
  %t2552 = select i1 %t2551, i64 257, i64 1
  br label %fixmerge996
fixslow995:
  %t2553 = call i64 @rt_lt(i64 768, i64 %t2530)
  br label %fixmerge996
fixmerge996:
  %t2554 = phi i64 [ %t2552, %fixfast994 ], [ %t2553, %fixslow995 ]
  %t2555 = icmp ne i64 %t2554, 1
  br i1 %t2555, label %then997, label %else998
then997:
  %t2556 = or i64 %t2530, 824
  %t2557 = and i64 %t2556, 7
  %t2558 = icmp eq i64 %t2557, 0
  br i1 %t2558, label %fixfast1000, label %fixslow1001
fixfast1000:
  %t2559 = icmp slt i64 %t2530, 824
  %t2560 = select i1 %t2559, i64 257, i64 1
  br label %fixmerge1002
fixslow1001:
  %t2561 = call i64 @rt_lt(i64 %t2530, i64 824)
  br label %fixmerge1002
fixmerge1002:
  %t2562 = phi i64 [ %t2560, %fixfast1000 ], [ %t2561, %fixslow1001 ]
  br label %merge999
else998:
  br label %merge999
merge999:
  %t2563 = phi i64 [ %t2562, %fixmerge1002 ], [ 1, %else998 ]
  %t2564 = icmp ne i64 %t2563, 1
  br i1 %t2564, label %then1003, label %else1004
then1003:
  ret i64 257
else1004:
  %t2565 = or i64 512, %t2530
  %t2566 = and i64 %t2565, 7
  %t2567 = icmp eq i64 %t2566, 0
  br i1 %t2567, label %fixfast1005, label %fixslow1006
fixfast1005:
  %t2568 = icmp slt i64 512, %t2530
  %t2569 = select i1 %t2568, i64 257, i64 1
  br label %fixmerge1007
fixslow1006:
  %t2570 = call i64 @rt_lt(i64 512, i64 %t2530)
  br label %fixmerge1007
fixmerge1007:
  %t2571 = phi i64 [ %t2569, %fixfast1005 ], [ %t2570, %fixslow1006 ]
  %t2572 = icmp ne i64 %t2571, 1
  br i1 %t2572, label %then1008, label %else1009
then1008:
  %t2573 = or i64 %t2530, 568
  %t2574 = and i64 %t2573, 7
  %t2575 = icmp eq i64 %t2574, 0
  br i1 %t2575, label %fixfast1011, label %fixslow1012
fixfast1011:
  %t2576 = icmp slt i64 %t2530, 568
  %t2577 = select i1 %t2576, i64 257, i64 1
  br label %fixmerge1013
fixslow1012:
  %t2578 = call i64 @rt_lt(i64 %t2530, i64 568)
  br label %fixmerge1013
fixmerge1013:
  %t2579 = phi i64 [ %t2577, %fixfast1011 ], [ %t2578, %fixslow1012 ]
  br label %merge1010
else1009:
  br label %merge1010
merge1010:
  %t2580 = phi i64 [ %t2579, %fixmerge1013 ], [ 1, %else1009 ]
  %t2581 = icmp ne i64 %t2580, 1
  br i1 %t2581, label %then1014, label %else1015
then1014:
  ret i64 257
else1015:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2586 = icmp eq i64 %argc, 4
  br i1 %t2586, label %argok1017, label %arityerr1016
arityerr1016:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1017:
  %t2587 = or i64 %a2, %a1
  %t2588 = and i64 %t2587, 7
  %t2589 = icmp eq i64 %t2588, 0
  br i1 %t2589, label %fixfast1018, label %fixslow1019
fixfast1018:
  %t2590 = icmp slt i64 %a2, %a1
  %t2591 = select i1 %t2590, i64 257, i64 1
  br label %fixmerge1020
fixslow1019:
  %t2592 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1020
fixmerge1020:
  %t2593 = phi i64 [ %t2591, %fixfast1018 ], [ %t2592, %fixslow1019 ]
  %t2594 = icmp ne i64 %t2593, 1
  br i1 %t2594, label %then1021, label %else1022
then1021:
  %t2595 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2596 = call i64 @rt_char_to_integer(i64 %t2595)
  %t2597 = or i64 %t2596, 472
  %t2598 = and i64 %t2597, 7
  %t2599 = icmp eq i64 %t2598, 0
  br i1 %t2599, label %fixfast1023, label %fixslow1024
fixfast1023:
  %t2600 = icmp eq i64 %t2596, 472
  %t2601 = select i1 %t2600, i64 257, i64 1
  br label %fixmerge1025
fixslow1024:
  %t2602 = call i64 @rt_num_eq(i64 %t2596, i64 472)
  br label %fixmerge1025
fixmerge1025:
  %t2603 = phi i64 [ %t2601, %fixfast1023 ], [ %t2602, %fixslow1024 ]
  %t2604 = icmp ne i64 %t2603, 1
  br i1 %t2604, label %then1026, label %else1027
then1026:
  %t2605 = or i64 %a2, 8
  %t2606 = and i64 %t2605, 7
  %t2607 = icmp eq i64 %t2606, 0
  br i1 %t2607, label %fixfast1028, label %fixslow1029
fixfast1028:
  %t2608 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2609 = extractvalue {i64, i1} %t2608, 0
  %t2610 = extractvalue {i64, i1} %t2608, 1
  br i1 %t2610, label %fixslow1029, label %fixmerge1030
fixslow1029:
  %t2611 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1030
fixmerge1030:
  %t2612 = phi i64 [ %t2609, %fixfast1028 ], [ %t2611, %fixslow1029 ]
  %t2613 = call i64 @rt_cons(i64 %a3, i64 %t2612)
  ret i64 %t2613
else1027:
  %t2614 = or i64 %a2, 8
  %t2615 = and i64 %t2614, 7
  %t2616 = icmp eq i64 %t2615, 0
  br i1 %t2616, label %fixfast1031, label %fixslow1032
fixfast1031:
  %t2617 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2618 = extractvalue {i64, i1} %t2617, 0
  %t2619 = extractvalue {i64, i1} %t2617, 1
  br i1 %t2619, label %fixslow1032, label %fixmerge1033
fixslow1032:
  %t2620 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1033
fixmerge1033:
  %t2621 = phi i64 [ %t2618, %fixfast1031 ], [ %t2620, %fixslow1032 ]
  %t2622 = or i64 %a3, 128
  %t2623 = and i64 %t2622, 7
  %t2624 = icmp eq i64 %t2623, 0
  br i1 %t2624, label %fixfast1034, label %fixslow1035
fixfast1034:
  %t2625 = ashr i64 %a3, 3
  %t2626 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2625, i64 128)
  %t2627 = extractvalue {i64, i1} %t2626, 0
  %t2628 = extractvalue {i64, i1} %t2626, 1
  br i1 %t2628, label %fixslow1035, label %fixmerge1036
fixslow1035:
  %t2629 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge1036
fixmerge1036:
  %t2630 = phi i64 [ %t2627, %fixfast1034 ], [ %t2629, %fixslow1035 ]
  %t2631 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2632 = load i64, ptr @"emit.internal:rd-hex-digit"
  call void @rt_check_callable(i64 %t2632)
  %t2633 = and i64 %t2632, -8
  %t2634 = inttoptr i64 %t2633 to ptr
  %t2635 = load i64, ptr %t2634
  %t2636 = inttoptr i64 %t2635 to ptr
  %t2637 = call fastcc i64%t2636(i64 %t2632, i64 1, i64 %t2631, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2638 = or i64 %t2630, %t2637
  %t2639 = and i64 %t2638, 7
  %t2640 = icmp eq i64 %t2639, 0
  br i1 %t2640, label %fixfast1037, label %fixslow1038
fixfast1037:
  %t2641 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2630, i64 %t2637)
  %t2642 = extractvalue {i64, i1} %t2641, 0
  %t2643 = extractvalue {i64, i1} %t2641, 1
  br i1 %t2643, label %fixslow1038, label %fixmerge1039
fixslow1038:
  %t2644 = call i64 @rt_add(i64 %t2630, i64 %t2637)
  br label %fixmerge1039
fixmerge1039:
  %t2645 = phi i64 [ %t2642, %fixfast1037 ], [ %t2644, %fixslow1038 ]
  %t2646 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t2646)
  %t2647 = and i64 %t2646, -8
  %t2648 = inttoptr i64 %t2647 to ptr
  %t2649 = load i64, ptr %t2648
  %t2650 = inttoptr i64 %t2649 to ptr
  %t2651 = musttail call fastcc i64 %t2650(i64 %t2646, i64 4, i64 %a0, i64 %a1, i64 %t2621, i64 %t2645, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2651
else1022:
  %t2652 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2652
}

define fastcc i64 @"emit.internal:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2657 = icmp eq i64 %argc, 1
  br i1 %t2657, label %argok1041, label %arityerr1040
arityerr1040:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1041:
  %t2658 = call i64 @rt_char_to_integer(i64 %a0)
  %t2659 = or i64 %t2658, 776
  %t2660 = and i64 %t2659, 7
  %t2661 = icmp eq i64 %t2660, 0
  br i1 %t2661, label %fixfast1042, label %fixslow1043
fixfast1042:
  %t2662 = icmp eq i64 %t2658, 776
  %t2663 = select i1 %t2662, i64 257, i64 1
  br label %fixmerge1044
fixslow1043:
  %t2664 = call i64 @rt_num_eq(i64 %t2658, i64 776)
  br label %fixmerge1044
fixmerge1044:
  %t2665 = phi i64 [ %t2663, %fixfast1042 ], [ %t2664, %fixslow1043 ]
  %t2666 = icmp ne i64 %t2665, 1
  br i1 %t2666, label %then1045, label %else1046
then1045:
  %t2667 = call i64 @rt_integer_to_char(i64 56)
  ret i64 %t2667
else1046:
  %t2668 = or i64 %t2658, 784
  %t2669 = and i64 %t2668, 7
  %t2670 = icmp eq i64 %t2669, 0
  br i1 %t2670, label %fixfast1047, label %fixslow1048
fixfast1047:
  %t2671 = icmp eq i64 %t2658, 784
  %t2672 = select i1 %t2671, i64 257, i64 1
  br label %fixmerge1049
fixslow1048:
  %t2673 = call i64 @rt_num_eq(i64 %t2658, i64 784)
  br label %fixmerge1049
fixmerge1049:
  %t2674 = phi i64 [ %t2672, %fixfast1047 ], [ %t2673, %fixslow1048 ]
  %t2675 = icmp ne i64 %t2674, 1
  br i1 %t2675, label %then1050, label %else1051
then1050:
  %t2676 = call i64 @rt_integer_to_char(i64 64)
  ret i64 %t2676
else1051:
  %t2677 = or i64 %t2658, 880
  %t2678 = and i64 %t2677, 7
  %t2679 = icmp eq i64 %t2678, 0
  br i1 %t2679, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t2680 = icmp eq i64 %t2658, 880
  %t2681 = select i1 %t2680, i64 257, i64 1
  br label %fixmerge1054
fixslow1053:
  %t2682 = call i64 @rt_num_eq(i64 %t2658, i64 880)
  br label %fixmerge1054
fixmerge1054:
  %t2683 = phi i64 [ %t2681, %fixfast1052 ], [ %t2682, %fixslow1053 ]
  %t2684 = icmp ne i64 %t2683, 1
  br i1 %t2684, label %then1055, label %else1056
then1055:
  %t2685 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2685
else1056:
  %t2686 = or i64 %t2658, 928
  %t2687 = and i64 %t2686, 7
  %t2688 = icmp eq i64 %t2687, 0
  br i1 %t2688, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t2689 = icmp eq i64 %t2658, 928
  %t2690 = select i1 %t2689, i64 257, i64 1
  br label %fixmerge1059
fixslow1058:
  %t2691 = call i64 @rt_num_eq(i64 %t2658, i64 928)
  br label %fixmerge1059
fixmerge1059:
  %t2692 = phi i64 [ %t2690, %fixfast1057 ], [ %t2691, %fixslow1058 ]
  %t2693 = icmp ne i64 %t2692, 1
  br i1 %t2693, label %then1060, label %else1061
then1060:
  %t2694 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2694
else1061:
  %t2695 = or i64 %t2658, 912
  %t2696 = and i64 %t2695, 7
  %t2697 = icmp eq i64 %t2696, 0
  br i1 %t2697, label %fixfast1062, label %fixslow1063
fixfast1062:
  %t2698 = icmp eq i64 %t2658, 912
  %t2699 = select i1 %t2698, i64 257, i64 1
  br label %fixmerge1064
fixslow1063:
  %t2700 = call i64 @rt_num_eq(i64 %t2658, i64 912)
  br label %fixmerge1064
fixmerge1064:
  %t2701 = phi i64 [ %t2699, %fixfast1062 ], [ %t2700, %fixslow1063 ]
  %t2702 = icmp ne i64 %t2701, 1
  br i1 %t2702, label %then1065, label %else1066
then1065:
  %t2703 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2703
else1066:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code:rd-intraline"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2708 = icmp eq i64 %argc, 3
  br i1 %t2708, label %argok1068, label %arityerr1067
arityerr1067:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1068:
  %t2709 = or i64 %a2, %a1
  %t2710 = and i64 %t2709, 7
  %t2711 = icmp eq i64 %t2710, 0
  br i1 %t2711, label %fixfast1069, label %fixslow1070
fixfast1069:
  %t2712 = icmp slt i64 %a2, %a1
  %t2713 = select i1 %t2712, i64 257, i64 1
  br label %fixmerge1071
fixslow1070:
  %t2714 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1071
fixmerge1071:
  %t2715 = phi i64 [ %t2713, %fixfast1069 ], [ %t2714, %fixslow1070 ]
  %t2716 = icmp ne i64 %t2715, 1
  br i1 %t2716, label %then1072, label %else1073
then1072:
  %t2717 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2718 = call i64 @rt_char_to_integer(i64 %t2717)
  %t2719 = or i64 %t2718, 256
  %t2720 = and i64 %t2719, 7
  %t2721 = icmp eq i64 %t2720, 0
  br i1 %t2721, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t2722 = icmp eq i64 %t2718, 256
  %t2723 = select i1 %t2722, i64 257, i64 1
  br label %fixmerge1076
fixslow1075:
  %t2724 = call i64 @rt_num_eq(i64 %t2718, i64 256)
  br label %fixmerge1076
fixmerge1076:
  %t2725 = phi i64 [ %t2723, %fixfast1074 ], [ %t2724, %fixslow1075 ]
  %t2726 = icmp ne i64 %t2725, 1
  br i1 %t2726, label %then1077, label %else1078
then1077:
  br label %merge1079
else1078:
  %t2727 = or i64 %t2718, 72
  %t2728 = and i64 %t2727, 7
  %t2729 = icmp eq i64 %t2728, 0
  br i1 %t2729, label %fixfast1080, label %fixslow1081
fixfast1080:
  %t2730 = icmp eq i64 %t2718, 72
  %t2731 = select i1 %t2730, i64 257, i64 1
  br label %fixmerge1082
fixslow1081:
  %t2732 = call i64 @rt_num_eq(i64 %t2718, i64 72)
  br label %fixmerge1082
fixmerge1082:
  %t2733 = phi i64 [ %t2731, %fixfast1080 ], [ %t2732, %fixslow1081 ]
  br label %merge1079
merge1079:
  %t2734 = phi i64 [ 257, %then1077 ], [ %t2733, %fixmerge1082 ]
  %t2735 = icmp ne i64 %t2734, 1
  br i1 %t2735, label %then1083, label %else1084
then1083:
  %t2736 = or i64 %a2, 8
  %t2737 = and i64 %t2736, 7
  %t2738 = icmp eq i64 %t2737, 0
  br i1 %t2738, label %fixfast1085, label %fixslow1086
fixfast1085:
  %t2739 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2740 = extractvalue {i64, i1} %t2739, 0
  %t2741 = extractvalue {i64, i1} %t2739, 1
  br i1 %t2741, label %fixslow1086, label %fixmerge1087
fixslow1086:
  %t2742 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1087
fixmerge1087:
  %t2743 = phi i64 [ %t2740, %fixfast1085 ], [ %t2742, %fixslow1086 ]
  %t2744 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t2744)
  %t2745 = and i64 %t2744, -8
  %t2746 = inttoptr i64 %t2745 to ptr
  %t2747 = load i64, ptr %t2746
  %t2748 = inttoptr i64 %t2747 to ptr
  %t2749 = musttail call fastcc i64 %t2748(i64 %t2744, i64 3, i64 %a0, i64 %a1, i64 %t2743, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2749
else1084:
  ret i64 %a2
else1073:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-line-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2754 = icmp eq i64 %argc, 3
  br i1 %t2754, label %argok1089, label %arityerr1088
arityerr1088:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1089:
  %t2755 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t2755)
  %t2756 = and i64 %t2755, -8
  %t2757 = inttoptr i64 %t2756 to ptr
  %t2758 = load i64, ptr %t2757
  %t2759 = inttoptr i64 %t2758 to ptr
  %t2760 = call fastcc i64%t2759(i64 %t2755, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2761 = or i64 %t2760, %a1
  %t2762 = and i64 %t2761, 7
  %t2763 = icmp eq i64 %t2762, 0
  br i1 %t2763, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t2764 = icmp slt i64 %t2760, %a1
  %t2765 = select i1 %t2764, i64 257, i64 1
  br label %fixmerge1092
fixslow1091:
  %t2766 = call i64 @rt_lt(i64 %t2760, i64 %a1)
  br label %fixmerge1092
fixmerge1092:
  %t2767 = phi i64 [ %t2765, %fixfast1090 ], [ %t2766, %fixslow1091 ]
  %t2768 = icmp ne i64 %t2767, 1
  br i1 %t2768, label %then1093, label %else1094
then1093:
  %t2769 = call i64 @rt_string_ref(i64 %a0, i64 %t2760)
  %t2770 = call i64 @rt_char_to_integer(i64 %t2769)
  %t2771 = or i64 %t2770, 80
  %t2772 = and i64 %t2771, 7
  %t2773 = icmp eq i64 %t2772, 0
  br i1 %t2773, label %fixfast1095, label %fixslow1096
fixfast1095:
  %t2774 = icmp eq i64 %t2770, 80
  %t2775 = select i1 %t2774, i64 257, i64 1
  br label %fixmerge1097
fixslow1096:
  %t2776 = call i64 @rt_num_eq(i64 %t2770, i64 80)
  br label %fixmerge1097
fixmerge1097:
  %t2777 = phi i64 [ %t2775, %fixfast1095 ], [ %t2776, %fixslow1096 ]
  %t2778 = icmp ne i64 %t2777, 1
  br i1 %t2778, label %then1098, label %else1099
then1098:
  %t2779 = or i64 %t2760, 8
  %t2780 = and i64 %t2779, 7
  %t2781 = icmp eq i64 %t2780, 0
  br i1 %t2781, label %fixfast1100, label %fixslow1101
fixfast1100:
  %t2782 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2760, i64 8)
  %t2783 = extractvalue {i64, i1} %t2782, 0
  %t2784 = extractvalue {i64, i1} %t2782, 1
  br i1 %t2784, label %fixslow1101, label %fixmerge1102
fixslow1101:
  %t2785 = call i64 @rt_add(i64 %t2760, i64 8)
  br label %fixmerge1102
fixmerge1102:
  %t2786 = phi i64 [ %t2783, %fixfast1100 ], [ %t2785, %fixslow1101 ]
  %t2787 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t2787)
  %t2788 = and i64 %t2787, -8
  %t2789 = inttoptr i64 %t2788 to ptr
  %t2790 = load i64, ptr %t2789
  %t2791 = inttoptr i64 %t2790 to ptr
  %t2792 = musttail call fastcc i64 %t2791(i64 %t2787, i64 3, i64 %a0, i64 %a1, i64 %t2786, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2792
else1099:
  %t2793 = or i64 %t2770, 104
  %t2794 = and i64 %t2793, 7
  %t2795 = icmp eq i64 %t2794, 0
  br i1 %t2795, label %fixfast1103, label %fixslow1104
fixfast1103:
  %t2796 = icmp eq i64 %t2770, 104
  %t2797 = select i1 %t2796, i64 257, i64 1
  br label %fixmerge1105
fixslow1104:
  %t2798 = call i64 @rt_num_eq(i64 %t2770, i64 104)
  br label %fixmerge1105
fixmerge1105:
  %t2799 = phi i64 [ %t2797, %fixfast1103 ], [ %t2798, %fixslow1104 ]
  %t2800 = icmp ne i64 %t2799, 1
  br i1 %t2800, label %then1106, label %else1107
then1106:
  %t2801 = or i64 %t2760, 8
  %t2802 = and i64 %t2801, 7
  %t2803 = icmp eq i64 %t2802, 0
  br i1 %t2803, label %fixfast1108, label %fixslow1109
fixfast1108:
  %t2804 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2760, i64 8)
  %t2805 = extractvalue {i64, i1} %t2804, 0
  %t2806 = extractvalue {i64, i1} %t2804, 1
  br i1 %t2806, label %fixslow1109, label %fixmerge1110
fixslow1109:
  %t2807 = call i64 @rt_add(i64 %t2760, i64 8)
  br label %fixmerge1110
fixmerge1110:
  %t2808 = phi i64 [ %t2805, %fixfast1108 ], [ %t2807, %fixslow1109 ]
  %t2809 = or i64 %t2808, %a1
  %t2810 = and i64 %t2809, 7
  %t2811 = icmp eq i64 %t2810, 0
  br i1 %t2811, label %fixfast1111, label %fixslow1112
fixfast1111:
  %t2812 = icmp slt i64 %t2808, %a1
  %t2813 = select i1 %t2812, i64 257, i64 1
  br label %fixmerge1113
fixslow1112:
  %t2814 = call i64 @rt_lt(i64 %t2808, i64 %a1)
  br label %fixmerge1113
fixmerge1113:
  %t2815 = phi i64 [ %t2813, %fixfast1111 ], [ %t2814, %fixslow1112 ]
  %t2816 = icmp ne i64 %t2815, 1
  br i1 %t2816, label %then1114, label %else1115
then1114:
  %t2817 = or i64 %t2760, 8
  %t2818 = and i64 %t2817, 7
  %t2819 = icmp eq i64 %t2818, 0
  br i1 %t2819, label %fixfast1117, label %fixslow1118
fixfast1117:
  %t2820 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2760, i64 8)
  %t2821 = extractvalue {i64, i1} %t2820, 0
  %t2822 = extractvalue {i64, i1} %t2820, 1
  br i1 %t2822, label %fixslow1118, label %fixmerge1119
fixslow1118:
  %t2823 = call i64 @rt_add(i64 %t2760, i64 8)
  br label %fixmerge1119
fixmerge1119:
  %t2824 = phi i64 [ %t2821, %fixfast1117 ], [ %t2823, %fixslow1118 ]
  %t2825 = call i64 @rt_string_ref(i64 %a0, i64 %t2824)
  %t2826 = call i64 @rt_char_to_integer(i64 %t2825)
  %t2827 = or i64 %t2826, 80
  %t2828 = and i64 %t2827, 7
  %t2829 = icmp eq i64 %t2828, 0
  br i1 %t2829, label %fixfast1120, label %fixslow1121
fixfast1120:
  %t2830 = icmp eq i64 %t2826, 80
  %t2831 = select i1 %t2830, i64 257, i64 1
  br label %fixmerge1122
fixslow1121:
  %t2832 = call i64 @rt_num_eq(i64 %t2826, i64 80)
  br label %fixmerge1122
fixmerge1122:
  %t2833 = phi i64 [ %t2831, %fixfast1120 ], [ %t2832, %fixslow1121 ]
  %t2834 = icmp ne i64 %t2833, 1
  br i1 %t2834, label %then1123, label %else1124
then1123:
  %t2835 = or i64 %t2760, 16
  %t2836 = and i64 %t2835, 7
  %t2837 = icmp eq i64 %t2836, 0
  br i1 %t2837, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t2838 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2760, i64 16)
  %t2839 = extractvalue {i64, i1} %t2838, 0
  %t2840 = extractvalue {i64, i1} %t2838, 1
  br i1 %t2840, label %fixslow1127, label %fixmerge1128
fixslow1127:
  %t2841 = call i64 @rt_add(i64 %t2760, i64 16)
  br label %fixmerge1128
fixmerge1128:
  %t2842 = phi i64 [ %t2839, %fixfast1126 ], [ %t2841, %fixslow1127 ]
  br label %merge1125
else1124:
  %t2843 = or i64 %t2760, 8
  %t2844 = and i64 %t2843, 7
  %t2845 = icmp eq i64 %t2844, 0
  br i1 %t2845, label %fixfast1129, label %fixslow1130
fixfast1129:
  %t2846 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2760, i64 8)
  %t2847 = extractvalue {i64, i1} %t2846, 0
  %t2848 = extractvalue {i64, i1} %t2846, 1
  br i1 %t2848, label %fixslow1130, label %fixmerge1131
fixslow1130:
  %t2849 = call i64 @rt_add(i64 %t2760, i64 8)
  br label %fixmerge1131
fixmerge1131:
  %t2850 = phi i64 [ %t2847, %fixfast1129 ], [ %t2849, %fixslow1130 ]
  br label %merge1125
merge1125:
  %t2851 = phi i64 [ %t2842, %fixmerge1128 ], [ %t2850, %fixmerge1131 ]
  br label %merge1116
else1115:
  %t2852 = or i64 %t2760, 8
  %t2853 = and i64 %t2852, 7
  %t2854 = icmp eq i64 %t2853, 0
  br i1 %t2854, label %fixfast1132, label %fixslow1133
fixfast1132:
  %t2855 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2760, i64 8)
  %t2856 = extractvalue {i64, i1} %t2855, 0
  %t2857 = extractvalue {i64, i1} %t2855, 1
  br i1 %t2857, label %fixslow1133, label %fixmerge1134
fixslow1133:
  %t2858 = call i64 @rt_add(i64 %t2760, i64 8)
  br label %fixmerge1134
fixmerge1134:
  %t2859 = phi i64 [ %t2856, %fixfast1132 ], [ %t2858, %fixslow1133 ]
  br label %merge1116
merge1116:
  %t2860 = phi i64 [ %t2851, %merge1125 ], [ %t2859, %fixmerge1134 ]
  %t2861 = load i64, ptr @"emit.internal:rd-intraline"
  call void @rt_check_callable(i64 %t2861)
  %t2862 = and i64 %t2861, -8
  %t2863 = inttoptr i64 %t2862 to ptr
  %t2864 = load i64, ptr %t2863
  %t2865 = inttoptr i64 %t2864 to ptr
  %t2866 = musttail call fastcc i64 %t2865(i64 %t2861, i64 3, i64 %a0, i64 %a1, i64 %t2860, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2866
else1107:
  ret i64 1
else1094:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_891"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2871 = icmp eq i64 %argc, 2
  br i1 %t2871, label %argok1136, label %arityerr1135
arityerr1135:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1136:
  %t2872 = and i64 %self, -8
  %t2873 = inttoptr i64 %t2872 to ptr
  %t2874 = getelementptr i64, ptr %t2873, i64 1
  %t2875 = load i64, ptr %t2874
  %t2876 = or i64 %a0, %t2875
  %t2877 = and i64 %t2876, 7
  %t2878 = icmp eq i64 %t2877, 0
  br i1 %t2878, label %fixfast1137, label %fixslow1138
fixfast1137:
  %t2879 = icmp slt i64 %a0, %t2875
  %t2880 = select i1 %t2879, i64 257, i64 1
  br label %fixmerge1139
fixslow1138:
  %t2881 = call i64 @rt_lt(i64 %a0, i64 %t2875)
  br label %fixmerge1139
fixmerge1139:
  %t2882 = phi i64 [ %t2880, %fixfast1137 ], [ %t2881, %fixslow1138 ]
  %t2883 = icmp ne i64 %t2882, 1
  br i1 %t2883, label %then1140, label %else1141
then1140:
  %t2884 = and i64 %self, -8
  %t2885 = inttoptr i64 %t2884 to ptr
  %t2886 = getelementptr i64, ptr %t2885, i64 2
  %t2887 = load i64, ptr %t2886
  %t2888 = call i64 @rt_string_ref(i64 %t2887, i64 %a0)
  %t2889 = call i64 @rt_char_to_integer(i64 %t2888)
  %t2890 = or i64 %t2889, 272
  %t2891 = and i64 %t2890, 7
  %t2892 = icmp eq i64 %t2891, 0
  br i1 %t2892, label %fixfast1142, label %fixslow1143
fixfast1142:
  %t2893 = icmp eq i64 %t2889, 272
  %t2894 = select i1 %t2893, i64 257, i64 1
  br label %fixmerge1144
fixslow1143:
  %t2895 = call i64 @rt_num_eq(i64 %t2889, i64 272)
  br label %fixmerge1144
fixmerge1144:
  %t2896 = phi i64 [ %t2894, %fixfast1142 ], [ %t2895, %fixslow1143 ]
  %t2897 = icmp ne i64 %t2896, 1
  br i1 %t2897, label %then1145, label %else1146
then1145:
  %t2898 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t2898)
  %t2899 = and i64 %t2898, -8
  %t2900 = inttoptr i64 %t2899 to ptr
  %t2901 = load i64, ptr %t2900
  %t2902 = inttoptr i64 %t2901 to ptr
  %t2903 = call fastcc i64%t2902(i64 %t2898, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2904 = call i64 @rt_list_to_string(i64 %t2903)
  %t2905 = or i64 %a0, 8
  %t2906 = and i64 %t2905, 7
  %t2907 = icmp eq i64 %t2906, 0
  br i1 %t2907, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t2908 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2909 = extractvalue {i64, i1} %t2908, 0
  %t2910 = extractvalue {i64, i1} %t2908, 1
  br i1 %t2910, label %fixslow1148, label %fixmerge1149
fixslow1148:
  %t2911 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1149
fixmerge1149:
  %t2912 = phi i64 [ %t2909, %fixfast1147 ], [ %t2911, %fixslow1148 ]
  %t2913 = call i64 @rt_cons(i64 %t2904, i64 %t2912)
  ret i64 %t2913
else1146:
  %t2914 = or i64 %t2889, 736
  %t2915 = and i64 %t2914, 7
  %t2916 = icmp eq i64 %t2915, 0
  br i1 %t2916, label %fixfast1150, label %fixslow1151
fixfast1150:
  %t2917 = icmp eq i64 %t2889, 736
  %t2918 = select i1 %t2917, i64 257, i64 1
  br label %fixmerge1152
fixslow1151:
  %t2919 = call i64 @rt_num_eq(i64 %t2889, i64 736)
  br label %fixmerge1152
fixmerge1152:
  %t2920 = phi i64 [ %t2918, %fixfast1150 ], [ %t2919, %fixslow1151 ]
  %t2921 = icmp ne i64 %t2920, 1
  br i1 %t2921, label %then1153, label %else1154
then1153:
  %t2922 = and i64 %self, -8
  %t2923 = inttoptr i64 %t2922 to ptr
  %t2924 = getelementptr i64, ptr %t2923, i64 1
  %t2925 = load i64, ptr %t2924
  %t2926 = or i64 %a0, 8
  %t2927 = and i64 %t2926, 7
  %t2928 = icmp eq i64 %t2927, 0
  br i1 %t2928, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t2929 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2930 = extractvalue {i64, i1} %t2929, 0
  %t2931 = extractvalue {i64, i1} %t2929, 1
  br i1 %t2931, label %fixslow1156, label %fixmerge1157
fixslow1156:
  %t2932 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1157
fixmerge1157:
  %t2933 = phi i64 [ %t2930, %fixfast1155 ], [ %t2932, %fixslow1156 ]
  %t2934 = or i64 %t2925, %t2933
  %t2935 = and i64 %t2934, 7
  %t2936 = icmp eq i64 %t2935, 0
  br i1 %t2936, label %fixfast1158, label %fixslow1159
fixfast1158:
  %t2937 = icmp slt i64 %t2925, %t2933
  %t2938 = select i1 %t2937, i64 257, i64 1
  br label %fixmerge1160
fixslow1159:
  %t2939 = call i64 @rt_lt(i64 %t2925, i64 %t2933)
  br label %fixmerge1160
fixmerge1160:
  %t2940 = phi i64 [ %t2938, %fixfast1158 ], [ %t2939, %fixslow1159 ]
  %t2941 = icmp ne i64 %t2940, 1
  br i1 %t2941, label %then1161, label %else1162
then1161:
  br label %merge1163
else1162:
  %t2942 = or i64 %t2925, %t2933
  %t2943 = and i64 %t2942, 7
  %t2944 = icmp eq i64 %t2943, 0
  br i1 %t2944, label %fixfast1164, label %fixslow1165
fixfast1164:
  %t2945 = icmp eq i64 %t2925, %t2933
  %t2946 = select i1 %t2945, i64 257, i64 1
  br label %fixmerge1166
fixslow1165:
  %t2947 = call i64 @rt_num_eq(i64 %t2925, i64 %t2933)
  br label %fixmerge1166
fixmerge1166:
  %t2948 = phi i64 [ %t2946, %fixfast1164 ], [ %t2947, %fixslow1165 ]
  br label %merge1163
merge1163:
  %t2949 = phi i64 [ 257, %then1161 ], [ %t2948, %fixmerge1166 ]
  %t2950 = icmp ne i64 %t2949, 1
  br i1 %t2950, label %then1167, label %else1168
then1167:
  %t2951 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2952 = and i64 %self, -8
  %t2953 = inttoptr i64 %t2952 to ptr
  %t2954 = getelementptr i64, ptr %t2953, i64 3
  %t2955 = load i64, ptr %t2954
  %t2956 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t2956)
  %t2957 = and i64 %t2956, -8
  %t2958 = inttoptr i64 %t2957 to ptr
  %t2959 = load i64, ptr %t2958
  %t2960 = inttoptr i64 %t2959 to ptr
  %t2961 = musttail call fastcc i64 %t2960(i64 %t2956, i64 2, i64 %t2951, i64 %t2955, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2961
else1168:
  %t2962 = and i64 %self, -8
  %t2963 = inttoptr i64 %t2962 to ptr
  %t2964 = getelementptr i64, ptr %t2963, i64 2
  %t2965 = load i64, ptr %t2964
  %t2966 = or i64 %a0, 8
  %t2967 = and i64 %t2966, 7
  %t2968 = icmp eq i64 %t2967, 0
  br i1 %t2968, label %fixfast1169, label %fixslow1170
fixfast1169:
  %t2969 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2970 = extractvalue {i64, i1} %t2969, 0
  %t2971 = extractvalue {i64, i1} %t2969, 1
  br i1 %t2971, label %fixslow1170, label %fixmerge1171
fixslow1170:
  %t2972 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1171
fixmerge1171:
  %t2973 = phi i64 [ %t2970, %fixfast1169 ], [ %t2972, %fixslow1170 ]
  %t2974 = call i64 @rt_string_ref(i64 %t2965, i64 %t2973)
  %t2975 = and i64 %self, -8
  %t2976 = inttoptr i64 %t2975 to ptr
  %t2977 = getelementptr i64, ptr %t2976, i64 2
  %t2978 = load i64, ptr %t2977
  %t2979 = and i64 %self, -8
  %t2980 = inttoptr i64 %t2979 to ptr
  %t2981 = getelementptr i64, ptr %t2980, i64 1
  %t2982 = load i64, ptr %t2981
  %t2983 = or i64 %a0, 8
  %t2984 = and i64 %t2983, 7
  %t2985 = icmp eq i64 %t2984, 0
  br i1 %t2985, label %fixfast1172, label %fixslow1173
fixfast1172:
  %t2986 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2987 = extractvalue {i64, i1} %t2986, 0
  %t2988 = extractvalue {i64, i1} %t2986, 1
  br i1 %t2988, label %fixslow1173, label %fixmerge1174
fixslow1173:
  %t2989 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1174
fixmerge1174:
  %t2990 = phi i64 [ %t2987, %fixfast1172 ], [ %t2989, %fixslow1173 ]
  %t2991 = load i64, ptr @"emit.internal:rd-line-continuation"
  call void @rt_check_callable(i64 %t2991)
  %t2992 = and i64 %t2991, -8
  %t2993 = inttoptr i64 %t2992 to ptr
  %t2994 = load i64, ptr %t2993
  %t2995 = inttoptr i64 %t2994 to ptr
  %t2996 = call fastcc i64%t2995(i64 %t2991, i64 3, i64 %t2978, i64 %t2982, i64 %t2990, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2997 = icmp ne i64 %t2996, 1
  br i1 %t2997, label %then1175, label %else1176
then1175:
  %t2998 = musttail call fastcc i64 @"emit.internal:code_891"(i64 %self, i64 2, i64 %t2996, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2998
else1176:
  %t2999 = call i64 @rt_char_to_integer(i64 %t2974)
  %t3000 = or i64 %t2999, 960
  %t3001 = and i64 %t3000, 7
  %t3002 = icmp eq i64 %t3001, 0
  br i1 %t3002, label %fixfast1177, label %fixslow1178
fixfast1177:
  %t3003 = icmp eq i64 %t2999, 960
  %t3004 = select i1 %t3003, i64 257, i64 1
  br label %fixmerge1179
fixslow1178:
  %t3005 = call i64 @rt_num_eq(i64 %t2999, i64 960)
  br label %fixmerge1179
fixmerge1179:
  %t3006 = phi i64 [ %t3004, %fixfast1177 ], [ %t3005, %fixslow1178 ]
  %t3007 = icmp ne i64 %t3006, 1
  br i1 %t3007, label %then1180, label %else1181
then1180:
  %t3008 = and i64 %self, -8
  %t3009 = inttoptr i64 %t3008 to ptr
  %t3010 = getelementptr i64, ptr %t3009, i64 2
  %t3011 = load i64, ptr %t3010
  %t3012 = and i64 %self, -8
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = getelementptr i64, ptr %t3013, i64 1
  %t3015 = load i64, ptr %t3014
  %t3016 = or i64 %a0, 16
  %t3017 = and i64 %t3016, 7
  %t3018 = icmp eq i64 %t3017, 0
  br i1 %t3018, label %fixfast1182, label %fixslow1183
fixfast1182:
  %t3019 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3020 = extractvalue {i64, i1} %t3019, 0
  %t3021 = extractvalue {i64, i1} %t3019, 1
  br i1 %t3021, label %fixslow1183, label %fixmerge1184
fixslow1183:
  %t3022 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1184
fixmerge1184:
  %t3023 = phi i64 [ %t3020, %fixfast1182 ], [ %t3022, %fixslow1183 ]
  %t3024 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t3024)
  %t3025 = and i64 %t3024, -8
  %t3026 = inttoptr i64 %t3025 to ptr
  %t3027 = load i64, ptr %t3026
  %t3028 = inttoptr i64 %t3027 to ptr
  %t3029 = call fastcc i64%t3028(i64 %t3024, i64 4, i64 %t3011, i64 %t3015, i64 %t3023, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3030 = call i64 @rt_cdr(i64 %t3029)
  %t3031 = call i64 @rt_car(i64 %t3029)
  %t3032 = call i64 @rt_integer_to_char(i64 %t3031)
  %t3033 = call i64 @rt_cons(i64 %t3032, i64 %a1)
  %t3034 = musttail call fastcc i64 @"emit.internal:code_891"(i64 %self, i64 2, i64 %t3030, i64 %t3033, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3034
else1181:
  %t3035 = or i64 %a0, 16
  %t3036 = and i64 %t3035, 7
  %t3037 = icmp eq i64 %t3036, 0
  br i1 %t3037, label %fixfast1185, label %fixslow1186
fixfast1185:
  %t3038 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3039 = extractvalue {i64, i1} %t3038, 0
  %t3040 = extractvalue {i64, i1} %t3038, 1
  br i1 %t3040, label %fixslow1186, label %fixmerge1187
fixslow1186:
  %t3041 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1187
fixmerge1187:
  %t3042 = phi i64 [ %t3039, %fixfast1185 ], [ %t3041, %fixslow1186 ]
  %t3043 = load i64, ptr @"emit.internal:rd-str-esc"
  call void @rt_check_callable(i64 %t3043)
  %t3044 = and i64 %t3043, -8
  %t3045 = inttoptr i64 %t3044 to ptr
  %t3046 = load i64, ptr %t3045
  %t3047 = inttoptr i64 %t3046 to ptr
  %t3048 = call fastcc i64%t3047(i64 %t3043, i64 1, i64 %t2974, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3049 = call i64 @rt_cons(i64 %t3048, i64 %a1)
  %t3050 = musttail call fastcc i64 @"emit.internal:code_891"(i64 %self, i64 2, i64 %t3042, i64 %t3049, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3050
else1154:
  %t3051 = or i64 %a0, 8
  %t3052 = and i64 %t3051, 7
  %t3053 = icmp eq i64 %t3052, 0
  br i1 %t3053, label %fixfast1188, label %fixslow1189
fixfast1188:
  %t3054 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3055 = extractvalue {i64, i1} %t3054, 0
  %t3056 = extractvalue {i64, i1} %t3054, 1
  br i1 %t3056, label %fixslow1189, label %fixmerge1190
fixslow1189:
  %t3057 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1190
fixmerge1190:
  %t3058 = phi i64 [ %t3055, %fixfast1188 ], [ %t3057, %fixslow1189 ]
  %t3059 = call i64 @rt_cons(i64 %t2888, i64 %a1)
  %t3060 = musttail call fastcc i64 @"emit.internal:code_891"(i64 %self, i64 2, i64 %t3058, i64 %t3059, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3060
else1141:
  %t3061 = call i64 @rt_intern(ptr @.str.sym.11)
  %t3062 = and i64 %self, -8
  %t3063 = inttoptr i64 %t3062 to ptr
  %t3064 = getelementptr i64, ptr %t3063, i64 3
  %t3065 = load i64, ptr %t3064
  %t3066 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3066)
  %t3067 = and i64 %t3066, -8
  %t3068 = inttoptr i64 %t3067 to ptr
  %t3069 = load i64, ptr %t3068
  %t3070 = inttoptr i64 %t3069 to ptr
  %t3071 = musttail call fastcc i64 %t3070(i64 %t3066, i64 2, i64 %t3061, i64 %t3065, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3071
}

define fastcc i64 @"emit.internal:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3072 = icmp eq i64 %argc, 4
  br i1 %t3072, label %argok1192, label %arityerr1191
arityerr1191:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1192:
  %t3073 = call ptr @rt_alloc_words(i64 5)
  %t3074 = ptrtoint ptr %t3073 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_891" to i64), ptr %t3073
  %t3075 = or i64 %t3074, 4
  %t3076 = getelementptr i64, ptr %t3073, i64 1
  store i64 %a1, ptr %t3076
  %t3077 = getelementptr i64, ptr %t3073, i64 2
  store i64 %a0, ptr %t3077
  %t3078 = getelementptr i64, ptr %t3073, i64 3
  store i64 %a3, ptr %t3078
  %t3079 = getelementptr i64, ptr %t3073, i64 4
  store i64 %t3075, ptr %t3079
  %t3080 = musttail call fastcc i64 @"emit.internal:code_891"(i64 %t3075, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3080
}

define fastcc i64 @"emit.internal:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3085 = icmp eq i64 %argc, 4
  br i1 %t3085, label %argok1194, label %arityerr1193
arityerr1193:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1194:
  %t3086 = or i64 %a1, %a2
  %t3087 = and i64 %t3086, 7
  %t3088 = icmp eq i64 %t3087, 0
  br i1 %t3088, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t3089 = icmp slt i64 %a1, %a2
  %t3090 = select i1 %t3089, i64 257, i64 1
  br label %fixmerge1197
fixslow1196:
  %t3091 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1197
fixmerge1197:
  %t3092 = phi i64 [ %t3090, %fixfast1195 ], [ %t3091, %fixslow1196 ]
  %t3093 = icmp ne i64 %t3092, 1
  br i1 %t3093, label %then1198, label %else1199
then1198:
  br label %merge1200
else1199:
  %t3094 = or i64 %a1, %a2
  %t3095 = and i64 %t3094, 7
  %t3096 = icmp eq i64 %t3095, 0
  br i1 %t3096, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t3097 = icmp eq i64 %a1, %a2
  %t3098 = select i1 %t3097, i64 257, i64 1
  br label %fixmerge1203
fixslow1202:
  %t3099 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge1203
fixmerge1203:
  %t3100 = phi i64 [ %t3098, %fixfast1201 ], [ %t3099, %fixslow1202 ]
  br label %merge1200
merge1200:
  %t3101 = phi i64 [ 257, %then1198 ], [ %t3100, %fixmerge1203 ]
  %t3102 = icmp ne i64 %t3101, 1
  br i1 %t3102, label %then1204, label %else1205
then1204:
  %t3103 = call i64 @rt_intern(ptr @.str.sym.12)
  %t3104 = or i64 %a2, 8
  %t3105 = and i64 %t3104, 7
  %t3106 = icmp eq i64 %t3105, 0
  br i1 %t3106, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t3107 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3108 = extractvalue {i64, i1} %t3107, 0
  %t3109 = extractvalue {i64, i1} %t3107, 1
  br i1 %t3109, label %fixslow1207, label %fixmerge1208
fixslow1207:
  %t3110 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1208
fixmerge1208:
  %t3111 = phi i64 [ %t3108, %fixfast1206 ], [ %t3110, %fixslow1207 ]
  %t3112 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3112)
  %t3113 = and i64 %t3112, -8
  %t3114 = inttoptr i64 %t3113 to ptr
  %t3115 = load i64, ptr %t3114
  %t3116 = inttoptr i64 %t3115 to ptr
  %t3117 = musttail call fastcc i64 %t3116(i64 %t3112, i64 2, i64 %t3103, i64 %t3111, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3117
else1205:
  %t3118 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3119 = call i64 @rt_char_to_integer(i64 %t3118)
  %t3120 = or i64 %t3119, 928
  %t3121 = and i64 %t3120, 7
  %t3122 = icmp eq i64 %t3121, 0
  br i1 %t3122, label %fixfast1209, label %fixslow1210
fixfast1209:
  %t3123 = icmp eq i64 %t3119, 928
  %t3124 = select i1 %t3123, i64 257, i64 1
  br label %fixmerge1211
fixslow1210:
  %t3125 = call i64 @rt_num_eq(i64 %t3119, i64 928)
  br label %fixmerge1211
fixmerge1211:
  %t3126 = phi i64 [ %t3124, %fixfast1209 ], [ %t3125, %fixslow1210 ]
  %t3127 = icmp ne i64 %t3126, 1
  br i1 %t3127, label %then1212, label %else1213
then1212:
  br label %merge1214
else1213:
  %t3128 = or i64 %t3119, 816
  %t3129 = and i64 %t3128, 7
  %t3130 = icmp eq i64 %t3129, 0
  br i1 %t3130, label %fixfast1215, label %fixslow1216
fixfast1215:
  %t3131 = icmp eq i64 %t3119, 816
  %t3132 = select i1 %t3131, i64 257, i64 1
  br label %fixmerge1217
fixslow1216:
  %t3133 = call i64 @rt_num_eq(i64 %t3119, i64 816)
  br label %fixmerge1217
fixmerge1217:
  %t3134 = phi i64 [ %t3132, %fixfast1215 ], [ %t3133, %fixslow1216 ]
  br label %merge1214
merge1214:
  %t3135 = phi i64 [ 257, %then1212 ], [ %t3134, %fixmerge1217 ]
  %t3136 = icmp ne i64 %t3135, 1
  br i1 %t3136, label %then1218, label %else1219
then1218:
  %t3137 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t3137)
  %t3138 = and i64 %t3137, -8
  %t3139 = inttoptr i64 %t3138 to ptr
  %t3140 = load i64, ptr %t3139
  %t3141 = inttoptr i64 %t3140 to ptr
  %t3142 = call fastcc i64%t3141(i64 %t3137, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3143 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3142)
  %t3144 = call i64 @rt_make_string(ptr @.str.lit.13, i64 1)
  %t3145 = call i64 @rt_string_eq(i64 %t3143, i64 %t3144)
  %t3146 = icmp ne i64 %t3145, 1
  br i1 %t3146, label %then1220, label %else1221
then1220:
  %t3147 = or i64 %a2, 8
  %t3148 = and i64 %t3147, 7
  %t3149 = icmp eq i64 %t3148, 0
  br i1 %t3149, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t3150 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3151 = extractvalue {i64, i1} %t3150, 0
  %t3152 = extractvalue {i64, i1} %t3150, 1
  br i1 %t3152, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t3153 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1224
fixmerge1224:
  %t3154 = phi i64 [ %t3151, %fixfast1222 ], [ %t3153, %fixslow1223 ]
  %t3155 = call i64 @rt_cons(i64 257, i64 %t3154)
  ret i64 %t3155
else1221:
  %t3156 = call i64 @rt_make_string(ptr @.str.lit.14, i64 4)
  %t3157 = call i64 @rt_string_eq(i64 %t3143, i64 %t3156)
  %t3158 = icmp ne i64 %t3157, 1
  br i1 %t3158, label %then1225, label %else1226
then1225:
  %t3159 = or i64 %a2, 32
  %t3160 = and i64 %t3159, 7
  %t3161 = icmp eq i64 %t3160, 0
  br i1 %t3161, label %fixfast1227, label %fixslow1228
fixfast1227:
  %t3162 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 32)
  %t3163 = extractvalue {i64, i1} %t3162, 0
  %t3164 = extractvalue {i64, i1} %t3162, 1
  br i1 %t3164, label %fixslow1228, label %fixmerge1229
fixslow1228:
  %t3165 = call i64 @rt_add(i64 %a2, i64 32)
  br label %fixmerge1229
fixmerge1229:
  %t3166 = phi i64 [ %t3163, %fixfast1227 ], [ %t3165, %fixslow1228 ]
  %t3167 = call i64 @rt_cons(i64 257, i64 %t3166)
  ret i64 %t3167
else1226:
  %t3168 = call i64 @rt_make_string(ptr @.str.lit.15, i64 1)
  %t3169 = call i64 @rt_string_eq(i64 %t3143, i64 %t3168)
  %t3170 = icmp ne i64 %t3169, 1
  br i1 %t3170, label %then1230, label %else1231
then1230:
  %t3171 = or i64 %a2, 8
  %t3172 = and i64 %t3171, 7
  %t3173 = icmp eq i64 %t3172, 0
  br i1 %t3173, label %fixfast1232, label %fixslow1233
fixfast1232:
  %t3174 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3175 = extractvalue {i64, i1} %t3174, 0
  %t3176 = extractvalue {i64, i1} %t3174, 1
  br i1 %t3176, label %fixslow1233, label %fixmerge1234
fixslow1233:
  %t3177 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1234
fixmerge1234:
  %t3178 = phi i64 [ %t3175, %fixfast1232 ], [ %t3177, %fixslow1233 ]
  %t3179 = call i64 @rt_cons(i64 1, i64 %t3178)
  ret i64 %t3179
else1231:
  %t3180 = call i64 @rt_make_string(ptr @.str.lit.16, i64 5)
  %t3181 = call i64 @rt_string_eq(i64 %t3143, i64 %t3180)
  %t3182 = icmp ne i64 %t3181, 1
  br i1 %t3182, label %then1235, label %else1236
then1235:
  %t3183 = or i64 %a2, 40
  %t3184 = and i64 %t3183, 7
  %t3185 = icmp eq i64 %t3184, 0
  br i1 %t3185, label %fixfast1237, label %fixslow1238
fixfast1237:
  %t3186 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 40)
  %t3187 = extractvalue {i64, i1} %t3186, 0
  %t3188 = extractvalue {i64, i1} %t3186, 1
  br i1 %t3188, label %fixslow1238, label %fixmerge1239
fixslow1238:
  %t3189 = call i64 @rt_add(i64 %a2, i64 40)
  br label %fixmerge1239
fixmerge1239:
  %t3190 = phi i64 [ %t3187, %fixfast1237 ], [ %t3189, %fixslow1238 ]
  %t3191 = call i64 @rt_cons(i64 1, i64 %t3190)
  ret i64 %t3191
else1236:
  %t3192 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3193 = or i64 %a2, 8
  %t3194 = and i64 %t3193, 7
  %t3195 = icmp eq i64 %t3194, 0
  br i1 %t3195, label %fixfast1240, label %fixslow1241
fixfast1240:
  %t3196 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3197 = extractvalue {i64, i1} %t3196, 0
  %t3198 = extractvalue {i64, i1} %t3196, 1
  br i1 %t3198, label %fixslow1241, label %fixmerge1242
fixslow1241:
  %t3199 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1242
fixmerge1242:
  %t3200 = phi i64 [ %t3197, %fixfast1240 ], [ %t3199, %fixslow1241 ]
  %t3201 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3201)
  %t3202 = and i64 %t3201, -8
  %t3203 = inttoptr i64 %t3202 to ptr
  %t3204 = load i64, ptr %t3203
  %t3205 = inttoptr i64 %t3204 to ptr
  %t3206 = musttail call fastcc i64 %t3205(i64 %t3201, i64 2, i64 %t3192, i64 %t3200, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3206
else1219:
  %t3207 = or i64 %t3119, 736
  %t3208 = and i64 %t3207, 7
  %t3209 = icmp eq i64 %t3208, 0
  br i1 %t3209, label %fixfast1243, label %fixslow1244
fixfast1243:
  %t3210 = icmp eq i64 %t3119, 736
  %t3211 = select i1 %t3210, i64 257, i64 1
  br label %fixmerge1245
fixslow1244:
  %t3212 = call i64 @rt_num_eq(i64 %t3119, i64 736)
  br label %fixmerge1245
fixmerge1245:
  %t3213 = phi i64 [ %t3211, %fixfast1243 ], [ %t3212, %fixslow1244 ]
  %t3214 = icmp ne i64 %t3213, 1
  br i1 %t3214, label %then1246, label %else1247
then1246:
  %t3215 = load i64, ptr @"emit.internal:rd-char"
  call void @rt_check_callable(i64 %t3215)
  %t3216 = and i64 %t3215, -8
  %t3217 = inttoptr i64 %t3216 to ptr
  %t3218 = load i64, ptr %t3217
  %t3219 = inttoptr i64 %t3218 to ptr
  %t3220 = musttail call fastcc i64 %t3219(i64 %t3215, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3220
else1247:
  %t3221 = or i64 %t3119, 320
  %t3222 = and i64 %t3221, 7
  %t3223 = icmp eq i64 %t3222, 0
  br i1 %t3223, label %fixfast1248, label %fixslow1249
fixfast1248:
  %t3224 = icmp eq i64 %t3119, 320
  %t3225 = select i1 %t3224, i64 257, i64 1
  br label %fixmerge1250
fixslow1249:
  %t3226 = call i64 @rt_num_eq(i64 %t3119, i64 320)
  br label %fixmerge1250
fixmerge1250:
  %t3227 = phi i64 [ %t3225, %fixfast1248 ], [ %t3226, %fixslow1249 ]
  %t3228 = icmp ne i64 %t3227, 1
  br i1 %t3228, label %then1251, label %else1252
then1251:
  %t3229 = or i64 %a2, 8
  %t3230 = and i64 %t3229, 7
  %t3231 = icmp eq i64 %t3230, 0
  br i1 %t3231, label %fixfast1253, label %fixslow1254
fixfast1253:
  %t3232 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3233 = extractvalue {i64, i1} %t3232, 0
  %t3234 = extractvalue {i64, i1} %t3232, 1
  br i1 %t3234, label %fixslow1254, label %fixmerge1255
fixslow1254:
  %t3235 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1255
fixmerge1255:
  %t3236 = phi i64 [ %t3233, %fixfast1253 ], [ %t3235, %fixslow1254 ]
  %t3237 = or i64 %a2, 8
  %t3238 = and i64 %t3237, 7
  %t3239 = icmp eq i64 %t3238, 0
  br i1 %t3239, label %fixfast1256, label %fixslow1257
fixfast1256:
  %t3240 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3241 = extractvalue {i64, i1} %t3240, 0
  %t3242 = extractvalue {i64, i1} %t3240, 1
  br i1 %t3242, label %fixslow1257, label %fixmerge1258
fixslow1257:
  %t3243 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1258
fixmerge1258:
  %t3244 = phi i64 [ %t3241, %fixfast1256 ], [ %t3243, %fixslow1257 ]
  %t3245 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t3245)
  %t3246 = and i64 %t3245, -8
  %t3247 = inttoptr i64 %t3246 to ptr
  %t3248 = load i64, ptr %t3247
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = call fastcc i64%t3249(i64 %t3245, i64 6, i64 %a0, i64 %a1, i64 %t3236, i64 2, i64 %a3, i64 %t3244, i64 0, i64 0, ptr null)
  %t3251 = call i64 @rt_cdr(i64 %t3250)
  %t3252 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3252)
  %t3253 = and i64 %t3252, -8
  %t3254 = inttoptr i64 %t3253 to ptr
  %t3255 = load i64, ptr %t3254
  %t3256 = inttoptr i64 %t3255 to ptr
  %t3257 = call fastcc i64%t3256(i64 %t3252, i64 1, i64 %t3251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3258 = icmp ne i64 %t3257, 1
  br i1 %t3258, label %then1259, label %else1260
then1259:
  ret i64 %t3250
else1260:
  %t3259 = call i64 @rt_car(i64 %t3250)
  %t3260 = load i64, ptr @"emit.internal:list->vector"
  call void @rt_check_callable(i64 %t3260)
  %t3261 = and i64 %t3260, -8
  %t3262 = inttoptr i64 %t3261 to ptr
  %t3263 = load i64, ptr %t3262
  %t3264 = inttoptr i64 %t3263 to ptr
  %t3265 = call fastcc i64%t3264(i64 %t3260, i64 1, i64 %t3259, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3266 = call i64 @rt_cdr(i64 %t3250)
  %t3267 = call i64 @rt_cons(i64 %t3265, i64 %t3266)
  ret i64 %t3267
else1252:
  %t3268 = or i64 %t3119, 472
  %t3269 = and i64 %t3268, 7
  %t3270 = icmp eq i64 %t3269, 0
  br i1 %t3270, label %fixfast1261, label %fixslow1262
fixfast1261:
  %t3271 = icmp eq i64 %t3119, 472
  %t3272 = select i1 %t3271, i64 257, i64 1
  br label %fixmerge1263
fixslow1262:
  %t3273 = call i64 @rt_num_eq(i64 %t3119, i64 472)
  br label %fixmerge1263
fixmerge1263:
  %t3274 = phi i64 [ %t3272, %fixfast1261 ], [ %t3273, %fixslow1262 ]
  %t3275 = icmp ne i64 %t3274, 1
  br i1 %t3275, label %then1264, label %else1265
then1264:
  %t3276 = or i64 %a2, 8
  %t3277 = and i64 %t3276, 7
  %t3278 = icmp eq i64 %t3277, 0
  br i1 %t3278, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t3279 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3280 = extractvalue {i64, i1} %t3279, 0
  %t3281 = extractvalue {i64, i1} %t3279, 1
  br i1 %t3281, label %fixslow1267, label %fixmerge1268
fixslow1267:
  %t3282 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1268
fixmerge1268:
  %t3283 = phi i64 [ %t3280, %fixfast1266 ], [ %t3282, %fixslow1267 ]
  %t3284 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3284)
  %t3285 = and i64 %t3284, -8
  %t3286 = inttoptr i64 %t3285 to ptr
  %t3287 = load i64, ptr %t3286
  %t3288 = inttoptr i64 %t3287 to ptr
  %t3289 = call fastcc i64%t3288(i64 %t3284, i64 3, i64 %a0, i64 %a1, i64 %t3283, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3290 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3290)
  %t3291 = and i64 %t3290, -8
  %t3292 = inttoptr i64 %t3291 to ptr
  %t3293 = load i64, ptr %t3292
  %t3294 = inttoptr i64 %t3293 to ptr
  %t3295 = call fastcc i64%t3294(i64 %t3290, i64 4, i64 %a0, i64 %a1, i64 %t3289, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3296 = call i64 @rt_cdr(i64 %t3295)
  %t3297 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3297)
  %t3298 = and i64 %t3297, -8
  %t3299 = inttoptr i64 %t3298 to ptr
  %t3300 = load i64, ptr %t3299
  %t3301 = inttoptr i64 %t3300 to ptr
  %t3302 = call fastcc i64%t3301(i64 %t3297, i64 1, i64 %t3296, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3303 = icmp ne i64 %t3302, 1
  br i1 %t3303, label %then1269, label %else1270
then1269:
  ret i64 %t3295
else1270:
  %t3304 = call i64 @rt_cdr(i64 %t3295)
  %t3305 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3305)
  %t3306 = and i64 %t3305, -8
  %t3307 = inttoptr i64 %t3306 to ptr
  %t3308 = load i64, ptr %t3307
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = call fastcc i64%t3309(i64 %t3305, i64 3, i64 %a0, i64 %a1, i64 %t3304, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3311 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3311)
  %t3312 = and i64 %t3311, -8
  %t3313 = inttoptr i64 %t3312 to ptr
  %t3314 = load i64, ptr %t3313
  %t3315 = inttoptr i64 %t3314 to ptr
  %t3316 = musttail call fastcc i64 %t3315(i64 %t3311, i64 4, i64 %a0, i64 %a1, i64 %t3310, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3316
else1265:
  %t3317 = or i64 %t3119, 936
  %t3318 = and i64 %t3317, 7
  %t3319 = icmp eq i64 %t3318, 0
  br i1 %t3319, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t3320 = icmp eq i64 %t3119, 936
  %t3321 = select i1 %t3320, i64 257, i64 1
  br label %fixmerge1273
fixslow1272:
  %t3322 = call i64 @rt_num_eq(i64 %t3119, i64 936)
  br label %fixmerge1273
fixmerge1273:
  %t3323 = phi i64 [ %t3321, %fixfast1271 ], [ %t3322, %fixslow1272 ]
  %t3324 = icmp ne i64 %t3323, 1
  br i1 %t3324, label %then1274, label %else1275
then1274:
  %t3325 = or i64 %a2, 16
  %t3326 = and i64 %t3325, 7
  %t3327 = icmp eq i64 %t3326, 0
  br i1 %t3327, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t3328 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t3329 = extractvalue {i64, i1} %t3328, 0
  %t3330 = extractvalue {i64, i1} %t3328, 1
  br i1 %t3330, label %fixslow1278, label %fixmerge1279
fixslow1278:
  %t3331 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1279
fixmerge1279:
  %t3332 = phi i64 [ %t3329, %fixfast1277 ], [ %t3331, %fixslow1278 ]
  %t3333 = or i64 %t3332, %a1
  %t3334 = and i64 %t3333, 7
  %t3335 = icmp eq i64 %t3334, 0
  br i1 %t3335, label %fixfast1280, label %fixslow1281
fixfast1280:
  %t3336 = icmp slt i64 %t3332, %a1
  %t3337 = select i1 %t3336, i64 257, i64 1
  br label %fixmerge1282
fixslow1281:
  %t3338 = call i64 @rt_lt(i64 %t3332, i64 %a1)
  br label %fixmerge1282
fixmerge1282:
  %t3339 = phi i64 [ %t3337, %fixfast1280 ], [ %t3338, %fixslow1281 ]
  %t3340 = icmp ne i64 %t3339, 1
  br i1 %t3340, label %then1283, label %else1284
then1283:
  %t3341 = or i64 %a2, 8
  %t3342 = and i64 %t3341, 7
  %t3343 = icmp eq i64 %t3342, 0
  br i1 %t3343, label %fixfast1286, label %fixslow1287
fixfast1286:
  %t3344 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3345 = extractvalue {i64, i1} %t3344, 0
  %t3346 = extractvalue {i64, i1} %t3344, 1
  br i1 %t3346, label %fixslow1287, label %fixmerge1288
fixslow1287:
  %t3347 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1288
fixmerge1288:
  %t3348 = phi i64 [ %t3345, %fixfast1286 ], [ %t3347, %fixslow1287 ]
  %t3349 = call i64 @rt_string_ref(i64 %a0, i64 %t3348)
  %t3350 = call i64 @rt_char_to_integer(i64 %t3349)
  %t3351 = or i64 %t3350, 448
  %t3352 = and i64 %t3351, 7
  %t3353 = icmp eq i64 %t3352, 0
  br i1 %t3353, label %fixfast1289, label %fixslow1290
fixfast1289:
  %t3354 = icmp eq i64 %t3350, 448
  %t3355 = select i1 %t3354, i64 257, i64 1
  br label %fixmerge1291
fixslow1290:
  %t3356 = call i64 @rt_num_eq(i64 %t3350, i64 448)
  br label %fixmerge1291
fixmerge1291:
  %t3357 = phi i64 [ %t3355, %fixfast1289 ], [ %t3356, %fixslow1290 ]
  %t3358 = icmp ne i64 %t3357, 1
  br i1 %t3358, label %then1292, label %else1293
then1292:
  %t3359 = or i64 %a2, 16
  %t3360 = and i64 %t3359, 7
  %t3361 = icmp eq i64 %t3360, 0
  br i1 %t3361, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t3362 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t3363 = extractvalue {i64, i1} %t3362, 0
  %t3364 = extractvalue {i64, i1} %t3362, 1
  br i1 %t3364, label %fixslow1296, label %fixmerge1297
fixslow1296:
  %t3365 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1297
fixmerge1297:
  %t3366 = phi i64 [ %t3363, %fixfast1295 ], [ %t3365, %fixslow1296 ]
  %t3367 = call i64 @rt_string_ref(i64 %a0, i64 %t3366)
  %t3368 = call i64 @rt_char_to_integer(i64 %t3367)
  %t3369 = or i64 %t3368, 320
  %t3370 = and i64 %t3369, 7
  %t3371 = icmp eq i64 %t3370, 0
  br i1 %t3371, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t3372 = icmp eq i64 %t3368, 320
  %t3373 = select i1 %t3372, i64 257, i64 1
  br label %fixmerge1300
fixslow1299:
  %t3374 = call i64 @rt_num_eq(i64 %t3368, i64 320)
  br label %fixmerge1300
fixmerge1300:
  %t3375 = phi i64 [ %t3373, %fixfast1298 ], [ %t3374, %fixslow1299 ]
  br label %merge1294
else1293:
  br label %merge1294
merge1294:
  %t3376 = phi i64 [ %t3375, %fixmerge1300 ], [ 1, %else1293 ]
  br label %merge1285
else1284:
  br label %merge1285
merge1285:
  %t3377 = phi i64 [ %t3376, %merge1294 ], [ 1, %else1284 ]
  br label %merge1276
else1275:
  br label %merge1276
merge1276:
  %t3378 = phi i64 [ %t3377, %merge1285 ], [ 1, %else1275 ]
  %t3379 = icmp ne i64 %t3378, 1
  br i1 %t3379, label %then1301, label %else1302
then1301:
  %t3380 = or i64 %a2, 24
  %t3381 = and i64 %t3380, 7
  %t3382 = icmp eq i64 %t3381, 0
  br i1 %t3382, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t3383 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t3384 = extractvalue {i64, i1} %t3383, 0
  %t3385 = extractvalue {i64, i1} %t3383, 1
  br i1 %t3385, label %fixslow1304, label %fixmerge1305
fixslow1304:
  %t3386 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1305
fixmerge1305:
  %t3387 = phi i64 [ %t3384, %fixfast1303 ], [ %t3386, %fixslow1304 ]
  %t3388 = or i64 %a2, 8
  %t3389 = and i64 %t3388, 7
  %t3390 = icmp eq i64 %t3389, 0
  br i1 %t3390, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t3391 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3392 = extractvalue {i64, i1} %t3391, 0
  %t3393 = extractvalue {i64, i1} %t3391, 1
  br i1 %t3393, label %fixslow1307, label %fixmerge1308
fixslow1307:
  %t3394 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1308
fixmerge1308:
  %t3395 = phi i64 [ %t3392, %fixfast1306 ], [ %t3394, %fixslow1307 ]
  %t3396 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t3396)
  %t3397 = and i64 %t3396, -8
  %t3398 = inttoptr i64 %t3397 to ptr
  %t3399 = load i64, ptr %t3398
  %t3400 = inttoptr i64 %t3399 to ptr
  %t3401 = call fastcc i64%t3400(i64 %t3396, i64 6, i64 %a0, i64 %a1, i64 %t3387, i64 2, i64 %a3, i64 %t3395, i64 0, i64 0, ptr null)
  %t3402 = call i64 @rt_cdr(i64 %t3401)
  %t3403 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3403)
  %t3404 = and i64 %t3403, -8
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = load i64, ptr %t3405
  %t3407 = inttoptr i64 %t3406 to ptr
  %t3408 = call fastcc i64%t3407(i64 %t3403, i64 1, i64 %t3402, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3409 = icmp ne i64 %t3408, 1
  br i1 %t3409, label %then1309, label %else1310
then1309:
  ret i64 %t3401
else1310:
  %t3410 = call i64 @rt_car(i64 %t3401)
  %t3411 = load i64, ptr @"emit.internal:list->bytevector"
  call void @rt_check_callable(i64 %t3411)
  %t3412 = and i64 %t3411, -8
  %t3413 = inttoptr i64 %t3412 to ptr
  %t3414 = load i64, ptr %t3413
  %t3415 = inttoptr i64 %t3414 to ptr
  %t3416 = call fastcc i64%t3415(i64 %t3411, i64 1, i64 %t3410, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3417 = call i64 @rt_cdr(i64 %t3401)
  %t3418 = call i64 @rt_cons(i64 %t3416, i64 %t3417)
  ret i64 %t3418
else1302:
  %t3419 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t3419)
  %t3420 = and i64 %t3419, -8
  %t3421 = inttoptr i64 %t3420 to ptr
  %t3422 = load i64, ptr %t3421
  %t3423 = inttoptr i64 %t3422 to ptr
  %t3424 = call fastcc i64%t3423(i64 %t3419, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3425 = or i64 %a2, 8
  %t3426 = and i64 %t3425, 7
  %t3427 = icmp eq i64 %t3426, 0
  br i1 %t3427, label %fixfast1311, label %fixslow1312
fixfast1311:
  %t3428 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3429 = extractvalue {i64, i1} %t3428, 0
  %t3430 = extractvalue {i64, i1} %t3428, 1
  br i1 %t3430, label %fixslow1312, label %fixmerge1313
fixslow1312:
  %t3431 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1313
fixmerge1313:
  %t3432 = phi i64 [ %t3429, %fixfast1311 ], [ %t3431, %fixslow1312 ]
  %t3433 = call i64 @rt_substring(i64 %a0, i64 %t3432, i64 %t3424)
  %t3434 = load i64, ptr @"emit.internal:rd-number"
  call void @rt_check_callable(i64 %t3434)
  %t3435 = and i64 %t3434, -8
  %t3436 = inttoptr i64 %t3435 to ptr
  %t3437 = load i64, ptr %t3436
  %t3438 = inttoptr i64 %t3437 to ptr
  %t3439 = call fastcc i64%t3438(i64 %t3434, i64 2, i64 %t3433, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3440 = load i64, ptr @"emit.internal:rd-number-reason?"
  call void @rt_check_callable(i64 %t3440)
  %t3441 = and i64 %t3440, -8
  %t3442 = inttoptr i64 %t3441 to ptr
  %t3443 = load i64, ptr %t3442
  %t3444 = inttoptr i64 %t3443 to ptr
  %t3445 = call fastcc i64%t3444(i64 %t3440, i64 1, i64 %t3439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3446 = icmp ne i64 %t3445, 1
  br i1 %t3446, label %then1314, label %else1315
then1314:
  %t3447 = or i64 %a2, 8
  %t3448 = and i64 %t3447, 7
  %t3449 = icmp eq i64 %t3448, 0
  br i1 %t3449, label %fixfast1316, label %fixslow1317
fixfast1316:
  %t3450 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3451 = extractvalue {i64, i1} %t3450, 0
  %t3452 = extractvalue {i64, i1} %t3450, 1
  br i1 %t3452, label %fixslow1317, label %fixmerge1318
fixslow1317:
  %t3453 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1318
fixmerge1318:
  %t3454 = phi i64 [ %t3451, %fixfast1316 ], [ %t3453, %fixslow1317 ]
  %t3455 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3455)
  %t3456 = and i64 %t3455, -8
  %t3457 = inttoptr i64 %t3456 to ptr
  %t3458 = load i64, ptr %t3457
  %t3459 = inttoptr i64 %t3458 to ptr
  %t3460 = musttail call fastcc i64 %t3459(i64 %t3455, i64 2, i64 %t3439, i64 %t3454, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3460
else1315:
  %t3461 = call i64 @rt_cons(i64 %t3439, i64 %t3424)
  ret i64 %t3461
}

define fastcc i64 @"emit.internal:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3466 = icmp eq i64 %argc, 1
  br i1 %t3466, label %argok1320, label %arityerr1319
arityerr1319:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1320:
  %t3467 = call i64 @rt_make_string(ptr @.str.lit.18, i64 5)
  %t3468 = call i64 @rt_string_eq(i64 %a0, i64 %t3467)
  %t3469 = icmp ne i64 %t3468, 1
  br i1 %t3469, label %then1321, label %else1322
then1321:
  %t3470 = call i64 @rt_integer_to_char(i64 56)
  ret i64 %t3470
else1322:
  %t3471 = call i64 @rt_make_string(ptr @.str.lit.19, i64 9)
  %t3472 = call i64 @rt_string_eq(i64 %a0, i64 %t3471)
  %t3473 = icmp ne i64 %t3472, 1
  br i1 %t3473, label %then1323, label %else1324
then1323:
  %t3474 = call i64 @rt_integer_to_char(i64 64)
  ret i64 %t3474
else1324:
  %t3475 = call i64 @rt_make_string(ptr @.str.lit.20, i64 6)
  %t3476 = call i64 @rt_string_eq(i64 %a0, i64 %t3475)
  %t3477 = icmp ne i64 %t3476, 1
  br i1 %t3477, label %then1325, label %else1326
then1325:
  %t3478 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3478
else1326:
  %t3479 = call i64 @rt_make_string(ptr @.str.lit.21, i64 6)
  %t3480 = call i64 @rt_string_eq(i64 %a0, i64 %t3479)
  %t3481 = icmp ne i64 %t3480, 1
  br i1 %t3481, label %then1327, label %else1328
then1327:
  %t3482 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3482
else1328:
  %t3483 = call i64 @rt_make_string(ptr @.str.lit.22, i64 7)
  %t3484 = call i64 @rt_string_eq(i64 %a0, i64 %t3483)
  %t3485 = icmp ne i64 %t3484, 1
  br i1 %t3485, label %then1329, label %else1330
then1329:
  %t3486 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3486
else1330:
  %t3487 = call i64 @rt_make_string(ptr @.str.lit.23, i64 4)
  %t3488 = call i64 @rt_string_eq(i64 %a0, i64 %t3487)
  %t3489 = icmp ne i64 %t3488, 1
  br i1 %t3489, label %then1331, label %else1332
then1331:
  %t3490 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3490
else1332:
  %t3491 = call i64 @rt_make_string(ptr @.str.lit.24, i64 6)
  %t3492 = call i64 @rt_string_eq(i64 %a0, i64 %t3491)
  %t3493 = icmp ne i64 %t3492, 1
  br i1 %t3493, label %then1333, label %else1334
then1333:
  %t3494 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3494
else1334:
  %t3495 = call i64 @rt_make_string(ptr @.str.lit.25, i64 5)
  %t3496 = call i64 @rt_string_eq(i64 %a0, i64 %t3495)
  %t3497 = icmp ne i64 %t3496, 1
  br i1 %t3497, label %then1335, label %else1336
then1335:
  %t3498 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3498
else1336:
  %t3499 = call i64 @rt_make_string(ptr @.str.lit.26, i64 3)
  %t3500 = call i64 @rt_string_eq(i64 %a0, i64 %t3499)
  %t3501 = icmp ne i64 %t3500, 1
  br i1 %t3501, label %then1337, label %else1338
then1337:
  %t3502 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3502
else1338:
  %t3503 = call i64 @rt_make_string(ptr @.str.lit.27, i64 3)
  %t3504 = call i64 @rt_string_eq(i64 %a0, i64 %t3503)
  %t3505 = icmp ne i64 %t3504, 1
  br i1 %t3505, label %then1339, label %else1340
then1339:
  %t3506 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3506
else1340:
  %t3507 = call i64 @rt_make_string(ptr @.str.lit.28, i64 7)
  %t3508 = call i64 @rt_string_eq(i64 %a0, i64 %t3507)
  %t3509 = icmp ne i64 %t3508, 1
  br i1 %t3509, label %then1341, label %else1342
then1341:
  %t3510 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3510
else1342:
  %t3511 = call i64 @rt_make_string(ptr @.str.lit.29, i64 3)
  %t3512 = call i64 @rt_string_eq(i64 %a0, i64 %t3511)
  %t3513 = icmp ne i64 %t3512, 1
  br i1 %t3513, label %then1343, label %else1344
then1343:
  %t3514 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3514
else1344:
  %t3515 = call i64 @rt_make_string(ptr @.str.lit.30, i64 4)
  %t3516 = call i64 @rt_string_eq(i64 %a0, i64 %t3515)
  %t3517 = icmp ne i64 %t3516, 1
  br i1 %t3517, label %then1345, label %else1346
then1345:
  %t3518 = call i64 @rt_integer_to_char(i64 96)
  ret i64 %t3518
else1346:
  ret i64 1
}

define fastcc i64 @"emit.internal:code_1030"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3523 = icmp eq i64 %argc, 2
  br i1 %t3523, label %argok1348, label %arityerr1347
arityerr1347:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1348:
  %t3524 = and i64 %self, -8
  %t3525 = inttoptr i64 %t3524 to ptr
  %t3526 = getelementptr i64, ptr %t3525, i64 1
  %t3527 = load i64, ptr %t3526
  %t3528 = or i64 %a0, %t3527
  %t3529 = and i64 %t3528, 7
  %t3530 = icmp eq i64 %t3529, 0
  br i1 %t3530, label %fixfast1349, label %fixslow1350
fixfast1349:
  %t3531 = icmp slt i64 %a0, %t3527
  %t3532 = select i1 %t3531, i64 257, i64 1
  br label %fixmerge1351
fixslow1350:
  %t3533 = call i64 @rt_lt(i64 %a0, i64 %t3527)
  br label %fixmerge1351
fixmerge1351:
  %t3534 = phi i64 [ %t3532, %fixfast1349 ], [ %t3533, %fixslow1350 ]
  %t3535 = icmp ne i64 %t3534, 1
  br i1 %t3535, label %then1352, label %else1353
then1352:
  %t3536 = and i64 %self, -8
  %t3537 = inttoptr i64 %t3536 to ptr
  %t3538 = getelementptr i64, ptr %t3537, i64 2
  %t3539 = load i64, ptr %t3538
  %t3540 = call i64 @rt_string_ref(i64 %t3539, i64 %a0)
  %t3541 = load i64, ptr @"emit.internal:rd-hex-digit?"
  call void @rt_check_callable(i64 %t3541)
  %t3542 = and i64 %t3541, -8
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = load i64, ptr %t3543
  %t3545 = inttoptr i64 %t3544 to ptr
  %t3546 = call fastcc i64%t3545(i64 %t3541, i64 1, i64 %t3540, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3547 = icmp ne i64 %t3546, 1
  br i1 %t3547, label %then1354, label %else1355
then1354:
  %t3548 = or i64 %a0, 8
  %t3549 = and i64 %t3548, 7
  %t3550 = icmp eq i64 %t3549, 0
  br i1 %t3550, label %fixfast1356, label %fixslow1357
fixfast1356:
  %t3551 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3552 = extractvalue {i64, i1} %t3551, 0
  %t3553 = extractvalue {i64, i1} %t3551, 1
  br i1 %t3553, label %fixslow1357, label %fixmerge1358
fixslow1357:
  %t3554 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1358
fixmerge1358:
  %t3555 = phi i64 [ %t3552, %fixfast1356 ], [ %t3554, %fixslow1357 ]
  %t3556 = or i64 %a1, 128
  %t3557 = and i64 %t3556, 7
  %t3558 = icmp eq i64 %t3557, 0
  br i1 %t3558, label %fixfast1359, label %fixslow1360
fixfast1359:
  %t3559 = ashr i64 %a1, 3
  %t3560 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3559, i64 128)
  %t3561 = extractvalue {i64, i1} %t3560, 0
  %t3562 = extractvalue {i64, i1} %t3560, 1
  br i1 %t3562, label %fixslow1360, label %fixmerge1361
fixslow1360:
  %t3563 = call i64 @rt_mul(i64 %a1, i64 128)
  br label %fixmerge1361
fixmerge1361:
  %t3564 = phi i64 [ %t3561, %fixfast1359 ], [ %t3563, %fixslow1360 ]
  %t3565 = load i64, ptr @"emit.internal:rd-hex-digit"
  call void @rt_check_callable(i64 %t3565)
  %t3566 = and i64 %t3565, -8
  %t3567 = inttoptr i64 %t3566 to ptr
  %t3568 = load i64, ptr %t3567
  %t3569 = inttoptr i64 %t3568 to ptr
  %t3570 = call fastcc i64%t3569(i64 %t3565, i64 1, i64 %t3540, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3571 = or i64 %t3564, %t3570
  %t3572 = and i64 %t3571, 7
  %t3573 = icmp eq i64 %t3572, 0
  br i1 %t3573, label %fixfast1362, label %fixslow1363
fixfast1362:
  %t3574 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3564, i64 %t3570)
  %t3575 = extractvalue {i64, i1} %t3574, 0
  %t3576 = extractvalue {i64, i1} %t3574, 1
  br i1 %t3576, label %fixslow1363, label %fixmerge1364
fixslow1363:
  %t3577 = call i64 @rt_add(i64 %t3564, i64 %t3570)
  br label %fixmerge1364
fixmerge1364:
  %t3578 = phi i64 [ %t3575, %fixfast1362 ], [ %t3577, %fixslow1363 ]
  %t3579 = musttail call fastcc i64 @"emit.internal:code_1030"(i64 %self, i64 2, i64 %t3555, i64 %t3578, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3579
else1355:
  ret i64 1
else1353:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-char-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3580 = icmp eq i64 %argc, 1
  br i1 %t3580, label %argok1366, label %arityerr1365
arityerr1365:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1366:
  %t3581 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3582 = call i64 @rt_char_to_integer(i64 %t3581)
  %t3583 = or i64 %t3582, 960
  %t3584 = and i64 %t3583, 7
  %t3585 = icmp eq i64 %t3584, 0
  br i1 %t3585, label %fixfast1367, label %fixslow1368
fixfast1367:
  %t3586 = icmp eq i64 %t3582, 960
  %t3587 = select i1 %t3586, i64 257, i64 1
  br label %fixmerge1369
fixslow1368:
  %t3588 = call i64 @rt_num_eq(i64 %t3582, i64 960)
  br label %fixmerge1369
fixmerge1369:
  %t3589 = phi i64 [ %t3587, %fixfast1367 ], [ %t3588, %fixslow1368 ]
  %t3590 = icmp ne i64 %t3589, 1
  br i1 %t3590, label %then1370, label %else1371
then1370:
  %t3591 = call i64 @rt_string_length(i64 %a0)
  %t3592 = call ptr @rt_alloc_words(i64 4)
  %t3593 = ptrtoint ptr %t3592 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1030" to i64), ptr %t3592
  %t3594 = or i64 %t3593, 4
  %t3595 = getelementptr i64, ptr %t3592, i64 1
  store i64 %t3591, ptr %t3595
  %t3596 = getelementptr i64, ptr %t3592, i64 2
  store i64 %a0, ptr %t3596
  %t3597 = getelementptr i64, ptr %t3592, i64 3
  store i64 %t3594, ptr %t3597
  %t3598 = musttail call fastcc i64 @"emit.internal:code_1030"(i64 %t3594, i64 2, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3598
else1371:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3603 = icmp eq i64 %argc, 3
  br i1 %t3603, label %argok1373, label %arityerr1372
arityerr1372:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1373:
  %t3604 = or i64 %a2, 8
  %t3605 = and i64 %t3604, 7
  %t3606 = icmp eq i64 %t3605, 0
  br i1 %t3606, label %fixfast1374, label %fixslow1375
fixfast1374:
  %t3607 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3608 = extractvalue {i64, i1} %t3607, 0
  %t3609 = extractvalue {i64, i1} %t3607, 1
  br i1 %t3609, label %fixslow1375, label %fixmerge1376
fixslow1375:
  %t3610 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1376
fixmerge1376:
  %t3611 = phi i64 [ %t3608, %fixfast1374 ], [ %t3610, %fixslow1375 ]
  %t3612 = or i64 %t3611, 8
  %t3613 = and i64 %t3612, 7
  %t3614 = icmp eq i64 %t3613, 0
  br i1 %t3614, label %fixfast1377, label %fixslow1378
fixfast1377:
  %t3615 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3611, i64 8)
  %t3616 = extractvalue {i64, i1} %t3615, 0
  %t3617 = extractvalue {i64, i1} %t3615, 1
  br i1 %t3617, label %fixslow1378, label %fixmerge1379
fixslow1378:
  %t3618 = call i64 @rt_add(i64 %t3611, i64 8)
  br label %fixmerge1379
fixmerge1379:
  %t3619 = phi i64 [ %t3616, %fixfast1377 ], [ %t3618, %fixslow1378 ]
  %t3620 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t3620)
  %t3621 = and i64 %t3620, -8
  %t3622 = inttoptr i64 %t3621 to ptr
  %t3623 = load i64, ptr %t3622
  %t3624 = inttoptr i64 %t3623 to ptr
  %t3625 = call fastcc i64%t3624(i64 %t3620, i64 3, i64 %a0, i64 %a1, i64 %t3619, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3626 = call i64 @rt_substring(i64 %a0, i64 %t3611, i64 %t3625)
  %t3627 = call i64 @rt_string_length(i64 %t3626)
  %t3628 = or i64 %t3627, 8
  %t3629 = and i64 %t3628, 7
  %t3630 = icmp eq i64 %t3629, 0
  br i1 %t3630, label %fixfast1380, label %fixslow1381
fixfast1380:
  %t3631 = icmp eq i64 %t3627, 8
  %t3632 = select i1 %t3631, i64 257, i64 1
  br label %fixmerge1382
fixslow1381:
  %t3633 = call i64 @rt_num_eq(i64 %t3627, i64 8)
  br label %fixmerge1382
fixmerge1382:
  %t3634 = phi i64 [ %t3632, %fixfast1380 ], [ %t3633, %fixslow1381 ]
  %t3635 = icmp ne i64 %t3634, 1
  br i1 %t3635, label %then1383, label %else1384
then1383:
  %t3636 = call i64 @rt_string_ref(i64 %a0, i64 %t3611)
  %t3637 = call i64 @rt_cons(i64 %t3636, i64 %t3625)
  ret i64 %t3637
else1384:
  %t3638 = load i64, ptr @"emit.internal:rd-char-hex"
  call void @rt_check_callable(i64 %t3638)
  %t3639 = and i64 %t3638, -8
  %t3640 = inttoptr i64 %t3639 to ptr
  %t3641 = load i64, ptr %t3640
  %t3642 = inttoptr i64 %t3641 to ptr
  %t3643 = call fastcc i64%t3642(i64 %t3638, i64 1, i64 %t3626, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3644 = icmp ne i64 %t3643, 1
  br i1 %t3644, label %then1385, label %else1386
then1385:
  %t3645 = call i64 @rt_integer_to_char(i64 %t3643)
  %t3646 = call i64 @rt_cons(i64 %t3645, i64 %t3625)
  ret i64 %t3646
else1386:
  %t3647 = load i64, ptr @"emit.internal:rd-char-name"
  call void @rt_check_callable(i64 %t3647)
  %t3648 = and i64 %t3647, -8
  %t3649 = inttoptr i64 %t3648 to ptr
  %t3650 = load i64, ptr %t3649
  %t3651 = inttoptr i64 %t3650 to ptr
  %t3652 = call fastcc i64%t3651(i64 %t3647, i64 1, i64 %t3626, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3653 = icmp ne i64 %t3652, 1
  br i1 %t3653, label %then1387, label %else1388
then1387:
  %t3654 = call i64 @rt_cons(i64 %t3652, i64 %t3625)
  ret i64 %t3654
else1388:
  %t3655 = call i64 @rt_intern(ptr @.str.sym.31)
  %t3656 = or i64 %a2, 8
  %t3657 = and i64 %t3656, 7
  %t3658 = icmp eq i64 %t3657, 0
  br i1 %t3658, label %fixfast1389, label %fixslow1390
fixfast1389:
  %t3659 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t3660 = extractvalue {i64, i1} %t3659, 0
  %t3661 = extractvalue {i64, i1} %t3659, 1
  br i1 %t3661, label %fixslow1390, label %fixmerge1391
fixslow1390:
  %t3662 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1391
fixmerge1391:
  %t3663 = phi i64 [ %t3660, %fixfast1389 ], [ %t3662, %fixslow1390 ]
  %t3664 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3664)
  %t3665 = and i64 %t3664, -8
  %t3666 = inttoptr i64 %t3665 to ptr
  %t3667 = load i64, ptr %t3666
  %t3668 = inttoptr i64 %t3667 to ptr
  %t3669 = musttail call fastcc i64 %t3668(i64 %t3664, i64 2, i64 %t3655, i64 %t3663, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3669
}

define fastcc i64 @"emit.internal:code_1077"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3674 = icmp eq i64 %argc, 2
  br i1 %t3674, label %argok1393, label %arityerr1392
arityerr1392:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1393:
  %t3675 = and i64 %self, -8
  %t3676 = inttoptr i64 %t3675 to ptr
  %t3677 = getelementptr i64, ptr %t3676, i64 1
  %t3678 = load i64, ptr %t3677
  %t3679 = or i64 %a0, %t3678
  %t3680 = and i64 %t3679, 7
  %t3681 = icmp eq i64 %t3680, 0
  br i1 %t3681, label %fixfast1394, label %fixslow1395
fixfast1394:
  %t3682 = icmp slt i64 %a0, %t3678
  %t3683 = select i1 %t3682, i64 257, i64 1
  br label %fixmerge1396
fixslow1395:
  %t3684 = call i64 @rt_lt(i64 %a0, i64 %t3678)
  br label %fixmerge1396
fixmerge1396:
  %t3685 = phi i64 [ %t3683, %fixfast1394 ], [ %t3684, %fixslow1395 ]
  %t3686 = icmp ne i64 %t3685, 1
  br i1 %t3686, label %then1397, label %else1398
then1397:
  %t3687 = and i64 %self, -8
  %t3688 = inttoptr i64 %t3687 to ptr
  %t3689 = getelementptr i64, ptr %t3688, i64 2
  %t3690 = load i64, ptr %t3689
  %t3691 = call i64 @rt_string_ref(i64 %t3690, i64 %a0)
  %t3692 = call i64 @rt_char_to_integer(i64 %t3691)
  %t3693 = or i64 %t3692, 992
  %t3694 = and i64 %t3693, 7
  %t3695 = icmp eq i64 %t3694, 0
  br i1 %t3695, label %fixfast1399, label %fixslow1400
fixfast1399:
  %t3696 = icmp eq i64 %t3692, 992
  %t3697 = select i1 %t3696, i64 257, i64 1
  br label %fixmerge1401
fixslow1400:
  %t3698 = call i64 @rt_num_eq(i64 %t3692, i64 992)
  br label %fixmerge1401
fixmerge1401:
  %t3699 = phi i64 [ %t3697, %fixfast1399 ], [ %t3698, %fixslow1400 ]
  %t3700 = icmp ne i64 %t3699, 1
  br i1 %t3700, label %then1402, label %else1403
then1402:
  %t3701 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t3701)
  %t3702 = and i64 %t3701, -8
  %t3703 = inttoptr i64 %t3702 to ptr
  %t3704 = load i64, ptr %t3703
  %t3705 = inttoptr i64 %t3704 to ptr
  %t3706 = call fastcc i64%t3705(i64 %t3701, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3707 = call i64 @rt_list_to_string(i64 %t3706)
  %t3708 = call i64 @rt_string_to_symbol(i64 %t3707)
  %t3709 = or i64 %a0, 8
  %t3710 = and i64 %t3709, 7
  %t3711 = icmp eq i64 %t3710, 0
  br i1 %t3711, label %fixfast1404, label %fixslow1405
fixfast1404:
  %t3712 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3713 = extractvalue {i64, i1} %t3712, 0
  %t3714 = extractvalue {i64, i1} %t3712, 1
  br i1 %t3714, label %fixslow1405, label %fixmerge1406
fixslow1405:
  %t3715 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1406
fixmerge1406:
  %t3716 = phi i64 [ %t3713, %fixfast1404 ], [ %t3715, %fixslow1405 ]
  %t3717 = call i64 @rt_cons(i64 %t3708, i64 %t3716)
  ret i64 %t3717
else1403:
  %t3718 = or i64 %t3692, 736
  %t3719 = and i64 %t3718, 7
  %t3720 = icmp eq i64 %t3719, 0
  br i1 %t3720, label %fixfast1407, label %fixslow1408
fixfast1407:
  %t3721 = icmp eq i64 %t3692, 736
  %t3722 = select i1 %t3721, i64 257, i64 1
  br label %fixmerge1409
fixslow1408:
  %t3723 = call i64 @rt_num_eq(i64 %t3692, i64 736)
  br label %fixmerge1409
fixmerge1409:
  %t3724 = phi i64 [ %t3722, %fixfast1407 ], [ %t3723, %fixslow1408 ]
  %t3725 = icmp ne i64 %t3724, 1
  br i1 %t3725, label %then1410, label %else1411
then1410:
  %t3726 = or i64 %a0, 8
  %t3727 = and i64 %t3726, 7
  %t3728 = icmp eq i64 %t3727, 0
  br i1 %t3728, label %fixfast1413, label %fixslow1414
fixfast1413:
  %t3729 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3730 = extractvalue {i64, i1} %t3729, 0
  %t3731 = extractvalue {i64, i1} %t3729, 1
  br i1 %t3731, label %fixslow1414, label %fixmerge1415
fixslow1414:
  %t3732 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1415
fixmerge1415:
  %t3733 = phi i64 [ %t3730, %fixfast1413 ], [ %t3732, %fixslow1414 ]
  %t3734 = and i64 %self, -8
  %t3735 = inttoptr i64 %t3734 to ptr
  %t3736 = getelementptr i64, ptr %t3735, i64 1
  %t3737 = load i64, ptr %t3736
  %t3738 = or i64 %t3733, %t3737
  %t3739 = and i64 %t3738, 7
  %t3740 = icmp eq i64 %t3739, 0
  br i1 %t3740, label %fixfast1416, label %fixslow1417
fixfast1416:
  %t3741 = icmp slt i64 %t3733, %t3737
  %t3742 = select i1 %t3741, i64 257, i64 1
  br label %fixmerge1418
fixslow1417:
  %t3743 = call i64 @rt_lt(i64 %t3733, i64 %t3737)
  br label %fixmerge1418
fixmerge1418:
  %t3744 = phi i64 [ %t3742, %fixfast1416 ], [ %t3743, %fixslow1417 ]
  br label %merge1412
else1411:
  br label %merge1412
merge1412:
  %t3745 = phi i64 [ %t3744, %fixmerge1418 ], [ 1, %else1411 ]
  %t3746 = icmp ne i64 %t3745, 1
  br i1 %t3746, label %then1419, label %else1420
then1419:
  %t3747 = and i64 %self, -8
  %t3748 = inttoptr i64 %t3747 to ptr
  %t3749 = getelementptr i64, ptr %t3748, i64 2
  %t3750 = load i64, ptr %t3749
  %t3751 = or i64 %a0, 8
  %t3752 = and i64 %t3751, 7
  %t3753 = icmp eq i64 %t3752, 0
  br i1 %t3753, label %fixfast1421, label %fixslow1422
fixfast1421:
  %t3754 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3755 = extractvalue {i64, i1} %t3754, 0
  %t3756 = extractvalue {i64, i1} %t3754, 1
  br i1 %t3756, label %fixslow1422, label %fixmerge1423
fixslow1422:
  %t3757 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1423
fixmerge1423:
  %t3758 = phi i64 [ %t3755, %fixfast1421 ], [ %t3757, %fixslow1422 ]
  %t3759 = call i64 @rt_string_ref(i64 %t3750, i64 %t3758)
  %t3760 = call i64 @rt_char_to_integer(i64 %t3759)
  %t3761 = or i64 %t3760, 960
  %t3762 = and i64 %t3761, 7
  %t3763 = icmp eq i64 %t3762, 0
  br i1 %t3763, label %fixfast1424, label %fixslow1425
fixfast1424:
  %t3764 = icmp eq i64 %t3760, 960
  %t3765 = select i1 %t3764, i64 257, i64 1
  br label %fixmerge1426
fixslow1425:
  %t3766 = call i64 @rt_num_eq(i64 %t3760, i64 960)
  br label %fixmerge1426
fixmerge1426:
  %t3767 = phi i64 [ %t3765, %fixfast1424 ], [ %t3766, %fixslow1425 ]
  %t3768 = icmp ne i64 %t3767, 1
  br i1 %t3768, label %then1427, label %else1428
then1427:
  %t3769 = and i64 %self, -8
  %t3770 = inttoptr i64 %t3769 to ptr
  %t3771 = getelementptr i64, ptr %t3770, i64 2
  %t3772 = load i64, ptr %t3771
  %t3773 = and i64 %self, -8
  %t3774 = inttoptr i64 %t3773 to ptr
  %t3775 = getelementptr i64, ptr %t3774, i64 1
  %t3776 = load i64, ptr %t3775
  %t3777 = or i64 %a0, 16
  %t3778 = and i64 %t3777, 7
  %t3779 = icmp eq i64 %t3778, 0
  br i1 %t3779, label %fixfast1429, label %fixslow1430
fixfast1429:
  %t3780 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3781 = extractvalue {i64, i1} %t3780, 0
  %t3782 = extractvalue {i64, i1} %t3780, 1
  br i1 %t3782, label %fixslow1430, label %fixmerge1431
fixslow1430:
  %t3783 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1431
fixmerge1431:
  %t3784 = phi i64 [ %t3781, %fixfast1429 ], [ %t3783, %fixslow1430 ]
  %t3785 = load i64, ptr @"emit.internal:rd-hex"
  call void @rt_check_callable(i64 %t3785)
  %t3786 = and i64 %t3785, -8
  %t3787 = inttoptr i64 %t3786 to ptr
  %t3788 = load i64, ptr %t3787
  %t3789 = inttoptr i64 %t3788 to ptr
  %t3790 = call fastcc i64%t3789(i64 %t3785, i64 4, i64 %t3772, i64 %t3776, i64 %t3784, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3791 = call i64 @rt_cdr(i64 %t3790)
  %t3792 = call i64 @rt_car(i64 %t3790)
  %t3793 = call i64 @rt_integer_to_char(i64 %t3792)
  %t3794 = call i64 @rt_cons(i64 %t3793, i64 %a1)
  %t3795 = musttail call fastcc i64 @"emit.internal:code_1077"(i64 %self, i64 2, i64 %t3791, i64 %t3794, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3795
else1428:
  %t3796 = or i64 %a0, 16
  %t3797 = and i64 %t3796, 7
  %t3798 = icmp eq i64 %t3797, 0
  br i1 %t3798, label %fixfast1432, label %fixslow1433
fixfast1432:
  %t3799 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3800 = extractvalue {i64, i1} %t3799, 0
  %t3801 = extractvalue {i64, i1} %t3799, 1
  br i1 %t3801, label %fixslow1433, label %fixmerge1434
fixslow1433:
  %t3802 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1434
fixmerge1434:
  %t3803 = phi i64 [ %t3800, %fixfast1432 ], [ %t3802, %fixslow1433 ]
  %t3804 = load i64, ptr @"emit.internal:rd-str-esc"
  call void @rt_check_callable(i64 %t3804)
  %t3805 = and i64 %t3804, -8
  %t3806 = inttoptr i64 %t3805 to ptr
  %t3807 = load i64, ptr %t3806
  %t3808 = inttoptr i64 %t3807 to ptr
  %t3809 = call fastcc i64%t3808(i64 %t3804, i64 1, i64 %t3759, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3810 = call i64 @rt_cons(i64 %t3809, i64 %a1)
  %t3811 = musttail call fastcc i64 @"emit.internal:code_1077"(i64 %self, i64 2, i64 %t3803, i64 %t3810, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3811
else1420:
  %t3812 = or i64 %a0, 8
  %t3813 = and i64 %t3812, 7
  %t3814 = icmp eq i64 %t3813, 0
  br i1 %t3814, label %fixfast1435, label %fixslow1436
fixfast1435:
  %t3815 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3816 = extractvalue {i64, i1} %t3815, 0
  %t3817 = extractvalue {i64, i1} %t3815, 1
  br i1 %t3817, label %fixslow1436, label %fixmerge1437
fixslow1436:
  %t3818 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1437
fixmerge1437:
  %t3819 = phi i64 [ %t3816, %fixfast1435 ], [ %t3818, %fixslow1436 ]
  %t3820 = call i64 @rt_cons(i64 %t3691, i64 %a1)
  %t3821 = musttail call fastcc i64 @"emit.internal:code_1077"(i64 %self, i64 2, i64 %t3819, i64 %t3820, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3821
else1398:
  %t3822 = call i64 @rt_intern(ptr @.str.sym.32)
  %t3823 = and i64 %self, -8
  %t3824 = inttoptr i64 %t3823 to ptr
  %t3825 = getelementptr i64, ptr %t3824, i64 4
  %t3826 = load i64, ptr %t3825
  %t3827 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t3827)
  %t3828 = and i64 %t3827, -8
  %t3829 = inttoptr i64 %t3828 to ptr
  %t3830 = load i64, ptr %t3829
  %t3831 = inttoptr i64 %t3830 to ptr
  %t3832 = musttail call fastcc i64 %t3831(i64 %t3827, i64 2, i64 %t3822, i64 %t3826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3832
}

define fastcc i64 @"emit.internal:code:rd-bar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3833 = icmp eq i64 %argc, 4
  br i1 %t3833, label %argok1439, label %arityerr1438
arityerr1438:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1439:
  %t3834 = call ptr @rt_alloc_words(i64 5)
  %t3835 = ptrtoint ptr %t3834 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_1077" to i64), ptr %t3834
  %t3836 = or i64 %t3835, 4
  %t3837 = getelementptr i64, ptr %t3834, i64 1
  store i64 %a1, ptr %t3837
  %t3838 = getelementptr i64, ptr %t3834, i64 2
  store i64 %a0, ptr %t3838
  %t3839 = getelementptr i64, ptr %t3834, i64 3
  store i64 %t3836, ptr %t3839
  %t3840 = getelementptr i64, ptr %t3834, i64 4
  store i64 %a3, ptr %t3840
  %t3841 = musttail call fastcc i64 @"emit.internal:code_1077"(i64 %t3836, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3841
}

define fastcc i64 @"emit.internal:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3846 = icmp eq i64 %argc, 4
  br i1 %t3846, label %argok1441, label %arityerr1440
arityerr1440:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1441:
  %t3847 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3847)
  %t3848 = and i64 %t3847, -8
  %t3849 = inttoptr i64 %t3848 to ptr
  %t3850 = load i64, ptr %t3849
  %t3851 = inttoptr i64 %t3850 to ptr
  %t3852 = call fastcc i64%t3851(i64 %t3847, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3853 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3853)
  %t3854 = and i64 %t3853, -8
  %t3855 = inttoptr i64 %t3854 to ptr
  %t3856 = load i64, ptr %t3855
  %t3857 = inttoptr i64 %t3856 to ptr
  %t3858 = call fastcc i64%t3857(i64 %t3853, i64 4, i64 %a0, i64 %a1, i64 %t3852, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3859 = call i64 @rt_cdr(i64 %t3858)
  %t3860 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3860)
  %t3861 = and i64 %t3860, -8
  %t3862 = inttoptr i64 %t3861 to ptr
  %t3863 = load i64, ptr %t3862
  %t3864 = inttoptr i64 %t3863 to ptr
  %t3865 = call fastcc i64%t3864(i64 %t3860, i64 1, i64 %t3859, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3866 = icmp ne i64 %t3865, 1
  br i1 %t3866, label %then1442, label %else1443
then1442:
  ret i64 %t3858
else1443:
  %t3867 = call i64 @rt_intern(ptr @.str.sym.33)
  %t3868 = call i64 @rt_car(i64 %t3858)
  %t3869 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3869)
  %t3870 = and i64 %t3869, -8
  %t3871 = inttoptr i64 %t3870 to ptr
  %t3872 = load i64, ptr %t3871
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = call fastcc i64%t3873(i64 %t3869, i64 2, i64 %t3867, i64 %t3868, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3875 = call i64 @rt_cdr(i64 %t3858)
  %t3876 = call i64 @rt_cons(i64 %t3874, i64 %t3875)
  ret i64 %t3876
}

define fastcc i64 @"emit.internal:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3881 = icmp eq i64 %argc, 4
  br i1 %t3881, label %argok1445, label %arityerr1444
arityerr1444:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1445:
  %t3882 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3882)
  %t3883 = and i64 %t3882, -8
  %t3884 = inttoptr i64 %t3883 to ptr
  %t3885 = load i64, ptr %t3884
  %t3886 = inttoptr i64 %t3885 to ptr
  %t3887 = call fastcc i64%t3886(i64 %t3882, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3888 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3888)
  %t3889 = and i64 %t3888, -8
  %t3890 = inttoptr i64 %t3889 to ptr
  %t3891 = load i64, ptr %t3890
  %t3892 = inttoptr i64 %t3891 to ptr
  %t3893 = call fastcc i64%t3892(i64 %t3888, i64 4, i64 %a0, i64 %a1, i64 %t3887, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3894 = call i64 @rt_cdr(i64 %t3893)
  %t3895 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3895)
  %t3896 = and i64 %t3895, -8
  %t3897 = inttoptr i64 %t3896 to ptr
  %t3898 = load i64, ptr %t3897
  %t3899 = inttoptr i64 %t3898 to ptr
  %t3900 = call fastcc i64%t3899(i64 %t3895, i64 1, i64 %t3894, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3901 = icmp ne i64 %t3900, 1
  br i1 %t3901, label %then1446, label %else1447
then1446:
  ret i64 %t3893
else1447:
  %t3902 = call i64 @rt_intern(ptr @.str.sym.34)
  %t3903 = call i64 @rt_car(i64 %t3893)
  %t3904 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3904)
  %t3905 = and i64 %t3904, -8
  %t3906 = inttoptr i64 %t3905 to ptr
  %t3907 = load i64, ptr %t3906
  %t3908 = inttoptr i64 %t3907 to ptr
  %t3909 = call fastcc i64%t3908(i64 %t3904, i64 2, i64 %t3902, i64 %t3903, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3910 = call i64 @rt_cdr(i64 %t3893)
  %t3911 = call i64 @rt_cons(i64 %t3909, i64 %t3910)
  ret i64 %t3911
}

define fastcc i64 @"emit.internal:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3916 = icmp eq i64 %argc, 4
  br i1 %t3916, label %argok1449, label %arityerr1448
arityerr1448:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1449:
  %t3917 = or i64 %a2, %a1
  %t3918 = and i64 %t3917, 7
  %t3919 = icmp eq i64 %t3918, 0
  br i1 %t3919, label %fixfast1450, label %fixslow1451
fixfast1450:
  %t3920 = icmp slt i64 %a2, %a1
  %t3921 = select i1 %t3920, i64 257, i64 1
  br label %fixmerge1452
fixslow1451:
  %t3922 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1452
fixmerge1452:
  %t3923 = phi i64 [ %t3921, %fixfast1450 ], [ %t3922, %fixslow1451 ]
  %t3924 = icmp ne i64 %t3923, 1
  br i1 %t3924, label %then1453, label %else1454
then1453:
  %t3925 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3926 = call i64 @rt_char_to_integer(i64 %t3925)
  %t3927 = or i64 %t3926, 512
  %t3928 = and i64 %t3927, 7
  %t3929 = icmp eq i64 %t3928, 0
  br i1 %t3929, label %fixfast1456, label %fixslow1457
fixfast1456:
  %t3930 = icmp eq i64 %t3926, 512
  %t3931 = select i1 %t3930, i64 257, i64 1
  br label %fixmerge1458
fixslow1457:
  %t3932 = call i64 @rt_num_eq(i64 %t3926, i64 512)
  br label %fixmerge1458
fixmerge1458:
  %t3933 = phi i64 [ %t3931, %fixfast1456 ], [ %t3932, %fixslow1457 ]
  br label %merge1455
else1454:
  br label %merge1455
merge1455:
  %t3934 = phi i64 [ %t3933, %fixmerge1458 ], [ 1, %else1454 ]
  %t3935 = icmp ne i64 %t3934, 1
  br i1 %t3935, label %then1459, label %else1460
then1459:
  %t3936 = or i64 %a2, 8
  %t3937 = and i64 %t3936, 7
  %t3938 = icmp eq i64 %t3937, 0
  br i1 %t3938, label %fixfast1461, label %fixslow1462
fixfast1461:
  %t3939 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3940 = extractvalue {i64, i1} %t3939, 0
  %t3941 = extractvalue {i64, i1} %t3939, 1
  br i1 %t3941, label %fixslow1462, label %fixmerge1463
fixslow1462:
  %t3942 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1463
fixmerge1463:
  %t3943 = phi i64 [ %t3940, %fixfast1461 ], [ %t3942, %fixslow1462 ]
  %t3944 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3944)
  %t3945 = and i64 %t3944, -8
  %t3946 = inttoptr i64 %t3945 to ptr
  %t3947 = load i64, ptr %t3946
  %t3948 = inttoptr i64 %t3947 to ptr
  %t3949 = call fastcc i64%t3948(i64 %t3944, i64 3, i64 %a0, i64 %a1, i64 %t3943, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3950 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3950)
  %t3951 = and i64 %t3950, -8
  %t3952 = inttoptr i64 %t3951 to ptr
  %t3953 = load i64, ptr %t3952
  %t3954 = inttoptr i64 %t3953 to ptr
  %t3955 = call fastcc i64%t3954(i64 %t3950, i64 4, i64 %a0, i64 %a1, i64 %t3949, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3956 = call i64 @rt_cdr(i64 %t3955)
  %t3957 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3957)
  %t3958 = and i64 %t3957, -8
  %t3959 = inttoptr i64 %t3958 to ptr
  %t3960 = load i64, ptr %t3959
  %t3961 = inttoptr i64 %t3960 to ptr
  %t3962 = call fastcc i64%t3961(i64 %t3957, i64 1, i64 %t3956, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3963 = icmp ne i64 %t3962, 1
  br i1 %t3963, label %then1464, label %else1465
then1464:
  ret i64 %t3955
else1465:
  %t3964 = call i64 @rt_intern(ptr @.str.sym.35)
  %t3965 = call i64 @rt_car(i64 %t3955)
  %t3966 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3966)
  %t3967 = and i64 %t3966, -8
  %t3968 = inttoptr i64 %t3967 to ptr
  %t3969 = load i64, ptr %t3968
  %t3970 = inttoptr i64 %t3969 to ptr
  %t3971 = call fastcc i64%t3970(i64 %t3966, i64 2, i64 %t3964, i64 %t3965, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3972 = call i64 @rt_cdr(i64 %t3955)
  %t3973 = call i64 @rt_cons(i64 %t3971, i64 %t3972)
  ret i64 %t3973
else1460:
  %t3974 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t3974)
  %t3975 = and i64 %t3974, -8
  %t3976 = inttoptr i64 %t3975 to ptr
  %t3977 = load i64, ptr %t3976
  %t3978 = inttoptr i64 %t3977 to ptr
  %t3979 = call fastcc i64%t3978(i64 %t3974, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3980 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t3980)
  %t3981 = and i64 %t3980, -8
  %t3982 = inttoptr i64 %t3981 to ptr
  %t3983 = load i64, ptr %t3982
  %t3984 = inttoptr i64 %t3983 to ptr
  %t3985 = call fastcc i64%t3984(i64 %t3980, i64 4, i64 %a0, i64 %a1, i64 %t3979, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3986 = call i64 @rt_cdr(i64 %t3985)
  %t3987 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t3987)
  %t3988 = and i64 %t3987, -8
  %t3989 = inttoptr i64 %t3988 to ptr
  %t3990 = load i64, ptr %t3989
  %t3991 = inttoptr i64 %t3990 to ptr
  %t3992 = call fastcc i64%t3991(i64 %t3987, i64 1, i64 %t3986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3993 = icmp ne i64 %t3992, 1
  br i1 %t3993, label %then1466, label %else1467
then1466:
  ret i64 %t3985
else1467:
  %t3994 = call i64 @rt_intern(ptr @.str.sym.36)
  %t3995 = call i64 @rt_car(i64 %t3985)
  %t3996 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t3996)
  %t3997 = and i64 %t3996, -8
  %t3998 = inttoptr i64 %t3997 to ptr
  %t3999 = load i64, ptr %t3998
  %t4000 = inttoptr i64 %t3999 to ptr
  %t4001 = call fastcc i64%t4000(i64 %t3996, i64 2, i64 %t3994, i64 %t3995, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4002 = call i64 @rt_cdr(i64 %t3985)
  %t4003 = call i64 @rt_cons(i64 %t4001, i64 %t4002)
  ret i64 %t4003
}

define fastcc i64 @"emit.internal:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4008 = icmp eq i64 %argc, 3
  br i1 %t4008, label %argok1469, label %arityerr1468
arityerr1468:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1469:
  %t4009 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4010 = call i64 @rt_char_to_integer(i64 %t4009)
  %t4011 = or i64 %t4010, 368
  %t4012 = and i64 %t4011, 7
  %t4013 = icmp eq i64 %t4012, 0
  br i1 %t4013, label %fixfast1470, label %fixslow1471
fixfast1470:
  %t4014 = icmp eq i64 %t4010, 368
  %t4015 = select i1 %t4014, i64 257, i64 1
  br label %fixmerge1472
fixslow1471:
  %t4016 = call i64 @rt_num_eq(i64 %t4010, i64 368)
  br label %fixmerge1472
fixmerge1472:
  %t4017 = phi i64 [ %t4015, %fixfast1470 ], [ %t4016, %fixslow1471 ]
  %t4018 = icmp ne i64 %t4017, 1
  br i1 %t4018, label %then1473, label %else1474
then1473:
  %t4019 = or i64 %a2, 8
  %t4020 = and i64 %t4019, 7
  %t4021 = icmp eq i64 %t4020, 0
  br i1 %t4021, label %fixfast1475, label %fixslow1476
fixfast1475:
  %t4022 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4023 = extractvalue {i64, i1} %t4022, 0
  %t4024 = extractvalue {i64, i1} %t4022, 1
  br i1 %t4024, label %fixslow1476, label %fixmerge1477
fixslow1476:
  %t4025 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1477
fixmerge1477:
  %t4026 = phi i64 [ %t4023, %fixfast1475 ], [ %t4025, %fixslow1476 ]
  %t4027 = load i64, ptr @"emit.internal:rd-token-end"
  call void @rt_check_callable(i64 %t4027)
  %t4028 = and i64 %t4027, -8
  %t4029 = inttoptr i64 %t4028 to ptr
  %t4030 = load i64, ptr %t4029
  %t4031 = inttoptr i64 %t4030 to ptr
  %t4032 = call fastcc i64%t4031(i64 %t4027, i64 3, i64 %a0, i64 %a1, i64 %t4026, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4033 = or i64 %a2, 8
  %t4034 = and i64 %t4033, 7
  %t4035 = icmp eq i64 %t4034, 0
  br i1 %t4035, label %fixfast1478, label %fixslow1479
fixfast1478:
  %t4036 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4037 = extractvalue {i64, i1} %t4036, 0
  %t4038 = extractvalue {i64, i1} %t4036, 1
  br i1 %t4038, label %fixslow1479, label %fixmerge1480
fixslow1479:
  %t4039 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1480
fixmerge1480:
  %t4040 = phi i64 [ %t4037, %fixfast1478 ], [ %t4039, %fixslow1479 ]
  %t4041 = or i64 %t4032, %t4040
  %t4042 = and i64 %t4041, 7
  %t4043 = icmp eq i64 %t4042, 0
  br i1 %t4043, label %fixfast1481, label %fixslow1482
fixfast1481:
  %t4044 = icmp eq i64 %t4032, %t4040
  %t4045 = select i1 %t4044, i64 257, i64 1
  br label %fixmerge1483
fixslow1482:
  %t4046 = call i64 @rt_num_eq(i64 %t4032, i64 %t4040)
  br label %fixmerge1483
fixmerge1483:
  %t4047 = phi i64 [ %t4045, %fixfast1481 ], [ %t4046, %fixslow1482 ]
  ret i64 %t4047
else1474:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4052 = icmp eq i64 %argc, 2
  br i1 %t4052, label %argok1485, label %arityerr1484
arityerr1484:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1485:
  %t4053 = call i64 @rt_null_p(i64 %a0)
  %t4054 = icmp ne i64 %t4053, 1
  br i1 %t4054, label %then1486, label %else1487
then1486:
  ret i64 %a1
else1487:
  %t4055 = call i64 @rt_cdr(i64 %a0)
  %t4056 = call i64 @rt_car(i64 %a0)
  %t4057 = call i64 @rt_cons(i64 %t4056, i64 %a1)
  %t4058 = load i64, ptr @"emit.internal:rd-append-reverse"
  call void @rt_check_callable(i64 %t4058)
  %t4059 = and i64 %t4058, -8
  %t4060 = inttoptr i64 %t4059 to ptr
  %t4061 = load i64, ptr %t4060
  %t4062 = inttoptr i64 %t4061 to ptr
  %t4063 = musttail call fastcc i64 %t4062(i64 %t4058, i64 2, i64 %t4055, i64 %t4057, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4063
}

define fastcc i64 @"emit.internal:code:rd-datum-comment?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4068 = icmp eq i64 %argc, 3
  br i1 %t4068, label %argok1489, label %arityerr1488
arityerr1488:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1489:
  %t4069 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4070 = call i64 @rt_char_to_integer(i64 %t4069)
  %t4071 = or i64 %t4070, 280
  %t4072 = and i64 %t4071, 7
  %t4073 = icmp eq i64 %t4072, 0
  br i1 %t4073, label %fixfast1490, label %fixslow1491
fixfast1490:
  %t4074 = icmp eq i64 %t4070, 280
  %t4075 = select i1 %t4074, i64 257, i64 1
  br label %fixmerge1492
fixslow1491:
  %t4076 = call i64 @rt_num_eq(i64 %t4070, i64 280)
  br label %fixmerge1492
fixmerge1492:
  %t4077 = phi i64 [ %t4075, %fixfast1490 ], [ %t4076, %fixslow1491 ]
  %t4078 = icmp ne i64 %t4077, 1
  br i1 %t4078, label %then1493, label %else1494
then1493:
  %t4079 = or i64 %a2, 8
  %t4080 = and i64 %t4079, 7
  %t4081 = icmp eq i64 %t4080, 0
  br i1 %t4081, label %fixfast1495, label %fixslow1496
fixfast1495:
  %t4082 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4083 = extractvalue {i64, i1} %t4082, 0
  %t4084 = extractvalue {i64, i1} %t4082, 1
  br i1 %t4084, label %fixslow1496, label %fixmerge1497
fixslow1496:
  %t4085 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1497
fixmerge1497:
  %t4086 = phi i64 [ %t4083, %fixfast1495 ], [ %t4085, %fixslow1496 ]
  %t4087 = or i64 %t4086, %a1
  %t4088 = and i64 %t4087, 7
  %t4089 = icmp eq i64 %t4088, 0
  br i1 %t4089, label %fixfast1498, label %fixslow1499
fixfast1498:
  %t4090 = icmp slt i64 %t4086, %a1
  %t4091 = select i1 %t4090, i64 257, i64 1
  br label %fixmerge1500
fixslow1499:
  %t4092 = call i64 @rt_lt(i64 %t4086, i64 %a1)
  br label %fixmerge1500
fixmerge1500:
  %t4093 = phi i64 [ %t4091, %fixfast1498 ], [ %t4092, %fixslow1499 ]
  %t4094 = icmp ne i64 %t4093, 1
  br i1 %t4094, label %then1501, label %else1502
then1501:
  %t4095 = or i64 %a2, 8
  %t4096 = and i64 %t4095, 7
  %t4097 = icmp eq i64 %t4096, 0
  br i1 %t4097, label %fixfast1503, label %fixslow1504
fixfast1503:
  %t4098 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4099 = extractvalue {i64, i1} %t4098, 0
  %t4100 = extractvalue {i64, i1} %t4098, 1
  br i1 %t4100, label %fixslow1504, label %fixmerge1505
fixslow1504:
  %t4101 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1505
fixmerge1505:
  %t4102 = phi i64 [ %t4099, %fixfast1503 ], [ %t4101, %fixslow1504 ]
  %t4103 = call i64 @rt_string_ref(i64 %a0, i64 %t4102)
  %t4104 = call i64 @rt_char_to_integer(i64 %t4103)
  %t4105 = or i64 %t4104, 472
  %t4106 = and i64 %t4105, 7
  %t4107 = icmp eq i64 %t4106, 0
  br i1 %t4107, label %fixfast1506, label %fixslow1507
fixfast1506:
  %t4108 = icmp eq i64 %t4104, 472
  %t4109 = select i1 %t4108, i64 257, i64 1
  br label %fixmerge1508
fixslow1507:
  %t4110 = call i64 @rt_num_eq(i64 %t4104, i64 472)
  br label %fixmerge1508
fixmerge1508:
  %t4111 = phi i64 [ %t4109, %fixfast1506 ], [ %t4110, %fixslow1507 ]
  ret i64 %t4111
else1502:
  ret i64 1
else1494:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4116 = icmp eq i64 %argc, 6
  br i1 %t4116, label %argok1510, label %arityerr1509
arityerr1509:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1510:
  %t4117 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4117)
  %t4118 = and i64 %t4117, -8
  %t4119 = inttoptr i64 %t4118 to ptr
  %t4120 = load i64, ptr %t4119
  %t4121 = inttoptr i64 %t4120 to ptr
  %t4122 = call fastcc i64%t4121(i64 %t4117, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4123 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4123)
  %t4124 = and i64 %t4123, -8
  %t4125 = inttoptr i64 %t4124 to ptr
  %t4126 = load i64, ptr %t4125
  %t4127 = inttoptr i64 %t4126 to ptr
  %t4128 = call fastcc i64%t4127(i64 %t4123, i64 1, i64 %t4122, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4129 = icmp ne i64 %t4128, 1
  br i1 %t4129, label %then1511, label %else1512
then1511:
  %t4130 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4131 = call i64 @rt_cons(i64 %t4130, i64 %t4122)
  ret i64 %t4131
else1512:
  %t4132 = or i64 %t4122, %a1
  %t4133 = and i64 %t4132, 7
  %t4134 = icmp eq i64 %t4133, 0
  br i1 %t4134, label %fixfast1513, label %fixslow1514
fixfast1513:
  %t4135 = icmp slt i64 %t4122, %a1
  %t4136 = select i1 %t4135, i64 257, i64 1
  br label %fixmerge1515
fixslow1514:
  %t4137 = call i64 @rt_lt(i64 %t4122, i64 %a1)
  br label %fixmerge1515
fixmerge1515:
  %t4138 = phi i64 [ %t4136, %fixfast1513 ], [ %t4137, %fixslow1514 ]
  %t4139 = icmp ne i64 %t4138, 1
  br i1 %t4139, label %then1516, label %else1517
then1516:
  %t4140 = call i64 @rt_string_ref(i64 %a0, i64 %t4122)
  %t4141 = call i64 @rt_char_to_integer(i64 %t4140)
  %t4142 = or i64 %t4141, 328
  %t4143 = and i64 %t4142, 7
  %t4144 = icmp eq i64 %t4143, 0
  br i1 %t4144, label %fixfast1518, label %fixslow1519
fixfast1518:
  %t4145 = icmp eq i64 %t4141, 328
  %t4146 = select i1 %t4145, i64 257, i64 1
  br label %fixmerge1520
fixslow1519:
  %t4147 = call i64 @rt_num_eq(i64 %t4141, i64 328)
  br label %fixmerge1520
fixmerge1520:
  %t4148 = phi i64 [ %t4146, %fixfast1518 ], [ %t4147, %fixslow1519 ]
  %t4149 = icmp ne i64 %t4148, 1
  br i1 %t4149, label %then1521, label %else1522
then1521:
  br label %merge1523
else1522:
  %t4150 = or i64 %t4141, 744
  %t4151 = and i64 %t4150, 7
  %t4152 = icmp eq i64 %t4151, 0
  br i1 %t4152, label %fixfast1524, label %fixslow1525
fixfast1524:
  %t4153 = icmp eq i64 %t4141, 744
  %t4154 = select i1 %t4153, i64 257, i64 1
  br label %fixmerge1526
fixslow1525:
  %t4155 = call i64 @rt_num_eq(i64 %t4141, i64 744)
  br label %fixmerge1526
fixmerge1526:
  %t4156 = phi i64 [ %t4154, %fixfast1524 ], [ %t4155, %fixslow1525 ]
  br label %merge1523
merge1523:
  %t4157 = phi i64 [ %t4148, %then1521 ], [ %t4156, %fixmerge1526 ]
  %t4158 = icmp ne i64 %t4157, 1
  br i1 %t4158, label %then1527, label %else1528
then1527:
  %t4159 = load i64, ptr @"emit.internal:reverse"
  call void @rt_check_callable(i64 %t4159)
  %t4160 = and i64 %t4159, -8
  %t4161 = inttoptr i64 %t4160 to ptr
  %t4162 = load i64, ptr %t4161
  %t4163 = inttoptr i64 %t4162 to ptr
  %t4164 = call fastcc i64%t4163(i64 %t4159, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4165 = or i64 %t4122, 8
  %t4166 = and i64 %t4165, 7
  %t4167 = icmp eq i64 %t4166, 0
  br i1 %t4167, label %fixfast1529, label %fixslow1530
fixfast1529:
  %t4168 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4122, i64 8)
  %t4169 = extractvalue {i64, i1} %t4168, 0
  %t4170 = extractvalue {i64, i1} %t4168, 1
  br i1 %t4170, label %fixslow1530, label %fixmerge1531
fixslow1530:
  %t4171 = call i64 @rt_add(i64 %t4122, i64 8)
  br label %fixmerge1531
fixmerge1531:
  %t4172 = phi i64 [ %t4169, %fixfast1529 ], [ %t4171, %fixslow1530 ]
  %t4173 = call i64 @rt_cons(i64 %t4164, i64 %t4172)
  ret i64 %t4173
else1528:
  %t4174 = load i64, ptr @"emit.internal:rd-datum-comment?"
  call void @rt_check_callable(i64 %t4174)
  %t4175 = and i64 %t4174, -8
  %t4176 = inttoptr i64 %t4175 to ptr
  %t4177 = load i64, ptr %t4176
  %t4178 = inttoptr i64 %t4177 to ptr
  %t4179 = call fastcc i64%t4178(i64 %t4174, i64 3, i64 %a0, i64 %a1, i64 %t4122, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4180 = icmp ne i64 %t4179, 1
  br i1 %t4180, label %then1532, label %else1533
then1532:
  %t4181 = or i64 %t4122, 16
  %t4182 = and i64 %t4181, 7
  %t4183 = icmp eq i64 %t4182, 0
  br i1 %t4183, label %fixfast1534, label %fixslow1535
fixfast1534:
  %t4184 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4122, i64 16)
  %t4185 = extractvalue {i64, i1} %t4184, 0
  %t4186 = extractvalue {i64, i1} %t4184, 1
  br i1 %t4186, label %fixslow1535, label %fixmerge1536
fixslow1535:
  %t4187 = call i64 @rt_add(i64 %t4122, i64 16)
  br label %fixmerge1536
fixmerge1536:
  %t4188 = phi i64 [ %t4185, %fixfast1534 ], [ %t4187, %fixslow1535 ]
  %t4189 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4189)
  %t4190 = and i64 %t4189, -8
  %t4191 = inttoptr i64 %t4190 to ptr
  %t4192 = load i64, ptr %t4191
  %t4193 = inttoptr i64 %t4192 to ptr
  %t4194 = call fastcc i64%t4193(i64 %t4189, i64 3, i64 %a0, i64 %a1, i64 %t4188, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4195 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4195)
  %t4196 = and i64 %t4195, -8
  %t4197 = inttoptr i64 %t4196 to ptr
  %t4198 = load i64, ptr %t4197
  %t4199 = inttoptr i64 %t4198 to ptr
  %t4200 = call fastcc i64%t4199(i64 %t4195, i64 4, i64 %a0, i64 %a1, i64 %t4194, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4201 = call i64 @rt_cdr(i64 %t4200)
  %t4202 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4202)
  %t4203 = and i64 %t4202, -8
  %t4204 = inttoptr i64 %t4203 to ptr
  %t4205 = load i64, ptr %t4204
  %t4206 = inttoptr i64 %t4205 to ptr
  %t4207 = call fastcc i64%t4206(i64 %t4202, i64 1, i64 %t4201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4208 = icmp ne i64 %t4207, 1
  br i1 %t4208, label %then1537, label %else1538
then1537:
  ret i64 %t4200
else1538:
  %t4209 = call i64 @rt_cdr(i64 %t4200)
  %t4210 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4210)
  %t4211 = and i64 %t4210, -8
  %t4212 = inttoptr i64 %t4211 to ptr
  %t4213 = load i64, ptr %t4212
  %t4214 = inttoptr i64 %t4213 to ptr
  %t4215 = musttail call fastcc i64 %t4214(i64 %t4210, i64 6, i64 %a0, i64 %a1, i64 %t4209, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  ret i64 %t4215
else1533:
  %t4216 = load i64, ptr @"emit.internal:rd-dot?"
  call void @rt_check_callable(i64 %t4216)
  %t4217 = and i64 %t4216, -8
  %t4218 = inttoptr i64 %t4217 to ptr
  %t4219 = load i64, ptr %t4218
  %t4220 = inttoptr i64 %t4219 to ptr
  %t4221 = call fastcc i64%t4220(i64 %t4216, i64 3, i64 %a0, i64 %a1, i64 %t4122, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4222 = icmp ne i64 %t4221, 1
  br i1 %t4222, label %then1539, label %else1540
then1539:
  %t4223 = or i64 %t4122, 8
  %t4224 = and i64 %t4223, 7
  %t4225 = icmp eq i64 %t4224, 0
  br i1 %t4225, label %fixfast1541, label %fixslow1542
fixfast1541:
  %t4226 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4122, i64 8)
  %t4227 = extractvalue {i64, i1} %t4226, 0
  %t4228 = extractvalue {i64, i1} %t4226, 1
  br i1 %t4228, label %fixslow1542, label %fixmerge1543
fixslow1542:
  %t4229 = call i64 @rt_add(i64 %t4122, i64 8)
  br label %fixmerge1543
fixmerge1543:
  %t4230 = phi i64 [ %t4227, %fixfast1541 ], [ %t4229, %fixslow1542 ]
  %t4231 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4231)
  %t4232 = and i64 %t4231, -8
  %t4233 = inttoptr i64 %t4232 to ptr
  %t4234 = load i64, ptr %t4233
  %t4235 = inttoptr i64 %t4234 to ptr
  %t4236 = call fastcc i64%t4235(i64 %t4231, i64 3, i64 %a0, i64 %a1, i64 %t4230, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4237 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4237)
  %t4238 = and i64 %t4237, -8
  %t4239 = inttoptr i64 %t4238 to ptr
  %t4240 = load i64, ptr %t4239
  %t4241 = inttoptr i64 %t4240 to ptr
  %t4242 = call fastcc i64%t4241(i64 %t4237, i64 4, i64 %a0, i64 %a1, i64 %t4236, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4243 = call i64 @rt_cdr(i64 %t4242)
  %t4244 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4244)
  %t4245 = and i64 %t4244, -8
  %t4246 = inttoptr i64 %t4245 to ptr
  %t4247 = load i64, ptr %t4246
  %t4248 = inttoptr i64 %t4247 to ptr
  %t4249 = call fastcc i64%t4248(i64 %t4244, i64 1, i64 %t4243, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4250 = icmp ne i64 %t4249, 1
  br i1 %t4250, label %then1544, label %else1545
then1544:
  ret i64 %t4242
else1545:
  %t4251 = call i64 @rt_cdr(i64 %t4242)
  %t4252 = load i64, ptr @"emit.internal:rd-skip-ws"
  call void @rt_check_callable(i64 %t4252)
  %t4253 = and i64 %t4252, -8
  %t4254 = inttoptr i64 %t4253 to ptr
  %t4255 = load i64, ptr %t4254
  %t4256 = inttoptr i64 %t4255 to ptr
  %t4257 = call fastcc i64%t4256(i64 %t4252, i64 3, i64 %a0, i64 %a1, i64 %t4251, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4258 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4258)
  %t4259 = and i64 %t4258, -8
  %t4260 = inttoptr i64 %t4259 to ptr
  %t4261 = load i64, ptr %t4260
  %t4262 = inttoptr i64 %t4261 to ptr
  %t4263 = call fastcc i64%t4262(i64 %t4258, i64 1, i64 %t4257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4264 = icmp ne i64 %t4263, 1
  br i1 %t4264, label %then1546, label %else1547
then1546:
  %t4265 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4266 = call i64 @rt_cons(i64 %t4265, i64 %t4257)
  ret i64 %t4266
else1547:
  %t4267 = or i64 %a1, %t4257
  %t4268 = and i64 %t4267, 7
  %t4269 = icmp eq i64 %t4268, 0
  br i1 %t4269, label %fixfast1548, label %fixslow1549
fixfast1548:
  %t4270 = icmp slt i64 %a1, %t4257
  %t4271 = select i1 %t4270, i64 257, i64 1
  br label %fixmerge1550
fixslow1549:
  %t4272 = call i64 @rt_lt(i64 %a1, i64 %t4257)
  br label %fixmerge1550
fixmerge1550:
  %t4273 = phi i64 [ %t4271, %fixfast1548 ], [ %t4272, %fixslow1549 ]
  %t4274 = icmp ne i64 %t4273, 1
  br i1 %t4274, label %then1551, label %else1552
then1551:
  br label %merge1553
else1552:
  %t4275 = or i64 %a1, %t4257
  %t4276 = and i64 %t4275, 7
  %t4277 = icmp eq i64 %t4276, 0
  br i1 %t4277, label %fixfast1554, label %fixslow1555
fixfast1554:
  %t4278 = icmp eq i64 %a1, %t4257
  %t4279 = select i1 %t4278, i64 257, i64 1
  br label %fixmerge1556
fixslow1555:
  %t4280 = call i64 @rt_num_eq(i64 %a1, i64 %t4257)
  br label %fixmerge1556
fixmerge1556:
  %t4281 = phi i64 [ %t4279, %fixfast1554 ], [ %t4280, %fixslow1555 ]
  br label %merge1553
merge1553:
  %t4282 = phi i64 [ 257, %then1551 ], [ %t4281, %fixmerge1556 ]
  %t4283 = icmp ne i64 %t4282, 1
  br i1 %t4283, label %then1557, label %else1558
then1557:
  %t4284 = call i64 @rt_intern(ptr @.str.sym.38)
  %t4285 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4285)
  %t4286 = and i64 %t4285, -8
  %t4287 = inttoptr i64 %t4286 to ptr
  %t4288 = load i64, ptr %t4287
  %t4289 = inttoptr i64 %t4288 to ptr
  %t4290 = musttail call fastcc i64 %t4289(i64 %t4285, i64 2, i64 %t4284, i64 %a5, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4290
else1558:
  %t4291 = call i64 @rt_car(i64 %t4242)
  %t4292 = load i64, ptr @"emit.internal:rd-append-reverse"
  call void @rt_check_callable(i64 %t4292)
  %t4293 = and i64 %t4292, -8
  %t4294 = inttoptr i64 %t4293 to ptr
  %t4295 = load i64, ptr %t4294
  %t4296 = inttoptr i64 %t4295 to ptr
  %t4297 = call fastcc i64%t4296(i64 %t4292, i64 2, i64 %a3, i64 %t4291, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4298 = or i64 %t4257, 8
  %t4299 = and i64 %t4298, 7
  %t4300 = icmp eq i64 %t4299, 0
  br i1 %t4300, label %fixfast1559, label %fixslow1560
fixfast1559:
  %t4301 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4257, i64 8)
  %t4302 = extractvalue {i64, i1} %t4301, 0
  %t4303 = extractvalue {i64, i1} %t4301, 1
  br i1 %t4303, label %fixslow1560, label %fixmerge1561
fixslow1560:
  %t4304 = call i64 @rt_add(i64 %t4257, i64 8)
  br label %fixmerge1561
fixmerge1561:
  %t4305 = phi i64 [ %t4302, %fixfast1559 ], [ %t4304, %fixslow1560 ]
  %t4306 = call i64 @rt_cons(i64 %t4297, i64 %t4305)
  ret i64 %t4306
else1540:
  %t4307 = load i64, ptr @"emit.internal:rd-datum"
  call void @rt_check_callable(i64 %t4307)
  %t4308 = and i64 %t4307, -8
  %t4309 = inttoptr i64 %t4308 to ptr
  %t4310 = load i64, ptr %t4309
  %t4311 = inttoptr i64 %t4310 to ptr
  %t4312 = call fastcc i64%t4311(i64 %t4307, i64 4, i64 %a0, i64 %a1, i64 %t4122, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4313 = call i64 @rt_cdr(i64 %t4312)
  %t4314 = load i64, ptr @"emit.internal:rd-fail?"
  call void @rt_check_callable(i64 %t4314)
  %t4315 = and i64 %t4314, -8
  %t4316 = inttoptr i64 %t4315 to ptr
  %t4317 = load i64, ptr %t4316
  %t4318 = inttoptr i64 %t4317 to ptr
  %t4319 = call fastcc i64%t4318(i64 %t4314, i64 1, i64 %t4313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4320 = icmp ne i64 %t4319, 1
  br i1 %t4320, label %then1562, label %else1563
then1562:
  ret i64 %t4312
else1563:
  %t4321 = call i64 @rt_cdr(i64 %t4312)
  %t4322 = call i64 @rt_car(i64 %t4312)
  %t4323 = call i64 @rt_cons(i64 %t4322, i64 %a3)
  %t4324 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4324)
  %t4325 = and i64 %t4324, -8
  %t4326 = inttoptr i64 %t4325 to ptr
  %t4327 = load i64, ptr %t4326
  %t4328 = inttoptr i64 %t4327 to ptr
  %t4329 = musttail call fastcc i64 %t4328(i64 %t4324, i64 6, i64 %a0, i64 %a1, i64 %t4321, i64 %t4323, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  ret i64 %t4329
else1517:
  %t4330 = call i64 @rt_intern(ptr @.str.sym.38)
  %t4331 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4331)
  %t4332 = and i64 %t4331, -8
  %t4333 = inttoptr i64 %t4332 to ptr
  %t4334 = load i64, ptr %t4333
  %t4335 = inttoptr i64 %t4334 to ptr
  %t4336 = musttail call fastcc i64 %t4335(i64 %t4331, i64 2, i64 %t4330, i64 %a5, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4336
}

define fastcc i64 @"emit.internal:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4341 = icmp eq i64 %argc, 4
  br i1 %t4341, label %argok1565, label %arityerr1564
arityerr1564:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1565:
  %t4342 = or i64 0, %a2
  %t4343 = and i64 %t4342, 7
  %t4344 = icmp eq i64 %t4343, 0
  br i1 %t4344, label %fixfast1566, label %fixslow1567
fixfast1566:
  %t4345 = icmp slt i64 0, %a2
  %t4346 = select i1 %t4345, i64 257, i64 1
  br label %fixmerge1568
fixslow1567:
  %t4347 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge1568
fixmerge1568:
  %t4348 = phi i64 [ %t4346, %fixfast1566 ], [ %t4347, %fixslow1567 ]
  %t4349 = icmp ne i64 %t4348, 1
  br i1 %t4349, label %then1569, label %else1570
then1569:
  br label %merge1571
else1570:
  %t4350 = or i64 0, %a2
  %t4351 = and i64 %t4350, 7
  %t4352 = icmp eq i64 %t4351, 0
  br i1 %t4352, label %fixfast1572, label %fixslow1573
fixfast1572:
  %t4353 = icmp eq i64 0, %a2
  %t4354 = select i1 %t4353, i64 257, i64 1
  br label %fixmerge1574
fixslow1573:
  %t4355 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge1574
fixmerge1574:
  %t4356 = phi i64 [ %t4354, %fixfast1572 ], [ %t4355, %fixslow1573 ]
  br label %merge1571
merge1571:
  %t4357 = phi i64 [ 257, %then1569 ], [ %t4356, %fixmerge1574 ]
  %t4358 = icmp ne i64 %t4357, 1
  br i1 %t4358, label %then1575, label %else1576
then1575:
  %t4359 = or i64 %a2, %a1
  %t4360 = and i64 %t4359, 7
  %t4361 = icmp eq i64 %t4360, 0
  br i1 %t4361, label %fixfast1578, label %fixslow1579
fixfast1578:
  %t4362 = icmp slt i64 %a2, %a1
  %t4363 = select i1 %t4362, i64 257, i64 1
  br label %fixmerge1580
fixslow1579:
  %t4364 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1580
fixmerge1580:
  %t4365 = phi i64 [ %t4363, %fixfast1578 ], [ %t4364, %fixslow1579 ]
  br label %merge1577
else1576:
  br label %merge1577
merge1577:
  %t4366 = phi i64 [ %t4365, %fixmerge1580 ], [ 1, %else1576 ]
  %t4367 = icmp ne i64 %t4366, 1
  br i1 %t4367, label %then1581, label %else1582
then1581:
  %t4368 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4369 = call i64 @rt_char_to_integer(i64 %t4368)
  %t4370 = or i64 %t4369, 320
  %t4371 = and i64 %t4370, 7
  %t4372 = icmp eq i64 %t4371, 0
  br i1 %t4372, label %fixfast1583, label %fixslow1584
fixfast1583:
  %t4373 = icmp eq i64 %t4369, 320
  %t4374 = select i1 %t4373, i64 257, i64 1
  br label %fixmerge1585
fixslow1584:
  %t4375 = call i64 @rt_num_eq(i64 %t4369, i64 320)
  br label %fixmerge1585
fixmerge1585:
  %t4376 = phi i64 [ %t4374, %fixfast1583 ], [ %t4375, %fixslow1584 ]
  %t4377 = icmp ne i64 %t4376, 1
  br i1 %t4377, label %then1586, label %else1587
then1586:
  %t4378 = or i64 %a2, 8
  %t4379 = and i64 %t4378, 7
  %t4380 = icmp eq i64 %t4379, 0
  br i1 %t4380, label %fixfast1588, label %fixslow1589
fixfast1588:
  %t4381 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4382 = extractvalue {i64, i1} %t4381, 0
  %t4383 = extractvalue {i64, i1} %t4381, 1
  br i1 %t4383, label %fixslow1589, label %fixmerge1590
fixslow1589:
  %t4384 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1590
fixmerge1590:
  %t4385 = phi i64 [ %t4382, %fixfast1588 ], [ %t4384, %fixslow1589 ]
  %t4386 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4386)
  %t4387 = and i64 %t4386, -8
  %t4388 = inttoptr i64 %t4387 to ptr
  %t4389 = load i64, ptr %t4388
  %t4390 = inttoptr i64 %t4389 to ptr
  %t4391 = musttail call fastcc i64 %t4390(i64 %t4386, i64 6, i64 %a0, i64 %a1, i64 %t4385, i64 2, i64 %a3, i64 %a2, i64 0, i64 0, ptr null)
  ret i64 %t4391
else1587:
  %t4392 = or i64 %t4369, 728
  %t4393 = and i64 %t4392, 7
  %t4394 = icmp eq i64 %t4393, 0
  br i1 %t4394, label %fixfast1591, label %fixslow1592
fixfast1591:
  %t4395 = icmp eq i64 %t4369, 728
  %t4396 = select i1 %t4395, i64 257, i64 1
  br label %fixmerge1593
fixslow1592:
  %t4397 = call i64 @rt_num_eq(i64 %t4369, i64 728)
  br label %fixmerge1593
fixmerge1593:
  %t4398 = phi i64 [ %t4396, %fixfast1591 ], [ %t4397, %fixslow1592 ]
  %t4399 = icmp ne i64 %t4398, 1
  br i1 %t4399, label %then1594, label %else1595
then1594:
  %t4400 = or i64 %a2, 8
  %t4401 = and i64 %t4400, 7
  %t4402 = icmp eq i64 %t4401, 0
  br i1 %t4402, label %fixfast1596, label %fixslow1597
fixfast1596:
  %t4403 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4404 = extractvalue {i64, i1} %t4403, 0
  %t4405 = extractvalue {i64, i1} %t4403, 1
  br i1 %t4405, label %fixslow1597, label %fixmerge1598
fixslow1597:
  %t4406 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1598
fixmerge1598:
  %t4407 = phi i64 [ %t4404, %fixfast1596 ], [ %t4406, %fixslow1597 ]
  %t4408 = load i64, ptr @"emit.internal:rd-list"
  call void @rt_check_callable(i64 %t4408)
  %t4409 = and i64 %t4408, -8
  %t4410 = inttoptr i64 %t4409 to ptr
  %t4411 = load i64, ptr %t4410
  %t4412 = inttoptr i64 %t4411 to ptr
  %t4413 = musttail call fastcc i64 %t4412(i64 %t4408, i64 6, i64 %a0, i64 %a1, i64 %t4407, i64 2, i64 %a3, i64 %a2, i64 0, i64 0, ptr null)
  ret i64 %t4413
else1595:
  %t4414 = or i64 %t4369, 312
  %t4415 = and i64 %t4414, 7
  %t4416 = icmp eq i64 %t4415, 0
  br i1 %t4416, label %fixfast1599, label %fixslow1600
fixfast1599:
  %t4417 = icmp eq i64 %t4369, 312
  %t4418 = select i1 %t4417, i64 257, i64 1
  br label %fixmerge1601
fixslow1600:
  %t4419 = call i64 @rt_num_eq(i64 %t4369, i64 312)
  br label %fixmerge1601
fixmerge1601:
  %t4420 = phi i64 [ %t4418, %fixfast1599 ], [ %t4419, %fixslow1600 ]
  %t4421 = icmp ne i64 %t4420, 1
  br i1 %t4421, label %then1602, label %else1603
then1602:
  %t4422 = or i64 %a2, 8
  %t4423 = and i64 %t4422, 7
  %t4424 = icmp eq i64 %t4423, 0
  br i1 %t4424, label %fixfast1604, label %fixslow1605
fixfast1604:
  %t4425 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4426 = extractvalue {i64, i1} %t4425, 0
  %t4427 = extractvalue {i64, i1} %t4425, 1
  br i1 %t4427, label %fixslow1605, label %fixmerge1606
fixslow1605:
  %t4428 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1606
fixmerge1606:
  %t4429 = phi i64 [ %t4426, %fixfast1604 ], [ %t4428, %fixslow1605 ]
  %t4430 = load i64, ptr @"emit.internal:rd-quote"
  call void @rt_check_callable(i64 %t4430)
  %t4431 = and i64 %t4430, -8
  %t4432 = inttoptr i64 %t4431 to ptr
  %t4433 = load i64, ptr %t4432
  %t4434 = inttoptr i64 %t4433 to ptr
  %t4435 = musttail call fastcc i64 %t4434(i64 %t4430, i64 4, i64 %a0, i64 %a1, i64 %t4429, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4435
else1603:
  %t4436 = or i64 %t4369, 768
  %t4437 = and i64 %t4436, 7
  %t4438 = icmp eq i64 %t4437, 0
  br i1 %t4438, label %fixfast1607, label %fixslow1608
fixfast1607:
  %t4439 = icmp eq i64 %t4369, 768
  %t4440 = select i1 %t4439, i64 257, i64 1
  br label %fixmerge1609
fixslow1608:
  %t4441 = call i64 @rt_num_eq(i64 %t4369, i64 768)
  br label %fixmerge1609
fixmerge1609:
  %t4442 = phi i64 [ %t4440, %fixfast1607 ], [ %t4441, %fixslow1608 ]
  %t4443 = icmp ne i64 %t4442, 1
  br i1 %t4443, label %then1610, label %else1611
then1610:
  %t4444 = or i64 %a2, 8
  %t4445 = and i64 %t4444, 7
  %t4446 = icmp eq i64 %t4445, 0
  br i1 %t4446, label %fixfast1612, label %fixslow1613
fixfast1612:
  %t4447 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4448 = extractvalue {i64, i1} %t4447, 0
  %t4449 = extractvalue {i64, i1} %t4447, 1
  br i1 %t4449, label %fixslow1613, label %fixmerge1614
fixslow1613:
  %t4450 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1614
fixmerge1614:
  %t4451 = phi i64 [ %t4448, %fixfast1612 ], [ %t4450, %fixslow1613 ]
  %t4452 = load i64, ptr @"emit.internal:rd-quasi"
  call void @rt_check_callable(i64 %t4452)
  %t4453 = and i64 %t4452, -8
  %t4454 = inttoptr i64 %t4453 to ptr
  %t4455 = load i64, ptr %t4454
  %t4456 = inttoptr i64 %t4455 to ptr
  %t4457 = musttail call fastcc i64 %t4456(i64 %t4452, i64 4, i64 %a0, i64 %a1, i64 %t4451, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4457
else1611:
  %t4458 = or i64 %t4369, 352
  %t4459 = and i64 %t4458, 7
  %t4460 = icmp eq i64 %t4459, 0
  br i1 %t4460, label %fixfast1615, label %fixslow1616
fixfast1615:
  %t4461 = icmp eq i64 %t4369, 352
  %t4462 = select i1 %t4461, i64 257, i64 1
  br label %fixmerge1617
fixslow1616:
  %t4463 = call i64 @rt_num_eq(i64 %t4369, i64 352)
  br label %fixmerge1617
fixmerge1617:
  %t4464 = phi i64 [ %t4462, %fixfast1615 ], [ %t4463, %fixslow1616 ]
  %t4465 = icmp ne i64 %t4464, 1
  br i1 %t4465, label %then1618, label %else1619
then1618:
  %t4466 = or i64 %a2, 8
  %t4467 = and i64 %t4466, 7
  %t4468 = icmp eq i64 %t4467, 0
  br i1 %t4468, label %fixfast1620, label %fixslow1621
fixfast1620:
  %t4469 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4470 = extractvalue {i64, i1} %t4469, 0
  %t4471 = extractvalue {i64, i1} %t4469, 1
  br i1 %t4471, label %fixslow1621, label %fixmerge1622
fixslow1621:
  %t4472 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1622
fixmerge1622:
  %t4473 = phi i64 [ %t4470, %fixfast1620 ], [ %t4472, %fixslow1621 ]
  %t4474 = load i64, ptr @"emit.internal:rd-unquote"
  call void @rt_check_callable(i64 %t4474)
  %t4475 = and i64 %t4474, -8
  %t4476 = inttoptr i64 %t4475 to ptr
  %t4477 = load i64, ptr %t4476
  %t4478 = inttoptr i64 %t4477 to ptr
  %t4479 = musttail call fastcc i64 %t4478(i64 %t4474, i64 4, i64 %a0, i64 %a1, i64 %t4473, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4479
else1619:
  %t4480 = or i64 %t4369, 272
  %t4481 = and i64 %t4480, 7
  %t4482 = icmp eq i64 %t4481, 0
  br i1 %t4482, label %fixfast1623, label %fixslow1624
fixfast1623:
  %t4483 = icmp eq i64 %t4369, 272
  %t4484 = select i1 %t4483, i64 257, i64 1
  br label %fixmerge1625
fixslow1624:
  %t4485 = call i64 @rt_num_eq(i64 %t4369, i64 272)
  br label %fixmerge1625
fixmerge1625:
  %t4486 = phi i64 [ %t4484, %fixfast1623 ], [ %t4485, %fixslow1624 ]
  %t4487 = icmp ne i64 %t4486, 1
  br i1 %t4487, label %then1626, label %else1627
then1626:
  %t4488 = or i64 %a2, 8
  %t4489 = and i64 %t4488, 7
  %t4490 = icmp eq i64 %t4489, 0
  br i1 %t4490, label %fixfast1628, label %fixslow1629
fixfast1628:
  %t4491 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4492 = extractvalue {i64, i1} %t4491, 0
  %t4493 = extractvalue {i64, i1} %t4491, 1
  br i1 %t4493, label %fixslow1629, label %fixmerge1630
fixslow1629:
  %t4494 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1630
fixmerge1630:
  %t4495 = phi i64 [ %t4492, %fixfast1628 ], [ %t4494, %fixslow1629 ]
  %t4496 = load i64, ptr @"emit.internal:rd-string"
  call void @rt_check_callable(i64 %t4496)
  %t4497 = and i64 %t4496, -8
  %t4498 = inttoptr i64 %t4497 to ptr
  %t4499 = load i64, ptr %t4498
  %t4500 = inttoptr i64 %t4499 to ptr
  %t4501 = musttail call fastcc i64 %t4500(i64 %t4496, i64 4, i64 %a0, i64 %a1, i64 %t4495, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4501
else1627:
  %t4502 = or i64 %t4369, 280
  %t4503 = and i64 %t4502, 7
  %t4504 = icmp eq i64 %t4503, 0
  br i1 %t4504, label %fixfast1631, label %fixslow1632
fixfast1631:
  %t4505 = icmp eq i64 %t4369, 280
  %t4506 = select i1 %t4505, i64 257, i64 1
  br label %fixmerge1633
fixslow1632:
  %t4507 = call i64 @rt_num_eq(i64 %t4369, i64 280)
  br label %fixmerge1633
fixmerge1633:
  %t4508 = phi i64 [ %t4506, %fixfast1631 ], [ %t4507, %fixslow1632 ]
  %t4509 = icmp ne i64 %t4508, 1
  br i1 %t4509, label %then1634, label %else1635
then1634:
  %t4510 = or i64 %a2, 8
  %t4511 = and i64 %t4510, 7
  %t4512 = icmp eq i64 %t4511, 0
  br i1 %t4512, label %fixfast1636, label %fixslow1637
fixfast1636:
  %t4513 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4514 = extractvalue {i64, i1} %t4513, 0
  %t4515 = extractvalue {i64, i1} %t4513, 1
  br i1 %t4515, label %fixslow1637, label %fixmerge1638
fixslow1637:
  %t4516 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1638
fixmerge1638:
  %t4517 = phi i64 [ %t4514, %fixfast1636 ], [ %t4516, %fixslow1637 ]
  %t4518 = load i64, ptr @"emit.internal:rd-hash"
  call void @rt_check_callable(i64 %t4518)
  %t4519 = and i64 %t4518, -8
  %t4520 = inttoptr i64 %t4519 to ptr
  %t4521 = load i64, ptr %t4520
  %t4522 = inttoptr i64 %t4521 to ptr
  %t4523 = musttail call fastcc i64 %t4522(i64 %t4518, i64 4, i64 %a0, i64 %a1, i64 %t4517, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4523
else1635:
  %t4524 = or i64 %t4369, 992
  %t4525 = and i64 %t4524, 7
  %t4526 = icmp eq i64 %t4525, 0
  br i1 %t4526, label %fixfast1639, label %fixslow1640
fixfast1639:
  %t4527 = icmp eq i64 %t4369, 992
  %t4528 = select i1 %t4527, i64 257, i64 1
  br label %fixmerge1641
fixslow1640:
  %t4529 = call i64 @rt_num_eq(i64 %t4369, i64 992)
  br label %fixmerge1641
fixmerge1641:
  %t4530 = phi i64 [ %t4528, %fixfast1639 ], [ %t4529, %fixslow1640 ]
  %t4531 = icmp ne i64 %t4530, 1
  br i1 %t4531, label %then1642, label %else1643
then1642:
  %t4532 = or i64 %a2, 8
  %t4533 = and i64 %t4532, 7
  %t4534 = icmp eq i64 %t4533, 0
  br i1 %t4534, label %fixfast1644, label %fixslow1645
fixfast1644:
  %t4535 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4536 = extractvalue {i64, i1} %t4535, 0
  %t4537 = extractvalue {i64, i1} %t4535, 1
  br i1 %t4537, label %fixslow1645, label %fixmerge1646
fixslow1645:
  %t4538 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1646
fixmerge1646:
  %t4539 = phi i64 [ %t4536, %fixfast1644 ], [ %t4538, %fixslow1645 ]
  %t4540 = load i64, ptr @"emit.internal:rd-bar"
  call void @rt_check_callable(i64 %t4540)
  %t4541 = and i64 %t4540, -8
  %t4542 = inttoptr i64 %t4541 to ptr
  %t4543 = load i64, ptr %t4542
  %t4544 = inttoptr i64 %t4543 to ptr
  %t4545 = musttail call fastcc i64 %t4544(i64 %t4540, i64 4, i64 %a0, i64 %a1, i64 %t4539, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4545
else1643:
  %t4546 = or i64 %t4369, 328
  %t4547 = and i64 %t4546, 7
  %t4548 = icmp eq i64 %t4547, 0
  br i1 %t4548, label %fixfast1647, label %fixslow1648
fixfast1647:
  %t4549 = icmp eq i64 %t4369, 328
  %t4550 = select i1 %t4549, i64 257, i64 1
  br label %fixmerge1649
fixslow1648:
  %t4551 = call i64 @rt_num_eq(i64 %t4369, i64 328)
  br label %fixmerge1649
fixmerge1649:
  %t4552 = phi i64 [ %t4550, %fixfast1647 ], [ %t4551, %fixslow1648 ]
  %t4553 = icmp ne i64 %t4552, 1
  br i1 %t4553, label %then1650, label %else1651
then1650:
  br label %merge1652
else1651:
  %t4554 = or i64 %t4369, 744
  %t4555 = and i64 %t4554, 7
  %t4556 = icmp eq i64 %t4555, 0
  br i1 %t4556, label %fixfast1653, label %fixslow1654
fixfast1653:
  %t4557 = icmp eq i64 %t4369, 744
  %t4558 = select i1 %t4557, i64 257, i64 1
  br label %fixmerge1655
fixslow1654:
  %t4559 = call i64 @rt_num_eq(i64 %t4369, i64 744)
  br label %fixmerge1655
fixmerge1655:
  %t4560 = phi i64 [ %t4558, %fixfast1653 ], [ %t4559, %fixslow1654 ]
  br label %merge1652
merge1652:
  %t4561 = phi i64 [ %t4552, %then1650 ], [ %t4560, %fixmerge1655 ]
  %t4562 = icmp ne i64 %t4561, 1
  br i1 %t4562, label %then1656, label %else1657
then1656:
  %t4563 = call i64 @rt_intern(ptr @.str.sym.9)
  %t4564 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4564)
  %t4565 = and i64 %t4564, -8
  %t4566 = inttoptr i64 %t4565 to ptr
  %t4567 = load i64, ptr %t4566
  %t4568 = inttoptr i64 %t4567 to ptr
  %t4569 = musttail call fastcc i64 %t4568(i64 %t4564, i64 2, i64 %t4563, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4569
else1657:
  %t4570 = load i64, ptr @"emit.internal:rd-atom"
  call void @rt_check_callable(i64 %t4570)
  %t4571 = and i64 %t4570, -8
  %t4572 = inttoptr i64 %t4571 to ptr
  %t4573 = load i64, ptr %t4572
  %t4574 = inttoptr i64 %t4573 to ptr
  %t4575 = musttail call fastcc i64 %t4574(i64 %t4570, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4575
else1582:
  %t4576 = or i64 %a2, 0
  %t4577 = and i64 %t4576, 7
  %t4578 = icmp eq i64 %t4577, 0
  br i1 %t4578, label %fixfast1658, label %fixslow1659
fixfast1658:
  %t4579 = icmp slt i64 %a2, 0
  %t4580 = select i1 %t4579, i64 257, i64 1
  br label %fixmerge1660
fixslow1659:
  %t4581 = call i64 @rt_lt(i64 %a2, i64 0)
  br label %fixmerge1660
fixmerge1660:
  %t4582 = phi i64 [ %t4580, %fixfast1658 ], [ %t4581, %fixslow1659 ]
  %t4583 = icmp ne i64 %t4582, 1
  br i1 %t4583, label %then1661, label %else1662
then1661:
  %t4584 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4585 = call i64 @rt_cons(i64 %t4584, i64 %a2)
  ret i64 %t4585
else1662:
  %t4586 = call i64 @rt_intern(ptr @.str.sym.12)
  %t4587 = load i64, ptr @"emit.internal:rd-fail"
  call void @rt_check_callable(i64 %t4587)
  %t4588 = and i64 %t4587, -8
  %t4589 = inttoptr i64 %t4588 to ptr
  %t4590 = load i64, ptr %t4589
  %t4591 = inttoptr i64 %t4590 to ptr
  %t4592 = musttail call fastcc i64 %t4591(i64 %t4587, i64 2, i64 %t4586, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4592
}

define fastcc i64 @"emit.internal:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4598 = icmp eq i64 %argc, 0
  br i1 %t4598, label %argok1664, label %arityerr1663
arityerr1663:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1664:
  %t4599 = load i64, ptr @"emit.internal:%port-rtd-cell"
  %t4600 = icmp ne i64 %t4599, 1
  br i1 %t4600, label %then1665, label %else1666
then1665:
  %t4601 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t4601
else1666:
  %t4602 = call i64 @rt_make_string(ptr @.str.lit.39, i64 4)
  %t4603 = call i64 @rt_make_record_type(i64 %t4602)
  %t4604 = call i64 @rt_root(i64 %t4603)
  store i64 %t4604, ptr @"emit.internal:%port-rtd-cell"
  %t4605 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t4605
}

define fastcc i64 @"emit.internal:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4610 = icmp eq i64 %argc, 6
  br i1 %t4610, label %argok1668, label %arityerr1667
arityerr1667:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1668:
  %t4611 = load i64, ptr @"emit.internal:%port-rtd"
  call void @rt_check_callable(i64 %t4611)
  %t4612 = and i64 %t4611, -8
  %t4613 = inttoptr i64 %t4612 to ptr
  %t4614 = load i64, ptr %t4613
  %t4615 = inttoptr i64 %t4614 to ptr
  %t4616 = call fastcc i64%t4615(i64 %t4611, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4617 = load i64, ptr @"emit.internal:list"
  call void @rt_check_callable(i64 %t4617)
  %t4618 = and i64 %t4617, -8
  %t4619 = inttoptr i64 %t4618 to ptr
  %t4620 = load i64, ptr %t4619
  %t4621 = inttoptr i64 %t4620 to ptr
  %t4622 = call fastcc i64%t4621(i64 %t4617, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t4623 = call i64 @rt_make_record(i64 %t4616, i64 %t4622)
  ret i64 %t4623
}

define fastcc i64 @"emit.internal:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4628 = icmp eq i64 %argc, 1
  br i1 %t4628, label %argok1670, label %arityerr1669
arityerr1669:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1670:
  %t4629 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t4630 = icmp ne i64 %t4629, 1
  br i1 %t4630, label %then1671, label %else1672
then1671:
  ret i64 %t4629
else1672:
  %t4631 = call i64 @rt_read_all_stdin()
  %t4632 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t4631)
  ret i64 %t4631
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
  %t705 = call ptr @rt_alloc_words(i64 1)
  %t706 = ptrtoint ptr %t705 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-line" to i64), ptr %t705
  %t707 = or i64 %t706, 4
  %t708 = call i64 @rt_root(i64 %t707)
  store i64 %t708, ptr @"emit.internal:rd-skip-line"
  ret i64 17
}

define i64 @"emit.internal:__init_30"() {
entry:
  %t753 = call ptr @rt_alloc_words(i64 1)
  %t754 = ptrtoint ptr %t753 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-block-open?" to i64), ptr %t753
  %t755 = or i64 %t754, 4
  %t756 = call i64 @rt_root(i64 %t755)
  store i64 %t756, ptr @"emit.internal:rd-block-open?"
  ret i64 17
}

define i64 @"emit.internal:__init_31"() {
entry:
  %t900 = call ptr @rt_alloc_words(i64 1)
  %t901 = ptrtoint ptr %t900 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-block" to i64), ptr %t900
  %t902 = or i64 %t901, 4
  %t903 = call i64 @rt_root(i64 %t902)
  store i64 %t903, ptr @"emit.internal:rd-skip-block"
  ret i64 17
}

define i64 @"emit.internal:__init_32"() {
entry:
  %t1016 = call ptr @rt_alloc_words(i64 1)
  %t1017 = ptrtoint ptr %t1016 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-ws" to i64), ptr %t1016
  %t1018 = or i64 %t1017, 4
  %t1019 = call i64 @rt_root(i64 %t1018)
  store i64 %t1019, ptr @"emit.internal:rd-skip-ws"
  ret i64 17
}

define i64 @"emit.internal:__init_33"() {
entry:
  %t1051 = call ptr @rt_alloc_words(i64 1)
  %t1052 = ptrtoint ptr %t1051 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-end" to i64), ptr %t1051
  %t1053 = or i64 %t1052, 4
  %t1054 = call i64 @rt_root(i64 %t1053)
  store i64 %t1054, ptr @"emit.internal:rd-token-end"
  ret i64 17
}

define i64 @"emit.internal:__init_34"() {
entry:
  %t1086 = call ptr @rt_alloc_words(i64 1)
  %t1087 = ptrtoint ptr %t1086 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-all-digits?" to i64), ptr %t1086
  %t1088 = or i64 %t1087, 4
  %t1089 = call i64 @rt_root(i64 %t1088)
  store i64 %t1089, ptr @"emit.internal:rd-all-digits?"
  ret i64 17
}

define i64 @"emit.internal:__init_35"() {
entry:
  %t1147 = call ptr @rt_alloc_words(i64 1)
  %t1148 = ptrtoint ptr %t1147 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-numeric?" to i64), ptr %t1147
  %t1149 = or i64 %t1148, 4
  %t1150 = call i64 @rt_root(i64 %t1149)
  store i64 %t1150, ptr @"emit.internal:rd-numeric?"
  ret i64 17
}

define i64 @"emit.internal:__init_36"() {
entry:
  %t1201 = call ptr @rt_alloc_words(i64 1)
  %t1202 = ptrtoint ptr %t1201 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits" to i64), ptr %t1201
  %t1203 = or i64 %t1202, 4
  %t1204 = call i64 @rt_root(i64 %t1203)
  store i64 %t1204, ptr @"emit.internal:rd-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_37"() {
entry:
  %t1255 = call ptr @rt_alloc_words(i64 1)
  %t1256 = ptrtoint ptr %t1255 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits-neg" to i64), ptr %t1255
  %t1257 = or i64 %t1256, 4
  %t1258 = call i64 @rt_root(i64 %t1257)
  store i64 %t1258, ptr @"emit.internal:rd-digits-neg"
  ret i64 17
}

define i64 @"emit.internal:__init_38"() {
entry:
  %t1297 = call ptr @rt_alloc_words(i64 1)
  %t1298 = ptrtoint ptr %t1297 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-parse-int" to i64), ptr %t1297
  %t1299 = or i64 %t1298, 4
  %t1300 = call i64 @rt_root(i64 %t1299)
  store i64 %t1300, ptr @"emit.internal:rd-parse-int"
  ret i64 17
}

define i64 @"emit.internal:__init_39"() {
entry:
  %t1310 = call ptr @rt_alloc_words(i64 1)
  %t1311 = ptrtoint ptr %t1310 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dotchar?" to i64), ptr %t1310
  %t1312 = or i64 %t1311, 4
  %t1313 = call i64 @rt_root(i64 %t1312)
  store i64 %t1313, ptr @"emit.internal:rd-dotchar?"
  ret i64 17
}

define i64 @"emit.internal:__init_40"() {
entry:
  %t1331 = call ptr @rt_alloc_words(i64 1)
  %t1332 = ptrtoint ptr %t1331 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exp-char?" to i64), ptr %t1331
  %t1333 = or i64 %t1332, 4
  %t1334 = call i64 @rt_root(i64 %t1333)
  store i64 %t1334, ptr @"emit.internal:rd-exp-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_41"() {
entry:
  %t1352 = call ptr @rt_alloc_words(i64 1)
  %t1353 = ptrtoint ptr %t1352 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-sign-char?" to i64), ptr %t1352
  %t1354 = or i64 %t1353, 4
  %t1355 = call i64 @rt_root(i64 %t1354)
  store i64 %t1355, ptr @"emit.internal:rd-sign-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_42"() {
entry:
  %t1388 = call ptr @rt_alloc_words(i64 1)
  %t1389 = ptrtoint ptr %t1388 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-digits" to i64), ptr %t1388
  %t1390 = or i64 %t1389, 4
  %t1391 = call i64 @rt_root(i64 %t1390)
  store i64 %t1391, ptr @"emit.internal:rd-scan-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_43"() {
entry:
  %t1580 = call ptr @rt_alloc_words(i64 1)
  %t1581 = ptrtoint ptr %t1580 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-flonum?" to i64), ptr %t1580
  %t1582 = or i64 %t1581, 4
  %t1583 = call i64 @rt_root(i64 %t1582)
  store i64 %t1583, ptr @"emit.internal:rd-flonum?"
  ret i64 17
}

define i64 @"emit.internal:__init_44"() {
entry:
  %t1651 = call ptr @rt_alloc_words(i64 1)
  %t1652 = ptrtoint ptr %t1651 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-ci=?" to i64), ptr %t1651
  %t1653 = or i64 %t1652, 4
  %t1654 = call i64 @rt_root(i64 %t1653)
  store i64 %t1654, ptr @"emit.internal:rd-ci=?"
  ret i64 17
}

define i64 @"emit.internal:__init_45"() {
entry:
  %t1686 = call ptr @rt_alloc_words(i64 1)
  %t1687 = ptrtoint ptr %t1686 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-nonfinite" to i64), ptr %t1686
  %t1688 = or i64 %t1687, 4
  %t1689 = call i64 @rt_root(i64 %t1688)
  store i64 %t1689, ptr @"emit.internal:rd-nonfinite"
  ret i64 17
}

define i64 @"emit.internal:__init_46"() {
entry:
  %t1760 = call ptr @rt_alloc_words(i64 1)
  %t1761 = ptrtoint ptr %t1760 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-letter" to i64), ptr %t1760
  %t1762 = or i64 %t1761, 4
  %t1763 = call i64 @rt_root(i64 %t1762)
  store i64 %t1763, ptr @"emit.internal:rd-radix-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_47"() {
entry:
  %t1800 = call ptr @rt_alloc_words(i64 1)
  %t1801 = ptrtoint ptr %t1800 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-letter" to i64), ptr %t1800
  %t1802 = or i64 %t1801, 4
  %t1803 = call i64 @rt_root(i64 %t1802)
  store i64 %t1803, ptr @"emit.internal:rd-exactness-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_48"() {
entry:
  %t1904 = call ptr @rt_alloc_words(i64 1)
  %t1905 = ptrtoint ptr %t1904 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-prefixes" to i64), ptr %t1904
  %t1906 = or i64 %t1905, 4
  %t1907 = call i64 @rt_root(i64 %t1906)
  store i64 %t1907, ptr @"emit.internal:rd-scan-prefixes"
  ret i64 17
}

define i64 @"emit.internal:__init_49"() {
entry:
  %t1940 = call ptr @rt_alloc_words(i64 1)
  %t1941 = ptrtoint ptr %t1940 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-scan" to i64), ptr %t1940
  %t1942 = or i64 %t1941, 4
  %t1943 = call i64 @rt_root(i64 %t1942)
  store i64 %t1943, ptr @"emit.internal:rd-radix-scan"
  ret i64 17
}

define i64 @"emit.internal:__init_50"() {
entry:
  %t2040 = call ptr @rt_alloc_words(i64 1)
  %t2041 = ptrtoint ptr %t2040 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-rational-body?" to i64), ptr %t2040
  %t2042 = or i64 %t2041, 4
  %t2043 = call i64 @rt_root(i64 %t2042)
  store i64 %t2043, ptr @"emit.internal:rd-rational-body?"
  ret i64 17
}

define i64 @"emit.internal:__init_51"() {
entry:
  %t2069 = call ptr @rt_alloc_words(i64 1)
  %t2070 = ptrtoint ptr %t2069 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-apply" to i64), ptr %t2069
  %t2071 = or i64 %t2070, 4
  %t2072 = call i64 @rt_root(i64 %t2071)
  store i64 %t2072, ptr @"emit.internal:rd-exactness-apply"
  ret i64 17
}

define i64 @"emit.internal:__init_52"() {
entry:
  %t2155 = call ptr @rt_alloc_words(i64 1)
  %t2156 = ptrtoint ptr %t2155 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-body-number" to i64), ptr %t2155
  %t2157 = or i64 %t2156, 4
  %t2158 = call i64 @rt_root(i64 %t2157)
  store i64 %t2158, ptr @"emit.internal:rd-body-number"
  ret i64 17
}

define i64 @"emit.internal:__init_53"() {
entry:
  %t2241 = call ptr @rt_alloc_words(i64 1)
  %t2242 = ptrtoint ptr %t2241 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number" to i64), ptr %t2241
  %t2243 = or i64 %t2242, 4
  %t2244 = call i64 @rt_root(i64 %t2243)
  store i64 %t2244, ptr @"emit.internal:rd-number"
  ret i64 17
}

define i64 @"emit.internal:__init_54"() {
entry:
  %t2251 = call ptr @rt_alloc_words(i64 1)
  %t2252 = ptrtoint ptr %t2251 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number-reason?" to i64), ptr %t2251
  %t2253 = or i64 %t2252, 4
  %t2254 = call i64 @rt_root(i64 %t2253)
  store i64 %t2254, ptr @"emit.internal:rd-number-reason?"
  ret i64 17
}

define i64 @"emit.internal:__init_55"() {
entry:
  %t2283 = call ptr @rt_alloc_words(i64 1)
  %t2284 = ptrtoint ptr %t2283 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-char" to i64), ptr %t2283
  %t2285 = or i64 %t2284, 4
  %t2286 = call i64 @rt_root(i64 %t2285)
  store i64 %t2286, ptr @"emit.internal:rd-fold-char"
  ret i64 17
}

define i64 @"emit.internal:__init_56"() {
entry:
  %t2337 = call ptr @rt_alloc_words(i64 1)
  %t2338 = ptrtoint ptr %t2337 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-token" to i64), ptr %t2337
  %t2339 = or i64 %t2338, 4
  %t2340 = call i64 @rt_root(i64 %t2339)
  store i64 %t2340, ptr @"emit.internal:rd-fold-token"
  ret i64 17
}

define i64 @"emit.internal:__init_57"() {
entry:
  %t2397 = call ptr @rt_alloc_words(i64 1)
  %t2398 = ptrtoint ptr %t2397 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-atom" to i64), ptr %t2397
  %t2399 = or i64 %t2398, 4
  %t2400 = call i64 @rt_root(i64 %t2399)
  store i64 %t2400, ptr @"emit.internal:rd-atom"
  ret i64 17
}

define i64 @"emit.internal:__init_58"() {
entry:
  %t2444 = call ptr @rt_alloc_words(i64 1)
  %t2445 = ptrtoint ptr %t2444 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-at" to i64), ptr %t2444
  %t2446 = or i64 %t2445, 4
  %t2447 = call i64 @rt_root(i64 %t2446)
  store i64 %t2447, ptr @"emit.internal:rd-token-at"
  ret i64 17
}

define i64 @"emit.internal:__init_59"() {
entry:
  %t2525 = call ptr @rt_alloc_words(i64 1)
  %t2526 = ptrtoint ptr %t2525 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit" to i64), ptr %t2525
  %t2527 = or i64 %t2526, 4
  %t2528 = call i64 @rt_root(i64 %t2527)
  store i64 %t2528, ptr @"emit.internal:rd-hex-digit"
  ret i64 17
}

define i64 @"emit.internal:__init_60"() {
entry:
  %t2582 = call ptr @rt_alloc_words(i64 1)
  %t2583 = ptrtoint ptr %t2582 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit?" to i64), ptr %t2582
  %t2584 = or i64 %t2583, 4
  %t2585 = call i64 @rt_root(i64 %t2584)
  store i64 %t2585, ptr @"emit.internal:rd-hex-digit?"
  ret i64 17
}

define i64 @"emit.internal:__init_61"() {
entry:
  %t2653 = call ptr @rt_alloc_words(i64 1)
  %t2654 = ptrtoint ptr %t2653 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex" to i64), ptr %t2653
  %t2655 = or i64 %t2654, 4
  %t2656 = call i64 @rt_root(i64 %t2655)
  store i64 %t2656, ptr @"emit.internal:rd-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_62"() {
entry:
  %t2704 = call ptr @rt_alloc_words(i64 1)
  %t2705 = ptrtoint ptr %t2704 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-str-esc" to i64), ptr %t2704
  %t2706 = or i64 %t2705, 4
  %t2707 = call i64 @rt_root(i64 %t2706)
  store i64 %t2707, ptr @"emit.internal:rd-str-esc"
  ret i64 17
}

define i64 @"emit.internal:__init_63"() {
entry:
  %t2750 = call ptr @rt_alloc_words(i64 1)
  %t2751 = ptrtoint ptr %t2750 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-intraline" to i64), ptr %t2750
  %t2752 = or i64 %t2751, 4
  %t2753 = call i64 @rt_root(i64 %t2752)
  store i64 %t2753, ptr @"emit.internal:rd-intraline"
  ret i64 17
}

define i64 @"emit.internal:__init_64"() {
entry:
  %t2867 = call ptr @rt_alloc_words(i64 1)
  %t2868 = ptrtoint ptr %t2867 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-line-continuation" to i64), ptr %t2867
  %t2869 = or i64 %t2868, 4
  %t2870 = call i64 @rt_root(i64 %t2869)
  store i64 %t2870, ptr @"emit.internal:rd-line-continuation"
  ret i64 17
}

define i64 @"emit.internal:__init_65"() {
entry:
  %t3081 = call ptr @rt_alloc_words(i64 1)
  %t3082 = ptrtoint ptr %t3081 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-string" to i64), ptr %t3081
  %t3083 = or i64 %t3082, 4
  %t3084 = call i64 @rt_root(i64 %t3083)
  store i64 %t3084, ptr @"emit.internal:rd-string"
  ret i64 17
}

define i64 @"emit.internal:__init_66"() {
entry:
  %t3462 = call ptr @rt_alloc_words(i64 1)
  %t3463 = ptrtoint ptr %t3462 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hash" to i64), ptr %t3462
  %t3464 = or i64 %t3463, 4
  %t3465 = call i64 @rt_root(i64 %t3464)
  store i64 %t3465, ptr @"emit.internal:rd-hash"
  ret i64 17
}

define i64 @"emit.internal:__init_67"() {
entry:
  %t3519 = call ptr @rt_alloc_words(i64 1)
  %t3520 = ptrtoint ptr %t3519 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-name" to i64), ptr %t3519
  %t3521 = or i64 %t3520, 4
  %t3522 = call i64 @rt_root(i64 %t3521)
  store i64 %t3522, ptr @"emit.internal:rd-char-name"
  ret i64 17
}

define i64 @"emit.internal:__init_68"() {
entry:
  %t3599 = call ptr @rt_alloc_words(i64 1)
  %t3600 = ptrtoint ptr %t3599 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-hex" to i64), ptr %t3599
  %t3601 = or i64 %t3600, 4
  %t3602 = call i64 @rt_root(i64 %t3601)
  store i64 %t3602, ptr @"emit.internal:rd-char-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_69"() {
entry:
  %t3670 = call ptr @rt_alloc_words(i64 1)
  %t3671 = ptrtoint ptr %t3670 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char" to i64), ptr %t3670
  %t3672 = or i64 %t3671, 4
  %t3673 = call i64 @rt_root(i64 %t3672)
  store i64 %t3673, ptr @"emit.internal:rd-char"
  ret i64 17
}

define i64 @"emit.internal:__init_70"() {
entry:
  %t3842 = call ptr @rt_alloc_words(i64 1)
  %t3843 = ptrtoint ptr %t3842 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-bar" to i64), ptr %t3842
  %t3844 = or i64 %t3843, 4
  %t3845 = call i64 @rt_root(i64 %t3844)
  store i64 %t3845, ptr @"emit.internal:rd-bar"
  ret i64 17
}

define i64 @"emit.internal:__init_71"() {
entry:
  %t3877 = call ptr @rt_alloc_words(i64 1)
  %t3878 = ptrtoint ptr %t3877 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quote" to i64), ptr %t3877
  %t3879 = or i64 %t3878, 4
  %t3880 = call i64 @rt_root(i64 %t3879)
  store i64 %t3880, ptr @"emit.internal:rd-quote"
  ret i64 17
}

define i64 @"emit.internal:__init_72"() {
entry:
  %t3912 = call ptr @rt_alloc_words(i64 1)
  %t3913 = ptrtoint ptr %t3912 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quasi" to i64), ptr %t3912
  %t3914 = or i64 %t3913, 4
  %t3915 = call i64 @rt_root(i64 %t3914)
  store i64 %t3915, ptr @"emit.internal:rd-quasi"
  ret i64 17
}

define i64 @"emit.internal:__init_73"() {
entry:
  %t4004 = call ptr @rt_alloc_words(i64 1)
  %t4005 = ptrtoint ptr %t4004 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-unquote" to i64), ptr %t4004
  %t4006 = or i64 %t4005, 4
  %t4007 = call i64 @rt_root(i64 %t4006)
  store i64 %t4007, ptr @"emit.internal:rd-unquote"
  ret i64 17
}

define i64 @"emit.internal:__init_74"() {
entry:
  %t4048 = call ptr @rt_alloc_words(i64 1)
  %t4049 = ptrtoint ptr %t4048 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dot?" to i64), ptr %t4048
  %t4050 = or i64 %t4049, 4
  %t4051 = call i64 @rt_root(i64 %t4050)
  store i64 %t4051, ptr @"emit.internal:rd-dot?"
  ret i64 17
}

define i64 @"emit.internal:__init_75"() {
entry:
  %t4064 = call ptr @rt_alloc_words(i64 1)
  %t4065 = ptrtoint ptr %t4064 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-append-reverse" to i64), ptr %t4064
  %t4066 = or i64 %t4065, 4
  %t4067 = call i64 @rt_root(i64 %t4066)
  store i64 %t4067, ptr @"emit.internal:rd-append-reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_76"() {
entry:
  %t4112 = call ptr @rt_alloc_words(i64 1)
  %t4113 = ptrtoint ptr %t4112 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum-comment?" to i64), ptr %t4112
  %t4114 = or i64 %t4113, 4
  %t4115 = call i64 @rt_root(i64 %t4114)
  store i64 %t4115, ptr @"emit.internal:rd-datum-comment?"
  ret i64 17
}

define i64 @"emit.internal:__init_77"() {
entry:
  %t4337 = call ptr @rt_alloc_words(i64 1)
  %t4338 = ptrtoint ptr %t4337 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-list" to i64), ptr %t4337
  %t4339 = or i64 %t4338, 4
  %t4340 = call i64 @rt_root(i64 %t4339)
  store i64 %t4340, ptr @"emit.internal:rd-list"
  ret i64 17
}

define i64 @"emit.internal:__init_78"() {
entry:
  %t4593 = call ptr @rt_alloc_words(i64 1)
  %t4594 = ptrtoint ptr %t4593 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum" to i64), ptr %t4593
  %t4595 = or i64 %t4594, 4
  %t4596 = call i64 @rt_root(i64 %t4595)
  store i64 %t4596, ptr @"emit.internal:rd-datum"
  ret i64 17
}

define i64 @"emit.internal:__init_79"() {
entry:
  %t4597 = call i64 @rt_root(i64 1)
  store i64 %t4597, ptr @"emit.internal:%port-rtd-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_80"() {
entry:
  %t4606 = call ptr @rt_alloc_words(i64 1)
  %t4607 = ptrtoint ptr %t4606 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-rtd" to i64), ptr %t4606
  %t4608 = or i64 %t4607, 4
  %t4609 = call i64 @rt_root(i64 %t4608)
  store i64 %t4609, ptr @"emit.internal:%port-rtd"
  ret i64 17
}

define i64 @"emit.internal:__init_81"() {
entry:
  %t4624 = call ptr @rt_alloc_words(i64 1)
  %t4625 = ptrtoint ptr %t4624 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%make-port" to i64), ptr %t4624
  %t4626 = or i64 %t4625, 4
  %t4627 = call i64 @rt_root(i64 %t4626)
  store i64 %t4627, ptr @"emit.internal:%make-port"
  ret i64 17
}

define i64 @"emit.internal:__init_82"() {
entry:
  %t4633 = call ptr @rt_alloc_words(i64 1)
  %t4634 = ptrtoint ptr %t4633 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-buf" to i64), ptr %t4633
  %t4635 = or i64 %t4634, 4
  %t4636 = call i64 @rt_root(i64 %t4635)
  store i64 %t4636, ptr @"emit.internal:%port-buf"
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

