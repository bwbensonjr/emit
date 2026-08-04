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
@.str.lit.6 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.7 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.8 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.9 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.10 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.11 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.12 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.13 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.14 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.15 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.16 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.17 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.18 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.lit.19 = private unnamed_addr constant [5 x i8] c"port\00"
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
@"emit.internal:list->vector" = global i64 0
@"emit.internal:list->bytevector" = global i64 0
@"emit.internal:rd-ws?" = global i64 0
@"emit.internal:rd-digit?" = global i64 0
@"emit.internal:rd-delim?" = global i64 0
@"emit.internal:rd-skip-line" = global i64 0
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
@"emit.internal:rd-atom" = global i64 0
@"emit.internal:rd-hex-digit" = global i64 0
@"emit.internal:rd-hex" = global i64 0
@"emit.internal:rd-str-esc" = global i64 0
@"emit.internal:rd-string" = global i64 0
@"emit.internal:rd-hash" = global i64 0
@"emit.internal:rd-char-name" = global i64 0
@"emit.internal:rd-char" = global i64 0
@"emit.internal:rd-quote" = global i64 0
@"emit.internal:rd-quasi" = global i64 0
@"emit.internal:rd-unquote" = global i64 0
@"emit.internal:rd-dot?" = global i64 0
@"emit.internal:rd-append-reverse" = global i64 0
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

define fastcc i64 @"emit.internal:code_48"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t192 = icmp eq i64 %argc, 2
  br i1 %t192, label %argok45, label %arityerr44
arityerr44:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok45:
  %t193 = call i64 @rt_null_p(i64 %a0)
  %t194 = icmp ne i64 %t193, 1
  br i1 %t194, label %then46, label %else47
then46:
  %t195 = and i64 %self, -8
  %t196 = inttoptr i64 %t195 to ptr
  %t197 = getelementptr i64, ptr %t196, i64 1
  %t198 = load i64, ptr %t197
  ret i64 %t198
else47:
  %t199 = and i64 %self, -8
  %t200 = inttoptr i64 %t199 to ptr
  %t201 = getelementptr i64, ptr %t200, i64 1
  %t202 = load i64, ptr %t201
  %t203 = call i64 @rt_car(i64 %a0)
  %t204 = call i64 @rt_vector_set(i64 %t202, i64 %a1, i64 %t203)
  %t205 = call i64 @rt_cdr(i64 %a0)
  %t206 = or i64 %a1, 8
  %t207 = and i64 %t206, 7
  %t208 = icmp eq i64 %t207, 0
  br i1 %t208, label %fixfast48, label %fixslow49
fixfast48:
  %t209 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t210 = extractvalue {i64, i1} %t209, 0
  %t211 = extractvalue {i64, i1} %t209, 1
  br i1 %t211, label %fixslow49, label %fixmerge50
fixslow49:
  %t212 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge50
fixmerge50:
  %t213 = phi i64 [ %t210, %fixfast48 ], [ %t212, %fixslow49 ]
  %t214 = musttail call fastcc i64 @"emit.internal:code_48"(i64 %self, i64 2, i64 %t205, i64 %t213, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t214
}

define fastcc i64 @"emit.internal:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t215 = icmp eq i64 %argc, 1
  br i1 %t215, label %argok52, label %arityerr51
