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

define fastcc i64 @"emit.internal:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2169 = icmp eq i64 %argc, 3
  br i1 %t2169, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok852:
  %t2170 = load i64, ptr @"emit.internal:rd-token-end"
  %t2171 = and i64 %t2170, -8
  %t2172 = inttoptr i64 %t2171 to ptr
  %t2173 = load i64, ptr %t2172
  %t2174 = inttoptr i64 %t2173 to ptr
  %t2175 = call fastcc i64%t2174(i64 %t2170, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2176 = or i64 %a2, %t2175
  %t2177 = and i64 %t2176, 7
  %t2178 = icmp eq i64 %t2177, 0
  br i1 %t2178, label %fixfast853, label %fixslow854
fixfast853:
  %t2179 = icmp eq i64 %a2, %t2175
  %t2180 = select i1 %t2179, i64 257, i64 1
  br label %fixmerge855
fixslow854:
  %t2181 = call i64 @rt_num_eq(i64 %a2, i64 %t2175)
  br label %fixmerge855
fixmerge855:
  %t2182 = phi i64 [ %t2180, %fixfast853 ], [ %t2181, %fixslow854 ]
  %t2183 = icmp ne i64 %t2182, 1
  br i1 %t2183, label %then856, label %else857
then856:
  %t2184 = call i64 @rt_intern(ptr @.str.sym.9)
  %t2185 = load i64, ptr @"emit.internal:rd-fail"
  %t2186 = and i64 %t2185, -8
  %t2187 = inttoptr i64 %t2186 to ptr
  %t2188 = load i64, ptr %t2187
  %t2189 = inttoptr i64 %t2188 to ptr
  %t2190 = musttail call fastcc i64 %t2189(i64 %t2185, i64 2, i64 %t2184, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2190
else857:
  %t2191 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2175)
  %t2192 = load i64, ptr @"emit.internal:rd-number"
  %t2193 = and i64 %t2192, -8
  %t2194 = inttoptr i64 %t2193 to ptr
  %t2195 = load i64, ptr %t2194
  %t2196 = inttoptr i64 %t2195 to ptr
  %t2197 = call fastcc i64%t2196(i64 %t2192, i64 2, i64 %t2191, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2198 = call i64 @rt_intern(ptr @.str.sym.7)
  %t2199 = call i64 @rt_eq_p(i64 %t2197, i64 %t2198)
  %t2200 = icmp ne i64 %t2199, 1
  br i1 %t2200, label %then858, label %else859
then858:
  %t2201 = call i64 @rt_string_to_symbol(i64 %t2191)
  %t2202 = call i64 @rt_cons(i64 %t2201, i64 %t2175)
  ret i64 %t2202
else859:
  %t2203 = load i64, ptr @"emit.internal:rd-number-reason?"
  %t2204 = and i64 %t2203, -8
  %t2205 = inttoptr i64 %t2204 to ptr
  %t2206 = load i64, ptr %t2205
  %t2207 = inttoptr i64 %t2206 to ptr
  %t2208 = call fastcc i64%t2207(i64 %t2203, i64 1, i64 %t2197, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2209 = icmp ne i64 %t2208, 1
  br i1 %t2209, label %then860, label %else861
then860:
  %t2210 = load i64, ptr @"emit.internal:rd-fail"
  %t2211 = and i64 %t2210, -8
  %t2212 = inttoptr i64 %t2211 to ptr
  %t2213 = load i64, ptr %t2212
  %t2214 = inttoptr i64 %t2213 to ptr
  %t2215 = musttail call fastcc i64 %t2214(i64 %t2210, i64 2, i64 %t2197, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2215
else861:
  %t2216 = call i64 @rt_cons(i64 %t2197, i64 %t2175)
  ret i64 %t2216
}

define fastcc i64 @"emit.internal:code:rd-token-at"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2221 = icmp eq i64 %argc, 3
  br i1 %t2221, label %argok863, label %arityerr862
arityerr862:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok863:
  %t2222 = or i64 0, %a2
  %t2223 = and i64 %t2222, 7
  %t2224 = icmp eq i64 %t2223, 0
  br i1 %t2224, label %fixfast864, label %fixslow865
fixfast864:
  %t2225 = icmp slt i64 0, %a2
  %t2226 = select i1 %t2225, i64 257, i64 1
  br label %fixmerge866
fixslow865:
  %t2227 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge866
fixmerge866:
  %t2228 = phi i64 [ %t2226, %fixfast864 ], [ %t2227, %fixslow865 ]
  %t2229 = icmp ne i64 %t2228, 1
  br i1 %t2229, label %then867, label %else868
then867:
  br label %merge869
else868:
  %t2230 = or i64 0, %a2
  %t2231 = and i64 %t2230, 7
  %t2232 = icmp eq i64 %t2231, 0
  br i1 %t2232, label %fixfast870, label %fixslow871
fixfast870:
  %t2233 = icmp eq i64 0, %a2
  %t2234 = select i1 %t2233, i64 257, i64 1
  br label %fixmerge872
fixslow871:
  %t2235 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge872
fixmerge872:
  %t2236 = phi i64 [ %t2234, %fixfast870 ], [ %t2235, %fixslow871 ]
  br label %merge869
merge869:
  %t2237 = phi i64 [ 257, %then867 ], [ %t2236, %fixmerge872 ]
  %t2238 = icmp ne i64 %t2237, 1
  br i1 %t2238, label %then873, label %else874
then873:
  %t2239 = or i64 %a2, %a1
  %t2240 = and i64 %t2239, 7
  %t2241 = icmp eq i64 %t2240, 0
  br i1 %t2241, label %fixfast876, label %fixslow877
fixfast876:
  %t2242 = icmp slt i64 %a2, %a1
  %t2243 = select i1 %t2242, i64 257, i64 1
  br label %fixmerge878
fixslow877:
  %t2244 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge878
fixmerge878:
  %t2245 = phi i64 [ %t2243, %fixfast876 ], [ %t2244, %fixslow877 ]
  br label %merge875
else874:
  br label %merge875
merge875:
  %t2246 = phi i64 [ %t2245, %fixmerge878 ], [ 1, %else874 ]
  %t2247 = icmp ne i64 %t2246, 1
  br i1 %t2247, label %then879, label %else880
then879:
  %t2248 = or i64 %a2, 8
  %t2249 = and i64 %t2248, 7
  %t2250 = icmp eq i64 %t2249, 0
  br i1 %t2250, label %fixfast881, label %fixslow882
fixfast881:
  %t2251 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2252 = extractvalue {i64, i1} %t2251, 0
  %t2253 = extractvalue {i64, i1} %t2251, 1
  br i1 %t2253, label %fixslow882, label %fixmerge883
fixslow882:
  %t2254 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge883
fixmerge883:
  %t2255 = phi i64 [ %t2252, %fixfast881 ], [ %t2254, %fixslow882 ]
  %t2256 = load i64, ptr @"emit.internal:rd-token-end"
  %t2257 = and i64 %t2256, -8
  %t2258 = inttoptr i64 %t2257 to ptr
  %t2259 = load i64, ptr %t2258
  %t2260 = inttoptr i64 %t2259 to ptr
  %t2261 = call fastcc i64%t2260(i64 %t2256, i64 3, i64 %a0, i64 %a1, i64 %t2255, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2262 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2261)
  ret i64 %t2262
else880:
  %t2263 = call i64 @rt_make_string(ptr @.str.lit.10, i64 0)
  ret i64 %t2263
}

define fastcc i64 @"emit.internal:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2268 = icmp eq i64 %argc, 1
  br i1 %t2268, label %argok885, label %arityerr884
arityerr884:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok885:
  %t2269 = call i64 @rt_char_to_integer(i64 %a0)
  %t2270 = or i64 376, %t2269
  %t2271 = and i64 %t2270, 7
  %t2272 = icmp eq i64 %t2271, 0
  br i1 %t2272, label %fixfast886, label %fixslow887
fixfast886:
  %t2273 = icmp slt i64 376, %t2269
  %t2274 = select i1 %t2273, i64 257, i64 1
  br label %fixmerge888
fixslow887:
  %t2275 = call i64 @rt_lt(i64 376, i64 %t2269)
  br label %fixmerge888
fixmerge888:
  %t2276 = phi i64 [ %t2274, %fixfast886 ], [ %t2275, %fixslow887 ]
  %t2277 = icmp ne i64 %t2276, 1
  br i1 %t2277, label %then889, label %else890
then889:
  %t2278 = or i64 %t2269, 464
  %t2279 = and i64 %t2278, 7
  %t2280 = icmp eq i64 %t2279, 0
  br i1 %t2280, label %fixfast892, label %fixslow893
fixfast892:
  %t2281 = icmp slt i64 %t2269, 464
  %t2282 = select i1 %t2281, i64 257, i64 1
  br label %fixmerge894
fixslow893:
  %t2283 = call i64 @rt_lt(i64 %t2269, i64 464)
  br label %fixmerge894
fixmerge894:
  %t2284 = phi i64 [ %t2282, %fixfast892 ], [ %t2283, %fixslow893 ]
  br label %merge891
else890:
  br label %merge891
merge891:
  %t2285 = phi i64 [ %t2284, %fixmerge894 ], [ 1, %else890 ]
  %t2286 = icmp ne i64 %t2285, 1
  br i1 %t2286, label %then895, label %else896
then895:
  %t2287 = or i64 %t2269, 384
  %t2288 = and i64 %t2287, 7
  %t2289 = icmp eq i64 %t2288, 0
  br i1 %t2289, label %fixfast897, label %fixslow898
fixfast897:
  %t2290 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2269, i64 384)
  %t2291 = extractvalue {i64, i1} %t2290, 0
  %t2292 = extractvalue {i64, i1} %t2290, 1
  br i1 %t2292, label %fixslow898, label %fixmerge899
fixslow898:
  %t2293 = call i64 @rt_sub(i64 %t2269, i64 384)
  br label %fixmerge899
fixmerge899:
  %t2294 = phi i64 [ %t2291, %fixfast897 ], [ %t2293, %fixslow898 ]
  ret i64 %t2294
else896:
  %t2295 = or i64 768, %t2269
  %t2296 = and i64 %t2295, 7
  %t2297 = icmp eq i64 %t2296, 0
  br i1 %t2297, label %fixfast900, label %fixslow901
fixfast900:
  %t2298 = icmp slt i64 768, %t2269
  %t2299 = select i1 %t2298, i64 257, i64 1
  br label %fixmerge902
fixslow901:
  %t2300 = call i64 @rt_lt(i64 768, i64 %t2269)
  br label %fixmerge902
fixmerge902:
  %t2301 = phi i64 [ %t2299, %fixfast900 ], [ %t2300, %fixslow901 ]
  %t2302 = icmp ne i64 %t2301, 1
  br i1 %t2302, label %then903, label %else904
then903:
  %t2303 = or i64 %t2269, 824
  %t2304 = and i64 %t2303, 7
  %t2305 = icmp eq i64 %t2304, 0
  br i1 %t2305, label %fixfast906, label %fixslow907
fixfast906:
  %t2306 = icmp slt i64 %t2269, 824
  %t2307 = select i1 %t2306, i64 257, i64 1
  br label %fixmerge908
fixslow907:
  %t2308 = call i64 @rt_lt(i64 %t2269, i64 824)
  br label %fixmerge908
fixmerge908:
  %t2309 = phi i64 [ %t2307, %fixfast906 ], [ %t2308, %fixslow907 ]
  br label %merge905
else904:
  br label %merge905
merge905:
  %t2310 = phi i64 [ %t2309, %fixmerge908 ], [ 1, %else904 ]
  %t2311 = icmp ne i64 %t2310, 1
  br i1 %t2311, label %then909, label %else910
then909:
  %t2312 = or i64 %t2269, 696
  %t2313 = and i64 %t2312, 7
  %t2314 = icmp eq i64 %t2313, 0
  br i1 %t2314, label %fixfast911, label %fixslow912
fixfast911:
  %t2315 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2269, i64 696)
  %t2316 = extractvalue {i64, i1} %t2315, 0
  %t2317 = extractvalue {i64, i1} %t2315, 1
  br i1 %t2317, label %fixslow912, label %fixmerge913
fixslow912:
  %t2318 = call i64 @rt_sub(i64 %t2269, i64 696)
  br label %fixmerge913
fixmerge913:
  %t2319 = phi i64 [ %t2316, %fixfast911 ], [ %t2318, %fixslow912 ]
  ret i64 %t2319
else910:
  %t2320 = or i64 512, %t2269
  %t2321 = and i64 %t2320, 7
  %t2322 = icmp eq i64 %t2321, 0
  br i1 %t2322, label %fixfast914, label %fixslow915
fixfast914:
  %t2323 = icmp slt i64 512, %t2269
  %t2324 = select i1 %t2323, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t2325 = call i64 @rt_lt(i64 512, i64 %t2269)
  br label %fixmerge916
fixmerge916:
  %t2326 = phi i64 [ %t2324, %fixfast914 ], [ %t2325, %fixslow915 ]
  %t2327 = icmp ne i64 %t2326, 1
  br i1 %t2327, label %then917, label %else918
then917:
  %t2328 = or i64 %t2269, 568
  %t2329 = and i64 %t2328, 7
  %t2330 = icmp eq i64 %t2329, 0
  br i1 %t2330, label %fixfast920, label %fixslow921
fixfast920:
  %t2331 = icmp slt i64 %t2269, 568
  %t2332 = select i1 %t2331, i64 257, i64 1
  br label %fixmerge922
fixslow921:
  %t2333 = call i64 @rt_lt(i64 %t2269, i64 568)
  br label %fixmerge922
fixmerge922:
  %t2334 = phi i64 [ %t2332, %fixfast920 ], [ %t2333, %fixslow921 ]
  br label %merge919
else918:
  br label %merge919
merge919:
  %t2335 = phi i64 [ %t2334, %fixmerge922 ], [ 1, %else918 ]
  %t2336 = icmp ne i64 %t2335, 1
  br i1 %t2336, label %then923, label %else924
then923:
  %t2337 = or i64 %t2269, 440
  %t2338 = and i64 %t2337, 7
  %t2339 = icmp eq i64 %t2338, 0
  br i1 %t2339, label %fixfast925, label %fixslow926
fixfast925:
  %t2340 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2269, i64 440)
  %t2341 = extractvalue {i64, i1} %t2340, 0
  %t2342 = extractvalue {i64, i1} %t2340, 1
  br i1 %t2342, label %fixslow926, label %fixmerge927
fixslow926:
  %t2343 = call i64 @rt_sub(i64 %t2269, i64 440)
  br label %fixmerge927
fixmerge927:
  %t2344 = phi i64 [ %t2341, %fixfast925 ], [ %t2343, %fixslow926 ]
  ret i64 %t2344
else924:
  ret i64 0
}

define fastcc i64 @"emit.internal:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2349 = icmp eq i64 %argc, 4
  br i1 %t2349, label %argok929, label %arityerr928
arityerr928:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok929:
  %t2350 = or i64 %a2, %a1
  %t2351 = and i64 %t2350, 7
  %t2352 = icmp eq i64 %t2351, 0
  br i1 %t2352, label %fixfast930, label %fixslow931
fixfast930:
  %t2353 = icmp slt i64 %a2, %a1
  %t2354 = select i1 %t2353, i64 257, i64 1
  br label %fixmerge932
fixslow931:
  %t2355 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge932
fixmerge932:
  %t2356 = phi i64 [ %t2354, %fixfast930 ], [ %t2355, %fixslow931 ]
  %t2357 = icmp ne i64 %t2356, 1
  br i1 %t2357, label %then933, label %else934
then933:
  %t2358 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2359 = call i64 @rt_char_to_integer(i64 %t2358)
  %t2360 = or i64 %t2359, 472
  %t2361 = and i64 %t2360, 7
  %t2362 = icmp eq i64 %t2361, 0
  br i1 %t2362, label %fixfast935, label %fixslow936
fixfast935:
  %t2363 = icmp eq i64 %t2359, 472
  %t2364 = select i1 %t2363, i64 257, i64 1
  br label %fixmerge937
fixslow936:
  %t2365 = call i64 @rt_num_eq(i64 %t2359, i64 472)
  br label %fixmerge937
fixmerge937:
  %t2366 = phi i64 [ %t2364, %fixfast935 ], [ %t2365, %fixslow936 ]
  %t2367 = icmp ne i64 %t2366, 1
  br i1 %t2367, label %then938, label %else939
then938:
  %t2368 = or i64 %a2, 8
  %t2369 = and i64 %t2368, 7
  %t2370 = icmp eq i64 %t2369, 0
  br i1 %t2370, label %fixfast940, label %fixslow941
fixfast940:
  %t2371 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2372 = extractvalue {i64, i1} %t2371, 0
  %t2373 = extractvalue {i64, i1} %t2371, 1
  br i1 %t2373, label %fixslow941, label %fixmerge942
fixslow941:
  %t2374 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge942
fixmerge942:
  %t2375 = phi i64 [ %t2372, %fixfast940 ], [ %t2374, %fixslow941 ]
  %t2376 = call i64 @rt_cons(i64 %a3, i64 %t2375)
  ret i64 %t2376
else939:
  %t2377 = or i64 %a2, 8
  %t2378 = and i64 %t2377, 7
  %t2379 = icmp eq i64 %t2378, 0
  br i1 %t2379, label %fixfast943, label %fixslow944
fixfast943:
  %t2380 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2381 = extractvalue {i64, i1} %t2380, 0
  %t2382 = extractvalue {i64, i1} %t2380, 1
  br i1 %t2382, label %fixslow944, label %fixmerge945
fixslow944:
  %t2383 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge945
fixmerge945:
  %t2384 = phi i64 [ %t2381, %fixfast943 ], [ %t2383, %fixslow944 ]
  %t2385 = or i64 %a3, 128
  %t2386 = and i64 %t2385, 7
  %t2387 = icmp eq i64 %t2386, 0
  br i1 %t2387, label %fixfast946, label %fixslow947
fixfast946:
  %t2388 = ashr i64 %a3, 3
  %t2389 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2388, i64 128)
  %t2390 = extractvalue {i64, i1} %t2389, 0
  %t2391 = extractvalue {i64, i1} %t2389, 1
  br i1 %t2391, label %fixslow947, label %fixmerge948
