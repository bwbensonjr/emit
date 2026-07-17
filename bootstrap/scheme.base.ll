declare i64 @rt_alloc_words(i64)
declare i64 @rt_cons(i64, i64)
declare i64 @rt_car(i64)
declare i64 @rt_cdr(i64)
declare i64 @rt_box(i64)
declare i64 @rt_unbox(i64)
declare i64 @rt_set_box(i64, i64)
declare i64 @rt_add(i64, i64)
declare i64 @rt_sub(i64, i64)
declare i64 @rt_mul(i64, i64)
declare i64 @rt_quotient(i64, i64)
declare i64 @rt_remainder(i64, i64)
declare i64 @rt_num_eq(i64, i64)
declare i64 @rt_lt(i64, i64)
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
declare i64 @rt_symbol_p(i64)
declare i64 @rt_string_p(i64)
declare i64 @rt_char_p(i64)
declare i64 @rt_boolean_p(i64)
declare i64 @rt_integer_p(i64)
declare i64 @rt_exact_p(i64)
declare i64 @rt_read_all_stdin()
declare i64 @rt_no_prelude_p()
declare i64 @rt_repl_mode()
declare i64 @rt_repl_input()
declare i64 @rt_repl_state_ref()
declare i64 @rt_repl_state_set(i64)
declare i64 @rt_root(i64)
declare i64 @rt_display(i64)
declare i64 @rt_list_length(i64)
declare i64 @rt_build_rest(i64, i64, i64, ptr, ptr)
declare ptr @rt_apply_argv(i64, ptr, i64, i64)
declare void @rt_arity_error(i64, i64)
declare i64 @rt_error(i64, i64)
declare i64 @rt_raise(i64)
declare i64 @rt_run_guarded(ptr, i64)
declare i64 @rt_error_object_p(i64)
declare i64 @rt_error_object_message(i64)
declare i64 @rt_error_object_irritants(i64)

@.str.lit.0 = private unnamed_addr constant [1 x i8] c"\00"
@.str.lit.1 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.lit.2 = private unnamed_addr constant [3 x i8] c": \00"
@.str.lit.3 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.4 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.5 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.6 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.7 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.8 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.9 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.10 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.11 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.12 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.13 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.14 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.15 = private unnamed_addr constant [8 x i8] c"unquote\00"
@"scheme.base:__inited" = global i64 0
@"scheme.base:list" = global i64 0
@"scheme.base:caar" = global i64 0
@"scheme.base:cadr" = global i64 0
@"scheme.base:cdar" = global i64 0
@"scheme.base:cddr" = global i64 0
@"scheme.base:caaar" = global i64 0
@"scheme.base:caadr" = global i64 0
@"scheme.base:cadar" = global i64 0
@"scheme.base:caddr" = global i64 0
@"scheme.base:cdaar" = global i64 0
@"scheme.base:cdadr" = global i64 0
@"scheme.base:cddar" = global i64 0
@"scheme.base:cdddr" = global i64 0
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
@"scheme.base:assoc" = global i64 0
@"scheme.base:filter" = global i64 0
@"scheme.base:fold-left" = global i64 0
@"scheme.base:fold-right" = global i64 0
@"scheme.base:%for-each1" = global i64 0
@"scheme.base:%for-eachn" = global i64 0
@"scheme.base:for-each" = global i64 0
@"scheme.base:andmap" = global i64 0
@"scheme.base:memp" = global i64 0
@"scheme.base:cadddr" = global i64 0
@"scheme.base:list?" = global i64 0
@"scheme.base:zero?" = global i64 0
@"scheme.base:list-tail" = global i64 0
@"scheme.base:list-ref" = global i64 0
@"scheme.base:list-head" = global i64 0
@"scheme.base:make-list" = global i64 0
@"scheme.base:iota" = global i64 0
@"scheme.base:max" = global i64 0
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
@"scheme.base:number->string" = global i64 0
@"scheme.base:error" = global i64 0
@"scheme.base:raise" = global i64 0
@"scheme.base:error-object?" = global i64 0
@"scheme.base:error-object-message" = global i64 0
@"scheme.base:error-object-irritants" = global i64 0
@"scheme.base:list->vector" = global i64 0
@"scheme.base:vector" = global i64 0
@"scheme.base:list->bytevector" = global i64 0
@"scheme.base:bytevector" = global i64 0
@"scheme.base:rd-ws?" = global i64 0
@"scheme.base:rd-digit?" = global i64 0
@"scheme.base:rd-delim?" = global i64 0
@"scheme.base:rd-skip-line" = global i64 0
@"scheme.base:rd-skip-ws" = global i64 0
@"scheme.base:rd-token-end" = global i64 0
@"scheme.base:rd-all-digits?" = global i64 0
@"scheme.base:rd-numeric?" = global i64 0
@"scheme.base:rd-digits" = global i64 0
@"scheme.base:rd-parse-int" = global i64 0
@"scheme.base:rd-atom" = global i64 0
@"scheme.base:rd-hex-digit" = global i64 0
@"scheme.base:rd-hex" = global i64 0
@"scheme.base:rd-str-esc" = global i64 0
@"scheme.base:rd-string" = global i64 0
@"scheme.base:rd-hash" = global i64 0
@"scheme.base:rd-char-name" = global i64 0
@"scheme.base:rd-char" = global i64 0
@"scheme.base:rd-quote" = global i64 0
@"scheme.base:rd-quasi" = global i64 0
@"scheme.base:rd-unquote" = global i64 0
@"scheme.base:rd-dot?" = global i64 0
@"scheme.base:rd-append-reverse" = global i64 0
@"scheme.base:rd-list" = global i64 0
@"scheme.base:rd-datum" = global i64 0
@"scheme.base:read-from-string" = global i64 0
@"scheme.base:read-all-from-string" = global i64 0
define fastcc i64 @"scheme.base:code_1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1 = icmp sge i64 %argc, 0
  br i1 %t1, label %argok2, label %arityerr1
arityerr1:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok2:
  %t2 = call i64 @rt_alloc_words(i64 8)
  %t3 = inttoptr i64 %t2 to ptr
  %t4 = getelementptr i64, ptr %t3, i64 0
  store i64 %a0, ptr %t4
  %t5 = getelementptr i64, ptr %t3, i64 1
  store i64 %a1, ptr %t5
  %t6 = getelementptr i64, ptr %t3, i64 2
  store i64 %a2, ptr %t6
  %t7 = getelementptr i64, ptr %t3, i64 3
  store i64 %a3, ptr %t7
  %t8 = getelementptr i64, ptr %t3, i64 4
  store i64 %a4, ptr %t8
  %t9 = getelementptr i64, ptr %t3, i64 5
  store i64 %a5, ptr %t9
  %t10 = getelementptr i64, ptr %t3, i64 6
  store i64 %a6, ptr %t10
  %t11 = getelementptr i64, ptr %t3, i64 7
  store i64 %a7, ptr %t11
  %t12 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3, ptr %overflow)
  ret i64 %t12
}

define fastcc i64 @"scheme.base:code_4"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t17 = icmp eq i64 %argc, 1
  br i1 %t17, label %argok4, label %arityerr3
arityerr3:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok4:
  %t18 = call i64 @rt_car(i64 %a0)
  %t19 = call i64 @rt_car(i64 %t18)
  ret i64 %t19
}

define fastcc i64 @"scheme.base:code_7"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t24 = icmp eq i64 %argc, 1
  br i1 %t24, label %argok6, label %arityerr5
arityerr5:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok6:
  %t25 = call i64 @rt_cdr(i64 %a0)
  %t26 = call i64 @rt_car(i64 %t25)
  ret i64 %t26
}

define fastcc i64 @"scheme.base:code_10"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t31 = icmp eq i64 %argc, 1
  br i1 %t31, label %argok8, label %arityerr7
arityerr7:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok8:
  %t32 = call i64 @rt_car(i64 %a0)
  %t33 = call i64 @rt_cdr(i64 %t32)
  ret i64 %t33
}

define fastcc i64 @"scheme.base:code_13"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t38 = icmp eq i64 %argc, 1
  br i1 %t38, label %argok10, label %arityerr9
arityerr9:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok10:
  %t39 = call i64 @rt_cdr(i64 %a0)
  %t40 = call i64 @rt_cdr(i64 %t39)
  ret i64 %t40
}

define fastcc i64 @"scheme.base:code_16"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t45 = icmp eq i64 %argc, 1
  br i1 %t45, label %argok12, label %arityerr11
arityerr11:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok12:
  %t46 = load i64, ptr @"scheme.base:caar"
  %t47 = and i64 %t46, -8
  %t48 = inttoptr i64 %t47 to ptr
  %t49 = load i64, ptr %t48
  %t50 = inttoptr i64 %t49 to ptr
  %t51 = call fastcc i64%t50(i64 %t46, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t52 = call i64 @rt_car(i64 %t51)
  ret i64 %t52
}

define fastcc i64 @"scheme.base:code_19"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t57 = icmp eq i64 %argc, 1
  br i1 %t57, label %argok14, label %arityerr13
arityerr13:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok14:
  %t58 = load i64, ptr @"scheme.base:cadr"
  %t59 = and i64 %t58, -8
  %t60 = inttoptr i64 %t59 to ptr
  %t61 = load i64, ptr %t60
  %t62 = inttoptr i64 %t61 to ptr
  %t63 = call fastcc i64%t62(i64 %t58, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t64 = call i64 @rt_car(i64 %t63)
  ret i64 %t64
}

define fastcc i64 @"scheme.base:code_22"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t69 = icmp eq i64 %argc, 1
  br i1 %t69, label %argok16, label %arityerr15
arityerr15:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok16:
  %t70 = load i64, ptr @"scheme.base:cdar"
  %t71 = and i64 %t70, -8
  %t72 = inttoptr i64 %t71 to ptr
  %t73 = load i64, ptr %t72
  %t74 = inttoptr i64 %t73 to ptr
  %t75 = call fastcc i64%t74(i64 %t70, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t76 = call i64 @rt_car(i64 %t75)
  ret i64 %t76
}

define fastcc i64 @"scheme.base:code_25"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t81 = icmp eq i64 %argc, 1
  br i1 %t81, label %argok18, label %arityerr17
arityerr17:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok18:
  %t82 = load i64, ptr @"scheme.base:cddr"
  %t83 = and i64 %t82, -8
  %t84 = inttoptr i64 %t83 to ptr
  %t85 = load i64, ptr %t84
  %t86 = inttoptr i64 %t85 to ptr
  %t87 = call fastcc i64%t86(i64 %t82, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t88 = call i64 @rt_car(i64 %t87)
  ret i64 %t88
}

define fastcc i64 @"scheme.base:code_28"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t93 = icmp eq i64 %argc, 1
  br i1 %t93, label %argok20, label %arityerr19
arityerr19:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok20:
  %t94 = load i64, ptr @"scheme.base:caar"
  %t95 = and i64 %t94, -8
  %t96 = inttoptr i64 %t95 to ptr
  %t97 = load i64, ptr %t96
  %t98 = inttoptr i64 %t97 to ptr
  %t99 = call fastcc i64%t98(i64 %t94, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t100 = call i64 @rt_cdr(i64 %t99)
  ret i64 %t100
}

define fastcc i64 @"scheme.base:code_31"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t105 = icmp eq i64 %argc, 1
  br i1 %t105, label %argok22, label %arityerr21
arityerr21:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok22:
  %t106 = load i64, ptr @"scheme.base:cadr"
  %t107 = and i64 %t106, -8
  %t108 = inttoptr i64 %t107 to ptr
  %t109 = load i64, ptr %t108
  %t110 = inttoptr i64 %t109 to ptr
  %t111 = call fastcc i64%t110(i64 %t106, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t112 = call i64 @rt_cdr(i64 %t111)
  ret i64 %t112
}

define fastcc i64 @"scheme.base:code_34"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t117 = icmp eq i64 %argc, 1
  br i1 %t117, label %argok24, label %arityerr23
arityerr23:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok24:
  %t118 = load i64, ptr @"scheme.base:cdar"
  %t119 = and i64 %t118, -8
  %t120 = inttoptr i64 %t119 to ptr
  %t121 = load i64, ptr %t120
  %t122 = inttoptr i64 %t121 to ptr
  %t123 = call fastcc i64%t122(i64 %t118, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t124 = call i64 @rt_cdr(i64 %t123)
  ret i64 %t124
}

define fastcc i64 @"scheme.base:code_37"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t129 = icmp eq i64 %argc, 1
  br i1 %t129, label %argok26, label %arityerr25
arityerr25:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok26:
  %t130 = load i64, ptr @"scheme.base:cddr"
  %t131 = and i64 %t130, -8
  %t132 = inttoptr i64 %t131 to ptr
  %t133 = load i64, ptr %t132
  %t134 = inttoptr i64 %t133 to ptr
  %t135 = call fastcc i64%t134(i64 %t130, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t136 = call i64 @rt_cdr(i64 %t135)
  ret i64 %t136
}

define fastcc i64 @"scheme.base:code_45"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t141 = icmp eq i64 %argc, 2
  br i1 %t141, label %argok28, label %arityerr27
arityerr27:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok28:
  %t142 = call i64 @rt_null_p(i64 %a0)
  %t143 = icmp ne i64 %t142, 1
  br i1 %t143, label %then29, label %else30
then29:
  ret i64 %a1
else30:
  %t144 = call i64 @rt_cdr(i64 %a0)
  %t145 = call i64 @rt_add(i64 %a1, i64 8)
  %t146 = and i64 %self, -8
  %t147 = inttoptr i64 %t146 to ptr
  %t148 = getelementptr i64, ptr %t147, i64 1
  %t149 = load i64, ptr %t148
  %t150 = and i64 %t149, -8
  %t151 = inttoptr i64 %t150 to ptr
  %t152 = load i64, ptr %t151
  %t153 = inttoptr i64 %t152 to ptr
  %t154 = musttail call fastcc i64 %t153(i64 %t149, i64 2, i64 %t144, i64 %t145, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t154
}

define fastcc i64 @"scheme.base:code_43"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t155 = icmp eq i64 %argc, 1
  br i1 %t155, label %argok32, label %arityerr31
arityerr31:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok32:
  %t156 = call i64 @rt_alloc_words(i64 2)
  %t157 = inttoptr i64 %t156 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_45" to i64), ptr %t157
  %t158 = or i64 %t156, 4
  %t159 = getelementptr i64, ptr %t157, i64 1
  store i64 %t158, ptr %t159
  %t160 = and i64 %t158, -8
  %t161 = inttoptr i64 %t160 to ptr
  %t162 = load i64, ptr %t161
  %t163 = inttoptr i64 %t162 to ptr
  %t164 = musttail call fastcc i64 %t163(i64 %t158, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t164
}

define fastcc i64 @"scheme.base:code_53"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t169 = icmp eq i64 %argc, 2
  br i1 %t169, label %argok34, label %arityerr33
arityerr33:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok34:
  %t170 = call i64 @rt_null_p(i64 %a0)
  %t171 = icmp ne i64 %t170, 1
  br i1 %t171, label %then35, label %else36
then35:
  ret i64 %a1
else36:
  %t172 = call i64 @rt_cdr(i64 %a0)
  %t173 = call i64 @rt_car(i64 %a0)
  %t174 = call i64 @rt_cons(i64 %t173, i64 %a1)
  %t175 = and i64 %self, -8
  %t176 = inttoptr i64 %t175 to ptr
  %t177 = getelementptr i64, ptr %t176, i64 1
  %t178 = load i64, ptr %t177
  %t179 = and i64 %t178, -8
  %t180 = inttoptr i64 %t179 to ptr
  %t181 = load i64, ptr %t180
  %t182 = inttoptr i64 %t181 to ptr
  %t183 = musttail call fastcc i64 %t182(i64 %t178, i64 2, i64 %t172, i64 %t174, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t183
}

define fastcc i64 @"scheme.base:code_51"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t184 = icmp eq i64 %argc, 1
  br i1 %t184, label %argok38, label %arityerr37
arityerr37:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok38:
  %t185 = call i64 @rt_alloc_words(i64 2)
  %t186 = inttoptr i64 %t185 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_53" to i64), ptr %t186
  %t187 = or i64 %t185, 4
  %t188 = getelementptr i64, ptr %t186, i64 1
  store i64 %t187, ptr %t188
  %t189 = and i64 %t187, -8
  %t190 = inttoptr i64 %t189 to ptr
  %t191 = load i64, ptr %t190
  %t192 = inttoptr i64 %t191 to ptr
  %t193 = musttail call fastcc i64 %t192(i64 %t187, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t193
}

define fastcc i64 @"scheme.base:code_57"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t198 = icmp eq i64 %argc, 2
  br i1 %t198, label %argok40, label %arityerr39
arityerr39:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok40:
  %t199 = call i64 @rt_null_p(i64 %a0)
  %t200 = icmp ne i64 %t199, 1
  br i1 %t200, label %then41, label %else42
then41:
  ret i64 %a1
else42:
  %t201 = call i64 @rt_car(i64 %a0)
  %t202 = call i64 @rt_cdr(i64 %a0)
  %t203 = load i64, ptr @"scheme.base:%append2"
  %t204 = and i64 %t203, -8
  %t205 = inttoptr i64 %t204 to ptr
  %t206 = load i64, ptr %t205
  %t207 = inttoptr i64 %t206 to ptr
  %t208 = call fastcc i64%t207(i64 %t203, i64 2, i64 %t202, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t209 = call i64 @rt_cons(i64 %t201, i64 %t208)
  ret i64 %t209
}

define fastcc i64 @"scheme.base:code_60"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t214 = icmp sge i64 %argc, 0
  br i1 %t214, label %argok44, label %arityerr43
arityerr43:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok44:
  %t215 = call i64 @rt_alloc_words(i64 8)
  %t216 = inttoptr i64 %t215 to ptr
  %t217 = getelementptr i64, ptr %t216, i64 0
  store i64 %a0, ptr %t217
  %t218 = getelementptr i64, ptr %t216, i64 1
  store i64 %a1, ptr %t218
  %t219 = getelementptr i64, ptr %t216, i64 2
  store i64 %a2, ptr %t219
  %t220 = getelementptr i64, ptr %t216, i64 3
  store i64 %a3, ptr %t220
  %t221 = getelementptr i64, ptr %t216, i64 4
  store i64 %a4, ptr %t221
  %t222 = getelementptr i64, ptr %t216, i64 5
  store i64 %a5, ptr %t222
  %t223 = getelementptr i64, ptr %t216, i64 6
  store i64 %a6, ptr %t223
  %t224 = getelementptr i64, ptr %t216, i64 7
  store i64 %a7, ptr %t224
  %t225 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t216, ptr %overflow)
  %t226 = call i64 @rt_null_p(i64 %t225)
  %t227 = icmp ne i64 %t226, 1
  br i1 %t227, label %then45, label %else46
then45:
  ret i64 2
else46:
  %t228 = call i64 @rt_cdr(i64 %t225)
  %t229 = call i64 @rt_null_p(i64 %t228)
  %t230 = icmp ne i64 %t229, 1
  br i1 %t230, label %then47, label %else48
then47:
  %t231 = call i64 @rt_car(i64 %t225)
  ret i64 %t231
else48:
  %t232 = call i64 @rt_car(i64 %t225)
  %t233 = call i64 @rt_cdr(i64 %t225)
  %t234 = load i64, ptr @"scheme.base:append"
  %t235 = and i64 %t234, -8
  %t236 = inttoptr i64 %t235 to ptr
  %t237 = load i64, ptr %t236
  %t238 = inttoptr i64 %t237 to ptr
  %t239 = call i64 @rt_list_length(i64 %t233)
  %t240 = add i64 0, %t239
  %t241 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t233, i64 8)
  %t253 = getelementptr i64, ptr %t241, i64 0
  %t245 = load i64, ptr %t253
  %t254 = getelementptr i64, ptr %t241, i64 1
  %t246 = load i64, ptr %t254
  %t255 = getelementptr i64, ptr %t241, i64 2
  %t247 = load i64, ptr %t255
  %t256 = getelementptr i64, ptr %t241, i64 3
  %t248 = load i64, ptr %t256
  %t257 = getelementptr i64, ptr %t241, i64 4
  %t249 = load i64, ptr %t257
  %t258 = getelementptr i64, ptr %t241, i64 5
  %t250 = load i64, ptr %t258
  %t259 = getelementptr i64, ptr %t241, i64 6
  %t251 = load i64, ptr %t259
  %t260 = getelementptr i64, ptr %t241, i64 7
  %t252 = load i64, ptr %t260
  %t242 = icmp sgt i64 %t240, 8
  %t243 = getelementptr i64, ptr %t241, i64 8
  %t244 = select i1 %t242, ptr %t243, ptr null
  %t261 = call fastcc i64%t238(i64 %t234, i64 %t240, i64 %t245, i64 %t246, i64 %t247, i64 %t248, i64 %t249, i64 %t250, i64 %t251, i64 %t252, ptr %t244)
  %t262 = load i64, ptr @"scheme.base:%append2"
  %t263 = and i64 %t262, -8
  %t264 = inttoptr i64 %t263 to ptr
  %t265 = load i64, ptr %t264
  %t266 = inttoptr i64 %t265 to ptr
  %t267 = musttail call fastcc i64 %t266(i64 %t262, i64 2, i64 %t232, i64 %t261, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t267
}

define fastcc i64 @"scheme.base:code_64"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t272 = icmp eq i64 %argc, 2
  br i1 %t272, label %argok50, label %arityerr49
arityerr49:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok50:
  %t273 = call i64 @rt_null_p(i64 %a1)
  %t274 = icmp ne i64 %t273, 1
  br i1 %t274, label %then51, label %else52
then51:
  ret i64 2
else52:
  %t275 = call i64 @rt_car(i64 %a1)
  %t276 = and i64 %a0, -8
  %t277 = inttoptr i64 %t276 to ptr
  %t278 = load i64, ptr %t277
  %t279 = inttoptr i64 %t278 to ptr
  %t280 = call fastcc i64%t279(i64 %a0, i64 1, i64 %t275, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t281 = call i64 @rt_cdr(i64 %a1)
  %t282 = load i64, ptr @"scheme.base:%map1"
  %t283 = and i64 %t282, -8
  %t284 = inttoptr i64 %t283 to ptr
  %t285 = load i64, ptr %t284
  %t286 = inttoptr i64 %t285 to ptr
  %t287 = call fastcc i64%t286(i64 %t282, i64 2, i64 %a0, i64 %t281, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t288 = call i64 @rt_cons(i64 %t280, i64 %t287)
  ret i64 %t288
}

define fastcc i64 @"scheme.base:code_67"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t293 = icmp eq i64 %argc, 1
  br i1 %t293, label %argok54, label %arityerr53
arityerr53:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok54:
  %t294 = call i64 @rt_null_p(i64 %a0)
  %t295 = icmp ne i64 %t294, 1
  br i1 %t295, label %then55, label %else56
then55:
  ret i64 1
else56:
  %t296 = call i64 @rt_car(i64 %a0)
  %t297 = call i64 @rt_null_p(i64 %t296)
  %t298 = icmp ne i64 %t297, 1
  br i1 %t298, label %then57, label %else58
then57:
  ret i64 257
else58:
  %t299 = call i64 @rt_cdr(i64 %a0)
  %t300 = load i64, ptr @"scheme.base:%any-null?"
  %t301 = and i64 %t300, -8
  %t302 = inttoptr i64 %t301 to ptr
  %t303 = load i64, ptr %t302
  %t304 = inttoptr i64 %t303 to ptr
  %t305 = musttail call fastcc i64 %t304(i64 %t300, i64 1, i64 %t299, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t305
}

define fastcc i64 @"scheme.base:code_75"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t310 = icmp eq i64 %argc, 1
  br i1 %t310, label %argok60, label %arityerr59
arityerr59:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok60:
  %t311 = call i64 @rt_car(i64 %a0)
  ret i64 %t311
}