arityerr51:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok52:
  %t216 = load i64, ptr @"emit.internal:length"
  %t217 = and i64 %t216, -8
  %t218 = inttoptr i64 %t217 to ptr
  %t219 = load i64, ptr %t218
  %t220 = inttoptr i64 %t219 to ptr
  %t221 = call fastcc i64%t220(i64 %t216, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t222 = call i64 @rt_make_vector(i64 %t221, i64 0)
  %t223 = call ptr @rt_alloc_words(i64 3)
  %t224 = ptrtoint ptr %t223 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_48" to i64), ptr %t223
  %t225 = or i64 %t224, 4
  %t226 = getelementptr i64, ptr %t223, i64 1
  store i64 %t222, ptr %t226
  %t227 = getelementptr i64, ptr %t223, i64 2
  store i64 %t225, ptr %t227
  %t228 = musttail call fastcc i64 @"emit.internal:code_48"(i64 %t225, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t228
}

define fastcc i64 @"emit.internal:code_56"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t233 = icmp eq i64 %argc, 2
  br i1 %t233, label %argok54, label %arityerr53
arityerr53:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok54:
  %t234 = call i64 @rt_null_p(i64 %a0)
  %t235 = icmp ne i64 %t234, 1
  br i1 %t235, label %then55, label %else56
then55:
  %t236 = and i64 %self, -8
  %t237 = inttoptr i64 %t236 to ptr
  %t238 = getelementptr i64, ptr %t237, i64 1
  %t239 = load i64, ptr %t238
  ret i64 %t239
else56:
  %t240 = and i64 %self, -8
  %t241 = inttoptr i64 %t240 to ptr
  %t242 = getelementptr i64, ptr %t241, i64 1
  %t243 = load i64, ptr %t242
  %t244 = call i64 @rt_car(i64 %a0)
  %t245 = call i64 @rt_bytevector_u8_set(i64 %t243, i64 %a1, i64 %t244)
  %t246 = call i64 @rt_cdr(i64 %a0)
  %t247 = or i64 %a1, 8
  %t248 = and i64 %t247, 7
  %t249 = icmp eq i64 %t248, 0
  br i1 %t249, label %fixfast57, label %fixslow58
fixfast57:
  %t250 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t251 = extractvalue {i64, i1} %t250, 0
  %t252 = extractvalue {i64, i1} %t250, 1
  br i1 %t252, label %fixslow58, label %fixmerge59
fixslow58:
  %t253 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge59
fixmerge59:
  %t254 = phi i64 [ %t251, %fixfast57 ], [ %t253, %fixslow58 ]
  %t255 = musttail call fastcc i64 @"emit.internal:code_56"(i64 %self, i64 2, i64 %t246, i64 %t254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t255
}

define fastcc i64 @"emit.internal:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t256 = icmp eq i64 %argc, 1
  br i1 %t256, label %argok61, label %arityerr60
arityerr60:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok61:
  %t257 = load i64, ptr @"emit.internal:length"
  %t258 = and i64 %t257, -8
  %t259 = inttoptr i64 %t258 to ptr
  %t260 = load i64, ptr %t259
  %t261 = inttoptr i64 %t260 to ptr
  %t262 = call fastcc i64%t261(i64 %t257, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t263 = call i64 @rt_make_bytevector(i64 %t262, i64 0)
  %t264 = call ptr @rt_alloc_words(i64 3)
  %t265 = ptrtoint ptr %t264 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_56" to i64), ptr %t264
  %t266 = or i64 %t265, 4
  %t267 = getelementptr i64, ptr %t264, i64 1
  store i64 %t263, ptr %t267
  %t268 = getelementptr i64, ptr %t264, i64 2
  store i64 %t266, ptr %t268
  %t269 = musttail call fastcc i64 @"emit.internal:code_56"(i64 %t266, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t269
}

define fastcc i64 @"emit.internal:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t274 = icmp eq i64 %argc, 1
  br i1 %t274, label %argok63, label %arityerr62
arityerr62:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok63:
  %t275 = call i64 @rt_char_to_integer(i64 %a0)
  %t276 = or i64 %t275, 256
  %t277 = and i64 %t276, 7
  %t278 = icmp eq i64 %t277, 0
  br i1 %t278, label %fixfast64, label %fixslow65
fixfast64:
  %t279 = icmp eq i64 %t275, 256
  %t280 = select i1 %t279, i64 257, i64 1
  br label %fixmerge66
fixslow65:
  %t281 = call i64 @rt_num_eq(i64 %t275, i64 256)
  br label %fixmerge66
fixmerge66:
  %t282 = phi i64 [ %t280, %fixfast64 ], [ %t281, %fixslow65 ]
  %t283 = icmp ne i64 %t282, 1
  br i1 %t283, label %then67, label %else68
then67:
  ret i64 %t282
else68:
  %t284 = or i64 %t275, 72
  %t285 = and i64 %t284, 7
  %t286 = icmp eq i64 %t285, 0
  br i1 %t286, label %fixfast69, label %fixslow70
fixfast69:
  %t287 = icmp eq i64 %t275, 72
  %t288 = select i1 %t287, i64 257, i64 1
  br label %fixmerge71
fixslow70:
  %t289 = call i64 @rt_num_eq(i64 %t275, i64 72)
  br label %fixmerge71
fixmerge71:
  %t290 = phi i64 [ %t288, %fixfast69 ], [ %t289, %fixslow70 ]
  %t291 = icmp ne i64 %t290, 1
  br i1 %t291, label %then72, label %else73
then72:
  ret i64 %t290
else73:
  %t292 = or i64 %t275, 80
  %t293 = and i64 %t292, 7
  %t294 = icmp eq i64 %t293, 0
  br i1 %t294, label %fixfast74, label %fixslow75
fixfast74:
  %t295 = icmp eq i64 %t275, 80
  %t296 = select i1 %t295, i64 257, i64 1
  br label %fixmerge76
fixslow75:
  %t297 = call i64 @rt_num_eq(i64 %t275, i64 80)
  br label %fixmerge76
fixmerge76:
  %t298 = phi i64 [ %t296, %fixfast74 ], [ %t297, %fixslow75 ]
  %t299 = icmp ne i64 %t298, 1
  br i1 %t299, label %then77, label %else78
then77:
  ret i64 %t298
else78:
  %t300 = or i64 %t275, 104
  %t301 = and i64 %t300, 7
  %t302 = icmp eq i64 %t301, 0
  br i1 %t302, label %fixfast79, label %fixslow80
fixfast79:
  %t303 = icmp eq i64 %t275, 104
  %t304 = select i1 %t303, i64 257, i64 1
  br label %fixmerge81
fixslow80:
  %t305 = call i64 @rt_num_eq(i64 %t275, i64 104)
  br label %fixmerge81
fixmerge81:
  %t306 = phi i64 [ %t304, %fixfast79 ], [ %t305, %fixslow80 ]
  ret i64 %t306
}

define fastcc i64 @"emit.internal:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t311 = icmp eq i64 %argc, 1
  br i1 %t311, label %argok83, label %arityerr82
arityerr82:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok83:
  %t312 = call i64 @rt_char_to_integer(i64 %a0)
  %t313 = or i64 376, %t312
  %t314 = and i64 %t313, 7
  %t315 = icmp eq i64 %t314, 0
  br i1 %t315, label %fixfast84, label %fixslow85
fixfast84:
  %t316 = icmp slt i64 376, %t312
  %t317 = select i1 %t316, i64 257, i64 1
  br label %fixmerge86
fixslow85:
  %t318 = call i64 @rt_lt(i64 376, i64 %t312)
  br label %fixmerge86
fixmerge86:
  %t319 = phi i64 [ %t317, %fixfast84 ], [ %t318, %fixslow85 ]
  %t320 = icmp ne i64 %t319, 1
  br i1 %t320, label %then87, label %else88
then87:
  %t321 = or i64 %t312, 464
  %t322 = and i64 %t321, 7
  %t323 = icmp eq i64 %t322, 0
  br i1 %t323, label %fixfast89, label %fixslow90
fixfast89:
  %t324 = icmp slt i64 %t312, 464
  %t325 = select i1 %t324, i64 257, i64 1
  br label %fixmerge91
fixslow90:
  %t326 = call i64 @rt_lt(i64 %t312, i64 464)
  br label %fixmerge91
fixmerge91:
  %t327 = phi i64 [ %t325, %fixfast89 ], [ %t326, %fixslow90 ]
  ret i64 %t327
else88:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t332 = icmp eq i64 %argc, 1
  br i1 %t332, label %argok93, label %arityerr92
arityerr92:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok93:
  %t333 = call i64 @rt_char_to_integer(i64 %a0)
  %t334 = load i64, ptr @"emit.internal:rd-ws?"
  %t335 = and i64 %t334, -8
  %t336 = inttoptr i64 %t335 to ptr
  %t337 = load i64, ptr %t336
  %t338 = inttoptr i64 %t337 to ptr
  %t339 = call fastcc i64%t338(i64 %t334, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t340 = icmp ne i64 %t339, 1
  br i1 %t340, label %then94, label %else95
then94:
  ret i64 %t339
else95:
  %t341 = or i64 %t333, 320
  %t342 = and i64 %t341, 7
  %t343 = icmp eq i64 %t342, 0
  br i1 %t343, label %fixfast96, label %fixslow97
fixfast96:
  %t344 = icmp eq i64 %t333, 320
  %t345 = select i1 %t344, i64 257, i64 1
  br label %fixmerge98
fixslow97:
  %t346 = call i64 @rt_num_eq(i64 %t333, i64 320)
  br label %fixmerge98
fixmerge98:
  %t347 = phi i64 [ %t345, %fixfast96 ], [ %t346, %fixslow97 ]
  %t348 = icmp ne i64 %t347, 1
  br i1 %t348, label %then99, label %else100
then99:
  ret i64 %t347
else100:
  %t349 = or i64 %t333, 328
  %t350 = and i64 %t349, 7
  %t351 = icmp eq i64 %t350, 0
  br i1 %t351, label %fixfast101, label %fixslow102
fixfast101:
  %t352 = icmp eq i64 %t333, 328
  %t353 = select i1 %t352, i64 257, i64 1
  br label %fixmerge103
fixslow102:
  %t354 = call i64 @rt_num_eq(i64 %t333, i64 328)
  br label %fixmerge103
fixmerge103:
  %t355 = phi i64 [ %t353, %fixfast101 ], [ %t354, %fixslow102 ]
  %t356 = icmp ne i64 %t355, 1
  br i1 %t356, label %then104, label %else105
then104:
  ret i64 %t355
else105:
  %t357 = or i64 %t333, 728
  %t358 = and i64 %t357, 7
  %t359 = icmp eq i64 %t358, 0
  br i1 %t359, label %fixfast106, label %fixslow107
fixfast106:
  %t360 = icmp eq i64 %t333, 728
  %t361 = select i1 %t360, i64 257, i64 1
  br label %fixmerge108
fixslow107:
  %t362 = call i64 @rt_num_eq(i64 %t333, i64 728)
  br label %fixmerge108
fixmerge108:
  %t363 = phi i64 [ %t361, %fixfast106 ], [ %t362, %fixslow107 ]
  %t364 = icmp ne i64 %t363, 1
  br i1 %t364, label %then109, label %else110
then109:
  ret i64 %t363
else110:
  %t365 = or i64 %t333, 744
  %t366 = and i64 %t365, 7
  %t367 = icmp eq i64 %t366, 0
  br i1 %t367, label %fixfast111, label %fixslow112
fixfast111:
  %t368 = icmp eq i64 %t333, 744
  %t369 = select i1 %t368, i64 257, i64 1
  br label %fixmerge113
fixslow112:
  %t370 = call i64 @rt_num_eq(i64 %t333, i64 744)
  br label %fixmerge113
fixmerge113:
  %t371 = phi i64 [ %t369, %fixfast111 ], [ %t370, %fixslow112 ]
  %t372 = icmp ne i64 %t371, 1
  br i1 %t372, label %then114, label %else115
then114:
  ret i64 %t371
else115:
  %t373 = or i64 %t333, 272
  %t374 = and i64 %t373, 7
  %t375 = icmp eq i64 %t374, 0
  br i1 %t375, label %fixfast116, label %fixslow117
fixfast116:
  %t376 = icmp eq i64 %t333, 272
  %t377 = select i1 %t376, i64 257, i64 1
  br label %fixmerge118
fixslow117:
  %t378 = call i64 @rt_num_eq(i64 %t333, i64 272)
  br label %fixmerge118
fixmerge118:
  %t379 = phi i64 [ %t377, %fixfast116 ], [ %t378, %fixslow117 ]
  %t380 = icmp ne i64 %t379, 1
  br i1 %t380, label %then119, label %else120
then119:
  ret i64 %t379
else120:
  %t381 = or i64 %t333, 472
  %t382 = and i64 %t381, 7
  %t383 = icmp eq i64 %t382, 0
  br i1 %t383, label %fixfast121, label %fixslow122
fixfast121:
  %t384 = icmp eq i64 %t333, 472
  %t385 = select i1 %t384, i64 257, i64 1
  br label %fixmerge123
fixslow122:
  %t386 = call i64 @rt_num_eq(i64 %t333, i64 472)
  br label %fixmerge123
fixmerge123:
  %t387 = phi i64 [ %t385, %fixfast121 ], [ %t386, %fixslow122 ]
  ret i64 %t387
}

define fastcc i64 @"emit.internal:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t392 = icmp eq i64 %argc, 3
  br i1 %t392, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok125:
  %t393 = or i64 %a2, %a1
  %t394 = and i64 %t393, 7
  %t395 = icmp eq i64 %t394, 0
  br i1 %t395, label %fixfast126, label %fixslow127
fixfast126:
  %t396 = icmp slt i64 %a2, %a1
  %t397 = select i1 %t396, i64 257, i64 1
  br label %fixmerge128
fixslow127:
  %t398 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge128
fixmerge128:
  %t399 = phi i64 [ %t397, %fixfast126 ], [ %t398, %fixslow127 ]
  %t400 = icmp ne i64 %t399, 1
  br i1 %t400, label %then129, label %else130
then129:
  %t401 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t402 = call i64 @rt_char_to_integer(i64 %t401)
  %t403 = or i64 %t402, 80
  %t404 = and i64 %t403, 7
  %t405 = icmp eq i64 %t404, 0
  br i1 %t405, label %fixfast131, label %fixslow132
fixfast131:
  %t406 = icmp eq i64 %t402, 80
  %t407 = select i1 %t406, i64 257, i64 1
  br label %fixmerge133
fixslow132:
  %t408 = call i64 @rt_num_eq(i64 %t402, i64 80)
  br label %fixmerge133
fixmerge133:
  %t409 = phi i64 [ %t407, %fixfast131 ], [ %t408, %fixslow132 ]
  %t410 = icmp ne i64 %t409, 1
  br i1 %t410, label %then134, label %else135
then134:
  %t411 = or i64 %a2, 8
  %t412 = and i64 %t411, 7
  %t413 = icmp eq i64 %t412, 0
  br i1 %t413, label %fixfast136, label %fixslow137
fixfast136:
  %t414 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t415 = extractvalue {i64, i1} %t414, 0
  %t416 = extractvalue {i64, i1} %t414, 1
  br i1 %t416, label %fixslow137, label %fixmerge138
fixslow137:
  %t417 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge138
fixmerge138:
  %t418 = phi i64 [ %t415, %fixfast136 ], [ %t417, %fixslow137 ]
  ret i64 %t418
else135:
  %t419 = or i64 %a2, 8
  %t420 = and i64 %t419, 7
  %t421 = icmp eq i64 %t420, 0
  br i1 %t421, label %fixfast139, label %fixslow140
fixfast139:
  %t422 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t423 = extractvalue {i64, i1} %t422, 0
  %t424 = extractvalue {i64, i1} %t422, 1
  br i1 %t424, label %fixslow140, label %fixmerge141
fixslow140:
  %t425 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge141
fixmerge141:
  %t426 = phi i64 [ %t423, %fixfast139 ], [ %t425, %fixslow140 ]
  %t427 = load i64, ptr @"emit.internal:rd-skip-line"
  %t428 = and i64 %t427, -8
  %t429 = inttoptr i64 %t428 to ptr
  %t430 = load i64, ptr %t429
  %t431 = inttoptr i64 %t430 to ptr
  %t432 = musttail call fastcc i64 %t431(i64 %t427, i64 3, i64 %a0, i64 %a1, i64 %t426, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t432
else130:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t437 = icmp eq i64 %argc, 3
  br i1 %t437, label %argok143, label %arityerr142
arityerr142:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok143:
  %t438 = or i64 %a2, %a1
  %t439 = and i64 %t438, 7
  %t440 = icmp eq i64 %t439, 0
  br i1 %t440, label %fixfast144, label %fixslow145
fixfast144:
  %t441 = icmp slt i64 %a2, %a1
  %t442 = select i1 %t441, i64 257, i64 1
  br label %fixmerge146
fixslow145:
  %t443 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge146
fixmerge146:
  %t444 = phi i64 [ %t442, %fixfast144 ], [ %t443, %fixslow145 ]
  %t445 = icmp ne i64 %t444, 1
  br i1 %t445, label %then147, label %else148
then147:
  %t446 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t447 = load i64, ptr @"emit.internal:rd-ws?"
  %t448 = and i64 %t447, -8
  %t449 = inttoptr i64 %t448 to ptr
  %t450 = load i64, ptr %t449
  %t451 = inttoptr i64 %t450 to ptr
  %t452 = call fastcc i64%t451(i64 %t447, i64 1, i64 %t446, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t453 = icmp ne i64 %t452, 1
  br i1 %t453, label %then149, label %else150
then149:
  %t454 = or i64 %a2, 8
  %t455 = and i64 %t454, 7
  %t456 = icmp eq i64 %t455, 0
  br i1 %t456, label %fixfast151, label %fixslow152
fixfast151:
  %t457 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t458 = extractvalue {i64, i1} %t457, 0
  %t459 = extractvalue {i64, i1} %t457, 1
  br i1 %t459, label %fixslow152, label %fixmerge153
fixslow152:
  %t460 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge153
fixmerge153:
  %t461 = phi i64 [ %t458, %fixfast151 ], [ %t460, %fixslow152 ]
  %t462 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t463 = and i64 %t462, -8
  %t464 = inttoptr i64 %t463 to ptr
  %t465 = load i64, ptr %t464
  %t466 = inttoptr i64 %t465 to ptr
  %t467 = musttail call fastcc i64 %t466(i64 %t462, i64 3, i64 %a0, i64 %a1, i64 %t461, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t467
else150:
  %t468 = call i64 @rt_char_to_integer(i64 %t446)
  %t469 = or i64 %t468, 472
  %t470 = and i64 %t469, 7
  %t471 = icmp eq i64 %t470, 0
  br i1 %t471, label %fixfast154, label %fixslow155
fixfast154:
  %t472 = icmp eq i64 %t468, 472
  %t473 = select i1 %t472, i64 257, i64 1
  br label %fixmerge156
fixslow155:
  %t474 = call i64 @rt_num_eq(i64 %t468, i64 472)
  br label %fixmerge156
fixmerge156:
  %t475 = phi i64 [ %t473, %fixfast154 ], [ %t474, %fixslow155 ]
  %t476 = icmp ne i64 %t475, 1
  br i1 %t476, label %then157, label %else158
then157:
  %t477 = or i64 %a2, 8
  %t478 = and i64 %t477, 7
  %t479 = icmp eq i64 %t478, 0
  br i1 %t479, label %fixfast159, label %fixslow160
fixfast159:
  %t480 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t481 = extractvalue {i64, i1} %t480, 0
  %t482 = extractvalue {i64, i1} %t480, 1
  br i1 %t482, label %fixslow160, label %fixmerge161
fixslow160:
  %t483 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge161
fixmerge161:
  %t484 = phi i64 [ %t481, %fixfast159 ], [ %t483, %fixslow160 ]
  %t485 = load i64, ptr @"emit.internal:rd-skip-line"
  %t486 = and i64 %t485, -8
  %t487 = inttoptr i64 %t486 to ptr
  %t488 = load i64, ptr %t487
  %t489 = inttoptr i64 %t488 to ptr
  %t490 = call fastcc i64%t489(i64 %t485, i64 3, i64 %a0, i64 %a1, i64 %t484, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t491 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t492 = and i64 %t491, -8
  %t493 = inttoptr i64 %t492 to ptr
  %t494 = load i64, ptr %t493
  %t495 = inttoptr i64 %t494 to ptr
  %t496 = musttail call fastcc i64 %t495(i64 %t491, i64 3, i64 %a0, i64 %a1, i64 %t490, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t496
else158:
  ret i64 %a2
else148:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t501 = icmp eq i64 %argc, 3
  br i1 %t501, label %argok163, label %arityerr162
arityerr162:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok163:
  %t502 = or i64 %a2, %a1
  %t503 = and i64 %t502, 7
  %t504 = icmp eq i64 %t503, 0
  br i1 %t504, label %fixfast164, label %fixslow165
fixfast164:
  %t505 = icmp slt i64 %a2, %a1
  %t506 = select i1 %t505, i64 257, i64 1
  br label %fixmerge166
fixslow165:
  %t507 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge166
fixmerge166:
  %t508 = phi i64 [ %t506, %fixfast164 ], [ %t507, %fixslow165 ]
  %t509 = icmp ne i64 %t508, 1
  br i1 %t509, label %then167, label %else168
then167:
  %t510 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t511 = load i64, ptr @"emit.internal:rd-delim?"
  %t512 = and i64 %t511, -8
  %t513 = inttoptr i64 %t512 to ptr
  %t514 = load i64, ptr %t513
  %t515 = inttoptr i64 %t514 to ptr
  %t516 = call fastcc i64%t515(i64 %t511, i64 1, i64 %t510, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t517 = icmp ne i64 %t516, 1
  br i1 %t517, label %then169, label %else170
then169:
  ret i64 %a2
else170:
  %t518 = or i64 %a2, 8
  %t519 = and i64 %t518, 7
  %t520 = icmp eq i64 %t519, 0
  br i1 %t520, label %fixfast171, label %fixslow172
fixfast171:
  %t521 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t522 = extractvalue {i64, i1} %t521, 0
  %t523 = extractvalue {i64, i1} %t521, 1
  br i1 %t523, label %fixslow172, label %fixmerge173
fixslow172:
  %t524 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge173
fixmerge173:
  %t525 = phi i64 [ %t522, %fixfast171 ], [ %t524, %fixslow172 ]
  %t526 = load i64, ptr @"emit.internal:rd-token-end"
  %t527 = and i64 %t526, -8
  %t528 = inttoptr i64 %t527 to ptr
  %t529 = load i64, ptr %t528
  %t530 = inttoptr i64 %t529 to ptr
  %t531 = musttail call fastcc i64 %t530(i64 %t526, i64 3, i64 %a0, i64 %a1, i64 %t525, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t531
else168:
  ret i64 %a2
}

define fastcc i64 @"emit.internal:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t536 = icmp eq i64 %argc, 3
  br i1 %t536, label %argok175, label %arityerr174
arityerr174:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok175:
  %t537 = or i64 %a1, %a2
  %t538 = and i64 %t537, 7
  %t539 = icmp eq i64 %t538, 0
  br i1 %t539, label %fixfast176, label %fixslow177
fixfast176:
  %t540 = icmp slt i64 %a1, %a2
  %t541 = select i1 %t540, i64 257, i64 1
  br label %fixmerge178
fixslow177:
  %t542 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge178
fixmerge178:
  %t543 = phi i64 [ %t541, %fixfast176 ], [ %t542, %fixslow177 ]
  %t544 = icmp ne i64 %t543, 1
  br i1 %t544, label %then179, label %else180
then179:
  %t545 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t546 = load i64, ptr @"emit.internal:rd-digit?"
  %t547 = and i64 %t546, -8
  %t548 = inttoptr i64 %t547 to ptr
  %t549 = load i64, ptr %t548
  %t550 = inttoptr i64 %t549 to ptr
  %t551 = call fastcc i64%t550(i64 %t546, i64 1, i64 %t545, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t552 = icmp ne i64 %t551, 1
  br i1 %t552, label %then181, label %else182
then181:
  %t553 = or i64 %a1, 8
  %t554 = and i64 %t553, 7
  %t555 = icmp eq i64 %t554, 0
  br i1 %t555, label %fixfast183, label %fixslow184
fixfast183:
  %t556 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t557 = extractvalue {i64, i1} %t556, 0
  %t558 = extractvalue {i64, i1} %t556, 1
  br i1 %t558, label %fixslow184, label %fixmerge185
fixslow184:
  %t559 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge185
fixmerge185:
  %t560 = phi i64 [ %t557, %fixfast183 ], [ %t559, %fixslow184 ]
  %t561 = load i64, ptr @"emit.internal:rd-all-digits?"
  %t562 = and i64 %t561, -8
  %t563 = inttoptr i64 %t562 to ptr
  %t564 = load i64, ptr %t563
  %t565 = inttoptr i64 %t564 to ptr
  %t566 = musttail call fastcc i64 %t565(i64 %t561, i64 3, i64 %a0, i64 %t560, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t566
else182:
  ret i64 1
else180:
  ret i64 257
}

define fastcc i64 @"emit.internal:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t571 = icmp eq i64 %argc, 1
  br i1 %t571, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok187:
  %t572 = call i64 @rt_string_length(i64 %a0)
  %t573 = or i64 0, %t572
  %t574 = and i64 %t573, 7
  %t575 = icmp eq i64 %t574, 0
  br i1 %t575, label %fixfast188, label %fixslow189
fixfast188:
  %t576 = icmp slt i64 0, %t572
  %t577 = select i1 %t576, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t578 = call i64 @rt_lt(i64 0, i64 %t572)
  br label %fixmerge190
fixmerge190:
  %t579 = phi i64 [ %t577, %fixfast188 ], [ %t578, %fixslow189 ]
  %t580 = icmp ne i64 %t579, 1
  br i1 %t580, label %then191, label %else192
then191:
  %t581 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t582 = call i64 @rt_char_to_integer(i64 %t581)
  %t583 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t584 = load i64, ptr @"emit.internal:rd-digit?"
  %t585 = and i64 %t584, -8
  %t586 = inttoptr i64 %t585 to ptr
  %t587 = load i64, ptr %t586
  %t588 = inttoptr i64 %t587 to ptr
  %t589 = call fastcc i64%t588(i64 %t584, i64 1, i64 %t583, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t590 = icmp ne i64 %t589, 1
  br i1 %t590, label %then193, label %else194
then193:
  %t591 = load i64, ptr @"emit.internal:rd-all-digits?"
  %t592 = and i64 %t591, -8
  %t593 = inttoptr i64 %t592 to ptr
  %t594 = load i64, ptr %t593
  %t595 = inttoptr i64 %t594 to ptr
  %t596 = musttail call fastcc i64 %t595(i64 %t591, i64 3, i64 %a0, i64 0, i64 %t572, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t596
else194:
  %t597 = or i64 %t582, 360
  %t598 = and i64 %t597, 7
  %t599 = icmp eq i64 %t598, 0
  br i1 %t599, label %fixfast195, label %fixslow196
fixfast195:
  %t600 = icmp eq i64 %t582, 360
  %t601 = select i1 %t600, i64 257, i64 1
  br label %fixmerge197
fixslow196:
  %t602 = call i64 @rt_num_eq(i64 %t582, i64 360)
  br label %fixmerge197
fixmerge197:
  %t603 = phi i64 [ %t601, %fixfast195 ], [ %t602, %fixslow196 ]
  %t604 = icmp ne i64 %t603, 1
  br i1 %t604, label %then198, label %else199
then198:
  br label %merge200
else199:
  %t605 = or i64 %t582, 344
  %t606 = and i64 %t605, 7
  %t607 = icmp eq i64 %t606, 0
  br i1 %t607, label %fixfast201, label %fixslow202
fixfast201:
  %t608 = icmp eq i64 %t582, 344
  %t609 = select i1 %t608, i64 257, i64 1
  br label %fixmerge203
fixslow202:
  %t610 = call i64 @rt_num_eq(i64 %t582, i64 344)
  br label %fixmerge203
fixmerge203:
  %t611 = phi i64 [ %t609, %fixfast201 ], [ %t610, %fixslow202 ]
  br label %merge200
merge200:
  %t612 = phi i64 [ %t603, %then198 ], [ %t611, %fixmerge203 ]
  %t613 = icmp ne i64 %t612, 1
  br i1 %t613, label %then204, label %else205
then204:
  %t614 = or i64 8, %t572
  %t615 = and i64 %t614, 7
  %t616 = icmp eq i64 %t615, 0
  br i1 %t616, label %fixfast206, label %fixslow207
fixfast206:
  %t617 = icmp slt i64 8, %t572
  %t618 = select i1 %t617, i64 257, i64 1
  br label %fixmerge208
fixslow207:
  %t619 = call i64 @rt_lt(i64 8, i64 %t572)
  br label %fixmerge208
fixmerge208:
  %t620 = phi i64 [ %t618, %fixfast206 ], [ %t619, %fixslow207 ]
  %t621 = icmp ne i64 %t620, 1
  br i1 %t621, label %then209, label %else210
then209:
  %t622 = load i64, ptr @"emit.internal:rd-all-digits?"
  %t623 = and i64 %t622, -8
  %t624 = inttoptr i64 %t623 to ptr
  %t625 = load i64, ptr %t624
  %t626 = inttoptr i64 %t625 to ptr
  %t627 = musttail call fastcc i64 %t626(i64 %t622, i64 3, i64 %a0, i64 8, i64 %t572, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t627
else210:
  ret i64 1
else205:
  ret i64 1
else192:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t632 = icmp eq i64 %argc, 4
  br i1 %t632, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok212:
  %t633 = or i64 %a1, %a2
  %t634 = and i64 %t633, 7
  %t635 = icmp eq i64 %t634, 0
  br i1 %t635, label %fixfast213, label %fixslow214
fixfast213:
  %t636 = icmp slt i64 %a1, %a2
  %t637 = select i1 %t636, i64 257, i64 1
  br label %fixmerge215
fixslow214:
  %t638 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge215
fixmerge215:
  %t639 = phi i64 [ %t637, %fixfast213 ], [ %t638, %fixslow214 ]
  %t640 = icmp ne i64 %t639, 1
  br i1 %t640, label %then216, label %else217
then216:
  %t641 = or i64 %a1, 8
  %t642 = and i64 %t641, 7
  %t643 = icmp eq i64 %t642, 0
  br i1 %t643, label %fixfast218, label %fixslow219
fixfast218:
  %t644 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t645 = extractvalue {i64, i1} %t644, 0
  %t646 = extractvalue {i64, i1} %t644, 1
  br i1 %t646, label %fixslow219, label %fixmerge220
fixslow219:
  %t647 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge220
fixmerge220:
  %t648 = phi i64 [ %t645, %fixfast218 ], [ %t647, %fixslow219 ]
  %t649 = or i64 %a3, 80
  %t650 = and i64 %t649, 7
  %t651 = icmp eq i64 %t650, 0
  br i1 %t651, label %fixfast221, label %fixslow222
fixfast221:
  %t652 = ashr i64 %a3, 3
  %t653 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t652, i64 80)
  %t654 = extractvalue {i64, i1} %t653, 0
  %t655 = extractvalue {i64, i1} %t653, 1
  br i1 %t655, label %fixslow222, label %fixmerge223
fixslow222:
  %t656 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge223
fixmerge223:
  %t657 = phi i64 [ %t654, %fixfast221 ], [ %t656, %fixslow222 ]
  %t658 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t659 = call i64 @rt_char_to_integer(i64 %t658)
  %t660 = or i64 %t659, 384
  %t661 = and i64 %t660, 7
  %t662 = icmp eq i64 %t661, 0
  br i1 %t662, label %fixfast224, label %fixslow225
fixfast224:
  %t663 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t659, i64 384)
  %t664 = extractvalue {i64, i1} %t663, 0
  %t665 = extractvalue {i64, i1} %t663, 1
  br i1 %t665, label %fixslow225, label %fixmerge226
fixslow225:
  %t666 = call i64 @rt_sub(i64 %t659, i64 384)
  br label %fixmerge226
fixmerge226:
  %t667 = phi i64 [ %t664, %fixfast224 ], [ %t666, %fixslow225 ]
  %t668 = or i64 %t657, %t667
  %t669 = and i64 %t668, 7
  %t670 = icmp eq i64 %t669, 0
  br i1 %t670, label %fixfast227, label %fixslow228
fixfast227:
  %t671 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t657, i64 %t667)
  %t672 = extractvalue {i64, i1} %t671, 0
  %t673 = extractvalue {i64, i1} %t671, 1
  br i1 %t673, label %fixslow228, label %fixmerge229
fixslow228:
  %t674 = call i64 @rt_add(i64 %t657, i64 %t667)
  br label %fixmerge229
fixmerge229:
  %t675 = phi i64 [ %t672, %fixfast227 ], [ %t674, %fixslow228 ]
  %t676 = load i64, ptr @"emit.internal:rd-digits"
  %t677 = and i64 %t676, -8
  %t678 = inttoptr i64 %t677 to ptr
  %t679 = load i64, ptr %t678
  %t680 = inttoptr i64 %t679 to ptr
  %t681 = musttail call fastcc i64 %t680(i64 %t676, i64 4, i64 %a0, i64 %t648, i64 %a2, i64 %t675, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t681
else217:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t686 = icmp eq i64 %argc, 4
  br i1 %t686, label %argok231, label %arityerr230
arityerr230:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok231:
  %t687 = or i64 %a1, %a2
  %t688 = and i64 %t687, 7
  %t689 = icmp eq i64 %t688, 0
  br i1 %t689, label %fixfast232, label %fixslow233
fixfast232:
  %t690 = icmp slt i64 %a1, %a2
  %t691 = select i1 %t690, i64 257, i64 1
  br label %fixmerge234
fixslow233:
  %t692 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge234
fixmerge234:
  %t693 = phi i64 [ %t691, %fixfast232 ], [ %t692, %fixslow233 ]
  %t694 = icmp ne i64 %t693, 1
  br i1 %t694, label %then235, label %else236
then235:
  %t695 = or i64 %a1, 8
  %t696 = and i64 %t695, 7
  %t697 = icmp eq i64 %t696, 0
  br i1 %t697, label %fixfast237, label %fixslow238
fixfast237:
  %t698 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t699 = extractvalue {i64, i1} %t698, 0
  %t700 = extractvalue {i64, i1} %t698, 1
  br i1 %t700, label %fixslow238, label %fixmerge239
fixslow238:
  %t701 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge239
fixmerge239:
  %t702 = phi i64 [ %t699, %fixfast237 ], [ %t701, %fixslow238 ]
  %t703 = or i64 %a3, 80
  %t704 = and i64 %t703, 7
  %t705 = icmp eq i64 %t704, 0
  br i1 %t705, label %fixfast240, label %fixslow241
fixfast240:
  %t706 = ashr i64 %a3, 3
  %t707 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t706, i64 80)
  %t708 = extractvalue {i64, i1} %t707, 0
  %t709 = extractvalue {i64, i1} %t707, 1
  br i1 %t709, label %fixslow241, label %fixmerge242
fixslow241:
  %t710 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge242
fixmerge242:
  %t711 = phi i64 [ %t708, %fixfast240 ], [ %t710, %fixslow241 ]
  %t712 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t713 = call i64 @rt_char_to_integer(i64 %t712)
  %t714 = or i64 %t713, 384
  %t715 = and i64 %t714, 7
  %t716 = icmp eq i64 %t715, 0
  br i1 %t716, label %fixfast243, label %fixslow244
fixfast243:
  %t717 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t713, i64 384)
  %t718 = extractvalue {i64, i1} %t717, 0
  %t719 = extractvalue {i64, i1} %t717, 1
  br i1 %t719, label %fixslow244, label %fixmerge245
fixslow244:
  %t720 = call i64 @rt_sub(i64 %t713, i64 384)
  br label %fixmerge245
fixmerge245:
  %t721 = phi i64 [ %t718, %fixfast243 ], [ %t720, %fixslow244 ]
  %t722 = or i64 %t711, %t721
  %t723 = and i64 %t722, 7
  %t724 = icmp eq i64 %t723, 0
  br i1 %t724, label %fixfast246, label %fixslow247
fixfast246:
  %t725 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t711, i64 %t721)
  %t726 = extractvalue {i64, i1} %t725, 0
  %t727 = extractvalue {i64, i1} %t725, 1
  br i1 %t727, label %fixslow247, label %fixmerge248
fixslow247:
  %t728 = call i64 @rt_sub(i64 %t711, i64 %t721)
  br label %fixmerge248
fixmerge248:
  %t729 = phi i64 [ %t726, %fixfast246 ], [ %t728, %fixslow247 ]
  %t730 = load i64, ptr @"emit.internal:rd-digits-neg"
  %t731 = and i64 %t730, -8
  %t732 = inttoptr i64 %t731 to ptr
  %t733 = load i64, ptr %t732
  %t734 = inttoptr i64 %t733 to ptr
  %t735 = musttail call fastcc i64 %t734(i64 %t730, i64 4, i64 %a0, i64 %t702, i64 %a2, i64 %t729, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t735
else236:
  ret i64 %a3
}

define fastcc i64 @"emit.internal:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t740 = icmp eq i64 %argc, 1
  br i1 %t740, label %argok250, label %arityerr249
arityerr249:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok250:
  %t741 = call i64 @rt_string_length(i64 %a0)
  %t742 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t743 = call i64 @rt_char_to_integer(i64 %t742)
  %t744 = or i64 %t743, 360
  %t745 = and i64 %t744, 7
  %t746 = icmp eq i64 %t745, 0
  br i1 %t746, label %fixfast251, label %fixslow252
fixfast251:
  %t747 = icmp eq i64 %t743, 360
  %t748 = select i1 %t747, i64 257, i64 1
  br label %fixmerge253
fixslow252:
  %t749 = call i64 @rt_num_eq(i64 %t743, i64 360)
  br label %fixmerge253
fixmerge253:
  %t750 = phi i64 [ %t748, %fixfast251 ], [ %t749, %fixslow252 ]
  %t751 = icmp ne i64 %t750, 1
  br i1 %t751, label %then254, label %else255
then254:
  %t752 = load i64, ptr @"emit.internal:rd-digits-neg"
  %t753 = and i64 %t752, -8
  %t754 = inttoptr i64 %t753 to ptr
  %t755 = load i64, ptr %t754
  %t756 = inttoptr i64 %t755 to ptr
  %t757 = musttail call fastcc i64 %t756(i64 %t752, i64 4, i64 %a0, i64 8, i64 %t741, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t757
else255:
  %t758 = or i64 %t743, 344
  %t759 = and i64 %t758, 7
  %t760 = icmp eq i64 %t759, 0
  br i1 %t760, label %fixfast256, label %fixslow257
fixfast256:
  %t761 = icmp eq i64 %t743, 344
  %t762 = select i1 %t761, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t763 = call i64 @rt_num_eq(i64 %t743, i64 344)
  br label %fixmerge258
fixmerge258:
  %t764 = phi i64 [ %t762, %fixfast256 ], [ %t763, %fixslow257 ]
  %t765 = icmp ne i64 %t764, 1
  br i1 %t765, label %then259, label %else260
then259:
  %t766 = load i64, ptr @"emit.internal:rd-digits"
  %t767 = and i64 %t766, -8
  %t768 = inttoptr i64 %t767 to ptr
  %t769 = load i64, ptr %t768
  %t770 = inttoptr i64 %t769 to ptr
  %t771 = musttail call fastcc i64 %t770(i64 %t766, i64 4, i64 %a0, i64 8, i64 %t741, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t771
else260:
  %t772 = load i64, ptr @"emit.internal:rd-digits"
  %t773 = and i64 %t772, -8
  %t774 = inttoptr i64 %t773 to ptr
  %t775 = load i64, ptr %t774
  %t776 = inttoptr i64 %t775 to ptr
  %t777 = musttail call fastcc i64 %t776(i64 %t772, i64 4, i64 %a0, i64 0, i64 %t741, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t777
}

define fastcc i64 @"emit.internal:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t782 = icmp eq i64 %argc, 1
  br i1 %t782, label %argok262, label %arityerr261
arityerr261:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok262:
  %t783 = call i64 @rt_char_to_integer(i64 %a0)
  %t784 = or i64 %t783, 368
  %t785 = and i64 %t784, 7
  %t786 = icmp eq i64 %t785, 0
  br i1 %t786, label %fixfast263, label %fixslow264
fixfast263:
  %t787 = icmp eq i64 %t783, 368
  %t788 = select i1 %t787, i64 257, i64 1
  br label %fixmerge265
fixslow264:
  %t789 = call i64 @rt_num_eq(i64 %t783, i64 368)
  br label %fixmerge265
fixmerge265:
  %t790 = phi i64 [ %t788, %fixfast263 ], [ %t789, %fixslow264 ]
  ret i64 %t790
}

define fastcc i64 @"emit.internal:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t795 = icmp eq i64 %argc, 1
  br i1 %t795, label %argok267, label %arityerr266
arityerr266:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok267:
  %t796 = call i64 @rt_char_to_integer(i64 %a0)
  %t797 = or i64 %t796, 808
  %t798 = and i64 %t797, 7
  %t799 = icmp eq i64 %t798, 0
  br i1 %t799, label %fixfast268, label %fixslow269
fixfast268:
  %t800 = icmp eq i64 %t796, 808
  %t801 = select i1 %t800, i64 257, i64 1
  br label %fixmerge270
fixslow269:
  %t802 = call i64 @rt_num_eq(i64 %t796, i64 808)
  br label %fixmerge270
fixmerge270:
  %t803 = phi i64 [ %t801, %fixfast268 ], [ %t802, %fixslow269 ]
  %t804 = icmp ne i64 %t803, 1
  br i1 %t804, label %then271, label %else272
then271:
  ret i64 %t803
else272:
  %t805 = or i64 %t796, 552
  %t806 = and i64 %t805, 7
  %t807 = icmp eq i64 %t806, 0
  br i1 %t807, label %fixfast273, label %fixslow274
fixfast273:
  %t808 = icmp eq i64 %t796, 552
  %t809 = select i1 %t808, i64 257, i64 1
  br label %fixmerge275
fixslow274:
  %t810 = call i64 @rt_num_eq(i64 %t796, i64 552)
  br label %fixmerge275
fixmerge275:
  %t811 = phi i64 [ %t809, %fixfast273 ], [ %t810, %fixslow274 ]
  ret i64 %t811
}

define fastcc i64 @"emit.internal:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t816 = icmp eq i64 %argc, 1
  br i1 %t816, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok277:
  %t817 = call i64 @rt_char_to_integer(i64 %a0)
  %t818 = or i64 %t817, 344
  %t819 = and i64 %t818, 7
  %t820 = icmp eq i64 %t819, 0
  br i1 %t820, label %fixfast278, label %fixslow279
fixfast278:
  %t821 = icmp eq i64 %t817, 344
  %t822 = select i1 %t821, i64 257, i64 1
  br label %fixmerge280
fixslow279:
  %t823 = call i64 @rt_num_eq(i64 %t817, i64 344)
  br label %fixmerge280
fixmerge280:
  %t824 = phi i64 [ %t822, %fixfast278 ], [ %t823, %fixslow279 ]
  %t825 = icmp ne i64 %t824, 1
  br i1 %t825, label %then281, label %else282
then281:
  ret i64 %t824
else282:
  %t826 = or i64 %t817, 360
  %t827 = and i64 %t826, 7
  %t828 = icmp eq i64 %t827, 0
  br i1 %t828, label %fixfast283, label %fixslow284
fixfast283:
  %t829 = icmp eq i64 %t817, 360
  %t830 = select i1 %t829, i64 257, i64 1
  br label %fixmerge285
fixslow284:
  %t831 = call i64 @rt_num_eq(i64 %t817, i64 360)
  br label %fixmerge285
fixmerge285:
  %t832 = phi i64 [ %t830, %fixfast283 ], [ %t831, %fixslow284 ]
  ret i64 %t832
}

define fastcc i64 @"emit.internal:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t837 = icmp eq i64 %argc, 3
  br i1 %t837, label %argok287, label %arityerr286
arityerr286:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok287:
  %t838 = or i64 %a1, %a2
  %t839 = and i64 %t838, 7
  %t840 = icmp eq i64 %t839, 0
  br i1 %t840, label %fixfast288, label %fixslow289
fixfast288:
  %t841 = icmp slt i64 %a1, %a2
  %t842 = select i1 %t841, i64 257, i64 1
  br label %fixmerge290
fixslow289:
  %t843 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge290
fixmerge290:
  %t844 = phi i64 [ %t842, %fixfast288 ], [ %t843, %fixslow289 ]
  %t845 = icmp ne i64 %t844, 1
  br i1 %t845, label %then291, label %else292
then291:
  %t846 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t847 = load i64, ptr @"emit.internal:rd-digit?"
  %t848 = and i64 %t847, -8
  %t849 = inttoptr i64 %t848 to ptr
  %t850 = load i64, ptr %t849
  %t851 = inttoptr i64 %t850 to ptr
  %t852 = call fastcc i64%t851(i64 %t847, i64 1, i64 %t846, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge293
else292:
  br label %merge293
merge293:
  %t853 = phi i64 [ %t852, %then291 ], [ 1, %else292 ]
  %t854 = icmp ne i64 %t853, 1
  br i1 %t854, label %then294, label %else295
then294:
  %t855 = or i64 %a1, 8
  %t856 = and i64 %t855, 7
  %t857 = icmp eq i64 %t856, 0
  br i1 %t857, label %fixfast296, label %fixslow297
fixfast296:
  %t858 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t859 = extractvalue {i64, i1} %t858, 0
  %t860 = extractvalue {i64, i1} %t858, 1
  br i1 %t860, label %fixslow297, label %fixmerge298
fixslow297:
  %t861 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge298
fixmerge298:
  %t862 = phi i64 [ %t859, %fixfast296 ], [ %t861, %fixslow297 ]
  %t863 = load i64, ptr @"emit.internal:rd-scan-digits"
  %t864 = and i64 %t863, -8
  %t865 = inttoptr i64 %t864 to ptr
  %t866 = load i64, ptr %t865
  %t867 = inttoptr i64 %t866 to ptr
  %t868 = musttail call fastcc i64 %t867(i64 %t863, i64 3, i64 %a0, i64 %t862, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t868
else295:
  ret i64 %a1
}

define fastcc i64 @"emit.internal:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t873 = icmp eq i64 %argc, 1
  br i1 %t873, label %argok300, label %arityerr299
arityerr299:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok300:
  %t874 = call i64 @rt_string_length(i64 %a0)
  %t875 = or i64 0, %t874
  %t876 = and i64 %t875, 7
  %t877 = icmp eq i64 %t876, 0
  br i1 %t877, label %fixfast301, label %fixslow302
fixfast301:
  %t878 = icmp slt i64 0, %t874
  %t879 = select i1 %t878, i64 257, i64 1
  br label %fixmerge303
fixslow302:
  %t880 = call i64 @rt_lt(i64 0, i64 %t874)
  br label %fixmerge303
fixmerge303:
  %t881 = phi i64 [ %t879, %fixfast301 ], [ %t880, %fixslow302 ]
  %t882 = icmp ne i64 %t881, 1
  br i1 %t882, label %then304, label %else305
then304:
  %t883 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t884 = load i64, ptr @"emit.internal:rd-sign-char?"
  %t885 = and i64 %t884, -8
  %t886 = inttoptr i64 %t885 to ptr
  %t887 = load i64, ptr %t886
  %t888 = inttoptr i64 %t887 to ptr
  %t889 = call fastcc i64%t888(i64 %t884, i64 1, i64 %t883, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t890 = icmp ne i64 %t889, 1
  br i1 %t890, label %then306, label %else307
then306:
  br label %merge308
else307:
  br label %merge308
merge308:
  %t891 = phi i64 [ 8, %then306 ], [ 0, %else307 ]
  %t892 = load i64, ptr @"emit.internal:rd-scan-digits"
  %t893 = and i64 %t892, -8
  %t894 = inttoptr i64 %t893 to ptr
  %t895 = load i64, ptr %t894
  %t896 = inttoptr i64 %t895 to ptr
  %t897 = call fastcc i64%t896(i64 %t892, i64 3, i64 %a0, i64 %t891, i64 %t874, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t898 = or i64 %t897, %t874
  %t899 = and i64 %t898, 7
  %t900 = icmp eq i64 %t899, 0
  br i1 %t900, label %fixfast309, label %fixslow310
fixfast309:
  %t901 = icmp slt i64 %t897, %t874
  %t902 = select i1 %t901, i64 257, i64 1
  br label %fixmerge311
fixslow310:
  %t903 = call i64 @rt_lt(i64 %t897, i64 %t874)
  br label %fixmerge311
fixmerge311:
  %t904 = phi i64 [ %t902, %fixfast309 ], [ %t903, %fixslow310 ]
  %t905 = icmp ne i64 %t904, 1
  br i1 %t905, label %then312, label %else313
then312:
  %t906 = call i64 @rt_string_ref(i64 %a0, i64 %t897)
  %t907 = load i64, ptr @"emit.internal:rd-dotchar?"
  %t908 = and i64 %t907, -8
  %t909 = inttoptr i64 %t908 to ptr
  %t910 = load i64, ptr %t909
  %t911 = inttoptr i64 %t910 to ptr
  %t912 = call fastcc i64%t911(i64 %t907, i64 1, i64 %t906, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge314
else313:
  br label %merge314
merge314:
  %t913 = phi i64 [ %t912, %then312 ], [ 1, %else313 ]
  %t914 = icmp ne i64 %t913, 1
  br i1 %t914, label %then315, label %else316
then315:
  %t915 = or i64 %t897, 8
  %t916 = and i64 %t915, 7
  %t917 = icmp eq i64 %t916, 0
  br i1 %t917, label %fixfast318, label %fixslow319
fixfast318:
  %t918 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t897, i64 8)
  %t919 = extractvalue {i64, i1} %t918, 0
  %t920 = extractvalue {i64, i1} %t918, 1
  br i1 %t920, label %fixslow319, label %fixmerge320
fixslow319:
  %t921 = call i64 @rt_add(i64 %t897, i64 8)
  br label %fixmerge320
fixmerge320:
  %t922 = phi i64 [ %t919, %fixfast318 ], [ %t921, %fixslow319 ]
  br label %merge317
else316:
  br label %merge317
merge317:
  %t923 = phi i64 [ %t922, %fixmerge320 ], [ %t897, %else316 ]
  %t924 = or i64 %t897, %t923
  %t925 = and i64 %t924, 7
  %t926 = icmp eq i64 %t925, 0
  br i1 %t926, label %fixfast321, label %fixslow322
fixfast321:
  %t927 = icmp slt i64 %t897, %t923
  %t928 = select i1 %t927, i64 257, i64 1
  br label %fixmerge323
fixslow322:
  %t929 = call i64 @rt_lt(i64 %t897, i64 %t923)
  br label %fixmerge323
fixmerge323:
  %t930 = phi i64 [ %t928, %fixfast321 ], [ %t929, %fixslow322 ]
  %t931 = load i64, ptr @"emit.internal:rd-scan-digits"
  %t932 = and i64 %t931, -8
  %t933 = inttoptr i64 %t932 to ptr
  %t934 = load i64, ptr %t933
  %t935 = inttoptr i64 %t934 to ptr
  %t936 = call fastcc i64%t935(i64 %t931, i64 3, i64 %a0, i64 %t923, i64 %t874, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t937 = or i64 %t891, %t897
  %t938 = and i64 %t937, 7
  %t939 = icmp eq i64 %t938, 0
  br i1 %t939, label %fixfast324, label %fixslow325
fixfast324:
  %t940 = icmp slt i64 %t891, %t897
  %t941 = select i1 %t940, i64 257, i64 1
  br label %fixmerge326
fixslow325:
  %t942 = call i64 @rt_lt(i64 %t891, i64 %t897)
  br label %fixmerge326
fixmerge326:
  %t943 = phi i64 [ %t941, %fixfast324 ], [ %t942, %fixslow325 ]
  %t944 = icmp ne i64 %t943, 1
  br i1 %t944, label %then327, label %else328
then327:
  br label %merge329
else328:
  %t945 = or i64 %t923, %t936
  %t946 = and i64 %t945, 7
  %t947 = icmp eq i64 %t946, 0
  br i1 %t947, label %fixfast330, label %fixslow331
fixfast330:
  %t948 = icmp slt i64 %t923, %t936
  %t949 = select i1 %t948, i64 257, i64 1
  br label %fixmerge332
fixslow331:
  %t950 = call i64 @rt_lt(i64 %t923, i64 %t936)
  br label %fixmerge332
fixmerge332:
  %t951 = phi i64 [ %t949, %fixfast330 ], [ %t950, %fixslow331 ]
  br label %merge329
merge329:
  %t952 = phi i64 [ %t943, %then327 ], [ %t951, %fixmerge332 ]
  %t953 = icmp ne i64 %t952, 1
  br i1 %t953, label %then333, label %else334
then333:
  %t954 = or i64 %t936, %t874
  %t955 = and i64 %t954, 7
  %t956 = icmp eq i64 %t955, 0
  br i1 %t956, label %fixfast335, label %fixslow336
fixfast335:
  %t957 = icmp slt i64 %t936, %t874
  %t958 = select i1 %t957, i64 257, i64 1
  br label %fixmerge337
fixslow336:
  %t959 = call i64 @rt_lt(i64 %t936, i64 %t874)
  br label %fixmerge337
fixmerge337:
  %t960 = phi i64 [ %t958, %fixfast335 ], [ %t959, %fixslow336 ]
  %t961 = icmp ne i64 %t960, 1
  br i1 %t961, label %then338, label %else339
then338:
  %t962 = call i64 @rt_string_ref(i64 %a0, i64 %t936)
  %t963 = load i64, ptr @"emit.internal:rd-exp-char?"
  %t964 = and i64 %t963, -8
  %t965 = inttoptr i64 %t964 to ptr
  %t966 = load i64, ptr %t965
  %t967 = inttoptr i64 %t966 to ptr
  %t968 = call fastcc i64%t967(i64 %t963, i64 1, i64 %t962, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge340
else339:
  br label %merge340
merge340:
  %t969 = phi i64 [ %t968, %then338 ], [ 1, %else339 ]
  %t970 = icmp ne i64 %t969, 1
  br i1 %t970, label %then341, label %else342
then341:
  %t971 = or i64 %t936, 8
  %t972 = and i64 %t971, 7
  %t973 = icmp eq i64 %t972, 0
  br i1 %t973, label %fixfast344, label %fixslow345
fixfast344:
  %t974 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t936, i64 8)
  %t975 = extractvalue {i64, i1} %t974, 0
  %t976 = extractvalue {i64, i1} %t974, 1
  br i1 %t976, label %fixslow345, label %fixmerge346
fixslow345:
  %t977 = call i64 @rt_add(i64 %t936, i64 8)
  br label %fixmerge346
fixmerge346:
  %t978 = phi i64 [ %t975, %fixfast344 ], [ %t977, %fixslow345 ]
  %t979 = or i64 %t978, %t874
  %t980 = and i64 %t979, 7
  %t981 = icmp eq i64 %t980, 0
  br i1 %t981, label %fixfast347, label %fixslow348
fixfast347:
  %t982 = icmp slt i64 %t978, %t874
  %t983 = select i1 %t982, i64 257, i64 1
  br label %fixmerge349
fixslow348:
  %t984 = call i64 @rt_lt(i64 %t978, i64 %t874)
  br label %fixmerge349
fixmerge349:
  %t985 = phi i64 [ %t983, %fixfast347 ], [ %t984, %fixslow348 ]
  %t986 = icmp ne i64 %t985, 1
  br i1 %t986, label %then350, label %else351
then350:
  %t987 = or i64 %t936, 8
  %t988 = and i64 %t987, 7
  %t989 = icmp eq i64 %t988, 0
  br i1 %t989, label %fixfast353, label %fixslow354
fixfast353:
  %t990 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t936, i64 8)
  %t991 = extractvalue {i64, i1} %t990, 0
  %t992 = extractvalue {i64, i1} %t990, 1
  br i1 %t992, label %fixslow354, label %fixmerge355
fixslow354:
  %t993 = call i64 @rt_add(i64 %t936, i64 8)
  br label %fixmerge355
fixmerge355:
  %t994 = phi i64 [ %t991, %fixfast353 ], [ %t993, %fixslow354 ]
  %t995 = call i64 @rt_string_ref(i64 %a0, i64 %t994)
  %t996 = load i64, ptr @"emit.internal:rd-sign-char?"
  %t997 = and i64 %t996, -8
  %t998 = inttoptr i64 %t997 to ptr
  %t999 = load i64, ptr %t998
  %t1000 = inttoptr i64 %t999 to ptr
  %t1001 = call fastcc i64%t1000(i64 %t996, i64 1, i64 %t995, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge352
else351:
  br label %merge352
merge352:
  %t1002 = phi i64 [ %t1001, %fixmerge355 ], [ 1, %else351 ]
  %t1003 = icmp ne i64 %t1002, 1
  br i1 %t1003, label %then356, label %else357
then356:
  %t1004 = or i64 %t936, 16
  %t1005 = and i64 %t1004, 7
  %t1006 = icmp eq i64 %t1005, 0
  br i1 %t1006, label %fixfast359, label %fixslow360
fixfast359:
  %t1007 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t936, i64 16)
  %t1008 = extractvalue {i64, i1} %t1007, 0
  %t1009 = extractvalue {i64, i1} %t1007, 1
  br i1 %t1009, label %fixslow360, label %fixmerge361
fixslow360:
  %t1010 = call i64 @rt_add(i64 %t936, i64 16)
  br label %fixmerge361
fixmerge361:
  %t1011 = phi i64 [ %t1008, %fixfast359 ], [ %t1010, %fixslow360 ]
  br label %merge358
else357:
  %t1012 = or i64 %t936, 8
  %t1013 = and i64 %t1012, 7
  %t1014 = icmp eq i64 %t1013, 0
  br i1 %t1014, label %fixfast362, label %fixslow363
fixfast362:
  %t1015 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t936, i64 8)
  %t1016 = extractvalue {i64, i1} %t1015, 0
  %t1017 = extractvalue {i64, i1} %t1015, 1
  br i1 %t1017, label %fixslow363, label %fixmerge364
fixslow363:
  %t1018 = call i64 @rt_add(i64 %t936, i64 8)
  br label %fixmerge364
fixmerge364:
  %t1019 = phi i64 [ %t1016, %fixfast362 ], [ %t1018, %fixslow363 ]
  br label %merge358
merge358:
  %t1020 = phi i64 [ %t1011, %fixmerge361 ], [ %t1019, %fixmerge364 ]
  %t1021 = load i64, ptr @"emit.internal:rd-scan-digits"
  %t1022 = and i64 %t1021, -8
  %t1023 = inttoptr i64 %t1022 to ptr
  %t1024 = load i64, ptr %t1023
  %t1025 = inttoptr i64 %t1024 to ptr
  %t1026 = call fastcc i64%t1025(i64 %t1021, i64 3, i64 %a0, i64 %t1020, i64 %t874, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1027 = or i64 %t1020, %t1026
  %t1028 = and i64 %t1027, 7
  %t1029 = icmp eq i64 %t1028, 0
  br i1 %t1029, label %fixfast365, label %fixslow366
fixfast365:
  %t1030 = icmp slt i64 %t1020, %t1026
  %t1031 = select i1 %t1030, i64 257, i64 1
  br label %fixmerge367
fixslow366:
  %t1032 = call i64 @rt_lt(i64 %t1020, i64 %t1026)
  br label %fixmerge367
fixmerge367:
  %t1033 = phi i64 [ %t1031, %fixfast365 ], [ %t1032, %fixslow366 ]
  %t1034 = icmp ne i64 %t1033, 1
  br i1 %t1034, label %then368, label %else369
then368:
  br label %merge370
else369:
  br label %merge370
merge370:
  %t1035 = phi i64 [ %t1026, %then368 ], [ -8, %else369 ]
  br label %merge343
else342:
  br label %merge343
merge343:
  %t1036 = phi i64 [ %t1035, %merge370 ], [ %t936, %else342 ]
  %t1037 = or i64 -8, %t1036
  %t1038 = and i64 %t1037, 7
  %t1039 = icmp eq i64 %t1038, 0
  br i1 %t1039, label %fixfast371, label %fixslow372
fixfast371:
  %t1040 = icmp slt i64 -8, %t1036
  %t1041 = select i1 %t1040, i64 257, i64 1
  br label %fixmerge373
fixslow372:
  %t1042 = call i64 @rt_lt(i64 -8, i64 %t1036)
  br label %fixmerge373
fixmerge373:
  %t1043 = phi i64 [ %t1041, %fixfast371 ], [ %t1042, %fixslow372 ]
  %t1044 = icmp ne i64 %t1043, 1
  br i1 %t1044, label %then374, label %else375
then374:
  %t1045 = or i64 %t1036, %t874
  %t1046 = and i64 %t1045, 7
  %t1047 = icmp eq i64 %t1046, 0
  br i1 %t1047, label %fixfast376, label %fixslow377
fixfast376:
  %t1048 = icmp eq i64 %t1036, %t874
  %t1049 = select i1 %t1048, i64 257, i64 1
  br label %fixmerge378
fixslow377:
  %t1050 = call i64 @rt_num_eq(i64 %t1036, i64 %t874)
  br label %fixmerge378
fixmerge378:
  %t1051 = phi i64 [ %t1049, %fixfast376 ], [ %t1050, %fixslow377 ]
  %t1052 = icmp ne i64 %t1051, 1
  br i1 %t1052, label %then379, label %else380
then379:
  %t1053 = icmp ne i64 %t930, 1
  br i1 %t1053, label %then381, label %else382
then381:
  ret i64 %t930
else382:
  %t1054 = or i64 %t936, %t1036
  %t1055 = and i64 %t1054, 7
  %t1056 = icmp eq i64 %t1055, 0
  br i1 %t1056, label %fixfast383, label %fixslow384
fixfast383:
  %t1057 = icmp slt i64 %t936, %t1036
  %t1058 = select i1 %t1057, i64 257, i64 1
  br label %fixmerge385
fixslow384:
  %t1059 = call i64 @rt_lt(i64 %t936, i64 %t1036)
  br label %fixmerge385
fixmerge385:
  %t1060 = phi i64 [ %t1058, %fixfast383 ], [ %t1059, %fixslow384 ]
  ret i64 %t1060
else380:
  ret i64 1
else375:
  ret i64 1
else334:
  ret i64 1
else305:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1065 = icmp eq i64 %argc, 1
  br i1 %t1065, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok387:
  %t1066 = call i64 @rt_make_string(ptr @.str.lit.0, i64 6)
  %t1067 = call i64 @rt_string_eq(i64 %a0, i64 %t1066)
  %t1068 = icmp ne i64 %t1067, 1
  br i1 %t1068, label %then388, label %else389
then388:
  %t1069 = call i64 @rt_make_string(ptr @.str.lit.1, i64 3)
  %t1070 = call i64 @rt_string_to_flonum(i64 %t1069)
  ret i64 %t1070
else389:
  %t1071 = call i64 @rt_make_string(ptr @.str.lit.2, i64 6)
  %t1072 = call i64 @rt_string_eq(i64 %a0, i64 %t1071)
  %t1073 = icmp ne i64 %t1072, 1
  br i1 %t1073, label %then390, label %else391
then390:
  %t1074 = call i64 @rt_make_string(ptr @.str.lit.3, i64 4)
  %t1075 = call i64 @rt_string_to_flonum(i64 %t1074)
  ret i64 %t1075
else391:
  %t1076 = call i64 @rt_make_string(ptr @.str.lit.4, i64 6)
  %t1077 = call i64 @rt_string_eq(i64 %a0, i64 %t1076)
  %t1078 = icmp ne i64 %t1077, 1
  br i1 %t1078, label %then392, label %else393
then392:
  %t1079 = call i64 @rt_make_string(ptr @.str.lit.5, i64 3)
  %t1080 = call i64 @rt_string_to_flonum(i64 %t1079)
  ret i64 %t1080
else393:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1085 = icmp eq i64 %argc, 3
  br i1 %t1085, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok395:
  %t1086 = load i64, ptr @"emit.internal:rd-token-end"
  %t1087 = and i64 %t1086, -8
  %t1088 = inttoptr i64 %t1087 to ptr
  %t1089 = load i64, ptr %t1088
  %t1090 = inttoptr i64 %t1089 to ptr
  %t1091 = call fastcc i64%t1090(i64 %t1086, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1092 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t1091)
  %t1093 = load i64, ptr @"emit.internal:rd-numeric?"
  %t1094 = and i64 %t1093, -8
  %t1095 = inttoptr i64 %t1094 to ptr
  %t1096 = load i64, ptr %t1095
  %t1097 = inttoptr i64 %t1096 to ptr
  %t1098 = call fastcc i64%t1097(i64 %t1093, i64 1, i64 %t1092, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1099 = icmp ne i64 %t1098, 1
  br i1 %t1099, label %then396, label %else397
then396:
  %t1100 = load i64, ptr @"emit.internal:rd-parse-int"
  %t1101 = and i64 %t1100, -8
  %t1102 = inttoptr i64 %t1101 to ptr
  %t1103 = load i64, ptr %t1102
  %t1104 = inttoptr i64 %t1103 to ptr
  %t1105 = call fastcc i64%t1104(i64 %t1100, i64 1, i64 %t1092, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge398
else397:
  %t1106 = load i64, ptr @"emit.internal:rd-nonfinite"
  %t1107 = and i64 %t1106, -8
  %t1108 = inttoptr i64 %t1107 to ptr
  %t1109 = load i64, ptr %t1108
  %t1110 = inttoptr i64 %t1109 to ptr
  %t1111 = call fastcc i64%t1110(i64 %t1106, i64 1, i64 %t1092, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1112 = icmp ne i64 %t1111, 1
  br i1 %t1112, label %then399, label %else400
then399:
  br label %merge401
else400:
  %t1113 = load i64, ptr @"emit.internal:rd-flonum?"
  %t1114 = and i64 %t1113, -8
  %t1115 = inttoptr i64 %t1114 to ptr
  %t1116 = load i64, ptr %t1115
  %t1117 = inttoptr i64 %t1116 to ptr
  %t1118 = call fastcc i64%t1117(i64 %t1113, i64 1, i64 %t1092, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1119 = icmp ne i64 %t1118, 1
  br i1 %t1119, label %then402, label %else403
then402:
  %t1120 = call i64 @rt_string_to_flonum(i64 %t1092)
  br label %merge404
else403:
  %t1121 = call i64 @rt_string_to_symbol(i64 %t1092)
  br label %merge404
merge404:
  %t1122 = phi i64 [ %t1120, %then402 ], [ %t1121, %else403 ]
  br label %merge401
merge401:
  %t1123 = phi i64 [ %t1111, %then399 ], [ %t1122, %merge404 ]
  br label %merge398
merge398:
  %t1124 = phi i64 [ %t1105, %then396 ], [ %t1123, %merge401 ]
  %t1125 = call i64 @rt_cons(i64 %t1124, i64 %t1091)
  ret i64 %t1125
}

define fastcc i64 @"emit.internal:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1130 = icmp eq i64 %argc, 1
  br i1 %t1130, label %argok406, label %arityerr405
arityerr405:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok406:
  %t1131 = call i64 @rt_char_to_integer(i64 %a0)
  %t1132 = or i64 376, %t1131
  %t1133 = and i64 %t1132, 7
  %t1134 = icmp eq i64 %t1133, 0
  br i1 %t1134, label %fixfast407, label %fixslow408
fixfast407:
  %t1135 = icmp slt i64 376, %t1131
  %t1136 = select i1 %t1135, i64 257, i64 1
  br label %fixmerge409
fixslow408:
  %t1137 = call i64 @rt_lt(i64 376, i64 %t1131)
  br label %fixmerge409
fixmerge409:
  %t1138 = phi i64 [ %t1136, %fixfast407 ], [ %t1137, %fixslow408 ]
  %t1139 = icmp ne i64 %t1138, 1
  br i1 %t1139, label %then410, label %else411
then410:
  %t1140 = or i64 %t1131, 464
  %t1141 = and i64 %t1140, 7
  %t1142 = icmp eq i64 %t1141, 0
  br i1 %t1142, label %fixfast413, label %fixslow414
fixfast413:
  %t1143 = icmp slt i64 %t1131, 464
  %t1144 = select i1 %t1143, i64 257, i64 1
  br label %fixmerge415
fixslow414:
  %t1145 = call i64 @rt_lt(i64 %t1131, i64 464)
  br label %fixmerge415
fixmerge415:
  %t1146 = phi i64 [ %t1144, %fixfast413 ], [ %t1145, %fixslow414 ]
  br label %merge412
else411:
  br label %merge412
merge412:
  %t1147 = phi i64 [ %t1146, %fixmerge415 ], [ 1, %else411 ]
  %t1148 = icmp ne i64 %t1147, 1
  br i1 %t1148, label %then416, label %else417
then416:
  %t1149 = or i64 %t1131, 384
  %t1150 = and i64 %t1149, 7
  %t1151 = icmp eq i64 %t1150, 0
  br i1 %t1151, label %fixfast418, label %fixslow419
fixfast418:
  %t1152 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1131, i64 384)
  %t1153 = extractvalue {i64, i1} %t1152, 0
  %t1154 = extractvalue {i64, i1} %t1152, 1
  br i1 %t1154, label %fixslow419, label %fixmerge420
fixslow419:
  %t1155 = call i64 @rt_sub(i64 %t1131, i64 384)
  br label %fixmerge420
fixmerge420:
  %t1156 = phi i64 [ %t1153, %fixfast418 ], [ %t1155, %fixslow419 ]
  ret i64 %t1156
else417:
  %t1157 = or i64 768, %t1131
  %t1158 = and i64 %t1157, 7
  %t1159 = icmp eq i64 %t1158, 0
  br i1 %t1159, label %fixfast421, label %fixslow422
fixfast421:
  %t1160 = icmp slt i64 768, %t1131
  %t1161 = select i1 %t1160, i64 257, i64 1
  br label %fixmerge423
fixslow422:
  %t1162 = call i64 @rt_lt(i64 768, i64 %t1131)
  br label %fixmerge423
fixmerge423:
  %t1163 = phi i64 [ %t1161, %fixfast421 ], [ %t1162, %fixslow422 ]
  %t1164 = icmp ne i64 %t1163, 1
  br i1 %t1164, label %then424, label %else425
then424:
  %t1165 = or i64 %t1131, 824
  %t1166 = and i64 %t1165, 7
  %t1167 = icmp eq i64 %t1166, 0
  br i1 %t1167, label %fixfast427, label %fixslow428
fixfast427:
  %t1168 = icmp slt i64 %t1131, 824
  %t1169 = select i1 %t1168, i64 257, i64 1
  br label %fixmerge429
fixslow428:
  %t1170 = call i64 @rt_lt(i64 %t1131, i64 824)
  br label %fixmerge429
fixmerge429:
  %t1171 = phi i64 [ %t1169, %fixfast427 ], [ %t1170, %fixslow428 ]
  br label %merge426
else425:
  br label %merge426
merge426:
  %t1172 = phi i64 [ %t1171, %fixmerge429 ], [ 1, %else425 ]
  %t1173 = icmp ne i64 %t1172, 1
  br i1 %t1173, label %then430, label %else431
then430:
  %t1174 = or i64 %t1131, 696
  %t1175 = and i64 %t1174, 7
  %t1176 = icmp eq i64 %t1175, 0
  br i1 %t1176, label %fixfast432, label %fixslow433
fixfast432:
  %t1177 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1131, i64 696)
  %t1178 = extractvalue {i64, i1} %t1177, 0
  %t1179 = extractvalue {i64, i1} %t1177, 1
  br i1 %t1179, label %fixslow433, label %fixmerge434
fixslow433:
  %t1180 = call i64 @rt_sub(i64 %t1131, i64 696)
  br label %fixmerge434
fixmerge434:
  %t1181 = phi i64 [ %t1178, %fixfast432 ], [ %t1180, %fixslow433 ]
  ret i64 %t1181
else431:
  %t1182 = or i64 512, %t1131
  %t1183 = and i64 %t1182, 7
  %t1184 = icmp eq i64 %t1183, 0
  br i1 %t1184, label %fixfast435, label %fixslow436
fixfast435:
  %t1185 = icmp slt i64 512, %t1131
  %t1186 = select i1 %t1185, i64 257, i64 1
  br label %fixmerge437
fixslow436:
  %t1187 = call i64 @rt_lt(i64 512, i64 %t1131)
  br label %fixmerge437
fixmerge437:
  %t1188 = phi i64 [ %t1186, %fixfast435 ], [ %t1187, %fixslow436 ]
  %t1189 = icmp ne i64 %t1188, 1
  br i1 %t1189, label %then438, label %else439
then438:
  %t1190 = or i64 %t1131, 568
  %t1191 = and i64 %t1190, 7
  %t1192 = icmp eq i64 %t1191, 0
  br i1 %t1192, label %fixfast441, label %fixslow442
fixfast441:
  %t1193 = icmp slt i64 %t1131, 568
  %t1194 = select i1 %t1193, i64 257, i64 1
  br label %fixmerge443
fixslow442:
  %t1195 = call i64 @rt_lt(i64 %t1131, i64 568)
  br label %fixmerge443
fixmerge443:
  %t1196 = phi i64 [ %t1194, %fixfast441 ], [ %t1195, %fixslow442 ]
  br label %merge440
else439:
  br label %merge440
merge440:
  %t1197 = phi i64 [ %t1196, %fixmerge443 ], [ 1, %else439 ]
  %t1198 = icmp ne i64 %t1197, 1
  br i1 %t1198, label %then444, label %else445
then444:
  %t1199 = or i64 %t1131, 440
  %t1200 = and i64 %t1199, 7
  %t1201 = icmp eq i64 %t1200, 0
  br i1 %t1201, label %fixfast446, label %fixslow447
fixfast446:
  %t1202 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1131, i64 440)
  %t1203 = extractvalue {i64, i1} %t1202, 0
  %t1204 = extractvalue {i64, i1} %t1202, 1
  br i1 %t1204, label %fixslow447, label %fixmerge448
fixslow447:
  %t1205 = call i64 @rt_sub(i64 %t1131, i64 440)
  br label %fixmerge448
fixmerge448:
  %t1206 = phi i64 [ %t1203, %fixfast446 ], [ %t1205, %fixslow447 ]
  ret i64 %t1206
else445:
  ret i64 0
}

define fastcc i64 @"emit.internal:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1211 = icmp eq i64 %argc, 4
  br i1 %t1211, label %argok450, label %arityerr449
arityerr449:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok450:
  %t1212 = or i64 %a2, %a1
  %t1213 = and i64 %t1212, 7
  %t1214 = icmp eq i64 %t1213, 0
  br i1 %t1214, label %fixfast451, label %fixslow452
fixfast451:
  %t1215 = icmp slt i64 %a2, %a1
  %t1216 = select i1 %t1215, i64 257, i64 1
  br label %fixmerge453
fixslow452:
  %t1217 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge453
fixmerge453:
  %t1218 = phi i64 [ %t1216, %fixfast451 ], [ %t1217, %fixslow452 ]
  %t1219 = icmp ne i64 %t1218, 1
  br i1 %t1219, label %then454, label %else455
then454:
  %t1220 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1221 = call i64 @rt_char_to_integer(i64 %t1220)
  %t1222 = or i64 %t1221, 472
  %t1223 = and i64 %t1222, 7
  %t1224 = icmp eq i64 %t1223, 0
  br i1 %t1224, label %fixfast456, label %fixslow457
fixfast456:
  %t1225 = icmp eq i64 %t1221, 472
  %t1226 = select i1 %t1225, i64 257, i64 1
  br label %fixmerge458
fixslow457:
  %t1227 = call i64 @rt_num_eq(i64 %t1221, i64 472)
  br label %fixmerge458
fixmerge458:
  %t1228 = phi i64 [ %t1226, %fixfast456 ], [ %t1227, %fixslow457 ]
  %t1229 = icmp ne i64 %t1228, 1
  br i1 %t1229, label %then459, label %else460
then459:
  %t1230 = or i64 %a2, 8
  %t1231 = and i64 %t1230, 7
  %t1232 = icmp eq i64 %t1231, 0
  br i1 %t1232, label %fixfast461, label %fixslow462
fixfast461:
  %t1233 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1234 = extractvalue {i64, i1} %t1233, 0
  %t1235 = extractvalue {i64, i1} %t1233, 1
  br i1 %t1235, label %fixslow462, label %fixmerge463
fixslow462:
  %t1236 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge463
fixmerge463:
  %t1237 = phi i64 [ %t1234, %fixfast461 ], [ %t1236, %fixslow462 ]
  %t1238 = call i64 @rt_cons(i64 %a3, i64 %t1237)
  ret i64 %t1238
else460:
  %t1239 = or i64 %a2, 8
  %t1240 = and i64 %t1239, 7
  %t1241 = icmp eq i64 %t1240, 0
  br i1 %t1241, label %fixfast464, label %fixslow465
fixfast464:
  %t1242 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1243 = extractvalue {i64, i1} %t1242, 0
  %t1244 = extractvalue {i64, i1} %t1242, 1
  br i1 %t1244, label %fixslow465, label %fixmerge466
fixslow465:
  %t1245 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge466
fixmerge466:
  %t1246 = phi i64 [ %t1243, %fixfast464 ], [ %t1245, %fixslow465 ]
  %t1247 = or i64 %a3, 128
  %t1248 = and i64 %t1247, 7
  %t1249 = icmp eq i64 %t1248, 0
  br i1 %t1249, label %fixfast467, label %fixslow468
fixfast467:
  %t1250 = ashr i64 %a3, 3
  %t1251 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1250, i64 128)
  %t1252 = extractvalue {i64, i1} %t1251, 0
  %t1253 = extractvalue {i64, i1} %t1251, 1
  br i1 %t1253, label %fixslow468, label %fixmerge469
fixslow468:
  %t1254 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge469
fixmerge469:
  %t1255 = phi i64 [ %t1252, %fixfast467 ], [ %t1254, %fixslow468 ]
  %t1256 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1257 = load i64, ptr @"emit.internal:rd-hex-digit"
  %t1258 = and i64 %t1257, -8
  %t1259 = inttoptr i64 %t1258 to ptr
  %t1260 = load i64, ptr %t1259
  %t1261 = inttoptr i64 %t1260 to ptr
  %t1262 = call fastcc i64%t1261(i64 %t1257, i64 1, i64 %t1256, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1263 = or i64 %t1255, %t1262
  %t1264 = and i64 %t1263, 7
  %t1265 = icmp eq i64 %t1264, 0
  br i1 %t1265, label %fixfast470, label %fixslow471
fixfast470:
  %t1266 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1255, i64 %t1262)
  %t1267 = extractvalue {i64, i1} %t1266, 0
  %t1268 = extractvalue {i64, i1} %t1266, 1
  br i1 %t1268, label %fixslow471, label %fixmerge472
fixslow471:
  %t1269 = call i64 @rt_add(i64 %t1255, i64 %t1262)
  br label %fixmerge472
fixmerge472:
  %t1270 = phi i64 [ %t1267, %fixfast470 ], [ %t1269, %fixslow471 ]
  %t1271 = load i64, ptr @"emit.internal:rd-hex"
  %t1272 = and i64 %t1271, -8
  %t1273 = inttoptr i64 %t1272 to ptr
  %t1274 = load i64, ptr %t1273
  %t1275 = inttoptr i64 %t1274 to ptr
  %t1276 = musttail call fastcc i64 %t1275(i64 %t1271, i64 4, i64 %a0, i64 %a1, i64 %t1246, i64 %t1270, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1276
else455:
  %t1277 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t1277
}

define fastcc i64 @"emit.internal:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1282 = icmp eq i64 %argc, 1
  br i1 %t1282, label %argok474, label %arityerr473
arityerr473:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok474:
  %t1283 = call i64 @rt_char_to_integer(i64 %a0)
  %t1284 = or i64 %t1283, 880
  %t1285 = and i64 %t1284, 7
  %t1286 = icmp eq i64 %t1285, 0
  br i1 %t1286, label %fixfast475, label %fixslow476
fixfast475:
  %t1287 = icmp eq i64 %t1283, 880
  %t1288 = select i1 %t1287, i64 257, i64 1
  br label %fixmerge477
fixslow476:
  %t1289 = call i64 @rt_num_eq(i64 %t1283, i64 880)
  br label %fixmerge477
fixmerge477:
  %t1290 = phi i64 [ %t1288, %fixfast475 ], [ %t1289, %fixslow476 ]
  %t1291 = icmp ne i64 %t1290, 1
  br i1 %t1291, label %then478, label %else479
then478:
  %t1292 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t1292
else479:
  %t1293 = or i64 %t1283, 928
  %t1294 = and i64 %t1293, 7
  %t1295 = icmp eq i64 %t1294, 0
  br i1 %t1295, label %fixfast480, label %fixslow481
fixfast480:
  %t1296 = icmp eq i64 %t1283, 928
  %t1297 = select i1 %t1296, i64 257, i64 1
  br label %fixmerge482
fixslow481:
  %t1298 = call i64 @rt_num_eq(i64 %t1283, i64 928)
  br label %fixmerge482
fixmerge482:
  %t1299 = phi i64 [ %t1297, %fixfast480 ], [ %t1298, %fixslow481 ]
  %t1300 = icmp ne i64 %t1299, 1
  br i1 %t1300, label %then483, label %else484
then483:
  %t1301 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t1301
else484:
  %t1302 = or i64 %t1283, 912
  %t1303 = and i64 %t1302, 7
  %t1304 = icmp eq i64 %t1303, 0
  br i1 %t1304, label %fixfast485, label %fixslow486
fixfast485:
  %t1305 = icmp eq i64 %t1283, 912
  %t1306 = select i1 %t1305, i64 257, i64 1
  br label %fixmerge487
fixslow486:
  %t1307 = call i64 @rt_num_eq(i64 %t1283, i64 912)
  br label %fixmerge487
fixmerge487:
  %t1308 = phi i64 [ %t1306, %fixfast485 ], [ %t1307, %fixslow486 ]
  %t1309 = icmp ne i64 %t1308, 1
  br i1 %t1309, label %then488, label %else489
then488:
  %t1310 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t1310
else489:
  ret i64 %a0
}

define fastcc i64 @"emit.internal:code_417"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1315 = icmp eq i64 %argc, 2
  br i1 %t1315, label %argok491, label %arityerr490
arityerr490:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok491:
  %t1316 = and i64 %self, -8
  %t1317 = inttoptr i64 %t1316 to ptr
  %t1318 = getelementptr i64, ptr %t1317, i64 1
  %t1319 = load i64, ptr %t1318
  %t1320 = or i64 %a0, %t1319
  %t1321 = and i64 %t1320, 7
  %t1322 = icmp eq i64 %t1321, 0
  br i1 %t1322, label %fixfast492, label %fixslow493
fixfast492:
  %t1323 = icmp slt i64 %a0, %t1319
  %t1324 = select i1 %t1323, i64 257, i64 1
  br label %fixmerge494
fixslow493:
  %t1325 = call i64 @rt_lt(i64 %a0, i64 %t1319)
  br label %fixmerge494
fixmerge494:
  %t1326 = phi i64 [ %t1324, %fixfast492 ], [ %t1325, %fixslow493 ]
  %t1327 = icmp ne i64 %t1326, 1
  br i1 %t1327, label %then495, label %else496
then495:
  %t1328 = and i64 %self, -8
  %t1329 = inttoptr i64 %t1328 to ptr
  %t1330 = getelementptr i64, ptr %t1329, i64 2
  %t1331 = load i64, ptr %t1330
  %t1332 = call i64 @rt_string_ref(i64 %t1331, i64 %a0)
  %t1333 = call i64 @rt_char_to_integer(i64 %t1332)
  %t1334 = or i64 %t1333, 272
  %t1335 = and i64 %t1334, 7
  %t1336 = icmp eq i64 %t1335, 0
  br i1 %t1336, label %fixfast497, label %fixslow498
fixfast497:
  %t1337 = icmp eq i64 %t1333, 272
  %t1338 = select i1 %t1337, i64 257, i64 1
  br label %fixmerge499
fixslow498:
  %t1339 = call i64 @rt_num_eq(i64 %t1333, i64 272)
  br label %fixmerge499
fixmerge499:
  %t1340 = phi i64 [ %t1338, %fixfast497 ], [ %t1339, %fixslow498 ]
  %t1341 = icmp ne i64 %t1340, 1
  br i1 %t1341, label %then500, label %else501
then500:
  %t1342 = load i64, ptr @"emit.internal:reverse"
  %t1343 = and i64 %t1342, -8
  %t1344 = inttoptr i64 %t1343 to ptr
  %t1345 = load i64, ptr %t1344
  %t1346 = inttoptr i64 %t1345 to ptr
  %t1347 = call fastcc i64%t1346(i64 %t1342, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1348 = call i64 @rt_list_to_string(i64 %t1347)
  %t1349 = or i64 %a0, 8
  %t1350 = and i64 %t1349, 7
  %t1351 = icmp eq i64 %t1350, 0
  br i1 %t1351, label %fixfast502, label %fixslow503
fixfast502:
  %t1352 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t1353 = extractvalue {i64, i1} %t1352, 0
  %t1354 = extractvalue {i64, i1} %t1352, 1
  br i1 %t1354, label %fixslow503, label %fixmerge504
fixslow503:
  %t1355 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge504
fixmerge504:
  %t1356 = phi i64 [ %t1353, %fixfast502 ], [ %t1355, %fixslow503 ]
  %t1357 = call i64 @rt_cons(i64 %t1348, i64 %t1356)
  ret i64 %t1357
else501:
  %t1358 = or i64 %t1333, 736
  %t1359 = and i64 %t1358, 7
  %t1360 = icmp eq i64 %t1359, 0
  br i1 %t1360, label %fixfast505, label %fixslow506
fixfast505:
  %t1361 = icmp eq i64 %t1333, 736
  %t1362 = select i1 %t1361, i64 257, i64 1
  br label %fixmerge507
fixslow506:
  %t1363 = call i64 @rt_num_eq(i64 %t1333, i64 736)
  br label %fixmerge507
fixmerge507:
  %t1364 = phi i64 [ %t1362, %fixfast505 ], [ %t1363, %fixslow506 ]
  %t1365 = icmp ne i64 %t1364, 1
  br i1 %t1365, label %then508, label %else509
then508:
  %t1366 = and i64 %self, -8
  %t1367 = inttoptr i64 %t1366 to ptr
  %t1368 = getelementptr i64, ptr %t1367, i64 2
  %t1369 = load i64, ptr %t1368
  %t1370 = or i64 %a0, 8
  %t1371 = and i64 %t1370, 7
  %t1372 = icmp eq i64 %t1371, 0
  br i1 %t1372, label %fixfast510, label %fixslow511
fixfast510:
  %t1373 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t1374 = extractvalue {i64, i1} %t1373, 0
  %t1375 = extractvalue {i64, i1} %t1373, 1
  br i1 %t1375, label %fixslow511, label %fixmerge512
fixslow511:
  %t1376 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge512
fixmerge512:
  %t1377 = phi i64 [ %t1374, %fixfast510 ], [ %t1376, %fixslow511 ]
  %t1378 = call i64 @rt_string_ref(i64 %t1369, i64 %t1377)
  %t1379 = call i64 @rt_char_to_integer(i64 %t1378)
  %t1380 = or i64 %t1379, 960
  %t1381 = and i64 %t1380, 7
  %t1382 = icmp eq i64 %t1381, 0
  br i1 %t1382, label %fixfast513, label %fixslow514
fixfast513:
  %t1383 = icmp eq i64 %t1379, 960
  %t1384 = select i1 %t1383, i64 257, i64 1
  br label %fixmerge515
fixslow514:
  %t1385 = call i64 @rt_num_eq(i64 %t1379, i64 960)
  br label %fixmerge515
fixmerge515:
  %t1386 = phi i64 [ %t1384, %fixfast513 ], [ %t1385, %fixslow514 ]
  %t1387 = icmp ne i64 %t1386, 1
  br i1 %t1387, label %then516, label %else517
then516:
  %t1388 = and i64 %self, -8
  %t1389 = inttoptr i64 %t1388 to ptr
  %t1390 = getelementptr i64, ptr %t1389, i64 2
  %t1391 = load i64, ptr %t1390
  %t1392 = and i64 %self, -8
  %t1393 = inttoptr i64 %t1392 to ptr
  %t1394 = getelementptr i64, ptr %t1393, i64 1
  %t1395 = load i64, ptr %t1394
  %t1396 = or i64 %a0, 16
  %t1397 = and i64 %t1396, 7
  %t1398 = icmp eq i64 %t1397, 0
  br i1 %t1398, label %fixfast518, label %fixslow519
fixfast518:
  %t1399 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t1400 = extractvalue {i64, i1} %t1399, 0
  %t1401 = extractvalue {i64, i1} %t1399, 1
  br i1 %t1401, label %fixslow519, label %fixmerge520
fixslow519:
  %t1402 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge520
fixmerge520:
  %t1403 = phi i64 [ %t1400, %fixfast518 ], [ %t1402, %fixslow519 ]
  %t1404 = load i64, ptr @"emit.internal:rd-hex"
  %t1405 = and i64 %t1404, -8
  %t1406 = inttoptr i64 %t1405 to ptr
  %t1407 = load i64, ptr %t1406
  %t1408 = inttoptr i64 %t1407 to ptr
  %t1409 = call fastcc i64%t1408(i64 %t1404, i64 4, i64 %t1391, i64 %t1395, i64 %t1403, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1410 = call i64 @rt_cdr(i64 %t1409)
  %t1411 = call i64 @rt_car(i64 %t1409)
  %t1412 = call i64 @rt_integer_to_char(i64 %t1411)
  %t1413 = call i64 @rt_cons(i64 %t1412, i64 %a1)
  %t1414 = musttail call fastcc i64 @"emit.internal:code_417"(i64 %self, i64 2, i64 %t1410, i64 %t1413, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1414
else517:
  %t1415 = or i64 %a0, 16
  %t1416 = and i64 %t1415, 7
  %t1417 = icmp eq i64 %t1416, 0
  br i1 %t1417, label %fixfast521, label %fixslow522
fixfast521:
  %t1418 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t1419 = extractvalue {i64, i1} %t1418, 0
  %t1420 = extractvalue {i64, i1} %t1418, 1
  br i1 %t1420, label %fixslow522, label %fixmerge523
fixslow522:
  %t1421 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge523
fixmerge523:
  %t1422 = phi i64 [ %t1419, %fixfast521 ], [ %t1421, %fixslow522 ]
  %t1423 = load i64, ptr @"emit.internal:rd-str-esc"
  %t1424 = and i64 %t1423, -8
  %t1425 = inttoptr i64 %t1424 to ptr
  %t1426 = load i64, ptr %t1425
  %t1427 = inttoptr i64 %t1426 to ptr
  %t1428 = call fastcc i64%t1427(i64 %t1423, i64 1, i64 %t1378, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1429 = call i64 @rt_cons(i64 %t1428, i64 %a1)
  %t1430 = musttail call fastcc i64 @"emit.internal:code_417"(i64 %self, i64 2, i64 %t1422, i64 %t1429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1430
else509:
  %t1431 = or i64 %a0, 8
  %t1432 = and i64 %t1431, 7
  %t1433 = icmp eq i64 %t1432, 0
  br i1 %t1433, label %fixfast524, label %fixslow525
fixfast524:
  %t1434 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t1435 = extractvalue {i64, i1} %t1434, 0
  %t1436 = extractvalue {i64, i1} %t1434, 1
  br i1 %t1436, label %fixslow525, label %fixmerge526
fixslow525:
  %t1437 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge526
fixmerge526:
  %t1438 = phi i64 [ %t1435, %fixfast524 ], [ %t1437, %fixslow525 ]
  %t1439 = call i64 @rt_cons(i64 %t1332, i64 %a1)
  %t1440 = musttail call fastcc i64 @"emit.internal:code_417"(i64 %self, i64 2, i64 %t1438, i64 %t1439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1440
else496:
  %t1441 = load i64, ptr @"emit.internal:reverse"
  %t1442 = and i64 %t1441, -8
  %t1443 = inttoptr i64 %t1442 to ptr
  %t1444 = load i64, ptr %t1443
  %t1445 = inttoptr i64 %t1444 to ptr
  %t1446 = call fastcc i64%t1445(i64 %t1441, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1447 = call i64 @rt_list_to_string(i64 %t1446)
  %t1448 = call i64 @rt_cons(i64 %t1447, i64 %a0)
  ret i64 %t1448
}

define fastcc i64 @"emit.internal:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1449 = icmp eq i64 %argc, 3
  br i1 %t1449, label %argok528, label %arityerr527
arityerr527:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok528:
  %t1450 = call ptr @rt_alloc_words(i64 4)
  %t1451 = ptrtoint ptr %t1450 to i64
  store i64 ptrtoint (ptr @"emit.internal:code_417" to i64), ptr %t1450
  %t1452 = or i64 %t1451, 4
  %t1453 = getelementptr i64, ptr %t1450, i64 1
  store i64 %a1, ptr %t1453
  %t1454 = getelementptr i64, ptr %t1450, i64 2
  store i64 %a0, ptr %t1454
  %t1455 = getelementptr i64, ptr %t1450, i64 3
  store i64 %t1452, ptr %t1455
  %t1456 = musttail call fastcc i64 @"emit.internal:code_417"(i64 %t1452, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1456
}

define fastcc i64 @"emit.internal:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1461 = icmp eq i64 %argc, 3
  br i1 %t1461, label %argok530, label %arityerr529
arityerr529:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok530:
  %t1462 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1463 = call i64 @rt_char_to_integer(i64 %t1462)
  %t1464 = or i64 %t1463, 928
  %t1465 = and i64 %t1464, 7
  %t1466 = icmp eq i64 %t1465, 0
  br i1 %t1466, label %fixfast531, label %fixslow532
fixfast531:
  %t1467 = icmp eq i64 %t1463, 928
  %t1468 = select i1 %t1467, i64 257, i64 1
  br label %fixmerge533
fixslow532:
  %t1469 = call i64 @rt_num_eq(i64 %t1463, i64 928)
  br label %fixmerge533
fixmerge533:
  %t1470 = phi i64 [ %t1468, %fixfast531 ], [ %t1469, %fixslow532 ]
  %t1471 = icmp ne i64 %t1470, 1
  br i1 %t1471, label %then534, label %else535
then534:
  %t1472 = or i64 %a2, 8
  %t1473 = and i64 %t1472, 7
  %t1474 = icmp eq i64 %t1473, 0
  br i1 %t1474, label %fixfast536, label %fixslow537
fixfast536:
  %t1475 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1476 = extractvalue {i64, i1} %t1475, 0
  %t1477 = extractvalue {i64, i1} %t1475, 1
  br i1 %t1477, label %fixslow537, label %fixmerge538
fixslow537:
  %t1478 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge538
fixmerge538:
  %t1479 = phi i64 [ %t1476, %fixfast536 ], [ %t1478, %fixslow537 ]
  %t1480 = call i64 @rt_cons(i64 257, i64 %t1479)
  ret i64 %t1480
else535:
  %t1481 = or i64 %t1463, 816
  %t1482 = and i64 %t1481, 7
  %t1483 = icmp eq i64 %t1482, 0
  br i1 %t1483, label %fixfast539, label %fixslow540
fixfast539:
  %t1484 = icmp eq i64 %t1463, 816
  %t1485 = select i1 %t1484, i64 257, i64 1
  br label %fixmerge541
fixslow540:
  %t1486 = call i64 @rt_num_eq(i64 %t1463, i64 816)
  br label %fixmerge541
fixmerge541:
  %t1487 = phi i64 [ %t1485, %fixfast539 ], [ %t1486, %fixslow540 ]
  %t1488 = icmp ne i64 %t1487, 1
  br i1 %t1488, label %then542, label %else543
then542:
  %t1489 = or i64 %a2, 8
  %t1490 = and i64 %t1489, 7
  %t1491 = icmp eq i64 %t1490, 0
  br i1 %t1491, label %fixfast544, label %fixslow545
fixfast544:
  %t1492 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1493 = extractvalue {i64, i1} %t1492, 0
  %t1494 = extractvalue {i64, i1} %t1492, 1
  br i1 %t1494, label %fixslow545, label %fixmerge546
fixslow545:
  %t1495 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge546
fixmerge546:
  %t1496 = phi i64 [ %t1493, %fixfast544 ], [ %t1495, %fixslow545 ]
  %t1497 = call i64 @rt_cons(i64 1, i64 %t1496)
  ret i64 %t1497
else543:
  %t1498 = or i64 %t1463, 736
  %t1499 = and i64 %t1498, 7
  %t1500 = icmp eq i64 %t1499, 0
  br i1 %t1500, label %fixfast547, label %fixslow548
fixfast547:
  %t1501 = icmp eq i64 %t1463, 736
  %t1502 = select i1 %t1501, i64 257, i64 1
  br label %fixmerge549
fixslow548:
  %t1503 = call i64 @rt_num_eq(i64 %t1463, i64 736)
  br label %fixmerge549
fixmerge549:
  %t1504 = phi i64 [ %t1502, %fixfast547 ], [ %t1503, %fixslow548 ]
  %t1505 = icmp ne i64 %t1504, 1
  br i1 %t1505, label %then550, label %else551
then550:
  %t1506 = load i64, ptr @"emit.internal:rd-char"
  %t1507 = and i64 %t1506, -8
  %t1508 = inttoptr i64 %t1507 to ptr
  %t1509 = load i64, ptr %t1508
  %t1510 = inttoptr i64 %t1509 to ptr
  %t1511 = musttail call fastcc i64 %t1510(i64 %t1506, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1511
else551:
  %t1512 = or i64 %t1463, 320
  %t1513 = and i64 %t1512, 7
  %t1514 = icmp eq i64 %t1513, 0
  br i1 %t1514, label %fixfast552, label %fixslow553
fixfast552:
  %t1515 = icmp eq i64 %t1463, 320
  %t1516 = select i1 %t1515, i64 257, i64 1
  br label %fixmerge554
fixslow553:
  %t1517 = call i64 @rt_num_eq(i64 %t1463, i64 320)
  br label %fixmerge554
fixmerge554:
  %t1518 = phi i64 [ %t1516, %fixfast552 ], [ %t1517, %fixslow553 ]
  %t1519 = icmp ne i64 %t1518, 1
  br i1 %t1519, label %then555, label %else556
then555:
  %t1520 = or i64 %a2, 8
  %t1521 = and i64 %t1520, 7
  %t1522 = icmp eq i64 %t1521, 0
  br i1 %t1522, label %fixfast557, label %fixslow558
fixfast557:
  %t1523 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1524 = extractvalue {i64, i1} %t1523, 0
  %t1525 = extractvalue {i64, i1} %t1523, 1
  br i1 %t1525, label %fixslow558, label %fixmerge559
fixslow558:
  %t1526 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge559
fixmerge559:
  %t1527 = phi i64 [ %t1524, %fixfast557 ], [ %t1526, %fixslow558 ]
  %t1528 = load i64, ptr @"emit.internal:rd-list"
  %t1529 = and i64 %t1528, -8
  %t1530 = inttoptr i64 %t1529 to ptr
  %t1531 = load i64, ptr %t1530
  %t1532 = inttoptr i64 %t1531 to ptr
  %t1533 = call fastcc i64%t1532(i64 %t1528, i64 4, i64 %a0, i64 %a1, i64 %t1527, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1534 = call i64 @rt_car(i64 %t1533)
  %t1535 = load i64, ptr @"emit.internal:list->vector"
  %t1536 = and i64 %t1535, -8
  %t1537 = inttoptr i64 %t1536 to ptr
  %t1538 = load i64, ptr %t1537
  %t1539 = inttoptr i64 %t1538 to ptr
  %t1540 = call fastcc i64%t1539(i64 %t1535, i64 1, i64 %t1534, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1541 = call i64 @rt_cdr(i64 %t1533)
  %t1542 = call i64 @rt_cons(i64 %t1540, i64 %t1541)
  ret i64 %t1542
else556:
  %t1543 = or i64 %t1463, 936
  %t1544 = and i64 %t1543, 7
  %t1545 = icmp eq i64 %t1544, 0
  br i1 %t1545, label %fixfast560, label %fixslow561
fixfast560:
  %t1546 = icmp eq i64 %t1463, 936
  %t1547 = select i1 %t1546, i64 257, i64 1
  br label %fixmerge562
fixslow561:
  %t1548 = call i64 @rt_num_eq(i64 %t1463, i64 936)
  br label %fixmerge562
fixmerge562:
  %t1549 = phi i64 [ %t1547, %fixfast560 ], [ %t1548, %fixslow561 ]
  %t1550 = icmp ne i64 %t1549, 1
  br i1 %t1550, label %then563, label %else564
then563:
  %t1551 = or i64 %a2, 16
  %t1552 = and i64 %t1551, 7
  %t1553 = icmp eq i64 %t1552, 0
  br i1 %t1553, label %fixfast566, label %fixslow567
fixfast566:
  %t1554 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1555 = extractvalue {i64, i1} %t1554, 0
  %t1556 = extractvalue {i64, i1} %t1554, 1
  br i1 %t1556, label %fixslow567, label %fixmerge568
fixslow567:
  %t1557 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge568
fixmerge568:
  %t1558 = phi i64 [ %t1555, %fixfast566 ], [ %t1557, %fixslow567 ]
  %t1559 = or i64 %t1558, %a1
  %t1560 = and i64 %t1559, 7
  %t1561 = icmp eq i64 %t1560, 0
  br i1 %t1561, label %fixfast569, label %fixslow570
fixfast569:
  %t1562 = icmp slt i64 %t1558, %a1
  %t1563 = select i1 %t1562, i64 257, i64 1
  br label %fixmerge571
fixslow570:
  %t1564 = call i64 @rt_lt(i64 %t1558, i64 %a1)
  br label %fixmerge571
fixmerge571:
  %t1565 = phi i64 [ %t1563, %fixfast569 ], [ %t1564, %fixslow570 ]
  %t1566 = icmp ne i64 %t1565, 1
  br i1 %t1566, label %then572, label %else573
then572:
  %t1567 = or i64 %a2, 8
  %t1568 = and i64 %t1567, 7
  %t1569 = icmp eq i64 %t1568, 0
  br i1 %t1569, label %fixfast575, label %fixslow576
fixfast575:
  %t1570 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1571 = extractvalue {i64, i1} %t1570, 0
  %t1572 = extractvalue {i64, i1} %t1570, 1
  br i1 %t1572, label %fixslow576, label %fixmerge577
fixslow576:
  %t1573 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge577
fixmerge577:
  %t1574 = phi i64 [ %t1571, %fixfast575 ], [ %t1573, %fixslow576 ]
  %t1575 = call i64 @rt_string_ref(i64 %a0, i64 %t1574)
  %t1576 = call i64 @rt_char_to_integer(i64 %t1575)
  %t1577 = or i64 %t1576, 448
  %t1578 = and i64 %t1577, 7
  %t1579 = icmp eq i64 %t1578, 0
  br i1 %t1579, label %fixfast578, label %fixslow579
fixfast578:
  %t1580 = icmp eq i64 %t1576, 448
  %t1581 = select i1 %t1580, i64 257, i64 1
  br label %fixmerge580
fixslow579:
  %t1582 = call i64 @rt_num_eq(i64 %t1576, i64 448)
  br label %fixmerge580
fixmerge580:
  %t1583 = phi i64 [ %t1581, %fixfast578 ], [ %t1582, %fixslow579 ]
  %t1584 = icmp ne i64 %t1583, 1
  br i1 %t1584, label %then581, label %else582
then581:
  %t1585 = or i64 %a2, 16
  %t1586 = and i64 %t1585, 7
  %t1587 = icmp eq i64 %t1586, 0
  br i1 %t1587, label %fixfast584, label %fixslow585
fixfast584:
  %t1588 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t1589 = extractvalue {i64, i1} %t1588, 0
  %t1590 = extractvalue {i64, i1} %t1588, 1
  br i1 %t1590, label %fixslow585, label %fixmerge586
fixslow585:
  %t1591 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge586
fixmerge586:
  %t1592 = phi i64 [ %t1589, %fixfast584 ], [ %t1591, %fixslow585 ]
  %t1593 = call i64 @rt_string_ref(i64 %a0, i64 %t1592)
  %t1594 = call i64 @rt_char_to_integer(i64 %t1593)
  %t1595 = or i64 %t1594, 320
  %t1596 = and i64 %t1595, 7
  %t1597 = icmp eq i64 %t1596, 0
  br i1 %t1597, label %fixfast587, label %fixslow588
fixfast587:
  %t1598 = icmp eq i64 %t1594, 320
  %t1599 = select i1 %t1598, i64 257, i64 1
  br label %fixmerge589
fixslow588:
  %t1600 = call i64 @rt_num_eq(i64 %t1594, i64 320)
  br label %fixmerge589
fixmerge589:
  %t1601 = phi i64 [ %t1599, %fixfast587 ], [ %t1600, %fixslow588 ]
  br label %merge583
else582:
  br label %merge583
merge583:
  %t1602 = phi i64 [ %t1601, %fixmerge589 ], [ 1, %else582 ]
  br label %merge574
else573:
  br label %merge574
merge574:
  %t1603 = phi i64 [ %t1602, %merge583 ], [ 1, %else573 ]
  br label %merge565
else564:
  br label %merge565
merge565:
  %t1604 = phi i64 [ %t1603, %merge574 ], [ 1, %else564 ]
  %t1605 = icmp ne i64 %t1604, 1
  br i1 %t1605, label %then590, label %else591
then590:
  %t1606 = or i64 %a2, 24
  %t1607 = and i64 %t1606, 7
  %t1608 = icmp eq i64 %t1607, 0
  br i1 %t1608, label %fixfast592, label %fixslow593
fixfast592:
  %t1609 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t1610 = extractvalue {i64, i1} %t1609, 0
  %t1611 = extractvalue {i64, i1} %t1609, 1
  br i1 %t1611, label %fixslow593, label %fixmerge594
fixslow593:
  %t1612 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge594
fixmerge594:
  %t1613 = phi i64 [ %t1610, %fixfast592 ], [ %t1612, %fixslow593 ]
  %t1614 = load i64, ptr @"emit.internal:rd-list"
  %t1615 = and i64 %t1614, -8
  %t1616 = inttoptr i64 %t1615 to ptr
  %t1617 = load i64, ptr %t1616
  %t1618 = inttoptr i64 %t1617 to ptr
  %t1619 = call fastcc i64%t1618(i64 %t1614, i64 4, i64 %a0, i64 %a1, i64 %t1613, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1620 = call i64 @rt_car(i64 %t1619)
  %t1621 = load i64, ptr @"emit.internal:list->bytevector"
  %t1622 = and i64 %t1621, -8
  %t1623 = inttoptr i64 %t1622 to ptr
  %t1624 = load i64, ptr %t1623
  %t1625 = inttoptr i64 %t1624 to ptr
  %t1626 = call fastcc i64%t1625(i64 %t1621, i64 1, i64 %t1620, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1627 = call i64 @rt_cdr(i64 %t1619)
  %t1628 = call i64 @rt_cons(i64 %t1626, i64 %t1627)
  ret i64 %t1628
else591:
  %t1629 = load i64, ptr @"emit.internal:rd-token-end"
  %t1630 = and i64 %t1629, -8
  %t1631 = inttoptr i64 %t1630 to ptr
  %t1632 = load i64, ptr %t1631
  %t1633 = inttoptr i64 %t1632 to ptr
  %t1634 = call fastcc i64%t1633(i64 %t1629, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1635 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t1634)
  %t1636 = call i64 @rt_string_to_symbol(i64 %t1635)
  %t1637 = call i64 @rt_cons(i64 %t1636, i64 %t1634)
  ret i64 %t1637
}

define fastcc i64 @"emit.internal:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1642 = icmp eq i64 %argc, 1
  br i1 %t1642, label %argok596, label %arityerr595
arityerr595:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok596:
  %t1643 = call i64 @rt_make_string(ptr @.str.lit.6, i64 5)
  %t1644 = call i64 @rt_string_eq(i64 %a0, i64 %t1643)
  %t1645 = icmp ne i64 %t1644, 1
  br i1 %t1645, label %then597, label %else598
then597:
  %t1646 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t1646
else598:
  %t1647 = call i64 @rt_make_string(ptr @.str.lit.7, i64 7)
  %t1648 = call i64 @rt_string_eq(i64 %a0, i64 %t1647)
  %t1649 = icmp ne i64 %t1648, 1
  br i1 %t1649, label %then599, label %else600
then599:
  %t1650 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t1650
else600:
  %t1651 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t1652 = call i64 @rt_string_eq(i64 %a0, i64 %t1651)
  %t1653 = icmp ne i64 %t1652, 1
  br i1 %t1653, label %then601, label %else602
then601:
  %t1654 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t1654
else602:
  %t1655 = call i64 @rt_make_string(ptr @.str.lit.9, i64 6)
  %t1656 = call i64 @rt_string_eq(i64 %a0, i64 %t1655)
  %t1657 = icmp ne i64 %t1656, 1
  br i1 %t1657, label %then603, label %else604
then603:
  %t1658 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t1658
else604:
  %t1659 = call i64 @rt_make_string(ptr @.str.lit.10, i64 3)
  %t1660 = call i64 @rt_string_eq(i64 %a0, i64 %t1659)
  %t1661 = icmp ne i64 %t1660, 1
  br i1 %t1661, label %then605, label %else606
then605:
  %t1662 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t1662
else606:
  %t1663 = call i64 @rt_make_string(ptr @.str.lit.11, i64 4)
  %t1664 = call i64 @rt_string_eq(i64 %a0, i64 %t1663)
  %t1665 = icmp ne i64 %t1664, 1
  br i1 %t1665, label %then607, label %else608
then607:
  %t1666 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t1666
else608:
  %t1667 = call i64 @rt_make_string(ptr @.str.lit.12, i64 6)
  %t1668 = call i64 @rt_string_eq(i64 %a0, i64 %t1667)
  %t1669 = icmp ne i64 %t1668, 1
  br i1 %t1669, label %then609, label %else610
then609:
  %t1670 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t1670
else610:
  %t1671 = call i64 @rt_make_string(ptr @.str.lit.13, i64 7)
  %t1672 = call i64 @rt_string_eq(i64 %a0, i64 %t1671)
  %t1673 = icmp ne i64 %t1672, 1
  br i1 %t1673, label %then611, label %else612
then611:
  %t1674 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t1674
else612:
  %t1675 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t1676 = call i64 @rt_string_eq(i64 %a0, i64 %t1675)
  %t1677 = icmp ne i64 %t1676, 1
  br i1 %t1677, label %then613, label %else614
then613:
  %t1678 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t1678
else614:
  %t1679 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t1679
}

define fastcc i64 @"emit.internal:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1684 = icmp eq i64 %argc, 3
  br i1 %t1684, label %argok616, label %arityerr615
arityerr615:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok616:
  %t1685 = or i64 %a2, 8
  %t1686 = and i64 %t1685, 7
  %t1687 = icmp eq i64 %t1686, 0
  br i1 %t1687, label %fixfast617, label %fixslow618
fixfast617:
  %t1688 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1689 = extractvalue {i64, i1} %t1688, 0
  %t1690 = extractvalue {i64, i1} %t1688, 1
  br i1 %t1690, label %fixslow618, label %fixmerge619
fixslow618:
  %t1691 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge619
fixmerge619:
  %t1692 = phi i64 [ %t1689, %fixfast617 ], [ %t1691, %fixslow618 ]
  %t1693 = or i64 %t1692, 8
  %t1694 = and i64 %t1693, 7
  %t1695 = icmp eq i64 %t1694, 0
  br i1 %t1695, label %fixfast620, label %fixslow621
fixfast620:
  %t1696 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1692, i64 8)
  %t1697 = extractvalue {i64, i1} %t1696, 0
  %t1698 = extractvalue {i64, i1} %t1696, 1
  br i1 %t1698, label %fixslow621, label %fixmerge622
fixslow621:
  %t1699 = call i64 @rt_add(i64 %t1692, i64 8)
  br label %fixmerge622
fixmerge622:
  %t1700 = phi i64 [ %t1697, %fixfast620 ], [ %t1699, %fixslow621 ]
  %t1701 = load i64, ptr @"emit.internal:rd-token-end"
  %t1702 = and i64 %t1701, -8
  %t1703 = inttoptr i64 %t1702 to ptr
  %t1704 = load i64, ptr %t1703
  %t1705 = inttoptr i64 %t1704 to ptr
  %t1706 = call fastcc i64%t1705(i64 %t1701, i64 3, i64 %a0, i64 %a1, i64 %t1700, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1707 = call i64 @rt_substring(i64 %a0, i64 %t1692, i64 %t1706)
  %t1708 = call i64 @rt_string_length(i64 %t1707)
  %t1709 = or i64 %t1708, 8
  %t1710 = and i64 %t1709, 7
  %t1711 = icmp eq i64 %t1710, 0
  br i1 %t1711, label %fixfast623, label %fixslow624
fixfast623:
  %t1712 = icmp eq i64 %t1708, 8
  %t1713 = select i1 %t1712, i64 257, i64 1
  br label %fixmerge625
fixslow624:
  %t1714 = call i64 @rt_num_eq(i64 %t1708, i64 8)
  br label %fixmerge625
fixmerge625:
  %t1715 = phi i64 [ %t1713, %fixfast623 ], [ %t1714, %fixslow624 ]
  %t1716 = icmp ne i64 %t1715, 1
  br i1 %t1716, label %then626, label %else627
then626:
  %t1717 = call i64 @rt_string_ref(i64 %a0, i64 %t1692)
  %t1718 = call i64 @rt_cons(i64 %t1717, i64 %t1706)
  ret i64 %t1718
else627:
  %t1719 = load i64, ptr @"emit.internal:rd-char-name"
  %t1720 = and i64 %t1719, -8
  %t1721 = inttoptr i64 %t1720 to ptr
  %t1722 = load i64, ptr %t1721
  %t1723 = inttoptr i64 %t1722 to ptr
  %t1724 = call fastcc i64%t1723(i64 %t1719, i64 1, i64 %t1707, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1725 = call i64 @rt_cons(i64 %t1724, i64 %t1706)
  ret i64 %t1725
}

define fastcc i64 @"emit.internal:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1730 = icmp eq i64 %argc, 3
  br i1 %t1730, label %argok629, label %arityerr628
arityerr628:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok629:
  %t1731 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1732 = and i64 %t1731, -8
  %t1733 = inttoptr i64 %t1732 to ptr
  %t1734 = load i64, ptr %t1733
  %t1735 = inttoptr i64 %t1734 to ptr
  %t1736 = call fastcc i64%t1735(i64 %t1731, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1737 = load i64, ptr @"emit.internal:rd-datum"
  %t1738 = and i64 %t1737, -8
  %t1739 = inttoptr i64 %t1738 to ptr
  %t1740 = load i64, ptr %t1739
  %t1741 = inttoptr i64 %t1740 to ptr
  %t1742 = call fastcc i64%t1741(i64 %t1737, i64 3, i64 %a0, i64 %a1, i64 %t1736, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1743 = call i64 @rt_intern(ptr @.str.sym.15)
  %t1744 = call i64 @rt_car(i64 %t1742)
  %t1745 = load i64, ptr @"emit.internal:list"
  %t1746 = and i64 %t1745, -8
  %t1747 = inttoptr i64 %t1746 to ptr
  %t1748 = load i64, ptr %t1747
  %t1749 = inttoptr i64 %t1748 to ptr
  %t1750 = call fastcc i64%t1749(i64 %t1745, i64 2, i64 %t1743, i64 %t1744, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1751 = call i64 @rt_cdr(i64 %t1742)
  %t1752 = call i64 @rt_cons(i64 %t1750, i64 %t1751)
  ret i64 %t1752
}

define fastcc i64 @"emit.internal:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1757 = icmp eq i64 %argc, 3
  br i1 %t1757, label %argok631, label %arityerr630
arityerr630:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok631:
  %t1758 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1759 = and i64 %t1758, -8
  %t1760 = inttoptr i64 %t1759 to ptr
  %t1761 = load i64, ptr %t1760
  %t1762 = inttoptr i64 %t1761 to ptr
  %t1763 = call fastcc i64%t1762(i64 %t1758, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1764 = load i64, ptr @"emit.internal:rd-datum"
  %t1765 = and i64 %t1764, -8
  %t1766 = inttoptr i64 %t1765 to ptr
  %t1767 = load i64, ptr %t1766
  %t1768 = inttoptr i64 %t1767 to ptr
  %t1769 = call fastcc i64%t1768(i64 %t1764, i64 3, i64 %a0, i64 %a1, i64 %t1763, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1770 = call i64 @rt_intern(ptr @.str.sym.16)
  %t1771 = call i64 @rt_car(i64 %t1769)
  %t1772 = load i64, ptr @"emit.internal:list"
  %t1773 = and i64 %t1772, -8
  %t1774 = inttoptr i64 %t1773 to ptr
  %t1775 = load i64, ptr %t1774
  %t1776 = inttoptr i64 %t1775 to ptr
  %t1777 = call fastcc i64%t1776(i64 %t1772, i64 2, i64 %t1770, i64 %t1771, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1778 = call i64 @rt_cdr(i64 %t1769)
  %t1779 = call i64 @rt_cons(i64 %t1777, i64 %t1778)
  ret i64 %t1779
}

define fastcc i64 @"emit.internal:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1784 = icmp eq i64 %argc, 3
  br i1 %t1784, label %argok633, label %arityerr632
arityerr632:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok633:
  %t1785 = or i64 %a2, %a1
  %t1786 = and i64 %t1785, 7
  %t1787 = icmp eq i64 %t1786, 0
  br i1 %t1787, label %fixfast634, label %fixslow635
fixfast634:
  %t1788 = icmp slt i64 %a2, %a1
  %t1789 = select i1 %t1788, i64 257, i64 1
  br label %fixmerge636
fixslow635:
  %t1790 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge636
fixmerge636:
  %t1791 = phi i64 [ %t1789, %fixfast634 ], [ %t1790, %fixslow635 ]
  %t1792 = icmp ne i64 %t1791, 1
  br i1 %t1792, label %then637, label %else638
then637:
  %t1793 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1794 = call i64 @rt_char_to_integer(i64 %t1793)
  %t1795 = or i64 %t1794, 512
  %t1796 = and i64 %t1795, 7
  %t1797 = icmp eq i64 %t1796, 0
  br i1 %t1797, label %fixfast640, label %fixslow641
fixfast640:
  %t1798 = icmp eq i64 %t1794, 512
  %t1799 = select i1 %t1798, i64 257, i64 1
  br label %fixmerge642
fixslow641:
  %t1800 = call i64 @rt_num_eq(i64 %t1794, i64 512)
  br label %fixmerge642
fixmerge642:
  %t1801 = phi i64 [ %t1799, %fixfast640 ], [ %t1800, %fixslow641 ]
  br label %merge639
else638:
  br label %merge639
merge639:
  %t1802 = phi i64 [ %t1801, %fixmerge642 ], [ 1, %else638 ]
  %t1803 = icmp ne i64 %t1802, 1
  br i1 %t1803, label %then643, label %else644
then643:
  %t1804 = or i64 %a2, 8
  %t1805 = and i64 %t1804, 7
  %t1806 = icmp eq i64 %t1805, 0
  br i1 %t1806, label %fixfast645, label %fixslow646
fixfast645:
  %t1807 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1808 = extractvalue {i64, i1} %t1807, 0
  %t1809 = extractvalue {i64, i1} %t1807, 1
  br i1 %t1809, label %fixslow646, label %fixmerge647
fixslow646:
  %t1810 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge647
fixmerge647:
  %t1811 = phi i64 [ %t1808, %fixfast645 ], [ %t1810, %fixslow646 ]
  %t1812 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1813 = and i64 %t1812, -8
  %t1814 = inttoptr i64 %t1813 to ptr
  %t1815 = load i64, ptr %t1814
  %t1816 = inttoptr i64 %t1815 to ptr
  %t1817 = call fastcc i64%t1816(i64 %t1812, i64 3, i64 %a0, i64 %a1, i64 %t1811, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1818 = load i64, ptr @"emit.internal:rd-datum"
  %t1819 = and i64 %t1818, -8
  %t1820 = inttoptr i64 %t1819 to ptr
  %t1821 = load i64, ptr %t1820
  %t1822 = inttoptr i64 %t1821 to ptr
  %t1823 = call fastcc i64%t1822(i64 %t1818, i64 3, i64 %a0, i64 %a1, i64 %t1817, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1824 = call i64 @rt_intern(ptr @.str.sym.17)
  %t1825 = call i64 @rt_car(i64 %t1823)
  %t1826 = load i64, ptr @"emit.internal:list"
  %t1827 = and i64 %t1826, -8
  %t1828 = inttoptr i64 %t1827 to ptr
  %t1829 = load i64, ptr %t1828
  %t1830 = inttoptr i64 %t1829 to ptr
  %t1831 = call fastcc i64%t1830(i64 %t1826, i64 2, i64 %t1824, i64 %t1825, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1832 = call i64 @rt_cdr(i64 %t1823)
  %t1833 = call i64 @rt_cons(i64 %t1831, i64 %t1832)
  ret i64 %t1833
else644:
  %t1834 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1835 = and i64 %t1834, -8
  %t1836 = inttoptr i64 %t1835 to ptr
  %t1837 = load i64, ptr %t1836
  %t1838 = inttoptr i64 %t1837 to ptr
  %t1839 = call fastcc i64%t1838(i64 %t1834, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1840 = load i64, ptr @"emit.internal:rd-datum"
  %t1841 = and i64 %t1840, -8
  %t1842 = inttoptr i64 %t1841 to ptr
  %t1843 = load i64, ptr %t1842
  %t1844 = inttoptr i64 %t1843 to ptr
  %t1845 = call fastcc i64%t1844(i64 %t1840, i64 3, i64 %a0, i64 %a1, i64 %t1839, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1846 = call i64 @rt_intern(ptr @.str.sym.18)
  %t1847 = call i64 @rt_car(i64 %t1845)
  %t1848 = load i64, ptr @"emit.internal:list"
  %t1849 = and i64 %t1848, -8
  %t1850 = inttoptr i64 %t1849 to ptr
  %t1851 = load i64, ptr %t1850
  %t1852 = inttoptr i64 %t1851 to ptr
  %t1853 = call fastcc i64%t1852(i64 %t1848, i64 2, i64 %t1846, i64 %t1847, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1854 = call i64 @rt_cdr(i64 %t1845)
  %t1855 = call i64 @rt_cons(i64 %t1853, i64 %t1854)
  ret i64 %t1855
}

define fastcc i64 @"emit.internal:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1860 = icmp eq i64 %argc, 3
  br i1 %t1860, label %argok649, label %arityerr648
arityerr648:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok649:
  %t1861 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1862 = call i64 @rt_char_to_integer(i64 %t1861)
  %t1863 = or i64 %t1862, 368
  %t1864 = and i64 %t1863, 7
  %t1865 = icmp eq i64 %t1864, 0
  br i1 %t1865, label %fixfast650, label %fixslow651
fixfast650:
  %t1866 = icmp eq i64 %t1862, 368
  %t1867 = select i1 %t1866, i64 257, i64 1
  br label %fixmerge652
fixslow651:
  %t1868 = call i64 @rt_num_eq(i64 %t1862, i64 368)
  br label %fixmerge652
fixmerge652:
  %t1869 = phi i64 [ %t1867, %fixfast650 ], [ %t1868, %fixslow651 ]
  %t1870 = icmp ne i64 %t1869, 1
  br i1 %t1870, label %then653, label %else654
then653:
  %t1871 = or i64 %a2, 8
  %t1872 = and i64 %t1871, 7
  %t1873 = icmp eq i64 %t1872, 0
  br i1 %t1873, label %fixfast655, label %fixslow656
fixfast655:
  %t1874 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1875 = extractvalue {i64, i1} %t1874, 0
  %t1876 = extractvalue {i64, i1} %t1874, 1
  br i1 %t1876, label %fixslow656, label %fixmerge657
fixslow656:
  %t1877 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge657
fixmerge657:
  %t1878 = phi i64 [ %t1875, %fixfast655 ], [ %t1877, %fixslow656 ]
  %t1879 = load i64, ptr @"emit.internal:rd-token-end"
  %t1880 = and i64 %t1879, -8
  %t1881 = inttoptr i64 %t1880 to ptr
  %t1882 = load i64, ptr %t1881
  %t1883 = inttoptr i64 %t1882 to ptr
  %t1884 = call fastcc i64%t1883(i64 %t1879, i64 3, i64 %a0, i64 %a1, i64 %t1878, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1885 = or i64 %a2, 8
  %t1886 = and i64 %t1885, 7
  %t1887 = icmp eq i64 %t1886, 0
  br i1 %t1887, label %fixfast658, label %fixslow659
fixfast658:
  %t1888 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t1889 = extractvalue {i64, i1} %t1888, 0
  %t1890 = extractvalue {i64, i1} %t1888, 1
  br i1 %t1890, label %fixslow659, label %fixmerge660
fixslow659:
  %t1891 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge660
fixmerge660:
  %t1892 = phi i64 [ %t1889, %fixfast658 ], [ %t1891, %fixslow659 ]
  %t1893 = or i64 %t1884, %t1892
  %t1894 = and i64 %t1893, 7
  %t1895 = icmp eq i64 %t1894, 0
  br i1 %t1895, label %fixfast661, label %fixslow662
fixfast661:
  %t1896 = icmp eq i64 %t1884, %t1892
  %t1897 = select i1 %t1896, i64 257, i64 1
  br label %fixmerge663
fixslow662:
  %t1898 = call i64 @rt_num_eq(i64 %t1884, i64 %t1892)
  br label %fixmerge663
fixmerge663:
  %t1899 = phi i64 [ %t1897, %fixfast661 ], [ %t1898, %fixslow662 ]
  ret i64 %t1899
else654:
  ret i64 1
}

define fastcc i64 @"emit.internal:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1904 = icmp eq i64 %argc, 2
  br i1 %t1904, label %argok665, label %arityerr664
arityerr664:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok665:
  %t1905 = call i64 @rt_null_p(i64 %a0)
  %t1906 = icmp ne i64 %t1905, 1
  br i1 %t1906, label %then666, label %else667
then666:
  ret i64 %a1
else667:
  %t1907 = call i64 @rt_cdr(i64 %a0)
  %t1908 = call i64 @rt_car(i64 %a0)
  %t1909 = call i64 @rt_cons(i64 %t1908, i64 %a1)
  %t1910 = load i64, ptr @"emit.internal:rd-append-reverse"
  %t1911 = and i64 %t1910, -8
  %t1912 = inttoptr i64 %t1911 to ptr
  %t1913 = load i64, ptr %t1912
  %t1914 = inttoptr i64 %t1913 to ptr
  %t1915 = musttail call fastcc i64 %t1914(i64 %t1910, i64 2, i64 %t1907, i64 %t1909, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1915
}

define fastcc i64 @"emit.internal:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1920 = icmp eq i64 %argc, 4
  br i1 %t1920, label %argok669, label %arityerr668
arityerr668:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok669:
  %t1921 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1922 = and i64 %t1921, -8
  %t1923 = inttoptr i64 %t1922 to ptr
  %t1924 = load i64, ptr %t1923
  %t1925 = inttoptr i64 %t1924 to ptr
  %t1926 = call fastcc i64%t1925(i64 %t1921, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1927 = or i64 %t1926, %a1
  %t1928 = and i64 %t1927, 7
  %t1929 = icmp eq i64 %t1928, 0
  br i1 %t1929, label %fixfast670, label %fixslow671
fixfast670:
  %t1930 = icmp slt i64 %t1926, %a1
  %t1931 = select i1 %t1930, i64 257, i64 1
  br label %fixmerge672
fixslow671:
  %t1932 = call i64 @rt_lt(i64 %t1926, i64 %a1)
  br label %fixmerge672
fixmerge672:
  %t1933 = phi i64 [ %t1931, %fixfast670 ], [ %t1932, %fixslow671 ]
  %t1934 = icmp ne i64 %t1933, 1
  br i1 %t1934, label %then673, label %else674
then673:
  %t1935 = call i64 @rt_string_ref(i64 %a0, i64 %t1926)
  %t1936 = call i64 @rt_char_to_integer(i64 %t1935)
  %t1937 = or i64 %t1936, 328
  %t1938 = and i64 %t1937, 7
  %t1939 = icmp eq i64 %t1938, 0
  br i1 %t1939, label %fixfast675, label %fixslow676
fixfast675:
  %t1940 = icmp eq i64 %t1936, 328
  %t1941 = select i1 %t1940, i64 257, i64 1
  br label %fixmerge677
fixslow676:
  %t1942 = call i64 @rt_num_eq(i64 %t1936, i64 328)
  br label %fixmerge677
fixmerge677:
  %t1943 = phi i64 [ %t1941, %fixfast675 ], [ %t1942, %fixslow676 ]
  %t1944 = icmp ne i64 %t1943, 1
  br i1 %t1944, label %then678, label %else679
then678:
  br label %merge680
else679:
  %t1945 = or i64 %t1936, 744
  %t1946 = and i64 %t1945, 7
  %t1947 = icmp eq i64 %t1946, 0
  br i1 %t1947, label %fixfast681, label %fixslow682
fixfast681:
  %t1948 = icmp eq i64 %t1936, 744
  %t1949 = select i1 %t1948, i64 257, i64 1
  br label %fixmerge683
fixslow682:
  %t1950 = call i64 @rt_num_eq(i64 %t1936, i64 744)
  br label %fixmerge683
fixmerge683:
  %t1951 = phi i64 [ %t1949, %fixfast681 ], [ %t1950, %fixslow682 ]
  br label %merge680
merge680:
  %t1952 = phi i64 [ %t1943, %then678 ], [ %t1951, %fixmerge683 ]
  %t1953 = icmp ne i64 %t1952, 1
  br i1 %t1953, label %then684, label %else685
then684:
  %t1954 = load i64, ptr @"emit.internal:reverse"
  %t1955 = and i64 %t1954, -8
  %t1956 = inttoptr i64 %t1955 to ptr
  %t1957 = load i64, ptr %t1956
  %t1958 = inttoptr i64 %t1957 to ptr
  %t1959 = call fastcc i64%t1958(i64 %t1954, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1960 = or i64 %t1926, 8
  %t1961 = and i64 %t1960, 7
  %t1962 = icmp eq i64 %t1961, 0
  br i1 %t1962, label %fixfast686, label %fixslow687
fixfast686:
  %t1963 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1926, i64 8)
  %t1964 = extractvalue {i64, i1} %t1963, 0
  %t1965 = extractvalue {i64, i1} %t1963, 1
  br i1 %t1965, label %fixslow687, label %fixmerge688
fixslow687:
  %t1966 = call i64 @rt_add(i64 %t1926, i64 8)
  br label %fixmerge688
fixmerge688:
  %t1967 = phi i64 [ %t1964, %fixfast686 ], [ %t1966, %fixslow687 ]
  %t1968 = call i64 @rt_cons(i64 %t1959, i64 %t1967)
  ret i64 %t1968
else685:
  %t1969 = load i64, ptr @"emit.internal:rd-dot?"
  %t1970 = and i64 %t1969, -8
  %t1971 = inttoptr i64 %t1970 to ptr
  %t1972 = load i64, ptr %t1971
  %t1973 = inttoptr i64 %t1972 to ptr
  %t1974 = call fastcc i64%t1973(i64 %t1969, i64 3, i64 %a0, i64 %a1, i64 %t1926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1975 = icmp ne i64 %t1974, 1
  br i1 %t1975, label %then689, label %else690
then689:
  %t1976 = or i64 %t1926, 8
  %t1977 = and i64 %t1976, 7
  %t1978 = icmp eq i64 %t1977, 0
  br i1 %t1978, label %fixfast691, label %fixslow692
fixfast691:
  %t1979 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t1926, i64 8)
  %t1980 = extractvalue {i64, i1} %t1979, 0
  %t1981 = extractvalue {i64, i1} %t1979, 1
  br i1 %t1981, label %fixslow692, label %fixmerge693
fixslow692:
  %t1982 = call i64 @rt_add(i64 %t1926, i64 8)
  br label %fixmerge693
fixmerge693:
  %t1983 = phi i64 [ %t1980, %fixfast691 ], [ %t1982, %fixslow692 ]
  %t1984 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1985 = and i64 %t1984, -8
  %t1986 = inttoptr i64 %t1985 to ptr
  %t1987 = load i64, ptr %t1986
  %t1988 = inttoptr i64 %t1987 to ptr
  %t1989 = call fastcc i64%t1988(i64 %t1984, i64 3, i64 %a0, i64 %a1, i64 %t1983, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1990 = load i64, ptr @"emit.internal:rd-datum"
  %t1991 = and i64 %t1990, -8
  %t1992 = inttoptr i64 %t1991 to ptr
  %t1993 = load i64, ptr %t1992
  %t1994 = inttoptr i64 %t1993 to ptr
  %t1995 = call fastcc i64%t1994(i64 %t1990, i64 3, i64 %a0, i64 %a1, i64 %t1989, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1996 = call i64 @rt_cdr(i64 %t1995)
  %t1997 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t1998 = and i64 %t1997, -8
  %t1999 = inttoptr i64 %t1998 to ptr
  %t2000 = load i64, ptr %t1999
  %t2001 = inttoptr i64 %t2000 to ptr
  %t2002 = call fastcc i64%t2001(i64 %t1997, i64 3, i64 %a0, i64 %a1, i64 %t1996, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2003 = call i64 @rt_car(i64 %t1995)
  %t2004 = load i64, ptr @"emit.internal:rd-append-reverse"
  %t2005 = and i64 %t2004, -8
  %t2006 = inttoptr i64 %t2005 to ptr
  %t2007 = load i64, ptr %t2006
  %t2008 = inttoptr i64 %t2007 to ptr
  %t2009 = call fastcc i64%t2008(i64 %t2004, i64 2, i64 %a3, i64 %t2003, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2010 = or i64 %t2002, 8
  %t2011 = and i64 %t2010, 7
  %t2012 = icmp eq i64 %t2011, 0
  br i1 %t2012, label %fixfast694, label %fixslow695
fixfast694:
  %t2013 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2002, i64 8)
  %t2014 = extractvalue {i64, i1} %t2013, 0
  %t2015 = extractvalue {i64, i1} %t2013, 1
  br i1 %t2015, label %fixslow695, label %fixmerge696
fixslow695:
  %t2016 = call i64 @rt_add(i64 %t2002, i64 8)
  br label %fixmerge696
fixmerge696:
  %t2017 = phi i64 [ %t2014, %fixfast694 ], [ %t2016, %fixslow695 ]
  %t2018 = call i64 @rt_cons(i64 %t2009, i64 %t2017)
  ret i64 %t2018
else690:
  %t2019 = load i64, ptr @"emit.internal:rd-datum"
  %t2020 = and i64 %t2019, -8
  %t2021 = inttoptr i64 %t2020 to ptr
  %t2022 = load i64, ptr %t2021
  %t2023 = inttoptr i64 %t2022 to ptr
  %t2024 = call fastcc i64%t2023(i64 %t2019, i64 3, i64 %a0, i64 %a1, i64 %t1926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2025 = call i64 @rt_cdr(i64 %t2024)
  %t2026 = call i64 @rt_car(i64 %t2024)
  %t2027 = call i64 @rt_cons(i64 %t2026, i64 %a3)
  %t2028 = load i64, ptr @"emit.internal:rd-list"
  %t2029 = and i64 %t2028, -8
  %t2030 = inttoptr i64 %t2029 to ptr
  %t2031 = load i64, ptr %t2030
  %t2032 = inttoptr i64 %t2031 to ptr
  %t2033 = musttail call fastcc i64 %t2032(i64 %t2028, i64 4, i64 %a0, i64 %a1, i64 %t2025, i64 %t2027, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2033
else674:
  %t2034 = load i64, ptr @"emit.internal:reverse"
  %t2035 = and i64 %t2034, -8
  %t2036 = inttoptr i64 %t2035 to ptr
  %t2037 = load i64, ptr %t2036
  %t2038 = inttoptr i64 %t2037 to ptr
  %t2039 = call fastcc i64%t2038(i64 %t2034, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2040 = call i64 @rt_cons(i64 %t2039, i64 %t1926)
  ret i64 %t2040
}

define fastcc i64 @"emit.internal:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2045 = icmp eq i64 %argc, 3
  br i1 %t2045, label %argok698, label %arityerr697
arityerr697:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok698:
  %t2046 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2047 = call i64 @rt_char_to_integer(i64 %t2046)
  %t2048 = or i64 %t2047, 320
  %t2049 = and i64 %t2048, 7
  %t2050 = icmp eq i64 %t2049, 0
  br i1 %t2050, label %fixfast699, label %fixslow700
fixfast699:
  %t2051 = icmp eq i64 %t2047, 320
  %t2052 = select i1 %t2051, i64 257, i64 1
  br label %fixmerge701
fixslow700:
  %t2053 = call i64 @rt_num_eq(i64 %t2047, i64 320)
  br label %fixmerge701
fixmerge701:
  %t2054 = phi i64 [ %t2052, %fixfast699 ], [ %t2053, %fixslow700 ]
  %t2055 = icmp ne i64 %t2054, 1
  br i1 %t2055, label %then702, label %else703
then702:
  %t2056 = or i64 %a2, 8
  %t2057 = and i64 %t2056, 7
  %t2058 = icmp eq i64 %t2057, 0
  br i1 %t2058, label %fixfast704, label %fixslow705
fixfast704:
  %t2059 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2060 = extractvalue {i64, i1} %t2059, 0
  %t2061 = extractvalue {i64, i1} %t2059, 1
  br i1 %t2061, label %fixslow705, label %fixmerge706
fixslow705:
  %t2062 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge706
fixmerge706:
  %t2063 = phi i64 [ %t2060, %fixfast704 ], [ %t2062, %fixslow705 ]
  %t2064 = load i64, ptr @"emit.internal:rd-list"
  %t2065 = and i64 %t2064, -8
  %t2066 = inttoptr i64 %t2065 to ptr
  %t2067 = load i64, ptr %t2066
  %t2068 = inttoptr i64 %t2067 to ptr
  %t2069 = musttail call fastcc i64 %t2068(i64 %t2064, i64 4, i64 %a0, i64 %a1, i64 %t2063, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2069
else703:
  %t2070 = or i64 %t2047, 728
  %t2071 = and i64 %t2070, 7
  %t2072 = icmp eq i64 %t2071, 0
  br i1 %t2072, label %fixfast707, label %fixslow708
fixfast707:
  %t2073 = icmp eq i64 %t2047, 728
  %t2074 = select i1 %t2073, i64 257, i64 1
  br label %fixmerge709
fixslow708:
  %t2075 = call i64 @rt_num_eq(i64 %t2047, i64 728)
  br label %fixmerge709
fixmerge709:
  %t2076 = phi i64 [ %t2074, %fixfast707 ], [ %t2075, %fixslow708 ]
  %t2077 = icmp ne i64 %t2076, 1
  br i1 %t2077, label %then710, label %else711
then710:
  %t2078 = or i64 %a2, 8
  %t2079 = and i64 %t2078, 7
  %t2080 = icmp eq i64 %t2079, 0
  br i1 %t2080, label %fixfast712, label %fixslow713
fixfast712:
  %t2081 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2082 = extractvalue {i64, i1} %t2081, 0
  %t2083 = extractvalue {i64, i1} %t2081, 1
  br i1 %t2083, label %fixslow713, label %fixmerge714
fixslow713:
  %t2084 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge714
fixmerge714:
  %t2085 = phi i64 [ %t2082, %fixfast712 ], [ %t2084, %fixslow713 ]
  %t2086 = load i64, ptr @"emit.internal:rd-list"
  %t2087 = and i64 %t2086, -8
  %t2088 = inttoptr i64 %t2087 to ptr
  %t2089 = load i64, ptr %t2088
  %t2090 = inttoptr i64 %t2089 to ptr
  %t2091 = musttail call fastcc i64 %t2090(i64 %t2086, i64 4, i64 %a0, i64 %a1, i64 %t2085, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2091
else711:
  %t2092 = or i64 %t2047, 312
  %t2093 = and i64 %t2092, 7
  %t2094 = icmp eq i64 %t2093, 0
  br i1 %t2094, label %fixfast715, label %fixslow716
fixfast715:
  %t2095 = icmp eq i64 %t2047, 312
  %t2096 = select i1 %t2095, i64 257, i64 1
  br label %fixmerge717
fixslow716:
  %t2097 = call i64 @rt_num_eq(i64 %t2047, i64 312)
  br label %fixmerge717
fixmerge717:
  %t2098 = phi i64 [ %t2096, %fixfast715 ], [ %t2097, %fixslow716 ]
  %t2099 = icmp ne i64 %t2098, 1
  br i1 %t2099, label %then718, label %else719
then718:
  %t2100 = or i64 %a2, 8
  %t2101 = and i64 %t2100, 7
  %t2102 = icmp eq i64 %t2101, 0
  br i1 %t2102, label %fixfast720, label %fixslow721
fixfast720:
  %t2103 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2104 = extractvalue {i64, i1} %t2103, 0
  %t2105 = extractvalue {i64, i1} %t2103, 1
  br i1 %t2105, label %fixslow721, label %fixmerge722
fixslow721:
  %t2106 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge722
fixmerge722:
  %t2107 = phi i64 [ %t2104, %fixfast720 ], [ %t2106, %fixslow721 ]
  %t2108 = load i64, ptr @"emit.internal:rd-quote"
  %t2109 = and i64 %t2108, -8
  %t2110 = inttoptr i64 %t2109 to ptr
  %t2111 = load i64, ptr %t2110
  %t2112 = inttoptr i64 %t2111 to ptr
  %t2113 = musttail call fastcc i64 %t2112(i64 %t2108, i64 3, i64 %a0, i64 %a1, i64 %t2107, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2113
else719:
  %t2114 = or i64 %t2047, 768
  %t2115 = and i64 %t2114, 7
  %t2116 = icmp eq i64 %t2115, 0
  br i1 %t2116, label %fixfast723, label %fixslow724
fixfast723:
  %t2117 = icmp eq i64 %t2047, 768
  %t2118 = select i1 %t2117, i64 257, i64 1
  br label %fixmerge725
fixslow724:
  %t2119 = call i64 @rt_num_eq(i64 %t2047, i64 768)
  br label %fixmerge725
fixmerge725:
  %t2120 = phi i64 [ %t2118, %fixfast723 ], [ %t2119, %fixslow724 ]
  %t2121 = icmp ne i64 %t2120, 1
  br i1 %t2121, label %then726, label %else727
then726:
  %t2122 = or i64 %a2, 8
  %t2123 = and i64 %t2122, 7
  %t2124 = icmp eq i64 %t2123, 0
  br i1 %t2124, label %fixfast728, label %fixslow729
fixfast728:
  %t2125 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2126 = extractvalue {i64, i1} %t2125, 0
  %t2127 = extractvalue {i64, i1} %t2125, 1
  br i1 %t2127, label %fixslow729, label %fixmerge730
fixslow729:
  %t2128 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge730
fixmerge730:
  %t2129 = phi i64 [ %t2126, %fixfast728 ], [ %t2128, %fixslow729 ]
  %t2130 = load i64, ptr @"emit.internal:rd-quasi"
  %t2131 = and i64 %t2130, -8
  %t2132 = inttoptr i64 %t2131 to ptr
  %t2133 = load i64, ptr %t2132
  %t2134 = inttoptr i64 %t2133 to ptr
  %t2135 = musttail call fastcc i64 %t2134(i64 %t2130, i64 3, i64 %a0, i64 %a1, i64 %t2129, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2135
else727:
  %t2136 = or i64 %t2047, 352
  %t2137 = and i64 %t2136, 7
  %t2138 = icmp eq i64 %t2137, 0
  br i1 %t2138, label %fixfast731, label %fixslow732
fixfast731:
  %t2139 = icmp eq i64 %t2047, 352
  %t2140 = select i1 %t2139, i64 257, i64 1
  br label %fixmerge733
fixslow732:
  %t2141 = call i64 @rt_num_eq(i64 %t2047, i64 352)
  br label %fixmerge733
fixmerge733:
  %t2142 = phi i64 [ %t2140, %fixfast731 ], [ %t2141, %fixslow732 ]
  %t2143 = icmp ne i64 %t2142, 1
  br i1 %t2143, label %then734, label %else735
then734:
  %t2144 = or i64 %a2, 8
  %t2145 = and i64 %t2144, 7
  %t2146 = icmp eq i64 %t2145, 0
  br i1 %t2146, label %fixfast736, label %fixslow737
fixfast736:
  %t2147 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2148 = extractvalue {i64, i1} %t2147, 0
  %t2149 = extractvalue {i64, i1} %t2147, 1
  br i1 %t2149, label %fixslow737, label %fixmerge738
fixslow737:
  %t2150 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge738
fixmerge738:
  %t2151 = phi i64 [ %t2148, %fixfast736 ], [ %t2150, %fixslow737 ]
  %t2152 = load i64, ptr @"emit.internal:rd-unquote"
  %t2153 = and i64 %t2152, -8
  %t2154 = inttoptr i64 %t2153 to ptr
  %t2155 = load i64, ptr %t2154
  %t2156 = inttoptr i64 %t2155 to ptr
  %t2157 = musttail call fastcc i64 %t2156(i64 %t2152, i64 3, i64 %a0, i64 %a1, i64 %t2151, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2157
else735:
  %t2158 = or i64 %t2047, 272
  %t2159 = and i64 %t2158, 7
  %t2160 = icmp eq i64 %t2159, 0
  br i1 %t2160, label %fixfast739, label %fixslow740
fixfast739:
  %t2161 = icmp eq i64 %t2047, 272
  %t2162 = select i1 %t2161, i64 257, i64 1
  br label %fixmerge741
fixslow740:
  %t2163 = call i64 @rt_num_eq(i64 %t2047, i64 272)
  br label %fixmerge741
fixmerge741:
  %t2164 = phi i64 [ %t2162, %fixfast739 ], [ %t2163, %fixslow740 ]
  %t2165 = icmp ne i64 %t2164, 1
  br i1 %t2165, label %then742, label %else743
then742:
  %t2166 = or i64 %a2, 8
  %t2167 = and i64 %t2166, 7
  %t2168 = icmp eq i64 %t2167, 0
  br i1 %t2168, label %fixfast744, label %fixslow745
fixfast744:
  %t2169 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2170 = extractvalue {i64, i1} %t2169, 0
  %t2171 = extractvalue {i64, i1} %t2169, 1
  br i1 %t2171, label %fixslow745, label %fixmerge746
fixslow745:
  %t2172 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge746
fixmerge746:
  %t2173 = phi i64 [ %t2170, %fixfast744 ], [ %t2172, %fixslow745 ]
  %t2174 = load i64, ptr @"emit.internal:rd-string"
  %t2175 = and i64 %t2174, -8
  %t2176 = inttoptr i64 %t2175 to ptr
  %t2177 = load i64, ptr %t2176
  %t2178 = inttoptr i64 %t2177 to ptr
  %t2179 = musttail call fastcc i64 %t2178(i64 %t2174, i64 3, i64 %a0, i64 %a1, i64 %t2173, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2179
else743:
  %t2180 = or i64 %t2047, 280
  %t2181 = and i64 %t2180, 7
  %t2182 = icmp eq i64 %t2181, 0
  br i1 %t2182, label %fixfast747, label %fixslow748
fixfast747:
  %t2183 = icmp eq i64 %t2047, 280
  %t2184 = select i1 %t2183, i64 257, i64 1
  br label %fixmerge749
fixslow748:
  %t2185 = call i64 @rt_num_eq(i64 %t2047, i64 280)
  br label %fixmerge749
fixmerge749:
  %t2186 = phi i64 [ %t2184, %fixfast747 ], [ %t2185, %fixslow748 ]
  %t2187 = icmp ne i64 %t2186, 1
  br i1 %t2187, label %then750, label %else751
then750:
  %t2188 = or i64 %a2, 8
  %t2189 = and i64 %t2188, 7
  %t2190 = icmp eq i64 %t2189, 0
  br i1 %t2190, label %fixfast752, label %fixslow753
fixfast752:
  %t2191 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2192 = extractvalue {i64, i1} %t2191, 0
  %t2193 = extractvalue {i64, i1} %t2191, 1
  br i1 %t2193, label %fixslow753, label %fixmerge754
fixslow753:
  %t2194 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge754
fixmerge754:
  %t2195 = phi i64 [ %t2192, %fixfast752 ], [ %t2194, %fixslow753 ]
  %t2196 = load i64, ptr @"emit.internal:rd-hash"
  %t2197 = and i64 %t2196, -8
  %t2198 = inttoptr i64 %t2197 to ptr
  %t2199 = load i64, ptr %t2198
  %t2200 = inttoptr i64 %t2199 to ptr
  %t2201 = musttail call fastcc i64 %t2200(i64 %t2196, i64 3, i64 %a0, i64 %a1, i64 %t2195, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2201
else751:
  %t2202 = load i64, ptr @"emit.internal:rd-atom"
  %t2203 = and i64 %t2202, -8
  %t2204 = inttoptr i64 %t2203 to ptr
  %t2205 = load i64, ptr %t2204
  %t2206 = inttoptr i64 %t2205 to ptr
  %t2207 = musttail call fastcc i64 %t2206(i64 %t2202, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2207
}

define fastcc i64 @"emit.internal:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2213 = icmp eq i64 %argc, 0
  br i1 %t2213, label %argok756, label %arityerr755
arityerr755:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok756:
  %t2214 = load i64, ptr @"emit.internal:%port-rtd-cell"
  %t2215 = icmp ne i64 %t2214, 1
  br i1 %t2215, label %then757, label %else758
then757:
  %t2216 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t2216
else758:
  %t2217 = call i64 @rt_make_string(ptr @.str.lit.19, i64 4)
  %t2218 = call i64 @rt_make_record_type(i64 %t2217)
  %t2219 = call i64 @rt_root(i64 %t2218)
  store i64 %t2219, ptr @"emit.internal:%port-rtd-cell"
  %t2220 = load i64, ptr @"emit.internal:%port-rtd-cell"
  ret i64 %t2220
}

define fastcc i64 @"emit.internal:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2225 = icmp eq i64 %argc, 6
  br i1 %t2225, label %argok760, label %arityerr759
arityerr759:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok760:
  %t2226 = load i64, ptr @"emit.internal:%port-rtd"
  %t2227 = and i64 %t2226, -8
  %t2228 = inttoptr i64 %t2227 to ptr
  %t2229 = load i64, ptr %t2228
  %t2230 = inttoptr i64 %t2229 to ptr
  %t2231 = call fastcc i64%t2230(i64 %t2226, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2232 = load i64, ptr @"emit.internal:list"
  %t2233 = and i64 %t2232, -8
  %t2234 = inttoptr i64 %t2233 to ptr
  %t2235 = load i64, ptr %t2234
  %t2236 = inttoptr i64 %t2235 to ptr
  %t2237 = call fastcc i64%t2236(i64 %t2232, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t2238 = call i64 @rt_make_record(i64 %t2231, i64 %t2237)
  ret i64 %t2238
}

define fastcc i64 @"emit.internal:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2243 = icmp eq i64 %argc, 1
  br i1 %t2243, label %argok762, label %arityerr761
arityerr761:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok762:
  %t2244 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t2245 = icmp ne i64 %t2244, 1
  br i1 %t2245, label %then763, label %else764
then763:
  ret i64 %t2244
else764:
  %t2246 = call i64 @rt_read_all_stdin()
  %t2247 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t2246)
  ret i64 %t2246
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
  %t229 = call ptr @rt_alloc_words(i64 1)
  %t230 = ptrtoint ptr %t229 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list->vector" to i64), ptr %t229
  %t231 = or i64 %t230, 4
  %t232 = call i64 @rt_root(i64 %t231)
  store i64 %t232, ptr @"emit.internal:list->vector"
  ret i64 17
}

define i64 @"emit.internal:__init_18"() {
entry:
  %t270 = call ptr @rt_alloc_words(i64 1)
  %t271 = ptrtoint ptr %t270 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:list->bytevector" to i64), ptr %t270
  %t272 = or i64 %t271, 4
  %t273 = call i64 @rt_root(i64 %t272)
  store i64 %t273, ptr @"emit.internal:list->bytevector"
  ret i64 17
}

define i64 @"emit.internal:__init_19"() {
entry:
  %t307 = call ptr @rt_alloc_words(i64 1)
  %t308 = ptrtoint ptr %t307 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-ws?" to i64), ptr %t307
  %t309 = or i64 %t308, 4
  %t310 = call i64 @rt_root(i64 %t309)
  store i64 %t310, ptr @"emit.internal:rd-ws?"
  ret i64 17
}

define i64 @"emit.internal:__init_20"() {
entry:
  %t328 = call ptr @rt_alloc_words(i64 1)
  %t329 = ptrtoint ptr %t328 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digit?" to i64), ptr %t328
  %t330 = or i64 %t329, 4
  %t331 = call i64 @rt_root(i64 %t330)
  store i64 %t331, ptr @"emit.internal:rd-digit?"
  ret i64 17
}

define i64 @"emit.internal:__init_21"() {
entry:
  %t388 = call ptr @rt_alloc_words(i64 1)
  %t389 = ptrtoint ptr %t388 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-delim?" to i64), ptr %t388
  %t390 = or i64 %t389, 4
  %t391 = call i64 @rt_root(i64 %t390)
  store i64 %t391, ptr @"emit.internal:rd-delim?"
  ret i64 17
}

define i64 @"emit.internal:__init_22"() {
entry:
  %t433 = call ptr @rt_alloc_words(i64 1)
  %t434 = ptrtoint ptr %t433 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-line" to i64), ptr %t433
  %t435 = or i64 %t434, 4
  %t436 = call i64 @rt_root(i64 %t435)
  store i64 %t436, ptr @"emit.internal:rd-skip-line"
  ret i64 17
}

define i64 @"emit.internal:__init_23"() {
entry:
  %t497 = call ptr @rt_alloc_words(i64 1)
  %t498 = ptrtoint ptr %t497 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-skip-ws" to i64), ptr %t497
  %t499 = or i64 %t498, 4
  %t500 = call i64 @rt_root(i64 %t499)
  store i64 %t500, ptr @"emit.internal:rd-skip-ws"
  ret i64 17
}

define i64 @"emit.internal:__init_24"() {
entry:
  %t532 = call ptr @rt_alloc_words(i64 1)
  %t533 = ptrtoint ptr %t532 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-token-end" to i64), ptr %t532
  %t534 = or i64 %t533, 4
  %t535 = call i64 @rt_root(i64 %t534)
  store i64 %t535, ptr @"emit.internal:rd-token-end"
  ret i64 17
}

define i64 @"emit.internal:__init_25"() {
entry:
  %t567 = call ptr @rt_alloc_words(i64 1)
  %t568 = ptrtoint ptr %t567 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-all-digits?" to i64), ptr %t567
  %t569 = or i64 %t568, 4
  %t570 = call i64 @rt_root(i64 %t569)
  store i64 %t570, ptr @"emit.internal:rd-all-digits?"
  ret i64 17
}

define i64 @"emit.internal:__init_26"() {
entry:
  %t628 = call ptr @rt_alloc_words(i64 1)
  %t629 = ptrtoint ptr %t628 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-numeric?" to i64), ptr %t628
  %t630 = or i64 %t629, 4
  %t631 = call i64 @rt_root(i64 %t630)
  store i64 %t631, ptr @"emit.internal:rd-numeric?"
  ret i64 17
}

define i64 @"emit.internal:__init_27"() {
entry:
  %t682 = call ptr @rt_alloc_words(i64 1)
  %t683 = ptrtoint ptr %t682 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits" to i64), ptr %t682
  %t684 = or i64 %t683, 4
  %t685 = call i64 @rt_root(i64 %t684)
  store i64 %t685, ptr @"emit.internal:rd-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_28"() {
entry:
  %t736 = call ptr @rt_alloc_words(i64 1)
  %t737 = ptrtoint ptr %t736 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-digits-neg" to i64), ptr %t736
  %t738 = or i64 %t737, 4
  %t739 = call i64 @rt_root(i64 %t738)
  store i64 %t739, ptr @"emit.internal:rd-digits-neg"
  ret i64 17
}

define i64 @"emit.internal:__init_29"() {
entry:
  %t778 = call ptr @rt_alloc_words(i64 1)
  %t779 = ptrtoint ptr %t778 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-parse-int" to i64), ptr %t778
  %t780 = or i64 %t779, 4
  %t781 = call i64 @rt_root(i64 %t780)
  store i64 %t781, ptr @"emit.internal:rd-parse-int"
  ret i64 17
}

define i64 @"emit.internal:__init_30"() {
entry:
  %t791 = call ptr @rt_alloc_words(i64 1)
  %t792 = ptrtoint ptr %t791 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dotchar?" to i64), ptr %t791
  %t793 = or i64 %t792, 4
  %t794 = call i64 @rt_root(i64 %t793)
  store i64 %t794, ptr @"emit.internal:rd-dotchar?"
  ret i64 17
}

define i64 @"emit.internal:__init_31"() {
entry:
  %t812 = call ptr @rt_alloc_words(i64 1)
  %t813 = ptrtoint ptr %t812 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-exp-char?" to i64), ptr %t812
  %t814 = or i64 %t813, 4
  %t815 = call i64 @rt_root(i64 %t814)
  store i64 %t815, ptr @"emit.internal:rd-exp-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_32"() {
entry:
  %t833 = call ptr @rt_alloc_words(i64 1)
  %t834 = ptrtoint ptr %t833 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-sign-char?" to i64), ptr %t833
  %t835 = or i64 %t834, 4
  %t836 = call i64 @rt_root(i64 %t835)
  store i64 %t836, ptr @"emit.internal:rd-sign-char?"
  ret i64 17
}

define i64 @"emit.internal:__init_33"() {
entry:
  %t869 = call ptr @rt_alloc_words(i64 1)
  %t870 = ptrtoint ptr %t869 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-scan-digits" to i64), ptr %t869
  %t871 = or i64 %t870, 4
  %t872 = call i64 @rt_root(i64 %t871)
  store i64 %t872, ptr @"emit.internal:rd-scan-digits"
  ret i64 17
}

define i64 @"emit.internal:__init_34"() {
entry:
  %t1061 = call ptr @rt_alloc_words(i64 1)
  %t1062 = ptrtoint ptr %t1061 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-flonum?" to i64), ptr %t1061
  %t1063 = or i64 %t1062, 4
  %t1064 = call i64 @rt_root(i64 %t1063)
  store i64 %t1064, ptr @"emit.internal:rd-flonum?"
  ret i64 17
}

define i64 @"emit.internal:__init_35"() {
entry:
  %t1081 = call ptr @rt_alloc_words(i64 1)
  %t1082 = ptrtoint ptr %t1081 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-nonfinite" to i64), ptr %t1081
  %t1083 = or i64 %t1082, 4
  %t1084 = call i64 @rt_root(i64 %t1083)
  store i64 %t1084, ptr @"emit.internal:rd-nonfinite"
  ret i64 17
}

define i64 @"emit.internal:__init_36"() {
entry:
  %t1126 = call ptr @rt_alloc_words(i64 1)
  %t1127 = ptrtoint ptr %t1126 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-atom" to i64), ptr %t1126
  %t1128 = or i64 %t1127, 4
  %t1129 = call i64 @rt_root(i64 %t1128)
  store i64 %t1129, ptr @"emit.internal:rd-atom"
  ret i64 17
}

define i64 @"emit.internal:__init_37"() {
entry:
  %t1207 = call ptr @rt_alloc_words(i64 1)
  %t1208 = ptrtoint ptr %t1207 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex-digit" to i64), ptr %t1207
  %t1209 = or i64 %t1208, 4
  %t1210 = call i64 @rt_root(i64 %t1209)
  store i64 %t1210, ptr @"emit.internal:rd-hex-digit"
  ret i64 17
}

define i64 @"emit.internal:__init_38"() {
entry:
  %t1278 = call ptr @rt_alloc_words(i64 1)
  %t1279 = ptrtoint ptr %t1278 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hex" to i64), ptr %t1278
  %t1280 = or i64 %t1279, 4
  %t1281 = call i64 @rt_root(i64 %t1280)
  store i64 %t1281, ptr @"emit.internal:rd-hex"
  ret i64 17
}

define i64 @"emit.internal:__init_39"() {
entry:
  %t1311 = call ptr @rt_alloc_words(i64 1)
  %t1312 = ptrtoint ptr %t1311 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-str-esc" to i64), ptr %t1311
  %t1313 = or i64 %t1312, 4
  %t1314 = call i64 @rt_root(i64 %t1313)
  store i64 %t1314, ptr @"emit.internal:rd-str-esc"
  ret i64 17
}

define i64 @"emit.internal:__init_40"() {
entry:
  %t1457 = call ptr @rt_alloc_words(i64 1)
  %t1458 = ptrtoint ptr %t1457 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-string" to i64), ptr %t1457
  %t1459 = or i64 %t1458, 4
  %t1460 = call i64 @rt_root(i64 %t1459)
  store i64 %t1460, ptr @"emit.internal:rd-string"
  ret i64 17
}

define i64 @"emit.internal:__init_41"() {
entry:
  %t1638 = call ptr @rt_alloc_words(i64 1)
  %t1639 = ptrtoint ptr %t1638 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-hash" to i64), ptr %t1638
  %t1640 = or i64 %t1639, 4
  %t1641 = call i64 @rt_root(i64 %t1640)
  store i64 %t1641, ptr @"emit.internal:rd-hash"
  ret i64 17
}

define i64 @"emit.internal:__init_42"() {
entry:
  %t1680 = call ptr @rt_alloc_words(i64 1)
  %t1681 = ptrtoint ptr %t1680 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char-name" to i64), ptr %t1680
  %t1682 = or i64 %t1681, 4
  %t1683 = call i64 @rt_root(i64 %t1682)
  store i64 %t1683, ptr @"emit.internal:rd-char-name"
  ret i64 17
}

define i64 @"emit.internal:__init_43"() {
entry:
  %t1726 = call ptr @rt_alloc_words(i64 1)
  %t1727 = ptrtoint ptr %t1726 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-char" to i64), ptr %t1726
  %t1728 = or i64 %t1727, 4
  %t1729 = call i64 @rt_root(i64 %t1728)
  store i64 %t1729, ptr @"emit.internal:rd-char"
  ret i64 17
}

define i64 @"emit.internal:__init_44"() {
entry:
  %t1753 = call ptr @rt_alloc_words(i64 1)
  %t1754 = ptrtoint ptr %t1753 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quote" to i64), ptr %t1753
  %t1755 = or i64 %t1754, 4
  %t1756 = call i64 @rt_root(i64 %t1755)
  store i64 %t1756, ptr @"emit.internal:rd-quote"
  ret i64 17
}

define i64 @"emit.internal:__init_45"() {
entry:
  %t1780 = call ptr @rt_alloc_words(i64 1)
  %t1781 = ptrtoint ptr %t1780 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-quasi" to i64), ptr %t1780
  %t1782 = or i64 %t1781, 4
  %t1783 = call i64 @rt_root(i64 %t1782)
  store i64 %t1783, ptr @"emit.internal:rd-quasi"
  ret i64 17
}

define i64 @"emit.internal:__init_46"() {
entry:
  %t1856 = call ptr @rt_alloc_words(i64 1)
  %t1857 = ptrtoint ptr %t1856 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-unquote" to i64), ptr %t1856
  %t1858 = or i64 %t1857, 4
  %t1859 = call i64 @rt_root(i64 %t1858)
  store i64 %t1859, ptr @"emit.internal:rd-unquote"
  ret i64 17
}

define i64 @"emit.internal:__init_47"() {
entry:
  %t1900 = call ptr @rt_alloc_words(i64 1)
  %t1901 = ptrtoint ptr %t1900 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-dot?" to i64), ptr %t1900
  %t1902 = or i64 %t1901, 4
  %t1903 = call i64 @rt_root(i64 %t1902)
  store i64 %t1903, ptr @"emit.internal:rd-dot?"
  ret i64 17
}

define i64 @"emit.internal:__init_48"() {
entry:
  %t1916 = call ptr @rt_alloc_words(i64 1)
  %t1917 = ptrtoint ptr %t1916 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-append-reverse" to i64), ptr %t1916
  %t1918 = or i64 %t1917, 4
  %t1919 = call i64 @rt_root(i64 %t1918)
  store i64 %t1919, ptr @"emit.internal:rd-append-reverse"
  ret i64 17
}

define i64 @"emit.internal:__init_49"() {
entry:
  %t2041 = call ptr @rt_alloc_words(i64 1)
  %t2042 = ptrtoint ptr %t2041 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-list" to i64), ptr %t2041
  %t2043 = or i64 %t2042, 4
  %t2044 = call i64 @rt_root(i64 %t2043)
  store i64 %t2044, ptr @"emit.internal:rd-list"
  ret i64 17
}

define i64 @"emit.internal:__init_50"() {
entry:
  %t2208 = call ptr @rt_alloc_words(i64 1)
  %t2209 = ptrtoint ptr %t2208 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:rd-datum" to i64), ptr %t2208
  %t2210 = or i64 %t2209, 4
  %t2211 = call i64 @rt_root(i64 %t2210)
  store i64 %t2211, ptr @"emit.internal:rd-datum"
  ret i64 17
}

define i64 @"emit.internal:__init_51"() {
entry:
  %t2212 = call i64 @rt_root(i64 1)
  store i64 %t2212, ptr @"emit.internal:%port-rtd-cell"
  ret i64 17
}

define i64 @"emit.internal:__init_52"() {
entry:
  %t2221 = call ptr @rt_alloc_words(i64 1)
  %t2222 = ptrtoint ptr %t2221 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-rtd" to i64), ptr %t2221
  %t2223 = or i64 %t2222, 4
  %t2224 = call i64 @rt_root(i64 %t2223)
  store i64 %t2224, ptr @"emit.internal:%port-rtd"
  ret i64 17
}

define i64 @"emit.internal:__init_53"() {
entry:
  %t2239 = call ptr @rt_alloc_words(i64 1)
  %t2240 = ptrtoint ptr %t2239 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%make-port" to i64), ptr %t2239
  %t2241 = or i64 %t2240, 4
  %t2242 = call i64 @rt_root(i64 %t2241)
  store i64 %t2242, ptr @"emit.internal:%make-port"
  ret i64 17
}

define i64 @"emit.internal:__init_54"() {
entry:
  %t2248 = call ptr @rt_alloc_words(i64 1)
  %t2249 = ptrtoint ptr %t2248 to i64
  store i64 ptrtoint (ptr @"emit.internal:code:%port-buf" to i64), ptr %t2248
  %t2250 = or i64 %t2249, 4
  %t2251 = call i64 @rt_root(i64 %t2250)
  store i64 %t2251, ptr @"emit.internal:%port-buf"
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