fixslow947:
  %t2392 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge948
fixmerge948:
  %t2393 = phi i64 [ %t2390, %fixfast946 ], [ %t2392, %fixslow947 ]
  %t2394 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2395 = load i64, ptr @"emit.internal:rd-hex-digit"
  %t2396 = and i64 %t2395, -8
  %t2397 = inttoptr i64 %t2396 to ptr
  %t2398 = load i64, ptr %t2397
  %t2399 = inttoptr i64 %t2398 to ptr
  %t2400 = call fastcc i64%t2399(i64 %t2395, i64 1, i64 %t2394, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2401 = or i64 %t2393, %t2400
  %t2402 = and i64 %t2401, 7
  %t2403 = icmp eq i64 %t2402, 0
  br i1 %t2403, label %fixfast949, label %fixslow950
fixfast949:
  %t2404 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2393, i64 %t2400)
  %t2405 = extractvalue {i64, i1} %t2404, 0
  %t2406 = extractvalue {i64, i1} %t2404, 1
  br i1 %t2406, label %fixslow950, label %fixmerge951
fixslow950:
  %t2407 = call i64 @rt_add(i64 %t2393, i64 %t2400)
  br label %fixmerge951
fixmerge951:
  %t2408 = phi i64 [ %t2405, %fixfast949 ], [ %t2407, %fixslow950 ]
  %t2409 = load i64, ptr @"emit.internal:rd-hex"
  %t2410 = and i64 %t2409, -8
  %t2411 = inttoptr i64 %t2410 to ptr
  %t2412 = load i64, ptr %t2411
  %t2413 = inttoptr i64 %t2412 to ptr
  %t2414 = musttail call fastcc i64 %t2413(i64 %t2409, i64 4, i64 %a0, i64 %a1, i64 %t2384, i64 %t2408, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2414
else934:
  %t2415 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2415
}

define fastcc i64 @"emit.internal:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2420 = icmp eq i64 %argc, 1
  br i1 %t2420, label %argok953, label %arityerr952
arityerr952:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok953:
  %t2421 = call i64 @rt_char_to_integer(i64 %a0)
  %t2422 = or i64 %t2421, 880
  %t2423 = and i64 %t2422, 7
  %t2424 = icmp eq i64 %t2423, 0
  br i1 %t2424, label %fixfast954, label %fixslow955
fixfast954:
  %t2425 = icmp eq i64 %t2421, 880
  %t2426 = select i1 %t2425, i64 257, i64 1
  br label %fixmerge956
fixslow955:
  %t2427 = call i64 @rt_num_eq(i64 %t2421, i64 880)
  br label %fixmerge956
fixmerge956:
  %t2428 = phi i64 [ %t2426, %fixfast954 ], [ %t2427, %fixslow955 ]
  %t2429 = icmp ne i64 %t2428, 1
  br i1 %t2429, label %then957, label %else958
then957:
  %t2430 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2430
else958:
  %t2431 = or i64 %t2421, 928
  %t2432 = and i64 %t2431, 7
  %t2433 = icmp eq i64 %t2432, 0
  br i1 %t2433, label %fixfast959, label %fixslow960
fixfast959:
  %t2434 = icmp eq i64 %t2421, 928
  %t2435 = select i1 %t2434, i64 257, i64 1
  br label %fixmerge961
fixslow960:
  %t2436 = call i64 @rt_num_eq(i64 %t2421, i64 928)
  br label %fixmerge961
fixmerge961:
  %t2437 = phi i64 [ %t2435, %fixfast959 ], [ %t2436, %fixslow960 ]
  %t2438 = icmp ne i64 %t2437, 1
  br i1 %t2438, label %then962, label %else963
then962:
  %t2439 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2439
else963:
  %t2440 = or i64 %t2421, 912
  %t2441 = and i64 %t2440, 7
  %t2442 = icmp eq i64 %t2441, 0
  br i1 %t2442, label %fixfast964, label %fixslow965
fixfast964:
  %t2443 = icmp eq i64 %t2421, 912
  %t2444 = select i1 %t2443, i64 257, i64 1
  br label %fixmerge966
fixslow965:
  %t2445 = call i64 @rt_num_eq(i64 %t2421, i64 912)
  br label %fixmerge966
fixmerge966:
  %t2446 = phi i64 [ %t2444, %fixfast964 ], [ %t2445, %fixslow965 ]
  %t2447 = icmp ne i64 %t2446, 1
  br i1 %t2447, label %then967, label %else968
then967:
  %t2448 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2448
else968:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_763"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2453 = icmp eq i64 %argc, 2
  br i1 %t2453, label %argok970, label %arityerr969
arityerr969:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok970:
  %t2454 = and i64 %self, -8
  %t2455 = inttoptr i64 %t2454 to ptr
  %t2456 = getelementptr i64, ptr %t2455, i64 1
  %t2457 = load i64, ptr %t2456
  %t2458 = or i64 %a0, %t2457
  %t2459 = and i64 %t2458, 7
  %t2460 = icmp eq i64 %t2459, 0
  br i1 %t2460, label %fixfast971, label %fixslow972
fixfast971:
  %t2461 = icmp slt i64 %a0, %t2457
  %t2462 = select i1 %t2461, i64 257, i64 1
  br label %fixmerge973
fixslow972:
  %t2463 = call i64 @rt_lt(i64 %a0, i64 %t2457)
  br label %fixmerge973
fixmerge973:
  %t2464 = phi i64 [ %t2462, %fixfast971 ], [ %t2463, %fixslow972 ]
  %t2465 = icmp ne i64 %t2464, 1
  br i1 %t2465, label %then974, label %else975
then974:
  %t2466 = and i64 %self, -8
  %t2467 = inttoptr i64 %t2466 to ptr
  %t2468 = getelementptr i64, ptr %t2467, i64 2
  %t2469 = load i64, ptr %t2468
  %t2470 = call i64 @rt_string_ref(i64 %t2469, i64 %a0)
  %t2471 = call i64 @rt_char_to_integer(i64 %t2470)
  %t2472 = or i64 %t2471, 272
  %t2473 = and i64 %t2472, 7
  %t2474 = icmp eq i64 %t2473, 0
  br i1 %t2474, label %fixfast976, label %fixslow977
fixfast976:
  %t2475 = icmp eq i64 %t2471, 272
  %t2476 = select i1 %t2475, i64 257, i64 1
  br label %fixmerge978
fixslow977:
  %t2477 = call i64 @rt_num_eq(i64 %t2471, i64 272)
  br label %fixmerge978
fixmerge978:
  %t2478 = phi i64 [ %t2476, %fixfast976 ], [ %t2477, %fixslow977 ]
  %t2479 = icmp ne i64 %t2478, 1
  br i1 %t2479, label %then979, label %else980