define fastcc i64 @"scheme.base:code_77"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t312 = icmp eq i64 %argc, 1
  br i1 %t312, label %argok62, label %arityerr61
arityerr61:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok62:
  %t313 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t313
}

define fastcc i64 @"scheme.base:code_73"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t314 = icmp eq i64 %argc, 2
  br i1 %t314, label %argok64, label %arityerr63
arityerr63:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok64:
  %t315 = load i64, ptr @"scheme.base:%any-null?"
  %t316 = and i64 %t315, -8
  %t317 = inttoptr i64 %t316 to ptr
  %t318 = load i64, ptr %t317
  %t319 = inttoptr i64 %t318 to ptr
  %t320 = call fastcc i64%t319(i64 %t315, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t321 = icmp ne i64 %t320, 1
  br i1 %t321, label %then65, label %else66
then65:
  ret i64 2
else66:
  %t322 = call i64 @rt_alloc_words(i64 1)
  %t323 = inttoptr i64 %t322 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_75" to i64), ptr %t323
  %t324 = or i64 %t322, 4
  %t325 = load i64, ptr @"scheme.base:%map1"
  %t326 = and i64 %t325, -8
  %t327 = inttoptr i64 %t326 to ptr
  %t328 = load i64, ptr %t327
  %t329 = inttoptr i64 %t328 to ptr
  %t330 = call fastcc i64%t329(i64 %t325, i64 2, i64 %t324, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t331 = and i64 %a0, -8
  %t332 = inttoptr i64 %t331 to ptr
  %t333 = load i64, ptr %t332
  %t334 = inttoptr i64 %t333 to ptr
  %t335 = call i64 @rt_list_length(i64 %t330)
  %t336 = add i64 0, %t335
  %t337 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t330, i64 8)
  %t349 = getelementptr i64, ptr %t337, i64 0
  %t341 = load i64, ptr %t349
  %t350 = getelementptr i64, ptr %t337, i64 1
  %t342 = load i64, ptr %t350
  %t351 = getelementptr i64, ptr %t337, i64 2
  %t343 = load i64, ptr %t351
  %t352 = getelementptr i64, ptr %t337, i64 3
  %t344 = load i64, ptr %t352
  %t353 = getelementptr i64, ptr %t337, i64 4
  %t345 = load i64, ptr %t353
  %t354 = getelementptr i64, ptr %t337, i64 5
  %t346 = load i64, ptr %t354
  %t355 = getelementptr i64, ptr %t337, i64 6
  %t347 = load i64, ptr %t355
  %t356 = getelementptr i64, ptr %t337, i64 7
  %t348 = load i64, ptr %t356
  %t338 = icmp sgt i64 %t336, 8
  %t339 = getelementptr i64, ptr %t337, i64 8
  %t340 = select i1 %t338, ptr %t339, ptr null
  %t357 = call fastcc i64%t334(i64 %a0, i64 %t336, i64 %t341, i64 %t342, i64 %t343, i64 %t344, i64 %t345, i64 %t346, i64 %t347, i64 %t348, ptr %t340)
  %t358 = call i64 @rt_alloc_words(i64 1)
  %t359 = inttoptr i64 %t358 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_77" to i64), ptr %t359
  %t360 = or i64 %t358, 4
  %t361 = load i64, ptr @"scheme.base:%map1"
  %t362 = and i64 %t361, -8
  %t363 = inttoptr i64 %t362 to ptr
  %t364 = load i64, ptr %t363
  %t365 = inttoptr i64 %t364 to ptr
  %t366 = call fastcc i64%t365(i64 %t361, i64 2, i64 %t360, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t367 = load i64, ptr @"scheme.base:%mapn"
  %t368 = and i64 %t367, -8
  %t369 = inttoptr i64 %t368 to ptr
  %t370 = load i64, ptr %t369
  %t371 = inttoptr i64 %t370 to ptr
  %t372 = call fastcc i64%t371(i64 %t367, i64 2, i64 %a0, i64 %t366, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t373 = call i64 @rt_cons(i64 %t357, i64 %t372)
  ret i64 %t373
}

define fastcc i64 @"scheme.base:code_82"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t378 = icmp sge i64 %argc, 2
  br i1 %t378, label %argok68, label %arityerr67
arityerr67:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok68:
  %t379 = call i64 @rt_alloc_words(i64 8)
  %t380 = inttoptr i64 %t379 to ptr
  %t381 = getelementptr i64, ptr %t380, i64 0
  store i64 %a0, ptr %t381
  %t382 = getelementptr i64, ptr %t380, i64 1
  store i64 %a1, ptr %t382
  %t383 = getelementptr i64, ptr %t380, i64 2
  store i64 %a2, ptr %t383
  %t384 = getelementptr i64, ptr %t380, i64 3
  store i64 %a3, ptr %t384
  %t385 = getelementptr i64, ptr %t380, i64 4
  store i64 %a4, ptr %t385
  %t386 = getelementptr i64, ptr %t380, i64 5
  store i64 %a5, ptr %t386
  %t387 = getelementptr i64, ptr %t380, i64 6
  store i64 %a6, ptr %t387
  %t388 = getelementptr i64, ptr %t380, i64 7
  store i64 %a7, ptr %t388
  %t389 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t380, ptr %overflow)
  %t390 = call i64 @rt_null_p(i64 %t389)
  %t391 = icmp ne i64 %t390, 1
  br i1 %t391, label %then69, label %else70
then69:
  %t392 = load i64, ptr @"scheme.base:%map1"
  %t393 = and i64 %t392, -8
  %t394 = inttoptr i64 %t393 to ptr
  %t395 = load i64, ptr %t394
  %t396 = inttoptr i64 %t395 to ptr
  %t397 = musttail call fastcc i64 %t396(i64 %t392, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t397
else70:
  %t398 = call i64 @rt_cons(i64 %a1, i64 %t389)
  %t399 = load i64, ptr @"scheme.base:%mapn"
  %t400 = and i64 %t399, -8
  %t401 = inttoptr i64 %t400 to ptr
  %t402 = load i64, ptr %t401
  %t403 = inttoptr i64 %t402 to ptr
  %t404 = musttail call fastcc i64 %t403(i64 %t399, i64 2, i64 %a0, i64 %t398, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t404
}

define fastcc i64 @"scheme.base:code_90"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t409 = icmp eq i64 %argc, 2
  br i1 %t409, label %argok72, label %arityerr71
arityerr71:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok72:
  %t410 = call i64 @rt_null_p(i64 %a1)
  %t411 = icmp ne i64 %t410, 1
  br i1 %t411, label %then73, label %else74
then73:
  ret i64 1
else74:
  %t412 = call i64 @rt_car(i64 %a1)
  %t413 = call i64 @rt_eq_p(i64 %a0, i64 %t412)
  %t414 = icmp ne i64 %t413, 1
  br i1 %t414, label %then75, label %else76
then75:
  ret i64 %a1
else76:
  %t415 = call i64 @rt_cdr(i64 %a1)
  %t416 = load i64, ptr @"scheme.base:memq"
  %t417 = and i64 %t416, -8
  %t418 = inttoptr i64 %t417 to ptr
  %t419 = load i64, ptr %t418
  %t420 = inttoptr i64 %t419 to ptr
  %t421 = musttail call fastcc i64 %t420(i64 %t416, i64 2, i64 %a0, i64 %t415, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t421
}

define fastcc i64 @"scheme.base:code_98"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t426 = icmp eq i64 %argc, 2
  br i1 %t426, label %argok78, label %arityerr77
arityerr77:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok78:
  %t427 = call i64 @rt_null_p(i64 %a1)
  %t428 = icmp ne i64 %t427, 1
  br i1 %t428, label %then79, label %else80
then79:
  ret i64 1
else80:
  %t429 = call i64 @rt_car(i64 %a1)
  %t430 = call i64 @rt_eqv_p(i64 %a0, i64 %t429)
  %t431 = icmp ne i64 %t430, 1
  br i1 %t431, label %then81, label %else82
then81:
  ret i64 %a1
else82:
  %t432 = call i64 @rt_cdr(i64 %a1)
  %t433 = load i64, ptr @"scheme.base:memv"
  %t434 = and i64 %t433, -8
  %t435 = inttoptr i64 %t434 to ptr
  %t436 = load i64, ptr %t435
  %t437 = inttoptr i64 %t436 to ptr
  %t438 = musttail call fastcc i64 %t437(i64 %t433, i64 2, i64 %a0, i64 %t432, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t438
}

define fastcc i64 @"scheme.base:code_106"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t443 = icmp eq i64 %argc, 2
  br i1 %t443, label %argok84, label %arityerr83
arityerr83:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok84:
  %t444 = call i64 @rt_null_p(i64 %a1)
  %t445 = icmp ne i64 %t444, 1
  br i1 %t445, label %then85, label %else86
then85:
  ret i64 1
else86:
  %t446 = call i64 @rt_car(i64 %a1)
  %t447 = call i64 @rt_car(i64 %t446)
  %t448 = call i64 @rt_eq_p(i64 %a0, i64 %t447)
  %t449 = icmp ne i64 %t448, 1
  br i1 %t449, label %then87, label %else88
then87:
  %t450 = call i64 @rt_car(i64 %a1)
  ret i64 %t450
else88:
  %t451 = call i64 @rt_cdr(i64 %a1)
  %t452 = load i64, ptr @"scheme.base:assq"
  %t453 = and i64 %t452, -8
  %t454 = inttoptr i64 %t453 to ptr
  %t455 = load i64, ptr %t454
  %t456 = inttoptr i64 %t455 to ptr
  %t457 = musttail call fastcc i64 %t456(i64 %t452, i64 2, i64 %a0, i64 %t451, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t457
}

define fastcc i64 @"scheme.base:code_110"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t462 = icmp eq i64 %argc, 2
  br i1 %t462, label %argok90, label %arityerr89
arityerr89:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok90:
  %t463 = call i64 @rt_null_p(i64 %a1)
  %t464 = icmp ne i64 %t463, 1
  br i1 %t464, label %then91, label %else92
then91:
  ret i64 1
else92:
  %t465 = call i64 @rt_car(i64 %a1)
  %t466 = call i64 @rt_equal(i64 %a0, i64 %t465)
  %t467 = icmp ne i64 %t466, 1
  br i1 %t467, label %then93, label %else94
then93:
  ret i64 %a1
else94:
  %t468 = call i64 @rt_cdr(i64 %a1)
  %t469 = load i64, ptr @"scheme.base:member"
  %t470 = and i64 %t469, -8
  %t471 = inttoptr i64 %t470 to ptr
  %t472 = load i64, ptr %t471
  %t473 = inttoptr i64 %t472 to ptr
  %t474 = musttail call fastcc i64 %t473(i64 %t469, i64 2, i64 %a0, i64 %t468, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t474
}

define fastcc i64 @"scheme.base:code_114"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t479 = icmp eq i64 %argc, 2
  br i1 %t479, label %argok96, label %arityerr95
arityerr95:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok96:
  %t480 = call i64 @rt_null_p(i64 %a1)
  %t481 = icmp ne i64 %t480, 1
  br i1 %t481, label %then97, label %else98
then97:
  ret i64 1
else98:
  %t482 = call i64 @rt_car(i64 %a1)
  %t483 = call i64 @rt_car(i64 %t482)
  %t484 = call i64 @rt_equal(i64 %a0, i64 %t483)
  %t485 = icmp ne i64 %t484, 1
  br i1 %t485, label %then99, label %else100
then99:
  %t486 = call i64 @rt_car(i64 %a1)
  ret i64 %t486
else100:
  %t487 = call i64 @rt_cdr(i64 %a1)
  %t488 = load i64, ptr @"scheme.base:assoc"
  %t489 = and i64 %t488, -8
  %t490 = inttoptr i64 %t489 to ptr
  %t491 = load i64, ptr %t490
  %t492 = inttoptr i64 %t491 to ptr
  %t493 = musttail call fastcc i64 %t492(i64 %t488, i64 2, i64 %a0, i64 %t487, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t493
}

define fastcc i64 @"scheme.base:code_118"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t498 = icmp eq i64 %argc, 2
  br i1 %t498, label %argok102, label %arityerr101
arityerr101:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok102:
  %t499 = call i64 @rt_null_p(i64 %a1)
  %t500 = icmp ne i64 %t499, 1
  br i1 %t500, label %then103, label %else104
then103:
  ret i64 2
else104:
  %t501 = call i64 @rt_car(i64 %a1)
  %t502 = and i64 %a0, -8
  %t503 = inttoptr i64 %t502 to ptr
  %t504 = load i64, ptr %t503
  %t505 = inttoptr i64 %t504 to ptr
  %t506 = call fastcc i64%t505(i64 %a0, i64 1, i64 %t501, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t507 = icmp ne i64 %t506, 1
  br i1 %t507, label %then105, label %else106
then105:
  %t508 = call i64 @rt_car(i64 %a1)
  %t509 = call i64 @rt_cdr(i64 %a1)
  %t510 = load i64, ptr @"scheme.base:filter"
  %t511 = and i64 %t510, -8
  %t512 = inttoptr i64 %t511 to ptr
  %t513 = load i64, ptr %t512
  %t514 = inttoptr i64 %t513 to ptr
  %t515 = call fastcc i64%t514(i64 %t510, i64 2, i64 %a0, i64 %t509, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t516 = call i64 @rt_cons(i64 %t508, i64 %t515)
  ret i64 %t516
else106:
  %t517 = call i64 @rt_cdr(i64 %a1)
  %t518 = load i64, ptr @"scheme.base:filter"
  %t519 = and i64 %t518, -8
  %t520 = inttoptr i64 %t519 to ptr
  %t521 = load i64, ptr %t520
  %t522 = inttoptr i64 %t521 to ptr
  %t523 = musttail call fastcc i64 %t522(i64 %t518, i64 2, i64 %a0, i64 %t517, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t523
}

define fastcc i64 @"scheme.base:code_123"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t528 = icmp eq i64 %argc, 3
  br i1 %t528, label %argok108, label %arityerr107
arityerr107:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok108:
  %t529 = call i64 @rt_null_p(i64 %a2)
  %t530 = icmp ne i64 %t529, 1
  br i1 %t530, label %then109, label %else110
then109:
  ret i64 %a1
else110:
  %t531 = call i64 @rt_car(i64 %a2)
  %t532 = and i64 %a0, -8
  %t533 = inttoptr i64 %t532 to ptr
  %t534 = load i64, ptr %t533
  %t535 = inttoptr i64 %t534 to ptr
  %t536 = call fastcc i64%t535(i64 %a0, i64 2, i64 %a1, i64 %t531, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t537 = call i64 @rt_cdr(i64 %a2)
  %t538 = load i64, ptr @"scheme.base:fold-left"
  %t539 = and i64 %t538, -8
  %t540 = inttoptr i64 %t539 to ptr
  %t541 = load i64, ptr %t540
  %t542 = inttoptr i64 %t541 to ptr
  %t543 = musttail call fastcc i64 %t542(i64 %t538, i64 3, i64 %a0, i64 %t536, i64 %t537, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t543
}

define fastcc i64 @"scheme.base:code_128"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t548 = icmp eq i64 %argc, 3
  br i1 %t548, label %argok112, label %arityerr111
arityerr111:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok112:
  %t549 = call i64 @rt_null_p(i64 %a2)
  %t550 = icmp ne i64 %t549, 1
  br i1 %t550, label %then113, label %else114
then113:
  ret i64 %a1
else114:
  %t551 = call i64 @rt_car(i64 %a2)
  %t552 = call i64 @rt_cdr(i64 %a2)
  %t553 = load i64, ptr @"scheme.base:fold-right"
  %t554 = and i64 %t553, -8
  %t555 = inttoptr i64 %t554 to ptr
  %t556 = load i64, ptr %t555
  %t557 = inttoptr i64 %t556 to ptr
  %t558 = call fastcc i64%t557(i64 %t553, i64 3, i64 %a0, i64 %a1, i64 %t552, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t559 = and i64 %a0, -8
  %t560 = inttoptr i64 %t559 to ptr
  %t561 = load i64, ptr %t560
  %t562 = inttoptr i64 %t561 to ptr
  %t563 = musttail call fastcc i64 %t562(i64 %a0, i64 2, i64 %t551, i64 %t558, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t563
}

define fastcc i64 @"scheme.base:code_132"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t568 = icmp eq i64 %argc, 2
  br i1 %t568, label %argok116, label %arityerr115
arityerr115:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok116:
  %t569 = call i64 @rt_null_p(i64 %a1)
  %t570 = icmp ne i64 %t569, 1
  br i1 %t570, label %then117, label %else118
then117:
  %t571 = icmp ne i64 1, 1
  br i1 %t571, label %then119, label %else120
then119:
  ret i64 1
else120:
  ret i64 1
else118:
  %t572 = call i64 @rt_car(i64 %a1)
  %t573 = and i64 %a0, -8
  %t574 = inttoptr i64 %t573 to ptr
  %t575 = load i64, ptr %t574
  %t576 = inttoptr i64 %t575 to ptr
  %t577 = call fastcc i64%t576(i64 %a0, i64 1, i64 %t572, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t578 = call i64 @rt_cdr(i64 %a1)
  %t579 = load i64, ptr @"scheme.base:%for-each1"
  %t580 = and i64 %t579, -8
  %t581 = inttoptr i64 %t580 to ptr
  %t582 = load i64, ptr %t581
  %t583 = inttoptr i64 %t582 to ptr
  %t584 = musttail call fastcc i64 %t583(i64 %t579, i64 2, i64 %a0, i64 %t578, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t584
}

define fastcc i64 @"scheme.base:code_140"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t589 = icmp eq i64 %argc, 1
  br i1 %t589, label %argok122, label %arityerr121
arityerr121:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok122:
  %t590 = call i64 @rt_car(i64 %a0)
  ret i64 %t590
}

define fastcc i64 @"scheme.base:code_142"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t591 = icmp eq i64 %argc, 1
  br i1 %t591, label %argok124, label %arityerr123
arityerr123:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok124:
  %t592 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t592
}

define fastcc i64 @"scheme.base:code_138"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t593 = icmp eq i64 %argc, 2
  br i1 %t593, label %argok126, label %arityerr125
arityerr125:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok126:
  %t594 = load i64, ptr @"scheme.base:%any-null?"
  %t595 = and i64 %t594, -8
  %t596 = inttoptr i64 %t595 to ptr
  %t597 = load i64, ptr %t596
  %t598 = inttoptr i64 %t597 to ptr
  %t599 = call fastcc i64%t598(i64 %t594, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t600 = icmp ne i64 %t599, 1
  br i1 %t600, label %then127, label %else128
then127:
  %t601 = icmp ne i64 1, 1
  br i1 %t601, label %then129, label %else130
then129:
  ret i64 1
else130:
  ret i64 1
else128:
  %t602 = call i64 @rt_alloc_words(i64 1)
  %t603 = inttoptr i64 %t602 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_140" to i64), ptr %t603
  %t604 = or i64 %t602, 4
  %t605 = load i64, ptr @"scheme.base:%map1"
  %t606 = and i64 %t605, -8
  %t607 = inttoptr i64 %t606 to ptr
  %t608 = load i64, ptr %t607
  %t609 = inttoptr i64 %t608 to ptr
  %t610 = call fastcc i64%t609(i64 %t605, i64 2, i64 %t604, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t611 = and i64 %a0, -8
  %t612 = inttoptr i64 %t611 to ptr
  %t613 = load i64, ptr %t612
  %t614 = inttoptr i64 %t613 to ptr
  %t615 = call i64 @rt_list_length(i64 %t610)
  %t616 = add i64 0, %t615
  %t617 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t610, i64 8)
  %t629 = getelementptr i64, ptr %t617, i64 0
  %t621 = load i64, ptr %t629
  %t630 = getelementptr i64, ptr %t617, i64 1
  %t622 = load i64, ptr %t630
  %t631 = getelementptr i64, ptr %t617, i64 2
  %t623 = load i64, ptr %t631
  %t632 = getelementptr i64, ptr %t617, i64 3
  %t624 = load i64, ptr %t632
  %t633 = getelementptr i64, ptr %t617, i64 4
  %t625 = load i64, ptr %t633
  %t634 = getelementptr i64, ptr %t617, i64 5
  %t626 = load i64, ptr %t634
  %t635 = getelementptr i64, ptr %t617, i64 6
  %t627 = load i64, ptr %t635
  %t636 = getelementptr i64, ptr %t617, i64 7
  %t628 = load i64, ptr %t636
  %t618 = icmp sgt i64 %t616, 8
  %t619 = getelementptr i64, ptr %t617, i64 8
  %t620 = select i1 %t618, ptr %t619, ptr null
  %t637 = call fastcc i64%t614(i64 %a0, i64 %t616, i64 %t621, i64 %t622, i64 %t623, i64 %t624, i64 %t625, i64 %t626, i64 %t627, i64 %t628, ptr %t620)
  %t638 = call i64 @rt_alloc_words(i64 1)
  %t639 = inttoptr i64 %t638 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_142" to i64), ptr %t639
  %t640 = or i64 %t638, 4
  %t641 = load i64, ptr @"scheme.base:%map1"
  %t642 = and i64 %t641, -8
  %t643 = inttoptr i64 %t642 to ptr
  %t644 = load i64, ptr %t643
  %t645 = inttoptr i64 %t644 to ptr
  %t646 = call fastcc i64%t645(i64 %t641, i64 2, i64 %t640, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t647 = load i64, ptr @"scheme.base:%for-eachn"
  %t648 = and i64 %t647, -8
  %t649 = inttoptr i64 %t648 to ptr
  %t650 = load i64, ptr %t649
  %t651 = inttoptr i64 %t650 to ptr
  %t652 = musttail call fastcc i64 %t651(i64 %t647, i64 2, i64 %a0, i64 %t646, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t652
}

define fastcc i64 @"scheme.base:code_147"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t657 = icmp sge i64 %argc, 2
  br i1 %t657, label %argok132, label %arityerr131
arityerr131:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok132:
  %t658 = call i64 @rt_alloc_words(i64 8)
  %t659 = inttoptr i64 %t658 to ptr
  %t660 = getelementptr i64, ptr %t659, i64 0
  store i64 %a0, ptr %t660
  %t661 = getelementptr i64, ptr %t659, i64 1
  store i64 %a1, ptr %t661
  %t662 = getelementptr i64, ptr %t659, i64 2
  store i64 %a2, ptr %t662
  %t663 = getelementptr i64, ptr %t659, i64 3
  store i64 %a3, ptr %t663
  %t664 = getelementptr i64, ptr %t659, i64 4
  store i64 %a4, ptr %t664
  %t665 = getelementptr i64, ptr %t659, i64 5
  store i64 %a5, ptr %t665
  %t666 = getelementptr i64, ptr %t659, i64 6
  store i64 %a6, ptr %t666
  %t667 = getelementptr i64, ptr %t659, i64 7
  store i64 %a7, ptr %t667
  %t668 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t659, ptr %overflow)
  %t669 = call i64 @rt_null_p(i64 %t668)
  %t670 = icmp ne i64 %t669, 1
  br i1 %t670, label %then133, label %else134
then133:
  %t671 = load i64, ptr @"scheme.base:%for-each1"
  %t672 = and i64 %t671, -8
  %t673 = inttoptr i64 %t672 to ptr
  %t674 = load i64, ptr %t673
  %t675 = inttoptr i64 %t674 to ptr
  %t676 = musttail call fastcc i64 %t675(i64 %t671, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t676
else134:
  %t677 = call i64 @rt_cons(i64 %a1, i64 %t668)
  %t678 = load i64, ptr @"scheme.base:%for-eachn"
  %t679 = and i64 %t678, -8
  %t680 = inttoptr i64 %t679 to ptr
  %t681 = load i64, ptr %t680
  %t682 = inttoptr i64 %t681 to ptr
  %t683 = musttail call fastcc i64 %t682(i64 %t678, i64 2, i64 %a0, i64 %t677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t683
}

define fastcc i64 @"scheme.base:code_151"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t688 = icmp eq i64 %argc, 2
  br i1 %t688, label %argok136, label %arityerr135
arityerr135:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok136:
  %t689 = call i64 @rt_null_p(i64 %a1)
  %t690 = icmp ne i64 %t689, 1
  br i1 %t690, label %then137, label %else138
then137:
  ret i64 257
else138:
  %t691 = call i64 @rt_car(i64 %a1)
  %t692 = and i64 %a0, -8
  %t693 = inttoptr i64 %t692 to ptr
  %t694 = load i64, ptr %t693
  %t695 = inttoptr i64 %t694 to ptr
  %t696 = call fastcc i64%t695(i64 %a0, i64 1, i64 %t691, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t697 = icmp ne i64 %t696, 1
  br i1 %t697, label %then139, label %else140
then139:
  %t698 = call i64 @rt_cdr(i64 %a1)
  %t699 = load i64, ptr @"scheme.base:andmap"
  %t700 = and i64 %t699, -8
  %t701 = inttoptr i64 %t700 to ptr
  %t702 = load i64, ptr %t701
  %t703 = inttoptr i64 %t702 to ptr
  %t704 = musttail call fastcc i64 %t703(i64 %t699, i64 2, i64 %a0, i64 %t698, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t704
else140:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_155"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t709 = icmp eq i64 %argc, 2
  br i1 %t709, label %argok142, label %arityerr141
arityerr141:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok142:
  %t710 = call i64 @rt_null_p(i64 %a1)
  %t711 = icmp ne i64 %t710, 1
  br i1 %t711, label %then143, label %else144
then143:
  ret i64 1
else144:
  %t712 = call i64 @rt_car(i64 %a1)
  %t713 = and i64 %a0, -8
  %t714 = inttoptr i64 %t713 to ptr
  %t715 = load i64, ptr %t714
  %t716 = inttoptr i64 %t715 to ptr
  %t717 = call fastcc i64%t716(i64 %a0, i64 1, i64 %t712, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t718 = icmp ne i64 %t717, 1
  br i1 %t718, label %then145, label %else146
then145:
  ret i64 %a1
else146:
  %t719 = call i64 @rt_cdr(i64 %a1)
  %t720 = load i64, ptr @"scheme.base:memp"
  %t721 = and i64 %t720, -8
  %t722 = inttoptr i64 %t721 to ptr
  %t723 = load i64, ptr %t722
  %t724 = inttoptr i64 %t723 to ptr
  %t725 = musttail call fastcc i64 %t724(i64 %t720, i64 2, i64 %a0, i64 %t719, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t725
}

define fastcc i64 @"scheme.base:code_158"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t730 = icmp eq i64 %argc, 1
  br i1 %t730, label %argok148, label %arityerr147
arityerr147:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok148:
  %t731 = load i64, ptr @"scheme.base:cdddr"
  %t732 = and i64 %t731, -8
  %t733 = inttoptr i64 %t732 to ptr
  %t734 = load i64, ptr %t733
  %t735 = inttoptr i64 %t734 to ptr
  %t736 = call fastcc i64%t735(i64 %t731, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t737 = call i64 @rt_car(i64 %t736)
  ret i64 %t737
}

define fastcc i64 @"scheme.base:code_161"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t742 = icmp eq i64 %argc, 1
  br i1 %t742, label %argok150, label %arityerr149
arityerr149:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok150:
  %t743 = call i64 @rt_null_p(i64 %a0)
  %t744 = icmp ne i64 %t743, 1
  br i1 %t744, label %then151, label %else152
then151:
  ret i64 257
else152:
  %t745 = call i64 @rt_pair_p(i64 %a0)
  %t746 = icmp ne i64 %t745, 1
  br i1 %t746, label %then153, label %else154
then153:
  %t747 = call i64 @rt_cdr(i64 %a0)
  %t748 = load i64, ptr @"scheme.base:list?"
  %t749 = and i64 %t748, -8
  %t750 = inttoptr i64 %t749 to ptr
  %t751 = load i64, ptr %t750
  %t752 = inttoptr i64 %t751 to ptr
  %t753 = musttail call fastcc i64 %t752(i64 %t748, i64 1, i64 %t747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t753
else154:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_168"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t758 = icmp eq i64 %argc, 1
  br i1 %t758, label %argok156, label %arityerr155
arityerr155:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok156:
  %t759 = call i64 @rt_num_eq(i64 %a0, i64 0)
  ret i64 %t759
}

define fastcc i64 @"scheme.base:code_172"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t764 = icmp eq i64 %argc, 2
  br i1 %t764, label %argok158, label %arityerr157
arityerr157:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok158:
  %t765 = load i64, ptr @"scheme.base:zero?"
  %t766 = and i64 %t765, -8
  %t767 = inttoptr i64 %t766 to ptr
  %t768 = load i64, ptr %t767
  %t769 = inttoptr i64 %t768 to ptr
  %t770 = call fastcc i64%t769(i64 %t765, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t771 = icmp ne i64 %t770, 1
  br i1 %t771, label %then159, label %else160
then159:
  ret i64 %a0
else160:
  %t772 = call i64 @rt_cdr(i64 %a0)
  %t773 = call i64 @rt_sub(i64 %a1, i64 8)
  %t774 = load i64, ptr @"scheme.base:list-tail"
  %t775 = and i64 %t774, -8
  %t776 = inttoptr i64 %t775 to ptr
  %t777 = load i64, ptr %t776
  %t778 = inttoptr i64 %t777 to ptr
  %t779 = musttail call fastcc i64 %t778(i64 %t774, i64 2, i64 %t772, i64 %t773, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t779
}

define fastcc i64 @"scheme.base:code_176"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t784 = icmp eq i64 %argc, 2
  br i1 %t784, label %argok162, label %arityerr161
arityerr161:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok162:
  %t785 = load i64, ptr @"scheme.base:list-tail"
  %t786 = and i64 %t785, -8
  %t787 = inttoptr i64 %t786 to ptr
  %t788 = load i64, ptr %t787
  %t789 = inttoptr i64 %t788 to ptr
  %t790 = call fastcc i64%t789(i64 %t785, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t791 = call i64 @rt_car(i64 %t790)
  ret i64 %t791
}

define fastcc i64 @"scheme.base:code_180"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t796 = icmp eq i64 %argc, 2
  br i1 %t796, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok164:
  %t797 = load i64, ptr @"scheme.base:zero?"
  %t798 = and i64 %t797, -8
  %t799 = inttoptr i64 %t798 to ptr
  %t800 = load i64, ptr %t799
  %t801 = inttoptr i64 %t800 to ptr
  %t802 = call fastcc i64%t801(i64 %t797, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t803 = icmp ne i64 %t802, 1
  br i1 %t803, label %then165, label %else166
then165:
  ret i64 2
else166:
  %t804 = call i64 @rt_car(i64 %a0)
  %t805 = call i64 @rt_cdr(i64 %a0)
  %t806 = call i64 @rt_sub(i64 %a1, i64 8)
  %t807 = load i64, ptr @"scheme.base:list-head"
  %t808 = and i64 %t807, -8
  %t809 = inttoptr i64 %t808 to ptr
  %t810 = load i64, ptr %t809
  %t811 = inttoptr i64 %t810 to ptr
  %t812 = call fastcc i64%t811(i64 %t807, i64 2, i64 %t805, i64 %t806, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t813 = call i64 @rt_cons(i64 %t804, i64 %t812)
  ret i64 %t813
}

define fastcc i64 @"scheme.base:code_184"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t818 = icmp eq i64 %argc, 2
  br i1 %t818, label %argok168, label %arityerr167
arityerr167:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok168:
  %t819 = load i64, ptr @"scheme.base:zero?"
  %t820 = and i64 %t819, -8
  %t821 = inttoptr i64 %t820 to ptr
  %t822 = load i64, ptr %t821
  %t823 = inttoptr i64 %t822 to ptr
  %t824 = call fastcc i64%t823(i64 %t819, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t825 = icmp ne i64 %t824, 1
  br i1 %t825, label %then169, label %else170
then169:
  ret i64 2
else170:
  %t826 = call i64 @rt_sub(i64 %a0, i64 8)
  %t827 = load i64, ptr @"scheme.base:make-list"
  %t828 = and i64 %t827, -8
  %t829 = inttoptr i64 %t828 to ptr
  %t830 = load i64, ptr %t829
  %t831 = inttoptr i64 %t830 to ptr
  %t832 = call fastcc i64%t831(i64 %t827, i64 2, i64 %t826, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t833 = call i64 @rt_cons(i64 %a1, i64 %t832)
  ret i64 %t833
}

define fastcc i64 @"scheme.base:code_196"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t838 = icmp eq i64 %argc, 2
  br i1 %t838, label %argok172, label %arityerr171
arityerr171:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok172:
  %t839 = and i64 %self, -8
  %t840 = inttoptr i64 %t839 to ptr
  %t841 = getelementptr i64, ptr %t840, i64 1
  %t842 = load i64, ptr %t841
  %t843 = call i64 @rt_num_eq(i64 %a0, i64 %t842)
  %t844 = icmp ne i64 %t843, 1
  br i1 %t844, label %then173, label %else174
then173:
  %t845 = load i64, ptr @"scheme.base:reverse"
  %t846 = and i64 %t845, -8
  %t847 = inttoptr i64 %t846 to ptr
  %t848 = load i64, ptr %t847
  %t849 = inttoptr i64 %t848 to ptr
  %t850 = musttail call fastcc i64 %t849(i64 %t845, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t850
else174:
  %t851 = call i64 @rt_add(i64 %a0, i64 8)
  %t852 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t853 = and i64 %self, -8
  %t854 = inttoptr i64 %t853 to ptr
  %t855 = getelementptr i64, ptr %t854, i64 2
  %t856 = load i64, ptr %t855
  %t857 = and i64 %t856, -8
  %t858 = inttoptr i64 %t857 to ptr
  %t859 = load i64, ptr %t858
  %t860 = inttoptr i64 %t859 to ptr
  %t861 = musttail call fastcc i64 %t860(i64 %t856, i64 2, i64 %t851, i64 %t852, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t861
}

define fastcc i64 @"scheme.base:code_194"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t862 = icmp eq i64 %argc, 1
  br i1 %t862, label %argok176, label %arityerr175
arityerr175:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok176:
  %t863 = call i64 @rt_alloc_words(i64 3)
  %t864 = inttoptr i64 %t863 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_196" to i64), ptr %t864
  %t865 = or i64 %t863, 4
  %t866 = getelementptr i64, ptr %t864, i64 1
  store i64 %a0, ptr %t866
  %t867 = getelementptr i64, ptr %t864, i64 2
  store i64 %t865, ptr %t867
  %t868 = and i64 %t865, -8
  %t869 = inttoptr i64 %t868 to ptr
  %t870 = load i64, ptr %t869
  %t871 = inttoptr i64 %t870 to ptr
  %t872 = musttail call fastcc i64 %t871(i64 %t865, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t872
}

define fastcc i64 @"scheme.base:code_204"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t877 = icmp eq i64 %argc, 2
  br i1 %t877, label %argok178, label %arityerr177
arityerr177:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok178:
  %t878 = call i64 @rt_lt(i64 %a0, i64 %a1)
  %t879 = icmp ne i64 %t878, 1
  br i1 %t879, label %then179, label %else180
then179:
  ret i64 %a1
else180:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_206"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t884 = icmp eq i64 %argc, 0
  br i1 %t884, label %argok182, label %arityerr181
arityerr181:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok182:
  %t885 = icmp ne i64 1, 1
  br i1 %t885, label %then183, label %else184
then183:
  ret i64 1
else184:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_209"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t890 = icmp sge i64 %argc, 0
  br i1 %t890, label %argok186, label %arityerr185
arityerr185:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok186:
  %t891 = call i64 @rt_alloc_words(i64 8)
  %t892 = inttoptr i64 %t891 to ptr
  %t893 = getelementptr i64, ptr %t892, i64 0
  store i64 %a0, ptr %t893
  %t894 = getelementptr i64, ptr %t892, i64 1
  store i64 %a1, ptr %t894
  %t895 = getelementptr i64, ptr %t892, i64 2
  store i64 %a2, ptr %t895
  %t896 = getelementptr i64, ptr %t892, i64 3
  store i64 %a3, ptr %t896
  %t897 = getelementptr i64, ptr %t892, i64 4
  store i64 %a4, ptr %t897
  %t898 = getelementptr i64, ptr %t892, i64 5
  store i64 %a5, ptr %t898
  %t899 = getelementptr i64, ptr %t892, i64 6
  store i64 %a6, ptr %t899
  %t900 = getelementptr i64, ptr %t892, i64 7
  store i64 %a7, ptr %t900
  %t901 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t892, ptr %overflow)
  %t902 = call i64 @rt_list_to_string(i64 %t901)
  ret i64 %t902
}

define fastcc i64 @"scheme.base:code_212"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t907 = icmp eq i64 %argc, 1
  br i1 %t907, label %argok188, label %arityerr187
arityerr187:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok188:
  %t908 = call i64 @rt_null_p(i64 %a0)
  %t909 = icmp ne i64 %t908, 1
  br i1 %t909, label %then189, label %else190
then189:
  %t910 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t910
else190:
  %t911 = call i64 @rt_car(i64 %a0)
  %t912 = call i64 @rt_cdr(i64 %a0)
  %t913 = load i64, ptr @"scheme.base:%str-concat"
  %t914 = and i64 %t913, -8
  %t915 = inttoptr i64 %t914 to ptr
  %t916 = load i64, ptr %t915
  %t917 = inttoptr i64 %t916 to ptr
  %t918 = call fastcc i64%t917(i64 %t913, i64 1, i64 %t912, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t919 = call i64 @rt_string_append(i64 %t911, i64 %t918)
  ret i64 %t919
}

define fastcc i64 @"scheme.base:code_218"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t924 = icmp eq i64 %argc, 4
  br i1 %t924, label %argok192, label %arityerr191
arityerr191:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok192:
  %t925 = call i64 @rt_char_to_integer(i64 %a1)
  %t926 = call i64 @rt_char_to_integer(i64 %a2)
  %t927 = and i64 %a0, -8
  %t928 = inttoptr i64 %t927 to ptr
  %t929 = load i64, ptr %t928
  %t930 = inttoptr i64 %t929 to ptr
  %t931 = call fastcc i64%t930(i64 %a0, i64 2, i64 %t925, i64 %t926, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t932 = icmp ne i64 %t931, 1
  br i1 %t932, label %then193, label %else194
then193:
  %t933 = call i64 @rt_null_p(i64 %a3)
  %t934 = icmp ne i64 %t933, 1
  br i1 %t934, label %then195, label %else196
then195:
  ret i64 257
else196:
  %t935 = call i64 @rt_car(i64 %a3)
  %t936 = call i64 @rt_cdr(i64 %a3)
  %t937 = load i64, ptr @"scheme.base:chr-cmp"
  %t938 = and i64 %t937, -8
  %t939 = inttoptr i64 %t938 to ptr
  %t940 = load i64, ptr %t939
  %t941 = inttoptr i64 %t940 to ptr
  %t942 = musttail call fastcc i64 %t941(i64 %t937, i64 4, i64 %a0, i64 %a2, i64 %t935, i64 %t936, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t942
else194:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t947 = icmp eq i64 %argc, 2
  br i1 %t947, label %argok198, label %arityerr197
arityerr197:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok198:
  %t948 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  ret i64 %t948
}

define fastcc i64 @"scheme.base:code_229"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t949 = icmp sge i64 %argc, 2
  br i1 %t949, label %argok200, label %arityerr199
arityerr199:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok200:
  %t950 = call i64 @rt_alloc_words(i64 8)
  %t951 = inttoptr i64 %t950 to ptr
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
  %t960 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t951, ptr %overflow)
  %t961 = call i64 @rt_alloc_words(i64 1)
  %t962 = inttoptr i64 %t961 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t962
  %t963 = or i64 %t961, 4
  %t964 = load i64, ptr @"scheme.base:chr-cmp"
  %t965 = and i64 %t964, -8
  %t966 = inttoptr i64 %t965 to ptr
  %t967 = load i64, ptr %t966
  %t968 = inttoptr i64 %t967 to ptr
  %t969 = musttail call fastcc i64 %t968(i64 %t964, i64 4, i64 %t963, i64 %a0, i64 %a1, i64 %t960, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t969
}

define fastcc i64 @"scheme.base:code_244"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t974 = icmp eq i64 %argc, 2
  br i1 %t974, label %argok202, label %arityerr201
arityerr201:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok202:
  %t975 = call i64 @rt_lt(i64 %a0, i64 %a1)
  ret i64 %t975
}

define fastcc i64 @"scheme.base:code_242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t976 = icmp sge i64 %argc, 2
  br i1 %t976, label %argok204, label %arityerr203
arityerr203:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok204:
  %t977 = call i64 @rt_alloc_words(i64 8)
  %t978 = inttoptr i64 %t977 to ptr
  %t979 = getelementptr i64, ptr %t978, i64 0
  store i64 %a0, ptr %t979
  %t980 = getelementptr i64, ptr %t978, i64 1
  store i64 %a1, ptr %t980
  %t981 = getelementptr i64, ptr %t978, i64 2
  store i64 %a2, ptr %t981
  %t982 = getelementptr i64, ptr %t978, i64 3
  store i64 %a3, ptr %t982
  %t983 = getelementptr i64, ptr %t978, i64 4
  store i64 %a4, ptr %t983
  %t984 = getelementptr i64, ptr %t978, i64 5
  store i64 %a5, ptr %t984
  %t985 = getelementptr i64, ptr %t978, i64 6
  store i64 %a6, ptr %t985
  %t986 = getelementptr i64, ptr %t978, i64 7
  store i64 %a7, ptr %t986
  %t987 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t978, ptr %overflow)
  %t988 = call i64 @rt_alloc_words(i64 1)
  %t989 = inttoptr i64 %t988 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_244" to i64), ptr %t989
  %t990 = or i64 %t988, 4
  %t991 = load i64, ptr @"scheme.base:chr-cmp"
  %t992 = and i64 %t991, -8
  %t993 = inttoptr i64 %t992 to ptr
  %t994 = load i64, ptr %t993
  %t995 = inttoptr i64 %t994 to ptr
  %t996 = musttail call fastcc i64 %t995(i64 %t991, i64 4, i64 %t990, i64 %a0, i64 %a1, i64 %t987, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t996
}

define fastcc i64 @"scheme.base:code_257"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1001 = icmp eq i64 %argc, 2
  br i1 %t1001, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok206:
  %t1002 = call i64 @rt_lt(i64 %a1, i64 %a0)
  ret i64 %t1002
}

define fastcc i64 @"scheme.base:code_255"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1003 = icmp sge i64 %argc, 2
  br i1 %t1003, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok208:
  %t1004 = call i64 @rt_alloc_words(i64 8)
  %t1005 = inttoptr i64 %t1004 to ptr
  %t1006 = getelementptr i64, ptr %t1005, i64 0
  store i64 %a0, ptr %t1006
  %t1007 = getelementptr i64, ptr %t1005, i64 1
  store i64 %a1, ptr %t1007
  %t1008 = getelementptr i64, ptr %t1005, i64 2
  store i64 %a2, ptr %t1008
  %t1009 = getelementptr i64, ptr %t1005, i64 3
  store i64 %a3, ptr %t1009
  %t1010 = getelementptr i64, ptr %t1005, i64 4
  store i64 %a4, ptr %t1010
  %t1011 = getelementptr i64, ptr %t1005, i64 5
  store i64 %a5, ptr %t1011
  %t1012 = getelementptr i64, ptr %t1005, i64 6
  store i64 %a6, ptr %t1012
  %t1013 = getelementptr i64, ptr %t1005, i64 7
  store i64 %a7, ptr %t1013
  %t1014 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1005, ptr %overflow)
  %t1015 = call i64 @rt_alloc_words(i64 1)
  %t1016 = inttoptr i64 %t1015 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_257" to i64), ptr %t1016
  %t1017 = or i64 %t1015, 4
  %t1018 = load i64, ptr @"scheme.base:chr-cmp"
  %t1019 = and i64 %t1018, -8
  %t1020 = inttoptr i64 %t1019 to ptr
  %t1021 = load i64, ptr %t1020
  %t1022 = inttoptr i64 %t1021 to ptr
  %t1023 = musttail call fastcc i64 %t1022(i64 %t1018, i64 4, i64 %t1017, i64 %a0, i64 %a1, i64 %t1014, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1023
}

define fastcc i64 @"scheme.base:code_270"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1028 = icmp eq i64 %argc, 2
  br i1 %t1028, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok210:
  %t1029 = call i64 @rt_lt(i64 %a0, i64 %a1)
  %t1030 = icmp ne i64 %t1029, 1
  br i1 %t1030, label %then211, label %else212
then211:
  ret i64 257
else212:
  %t1031 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  ret i64 %t1031
}

define fastcc i64 @"scheme.base:code_268"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1032 = icmp sge i64 %argc, 2
  br i1 %t1032, label %argok214, label %arityerr213
arityerr213:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok214:
  %t1033 = call i64 @rt_alloc_words(i64 8)
  %t1034 = inttoptr i64 %t1033 to ptr
  %t1035 = getelementptr i64, ptr %t1034, i64 0
  store i64 %a0, ptr %t1035
  %t1036 = getelementptr i64, ptr %t1034, i64 1
  store i64 %a1, ptr %t1036
  %t1037 = getelementptr i64, ptr %t1034, i64 2
  store i64 %a2, ptr %t1037
  %t1038 = getelementptr i64, ptr %t1034, i64 3
  store i64 %a3, ptr %t1038
  %t1039 = getelementptr i64, ptr %t1034, i64 4
  store i64 %a4, ptr %t1039
  %t1040 = getelementptr i64, ptr %t1034, i64 5
  store i64 %a5, ptr %t1040
  %t1041 = getelementptr i64, ptr %t1034, i64 6
  store i64 %a6, ptr %t1041
  %t1042 = getelementptr i64, ptr %t1034, i64 7
  store i64 %a7, ptr %t1042
  %t1043 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1034, ptr %overflow)
  %t1044 = call i64 @rt_alloc_words(i64 1)
  %t1045 = inttoptr i64 %t1044 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_270" to i64), ptr %t1045
  %t1046 = or i64 %t1044, 4
  %t1047 = load i64, ptr @"scheme.base:chr-cmp"
  %t1048 = and i64 %t1047, -8
  %t1049 = inttoptr i64 %t1048 to ptr
  %t1050 = load i64, ptr %t1049
  %t1051 = inttoptr i64 %t1050 to ptr
  %t1052 = musttail call fastcc i64 %t1051(i64 %t1047, i64 4, i64 %t1046, i64 %a0, i64 %a1, i64 %t1043, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1052
}

define fastcc i64 @"scheme.base:code_283"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1057 = icmp eq i64 %argc, 2
  br i1 %t1057, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok216:
  %t1058 = call i64 @rt_lt(i64 %a1, i64 %a0)
  %t1059 = icmp ne i64 %t1058, 1
  br i1 %t1059, label %then217, label %else218
then217:
  ret i64 257
else218:
  %t1060 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  ret i64 %t1060
}

define fastcc i64 @"scheme.base:code_281"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1061 = icmp sge i64 %argc, 2
  br i1 %t1061, label %argok220, label %arityerr219
arityerr219:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok220:
  %t1062 = call i64 @rt_alloc_words(i64 8)
  %t1063 = inttoptr i64 %t1062 to ptr
  %t1064 = getelementptr i64, ptr %t1063, i64 0
  store i64 %a0, ptr %t1064
  %t1065 = getelementptr i64, ptr %t1063, i64 1
  store i64 %a1, ptr %t1065
  %t1066 = getelementptr i64, ptr %t1063, i64 2
  store i64 %a2, ptr %t1066
  %t1067 = getelementptr i64, ptr %t1063, i64 3
  store i64 %a3, ptr %t1067
  %t1068 = getelementptr i64, ptr %t1063, i64 4
  store i64 %a4, ptr %t1068
  %t1069 = getelementptr i64, ptr %t1063, i64 5
  store i64 %a5, ptr %t1069
  %t1070 = getelementptr i64, ptr %t1063, i64 6
  store i64 %a6, ptr %t1070
  %t1071 = getelementptr i64, ptr %t1063, i64 7
  store i64 %a7, ptr %t1071
  %t1072 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1063, ptr %overflow)
  %t1073 = call i64 @rt_alloc_words(i64 1)
  %t1074 = inttoptr i64 %t1073 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_283" to i64), ptr %t1074
  %t1075 = or i64 %t1073, 4
  %t1076 = load i64, ptr @"scheme.base:chr-cmp"
  %t1077 = and i64 %t1076, -8
  %t1078 = inttoptr i64 %t1077 to ptr
  %t1079 = load i64, ptr %t1078
  %t1080 = inttoptr i64 %t1079 to ptr
  %t1081 = musttail call fastcc i64 %t1080(i64 %t1076, i64 4, i64 %t1075, i64 %a0, i64 %a1, i64 %t1072, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1081
}

define fastcc i64 @"scheme.base:code_295"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1086 = icmp eq i64 %argc, 2
  br i1 %t1086, label %argok222, label %arityerr221
arityerr221:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok222:
  %t1087 = call i64 @rt_lt(i64 %a0, i64 0)
  %t1088 = icmp ne i64 %t1087, 1
  br i1 %t1088, label %then223, label %else224
then223:
  ret i64 %a1
else224:
  %t1089 = call i64 @rt_sub(i64 %a0, i64 8)
  %t1090 = and i64 %self, -8
  %t1091 = inttoptr i64 %t1090 to ptr
  %t1092 = getelementptr i64, ptr %t1091, i64 2
  %t1093 = load i64, ptr %t1092
  %t1094 = call i64 @rt_string_ref(i64 %t1093, i64 %a0)
  %t1095 = call i64 @rt_cons(i64 %t1094, i64 %a1)
  %t1096 = and i64 %self, -8
  %t1097 = inttoptr i64 %t1096 to ptr
  %t1098 = getelementptr i64, ptr %t1097, i64 1
  %t1099 = load i64, ptr %t1098
  %t1100 = and i64 %t1099, -8
  %t1101 = inttoptr i64 %t1100 to ptr
  %t1102 = load i64, ptr %t1101
  %t1103 = inttoptr i64 %t1102 to ptr
  %t1104 = musttail call fastcc i64 %t1103(i64 %t1099, i64 2, i64 %t1089, i64 %t1095, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1104
}

define fastcc i64 @"scheme.base:code_293"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1105 = icmp eq i64 %argc, 1
  br i1 %t1105, label %argok226, label %arityerr225
arityerr225:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok226:
  %t1106 = call i64 @rt_alloc_words(i64 3)
  %t1107 = inttoptr i64 %t1106 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_295" to i64), ptr %t1107
  %t1108 = or i64 %t1106, 4
  %t1109 = getelementptr i64, ptr %t1107, i64 1
  store i64 %t1108, ptr %t1109
  %t1110 = getelementptr i64, ptr %t1107, i64 2
  store i64 %a0, ptr %t1110
  %t1111 = call i64 @rt_string_length(i64 %a0)
  %t1112 = call i64 @rt_sub(i64 %t1111, i64 8)
  %t1113 = and i64 %t1108, -8
  %t1114 = inttoptr i64 %t1113 to ptr
  %t1115 = load i64, ptr %t1114
  %t1116 = inttoptr i64 %t1115 to ptr
  %t1117 = musttail call fastcc i64 %t1116(i64 %t1108, i64 2, i64 %t1112, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1117
}

define fastcc i64 @"scheme.base:code_305"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1122 = icmp eq i64 %argc, 2
  br i1 %t1122, label %argok228, label %arityerr227
arityerr227:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok228:
  %t1123 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1124 = call i64 @rt_sub(i64 0, i64 %t1123)
  %t1125 = call i64 @rt_add(i64 384, i64 %t1124)
  %t1126 = call i64 @rt_integer_to_char(i64 %t1125)
  %t1127 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1128 = call i64 @rt_num_eq(i64 %t1127, i64 0)
  %t1129 = icmp ne i64 %t1128, 1
  br i1 %t1129, label %then229, label %else230
then229:
  %t1130 = call i64 @rt_cons(i64 %t1126, i64 %a1)
  ret i64 %t1130
else230:
  %t1131 = call i64 @rt_cons(i64 %t1126, i64 %a1)
  %t1132 = load i64, ptr @"scheme.base:ns-digits"
  %t1133 = and i64 %t1132, -8
  %t1134 = inttoptr i64 %t1133 to ptr
  %t1135 = load i64, ptr %t1134
  %t1136 = inttoptr i64 %t1135 to ptr
  %t1137 = musttail call fastcc i64 %t1136(i64 %t1132, i64 2, i64 %t1127, i64 %t1131, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1137
}

define fastcc i64 @"scheme.base:code_316"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1142 = icmp eq i64 %argc, 1
  br i1 %t1142, label %argok232, label %arityerr231
arityerr231:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok232:
  %t1143 = call i64 @rt_num_eq(i64 %a0, i64 0)
  %t1144 = icmp ne i64 %t1143, 1
  br i1 %t1144, label %then233, label %else234
then233:
  %t1145 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1145
else234:
  %t1146 = call i64 @rt_lt(i64 %a0, i64 0)
  %t1147 = icmp ne i64 %t1146, 1
  br i1 %t1147, label %then235, label %else236
then235:
  %t1148 = load i64, ptr @"scheme.base:ns-digits"
  %t1149 = and i64 %t1148, -8
  %t1150 = inttoptr i64 %t1149 to ptr
  %t1151 = load i64, ptr %t1150
  %t1152 = inttoptr i64 %t1151 to ptr
  %t1153 = call fastcc i64%t1152(i64 %t1148, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1154 = call i64 @rt_cons(i64 11529, i64 %t1153)
  %t1155 = call i64 @rt_list_to_string(i64 %t1154)
  ret i64 %t1155
else236:
  %t1156 = call i64 @rt_sub(i64 0, i64 %a0)
  %t1157 = load i64, ptr @"scheme.base:ns-digits"
  %t1158 = and i64 %t1157, -8
  %t1159 = inttoptr i64 %t1158 to ptr
  %t1160 = load i64, ptr %t1159
  %t1161 = inttoptr i64 %t1160 to ptr
  %t1162 = call fastcc i64%t1161(i64 %t1157, i64 2, i64 %t1156, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1163 = call i64 @rt_list_to_string(i64 %t1162)
  ret i64 %t1163
}

define fastcc i64 @"scheme.base:code_320"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1168 = icmp sge i64 %argc, 1
  br i1 %t1168, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok238:
  %t1169 = call i64 @rt_alloc_words(i64 8)
  %t1170 = inttoptr i64 %t1169 to ptr
  %t1171 = getelementptr i64, ptr %t1170, i64 0
  store i64 %a0, ptr %t1171
  %t1172 = getelementptr i64, ptr %t1170, i64 1
  store i64 %a1, ptr %t1172
  %t1173 = getelementptr i64, ptr %t1170, i64 2
  store i64 %a2, ptr %t1173
  %t1174 = getelementptr i64, ptr %t1170, i64 3
  store i64 %a3, ptr %t1174
  %t1175 = getelementptr i64, ptr %t1170, i64 4
  store i64 %a4, ptr %t1175
  %t1176 = getelementptr i64, ptr %t1170, i64 5
  store i64 %a5, ptr %t1176
  %t1177 = getelementptr i64, ptr %t1170, i64 6
  store i64 %a6, ptr %t1177
  %t1178 = getelementptr i64, ptr %t1170, i64 7
  store i64 %a7, ptr %t1178
  %t1179 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1170, ptr %overflow)
  %t1180 = call i64 @rt_string_p(i64 %a0)
  %t1181 = icmp ne i64 %t1180, 1
  br i1 %t1181, label %then239, label %else240
then239:
  %t1182 = call i64 @rt_error(i64 %a0, i64 %t1179)
  ret i64 %t1182
else240:
  %t1183 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1184 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1185 = call i64 @rt_car(i64 %t1179)
  %t1186 = call i64 @rt_string_append(i64 %t1184, i64 %t1185)
  %t1187 = call i64 @rt_string_append(i64 %t1183, i64 %t1186)
  %t1188 = call i64 @rt_cdr(i64 %t1179)
  %t1189 = call i64 @rt_error(i64 %t1187, i64 %t1188)
  ret i64 %t1189
}

define fastcc i64 @"scheme.base:code_323"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1194 = icmp eq i64 %argc, 1
  br i1 %t1194, label %argok242, label %arityerr241
arityerr241:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok242:
  %t1195 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1195
}

define fastcc i64 @"scheme.base:code_326"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1200 = icmp eq i64 %argc, 1
  br i1 %t1200, label %argok244, label %arityerr243
arityerr243:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok244:
  %t1201 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1201
}

define fastcc i64 @"scheme.base:code_329"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1206 = icmp eq i64 %argc, 1
  br i1 %t1206, label %argok246, label %arityerr245
arityerr245:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok246:
  %t1207 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1207
}

