declare align 8 ptr @rt_alloc_words(i64)
declare i64 @rt_cons(i64, i64)
declare i64 @rt_car(i64)
declare i64 @rt_cdr(i64)
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
@.str.sym.11 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.12 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.13 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.14 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.15 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.16 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.17 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.18 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.19 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.20 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.21 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.sym.22 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.23 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.24 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.25 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.sym.26 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.lit.27 = private unnamed_addr constant [5 x i8] c"port\00"
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
@"emit.internal:rd-hex" = global i64 0
@"emit.internal:rd-str-esc" = global i64 0
@"emit.internal:rd-string" = global i64 0
@"emit.internal:rd-hash" = global i64 0
@"emit.internal:rd-char-name" = global i64 0
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
  %t889 = and i64 %t888, -8
  %t890 = inttoptr i64 %t889 to ptr
  %t891 = load i64, ptr %t890
  %t892 = inttoptr i64 %t891 to ptr
  %t893 = musttail call fastcc i64 %t892(i64 %t888, i64 5, i64 %a0, i64 %a1, i64 %t887, i64 %a3, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t893
else295:
  %t894 = load i64, ptr @"emit.internal:rd-fail-code"
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
  %t971 = and i64 %t970, -8
  %t972 = inttoptr i64 %t971 to ptr
  %t973 = load i64, ptr %t972
  %t974 = inttoptr i64 %t973 to ptr
  %t975 = call fastcc i64%t974(i64 %t970, i64 3, i64 %a0, i64 %a1, i64 %t969, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t976 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t977 = and i64 %t976, -8
  %t978 = inttoptr i64 %t977 to ptr
  %t979 = load i64, ptr %t978
  %t980 = inttoptr i64 %t979 to ptr
  %t981 = musttail call fastcc i64 %t980(i64 %t976, i64 3, i64 %a0, i64 %a1, i64 %t975, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t981
else372:
  %t982 = load i64, ptr @"emit.internal:rd-block-open?"
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
  %t998 = and i64 %t997, -8
  %t999 = inttoptr i64 %t998 to ptr
  %t1000 = load i64, ptr %t999
  %t1001 = inttoptr i64 %t1000 to ptr
  %t1002 = call fastcc i64%t1001(i64 %t997, i64 5, i64 %a0, i64 %a1, i64 %t996, i64 8, i64 %a2, i64 0, i64 0, i64 0, ptr null)
  %t1003 = load i64, ptr @"emit.internal:rd-fail?"
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
  %t1104 = and i64 %t1103, -8
  %t1105 = inttoptr i64 %t1104 to ptr
  %t1106 = load i64, ptr %t1105
  %t1107 = inttoptr i64 %t1106 to ptr
  %t1108 = call fastcc i64%t1107(i64 %t1103, i64 1, i64 %t1102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1109 = icmp ne i64 %t1108, 1
  br i1 %t1109, label %then414, label %else415
then414:
  %t1110 = load i64, ptr @"emit.internal:rd-all-digits?"
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
  %t1286 = and i64 %t1285, -8
  %t1287 = inttoptr i64 %t1286 to ptr
  %t1288 = load i64, ptr %t1287
  %t1289 = inttoptr i64 %t1288 to ptr
  %t1290 = musttail call fastcc i64 %t1289(i64 %t1285, i64 4, i64 %a0, i64 8, i64 %t1260, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1290
else481:
  %t1291 = load i64, ptr @"emit.internal:rd-digits"
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

define fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1584 = icmp eq i64 %argc, 1
  br i1 %t1584, label %argok608, label %arityerr607
arityerr607:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok608:
  %t1585 = call i64 @rt_make_string(ptr @.str.lit.0, i64 6)
  %t1586 = call i64 @rt_string_eq(i64 %a0, i64 %t1585)
  %t1587 = icmp ne i64 %t1586, 1
  br i1 %t1587, label %then609, label %else610
then609:
  %t1588 = call i64 @rt_make_string(ptr @.str.lit.1, i64 3)
  %t1589 = call i64 @rt_string_to_flonum(i64 %t1588)
  ret i64 %t1589
else610:
  %t1590 = call i64 @rt_make_string(ptr @.str.lit.2, i64 6)
  %t1591 = call i64 @rt_string_eq(i64 %a0, i64 %t1590)
  %t1592 = icmp ne i64 %t1591, 1
  br i1 %t1592, label %then611, label %else612
then611:
  %t1593 = call i64 @rt_make_string(ptr @.str.lit.3, i64 4)
  %t1594 = call i64 @rt_string_to_flonum(i64 %t1593)
  ret i64 %t1594
else612:
  %t1595 = call i64 @rt_make_string(ptr @.str.lit.4, i64 6)
  %t1596 = call i64 @rt_string_eq(i64 %a0, i64 %t1595)
  %t1597 = icmp ne i64 %t1596, 1
  br i1 %t1597, label %then613, label %else614
then613:
  %t1598 = call i64 @rt_make_string(ptr @.str.lit.5, i64 3)
  %t1599 = call i64 @rt_string_to_flonum(i64 %t1598)
  ret i64 %t1599
else614:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-radix-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1604 = icmp eq i64 %argc, 1
  br i1 %t1604, label %argok616, label %arityerr615
arityerr615:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok616:
  %t1605 = call i64 @rt_char_to_integer(i64 %a0)
  %t1606 = or i64 %t1605, 784
  %t1607 = and i64 %t1606, 7
  %t1608 = icmp eq i64 %t1607, 0
  br i1 %t1608, label %fixfast617, label %fixslow618
fixfast617:
  %t1609 = icmp eq i64 %t1605, 784
  %t1610 = select i1 %t1609, i64 257, i64 1
  br label %fixmerge619
fixslow618:
  %t1611 = call i64 @rt_num_eq(i64 %t1605, i64 784)
  br label %fixmerge619
fixmerge619:
  %t1612 = phi i64 [ %t1610, %fixfast617 ], [ %t1611, %fixslow618 ]
  %t1613 = icmp ne i64 %t1612, 1
  br i1 %t1613, label %then620, label %else621
then620:
  br label %merge622
else621:
  %t1614 = or i64 %t1605, 528
  %t1615 = and i64 %t1614, 7
  %t1616 = icmp eq i64 %t1615, 0
  br i1 %t1616, label %fixfast623, label %fixslow624
fixfast623:
  %t1617 = icmp eq i64 %t1605, 528
  %t1618 = select i1 %t1617, i64 257, i64 1
  br label %fixmerge625
fixslow624:
  %t1619 = call i64 @rt_num_eq(i64 %t1605, i64 528)
  br label %fixmerge625
fixmerge625:
  %t1620 = phi i64 [ %t1618, %fixfast623 ], [ %t1619, %fixslow624 ]
  br label %merge622
merge622:
  %t1621 = phi i64 [ %t1612, %then620 ], [ %t1620, %fixmerge625 ]
  %t1622 = icmp ne i64 %t1621, 1
  br i1 %t1622, label %then626, label %else627
then626:
  ret i64 16
else627:
  %t1623 = or i64 %t1605, 888
  %t1624 = and i64 %t1623, 7
  %t1625 = icmp eq i64 %t1624, 0
  br i1 %t1625, label %fixfast628, label %fixslow629
fixfast628:
  %t1626 = icmp eq i64 %t1605, 888
  %t1627 = select i1 %t1626, i64 257, i64 1
  br label %fixmerge630
fixslow629:
  %t1628 = call i64 @rt_num_eq(i64 %t1605, i64 888)
  br label %fixmerge630
fixmerge630:
  %t1629 = phi i64 [ %t1627, %fixfast628 ], [ %t1628, %fixslow629 ]
  %t1630 = icmp ne i64 %t1629, 1
  br i1 %t1630, label %then631, label %else632
then631:
  br label %merge633
else632:
  %t1631 = or i64 %t1605, 632
  %t1632 = and i64 %t1631, 7
  %t1633 = icmp eq i64 %t1632, 0
  br i1 %t1633, label %fixfast634, label %fixslow635
fixfast634:
  %t1634 = icmp eq i64 %t1605, 632
  %t1635 = select i1 %t1634, i64 257, i64 1
  br label %fixmerge636
fixslow635:
  %t1636 = call i64 @rt_num_eq(i64 %t1605, i64 632)
  br label %fixmerge636
fixmerge636:
  %t1637 = phi i64 [ %t1635, %fixfast634 ], [ %t1636, %fixslow635 ]
  br label %merge633
merge633:
  %t1638 = phi i64 [ %t1629, %then631 ], [ %t1637, %fixmerge636 ]
  %t1639 = icmp ne i64 %t1638, 1
  br i1 %t1639, label %then637, label %else638
then637:
  ret i64 64
else638:
  %t1640 = or i64 %t1605, 800
  %t1641 = and i64 %t1640, 7
  %t1642 = icmp eq i64 %t1641, 0
  br i1 %t1642, label %fixfast639, label %fixslow640
fixfast639:
  %t1643 = icmp eq i64 %t1605, 800
  %t1644 = select i1 %t1643, i64 257, i64 1
  br label %fixmerge641
fixslow640:
  %t1645 = call i64 @rt_num_eq(i64 %t1605, i64 800)
  br label %fixmerge641
fixmerge641:
  %t1646 = phi i64 [ %t1644, %fixfast639 ], [ %t1645, %fixslow640 ]
  %t1647 = icmp ne i64 %t1646, 1
  br i1 %t1647, label %then642, label %else643
then642:
  br label %merge644
else643:
  %t1648 = or i64 %t1605, 544
  %t1649 = and i64 %t1648, 7
  %t1650 = icmp eq i64 %t1649, 0
  br i1 %t1650, label %fixfast645, label %fixslow646
fixfast645:
  %t1651 = icmp eq i64 %t1605, 544
  %t1652 = select i1 %t1651, i64 257, i64 1
  br label %fixmerge647
fixslow646:
  %t1653 = call i64 @rt_num_eq(i64 %t1605, i64 544)
  br label %fixmerge647
fixmerge647:
  %t1654 = phi i64 [ %t1652, %fixfast645 ], [ %t1653, %fixslow646 ]
  br label %merge644
merge644:
  %t1655 = phi i64 [ %t1646, %then642 ], [ %t1654, %fixmerge647 ]
  %t1656 = icmp ne i64 %t1655, 1
  br i1 %t1656, label %then648, label %else649
then648:
  ret i64 80
else649:
  %t1657 = or i64 %t1605, 960
  %t1658 = and i64 %t1657, 7
  %t1659 = icmp eq i64 %t1658, 0
  br i1 %t1659, label %fixfast650, label %fixslow651
fixfast650:
  %t1660 = icmp eq i64 %t1605, 960
  %t1661 = select i1 %t1660, i64 257, i64 1
  br label %fixmerge652
fixslow651:
  %t1662 = call i64 @rt_num_eq(i64 %t1605, i64 960)
  br label %fixmerge652
fixmerge652:
  %t1663 = phi i64 [ %t1661, %fixfast650 ], [ %t1662, %fixslow651 ]
  %t1664 = icmp ne i64 %t1663, 1
  br i1 %t1664, label %then653, label %else654
then653:
  br label %merge655
else654:
  %t1665 = or i64 %t1605, 704
  %t1666 = and i64 %t1665, 7
  %t1667 = icmp eq i64 %t1666, 0
  br i1 %t1667, label %fixfast656, label %fixslow657
fixfast656:
  %t1668 = icmp eq i64 %t1605, 704
  %t1669 = select i1 %t1668, i64 257, i64 1
  br label %fixmerge658
fixslow657:
  %t1670 = call i64 @rt_num_eq(i64 %t1605, i64 704)
  br label %fixmerge658
fixmerge658:
  %t1671 = phi i64 [ %t1669, %fixfast656 ], [ %t1670, %fixslow657 ]
  br label %merge655
merge655:
  %t1672 = phi i64 [ %t1663, %then653 ], [ %t1671, %fixmerge658 ]
  %t1673 = icmp ne i64 %t1672, 1
  br i1 %t1673, label %then659, label %else660
then659:
  ret i64 128
else660:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-letter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1678 = icmp eq i64 %argc, 1
  br i1 %t1678, label %argok662, label %arityerr661
arityerr661:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok662:
  %t1679 = call i64 @rt_char_to_integer(i64 %a0)
  %t1680 = or i64 %t1679, 808
  %t1681 = and i64 %t1680, 7
  %t1682 = icmp eq i64 %t1681, 0
  br i1 %t1682, label %fixfast663, label %fixslow664
fixfast663:
  %t1683 = icmp eq i64 %t1679, 808
  %t1684 = select i1 %t1683, i64 257, i64 1
  br label %fixmerge665
fixslow664:
  %t1685 = call i64 @rt_num_eq(i64 %t1679, i64 808)
  br label %fixmerge665
fixmerge665:
  %t1686 = phi i64 [ %t1684, %fixfast663 ], [ %t1685, %fixslow664 ]
  %t1687 = icmp ne i64 %t1686, 1
  br i1 %t1687, label %then666, label %else667
then666:
  br label %merge668
else667:
  %t1688 = or i64 %t1679, 552
  %t1689 = and i64 %t1688, 7
  %t1690 = icmp eq i64 %t1689, 0
  br i1 %t1690, label %fixfast669, label %fixslow670
fixfast669:
  %t1691 = icmp eq i64 %t1679, 552
  %t1692 = select i1 %t1691, i64 257, i64 1
  br label %fixmerge671
fixslow670:
  %t1693 = call i64 @rt_num_eq(i64 %t1679, i64 552)
  br label %fixmerge671
fixmerge671:
  %t1694 = phi i64 [ %t1692, %fixfast669 ], [ %t1693, %fixslow670 ]
  br label %merge668
merge668:
  %t1695 = phi i64 [ %t1686, %then666 ], [ %t1694, %fixmerge671 ]
  %t1696 = icmp ne i64 %t1695, 1
  br i1 %t1696, label %then672, label %else673
then672:
  ret i64 8
else673:
  %t1697 = or i64 %t1679, 840
  %t1698 = and i64 %t1697, 7
  %t1699 = icmp eq i64 %t1698, 0
  br i1 %t1699, label %fixfast674, label %fixslow675
fixfast674:
  %t1700 = icmp eq i64 %t1679, 840
  %t1701 = select i1 %t1700, i64 257, i64 1
  br label %fixmerge676
fixslow675:
  %t1702 = call i64 @rt_num_eq(i64 %t1679, i64 840)
  br label %fixmerge676
fixmerge676:
  %t1703 = phi i64 [ %t1701, %fixfast674 ], [ %t1702, %fixslow675 ]
  %t1704 = icmp ne i64 %t1703, 1
  br i1 %t1704, label %then677, label %else678
then677:
  br label %merge679
else678:
  %t1705 = or i64 %t1679, 584
  %t1706 = and i64 %t1705, 7
  %t1707 = icmp eq i64 %t1706, 0
  br i1 %t1707, label %fixfast680, label %fixslow681
fixfast680:
  %t1708 = icmp eq i64 %t1679, 584
  %t1709 = select i1 %t1708, i64 257, i64 1
  br label %fixmerge682
fixslow681:
  %t1710 = call i64 @rt_num_eq(i64 %t1679, i64 584)
  br label %fixmerge682
fixmerge682:
  %t1711 = phi i64 [ %t1709, %fixfast680 ], [ %t1710, %fixslow681 ]
  br label %merge679
merge679:
  %t1712 = phi i64 [ %t1703, %then677 ], [ %t1711, %fixmerge682 ]
  %t1713 = icmp ne i64 %t1712, 1
  br i1 %t1713, label %then683, label %else684
then683:
  ret i64 16
else684:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-scan-prefixes"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1718 = icmp eq i64 %argc, 5
  br i1 %t1718, label %argok686, label %arityerr685
arityerr685:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok686:
  %t1719 = or i64 %a2, %a1
  %t1720 = and i64 %t1719, 7
  %t1721 = icmp eq i64 %t1720, 0
  br i1 %t1721, label %fixfast687, label %fixslow688
fixfast687:
  %t1722 = icmp slt i64 %a2, %a1
  %t1723 = select i1 %t1722, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t1724 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge689
fixmerge689:
  %t1725 = phi i64 [ %t1723, %fixfast687 ], [ %t1724, %fixslow688 ]
  %t1726 = icmp ne i64 %t1725, 1
  br i1 %t1726, label %then690, label %else691
then690:
  %t1727 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1728 = call i64 @rt_char_to_integer(i64 %t1727)
  %t1729 = or i64 %t1728, 280
  %t1730 = and i64 %t1729, 7
  %t1731 = icmp eq i64 %t1730, 0
  br i1 %t1731, label %fixfast693, label %fixslow694
fixfast693:
  %t1732 = icmp eq i64 %t1728, 280
  %t1733 = select i1 %t1732, i64 257, i64 1
  br label %fixmerge695
fixslow694:
  %t1734 = call i64 @rt_num_eq(i64 %t1728, i64 280)
  br label %fixmerge695
fixmerge695:
  %t1735 = phi i64 [ %t1733, %fixfast693 ], [ %t1734, %fixslow694 ]
  br label %merge692
else691:
  br label %merge692
merge692:
  %t1736 = phi i64 [ %t1735, %fixmerge695 ], [ 1, %else691 ]
  %t1737 = icmp ne i64 %t1736, 1
  br i1 %t1737, label %then696, label %else697
then696:
  %t1738 = or i64 %a2, 8
  %t1739 = and i64 %t1738, 7
  %t1740 = icmp eq i64 %t1739, 0
  br i1 %t1740, label %fixfast698, label %fixslow699
fixfast698:
  %t1741 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1742 = extractvalue {i64, i1} %t1741, 0
  %t1743 = extractvalue {i64, i1} %t1741, 1
  br i1 %t1743, label %fixslow699, label %fixmerge700
fixslow699:
  %t1744 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge700
fixmerge700:
  %t1745 = phi i64 [ %t1742, %fixfast698 ], [ %t1744, %fixslow699 ]
  %t1746 = or i64 %t1745, %a1
  %t1747 = and i64 %t1746, 7
  %t1748 = icmp eq i64 %t1747, 0
  br i1 %t1748, label %fixfast701, label %fixslow702
fixfast701:
  %t1749 = icmp slt i64 %t1745, %a1
  %t1750 = select i1 %t1749, i64 257, i64 1
  br label %fixmerge703
fixslow702:
  %t1751 = call i64 @rt_lt(i64 %t1745, i64 %a1)
  br label %fixmerge703
fixmerge703:
  %t1752 = phi i64 [ %t1750, %fixfast701 ], [ %t1751, %fixslow702 ]
  %t1753 = icmp ne i64 %t1752, 1
  br i1 %t1753, label %then704, label %else705
then704:
  %t1754 = or i64 %a2, 8
  %t1755 = and i64 %t1754, 7
  %t1756 = icmp eq i64 %t1755, 0
  br i1 %t1756, label %fixfast706, label %fixslow707
fixfast706:
  %t1757 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1758 = extractvalue {i64, i1} %t1757, 0
  %t1759 = extractvalue {i64, i1} %t1757, 1
  br i1 %t1759, label %fixslow707, label %fixmerge708
fixslow707:
  %t1760 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge708
fixmerge708:
  %t1761 = phi i64 [ %t1758, %fixfast706 ], [ %t1760, %fixslow707 ]
  %t1762 = call i64 @rt_string_ref(i64 %a0, i64 %t1761)
  %t1763 = load i64, ptr @"emit.internal:rd-radix-letter"
  %t1764 = and i64 %t1763, -8
  %t1765 = inttoptr i64 %t1764 to ptr
  %t1766 = load i64, ptr %t1765
  %t1767 = inttoptr i64 %t1766 to ptr
  %t1768 = call fastcc i64%t1767(i64 %t1763, i64 1, i64 %t1762, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1769 = icmp ne i64 %t1768, 1
  br i1 %t1769, label %then709, label %else710
then709:
  %t1770 = icmp ne i64 %a3, 1
  br i1 %t1770, label %then711, label %else712
then711:
  ret i64 1
else712:
  %t1771 = or i64 %a2, 16
  %t1772 = and i64 %t1771, 7
  %t1773 = icmp eq i64 %t1772, 0
  br i1 %t1773, label %fixfast713, label %fixslow714
fixfast713:
  %t1774 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1775 = extractvalue {i64, i1} %t1774, 0
  %t1776 = extractvalue {i64, i1} %t1774, 1
  br i1 %t1776, label %fixslow714, label %fixmerge715
fixslow714:
  %t1777 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge715
fixmerge715:
  %t1778 = phi i64 [ %t1775, %fixfast713 ], [ %t1777, %fixslow714 ]
  %t1779 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  %t1780 = and i64 %t1779, -8
  %t1781 = inttoptr i64 %t1780 to ptr
  %t1782 = load i64, ptr %t1781
  %t1783 = inttoptr i64 %t1782 to ptr
  %t1784 = musttail call fastcc i64 %t1783(i64 %t1779, i64 5, i64 %a0, i64 %a1, i64 %t1778, i64 %t1768, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1784
else710:
  %t1785 = or i64 %a2, 8
  %t1786 = and i64 %t1785, 7
  %t1787 = icmp eq i64 %t1786, 0
  br i1 %t1787, label %fixfast716, label %fixslow717
fixfast716:
  %t1788 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1789 = extractvalue {i64, i1} %t1788, 0
  %t1790 = extractvalue {i64, i1} %t1788, 1
  br i1 %t1790, label %fixslow717, label %fixmerge718
fixslow717:
  %t1791 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge718
fixmerge718:
  %t1792 = phi i64 [ %t1789, %fixfast716 ], [ %t1791, %fixslow717 ]
  %t1793 = call i64 @rt_string_ref(i64 %a0, i64 %t1792)
  %t1794 = load i64, ptr @"emit.internal:rd-exactness-letter"
  %t1795 = and i64 %t1794, -8
  %t1796 = inttoptr i64 %t1795 to ptr
  %t1797 = load i64, ptr %t1796
  %t1798 = inttoptr i64 %t1797 to ptr
  %t1799 = call fastcc i64%t1798(i64 %t1794, i64 1, i64 %t1793, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1800 = icmp ne i64 %t1799, 1
  br i1 %t1800, label %then719, label %else720
then719:
  %t1801 = icmp ne i64 %a4, 1
  br i1 %t1801, label %then721, label %else722
then721:
  ret i64 1
else722:
  %t1802 = or i64 %a2, 16
  %t1803 = and i64 %t1802, 7
  %t1804 = icmp eq i64 %t1803, 0
  br i1 %t1804, label %fixfast723, label %fixslow724
fixfast723:
  %t1805 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1806 = extractvalue {i64, i1} %t1805, 0
  %t1807 = extractvalue {i64, i1} %t1805, 1
  br i1 %t1807, label %fixslow724, label %fixmerge725
fixslow724:
  %t1808 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge725
fixmerge725:
  %t1809 = phi i64 [ %t1806, %fixfast723 ], [ %t1808, %fixslow724 ]
  %t1810 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  %t1811 = and i64 %t1810, -8
  %t1812 = inttoptr i64 %t1811 to ptr
  %t1813 = load i64, ptr %t1812
  %t1814 = inttoptr i64 %t1813 to ptr
  %t1815 = musttail call fastcc i64 %t1814(i64 %t1810, i64 5, i64 %a0, i64 %a1, i64 %t1809, i64 %a3, i64 %t1799, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1815
else720:
  ret i64 1
else705:
  ret i64 1
else697:
  %t1816 = call i64 @rt_cons(i64 %a4, i64 %a2)
  %t1817 = call i64 @rt_cons(i64 %a3, i64 %t1816)
  ret i64 %t1817
}

define fastcc i64 @"emit.internal:code:rd-radix-scan"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1822 = icmp eq i64 %argc, 4
  br i1 %t1822, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok727:
  %t1823 = or i64 %a2, %a1
  %t1824 = and i64 %t1823, 7
  %t1825 = icmp eq i64 %t1824, 0
  br i1 %t1825, label %fixfast728, label %fixslow729
fixfast728:
  %t1826 = icmp slt i64 %a2, %a1
  %t1827 = select i1 %t1826, i64 257, i64 1
  br label %fixmerge730
fixslow729:
  %t1828 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge730
fixmerge730:
  %t1829 = phi i64 [ %t1827, %fixfast728 ], [ %t1828, %fixslow729 ]
  %t1830 = icmp ne i64 %t1829, 1
  br i1 %t1830, label %then731, label %else732
then731:
  %t1831 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1832 = load i64, ptr @"emit.internal:%digit-in-radix"
  %t1833 = and i64 %t1832, -8
  %t1834 = inttoptr i64 %t1833 to ptr
  %t1835 = load i64, ptr %t1834
  %t1836 = inttoptr i64 %t1835 to ptr
  %t1837 = call fastcc i64%t1836(i64 %t1832, i64 2, i64 %t1831, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge733
else732:
  br label %merge733
merge733:
  %t1838 = phi i64 [ %t1837, %then731 ], [ 1, %else732 ]
  %t1839 = icmp ne i64 %t1838, 1
  br i1 %t1839, label %then734, label %else735
then734:
  %t1840 = or i64 %a2, 8
  %t1841 = and i64 %t1840, 7
  %t1842 = icmp eq i64 %t1841, 0
  br i1 %t1842, label %fixfast736, label %fixslow737
fixfast736:
  %t1843 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1844 = extractvalue {i64, i1} %t1843, 0
  %t1845 = extractvalue {i64, i1} %t1843, 1
  br i1 %t1845, label %fixslow737, label %fixmerge738
fixslow737:
  %t1846 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge738
fixmerge738:
  %t1847 = phi i64 [ %t1844, %fixfast736 ], [ %t1846, %fixslow737 ]
  %t1848 = load i64, ptr @"emit.internal:rd-radix-scan"
  %t1849 = and i64 %t1848, -8
  %t1850 = inttoptr i64 %t1849 to ptr
  %t1851 = load i64, ptr %t1850
  %t1852 = inttoptr i64 %t1851 to ptr
  %t1853 = musttail call fastcc i64 %t1852(i64 %t1848, i64 4, i64 %a0, i64 %a1, i64 %t1847, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1853
else735:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-rational-body?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1858 = icmp eq i64 %argc, 4
  br i1 %t1858, label %argok740, label %arityerr739
arityerr739:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok740:
  %t1859 = or i64 %a2, %a1
  %t1860 = and i64 %t1859, 7
  %t1861 = icmp eq i64 %t1860, 0
  br i1 %t1861, label %fixfast741, label %fixslow742
fixfast741:
  %t1862 = icmp slt i64 %a2, %a1
  %t1863 = select i1 %t1862, i64 257, i64 1
  br label %fixmerge743
fixslow742:
  %t1864 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge743
fixmerge743:
  %t1865 = phi i64 [ %t1863, %fixfast741 ], [ %t1864, %fixslow742 ]
  %t1866 = icmp ne i64 %t1865, 1
  br i1 %t1866, label %then744, label %else745
then744:
  %t1867 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1868 = load i64, ptr @"emit.internal:rd-sign-char?"
  %t1869 = and i64 %t1868, -8
  %t1870 = inttoptr i64 %t1869 to ptr
  %t1871 = load i64, ptr %t1870
  %t1872 = inttoptr i64 %t1871 to ptr
  %t1873 = call fastcc i64%t1872(i64 %t1868, i64 1, i64 %t1867, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge746
else745:
  br label %merge746
merge746:
  %t1874 = phi i64 [ %t1873, %then744 ], [ 1, %else745 ]
  %t1875 = icmp ne i64 %t1874, 1
  br i1 %t1875, label %then747, label %else748
then747:
  %t1876 = or i64 %a2, 8
  %t1877 = and i64 %t1876, 7
  %t1878 = icmp eq i64 %t1877, 0
  br i1 %t1878, label %fixfast750, label %fixslow751
fixfast750:
  %t1879 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1880 = extractvalue {i64, i1} %t1879, 0
  %t1881 = extractvalue {i64, i1} %t1879, 1
  br i1 %t1881, label %fixslow751, label %fixmerge752
fixslow751:
  %t1882 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge752
fixmerge752:
  %t1883 = phi i64 [ %t1880, %fixfast750 ], [ %t1882, %fixslow751 ]
  br label %merge749
else748:
  br label %merge749
merge749:
  %t1884 = phi i64 [ %t1883, %fixmerge752 ], [ %a2, %else748 ]
  %t1885 = load i64, ptr @"emit.internal:rd-radix-scan"
  %t1886 = and i64 %t1885, -8
  %t1887 = inttoptr i64 %t1886 to ptr
  %t1888 = load i64, ptr %t1887
  %t1889 = inttoptr i64 %t1888 to ptr
  %t1890 = call fastcc i64%t1889(i64 %t1885, i64 4, i64 %a0, i64 %a1, i64 %t1884, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1891 = or i64 %t1884, %t1890
  %t1892 = and i64 %t1891, 7
  %t1893 = icmp eq i64 %t1892, 0
  br i1 %t1893, label %fixfast753, label %fixslow754
fixfast753:
  %t1894 = icmp slt i64 %t1884, %t1890
  %t1895 = select i1 %t1894, i64 257, i64 1
  br label %fixmerge755
fixslow754:
  %t1896 = call i64 @rt_lt(i64 %t1884, i64 %t1890)
  br label %fixmerge755
fixmerge755:
  %t1897 = phi i64 [ %t1895, %fixfast753 ], [ %t1896, %fixslow754 ]
  %t1898 = icmp ne i64 %t1897, 1
  br i1 %t1898, label %then756, label %else757
then756:
  %t1899 = or i64 %t1890, %a1
  %t1900 = and i64 %t1899, 7
  %t1901 = icmp eq i64 %t1900, 0
  br i1 %t1901, label %fixfast758, label %fixslow759
fixfast758:
  %t1902 = icmp slt i64 %t1890, %a1
  %t1903 = select i1 %t1902, i64 257, i64 1
  br label %fixmerge760
fixslow759:
  %t1904 = call i64 @rt_lt(i64 %t1890, i64 %a1)
  br label %fixmerge760
fixmerge760:
  %t1905 = phi i64 [ %t1903, %fixfast758 ], [ %t1904, %fixslow759 ]
  %t1906 = icmp ne i64 %t1905, 1
  br i1 %t1906, label %then761, label %else762
then761:
  %t1907 = call i64 @rt_string_ref(i64 %a0, i64 %t1890)
  %t1908 = call i64 @rt_char_to_integer(i64 %t1907)
  %t1909 = or i64 %t1908, 376
  %t1910 = and i64 %t1909, 7
  %t1911 = icmp eq i64 %t1910, 0
  br i1 %t1911, label %fixfast763, label %fixslow764
fixfast763:
  %t1912 = icmp eq i64 %t1908, 376
  %t1913 = select i1 %t1912, i64 257, i64 1
  br label %fixmerge765
fixslow764:
  %t1914 = call i64 @rt_num_eq(i64 %t1908, i64 376)
  br label %fixmerge765
fixmerge765:
  %t1915 = phi i64 [ %t1913, %fixfast763 ], [ %t1914, %fixslow764 ]
  %t1916 = icmp ne i64 %t1915, 1
  br i1 %t1916, label %then766, label %else767
then766:
  %t1917 = or i64 %t1890, 8
  %t1918 = and i64 %t1917, 7
  %t1919 = icmp eq i64 %t1918, 0
  br i1 %t1919, label %fixfast768, label %fixslow769
fixfast768:
  %t1920 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1890, i64 8)
  %t1921 = extractvalue {i64, i1} %t1920, 0
  %t1922 = extractvalue {i64, i1} %t1920, 1
  br i1 %t1922, label %fixslow769, label %fixmerge770
fixslow769:
  %t1923 = call i64 @rt_add(i64 %t1890, i64 8)
  br label %fixmerge770
fixmerge770:
  %t1924 = phi i64 [ %t1921, %fixfast768 ], [ %t1923, %fixslow769 ]
  %t1925 = load i64, ptr @"emit.internal:rd-radix-scan"
  %t1926 = and i64 %t1925, -8
  %t1927 = inttoptr i64 %t1926 to ptr
  %t1928 = load i64, ptr %t1927
  %t1929 = inttoptr i64 %t1928 to ptr
  %t1930 = call fastcc i64%t1929(i64 %t1925, i64 4, i64 %a0, i64 %a1, i64 %t1924, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1931 = or i64 %t1890, 8
  %t1932 = and i64 %t1931, 7
  %t1933 = icmp eq i64 %t1932, 0
  br i1 %t1933, label %fixfast771, label %fixslow772
fixfast771:
  %t1934 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1890, i64 8)
  %t1935 = extractvalue {i64, i1} %t1934, 0
  %t1936 = extractvalue {i64, i1} %t1934, 1
  br i1 %t1936, label %fixslow772, label %fixmerge773
fixslow772:
  %t1937 = call i64 @rt_add(i64 %t1890, i64 8)
  br label %fixmerge773
fixmerge773:
  %t1938 = phi i64 [ %t1935, %fixfast771 ], [ %t1937, %fixslow772 ]
  %t1939 = or i64 %t1938, %t1930
  %t1940 = and i64 %t1939, 7
  %t1941 = icmp eq i64 %t1940, 0
  br i1 %t1941, label %fixfast774, label %fixslow775
fixfast774:
  %t1942 = icmp slt i64 %t1938, %t1930
  %t1943 = select i1 %t1942, i64 257, i64 1
  br label %fixmerge776
fixslow775:
  %t1944 = call i64 @rt_lt(i64 %t1938, i64 %t1930)
  br label %fixmerge776
fixmerge776:
  %t1945 = phi i64 [ %t1943, %fixfast774 ], [ %t1944, %fixslow775 ]
  %t1946 = icmp ne i64 %t1945, 1
  br i1 %t1946, label %then777, label %else778
then777:
  %t1947 = or i64 %t1930, %a1
  %t1948 = and i64 %t1947, 7
  %t1949 = icmp eq i64 %t1948, 0
  br i1 %t1949, label %fixfast779, label %fixslow780
fixfast779:
  %t1950 = icmp eq i64 %t1930, %a1
  %t1951 = select i1 %t1950, i64 257, i64 1
  br label %fixmerge781
fixslow780:
  %t1952 = call i64 @rt_num_eq(i64 %t1930, i64 %a1)
  br label %fixmerge781
fixmerge781:
  %t1953 = phi i64 [ %t1951, %fixfast779 ], [ %t1952, %fixslow780 ]
  ret i64 %t1953
else778:
  ret i64 1
else767:
  ret i64 1
else762:
  ret i64 1
else757:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-exactness-apply"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1958 = icmp eq i64 %argc, 2
  br i1 %t1958, label %argok783, label %arityerr782
arityerr782:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok783:
  %t1959 = call i64 @rt_not(i64 %a1)
  %t1960 = icmp ne i64 %t1959, 1
  br i1 %t1960, label %then784, label %else785
then784:
  ret i64 %a0
else785:
  %t1961 = or i64 %a1, 16
  %t1962 = and i64 %t1961, 7
  %t1963 = icmp eq i64 %t1962, 0
  br i1 %t1963, label %fixfast786, label %fixslow787
fixfast786:
  %t1964 = icmp eq i64 %a1, 16
  %t1965 = select i1 %t1964, i64 257, i64 1
  br label %fixmerge788
fixslow787:
  %t1966 = call i64 @rt_num_eq(i64 %a1, i64 16)
  br label %fixmerge788
fixmerge788:
  %t1967 = phi i64 [ %t1965, %fixfast786 ], [ %t1966, %fixslow787 ]
  %t1968 = icmp ne i64 %t1967, 1
  br i1 %t1968, label %then789, label %else790
then789:
  %t1969 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1969
else790:
  %t1970 = call i64 @rt_exact_p(i64 %a0)
  %t1971 = icmp ne i64 %t1970, 1
  br i1 %t1971, label %then791, label %else792
then791:
  ret i64 %a0
else792:
  %t1972 = call i64 @rt_flo_truncate(i64 %a0)
  %t1973 = or i64 %a0, %t1972
  %t1974 = and i64 %t1973, 7
  %t1975 = icmp eq i64 %t1974, 0
  br i1 %t1975, label %fixfast793, label %fixslow794
fixfast793:
  %t1976 = icmp eq i64 %a0, %t1972
  %t1977 = select i1 %t1976, i64 257, i64 1
  br label %fixmerge795
fixslow794:
  %t1978 = call i64 @rt_num_eq(i64 %a0, i64 %t1972)
  br label %fixmerge795
fixmerge795:
  %t1979 = phi i64 [ %t1977, %fixfast793 ], [ %t1978, %fixslow794 ]
  %t1980 = icmp ne i64 %t1979, 1
  br i1 %t1980, label %then796, label %else797
then796:
  %t1981 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1981
else797:
  %t1982 = call i64 @rt_intern(ptr @.str.sym.6)
  ret i64 %t1982
}

define fastcc i64 @"emit.internal:code:rd-body-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1987 = icmp eq i64 %argc, 3
  br i1 %t1987, label %argok799, label %arityerr798
arityerr798:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok799:
  %t1988 = or i64 %a1, 80
  %t1989 = and i64 %t1988, 7
  %t1990 = icmp eq i64 %t1989, 0
  br i1 %t1990, label %fixfast800, label %fixslow801
fixfast800:
  %t1991 = icmp eq i64 %a1, 80
  %t1992 = select i1 %t1991, i64 257, i64 1
  br label %fixmerge802
fixslow801:
  %t1993 = call i64 @rt_num_eq(i64 %a1, i64 80)
  br label %fixmerge802
fixmerge802:
  %t1994 = phi i64 [ %t1992, %fixfast800 ], [ %t1993, %fixslow801 ]
  %t1995 = icmp ne i64 %t1994, 1
  br i1 %t1995, label %then803, label %else804
then803:
  %t1996 = load i64, ptr @"emit.internal:rd-numeric?"
  %t1997 = and i64 %t1996, -8
  %t1998 = inttoptr i64 %t1997 to ptr
  %t1999 = load i64, ptr %t1998
  %t2000 = inttoptr i64 %t1999 to ptr
  %t2001 = call fastcc i64%t2000(i64 %t1996, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2002 = icmp ne i64 %t2001, 1
  br i1 %t2002, label %then805, label %else806
then805:
  %t2003 = load i64, ptr @"emit.internal:rd-parse-int"
  %t2004 = and i64 %t2003, -8
  %t2005 = inttoptr i64 %t2004 to ptr
  %t2006 = load i64, ptr %t2005
  %t2007 = inttoptr i64 %t2006 to ptr
  %t2008 = call fastcc i64%t2007(i64 %t2003, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2009 = load i64, ptr @"emit.internal:rd-exactness-apply"
  %t2010 = and i64 %t2009, -8
  %t2011 = inttoptr i64 %t2010 to ptr
  %t2012 = load i64, ptr %t2011
  %t2013 = inttoptr i64 %t2012 to ptr
  %t2014 = musttail call fastcc i64 %t2013(i64 %t2009, i64 2, i64 %t2008, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2014
else806:
  %t2015 = load i64, ptr @"emit.internal:rd-flonum?"
  %t2016 = and i64 %t2015, -8
  %t2017 = inttoptr i64 %t2016 to ptr
  %t2018 = load i64, ptr %t2017
  %t2019 = inttoptr i64 %t2018 to ptr
  %t2020 = call fastcc i64%t2019(i64 %t2015, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2021 = icmp ne i64 %t2020, 1
  br i1 %t2021, label %then807, label %else808
then807:
  %t2022 = call i64 @rt_string_to_flonum(i64 %a0)
  %t2023 = load i64, ptr @"emit.internal:rd-exactness-apply"
  %t2024 = and i64 %t2023, -8
  %t2025 = inttoptr i64 %t2024 to ptr
  %t2026 = load i64, ptr %t2025
  %t2027 = inttoptr i64 %t2026 to ptr
  %t2028 = musttail call fastcc i64 %t2027(i64 %t2023, i64 2, i64 %t2022, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2028
else808:
  %t2029 = load i64, ptr @"emit.internal:rd-nonfinite"
  %t2030 = and i64 %t2029, -8
  %t2031 = inttoptr i64 %t2030 to ptr
  %t2032 = load i64, ptr %t2031
  %t2033 = inttoptr i64 %t2032 to ptr
  %t2034 = call fastcc i64%t2033(i64 %t2029, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2035 = call i64 @rt_not(i64 %t2034)
  %t2036 = icmp ne i64 %t2035, 1
  br i1 %t2036, label %then809, label %else810
then809:
  %t2037 = call i64 @rt_intern(ptr @.str.sym.7)
  ret i64 %t2037
else810:
  %t2038 = icmp ne i64 %a2, 1
  br i1 %t2038, label %then811, label %else812
then811:
  %t2039 = or i64 %a2, 8
  %t2040 = and i64 %t2039, 7
  %t2041 = icmp eq i64 %t2040, 0
  br i1 %t2041, label %fixfast814, label %fixslow815
fixfast814:
  %t2042 = icmp eq i64 %a2, 8
  %t2043 = select i1 %t2042, i64 257, i64 1
  br label %fixmerge816
fixslow815:
  %t2044 = call i64 @rt_num_eq(i64 %a2, i64 8)
  br label %fixmerge816
fixmerge816:
  %t2045 = phi i64 [ %t2043, %fixfast814 ], [ %t2044, %fixslow815 ]
  br label %merge813
else812:
  br label %merge813
merge813:
  %t2046 = phi i64 [ %t2045, %fixmerge816 ], [ 1, %else812 ]
  %t2047 = icmp ne i64 %t2046, 1
  br i1 %t2047, label %then817, label %else818
then817:
  %t2048 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2048
else818:
  %t2049 = load i64, ptr @"emit.internal:rd-exactness-apply"
  %t2050 = and i64 %t2049, -8
  %t2051 = inttoptr i64 %t2050 to ptr
  %t2052 = load i64, ptr %t2051
  %t2053 = inttoptr i64 %t2052 to ptr
  %t2054 = musttail call fastcc i64 %t2053(i64 %t2049, i64 2, i64 %t2034, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2054
else804:
  %t2055 = load i64, ptr @"emit.internal:%string->int"
  %t2056 = and i64 %t2055, -8
  %t2057 = inttoptr i64 %t2056 to ptr
  %t2058 = load i64, ptr %t2057
  %t2059 = inttoptr i64 %t2058 to ptr
  %t2060 = call fastcc i64%t2059(i64 %t2055, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2061 = icmp ne i64 %t2060, 1
  br i1 %t2061, label %then819, label %else820
then819:
  %t2062 = load i64, ptr @"emit.internal:rd-exactness-apply"
  %t2063 = and i64 %t2062, -8
  %t2064 = inttoptr i64 %t2063 to ptr
  %t2065 = load i64, ptr %t2064
  %t2066 = inttoptr i64 %t2065 to ptr
  %t2067 = musttail call fastcc i64 %t2066(i64 %t2062, i64 2, i64 %t2060, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2067
else820:
  %t2068 = call i64 @rt_intern(ptr @.str.sym.7)
  ret i64 %t2068
}

define fastcc i64 @"emit.internal:code:rd-number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2073 = icmp eq i64 %argc, 2
  br i1 %t2073, label %argok822, label %arityerr821
arityerr821:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok822:
  %t2074 = call i64 @rt_string_length(i64 %a0)
  %t2075 = or i64 0, %t2074
  %t2076 = and i64 %t2075, 7
  %t2077 = icmp eq i64 %t2076, 0
  br i1 %t2077, label %fixfast823, label %fixslow824
fixfast823:
  %t2078 = icmp slt i64 0, %t2074
  %t2079 = select i1 %t2078, i64 257, i64 1
  br label %fixmerge825
fixslow824:
  %t2080 = call i64 @rt_lt(i64 0, i64 %t2074)
  br label %fixmerge825
fixmerge825:
  %t2081 = phi i64 [ %t2079, %fixfast823 ], [ %t2080, %fixslow824 ]
  %t2082 = icmp ne i64 %t2081, 1
  br i1 %t2082, label %then826, label %else827
then826:
  %t2083 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2084 = call i64 @rt_char_to_integer(i64 %t2083)
  %t2085 = or i64 %t2084, 280
  %t2086 = and i64 %t2085, 7
  %t2087 = icmp eq i64 %t2086, 0
  br i1 %t2087, label %fixfast829, label %fixslow830
fixfast829:
  %t2088 = icmp eq i64 %t2084, 280
  %t2089 = select i1 %t2088, i64 257, i64 1
  br label %fixmerge831
fixslow830:
  %t2090 = call i64 @rt_num_eq(i64 %t2084, i64 280)
  br label %fixmerge831
fixmerge831:
  %t2091 = phi i64 [ %t2089, %fixfast829 ], [ %t2090, %fixslow830 ]
  br label %merge828
else827:
  br label %merge828
merge828:
  %t2092 = phi i64 [ %t2091, %fixmerge831 ], [ 1, %else827 ]
  %t2093 = icmp ne i64 %t2092, 1
  br i1 %t2093, label %then832, label %else833
then832:
  %t2094 = load i64, ptr @"emit.internal:rd-scan-prefixes"
  %t2095 = and i64 %t2094, -8
  %t2096 = inttoptr i64 %t2095 to ptr
  %t2097 = load i64, ptr %t2096
  %t2098 = inttoptr i64 %t2097 to ptr
  %t2099 = call fastcc i64%t2098(i64 %t2094, i64 5, i64 %a0, i64 %t2074, i64 0, i64 1, i64 1, i64 0, i64 0, i64 0, ptr null)
  %t2100 = call i64 @rt_not(i64 %t2099)
  %t2101 = icmp ne i64 %t2100, 1
  br i1 %t2101, label %then834, label %else835
then834:
  %t2102 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2102
else835:
  %t2103 = call i64 @rt_car(i64 %t2099)
  %t2104 = icmp ne i64 %t2103, 1
  br i1 %t2104, label %then836, label %else837
then836:
  %t2105 = call i64 @rt_car(i64 %t2099)
  br label %merge838
else837:
  br label %merge838
merge838:
  %t2106 = phi i64 [ %t2105, %then836 ], [ %a1, %else837 ]
  %t2107 = load i64, ptr @"emit.internal:cadr"
  %t2108 = and i64 %t2107, -8
  %t2109 = inttoptr i64 %t2108 to ptr
  %t2110 = load i64, ptr %t2109
  %t2111 = inttoptr i64 %t2110 to ptr
  %t2112 = call fastcc i64%t2111(i64 %t2107, i64 1, i64 %t2099, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2113 = load i64, ptr @"emit.internal:cddr"
  %t2114 = and i64 %t2113, -8
  %t2115 = inttoptr i64 %t2114 to ptr
  %t2116 = load i64, ptr %t2115
  %t2117 = inttoptr i64 %t2116 to ptr
  %t2118 = call fastcc i64%t2117(i64 %t2113, i64 1, i64 %t2099, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2119 = call i64 @rt_substring(i64 %a0, i64 %t2118, i64 %t2074)
  %t2120 = load i64, ptr @"emit.internal:rd-body-number"
  %t2121 = and i64 %t2120, -8
  %t2122 = inttoptr i64 %t2121 to ptr
  %t2123 = load i64, ptr %t2122
  %t2124 = inttoptr i64 %t2123 to ptr
  %t2125 = call fastcc i64%t2124(i64 %t2120, i64 3, i64 %t2119, i64 %t2106, i64 %t2112, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2126 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2127 = call i64 @rt_eq_p(i64 %t2125, i64 %t2126)
  %t2128 = icmp ne i64 %t2127, 1
  br i1 %t2128, label %then839, label %else840
then839:
  %t2129 = load i64, ptr @"emit.internal:rd-rational-body?"
  %t2130 = and i64 %t2129, -8
  %t2131 = inttoptr i64 %t2130 to ptr
  %t2132 = load i64, ptr %t2131
  %t2133 = inttoptr i64 %t2132 to ptr
  %t2134 = call fastcc i64%t2133(i64 %t2129, i64 4, i64 %a0, i64 %t2074, i64 %t2118, i64 %t2106, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2135 = icmp ne i64 %t2134, 1
  br i1 %t2135, label %then841, label %else842
then841:
  %t2136 = call i64 @rt_intern(ptr @.str.sym.6)
  ret i64 %t2136
else842:
  %t2137 = call i64 @rt_intern(ptr @.str.sym.8)
  ret i64 %t2137
else840:
  ret i64 %t2125
else833:
  %t2138 = load i64, ptr @"emit.internal:rd-body-number"
  %t2139 = and i64 %t2138, -8
  %t2140 = inttoptr i64 %t2139 to ptr
  %t2141 = load i64, ptr %t2140
  %t2142 = inttoptr i64 %t2141 to ptr
  %t2143 = call fastcc i64%t2142(i64 %t2138, i64 3, i64 %a0, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2144 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2145 = call i64 @rt_eq_p(i64 %t2143, i64 %t2144)
  %t2146 = icmp ne i64 %t2145, 1
  br i1 %t2146, label %then843, label %else844
then843:
  %t2147 = load i64, ptr @"emit.internal:rd-rational-body?"
  %t2148 = and i64 %t2147, -8
  %t2149 = inttoptr i64 %t2148 to ptr
  %t2150 = load i64, ptr %t2149
  %t2151 = inttoptr i64 %t2150 to ptr
  %t2152 = call fastcc i64%t2151(i64 %t2147, i64 4, i64 %a0, i64 %t2074, i64 0, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2153 = icmp ne i64 %t2152, 1
  br i1 %t2153, label %then845, label %else846
then845:
  %t2154 = call i64 @rt_intern(ptr @.str.sym.6)
  ret i64 %t2154
else846:
  ret i64 %t2143
else844:
  ret i64 %t2143
}

define fastcc i64 @"emit.internal:code:rd-number-reason?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2159 = icmp eq i64 %argc, 1
  br i1 %t2159, label %argok848, label %arityerr847
arityerr847:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok848:
  %t2160 = call i64 @rt_intern(ptr @.str.sym.6)
  %t2161 = call i64 @rt_eq_p(i64 %a0, i64 %t2160)
  %t2162 = icmp ne i64 %t2161, 1
  br i1 %t2162, label %then849, label %else850
then849:
  ret i64 %t2161
else850:
  %t2163 = call i64 @rt_intern(ptr @.str.sym.8)
  %t2164 = call i64 @rt_eq_p(i64 %a0, i64 %t2163)
  ret i64 %t2164
}

define fastcc i64 @"emit.internal:code:rd-fold-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2169 = icmp eq i64 %argc, 1
  br i1 %t2169, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok852:
  %t2170 = call i64 @rt_char_to_integer(i64 %a0)
  %t2171 = or i64 512, %t2170
  %t2172 = and i64 %t2171, 7
  %t2173 = icmp eq i64 %t2172, 0
  br i1 %t2173, label %fixfast853, label %fixslow854
fixfast853:
  %t2174 = icmp slt i64 512, %t2170
  %t2175 = select i1 %t2174, i64 257, i64 1
  br label %fixmerge855
fixslow854:
  %t2176 = call i64 @rt_lt(i64 512, i64 %t2170)
  br label %fixmerge855
fixmerge855:
  %t2177 = phi i64 [ %t2175, %fixfast853 ], [ %t2176, %fixslow854 ]
  %t2178 = icmp ne i64 %t2177, 1
  br i1 %t2178, label %then856, label %else857
then856:
  %t2179 = or i64 %t2170, 728
  %t2180 = and i64 %t2179, 7
  %t2181 = icmp eq i64 %t2180, 0
  br i1 %t2181, label %fixfast859, label %fixslow860
fixfast859:
  %t2182 = icmp slt i64 %t2170, 728
  %t2183 = select i1 %t2182, i64 257, i64 1
  br label %fixmerge861
fixslow860:
  %t2184 = call i64 @rt_lt(i64 %t2170, i64 728)
  br label %fixmerge861
fixmerge861:
  %t2185 = phi i64 [ %t2183, %fixfast859 ], [ %t2184, %fixslow860 ]
  br label %merge858
else857:
  br label %merge858
merge858:
  %t2186 = phi i64 [ %t2185, %fixmerge861 ], [ 1, %else857 ]
  %t2187 = icmp ne i64 %t2186, 1
  br i1 %t2187, label %then862, label %else863
then862:
  %t2188 = or i64 %t2170, 256
  %t2189 = and i64 %t2188, 7
  %t2190 = icmp eq i64 %t2189, 0
  br i1 %t2190, label %fixfast864, label %fixslow865
fixfast864:
  %t2191 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2170, i64 256)
  %t2192 = extractvalue {i64, i1} %t2191, 0
  %t2193 = extractvalue {i64, i1} %t2191, 1
  br i1 %t2193, label %fixslow865, label %fixmerge866
fixslow865:
  %t2194 = call i64 @rt_add(i64 %t2170, i64 256)
  br label %fixmerge866
fixmerge866:
  %t2195 = phi i64 [ %t2192, %fixfast864 ], [ %t2194, %fixslow865 ]
  %t2196 = call i64 @rt_integer_to_char(i64 %t2195)
  ret i64 %t2196
else863:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_675"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2201 = icmp eq i64 %argc, 2
  br i1 %t2201, label %argok868, label %arityerr867
arityerr867:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok868:
  %t2202 = and i64 %self, -8
  %t2203 = inttoptr i64 %t2202 to ptr
  %t2204 = getelementptr i64, ptr %t2203, i64 1
  %t2205 = load i64, ptr %t2204
  %t2206 = or i64 %a0, %t2205
  %t2207 = and i64 %t2206, 7
  %t2208 = icmp eq i64 %t2207, 0
  br i1 %t2208, label %fixfast869, label %fixslow870
fixfast869:
  %t2209 = icmp eq i64 %a0, %t2205
  %t2210 = select i1 %t2209, i64 257, i64 1
  br label %fixmerge871
fixslow870:
  %t2211 = call i64 @rt_num_eq(i64 %a0, i64 %t2205)
  br label %fixmerge871
fixmerge871:
  %t2212 = phi i64 [ %t2210, %fixfast869 ], [ %t2211, %fixslow870 ]
  %t2213 = icmp ne i64 %t2212, 1
  br i1 %t2213, label %then872, label %else873
then872:
  %t2214 = load i64, ptr @"emit.internal:reverse"
  %t2215 = and i64 %t2214, -8
  %t2216 = inttoptr i64 %t2215 to ptr
  %t2217 = load i64, ptr %t2216
  %t2218 = inttoptr i64 %t2217 to ptr
  %t2219 = call fastcc i64%t2218(i64 %t2214, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2220 = call i64 @rt_list_to_string(i64 %t2219)
  ret i64 %t2220
else873:
  %t2221 = or i64 %a0, 8
  %t2222 = and i64 %t2221, 7
  %t2223 = icmp eq i64 %t2222, 0
  br i1 %t2223, label %fixfast874, label %fixslow875
fixfast874:
  %t2224 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2225 = extractvalue {i64, i1} %t2224, 0
  %t2226 = extractvalue {i64, i1} %t2224, 1
  br i1 %t2226, label %fixslow875, label %fixmerge876
fixslow875:
  %t2227 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge876
fixmerge876:
  %t2228 = phi i64 [ %t2225, %fixfast874 ], [ %t2227, %fixslow875 ]
  %t2229 = and i64 %self, -8
  %t2230 = inttoptr i64 %t2229 to ptr
  %t2231 = getelementptr i64, ptr %t2230, i64 3
  %t2232 = load i64, ptr %t2231
  %t2233 = call i64 @rt_string_ref(i64 %t2232, i64 %a0)
  %t2234 = load i64, ptr @"emit.internal:rd-fold-char"
  %t2235 = and i64 %t2234, -8
  %t2236 = inttoptr i64 %t2235 to ptr
  %t2237 = load i64, ptr %t2236
  %t2238 = inttoptr i64 %t2237 to ptr
  %t2239 = call fastcc i64%t2238(i64 %t2234, i64 1, i64 %t2233, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2240 = call i64 @rt_cons(i64 %t2239, i64 %a1)
  %t2241 = musttail call fastcc i64 @"emit.internal:code_675"(i64 %self, i64 2, i64 %t2228, i64 %t2240, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2241
}

define fastcc i64 @"emit.internal:code:rd-fold-token"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2242 = icmp eq i64 %argc, 1
  br i1 %t2242, label %argok878, label %arityerr877
arityerr877:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok878:
  %t2243 = call i64 @rt_string_length(i64 %a0)
  %t2244 = call ptr @rt_alloc_words(i64 4)
  %t2245 = ptrtoint ptr %t2244 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_675" to i64), ptr %t2244
  %t2246 = or i64 %t2245, 4
  %t2247 = getelementptr i64, ptr %t2244, i64 1
  store i64 %t2243, ptr %t2247
  %t2248 = getelementptr i64, ptr %t2244, i64 2
  store i64 %t2246, ptr %t2248
  %t2249 = getelementptr i64, ptr %t2244, i64 3
  store i64 %a0, ptr %t2249
  %t2250 = musttail call fastcc i64 @"emit.internal:code_675"(i64 %t2246, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2250
}

define fastcc i64 @"emit.internal:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2255 = icmp eq i64 %argc, 4
  br i1 %t2255, label %argok880, label %arityerr879
arityerr879:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok880:
  %t2256 = load i64, ptr @"emit.internal:rd-token-end"
  %t2257 = and i64 %t2256, -8
  %t2258 = inttoptr i64 %t2257 to ptr
  %t2259 = load i64, ptr %t2258
  %t2260 = inttoptr i64 %t2259 to ptr
  %t2261 = call fastcc i64%t2260(i64 %t2256, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2262 = or i64 %a2, %t2261
  %t2263 = and i64 %t2262, 7
  %t2264 = icmp eq i64 %t2263, 0
  br i1 %t2264, label %fixfast881, label %fixslow882
fixfast881:
  %t2265 = icmp eq i64 %a2, %t2261
  %t2266 = select i1 %t2265, i64 257, i64 1
  br label %fixmerge883
fixslow882:
  %t2267 = call i64 @rt_num_eq(i64 %a2, i64 %t2261)
  br label %fixmerge883
fixmerge883:
  %t2268 = phi i64 [ %t2266, %fixfast881 ], [ %t2267, %fixslow882 ]
  %t2269 = icmp ne i64 %t2268, 1
  br i1 %t2269, label %then884, label %else885
then884:
  %t2270 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2271 = load i64, ptr @"emit.internal:rd-fail"
  %t2272 = and i64 %t2271, -8
  %t2273 = inttoptr i64 %t2272 to ptr
  %t2274 = load i64, ptr %t2273
  %t2275 = inttoptr i64 %t2274 to ptr
  %t2276 = musttail call fastcc i64 %t2275(i64 %t2271, i64 2, i64 %t2270, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2276
else885:
  %t2277 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2261)
  %t2278 = load i64, ptr @"emit.internal:rd-number"
  %t2279 = and i64 %t2278, -8
  %t2280 = inttoptr i64 %t2279 to ptr
  %t2281 = load i64, ptr %t2280
  %t2282 = inttoptr i64 %t2281 to ptr
  %t2283 = call fastcc i64%t2282(i64 %t2278, i64 2, i64 %t2277, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2284 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2285 = call i64 @rt_eq_p(i64 %t2283, i64 %t2284)
  %t2286 = icmp ne i64 %t2285, 1
  br i1 %t2286, label %then886, label %else887
then886:
  %t2287 = icmp ne i64 %a3, 1
  br i1 %t2287, label %then888, label %else889
then888:
  %t2288 = load i64, ptr @"emit.internal:rd-fold-token"
  %t2289 = and i64 %t2288, -8
  %t2290 = inttoptr i64 %t2289 to ptr
  %t2291 = load i64, ptr %t2290
  %t2292 = inttoptr i64 %t2291 to ptr
  %t2293 = call fastcc i64%t2292(i64 %t2288, i64 1, i64 %t2277, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge890
else889:
  br label %merge890
merge890:
  %t2294 = phi i64 [ %t2293, %then888 ], [ %t2277, %else889 ]
  %t2295 = call i64 @rt_string_to_symbol(i64 %t2294)
  %t2296 = call i64 @rt_cons(i64 %t2295, i64 %t2261)
  ret i64 %t2296
else887:
  %t2297 = load i64, ptr @"emit.internal:rd-number-reason?"
  %t2298 = and i64 %t2297, -8
  %t2299 = inttoptr i64 %t2298 to ptr
  %t2300 = load i64, ptr %t2299
  %t2301 = inttoptr i64 %t2300 to ptr
  %t2302 = call fastcc i64%t2301(i64 %t2297, i64 1, i64 %t2283, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2303 = icmp ne i64 %t2302, 1
  br i1 %t2303, label %then891, label %else892
then891:
  %t2304 = load i64, ptr @"emit.internal:rd-fail"
  %t2305 = and i64 %t2304, -8
  %t2306 = inttoptr i64 %t2305 to ptr
  %t2307 = load i64, ptr %t2306
  %t2308 = inttoptr i64 %t2307 to ptr
  %t2309 = musttail call fastcc i64 %t2308(i64 %t2304, i64 2, i64 %t2283, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2309
else892:
  %t2310 = call i64 @rt_cons(i64 %t2283, i64 %t2261)
  ret i64 %t2310
}

define fastcc i64 @"emit.internal:code:rd-token-at"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2315 = icmp eq i64 %argc, 3
  br i1 %t2315, label %argok894, label %arityerr893
arityerr893:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok894:
  %t2316 = or i64 0, %a2
  %t2317 = and i64 %t2316, 7
  %t2318 = icmp eq i64 %t2317, 0
  br i1 %t2318, label %fixfast895, label %fixslow896
fixfast895:
  %t2319 = icmp slt i64 0, %a2
  %t2320 = select i1 %t2319, i64 257, i64 1
  br label %fixmerge897
fixslow896:
  %t2321 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge897
fixmerge897:
  %t2322 = phi i64 [ %t2320, %fixfast895 ], [ %t2321, %fixslow896 ]
  %t2323 = icmp ne i64 %t2322, 1
  br i1 %t2323, label %then898, label %else899
then898:
  br label %merge900
else899:
  %t2324 = or i64 0, %a2
  %t2325 = and i64 %t2324, 7
  %t2326 = icmp eq i64 %t2325, 0
  br i1 %t2326, label %fixfast901, label %fixslow902
fixfast901:
  %t2327 = icmp eq i64 0, %a2
  %t2328 = select i1 %t2327, i64 257, i64 1
  br label %fixmerge903
fixslow902:
  %t2329 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge903
fixmerge903:
  %t2330 = phi i64 [ %t2328, %fixfast901 ], [ %t2329, %fixslow902 ]
  br label %merge900
merge900:
  %t2331 = phi i64 [ 257, %then898 ], [ %t2330, %fixmerge903 ]
  %t2332 = icmp ne i64 %t2331, 1
  br i1 %t2332, label %then904, label %else905
then904:
  %t2333 = or i64 %a2, %a1
  %t2334 = and i64 %t2333, 7
  %t2335 = icmp eq i64 %t2334, 0
  br i1 %t2335, label %fixfast907, label %fixslow908
fixfast907:
  %t2336 = icmp slt i64 %a2, %a1
  %t2337 = select i1 %t2336, i64 257, i64 1
  br label %fixmerge909
fixslow908:
  %t2338 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge909
fixmerge909:
  %t2339 = phi i64 [ %t2337, %fixfast907 ], [ %t2338, %fixslow908 ]
  br label %merge906
else905:
  br label %merge906
merge906:
  %t2340 = phi i64 [ %t2339, %fixmerge909 ], [ 1, %else905 ]
  %t2341 = icmp ne i64 %t2340, 1
  br i1 %t2341, label %then910, label %else911
then910:
  %t2342 = or i64 %a2, 8
  %t2343 = and i64 %t2342, 7
  %t2344 = icmp eq i64 %t2343, 0
  br i1 %t2344, label %fixfast912, label %fixslow913
fixfast912:
  %t2345 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2346 = extractvalue {i64, i1} %t2345, 0
  %t2347 = extractvalue {i64, i1} %t2345, 1
  br i1 %t2347, label %fixslow913, label %fixmerge914
fixslow913:
  %t2348 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge914
fixmerge914:
  %t2349 = phi i64 [ %t2346, %fixfast912 ], [ %t2348, %fixslow913 ]
  %t2350 = load i64, ptr @"emit.internal:rd-token-end"
  %t2351 = and i64 %t2350, -8
  %t2352 = inttoptr i64 %t2351 to ptr
  %t2353 = load i64, ptr %t2352
  %t2354 = inttoptr i64 %t2353 to ptr
  %t2355 = call fastcc i64%t2354(i64 %t2350, i64 3, i64 %a0, i64 %a1, i64 %t2349, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2356 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2355)
  ret i64 %t2356
else911:
  %t2357 = call i64 @rt_make_string(ptr @.str.lit.10, i64 0)
  ret i64 %t2357
}

define fastcc i64 @"emit.internal:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2362 = icmp eq i64 %argc, 1
  br i1 %t2362, label %argok916, label %arityerr915
arityerr915:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok916:
  %t2363 = call i64 @rt_char_to_integer(i64 %a0)
  %t2364 = or i64 376, %t2363
  %t2365 = and i64 %t2364, 7
  %t2366 = icmp eq i64 %t2365, 0
  br i1 %t2366, label %fixfast917, label %fixslow918
fixfast917:
  %t2367 = icmp slt i64 376, %t2363
  %t2368 = select i1 %t2367, i64 257, i64 1
  br label %fixmerge919
fixslow918:
  %t2369 = call i64 @rt_lt(i64 376, i64 %t2363)
  br label %fixmerge919
fixmerge919:
  %t2370 = phi i64 [ %t2368, %fixfast917 ], [ %t2369, %fixslow918 ]
  %t2371 = icmp ne i64 %t2370, 1
  br i1 %t2371, label %then920, label %else921
then920:
  %t2372 = or i64 %t2363, 464
  %t2373 = and i64 %t2372, 7
  %t2374 = icmp eq i64 %t2373, 0
  br i1 %t2374, label %fixfast923, label %fixslow924
fixfast923:
  %t2375 = icmp slt i64 %t2363, 464
  %t2376 = select i1 %t2375, i64 257, i64 1
  br label %fixmerge925
fixslow924:
  %t2377 = call i64 @rt_lt(i64 %t2363, i64 464)
  br label %fixmerge925
fixmerge925:
  %t2378 = phi i64 [ %t2376, %fixfast923 ], [ %t2377, %fixslow924 ]
  br label %merge922
else921:
  br label %merge922
merge922:
  %t2379 = phi i64 [ %t2378, %fixmerge925 ], [ 1, %else921 ]
  %t2380 = icmp ne i64 %t2379, 1
  br i1 %t2380, label %then926, label %else927
then926:
  %t2381 = or i64 %t2363, 384
  %t2382 = and i64 %t2381, 7
  %t2383 = icmp eq i64 %t2382, 0
  br i1 %t2383, label %fixfast928, label %fixslow929
fixfast928:
  %t2384 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2363, i64 384)
  %t2385 = extractvalue {i64, i1} %t2384, 0
  %t2386 = extractvalue {i64, i1} %t2384, 1
  br i1 %t2386, label %fixslow929, label %fixmerge930
fixslow929:
  %t2387 = call i64 @rt_sub(i64 %t2363, i64 384)
  br label %fixmerge930
fixmerge930:
  %t2388 = phi i64 [ %t2385, %fixfast928 ], [ %t2387, %fixslow929 ]
  ret i64 %t2388
else927:
  %t2389 = or i64 768, %t2363
  %t2390 = and i64 %t2389, 7
  %t2391 = icmp eq i64 %t2390, 0
  br i1 %t2391, label %fixfast931, label %fixslow932
fixfast931:
  %t2392 = icmp slt i64 768, %t2363
  %t2393 = select i1 %t2392, i64 257, i64 1
  br label %fixmerge933
fixslow932:
  %t2394 = call i64 @rt_lt(i64 768, i64 %t2363)
  br label %fixmerge933
fixmerge933:
  %t2395 = phi i64 [ %t2393, %fixfast931 ], [ %t2394, %fixslow932 ]
  %t2396 = icmp ne i64 %t2395, 1
  br i1 %t2396, label %then934, label %else935
then934:
  %t2397 = or i64 %t2363, 824
  %t2398 = and i64 %t2397, 7
  %t2399 = icmp eq i64 %t2398, 0
  br i1 %t2399, label %fixfast937, label %fixslow938
fixfast937:
  %t2400 = icmp slt i64 %t2363, 824
  %t2401 = select i1 %t2400, i64 257, i64 1
  br label %fixmerge939
fixslow938:
  %t2402 = call i64 @rt_lt(i64 %t2363, i64 824)
  br label %fixmerge939
fixmerge939:
  %t2403 = phi i64 [ %t2401, %fixfast937 ], [ %t2402, %fixslow938 ]
  br label %merge936
else935:
  br label %merge936
merge936:
  %t2404 = phi i64 [ %t2403, %fixmerge939 ], [ 1, %else935 ]
  %t2405 = icmp ne i64 %t2404, 1
  br i1 %t2405, label %then940, label %else941
then940:
  %t2406 = or i64 %t2363, 696
  %t2407 = and i64 %t2406, 7
  %t2408 = icmp eq i64 %t2407, 0
  br i1 %t2408, label %fixfast942, label %fixslow943
fixfast942:
  %t2409 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2363, i64 696)
  %t2410 = extractvalue {i64, i1} %t2409, 0
  %t2411 = extractvalue {i64, i1} %t2409, 1
  br i1 %t2411, label %fixslow943, label %fixmerge944
fixslow943:
  %t2412 = call i64 @rt_sub(i64 %t2363, i64 696)
  br label %fixmerge944
fixmerge944:
  %t2413 = phi i64 [ %t2410, %fixfast942 ], [ %t2412, %fixslow943 ]
  ret i64 %t2413
else941:
  %t2414 = or i64 512, %t2363
  %t2415 = and i64 %t2414, 7
  %t2416 = icmp eq i64 %t2415, 0
  br i1 %t2416, label %fixfast945, label %fixslow946
fixfast945:
  %t2417 = icmp slt i64 512, %t2363
  %t2418 = select i1 %t2417, i64 257, i64 1
  br label %fixmerge947
fixslow946:
  %t2419 = call i64 @rt_lt(i64 512, i64 %t2363)
  br label %fixmerge947
fixmerge947:
  %t2420 = phi i64 [ %t2418, %fixfast945 ], [ %t2419, %fixslow946 ]
  %t2421 = icmp ne i64 %t2420, 1
  br i1 %t2421, label %then948, label %else949
then948:
  %t2422 = or i64 %t2363, 568
  %t2423 = and i64 %t2422, 7
  %t2424 = icmp eq i64 %t2423, 0
  br i1 %t2424, label %fixfast951, label %fixslow952
fixfast951:
  %t2425 = icmp slt i64 %t2363, 568
  %t2426 = select i1 %t2425, i64 257, i64 1
  br label %fixmerge953
fixslow952:
  %t2427 = call i64 @rt_lt(i64 %t2363, i64 568)
  br label %fixmerge953
fixmerge953:
  %t2428 = phi i64 [ %t2426, %fixfast951 ], [ %t2427, %fixslow952 ]
  br label %merge950
else949:
  br label %merge950
merge950:
  %t2429 = phi i64 [ %t2428, %fixmerge953 ], [ 1, %else949 ]
  %t2430 = icmp ne i64 %t2429, 1
  br i1 %t2430, label %then954, label %else955
then954:
  %t2431 = or i64 %t2363, 440
  %t2432 = and i64 %t2431, 7
  %t2433 = icmp eq i64 %t2432, 0
  br i1 %t2433, label %fixfast956, label %fixslow957
fixfast956:
  %t2434 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2363, i64 440)
  %t2435 = extractvalue {i64, i1} %t2434, 0
  %t2436 = extractvalue {i64, i1} %t2434, 1
  br i1 %t2436, label %fixslow957, label %fixmerge958
fixslow957:
  %t2437 = call i64 @rt_sub(i64 %t2363, i64 440)
  br label %fixmerge958
fixmerge958:
  %t2438 = phi i64 [ %t2435, %fixfast956 ], [ %t2437, %fixslow957 ]
  ret i64 %t2438
else955:
  ret i64 0
}

define fastcc i64 @"emit.internal:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2443 = icmp eq i64 %argc, 4
  br i1 %t2443, label %argok960, label %arityerr959
arityerr959:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok960:
  %t2444 = or i64 %a2, %a1
  %t2445 = and i64 %t2444, 7
  %t2446 = icmp eq i64 %t2445, 0
  br i1 %t2446, label %fixfast961, label %fixslow962
fixfast961:
  %t2447 = icmp slt i64 %a2, %a1
  %t2448 = select i1 %t2447, i64 257, i64 1
  br label %fixmerge963
fixslow962:
  %t2449 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge963
fixmerge963:
  %t2450 = phi i64 [ %t2448, %fixfast961 ], [ %t2449, %fixslow962 ]
  %t2451 = icmp ne i64 %t2450, 1
  br i1 %t2451, label %then964, label %else965
then964:
  %t2452 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2453 = call i64 @rt_char_to_integer(i64 %t2452)
  %t2454 = or i64 %t2453, 472
  %t2455 = and i64 %t2454, 7
  %t2456 = icmp eq i64 %t2455, 0
  br i1 %t2456, label %fixfast966, label %fixslow967
fixfast966:
  %t2457 = icmp eq i64 %t2453, 472
  %t2458 = select i1 %t2457, i64 257, i64 1
  br label %fixmerge968
fixslow967:
  %t2459 = call i64 @rt_num_eq(i64 %t2453, i64 472)
  br label %fixmerge968
fixmerge968:
  %t2460 = phi i64 [ %t2458, %fixfast966 ], [ %t2459, %fixslow967 ]
  %t2461 = icmp ne i64 %t2460, 1
  br i1 %t2461, label %then969, label %else970
then969:
  %t2462 = or i64 %a2, 8
  %t2463 = and i64 %t2462, 7
  %t2464 = icmp eq i64 %t2463, 0
  br i1 %t2464, label %fixfast971, label %fixslow972
fixfast971:
  %t2465 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2466 = extractvalue {i64, i1} %t2465, 0
  %t2467 = extractvalue {i64, i1} %t2465, 1
  br i1 %t2467, label %fixslow972, label %fixmerge973
fixslow972:
  %t2468 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge973
fixmerge973:
  %t2469 = phi i64 [ %t2466, %fixfast971 ], [ %t2468, %fixslow972 ]
  %t2470 = call i64 @rt_cons(i64 %a3, i64 %t2469)
  ret i64 %t2470
else970:
  %t2471 = or i64 %a2, 8
  %t2472 = and i64 %t2471, 7
  %t2473 = icmp eq i64 %t2472, 0
  br i1 %t2473, label %fixfast974, label %fixslow975
fixfast974:
  %t2474 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2475 = extractvalue {i64, i1} %t2474, 0
  %t2476 = extractvalue {i64, i1} %t2474, 1
  br i1 %t2476, label %fixslow975, label %fixmerge976
fixslow975:
  %t2477 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge976
fixmerge976:
  %t2478 = phi i64 [ %t2475, %fixfast974 ], [ %t2477, %fixslow975 ]
  %t2479 = or i64 %a3, 128
  %t2480 = and i64 %t2479, 7
  %t2481 = icmp eq i64 %t2480, 0
  br i1 %t2481, label %fixfast977, label %fixslow978
fixfast977:
  %t2482 = ashr i64 %a3, 3
  %t2483 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2482, i64 128)
  %t2484 = extractvalue {i64, i1} %t2483, 0
  %t2485 = extractvalue {i64, i1} %t2483, 1
  br i1 %t2485, label %fixslow978, label %fixmerge979
fixslow978:
  %t2486 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge979
fixmerge979:
  %t2487 = phi i64 [ %t2484, %fixfast977 ], [ %t2486, %fixslow978 ]
  %t2488 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2489 = load i64, ptr @"emit.internal:rd-hex-digit"
  %t2490 = and i64 %t2489, -8
  %t2491 = inttoptr i64 %t2490 to ptr
  %t2492 = load i64, ptr %t2491
  %t2493 = inttoptr i64 %t2492 to ptr
  %t2494 = call fastcc i64%t2493(i64 %t2489, i64 1, i64 %t2488, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2495 = or i64 %t2487, %t2494
  %t2496 = and i64 %t2495, 7
  %t2497 = icmp eq i64 %t2496, 0
  br i1 %t2497, label %fixfast980, label %fixslow981
fixfast980:
  %t2498 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2487, i64 %t2494)
  %t2499 = extractvalue {i64, i1} %t2498, 0
  %t2500 = extractvalue {i64, i1} %t2498, 1
  br i1 %t2500, label %fixslow981, label %fixmerge982
fixslow981:
  %t2501 = call i64 @rt_add(i64 %t2487, i64 %t2494)
  br label %fixmerge982
fixmerge982:
  %t2502 = phi i64 [ %t2499, %fixfast980 ], [ %t2501, %fixslow981 ]
  %t2503 = load i64, ptr @"emit.internal:rd-hex"
  %t2504 = and i64 %t2503, -8
  %t2505 = inttoptr i64 %t2504 to ptr
  %t2506 = load i64, ptr %t2505
  %t2507 = inttoptr i64 %t2506 to ptr
  %t2508 = musttail call fastcc i64 %t2507(i64 %t2503, i64 4, i64 %a0, i64 %a1, i64 %t2478, i64 %t2502, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2508
else965:
  %t2509 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2509
}

define fastcc i64 @"emit.internal:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2514 = icmp eq i64 %argc, 1
  br i1 %t2514, label %argok984, label %arityerr983
arityerr983:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok984:
  %t2515 = call i64 @rt_char_to_integer(i64 %a0)
  %t2516 = or i64 %t2515, 880
  %t2517 = and i64 %t2516, 7
  %t2518 = icmp eq i64 %t2517, 0
  br i1 %t2518, label %fixfast985, label %fixslow986
fixfast985:
  %t2519 = icmp eq i64 %t2515, 880
  %t2520 = select i1 %t2519, i64 257, i64 1
  br label %fixmerge987
fixslow986:
  %t2521 = call i64 @rt_num_eq(i64 %t2515, i64 880)
  br label %fixmerge987
fixmerge987:
  %t2522 = phi i64 [ %t2520, %fixfast985 ], [ %t2521, %fixslow986 ]
  %t2523 = icmp ne i64 %t2522, 1
  br i1 %t2523, label %then988, label %else989
then988:
  %t2524 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2524
else989:
  %t2525 = or i64 %t2515, 928
  %t2526 = and i64 %t2525, 7
  %t2527 = icmp eq i64 %t2526, 0
  br i1 %t2527, label %fixfast990, label %fixslow991
fixfast990:
  %t2528 = icmp eq i64 %t2515, 928
  %t2529 = select i1 %t2528, i64 257, i64 1
  br label %fixmerge992
fixslow991:
  %t2530 = call i64 @rt_num_eq(i64 %t2515, i64 928)
  br label %fixmerge992
fixmerge992:
  %t2531 = phi i64 [ %t2529, %fixfast990 ], [ %t2530, %fixslow991 ]
  %t2532 = icmp ne i64 %t2531, 1
  br i1 %t2532, label %then993, label %else994
then993:
  %t2533 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2533
else994:
  %t2534 = or i64 %t2515, 912
  %t2535 = and i64 %t2534, 7
  %t2536 = icmp eq i64 %t2535, 0
  br i1 %t2536, label %fixfast995, label %fixslow996
fixfast995:
  %t2537 = icmp eq i64 %t2515, 912
  %t2538 = select i1 %t2537, i64 257, i64 1
  br label %fixmerge997
fixslow996:
  %t2539 = call i64 @rt_num_eq(i64 %t2515, i64 912)
  br label %fixmerge997
fixmerge997:
  %t2540 = phi i64 [ %t2538, %fixfast995 ], [ %t2539, %fixslow996 ]
  %t2541 = icmp ne i64 %t2540, 1
  br i1 %t2541, label %then998, label %else999
then998:
  %t2542 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2542
else999:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_787"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2547 = icmp eq i64 %argc, 2
  br i1 %t2547, label %argok1001, label %arityerr1000
arityerr1000:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1001:
  %t2548 = and i64 %self, -8
  %t2549 = inttoptr i64 %t2548 to ptr
  %t2550 = getelementptr i64, ptr %t2549, i64 1
  %t2551 = load i64, ptr %t2550
  %t2552 = or i64 %a0, %t2551
  %t2553 = and i64 %t2552, 7
  %t2554 = icmp eq i64 %t2553, 0
  br i1 %t2554, label %fixfast1002, label %fixslow1003
fixfast1002:
  %t2555 = icmp slt i64 %a0, %t2551
  %t2556 = select i1 %t2555, i64 257, i64 1
  br label %fixmerge1004
fixslow1003:
  %t2557 = call i64 @rt_lt(i64 %a0, i64 %t2551)
  br label %fixmerge1004
fixmerge1004:
  %t2558 = phi i64 [ %t2556, %fixfast1002 ], [ %t2557, %fixslow1003 ]
  %t2559 = icmp ne i64 %t2558, 1
  br i1 %t2559, label %then1005, label %else1006
then1005:
  %t2560 = and i64 %self, -8
  %t2561 = inttoptr i64 %t2560 to ptr
  %t2562 = getelementptr i64, ptr %t2561, i64 2
  %t2563 = load i64, ptr %t2562
  %t2564 = call i64 @rt_string_ref(i64 %t2563, i64 %a0)
  %t2565 = call i64 @rt_char_to_integer(i64 %t2564)
  %t2566 = or i64 %t2565, 272
  %t2567 = and i64 %t2566, 7
  %t2568 = icmp eq i64 %t2567, 0
  br i1 %t2568, label %fixfast1007, label %fixslow1008
fixfast1007:
  %t2569 = icmp eq i64 %t2565, 272
  %t2570 = select i1 %t2569, i64 257, i64 1
  br label %fixmerge1009
fixslow1008:
  %t2571 = call i64 @rt_num_eq(i64 %t2565, i64 272)
  br label %fixmerge1009
fixmerge1009:
  %t2572 = phi i64 [ %t2570, %fixfast1007 ], [ %t2571, %fixslow1008 ]
  %t2573 = icmp ne i64 %t2572, 1
  br i1 %t2573, label %then1010, label %else1011
then1010:
  %t2574 = load i64, ptr @"emit.internal:reverse"
  %t2575 = and i64 %t2574, -8
  %t2576 = inttoptr i64 %t2575 to ptr
  %t2577 = load i64, ptr %t2576
  %t2578 = inttoptr i64 %t2577 to ptr
  %t2579 = call fastcc i64%t2578(i64 %t2574, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2580 = call i64 @rt_list_to_string(i64 %t2579)
  %t2581 = or i64 %a0, 8
  %t2582 = and i64 %t2581, 7
  %t2583 = icmp eq i64 %t2582, 0
  br i1 %t2583, label %fixfast1012, label %fixslow1013
fixfast1012:
  %t2584 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2585 = extractvalue {i64, i1} %t2584, 0
  %t2586 = extractvalue {i64, i1} %t2584, 1
  br i1 %t2586, label %fixslow1013, label %fixmerge1014
fixslow1013:
  %t2587 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1014
fixmerge1014:
  %t2588 = phi i64 [ %t2585, %fixfast1012 ], [ %t2587, %fixslow1013 ]
  %t2589 = call i64 @rt_cons(i64 %t2580, i64 %t2588)
  ret i64 %t2589
else1011:
  %t2590 = or i64 %t2565, 736
  %t2591 = and i64 %t2590, 7
  %t2592 = icmp eq i64 %t2591, 0
  br i1 %t2592, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t2593 = icmp eq i64 %t2565, 736
  %t2594 = select i1 %t2593, i64 257, i64 1
  br label %fixmerge1017
fixslow1016:
  %t2595 = call i64 @rt_num_eq(i64 %t2565, i64 736)
  br label %fixmerge1017
fixmerge1017:
  %t2596 = phi i64 [ %t2594, %fixfast1015 ], [ %t2595, %fixslow1016 ]
  %t2597 = icmp ne i64 %t2596, 1
  br i1 %t2597, label %then1018, label %else1019
then1018:
  %t2598 = and i64 %self, -8
  %t2599 = inttoptr i64 %t2598 to ptr
  %t2600 = getelementptr i64, ptr %t2599, i64 2
  %t2601 = load i64, ptr %t2600
  %t2602 = or i64 %a0, 8
  %t2603 = and i64 %t2602, 7
  %t2604 = icmp eq i64 %t2603, 0
  br i1 %t2604, label %fixfast1020, label %fixslow1021
fixfast1020:
  %t2605 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2606 = extractvalue {i64, i1} %t2605, 0
  %t2607 = extractvalue {i64, i1} %t2605, 1
  br i1 %t2607, label %fixslow1021, label %fixmerge1022
fixslow1021:
  %t2608 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1022
fixmerge1022:
  %t2609 = phi i64 [ %t2606, %fixfast1020 ], [ %t2608, %fixslow1021 ]
  %t2610 = call i64 @rt_string_ref(i64 %t2601, i64 %t2609)
  %t2611 = call i64 @rt_char_to_integer(i64 %t2610)
  %t2612 = or i64 %t2611, 960
  %t2613 = and i64 %t2612, 7
  %t2614 = icmp eq i64 %t2613, 0
  br i1 %t2614, label %fixfast1023, label %fixslow1024
fixfast1023:
  %t2615 = icmp eq i64 %t2611, 960
  %t2616 = select i1 %t2615, i64 257, i64 1
  br label %fixmerge1025
fixslow1024:
  %t2617 = call i64 @rt_num_eq(i64 %t2611, i64 960)
  br label %fixmerge1025
fixmerge1025:
  %t2618 = phi i64 [ %t2616, %fixfast1023 ], [ %t2617, %fixslow1024 ]
  %t2619 = icmp ne i64 %t2618, 1
  br i1 %t2619, label %then1026, label %else1027
then1026:
  %t2620 = and i64 %self, -8
  %t2621 = inttoptr i64 %t2620 to ptr
  %t2622 = getelementptr i64, ptr %t2621, i64 2
  %t2623 = load i64, ptr %t2622
  %t2624 = and i64 %self, -8
  %t2625 = inttoptr i64 %t2624 to ptr
  %t2626 = getelementptr i64, ptr %t2625, i64 1
  %t2627 = load i64, ptr %t2626
  %t2628 = or i64 %a0, 16
  %t2629 = and i64 %t2628, 7
  %t2630 = icmp eq i64 %t2629, 0
  br i1 %t2630, label %fixfast1028, label %fixslow1029
fixfast1028:
  %t2631 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t2632 = extractvalue {i64, i1} %t2631, 0
  %t2633 = extractvalue {i64, i1} %t2631, 1
  br i1 %t2633, label %fixslow1029, label %fixmerge1030
fixslow1029:
  %t2634 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1030
fixmerge1030:
  %t2635 = phi i64 [ %t2632, %fixfast1028 ], [ %t2634, %fixslow1029 ]
  %t2636 = load i64, ptr @"emit.internal:rd-hex"
  %t2637 = and i64 %t2636, -8
  %t2638 = inttoptr i64 %t2637 to ptr
  %t2639 = load i64, ptr %t2638
  %t2640 = inttoptr i64 %t2639 to ptr
  %t2641 = call fastcc i64%t2640(i64 %t2636, i64 4, i64 %t2623, i64 %t2627, i64 %t2635, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2642 = call i64 @rt_cdr(i64 %t2641)
  %t2643 = call i64 @rt_car(i64 %t2641)
  %t2644 = call i64 @rt_integer_to_char(i64 %t2643)
  %t2645 = call i64 @rt_cons(i64 %t2644, i64 %a1)
  %t2646 = musttail call fastcc i64 @"emit.internal:code_787"(i64 %self, i64 2, i64 %t2642, i64 %t2645, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2646
else1027:
  %t2647 = or i64 %a0, 16
  %t2648 = and i64 %t2647, 7
  %t2649 = icmp eq i64 %t2648, 0
  br i1 %t2649, label %fixfast1031, label %fixslow1032
fixfast1031:
  %t2650 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t2651 = extractvalue {i64, i1} %t2650, 0
  %t2652 = extractvalue {i64, i1} %t2650, 1
  br i1 %t2652, label %fixslow1032, label %fixmerge1033
fixslow1032:
  %t2653 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1033
fixmerge1033:
  %t2654 = phi i64 [ %t2651, %fixfast1031 ], [ %t2653, %fixslow1032 ]
  %t2655 = load i64, ptr @"emit.internal:rd-str-esc"
  %t2656 = and i64 %t2655, -8
  %t2657 = inttoptr i64 %t2656 to ptr
  %t2658 = load i64, ptr %t2657
  %t2659 = inttoptr i64 %t2658 to ptr
  %t2660 = call fastcc i64%t2659(i64 %t2655, i64 1, i64 %t2610, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2661 = call i64 @rt_cons(i64 %t2660, i64 %a1)
  %t2662 = musttail call fastcc i64 @"emit.internal:code_787"(i64 %self, i64 2, i64 %t2654, i64 %t2661, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2662
else1019:
  %t2663 = or i64 %a0, 8
  %t2664 = and i64 %t2663, 7
  %t2665 = icmp eq i64 %t2664, 0
  br i1 %t2665, label %fixfast1034, label %fixslow1035
fixfast1034:
  %t2666 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2667 = extractvalue {i64, i1} %t2666, 0
  %t2668 = extractvalue {i64, i1} %t2666, 1
  br i1 %t2668, label %fixslow1035, label %fixmerge1036
fixslow1035:
  %t2669 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1036
fixmerge1036:
  %t2670 = phi i64 [ %t2667, %fixfast1034 ], [ %t2669, %fixslow1035 ]
  %t2671 = call i64 @rt_cons(i64 %t2564, i64 %a1)
  %t2672 = musttail call fastcc i64 @"emit.internal:code_787"(i64 %self, i64 2, i64 %t2670, i64 %t2671, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2672
else1006:
  %t2673 = load i64, ptr @"emit.internal:reverse"
  %t2674 = and i64 %t2673, -8
  %t2675 = inttoptr i64 %t2674 to ptr
  %t2676 = load i64, ptr %t2675
  %t2677 = inttoptr i64 %t2676 to ptr
  %t2678 = call fastcc i64%t2677(i64 %t2673, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2679 = call i64 @rt_list_to_string(i64 %t2678)
  %t2680 = call i64 @rt_cons(i64 %t2679, i64 %a0)
  ret i64 %t2680
}

define fastcc i64 @"emit.internal:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2681 = icmp eq i64 %argc, 3
  br i1 %t2681, label %argok1038, label %arityerr1037
arityerr1037:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1038:
  %t2682 = call ptr @rt_alloc_words(i64 4)
  %t2683 = ptrtoint ptr %t2682 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_787" to i64), ptr %t2682
  %t2684 = or i64 %t2683, 4
  %t2685 = getelementptr i64, ptr %t2682, i64 1
  store i64 %a1, ptr %t2685
  %t2686 = getelementptr i64, ptr %t2682, i64 2
  store i64 %a0, ptr %t2686
  %t2687 = getelementptr i64, ptr %t2682, i64 3
  store i64 %t2684, ptr %t2687
  %t2688 = musttail call fastcc i64 @"emit.internal:code_787"(i64 %t2684, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2688
}

define fastcc i64 @"emit.internal:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2693 = icmp eq i64 %argc, 4
  br i1 %t2693, label %argok1040, label %arityerr1039
arityerr1039:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1040:
  %t2694 = or i64 %a1, %a2
  %t2695 = and i64 %t2694, 7
  %t2696 = icmp eq i64 %t2695, 0
  br i1 %t2696, label %fixfast1041, label %fixslow1042
fixfast1041:
  %t2697 = icmp slt i64 %a1, %a2
  %t2698 = select i1 %t2697, i64 257, i64 1
  br label %fixmerge1043
fixslow1042:
  %t2699 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1043
fixmerge1043:
  %t2700 = phi i64 [ %t2698, %fixfast1041 ], [ %t2699, %fixslow1042 ]
  %t2701 = icmp ne i64 %t2700, 1
  br i1 %t2701, label %then1044, label %else1045
then1044:
  br label %merge1046
else1045:
  %t2702 = or i64 %a1, %a2
  %t2703 = and i64 %t2702, 7
  %t2704 = icmp eq i64 %t2703, 0
  br i1 %t2704, label %fixfast1047, label %fixslow1048
fixfast1047:
  %t2705 = icmp eq i64 %a1, %a2
  %t2706 = select i1 %t2705, i64 257, i64 1
  br label %fixmerge1049
fixslow1048:
  %t2707 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge1049
fixmerge1049:
  %t2708 = phi i64 [ %t2706, %fixfast1047 ], [ %t2707, %fixslow1048 ]
  br label %merge1046
merge1046:
  %t2709 = phi i64 [ 257, %then1044 ], [ %t2708, %fixmerge1049 ]
  %t2710 = icmp ne i64 %t2709, 1
  br i1 %t2710, label %then1050, label %else1051
then1050:
  %t2711 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2712 = or i64 %a2, 8
  %t2713 = and i64 %t2712, 7
  %t2714 = icmp eq i64 %t2713, 0
  br i1 %t2714, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t2715 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t2716 = extractvalue {i64, i1} %t2715, 0
  %t2717 = extractvalue {i64, i1} %t2715, 1
  br i1 %t2717, label %fixslow1053, label %fixmerge1054
fixslow1053:
  %t2718 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1054
fixmerge1054:
  %t2719 = phi i64 [ %t2716, %fixfast1052 ], [ %t2718, %fixslow1053 ]
  %t2720 = load i64, ptr @"emit.internal:rd-fail"
  %t2721 = and i64 %t2720, -8
  %t2722 = inttoptr i64 %t2721 to ptr
  %t2723 = load i64, ptr %t2722
  %t2724 = inttoptr i64 %t2723 to ptr
  %t2725 = musttail call fastcc i64 %t2724(i64 %t2720, i64 2, i64 %t2711, i64 %t2719, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2725
else1051:
  %t2726 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2727 = call i64 @rt_char_to_integer(i64 %t2726)
  %t2728 = or i64 %t2727, 928
  %t2729 = and i64 %t2728, 7
  %t2730 = icmp eq i64 %t2729, 0
  br i1 %t2730, label %fixfast1055, label %fixslow1056
fixfast1055:
  %t2731 = icmp eq i64 %t2727, 928
  %t2732 = select i1 %t2731, i64 257, i64 1
  br label %fixmerge1057
fixslow1056:
  %t2733 = call i64 @rt_num_eq(i64 %t2727, i64 928)
  br label %fixmerge1057
fixmerge1057:
  %t2734 = phi i64 [ %t2732, %fixfast1055 ], [ %t2733, %fixslow1056 ]
  %t2735 = icmp ne i64 %t2734, 1
  br i1 %t2735, label %then1058, label %else1059
then1058:
  %t2736 = or i64 %a2, 8
  %t2737 = and i64 %t2736, 7
  %t2738 = icmp eq i64 %t2737, 0
  br i1 %t2738, label %fixfast1060, label %fixslow1061
fixfast1060:
  %t2739 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2740 = extractvalue {i64, i1} %t2739, 0
  %t2741 = extractvalue {i64, i1} %t2739, 1
  br i1 %t2741, label %fixslow1061, label %fixmerge1062
fixslow1061:
  %t2742 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1062
fixmerge1062:
  %t2743 = phi i64 [ %t2740, %fixfast1060 ], [ %t2742, %fixslow1061 ]
  %t2744 = call i64 @rt_cons(i64 257, i64 %t2743)
  ret i64 %t2744
else1059:
  %t2745 = or i64 %t2727, 816
  %t2746 = and i64 %t2745, 7
  %t2747 = icmp eq i64 %t2746, 0
  br i1 %t2747, label %fixfast1063, label %fixslow1064
fixfast1063:
  %t2748 = icmp eq i64 %t2727, 816
  %t2749 = select i1 %t2748, i64 257, i64 1
  br label %fixmerge1065
fixslow1064:
  %t2750 = call i64 @rt_num_eq(i64 %t2727, i64 816)
  br label %fixmerge1065
fixmerge1065:
  %t2751 = phi i64 [ %t2749, %fixfast1063 ], [ %t2750, %fixslow1064 ]
  %t2752 = icmp ne i64 %t2751, 1
  br i1 %t2752, label %then1066, label %else1067
then1066:
  %t2753 = or i64 %a2, 8
  %t2754 = and i64 %t2753, 7
  %t2755 = icmp eq i64 %t2754, 0
  br i1 %t2755, label %fixfast1068, label %fixslow1069
fixfast1068:
  %t2756 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2757 = extractvalue {i64, i1} %t2756, 0
  %t2758 = extractvalue {i64, i1} %t2756, 1
  br i1 %t2758, label %fixslow1069, label %fixmerge1070
fixslow1069:
  %t2759 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1070
fixmerge1070:
  %t2760 = phi i64 [ %t2757, %fixfast1068 ], [ %t2759, %fixslow1069 ]
  %t2761 = call i64 @rt_cons(i64 1, i64 %t2760)
  ret i64 %t2761
else1067:
  %t2762 = or i64 %t2727, 736
  %t2763 = and i64 %t2762, 7
  %t2764 = icmp eq i64 %t2763, 0
  br i1 %t2764, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t2765 = icmp eq i64 %t2727, 736
  %t2766 = select i1 %t2765, i64 257, i64 1
  br label %fixmerge1073
fixslow1072:
  %t2767 = call i64 @rt_num_eq(i64 %t2727, i64 736)
  br label %fixmerge1073
fixmerge1073:
  %t2768 = phi i64 [ %t2766, %fixfast1071 ], [ %t2767, %fixslow1072 ]
  %t2769 = icmp ne i64 %t2768, 1
  br i1 %t2769, label %then1074, label %else1075
then1074:
  %t2770 = load i64, ptr @"emit.internal:rd-char"
  %t2771 = and i64 %t2770, -8
  %t2772 = inttoptr i64 %t2771 to ptr
  %t2773 = load i64, ptr %t2772
  %t2774 = inttoptr i64 %t2773 to ptr
  %t2775 = musttail call fastcc i64 %t2774(i64 %t2770, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2775
else1075:
  %t2776 = or i64 %t2727, 320
  %t2777 = and i64 %t2776, 7
  %t2778 = icmp eq i64 %t2777, 0
  br i1 %t2778, label %fixfast1076, label %fixslow1077
fixfast1076:
  %t2779 = icmp eq i64 %t2727, 320
  %t2780 = select i1 %t2779, i64 257, i64 1
  br label %fixmerge1078
fixslow1077:
  %t2781 = call i64 @rt_num_eq(i64 %t2727, i64 320)
  br label %fixmerge1078
fixmerge1078:
  %t2782 = phi i64 [ %t2780, %fixfast1076 ], [ %t2781, %fixslow1077 ]
  %t2783 = icmp ne i64 %t2782, 1
  br i1 %t2783, label %then1079, label %else1080
then1079:
  %t2784 = or i64 %a2, 8
  %t2785 = and i64 %t2784, 7
  %t2786 = icmp eq i64 %t2785, 0
  br i1 %t2786, label %fixfast1081, label %fixslow1082
fixfast1081:
  %t2787 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2788 = extractvalue {i64, i1} %t2787, 0
  %t2789 = extractvalue {i64, i1} %t2787, 1
  br i1 %t2789, label %fixslow1082, label %fixmerge1083
fixslow1082:
  %t2790 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1083
fixmerge1083:
  %t2791 = phi i64 [ %t2788, %fixfast1081 ], [ %t2790, %fixslow1082 ]
  %t2792 = load i64, ptr @"emit.internal:rd-list"
  %t2793 = and i64 %t2792, -8
  %t2794 = inttoptr i64 %t2793 to ptr
  %t2795 = load i64, ptr %t2794
  %t2796 = inttoptr i64 %t2795 to ptr
  %t2797 = call fastcc i64%t2796(i64 %t2792, i64 5, i64 %a0, i64 %a1, i64 %t2791, i64 2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  %t2798 = call i64 @rt_cdr(i64 %t2797)
  %t2799 = load i64, ptr @"emit.internal:rd-fail?"
  %t2800 = and i64 %t2799, -8
  %t2801 = inttoptr i64 %t2800 to ptr
  %t2802 = load i64, ptr %t2801
  %t2803 = inttoptr i64 %t2802 to ptr
  %t2804 = call fastcc i64%t2803(i64 %t2799, i64 1, i64 %t2798, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2805 = icmp ne i64 %t2804, 1
  br i1 %t2805, label %then1084, label %else1085
then1084:
  ret i64 %t2797
else1085:
  %t2806 = call i64 @rt_car(i64 %t2797)
  %t2807 = load i64, ptr @"emit.internal:list->vector"
  %t2808 = and i64 %t2807, -8
  %t2809 = inttoptr i64 %t2808 to ptr
  %t2810 = load i64, ptr %t2809
  %t2811 = inttoptr i64 %t2810 to ptr
  %t2812 = call fastcc i64%t2811(i64 %t2807, i64 1, i64 %t2806, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2813 = call i64 @rt_cdr(i64 %t2797)
  %t2814 = call i64 @rt_cons(i64 %t2812, i64 %t2813)
  ret i64 %t2814
else1080:
  %t2815 = or i64 %t2727, 472
  %t2816 = and i64 %t2815, 7
  %t2817 = icmp eq i64 %t2816, 0
  br i1 %t2817, label %fixfast1086, label %fixslow1087
fixfast1086:
  %t2818 = icmp eq i64 %t2727, 472
  %t2819 = select i1 %t2818, i64 257, i64 1
  br label %fixmerge1088
fixslow1087:
  %t2820 = call i64 @rt_num_eq(i64 %t2727, i64 472)
  br label %fixmerge1088
fixmerge1088:
  %t2821 = phi i64 [ %t2819, %fixfast1086 ], [ %t2820, %fixslow1087 ]
  %t2822 = icmp ne i64 %t2821, 1
  br i1 %t2822, label %then1089, label %else1090
then1089:
  %t2823 = or i64 %a2, 8
  %t2824 = and i64 %t2823, 7
  %t2825 = icmp eq i64 %t2824, 0
  br i1 %t2825, label %fixfast1091, label %fixslow1092
fixfast1091:
  %t2826 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2827 = extractvalue {i64, i1} %t2826, 0
  %t2828 = extractvalue {i64, i1} %t2826, 1
  br i1 %t2828, label %fixslow1092, label %fixmerge1093
fixslow1092:
  %t2829 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1093
fixmerge1093:
  %t2830 = phi i64 [ %t2827, %fixfast1091 ], [ %t2829, %fixslow1092 ]
  %t2831 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t2832 = and i64 %t2831, -8
  %t2833 = inttoptr i64 %t2832 to ptr
  %t2834 = load i64, ptr %t2833
  %t2835 = inttoptr i64 %t2834 to ptr
  %t2836 = call fastcc i64%t2835(i64 %t2831, i64 3, i64 %a0, i64 %a1, i64 %t2830, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2837 = load i64, ptr @"emit.internal:rd-datum"
  %t2838 = and i64 %t2837, -8
  %t2839 = inttoptr i64 %t2838 to ptr
  %t2840 = load i64, ptr %t2839
  %t2841 = inttoptr i64 %t2840 to ptr
  %t2842 = call fastcc i64%t2841(i64 %t2837, i64 4, i64 %a0, i64 %a1, i64 %t2836, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2843 = call i64 @rt_cdr(i64 %t2842)
  %t2844 = load i64, ptr @"emit.internal:rd-fail?"
  %t2845 = and i64 %t2844, -8
  %t2846 = inttoptr i64 %t2845 to ptr
  %t2847 = load i64, ptr %t2846
  %t2848 = inttoptr i64 %t2847 to ptr
  %t2849 = call fastcc i64%t2848(i64 %t2844, i64 1, i64 %t2843, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2850 = icmp ne i64 %t2849, 1
  br i1 %t2850, label %then1094, label %else1095
then1094:
  ret i64 %t2842
else1095:
  %t2851 = call i64 @rt_cdr(i64 %t2842)
  %t2852 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t2853 = and i64 %t2852, -8
  %t2854 = inttoptr i64 %t2853 to ptr
  %t2855 = load i64, ptr %t2854
  %t2856 = inttoptr i64 %t2855 to ptr
  %t2857 = call fastcc i64%t2856(i64 %t2852, i64 3, i64 %a0, i64 %a1, i64 %t2851, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2858 = load i64, ptr @"emit.internal:rd-datum"
  %t2859 = and i64 %t2858, -8
  %t2860 = inttoptr i64 %t2859 to ptr
  %t2861 = load i64, ptr %t2860
  %t2862 = inttoptr i64 %t2861 to ptr
  %t2863 = musttail call fastcc i64 %t2862(i64 %t2858, i64 4, i64 %a0, i64 %a1, i64 %t2857, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2863
else1090:
  %t2864 = or i64 %t2727, 936
  %t2865 = and i64 %t2864, 7
  %t2866 = icmp eq i64 %t2865, 0
  br i1 %t2866, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t2867 = icmp eq i64 %t2727, 936
  %t2868 = select i1 %t2867, i64 257, i64 1
  br label %fixmerge1098
fixslow1097:
  %t2869 = call i64 @rt_num_eq(i64 %t2727, i64 936)
  br label %fixmerge1098
fixmerge1098:
  %t2870 = phi i64 [ %t2868, %fixfast1096 ], [ %t2869, %fixslow1097 ]
  %t2871 = icmp ne i64 %t2870, 1
  br i1 %t2871, label %then1099, label %else1100
then1099:
  %t2872 = or i64 %a2, 16
  %t2873 = and i64 %t2872, 7
  %t2874 = icmp eq i64 %t2873, 0
  br i1 %t2874, label %fixfast1102, label %fixslow1103
fixfast1102:
  %t2875 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2876 = extractvalue {i64, i1} %t2875, 0
  %t2877 = extractvalue {i64, i1} %t2875, 1
  br i1 %t2877, label %fixslow1103, label %fixmerge1104
fixslow1103:
  %t2878 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1104
fixmerge1104:
  %t2879 = phi i64 [ %t2876, %fixfast1102 ], [ %t2878, %fixslow1103 ]
  %t2880 = or i64 %t2879, %a1
  %t2881 = and i64 %t2880, 7
  %t2882 = icmp eq i64 %t2881, 0
  br i1 %t2882, label %fixfast1105, label %fixslow1106
fixfast1105:
  %t2883 = icmp slt i64 %t2879, %a1
  %t2884 = select i1 %t2883, i64 257, i64 1
  br label %fixmerge1107
fixslow1106:
  %t2885 = call i64 @rt_lt(i64 %t2879, i64 %a1)
  br label %fixmerge1107
fixmerge1107:
  %t2886 = phi i64 [ %t2884, %fixfast1105 ], [ %t2885, %fixslow1106 ]
  %t2887 = icmp ne i64 %t2886, 1
  br i1 %t2887, label %then1108, label %else1109
then1108:
  %t2888 = or i64 %a2, 8
  %t2889 = and i64 %t2888, 7
  %t2890 = icmp eq i64 %t2889, 0
  br i1 %t2890, label %fixfast1111, label %fixslow1112
fixfast1111:
  %t2891 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2892 = extractvalue {i64, i1} %t2891, 0
  %t2893 = extractvalue {i64, i1} %t2891, 1
  br i1 %t2893, label %fixslow1112, label %fixmerge1113
fixslow1112:
  %t2894 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1113
fixmerge1113:
  %t2895 = phi i64 [ %t2892, %fixfast1111 ], [ %t2894, %fixslow1112 ]
  %t2896 = call i64 @rt_string_ref(i64 %a0, i64 %t2895)
  %t2897 = call i64 @rt_char_to_integer(i64 %t2896)
  %t2898 = or i64 %t2897, 448
  %t2899 = and i64 %t2898, 7
  %t2900 = icmp eq i64 %t2899, 0
  br i1 %t2900, label %fixfast1114, label %fixslow1115
fixfast1114:
  %t2901 = icmp eq i64 %t2897, 448
  %t2902 = select i1 %t2901, i64 257, i64 1
  br label %fixmerge1116
fixslow1115:
  %t2903 = call i64 @rt_num_eq(i64 %t2897, i64 448)
  br label %fixmerge1116
fixmerge1116:
  %t2904 = phi i64 [ %t2902, %fixfast1114 ], [ %t2903, %fixslow1115 ]
  %t2905 = icmp ne i64 %t2904, 1
  br i1 %t2905, label %then1117, label %else1118
then1117:
  %t2906 = or i64 %a2, 16
  %t2907 = and i64 %t2906, 7
  %t2908 = icmp eq i64 %t2907, 0
  br i1 %t2908, label %fixfast1120, label %fixslow1121
fixfast1120:
  %t2909 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2910 = extractvalue {i64, i1} %t2909, 0
  %t2911 = extractvalue {i64, i1} %t2909, 1
  br i1 %t2911, label %fixslow1121, label %fixmerge1122
fixslow1121:
  %t2912 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1122
fixmerge1122:
  %t2913 = phi i64 [ %t2910, %fixfast1120 ], [ %t2912, %fixslow1121 ]
  %t2914 = call i64 @rt_string_ref(i64 %a0, i64 %t2913)
  %t2915 = call i64 @rt_char_to_integer(i64 %t2914)
  %t2916 = or i64 %t2915, 320
  %t2917 = and i64 %t2916, 7
  %t2918 = icmp eq i64 %t2917, 0
  br i1 %t2918, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t2919 = icmp eq i64 %t2915, 320
  %t2920 = select i1 %t2919, i64 257, i64 1
  br label %fixmerge1125
fixslow1124:
  %t2921 = call i64 @rt_num_eq(i64 %t2915, i64 320)
  br label %fixmerge1125
fixmerge1125:
  %t2922 = phi i64 [ %t2920, %fixfast1123 ], [ %t2921, %fixslow1124 ]
  br label %merge1119
else1118:
  br label %merge1119
merge1119:
  %t2923 = phi i64 [ %t2922, %fixmerge1125 ], [ 1, %else1118 ]
  br label %merge1110
else1109:
  br label %merge1110
merge1110:
  %t2924 = phi i64 [ %t2923, %merge1119 ], [ 1, %else1109 ]
  br label %merge1101
else1100:
  br label %merge1101
merge1101:
  %t2925 = phi i64 [ %t2924, %merge1110 ], [ 1, %else1100 ]
  %t2926 = icmp ne i64 %t2925, 1
  br i1 %t2926, label %then1126, label %else1127
then1126:
  %t2927 = or i64 %a2, 24
  %t2928 = and i64 %t2927, 7
  %t2929 = icmp eq i64 %t2928, 0
  br i1 %t2929, label %fixfast1128, label %fixslow1129
fixfast1128:
  %t2930 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t2931 = extractvalue {i64, i1} %t2930, 0
  %t2932 = extractvalue {i64, i1} %t2930, 1
  br i1 %t2932, label %fixslow1129, label %fixmerge1130
fixslow1129:
  %t2933 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1130
fixmerge1130:
  %t2934 = phi i64 [ %t2931, %fixfast1128 ], [ %t2933, %fixslow1129 ]
  %t2935 = load i64, ptr @"emit.internal:rd-list"
  %t2936 = and i64 %t2935, -8
  %t2937 = inttoptr i64 %t2936 to ptr
  %t2938 = load i64, ptr %t2937
  %t2939 = inttoptr i64 %t2938 to ptr
  %t2940 = call fastcc i64%t2939(i64 %t2935, i64 5, i64 %a0, i64 %a1, i64 %t2934, i64 2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  %t2941 = call i64 @rt_cdr(i64 %t2940)
  %t2942 = load i64, ptr @"emit.internal:rd-fail?"
  %t2943 = and i64 %t2942, -8
  %t2944 = inttoptr i64 %t2943 to ptr
  %t2945 = load i64, ptr %t2944
  %t2946 = inttoptr i64 %t2945 to ptr
  %t2947 = call fastcc i64%t2946(i64 %t2942, i64 1, i64 %t2941, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2948 = icmp ne i64 %t2947, 1
  br i1 %t2948, label %then1131, label %else1132
then1131:
  ret i64 %t2940
else1132:
  %t2949 = call i64 @rt_car(i64 %t2940)
  %t2950 = load i64, ptr @"emit.internal:list->bytevector"
  %t2951 = and i64 %t2950, -8
  %t2952 = inttoptr i64 %t2951 to ptr
  %t2953 = load i64, ptr %t2952
  %t2954 = inttoptr i64 %t2953 to ptr
  %t2955 = call fastcc i64%t2954(i64 %t2950, i64 1, i64 %t2949, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2956 = call i64 @rt_cdr(i64 %t2940)
  %t2957 = call i64 @rt_cons(i64 %t2955, i64 %t2956)
  ret i64 %t2957
else1127:
  %t2958 = load i64, ptr @"emit.internal:rd-token-end"
  %t2959 = and i64 %t2958, -8
  %t2960 = inttoptr i64 %t2959 to ptr
  %t2961 = load i64, ptr %t2960
  %t2962 = inttoptr i64 %t2961 to ptr
  %t2963 = call fastcc i64%t2962(i64 %t2958, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2964 = or i64 %a2, 8
  %t2965 = and i64 %t2964, 7
  %t2966 = icmp eq i64 %t2965, 0
  br i1 %t2966, label %fixfast1133, label %fixslow1134
fixfast1133:
  %t2967 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t2968 = extractvalue {i64, i1} %t2967, 0
  %t2969 = extractvalue {i64, i1} %t2967, 1
  br i1 %t2969, label %fixslow1134, label %fixmerge1135
fixslow1134:
  %t2970 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1135
fixmerge1135:
  %t2971 = phi i64 [ %t2968, %fixfast1133 ], [ %t2970, %fixslow1134 ]
  %t2972 = call i64 @rt_substring(i64 %a0, i64 %t2971, i64 %t2963)
  %t2973 = load i64, ptr @"emit.internal:rd-number"
  %t2974 = and i64 %t2973, -8
  %t2975 = inttoptr i64 %t2974 to ptr
  %t2976 = load i64, ptr %t2975
  %t2977 = inttoptr i64 %t2976 to ptr
  %t2978 = call fastcc i64%t2977(i64 %t2973, i64 2, i64 %t2972, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2979 = load i64, ptr @"emit.internal:rd-number-reason?"
  %t2980 = and i64 %t2979, -8
  %t2981 = inttoptr i64 %t2980 to ptr
  %t2982 = load i64, ptr %t2981
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = call fastcc i64%t2983(i64 %t2979, i64 1, i64 %t2978, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2985 = icmp ne i64 %t2984, 1
  br i1 %t2985, label %then1136, label %else1137
then1136:
  %t2986 = or i64 %a2, 8
  %t2987 = and i64 %t2986, 7
  %t2988 = icmp eq i64 %t2987, 0
  br i1 %t2988, label %fixfast1138, label %fixslow1139
fixfast1138:
  %t2989 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t2990 = extractvalue {i64, i1} %t2989, 0
  %t2991 = extractvalue {i64, i1} %t2989, 1
  br i1 %t2991, label %fixslow1139, label %fixmerge1140
fixslow1139:
  %t2992 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1140
fixmerge1140:
  %t2993 = phi i64 [ %t2990, %fixfast1138 ], [ %t2992, %fixslow1139 ]
  %t2994 = load i64, ptr @"emit.internal:rd-fail"
  %t2995 = and i64 %t2994, -8
  %t2996 = inttoptr i64 %t2995 to ptr
  %t2997 = load i64, ptr %t2996
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = musttail call fastcc i64 %t2998(i64 %t2994, i64 2, i64 %t2978, i64 %t2993, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2999
else1137:
  %t3000 = call i64 @rt_cons(i64 %t2978, i64 %t2963)
  ret i64 %t3000
}

define fastcc i64 @"emit.internal:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3005 = icmp eq i64 %argc, 1
  br i1 %t3005, label %argok1142, label %arityerr1141
arityerr1141:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1142:
  %t3006 = call i64 @rt_make_string(ptr @.str.lit.12, i64 5)
  %t3007 = call i64 @rt_string_eq(i64 %a0, i64 %t3006)
  %t3008 = icmp ne i64 %t3007, 1
  br i1 %t3008, label %then1143, label %else1144
then1143:
  %t3009 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3009
else1144:
  %t3010 = call i64 @rt_make_string(ptr @.str.lit.13, i64 7)
  %t3011 = call i64 @rt_string_eq(i64 %a0, i64 %t3010)
  %t3012 = icmp ne i64 %t3011, 1
  br i1 %t3012, label %then1145, label %else1146
then1145:
  %t3013 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3013
else1146:
  %t3014 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t3015 = call i64 @rt_string_eq(i64 %a0, i64 %t3014)
  %t3016 = icmp ne i64 %t3015, 1
  br i1 %t3016, label %then1147, label %else1148
then1147:
  %t3017 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3017
else1148:
  %t3018 = call i64 @rt_make_string(ptr @.str.lit.15, i64 6)
  %t3019 = call i64 @rt_string_eq(i64 %a0, i64 %t3018)
  %t3020 = icmp ne i64 %t3019, 1
  br i1 %t3020, label %then1149, label %else1150
then1149:
  %t3021 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3021
else1150:
  %t3022 = call i64 @rt_make_string(ptr @.str.lit.16, i64 3)
  %t3023 = call i64 @rt_string_eq(i64 %a0, i64 %t3022)
  %t3024 = icmp ne i64 %t3023, 1
  br i1 %t3024, label %then1151, label %else1152
then1151:
  %t3025 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3025
else1152:
  %t3026 = call i64 @rt_make_string(ptr @.str.lit.17, i64 4)
  %t3027 = call i64 @rt_string_eq(i64 %a0, i64 %t3026)
  %t3028 = icmp ne i64 %t3027, 1
  br i1 %t3028, label %then1153, label %else1154
then1153:
  %t3029 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3029
else1154:
  %t3030 = call i64 @rt_make_string(ptr @.str.lit.18, i64 6)
  %t3031 = call i64 @rt_string_eq(i64 %a0, i64 %t3030)
  %t3032 = icmp ne i64 %t3031, 1
  br i1 %t3032, label %then1155, label %else1156
then1155:
  %t3033 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3033
else1156:
  %t3034 = call i64 @rt_make_string(ptr @.str.lit.19, i64 7)
  %t3035 = call i64 @rt_string_eq(i64 %a0, i64 %t3034)
  %t3036 = icmp ne i64 %t3035, 1
  br i1 %t3036, label %then1157, label %else1158
then1157:
  %t3037 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3037
else1158:
  %t3038 = call i64 @rt_make_string(ptr @.str.lit.20, i64 3)
  %t3039 = call i64 @rt_string_eq(i64 %a0, i64 %t3038)
  %t3040 = icmp ne i64 %t3039, 1
  br i1 %t3040, label %then1159, label %else1160
then1159:
  %t3041 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3041
else1160:
  %t3042 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3042
}

define fastcc i64 @"emit.internal:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3047 = icmp eq i64 %argc, 3
  br i1 %t3047, label %argok1162, label %arityerr1161
arityerr1161:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1162:
  %t3048 = or i64 %a2, 8
  %t3049 = and i64 %t3048, 7
  %t3050 = icmp eq i64 %t3049, 0
  br i1 %t3050, label %fixfast1163, label %fixslow1164
fixfast1163:
  %t3051 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3052 = extractvalue {i64, i1} %t3051, 0
  %t3053 = extractvalue {i64, i1} %t3051, 1
  br i1 %t3053, label %fixslow1164, label %fixmerge1165
fixslow1164:
  %t3054 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1165
fixmerge1165:
  %t3055 = phi i64 [ %t3052, %fixfast1163 ], [ %t3054, %fixslow1164 ]
  %t3056 = or i64 %t3055, 8
  %t3057 = and i64 %t3056, 7
  %t3058 = icmp eq i64 %t3057, 0
  br i1 %t3058, label %fixfast1166, label %fixslow1167
fixfast1166:
  %t3059 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3055, i64 8)
  %t3060 = extractvalue {i64, i1} %t3059, 0
  %t3061 = extractvalue {i64, i1} %t3059, 1
  br i1 %t3061, label %fixslow1167, label %fixmerge1168
fixslow1167:
  %t3062 = call i64 @rt_add(i64 %t3055, i64 8)
  br label %fixmerge1168
fixmerge1168:
  %t3063 = phi i64 [ %t3060, %fixfast1166 ], [ %t3062, %fixslow1167 ]
  %t3064 = load i64, ptr @"emit.internal:rd-token-end"
  %t3065 = and i64 %t3064, -8
  %t3066 = inttoptr i64 %t3065 to ptr
  %t3067 = load i64, ptr %t3066
  %t3068 = inttoptr i64 %t3067 to ptr
  %t3069 = call fastcc i64%t3068(i64 %t3064, i64 3, i64 %a0, i64 %a1, i64 %t3063, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3070 = call i64 @rt_substring(i64 %a0, i64 %t3055, i64 %t3069)
  %t3071 = call i64 @rt_string_length(i64 %t3070)
  %t3072 = or i64 %t3071, 8
  %t3073 = and i64 %t3072, 7
  %t3074 = icmp eq i64 %t3073, 0
  br i1 %t3074, label %fixfast1169, label %fixslow1170
fixfast1169:
  %t3075 = icmp eq i64 %t3071, 8
  %t3076 = select i1 %t3075, i64 257, i64 1
  br label %fixmerge1171
fixslow1170:
  %t3077 = call i64 @rt_num_eq(i64 %t3071, i64 8)
  br label %fixmerge1171
fixmerge1171:
  %t3078 = phi i64 [ %t3076, %fixfast1169 ], [ %t3077, %fixslow1170 ]
  %t3079 = icmp ne i64 %t3078, 1
  br i1 %t3079, label %then1172, label %else1173
then1172:
  %t3080 = call i64 @rt_string_ref(i64 %a0, i64 %t3055)
  %t3081 = call i64 @rt_cons(i64 %t3080, i64 %t3069)
  ret i64 %t3081
else1173:
  %t3082 = load i64, ptr @"emit.internal:rd-char-name"
  %t3083 = and i64 %t3082, -8
  %t3084 = inttoptr i64 %t3083 to ptr
  %t3085 = load i64, ptr %t3084
  %t3086 = inttoptr i64 %t3085 to ptr
  %t3087 = call fastcc i64%t3086(i64 %t3082, i64 1, i64 %t3070, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3088 = call i64 @rt_cons(i64 %t3087, i64 %t3069)
  ret i64 %t3088
}

define fastcc i64 @"emit.internal:code_885"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3093 = icmp eq i64 %argc, 2
  br i1 %t3093, label %argok1175, label %arityerr1174
arityerr1174:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1175:
  %t3094 = and i64 %self, -8
  %t3095 = inttoptr i64 %t3094 to ptr
  %t3096 = getelementptr i64, ptr %t3095, i64 1
  %t3097 = load i64, ptr %t3096
  %t3098 = or i64 %a0, %t3097
  %t3099 = and i64 %t3098, 7
  %t3100 = icmp eq i64 %t3099, 0
  br i1 %t3100, label %fixfast1176, label %fixslow1177
fixfast1176:
  %t3101 = icmp slt i64 %a0, %t3097
  %t3102 = select i1 %t3101, i64 257, i64 1
  br label %fixmerge1178
fixslow1177:
  %t3103 = call i64 @rt_lt(i64 %a0, i64 %t3097)
  br label %fixmerge1178
fixmerge1178:
  %t3104 = phi i64 [ %t3102, %fixfast1176 ], [ %t3103, %fixslow1177 ]
  %t3105 = icmp ne i64 %t3104, 1
  br i1 %t3105, label %then1179, label %else1180
then1179:
  %t3106 = and i64 %self, -8
  %t3107 = inttoptr i64 %t3106 to ptr
  %t3108 = getelementptr i64, ptr %t3107, i64 2
  %t3109 = load i64, ptr %t3108
  %t3110 = call i64 @rt_string_ref(i64 %t3109, i64 %a0)
  %t3111 = call i64 @rt_char_to_integer(i64 %t3110)
  %t3112 = or i64 %t3111, 992
  %t3113 = and i64 %t3112, 7
  %t3114 = icmp eq i64 %t3113, 0
  br i1 %t3114, label %fixfast1181, label %fixslow1182
fixfast1181:
  %t3115 = icmp eq i64 %t3111, 992
  %t3116 = select i1 %t3115, i64 257, i64 1
  br label %fixmerge1183
fixslow1182:
  %t3117 = call i64 @rt_num_eq(i64 %t3111, i64 992)
  br label %fixmerge1183
fixmerge1183:
  %t3118 = phi i64 [ %t3116, %fixfast1181 ], [ %t3117, %fixslow1182 ]
  %t3119 = icmp ne i64 %t3118, 1
  br i1 %t3119, label %then1184, label %else1185
then1184:
  %t3120 = load i64, ptr @"emit.internal:reverse"
  %t3121 = and i64 %t3120, -8
  %t3122 = inttoptr i64 %t3121 to ptr
  %t3123 = load i64, ptr %t3122
  %t3124 = inttoptr i64 %t3123 to ptr
  %t3125 = call fastcc i64%t3124(i64 %t3120, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3126 = call i64 @rt_list_to_string(i64 %t3125)
  %t3127 = call i64 @rt_string_to_symbol(i64 %t3126)
  %t3128 = or i64 %a0, 8
  %t3129 = and i64 %t3128, 7
  %t3130 = icmp eq i64 %t3129, 0
  br i1 %t3130, label %fixfast1186, label %fixslow1187
fixfast1186:
  %t3131 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3132 = extractvalue {i64, i1} %t3131, 0
  %t3133 = extractvalue {i64, i1} %t3131, 1
  br i1 %t3133, label %fixslow1187, label %fixmerge1188
fixslow1187:
  %t3134 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1188
fixmerge1188:
  %t3135 = phi i64 [ %t3132, %fixfast1186 ], [ %t3134, %fixslow1187 ]
  %t3136 = call i64 @rt_cons(i64 %t3127, i64 %t3135)
  ret i64 %t3136
else1185:
  %t3137 = or i64 %t3111, 736
  %t3138 = and i64 %t3137, 7
  %t3139 = icmp eq i64 %t3138, 0
  br i1 %t3139, label %fixfast1189, label %fixslow1190
fixfast1189:
  %t3140 = icmp eq i64 %t3111, 736
  %t3141 = select i1 %t3140, i64 257, i64 1
  br label %fixmerge1191
fixslow1190:
  %t3142 = call i64 @rt_num_eq(i64 %t3111, i64 736)
  br label %fixmerge1191
fixmerge1191:
  %t3143 = phi i64 [ %t3141, %fixfast1189 ], [ %t3142, %fixslow1190 ]
  %t3144 = icmp ne i64 %t3143, 1
  br i1 %t3144, label %then1192, label %else1193
then1192:
  %t3145 = or i64 %a0, 8
  %t3146 = and i64 %t3145, 7
  %t3147 = icmp eq i64 %t3146, 0
  br i1 %t3147, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t3148 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3149 = extractvalue {i64, i1} %t3148, 0
  %t3150 = extractvalue {i64, i1} %t3148, 1
  br i1 %t3150, label %fixslow1196, label %fixmerge1197
fixslow1196:
  %t3151 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1197
fixmerge1197:
  %t3152 = phi i64 [ %t3149, %fixfast1195 ], [ %t3151, %fixslow1196 ]
  %t3153 = and i64 %self, -8
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = getelementptr i64, ptr %t3154, i64 1
  %t3156 = load i64, ptr %t3155
  %t3157 = or i64 %t3152, %t3156
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t3160 = icmp slt i64 %t3152, %t3156
  %t3161 = select i1 %t3160, i64 257, i64 1
  br label %fixmerge1200
fixslow1199:
  %t3162 = call i64 @rt_lt(i64 %t3152, i64 %t3156)
  br label %fixmerge1200
fixmerge1200:
  %t3163 = phi i64 [ %t3161, %fixfast1198 ], [ %t3162, %fixslow1199 ]
  br label %merge1194
else1193:
  br label %merge1194
merge1194:
  %t3164 = phi i64 [ %t3163, %fixmerge1200 ], [ 1, %else1193 ]
  %t3165 = icmp ne i64 %t3164, 1
  br i1 %t3165, label %then1201, label %else1202
then1201:
  %t3166 = and i64 %self, -8
  %t3167 = inttoptr i64 %t3166 to ptr
  %t3168 = getelementptr i64, ptr %t3167, i64 2
  %t3169 = load i64, ptr %t3168
  %t3170 = or i64 %a0, 8
  %t3171 = and i64 %t3170, 7
  %t3172 = icmp eq i64 %t3171, 0
  br i1 %t3172, label %fixfast1203, label %fixslow1204
fixfast1203:
  %t3173 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3174 = extractvalue {i64, i1} %t3173, 0
  %t3175 = extractvalue {i64, i1} %t3173, 1
  br i1 %t3175, label %fixslow1204, label %fixmerge1205
fixslow1204:
  %t3176 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1205
fixmerge1205:
  %t3177 = phi i64 [ %t3174, %fixfast1203 ], [ %t3176, %fixslow1204 ]
  %t3178 = call i64 @rt_string_ref(i64 %t3169, i64 %t3177)
  %t3179 = call i64 @rt_char_to_integer(i64 %t3178)
  %t3180 = or i64 %t3179, 960
  %t3181 = and i64 %t3180, 7
  %t3182 = icmp eq i64 %t3181, 0
  br i1 %t3182, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t3183 = icmp eq i64 %t3179, 960
  %t3184 = select i1 %t3183, i64 257, i64 1
  br label %fixmerge1208
fixslow1207:
  %t3185 = call i64 @rt_num_eq(i64 %t3179, i64 960)
  br label %fixmerge1208
fixmerge1208:
  %t3186 = phi i64 [ %t3184, %fixfast1206 ], [ %t3185, %fixslow1207 ]
  %t3187 = icmp ne i64 %t3186, 1
  br i1 %t3187, label %then1209, label %else1210
then1209:
  %t3188 = and i64 %self, -8
  %t3189 = inttoptr i64 %t3188 to ptr
  %t3190 = getelementptr i64, ptr %t3189, i64 2
  %t3191 = load i64, ptr %t3190
  %t3192 = and i64 %self, -8
  %t3193 = inttoptr i64 %t3192 to ptr
  %t3194 = getelementptr i64, ptr %t3193, i64 1
  %t3195 = load i64, ptr %t3194
  %t3196 = or i64 %a0, 16
  %t3197 = and i64 %t3196, 7
  %t3198 = icmp eq i64 %t3197, 0
  br i1 %t3198, label %fixfast1211, label %fixslow1212
fixfast1211:
  %t3199 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3200 = extractvalue {i64, i1} %t3199, 0
  %t3201 = extractvalue {i64, i1} %t3199, 1
  br i1 %t3201, label %fixslow1212, label %fixmerge1213
fixslow1212:
  %t3202 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1213
fixmerge1213:
  %t3203 = phi i64 [ %t3200, %fixfast1211 ], [ %t3202, %fixslow1212 ]
  %t3204 = load i64, ptr @"emit.internal:rd-hex"
  %t3205 = and i64 %t3204, -8
  %t3206 = inttoptr i64 %t3205 to ptr
  %t3207 = load i64, ptr %t3206
  %t3208 = inttoptr i64 %t3207 to ptr
  %t3209 = call fastcc i64%t3208(i64 %t3204, i64 4, i64 %t3191, i64 %t3195, i64 %t3203, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3210 = call i64 @rt_cdr(i64 %t3209)
  %t3211 = call i64 @rt_car(i64 %t3209)
  %t3212 = call i64 @rt_integer_to_char(i64 %t3211)
  %t3213 = call i64 @rt_cons(i64 %t3212, i64 %a1)
  %t3214 = musttail call fastcc i64 @"emit.internal:code_885"(i64 %self, i64 2, i64 %t3210, i64 %t3213, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3214
else1210:
  %t3215 = or i64 %a0, 16
  %t3216 = and i64 %t3215, 7
  %t3217 = icmp eq i64 %t3216, 0
  br i1 %t3217, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t3218 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3219 = extractvalue {i64, i1} %t3218, 0
  %t3220 = extractvalue {i64, i1} %t3218, 1
  br i1 %t3220, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t3221 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1216
fixmerge1216:
  %t3222 = phi i64 [ %t3219, %fixfast1214 ], [ %t3221, %fixslow1215 ]
  %t3223 = load i64, ptr @"emit.internal:rd-str-esc"
  %t3224 = and i64 %t3223, -8
  %t3225 = inttoptr i64 %t3224 to ptr
  %t3226 = load i64, ptr %t3225
  %t3227 = inttoptr i64 %t3226 to ptr
  %t3228 = call fastcc i64%t3227(i64 %t3223, i64 1, i64 %t3178, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3229 = call i64 @rt_cons(i64 %t3228, i64 %a1)
  %t3230 = musttail call fastcc i64 @"emit.internal:code_885"(i64 %self, i64 2, i64 %t3222, i64 %t3229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3230
else1202:
  %t3231 = or i64 %a0, 8
  %t3232 = and i64 %t3231, 7
  %t3233 = icmp eq i64 %t3232, 0
  br i1 %t3233, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t3234 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3235 = extractvalue {i64, i1} %t3234, 0
  %t3236 = extractvalue {i64, i1} %t3234, 1
  br i1 %t3236, label %fixslow1218, label %fixmerge1219
fixslow1218:
  %t3237 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1219
fixmerge1219:
  %t3238 = phi i64 [ %t3235, %fixfast1217 ], [ %t3237, %fixslow1218 ]
  %t3239 = call i64 @rt_cons(i64 %t3110, i64 %a1)
  %t3240 = musttail call fastcc i64 @"emit.internal:code_885"(i64 %self, i64 2, i64 %t3238, i64 %t3239, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3240
else1180:
  %t3241 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3242 = and i64 %self, -8
  %t3243 = inttoptr i64 %t3242 to ptr
  %t3244 = getelementptr i64, ptr %t3243, i64 4
  %t3245 = load i64, ptr %t3244
  %t3246 = load i64, ptr @"emit.internal:rd-fail"
  %t3247 = and i64 %t3246, -8
  %t3248 = inttoptr i64 %t3247 to ptr
  %t3249 = load i64, ptr %t3248
  %t3250 = inttoptr i64 %t3249 to ptr
  %t3251 = musttail call fastcc i64 %t3250(i64 %t3246, i64 2, i64 %t3241, i64 %t3245, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3251
}

define fastcc i64 @"emit.internal:code:rd-bar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3252 = icmp eq i64 %argc, 4
  br i1 %t3252, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1221:
  %t3253 = call ptr @rt_alloc_words(i64 5)
  %t3254 = ptrtoint ptr %t3253 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_885" to i64), ptr %t3253
  %t3255 = or i64 %t3254, 4
  %t3256 = getelementptr i64, ptr %t3253, i64 1
  store i64 %a1, ptr %t3256
  %t3257 = getelementptr i64, ptr %t3253, i64 2
  store i64 %a0, ptr %t3257
  %t3258 = getelementptr i64, ptr %t3253, i64 3
  store i64 %t3255, ptr %t3258
  %t3259 = getelementptr i64, ptr %t3253, i64 4
  store i64 %a3, ptr %t3259
  %t3260 = musttail call fastcc i64 @"emit.internal:code_885"(i64 %t3255, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3260
}

define fastcc i64 @"emit.internal:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3265 = icmp eq i64 %argc, 4
  br i1 %t3265, label %argok1223, label %arityerr1222
arityerr1222:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1223:
  %t3266 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3267 = and i64 %t3266, -8
  %t3268 = inttoptr i64 %t3267 to ptr
  %t3269 = load i64, ptr %t3268
  %t3270 = inttoptr i64 %t3269 to ptr
  %t3271 = call fastcc i64%t3270(i64 %t3266, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3272 = load i64, ptr @"emit.internal:rd-datum"
  %t3273 = and i64 %t3272, -8
  %t3274 = inttoptr i64 %t3273 to ptr
  %t3275 = load i64, ptr %t3274
  %t3276 = inttoptr i64 %t3275 to ptr
  %t3277 = call fastcc i64%t3276(i64 %t3272, i64 4, i64 %a0, i64 %a1, i64 %t3271, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3278 = call i64 @rt_cdr(i64 %t3277)
  %t3279 = load i64, ptr @"emit.internal:rd-fail?"
  %t3280 = and i64 %t3279, -8
  %t3281 = inttoptr i64 %t3280 to ptr
  %t3282 = load i64, ptr %t3281
  %t3283 = inttoptr i64 %t3282 to ptr
  %t3284 = call fastcc i64%t3283(i64 %t3279, i64 1, i64 %t3278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3285 = icmp ne i64 %t3284, 1
  br i1 %t3285, label %then1224, label %else1225
then1224:
  ret i64 %t3277
else1225:
  %t3286 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3287 = call i64 @rt_car(i64 %t3277)
  %t3288 = load i64, ptr @"emit.internal:list"
  %t3289 = and i64 %t3288, -8
  %t3290 = inttoptr i64 %t3289 to ptr
  %t3291 = load i64, ptr %t3290
  %t3292 = inttoptr i64 %t3291 to ptr
  %t3293 = call fastcc i64%t3292(i64 %t3288, i64 2, i64 %t3286, i64 %t3287, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3294 = call i64 @rt_cdr(i64 %t3277)
  %t3295 = call i64 @rt_cons(i64 %t3293, i64 %t3294)
  ret i64 %t3295
}

define fastcc i64 @"emit.internal:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3300 = icmp eq i64 %argc, 4
  br i1 %t3300, label %argok1227, label %arityerr1226
arityerr1226:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1227:
  %t3301 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3302 = and i64 %t3301, -8
  %t3303 = inttoptr i64 %t3302 to ptr
  %t3304 = load i64, ptr %t3303
  %t3305 = inttoptr i64 %t3304 to ptr
  %t3306 = call fastcc i64%t3305(i64 %t3301, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3307 = load i64, ptr @"emit.internal:rd-datum"
  %t3308 = and i64 %t3307, -8
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = load i64, ptr %t3309
  %t3311 = inttoptr i64 %t3310 to ptr
  %t3312 = call fastcc i64%t3311(i64 %t3307, i64 4, i64 %a0, i64 %a1, i64 %t3306, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3313 = call i64 @rt_cdr(i64 %t3312)
  %t3314 = load i64, ptr @"emit.internal:rd-fail?"
  %t3315 = and i64 %t3314, -8
  %t3316 = inttoptr i64 %t3315 to ptr
  %t3317 = load i64, ptr %t3316
  %t3318 = inttoptr i64 %t3317 to ptr
  %t3319 = call fastcc i64%t3318(i64 %t3314, i64 1, i64 %t3313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3320 = icmp ne i64 %t3319, 1
  br i1 %t3320, label %then1228, label %else1229
then1228:
  ret i64 %t3312
else1229:
  %t3321 = call i64 @rt_intern(ptr @.str.sym.23)
  %t3322 = call i64 @rt_car(i64 %t3312)
  %t3323 = load i64, ptr @"emit.internal:list"
  %t3324 = and i64 %t3323, -8
  %t3325 = inttoptr i64 %t3324 to ptr
  %t3326 = load i64, ptr %t3325
  %t3327 = inttoptr i64 %t3326 to ptr
  %t3328 = call fastcc i64%t3327(i64 %t3323, i64 2, i64 %t3321, i64 %t3322, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3329 = call i64 @rt_cdr(i64 %t3312)
  %t3330 = call i64 @rt_cons(i64 %t3328, i64 %t3329)
  ret i64 %t3330
}

define fastcc i64 @"emit.internal:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3335 = icmp eq i64 %argc, 4
  br i1 %t3335, label %argok1231, label %arityerr1230
arityerr1230:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1231:
  %t3336 = or i64 %a2, %a1
  %t3337 = and i64 %t3336, 7
  %t3338 = icmp eq i64 %t3337, 0
  br i1 %t3338, label %fixfast1232, label %fixslow1233
fixfast1232:
  %t3339 = icmp slt i64 %a2, %a1
  %t3340 = select i1 %t3339, i64 257, i64 1
  br label %fixmerge1234
fixslow1233:
  %t3341 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1234
fixmerge1234:
  %t3342 = phi i64 [ %t3340, %fixfast1232 ], [ %t3341, %fixslow1233 ]
  %t3343 = icmp ne i64 %t3342, 1
  br i1 %t3343, label %then1235, label %else1236
then1235:
  %t3344 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3345 = call i64 @rt_char_to_integer(i64 %t3344)
  %t3346 = or i64 %t3345, 512
  %t3347 = and i64 %t3346, 7
  %t3348 = icmp eq i64 %t3347, 0
  br i1 %t3348, label %fixfast1238, label %fixslow1239
fixfast1238:
  %t3349 = icmp eq i64 %t3345, 512
  %t3350 = select i1 %t3349, i64 257, i64 1
  br label %fixmerge1240
fixslow1239:
  %t3351 = call i64 @rt_num_eq(i64 %t3345, i64 512)
  br label %fixmerge1240
fixmerge1240:
  %t3352 = phi i64 [ %t3350, %fixfast1238 ], [ %t3351, %fixslow1239 ]
  br label %merge1237
else1236:
  br label %merge1237
merge1237:
  %t3353 = phi i64 [ %t3352, %fixmerge1240 ], [ 1, %else1236 ]
  %t3354 = icmp ne i64 %t3353, 1
  br i1 %t3354, label %then1241, label %else1242
then1241:
  %t3355 = or i64 %a2, 8
  %t3356 = and i64 %t3355, 7
  %t3357 = icmp eq i64 %t3356, 0
  br i1 %t3357, label %fixfast1243, label %fixslow1244
fixfast1243:
  %t3358 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3359 = extractvalue {i64, i1} %t3358, 0
  %t3360 = extractvalue {i64, i1} %t3358, 1
  br i1 %t3360, label %fixslow1244, label %fixmerge1245
fixslow1244:
  %t3361 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1245
fixmerge1245:
  %t3362 = phi i64 [ %t3359, %fixfast1243 ], [ %t3361, %fixslow1244 ]
  %t3363 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3364 = and i64 %t3363, -8
  %t3365 = inttoptr i64 %t3364 to ptr
  %t3366 = load i64, ptr %t3365
  %t3367 = inttoptr i64 %t3366 to ptr
  %t3368 = call fastcc i64%t3367(i64 %t3363, i64 3, i64 %a0, i64 %a1, i64 %t3362, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3369 = load i64, ptr @"emit.internal:rd-datum"
  %t3370 = and i64 %t3369, -8
  %t3371 = inttoptr i64 %t3370 to ptr
  %t3372 = load i64, ptr %t3371
  %t3373 = inttoptr i64 %t3372 to ptr
  %t3374 = call fastcc i64%t3373(i64 %t3369, i64 4, i64 %a0, i64 %a1, i64 %t3368, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3375 = call i64 @rt_cdr(i64 %t3374)
  %t3376 = load i64, ptr @"emit.internal:rd-fail?"
  %t3377 = and i64 %t3376, -8
  %t3378 = inttoptr i64 %t3377 to ptr
  %t3379 = load i64, ptr %t3378
  %t3380 = inttoptr i64 %t3379 to ptr
  %t3381 = call fastcc i64%t3380(i64 %t3376, i64 1, i64 %t3375, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3382 = icmp ne i64 %t3381, 1
  br i1 %t3382, label %then1246, label %else1247
then1246:
  ret i64 %t3374
else1247:
  %t3383 = call i64 @rt_intern(ptr @.str.sym.24)
  %t3384 = call i64 @rt_car(i64 %t3374)
  %t3385 = load i64, ptr @"emit.internal:list"
  %t3386 = and i64 %t3385, -8
  %t3387 = inttoptr i64 %t3386 to ptr
  %t3388 = load i64, ptr %t3387
  %t3389 = inttoptr i64 %t3388 to ptr
  %t3390 = call fastcc i64%t3389(i64 %t3385, i64 2, i64 %t3383, i64 %t3384, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3391 = call i64 @rt_cdr(i64 %t3374)
  %t3392 = call i64 @rt_cons(i64 %t3390, i64 %t3391)
  ret i64 %t3392
else1242:
  %t3393 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3394 = and i64 %t3393, -8
  %t3395 = inttoptr i64 %t3394 to ptr
  %t3396 = load i64, ptr %t3395
  %t3397 = inttoptr i64 %t3396 to ptr
  %t3398 = call fastcc i64%t3397(i64 %t3393, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3399 = load i64, ptr @"emit.internal:rd-datum"
  %t3400 = and i64 %t3399, -8
  %t3401 = inttoptr i64 %t3400 to ptr
  %t3402 = load i64, ptr %t3401
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = call fastcc i64%t3403(i64 %t3399, i64 4, i64 %a0, i64 %a1, i64 %t3398, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3405 = call i64 @rt_cdr(i64 %t3404)
  %t3406 = load i64, ptr @"emit.internal:rd-fail?"
  %t3407 = and i64 %t3406, -8
  %t3408 = inttoptr i64 %t3407 to ptr
  %t3409 = load i64, ptr %t3408
  %t3410 = inttoptr i64 %t3409 to ptr
  %t3411 = call fastcc i64%t3410(i64 %t3406, i64 1, i64 %t3405, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3412 = icmp ne i64 %t3411, 1
  br i1 %t3412, label %then1248, label %else1249
then1248:
  ret i64 %t3404
else1249:
  %t3413 = call i64 @rt_intern(ptr @.str.sym.25)
  %t3414 = call i64 @rt_car(i64 %t3404)
  %t3415 = load i64, ptr @"emit.internal:list"
  %t3416 = and i64 %t3415, -8
  %t3417 = inttoptr i64 %t3416 to ptr
  %t3418 = load i64, ptr %t3417
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = call fastcc i64%t3419(i64 %t3415, i64 2, i64 %t3413, i64 %t3414, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3421 = call i64 @rt_cdr(i64 %t3404)
  %t3422 = call i64 @rt_cons(i64 %t3420, i64 %t3421)
  ret i64 %t3422
}

define fastcc i64 @"emit.internal:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3427 = icmp eq i64 %argc, 3
  br i1 %t3427, label %argok1251, label %arityerr1250
arityerr1250:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1251:
  %t3428 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3429 = call i64 @rt_char_to_integer(i64 %t3428)
  %t3430 = or i64 %t3429, 368
  %t3431 = and i64 %t3430, 7
  %t3432 = icmp eq i64 %t3431, 0
  br i1 %t3432, label %fixfast1252, label %fixslow1253
fixfast1252:
  %t3433 = icmp eq i64 %t3429, 368
  %t3434 = select i1 %t3433, i64 257, i64 1
  br label %fixmerge1254
fixslow1253:
  %t3435 = call i64 @rt_num_eq(i64 %t3429, i64 368)
  br label %fixmerge1254
fixmerge1254:
  %t3436 = phi i64 [ %t3434, %fixfast1252 ], [ %t3435, %fixslow1253 ]
  %t3437 = icmp ne i64 %t3436, 1
  br i1 %t3437, label %then1255, label %else1256
then1255:
  %t3438 = or i64 %a2, 8
  %t3439 = and i64 %t3438, 7
  %t3440 = icmp eq i64 %t3439, 0
  br i1 %t3440, label %fixfast1257, label %fixslow1258
fixfast1257:
  %t3441 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3442 = extractvalue {i64, i1} %t3441, 0
  %t3443 = extractvalue {i64, i1} %t3441, 1
  br i1 %t3443, label %fixslow1258, label %fixmerge1259
fixslow1258:
  %t3444 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1259
fixmerge1259:
  %t3445 = phi i64 [ %t3442, %fixfast1257 ], [ %t3444, %fixslow1258 ]
  %t3446 = load i64, ptr @"emit.internal:rd-token-end"
  %t3447 = and i64 %t3446, -8
  %t3448 = inttoptr i64 %t3447 to ptr
  %t3449 = load i64, ptr %t3448
  %t3450 = inttoptr i64 %t3449 to ptr
  %t3451 = call fastcc i64%t3450(i64 %t3446, i64 3, i64 %a0, i64 %a1, i64 %t3445, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3452 = or i64 %a2, 8
  %t3453 = and i64 %t3452, 7
  %t3454 = icmp eq i64 %t3453, 0
  br i1 %t3454, label %fixfast1260, label %fixslow1261
fixfast1260:
  %t3455 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3456 = extractvalue {i64, i1} %t3455, 0
  %t3457 = extractvalue {i64, i1} %t3455, 1
  br i1 %t3457, label %fixslow1261, label %fixmerge1262
fixslow1261:
  %t3458 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1262
fixmerge1262:
  %t3459 = phi i64 [ %t3456, %fixfast1260 ], [ %t3458, %fixslow1261 ]
  %t3460 = or i64 %t3451, %t3459
  %t3461 = and i64 %t3460, 7
  %t3462 = icmp eq i64 %t3461, 0
  br i1 %t3462, label %fixfast1263, label %fixslow1264
fixfast1263:
  %t3463 = icmp eq i64 %t3451, %t3459
  %t3464 = select i1 %t3463, i64 257, i64 1
  br label %fixmerge1265
fixslow1264:
  %t3465 = call i64 @rt_num_eq(i64 %t3451, i64 %t3459)
  br label %fixmerge1265
fixmerge1265:
  %t3466 = phi i64 [ %t3464, %fixfast1263 ], [ %t3465, %fixslow1264 ]
  ret i64 %t3466
else1256:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3471 = icmp eq i64 %argc, 2
  br i1 %t3471, label %argok1267, label %arityerr1266
arityerr1266:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1267:
  %t3472 = call i64 @rt_null_p(i64 %a0)
  %t3473 = icmp ne i64 %t3472, 1
  br i1 %t3473, label %then1268, label %else1269
then1268:
  ret i64 %a1
else1269:
  %t3474 = call i64 @rt_cdr(i64 %a0)
  %t3475 = call i64 @rt_car(i64 %a0)
  %t3476 = call i64 @rt_cons(i64 %t3475, i64 %a1)
  %t3477 = load i64, ptr @"emit.internal:rd-append-reverse"
  %t3478 = and i64 %t3477, -8
  %t3479 = inttoptr i64 %t3478 to ptr
  %t3480 = load i64, ptr %t3479
  %t3481 = inttoptr i64 %t3480 to ptr
  %t3482 = musttail call fastcc i64 %t3481(i64 %t3477, i64 2, i64 %t3474, i64 %t3476, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3482
}

define fastcc i64 @"emit.internal:code:rd-datum-comment?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3487 = icmp eq i64 %argc, 3
  br i1 %t3487, label %argok1271, label %arityerr1270
arityerr1270:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1271:
  %t3488 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3489 = call i64 @rt_char_to_integer(i64 %t3488)
  %t3490 = or i64 %t3489, 280
  %t3491 = and i64 %t3490, 7
  %t3492 = icmp eq i64 %t3491, 0
  br i1 %t3492, label %fixfast1272, label %fixslow1273
fixfast1272:
  %t3493 = icmp eq i64 %t3489, 280
  %t3494 = select i1 %t3493, i64 257, i64 1
  br label %fixmerge1274
fixslow1273:
  %t3495 = call i64 @rt_num_eq(i64 %t3489, i64 280)
  br label %fixmerge1274
fixmerge1274:
  %t3496 = phi i64 [ %t3494, %fixfast1272 ], [ %t3495, %fixslow1273 ]
  %t3497 = icmp ne i64 %t3496, 1
  br i1 %t3497, label %then1275, label %else1276
then1275:
  %t3498 = or i64 %a2, 8
  %t3499 = and i64 %t3498, 7
  %t3500 = icmp eq i64 %t3499, 0
  br i1 %t3500, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t3501 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3502 = extractvalue {i64, i1} %t3501, 0
  %t3503 = extractvalue {i64, i1} %t3501, 1
  br i1 %t3503, label %fixslow1278, label %fixmerge1279
fixslow1278:
  %t3504 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1279
fixmerge1279:
  %t3505 = phi i64 [ %t3502, %fixfast1277 ], [ %t3504, %fixslow1278 ]
  %t3506 = or i64 %t3505, %a1
  %t3507 = and i64 %t3506, 7
  %t3508 = icmp eq i64 %t3507, 0
  br i1 %t3508, label %fixfast1280, label %fixslow1281
fixfast1280:
  %t3509 = icmp slt i64 %t3505, %a1
  %t3510 = select i1 %t3509, i64 257, i64 1
  br label %fixmerge1282
fixslow1281:
  %t3511 = call i64 @rt_lt(i64 %t3505, i64 %a1)
  br label %fixmerge1282
fixmerge1282:
  %t3512 = phi i64 [ %t3510, %fixfast1280 ], [ %t3511, %fixslow1281 ]
  %t3513 = icmp ne i64 %t3512, 1
  br i1 %t3513, label %then1283, label %else1284
then1283:
  %t3514 = or i64 %a2, 8
  %t3515 = and i64 %t3514, 7
  %t3516 = icmp eq i64 %t3515, 0
  br i1 %t3516, label %fixfast1285, label %fixslow1286
fixfast1285:
  %t3517 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3518 = extractvalue {i64, i1} %t3517, 0
  %t3519 = extractvalue {i64, i1} %t3517, 1
  br i1 %t3519, label %fixslow1286, label %fixmerge1287
fixslow1286:
  %t3520 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1287
fixmerge1287:
  %t3521 = phi i64 [ %t3518, %fixfast1285 ], [ %t3520, %fixslow1286 ]
  %t3522 = call i64 @rt_string_ref(i64 %a0, i64 %t3521)
  %t3523 = call i64 @rt_char_to_integer(i64 %t3522)
  %t3524 = or i64 %t3523, 472
  %t3525 = and i64 %t3524, 7
  %t3526 = icmp eq i64 %t3525, 0
  br i1 %t3526, label %fixfast1288, label %fixslow1289
fixfast1288:
  %t3527 = icmp eq i64 %t3523, 472
  %t3528 = select i1 %t3527, i64 257, i64 1
  br label %fixmerge1290
fixslow1289:
  %t3529 = call i64 @rt_num_eq(i64 %t3523, i64 472)
  br label %fixmerge1290
fixmerge1290:
  %t3530 = phi i64 [ %t3528, %fixfast1288 ], [ %t3529, %fixslow1289 ]
  ret i64 %t3530
else1284:
  ret i64 1
else1276:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3535 = icmp eq i64 %argc, 5
  br i1 %t3535, label %argok1292, label %arityerr1291
arityerr1291:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok1292:
  %t3536 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3537 = and i64 %t3536, -8
  %t3538 = inttoptr i64 %t3537 to ptr
  %t3539 = load i64, ptr %t3538
  %t3540 = inttoptr i64 %t3539 to ptr
  %t3541 = call fastcc i64%t3540(i64 %t3536, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3542 = load i64, ptr @"emit.internal:rd-fail?"
  %t3543 = and i64 %t3542, -8
  %t3544 = inttoptr i64 %t3543 to ptr
  %t3545 = load i64, ptr %t3544
  %t3546 = inttoptr i64 %t3545 to ptr
  %t3547 = call fastcc i64%t3546(i64 %t3542, i64 1, i64 %t3541, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3548 = icmp ne i64 %t3547, 1
  br i1 %t3548, label %then1293, label %else1294
then1293:
  %t3549 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3550 = call i64 @rt_cons(i64 %t3549, i64 %t3541)
  ret i64 %t3550
else1294:
  %t3551 = or i64 %t3541, %a1
  %t3552 = and i64 %t3551, 7
  %t3553 = icmp eq i64 %t3552, 0
  br i1 %t3553, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t3554 = icmp slt i64 %t3541, %a1
  %t3555 = select i1 %t3554, i64 257, i64 1
  br label %fixmerge1297
fixslow1296:
  %t3556 = call i64 @rt_lt(i64 %t3541, i64 %a1)
  br label %fixmerge1297
fixmerge1297:
  %t3557 = phi i64 [ %t3555, %fixfast1295 ], [ %t3556, %fixslow1296 ]
  %t3558 = icmp ne i64 %t3557, 1
  br i1 %t3558, label %then1298, label %else1299
then1298:
  %t3559 = call i64 @rt_string_ref(i64 %a0, i64 %t3541)
  %t3560 = call i64 @rt_char_to_integer(i64 %t3559)
  %t3561 = or i64 %t3560, 328
  %t3562 = and i64 %t3561, 7
  %t3563 = icmp eq i64 %t3562, 0
  br i1 %t3563, label %fixfast1300, label %fixslow1301
fixfast1300:
  %t3564 = icmp eq i64 %t3560, 328
  %t3565 = select i1 %t3564, i64 257, i64 1
  br label %fixmerge1302
fixslow1301:
  %t3566 = call i64 @rt_num_eq(i64 %t3560, i64 328)
  br label %fixmerge1302
fixmerge1302:
  %t3567 = phi i64 [ %t3565, %fixfast1300 ], [ %t3566, %fixslow1301 ]
  %t3568 = icmp ne i64 %t3567, 1
  br i1 %t3568, label %then1303, label %else1304
then1303:
  br label %merge1305
else1304:
  %t3569 = or i64 %t3560, 744
  %t3570 = and i64 %t3569, 7
  %t3571 = icmp eq i64 %t3570, 0
  br i1 %t3571, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t3572 = icmp eq i64 %t3560, 744
  %t3573 = select i1 %t3572, i64 257, i64 1
  br label %fixmerge1308
fixslow1307:
  %t3574 = call i64 @rt_num_eq(i64 %t3560, i64 744)
  br label %fixmerge1308
fixmerge1308:
  %t3575 = phi i64 [ %t3573, %fixfast1306 ], [ %t3574, %fixslow1307 ]
  br label %merge1305
merge1305:
  %t3576 = phi i64 [ %t3567, %then1303 ], [ %t3575, %fixmerge1308 ]
  %t3577 = icmp ne i64 %t3576, 1
  br i1 %t3577, label %then1309, label %else1310
then1309:
  %t3578 = load i64, ptr @"emit.internal:reverse"
  %t3579 = and i64 %t3578, -8
  %t3580 = inttoptr i64 %t3579 to ptr
  %t3581 = load i64, ptr %t3580
  %t3582 = inttoptr i64 %t3581 to ptr
  %t3583 = call fastcc i64%t3582(i64 %t3578, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3584 = or i64 %t3541, 8
  %t3585 = and i64 %t3584, 7
  %t3586 = icmp eq i64 %t3585, 0
  br i1 %t3586, label %fixfast1311, label %fixslow1312
fixfast1311:
  %t3587 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3541, i64 8)
  %t3588 = extractvalue {i64, i1} %t3587, 0
  %t3589 = extractvalue {i64, i1} %t3587, 1
  br i1 %t3589, label %fixslow1312, label %fixmerge1313
fixslow1312:
  %t3590 = call i64 @rt_add(i64 %t3541, i64 8)
  br label %fixmerge1313
fixmerge1313:
  %t3591 = phi i64 [ %t3588, %fixfast1311 ], [ %t3590, %fixslow1312 ]
  %t3592 = call i64 @rt_cons(i64 %t3583, i64 %t3591)
  ret i64 %t3592
else1310:
  %t3593 = load i64, ptr @"emit.internal:rd-datum-comment?"
  %t3594 = and i64 %t3593, -8
  %t3595 = inttoptr i64 %t3594 to ptr
  %t3596 = load i64, ptr %t3595
  %t3597 = inttoptr i64 %t3596 to ptr
  %t3598 = call fastcc i64%t3597(i64 %t3593, i64 3, i64 %a0, i64 %a1, i64 %t3541, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3599 = icmp ne i64 %t3598, 1
  br i1 %t3599, label %then1314, label %else1315
then1314:
  %t3600 = or i64 %t3541, 16
  %t3601 = and i64 %t3600, 7
  %t3602 = icmp eq i64 %t3601, 0
  br i1 %t3602, label %fixfast1316, label %fixslow1317
fixfast1316:
  %t3603 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3541, i64 16)
  %t3604 = extractvalue {i64, i1} %t3603, 0
  %t3605 = extractvalue {i64, i1} %t3603, 1
  br i1 %t3605, label %fixslow1317, label %fixmerge1318
fixslow1317:
  %t3606 = call i64 @rt_add(i64 %t3541, i64 16)
  br label %fixmerge1318
fixmerge1318:
  %t3607 = phi i64 [ %t3604, %fixfast1316 ], [ %t3606, %fixslow1317 ]
  %t3608 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3609 = and i64 %t3608, -8
  %t3610 = inttoptr i64 %t3609 to ptr
  %t3611 = load i64, ptr %t3610
  %t3612 = inttoptr i64 %t3611 to ptr
  %t3613 = call fastcc i64%t3612(i64 %t3608, i64 3, i64 %a0, i64 %a1, i64 %t3607, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3614 = load i64, ptr @"emit.internal:rd-datum"
  %t3615 = and i64 %t3614, -8
  %t3616 = inttoptr i64 %t3615 to ptr
  %t3617 = load i64, ptr %t3616
  %t3618 = inttoptr i64 %t3617 to ptr
  %t3619 = call fastcc i64%t3618(i64 %t3614, i64 4, i64 %a0, i64 %a1, i64 %t3613, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3620 = call i64 @rt_cdr(i64 %t3619)
  %t3621 = load i64, ptr @"emit.internal:rd-fail?"
  %t3622 = and i64 %t3621, -8
  %t3623 = inttoptr i64 %t3622 to ptr
  %t3624 = load i64, ptr %t3623
  %t3625 = inttoptr i64 %t3624 to ptr
  %t3626 = call fastcc i64%t3625(i64 %t3621, i64 1, i64 %t3620, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3627 = icmp ne i64 %t3626, 1
  br i1 %t3627, label %then1319, label %else1320
then1319:
  ret i64 %t3619
else1320:
  %t3628 = call i64 @rt_cdr(i64 %t3619)
  %t3629 = load i64, ptr @"emit.internal:rd-list"
  %t3630 = and i64 %t3629, -8
  %t3631 = inttoptr i64 %t3630 to ptr
  %t3632 = load i64, ptr %t3631
  %t3633 = inttoptr i64 %t3632 to ptr
  %t3634 = musttail call fastcc i64 %t3633(i64 %t3629, i64 5, i64 %a0, i64 %a1, i64 %t3628, i64 %a3, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3634
else1315:
  %t3635 = load i64, ptr @"emit.internal:rd-dot?"
  %t3636 = and i64 %t3635, -8
  %t3637 = inttoptr i64 %t3636 to ptr
  %t3638 = load i64, ptr %t3637
  %t3639 = inttoptr i64 %t3638 to ptr
  %t3640 = call fastcc i64%t3639(i64 %t3635, i64 3, i64 %a0, i64 %a1, i64 %t3541, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3641 = icmp ne i64 %t3640, 1
  br i1 %t3641, label %then1321, label %else1322
then1321:
  %t3642 = or i64 %t3541, 8
  %t3643 = and i64 %t3642, 7
  %t3644 = icmp eq i64 %t3643, 0
  br i1 %t3644, label %fixfast1323, label %fixslow1324
fixfast1323:
  %t3645 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3541, i64 8)
  %t3646 = extractvalue {i64, i1} %t3645, 0
  %t3647 = extractvalue {i64, i1} %t3645, 1
  br i1 %t3647, label %fixslow1324, label %fixmerge1325
fixslow1324:
  %t3648 = call i64 @rt_add(i64 %t3541, i64 8)
  br label %fixmerge1325
fixmerge1325:
  %t3649 = phi i64 [ %t3646, %fixfast1323 ], [ %t3648, %fixslow1324 ]
  %t3650 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3651 = and i64 %t3650, -8
  %t3652 = inttoptr i64 %t3651 to ptr
  %t3653 = load i64, ptr %t3652
  %t3654 = inttoptr i64 %t3653 to ptr
  %t3655 = call fastcc i64%t3654(i64 %t3650, i64 3, i64 %a0, i64 %a1, i64 %t3649, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3656 = load i64, ptr @"emit.internal:rd-datum"
  %t3657 = and i64 %t3656, -8
  %t3658 = inttoptr i64 %t3657 to ptr
  %t3659 = load i64, ptr %t3658
  %t3660 = inttoptr i64 %t3659 to ptr
  %t3661 = call fastcc i64%t3660(i64 %t3656, i64 4, i64 %a0, i64 %a1, i64 %t3655, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3662 = call i64 @rt_cdr(i64 %t3661)
  %t3663 = load i64, ptr @"emit.internal:rd-fail?"
  %t3664 = and i64 %t3663, -8
  %t3665 = inttoptr i64 %t3664 to ptr
  %t3666 = load i64, ptr %t3665
  %t3667 = inttoptr i64 %t3666 to ptr
  %t3668 = call fastcc i64%t3667(i64 %t3663, i64 1, i64 %t3662, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3669 = icmp ne i64 %t3668, 1
  br i1 %t3669, label %then1326, label %else1327
then1326:
  ret i64 %t3661
else1327:
  %t3670 = call i64 @rt_cdr(i64 %t3661)
  %t3671 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3672 = and i64 %t3671, -8
  %t3673 = inttoptr i64 %t3672 to ptr
  %t3674 = load i64, ptr %t3673
  %t3675 = inttoptr i64 %t3674 to ptr
  %t3676 = call fastcc i64%t3675(i64 %t3671, i64 3, i64 %a0, i64 %a1, i64 %t3670, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3677 = load i64, ptr @"emit.internal:rd-fail?"
  %t3678 = and i64 %t3677, -8
  %t3679 = inttoptr i64 %t3678 to ptr
  %t3680 = load i64, ptr %t3679
  %t3681 = inttoptr i64 %t3680 to ptr
  %t3682 = call fastcc i64%t3681(i64 %t3677, i64 1, i64 %t3676, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3683 = icmp ne i64 %t3682, 1
  br i1 %t3683, label %then1328, label %else1329
then1328:
  %t3684 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3685 = call i64 @rt_cons(i64 %t3684, i64 %t3676)
  ret i64 %t3685
else1329:
  %t3686 = call i64 @rt_car(i64 %t3661)
  %t3687 = load i64, ptr @"emit.internal:rd-append-reverse"
  %t3688 = and i64 %t3687, -8
  %t3689 = inttoptr i64 %t3688 to ptr
  %t3690 = load i64, ptr %t3689
  %t3691 = inttoptr i64 %t3690 to ptr
  %t3692 = call fastcc i64%t3691(i64 %t3687, i64 2, i64 %a3, i64 %t3686, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3693 = or i64 %t3676, 8
  %t3694 = and i64 %t3693, 7
  %t3695 = icmp eq i64 %t3694, 0
  br i1 %t3695, label %fixfast1330, label %fixslow1331
fixfast1330:
  %t3696 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3676, i64 8)
  %t3697 = extractvalue {i64, i1} %t3696, 0
  %t3698 = extractvalue {i64, i1} %t3696, 1
  br i1 %t3698, label %fixslow1331, label %fixmerge1332
fixslow1331:
  %t3699 = call i64 @rt_add(i64 %t3676, i64 8)
  br label %fixmerge1332
fixmerge1332:
  %t3700 = phi i64 [ %t3697, %fixfast1330 ], [ %t3699, %fixslow1331 ]
  %t3701 = call i64 @rt_cons(i64 %t3692, i64 %t3700)
  ret i64 %t3701
else1322:
  %t3702 = load i64, ptr @"emit.internal:rd-datum"
  %t3703 = and i64 %t3702, -8
  %t3704 = inttoptr i64 %t3703 to ptr
  %t3705 = load i64, ptr %t3704
  %t3706 = inttoptr i64 %t3705 to ptr
  %t3707 = call fastcc i64%t3706(i64 %t3702, i64 4, i64 %a0, i64 %a1, i64 %t3541, i64 %a4, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3708 = call i64 @rt_cdr(i64 %t3707)
  %t3709 = load i64, ptr @"emit.internal:rd-fail?"
  %t3710 = and i64 %t3709, -8
  %t3711 = inttoptr i64 %t3710 to ptr
  %t3712 = load i64, ptr %t3711
  %t3713 = inttoptr i64 %t3712 to ptr
  %t3714 = call fastcc i64%t3713(i64 %t3709, i64 1, i64 %t3708, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3715 = icmp ne i64 %t3714, 1
  br i1 %t3715, label %then1333, label %else1334
then1333:
  ret i64 %t3707
else1334:
  %t3716 = call i64 @rt_cdr(i64 %t3707)
  %t3717 = call i64 @rt_car(i64 %t3707)
  %t3718 = call i64 @rt_cons(i64 %t3717, i64 %a3)
  %t3719 = load i64, ptr @"emit.internal:rd-list"
  %t3720 = and i64 %t3719, -8
  %t3721 = inttoptr i64 %t3720 to ptr
  %t3722 = load i64, ptr %t3721
  %t3723 = inttoptr i64 %t3722 to ptr
  %t3724 = musttail call fastcc i64 %t3723(i64 %t3719, i64 5, i64 %a0, i64 %a1, i64 %t3716, i64 %t3718, i64 %a4, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3724
else1299:
  %t3725 = load i64, ptr @"emit.internal:reverse"
  %t3726 = and i64 %t3725, -8
  %t3727 = inttoptr i64 %t3726 to ptr
  %t3728 = load i64, ptr %t3727
  %t3729 = inttoptr i64 %t3728 to ptr
  %t3730 = call fastcc i64%t3729(i64 %t3725, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3731 = call i64 @rt_cons(i64 %t3730, i64 %t3541)
  ret i64 %t3731
}

define fastcc i64 @"emit.internal:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3736 = icmp eq i64 %argc, 4
  br i1 %t3736, label %argok1336, label %arityerr1335
arityerr1335:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1336:
  %t3737 = or i64 0, %a2
  %t3738 = and i64 %t3737, 7
  %t3739 = icmp eq i64 %t3738, 0
  br i1 %t3739, label %fixfast1337, label %fixslow1338
fixfast1337:
  %t3740 = icmp slt i64 0, %a2
  %t3741 = select i1 %t3740, i64 257, i64 1
  br label %fixmerge1339
fixslow1338:
  %t3742 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge1339
fixmerge1339:
  %t3743 = phi i64 [ %t3741, %fixfast1337 ], [ %t3742, %fixslow1338 ]
  %t3744 = icmp ne i64 %t3743, 1
  br i1 %t3744, label %then1340, label %else1341
then1340:
  br label %merge1342
else1341:
  %t3745 = or i64 0, %a2
  %t3746 = and i64 %t3745, 7
  %t3747 = icmp eq i64 %t3746, 0
  br i1 %t3747, label %fixfast1343, label %fixslow1344
fixfast1343:
  %t3748 = icmp eq i64 0, %a2
  %t3749 = select i1 %t3748, i64 257, i64 1
  br label %fixmerge1345
fixslow1344:
  %t3750 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge1345
fixmerge1345:
  %t3751 = phi i64 [ %t3749, %fixfast1343 ], [ %t3750, %fixslow1344 ]
  br label %merge1342
merge1342:
  %t3752 = phi i64 [ 257, %then1340 ], [ %t3751, %fixmerge1345 ]
  %t3753 = icmp ne i64 %t3752, 1
  br i1 %t3753, label %then1346, label %else1347
then1346:
  %t3754 = or i64 %a2, %a1
  %t3755 = and i64 %t3754, 7
  %t3756 = icmp eq i64 %t3755, 0
  br i1 %t3756, label %fixfast1349, label %fixslow1350
fixfast1349:
  %t3757 = icmp slt i64 %a2, %a1
  %t3758 = select i1 %t3757, i64 257, i64 1
  br label %fixmerge1351
fixslow1350:
  %t3759 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1351
fixmerge1351:
  %t3760 = phi i64 [ %t3758, %fixfast1349 ], [ %t3759, %fixslow1350 ]
  br label %merge1348
else1347:
  br label %merge1348
merge1348:
  %t3761 = phi i64 [ %t3760, %fixmerge1351 ], [ 1, %else1347 ]
  %t3762 = icmp ne i64 %t3761, 1
  br i1 %t3762, label %then1352, label %else1353
then1352:
  %t3763 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3764 = call i64 @rt_char_to_integer(i64 %t3763)
  %t3765 = or i64 %t3764, 320
  %t3766 = and i64 %t3765, 7
  %t3767 = icmp eq i64 %t3766, 0
  br i1 %t3767, label %fixfast1354, label %fixslow1355
fixfast1354:
  %t3768 = icmp eq i64 %t3764, 320
  %t3769 = select i1 %t3768, i64 257, i64 1
  br label %fixmerge1356
fixslow1355:
  %t3770 = call i64 @rt_num_eq(i64 %t3764, i64 320)
  br label %fixmerge1356
fixmerge1356:
  %t3771 = phi i64 [ %t3769, %fixfast1354 ], [ %t3770, %fixslow1355 ]
  %t3772 = icmp ne i64 %t3771, 1
  br i1 %t3772, label %then1357, label %else1358
then1357:
  %t3773 = or i64 %a2, 8
  %t3774 = and i64 %t3773, 7
  %t3775 = icmp eq i64 %t3774, 0
  br i1 %t3775, label %fixfast1359, label %fixslow1360
fixfast1359:
  %t3776 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3777 = extractvalue {i64, i1} %t3776, 0
  %t3778 = extractvalue {i64, i1} %t3776, 1
  br i1 %t3778, label %fixslow1360, label %fixmerge1361
fixslow1360:
  %t3779 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1361
fixmerge1361:
  %t3780 = phi i64 [ %t3777, %fixfast1359 ], [ %t3779, %fixslow1360 ]
  %t3781 = load i64, ptr @"emit.internal:rd-list"
  %t3782 = and i64 %t3781, -8
  %t3783 = inttoptr i64 %t3782 to ptr
  %t3784 = load i64, ptr %t3783
  %t3785 = inttoptr i64 %t3784 to ptr
  %t3786 = musttail call fastcc i64 %t3785(i64 %t3781, i64 5, i64 %a0, i64 %a1, i64 %t3780, i64 2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3786
else1358:
  %t3787 = or i64 %t3764, 728
  %t3788 = and i64 %t3787, 7
  %t3789 = icmp eq i64 %t3788, 0
  br i1 %t3789, label %fixfast1362, label %fixslow1363
fixfast1362:
  %t3790 = icmp eq i64 %t3764, 728
  %t3791 = select i1 %t3790, i64 257, i64 1
  br label %fixmerge1364
fixslow1363:
  %t3792 = call i64 @rt_num_eq(i64 %t3764, i64 728)
  br label %fixmerge1364
fixmerge1364:
  %t3793 = phi i64 [ %t3791, %fixfast1362 ], [ %t3792, %fixslow1363 ]
  %t3794 = icmp ne i64 %t3793, 1
  br i1 %t3794, label %then1365, label %else1366
then1365:
  %t3795 = or i64 %a2, 8
  %t3796 = and i64 %t3795, 7
  %t3797 = icmp eq i64 %t3796, 0
  br i1 %t3797, label %fixfast1367, label %fixslow1368
fixfast1367:
  %t3798 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3799 = extractvalue {i64, i1} %t3798, 0
  %t3800 = extractvalue {i64, i1} %t3798, 1
  br i1 %t3800, label %fixslow1368, label %fixmerge1369
fixslow1368:
  %t3801 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1369
fixmerge1369:
  %t3802 = phi i64 [ %t3799, %fixfast1367 ], [ %t3801, %fixslow1368 ]
  %t3803 = load i64, ptr @"emit.internal:rd-list"
  %t3804 = and i64 %t3803, -8
  %t3805 = inttoptr i64 %t3804 to ptr
  %t3806 = load i64, ptr %t3805
  %t3807 = inttoptr i64 %t3806 to ptr
  %t3808 = musttail call fastcc i64 %t3807(i64 %t3803, i64 5, i64 %a0, i64 %a1, i64 %t3802, i64 2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3808
else1366:
  %t3809 = or i64 %t3764, 312
  %t3810 = and i64 %t3809, 7
  %t3811 = icmp eq i64 %t3810, 0
  br i1 %t3811, label %fixfast1370, label %fixslow1371
fixfast1370:
  %t3812 = icmp eq i64 %t3764, 312
  %t3813 = select i1 %t3812, i64 257, i64 1
  br label %fixmerge1372
fixslow1371:
  %t3814 = call i64 @rt_num_eq(i64 %t3764, i64 312)
  br label %fixmerge1372
fixmerge1372:
  %t3815 = phi i64 [ %t3813, %fixfast1370 ], [ %t3814, %fixslow1371 ]
  %t3816 = icmp ne i64 %t3815, 1
  br i1 %t3816, label %then1373, label %else1374
then1373:
  %t3817 = or i64 %a2, 8
  %t3818 = and i64 %t3817, 7
  %t3819 = icmp eq i64 %t3818, 0
  br i1 %t3819, label %fixfast1375, label %fixslow1376
fixfast1375:
  %t3820 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3821 = extractvalue {i64, i1} %t3820, 0
  %t3822 = extractvalue {i64, i1} %t3820, 1
  br i1 %t3822, label %fixslow1376, label %fixmerge1377
fixslow1376:
  %t3823 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1377
fixmerge1377:
  %t3824 = phi i64 [ %t3821, %fixfast1375 ], [ %t3823, %fixslow1376 ]
  %t3825 = load i64, ptr @"emit.internal:rd-quote"
  %t3826 = and i64 %t3825, -8
  %t3827 = inttoptr i64 %t3826 to ptr
  %t3828 = load i64, ptr %t3827
  %t3829 = inttoptr i64 %t3828 to ptr
  %t3830 = musttail call fastcc i64 %t3829(i64 %t3825, i64 4, i64 %a0, i64 %a1, i64 %t3824, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3830
else1374:
  %t3831 = or i64 %t3764, 768
  %t3832 = and i64 %t3831, 7
  %t3833 = icmp eq i64 %t3832, 0
  br i1 %t3833, label %fixfast1378, label %fixslow1379
fixfast1378:
  %t3834 = icmp eq i64 %t3764, 768
  %t3835 = select i1 %t3834, i64 257, i64 1
  br label %fixmerge1380
fixslow1379:
  %t3836 = call i64 @rt_num_eq(i64 %t3764, i64 768)
  br label %fixmerge1380
fixmerge1380:
  %t3837 = phi i64 [ %t3835, %fixfast1378 ], [ %t3836, %fixslow1379 ]
  %t3838 = icmp ne i64 %t3837, 1
  br i1 %t3838, label %then1381, label %else1382
then1381:
  %t3839 = or i64 %a2, 8
  %t3840 = and i64 %t3839, 7
  %t3841 = icmp eq i64 %t3840, 0
  br i1 %t3841, label %fixfast1383, label %fixslow1384
fixfast1383:
  %t3842 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3843 = extractvalue {i64, i1} %t3842, 0
  %t3844 = extractvalue {i64, i1} %t3842, 1
  br i1 %t3844, label %fixslow1384, label %fixmerge1385
fixslow1384:
  %t3845 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1385
fixmerge1385:
  %t3846 = phi i64 [ %t3843, %fixfast1383 ], [ %t3845, %fixslow1384 ]
  %t3847 = load i64, ptr @"emit.internal:rd-quasi"
  %t3848 = and i64 %t3847, -8
  %t3849 = inttoptr i64 %t3848 to ptr
  %t3850 = load i64, ptr %t3849
  %t3851 = inttoptr i64 %t3850 to ptr
  %t3852 = musttail call fastcc i64 %t3851(i64 %t3847, i64 4, i64 %a0, i64 %a1, i64 %t3846, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3852
else1382:
  %t3853 = or i64 %t3764, 352
  %t3854 = and i64 %t3853, 7
  %t3855 = icmp eq i64 %t3854, 0
  br i1 %t3855, label %fixfast1386, label %fixslow1387
fixfast1386:
  %t3856 = icmp eq i64 %t3764, 352
  %t3857 = select i1 %t3856, i64 257, i64 1
  br label %fixmerge1388
fixslow1387:
  %t3858 = call i64 @rt_num_eq(i64 %t3764, i64 352)
  br label %fixmerge1388
fixmerge1388:
  %t3859 = phi i64 [ %t3857, %fixfast1386 ], [ %t3858, %fixslow1387 ]
  %t3860 = icmp ne i64 %t3859, 1
  br i1 %t3860, label %then1389, label %else1390
then1389:
  %t3861 = or i64 %a2, 8
  %t3862 = and i64 %t3861, 7
  %t3863 = icmp eq i64 %t3862, 0
  br i1 %t3863, label %fixfast1391, label %fixslow1392
fixfast1391:
  %t3864 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3865 = extractvalue {i64, i1} %t3864, 0
  %t3866 = extractvalue {i64, i1} %t3864, 1
  br i1 %t3866, label %fixslow1392, label %fixmerge1393
fixslow1392:
  %t3867 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1393
fixmerge1393:
  %t3868 = phi i64 [ %t3865, %fixfast1391 ], [ %t3867, %fixslow1392 ]
  %t3869 = load i64, ptr @"emit.internal:rd-unquote"
  %t3870 = and i64 %t3869, -8
  %t3871 = inttoptr i64 %t3870 to ptr
  %t3872 = load i64, ptr %t3871
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = musttail call fastcc i64 %t3873(i64 %t3869, i64 4, i64 %a0, i64 %a1, i64 %t3868, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3874
else1390:
  %t3875 = or i64 %t3764, 272
  %t3876 = and i64 %t3875, 7
  %t3877 = icmp eq i64 %t3876, 0
  br i1 %t3877, label %fixfast1394, label %fixslow1395
fixfast1394:
  %t3878 = icmp eq i64 %t3764, 272
  %t3879 = select i1 %t3878, i64 257, i64 1
  br label %fixmerge1396
fixslow1395:
  %t3880 = call i64 @rt_num_eq(i64 %t3764, i64 272)
  br label %fixmerge1396
fixmerge1396:
  %t3881 = phi i64 [ %t3879, %fixfast1394 ], [ %t3880, %fixslow1395 ]
  %t3882 = icmp ne i64 %t3881, 1
  br i1 %t3882, label %then1397, label %else1398
then1397:
  %t3883 = or i64 %a2, 8
  %t3884 = and i64 %t3883, 7
  %t3885 = icmp eq i64 %t3884, 0
  br i1 %t3885, label %fixfast1399, label %fixslow1400
fixfast1399:
  %t3886 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3887 = extractvalue {i64, i1} %t3886, 0
  %t3888 = extractvalue {i64, i1} %t3886, 1
  br i1 %t3888, label %fixslow1400, label %fixmerge1401
fixslow1400:
  %t3889 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1401
fixmerge1401:
  %t3890 = phi i64 [ %t3887, %fixfast1399 ], [ %t3889, %fixslow1400 ]
  %t3891 = load i64, ptr @"emit.internal:rd-string"
  %t3892 = and i64 %t3891, -8
  %t3893 = inttoptr i64 %t3892 to ptr
  %t3894 = load i64, ptr %t3893
  %t3895 = inttoptr i64 %t3894 to ptr
  %t3896 = musttail call fastcc i64 %t3895(i64 %t3891, i64 3, i64 %a0, i64 %a1, i64 %t3890, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3896
else1398:
  %t3897 = or i64 %t3764, 280
  %t3898 = and i64 %t3897, 7
  %t3899 = icmp eq i64 %t3898, 0
  br i1 %t3899, label %fixfast1402, label %fixslow1403
fixfast1402:
  %t3900 = icmp eq i64 %t3764, 280
  %t3901 = select i1 %t3900, i64 257, i64 1
  br label %fixmerge1404
fixslow1403:
  %t3902 = call i64 @rt_num_eq(i64 %t3764, i64 280)
  br label %fixmerge1404
fixmerge1404:
  %t3903 = phi i64 [ %t3901, %fixfast1402 ], [ %t3902, %fixslow1403 ]
  %t3904 = icmp ne i64 %t3903, 1
  br i1 %t3904, label %then1405, label %else1406
then1405:
  %t3905 = or i64 %a2, 8
  %t3906 = and i64 %t3905, 7
  %t3907 = icmp eq i64 %t3906, 0
  br i1 %t3907, label %fixfast1407, label %fixslow1408
fixfast1407:
  %t3908 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3909 = extractvalue {i64, i1} %t3908, 0
  %t3910 = extractvalue {i64, i1} %t3908, 1
  br i1 %t3910, label %fixslow1408, label %fixmerge1409
fixslow1408:
  %t3911 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1409
fixmerge1409:
  %t3912 = phi i64 [ %t3909, %fixfast1407 ], [ %t3911, %fixslow1408 ]
  %t3913 = load i64, ptr @"emit.internal:rd-hash"
  %t3914 = and i64 %t3913, -8
  %t3915 = inttoptr i64 %t3914 to ptr
  %t3916 = load i64, ptr %t3915
  %t3917 = inttoptr i64 %t3916 to ptr
  %t3918 = musttail call fastcc i64 %t3917(i64 %t3913, i64 4, i64 %a0, i64 %a1, i64 %t3912, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3918
else1406:
  %t3919 = or i64 %t3764, 992
  %t3920 = and i64 %t3919, 7
  %t3921 = icmp eq i64 %t3920, 0
  br i1 %t3921, label %fixfast1410, label %fixslow1411
fixfast1410:
  %t3922 = icmp eq i64 %t3764, 992
  %t3923 = select i1 %t3922, i64 257, i64 1
  br label %fixmerge1412
fixslow1411:
  %t3924 = call i64 @rt_num_eq(i64 %t3764, i64 992)
  br label %fixmerge1412
fixmerge1412:
  %t3925 = phi i64 [ %t3923, %fixfast1410 ], [ %t3924, %fixslow1411 ]
  %t3926 = icmp ne i64 %t3925, 1
  br i1 %t3926, label %then1413, label %else1414
then1413:
  %t3927 = or i64 %a2, 8
  %t3928 = and i64 %t3927, 7
  %t3929 = icmp eq i64 %t3928, 0
  br i1 %t3929, label %fixfast1415, label %fixslow1416
fixfast1415:
  %t3930 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3931 = extractvalue {i64, i1} %t3930, 0
  %t3932 = extractvalue {i64, i1} %t3930, 1
  br i1 %t3932, label %fixslow1416, label %fixmerge1417
fixslow1416:
  %t3933 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1417
fixmerge1417:
  %t3934 = phi i64 [ %t3931, %fixfast1415 ], [ %t3933, %fixslow1416 ]
  %t3935 = load i64, ptr @"emit.internal:rd-bar"
  %t3936 = and i64 %t3935, -8
  %t3937 = inttoptr i64 %t3936 to ptr
  %t3938 = load i64, ptr %t3937
  %t3939 = inttoptr i64 %t3938 to ptr
  %t3940 = musttail call fastcc i64 %t3939(i64 %t3935, i64 4, i64 %a0, i64 %a1, i64 %t3934, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3940
else1414:
  %t3941 = or i64 %t3764, 328
  %t3942 = and i64 %t3941, 7
  %t3943 = icmp eq i64 %t3942, 0
  br i1 %t3943, label %fixfast1418, label %fixslow1419
fixfast1418:
  %t3944 = icmp eq i64 %t3764, 328
  %t3945 = select i1 %t3944, i64 257, i64 1
  br label %fixmerge1420
fixslow1419:
  %t3946 = call i64 @rt_num_eq(i64 %t3764, i64 328)
  br label %fixmerge1420
fixmerge1420:
  %t3947 = phi i64 [ %t3945, %fixfast1418 ], [ %t3946, %fixslow1419 ]
  %t3948 = icmp ne i64 %t3947, 1
  br i1 %t3948, label %then1421, label %else1422
then1421:
  br label %merge1423
else1422:
  %t3949 = or i64 %t3764, 744
  %t3950 = and i64 %t3949, 7
  %t3951 = icmp eq i64 %t3950, 0
  br i1 %t3951, label %fixfast1424, label %fixslow1425
fixfast1424:
  %t3952 = icmp eq i64 %t3764, 744
  %t3953 = select i1 %t3952, i64 257, i64 1
  br label %fixmerge1426
fixslow1425:
  %t3954 = call i64 @rt_num_eq(i64 %t3764, i64 744)
  br label %fixmerge1426
fixmerge1426:
  %t3955 = phi i64 [ %t3953, %fixfast1424 ], [ %t3954, %fixslow1425 ]
  br label %merge1423
merge1423:
  %t3956 = phi i64 [ %t3947, %then1421 ], [ %t3955, %fixmerge1426 ]
  %t3957 = icmp ne i64 %t3956, 1
  br i1 %t3957, label %then1427, label %else1428
then1427:
  %t3958 = call i64 @rt_intern(ptr @.str.sym.9)
  %t3959 = load i64, ptr @"emit.internal:rd-fail"
  %t3960 = and i64 %t3959, -8
  %t3961 = inttoptr i64 %t3960 to ptr
  %t3962 = load i64, ptr %t3961
  %t3963 = inttoptr i64 %t3962 to ptr
  %t3964 = musttail call fastcc i64 %t3963(i64 %t3959, i64 2, i64 %t3958, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3964
else1428:
  %t3965 = load i64, ptr @"emit.internal:rd-atom"
  %t3966 = and i64 %t3965, -8
  %t3967 = inttoptr i64 %t3966 to ptr
  %t3968 = load i64, ptr %t3967
  %t3969 = inttoptr i64 %t3968 to ptr
  %t3970 = musttail call fastcc i64 %t3969(i64 %t3965, i64 4, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3970
else1353:
  %t3971 = or i64 %a2, 0
  %t3972 = and i64 %t3971, 7
  %t3973 = icmp eq i64 %t3972, 0
  br i1 %t3973, label %fixfast1429, label %fixslow1430
fixfast1429:
  %t3974 = icmp slt i64 %a2, 0
  %t3975 = select i1 %t3974, i64 257, i64 1
  br label %fixmerge1431
fixslow1430:
  %t3976 = call i64 @rt_lt(i64 %a2, i64 0)
  br label %fixmerge1431
fixmerge1431:
  %t3977 = phi i64 [ %t3975, %fixfast1429 ], [ %t3976, %fixslow1430 ]
  %t3978 = icmp ne i64 %t3977, 1
  br i1 %t3978, label %then1432, label %else1433
then1432:
  %t3979 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3980 = call i64 @rt_cons(i64 %t3979, i64 %a2)
  ret i64 %t3980
else1433:
  %t3981 = call i64 @rt_intern(ptr @.str.sym.11)
  %t3982 = load i64, ptr @"emit.internal:rd-fail"
  %t3983 = and i64 %t3982, -8
  %t3984 = inttoptr i64 %t3983 to ptr
  %t3985 = load i64, ptr %t3984
  %t3986 = inttoptr i64 %t3985 to ptr
  %t3987 = musttail call fastcc i64 %t3986(i64 %t3982, i64 2, i64 %t3981, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3987
}

define fastcc i64 @"emit.internal:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3993 = icmp eq i64 %argc, 0
  br i1 %t3993, label %argok1435, label %arityerr1434
arityerr1434:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1435:
  %t3994 = load i64, ptr @"emit.internal:%port-rtd-cell"
  %t3995 = icmp ne i64 %t3994, 1
  br i1 %t3995, label %then1436, label %else1437
then1436:
  %t3996 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t3996
else1437:
  %t3997 = call i64 @rt_make_string(ptr @.str.lit.27, i64 4)
  %t3998 = call i64 @rt_make_record_type(i64 %t3997)
  %t3999 = call i64 @rt_root(i64 %t3998)
  store i64 %t3999, ptr @"emit.internal:%port-rtd-cell"
  %t4000 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t4000
}

define fastcc i64 @"emit.internal:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4005 = icmp eq i64 %argc, 6
  br i1 %t4005, label %argok1439, label %arityerr1438
arityerr1438:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1439:
  %t4006 = load i64, ptr @"emit.internal:%port-rtd"
  %t4007 = and i64 %t4006, -8
  %t4008 = inttoptr i64 %t4007 to ptr
  %t4009 = load i64, ptr %t4008
  %t4010 = inttoptr i64 %t4009 to ptr
  %t4011 = call fastcc i64%t4010(i64 %t4006, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4012 = load i64, ptr @"emit.internal:list"
  %t4013 = and i64 %t4012, -8
  %t4014 = inttoptr i64 %t4013 to ptr
  %t4015 = load i64, ptr %t4014
  %t4016 = inttoptr i64 %t4015 to ptr
  %t4017 = call fastcc i64%t4016(i64 %t4012, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t4018 = call i64 @rt_make_record(i64 %t4011, i64 %t4017)
  ret i64 %t4018
}

define fastcc i64 @"emit.internal:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4023 = icmp eq i64 %argc, 1
  br i1 %t4023, label %argok1441, label %arityerr1440
arityerr1440:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1441:
  %t4024 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t4025 = icmp ne i64 %t4024, 1
  br i1 %t4025, label %then1442, label %else1443
then1442:
  ret i64 %t4024
else1443:
  %t4026 = call i64 @rt_read_all_stdin()
  %t4027 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t4026)
  ret i64 %t4026
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
  %t1600 = call ptr @rt_alloc_words(i64 1)
  %t1601 = ptrtoint ptr %t1600 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-nonfinite" to i64), ptr %t1600
  %t1602 = or i64 %t1601, 4
  %t1603 = call i64 @rt_root(i64 %t1602)
  store i64 %t1603, ptr @"emit.internal:rd-nonfinite"
  ret i64 17
}

define i64 @"emit.internal:__init_45"() {
entry:
  %t1674 = call ptr @rt_alloc_words(i64 1)
  %t1675 = ptrtoint ptr %t1674 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-letter" to i64), ptr %t1674
  %t1676 = or i64 %t1675, 4
  %t1677 = call i64 @rt_root(i64 %t1676)
  store i64 %t1677, ptr @"emit.internal:rd-radix-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_46"() {
entry:
  %t1714 = call ptr @rt_alloc_words(i64 1)
  %t1715 = ptrtoint ptr %t1714 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-letter" to i64), ptr %t1714
  %t1716 = or i64 %t1715, 4
  %t1717 = call i64 @rt_root(i64 %t1716)
  store i64 %t1717, ptr @"emit.internal:rd-exactness-letter"
  ret i64 17
}

define i64 @"emit.internal:__init_47"() {
entry:
  %t1818 = call ptr @rt_alloc_words(i64 1)
  %t1819 = ptrtoint ptr %t1818 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-prefixes" to i64), ptr %t1818
  %t1820 = or i64 %t1819, 4
  %t1821 = call i64 @rt_root(i64 %t1820)
  store i64 %t1821, ptr @"emit.internal:rd-scan-prefixes"
  ret i64 17
}

define i64 @"emit.internal:__init_48"() {
entry:
  %t1854 = call ptr @rt_alloc_words(i64 1)
  %t1855 = ptrtoint ptr %t1854 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-radix-scan" to i64), ptr %t1854
  %t1856 = or i64 %t1855, 4
  %t1857 = call i64 @rt_root(i64 %t1856)
  store i64 %t1857, ptr @"emit.internal:rd-radix-scan"
  ret i64 17
}

define i64 @"emit.internal:__init_49"() {
entry:
  %t1954 = call ptr @rt_alloc_words(i64 1)
  %t1955 = ptrtoint ptr %t1954 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-rational-body?" to i64), ptr %t1954
  %t1956 = or i64 %t1955, 4
  %t1957 = call i64 @rt_root(i64 %t1956)
  store i64 %t1957, ptr @"emit.internal:rd-rational-body?"
  ret i64 17
}

define i64 @"emit.internal:__init_50"() {
entry:
  %t1983 = call ptr @rt_alloc_words(i64 1)
  %t1984 = ptrtoint ptr %t1983 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exactness-apply" to i64), ptr %t1983
  %t1985 = or i64 %t1984, 4
  %t1986 = call i64 @rt_root(i64 %t1985)
  store i64 %t1986, ptr @"emit.internal:rd-exactness-apply"
  ret i64 17
}

define i64 @"emit.internal:__init_51"() {
entry:
  %t2069 = call ptr @rt_alloc_words(i64 1)
  %t2070 = ptrtoint ptr %t2069 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-body-number" to i64), ptr %t2069
  %t2071 = or i64 %t2070, 4
  %t2072 = call i64 @rt_root(i64 %t2071)
  store i64 %t2072, ptr @"emit.internal:rd-body-number"
  ret i64 17
}

define i64 @"emit.internal:__init_52"() {
entry:
  %t2155 = call ptr @rt_alloc_words(i64 1)
  %t2156 = ptrtoint ptr %t2155 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number" to i64), ptr %t2155
  %t2157 = or i64 %t2156, 4
  %t2158 = call i64 @rt_root(i64 %t2157)
  store i64 %t2158, ptr @"emit.internal:rd-number"
  ret i64 17
}

define i64 @"emit.internal:__init_53"() {
entry:
  %t2165 = call ptr @rt_alloc_words(i64 1)
  %t2166 = ptrtoint ptr %t2165 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-number-reason?" to i64), ptr %t2165
  %t2167 = or i64 %t2166, 4
  %t2168 = call i64 @rt_root(i64 %t2167)
  store i64 %t2168, ptr @"emit.internal:rd-number-reason?"
  ret i64 17
}

define i64 @"emit.internal:__init_54"() {
entry:
  %t2197 = call ptr @rt_alloc_words(i64 1)
  %t2198 = ptrtoint ptr %t2197 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-char" to i64), ptr %t2197
  %t2199 = or i64 %t2198, 4
  %t2200 = call i64 @rt_root(i64 %t2199)
  store i64 %t2200, ptr @"emit.internal:rd-fold-char"
  ret i64 17
}

define i64 @"emit.internal:__init_55"() {
entry:
  %t2251 = call ptr @rt_alloc_words(i64 1)
  %t2252 = ptrtoint ptr %t2251 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-fold-token" to i64), ptr %t2251
  %t2253 = or i64 %t2252, 4
  %t2254 = call i64 @rt_root(i64 %t2253)
  store i64 %t2254, ptr @"emit.internal:rd-fold-token"
  ret i64 17
}

define i64 @"emit.internal:__init_56"() {
entry:
  %t2311 = call ptr @rt_alloc_words(i64 1)
  %t2312 = ptrtoint ptr %t2311 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-atom" to i64), ptr %t2311
  %t2313 = or i64 %t2312, 4
  %t2314 = call i64 @rt_root(i64 %t2313)
  store i64 %t2314, ptr @"emit.internal:rd-atom"
  ret i64 17
}

define i64 @"emit.internal:__init_57"() {
entry:
  %t2358 = call ptr @rt_alloc_words(i64 1)
  %t2359 = ptrtoint ptr %t2358 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-at" to i64), ptr %t2358
  %t2360 = or i64 %t2359, 4
  %t2361 = call i64 @rt_root(i64 %t2360)
  store i64 %t2361, ptr @"emit.internal:rd-token-at"
  ret i64 17
}

define i64 @"emit.internal:__init_58"() {
entry:
  %t2439 = call ptr @rt_alloc_words(i64 1)
  %t2440 = ptrtoint ptr %t2439 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit" to i64), ptr %t2439
  %t2441 = or i64 %t2440, 4
  %t2442 = call i64 @rt_root(i64 %t2441)
  store i64 %t2442, ptr @"emit.internal:rd-hex-digit"
  ret i64 17
}

define i64 @"emit.internal:__init_59"() {
entry:
  %t2510 = call ptr @rt_alloc_words(i64 1)
  %t2511 = ptrtoint ptr %t2510 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex" to i64), ptr %t2510
  %t2512 = or i64 %t2511, 4
  %t2513 = call i64 @rt_root(i64 %t2512)
  store i64 %t2513, ptr @"emit.internal:rd-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_60"() {
entry:
  %t2543 = call ptr @rt_alloc_words(i64 1)
  %t2544 = ptrtoint ptr %t2543 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-str-esc" to i64), ptr %t2543
  %t2545 = or i64 %t2544, 4
  %t2546 = call i64 @rt_root(i64 %t2545)
  store i64 %t2546, ptr @"emit.internal:rd-str-esc"
  ret i64 17
}

define i64 @"emit.internal:__init_61"() {
entry:
  %t2689 = call ptr @rt_alloc_words(i64 1)
  %t2690 = ptrtoint ptr %t2689 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-string" to i64), ptr %t2689
  %t2691 = or i64 %t2690, 4
  %t2692 = call i64 @rt_root(i64 %t2691)
  store i64 %t2692, ptr @"emit.internal:rd-string"
  ret i64 17
}

define i64 @"emit.internal:__init_62"() {
entry:
  %t3001 = call ptr @rt_alloc_words(i64 1)
  %t3002 = ptrtoint ptr %t3001 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hash" to i64), ptr %t3001
  %t3003 = or i64 %t3002, 4
  %t3004 = call i64 @rt_root(i64 %t3003)
  store i64 %t3004, ptr @"emit.internal:rd-hash"
  ret i64 17
}

define i64 @"emit.internal:__init_63"() {
entry:
  %t3043 = call ptr @rt_alloc_words(i64 1)
  %t3044 = ptrtoint ptr %t3043 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-name" to i64), ptr %t3043
  %t3045 = or i64 %t3044, 4
  %t3046 = call i64 @rt_root(i64 %t3045)
  store i64 %t3046, ptr @"emit.internal:rd-char-name"
  ret i64 17
}

define i64 @"emit.internal:__init_64"() {
entry:
  %t3089 = call ptr @rt_alloc_words(i64 1)
  %t3090 = ptrtoint ptr %t3089 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char" to i64), ptr %t3089
  %t3091 = or i64 %t3090, 4
  %t3092 = call i64 @rt_root(i64 %t3091)
  store i64 %t3092, ptr @"emit.internal:rd-char"
  ret i64 17
}

define i64 @"emit.internal:__init_65"() {
entry:
  %t3261 = call ptr @rt_alloc_words(i64 1)
  %t3262 = ptrtoint ptr %t3261 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-bar" to i64), ptr %t3261
  %t3263 = or i64 %t3262, 4
  %t3264 = call i64 @rt_root(i64 %t3263)
  store i64 %t3264, ptr @"emit.internal:rd-bar"
  ret i64 17
}

define i64 @"emit.internal:__init_66"() {
entry:
  %t3296 = call ptr @rt_alloc_words(i64 1)
  %t3297 = ptrtoint ptr %t3296 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quote" to i64), ptr %t3296
  %t3298 = or i64 %t3297, 4
  %t3299 = call i64 @rt_root(i64 %t3298)
  store i64 %t3299, ptr @"emit.internal:rd-quote"
  ret i64 17
}

define i64 @"emit.internal:__init_67"() {
entry:
  %t3331 = call ptr @rt_alloc_words(i64 1)
  %t3332 = ptrtoint ptr %t3331 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quasi" to i64), ptr %t3331
  %t3333 = or i64 %t3332, 4
  %t3334 = call i64 @rt_root(i64 %t3333)
  store i64 %t3334, ptr @"emit.internal:rd-quasi"
  ret i64 17
}

define i64 @"emit.internal:__init_68"() {
entry:
  %t3423 = call ptr @rt_alloc_words(i64 1)
  %t3424 = ptrtoint ptr %t3423 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-unquote" to i64), ptr %t3423
  %t3425 = or i64 %t3424, 4
  %t3426 = call i64 @rt_root(i64 %t3425)
  store i64 %t3426, ptr @"emit.internal:rd-unquote"
  ret i64 17
}

define i64 @"emit.internal:__init_69"() {
entry:
  %t3467 = call ptr @rt_alloc_words(i64 1)
  %t3468 = ptrtoint ptr %t3467 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dot?" to i64), ptr %t3467
  %t3469 = or i64 %t3468, 4
  %t3470 = call i64 @rt_root(i64 %t3469)
  store i64 %t3470, ptr @"emit.internal:rd-dot?"
  ret i64 17
}

define i64 @"emit.internal:__init_70"() {
entry:
  %t3483 = call ptr @rt_alloc_words(i64 1)
  %t3484 = ptrtoint ptr %t3483 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-append-reverse" to i64), ptr %t3483
  %t3485 = or i64 %t3484, 4
  %t3486 = call i64 @rt_root(i64 %t3485)
  store i64 %t3486, ptr @"emit.internal:rd-append-reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_71"() {
entry:
  %t3531 = call ptr @rt_alloc_words(i64 1)
  %t3532 = ptrtoint ptr %t3531 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum-comment?" to i64), ptr %t3531
  %t3533 = or i64 %t3532, 4
  %t3534 = call i64 @rt_root(i64 %t3533)
  store i64 %t3534, ptr @"emit.internal:rd-datum-comment?"
  ret i64 17
}

define i64 @"emit.internal:__init_72"() {
entry:
  %t3732 = call ptr @rt_alloc_words(i64 1)
  %t3733 = ptrtoint ptr %t3732 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-list" to i64), ptr %t3732
  %t3734 = or i64 %t3733, 4
  %t3735 = call i64 @rt_root(i64 %t3734)
  store i64 %t3735, ptr @"emit.internal:rd-list"
  ret i64 17
}

define i64 @"emit.internal:__init_73"() {
entry:
  %t3988 = call ptr @rt_alloc_words(i64 1)
  %t3989 = ptrtoint ptr %t3988 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum" to i64), ptr %t3988
  %t3990 = or i64 %t3989, 4
  %t3991 = call i64 @rt_root(i64 %t3990)
  store i64 %t3991, ptr @"emit.internal:rd-datum"
  ret i64 17
}

define i64 @"emit.internal:__init_74"() {
entry:
  %t3992 = call i64 @rt_root(i64 1)
  store i64 %t3992, ptr @"emit.internal:%port-rtd-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_75"() {
entry:
  %t4001 = call ptr @rt_alloc_words(i64 1)
  %t4002 = ptrtoint ptr %t4001 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-rtd" to i64), ptr %t4001
  %t4003 = or i64 %t4002, 4
  %t4004 = call i64 @rt_root(i64 %t4003)
  store i64 %t4004, ptr @"emit.internal:%port-rtd"
  ret i64 17
}

define i64 @"emit.internal:__init_76"() {
entry:
  %t4019 = call ptr @rt_alloc_words(i64 1)
  %t4020 = ptrtoint ptr %t4019 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%make-port" to i64), ptr %t4019
  %t4021 = or i64 %t4020, 4
  %t4022 = call i64 @rt_root(i64 %t4021)
  store i64 %t4022, ptr @"emit.internal:%make-port"
  ret i64 17
}

define i64 @"emit.internal:__init_77"() {
entry:
  %t4028 = call ptr @rt_alloc_words(i64 1)
  %t4029 = ptrtoint ptr %t4028 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-buf" to i64), ptr %t4028
  %t4030 = or i64 %t4029, 4
  %t4031 = call i64 @rt_root(i64 %t4030)
  store i64 %t4031, ptr @"emit.internal:%port-buf"
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