then979:
  %t2480 = load i64, ptr @"emit.internal:reverse"
  %t2481 = and i64 %t2480, -8
  %t2482 = inttoptr i64 %t2481 to ptr
  %t2483 = load i64, ptr %t2482
  %t2484 = inttoptr i64 %t2483 to ptr
  %t2485 = call fastcc i64%t2484(i64 %t2480, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2486 = call i64 @rt_list_to_string(i64 %t2485)
  %t2487 = or i64 %a0, 8
  %t2488 = and i64 %t2487, 7
  %t2489 = icmp eq i64 %t2488, 0
  br i1 %t2489, label %fixfast981, label %fixslow982
fixfast981:
  %t2490 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2491 = extractvalue {i64, i1} %t2490, 0
  %t2492 = extractvalue {i64, i1} %t2490, 1
  br i1 %t2492, label %fixslow982, label %fixmerge983
fixslow982:
  %t2493 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge983
fixmerge983:
  %t2494 = phi i64 [ %t2491, %fixfast981 ], [ %t2493, %fixslow982 ]
  %t2495 = call i64 @rt_cons(i64 %t2486, i64 %t2494)
  ret i64 %t2495
else980:
  %t2496 = or i64 %t2471, 736
  %t2497 = and i64 %t2496, 7
  %t2498 = icmp eq i64 %t2497, 0
  br i1 %t2498, label %fixfast984, label %fixslow985
fixfast984:
  %t2499 = icmp eq i64 %t2471, 736
  %t2500 = select i1 %t2499, i64 257, i64 1
  br label %fixmerge986
fixslow985:
  %t2501 = call i64 @rt_num_eq(i64 %t2471, i64 736)
  br label %fixmerge986
fixmerge986:
  %t2502 = phi i64 [ %t2500, %fixfast984 ], [ %t2501, %fixslow985 ]
  %t2503 = icmp ne i64 %t2502, 1
  br i1 %t2503, label %then987, label %else988
then987:
  %t2504 = and i64 %self, -8
  %t2505 = inttoptr i64 %t2504 to ptr
  %t2506 = getelementptr i64, ptr %t2505, i64 2
  %t2507 = load i64, ptr %t2506
  %t2508 = or i64 %a0, 8
  %t2509 = and i64 %t2508, 7
  %t2510 = icmp eq i64 %t2509, 0
  br i1 %t2510, label %fixfast989, label %fixslow990
fixfast989:
  %t2511 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2512 = extractvalue {i64, i1} %t2511, 0
  %t2513 = extractvalue {i64, i1} %t2511, 1
  br i1 %t2513, label %fixslow990, label %fixmerge991
fixslow990:
  %t2514 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge991
fixmerge991:
  %t2515 = phi i64 [ %t2512, %fixfast989 ], [ %t2514, %fixslow990 ]
  %t2516 = call i64 @rt_string_ref(i64 %t2507, i64 %t2515)
  %t2517 = call i64 @rt_char_to_integer(i64 %t2516)
  %t2518 = or i64 %t2517, 960
  %t2519 = and i64 %t2518, 7
  %t2520 = icmp eq i64 %t2519, 0
  br i1 %t2520, label %fixfast992, label %fixslow993
fixfast992:
  %t2521 = icmp eq i64 %t2517, 960
  %t2522 = select i1 %t2521, i64 257, i64 1
  br label %fixmerge994
fixslow993:
  %t2523 = call i64 @rt_num_eq(i64 %t2517, i64 960)
  br label %fixmerge994
fixmerge994:
  %t2524 = phi i64 [ %t2522, %fixfast992 ], [ %t2523, %fixslow993 ]
  %t2525 = icmp ne i64 %t2524, 1
  br i1 %t2525, label %then995, label %else996
then995:
  %t2526 = and i64 %self, -8
  %t2527 = inttoptr i64 %t2526 to ptr
  %t2528 = getelementptr i64, ptr %t2527, i64 2
  %t2529 = load i64, ptr %t2528
  %t2530 = and i64 %self, -8
  %t2531 = inttoptr i64 %t2530 to ptr
  %t2532 = getelementptr i64, ptr %t2531, i64 1
  %t2533 = load i64, ptr %t2532
  %t2534 = or i64 %a0, 16
  %t2535 = and i64 %t2534, 7
  %t2536 = icmp eq i64 %t2535, 0
  br i1 %t2536, label %fixfast997, label %fixslow998
fixfast997:
  %t2537 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t2538 = extractvalue {i64, i1} %t2537, 0
  %t2539 = extractvalue {i64, i1} %t2537, 1
  br i1 %t2539, label %fixslow998, label %fixmerge999
fixslow998:
  %t2540 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge999
fixmerge999:
  %t2541 = phi i64 [ %t2538, %fixfast997 ], [ %t2540, %fixslow998 ]
  %t2542 = load i64, ptr @"emit.internal:rd-hex"
  %t2543 = and i64 %t2542, -8
  %t2544 = inttoptr i64 %t2543 to ptr
  %t2545 = load i64, ptr %t2544
  %t2546 = inttoptr i64 %t2545 to ptr
  %t2547 = call fastcc i64%t2546(i64 %t2542, i64 4, i64 %t2529, i64 %t2533, i64 %t2541, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2548 = call i64 @rt_cdr(i64 %t2547)
  %t2549 = call i64 @rt_car(i64 %t2547)
  %t2550 = call i64 @rt_integer_to_char(i64 %t2549)
  %t2551 = call i64 @rt_cons(i64 %t2550, i64 %a1)
  %t2552 = musttail call fastcc i64 @"emit.internal:code_763"(i64 %self, i64 2, i64 %t2548, i64 %t2551, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2552
else996:
  %t2553 = or i64 %a0, 16
  %t2554 = and i64 %t2553, 7
  %t2555 = icmp eq i64 %t2554, 0
  br i1 %t2555, label %fixfast1000, label %fixslow1001
fixfast1000:
  %t2556 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t2557 = extractvalue {i64, i1} %t2556, 0
  %t2558 = extractvalue {i64, i1} %t2556, 1
  br i1 %t2558, label %fixslow1001, label %fixmerge1002
fixslow1001:
  %t2559 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1002
fixmerge1002:
  %t2560 = phi i64 [ %t2557, %fixfast1000 ], [ %t2559, %fixslow1001 ]
  %t2561 = load i64, ptr @"emit.internal:rd-str-esc"
  %t2562 = and i64 %t2561, -8
  %t2563 = inttoptr i64 %t2562 to ptr
  %t2564 = load i64, ptr %t2563
  %t2565 = inttoptr i64 %t2564 to ptr
  %t2566 = call fastcc i64%t2565(i64 %t2561, i64 1, i64 %t2516, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2567 = call i64 @rt_cons(i64 %t2566, i64 %a1)
  %t2568 = musttail call fastcc i64 @"emit.internal:code_763"(i64 %self, i64 2, i64 %t2560, i64 %t2567, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2568
else988:
  %t2569 = or i64 %a0, 8
  %t2570 = and i64 %t2569, 7
  %t2571 = icmp eq i64 %t2570, 0
  br i1 %t2571, label %fixfast1003, label %fixslow1004
fixfast1003:
  %t2572 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2573 = extractvalue {i64, i1} %t2572, 0
  %t2574 = extractvalue {i64, i1} %t2572, 1
  br i1 %t2574, label %fixslow1004, label %fixmerge1005
fixslow1004:
  %t2575 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1005
fixmerge1005:
  %t2576 = phi i64 [ %t2573, %fixfast1003 ], [ %t2575, %fixslow1004 ]
  %t2577 = call i64 @rt_cons(i64 %t2470, i64 %a1)
  %t2578 = musttail call fastcc i64 @"emit.internal:code_763"(i64 %self, i64 2, i64 %t2576, i64 %t2577, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2578
else975:
  %t2579 = load i64, ptr @"emit.internal:reverse"
  %t2580 = and i64 %t2579, -8
  %t2581 = inttoptr i64 %t2580 to ptr
  %t2582 = load i64, ptr %t2581
  %t2583 = inttoptr i64 %t2582 to ptr
  %t2584 = call fastcc i64%t2583(i64 %t2579, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2585 = call i64 @rt_list_to_string(i64 %t2584)
  %t2586 = call i64 @rt_cons(i64 %t2585, i64 %a0)
  ret i64 %t2586
}

define fastcc i64 @"emit.internal:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2587 = icmp eq i64 %argc, 3
  br i1 %t2587, label %argok1007, label %arityerr1006
arityerr1006:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1007:
  %t2588 = call ptr @rt_alloc_words(i64 4)
  %t2589 = ptrtoint ptr %t2588 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_763" to i64), ptr %t2588
  %t2590 = or i64 %t2589, 4
  %t2591 = getelementptr i64, ptr %t2588, i64 1
  store i64 %a1, ptr %t2591
  %t2592 = getelementptr i64, ptr %t2588, i64 2
  store i64 %a0, ptr %t2592
  %t2593 = getelementptr i64, ptr %t2588, i64 3
  store i64 %t2590, ptr %t2593
  %t2594 = musttail call fastcc i64 @"emit.internal:code_763"(i64 %t2590, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2594
}

define fastcc i64 @"emit.internal:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2599 = icmp eq i64 %argc, 3
  br i1 %t2599, label %argok1009, label %arityerr1008
arityerr1008:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1009:
  %t2600 = or i64 %a1, %a2
  %t2601 = and i64 %t2600, 7
  %t2602 = icmp eq i64 %t2601, 0
  br i1 %t2602, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t2603 = icmp slt i64 %a1, %a2
  %t2604 = select i1 %t2603, i64 257, i64 1
  br label %fixmerge1012
fixslow1011:
  %t2605 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1012
fixmerge1012:
  %t2606 = phi i64 [ %t2604, %fixfast1010 ], [ %t2605, %fixslow1011 ]
  %t2607 = icmp ne i64 %t2606, 1
  br i1 %t2607, label %then1013, label %else1014
then1013:
  br label %merge1015
else1014:
  %t2608 = or i64 %a1, %a2
  %t2609 = and i64 %t2608, 7
  %t2610 = icmp eq i64 %t2609, 0
  br i1 %t2610, label %fixfast1016, label %fixslow1017
fixfast1016:
  %t2611 = icmp eq i64 %a1, %a2
  %t2612 = select i1 %t2611, i64 257, i64 1
  br label %fixmerge1018
fixslow1017:
  %t2613 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge1018
fixmerge1018:
  %t2614 = phi i64 [ %t2612, %fixfast1016 ], [ %t2613, %fixslow1017 ]
  br label %merge1015
merge1015:
  %t2615 = phi i64 [ 257, %then1013 ], [ %t2614, %fixmerge1018 ]
  %t2616 = icmp ne i64 %t2615, 1
  br i1 %t2616, label %then1019, label %else1020
then1019:
  %t2617 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2618 = or i64 %a2, 8
  %t2619 = and i64 %t2618, 7
  %t2620 = icmp eq i64 %t2619, 0
  br i1 %t2620, label %fixfast1021, label %fixslow1022
fixfast1021:
  %t2621 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t2622 = extractvalue {i64, i1} %t2621, 0
  %t2623 = extractvalue {i64, i1} %t2621, 1
  br i1 %t2623, label %fixslow1022, label %fixmerge1023
fixslow1022:
  %t2624 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1023
fixmerge1023:
  %t2625 = phi i64 [ %t2622, %fixfast1021 ], [ %t2624, %fixslow1022 ]
  %t2626 = load i64, ptr @"emit.internal:rd-fail"
  %t2627 = and i64 %t2626, -8
  %t2628 = inttoptr i64 %t2627 to ptr
  %t2629 = load i64, ptr %t2628
  %t2630 = inttoptr i64 %t2629 to ptr
  %t2631 = musttail call fastcc i64 %t2630(i64 %t2626, i64 2, i64 %t2617, i64 %t2625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2631
else1020:
  %t2632 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2633 = call i64 @rt_char_to_integer(i64 %t2632)
  %t2634 = or i64 %t2633, 928
  %t2635 = and i64 %t2634, 7
  %t2636 = icmp eq i64 %t2635, 0
  br i1 %t2636, label %fixfast1024, label %fixslow1025
fixfast1024:
  %t2637 = icmp eq i64 %t2633, 928
  %t2638 = select i1 %t2637, i64 257, i64 1
  br label %fixmerge1026
fixslow1025:
  %t2639 = call i64 @rt_num_eq(i64 %t2633, i64 928)
  br label %fixmerge1026
fixmerge1026:
  %t2640 = phi i64 [ %t2638, %fixfast1024 ], [ %t2639, %fixslow1025 ]
  %t2641 = icmp ne i64 %t2640, 1
  br i1 %t2641, label %then1027, label %else1028
then1027:
  %t2642 = or i64 %a2, 8
  %t2643 = and i64 %t2642, 7
  %t2644 = icmp eq i64 %t2643, 0
  br i1 %t2644, label %fixfast1029, label %fixslow1030
fixfast1029:
  %t2645 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2646 = extractvalue {i64, i1} %t2645, 0
  %t2647 = extractvalue {i64, i1} %t2645, 1
  br i1 %t2647, label %fixslow1030, label %fixmerge1031
fixslow1030:
  %t2648 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1031
fixmerge1031:
  %t2649 = phi i64 [ %t2646, %fixfast1029 ], [ %t2648, %fixslow1030 ]
  %t2650 = call i64 @rt_cons(i64 257, i64 %t2649)
  ret i64 %t2650
else1028:
  %t2651 = or i64 %t2633, 816
  %t2652 = and i64 %t2651, 7
  %t2653 = icmp eq i64 %t2652, 0
  br i1 %t2653, label %fixfast1032, label %fixslow1033
fixfast1032:
  %t2654 = icmp eq i64 %t2633, 816
  %t2655 = select i1 %t2654, i64 257, i64 1
  br label %fixmerge1034
fixslow1033:
  %t2656 = call i64 @rt_num_eq(i64 %t2633, i64 816)
  br label %fixmerge1034
fixmerge1034:
  %t2657 = phi i64 [ %t2655, %fixfast1032 ], [ %t2656, %fixslow1033 ]
  %t2658 = icmp ne i64 %t2657, 1
  br i1 %t2658, label %then1035, label %else1036
then1035:
  %t2659 = or i64 %a2, 8
  %t2660 = and i64 %t2659, 7
  %t2661 = icmp eq i64 %t2660, 0
  br i1 %t2661, label %fixfast1037, label %fixslow1038
fixfast1037:
  %t2662 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2663 = extractvalue {i64, i1} %t2662, 0
  %t2664 = extractvalue {i64, i1} %t2662, 1
  br i1 %t2664, label %fixslow1038, label %fixmerge1039
fixslow1038:
  %t2665 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1039
fixmerge1039:
  %t2666 = phi i64 [ %t2663, %fixfast1037 ], [ %t2665, %fixslow1038 ]
  %t2667 = call i64 @rt_cons(i64 1, i64 %t2666)
  ret i64 %t2667
else1036:
  %t2668 = or i64 %t2633, 736
  %t2669 = and i64 %t2668, 7
  %t2670 = icmp eq i64 %t2669, 0
  br i1 %t2670, label %fixfast1040, label %fixslow1041
fixfast1040:
  %t2671 = icmp eq i64 %t2633, 736
  %t2672 = select i1 %t2671, i64 257, i64 1
  br label %fixmerge1042
fixslow1041:
  %t2673 = call i64 @rt_num_eq(i64 %t2633, i64 736)
  br label %fixmerge1042
fixmerge1042:
  %t2674 = phi i64 [ %t2672, %fixfast1040 ], [ %t2673, %fixslow1041 ]
  %t2675 = icmp ne i64 %t2674, 1
  br i1 %t2675, label %then1043, label %else1044
then1043:
  %t2676 = load i64, ptr @"emit.internal:rd-char"
  %t2677 = and i64 %t2676, -8
  %t2678 = inttoptr i64 %t2677 to ptr
  %t2679 = load i64, ptr %t2678
  %t2680 = inttoptr i64 %t2679 to ptr
  %t2681 = musttail call fastcc i64 %t2680(i64 %t2676, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2681
else1044:
  %t2682 = or i64 %t2633, 320
  %t2683 = and i64 %t2682, 7
  %t2684 = icmp eq i64 %t2683, 0
  br i1 %t2684, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t2685 = icmp eq i64 %t2633, 320
  %t2686 = select i1 %t2685, i64 257, i64 1
  br label %fixmerge1047
fixslow1046:
  %t2687 = call i64 @rt_num_eq(i64 %t2633, i64 320)
  br label %fixmerge1047
fixmerge1047:
  %t2688 = phi i64 [ %t2686, %fixfast1045 ], [ %t2687, %fixslow1046 ]
  %t2689 = icmp ne i64 %t2688, 1
  br i1 %t2689, label %then1048, label %else1049
then1048:
  %t2690 = or i64 %a2, 8
  %t2691 = and i64 %t2690, 7
  %t2692 = icmp eq i64 %t2691, 0
  br i1 %t2692, label %fixfast1050, label %fixslow1051
fixfast1050:
  %t2693 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2694 = extractvalue {i64, i1} %t2693, 0
  %t2695 = extractvalue {i64, i1} %t2693, 1
  br i1 %t2695, label %fixslow1051, label %fixmerge1052
fixslow1051:
  %t2696 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1052
fixmerge1052:
  %t2697 = phi i64 [ %t2694, %fixfast1050 ], [ %t2696, %fixslow1051 ]
  %t2698 = load i64, ptr @"emit.internal:rd-list"
  %t2699 = and i64 %t2698, -8
  %t2700 = inttoptr i64 %t2699 to ptr
  %t2701 = load i64, ptr %t2700
  %t2702 = inttoptr i64 %t2701 to ptr
  %t2703 = call fastcc i64%t2702(i64 %t2698, i64 4, i64 %a0, i64 %a1, i64 %t2697, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2704 = call i64 @rt_cdr(i64 %t2703)
  %t2705 = load i64, ptr @"emit.internal:rd-fail?"
  %t2706 = and i64 %t2705, -8
  %t2707 = inttoptr i64 %t2706 to ptr
  %t2708 = load i64, ptr %t2707
  %t2709 = inttoptr i64 %t2708 to ptr
  %t2710 = call fastcc i64%t2709(i64 %t2705, i64 1, i64 %t2704, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2711 = icmp ne i64 %t2710, 1
  br i1 %t2711, label %then1053, label %else1054
then1053:
  ret i64 %t2703
else1054:
  %t2712 = call i64 @rt_car(i64 %t2703)
  %t2713 = load i64, ptr @"emit.internal:list->vector"
  %t2714 = and i64 %t2713, -8
  %t2715 = inttoptr i64 %t2714 to ptr
  %t2716 = load i64, ptr %t2715
  %t2717 = inttoptr i64 %t2716 to ptr
  %t2718 = call fastcc i64%t2717(i64 %t2713, i64 1, i64 %t2712, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2719 = call i64 @rt_cdr(i64 %t2703)
  %t2720 = call i64 @rt_cons(i64 %t2718, i64 %t2719)
  ret i64 %t2720
else1049:
  %t2721 = or i64 %t2633, 472
  %t2722 = and i64 %t2721, 7
  %t2723 = icmp eq i64 %t2722, 0
  br i1 %t2723, label %fixfast1055, label %fixslow1056
fixfast1055:
  %t2724 = icmp eq i64 %t2633, 472
  %t2725 = select i1 %t2724, i64 257, i64 1
  br label %fixmerge1057
fixslow1056:
  %t2726 = call i64 @rt_num_eq(i64 %t2633, i64 472)
  br label %fixmerge1057
fixmerge1057:
  %t2727 = phi i64 [ %t2725, %fixfast1055 ], [ %t2726, %fixslow1056 ]
  %t2728 = icmp ne i64 %t2727, 1
  br i1 %t2728, label %then1058, label %else1059
then1058:
  %t2729 = or i64 %a2, 8
  %t2730 = and i64 %t2729, 7
  %t2731 = icmp eq i64 %t2730, 0
  br i1 %t2731, label %fixfast1060, label %fixslow1061
fixfast1060:
  %t2732 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2733 = extractvalue {i64, i1} %t2732, 0
  %t2734 = extractvalue {i64, i1} %t2732, 1
  br i1 %t2734, label %fixslow1061, label %fixmerge1062
fixslow1061:
  %t2735 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1062
fixmerge1062:
  %t2736 = phi i64 [ %t2733, %fixfast1060 ], [ %t2735, %fixslow1061 ]
  %t2737 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t2738 = and i64 %t2737, -8
  %t2739 = inttoptr i64 %t2738 to ptr
  %t2740 = load i64, ptr %t2739
  %t2741 = inttoptr i64 %t2740 to ptr
  %t2742 = call fastcc i64%t2741(i64 %t2737, i64 3, i64 %a0, i64 %a1, i64 %t2736, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2743 = load i64, ptr @"emit.internal:rd-datum"
  %t2744 = and i64 %t2743, -8
  %t2745 = inttoptr i64 %t2744 to ptr
  %t2746 = load i64, ptr %t2745
  %t2747 = inttoptr i64 %t2746 to ptr
  %t2748 = call fastcc i64%t2747(i64 %t2743, i64 3, i64 %a0, i64 %a1, i64 %t2742, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2749 = call i64 @rt_cdr(i64 %t2748)
  %t2750 = load i64, ptr @"emit.internal:rd-fail?"
  %t2751 = and i64 %t2750, -8
  %t2752 = inttoptr i64 %t2751 to ptr
  %t2753 = load i64, ptr %t2752
  %t2754 = inttoptr i64 %t2753 to ptr
  %t2755 = call fastcc i64%t2754(i64 %t2750, i64 1, i64 %t2749, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2756 = icmp ne i64 %t2755, 1
  br i1 %t2756, label %then1063, label %else1064
then1063:
  ret i64 %t2748
else1064:
  %t2757 = call i64 @rt_cdr(i64 %t2748)
  %t2758 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t2759 = and i64 %t2758, -8
  %t2760 = inttoptr i64 %t2759 to ptr
  %t2761 = load i64, ptr %t2760
  %t2762 = inttoptr i64 %t2761 to ptr
  %t2763 = call fastcc i64%t2762(i64 %t2758, i64 3, i64 %a0, i64 %a1, i64 %t2757, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2764 = load i64, ptr @"emit.internal:rd-datum"
  %t2765 = and i64 %t2764, -8
  %t2766 = inttoptr i64 %t2765 to ptr
  %t2767 = load i64, ptr %t2766
  %t2768 = inttoptr i64 %t2767 to ptr
  %t2769 = musttail call fastcc i64 %t2768(i64 %t2764, i64 3, i64 %a0, i64 %a1, i64 %t2763, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2769
else1059:
  %t2770 = or i64 %t2633, 936
  %t2771 = and i64 %t2770, 7
  %t2772 = icmp eq i64 %t2771, 0
  br i1 %t2772, label %fixfast1065, label %fixslow1066
fixfast1065:
  %t2773 = icmp eq i64 %t2633, 936
  %t2774 = select i1 %t2773, i64 257, i64 1
  br label %fixmerge1067
fixslow1066:
  %t2775 = call i64 @rt_num_eq(i64 %t2633, i64 936)
  br label %fixmerge1067
fixmerge1067:
  %t2776 = phi i64 [ %t2774, %fixfast1065 ], [ %t2775, %fixslow1066 ]
  %t2777 = icmp ne i64 %t2776, 1
  br i1 %t2777, label %then1068, label %else1069
then1068:
  %t2778 = or i64 %a2, 16
  %t2779 = and i64 %t2778, 7
  %t2780 = icmp eq i64 %t2779, 0
  br i1 %t2780, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t2781 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2782 = extractvalue {i64, i1} %t2781, 0
  %t2783 = extractvalue {i64, i1} %t2781, 1
  br i1 %t2783, label %fixslow1072, label %fixmerge1073
fixslow1072:
  %t2784 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1073
fixmerge1073:
  %t2785 = phi i64 [ %t2782, %fixfast1071 ], [ %t2784, %fixslow1072 ]
  %t2786 = or i64 %t2785, %a1
  %t2787 = and i64 %t2786, 7
  %t2788 = icmp eq i64 %t2787, 0
  br i1 %t2788, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t2789 = icmp slt i64 %t2785, %a1
  %t2790 = select i1 %t2789, i64 257, i64 1
  br label %fixmerge1076
fixslow1075:
  %t2791 = call i64 @rt_lt(i64 %t2785, i64 %a1)
  br label %fixmerge1076
fixmerge1076:
  %t2792 = phi i64 [ %t2790, %fixfast1074 ], [ %t2791, %fixslow1075 ]
  %t2793 = icmp ne i64 %t2792, 1
  br i1 %t2793, label %then1077, label %else1078
then1077:
  %t2794 = or i64 %a2, 8
  %t2795 = and i64 %t2794, 7
  %t2796 = icmp eq i64 %t2795, 0
  br i1 %t2796, label %fixfast1080, label %fixslow1081
fixfast1080:
  %t2797 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2798 = extractvalue {i64, i1} %t2797, 0
  %t2799 = extractvalue {i64, i1} %t2797, 1
  br i1 %t2799, label %fixslow1081, label %fixmerge1082
fixslow1081:
  %t2800 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1082
fixmerge1082:
  %t2801 = phi i64 [ %t2798, %fixfast1080 ], [ %t2800, %fixslow1081 ]
  %t2802 = call i64 @rt_string_ref(i64 %a0, i64 %t2801)
  %t2803 = call i64 @rt_char_to_integer(i64 %t2802)
  %t2804 = or i64 %t2803, 448
  %t2805 = and i64 %t2804, 7
  %t2806 = icmp eq i64 %t2805, 0
  br i1 %t2806, label %fixfast1083, label %fixslow1084
fixfast1083:
  %t2807 = icmp eq i64 %t2803, 448
  %t2808 = select i1 %t2807, i64 257, i64 1
  br label %fixmerge1085
fixslow1084:
  %t2809 = call i64 @rt_num_eq(i64 %t2803, i64 448)
  br label %fixmerge1085
fixmerge1085:
  %t2810 = phi i64 [ %t2808, %fixfast1083 ], [ %t2809, %fixslow1084 ]
  %t2811 = icmp ne i64 %t2810, 1
  br i1 %t2811, label %then1086, label %else1087
then1086:
  %t2812 = or i64 %a2, 16
  %t2813 = and i64 %t2812, 7
  %t2814 = icmp eq i64 %t2813, 0
  br i1 %t2814, label %fixfast1089, label %fixslow1090
fixfast1089:
  %t2815 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t2816 = extractvalue {i64, i1} %t2815, 0
  %t2817 = extractvalue {i64, i1} %t2815, 1
  br i1 %t2817, label %fixslow1090, label %fixmerge1091
fixslow1090:
  %t2818 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1091
fixmerge1091:
  %t2819 = phi i64 [ %t2816, %fixfast1089 ], [ %t2818, %fixslow1090 ]
  %t2820 = call i64 @rt_string_ref(i64 %a0, i64 %t2819)
  %t2821 = call i64 @rt_char_to_integer(i64 %t2820)
  %t2822 = or i64 %t2821, 320
  %t2823 = and i64 %t2822, 7
  %t2824 = icmp eq i64 %t2823, 0
  br i1 %t2824, label %fixfast1092, label %fixslow1093
fixfast1092:
  %t2825 = icmp eq i64 %t2821, 320
  %t2826 = select i1 %t2825, i64 257, i64 1
  br label %fixmerge1094
fixslow1093:
  %t2827 = call i64 @rt_num_eq(i64 %t2821, i64 320)
  br label %fixmerge1094
fixmerge1094:
  %t2828 = phi i64 [ %t2826, %fixfast1092 ], [ %t2827, %fixslow1093 ]
  br label %merge1088
else1087:
  br label %merge1088
merge1088:
  %t2829 = phi i64 [ %t2828, %fixmerge1094 ], [ 1, %else1087 ]
  br label %merge1079
else1078:
  br label %merge1079
merge1079:
  %t2830 = phi i64 [ %t2829, %merge1088 ], [ 1, %else1078 ]
  br label %merge1070
else1069:
  br label %merge1070
merge1070:
  %t2831 = phi i64 [ %t2830, %merge1079 ], [ 1, %else1069 ]
  %t2832 = icmp ne i64 %t2831, 1
  br i1 %t2832, label %then1095, label %else1096
then1095:
  %t2833 = or i64 %a2, 24
  %t2834 = and i64 %t2833, 7
  %t2835 = icmp eq i64 %t2834, 0
  br i1 %t2835, label %fixfast1097, label %fixslow1098
fixfast1097:
  %t2836 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t2837 = extractvalue {i64, i1} %t2836, 0
  %t2838 = extractvalue {i64, i1} %t2836, 1
  br i1 %t2838, label %fixslow1098, label %fixmerge1099
fixslow1098:
  %t2839 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1099
fixmerge1099:
  %t2840 = phi i64 [ %t2837, %fixfast1097 ], [ %t2839, %fixslow1098 ]
  %t2841 = load i64, ptr @"emit.internal:rd-list"
  %t2842 = and i64 %t2841, -8
  %t2843 = inttoptr i64 %t2842 to ptr
  %t2844 = load i64, ptr %t2843
  %t2845 = inttoptr i64 %t2844 to ptr
  %t2846 = call fastcc i64%t2845(i64 %t2841, i64 4, i64 %a0, i64 %a1, i64 %t2840, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2847 = call i64 @rt_cdr(i64 %t2846)
  %t2848 = load i64, ptr @"emit.internal:rd-fail?"
  %t2849 = and i64 %t2848, -8
  %t2850 = inttoptr i64 %t2849 to ptr
  %t2851 = load i64, ptr %t2850
  %t2852 = inttoptr i64 %t2851 to ptr
  %t2853 = call fastcc i64%t2852(i64 %t2848, i64 1, i64 %t2847, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2854 = icmp ne i64 %t2853, 1
  br i1 %t2854, label %then1100, label %else1101
then1100:
  ret i64 %t2846
else1101:
  %t2855 = call i64 @rt_car(i64 %t2846)
  %t2856 = load i64, ptr @"emit.internal:list->bytevector"
  %t2857 = and i64 %t2856, -8
  %t2858 = inttoptr i64 %t2857 to ptr
  %t2859 = load i64, ptr %t2858
  %t2860 = inttoptr i64 %t2859 to ptr
  %t2861 = call fastcc i64%t2860(i64 %t2856, i64 1, i64 %t2855, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2862 = call i64 @rt_cdr(i64 %t2846)
  %t2863 = call i64 @rt_cons(i64 %t2861, i64 %t2862)
  ret i64 %t2863
else1096:
  %t2864 = load i64, ptr @"emit.internal:rd-token-end"
  %t2865 = and i64 %t2864, -8
  %t2866 = inttoptr i64 %t2865 to ptr
  %t2867 = load i64, ptr %t2866
  %t2868 = inttoptr i64 %t2867 to ptr
  %t2869 = call fastcc i64%t2868(i64 %t2864, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2870 = or i64 %a2, 8
  %t2871 = and i64 %t2870, 7
  %t2872 = icmp eq i64 %t2871, 0
  br i1 %t2872, label %fixfast1102, label %fixslow1103
fixfast1102:
  %t2873 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t2874 = extractvalue {i64, i1} %t2873, 0
  %t2875 = extractvalue {i64, i1} %t2873, 1
  br i1 %t2875, label %fixslow1103, label %fixmerge1104
fixslow1103:
  %t2876 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1104
fixmerge1104:
  %t2877 = phi i64 [ %t2874, %fixfast1102 ], [ %t2876, %fixslow1103 ]
  %t2878 = call i64 @rt_substring(i64 %a0, i64 %t2877, i64 %t2869)
  %t2879 = load i64, ptr @"emit.internal:rd-number"
  %t2880 = and i64 %t2879, -8
  %t2881 = inttoptr i64 %t2880 to ptr
  %t2882 = load i64, ptr %t2881
  %t2883 = inttoptr i64 %t2882 to ptr
  %t2884 = call fastcc i64%t2883(i64 %t2879, i64 2, i64 %t2878, i64 80, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2885 = load i64, ptr @"emit.internal:rd-number-reason?"
  %t2886 = and i64 %t2885, -8
  %t2887 = inttoptr i64 %t2886 to ptr
  %t2888 = load i64, ptr %t2887
  %t2889 = inttoptr i64 %t2888 to ptr
  %t2890 = call fastcc i64%t2889(i64 %t2885, i64 1, i64 %t2884, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2891 = icmp ne i64 %t2890, 1
  br i1 %t2891, label %then1105, label %else1106
then1105:
  %t2892 = or i64 %a2, 8
  %t2893 = and i64 %t2892, 7
  %t2894 = icmp eq i64 %t2893, 0
  br i1 %t2894, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t2895 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a2, i64 8)
  %t2896 = extractvalue {i64, i1} %t2895, 0
  %t2897 = extractvalue {i64, i1} %t2895, 1
  br i1 %t2897, label %fixslow1108, label %fixmerge1109
fixslow1108:
  %t2898 = call i64 @rt_sub(i64 %a2, i64 8)
  br label %fixmerge1109
fixmerge1109:
  %t2899 = phi i64 [ %t2896, %fixfast1107 ], [ %t2898, %fixslow1108 ]
  %t2900 = load i64, ptr @"emit.internal:rd-fail"
  %t2901 = and i64 %t2900, -8
  %t2902 = inttoptr i64 %t2901 to ptr
  %t2903 = load i64, ptr %t2902
  %t2904 = inttoptr i64 %t2903 to ptr
  %t2905 = musttail call fastcc i64 %t2904(i64 %t2900, i64 2, i64 %t2884, i64 %t2899, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2905
else1106:
  %t2906 = call i64 @rt_cons(i64 %t2884, i64 %t2869)
  ret i64 %t2906
}

define fastcc i64 @"emit.internal:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2911 = icmp eq i64 %argc, 1
  br i1 %t2911, label %argok1111, label %arityerr1110
arityerr1110:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1111:
  %t2912 = call i64 @rt_make_string(ptr @.str.lit.12, i64 5)
  %t2913 = call i64 @rt_string_eq(i64 %a0, i64 %t2912)
  %t2914 = icmp ne i64 %t2913, 1
  br i1 %t2914, label %then1112, label %else1113
then1112:
  %t2915 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t2915
else1113:
  %t2916 = call i64 @rt_make_string(ptr @.str.lit.13, i64 7)
  %t2917 = call i64 @rt_string_eq(i64 %a0, i64 %t2916)
  %t2918 = icmp ne i64 %t2917, 1
  br i1 %t2918, label %then1114, label %else1115
then1114:
  %t2919 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2919
else1115:
  %t2920 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t2921 = call i64 @rt_string_eq(i64 %a0, i64 %t2920)
  %t2922 = icmp ne i64 %t2921, 1
  br i1 %t2922, label %then1116, label %else1117
then1116:
  %t2923 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2923
else1117:
  %t2924 = call i64 @rt_make_string(ptr @.str.lit.15, i64 6)
  %t2925 = call i64 @rt_string_eq(i64 %a0, i64 %t2924)
  %t2926 = icmp ne i64 %t2925, 1
  br i1 %t2926, label %then1118, label %else1119
then1118:
  %t2927 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2927
else1119:
  %t2928 = call i64 @rt_make_string(ptr @.str.lit.16, i64 3)
  %t2929 = call i64 @rt_string_eq(i64 %a0, i64 %t2928)
  %t2930 = icmp ne i64 %t2929, 1
  br i1 %t2930, label %then1120, label %else1121
then1120:
  %t2931 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t2931
else1121:
  %t2932 = call i64 @rt_make_string(ptr @.str.lit.17, i64 4)
  %t2933 = call i64 @rt_string_eq(i64 %a0, i64 %t2932)
  %t2934 = icmp ne i64 %t2933, 1
  br i1 %t2934, label %then1122, label %else1123
then1122:
  %t2935 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t2935
else1123:
  %t2936 = call i64 @rt_make_string(ptr @.str.lit.18, i64 6)
  %t2937 = call i64 @rt_string_eq(i64 %a0, i64 %t2936)
  %t2938 = icmp ne i64 %t2937, 1
  br i1 %t2938, label %then1124, label %else1125
then1124:
  %t2939 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t2939
else1125:
  %t2940 = call i64 @rt_make_string(ptr @.str.lit.19, i64 7)
  %t2941 = call i64 @rt_string_eq(i64 %a0, i64 %t2940)
  %t2942 = icmp ne i64 %t2941, 1
  br i1 %t2942, label %then1126, label %else1127
then1126:
  %t2943 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t2943
else1127:
  %t2944 = call i64 @rt_make_string(ptr @.str.lit.20, i64 3)
  %t2945 = call i64 @rt_string_eq(i64 %a0, i64 %t2944)
  %t2946 = icmp ne i64 %t2945, 1
  br i1 %t2946, label %then1128, label %else1129
then1128:
  %t2947 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t2947
else1129:
  %t2948 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t2948
}

define fastcc i64 @"emit.internal:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2953 = icmp eq i64 %argc, 3
  br i1 %t2953, label %argok1131, label %arityerr1130
arityerr1130:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1131:
  %t2954 = or i64 %a2, 8
  %t2955 = and i64 %t2954, 7
  %t2956 = icmp eq i64 %t2955, 0
  br i1 %t2956, label %fixfast1132, label %fixslow1133
fixfast1132:
  %t2957 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2958 = extractvalue {i64, i1} %t2957, 0
  %t2959 = extractvalue {i64, i1} %t2957, 1
  br i1 %t2959, label %fixslow1133, label %fixmerge1134
fixslow1133:
  %t2960 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1134
fixmerge1134:
  %t2961 = phi i64 [ %t2958, %fixfast1132 ], [ %t2960, %fixslow1133 ]
  %t2962 = or i64 %t2961, 8
  %t2963 = and i64 %t2962, 7
  %t2964 = icmp eq i64 %t2963, 0
  br i1 %t2964, label %fixfast1135, label %fixslow1136
fixfast1135:
  %t2965 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2961, i64 8)
  %t2966 = extractvalue {i64, i1} %t2965, 0
  %t2967 = extractvalue {i64, i1} %t2965, 1
  br i1 %t2967, label %fixslow1136, label %fixmerge1137
fixslow1136:
  %t2968 = call i64 @rt_add(i64 %t2961, i64 8)
  br label %fixmerge1137
fixmerge1137:
  %t2969 = phi i64 [ %t2966, %fixfast1135 ], [ %t2968, %fixslow1136 ]
  %t2970 = load i64, ptr @"emit.internal:rd-token-end"
  %t2971 = and i64 %t2970, -8
  %t2972 = inttoptr i64 %t2971 to ptr
  %t2973 = load i64, ptr %t2972
  %t2974 = inttoptr i64 %t2973 to ptr
  %t2975 = call fastcc i64%t2974(i64 %t2970, i64 3, i64 %a0, i64 %a1, i64 %t2969, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2976 = call i64 @rt_substring(i64 %a0, i64 %t2961, i64 %t2975)
  %t2977 = call i64 @rt_string_length(i64 %t2976)
  %t2978 = or i64 %t2977, 8
  %t2979 = and i64 %t2978, 7
  %t2980 = icmp eq i64 %t2979, 0
  br i1 %t2980, label %fixfast1138, label %fixslow1139
fixfast1138:
  %t2981 = icmp eq i64 %t2977, 8
  %t2982 = select i1 %t2981, i64 257, i64 1
  br label %fixmerge1140
fixslow1139:
  %t2983 = call i64 @rt_num_eq(i64 %t2977, i64 8)
  br label %fixmerge1140
fixmerge1140:
  %t2984 = phi i64 [ %t2982, %fixfast1138 ], [ %t2983, %fixslow1139 ]
  %t2985 = icmp ne i64 %t2984, 1
  br i1 %t2985, label %then1141, label %else1142
then1141:
  %t2986 = call i64 @rt_string_ref(i64 %a0, i64 %t2961)
  %t2987 = call i64 @rt_cons(i64 %t2986, i64 %t2975)
  ret i64 %t2987
else1142:
  %t2988 = load i64, ptr @"emit.internal:rd-char-name"
  %t2989 = and i64 %t2988, -8
  %t2990 = inttoptr i64 %t2989 to ptr
  %t2991 = load i64, ptr %t2990
  %t2992 = inttoptr i64 %t2991 to ptr
  %t2993 = call fastcc i64%t2992(i64 %t2988, i64 1, i64 %t2976, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2994 = call i64 @rt_cons(i64 %t2993, i64 %t2975)
  ret i64 %t2994
}

define fastcc i64 @"emit.internal:code_860"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2999 = icmp eq i64 %argc, 2
  br i1 %t2999, label %argok1144, label %arityerr1143
arityerr1143:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1144:
  %t3000 = and i64 %self, -8
  %t3001 = inttoptr i64 %t3000 to ptr
  %t3002 = getelementptr i64, ptr %t3001, i64 1
  %t3003 = load i64, ptr %t3002
  %t3004 = or i64 %a0, %t3003
  %t3005 = and i64 %t3004, 7
  %t3006 = icmp eq i64 %t3005, 0
  br i1 %t3006, label %fixfast1145, label %fixslow1146
fixfast1145:
  %t3007 = icmp slt i64 %a0, %t3003
  %t3008 = select i1 %t3007, i64 257, i64 1
  br label %fixmerge1147
fixslow1146:
  %t3009 = call i64 @rt_lt(i64 %a0, i64 %t3003)
  br label %fixmerge1147
fixmerge1147:
  %t3010 = phi i64 [ %t3008, %fixfast1145 ], [ %t3009, %fixslow1146 ]
  %t3011 = icmp ne i64 %t3010, 1
  br i1 %t3011, label %then1148, label %else1149
then1148:
  %t3012 = and i64 %self, -8
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = getelementptr i64, ptr %t3013, i64 2
  %t3015 = load i64, ptr %t3014
  %t3016 = call i64 @rt_string_ref(i64 %t3015, i64 %a0)
  %t3017 = call i64 @rt_char_to_integer(i64 %t3016)
  %t3018 = or i64 %t3017, 992
  %t3019 = and i64 %t3018, 7
  %t3020 = icmp eq i64 %t3019, 0
  br i1 %t3020, label %fixfast1150, label %fixslow1151
fixfast1150:
  %t3021 = icmp eq i64 %t3017, 992
  %t3022 = select i1 %t3021, i64 257, i64 1
  br label %fixmerge1152
fixslow1151:
  %t3023 = call i64 @rt_num_eq(i64 %t3017, i64 992)
  br label %fixmerge1152
fixmerge1152:
  %t3024 = phi i64 [ %t3022, %fixfast1150 ], [ %t3023, %fixslow1151 ]
  %t3025 = icmp ne i64 %t3024, 1
  br i1 %t3025, label %then1153, label %else1154
then1153:
  %t3026 = load i64, ptr @"emit.internal:reverse"
  %t3027 = and i64 %t3026, -8
  %t3028 = inttoptr i64 %t3027 to ptr
  %t3029 = load i64, ptr %t3028
  %t3030 = inttoptr i64 %t3029 to ptr
  %t3031 = call fastcc i64%t3030(i64 %t3026, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3032 = call i64 @rt_list_to_string(i64 %t3031)
  %t3033 = call i64 @rt_string_to_symbol(i64 %t3032)
  %t3034 = or i64 %a0, 8
  %t3035 = and i64 %t3034, 7
  %t3036 = icmp eq i64 %t3035, 0
  br i1 %t3036, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t3037 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3038 = extractvalue {i64, i1} %t3037, 0
  %t3039 = extractvalue {i64, i1} %t3037, 1
  br i1 %t3039, label %fixslow1156, label %fixmerge1157
fixslow1156:
  %t3040 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1157
fixmerge1157:
  %t3041 = phi i64 [ %t3038, %fixfast1155 ], [ %t3040, %fixslow1156 ]
  %t3042 = call i64 @rt_cons(i64 %t3033, i64 %t3041)
  ret i64 %t3042
else1154:
  %t3043 = or i64 %t3017, 736
  %t3044 = and i64 %t3043, 7
  %t3045 = icmp eq i64 %t3044, 0
  br i1 %t3045, label %fixfast1158, label %fixslow1159
fixfast1158:
  %t3046 = icmp eq i64 %t3017, 736
  %t3047 = select i1 %t3046, i64 257, i64 1
  br label %fixmerge1160
fixslow1159:
  %t3048 = call i64 @rt_num_eq(i64 %t3017, i64 736)
  br label %fixmerge1160
fixmerge1160:
  %t3049 = phi i64 [ %t3047, %fixfast1158 ], [ %t3048, %fixslow1159 ]
  %t3050 = icmp ne i64 %t3049, 1
  br i1 %t3050, label %then1161, label %else1162
then1161:
  %t3051 = or i64 %a0, 8
  %t3052 = and i64 %t3051, 7
  %t3053 = icmp eq i64 %t3052, 0
  br i1 %t3053, label %fixfast1164, label %fixslow1165
fixfast1164:
  %t3054 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3055 = extractvalue {i64, i1} %t3054, 0
  %t3056 = extractvalue {i64, i1} %t3054, 1
  br i1 %t3056, label %fixslow1165, label %fixmerge1166
fixslow1165:
  %t3057 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1166
fixmerge1166:
  %t3058 = phi i64 [ %t3055, %fixfast1164 ], [ %t3057, %fixslow1165 ]
  %t3059 = and i64 %self, -8
  %t3060 = inttoptr i64 %t3059 to ptr
  %t3061 = getelementptr i64, ptr %t3060, i64 1
  %t3062 = load i64, ptr %t3061
  %t3063 = or i64 %t3058, %t3062
  %t3064 = and i64 %t3063, 7
  %t3065 = icmp eq i64 %t3064, 0
  br i1 %t3065, label %fixfast1167, label %fixslow1168
fixfast1167:
  %t3066 = icmp slt i64 %t3058, %t3062
  %t3067 = select i1 %t3066, i64 257, i64 1
  br label %fixmerge1169
fixslow1168:
  %t3068 = call i64 @rt_lt(i64 %t3058, i64 %t3062)
  br label %fixmerge1169
fixmerge1169:
  %t3069 = phi i64 [ %t3067, %fixfast1167 ], [ %t3068, %fixslow1168 ]
  br label %merge1163
else1162:
  br label %merge1163
merge1163:
  %t3070 = phi i64 [ %t3069, %fixmerge1169 ], [ 1, %else1162 ]
  %t3071 = icmp ne i64 %t3070, 1
  br i1 %t3071, label %then1170, label %else1171
then1170:
  %t3072 = and i64 %self, -8
  %t3073 = inttoptr i64 %t3072 to ptr
  %t3074 = getelementptr i64, ptr %t3073, i64 2
  %t3075 = load i64, ptr %t3074
  %t3076 = or i64 %a0, 8
  %t3077 = and i64 %t3076, 7
  %t3078 = icmp eq i64 %t3077, 0
  br i1 %t3078, label %fixfast1172, label %fixslow1173
fixfast1172:
  %t3079 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3080 = extractvalue {i64, i1} %t3079, 0
  %t3081 = extractvalue {i64, i1} %t3079, 1
  br i1 %t3081, label %fixslow1173, label %fixmerge1174
fixslow1173:
  %t3082 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1174
fixmerge1174:
  %t3083 = phi i64 [ %t3080, %fixfast1172 ], [ %t3082, %fixslow1173 ]
  %t3084 = call i64 @rt_string_ref(i64 %t3075, i64 %t3083)
  %t3085 = call i64 @rt_char_to_integer(i64 %t3084)
  %t3086 = or i64 %t3085, 960
  %t3087 = and i64 %t3086, 7
  %t3088 = icmp eq i64 %t3087, 0
  br i1 %t3088, label %fixfast1175, label %fixslow1176
fixfast1175:
  %t3089 = icmp eq i64 %t3085, 960
  %t3090 = select i1 %t3089, i64 257, i64 1
  br label %fixmerge1177
fixslow1176:
  %t3091 = call i64 @rt_num_eq(i64 %t3085, i64 960)
  br label %fixmerge1177
fixmerge1177:
  %t3092 = phi i64 [ %t3090, %fixfast1175 ], [ %t3091, %fixslow1176 ]
  %t3093 = icmp ne i64 %t3092, 1
  br i1 %t3093, label %then1178, label %else1179
then1178:
  %t3094 = and i64 %self, -8
  %t3095 = inttoptr i64 %t3094 to ptr
  %t3096 = getelementptr i64, ptr %t3095, i64 2
  %t3097 = load i64, ptr %t3096
  %t3098 = and i64 %self, -8
  %t3099 = inttoptr i64 %t3098 to ptr
  %t3100 = getelementptr i64, ptr %t3099, i64 1
  %t3101 = load i64, ptr %t3100
  %t3102 = or i64 %a0, 16
  %t3103 = and i64 %t3102, 7
  %t3104 = icmp eq i64 %t3103, 0
  br i1 %t3104, label %fixfast1180, label %fixslow1181
fixfast1180:
  %t3105 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3106 = extractvalue {i64, i1} %t3105, 0
  %t3107 = extractvalue {i64, i1} %t3105, 1
  br i1 %t3107, label %fixslow1181, label %fixmerge1182
fixslow1181:
  %t3108 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1182
fixmerge1182:
  %t3109 = phi i64 [ %t3106, %fixfast1180 ], [ %t3108, %fixslow1181 ]
  %t3110 = load i64, ptr @"emit.internal:rd-hex"
  %t3111 = and i64 %t3110, -8
  %t3112 = inttoptr i64 %t3111 to ptr
  %t3113 = load i64, ptr %t3112
  %t3114 = inttoptr i64 %t3113 to ptr
  %t3115 = call fastcc i64%t3114(i64 %t3110, i64 4, i64 %t3097, i64 %t3101, i64 %t3109, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3116 = call i64 @rt_cdr(i64 %t3115)
  %t3117 = call i64 @rt_car(i64 %t3115)
  %t3118 = call i64 @rt_integer_to_char(i64 %t3117)
  %t3119 = call i64 @rt_cons(i64 %t3118, i64 %a1)
  %t3120 = musttail call fastcc i64 @"emit.internal:code_860"(i64 %self, i64 2, i64 %t3116, i64 %t3119, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3120
else1179:
  %t3121 = or i64 %a0, 16
  %t3122 = and i64 %t3121, 7
  %t3123 = icmp eq i64 %t3122, 0
  br i1 %t3123, label %fixfast1183, label %fixslow1184
fixfast1183:
  %t3124 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3125 = extractvalue {i64, i1} %t3124, 0
  %t3126 = extractvalue {i64, i1} %t3124, 1
  br i1 %t3126, label %fixslow1184, label %fixmerge1185
fixslow1184:
  %t3127 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1185
fixmerge1185:
  %t3128 = phi i64 [ %t3125, %fixfast1183 ], [ %t3127, %fixslow1184 ]
  %t3129 = load i64, ptr @"emit.internal:rd-str-esc"
  %t3130 = and i64 %t3129, -8
  %t3131 = inttoptr i64 %t3130 to ptr
  %t3132 = load i64, ptr %t3131
  %t3133 = inttoptr i64 %t3132 to ptr
  %t3134 = call fastcc i64%t3133(i64 %t3129, i64 1, i64 %t3084, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3135 = call i64 @rt_cons(i64 %t3134, i64 %a1)
  %t3136 = musttail call fastcc i64 @"emit.internal:code_860"(i64 %self, i64 2, i64 %t3128, i64 %t3135, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3136
else1171:
  %t3137 = or i64 %a0, 8
  %t3138 = and i64 %t3137, 7
  %t3139 = icmp eq i64 %t3138, 0
  br i1 %t3139, label %fixfast1186, label %fixslow1187
fixfast1186:
  %t3140 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3141 = extractvalue {i64, i1} %t3140, 0
  %t3142 = extractvalue {i64, i1} %t3140, 1
  br i1 %t3142, label %fixslow1187, label %fixmerge1188
fixslow1187:
  %t3143 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1188
fixmerge1188:
  %t3144 = phi i64 [ %t3141, %fixfast1186 ], [ %t3143, %fixslow1187 ]
  %t3145 = call i64 @rt_cons(i64 %t3016, i64 %a1)
  %t3146 = musttail call fastcc i64 @"emit.internal:code_860"(i64 %self, i64 2, i64 %t3144, i64 %t3145, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3146
else1149:
  %t3147 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3148 = and i64 %self, -8
  %t3149 = inttoptr i64 %t3148 to ptr
  %t3150 = getelementptr i64, ptr %t3149, i64 4
  %t3151 = load i64, ptr %t3150
  %t3152 = load i64, ptr @"emit.internal:rd-fail"
  %t3153 = and i64 %t3152, -8
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = load i64, ptr %t3154
  %t3156 = inttoptr i64 %t3155 to ptr
  %t3157 = musttail call fastcc i64 %t3156(i64 %t3152, i64 2, i64 %t3147, i64 %t3151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3157
}

define fastcc i64 @"emit.internal:code:rd-bar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3158 = icmp eq i64 %argc, 4
  br i1 %t3158, label %argok1190, label %arityerr1189
arityerr1189:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1190:
  %t3159 = call ptr @rt_alloc_words(i64 5)
  %t3160 = ptrtoint ptr %t3159 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_860" to i64), ptr %t3159
  %t3161 = or i64 %t3160, 4
  %t3162 = getelementptr i64, ptr %t3159, i64 1
  store i64 %a1, ptr %t3162
  %t3163 = getelementptr i64, ptr %t3159, i64 2
  store i64 %a0, ptr %t3163
  %t3164 = getelementptr i64, ptr %t3159, i64 3
  store i64 %t3161, ptr %t3164
  %t3165 = getelementptr i64, ptr %t3159, i64 4
  store i64 %a3, ptr %t3165
  %t3166 = musttail call fastcc i64 @"emit.internal:code_860"(i64 %t3161, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3166
}

define fastcc i64 @"emit.internal:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3171 = icmp eq i64 %argc, 3
  br i1 %t3171, label %argok1192, label %arityerr1191
arityerr1191:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1192:
  %t3172 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3173 = and i64 %t3172, -8
  %t3174 = inttoptr i64 %t3173 to ptr
  %t3175 = load i64, ptr %t3174
  %t3176 = inttoptr i64 %t3175 to ptr
  %t3177 = call fastcc i64%t3176(i64 %t3172, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3178 = load i64, ptr @"emit.internal:rd-datum"
  %t3179 = and i64 %t3178, -8
  %t3180 = inttoptr i64 %t3179 to ptr
  %t3181 = load i64, ptr %t3180
  %t3182 = inttoptr i64 %t3181 to ptr
  %t3183 = call fastcc i64%t3182(i64 %t3178, i64 3, i64 %a0, i64 %a1, i64 %t3177, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3184 = call i64 @rt_cdr(i64 %t3183)
  %t3185 = load i64, ptr @"emit.internal:rd-fail?"
  %t3186 = and i64 %t3185, -8
  %t3187 = inttoptr i64 %t3186 to ptr
  %t3188 = load i64, ptr %t3187
  %t3189 = inttoptr i64 %t3188 to ptr
  %t3190 = call fastcc i64%t3189(i64 %t3185, i64 1, i64 %t3184, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3191 = icmp ne i64 %t3190, 1
  br i1 %t3191, label %then1193, label %else1194
then1193:
  ret i64 %t3183
else1194:
  %t3192 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3193 = call i64 @rt_car(i64 %t3183)
  %t3194 = load i64, ptr @"emit.internal:list"
  %t3195 = and i64 %t3194, -8
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = load i64, ptr %t3196
  %t3198 = inttoptr i64 %t3197 to ptr
  %t3199 = call fastcc i64%t3198(i64 %t3194, i64 2, i64 %t3192, i64 %t3193, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3200 = call i64 @rt_cdr(i64 %t3183)
  %t3201 = call i64 @rt_cons(i64 %t3199, i64 %t3200)
  ret i64 %t3201
}

define fastcc i64 @"emit.internal:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3206 = icmp eq i64 %argc, 3
  br i1 %t3206, label %argok1196, label %arityerr1195
arityerr1195:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1196:
  %t3207 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3208 = and i64 %t3207, -8
  %t3209 = inttoptr i64 %t3208 to ptr
  %t3210 = load i64, ptr %t3209
  %t3211 = inttoptr i64 %t3210 to ptr
  %t3212 = call fastcc i64%t3211(i64 %t3207, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3213 = load i64, ptr @"emit.internal:rd-datum"
  %t3214 = and i64 %t3213, -8
  %t3215 = inttoptr i64 %t3214 to ptr
  %t3216 = load i64, ptr %t3215
  %t3217 = inttoptr i64 %t3216 to ptr
  %t3218 = call fastcc i64%t3217(i64 %t3213, i64 3, i64 %a0, i64 %a1, i64 %t3212, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3219 = call i64 @rt_cdr(i64 %t3218)
  %t3220 = load i64, ptr @"emit.internal:rd-fail?"
  %t3221 = and i64 %t3220, -8
  %t3222 = inttoptr i64 %t3221 to ptr
  %t3223 = load i64, ptr %t3222
  %t3224 = inttoptr i64 %t3223 to ptr
  %t3225 = call fastcc i64%t3224(i64 %t3220, i64 1, i64 %t3219, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3226 = icmp ne i64 %t3225, 1
  br i1 %t3226, label %then1197, label %else1198
then1197:
  ret i64 %t3218
else1198:
  %t3227 = call i64 @rt_intern(ptr @.str.sym.23)
  %t3228 = call i64 @rt_car(i64 %t3218)
  %t3229 = load i64, ptr @"emit.internal:list"
  %t3230 = and i64 %t3229, -8
  %t3231 = inttoptr i64 %t3230 to ptr
  %t3232 = load i64, ptr %t3231
  %t3233 = inttoptr i64 %t3232 to ptr
  %t3234 = call fastcc i64%t3233(i64 %t3229, i64 2, i64 %t3227, i64 %t3228, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3235 = call i64 @rt_cdr(i64 %t3218)
  %t3236 = call i64 @rt_cons(i64 %t3234, i64 %t3235)
  ret i64 %t3236
}

define fastcc i64 @"emit.internal:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3241 = icmp eq i64 %argc, 3
  br i1 %t3241, label %argok1200, label %arityerr1199
arityerr1199:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1200:
  %t3242 = or i64 %a2, %a1
  %t3243 = and i64 %t3242, 7
  %t3244 = icmp eq i64 %t3243, 0
  br i1 %t3244, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t3245 = icmp slt i64 %a2, %a1
  %t3246 = select i1 %t3245, i64 257, i64 1
  br label %fixmerge1203
fixslow1202:
  %t3247 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1203
fixmerge1203:
  %t3248 = phi i64 [ %t3246, %fixfast1201 ], [ %t3247, %fixslow1202 ]
  %t3249 = icmp ne i64 %t3248, 1
  br i1 %t3249, label %then1204, label %else1205
then1204:
  %t3250 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3251 = call i64 @rt_char_to_integer(i64 %t3250)
  %t3252 = or i64 %t3251, 512
  %t3253 = and i64 %t3252, 7
  %t3254 = icmp eq i64 %t3253, 0
  br i1 %t3254, label %fixfast1207, label %fixslow1208
fixfast1207:
  %t3255 = icmp eq i64 %t3251, 512
  %t3256 = select i1 %t3255, i64 257, i64 1
  br label %fixmerge1209
fixslow1208:
  %t3257 = call i64 @rt_num_eq(i64 %t3251, i64 512)
  br label %fixmerge1209
fixmerge1209:
  %t3258 = phi i64 [ %t3256, %fixfast1207 ], [ %t3257, %fixslow1208 ]
  br label %merge1206
else1205:
  br label %merge1206
merge1206:
  %t3259 = phi i64 [ %t3258, %fixmerge1209 ], [ 1, %else1205 ]
  %t3260 = icmp ne i64 %t3259, 1
  br i1 %t3260, label %then1210, label %else1211
then1210:
  %t3261 = or i64 %a2, 8
  %t3262 = and i64 %t3261, 7
  %t3263 = icmp eq i64 %t3262, 0
  br i1 %t3263, label %fixfast1212, label %fixslow1213
fixfast1212:
  %t3264 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3265 = extractvalue {i64, i1} %t3264, 0
  %t3266 = extractvalue {i64, i1} %t3264, 1
  br i1 %t3266, label %fixslow1213, label %fixmerge1214
fixslow1213:
  %t3267 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1214
fixmerge1214:
  %t3268 = phi i64 [ %t3265, %fixfast1212 ], [ %t3267, %fixslow1213 ]
  %t3269 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3270 = and i64 %t3269, -8
  %t3271 = inttoptr i64 %t3270 to ptr
  %t3272 = load i64, ptr %t3271
  %t3273 = inttoptr i64 %t3272 to ptr
  %t3274 = call fastcc i64%t3273(i64 %t3269, i64 3, i64 %a0, i64 %a1, i64 %t3268, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3275 = load i64, ptr @"emit.internal:rd-datum"
  %t3276 = and i64 %t3275, -8
  %t3277 = inttoptr i64 %t3276 to ptr
  %t3278 = load i64, ptr %t3277
  %t3279 = inttoptr i64 %t3278 to ptr
  %t3280 = call fastcc i64%t3279(i64 %t3275, i64 3, i64 %a0, i64 %a1, i64 %t3274, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3281 = call i64 @rt_cdr(i64 %t3280)
  %t3282 = load i64, ptr @"emit.internal:rd-fail?"
  %t3283 = and i64 %t3282, -8
  %t3284 = inttoptr i64 %t3283 to ptr
  %t3285 = load i64, ptr %t3284
  %t3286 = inttoptr i64 %t3285 to ptr
  %t3287 = call fastcc i64%t3286(i64 %t3282, i64 1, i64 %t3281, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3288 = icmp ne i64 %t3287, 1
  br i1 %t3288, label %then1215, label %else1216
then1215:
  ret i64 %t3280
else1216:
  %t3289 = call i64 @rt_intern(ptr @.str.sym.24)
  %t3290 = call i64 @rt_car(i64 %t3280)
  %t3291 = load i64, ptr @"emit.internal:list"
  %t3292 = and i64 %t3291, -8
  %t3293 = inttoptr i64 %t3292 to ptr
  %t3294 = load i64, ptr %t3293
  %t3295 = inttoptr i64 %t3294 to ptr
  %t3296 = call fastcc i64%t3295(i64 %t3291, i64 2, i64 %t3289, i64 %t3290, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3297 = call i64 @rt_cdr(i64 %t3280)
  %t3298 = call i64 @rt_cons(i64 %t3296, i64 %t3297)
  ret i64 %t3298
else1211:
  %t3299 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3300 = and i64 %t3299, -8
  %t3301 = inttoptr i64 %t3300 to ptr
  %t3302 = load i64, ptr %t3301
  %t3303 = inttoptr i64 %t3302 to ptr
  %t3304 = call fastcc i64%t3303(i64 %t3299, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3305 = load i64, ptr @"emit.internal:rd-datum"
  %t3306 = and i64 %t3305, -8
  %t3307 = inttoptr i64 %t3306 to ptr
  %t3308 = load i64, ptr %t3307
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = call fastcc i64%t3309(i64 %t3305, i64 3, i64 %a0, i64 %a1, i64 %t3304, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3311 = call i64 @rt_cdr(i64 %t3310)
  %t3312 = load i64, ptr @"emit.internal:rd-fail?"
  %t3313 = and i64 %t3312, -8
  %t3314 = inttoptr i64 %t3313 to ptr
  %t3315 = load i64, ptr %t3314
  %t3316 = inttoptr i64 %t3315 to ptr
  %t3317 = call fastcc i64%t3316(i64 %t3312, i64 1, i64 %t3311, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3318 = icmp ne i64 %t3317, 1
  br i1 %t3318, label %then1217, label %else1218
then1217:
  ret i64 %t3310
else1218:
  %t3319 = call i64 @rt_intern(ptr @.str.sym.25)
  %t3320 = call i64 @rt_car(i64 %t3310)
  %t3321 = load i64, ptr @"emit.internal:list"
  %t3322 = and i64 %t3321, -8
  %t3323 = inttoptr i64 %t3322 to ptr
  %t3324 = load i64, ptr %t3323
  %t3325 = inttoptr i64 %t3324 to ptr
  %t3326 = call fastcc i64%t3325(i64 %t3321, i64 2, i64 %t3319, i64 %t3320, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3327 = call i64 @rt_cdr(i64 %t3310)
  %t3328 = call i64 @rt_cons(i64 %t3326, i64 %t3327)
  ret i64 %t3328
}

define fastcc i64 @"emit.internal:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3333 = icmp eq i64 %argc, 3
  br i1 %t3333, label %argok1220, label %arityerr1219
arityerr1219:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1220:
  %t3334 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3335 = call i64 @rt_char_to_integer(i64 %t3334)
  %t3336 = or i64 %t3335, 368
  %t3337 = and i64 %t3336, 7
  %t3338 = icmp eq i64 %t3337, 0
  br i1 %t3338, label %fixfast1221, label %fixslow1222
fixfast1221:
  %t3339 = icmp eq i64 %t3335, 368
  %t3340 = select i1 %t3339, i64 257, i64 1
  br label %fixmerge1223
fixslow1222:
  %t3341 = call i64 @rt_num_eq(i64 %t3335, i64 368)
  br label %fixmerge1223
fixmerge1223:
  %t3342 = phi i64 [ %t3340, %fixfast1221 ], [ %t3341, %fixslow1222 ]
  %t3343 = icmp ne i64 %t3342, 1
  br i1 %t3343, label %then1224, label %else1225
then1224:
  %t3344 = or i64 %a2, 8
  %t3345 = and i64 %t3344, 7
  %t3346 = icmp eq i64 %t3345, 0
  br i1 %t3346, label %fixfast1226, label %fixslow1227
fixfast1226:
  %t3347 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3348 = extractvalue {i64, i1} %t3347, 0
  %t3349 = extractvalue {i64, i1} %t3347, 1
  br i1 %t3349, label %fixslow1227, label %fixmerge1228
fixslow1227:
  %t3350 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1228
fixmerge1228:
  %t3351 = phi i64 [ %t3348, %fixfast1226 ], [ %t3350, %fixslow1227 ]
  %t3352 = load i64, ptr @"emit.internal:rd-token-end"
  %t3353 = and i64 %t3352, -8
  %t3354 = inttoptr i64 %t3353 to ptr
  %t3355 = load i64, ptr %t3354
  %t3356 = inttoptr i64 %t3355 to ptr
  %t3357 = call fastcc i64%t3356(i64 %t3352, i64 3, i64 %a0, i64 %a1, i64 %t3351, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3358 = or i64 %a2, 8
  %t3359 = and i64 %t3358, 7
  %t3360 = icmp eq i64 %t3359, 0
  br i1 %t3360, label %fixfast1229, label %fixslow1230
fixfast1229:
  %t3361 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3362 = extractvalue {i64, i1} %t3361, 0
  %t3363 = extractvalue {i64, i1} %t3361, 1
  br i1 %t3363, label %fixslow1230, label %fixmerge1231
fixslow1230:
  %t3364 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1231
fixmerge1231:
  %t3365 = phi i64 [ %t3362, %fixfast1229 ], [ %t3364, %fixslow1230 ]
  %t3366 = or i64 %t3357, %t3365
  %t3367 = and i64 %t3366, 7
  %t3368 = icmp eq i64 %t3367, 0
  br i1 %t3368, label %fixfast1232, label %fixslow1233
fixfast1232:
  %t3369 = icmp eq i64 %t3357, %t3365
  %t3370 = select i1 %t3369, i64 257, i64 1
  br label %fixmerge1234
fixslow1233:
  %t3371 = call i64 @rt_num_eq(i64 %t3357, i64 %t3365)
  br label %fixmerge1234
fixmerge1234:
  %t3372 = phi i64 [ %t3370, %fixfast1232 ], [ %t3371, %fixslow1233 ]
  ret i64 %t3372
else1225:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3377 = icmp eq i64 %argc, 2
  br i1 %t3377, label %argok1236, label %arityerr1235
arityerr1235:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1236:
  %t3378 = call i64 @rt_null_p(i64 %a0)
  %t3379 = icmp ne i64 %t3378, 1
  br i1 %t3379, label %then1237, label %else1238
then1237:
  ret i64 %a1
else1238:
  %t3380 = call i64 @rt_cdr(i64 %a0)
  %t3381 = call i64 @rt_car(i64 %a0)
  %t3382 = call i64 @rt_cons(i64 %t3381, i64 %a1)
  %t3383 = load i64, ptr @"emit.internal:rd-append-reverse"
  %t3384 = and i64 %t3383, -8
  %t3385 = inttoptr i64 %t3384 to ptr
  %t3386 = load i64, ptr %t3385
  %t3387 = inttoptr i64 %t3386 to ptr
  %t3388 = musttail call fastcc i64 %t3387(i64 %t3383, i64 2, i64 %t3380, i64 %t3382, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3388
}

define fastcc i64 @"emit.internal:code:rd-datum-comment?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3393 = icmp eq i64 %argc, 3
  br i1 %t3393, label %argok1240, label %arityerr1239
arityerr1239:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1240:
  %t3394 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3395 = call i64 @rt_char_to_integer(i64 %t3394)
  %t3396 = or i64 %t3395, 280
  %t3397 = and i64 %t3396, 7
  %t3398 = icmp eq i64 %t3397, 0
  br i1 %t3398, label %fixfast1241, label %fixslow1242
fixfast1241:
  %t3399 = icmp eq i64 %t3395, 280
  %t3400 = select i1 %t3399, i64 257, i64 1
  br label %fixmerge1243
fixslow1242:
  %t3401 = call i64 @rt_num_eq(i64 %t3395, i64 280)
  br label %fixmerge1243
fixmerge1243:
  %t3402 = phi i64 [ %t3400, %fixfast1241 ], [ %t3401, %fixslow1242 ]
  %t3403 = icmp ne i64 %t3402, 1
  br i1 %t3403, label %then1244, label %else1245
then1244:
  %t3404 = or i64 %a2, 8
  %t3405 = and i64 %t3404, 7
  %t3406 = icmp eq i64 %t3405, 0
  br i1 %t3406, label %fixfast1246, label %fixslow1247
fixfast1246:
  %t3407 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3408 = extractvalue {i64, i1} %t3407, 0
  %t3409 = extractvalue {i64, i1} %t3407, 1
  br i1 %t3409, label %fixslow1247, label %fixmerge1248
fixslow1247:
  %t3410 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1248
fixmerge1248:
  %t3411 = phi i64 [ %t3408, %fixfast1246 ], [ %t3410, %fixslow1247 ]
  %t3412 = or i64 %t3411, %a1
  %t3413 = and i64 %t3412, 7
  %t3414 = icmp eq i64 %t3413, 0
  br i1 %t3414, label %fixfast1249, label %fixslow1250
fixfast1249:
  %t3415 = icmp slt i64 %t3411, %a1
  %t3416 = select i1 %t3415, i64 257, i64 1
  br label %fixmerge1251
fixslow1250:
  %t3417 = call i64 @rt_lt(i64 %t3411, i64 %a1)
  br label %fixmerge1251
fixmerge1251:
  %t3418 = phi i64 [ %t3416, %fixfast1249 ], [ %t3417, %fixslow1250 ]
  %t3419 = icmp ne i64 %t3418, 1
  br i1 %t3419, label %then1252, label %else1253
then1252:
  %t3420 = or i64 %a2, 8
  %t3421 = and i64 %t3420, 7
  %t3422 = icmp eq i64 %t3421, 0
  br i1 %t3422, label %fixfast1254, label %fixslow1255
fixfast1254:
  %t3423 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3424 = extractvalue {i64, i1} %t3423, 0
  %t3425 = extractvalue {i64, i1} %t3423, 1
  br i1 %t3425, label %fixslow1255, label %fixmerge1256
fixslow1255:
  %t3426 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1256
fixmerge1256:
  %t3427 = phi i64 [ %t3424, %fixfast1254 ], [ %t3426, %fixslow1255 ]
  %t3428 = call i64 @rt_string_ref(i64 %a0, i64 %t3427)
  %t3429 = call i64 @rt_char_to_integer(i64 %t3428)
  %t3430 = or i64 %t3429, 472
  %t3431 = and i64 %t3430, 7
  %t3432 = icmp eq i64 %t3431, 0
  br i1 %t3432, label %fixfast1257, label %fixslow1258
fixfast1257:
  %t3433 = icmp eq i64 %t3429, 472
  %t3434 = select i1 %t3433, i64 257, i64 1
  br label %fixmerge1259
fixslow1258:
  %t3435 = call i64 @rt_num_eq(i64 %t3429, i64 472)
  br label %fixmerge1259
fixmerge1259:
  %t3436 = phi i64 [ %t3434, %fixfast1257 ], [ %t3435, %fixslow1258 ]
  ret i64 %t3436
else1253:
  ret i64 1
else1245:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3441 = icmp eq i64 %argc, 4
  br i1 %t3441, label %argok1261, label %arityerr1260
arityerr1260:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1261:
  %t3442 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3443 = and i64 %t3442, -8
  %t3444 = inttoptr i64 %t3443 to ptr
  %t3445 = load i64, ptr %t3444
  %t3446 = inttoptr i64 %t3445 to ptr
  %t3447 = call fastcc i64%t3446(i64 %t3442, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3448 = load i64, ptr @"emit.internal:rd-fail?"
  %t3449 = and i64 %t3448, -8
  %t3450 = inttoptr i64 %t3449 to ptr
  %t3451 = load i64, ptr %t3450
  %t3452 = inttoptr i64 %t3451 to ptr
  %t3453 = call fastcc i64%t3452(i64 %t3448, i64 1, i64 %t3447, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3454 = icmp ne i64 %t3453, 1
  br i1 %t3454, label %then1262, label %else1263
then1262:
  %t3455 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3456 = call i64 @rt_cons(i64 %t3455, i64 %t3447)
  ret i64 %t3456
else1263:
  %t3457 = or i64 %t3447, %a1
  %t3458 = and i64 %t3457, 7
  %t3459 = icmp eq i64 %t3458, 0
  br i1 %t3459, label %fixfast1264, label %fixslow1265
fixfast1264:
  %t3460 = icmp slt i64 %t3447, %a1
  %t3461 = select i1 %t3460, i64 257, i64 1
  br label %fixmerge1266
fixslow1265:
  %t3462 = call i64 @rt_lt(i64 %t3447, i64 %a1)
  br label %fixmerge1266
fixmerge1266:
  %t3463 = phi i64 [ %t3461, %fixfast1264 ], [ %t3462, %fixslow1265 ]
  %t3464 = icmp ne i64 %t3463, 1
  br i1 %t3464, label %then1267, label %else1268
then1267:
  %t3465 = call i64 @rt_string_ref(i64 %a0, i64 %t3447)
  %t3466 = call i64 @rt_char_to_integer(i64 %t3465)
  %t3467 = or i64 %t3466, 328
  %t3468 = and i64 %t3467, 7
  %t3469 = icmp eq i64 %t3468, 0
  br i1 %t3469, label %fixfast1269, label %fixslow1270
fixfast1269:
  %t3470 = icmp eq i64 %t3466, 328
  %t3471 = select i1 %t3470, i64 257, i64 1
  br label %fixmerge1271
fixslow1270:
  %t3472 = call i64 @rt_num_eq(i64 %t3466, i64 328)
  br label %fixmerge1271
fixmerge1271:
  %t3473 = phi i64 [ %t3471, %fixfast1269 ], [ %t3472, %fixslow1270 ]
  %t3474 = icmp ne i64 %t3473, 1
  br i1 %t3474, label %then1272, label %else1273
then1272:
  br label %merge1274
else1273:
  %t3475 = or i64 %t3466, 744
  %t3476 = and i64 %t3475, 7
  %t3477 = icmp eq i64 %t3476, 0
  br i1 %t3477, label %fixfast1275, label %fixslow1276
fixfast1275:
  %t3478 = icmp eq i64 %t3466, 744
  %t3479 = select i1 %t3478, i64 257, i64 1
  br label %fixmerge1277
fixslow1276:
  %t3480 = call i64 @rt_num_eq(i64 %t3466, i64 744)
  br label %fixmerge1277
fixmerge1277:
  %t3481 = phi i64 [ %t3479, %fixfast1275 ], [ %t3480, %fixslow1276 ]
  br label %merge1274
merge1274:
  %t3482 = phi i64 [ %t3473, %then1272 ], [ %t3481, %fixmerge1277 ]
  %t3483 = icmp ne i64 %t3482, 1
  br i1 %t3483, label %then1278, label %else1279
then1278:
  %t3484 = load i64, ptr @"emit.internal:reverse"
  %t3485 = and i64 %t3484, -8
  %t3486 = inttoptr i64 %t3485 to ptr
  %t3487 = load i64, ptr %t3486
  %t3488 = inttoptr i64 %t3487 to ptr
  %t3489 = call fastcc i64%t3488(i64 %t3484, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3490 = or i64 %t3447, 8
  %t3491 = and i64 %t3490, 7
  %t3492 = icmp eq i64 %t3491, 0
  br i1 %t3492, label %fixfast1280, label %fixslow1281
fixfast1280:
  %t3493 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3447, i64 8)
  %t3494 = extractvalue {i64, i1} %t3493, 0
  %t3495 = extractvalue {i64, i1} %t3493, 1
  br i1 %t3495, label %fixslow1281, label %fixmerge1282
fixslow1281:
  %t3496 = call i64 @rt_add(i64 %t3447, i64 8)
  br label %fixmerge1282
fixmerge1282:
  %t3497 = phi i64 [ %t3494, %fixfast1280 ], [ %t3496, %fixslow1281 ]
  %t3498 = call i64 @rt_cons(i64 %t3489, i64 %t3497)
  ret i64 %t3498
else1279:
  %t3499 = load i64, ptr @"emit.internal:rd-datum-comment?"
  %t3500 = and i64 %t3499, -8
  %t3501 = inttoptr i64 %t3500 to ptr
  %t3502 = load i64, ptr %t3501
  %t3503 = inttoptr i64 %t3502 to ptr
  %t3504 = call fastcc i64%t3503(i64 %t3499, i64 3, i64 %a0, i64 %a1, i64 %t3447, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3505 = icmp ne i64 %t3504, 1
  br i1 %t3505, label %then1283, label %else1284
then1283:
  %t3506 = or i64 %t3447, 16
  %t3507 = and i64 %t3506, 7
  %t3508 = icmp eq i64 %t3507, 0
  br i1 %t3508, label %fixfast1285, label %fixslow1286
fixfast1285:
  %t3509 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3447, i64 16)
  %t3510 = extractvalue {i64, i1} %t3509, 0
  %t3511 = extractvalue {i64, i1} %t3509, 1
  br i1 %t3511, label %fixslow1286, label %fixmerge1287
fixslow1286:
  %t3512 = call i64 @rt_add(i64 %t3447, i64 16)
  br label %fixmerge1287
fixmerge1287:
  %t3513 = phi i64 [ %t3510, %fixfast1285 ], [ %t3512, %fixslow1286 ]
  %t3514 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3515 = and i64 %t3514, -8
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = load i64, ptr %t3516
  %t3518 = inttoptr i64 %t3517 to ptr
  %t3519 = call fastcc i64%t3518(i64 %t3514, i64 3, i64 %a0, i64 %a1, i64 %t3513, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3520 = load i64, ptr @"emit.internal:rd-datum"
  %t3521 = and i64 %t3520, -8
  %t3522 = inttoptr i64 %t3521 to ptr
  %t3523 = load i64, ptr %t3522
  %t3524 = inttoptr i64 %t3523 to ptr
  %t3525 = call fastcc i64%t3524(i64 %t3520, i64 3, i64 %a0, i64 %a1, i64 %t3519, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3526 = call i64 @rt_cdr(i64 %t3525)
  %t3527 = load i64, ptr @"emit.internal:rd-fail?"
  %t3528 = and i64 %t3527, -8
  %t3529 = inttoptr i64 %t3528 to ptr
  %t3530 = load i64, ptr %t3529
  %t3531 = inttoptr i64 %t3530 to ptr
  %t3532 = call fastcc i64%t3531(i64 %t3527, i64 1, i64 %t3526, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3533 = icmp ne i64 %t3532, 1
  br i1 %t3533, label %then1288, label %else1289
then1288:
  ret i64 %t3525
else1289:
  %t3534 = call i64 @rt_cdr(i64 %t3525)
  %t3535 = load i64, ptr @"emit.internal:rd-list"
  %t3536 = and i64 %t3535, -8
  %t3537 = inttoptr i64 %t3536 to ptr
  %t3538 = load i64, ptr %t3537
  %t3539 = inttoptr i64 %t3538 to ptr
  %t3540 = musttail call fastcc i64 %t3539(i64 %t3535, i64 4, i64 %a0, i64 %a1, i64 %t3534, i64 %a3, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3540
else1284:
  %t3541 = load i64, ptr @"emit.internal:rd-dot?"
  %t3542 = and i64 %t3541, -8
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = load i64, ptr %t3543
  %t3545 = inttoptr i64 %t3544 to ptr
  %t3546 = call fastcc i64%t3545(i64 %t3541, i64 3, i64 %a0, i64 %a1, i64 %t3447, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3547 = icmp ne i64 %t3546, 1
  br i1 %t3547, label %then1290, label %else1291
then1290:
  %t3548 = or i64 %t3447, 8
  %t3549 = and i64 %t3548, 7
  %t3550 = icmp eq i64 %t3549, 0
  br i1 %t3550, label %fixfast1292, label %fixslow1293
fixfast1292:
  %t3551 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3447, i64 8)
  %t3552 = extractvalue {i64, i1} %t3551, 0
  %t3553 = extractvalue {i64, i1} %t3551, 1
  br i1 %t3553, label %fixslow1293, label %fixmerge1294
fixslow1293:
  %t3554 = call i64 @rt_add(i64 %t3447, i64 8)
  br label %fixmerge1294
fixmerge1294:
  %t3555 = phi i64 [ %t3552, %fixfast1292 ], [ %t3554, %fixslow1293 ]
  %t3556 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3557 = and i64 %t3556, -8
  %t3558 = inttoptr i64 %t3557 to ptr
  %t3559 = load i64, ptr %t3558
  %t3560 = inttoptr i64 %t3559 to ptr
  %t3561 = call fastcc i64%t3560(i64 %t3556, i64 3, i64 %a0, i64 %a1, i64 %t3555, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3562 = load i64, ptr @"emit.internal:rd-datum"
  %t3563 = and i64 %t3562, -8
  %t3564 = inttoptr i64 %t3563 to ptr
  %t3565 = load i64, ptr %t3564
  %t3566 = inttoptr i64 %t3565 to ptr
  %t3567 = call fastcc i64%t3566(i64 %t3562, i64 3, i64 %a0, i64 %a1, i64 %t3561, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3568 = call i64 @rt_cdr(i64 %t3567)
  %t3569 = load i64, ptr @"emit.internal:rd-fail?"
  %t3570 = and i64 %t3569, -8
  %t3571 = inttoptr i64 %t3570 to ptr
  %t3572 = load i64, ptr %t3571
  %t3573 = inttoptr i64 %t3572 to ptr
  %t3574 = call fastcc i64%t3573(i64 %t3569, i64 1, i64 %t3568, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3575 = icmp ne i64 %t3574, 1
  br i1 %t3575, label %then1295, label %else1296
then1295:
  ret i64 %t3567
else1296:
  %t3576 = call i64 @rt_cdr(i64 %t3567)
  %t3577 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3578 = and i64 %t3577, -8
  %t3579 = inttoptr i64 %t3578 to ptr
  %t3580 = load i64, ptr %t3579
  %t3581 = inttoptr i64 %t3580 to ptr
  %t3582 = call fastcc i64%t3581(i64 %t3577, i64 3, i64 %a0, i64 %a1, i64 %t3576, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3583 = load i64, ptr @"emit.internal:rd-fail?"
  %t3584 = and i64 %t3583, -8
  %t3585 = inttoptr i64 %t3584 to ptr
  %t3586 = load i64, ptr %t3585
  %t3587 = inttoptr i64 %t3586 to ptr
  %t3588 = call fastcc i64%t3587(i64 %t3583, i64 1, i64 %t3582, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3589 = icmp ne i64 %t3588, 1
  br i1 %t3589, label %then1297, label %else1298
then1297:
  %t3590 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3591 = call i64 @rt_cons(i64 %t3590, i64 %t3582)
  ret i64 %t3591
else1298:
  %t3592 = call i64 @rt_car(i64 %t3567)
  %t3593 = load i64, ptr @"emit.internal:rd-append-reverse"
  %t3594 = and i64 %t3593, -8
  %t3595 = inttoptr i64 %t3594 to ptr
  %t3596 = load i64, ptr %t3595
  %t3597 = inttoptr i64 %t3596 to ptr
  %t3598 = call fastcc i64%t3597(i64 %t3593, i64 2, i64 %a3, i64 %t3592, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3599 = or i64 %t3582, 8
  %t3600 = and i64 %t3599, 7
  %t3601 = icmp eq i64 %t3600, 0
  br i1 %t3601, label %fixfast1299, label %fixslow1300
fixfast1299:
  %t3602 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3582, i64 8)
  %t3603 = extractvalue {i64, i1} %t3602, 0
  %t3604 = extractvalue {i64, i1} %t3602, 1
  br i1 %t3604, label %fixslow1300, label %fixmerge1301
fixslow1300:
  %t3605 = call i64 @rt_add(i64 %t3582, i64 8)
  br label %fixmerge1301
fixmerge1301:
  %t3606 = phi i64 [ %t3603, %fixfast1299 ], [ %t3605, %fixslow1300 ]
  %t3607 = call i64 @rt_cons(i64 %t3598, i64 %t3606)
  ret i64 %t3607
else1291:
  %t3608 = load i64, ptr @"emit.internal:rd-datum"
  %t3609 = and i64 %t3608, -8
  %t3610 = inttoptr i64 %t3609 to ptr
  %t3611 = load i64, ptr %t3610
  %t3612 = inttoptr i64 %t3611 to ptr
  %t3613 = call fastcc i64%t3612(i64 %t3608, i64 3, i64 %a0, i64 %a1, i64 %t3447, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3614 = call i64 @rt_cdr(i64 %t3613)
  %t3615 = load i64, ptr @"emit.internal:rd-fail?"
  %t3616 = and i64 %t3615, -8
  %t3617 = inttoptr i64 %t3616 to ptr
  %t3618 = load i64, ptr %t3617
  %t3619 = inttoptr i64 %t3618 to ptr
  %t3620 = call fastcc i64%t3619(i64 %t3615, i64 1, i64 %t3614, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3621 = icmp ne i64 %t3620, 1
  br i1 %t3621, label %then1302, label %else1303
then1302:
  ret i64 %t3613
else1303:
  %t3622 = call i64 @rt_cdr(i64 %t3613)
  %t3623 = call i64 @rt_car(i64 %t3613)
  %t3624 = call i64 @rt_cons(i64 %t3623, i64 %a3)
  %t3625 = load i64, ptr @"emit.internal:rd-list"
  %t3626 = and i64 %t3625, -8
  %t3627 = inttoptr i64 %t3626 to ptr
  %t3628 = load i64, ptr %t3627
  %t3629 = inttoptr i64 %t3628 to ptr
  %t3630 = musttail call fastcc i64 %t3629(i64 %t3625, i64 4, i64 %a0, i64 %a1, i64 %t3622, i64 %t3624, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3630
else1268:
  %t3631 = load i64, ptr @"emit.internal:reverse"
  %t3632 = and i64 %t3631, -8
  %t3633 = inttoptr i64 %t3632 to ptr
  %t3634 = load i64, ptr %t3633
  %t3635 = inttoptr i64 %t3634 to ptr
  %t3636 = call fastcc i64%t3635(i64 %t3631, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3637 = call i64 @rt_cons(i64 %t3636, i64 %t3447)
  ret i64 %t3637
}

define fastcc i64 @"emit.internal:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3642 = icmp eq i64 %argc, 3
  br i1 %t3642, label %argok1305, label %arityerr1304
arityerr1304:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1305:
  %t3643 = or i64 0, %a2
  %t3644 = and i64 %t3643, 7
  %t3645 = icmp eq i64 %t3644, 0
  br i1 %t3645, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t3646 = icmp slt i64 0, %a2
  %t3647 = select i1 %t3646, i64 257, i64 1
  br label %fixmerge1308
fixslow1307:
  %t3648 = call i64 @rt_lt(i64 0, i64 %a2)
  br label %fixmerge1308
fixmerge1308:
  %t3649 = phi i64 [ %t3647, %fixfast1306 ], [ %t3648, %fixslow1307 ]
  %t3650 = icmp ne i64 %t3649, 1
  br i1 %t3650, label %then1309, label %else1310
then1309:
  br label %merge1311
else1310:
  %t3651 = or i64 0, %a2
  %t3652 = and i64 %t3651, 7
  %t3653 = icmp eq i64 %t3652, 0
  br i1 %t3653, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t3654 = icmp eq i64 0, %a2
  %t3655 = select i1 %t3654, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t3656 = call i64 @rt_num_eq(i64 0, i64 %a2)
  br label %fixmerge1314
fixmerge1314:
  %t3657 = phi i64 [ %t3655, %fixfast1312 ], [ %t3656, %fixslow1313 ]
  br label %merge1311
merge1311:
  %t3658 = phi i64 [ 257, %then1309 ], [ %t3657, %fixmerge1314 ]
  %t3659 = icmp ne i64 %t3658, 1
  br i1 %t3659, label %then1315, label %else1316
then1315:
  %t3660 = or i64 %a2, %a1
  %t3661 = and i64 %t3660, 7
  %t3662 = icmp eq i64 %t3661, 0
  br i1 %t3662, label %fixfast1318, label %fixslow1319
fixfast1318:
  %t3663 = icmp slt i64 %a2, %a1
  %t3664 = select i1 %t3663, i64 257, i64 1
  br label %fixmerge1320
fixslow1319:
  %t3665 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1320
fixmerge1320:
  %t3666 = phi i64 [ %t3664, %fixfast1318 ], [ %t3665, %fixslow1319 ]
  br label %merge1317
else1316:
  br label %merge1317
merge1317:
  %t3667 = phi i64 [ %t3666, %fixmerge1320 ], [ 1, %else1316 ]
  %t3668 = icmp ne i64 %t3667, 1
  br i1 %t3668, label %then1321, label %else1322
then1321:
  %t3669 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3670 = call i64 @rt_char_to_integer(i64 %t3669)
  %t3671 = or i64 %t3670, 320
  %t3672 = and i64 %t3671, 7
  %t3673 = icmp eq i64 %t3672, 0
  br i1 %t3673, label %fixfast1323, label %fixslow1324
fixfast1323:
  %t3674 = icmp eq i64 %t3670, 320
  %t3675 = select i1 %t3674, i64 257, i64 1
  br label %fixmerge1325
fixslow1324:
  %t3676 = call i64 @rt_num_eq(i64 %t3670, i64 320)
  br label %fixmerge1325
fixmerge1325:
  %t3677 = phi i64 [ %t3675, %fixfast1323 ], [ %t3676, %fixslow1324 ]
  %t3678 = icmp ne i64 %t3677, 1
  br i1 %t3678, label %then1326, label %else1327
then1326:
  %t3679 = or i64 %a2, 8
  %t3680 = and i64 %t3679, 7
  %t3681 = icmp eq i64 %t3680, 0
  br i1 %t3681, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t3682 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3683 = extractvalue {i64, i1} %t3682, 0
  %t3684 = extractvalue {i64, i1} %t3682, 1
  br i1 %t3684, label %fixslow1329, label %fixmerge1330
fixslow1329:
  %t3685 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1330
fixmerge1330:
  %t3686 = phi i64 [ %t3683, %fixfast1328 ], [ %t3685, %fixslow1329 ]
  %t3687 = load i64, ptr @"emit.internal:rd-list"
  %t3688 = and i64 %t3687, -8
  %t3689 = inttoptr i64 %t3688 to ptr
  %t3690 = load i64, ptr %t3689
  %t3691 = inttoptr i64 %t3690 to ptr
  %t3692 = musttail call fastcc i64 %t3691(i64 %t3687, i64 4, i64 %a0, i64 %a1, i64 %t3686, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3692
else1327:
  %t3693 = or i64 %t3670, 728
  %t3694 = and i64 %t3693, 7
  %t3695 = icmp eq i64 %t3694, 0
  br i1 %t3695, label %fixfast1331, label %fixslow1332
fixfast1331:
  %t3696 = icmp eq i64 %t3670, 728
  %t3697 = select i1 %t3696, i64 257, i64 1
  br label %fixmerge1333
fixslow1332:
  %t3698 = call i64 @rt_num_eq(i64 %t3670, i64 728)
  br label %fixmerge1333
fixmerge1333:
  %t3699 = phi i64 [ %t3697, %fixfast1331 ], [ %t3698, %fixslow1332 ]
  %t3700 = icmp ne i64 %t3699, 1
  br i1 %t3700, label %then1334, label %else1335
then1334:
  %t3701 = or i64 %a2, 8
  %t3702 = and i64 %t3701, 7
  %t3703 = icmp eq i64 %t3702, 0
  br i1 %t3703, label %fixfast1336, label %fixslow1337
fixfast1336:
  %t3704 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3705 = extractvalue {i64, i1} %t3704, 0
  %t3706 = extractvalue {i64, i1} %t3704, 1
  br i1 %t3706, label %fixslow1337, label %fixmerge1338
fixslow1337:
  %t3707 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1338
fixmerge1338:
  %t3708 = phi i64 [ %t3705, %fixfast1336 ], [ %t3707, %fixslow1337 ]
  %t3709 = load i64, ptr @"emit.internal:rd-list"
  %t3710 = and i64 %t3709, -8
  %t3711 = inttoptr i64 %t3710 to ptr
  %t3712 = load i64, ptr %t3711
  %t3713 = inttoptr i64 %t3712 to ptr
  %t3714 = musttail call fastcc i64 %t3713(i64 %t3709, i64 4, i64 %a0, i64 %a1, i64 %t3708, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3714
else1335:
  %t3715 = or i64 %t3670, 312
  %t3716 = and i64 %t3715, 7
  %t3717 = icmp eq i64 %t3716, 0
  br i1 %t3717, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t3718 = icmp eq i64 %t3670, 312
  %t3719 = select i1 %t3718, i64 257, i64 1
  br label %fixmerge1341
fixslow1340:
  %t3720 = call i64 @rt_num_eq(i64 %t3670, i64 312)
  br label %fixmerge1341
fixmerge1341:
  %t3721 = phi i64 [ %t3719, %fixfast1339 ], [ %t3720, %fixslow1340 ]
  %t3722 = icmp ne i64 %t3721, 1
  br i1 %t3722, label %then1342, label %else1343
then1342:
  %t3723 = or i64 %a2, 8
  %t3724 = and i64 %t3723, 7
  %t3725 = icmp eq i64 %t3724, 0
  br i1 %t3725, label %fixfast1344, label %fixslow1345
fixfast1344:
  %t3726 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3727 = extractvalue {i64, i1} %t3726, 0
  %t3728 = extractvalue {i64, i1} %t3726, 1
  br i1 %t3728, label %fixslow1345, label %fixmerge1346
fixslow1345:
  %t3729 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1346
fixmerge1346:
  %t3730 = phi i64 [ %t3727, %fixfast1344 ], [ %t3729, %fixslow1345 ]
  %t3731 = load i64, ptr @"emit.internal:rd-quote"
  %t3732 = and i64 %t3731, -8
  %t3733 = inttoptr i64 %t3732 to ptr
  %t3734 = load i64, ptr %t3733
  %t3735 = inttoptr i64 %t3734 to ptr
  %t3736 = musttail call fastcc i64 %t3735(i64 %t3731, i64 3, i64 %a0, i64 %a1, i64 %t3730, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3736
else1343:
  %t3737 = or i64 %t3670, 768
  %t3738 = and i64 %t3737, 7
  %t3739 = icmp eq i64 %t3738, 0
  br i1 %t3739, label %fixfast1347, label %fixslow1348
fixfast1347:
  %t3740 = icmp eq i64 %t3670, 768
  %t3741 = select i1 %t3740, i64 257, i64 1
  br label %fixmerge1349
fixslow1348:
  %t3742 = call i64 @rt_num_eq(i64 %t3670, i64 768)
  br label %fixmerge1349
fixmerge1349:
  %t3743 = phi i64 [ %t3741, %fixfast1347 ], [ %t3742, %fixslow1348 ]
  %t3744 = icmp ne i64 %t3743, 1
  br i1 %t3744, label %then1350, label %else1351
then1350:
  %t3745 = or i64 %a2, 8
  %t3746 = and i64 %t3745, 7
  %t3747 = icmp eq i64 %t3746, 0
  br i1 %t3747, label %fixfast1352, label %fixslow1353
fixfast1352:
  %t3748 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3749 = extractvalue {i64, i1} %t3748, 0
  %t3750 = extractvalue {i64, i1} %t3748, 1
  br i1 %t3750, label %fixslow1353, label %fixmerge1354
fixslow1353:
  %t3751 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1354
fixmerge1354:
  %t3752 = phi i64 [ %t3749, %fixfast1352 ], [ %t3751, %fixslow1353 ]
  %t3753 = load i64, ptr @"emit.internal:rd-quasi"
  %t3754 = and i64 %t3753, -8
  %t3755 = inttoptr i64 %t3754 to ptr
  %t3756 = load i64, ptr %t3755
  %t3757 = inttoptr i64 %t3756 to ptr
  %t3758 = musttail call fastcc i64 %t3757(i64 %t3753, i64 3, i64 %a0, i64 %a1, i64 %t3752, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3758
else1351:
  %t3759 = or i64 %t3670, 352
  %t3760 = and i64 %t3759, 7
  %t3761 = icmp eq i64 %t3760, 0
  br i1 %t3761, label %fixfast1355, label %fixslow1356
fixfast1355:
  %t3762 = icmp eq i64 %t3670, 352
  %t3763 = select i1 %t3762, i64 257, i64 1
  br label %fixmerge1357
fixslow1356:
  %t3764 = call i64 @rt_num_eq(i64 %t3670, i64 352)
  br label %fixmerge1357
fixmerge1357:
  %t3765 = phi i64 [ %t3763, %fixfast1355 ], [ %t3764, %fixslow1356 ]
  %t3766 = icmp ne i64 %t3765, 1
  br i1 %t3766, label %then1358, label %else1359
then1358:
  %t3767 = or i64 %a2, 8
  %t3768 = and i64 %t3767, 7
  %t3769 = icmp eq i64 %t3768, 0
  br i1 %t3769, label %fixfast1360, label %fixslow1361
fixfast1360:
  %t3770 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3771 = extractvalue {i64, i1} %t3770, 0
  %t3772 = extractvalue {i64, i1} %t3770, 1
  br i1 %t3772, label %fixslow1361, label %fixmerge1362
fixslow1361:
  %t3773 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1362
fixmerge1362:
  %t3774 = phi i64 [ %t3771, %fixfast1360 ], [ %t3773, %fixslow1361 ]
  %t3775 = load i64, ptr @"emit.internal:rd-unquote"
  %t3776 = and i64 %t3775, -8
  %t3777 = inttoptr i64 %t3776 to ptr
  %t3778 = load i64, ptr %t3777
  %t3779 = inttoptr i64 %t3778 to ptr
  %t3780 = musttail call fastcc i64 %t3779(i64 %t3775, i64 3, i64 %a0, i64 %a1, i64 %t3774, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3780
else1359:
  %t3781 = or i64 %t3670, 272
  %t3782 = and i64 %t3781, 7
  %t3783 = icmp eq i64 %t3782, 0
  br i1 %t3783, label %fixfast1363, label %fixslow1364
fixfast1363:
  %t3784 = icmp eq i64 %t3670, 272
  %t3785 = select i1 %t3784, i64 257, i64 1
  br label %fixmerge1365
fixslow1364:
  %t3786 = call i64 @rt_num_eq(i64 %t3670, i64 272)
  br label %fixmerge1365
fixmerge1365:
  %t3787 = phi i64 [ %t3785, %fixfast1363 ], [ %t3786, %fixslow1364 ]
  %t3788 = icmp ne i64 %t3787, 1
  br i1 %t3788, label %then1366, label %else1367
then1366:
  %t3789 = or i64 %a2, 8
  %t3790 = and i64 %t3789, 7
  %t3791 = icmp eq i64 %t3790, 0
  br i1 %t3791, label %fixfast1368, label %fixslow1369
fixfast1368:
  %t3792 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3793 = extractvalue {i64, i1} %t3792, 0
  %t3794 = extractvalue {i64, i1} %t3792, 1
  br i1 %t3794, label %fixslow1369, label %fixmerge1370
fixslow1369:
  %t3795 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1370
fixmerge1370:
  %t3796 = phi i64 [ %t3793, %fixfast1368 ], [ %t3795, %fixslow1369 ]
  %t3797 = load i64, ptr @"emit.internal:rd-string"
  %t3798 = and i64 %t3797, -8
  %t3799 = inttoptr i64 %t3798 to ptr
  %t3800 = load i64, ptr %t3799
  %t3801 = inttoptr i64 %t3800 to ptr
  %t3802 = musttail call fastcc i64 %t3801(i64 %t3797, i64 3, i64 %a0, i64 %a1, i64 %t3796, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3802
else1367:
  %t3803 = or i64 %t3670, 280
  %t3804 = and i64 %t3803, 7
  %t3805 = icmp eq i64 %t3804, 0
  br i1 %t3805, label %fixfast1371, label %fixslow1372
fixfast1371:
  %t3806 = icmp eq i64 %t3670, 280
  %t3807 = select i1 %t3806, i64 257, i64 1
  br label %fixmerge1373
fixslow1372:
  %t3808 = call i64 @rt_num_eq(i64 %t3670, i64 280)
  br label %fixmerge1373
fixmerge1373:
  %t3809 = phi i64 [ %t3807, %fixfast1371 ], [ %t3808, %fixslow1372 ]
  %t3810 = icmp ne i64 %t3809, 1
  br i1 %t3810, label %then1374, label %else1375
then1374:
  %t3811 = or i64 %a2, 8
  %t3812 = and i64 %t3811, 7
  %t3813 = icmp eq i64 %t3812, 0
  br i1 %t3813, label %fixfast1376, label %fixslow1377
fixfast1376:
  %t3814 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3815 = extractvalue {i64, i1} %t3814, 0
  %t3816 = extractvalue {i64, i1} %t3814, 1
  br i1 %t3816, label %fixslow1377, label %fixmerge1378
fixslow1377:
  %t3817 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1378
fixmerge1378:
  %t3818 = phi i64 [ %t3815, %fixfast1376 ], [ %t3817, %fixslow1377 ]
  %t3819 = load i64, ptr @"emit.internal:rd-hash"
  %t3820 = and i64 %t3819, -8
  %t3821 = inttoptr i64 %t3820 to ptr
  %t3822 = load i64, ptr %t3821
  %t3823 = inttoptr i64 %t3822 to ptr
  %t3824 = musttail call fastcc i64 %t3823(i64 %t3819, i64 3, i64 %a0, i64 %a1, i64 %t3818, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3824
else1375:
  %t3825 = or i64 %t3670, 992
  %t3826 = and i64 %t3825, 7
  %t3827 = icmp eq i64 %t3826, 0
  br i1 %t3827, label %fixfast1379, label %fixslow1380
fixfast1379:
  %t3828 = icmp eq i64 %t3670, 992
  %t3829 = select i1 %t3828, i64 257, i64 1
  br label %fixmerge1381
fixslow1380:
  %t3830 = call i64 @rt_num_eq(i64 %t3670, i64 992)
  br label %fixmerge1381
fixmerge1381:
  %t3831 = phi i64 [ %t3829, %fixfast1379 ], [ %t3830, %fixslow1380 ]
  %t3832 = icmp ne i64 %t3831, 1
  br i1 %t3832, label %then1382, label %else1383
then1382:
  %t3833 = or i64 %a2, 8
  %t3834 = and i64 %t3833, 7
  %t3835 = icmp eq i64 %t3834, 0
  br i1 %t3835, label %fixfast1384, label %fixslow1385
fixfast1384:
  %t3836 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3837 = extractvalue {i64, i1} %t3836, 0
  %t3838 = extractvalue {i64, i1} %t3836, 1
  br i1 %t3838, label %fixslow1385, label %fixmerge1386
fixslow1385:
  %t3839 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1386
fixmerge1386:
  %t3840 = phi i64 [ %t3837, %fixfast1384 ], [ %t3839, %fixslow1385 ]
  %t3841 = load i64, ptr @"emit.internal:rd-bar"
  %t3842 = and i64 %t3841, -8
  %t3843 = inttoptr i64 %t3842 to ptr
  %t3844 = load i64, ptr %t3843
  %t3845 = inttoptr i64 %t3844 to ptr
  %t3846 = musttail call fastcc i64 %t3845(i64 %t3841, i64 4, i64 %a0, i64 %a1, i64 %t3840, i64 %a2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3846
else1383:
  %t3847 = or i64 %t3670, 328
  %t3848 = and i64 %t3847, 7
  %t3849 = icmp eq i64 %t3848, 0
  br i1 %t3849, label %fixfast1387, label %fixslow1388
fixfast1387:
  %t3850 = icmp eq i64 %t3670, 328
  %t3851 = select i1 %t3850, i64 257, i64 1
  br label %fixmerge1389
fixslow1388:
  %t3852 = call i64 @rt_num_eq(i64 %t3670, i64 328)
  br label %fixmerge1389
fixmerge1389:
  %t3853 = phi i64 [ %t3851, %fixfast1387 ], [ %t3852, %fixslow1388 ]
  %t3854 = icmp ne i64 %t3853, 1
  br i1 %t3854, label %then1390, label %else1391
then1390:
  br label %merge1392
else1391:
  %t3855 = or i64 %t3670, 744
  %t3856 = and i64 %t3855, 7
  %t3857 = icmp eq i64 %t3856, 0
  br i1 %t3857, label %fixfast1393, label %fixslow1394
fixfast1393:
  %t3858 = icmp eq i64 %t3670, 744
  %t3859 = select i1 %t3858, i64 257, i64 1
  br label %fixmerge1395
fixslow1394:
  %t3860 = call i64 @rt_num_eq(i64 %t3670, i64 744)
  br label %fixmerge1395
fixmerge1395:
  %t3861 = phi i64 [ %t3859, %fixfast1393 ], [ %t3860, %fixslow1394 ]
  br label %merge1392
merge1392:
  %t3862 = phi i64 [ %t3853, %then1390 ], [ %t3861, %fixmerge1395 ]
  %t3863 = icmp ne i64 %t3862, 1
  br i1 %t3863, label %then1396, label %else1397
then1396:
  %t3864 = call i64 @rt_intern(ptr @.str.sym.9)
  %t3865 = load i64, ptr @"emit.internal:rd-fail"
  %t3866 = and i64 %t3865, -8
  %t3867 = inttoptr i64 %t3866 to ptr
  %t3868 = load i64, ptr %t3867
  %t3869 = inttoptr i64 %t3868 to ptr
  %t3870 = musttail call fastcc i64 %t3869(i64 %t3865, i64 2, i64 %t3864, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3870
else1397:
  %t3871 = load i64, ptr @"emit.internal:rd-atom"
  %t3872 = and i64 %t3871, -8
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = load i64, ptr %t3873
  %t3875 = inttoptr i64 %t3874 to ptr
  %t3876 = musttail call fastcc i64 %t3875(i64 %t3871, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3876
else1322:
  %t3877 = or i64 %a2, 0
  %t3878 = and i64 %t3877, 7
  %t3879 = icmp eq i64 %t3878, 0
  br i1 %t3879, label %fixfast1398, label %fixslow1399
fixfast1398:
  %t3880 = icmp slt i64 %a2, 0
  %t3881 = select i1 %t3880, i64 257, i64 1
  br label %fixmerge1400
fixslow1399:
  %t3882 = call i64 @rt_lt(i64 %a2, i64 0)
  br label %fixmerge1400
fixmerge1400:
  %t3883 = phi i64 [ %t3881, %fixfast1398 ], [ %t3882, %fixslow1399 ]
  %t3884 = icmp ne i64 %t3883, 1
  br i1 %t3884, label %then1401, label %else1402
then1401:
  %t3885 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3886 = call i64 @rt_cons(i64 %t3885, i64 %a2)
  ret i64 %t3886
else1402:
  %t3887 = call i64 @rt_intern(ptr @.str.sym.11)
  %t3888 = load i64, ptr @"emit.internal:rd-fail"
  %t3889 = and i64 %t3888, -8
  %t3890 = inttoptr i64 %t3889 to ptr
  %t3891 = load i64, ptr %t3890
  %t3892 = inttoptr i64 %t3891 to ptr
  %t3893 = musttail call fastcc i64 %t3892(i64 %t3888, i64 2, i64 %t3887, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3893
}

define fastcc i64 @"emit.internal:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3899 = icmp eq i64 %argc, 0
  br i1 %t3899, label %argok1404, label %arityerr1403
arityerr1403:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1404:
  %t3900 = load i64, ptr @"emit.internal:%port-rtd-cell"
  %t3901 = icmp ne i64 %t3900, 1
  br i1 %t3901, label %then1405, label %else1406
then1405:
  %t3902 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t3902
else1406:
  %t3903 = call i64 @rt_make_string(ptr @.str.lit.27, i64 4)
  %t3904 = call i64 @rt_make_record_type(i64 %t3903)
  %t3905 = call i64 @rt_root(i64 %t3904)
  store i64 %t3905, ptr @"emit.internal:%port-rtd-cell"
  %t3906 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t3906
}

define fastcc i64 @"emit.internal:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3911 = icmp eq i64 %argc, 6
  br i1 %t3911, label %argok1408, label %arityerr1407
arityerr1407:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1408:
  %t3912 = load i64, ptr @"emit.internal:%port-rtd"
  %t3913 = and i64 %t3912, -8
  %t3914 = inttoptr i64 %t3913 to ptr
  %t3915 = load i64, ptr %t3914
  %t3916 = inttoptr i64 %t3915 to ptr
  %t3917 = call fastcc i64%t3916(i64 %t3912, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3918 = load i64, ptr @"emit.internal:list"
  %t3919 = and i64 %t3918, -8
  %t3920 = inttoptr i64 %t3919 to ptr
  %t3921 = load i64, ptr %t3920
  %t3922 = inttoptr i64 %t3921 to ptr
  %t3923 = call fastcc i64%t3922(i64 %t3918, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t3924 = call i64 @rt_make_record(i64 %t3917, i64 %t3923)
  ret i64 %t3924
}

define fastcc i64 @"emit.internal:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3929 = icmp eq i64 %argc, 1
  br i1 %t3929, label %argok1410, label %arityerr1409
arityerr1409:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1410:
  %t3930 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t3931 = icmp ne i64 %t3930, 1
  br i1 %t3931, label %then1411, label %else1412
then1411:
  ret i64 %t3930
else1412:
  %t3932 = call i64 @rt_read_all_stdin()
  %t3933 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t3932)
  ret i64 %t3932
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
  %t2217 = call ptr @rt_alloc_words(i64 1)
  %t2218 = ptrtoint ptr %t2217 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-atom" to i64), ptr %t2217
  %t2219 = or i64 %t2218, 4
  %t2220 = call i64 @rt_root(i64 %t2219)
  store i64 %t2220, ptr @"emit.internal:rd-atom"
  ret i64 17
}

define i64 @"emit.internal:__init_55"() {
entry:
  %t2264 = call ptr @rt_alloc_words(i64 1)
  %t2265 = ptrtoint ptr %t2264 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-at" to i64), ptr %t2264
  %t2266 = or i64 %t2265, 4
  %t2267 = call i64 @rt_root(i64 %t2266)
  store i64 %t2267, ptr @"emit.internal:rd-token-at"
  ret i64 17
}

define i64 @"emit.internal:__init_56"() {
entry:
  %t2345 = call ptr @rt_alloc_words(i64 1)
  %t2346 = ptrtoint ptr %t2345 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit" to i64), ptr %t2345
  %t2347 = or i64 %t2346, 4
  %t2348 = call i64 @rt_root(i64 %t2347)
  store i64 %t2348, ptr @"emit.internal:rd-hex-digit"
  ret i64 17
}

define i64 @"emit.internal:__init_57"() {
entry:
  %t2416 = call ptr @rt_alloc_words(i64 1)
  %t2417 = ptrtoint ptr %t2416 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex" to i64), ptr %t2416
  %t2418 = or i64 %t2417, 4
  %t2419 = call i64 @rt_root(i64 %t2418)
  store i64 %t2419, ptr @"emit.internal:rd-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_58"() {
entry:
  %t2449 = call ptr @rt_alloc_words(i64 1)
  %t2450 = ptrtoint ptr %t2449 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-str-esc" to i64), ptr %t2449
  %t2451 = or i64 %t2450, 4
  %t2452 = call i64 @rt_root(i64 %t2451)
  store i64 %t2452, ptr @"emit.internal:rd-str-esc"
  ret i64 17
}

define i64 @"emit.internal:__init_59"() {
entry:
  %t2595 = call ptr @rt_alloc_words(i64 1)
  %t2596 = ptrtoint ptr %t2595 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-string" to i64), ptr %t2595
  %t2597 = or i64 %t2596, 4
  %t2598 = call i64 @rt_root(i64 %t2597)
  store i64 %t2598, ptr @"emit.internal:rd-string"
  ret i64 17
}

define i64 @"emit.internal:__init_60"() {
entry:
  %t2907 = call ptr @rt_alloc_words(i64 1)
  %t2908 = ptrtoint ptr %t2907 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hash" to i64), ptr %t2907
  %t2909 = or i64 %t2908, 4
  %t2910 = call i64 @rt_root(i64 %t2909)
  store i64 %t2910, ptr @"emit.internal:rd-hash"
  ret i64 17
}

define i64 @"emit.internal:__init_61"() {
entry:
  %t2949 = call ptr @rt_alloc_words(i64 1)
  %t2950 = ptrtoint ptr %t2949 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-name" to i64), ptr %t2949
  %t2951 = or i64 %t2950, 4
  %t2952 = call i64 @rt_root(i64 %t2951)
  store i64 %t2952, ptr @"emit.internal:rd-char-name"
  ret i64 17
}

define i64 @"emit.internal:__init_62"() {
entry:
  %t2995 = call ptr @rt_alloc_words(i64 1)
  %t2996 = ptrtoint ptr %t2995 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char" to i64), ptr %t2995
  %t2997 = or i64 %t2996, 4
  %t2998 = call i64 @rt_root(i64 %t2997)
  store i64 %t2998, ptr @"emit.internal:rd-char"
  ret i64 17
}

define i64 @"emit.internal:__init_63"() {
entry:
  %t3167 = call ptr @rt_alloc_words(i64 1)
  %t3168 = ptrtoint ptr %t3167 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-bar" to i64), ptr %t3167
  %t3169 = or i64 %t3168, 4
  %t3170 = call i64 @rt_root(i64 %t3169)
  store i64 %t3170, ptr @"emit.internal:rd-bar"
  ret i64 17
}

define i64 @"emit.internal:__init_64"() {
entry:
  %t3202 = call ptr @rt_alloc_words(i64 1)
  %t3203 = ptrtoint ptr %t3202 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quote" to i64), ptr %t3202
  %t3204 = or i64 %t3203, 4
  %t3205 = call i64 @rt_root(i64 %t3204)
  store i64 %t3205, ptr @"emit.internal:rd-quote"
  ret i64 17
}

define i64 @"emit.internal:__init_65"() {
entry:
  %t3237 = call ptr @rt_alloc_words(i64 1)
  %t3238 = ptrtoint ptr %t3237 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quasi" to i64), ptr %t3237
  %t3239 = or i64 %t3238, 4
  %t3240 = call i64 @rt_root(i64 %t3239)
  store i64 %t3240, ptr @"emit.internal:rd-quasi"
  ret i64 17
}

define i64 @"emit.internal:__init_66"() {
entry:
  %t3329 = call ptr @rt_alloc_words(i64 1)
  %t3330 = ptrtoint ptr %t3329 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-unquote" to i64), ptr %t3329
  %t3331 = or i64 %t3330, 4
  %t3332 = call i64 @rt_root(i64 %t3331)
  store i64 %t3332, ptr @"emit.internal:rd-unquote"
  ret i64 17
}

define i64 @"emit.internal:__init_67"() {
entry:
  %t3373 = call ptr @rt_alloc_words(i64 1)
  %t3374 = ptrtoint ptr %t3373 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dot?" to i64), ptr %t3373
  %t3375 = or i64 %t3374, 4
  %t3376 = call i64 @rt_root(i64 %t3375)
  store i64 %t3376, ptr @"emit.internal:rd-dot?"
  ret i64 17
}

define i64 @"emit.internal:__init_68"() {
entry:
  %t3389 = call ptr @rt_alloc_words(i64 1)
  %t3390 = ptrtoint ptr %t3389 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-append-reverse" to i64), ptr %t3389
  %t3391 = or i64 %t3390, 4
  %t3392 = call i64 @rt_root(i64 %t3391)
  store i64 %t3392, ptr @"emit.internal:rd-append-reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_69"() {
entry:
  %t3437 = call ptr @rt_alloc_words(i64 1)
  %t3438 = ptrtoint ptr %t3437 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum-comment?" to i64), ptr %t3437
  %t3439 = or i64 %t3438, 4
  %t3440 = call i64 @rt_root(i64 %t3439)
  store i64 %t3440, ptr @"emit.internal:rd-datum-comment?"
  ret i64 17
}

define i64 @"emit.internal:__init_70"() {
entry:
  %t3638 = call ptr @rt_alloc_words(i64 1)
  %t3639 = ptrtoint ptr %t3638 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-list" to i64), ptr %t3638
  %t3640 = or i64 %t3639, 4
  %t3641 = call i64 @rt_root(i64 %t3640)
  store i64 %t3641, ptr @"emit.internal:rd-list"
  ret i64 17
}

define i64 @"emit.internal:__init_71"() {
entry:
  %t3894 = call ptr @rt_alloc_words(i64 1)
  %t3895 = ptrtoint ptr %t3894 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum" to i64), ptr %t3894
  %t3896 = or i64 %t3895, 4
  %t3897 = call i64 @rt_root(i64 %t3896)
  store i64 %t3897, ptr @"emit.internal:rd-datum"
  ret i64 17
}

define i64 @"emit.internal:__init_72"() {
entry:
  %t3898 = call i64 @rt_root(i64 1)
  store i64 %t3898, ptr @"emit.internal:%port-rtd-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_73"() {
entry:
  %t3907 = call ptr @rt_alloc_words(i64 1)
  %t3908 = ptrtoint ptr %t3907 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-rtd" to i64), ptr %t3907
  %t3909 = or i64 %t3908, 4
  %t3910 = call i64 @rt_root(i64 %t3909)
  store i64 %t3910, ptr @"emit.internal:%port-rtd"
  ret i64 17
}

define i64 @"emit.internal:__init_74"() {
entry:
  %t3925 = call ptr @rt_alloc_words(i64 1)
  %t3926 = ptrtoint ptr %t3925 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%make-port" to i64), ptr %t3925
  %t3927 = or i64 %t3926, 4
  %t3928 = call i64 @rt_root(i64 %t3927)
  store i64 %t3928, ptr @"emit.internal:%make-port"
  ret i64 17
}

define i64 @"emit.internal:__init_75"() {
entry:
  %t3934 = call ptr @rt_alloc_words(i64 1)
  %t3935 = ptrtoint ptr %t3934 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-buf" to i64), ptr %t3934
  %t3936 = or i64 %t3935, 4
  %t3937 = call i64 @rt_root(i64 %t3936)
  store i64 %t3937, ptr @"emit.internal:%port-buf"
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