define fastcc i64 @"scheme.base:code_332"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1212 = icmp eq i64 %argc, 1
  br i1 %t1212, label %argok248, label %arityerr247
arityerr247:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok248:
  %t1213 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1213
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1218 = icmp eq i64 %argc, 2
  br i1 %t1218, label %argok250, label %arityerr249
arityerr249:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok250:
  %t1219 = call i64 @rt_null_p(i64 %a0)
  %t1220 = icmp ne i64 %t1219, 1
  br i1 %t1220, label %then251, label %else252
then251:
  %t1221 = and i64 %self, -8
  %t1222 = inttoptr i64 %t1221 to ptr
  %t1223 = getelementptr i64, ptr %t1222, i64 1
  %t1224 = load i64, ptr %t1223
  ret i64 %t1224
else252:
  %t1225 = and i64 %self, -8
  %t1226 = inttoptr i64 %t1225 to ptr
  %t1227 = getelementptr i64, ptr %t1226, i64 1
  %t1228 = load i64, ptr %t1227
  %t1229 = call i64 @rt_car(i64 %a0)
  %t1230 = call i64 @rt_vector_set(i64 %t1228, i64 %a1, i64 %t1229)
  %t1231 = call i64 @rt_cdr(i64 %a0)
  %t1232 = call i64 @rt_add(i64 %a1, i64 8)
  %t1233 = and i64 %self, -8
  %t1234 = inttoptr i64 %t1233 to ptr
  %t1235 = getelementptr i64, ptr %t1234, i64 2
  %t1236 = load i64, ptr %t1235
  %t1237 = and i64 %t1236, -8
  %t1238 = inttoptr i64 %t1237 to ptr
  %t1239 = load i64, ptr %t1238
  %t1240 = inttoptr i64 %t1239 to ptr
  %t1241 = musttail call fastcc i64 %t1240(i64 %t1236, i64 2, i64 %t1231, i64 %t1232, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1241
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1242 = icmp eq i64 %argc, 1
  br i1 %t1242, label %argok254, label %arityerr253
arityerr253:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok254:
  %t1243 = load i64, ptr @"scheme.base:length"
  %t1244 = and i64 %t1243, -8
  %t1245 = inttoptr i64 %t1244 to ptr
  %t1246 = load i64, ptr %t1245
  %t1247 = inttoptr i64 %t1246 to ptr
  %t1248 = call fastcc i64%t1247(i64 %t1243, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1249 = call i64 @rt_make_vector(i64 %t1248, i64 0)
  %t1250 = call i64 @rt_alloc_words(i64 3)
  %t1251 = inttoptr i64 %t1250 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1251
  %t1252 = or i64 %t1250, 4
  %t1253 = getelementptr i64, ptr %t1251, i64 1
  store i64 %t1249, ptr %t1253
  %t1254 = getelementptr i64, ptr %t1251, i64 2
  store i64 %t1252, ptr %t1254
  %t1255 = and i64 %t1252, -8
  %t1256 = inttoptr i64 %t1255 to ptr
  %t1257 = load i64, ptr %t1256
  %t1258 = inttoptr i64 %t1257 to ptr
  %t1259 = musttail call fastcc i64 %t1258(i64 %t1252, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1259
}

define fastcc i64 @"scheme.base:code_344"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1264 = icmp sge i64 %argc, 0
  br i1 %t1264, label %argok256, label %arityerr255
arityerr255:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok256:
  %t1265 = call i64 @rt_alloc_words(i64 8)
  %t1266 = inttoptr i64 %t1265 to ptr
  %t1267 = getelementptr i64, ptr %t1266, i64 0
  store i64 %a0, ptr %t1267
  %t1268 = getelementptr i64, ptr %t1266, i64 1
  store i64 %a1, ptr %t1268
  %t1269 = getelementptr i64, ptr %t1266, i64 2
  store i64 %a2, ptr %t1269
  %t1270 = getelementptr i64, ptr %t1266, i64 3
  store i64 %a3, ptr %t1270
  %t1271 = getelementptr i64, ptr %t1266, i64 4
  store i64 %a4, ptr %t1271
  %t1272 = getelementptr i64, ptr %t1266, i64 5
  store i64 %a5, ptr %t1272
  %t1273 = getelementptr i64, ptr %t1266, i64 6
  store i64 %a6, ptr %t1273
  %t1274 = getelementptr i64, ptr %t1266, i64 7
  store i64 %a7, ptr %t1274
  %t1275 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1266, ptr %overflow)
  %t1276 = load i64, ptr @"scheme.base:list->vector"
  %t1277 = and i64 %t1276, -8
  %t1278 = inttoptr i64 %t1277 to ptr
  %t1279 = load i64, ptr %t1278
  %t1280 = inttoptr i64 %t1279 to ptr
  %t1281 = musttail call fastcc i64 %t1280(i64 %t1276, i64 1, i64 %t1275, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1281
}

define fastcc i64 @"scheme.base:code_353"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1286 = icmp eq i64 %argc, 2
  br i1 %t1286, label %argok258, label %arityerr257
arityerr257:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok258:
  %t1287 = call i64 @rt_null_p(i64 %a0)
  %t1288 = icmp ne i64 %t1287, 1
  br i1 %t1288, label %then259, label %else260
then259:
  %t1289 = and i64 %self, -8
  %t1290 = inttoptr i64 %t1289 to ptr
  %t1291 = getelementptr i64, ptr %t1290, i64 1
  %t1292 = load i64, ptr %t1291
  ret i64 %t1292
else260:
  %t1293 = and i64 %self, -8
  %t1294 = inttoptr i64 %t1293 to ptr
  %t1295 = getelementptr i64, ptr %t1294, i64 1
  %t1296 = load i64, ptr %t1295
  %t1297 = call i64 @rt_car(i64 %a0)
  %t1298 = call i64 @rt_bytevector_u8_set(i64 %t1296, i64 %a1, i64 %t1297)
  %t1299 = call i64 @rt_cdr(i64 %a0)
  %t1300 = call i64 @rt_add(i64 %a1, i64 8)
  %t1301 = and i64 %self, -8
  %t1302 = inttoptr i64 %t1301 to ptr
  %t1303 = getelementptr i64, ptr %t1302, i64 2
  %t1304 = load i64, ptr %t1303
  %t1305 = and i64 %t1304, -8
  %t1306 = inttoptr i64 %t1305 to ptr
  %t1307 = load i64, ptr %t1306
  %t1308 = inttoptr i64 %t1307 to ptr
  %t1309 = musttail call fastcc i64 %t1308(i64 %t1304, i64 2, i64 %t1299, i64 %t1300, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1309
}

define fastcc i64 @"scheme.base:code_351"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1310 = icmp eq i64 %argc, 1
  br i1 %t1310, label %argok262, label %arityerr261
arityerr261:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok262:
  %t1311 = load i64, ptr @"scheme.base:length"
  %t1312 = and i64 %t1311, -8
  %t1313 = inttoptr i64 %t1312 to ptr
  %t1314 = load i64, ptr %t1313
  %t1315 = inttoptr i64 %t1314 to ptr
  %t1316 = call fastcc i64%t1315(i64 %t1311, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1317 = call i64 @rt_make_bytevector(i64 %t1316, i64 0)
  %t1318 = call i64 @rt_alloc_words(i64 3)
  %t1319 = inttoptr i64 %t1318 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1319
  %t1320 = or i64 %t1318, 4
  %t1321 = getelementptr i64, ptr %t1319, i64 1
  store i64 %t1317, ptr %t1321
  %t1322 = getelementptr i64, ptr %t1319, i64 2
  store i64 %t1320, ptr %t1322
  %t1323 = and i64 %t1320, -8
  %t1324 = inttoptr i64 %t1323 to ptr
  %t1325 = load i64, ptr %t1324
  %t1326 = inttoptr i64 %t1325 to ptr
  %t1327 = musttail call fastcc i64 %t1326(i64 %t1320, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1327
}

define fastcc i64 @"scheme.base:code_356"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1332 = icmp sge i64 %argc, 0
  br i1 %t1332, label %argok264, label %arityerr263
arityerr263:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok264:
  %t1333 = call i64 @rt_alloc_words(i64 8)
  %t1334 = inttoptr i64 %t1333 to ptr
  %t1335 = getelementptr i64, ptr %t1334, i64 0
  store i64 %a0, ptr %t1335
  %t1336 = getelementptr i64, ptr %t1334, i64 1
  store i64 %a1, ptr %t1336
  %t1337 = getelementptr i64, ptr %t1334, i64 2
  store i64 %a2, ptr %t1337
  %t1338 = getelementptr i64, ptr %t1334, i64 3
  store i64 %a3, ptr %t1338
  %t1339 = getelementptr i64, ptr %t1334, i64 4
  store i64 %a4, ptr %t1339
  %t1340 = getelementptr i64, ptr %t1334, i64 5
  store i64 %a5, ptr %t1340
  %t1341 = getelementptr i64, ptr %t1334, i64 6
  store i64 %a6, ptr %t1341
  %t1342 = getelementptr i64, ptr %t1334, i64 7
  store i64 %a7, ptr %t1342
  %t1343 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1334, ptr %overflow)
  %t1344 = load i64, ptr @"scheme.base:list->bytevector"
  %t1345 = and i64 %t1344, -8
  %t1346 = inttoptr i64 %t1345 to ptr
  %t1347 = load i64, ptr %t1346
  %t1348 = inttoptr i64 %t1347 to ptr
  %t1349 = musttail call fastcc i64 %t1348(i64 %t1344, i64 1, i64 %t1343, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1349
}

define fastcc i64 @"scheme.base:code_382"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1354 = icmp eq i64 %argc, 1
  br i1 %t1354, label %argok266, label %arityerr265
arityerr265:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok266:
  %t1355 = call i64 @rt_char_to_integer(i64 %a0)
  %t1356 = call i64 @rt_num_eq(i64 %t1355, i64 256)
  %t1357 = icmp ne i64 %t1356, 1
  br i1 %t1357, label %then267, label %else268
then267:
  ret i64 %t1356
else268:
  %t1358 = call i64 @rt_num_eq(i64 %t1355, i64 72)
  %t1359 = icmp ne i64 %t1358, 1
  br i1 %t1359, label %then269, label %else270
then269:
  ret i64 %t1358
else270:
  %t1360 = call i64 @rt_num_eq(i64 %t1355, i64 80)
  %t1361 = icmp ne i64 %t1360, 1
  br i1 %t1361, label %then271, label %else272
then271:
  ret i64 %t1360
else272:
  %t1362 = call i64 @rt_num_eq(i64 %t1355, i64 104)
  ret i64 %t1362
}

define fastcc i64 @"scheme.base:code_394"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1367 = icmp eq i64 %argc, 1
  br i1 %t1367, label %argok274, label %arityerr273
arityerr273:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok274:
  %t1368 = call i64 @rt_char_to_integer(i64 %a0)
  %t1369 = call i64 @rt_lt(i64 376, i64 %t1368)
  %t1370 = icmp ne i64 %t1369, 1
  br i1 %t1370, label %then275, label %else276
then275:
  %t1371 = call i64 @rt_lt(i64 %t1368, i64 464)
  ret i64 %t1371
else276:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_434"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1376 = icmp eq i64 %argc, 1
  br i1 %t1376, label %argok278, label %arityerr277
arityerr277:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok278:
  %t1377 = call i64 @rt_char_to_integer(i64 %a0)
  %t1378 = load i64, ptr @"scheme.base:rd-ws?"
  %t1379 = and i64 %t1378, -8
  %t1380 = inttoptr i64 %t1379 to ptr
  %t1381 = load i64, ptr %t1380
  %t1382 = inttoptr i64 %t1381 to ptr
  %t1383 = call fastcc i64%t1382(i64 %t1378, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1384 = icmp ne i64 %t1383, 1
  br i1 %t1384, label %then279, label %else280
then279:
  ret i64 %t1383
else280:
  %t1385 = call i64 @rt_num_eq(i64 %t1377, i64 320)
  %t1386 = icmp ne i64 %t1385, 1
  br i1 %t1386, label %then281, label %else282
then281:
  ret i64 %t1385
else282:
  %t1387 = call i64 @rt_num_eq(i64 %t1377, i64 328)
  %t1388 = icmp ne i64 %t1387, 1
  br i1 %t1388, label %then283, label %else284
then283:
  ret i64 %t1387
else284:
  %t1389 = call i64 @rt_num_eq(i64 %t1377, i64 728)
  %t1390 = icmp ne i64 %t1389, 1
  br i1 %t1390, label %then285, label %else286
then285:
  ret i64 %t1389
else286:
  %t1391 = call i64 @rt_num_eq(i64 %t1377, i64 744)
  %t1392 = icmp ne i64 %t1391, 1
  br i1 %t1392, label %then287, label %else288
then287:
  ret i64 %t1391
else288:
  %t1393 = call i64 @rt_num_eq(i64 %t1377, i64 272)
  %t1394 = icmp ne i64 %t1393, 1
  br i1 %t1394, label %then289, label %else290
then289:
  ret i64 %t1393
else290:
  %t1395 = call i64 @rt_num_eq(i64 %t1377, i64 472)
  ret i64 %t1395
}

define fastcc i64 @"scheme.base:code_447"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1400 = icmp eq i64 %argc, 3
  br i1 %t1400, label %argok292, label %arityerr291
arityerr291:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok292:
  %t1401 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1402 = icmp ne i64 %t1401, 1
  br i1 %t1402, label %then293, label %else294
then293:
  %t1403 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1404 = call i64 @rt_char_to_integer(i64 %t1403)
  %t1405 = call i64 @rt_num_eq(i64 %t1404, i64 80)
  %t1406 = icmp ne i64 %t1405, 1
  br i1 %t1406, label %then295, label %else296
then295:
  %t1407 = call i64 @rt_add(i64 %a2, i64 8)
  ret i64 %t1407
else296:
  %t1408 = call i64 @rt_add(i64 %a2, i64 8)
  %t1409 = load i64, ptr @"scheme.base:rd-skip-line"
  %t1410 = and i64 %t1409, -8
  %t1411 = inttoptr i64 %t1410 to ptr
  %t1412 = load i64, ptr %t1411
  %t1413 = inttoptr i64 %t1412 to ptr
  %t1414 = musttail call fastcc i64 %t1413(i64 %t1409, i64 3, i64 %a0, i64 %a1, i64 %t1408, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1414
else294:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_461"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1419 = icmp eq i64 %argc, 3
  br i1 %t1419, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok298:
  %t1420 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1421 = icmp ne i64 %t1420, 1
  br i1 %t1421, label %then299, label %else300
then299:
  %t1422 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1423 = load i64, ptr @"scheme.base:rd-ws?"
  %t1424 = and i64 %t1423, -8
  %t1425 = inttoptr i64 %t1424 to ptr
  %t1426 = load i64, ptr %t1425
  %t1427 = inttoptr i64 %t1426 to ptr
  %t1428 = call fastcc i64%t1427(i64 %t1423, i64 1, i64 %t1422, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1429 = icmp ne i64 %t1428, 1
  br i1 %t1429, label %then301, label %else302
then301:
  %t1430 = call i64 @rt_add(i64 %a2, i64 8)
  %t1431 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1432 = and i64 %t1431, -8
  %t1433 = inttoptr i64 %t1432 to ptr
  %t1434 = load i64, ptr %t1433
  %t1435 = inttoptr i64 %t1434 to ptr
  %t1436 = musttail call fastcc i64 %t1435(i64 %t1431, i64 3, i64 %a0, i64 %a1, i64 %t1430, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1436
else302:
  %t1437 = call i64 @rt_char_to_integer(i64 %t1422)
  %t1438 = call i64 @rt_num_eq(i64 %t1437, i64 472)
  %t1439 = icmp ne i64 %t1438, 1
  br i1 %t1439, label %then303, label %else304
then303:
  %t1440 = call i64 @rt_add(i64 %a2, i64 8)
  %t1441 = load i64, ptr @"scheme.base:rd-skip-line"
  %t1442 = and i64 %t1441, -8
  %t1443 = inttoptr i64 %t1442 to ptr
  %t1444 = load i64, ptr %t1443
  %t1445 = inttoptr i64 %t1444 to ptr
  %t1446 = call fastcc i64%t1445(i64 %t1441, i64 3, i64 %a0, i64 %a1, i64 %t1440, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1447 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1448 = and i64 %t1447, -8
  %t1449 = inttoptr i64 %t1448 to ptr
  %t1450 = load i64, ptr %t1449
  %t1451 = inttoptr i64 %t1450 to ptr
  %t1452 = musttail call fastcc i64 %t1451(i64 %t1447, i64 3, i64 %a0, i64 %a1, i64 %t1446, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1452
else304:
  ret i64 %a2
else300:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_470"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1457 = icmp eq i64 %argc, 3
  br i1 %t1457, label %argok306, label %arityerr305
arityerr305:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok306:
  %t1458 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1459 = icmp ne i64 %t1458, 1
  br i1 %t1459, label %then307, label %else308
then307:
  %t1460 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1461 = load i64, ptr @"scheme.base:rd-delim?"
  %t1462 = and i64 %t1461, -8
  %t1463 = inttoptr i64 %t1462 to ptr
  %t1464 = load i64, ptr %t1463
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = call fastcc i64%t1465(i64 %t1461, i64 1, i64 %t1460, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1467 = icmp ne i64 %t1466, 1
  br i1 %t1467, label %then309, label %else310
then309:
  ret i64 %a2
else310:
  %t1468 = call i64 @rt_add(i64 %a2, i64 8)
  %t1469 = load i64, ptr @"scheme.base:rd-token-end"
  %t1470 = and i64 %t1469, -8
  %t1471 = inttoptr i64 %t1470 to ptr
  %t1472 = load i64, ptr %t1471
  %t1473 = inttoptr i64 %t1472 to ptr
  %t1474 = musttail call fastcc i64 %t1473(i64 %t1469, i64 3, i64 %a0, i64 %a1, i64 %t1468, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1474
else308:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_479"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1479 = icmp eq i64 %argc, 3
  br i1 %t1479, label %argok312, label %arityerr311
arityerr311:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok312:
  %t1480 = call i64 @rt_lt(i64 %a1, i64 %a2)
  %t1481 = icmp ne i64 %t1480, 1
  br i1 %t1481, label %then313, label %else314
then313:
  %t1482 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1483 = load i64, ptr @"scheme.base:rd-digit?"
  %t1484 = and i64 %t1483, -8
  %t1485 = inttoptr i64 %t1484 to ptr
  %t1486 = load i64, ptr %t1485
  %t1487 = inttoptr i64 %t1486 to ptr
  %t1488 = call fastcc i64%t1487(i64 %t1483, i64 1, i64 %t1482, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1489 = icmp ne i64 %t1488, 1
  br i1 %t1489, label %then315, label %else316
then315:
  %t1490 = call i64 @rt_add(i64 %a1, i64 8)
  %t1491 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t1492 = and i64 %t1491, -8
  %t1493 = inttoptr i64 %t1492 to ptr
  %t1494 = load i64, ptr %t1493
  %t1495 = inttoptr i64 %t1494 to ptr
  %t1496 = musttail call fastcc i64 %t1495(i64 %t1491, i64 3, i64 %a0, i64 %t1490, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1496
else316:
  ret i64 1
else314:
  ret i64 257
}

define fastcc i64 @"scheme.base:code_502"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1501 = icmp eq i64 %argc, 1
  br i1 %t1501, label %argok318, label %arityerr317
arityerr317:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok318:
  %t1502 = call i64 @rt_string_length(i64 %a0)
  %t1503 = call i64 @rt_lt(i64 0, i64 %t1502)
  %t1504 = icmp ne i64 %t1503, 1
  br i1 %t1504, label %then319, label %else320
then319:
  %t1505 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1506 = call i64 @rt_char_to_integer(i64 %t1505)
  %t1507 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1508 = load i64, ptr @"scheme.base:rd-digit?"
  %t1509 = and i64 %t1508, -8
  %t1510 = inttoptr i64 %t1509 to ptr
  %t1511 = load i64, ptr %t1510
  %t1512 = inttoptr i64 %t1511 to ptr
  %t1513 = call fastcc i64%t1512(i64 %t1508, i64 1, i64 %t1507, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1514 = icmp ne i64 %t1513, 1
  br i1 %t1514, label %then321, label %else322
then321:
  %t1515 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t1516 = and i64 %t1515, -8
  %t1517 = inttoptr i64 %t1516 to ptr
  %t1518 = load i64, ptr %t1517
  %t1519 = inttoptr i64 %t1518 to ptr
  %t1520 = musttail call fastcc i64 %t1519(i64 %t1515, i64 3, i64 %a0, i64 0, i64 %t1502, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1520
else322:
  %t1521 = call i64 @rt_num_eq(i64 %t1506, i64 360)
  %t1522 = icmp ne i64 %t1521, 1
  br i1 %t1522, label %then323, label %else324
then323:
  br label %merge325
else324:
  %t1523 = call i64 @rt_num_eq(i64 %t1506, i64 344)
  br label %merge325
merge325:
  %t1524 = phi i64 [ %t1521, %then323 ], [ %t1523, %else324 ]
  %t1525 = icmp ne i64 %t1524, 1
  br i1 %t1525, label %then326, label %else327
then326:
  %t1526 = call i64 @rt_lt(i64 8, i64 %t1502)
  %t1527 = icmp ne i64 %t1526, 1
  br i1 %t1527, label %then328, label %else329
then328:
  %t1528 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t1529 = and i64 %t1528, -8
  %t1530 = inttoptr i64 %t1529 to ptr
  %t1531 = load i64, ptr %t1530
  %t1532 = inttoptr i64 %t1531 to ptr
  %t1533 = musttail call fastcc i64 %t1532(i64 %t1528, i64 3, i64 %a0, i64 8, i64 %t1502, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1533
else329:
  ret i64 1
else327:
  ret i64 1
else320:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_512"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1538 = icmp eq i64 %argc, 4
  br i1 %t1538, label %argok331, label %arityerr330
arityerr330:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok331:
  %t1539 = call i64 @rt_lt(i64 %a1, i64 %a2)
  %t1540 = icmp ne i64 %t1539, 1
  br i1 %t1540, label %then332, label %else333
then332:
  %t1541 = call i64 @rt_add(i64 %a1, i64 8)
  %t1542 = call i64 @rt_mul(i64 %a3, i64 80)
  %t1543 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1544 = call i64 @rt_char_to_integer(i64 %t1543)
  %t1545 = call i64 @rt_sub(i64 %t1544, i64 384)
  %t1546 = call i64 @rt_add(i64 %t1542, i64 %t1545)
  %t1547 = load i64, ptr @"scheme.base:rd-digits"
  %t1548 = and i64 %t1547, -8
  %t1549 = inttoptr i64 %t1548 to ptr
  %t1550 = load i64, ptr %t1549
  %t1551 = inttoptr i64 %t1550 to ptr
  %t1552 = musttail call fastcc i64 %t1551(i64 %t1547, i64 4, i64 %a0, i64 %t1541, i64 %a2, i64 %t1546, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1552
else333:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code_525"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1557 = icmp eq i64 %argc, 1
  br i1 %t1557, label %argok335, label %arityerr334
arityerr334:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok335:
  %t1558 = call i64 @rt_string_length(i64 %a0)
  %t1559 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1560 = call i64 @rt_char_to_integer(i64 %t1559)
  %t1561 = call i64 @rt_num_eq(i64 %t1560, i64 360)
  %t1562 = icmp ne i64 %t1561, 1
  br i1 %t1562, label %then336, label %else337
then336:
  %t1563 = load i64, ptr @"scheme.base:rd-digits"
  %t1564 = and i64 %t1563, -8
  %t1565 = inttoptr i64 %t1564 to ptr
  %t1566 = load i64, ptr %t1565
  %t1567 = inttoptr i64 %t1566 to ptr
  %t1568 = call fastcc i64%t1567(i64 %t1563, i64 4, i64 %a0, i64 8, i64 %t1558, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1569 = call i64 @rt_sub(i64 0, i64 %t1568)
  ret i64 %t1569
else337:
  %t1570 = call i64 @rt_num_eq(i64 %t1560, i64 344)
  %t1571 = icmp ne i64 %t1570, 1
  br i1 %t1571, label %then338, label %else339
then338:
  %t1572 = load i64, ptr @"scheme.base:rd-digits"
  %t1573 = and i64 %t1572, -8
  %t1574 = inttoptr i64 %t1573 to ptr
  %t1575 = load i64, ptr %t1574
  %t1576 = inttoptr i64 %t1575 to ptr
  %t1577 = musttail call fastcc i64 %t1576(i64 %t1572, i64 4, i64 %a0, i64 8, i64 %t1558, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1577
else339:
  %t1578 = load i64, ptr @"scheme.base:rd-digits"
  %t1579 = and i64 %t1578, -8
  %t1580 = inttoptr i64 %t1579 to ptr
  %t1581 = load i64, ptr %t1580
  %t1582 = inttoptr i64 %t1581 to ptr
  %t1583 = musttail call fastcc i64 %t1582(i64 %t1578, i64 4, i64 %a0, i64 0, i64 %t1558, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1583
}

define fastcc i64 @"scheme.base:code_532"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1588 = icmp eq i64 %argc, 3
  br i1 %t1588, label %argok341, label %arityerr340
arityerr340:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok341:
  %t1589 = load i64, ptr @"scheme.base:rd-token-end"
  %t1590 = and i64 %t1589, -8
  %t1591 = inttoptr i64 %t1590 to ptr
  %t1592 = load i64, ptr %t1591
  %t1593 = inttoptr i64 %t1592 to ptr
  %t1594 = call fastcc i64%t1593(i64 %t1589, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1595 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t1594)
  %t1596 = load i64, ptr @"scheme.base:rd-numeric?"
  %t1597 = and i64 %t1596, -8
  %t1598 = inttoptr i64 %t1597 to ptr
  %t1599 = load i64, ptr %t1598
  %t1600 = inttoptr i64 %t1599 to ptr
  %t1601 = call fastcc i64%t1600(i64 %t1596, i64 1, i64 %t1595, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1602 = icmp ne i64 %t1601, 1
  br i1 %t1602, label %then342, label %else343
then342:
  %t1603 = load i64, ptr @"scheme.base:rd-parse-int"
  %t1604 = and i64 %t1603, -8
  %t1605 = inttoptr i64 %t1604 to ptr
  %t1606 = load i64, ptr %t1605
  %t1607 = inttoptr i64 %t1606 to ptr
  %t1608 = call fastcc i64%t1607(i64 %t1603, i64 1, i64 %t1595, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge344
else343:
  %t1609 = call i64 @rt_string_to_symbol(i64 %t1595)
  br label %merge344
merge344:
  %t1610 = phi i64 [ %t1608, %then342 ], [ %t1609, %else343 ]
  %t1611 = call i64 @rt_cons(i64 %t1610, i64 %t1594)
  ret i64 %t1611
}

define fastcc i64 @"scheme.base:code_560"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1616 = icmp eq i64 %argc, 1
  br i1 %t1616, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok346:
  %t1617 = call i64 @rt_char_to_integer(i64 %a0)
  %t1618 = call i64 @rt_lt(i64 376, i64 %t1617)
  %t1619 = icmp ne i64 %t1618, 1
  br i1 %t1619, label %then347, label %else348
then347:
  %t1620 = call i64 @rt_lt(i64 %t1617, i64 464)
  br label %merge349
else348:
  br label %merge349
merge349:
  %t1621 = phi i64 [ %t1620, %then347 ], [ 1, %else348 ]
  %t1622 = icmp ne i64 %t1621, 1
  br i1 %t1622, label %then350, label %else351
then350:
  %t1623 = call i64 @rt_sub(i64 %t1617, i64 384)
  ret i64 %t1623
else351:
  %t1624 = call i64 @rt_lt(i64 768, i64 %t1617)
  %t1625 = icmp ne i64 %t1624, 1
  br i1 %t1625, label %then352, label %else353
then352:
  %t1626 = call i64 @rt_lt(i64 %t1617, i64 824)
  br label %merge354
else353:
  br label %merge354
merge354:
  %t1627 = phi i64 [ %t1626, %then352 ], [ 1, %else353 ]
  %t1628 = icmp ne i64 %t1627, 1
  br i1 %t1628, label %then355, label %else356
then355:
  %t1629 = call i64 @rt_sub(i64 %t1617, i64 696)
  ret i64 %t1629
else356:
  %t1630 = call i64 @rt_lt(i64 512, i64 %t1617)
  %t1631 = icmp ne i64 %t1630, 1
  br i1 %t1631, label %then357, label %else358
then357:
  %t1632 = call i64 @rt_lt(i64 %t1617, i64 568)
  br label %merge359
else358:
  br label %merge359
merge359:
  %t1633 = phi i64 [ %t1632, %then357 ], [ 1, %else358 ]
  %t1634 = icmp ne i64 %t1633, 1
  br i1 %t1634, label %then360, label %else361
then360:
  %t1635 = call i64 @rt_sub(i64 %t1617, i64 440)
  ret i64 %t1635
else361:
  ret i64 0
}

define fastcc i64 @"scheme.base:code_574"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1640 = icmp eq i64 %argc, 4
  br i1 %t1640, label %argok363, label %arityerr362
arityerr362:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok363:
  %t1641 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1642 = icmp ne i64 %t1641, 1
  br i1 %t1642, label %then364, label %else365
then364:
  %t1643 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1644 = call i64 @rt_char_to_integer(i64 %t1643)
  %t1645 = call i64 @rt_num_eq(i64 %t1644, i64 472)
  %t1646 = icmp ne i64 %t1645, 1
  br i1 %t1646, label %then366, label %else367
then366:
  %t1647 = call i64 @rt_add(i64 %a2, i64 8)
  %t1648 = call i64 @rt_cons(i64 %a3, i64 %t1647)
  ret i64 %t1648
else367:
  %t1649 = call i64 @rt_add(i64 %a2, i64 8)
  %t1650 = call i64 @rt_mul(i64 %a3, i64 128)
  %t1651 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1652 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t1653 = and i64 %t1652, -8
  %t1654 = inttoptr i64 %t1653 to ptr
  %t1655 = load i64, ptr %t1654
  %t1656 = inttoptr i64 %t1655 to ptr
  %t1657 = call fastcc i64%t1656(i64 %t1652, i64 1, i64 %t1651, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1658 = call i64 @rt_add(i64 %t1650, i64 %t1657)
  %t1659 = load i64, ptr @"scheme.base:rd-hex"
  %t1660 = and i64 %t1659, -8
  %t1661 = inttoptr i64 %t1660 to ptr
  %t1662 = load i64, ptr %t1661
  %t1663 = inttoptr i64 %t1662 to ptr
  %t1664 = musttail call fastcc i64 %t1663(i64 %t1659, i64 4, i64 %a0, i64 %a1, i64 %t1649, i64 %t1658, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1664
else365:
  %t1665 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t1665
}

define fastcc i64 @"scheme.base:code_590"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1670 = icmp eq i64 %argc, 1
  br i1 %t1670, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok369:
  %t1671 = call i64 @rt_char_to_integer(i64 %a0)
  %t1672 = call i64 @rt_num_eq(i64 %t1671, i64 880)
  %t1673 = icmp ne i64 %t1672, 1
  br i1 %t1673, label %then370, label %else371
then370:
  %t1674 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t1674
else371:
  %t1675 = call i64 @rt_num_eq(i64 %t1671, i64 928)
  %t1676 = icmp ne i64 %t1675, 1
  br i1 %t1676, label %then372, label %else373
then372:
  %t1677 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t1677
else373:
  %t1678 = call i64 @rt_num_eq(i64 %t1671, i64 912)
  %t1679 = icmp ne i64 %t1678, 1
  br i1 %t1679, label %then374, label %else375
then374:
  %t1680 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t1680
else375:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_620"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1685 = icmp eq i64 %argc, 2
  br i1 %t1685, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok377:
  %t1686 = and i64 %self, -8
  %t1687 = inttoptr i64 %t1686 to ptr
  %t1688 = getelementptr i64, ptr %t1687, i64 1
  %t1689 = load i64, ptr %t1688
  %t1690 = call i64 @rt_lt(i64 %a0, i64 %t1689)
  %t1691 = icmp ne i64 %t1690, 1
  br i1 %t1691, label %then378, label %else379
then378:
  %t1692 = and i64 %self, -8
  %t1693 = inttoptr i64 %t1692 to ptr
  %t1694 = getelementptr i64, ptr %t1693, i64 2
  %t1695 = load i64, ptr %t1694
  %t1696 = call i64 @rt_string_ref(i64 %t1695, i64 %a0)
  %t1697 = call i64 @rt_char_to_integer(i64 %t1696)
  %t1698 = call i64 @rt_num_eq(i64 %t1697, i64 272)
  %t1699 = icmp ne i64 %t1698, 1
  br i1 %t1699, label %then380, label %else381
then380:
  %t1700 = load i64, ptr @"scheme.base:reverse"
  %t1701 = and i64 %t1700, -8
  %t1702 = inttoptr i64 %t1701 to ptr
  %t1703 = load i64, ptr %t1702
  %t1704 = inttoptr i64 %t1703 to ptr
  %t1705 = call fastcc i64%t1704(i64 %t1700, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1706 = call i64 @rt_list_to_string(i64 %t1705)
  %t1707 = call i64 @rt_add(i64 %a0, i64 8)
  %t1708 = call i64 @rt_cons(i64 %t1706, i64 %t1707)
  ret i64 %t1708
else381:
  %t1709 = call i64 @rt_num_eq(i64 %t1697, i64 736)
  %t1710 = icmp ne i64 %t1709, 1
  br i1 %t1710, label %then382, label %else383
then382:
  %t1711 = and i64 %self, -8
  %t1712 = inttoptr i64 %t1711 to ptr
  %t1713 = getelementptr i64, ptr %t1712, i64 2
  %t1714 = load i64, ptr %t1713
  %t1715 = call i64 @rt_add(i64 %a0, i64 8)
  %t1716 = call i64 @rt_string_ref(i64 %t1714, i64 %t1715)
  %t1717 = call i64 @rt_char_to_integer(i64 %t1716)
  %t1718 = call i64 @rt_num_eq(i64 %t1717, i64 960)
  %t1719 = icmp ne i64 %t1718, 1
  br i1 %t1719, label %then384, label %else385
then384:
  %t1720 = and i64 %self, -8
  %t1721 = inttoptr i64 %t1720 to ptr
  %t1722 = getelementptr i64, ptr %t1721, i64 2
  %t1723 = load i64, ptr %t1722
  %t1724 = and i64 %self, -8
  %t1725 = inttoptr i64 %t1724 to ptr
  %t1726 = getelementptr i64, ptr %t1725, i64 1
  %t1727 = load i64, ptr %t1726
  %t1728 = call i64 @rt_add(i64 %a0, i64 16)
  %t1729 = load i64, ptr @"scheme.base:rd-hex"
  %t1730 = and i64 %t1729, -8
  %t1731 = inttoptr i64 %t1730 to ptr
  %t1732 = load i64, ptr %t1731
  %t1733 = inttoptr i64 %t1732 to ptr
  %t1734 = call fastcc i64%t1733(i64 %t1729, i64 4, i64 %t1723, i64 %t1727, i64 %t1728, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1735 = call i64 @rt_cdr(i64 %t1734)
  %t1736 = call i64 @rt_car(i64 %t1734)
  %t1737 = call i64 @rt_integer_to_char(i64 %t1736)
  %t1738 = call i64 @rt_cons(i64 %t1737, i64 %a1)
  %t1739 = and i64 %self, -8
  %t1740 = inttoptr i64 %t1739 to ptr
  %t1741 = getelementptr i64, ptr %t1740, i64 3
  %t1742 = load i64, ptr %t1741
  %t1743 = and i64 %t1742, -8
  %t1744 = inttoptr i64 %t1743 to ptr
  %t1745 = load i64, ptr %t1744
  %t1746 = inttoptr i64 %t1745 to ptr
  %t1747 = musttail call fastcc i64 %t1746(i64 %t1742, i64 2, i64 %t1735, i64 %t1738, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1747
else385:
  %t1748 = call i64 @rt_add(i64 %a0, i64 16)
  %t1749 = load i64, ptr @"scheme.base:rd-str-esc"
  %t1750 = and i64 %t1749, -8
  %t1751 = inttoptr i64 %t1750 to ptr
  %t1752 = load i64, ptr %t1751
  %t1753 = inttoptr i64 %t1752 to ptr
  %t1754 = call fastcc i64%t1753(i64 %t1749, i64 1, i64 %t1716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1755 = call i64 @rt_cons(i64 %t1754, i64 %a1)
  %t1756 = and i64 %self, -8
  %t1757 = inttoptr i64 %t1756 to ptr
  %t1758 = getelementptr i64, ptr %t1757, i64 3
  %t1759 = load i64, ptr %t1758
  %t1760 = and i64 %t1759, -8
  %t1761 = inttoptr i64 %t1760 to ptr
  %t1762 = load i64, ptr %t1761
  %t1763 = inttoptr i64 %t1762 to ptr
  %t1764 = musttail call fastcc i64 %t1763(i64 %t1759, i64 2, i64 %t1748, i64 %t1755, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1764
else383:
  %t1765 = call i64 @rt_add(i64 %a0, i64 8)
  %t1766 = call i64 @rt_cons(i64 %t1696, i64 %a1)
  %t1767 = and i64 %self, -8
  %t1768 = inttoptr i64 %t1767 to ptr
  %t1769 = getelementptr i64, ptr %t1768, i64 3
  %t1770 = load i64, ptr %t1769
  %t1771 = and i64 %t1770, -8
  %t1772 = inttoptr i64 %t1771 to ptr
  %t1773 = load i64, ptr %t1772
  %t1774 = inttoptr i64 %t1773 to ptr
  %t1775 = musttail call fastcc i64 %t1774(i64 %t1770, i64 2, i64 %t1765, i64 %t1766, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1775
else379:
  %t1776 = load i64, ptr @"scheme.base:reverse"
  %t1777 = and i64 %t1776, -8
  %t1778 = inttoptr i64 %t1777 to ptr
  %t1779 = load i64, ptr %t1778
  %t1780 = inttoptr i64 %t1779 to ptr
  %t1781 = call fastcc i64%t1780(i64 %t1776, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1782 = call i64 @rt_list_to_string(i64 %t1781)
  %t1783 = call i64 @rt_cons(i64 %t1782, i64 %a0)
  ret i64 %t1783
}

define fastcc i64 @"scheme.base:code_618"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1784 = icmp eq i64 %argc, 3
  br i1 %t1784, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok387:
  %t1785 = call i64 @rt_alloc_words(i64 4)
  %t1786 = inttoptr i64 %t1785 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_620" to i64), ptr %t1786
  %t1787 = or i64 %t1785, 4
  %t1788 = getelementptr i64, ptr %t1786, i64 1
  store i64 %a1, ptr %t1788
  %t1789 = getelementptr i64, ptr %t1786, i64 2
  store i64 %a0, ptr %t1789
  %t1790 = getelementptr i64, ptr %t1786, i64 3
  store i64 %t1787, ptr %t1790
  %t1791 = and i64 %t1787, -8
  %t1792 = inttoptr i64 %t1791 to ptr
  %t1793 = load i64, ptr %t1792
  %t1794 = inttoptr i64 %t1793 to ptr
  %t1795 = musttail call fastcc i64 %t1794(i64 %t1787, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1795
}

define fastcc i64 @"scheme.base:code_661"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1800 = icmp eq i64 %argc, 3
  br i1 %t1800, label %argok389, label %arityerr388
arityerr388:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok389:
  %t1801 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1802 = call i64 @rt_char_to_integer(i64 %t1801)
  %t1803 = call i64 @rt_num_eq(i64 %t1802, i64 928)
  %t1804 = icmp ne i64 %t1803, 1
  br i1 %t1804, label %then390, label %else391
then390:
  %t1805 = call i64 @rt_add(i64 %a2, i64 8)
  %t1806 = call i64 @rt_cons(i64 257, i64 %t1805)
  ret i64 %t1806
else391:
  %t1807 = call i64 @rt_num_eq(i64 %t1802, i64 816)
  %t1808 = icmp ne i64 %t1807, 1
  br i1 %t1808, label %then392, label %else393
then392:
  %t1809 = call i64 @rt_add(i64 %a2, i64 8)
  %t1810 = call i64 @rt_cons(i64 1, i64 %t1809)
  ret i64 %t1810
else393:
  %t1811 = call i64 @rt_num_eq(i64 %t1802, i64 736)
  %t1812 = icmp ne i64 %t1811, 1
  br i1 %t1812, label %then394, label %else395
then394:
  %t1813 = load i64, ptr @"scheme.base:rd-char"
  %t1814 = and i64 %t1813, -8
  %t1815 = inttoptr i64 %t1814 to ptr
  %t1816 = load i64, ptr %t1815
  %t1817 = inttoptr i64 %t1816 to ptr
  %t1818 = musttail call fastcc i64 %t1817(i64 %t1813, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1818
else395:
  %t1819 = call i64 @rt_num_eq(i64 %t1802, i64 320)
  %t1820 = icmp ne i64 %t1819, 1
  br i1 %t1820, label %then396, label %else397
then396:
  %t1821 = call i64 @rt_add(i64 %a2, i64 8)
  %t1822 = load i64, ptr @"scheme.base:rd-list"
  %t1823 = and i64 %t1822, -8
  %t1824 = inttoptr i64 %t1823 to ptr
  %t1825 = load i64, ptr %t1824
  %t1826 = inttoptr i64 %t1825 to ptr
  %t1827 = call fastcc i64%t1826(i64 %t1822, i64 4, i64 %a0, i64 %a1, i64 %t1821, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1828 = call i64 @rt_car(i64 %t1827)
  %t1829 = load i64, ptr @"scheme.base:list->vector"
  %t1830 = and i64 %t1829, -8
  %t1831 = inttoptr i64 %t1830 to ptr
  %t1832 = load i64, ptr %t1831
  %t1833 = inttoptr i64 %t1832 to ptr
  %t1834 = call fastcc i64%t1833(i64 %t1829, i64 1, i64 %t1828, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1835 = call i64 @rt_cdr(i64 %t1827)
  %t1836 = call i64 @rt_cons(i64 %t1834, i64 %t1835)
  ret i64 %t1836
else397:
  %t1837 = call i64 @rt_num_eq(i64 %t1802, i64 936)
  %t1838 = icmp ne i64 %t1837, 1
  br i1 %t1838, label %then398, label %else399
then398:
  %t1839 = call i64 @rt_add(i64 %a2, i64 16)
  %t1840 = call i64 @rt_lt(i64 %t1839, i64 %a1)
  %t1841 = icmp ne i64 %t1840, 1
  br i1 %t1841, label %then401, label %else402
then401:
  %t1842 = call i64 @rt_add(i64 %a2, i64 8)
  %t1843 = call i64 @rt_string_ref(i64 %a0, i64 %t1842)
  %t1844 = call i64 @rt_char_to_integer(i64 %t1843)
  %t1845 = call i64 @rt_num_eq(i64 %t1844, i64 448)
  %t1846 = icmp ne i64 %t1845, 1
  br i1 %t1846, label %then404, label %else405
then404:
  %t1847 = call i64 @rt_add(i64 %a2, i64 16)
  %t1848 = call i64 @rt_string_ref(i64 %a0, i64 %t1847)
  %t1849 = call i64 @rt_char_to_integer(i64 %t1848)
  %t1850 = call i64 @rt_num_eq(i64 %t1849, i64 320)
  br label %merge406
else405:
  br label %merge406
merge406:
  %t1851 = phi i64 [ %t1850, %then404 ], [ 1, %else405 ]
  br label %merge403
else402:
  br label %merge403
merge403:
  %t1852 = phi i64 [ %t1851, %merge406 ], [ 1, %else402 ]
  br label %merge400
else399:
  br label %merge400
merge400:
  %t1853 = phi i64 [ %t1852, %merge403 ], [ 1, %else399 ]
  %t1854 = icmp ne i64 %t1853, 1
  br i1 %t1854, label %then407, label %else408
then407:
  %t1855 = call i64 @rt_add(i64 %a2, i64 24)
  %t1856 = load i64, ptr @"scheme.base:rd-list"
  %t1857 = and i64 %t1856, -8
  %t1858 = inttoptr i64 %t1857 to ptr
  %t1859 = load i64, ptr %t1858
  %t1860 = inttoptr i64 %t1859 to ptr
  %t1861 = call fastcc i64%t1860(i64 %t1856, i64 4, i64 %a0, i64 %a1, i64 %t1855, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1862 = call i64 @rt_car(i64 %t1861)
  %t1863 = load i64, ptr @"scheme.base:list->bytevector"
  %t1864 = and i64 %t1863, -8
  %t1865 = inttoptr i64 %t1864 to ptr
  %t1866 = load i64, ptr %t1865
  %t1867 = inttoptr i64 %t1866 to ptr
  %t1868 = call fastcc i64%t1867(i64 %t1863, i64 1, i64 %t1862, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1869 = call i64 @rt_cdr(i64 %t1861)
  %t1870 = call i64 @rt_cons(i64 %t1868, i64 %t1869)
  ret i64 %t1870
else408:
  %t1871 = load i64, ptr @"scheme.base:rd-token-end"
  %t1872 = and i64 %t1871, -8
  %t1873 = inttoptr i64 %t1872 to ptr
  %t1874 = load i64, ptr %t1873
  %t1875 = inttoptr i64 %t1874 to ptr
  %t1876 = call fastcc i64%t1875(i64 %t1871, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1877 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t1876)
  %t1878 = call i64 @rt_string_to_symbol(i64 %t1877)
  %t1879 = call i64 @rt_cons(i64 %t1878, i64 %t1876)
  ret i64 %t1879
}

define fastcc i64 @"scheme.base:code_664"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1884 = icmp eq i64 %argc, 1
  br i1 %t1884, label %argok410, label %arityerr409
arityerr409:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok410:
  %t1885 = call i64 @rt_make_string(ptr @.str.lit.3, i64 5)
  %t1886 = call i64 @rt_string_eq(i64 %a0, i64 %t1885)
  %t1887 = icmp ne i64 %t1886, 1
  br i1 %t1887, label %then411, label %else412
then411:
  %t1888 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t1888
else412:
  %t1889 = call i64 @rt_make_string(ptr @.str.lit.4, i64 7)
  %t1890 = call i64 @rt_string_eq(i64 %a0, i64 %t1889)
  %t1891 = icmp ne i64 %t1890, 1
  br i1 %t1891, label %then413, label %else414
then413:
  %t1892 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t1892
else414:
  %t1893 = call i64 @rt_make_string(ptr @.str.lit.5, i64 3)
  %t1894 = call i64 @rt_string_eq(i64 %a0, i64 %t1893)
  %t1895 = icmp ne i64 %t1894, 1
  br i1 %t1895, label %then415, label %else416
then415:
  %t1896 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t1896
else416:
  %t1897 = call i64 @rt_make_string(ptr @.str.lit.6, i64 6)
  %t1898 = call i64 @rt_string_eq(i64 %a0, i64 %t1897)
  %t1899 = icmp ne i64 %t1898, 1
  br i1 %t1899, label %then417, label %else418
then417:
  %t1900 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t1900
else418:
  %t1901 = call i64 @rt_make_string(ptr @.str.lit.7, i64 3)
  %t1902 = call i64 @rt_string_eq(i64 %a0, i64 %t1901)
  %t1903 = icmp ne i64 %t1902, 1
  br i1 %t1903, label %then419, label %else420
then419:
  %t1904 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t1904
else420:
  %t1905 = call i64 @rt_make_string(ptr @.str.lit.8, i64 4)
  %t1906 = call i64 @rt_string_eq(i64 %a0, i64 %t1905)
  %t1907 = icmp ne i64 %t1906, 1
  br i1 %t1907, label %then421, label %else422
then421:
  %t1908 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t1908
else422:
  %t1909 = call i64 @rt_make_string(ptr @.str.lit.9, i64 6)
  %t1910 = call i64 @rt_string_eq(i64 %a0, i64 %t1909)
  %t1911 = icmp ne i64 %t1910, 1
  br i1 %t1911, label %then423, label %else424
then423:
  %t1912 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t1912
else424:
  %t1913 = call i64 @rt_make_string(ptr @.str.lit.10, i64 7)
  %t1914 = call i64 @rt_string_eq(i64 %a0, i64 %t1913)
  %t1915 = icmp ne i64 %t1914, 1
  br i1 %t1915, label %then425, label %else426
then425:
  %t1916 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t1916
else426:
  %t1917 = call i64 @rt_make_string(ptr @.str.lit.11, i64 3)
  %t1918 = call i64 @rt_string_eq(i64 %a0, i64 %t1917)
  %t1919 = icmp ne i64 %t1918, 1
  br i1 %t1919, label %then427, label %else428
then427:
  %t1920 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t1920
else428:
  %t1921 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t1921
}

define fastcc i64 @"scheme.base:code_676"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1926 = icmp eq i64 %argc, 3
  br i1 %t1926, label %argok430, label %arityerr429
arityerr429:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok430:
  %t1927 = call i64 @rt_add(i64 %a2, i64 8)
  %t1928 = call i64 @rt_add(i64 %t1927, i64 8)
  %t1929 = load i64, ptr @"scheme.base:rd-token-end"
  %t1930 = and i64 %t1929, -8
  %t1931 = inttoptr i64 %t1930 to ptr
  %t1932 = load i64, ptr %t1931
  %t1933 = inttoptr i64 %t1932 to ptr
  %t1934 = call fastcc i64%t1933(i64 %t1929, i64 3, i64 %a0, i64 %a1, i64 %t1928, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1935 = call i64 @rt_substring(i64 %a0, i64 %t1927, i64 %t1934)
  %t1936 = call i64 @rt_string_length(i64 %t1935)
  %t1937 = call i64 @rt_num_eq(i64 %t1936, i64 8)
  %t1938 = icmp ne i64 %t1937, 1
  br i1 %t1938, label %then431, label %else432
then431:
  %t1939 = call i64 @rt_string_ref(i64 %a0, i64 %t1927)
  %t1940 = call i64 @rt_cons(i64 %t1939, i64 %t1934)
  ret i64 %t1940
else432:
  %t1941 = load i64, ptr @"scheme.base:rd-char-name"
  %t1942 = and i64 %t1941, -8
  %t1943 = inttoptr i64 %t1942 to ptr
  %t1944 = load i64, ptr %t1943
  %t1945 = inttoptr i64 %t1944 to ptr
  %t1946 = call fastcc i64%t1945(i64 %t1941, i64 1, i64 %t1935, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1947 = call i64 @rt_cons(i64 %t1946, i64 %t1934)
  ret i64 %t1947
}

define fastcc i64 @"scheme.base:code_683"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1952 = icmp eq i64 %argc, 3
  br i1 %t1952, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok434:
  %t1953 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1954 = and i64 %t1953, -8
  %t1955 = inttoptr i64 %t1954 to ptr
  %t1956 = load i64, ptr %t1955
  %t1957 = inttoptr i64 %t1956 to ptr
  %t1958 = call fastcc i64%t1957(i64 %t1953, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1959 = load i64, ptr @"scheme.base:rd-datum"
  %t1960 = and i64 %t1959, -8
  %t1961 = inttoptr i64 %t1960 to ptr
  %t1962 = load i64, ptr %t1961
  %t1963 = inttoptr i64 %t1962 to ptr
  %t1964 = call fastcc i64%t1963(i64 %t1959, i64 3, i64 %a0, i64 %a1, i64 %t1958, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1965 = call i64 @rt_intern(ptr @.str.sym.12)
  %t1966 = call i64 @rt_car(i64 %t1964)
  %t1967 = load i64, ptr @"scheme.base:list"
  %t1968 = and i64 %t1967, -8
  %t1969 = inttoptr i64 %t1968 to ptr
  %t1970 = load i64, ptr %t1969
  %t1971 = inttoptr i64 %t1970 to ptr
  %t1972 = call fastcc i64%t1971(i64 %t1967, i64 2, i64 %t1965, i64 %t1966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1973 = call i64 @rt_cdr(i64 %t1964)
  %t1974 = call i64 @rt_cons(i64 %t1972, i64 %t1973)
  ret i64 %t1974
}

define fastcc i64 @"scheme.base:code_690"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1979 = icmp eq i64 %argc, 3
  br i1 %t1979, label %argok436, label %arityerr435
arityerr435:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok436:
  %t1980 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1981 = and i64 %t1980, -8
  %t1982 = inttoptr i64 %t1981 to ptr
  %t1983 = load i64, ptr %t1982
  %t1984 = inttoptr i64 %t1983 to ptr
  %t1985 = call fastcc i64%t1984(i64 %t1980, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1986 = load i64, ptr @"scheme.base:rd-datum"
  %t1987 = and i64 %t1986, -8
  %t1988 = inttoptr i64 %t1987 to ptr
  %t1989 = load i64, ptr %t1988
  %t1990 = inttoptr i64 %t1989 to ptr
  %t1991 = call fastcc i64%t1990(i64 %t1986, i64 3, i64 %a0, i64 %a1, i64 %t1985, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1992 = call i64 @rt_intern(ptr @.str.sym.13)
  %t1993 = call i64 @rt_car(i64 %t1991)
  %t1994 = load i64, ptr @"scheme.base:list"
  %t1995 = and i64 %t1994, -8
  %t1996 = inttoptr i64 %t1995 to ptr
  %t1997 = load i64, ptr %t1996
  %t1998 = inttoptr i64 %t1997 to ptr
  %t1999 = call fastcc i64%t1998(i64 %t1994, i64 2, i64 %t1992, i64 %t1993, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2000 = call i64 @rt_cdr(i64 %t1991)
  %t2001 = call i64 @rt_cons(i64 %t1999, i64 %t2000)
  ret i64 %t2001
}

define fastcc i64 @"scheme.base:code_707"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2006 = icmp eq i64 %argc, 3
  br i1 %t2006, label %argok438, label %arityerr437
arityerr437:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok438:
  %t2007 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t2008 = icmp ne i64 %t2007, 1
  br i1 %t2008, label %then439, label %else440
then439:
  %t2009 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2010 = call i64 @rt_char_to_integer(i64 %t2009)
  %t2011 = call i64 @rt_num_eq(i64 %t2010, i64 512)
  br label %merge441
else440:
  br label %merge441
merge441:
  %t2012 = phi i64 [ %t2011, %then439 ], [ 1, %else440 ]
  %t2013 = icmp ne i64 %t2012, 1
  br i1 %t2013, label %then442, label %else443
then442:
  %t2014 = call i64 @rt_add(i64 %a2, i64 8)
  %t2015 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2016 = and i64 %t2015, -8
  %t2017 = inttoptr i64 %t2016 to ptr
  %t2018 = load i64, ptr %t2017
  %t2019 = inttoptr i64 %t2018 to ptr
  %t2020 = call fastcc i64%t2019(i64 %t2015, i64 3, i64 %a0, i64 %a1, i64 %t2014, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2021 = load i64, ptr @"scheme.base:rd-datum"
  %t2022 = and i64 %t2021, -8
  %t2023 = inttoptr i64 %t2022 to ptr
  %t2024 = load i64, ptr %t2023
  %t2025 = inttoptr i64 %t2024 to ptr
  %t2026 = call fastcc i64%t2025(i64 %t2021, i64 3, i64 %a0, i64 %a1, i64 %t2020, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2027 = call i64 @rt_intern(ptr @.str.sym.14)
  %t2028 = call i64 @rt_car(i64 %t2026)
  %t2029 = load i64, ptr @"scheme.base:list"
  %t2030 = and i64 %t2029, -8
  %t2031 = inttoptr i64 %t2030 to ptr
  %t2032 = load i64, ptr %t2031
  %t2033 = inttoptr i64 %t2032 to ptr
  %t2034 = call fastcc i64%t2033(i64 %t2029, i64 2, i64 %t2027, i64 %t2028, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2035 = call i64 @rt_cdr(i64 %t2026)
  %t2036 = call i64 @rt_cons(i64 %t2034, i64 %t2035)
  ret i64 %t2036
else443:
  %t2037 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2038 = and i64 %t2037, -8
  %t2039 = inttoptr i64 %t2038 to ptr
  %t2040 = load i64, ptr %t2039
  %t2041 = inttoptr i64 %t2040 to ptr
  %t2042 = call fastcc i64%t2041(i64 %t2037, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2043 = load i64, ptr @"scheme.base:rd-datum"
  %t2044 = and i64 %t2043, -8
  %t2045 = inttoptr i64 %t2044 to ptr
  %t2046 = load i64, ptr %t2045
  %t2047 = inttoptr i64 %t2046 to ptr
  %t2048 = call fastcc i64%t2047(i64 %t2043, i64 3, i64 %a0, i64 %a1, i64 %t2042, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2049 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2050 = call i64 @rt_car(i64 %t2048)
  %t2051 = load i64, ptr @"scheme.base:list"
  %t2052 = and i64 %t2051, -8
  %t2053 = inttoptr i64 %t2052 to ptr
  %t2054 = load i64, ptr %t2053
  %t2055 = inttoptr i64 %t2054 to ptr
  %t2056 = call fastcc i64%t2055(i64 %t2051, i64 2, i64 %t2049, i64 %t2050, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2057 = call i64 @rt_cdr(i64 %t2048)
  %t2058 = call i64 @rt_cons(i64 %t2056, i64 %t2057)
  ret i64 %t2058
}

define fastcc i64 @"scheme.base:code_720"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2063 = icmp eq i64 %argc, 3
  br i1 %t2063, label %argok445, label %arityerr444
arityerr444:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok445:
  %t2064 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2065 = call i64 @rt_char_to_integer(i64 %t2064)
  %t2066 = call i64 @rt_num_eq(i64 %t2065, i64 368)
  %t2067 = icmp ne i64 %t2066, 1
  br i1 %t2067, label %then446, label %else447
then446:
  %t2068 = call i64 @rt_add(i64 %a2, i64 8)
  %t2069 = load i64, ptr @"scheme.base:rd-token-end"
  %t2070 = and i64 %t2069, -8
  %t2071 = inttoptr i64 %t2070 to ptr
  %t2072 = load i64, ptr %t2071
  %t2073 = inttoptr i64 %t2072 to ptr
  %t2074 = call fastcc i64%t2073(i64 %t2069, i64 3, i64 %a0, i64 %a1, i64 %t2068, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2075 = call i64 @rt_add(i64 %a2, i64 8)
  %t2076 = call i64 @rt_num_eq(i64 %t2074, i64 %t2075)
  ret i64 %t2076
else447:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_724"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2081 = icmp eq i64 %argc, 2
  br i1 %t2081, label %argok449, label %arityerr448
arityerr448:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok449:
  %t2082 = call i64 @rt_null_p(i64 %a0)
  %t2083 = icmp ne i64 %t2082, 1
  br i1 %t2083, label %then450, label %else451
then450:
  ret i64 %a1
else451:
  %t2084 = call i64 @rt_cdr(i64 %a0)
  %t2085 = call i64 @rt_car(i64 %a0)
  %t2086 = call i64 @rt_cons(i64 %t2085, i64 %a1)
  %t2087 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t2088 = and i64 %t2087, -8
  %t2089 = inttoptr i64 %t2088 to ptr
  %t2090 = load i64, ptr %t2089
  %t2091 = inttoptr i64 %t2090 to ptr
  %t2092 = musttail call fastcc i64 %t2091(i64 %t2087, i64 2, i64 %t2084, i64 %t2086, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2092
}

define fastcc i64 @"scheme.base:code_749"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2097 = icmp eq i64 %argc, 4
  br i1 %t2097, label %argok453, label %arityerr452
arityerr452:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok453:
  %t2098 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2099 = and i64 %t2098, -8
  %t2100 = inttoptr i64 %t2099 to ptr
  %t2101 = load i64, ptr %t2100
  %t2102 = inttoptr i64 %t2101 to ptr
  %t2103 = call fastcc i64%t2102(i64 %t2098, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2104 = call i64 @rt_lt(i64 %t2103, i64 %a1)
  %t2105 = icmp ne i64 %t2104, 1
  br i1 %t2105, label %then454, label %else455
then454:
  %t2106 = call i64 @rt_string_ref(i64 %a0, i64 %t2103)
  %t2107 = call i64 @rt_char_to_integer(i64 %t2106)
  %t2108 = call i64 @rt_num_eq(i64 %t2107, i64 328)
  %t2109 = icmp ne i64 %t2108, 1
  br i1 %t2109, label %then456, label %else457
then456:
  br label %merge458
else457:
  %t2110 = call i64 @rt_num_eq(i64 %t2107, i64 744)
  br label %merge458
merge458:
  %t2111 = phi i64 [ %t2108, %then456 ], [ %t2110, %else457 ]
  %t2112 = icmp ne i64 %t2111, 1
  br i1 %t2112, label %then459, label %else460
then459:
  %t2113 = load i64, ptr @"scheme.base:reverse"
  %t2114 = and i64 %t2113, -8
  %t2115 = inttoptr i64 %t2114 to ptr
  %t2116 = load i64, ptr %t2115
  %t2117 = inttoptr i64 %t2116 to ptr
  %t2118 = call fastcc i64%t2117(i64 %t2113, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2119 = call i64 @rt_add(i64 %t2103, i64 8)
  %t2120 = call i64 @rt_cons(i64 %t2118, i64 %t2119)
  ret i64 %t2120
else460:
  %t2121 = load i64, ptr @"scheme.base:rd-dot?"
  %t2122 = and i64 %t2121, -8
  %t2123 = inttoptr i64 %t2122 to ptr
  %t2124 = load i64, ptr %t2123
  %t2125 = inttoptr i64 %t2124 to ptr
  %t2126 = call fastcc i64%t2125(i64 %t2121, i64 3, i64 %a0, i64 %a1, i64 %t2103, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2127 = icmp ne i64 %t2126, 1
  br i1 %t2127, label %then461, label %else462
then461:
  %t2128 = call i64 @rt_add(i64 %t2103, i64 8)
  %t2129 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2130 = and i64 %t2129, -8
  %t2131 = inttoptr i64 %t2130 to ptr
  %t2132 = load i64, ptr %t2131
  %t2133 = inttoptr i64 %t2132 to ptr
  %t2134 = call fastcc i64%t2133(i64 %t2129, i64 3, i64 %a0, i64 %a1, i64 %t2128, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2135 = load i64, ptr @"scheme.base:rd-datum"
  %t2136 = and i64 %t2135, -8
  %t2137 = inttoptr i64 %t2136 to ptr
  %t2138 = load i64, ptr %t2137
  %t2139 = inttoptr i64 %t2138 to ptr
  %t2140 = call fastcc i64%t2139(i64 %t2135, i64 3, i64 %a0, i64 %a1, i64 %t2134, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2141 = call i64 @rt_cdr(i64 %t2140)
  %t2142 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2143 = and i64 %t2142, -8
  %t2144 = inttoptr i64 %t2143 to ptr
  %t2145 = load i64, ptr %t2144
  %t2146 = inttoptr i64 %t2145 to ptr
  %t2147 = call fastcc i64%t2146(i64 %t2142, i64 3, i64 %a0, i64 %a1, i64 %t2141, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2148 = call i64 @rt_car(i64 %t2140)
  %t2149 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t2150 = and i64 %t2149, -8
  %t2151 = inttoptr i64 %t2150 to ptr
  %t2152 = load i64, ptr %t2151
  %t2153 = inttoptr i64 %t2152 to ptr
  %t2154 = call fastcc i64%t2153(i64 %t2149, i64 2, i64 %a3, i64 %t2148, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2155 = call i64 @rt_add(i64 %t2147, i64 8)
  %t2156 = call i64 @rt_cons(i64 %t2154, i64 %t2155)
  ret i64 %t2156
else462:
  %t2157 = load i64, ptr @"scheme.base:rd-datum"
  %t2158 = and i64 %t2157, -8
  %t2159 = inttoptr i64 %t2158 to ptr
  %t2160 = load i64, ptr %t2159
  %t2161 = inttoptr i64 %t2160 to ptr
  %t2162 = call fastcc i64%t2161(i64 %t2157, i64 3, i64 %a0, i64 %a1, i64 %t2103, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2163 = call i64 @rt_cdr(i64 %t2162)
  %t2164 = call i64 @rt_car(i64 %t2162)
  %t2165 = call i64 @rt_cons(i64 %t2164, i64 %a3)
  %t2166 = load i64, ptr @"scheme.base:rd-list"
  %t2167 = and i64 %t2166, -8
  %t2168 = inttoptr i64 %t2167 to ptr
  %t2169 = load i64, ptr %t2168
  %t2170 = inttoptr i64 %t2169 to ptr
  %t2171 = musttail call fastcc i64 %t2170(i64 %t2166, i64 4, i64 %a0, i64 %a1, i64 %t2163, i64 %t2165, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2171
else455:
  %t2172 = load i64, ptr @"scheme.base:reverse"
  %t2173 = and i64 %t2172, -8
  %t2174 = inttoptr i64 %t2173 to ptr
  %t2175 = load i64, ptr %t2174
  %t2176 = inttoptr i64 %t2175 to ptr
  %t2177 = call fastcc i64%t2176(i64 %t2172, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2178 = call i64 @rt_cons(i64 %t2177, i64 %t2103)
  ret i64 %t2178
}

define fastcc i64 @"scheme.base:code_783"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2183 = icmp eq i64 %argc, 3
  br i1 %t2183, label %argok464, label %arityerr463
arityerr463:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok464:
  %t2184 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2185 = call i64 @rt_char_to_integer(i64 %t2184)
  %t2186 = call i64 @rt_num_eq(i64 %t2185, i64 320)
  %t2187 = icmp ne i64 %t2186, 1
  br i1 %t2187, label %then465, label %else466
then465:
  %t2188 = call i64 @rt_add(i64 %a2, i64 8)
  %t2189 = load i64, ptr @"scheme.base:rd-list"
  %t2190 = and i64 %t2189, -8
  %t2191 = inttoptr i64 %t2190 to ptr
  %t2192 = load i64, ptr %t2191
  %t2193 = inttoptr i64 %t2192 to ptr
  %t2194 = musttail call fastcc i64 %t2193(i64 %t2189, i64 4, i64 %a0, i64 %a1, i64 %t2188, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2194
else466:
  %t2195 = call i64 @rt_num_eq(i64 %t2185, i64 728)
  %t2196 = icmp ne i64 %t2195, 1
  br i1 %t2196, label %then467, label %else468
then467:
  %t2197 = call i64 @rt_add(i64 %a2, i64 8)
  %t2198 = load i64, ptr @"scheme.base:rd-list"
  %t2199 = and i64 %t2198, -8
  %t2200 = inttoptr i64 %t2199 to ptr
  %t2201 = load i64, ptr %t2200
  %t2202 = inttoptr i64 %t2201 to ptr
  %t2203 = musttail call fastcc i64 %t2202(i64 %t2198, i64 4, i64 %a0, i64 %a1, i64 %t2197, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2203
else468:
  %t2204 = call i64 @rt_num_eq(i64 %t2185, i64 312)
  %t2205 = icmp ne i64 %t2204, 1
  br i1 %t2205, label %then469, label %else470
then469:
  %t2206 = call i64 @rt_add(i64 %a2, i64 8)
  %t2207 = load i64, ptr @"scheme.base:rd-quote"
  %t2208 = and i64 %t2207, -8
  %t2209 = inttoptr i64 %t2208 to ptr
  %t2210 = load i64, ptr %t2209
  %t2211 = inttoptr i64 %t2210 to ptr
  %t2212 = musttail call fastcc i64 %t2211(i64 %t2207, i64 3, i64 %a0, i64 %a1, i64 %t2206, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2212
else470:
  %t2213 = call i64 @rt_num_eq(i64 %t2185, i64 768)
  %t2214 = icmp ne i64 %t2213, 1
  br i1 %t2214, label %then471, label %else472
then471:
  %t2215 = call i64 @rt_add(i64 %a2, i64 8)
  %t2216 = load i64, ptr @"scheme.base:rd-quasi"
  %t2217 = and i64 %t2216, -8
  %t2218 = inttoptr i64 %t2217 to ptr
  %t2219 = load i64, ptr %t2218
  %t2220 = inttoptr i64 %t2219 to ptr
  %t2221 = musttail call fastcc i64 %t2220(i64 %t2216, i64 3, i64 %a0, i64 %a1, i64 %t2215, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2221
else472:
  %t2222 = call i64 @rt_num_eq(i64 %t2185, i64 352)
  %t2223 = icmp ne i64 %t2222, 1
  br i1 %t2223, label %then473, label %else474
then473:
  %t2224 = call i64 @rt_add(i64 %a2, i64 8)
  %t2225 = load i64, ptr @"scheme.base:rd-unquote"
  %t2226 = and i64 %t2225, -8
  %t2227 = inttoptr i64 %t2226 to ptr
  %t2228 = load i64, ptr %t2227
  %t2229 = inttoptr i64 %t2228 to ptr
  %t2230 = musttail call fastcc i64 %t2229(i64 %t2225, i64 3, i64 %a0, i64 %a1, i64 %t2224, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2230
else474:
  %t2231 = call i64 @rt_num_eq(i64 %t2185, i64 272)
  %t2232 = icmp ne i64 %t2231, 1
  br i1 %t2232, label %then475, label %else476
then475:
  %t2233 = call i64 @rt_add(i64 %a2, i64 8)
  %t2234 = load i64, ptr @"scheme.base:rd-string"
  %t2235 = and i64 %t2234, -8
  %t2236 = inttoptr i64 %t2235 to ptr
  %t2237 = load i64, ptr %t2236
  %t2238 = inttoptr i64 %t2237 to ptr
  %t2239 = musttail call fastcc i64 %t2238(i64 %t2234, i64 3, i64 %a0, i64 %a1, i64 %t2233, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2239
else476:
  %t2240 = call i64 @rt_num_eq(i64 %t2185, i64 280)
  %t2241 = icmp ne i64 %t2240, 1
  br i1 %t2241, label %then477, label %else478
then477:
  %t2242 = call i64 @rt_add(i64 %a2, i64 8)
  %t2243 = load i64, ptr @"scheme.base:rd-hash"
  %t2244 = and i64 %t2243, -8
  %t2245 = inttoptr i64 %t2244 to ptr
  %t2246 = load i64, ptr %t2245
  %t2247 = inttoptr i64 %t2246 to ptr
  %t2248 = musttail call fastcc i64 %t2247(i64 %t2243, i64 3, i64 %a0, i64 %a1, i64 %t2242, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2248
else478:
  %t2249 = load i64, ptr @"scheme.base:rd-atom"
  %t2250 = and i64 %t2249, -8
  %t2251 = inttoptr i64 %t2250 to ptr
  %t2252 = load i64, ptr %t2251
  %t2253 = inttoptr i64 %t2252 to ptr
  %t2254 = musttail call fastcc i64 %t2253(i64 %t2249, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2254
}

define fastcc i64 @"scheme.base:code_787"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2259 = icmp eq i64 %argc, 1
  br i1 %t2259, label %argok480, label %arityerr479
arityerr479:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok480:
  %t2260 = call i64 @rt_string_length(i64 %a0)
  %t2261 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2262 = and i64 %t2261, -8
  %t2263 = inttoptr i64 %t2262 to ptr
  %t2264 = load i64, ptr %t2263
  %t2265 = inttoptr i64 %t2264 to ptr
  %t2266 = call fastcc i64%t2265(i64 %t2261, i64 3, i64 %a0, i64 %t2260, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2267 = load i64, ptr @"scheme.base:rd-datum"
  %t2268 = and i64 %t2267, -8
  %t2269 = inttoptr i64 %t2268 to ptr
  %t2270 = load i64, ptr %t2269
  %t2271 = inttoptr i64 %t2270 to ptr
  %t2272 = call fastcc i64%t2271(i64 %t2267, i64 3, i64 %a0, i64 %t2260, i64 %t2266, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2273 = call i64 @rt_car(i64 %t2272)
  ret i64 %t2273
}

define fastcc i64 @"scheme.base:code_801"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2278 = icmp eq i64 %argc, 2
  br i1 %t2278, label %argok482, label %arityerr481
arityerr481:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok482:
  %t2279 = and i64 %self, -8
  %t2280 = inttoptr i64 %t2279 to ptr
  %t2281 = getelementptr i64, ptr %t2280, i64 1
  %t2282 = load i64, ptr %t2281
  %t2283 = call i64 @rt_lt(i64 %a0, i64 %t2282)
  %t2284 = icmp ne i64 %t2283, 1
  br i1 %t2284, label %then483, label %else484
then483:
  %t2285 = and i64 %self, -8
  %t2286 = inttoptr i64 %t2285 to ptr
  %t2287 = getelementptr i64, ptr %t2286, i64 2
  %t2288 = load i64, ptr %t2287
  %t2289 = and i64 %self, -8
  %t2290 = inttoptr i64 %t2289 to ptr
  %t2291 = getelementptr i64, ptr %t2290, i64 1
  %t2292 = load i64, ptr %t2291
  %t2293 = load i64, ptr @"scheme.base:rd-datum"
  %t2294 = and i64 %t2293, -8
  %t2295 = inttoptr i64 %t2294 to ptr
  %t2296 = load i64, ptr %t2295
  %t2297 = inttoptr i64 %t2296 to ptr
  %t2298 = call fastcc i64%t2297(i64 %t2293, i64 3, i64 %t2288, i64 %t2292, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2299 = and i64 %self, -8
  %t2300 = inttoptr i64 %t2299 to ptr
  %t2301 = getelementptr i64, ptr %t2300, i64 2
  %t2302 = load i64, ptr %t2301
  %t2303 = and i64 %self, -8
  %t2304 = inttoptr i64 %t2303 to ptr
  %t2305 = getelementptr i64, ptr %t2304, i64 1
  %t2306 = load i64, ptr %t2305
  %t2307 = call i64 @rt_cdr(i64 %t2298)
  %t2308 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2309 = and i64 %t2308, -8
  %t2310 = inttoptr i64 %t2309 to ptr
  %t2311 = load i64, ptr %t2310
  %t2312 = inttoptr i64 %t2311 to ptr
  %t2313 = call fastcc i64%t2312(i64 %t2308, i64 3, i64 %t2302, i64 %t2306, i64 %t2307, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2314 = call i64 @rt_car(i64 %t2298)
  %t2315 = call i64 @rt_cons(i64 %t2314, i64 %a1)
  %t2316 = and i64 %self, -8
  %t2317 = inttoptr i64 %t2316 to ptr
  %t2318 = getelementptr i64, ptr %t2317, i64 3
  %t2319 = load i64, ptr %t2318
  %t2320 = and i64 %t2319, -8
  %t2321 = inttoptr i64 %t2320 to ptr
  %t2322 = load i64, ptr %t2321
  %t2323 = inttoptr i64 %t2322 to ptr
  %t2324 = musttail call fastcc i64 %t2323(i64 %t2319, i64 2, i64 %t2313, i64 %t2315, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2324
else484:
  %t2325 = load i64, ptr @"scheme.base:reverse"
  %t2326 = and i64 %t2325, -8
  %t2327 = inttoptr i64 %t2326 to ptr
  %t2328 = load i64, ptr %t2327
  %t2329 = inttoptr i64 %t2328 to ptr
  %t2330 = musttail call fastcc i64 %t2329(i64 %t2325, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2330
}

define fastcc i64 @"scheme.base:code_799"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2331 = icmp eq i64 %argc, 1
  br i1 %t2331, label %argok486, label %arityerr485
arityerr485:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok486:
  %t2332 = call i64 @rt_string_length(i64 %a0)
  %t2333 = call i64 @rt_alloc_words(i64 4)
  %t2334 = inttoptr i64 %t2333 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_801" to i64), ptr %t2334
  %t2335 = or i64 %t2333, 4
  %t2336 = getelementptr i64, ptr %t2334, i64 1
  store i64 %t2332, ptr %t2336
  %t2337 = getelementptr i64, ptr %t2334, i64 2
  store i64 %a0, ptr %t2337
  %t2338 = getelementptr i64, ptr %t2334, i64 3
  store i64 %t2335, ptr %t2338
  %t2339 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2340 = and i64 %t2339, -8
  %t2341 = inttoptr i64 %t2340 to ptr
  %t2342 = load i64, ptr %t2341
  %t2343 = inttoptr i64 %t2342 to ptr
  %t2344 = call fastcc i64%t2343(i64 %t2339, i64 3, i64 %a0, i64 %t2332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2345 = and i64 %t2335, -8
  %t2346 = inttoptr i64 %t2345 to ptr
  %t2347 = load i64, ptr %t2346
  %t2348 = inttoptr i64 %t2347 to ptr
  %t2349 = musttail call fastcc i64 %t2348(i64 %t2335, i64 2, i64 %t2344, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2349
}

define i64 @"scheme.base:__init_1"() {
entry:
  %t13 = call i64 @rt_alloc_words(i64 1)
  %t14 = inttoptr i64 %t13 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_1" to i64), ptr %t14
  %t15 = or i64 %t13, 4
  %t16 = call i64 @rt_root(i64 %t15)
  store i64 %t16, ptr @"scheme.base:list"
  ret i64 %t16
}

define i64 @"scheme.base:__init_2"() {
entry:
  %t20 = call i64 @rt_alloc_words(i64 1)
  %t21 = inttoptr i64 %t20 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_4" to i64), ptr %t21
  %t22 = or i64 %t20, 4
  %t23 = call i64 @rt_root(i64 %t22)
  store i64 %t23, ptr @"scheme.base:caar"
  ret i64 %t23
}

define i64 @"scheme.base:__init_3"() {
entry:
  %t27 = call i64 @rt_alloc_words(i64 1)
  %t28 = inttoptr i64 %t27 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_7" to i64), ptr %t28
  %t29 = or i64 %t27, 4
  %t30 = call i64 @rt_root(i64 %t29)
  store i64 %t30, ptr @"scheme.base:cadr"
  ret i64 %t30
}

define i64 @"scheme.base:__init_4"() {
entry:
  %t34 = call i64 @rt_alloc_words(i64 1)
  %t35 = inttoptr i64 %t34 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_10" to i64), ptr %t35
  %t36 = or i64 %t34, 4
  %t37 = call i64 @rt_root(i64 %t36)
  store i64 %t37, ptr @"scheme.base:cdar"
  ret i64 %t37
}

define i64 @"scheme.base:__init_5"() {
entry:
  %t41 = call i64 @rt_alloc_words(i64 1)
  %t42 = inttoptr i64 %t41 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_13" to i64), ptr %t42
  %t43 = or i64 %t41, 4
  %t44 = call i64 @rt_root(i64 %t43)
  store i64 %t44, ptr @"scheme.base:cddr"
  ret i64 %t44
}

define i64 @"scheme.base:__init_6"() {
entry:
  %t53 = call i64 @rt_alloc_words(i64 1)
  %t54 = inttoptr i64 %t53 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_16" to i64), ptr %t54
  %t55 = or i64 %t53, 4
  %t56 = call i64 @rt_root(i64 %t55)
  store i64 %t56, ptr @"scheme.base:caaar"
  ret i64 %t56
}

define i64 @"scheme.base:__init_7"() {
entry:
  %t65 = call i64 @rt_alloc_words(i64 1)
  %t66 = inttoptr i64 %t65 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_19" to i64), ptr %t66
  %t67 = or i64 %t65, 4
  %t68 = call i64 @rt_root(i64 %t67)
  store i64 %t68, ptr @"scheme.base:caadr"
  ret i64 %t68
}

define i64 @"scheme.base:__init_8"() {
entry:
  %t77 = call i64 @rt_alloc_words(i64 1)
  %t78 = inttoptr i64 %t77 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_22" to i64), ptr %t78
  %t79 = or i64 %t77, 4
  %t80 = call i64 @rt_root(i64 %t79)
  store i64 %t80, ptr @"scheme.base:cadar"
  ret i64 %t80
}

define i64 @"scheme.base:__init_9"() {
entry:
  %t89 = call i64 @rt_alloc_words(i64 1)
  %t90 = inttoptr i64 %t89 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_25" to i64), ptr %t90
  %t91 = or i64 %t89, 4
  %t92 = call i64 @rt_root(i64 %t91)
  store i64 %t92, ptr @"scheme.base:caddr"
  ret i64 %t92
}

define i64 @"scheme.base:__init_10"() {
entry:
  %t101 = call i64 @rt_alloc_words(i64 1)
  %t102 = inttoptr i64 %t101 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_28" to i64), ptr %t102
  %t103 = or i64 %t101, 4
  %t104 = call i64 @rt_root(i64 %t103)
  store i64 %t104, ptr @"scheme.base:cdaar"
  ret i64 %t104
}

define i64 @"scheme.base:__init_11"() {
entry:
  %t113 = call i64 @rt_alloc_words(i64 1)
  %t114 = inttoptr i64 %t113 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_31" to i64), ptr %t114
  %t115 = or i64 %t113, 4
  %t116 = call i64 @rt_root(i64 %t115)
  store i64 %t116, ptr @"scheme.base:cdadr"
  ret i64 %t116
}

define i64 @"scheme.base:__init_12"() {
entry:
  %t125 = call i64 @rt_alloc_words(i64 1)
  %t126 = inttoptr i64 %t125 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_34" to i64), ptr %t126
  %t127 = or i64 %t125, 4
  %t128 = call i64 @rt_root(i64 %t127)
  store i64 %t128, ptr @"scheme.base:cddar"
  ret i64 %t128
}

define i64 @"scheme.base:__init_13"() {
entry:
  %t137 = call i64 @rt_alloc_words(i64 1)
  %t138 = inttoptr i64 %t137 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_37" to i64), ptr %t138
  %t139 = or i64 %t137, 4
  %t140 = call i64 @rt_root(i64 %t139)
  store i64 %t140, ptr @"scheme.base:cdddr"
  ret i64 %t140
}

define i64 @"scheme.base:__init_14"() {
entry:
  %t165 = call i64 @rt_alloc_words(i64 1)
  %t166 = inttoptr i64 %t165 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_43" to i64), ptr %t166
  %t167 = or i64 %t165, 4
  %t168 = call i64 @rt_root(i64 %t167)
  store i64 %t168, ptr @"scheme.base:length"
  ret i64 %t168
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t194 = call i64 @rt_alloc_words(i64 1)
  %t195 = inttoptr i64 %t194 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_51" to i64), ptr %t195
  %t196 = or i64 %t194, 4
  %t197 = call i64 @rt_root(i64 %t196)
  store i64 %t197, ptr @"scheme.base:reverse"
  ret i64 %t197
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t210 = call i64 @rt_alloc_words(i64 1)
  %t211 = inttoptr i64 %t210 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_57" to i64), ptr %t211
  %t212 = or i64 %t210, 4
  %t213 = call i64 @rt_root(i64 %t212)
  store i64 %t213, ptr @"scheme.base:%append2"
  ret i64 %t213
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t268 = call i64 @rt_alloc_words(i64 1)
  %t269 = inttoptr i64 %t268 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_60" to i64), ptr %t269
  %t270 = or i64 %t268, 4
  %t271 = call i64 @rt_root(i64 %t270)
  store i64 %t271, ptr @"scheme.base:append"
  ret i64 %t271
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t289 = call i64 @rt_alloc_words(i64 1)
  %t290 = inttoptr i64 %t289 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_64" to i64), ptr %t290
  %t291 = or i64 %t289, 4
  %t292 = call i64 @rt_root(i64 %t291)
  store i64 %t292, ptr @"scheme.base:%map1"
  ret i64 %t292
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t306 = call i64 @rt_alloc_words(i64 1)
  %t307 = inttoptr i64 %t306 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_67" to i64), ptr %t307
  %t308 = or i64 %t306, 4
  %t309 = call i64 @rt_root(i64 %t308)
  store i64 %t309, ptr @"scheme.base:%any-null?"
  ret i64 %t309
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t374 = call i64 @rt_alloc_words(i64 1)
  %t375 = inttoptr i64 %t374 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_73" to i64), ptr %t375
  %t376 = or i64 %t374, 4
  %t377 = call i64 @rt_root(i64 %t376)
  store i64 %t377, ptr @"scheme.base:%mapn"
  ret i64 %t377
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t405 = call i64 @rt_alloc_words(i64 1)
  %t406 = inttoptr i64 %t405 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_82" to i64), ptr %t406
  %t407 = or i64 %t405, 4
  %t408 = call i64 @rt_root(i64 %t407)
  store i64 %t408, ptr @"scheme.base:map"
  ret i64 %t408
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t422 = call i64 @rt_alloc_words(i64 1)
  %t423 = inttoptr i64 %t422 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_90" to i64), ptr %t423
  %t424 = or i64 %t422, 4
  %t425 = call i64 @rt_root(i64 %t424)
  store i64 %t425, ptr @"scheme.base:memq"
  ret i64 %t425
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t439 = call i64 @rt_alloc_words(i64 1)
  %t440 = inttoptr i64 %t439 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_98" to i64), ptr %t440
  %t441 = or i64 %t439, 4
  %t442 = call i64 @rt_root(i64 %t441)
  store i64 %t442, ptr @"scheme.base:memv"
  ret i64 %t442
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t458 = call i64 @rt_alloc_words(i64 1)
  %t459 = inttoptr i64 %t458 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_106" to i64), ptr %t459
  %t460 = or i64 %t458, 4
  %t461 = call i64 @rt_root(i64 %t460)
  store i64 %t461, ptr @"scheme.base:assq"
  ret i64 %t461
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t475 = call i64 @rt_alloc_words(i64 1)
  %t476 = inttoptr i64 %t475 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_110" to i64), ptr %t476
  %t477 = or i64 %t475, 4
  %t478 = call i64 @rt_root(i64 %t477)
  store i64 %t478, ptr @"scheme.base:member"
  ret i64 %t478
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t494 = call i64 @rt_alloc_words(i64 1)
  %t495 = inttoptr i64 %t494 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_114" to i64), ptr %t495
  %t496 = or i64 %t494, 4
  %t497 = call i64 @rt_root(i64 %t496)
  store i64 %t497, ptr @"scheme.base:assoc"
  ret i64 %t497
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t524 = call i64 @rt_alloc_words(i64 1)
  %t525 = inttoptr i64 %t524 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_118" to i64), ptr %t525
  %t526 = or i64 %t524, 4
  %t527 = call i64 @rt_root(i64 %t526)
  store i64 %t527, ptr @"scheme.base:filter"
  ret i64 %t527
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t544 = call i64 @rt_alloc_words(i64 1)
  %t545 = inttoptr i64 %t544 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_123" to i64), ptr %t545
  %t546 = or i64 %t544, 4
  %t547 = call i64 @rt_root(i64 %t546)
  store i64 %t547, ptr @"scheme.base:fold-left"
  ret i64 %t547
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t564 = call i64 @rt_alloc_words(i64 1)
  %t565 = inttoptr i64 %t564 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_128" to i64), ptr %t565
  %t566 = or i64 %t564, 4
  %t567 = call i64 @rt_root(i64 %t566)
  store i64 %t567, ptr @"scheme.base:fold-right"
  ret i64 %t567
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t585 = call i64 @rt_alloc_words(i64 1)
  %t586 = inttoptr i64 %t585 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_132" to i64), ptr %t586
  %t587 = or i64 %t585, 4
  %t588 = call i64 @rt_root(i64 %t587)
  store i64 %t588, ptr @"scheme.base:%for-each1"
  ret i64 %t588
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t653 = call i64 @rt_alloc_words(i64 1)
  %t654 = inttoptr i64 %t653 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_138" to i64), ptr %t654
  %t655 = or i64 %t653, 4
  %t656 = call i64 @rt_root(i64 %t655)
  store i64 %t656, ptr @"scheme.base:%for-eachn"
  ret i64 %t656
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t684 = call i64 @rt_alloc_words(i64 1)
  %t685 = inttoptr i64 %t684 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_147" to i64), ptr %t685
  %t686 = or i64 %t684, 4
  %t687 = call i64 @rt_root(i64 %t686)
  store i64 %t687, ptr @"scheme.base:for-each"
  ret i64 %t687
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t705 = call i64 @rt_alloc_words(i64 1)
  %t706 = inttoptr i64 %t705 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_151" to i64), ptr %t706
  %t707 = or i64 %t705, 4
  %t708 = call i64 @rt_root(i64 %t707)
  store i64 %t708, ptr @"scheme.base:andmap"
  ret i64 %t708
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t726 = call i64 @rt_alloc_words(i64 1)
  %t727 = inttoptr i64 %t726 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_155" to i64), ptr %t727
  %t728 = or i64 %t726, 4
  %t729 = call i64 @rt_root(i64 %t728)
  store i64 %t729, ptr @"scheme.base:memp"
  ret i64 %t729
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t738 = call i64 @rt_alloc_words(i64 1)
  %t739 = inttoptr i64 %t738 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_158" to i64), ptr %t739
  %t740 = or i64 %t738, 4
  %t741 = call i64 @rt_root(i64 %t740)
  store i64 %t741, ptr @"scheme.base:cadddr"
  ret i64 %t741
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t754 = call i64 @rt_alloc_words(i64 1)
  %t755 = inttoptr i64 %t754 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_161" to i64), ptr %t755
  %t756 = or i64 %t754, 4
  %t757 = call i64 @rt_root(i64 %t756)
  store i64 %t757, ptr @"scheme.base:list?"
  ret i64 %t757
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t760 = call i64 @rt_alloc_words(i64 1)
  %t761 = inttoptr i64 %t760 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_168" to i64), ptr %t761
  %t762 = or i64 %t760, 4
  %t763 = call i64 @rt_root(i64 %t762)
  store i64 %t763, ptr @"scheme.base:zero?"
  ret i64 %t763
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t780 = call i64 @rt_alloc_words(i64 1)
  %t781 = inttoptr i64 %t780 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_172" to i64), ptr %t781
  %t782 = or i64 %t780, 4
  %t783 = call i64 @rt_root(i64 %t782)
  store i64 %t783, ptr @"scheme.base:list-tail"
  ret i64 %t783
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t792 = call i64 @rt_alloc_words(i64 1)
  %t793 = inttoptr i64 %t792 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_176" to i64), ptr %t793
  %t794 = or i64 %t792, 4
  %t795 = call i64 @rt_root(i64 %t794)
  store i64 %t795, ptr @"scheme.base:list-ref"
  ret i64 %t795
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t814 = call i64 @rt_alloc_words(i64 1)
  %t815 = inttoptr i64 %t814 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_180" to i64), ptr %t815
  %t816 = or i64 %t814, 4
  %t817 = call i64 @rt_root(i64 %t816)
  store i64 %t817, ptr @"scheme.base:list-head"
  ret i64 %t817
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t834 = call i64 @rt_alloc_words(i64 1)
  %t835 = inttoptr i64 %t834 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_184" to i64), ptr %t835
  %t836 = or i64 %t834, 4
  %t837 = call i64 @rt_root(i64 %t836)
  store i64 %t837, ptr @"scheme.base:make-list"
  ret i64 %t837
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t873 = call i64 @rt_alloc_words(i64 1)
  %t874 = inttoptr i64 %t873 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_194" to i64), ptr %t874
  %t875 = or i64 %t873, 4
  %t876 = call i64 @rt_root(i64 %t875)
  store i64 %t876, ptr @"scheme.base:iota"
  ret i64 %t876
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t880 = call i64 @rt_alloc_words(i64 1)
  %t881 = inttoptr i64 %t880 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_204" to i64), ptr %t881
  %t882 = or i64 %t880, 4
  %t883 = call i64 @rt_root(i64 %t882)
  store i64 %t883, ptr @"scheme.base:max"
  ret i64 %t883
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t886 = call i64 @rt_alloc_words(i64 1)
  %t887 = inttoptr i64 %t886 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_206" to i64), ptr %t887
  %t888 = or i64 %t886, 4
  %t889 = call i64 @rt_root(i64 %t888)
  store i64 %t889, ptr @"scheme.base:void"
  ret i64 %t889
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t903 = call i64 @rt_alloc_words(i64 1)
  %t904 = inttoptr i64 %t903 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_209" to i64), ptr %t904
  %t905 = or i64 %t903, 4
  %t906 = call i64 @rt_root(i64 %t905)
  store i64 %t906, ptr @"scheme.base:string"
  ret i64 %t906
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t920 = call i64 @rt_alloc_words(i64 1)
  %t921 = inttoptr i64 %t920 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_212" to i64), ptr %t921
  %t922 = or i64 %t920, 4
  %t923 = call i64 @rt_root(i64 %t922)
  store i64 %t923, ptr @"scheme.base:%str-concat"
  ret i64 %t923
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t943 = call i64 @rt_alloc_words(i64 1)
  %t944 = inttoptr i64 %t943 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_218" to i64), ptr %t944
  %t945 = or i64 %t943, 4
  %t946 = call i64 @rt_root(i64 %t945)
  store i64 %t946, ptr @"scheme.base:chr-cmp"
  ret i64 %t946
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t970 = call i64 @rt_alloc_words(i64 1)
  %t971 = inttoptr i64 %t970 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_229" to i64), ptr %t971
  %t972 = or i64 %t970, 4
  %t973 = call i64 @rt_root(i64 %t972)
  store i64 %t973, ptr @"scheme.base:char=?"
  ret i64 %t973
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t997 = call i64 @rt_alloc_words(i64 1)
  %t998 = inttoptr i64 %t997 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_242" to i64), ptr %t998
  %t999 = or i64 %t997, 4
  %t1000 = call i64 @rt_root(i64 %t999)
  store i64 %t1000, ptr @"scheme.base:char<?"
  ret i64 %t1000
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1024 = call i64 @rt_alloc_words(i64 1)
  %t1025 = inttoptr i64 %t1024 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_255" to i64), ptr %t1025
  %t1026 = or i64 %t1024, 4
  %t1027 = call i64 @rt_root(i64 %t1026)
  store i64 %t1027, ptr @"scheme.base:char>?"
  ret i64 %t1027
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1053 = call i64 @rt_alloc_words(i64 1)
  %t1054 = inttoptr i64 %t1053 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_268" to i64), ptr %t1054
  %t1055 = or i64 %t1053, 4
  %t1056 = call i64 @rt_root(i64 %t1055)
  store i64 %t1056, ptr @"scheme.base:char<=?"
  ret i64 %t1056
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1082 = call i64 @rt_alloc_words(i64 1)
  %t1083 = inttoptr i64 %t1082 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_281" to i64), ptr %t1083
  %t1084 = or i64 %t1082, 4
  %t1085 = call i64 @rt_root(i64 %t1084)
  store i64 %t1085, ptr @"scheme.base:char>=?"
  ret i64 %t1085
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1118 = call i64 @rt_alloc_words(i64 1)
  %t1119 = inttoptr i64 %t1118 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_293" to i64), ptr %t1119
  %t1120 = or i64 %t1118, 4
  %t1121 = call i64 @rt_root(i64 %t1120)
  store i64 %t1121, ptr @"scheme.base:string->list"
  ret i64 %t1121
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1138 = call i64 @rt_alloc_words(i64 1)
  %t1139 = inttoptr i64 %t1138 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_305" to i64), ptr %t1139
  %t1140 = or i64 %t1138, 4
  %t1141 = call i64 @rt_root(i64 %t1140)
  store i64 %t1141, ptr @"scheme.base:ns-digits"
  ret i64 %t1141
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1164 = call i64 @rt_alloc_words(i64 1)
  %t1165 = inttoptr i64 %t1164 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_316" to i64), ptr %t1165
  %t1166 = or i64 %t1164, 4
  %t1167 = call i64 @rt_root(i64 %t1166)
  store i64 %t1167, ptr @"scheme.base:number->string"
  ret i64 %t1167
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1190 = call i64 @rt_alloc_words(i64 1)
  %t1191 = inttoptr i64 %t1190 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_320" to i64), ptr %t1191
  %t1192 = or i64 %t1190, 4
  %t1193 = call i64 @rt_root(i64 %t1192)
  store i64 %t1193, ptr @"scheme.base:error"
  ret i64 %t1193
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1196 = call i64 @rt_alloc_words(i64 1)
  %t1197 = inttoptr i64 %t1196 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_323" to i64), ptr %t1197
  %t1198 = or i64 %t1196, 4
  %t1199 = call i64 @rt_root(i64 %t1198)
  store i64 %t1199, ptr @"scheme.base:raise"
  ret i64 %t1199
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1202 = call i64 @rt_alloc_words(i64 1)
  %t1203 = inttoptr i64 %t1202 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_326" to i64), ptr %t1203
  %t1204 = or i64 %t1202, 4
  %t1205 = call i64 @rt_root(i64 %t1204)
  store i64 %t1205, ptr @"scheme.base:error-object?"
  ret i64 %t1205
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1208 = call i64 @rt_alloc_words(i64 1)
  %t1209 = inttoptr i64 %t1208 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_329" to i64), ptr %t1209
  %t1210 = or i64 %t1208, 4
  %t1211 = call i64 @rt_root(i64 %t1210)
  store i64 %t1211, ptr @"scheme.base:error-object-message"
  ret i64 %t1211
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1214 = call i64 @rt_alloc_words(i64 1)
  %t1215 = inttoptr i64 %t1214 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_332" to i64), ptr %t1215
  %t1216 = or i64 %t1214, 4
  %t1217 = call i64 @rt_root(i64 %t1216)
  store i64 %t1217, ptr @"scheme.base:error-object-irritants"
  ret i64 %t1217
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1260 = call i64 @rt_alloc_words(i64 1)
  %t1261 = inttoptr i64 %t1260 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1261
  %t1262 = or i64 %t1260, 4
  %t1263 = call i64 @rt_root(i64 %t1262)
  store i64 %t1263, ptr @"scheme.base:list->vector"
  ret i64 %t1263
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1282 = call i64 @rt_alloc_words(i64 1)
  %t1283 = inttoptr i64 %t1282 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_344" to i64), ptr %t1283
  %t1284 = or i64 %t1282, 4
  %t1285 = call i64 @rt_root(i64 %t1284)
  store i64 %t1285, ptr @"scheme.base:vector"
  ret i64 %t1285
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1328 = call i64 @rt_alloc_words(i64 1)
  %t1329 = inttoptr i64 %t1328 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_351" to i64), ptr %t1329
  %t1330 = or i64 %t1328, 4
  %t1331 = call i64 @rt_root(i64 %t1330)
  store i64 %t1331, ptr @"scheme.base:list->bytevector"
  ret i64 %t1331
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1350 = call i64 @rt_alloc_words(i64 1)
  %t1351 = inttoptr i64 %t1350 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_356" to i64), ptr %t1351
  %t1352 = or i64 %t1350, 4
  %t1353 = call i64 @rt_root(i64 %t1352)
  store i64 %t1353, ptr @"scheme.base:bytevector"
  ret i64 %t1353
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1363 = call i64 @rt_alloc_words(i64 1)
  %t1364 = inttoptr i64 %t1363 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_382" to i64), ptr %t1364
  %t1365 = or i64 %t1363, 4
  %t1366 = call i64 @rt_root(i64 %t1365)
  store i64 %t1366, ptr @"scheme.base:rd-ws?"
  ret i64 %t1366
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1372 = call i64 @rt_alloc_words(i64 1)
  %t1373 = inttoptr i64 %t1372 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_394" to i64), ptr %t1373
  %t1374 = or i64 %t1372, 4
  %t1375 = call i64 @rt_root(i64 %t1374)
  store i64 %t1375, ptr @"scheme.base:rd-digit?"
  ret i64 %t1375
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1396 = call i64 @rt_alloc_words(i64 1)
  %t1397 = inttoptr i64 %t1396 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_434" to i64), ptr %t1397
  %t1398 = or i64 %t1396, 4
  %t1399 = call i64 @rt_root(i64 %t1398)
  store i64 %t1399, ptr @"scheme.base:rd-delim?"
  ret i64 %t1399
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1415 = call i64 @rt_alloc_words(i64 1)
  %t1416 = inttoptr i64 %t1415 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_447" to i64), ptr %t1416
  %t1417 = or i64 %t1415, 4
  %t1418 = call i64 @rt_root(i64 %t1417)
  store i64 %t1418, ptr @"scheme.base:rd-skip-line"
  ret i64 %t1418
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1453 = call i64 @rt_alloc_words(i64 1)
  %t1454 = inttoptr i64 %t1453 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_461" to i64), ptr %t1454
  %t1455 = or i64 %t1453, 4
  %t1456 = call i64 @rt_root(i64 %t1455)
  store i64 %t1456, ptr @"scheme.base:rd-skip-ws"
  ret i64 %t1456
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1475 = call i64 @rt_alloc_words(i64 1)
  %t1476 = inttoptr i64 %t1475 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_470" to i64), ptr %t1476
  %t1477 = or i64 %t1475, 4
  %t1478 = call i64 @rt_root(i64 %t1477)
  store i64 %t1478, ptr @"scheme.base:rd-token-end"
  ret i64 %t1478
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1497 = call i64 @rt_alloc_words(i64 1)
  %t1498 = inttoptr i64 %t1497 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_479" to i64), ptr %t1498
  %t1499 = or i64 %t1497, 4
  %t1500 = call i64 @rt_root(i64 %t1499)
  store i64 %t1500, ptr @"scheme.base:rd-all-digits?"
  ret i64 %t1500
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1534 = call i64 @rt_alloc_words(i64 1)
  %t1535 = inttoptr i64 %t1534 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_502" to i64), ptr %t1535
  %t1536 = or i64 %t1534, 4
  %t1537 = call i64 @rt_root(i64 %t1536)
  store i64 %t1537, ptr @"scheme.base:rd-numeric?"
  ret i64 %t1537
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1553 = call i64 @rt_alloc_words(i64 1)
  %t1554 = inttoptr i64 %t1553 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_512" to i64), ptr %t1554
  %t1555 = or i64 %t1553, 4
  %t1556 = call i64 @rt_root(i64 %t1555)
  store i64 %t1556, ptr @"scheme.base:rd-digits"
  ret i64 %t1556
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1584 = call i64 @rt_alloc_words(i64 1)
  %t1585 = inttoptr i64 %t1584 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_525" to i64), ptr %t1585
  %t1586 = or i64 %t1584, 4
  %t1587 = call i64 @rt_root(i64 %t1586)
  store i64 %t1587, ptr @"scheme.base:rd-parse-int"
  ret i64 %t1587
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1612 = call i64 @rt_alloc_words(i64 1)
  %t1613 = inttoptr i64 %t1612 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_532" to i64), ptr %t1613
  %t1614 = or i64 %t1612, 4
  %t1615 = call i64 @rt_root(i64 %t1614)
  store i64 %t1615, ptr @"scheme.base:rd-atom"
  ret i64 %t1615
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1636 = call i64 @rt_alloc_words(i64 1)
  %t1637 = inttoptr i64 %t1636 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_560" to i64), ptr %t1637
  %t1638 = or i64 %t1636, 4
  %t1639 = call i64 @rt_root(i64 %t1638)
  store i64 %t1639, ptr @"scheme.base:rd-hex-digit"
  ret i64 %t1639
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1666 = call i64 @rt_alloc_words(i64 1)
  %t1667 = inttoptr i64 %t1666 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_574" to i64), ptr %t1667
  %t1668 = or i64 %t1666, 4
  %t1669 = call i64 @rt_root(i64 %t1668)
  store i64 %t1669, ptr @"scheme.base:rd-hex"
  ret i64 %t1669
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1681 = call i64 @rt_alloc_words(i64 1)
  %t1682 = inttoptr i64 %t1681 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_590" to i64), ptr %t1682
  %t1683 = or i64 %t1681, 4
  %t1684 = call i64 @rt_root(i64 %t1683)
  store i64 %t1684, ptr @"scheme.base:rd-str-esc"
  ret i64 %t1684
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1796 = call i64 @rt_alloc_words(i64 1)
  %t1797 = inttoptr i64 %t1796 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_618" to i64), ptr %t1797
  %t1798 = or i64 %t1796, 4
  %t1799 = call i64 @rt_root(i64 %t1798)
  store i64 %t1799, ptr @"scheme.base:rd-string"
  ret i64 %t1799
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1880 = call i64 @rt_alloc_words(i64 1)
  %t1881 = inttoptr i64 %t1880 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_661" to i64), ptr %t1881
  %t1882 = or i64 %t1880, 4
  %t1883 = call i64 @rt_root(i64 %t1882)
  store i64 %t1883, ptr @"scheme.base:rd-hash"
  ret i64 %t1883
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1922 = call i64 @rt_alloc_words(i64 1)
  %t1923 = inttoptr i64 %t1922 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_664" to i64), ptr %t1923
  %t1924 = or i64 %t1922, 4
  %t1925 = call i64 @rt_root(i64 %t1924)
  store i64 %t1925, ptr @"scheme.base:rd-char-name"
  ret i64 %t1925
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1948 = call i64 @rt_alloc_words(i64 1)
  %t1949 = inttoptr i64 %t1948 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_676" to i64), ptr %t1949
  %t1950 = or i64 %t1948, 4
  %t1951 = call i64 @rt_root(i64 %t1950)
  store i64 %t1951, ptr @"scheme.base:rd-char"
  ret i64 %t1951
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1975 = call i64 @rt_alloc_words(i64 1)
  %t1976 = inttoptr i64 %t1975 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_683" to i64), ptr %t1976
  %t1977 = or i64 %t1975, 4
  %t1978 = call i64 @rt_root(i64 %t1977)
  store i64 %t1978, ptr @"scheme.base:rd-quote"
  ret i64 %t1978
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t2002 = call i64 @rt_alloc_words(i64 1)
  %t2003 = inttoptr i64 %t2002 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t2003
  %t2004 = or i64 %t2002, 4
  %t2005 = call i64 @rt_root(i64 %t2004)
  store i64 %t2005, ptr @"scheme.base:rd-quasi"
  ret i64 %t2005
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t2059 = call i64 @rt_alloc_words(i64 1)
  %t2060 = inttoptr i64 %t2059 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_707" to i64), ptr %t2060
  %t2061 = or i64 %t2059, 4
  %t2062 = call i64 @rt_root(i64 %t2061)
  store i64 %t2062, ptr @"scheme.base:rd-unquote"
  ret i64 %t2062
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2077 = call i64 @rt_alloc_words(i64 1)
  %t2078 = inttoptr i64 %t2077 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_720" to i64), ptr %t2078
  %t2079 = or i64 %t2077, 4
  %t2080 = call i64 @rt_root(i64 %t2079)
  store i64 %t2080, ptr @"scheme.base:rd-dot?"
  ret i64 %t2080
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2093 = call i64 @rt_alloc_words(i64 1)
  %t2094 = inttoptr i64 %t2093 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_724" to i64), ptr %t2094
  %t2095 = or i64 %t2093, 4
  %t2096 = call i64 @rt_root(i64 %t2095)
  store i64 %t2096, ptr @"scheme.base:rd-append-reverse"
  ret i64 %t2096
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2179 = call i64 @rt_alloc_words(i64 1)
  %t2180 = inttoptr i64 %t2179 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_749" to i64), ptr %t2180
  %t2181 = or i64 %t2179, 4
  %t2182 = call i64 @rt_root(i64 %t2181)
  store i64 %t2182, ptr @"scheme.base:rd-list"
  ret i64 %t2182
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2255 = call i64 @rt_alloc_words(i64 1)
  %t2256 = inttoptr i64 %t2255 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_783" to i64), ptr %t2256
  %t2257 = or i64 %t2255, 4
  %t2258 = call i64 @rt_root(i64 %t2257)
  store i64 %t2258, ptr @"scheme.base:rd-datum"
  ret i64 %t2258
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2274 = call i64 @rt_alloc_words(i64 1)
  %t2275 = inttoptr i64 %t2274 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_787" to i64), ptr %t2275
  %t2276 = or i64 %t2274, 4
  %t2277 = call i64 @rt_root(i64 %t2276)
  store i64 %t2277, ptr @"scheme.base:read-from-string"
  ret i64 %t2277
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2350 = call i64 @rt_alloc_words(i64 1)
  %t2351 = inttoptr i64 %t2350 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_799" to i64), ptr %t2351
  %t2352 = or i64 %t2350, 4
  %t2353 = call i64 @rt_root(i64 %t2352)
  store i64 %t2353, ptr @"scheme.base:read-all-from-string"
  ret i64 %t2353
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

