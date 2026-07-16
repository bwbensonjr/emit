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
declare i64 @rt_make_char(i64)
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
  ret i64 9
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
  ret i64 9
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
  ret i64 9
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
  ret i64 9
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
  ret i64 9
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
  ret i64 9
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
  %t1148 = call i64 @rt_make_char(i64 45)
  %t1149 = load i64, ptr @"scheme.base:ns-digits"
  %t1150 = and i64 %t1149, -8
  %t1151 = inttoptr i64 %t1150 to ptr
  %t1152 = load i64, ptr %t1151
  %t1153 = inttoptr i64 %t1152 to ptr
  %t1154 = call fastcc i64%t1153(i64 %t1149, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1155 = call i64 @rt_cons(i64 %t1148, i64 %t1154)
  %t1156 = call i64 @rt_list_to_string(i64 %t1155)
  ret i64 %t1156
else236:
  %t1157 = call i64 @rt_sub(i64 0, i64 %a0)
  %t1158 = load i64, ptr @"scheme.base:ns-digits"
  %t1159 = and i64 %t1158, -8
  %t1160 = inttoptr i64 %t1159 to ptr
  %t1161 = load i64, ptr %t1160
  %t1162 = inttoptr i64 %t1161 to ptr
  %t1163 = call fastcc i64%t1162(i64 %t1158, i64 2, i64 %t1157, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1164 = call i64 @rt_list_to_string(i64 %t1163)
  ret i64 %t1164
}

define fastcc i64 @"scheme.base:code_320"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1169 = icmp sge i64 %argc, 1
  br i1 %t1169, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok238:
  %t1170 = call i64 @rt_alloc_words(i64 8)
  %t1171 = inttoptr i64 %t1170 to ptr
  %t1172 = getelementptr i64, ptr %t1171, i64 0
  store i64 %a0, ptr %t1172
  %t1173 = getelementptr i64, ptr %t1171, i64 1
  store i64 %a1, ptr %t1173
  %t1174 = getelementptr i64, ptr %t1171, i64 2
  store i64 %a2, ptr %t1174
  %t1175 = getelementptr i64, ptr %t1171, i64 3
  store i64 %a3, ptr %t1175
  %t1176 = getelementptr i64, ptr %t1171, i64 4
  store i64 %a4, ptr %t1176
  %t1177 = getelementptr i64, ptr %t1171, i64 5
  store i64 %a5, ptr %t1177
  %t1178 = getelementptr i64, ptr %t1171, i64 6
  store i64 %a6, ptr %t1178
  %t1179 = getelementptr i64, ptr %t1171, i64 7
  store i64 %a7, ptr %t1179
  %t1180 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1171, ptr %overflow)
  %t1181 = call i64 @rt_string_p(i64 %a0)
  %t1182 = icmp ne i64 %t1181, 1
  br i1 %t1182, label %then239, label %else240
then239:
  %t1183 = call i64 @rt_error(i64 %a0, i64 %t1180)
  ret i64 %t1183
else240:
  %t1184 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1185 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1186 = call i64 @rt_car(i64 %t1180)
  %t1187 = call i64 @rt_string_append(i64 %t1185, i64 %t1186)
  %t1188 = call i64 @rt_string_append(i64 %t1184, i64 %t1187)
  %t1189 = call i64 @rt_cdr(i64 %t1180)
  %t1190 = call i64 @rt_error(i64 %t1188, i64 %t1189)
  ret i64 %t1190
}

define fastcc i64 @"scheme.base:code_323"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1195 = icmp eq i64 %argc, 1
  br i1 %t1195, label %argok242, label %arityerr241
arityerr241:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok242:
  %t1196 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1196
}

define fastcc i64 @"scheme.base:code_326"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1201 = icmp eq i64 %argc, 1
  br i1 %t1201, label %argok244, label %arityerr243
arityerr243:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok244:
  %t1202 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1202
}

define fastcc i64 @"scheme.base:code_329"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1207 = icmp eq i64 %argc, 1
  br i1 %t1207, label %argok246, label %arityerr245
arityerr245:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok246:
  %t1208 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1208
}

define fastcc i64 @"scheme.base:code_332"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1213 = icmp eq i64 %argc, 1
  br i1 %t1213, label %argok248, label %arityerr247
arityerr247:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok248:
  %t1214 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1214
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1219 = icmp eq i64 %argc, 2
  br i1 %t1219, label %argok250, label %arityerr249
arityerr249:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok250:
  %t1220 = call i64 @rt_null_p(i64 %a0)
  %t1221 = icmp ne i64 %t1220, 1
  br i1 %t1221, label %then251, label %else252
then251:
  %t1222 = and i64 %self, -8
  %t1223 = inttoptr i64 %t1222 to ptr
  %t1224 = getelementptr i64, ptr %t1223, i64 1
  %t1225 = load i64, ptr %t1224
  ret i64 %t1225
else252:
  %t1226 = and i64 %self, -8
  %t1227 = inttoptr i64 %t1226 to ptr
  %t1228 = getelementptr i64, ptr %t1227, i64 1
  %t1229 = load i64, ptr %t1228
  %t1230 = call i64 @rt_car(i64 %a0)
  %t1231 = call i64 @rt_vector_set(i64 %t1229, i64 %a1, i64 %t1230)
  %t1232 = call i64 @rt_cdr(i64 %a0)
  %t1233 = call i64 @rt_add(i64 %a1, i64 8)
  %t1234 = and i64 %self, -8
  %t1235 = inttoptr i64 %t1234 to ptr
  %t1236 = getelementptr i64, ptr %t1235, i64 2
  %t1237 = load i64, ptr %t1236
  %t1238 = and i64 %t1237, -8
  %t1239 = inttoptr i64 %t1238 to ptr
  %t1240 = load i64, ptr %t1239
  %t1241 = inttoptr i64 %t1240 to ptr
  %t1242 = musttail call fastcc i64 %t1241(i64 %t1237, i64 2, i64 %t1232, i64 %t1233, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1242
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1243 = icmp eq i64 %argc, 1
  br i1 %t1243, label %argok254, label %arityerr253
arityerr253:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok254:
  %t1244 = load i64, ptr @"scheme.base:length"
  %t1245 = and i64 %t1244, -8
  %t1246 = inttoptr i64 %t1245 to ptr
  %t1247 = load i64, ptr %t1246
  %t1248 = inttoptr i64 %t1247 to ptr
  %t1249 = call fastcc i64%t1248(i64 %t1244, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1250 = call i64 @rt_make_vector(i64 %t1249, i64 0)
  %t1251 = call i64 @rt_alloc_words(i64 3)
  %t1252 = inttoptr i64 %t1251 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1252
  %t1253 = or i64 %t1251, 4
  %t1254 = getelementptr i64, ptr %t1252, i64 1
  store i64 %t1250, ptr %t1254
  %t1255 = getelementptr i64, ptr %t1252, i64 2
  store i64 %t1253, ptr %t1255
  %t1256 = and i64 %t1253, -8
  %t1257 = inttoptr i64 %t1256 to ptr
  %t1258 = load i64, ptr %t1257
  %t1259 = inttoptr i64 %t1258 to ptr
  %t1260 = musttail call fastcc i64 %t1259(i64 %t1253, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1260
}

define fastcc i64 @"scheme.base:code_344"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1265 = icmp sge i64 %argc, 0
  br i1 %t1265, label %argok256, label %arityerr255
arityerr255:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok256:
  %t1266 = call i64 @rt_alloc_words(i64 8)
  %t1267 = inttoptr i64 %t1266 to ptr
  %t1268 = getelementptr i64, ptr %t1267, i64 0
  store i64 %a0, ptr %t1268
  %t1269 = getelementptr i64, ptr %t1267, i64 1
  store i64 %a1, ptr %t1269
  %t1270 = getelementptr i64, ptr %t1267, i64 2
  store i64 %a2, ptr %t1270
  %t1271 = getelementptr i64, ptr %t1267, i64 3
  store i64 %a3, ptr %t1271
  %t1272 = getelementptr i64, ptr %t1267, i64 4
  store i64 %a4, ptr %t1272
  %t1273 = getelementptr i64, ptr %t1267, i64 5
  store i64 %a5, ptr %t1273
  %t1274 = getelementptr i64, ptr %t1267, i64 6
  store i64 %a6, ptr %t1274
  %t1275 = getelementptr i64, ptr %t1267, i64 7
  store i64 %a7, ptr %t1275
  %t1276 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1267, ptr %overflow)
  %t1277 = load i64, ptr @"scheme.base:list->vector"
  %t1278 = and i64 %t1277, -8
  %t1279 = inttoptr i64 %t1278 to ptr
  %t1280 = load i64, ptr %t1279
  %t1281 = inttoptr i64 %t1280 to ptr
  %t1282 = musttail call fastcc i64 %t1281(i64 %t1277, i64 1, i64 %t1276, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1282
}

define fastcc i64 @"scheme.base:code_370"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1287 = icmp eq i64 %argc, 1
  br i1 %t1287, label %argok258, label %arityerr257
arityerr257:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok258:
  %t1288 = call i64 @rt_char_to_integer(i64 %a0)
  %t1289 = call i64 @rt_num_eq(i64 %t1288, i64 256)
  %t1290 = icmp ne i64 %t1289, 1
  br i1 %t1290, label %then259, label %else260
then259:
  ret i64 %t1289
else260:
  %t1291 = call i64 @rt_num_eq(i64 %t1288, i64 72)
  %t1292 = icmp ne i64 %t1291, 1
  br i1 %t1292, label %then261, label %else262
then261:
  ret i64 %t1291
else262:
  %t1293 = call i64 @rt_num_eq(i64 %t1288, i64 80)
  %t1294 = icmp ne i64 %t1293, 1
  br i1 %t1294, label %then263, label %else264
then263:
  ret i64 %t1293
else264:
  %t1295 = call i64 @rt_num_eq(i64 %t1288, i64 104)
  ret i64 %t1295
}

define fastcc i64 @"scheme.base:code_382"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1300 = icmp eq i64 %argc, 1
  br i1 %t1300, label %argok266, label %arityerr265
arityerr265:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok266:
  %t1301 = call i64 @rt_char_to_integer(i64 %a0)
  %t1302 = call i64 @rt_lt(i64 376, i64 %t1301)
  %t1303 = icmp ne i64 %t1302, 1
  br i1 %t1303, label %then267, label %else268
then267:
  %t1304 = call i64 @rt_lt(i64 %t1301, i64 464)
  ret i64 %t1304
else268:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_422"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1309 = icmp eq i64 %argc, 1
  br i1 %t1309, label %argok270, label %arityerr269
arityerr269:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok270:
  %t1310 = call i64 @rt_char_to_integer(i64 %a0)
  %t1311 = load i64, ptr @"scheme.base:rd-ws?"
  %t1312 = and i64 %t1311, -8
  %t1313 = inttoptr i64 %t1312 to ptr
  %t1314 = load i64, ptr %t1313
  %t1315 = inttoptr i64 %t1314 to ptr
  %t1316 = call fastcc i64%t1315(i64 %t1311, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1317 = icmp ne i64 %t1316, 1
  br i1 %t1317, label %then271, label %else272
then271:
  ret i64 %t1316
else272:
  %t1318 = call i64 @rt_num_eq(i64 %t1310, i64 320)
  %t1319 = icmp ne i64 %t1318, 1
  br i1 %t1319, label %then273, label %else274
then273:
  ret i64 %t1318
else274:
  %t1320 = call i64 @rt_num_eq(i64 %t1310, i64 328)
  %t1321 = icmp ne i64 %t1320, 1
  br i1 %t1321, label %then275, label %else276
then275:
  ret i64 %t1320
else276:
  %t1322 = call i64 @rt_num_eq(i64 %t1310, i64 728)
  %t1323 = icmp ne i64 %t1322, 1
  br i1 %t1323, label %then277, label %else278
then277:
  ret i64 %t1322
else278:
  %t1324 = call i64 @rt_num_eq(i64 %t1310, i64 744)
  %t1325 = icmp ne i64 %t1324, 1
  br i1 %t1325, label %then279, label %else280
then279:
  ret i64 %t1324
else280:
  %t1326 = call i64 @rt_num_eq(i64 %t1310, i64 272)
  %t1327 = icmp ne i64 %t1326, 1
  br i1 %t1327, label %then281, label %else282
then281:
  ret i64 %t1326
else282:
  %t1328 = call i64 @rt_num_eq(i64 %t1310, i64 472)
  ret i64 %t1328
}

define fastcc i64 @"scheme.base:code_435"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1333 = icmp eq i64 %argc, 3
  br i1 %t1333, label %argok284, label %arityerr283
arityerr283:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok284:
  %t1334 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1335 = icmp ne i64 %t1334, 1
  br i1 %t1335, label %then285, label %else286
then285:
  %t1336 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1337 = call i64 @rt_char_to_integer(i64 %t1336)
  %t1338 = call i64 @rt_num_eq(i64 %t1337, i64 80)
  %t1339 = icmp ne i64 %t1338, 1
  br i1 %t1339, label %then287, label %else288
then287:
  %t1340 = call i64 @rt_add(i64 %a2, i64 8)
  ret i64 %t1340
else288:
  %t1341 = call i64 @rt_add(i64 %a2, i64 8)
  %t1342 = load i64, ptr @"scheme.base:rd-skip-line"
  %t1343 = and i64 %t1342, -8
  %t1344 = inttoptr i64 %t1343 to ptr
  %t1345 = load i64, ptr %t1344
  %t1346 = inttoptr i64 %t1345 to ptr
  %t1347 = musttail call fastcc i64 %t1346(i64 %t1342, i64 3, i64 %a0, i64 %a1, i64 %t1341, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1347
else286:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_449"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1352 = icmp eq i64 %argc, 3
  br i1 %t1352, label %argok290, label %arityerr289
arityerr289:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok290:
  %t1353 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1354 = icmp ne i64 %t1353, 1
  br i1 %t1354, label %then291, label %else292
then291:
  %t1355 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1356 = load i64, ptr @"scheme.base:rd-ws?"
  %t1357 = and i64 %t1356, -8
  %t1358 = inttoptr i64 %t1357 to ptr
  %t1359 = load i64, ptr %t1358
  %t1360 = inttoptr i64 %t1359 to ptr
  %t1361 = call fastcc i64%t1360(i64 %t1356, i64 1, i64 %t1355, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1362 = icmp ne i64 %t1361, 1
  br i1 %t1362, label %then293, label %else294
then293:
  %t1363 = call i64 @rt_add(i64 %a2, i64 8)
  %t1364 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1365 = and i64 %t1364, -8
  %t1366 = inttoptr i64 %t1365 to ptr
  %t1367 = load i64, ptr %t1366
  %t1368 = inttoptr i64 %t1367 to ptr
  %t1369 = musttail call fastcc i64 %t1368(i64 %t1364, i64 3, i64 %a0, i64 %a1, i64 %t1363, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1369
else294:
  %t1370 = call i64 @rt_char_to_integer(i64 %t1355)
  %t1371 = call i64 @rt_num_eq(i64 %t1370, i64 472)
  %t1372 = icmp ne i64 %t1371, 1
  br i1 %t1372, label %then295, label %else296
then295:
  %t1373 = call i64 @rt_add(i64 %a2, i64 8)
  %t1374 = load i64, ptr @"scheme.base:rd-skip-line"
  %t1375 = and i64 %t1374, -8
  %t1376 = inttoptr i64 %t1375 to ptr
  %t1377 = load i64, ptr %t1376
  %t1378 = inttoptr i64 %t1377 to ptr
  %t1379 = call fastcc i64%t1378(i64 %t1374, i64 3, i64 %a0, i64 %a1, i64 %t1373, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1380 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1381 = and i64 %t1380, -8
  %t1382 = inttoptr i64 %t1381 to ptr
  %t1383 = load i64, ptr %t1382
  %t1384 = inttoptr i64 %t1383 to ptr
  %t1385 = musttail call fastcc i64 %t1384(i64 %t1380, i64 3, i64 %a0, i64 %a1, i64 %t1379, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1385
else296:
  ret i64 %a2
else292:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_458"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1390 = icmp eq i64 %argc, 3
  br i1 %t1390, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok298:
  %t1391 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1392 = icmp ne i64 %t1391, 1
  br i1 %t1392, label %then299, label %else300
then299:
  %t1393 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1394 = load i64, ptr @"scheme.base:rd-delim?"
  %t1395 = and i64 %t1394, -8
  %t1396 = inttoptr i64 %t1395 to ptr
  %t1397 = load i64, ptr %t1396
  %t1398 = inttoptr i64 %t1397 to ptr
  %t1399 = call fastcc i64%t1398(i64 %t1394, i64 1, i64 %t1393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1400 = icmp ne i64 %t1399, 1
  br i1 %t1400, label %then301, label %else302
then301:
  ret i64 %a2
else302:
  %t1401 = call i64 @rt_add(i64 %a2, i64 8)
  %t1402 = load i64, ptr @"scheme.base:rd-token-end"
  %t1403 = and i64 %t1402, -8
  %t1404 = inttoptr i64 %t1403 to ptr
  %t1405 = load i64, ptr %t1404
  %t1406 = inttoptr i64 %t1405 to ptr
  %t1407 = musttail call fastcc i64 %t1406(i64 %t1402, i64 3, i64 %a0, i64 %a1, i64 %t1401, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1407
else300:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_467"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1412 = icmp eq i64 %argc, 3
  br i1 %t1412, label %argok304, label %arityerr303
arityerr303:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok304:
  %t1413 = call i64 @rt_lt(i64 %a1, i64 %a2)
  %t1414 = icmp ne i64 %t1413, 1
  br i1 %t1414, label %then305, label %else306
then305:
  %t1415 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1416 = load i64, ptr @"scheme.base:rd-digit?"
  %t1417 = and i64 %t1416, -8
  %t1418 = inttoptr i64 %t1417 to ptr
  %t1419 = load i64, ptr %t1418
  %t1420 = inttoptr i64 %t1419 to ptr
  %t1421 = call fastcc i64%t1420(i64 %t1416, i64 1, i64 %t1415, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1422 = icmp ne i64 %t1421, 1
  br i1 %t1422, label %then307, label %else308
then307:
  %t1423 = call i64 @rt_add(i64 %a1, i64 8)
  %t1424 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t1425 = and i64 %t1424, -8
  %t1426 = inttoptr i64 %t1425 to ptr
  %t1427 = load i64, ptr %t1426
  %t1428 = inttoptr i64 %t1427 to ptr
  %t1429 = musttail call fastcc i64 %t1428(i64 %t1424, i64 3, i64 %a0, i64 %t1423, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1429
else308:
  ret i64 1
else306:
  ret i64 9
}

define fastcc i64 @"scheme.base:code_490"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1434 = icmp eq i64 %argc, 1
  br i1 %t1434, label %argok310, label %arityerr309
arityerr309:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok310:
  %t1435 = call i64 @rt_string_length(i64 %a0)
  %t1436 = call i64 @rt_lt(i64 0, i64 %t1435)
  %t1437 = icmp ne i64 %t1436, 1
  br i1 %t1437, label %then311, label %else312
then311:
  %t1438 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1439 = call i64 @rt_char_to_integer(i64 %t1438)
  %t1440 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1441 = load i64, ptr @"scheme.base:rd-digit?"
  %t1442 = and i64 %t1441, -8
  %t1443 = inttoptr i64 %t1442 to ptr
  %t1444 = load i64, ptr %t1443
  %t1445 = inttoptr i64 %t1444 to ptr
  %t1446 = call fastcc i64%t1445(i64 %t1441, i64 1, i64 %t1440, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1447 = icmp ne i64 %t1446, 1
  br i1 %t1447, label %then313, label %else314
then313:
  %t1448 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t1449 = and i64 %t1448, -8
  %t1450 = inttoptr i64 %t1449 to ptr
  %t1451 = load i64, ptr %t1450
  %t1452 = inttoptr i64 %t1451 to ptr
  %t1453 = musttail call fastcc i64 %t1452(i64 %t1448, i64 3, i64 %a0, i64 0, i64 %t1435, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1453
else314:
  %t1454 = call i64 @rt_num_eq(i64 %t1439, i64 360)
  %t1455 = icmp ne i64 %t1454, 1
  br i1 %t1455, label %then315, label %else316
then315:
  br label %merge317
else316:
  %t1456 = call i64 @rt_num_eq(i64 %t1439, i64 344)
  br label %merge317
merge317:
  %t1457 = phi i64 [ %t1454, %then315 ], [ %t1456, %else316 ]
  %t1458 = icmp ne i64 %t1457, 1
  br i1 %t1458, label %then318, label %else319
then318:
  %t1459 = call i64 @rt_lt(i64 8, i64 %t1435)
  %t1460 = icmp ne i64 %t1459, 1
  br i1 %t1460, label %then320, label %else321
then320:
  %t1461 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t1462 = and i64 %t1461, -8
  %t1463 = inttoptr i64 %t1462 to ptr
  %t1464 = load i64, ptr %t1463
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = musttail call fastcc i64 %t1465(i64 %t1461, i64 3, i64 %a0, i64 8, i64 %t1435, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1466
else321:
  ret i64 1
else319:
  ret i64 1
else312:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_500"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1471 = icmp eq i64 %argc, 4
  br i1 %t1471, label %argok323, label %arityerr322
arityerr322:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok323:
  %t1472 = call i64 @rt_lt(i64 %a1, i64 %a2)
  %t1473 = icmp ne i64 %t1472, 1
  br i1 %t1473, label %then324, label %else325
then324:
  %t1474 = call i64 @rt_add(i64 %a1, i64 8)
  %t1475 = call i64 @rt_mul(i64 %a3, i64 80)
  %t1476 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t1477 = call i64 @rt_char_to_integer(i64 %t1476)
  %t1478 = call i64 @rt_sub(i64 %t1477, i64 384)
  %t1479 = call i64 @rt_add(i64 %t1475, i64 %t1478)
  %t1480 = load i64, ptr @"scheme.base:rd-digits"
  %t1481 = and i64 %t1480, -8
  %t1482 = inttoptr i64 %t1481 to ptr
  %t1483 = load i64, ptr %t1482
  %t1484 = inttoptr i64 %t1483 to ptr
  %t1485 = musttail call fastcc i64 %t1484(i64 %t1480, i64 4, i64 %a0, i64 %t1474, i64 %a2, i64 %t1479, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1485
else325:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code_513"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1490 = icmp eq i64 %argc, 1
  br i1 %t1490, label %argok327, label %arityerr326
arityerr326:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok327:
  %t1491 = call i64 @rt_string_length(i64 %a0)
  %t1492 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t1493 = call i64 @rt_char_to_integer(i64 %t1492)
  %t1494 = call i64 @rt_num_eq(i64 %t1493, i64 360)
  %t1495 = icmp ne i64 %t1494, 1
  br i1 %t1495, label %then328, label %else329
then328:
  %t1496 = load i64, ptr @"scheme.base:rd-digits"
  %t1497 = and i64 %t1496, -8
  %t1498 = inttoptr i64 %t1497 to ptr
  %t1499 = load i64, ptr %t1498
  %t1500 = inttoptr i64 %t1499 to ptr
  %t1501 = call fastcc i64%t1500(i64 %t1496, i64 4, i64 %a0, i64 8, i64 %t1491, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1502 = call i64 @rt_sub(i64 0, i64 %t1501)
  ret i64 %t1502
else329:
  %t1503 = call i64 @rt_num_eq(i64 %t1493, i64 344)
  %t1504 = icmp ne i64 %t1503, 1
  br i1 %t1504, label %then330, label %else331
then330:
  %t1505 = load i64, ptr @"scheme.base:rd-digits"
  %t1506 = and i64 %t1505, -8
  %t1507 = inttoptr i64 %t1506 to ptr
  %t1508 = load i64, ptr %t1507
  %t1509 = inttoptr i64 %t1508 to ptr
  %t1510 = musttail call fastcc i64 %t1509(i64 %t1505, i64 4, i64 %a0, i64 8, i64 %t1491, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1510
else331:
  %t1511 = load i64, ptr @"scheme.base:rd-digits"
  %t1512 = and i64 %t1511, -8
  %t1513 = inttoptr i64 %t1512 to ptr
  %t1514 = load i64, ptr %t1513
  %t1515 = inttoptr i64 %t1514 to ptr
  %t1516 = musttail call fastcc i64 %t1515(i64 %t1511, i64 4, i64 %a0, i64 0, i64 %t1491, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1516
}

define fastcc i64 @"scheme.base:code_520"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1521 = icmp eq i64 %argc, 3
  br i1 %t1521, label %argok333, label %arityerr332
arityerr332:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok333:
  %t1522 = load i64, ptr @"scheme.base:rd-token-end"
  %t1523 = and i64 %t1522, -8
  %t1524 = inttoptr i64 %t1523 to ptr
  %t1525 = load i64, ptr %t1524
  %t1526 = inttoptr i64 %t1525 to ptr
  %t1527 = call fastcc i64%t1526(i64 %t1522, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1528 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t1527)
  %t1529 = load i64, ptr @"scheme.base:rd-numeric?"
  %t1530 = and i64 %t1529, -8
  %t1531 = inttoptr i64 %t1530 to ptr
  %t1532 = load i64, ptr %t1531
  %t1533 = inttoptr i64 %t1532 to ptr
  %t1534 = call fastcc i64%t1533(i64 %t1529, i64 1, i64 %t1528, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1535 = icmp ne i64 %t1534, 1
  br i1 %t1535, label %then334, label %else335
then334:
  %t1536 = load i64, ptr @"scheme.base:rd-parse-int"
  %t1537 = and i64 %t1536, -8
  %t1538 = inttoptr i64 %t1537 to ptr
  %t1539 = load i64, ptr %t1538
  %t1540 = inttoptr i64 %t1539 to ptr
  %t1541 = call fastcc i64%t1540(i64 %t1536, i64 1, i64 %t1528, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge336
else335:
  %t1542 = call i64 @rt_string_to_symbol(i64 %t1528)
  br label %merge336
merge336:
  %t1543 = phi i64 [ %t1541, %then334 ], [ %t1542, %else335 ]
  %t1544 = call i64 @rt_cons(i64 %t1543, i64 %t1527)
  ret i64 %t1544
}

define fastcc i64 @"scheme.base:code_548"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1549 = icmp eq i64 %argc, 1
  br i1 %t1549, label %argok338, label %arityerr337
arityerr337:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok338:
  %t1550 = call i64 @rt_char_to_integer(i64 %a0)
  %t1551 = call i64 @rt_lt(i64 376, i64 %t1550)
  %t1552 = icmp ne i64 %t1551, 1
  br i1 %t1552, label %then339, label %else340
then339:
  %t1553 = call i64 @rt_lt(i64 %t1550, i64 464)
  br label %merge341
else340:
  br label %merge341
merge341:
  %t1554 = phi i64 [ %t1553, %then339 ], [ 1, %else340 ]
  %t1555 = icmp ne i64 %t1554, 1
  br i1 %t1555, label %then342, label %else343
then342:
  %t1556 = call i64 @rt_sub(i64 %t1550, i64 384)
  ret i64 %t1556
else343:
  %t1557 = call i64 @rt_lt(i64 768, i64 %t1550)
  %t1558 = icmp ne i64 %t1557, 1
  br i1 %t1558, label %then344, label %else345
then344:
  %t1559 = call i64 @rt_lt(i64 %t1550, i64 824)
  br label %merge346
else345:
  br label %merge346
merge346:
  %t1560 = phi i64 [ %t1559, %then344 ], [ 1, %else345 ]
  %t1561 = icmp ne i64 %t1560, 1
  br i1 %t1561, label %then347, label %else348
then347:
  %t1562 = call i64 @rt_sub(i64 %t1550, i64 696)
  ret i64 %t1562
else348:
  %t1563 = call i64 @rt_lt(i64 512, i64 %t1550)
  %t1564 = icmp ne i64 %t1563, 1
  br i1 %t1564, label %then349, label %else350
then349:
  %t1565 = call i64 @rt_lt(i64 %t1550, i64 568)
  br label %merge351
else350:
  br label %merge351
merge351:
  %t1566 = phi i64 [ %t1565, %then349 ], [ 1, %else350 ]
  %t1567 = icmp ne i64 %t1566, 1
  br i1 %t1567, label %then352, label %else353
then352:
  %t1568 = call i64 @rt_sub(i64 %t1550, i64 440)
  ret i64 %t1568
else353:
  ret i64 0
}

define fastcc i64 @"scheme.base:code_562"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1573 = icmp eq i64 %argc, 4
  br i1 %t1573, label %argok355, label %arityerr354
arityerr354:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok355:
  %t1574 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1575 = icmp ne i64 %t1574, 1
  br i1 %t1575, label %then356, label %else357
then356:
  %t1576 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1577 = call i64 @rt_char_to_integer(i64 %t1576)
  %t1578 = call i64 @rt_num_eq(i64 %t1577, i64 472)
  %t1579 = icmp ne i64 %t1578, 1
  br i1 %t1579, label %then358, label %else359
then358:
  %t1580 = call i64 @rt_add(i64 %a2, i64 8)
  %t1581 = call i64 @rt_cons(i64 %a3, i64 %t1580)
  ret i64 %t1581
else359:
  %t1582 = call i64 @rt_add(i64 %a2, i64 8)
  %t1583 = call i64 @rt_mul(i64 %a3, i64 128)
  %t1584 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1585 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t1586 = and i64 %t1585, -8
  %t1587 = inttoptr i64 %t1586 to ptr
  %t1588 = load i64, ptr %t1587
  %t1589 = inttoptr i64 %t1588 to ptr
  %t1590 = call fastcc i64%t1589(i64 %t1585, i64 1, i64 %t1584, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1591 = call i64 @rt_add(i64 %t1583, i64 %t1590)
  %t1592 = load i64, ptr @"scheme.base:rd-hex"
  %t1593 = and i64 %t1592, -8
  %t1594 = inttoptr i64 %t1593 to ptr
  %t1595 = load i64, ptr %t1594
  %t1596 = inttoptr i64 %t1595 to ptr
  %t1597 = musttail call fastcc i64 %t1596(i64 %t1592, i64 4, i64 %a0, i64 %a1, i64 %t1582, i64 %t1591, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1597
else357:
  %t1598 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t1598
}

define fastcc i64 @"scheme.base:code_578"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1603 = icmp eq i64 %argc, 1
  br i1 %t1603, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok361:
  %t1604 = call i64 @rt_char_to_integer(i64 %a0)
  %t1605 = call i64 @rt_num_eq(i64 %t1604, i64 880)
  %t1606 = icmp ne i64 %t1605, 1
  br i1 %t1606, label %then362, label %else363
then362:
  %t1607 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t1607
else363:
  %t1608 = call i64 @rt_num_eq(i64 %t1604, i64 928)
  %t1609 = icmp ne i64 %t1608, 1
  br i1 %t1609, label %then364, label %else365
then364:
  %t1610 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t1610
else365:
  %t1611 = call i64 @rt_num_eq(i64 %t1604, i64 912)
  %t1612 = icmp ne i64 %t1611, 1
  br i1 %t1612, label %then366, label %else367
then366:
  %t1613 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t1613
else367:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_608"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1618 = icmp eq i64 %argc, 2
  br i1 %t1618, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok369:
  %t1619 = and i64 %self, -8
  %t1620 = inttoptr i64 %t1619 to ptr
  %t1621 = getelementptr i64, ptr %t1620, i64 1
  %t1622 = load i64, ptr %t1621
  %t1623 = call i64 @rt_lt(i64 %a0, i64 %t1622)
  %t1624 = icmp ne i64 %t1623, 1
  br i1 %t1624, label %then370, label %else371
then370:
  %t1625 = and i64 %self, -8
  %t1626 = inttoptr i64 %t1625 to ptr
  %t1627 = getelementptr i64, ptr %t1626, i64 2
  %t1628 = load i64, ptr %t1627
  %t1629 = call i64 @rt_string_ref(i64 %t1628, i64 %a0)
  %t1630 = call i64 @rt_char_to_integer(i64 %t1629)
  %t1631 = call i64 @rt_num_eq(i64 %t1630, i64 272)
  %t1632 = icmp ne i64 %t1631, 1
  br i1 %t1632, label %then372, label %else373
then372:
  %t1633 = load i64, ptr @"scheme.base:reverse"
  %t1634 = and i64 %t1633, -8
  %t1635 = inttoptr i64 %t1634 to ptr
  %t1636 = load i64, ptr %t1635
  %t1637 = inttoptr i64 %t1636 to ptr
  %t1638 = call fastcc i64%t1637(i64 %t1633, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1639 = call i64 @rt_list_to_string(i64 %t1638)
  %t1640 = call i64 @rt_add(i64 %a0, i64 8)
  %t1641 = call i64 @rt_cons(i64 %t1639, i64 %t1640)
  ret i64 %t1641
else373:
  %t1642 = call i64 @rt_num_eq(i64 %t1630, i64 736)
  %t1643 = icmp ne i64 %t1642, 1
  br i1 %t1643, label %then374, label %else375
then374:
  %t1644 = and i64 %self, -8
  %t1645 = inttoptr i64 %t1644 to ptr
  %t1646 = getelementptr i64, ptr %t1645, i64 2
  %t1647 = load i64, ptr %t1646
  %t1648 = call i64 @rt_add(i64 %a0, i64 8)
  %t1649 = call i64 @rt_string_ref(i64 %t1647, i64 %t1648)
  %t1650 = call i64 @rt_char_to_integer(i64 %t1649)
  %t1651 = call i64 @rt_num_eq(i64 %t1650, i64 960)
  %t1652 = icmp ne i64 %t1651, 1
  br i1 %t1652, label %then376, label %else377
then376:
  %t1653 = and i64 %self, -8
  %t1654 = inttoptr i64 %t1653 to ptr
  %t1655 = getelementptr i64, ptr %t1654, i64 2
  %t1656 = load i64, ptr %t1655
  %t1657 = and i64 %self, -8
  %t1658 = inttoptr i64 %t1657 to ptr
  %t1659 = getelementptr i64, ptr %t1658, i64 1
  %t1660 = load i64, ptr %t1659
  %t1661 = call i64 @rt_add(i64 %a0, i64 16)
  %t1662 = load i64, ptr @"scheme.base:rd-hex"
  %t1663 = and i64 %t1662, -8
  %t1664 = inttoptr i64 %t1663 to ptr
  %t1665 = load i64, ptr %t1664
  %t1666 = inttoptr i64 %t1665 to ptr
  %t1667 = call fastcc i64%t1666(i64 %t1662, i64 4, i64 %t1656, i64 %t1660, i64 %t1661, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1668 = call i64 @rt_cdr(i64 %t1667)
  %t1669 = call i64 @rt_car(i64 %t1667)
  %t1670 = call i64 @rt_integer_to_char(i64 %t1669)
  %t1671 = call i64 @rt_cons(i64 %t1670, i64 %a1)
  %t1672 = and i64 %self, -8
  %t1673 = inttoptr i64 %t1672 to ptr
  %t1674 = getelementptr i64, ptr %t1673, i64 3
  %t1675 = load i64, ptr %t1674
  %t1676 = and i64 %t1675, -8
  %t1677 = inttoptr i64 %t1676 to ptr
  %t1678 = load i64, ptr %t1677
  %t1679 = inttoptr i64 %t1678 to ptr
  %t1680 = musttail call fastcc i64 %t1679(i64 %t1675, i64 2, i64 %t1668, i64 %t1671, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1680
else377:
  %t1681 = call i64 @rt_add(i64 %a0, i64 16)
  %t1682 = load i64, ptr @"scheme.base:rd-str-esc"
  %t1683 = and i64 %t1682, -8
  %t1684 = inttoptr i64 %t1683 to ptr
  %t1685 = load i64, ptr %t1684
  %t1686 = inttoptr i64 %t1685 to ptr
  %t1687 = call fastcc i64%t1686(i64 %t1682, i64 1, i64 %t1649, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1688 = call i64 @rt_cons(i64 %t1687, i64 %a1)
  %t1689 = and i64 %self, -8
  %t1690 = inttoptr i64 %t1689 to ptr
  %t1691 = getelementptr i64, ptr %t1690, i64 3
  %t1692 = load i64, ptr %t1691
  %t1693 = and i64 %t1692, -8
  %t1694 = inttoptr i64 %t1693 to ptr
  %t1695 = load i64, ptr %t1694
  %t1696 = inttoptr i64 %t1695 to ptr
  %t1697 = musttail call fastcc i64 %t1696(i64 %t1692, i64 2, i64 %t1681, i64 %t1688, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1697
else375:
  %t1698 = call i64 @rt_add(i64 %a0, i64 8)
  %t1699 = call i64 @rt_cons(i64 %t1629, i64 %a1)
  %t1700 = and i64 %self, -8
  %t1701 = inttoptr i64 %t1700 to ptr
  %t1702 = getelementptr i64, ptr %t1701, i64 3
  %t1703 = load i64, ptr %t1702
  %t1704 = and i64 %t1703, -8
  %t1705 = inttoptr i64 %t1704 to ptr
  %t1706 = load i64, ptr %t1705
  %t1707 = inttoptr i64 %t1706 to ptr
  %t1708 = musttail call fastcc i64 %t1707(i64 %t1703, i64 2, i64 %t1698, i64 %t1699, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1708
else371:
  %t1709 = load i64, ptr @"scheme.base:reverse"
  %t1710 = and i64 %t1709, -8
  %t1711 = inttoptr i64 %t1710 to ptr
  %t1712 = load i64, ptr %t1711
  %t1713 = inttoptr i64 %t1712 to ptr
  %t1714 = call fastcc i64%t1713(i64 %t1709, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1715 = call i64 @rt_list_to_string(i64 %t1714)
  %t1716 = call i64 @rt_cons(i64 %t1715, i64 %a0)
  ret i64 %t1716
}

define fastcc i64 @"scheme.base:code_606"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1717 = icmp eq i64 %argc, 3
  br i1 %t1717, label %argok379, label %arityerr378
arityerr378:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok379:
  %t1718 = call i64 @rt_alloc_words(i64 4)
  %t1719 = inttoptr i64 %t1718 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_608" to i64), ptr %t1719
  %t1720 = or i64 %t1718, 4
  %t1721 = getelementptr i64, ptr %t1719, i64 1
  store i64 %a1, ptr %t1721
  %t1722 = getelementptr i64, ptr %t1719, i64 2
  store i64 %a0, ptr %t1722
  %t1723 = getelementptr i64, ptr %t1719, i64 3
  store i64 %t1720, ptr %t1723
  %t1724 = and i64 %t1720, -8
  %t1725 = inttoptr i64 %t1724 to ptr
  %t1726 = load i64, ptr %t1725
  %t1727 = inttoptr i64 %t1726 to ptr
  %t1728 = musttail call fastcc i64 %t1727(i64 %t1720, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1728
}

define fastcc i64 @"scheme.base:code_632"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1733 = icmp eq i64 %argc, 3
  br i1 %t1733, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok381:
  %t1734 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1735 = call i64 @rt_char_to_integer(i64 %t1734)
  %t1736 = call i64 @rt_num_eq(i64 %t1735, i64 928)
  %t1737 = icmp ne i64 %t1736, 1
  br i1 %t1737, label %then382, label %else383
then382:
  %t1738 = call i64 @rt_add(i64 %a2, i64 8)
  %t1739 = call i64 @rt_cons(i64 9, i64 %t1738)
  ret i64 %t1739
else383:
  %t1740 = call i64 @rt_num_eq(i64 %t1735, i64 816)
  %t1741 = icmp ne i64 %t1740, 1
  br i1 %t1741, label %then384, label %else385
then384:
  %t1742 = call i64 @rt_add(i64 %a2, i64 8)
  %t1743 = call i64 @rt_cons(i64 1, i64 %t1742)
  ret i64 %t1743
else385:
  %t1744 = call i64 @rt_num_eq(i64 %t1735, i64 736)
  %t1745 = icmp ne i64 %t1744, 1
  br i1 %t1745, label %then386, label %else387
then386:
  %t1746 = load i64, ptr @"scheme.base:rd-char"
  %t1747 = and i64 %t1746, -8
  %t1748 = inttoptr i64 %t1747 to ptr
  %t1749 = load i64, ptr %t1748
  %t1750 = inttoptr i64 %t1749 to ptr
  %t1751 = musttail call fastcc i64 %t1750(i64 %t1746, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1751
else387:
  %t1752 = call i64 @rt_num_eq(i64 %t1735, i64 320)
  %t1753 = icmp ne i64 %t1752, 1
  br i1 %t1753, label %then388, label %else389
then388:
  %t1754 = call i64 @rt_add(i64 %a2, i64 8)
  %t1755 = load i64, ptr @"scheme.base:rd-list"
  %t1756 = and i64 %t1755, -8
  %t1757 = inttoptr i64 %t1756 to ptr
  %t1758 = load i64, ptr %t1757
  %t1759 = inttoptr i64 %t1758 to ptr
  %t1760 = call fastcc i64%t1759(i64 %t1755, i64 4, i64 %a0, i64 %a1, i64 %t1754, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1761 = call i64 @rt_car(i64 %t1760)
  %t1762 = load i64, ptr @"scheme.base:list->vector"
  %t1763 = and i64 %t1762, -8
  %t1764 = inttoptr i64 %t1763 to ptr
  %t1765 = load i64, ptr %t1764
  %t1766 = inttoptr i64 %t1765 to ptr
  %t1767 = call fastcc i64%t1766(i64 %t1762, i64 1, i64 %t1761, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1768 = call i64 @rt_cdr(i64 %t1760)
  %t1769 = call i64 @rt_cons(i64 %t1767, i64 %t1768)
  ret i64 %t1769
else389:
  %t1770 = load i64, ptr @"scheme.base:rd-token-end"
  %t1771 = and i64 %t1770, -8
  %t1772 = inttoptr i64 %t1771 to ptr
  %t1773 = load i64, ptr %t1772
  %t1774 = inttoptr i64 %t1773 to ptr
  %t1775 = call fastcc i64%t1774(i64 %t1770, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1776 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t1775)
  %t1777 = call i64 @rt_string_to_symbol(i64 %t1776)
  %t1778 = call i64 @rt_cons(i64 %t1777, i64 %t1775)
  ret i64 %t1778
}

define fastcc i64 @"scheme.base:code_635"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1783 = icmp eq i64 %argc, 1
  br i1 %t1783, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok391:
  %t1784 = call i64 @rt_make_string(ptr @.str.lit.3, i64 5)
  %t1785 = call i64 @rt_string_eq(i64 %a0, i64 %t1784)
  %t1786 = icmp ne i64 %t1785, 1
  br i1 %t1786, label %then392, label %else393
then392:
  %t1787 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t1787
else393:
  %t1788 = call i64 @rt_make_string(ptr @.str.lit.4, i64 7)
  %t1789 = call i64 @rt_string_eq(i64 %a0, i64 %t1788)
  %t1790 = icmp ne i64 %t1789, 1
  br i1 %t1790, label %then394, label %else395
then394:
  %t1791 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t1791
else395:
  %t1792 = call i64 @rt_make_string(ptr @.str.lit.5, i64 3)
  %t1793 = call i64 @rt_string_eq(i64 %a0, i64 %t1792)
  %t1794 = icmp ne i64 %t1793, 1
  br i1 %t1794, label %then396, label %else397
then396:
  %t1795 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t1795
else397:
  %t1796 = call i64 @rt_make_string(ptr @.str.lit.6, i64 6)
  %t1797 = call i64 @rt_string_eq(i64 %a0, i64 %t1796)
  %t1798 = icmp ne i64 %t1797, 1
  br i1 %t1798, label %then398, label %else399
then398:
  %t1799 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t1799
else399:
  %t1800 = call i64 @rt_make_string(ptr @.str.lit.7, i64 3)
  %t1801 = call i64 @rt_string_eq(i64 %a0, i64 %t1800)
  %t1802 = icmp ne i64 %t1801, 1
  br i1 %t1802, label %then400, label %else401
then400:
  %t1803 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t1803
else401:
  %t1804 = call i64 @rt_make_string(ptr @.str.lit.8, i64 4)
  %t1805 = call i64 @rt_string_eq(i64 %a0, i64 %t1804)
  %t1806 = icmp ne i64 %t1805, 1
  br i1 %t1806, label %then402, label %else403
then402:
  %t1807 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t1807
else403:
  %t1808 = call i64 @rt_make_string(ptr @.str.lit.9, i64 6)
  %t1809 = call i64 @rt_string_eq(i64 %a0, i64 %t1808)
  %t1810 = icmp ne i64 %t1809, 1
  br i1 %t1810, label %then404, label %else405
then404:
  %t1811 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t1811
else405:
  %t1812 = call i64 @rt_make_string(ptr @.str.lit.10, i64 7)
  %t1813 = call i64 @rt_string_eq(i64 %a0, i64 %t1812)
  %t1814 = icmp ne i64 %t1813, 1
  br i1 %t1814, label %then406, label %else407
then406:
  %t1815 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t1815
else407:
  %t1816 = call i64 @rt_make_string(ptr @.str.lit.11, i64 3)
  %t1817 = call i64 @rt_string_eq(i64 %a0, i64 %t1816)
  %t1818 = icmp ne i64 %t1817, 1
  br i1 %t1818, label %then408, label %else409
then408:
  %t1819 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t1819
else409:
  %t1820 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t1820
}

define fastcc i64 @"scheme.base:code_647"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1825 = icmp eq i64 %argc, 3
  br i1 %t1825, label %argok411, label %arityerr410
arityerr410:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok411:
  %t1826 = call i64 @rt_add(i64 %a2, i64 8)
  %t1827 = call i64 @rt_add(i64 %t1826, i64 8)
  %t1828 = load i64, ptr @"scheme.base:rd-token-end"
  %t1829 = and i64 %t1828, -8
  %t1830 = inttoptr i64 %t1829 to ptr
  %t1831 = load i64, ptr %t1830
  %t1832 = inttoptr i64 %t1831 to ptr
  %t1833 = call fastcc i64%t1832(i64 %t1828, i64 3, i64 %a0, i64 %a1, i64 %t1827, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1834 = call i64 @rt_substring(i64 %a0, i64 %t1826, i64 %t1833)
  %t1835 = call i64 @rt_string_length(i64 %t1834)
  %t1836 = call i64 @rt_num_eq(i64 %t1835, i64 8)
  %t1837 = icmp ne i64 %t1836, 1
  br i1 %t1837, label %then412, label %else413
then412:
  %t1838 = call i64 @rt_string_ref(i64 %a0, i64 %t1826)
  %t1839 = call i64 @rt_cons(i64 %t1838, i64 %t1833)
  ret i64 %t1839
else413:
  %t1840 = load i64, ptr @"scheme.base:rd-char-name"
  %t1841 = and i64 %t1840, -8
  %t1842 = inttoptr i64 %t1841 to ptr
  %t1843 = load i64, ptr %t1842
  %t1844 = inttoptr i64 %t1843 to ptr
  %t1845 = call fastcc i64%t1844(i64 %t1840, i64 1, i64 %t1834, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1846 = call i64 @rt_cons(i64 %t1845, i64 %t1833)
  ret i64 %t1846
}

define fastcc i64 @"scheme.base:code_654"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1851 = icmp eq i64 %argc, 3
  br i1 %t1851, label %argok415, label %arityerr414
arityerr414:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok415:
  %t1852 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1853 = and i64 %t1852, -8
  %t1854 = inttoptr i64 %t1853 to ptr
  %t1855 = load i64, ptr %t1854
  %t1856 = inttoptr i64 %t1855 to ptr
  %t1857 = call fastcc i64%t1856(i64 %t1852, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1858 = load i64, ptr @"scheme.base:rd-datum"
  %t1859 = and i64 %t1858, -8
  %t1860 = inttoptr i64 %t1859 to ptr
  %t1861 = load i64, ptr %t1860
  %t1862 = inttoptr i64 %t1861 to ptr
  %t1863 = call fastcc i64%t1862(i64 %t1858, i64 3, i64 %a0, i64 %a1, i64 %t1857, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1864 = call i64 @rt_intern(ptr @.str.sym.12)
  %t1865 = call i64 @rt_car(i64 %t1863)
  %t1866 = load i64, ptr @"scheme.base:list"
  %t1867 = and i64 %t1866, -8
  %t1868 = inttoptr i64 %t1867 to ptr
  %t1869 = load i64, ptr %t1868
  %t1870 = inttoptr i64 %t1869 to ptr
  %t1871 = call fastcc i64%t1870(i64 %t1866, i64 2, i64 %t1864, i64 %t1865, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1872 = call i64 @rt_cdr(i64 %t1863)
  %t1873 = call i64 @rt_cons(i64 %t1871, i64 %t1872)
  ret i64 %t1873
}

define fastcc i64 @"scheme.base:code_661"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1878 = icmp eq i64 %argc, 3
  br i1 %t1878, label %argok417, label %arityerr416
arityerr416:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok417:
  %t1879 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1880 = and i64 %t1879, -8
  %t1881 = inttoptr i64 %t1880 to ptr
  %t1882 = load i64, ptr %t1881
  %t1883 = inttoptr i64 %t1882 to ptr
  %t1884 = call fastcc i64%t1883(i64 %t1879, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1885 = load i64, ptr @"scheme.base:rd-datum"
  %t1886 = and i64 %t1885, -8
  %t1887 = inttoptr i64 %t1886 to ptr
  %t1888 = load i64, ptr %t1887
  %t1889 = inttoptr i64 %t1888 to ptr
  %t1890 = call fastcc i64%t1889(i64 %t1885, i64 3, i64 %a0, i64 %a1, i64 %t1884, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1891 = call i64 @rt_intern(ptr @.str.sym.13)
  %t1892 = call i64 @rt_car(i64 %t1890)
  %t1893 = load i64, ptr @"scheme.base:list"
  %t1894 = and i64 %t1893, -8
  %t1895 = inttoptr i64 %t1894 to ptr
  %t1896 = load i64, ptr %t1895
  %t1897 = inttoptr i64 %t1896 to ptr
  %t1898 = call fastcc i64%t1897(i64 %t1893, i64 2, i64 %t1891, i64 %t1892, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1899 = call i64 @rt_cdr(i64 %t1890)
  %t1900 = call i64 @rt_cons(i64 %t1898, i64 %t1899)
  ret i64 %t1900
}

define fastcc i64 @"scheme.base:code_678"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1905 = icmp eq i64 %argc, 3
  br i1 %t1905, label %argok419, label %arityerr418
arityerr418:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok419:
  %t1906 = call i64 @rt_lt(i64 %a2, i64 %a1)
  %t1907 = icmp ne i64 %t1906, 1
  br i1 %t1907, label %then420, label %else421
then420:
  %t1908 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1909 = call i64 @rt_char_to_integer(i64 %t1908)
  %t1910 = call i64 @rt_num_eq(i64 %t1909, i64 512)
  br label %merge422
else421:
  br label %merge422
merge422:
  %t1911 = phi i64 [ %t1910, %then420 ], [ 1, %else421 ]
  %t1912 = icmp ne i64 %t1911, 1
  br i1 %t1912, label %then423, label %else424
then423:
  %t1913 = call i64 @rt_add(i64 %a2, i64 8)
  %t1914 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1915 = and i64 %t1914, -8
  %t1916 = inttoptr i64 %t1915 to ptr
  %t1917 = load i64, ptr %t1916
  %t1918 = inttoptr i64 %t1917 to ptr
  %t1919 = call fastcc i64%t1918(i64 %t1914, i64 3, i64 %a0, i64 %a1, i64 %t1913, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1920 = load i64, ptr @"scheme.base:rd-datum"
  %t1921 = and i64 %t1920, -8
  %t1922 = inttoptr i64 %t1921 to ptr
  %t1923 = load i64, ptr %t1922
  %t1924 = inttoptr i64 %t1923 to ptr
  %t1925 = call fastcc i64%t1924(i64 %t1920, i64 3, i64 %a0, i64 %a1, i64 %t1919, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1926 = call i64 @rt_intern(ptr @.str.sym.14)
  %t1927 = call i64 @rt_car(i64 %t1925)
  %t1928 = load i64, ptr @"scheme.base:list"
  %t1929 = and i64 %t1928, -8
  %t1930 = inttoptr i64 %t1929 to ptr
  %t1931 = load i64, ptr %t1930
  %t1932 = inttoptr i64 %t1931 to ptr
  %t1933 = call fastcc i64%t1932(i64 %t1928, i64 2, i64 %t1926, i64 %t1927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1934 = call i64 @rt_cdr(i64 %t1925)
  %t1935 = call i64 @rt_cons(i64 %t1933, i64 %t1934)
  ret i64 %t1935
else424:
  %t1936 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1937 = and i64 %t1936, -8
  %t1938 = inttoptr i64 %t1937 to ptr
  %t1939 = load i64, ptr %t1938
  %t1940 = inttoptr i64 %t1939 to ptr
  %t1941 = call fastcc i64%t1940(i64 %t1936, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1942 = load i64, ptr @"scheme.base:rd-datum"
  %t1943 = and i64 %t1942, -8
  %t1944 = inttoptr i64 %t1943 to ptr
  %t1945 = load i64, ptr %t1944
  %t1946 = inttoptr i64 %t1945 to ptr
  %t1947 = call fastcc i64%t1946(i64 %t1942, i64 3, i64 %a0, i64 %a1, i64 %t1941, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1948 = call i64 @rt_intern(ptr @.str.sym.15)
  %t1949 = call i64 @rt_car(i64 %t1947)
  %t1950 = load i64, ptr @"scheme.base:list"
  %t1951 = and i64 %t1950, -8
  %t1952 = inttoptr i64 %t1951 to ptr
  %t1953 = load i64, ptr %t1952
  %t1954 = inttoptr i64 %t1953 to ptr
  %t1955 = call fastcc i64%t1954(i64 %t1950, i64 2, i64 %t1948, i64 %t1949, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1956 = call i64 @rt_cdr(i64 %t1947)
  %t1957 = call i64 @rt_cons(i64 %t1955, i64 %t1956)
  ret i64 %t1957
}

define fastcc i64 @"scheme.base:code_691"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1962 = icmp eq i64 %argc, 3
  br i1 %t1962, label %argok426, label %arityerr425
arityerr425:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok426:
  %t1963 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t1964 = call i64 @rt_char_to_integer(i64 %t1963)
  %t1965 = call i64 @rt_num_eq(i64 %t1964, i64 368)
  %t1966 = icmp ne i64 %t1965, 1
  br i1 %t1966, label %then427, label %else428
then427:
  %t1967 = call i64 @rt_add(i64 %a2, i64 8)
  %t1968 = load i64, ptr @"scheme.base:rd-token-end"
  %t1969 = and i64 %t1968, -8
  %t1970 = inttoptr i64 %t1969 to ptr
  %t1971 = load i64, ptr %t1970
  %t1972 = inttoptr i64 %t1971 to ptr
  %t1973 = call fastcc i64%t1972(i64 %t1968, i64 3, i64 %a0, i64 %a1, i64 %t1967, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1974 = call i64 @rt_add(i64 %a2, i64 8)
  %t1975 = call i64 @rt_num_eq(i64 %t1973, i64 %t1974)
  ret i64 %t1975
else428:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_695"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1980 = icmp eq i64 %argc, 2
  br i1 %t1980, label %argok430, label %arityerr429
arityerr429:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok430:
  %t1981 = call i64 @rt_null_p(i64 %a0)
  %t1982 = icmp ne i64 %t1981, 1
  br i1 %t1982, label %then431, label %else432
then431:
  ret i64 %a1
else432:
  %t1983 = call i64 @rt_cdr(i64 %a0)
  %t1984 = call i64 @rt_car(i64 %a0)
  %t1985 = call i64 @rt_cons(i64 %t1984, i64 %a1)
  %t1986 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t1987 = and i64 %t1986, -8
  %t1988 = inttoptr i64 %t1987 to ptr
  %t1989 = load i64, ptr %t1988
  %t1990 = inttoptr i64 %t1989 to ptr
  %t1991 = musttail call fastcc i64 %t1990(i64 %t1986, i64 2, i64 %t1983, i64 %t1985, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1991
}

define fastcc i64 @"scheme.base:code_720"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1996 = icmp eq i64 %argc, 4
  br i1 %t1996, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok434:
  %t1997 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t1998 = and i64 %t1997, -8
  %t1999 = inttoptr i64 %t1998 to ptr
  %t2000 = load i64, ptr %t1999
  %t2001 = inttoptr i64 %t2000 to ptr
  %t2002 = call fastcc i64%t2001(i64 %t1997, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2003 = call i64 @rt_lt(i64 %t2002, i64 %a1)
  %t2004 = icmp ne i64 %t2003, 1
  br i1 %t2004, label %then435, label %else436
then435:
  %t2005 = call i64 @rt_string_ref(i64 %a0, i64 %t2002)
  %t2006 = call i64 @rt_char_to_integer(i64 %t2005)
  %t2007 = call i64 @rt_num_eq(i64 %t2006, i64 328)
  %t2008 = icmp ne i64 %t2007, 1
  br i1 %t2008, label %then437, label %else438
then437:
  br label %merge439
else438:
  %t2009 = call i64 @rt_num_eq(i64 %t2006, i64 744)
  br label %merge439
merge439:
  %t2010 = phi i64 [ %t2007, %then437 ], [ %t2009, %else438 ]
  %t2011 = icmp ne i64 %t2010, 1
  br i1 %t2011, label %then440, label %else441
then440:
  %t2012 = load i64, ptr @"scheme.base:reverse"
  %t2013 = and i64 %t2012, -8
  %t2014 = inttoptr i64 %t2013 to ptr
  %t2015 = load i64, ptr %t2014
  %t2016 = inttoptr i64 %t2015 to ptr
  %t2017 = call fastcc i64%t2016(i64 %t2012, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2018 = call i64 @rt_add(i64 %t2002, i64 8)
  %t2019 = call i64 @rt_cons(i64 %t2017, i64 %t2018)
  ret i64 %t2019
else441:
  %t2020 = load i64, ptr @"scheme.base:rd-dot?"
  %t2021 = and i64 %t2020, -8
  %t2022 = inttoptr i64 %t2021 to ptr
  %t2023 = load i64, ptr %t2022
  %t2024 = inttoptr i64 %t2023 to ptr
  %t2025 = call fastcc i64%t2024(i64 %t2020, i64 3, i64 %a0, i64 %a1, i64 %t2002, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2026 = icmp ne i64 %t2025, 1
  br i1 %t2026, label %then442, label %else443
then442:
  %t2027 = call i64 @rt_add(i64 %t2002, i64 8)
  %t2028 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2029 = and i64 %t2028, -8
  %t2030 = inttoptr i64 %t2029 to ptr
  %t2031 = load i64, ptr %t2030
  %t2032 = inttoptr i64 %t2031 to ptr
  %t2033 = call fastcc i64%t2032(i64 %t2028, i64 3, i64 %a0, i64 %a1, i64 %t2027, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2034 = load i64, ptr @"scheme.base:rd-datum"
  %t2035 = and i64 %t2034, -8
  %t2036 = inttoptr i64 %t2035 to ptr
  %t2037 = load i64, ptr %t2036
  %t2038 = inttoptr i64 %t2037 to ptr
  %t2039 = call fastcc i64%t2038(i64 %t2034, i64 3, i64 %a0, i64 %a1, i64 %t2033, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2040 = call i64 @rt_cdr(i64 %t2039)
  %t2041 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2042 = and i64 %t2041, -8
  %t2043 = inttoptr i64 %t2042 to ptr
  %t2044 = load i64, ptr %t2043
  %t2045 = inttoptr i64 %t2044 to ptr
  %t2046 = call fastcc i64%t2045(i64 %t2041, i64 3, i64 %a0, i64 %a1, i64 %t2040, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2047 = call i64 @rt_car(i64 %t2039)
  %t2048 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t2049 = and i64 %t2048, -8
  %t2050 = inttoptr i64 %t2049 to ptr
  %t2051 = load i64, ptr %t2050
  %t2052 = inttoptr i64 %t2051 to ptr
  %t2053 = call fastcc i64%t2052(i64 %t2048, i64 2, i64 %a3, i64 %t2047, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2054 = call i64 @rt_add(i64 %t2046, i64 8)
  %t2055 = call i64 @rt_cons(i64 %t2053, i64 %t2054)
  ret i64 %t2055
else443:
  %t2056 = load i64, ptr @"scheme.base:rd-datum"
  %t2057 = and i64 %t2056, -8
  %t2058 = inttoptr i64 %t2057 to ptr
  %t2059 = load i64, ptr %t2058
  %t2060 = inttoptr i64 %t2059 to ptr
  %t2061 = call fastcc i64%t2060(i64 %t2056, i64 3, i64 %a0, i64 %a1, i64 %t2002, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2062 = call i64 @rt_cdr(i64 %t2061)
  %t2063 = call i64 @rt_car(i64 %t2061)
  %t2064 = call i64 @rt_cons(i64 %t2063, i64 %a3)
  %t2065 = load i64, ptr @"scheme.base:rd-list"
  %t2066 = and i64 %t2065, -8
  %t2067 = inttoptr i64 %t2066 to ptr
  %t2068 = load i64, ptr %t2067
  %t2069 = inttoptr i64 %t2068 to ptr
  %t2070 = musttail call fastcc i64 %t2069(i64 %t2065, i64 4, i64 %a0, i64 %a1, i64 %t2062, i64 %t2064, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2070
else436:
  %t2071 = load i64, ptr @"scheme.base:reverse"
  %t2072 = and i64 %t2071, -8
  %t2073 = inttoptr i64 %t2072 to ptr
  %t2074 = load i64, ptr %t2073
  %t2075 = inttoptr i64 %t2074 to ptr
  %t2076 = call fastcc i64%t2075(i64 %t2071, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2077 = call i64 @rt_cons(i64 %t2076, i64 %t2002)
  ret i64 %t2077
}

define fastcc i64 @"scheme.base:code_754"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2082 = icmp eq i64 %argc, 3
  br i1 %t2082, label %argok445, label %arityerr444
arityerr444:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok445:
  %t2083 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2084 = call i64 @rt_char_to_integer(i64 %t2083)
  %t2085 = call i64 @rt_num_eq(i64 %t2084, i64 320)
  %t2086 = icmp ne i64 %t2085, 1
  br i1 %t2086, label %then446, label %else447
then446:
  %t2087 = call i64 @rt_add(i64 %a2, i64 8)
  %t2088 = load i64, ptr @"scheme.base:rd-list"
  %t2089 = and i64 %t2088, -8
  %t2090 = inttoptr i64 %t2089 to ptr
  %t2091 = load i64, ptr %t2090
  %t2092 = inttoptr i64 %t2091 to ptr
  %t2093 = musttail call fastcc i64 %t2092(i64 %t2088, i64 4, i64 %a0, i64 %a1, i64 %t2087, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2093
else447:
  %t2094 = call i64 @rt_num_eq(i64 %t2084, i64 728)
  %t2095 = icmp ne i64 %t2094, 1
  br i1 %t2095, label %then448, label %else449
then448:
  %t2096 = call i64 @rt_add(i64 %a2, i64 8)
  %t2097 = load i64, ptr @"scheme.base:rd-list"
  %t2098 = and i64 %t2097, -8
  %t2099 = inttoptr i64 %t2098 to ptr
  %t2100 = load i64, ptr %t2099
  %t2101 = inttoptr i64 %t2100 to ptr
  %t2102 = musttail call fastcc i64 %t2101(i64 %t2097, i64 4, i64 %a0, i64 %a1, i64 %t2096, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2102
else449:
  %t2103 = call i64 @rt_num_eq(i64 %t2084, i64 312)
  %t2104 = icmp ne i64 %t2103, 1
  br i1 %t2104, label %then450, label %else451
then450:
  %t2105 = call i64 @rt_add(i64 %a2, i64 8)
  %t2106 = load i64, ptr @"scheme.base:rd-quote"
  %t2107 = and i64 %t2106, -8
  %t2108 = inttoptr i64 %t2107 to ptr
  %t2109 = load i64, ptr %t2108
  %t2110 = inttoptr i64 %t2109 to ptr
  %t2111 = musttail call fastcc i64 %t2110(i64 %t2106, i64 3, i64 %a0, i64 %a1, i64 %t2105, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2111
else451:
  %t2112 = call i64 @rt_num_eq(i64 %t2084, i64 768)
  %t2113 = icmp ne i64 %t2112, 1
  br i1 %t2113, label %then452, label %else453
then452:
  %t2114 = call i64 @rt_add(i64 %a2, i64 8)
  %t2115 = load i64, ptr @"scheme.base:rd-quasi"
  %t2116 = and i64 %t2115, -8
  %t2117 = inttoptr i64 %t2116 to ptr
  %t2118 = load i64, ptr %t2117
  %t2119 = inttoptr i64 %t2118 to ptr
  %t2120 = musttail call fastcc i64 %t2119(i64 %t2115, i64 3, i64 %a0, i64 %a1, i64 %t2114, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2120
else453:
  %t2121 = call i64 @rt_num_eq(i64 %t2084, i64 352)
  %t2122 = icmp ne i64 %t2121, 1
  br i1 %t2122, label %then454, label %else455
then454:
  %t2123 = call i64 @rt_add(i64 %a2, i64 8)
  %t2124 = load i64, ptr @"scheme.base:rd-unquote"
  %t2125 = and i64 %t2124, -8
  %t2126 = inttoptr i64 %t2125 to ptr
  %t2127 = load i64, ptr %t2126
  %t2128 = inttoptr i64 %t2127 to ptr
  %t2129 = musttail call fastcc i64 %t2128(i64 %t2124, i64 3, i64 %a0, i64 %a1, i64 %t2123, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2129
else455:
  %t2130 = call i64 @rt_num_eq(i64 %t2084, i64 272)
  %t2131 = icmp ne i64 %t2130, 1
  br i1 %t2131, label %then456, label %else457
then456:
  %t2132 = call i64 @rt_add(i64 %a2, i64 8)
  %t2133 = load i64, ptr @"scheme.base:rd-string"
  %t2134 = and i64 %t2133, -8
  %t2135 = inttoptr i64 %t2134 to ptr
  %t2136 = load i64, ptr %t2135
  %t2137 = inttoptr i64 %t2136 to ptr
  %t2138 = musttail call fastcc i64 %t2137(i64 %t2133, i64 3, i64 %a0, i64 %a1, i64 %t2132, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2138
else457:
  %t2139 = call i64 @rt_num_eq(i64 %t2084, i64 280)
  %t2140 = icmp ne i64 %t2139, 1
  br i1 %t2140, label %then458, label %else459
then458:
  %t2141 = call i64 @rt_add(i64 %a2, i64 8)
  %t2142 = load i64, ptr @"scheme.base:rd-hash"
  %t2143 = and i64 %t2142, -8
  %t2144 = inttoptr i64 %t2143 to ptr
  %t2145 = load i64, ptr %t2144
  %t2146 = inttoptr i64 %t2145 to ptr
  %t2147 = musttail call fastcc i64 %t2146(i64 %t2142, i64 3, i64 %a0, i64 %a1, i64 %t2141, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2147
else459:
  %t2148 = load i64, ptr @"scheme.base:rd-atom"
  %t2149 = and i64 %t2148, -8
  %t2150 = inttoptr i64 %t2149 to ptr
  %t2151 = load i64, ptr %t2150
  %t2152 = inttoptr i64 %t2151 to ptr
  %t2153 = musttail call fastcc i64 %t2152(i64 %t2148, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2153
}

define fastcc i64 @"scheme.base:code_758"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2158 = icmp eq i64 %argc, 1
  br i1 %t2158, label %argok461, label %arityerr460
arityerr460:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok461:
  %t2159 = call i64 @rt_string_length(i64 %a0)
  %t2160 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2161 = and i64 %t2160, -8
  %t2162 = inttoptr i64 %t2161 to ptr
  %t2163 = load i64, ptr %t2162
  %t2164 = inttoptr i64 %t2163 to ptr
  %t2165 = call fastcc i64%t2164(i64 %t2160, i64 3, i64 %a0, i64 %t2159, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2166 = load i64, ptr @"scheme.base:rd-datum"
  %t2167 = and i64 %t2166, -8
  %t2168 = inttoptr i64 %t2167 to ptr
  %t2169 = load i64, ptr %t2168
  %t2170 = inttoptr i64 %t2169 to ptr
  %t2171 = call fastcc i64%t2170(i64 %t2166, i64 3, i64 %a0, i64 %t2159, i64 %t2165, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2172 = call i64 @rt_car(i64 %t2171)
  ret i64 %t2172
}

define fastcc i64 @"scheme.base:code_772"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2177 = icmp eq i64 %argc, 2
  br i1 %t2177, label %argok463, label %arityerr462
arityerr462:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok463:
  %t2178 = and i64 %self, -8
  %t2179 = inttoptr i64 %t2178 to ptr
  %t2180 = getelementptr i64, ptr %t2179, i64 1
  %t2181 = load i64, ptr %t2180
  %t2182 = call i64 @rt_lt(i64 %a0, i64 %t2181)
  %t2183 = icmp ne i64 %t2182, 1
  br i1 %t2183, label %then464, label %else465
then464:
  %t2184 = and i64 %self, -8
  %t2185 = inttoptr i64 %t2184 to ptr
  %t2186 = getelementptr i64, ptr %t2185, i64 2
  %t2187 = load i64, ptr %t2186
  %t2188 = and i64 %self, -8
  %t2189 = inttoptr i64 %t2188 to ptr
  %t2190 = getelementptr i64, ptr %t2189, i64 1
  %t2191 = load i64, ptr %t2190
  %t2192 = load i64, ptr @"scheme.base:rd-datum"
  %t2193 = and i64 %t2192, -8
  %t2194 = inttoptr i64 %t2193 to ptr
  %t2195 = load i64, ptr %t2194
  %t2196 = inttoptr i64 %t2195 to ptr
  %t2197 = call fastcc i64%t2196(i64 %t2192, i64 3, i64 %t2187, i64 %t2191, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2198 = and i64 %self, -8
  %t2199 = inttoptr i64 %t2198 to ptr
  %t2200 = getelementptr i64, ptr %t2199, i64 2
  %t2201 = load i64, ptr %t2200
  %t2202 = and i64 %self, -8
  %t2203 = inttoptr i64 %t2202 to ptr
  %t2204 = getelementptr i64, ptr %t2203, i64 1
  %t2205 = load i64, ptr %t2204
  %t2206 = call i64 @rt_cdr(i64 %t2197)
  %t2207 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2208 = and i64 %t2207, -8
  %t2209 = inttoptr i64 %t2208 to ptr
  %t2210 = load i64, ptr %t2209
  %t2211 = inttoptr i64 %t2210 to ptr
  %t2212 = call fastcc i64%t2211(i64 %t2207, i64 3, i64 %t2201, i64 %t2205, i64 %t2206, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2213 = call i64 @rt_car(i64 %t2197)
  %t2214 = call i64 @rt_cons(i64 %t2213, i64 %a1)
  %t2215 = and i64 %self, -8
  %t2216 = inttoptr i64 %t2215 to ptr
  %t2217 = getelementptr i64, ptr %t2216, i64 3
  %t2218 = load i64, ptr %t2217
  %t2219 = and i64 %t2218, -8
  %t2220 = inttoptr i64 %t2219 to ptr
  %t2221 = load i64, ptr %t2220
  %t2222 = inttoptr i64 %t2221 to ptr
  %t2223 = musttail call fastcc i64 %t2222(i64 %t2218, i64 2, i64 %t2212, i64 %t2214, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2223
else465:
  %t2224 = load i64, ptr @"scheme.base:reverse"
  %t2225 = and i64 %t2224, -8
  %t2226 = inttoptr i64 %t2225 to ptr
  %t2227 = load i64, ptr %t2226
  %t2228 = inttoptr i64 %t2227 to ptr
  %t2229 = musttail call fastcc i64 %t2228(i64 %t2224, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2229
}

define fastcc i64 @"scheme.base:code_770"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2230 = icmp eq i64 %argc, 1
  br i1 %t2230, label %argok467, label %arityerr466
arityerr466:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok467:
  %t2231 = call i64 @rt_string_length(i64 %a0)
  %t2232 = call i64 @rt_alloc_words(i64 4)
  %t2233 = inttoptr i64 %t2232 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_772" to i64), ptr %t2233
  %t2234 = or i64 %t2232, 4
  %t2235 = getelementptr i64, ptr %t2233, i64 1
  store i64 %t2231, ptr %t2235
  %t2236 = getelementptr i64, ptr %t2233, i64 2
  store i64 %a0, ptr %t2236
  %t2237 = getelementptr i64, ptr %t2233, i64 3
  store i64 %t2234, ptr %t2237
  %t2238 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2239 = and i64 %t2238, -8
  %t2240 = inttoptr i64 %t2239 to ptr
  %t2241 = load i64, ptr %t2240
  %t2242 = inttoptr i64 %t2241 to ptr
  %t2243 = call fastcc i64%t2242(i64 %t2238, i64 3, i64 %a0, i64 %t2231, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2244 = and i64 %t2234, -8
  %t2245 = inttoptr i64 %t2244 to ptr
  %t2246 = load i64, ptr %t2245
  %t2247 = inttoptr i64 %t2246 to ptr
  %t2248 = musttail call fastcc i64 %t2247(i64 %t2234, i64 2, i64 %t2243, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2248
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
  %t1165 = call i64 @rt_alloc_words(i64 1)
  %t1166 = inttoptr i64 %t1165 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_316" to i64), ptr %t1166
  %t1167 = or i64 %t1165, 4
  %t1168 = call i64 @rt_root(i64 %t1167)
  store i64 %t1168, ptr @"scheme.base:number->string"
  ret i64 %t1168
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1191 = call i64 @rt_alloc_words(i64 1)
  %t1192 = inttoptr i64 %t1191 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_320" to i64), ptr %t1192
  %t1193 = or i64 %t1191, 4
  %t1194 = call i64 @rt_root(i64 %t1193)
  store i64 %t1194, ptr @"scheme.base:error"
  ret i64 %t1194
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1197 = call i64 @rt_alloc_words(i64 1)
  %t1198 = inttoptr i64 %t1197 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_323" to i64), ptr %t1198
  %t1199 = or i64 %t1197, 4
  %t1200 = call i64 @rt_root(i64 %t1199)
  store i64 %t1200, ptr @"scheme.base:raise"
  ret i64 %t1200
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1203 = call i64 @rt_alloc_words(i64 1)
  %t1204 = inttoptr i64 %t1203 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_326" to i64), ptr %t1204
  %t1205 = or i64 %t1203, 4
  %t1206 = call i64 @rt_root(i64 %t1205)
  store i64 %t1206, ptr @"scheme.base:error-object?"
  ret i64 %t1206
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1209 = call i64 @rt_alloc_words(i64 1)
  %t1210 = inttoptr i64 %t1209 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_329" to i64), ptr %t1210
  %t1211 = or i64 %t1209, 4
  %t1212 = call i64 @rt_root(i64 %t1211)
  store i64 %t1212, ptr @"scheme.base:error-object-message"
  ret i64 %t1212
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1215 = call i64 @rt_alloc_words(i64 1)
  %t1216 = inttoptr i64 %t1215 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_332" to i64), ptr %t1216
  %t1217 = or i64 %t1215, 4
  %t1218 = call i64 @rt_root(i64 %t1217)
  store i64 %t1218, ptr @"scheme.base:error-object-irritants"
  ret i64 %t1218
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1261 = call i64 @rt_alloc_words(i64 1)
  %t1262 = inttoptr i64 %t1261 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1262
  %t1263 = or i64 %t1261, 4
  %t1264 = call i64 @rt_root(i64 %t1263)
  store i64 %t1264, ptr @"scheme.base:list->vector"
  ret i64 %t1264
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1283 = call i64 @rt_alloc_words(i64 1)
  %t1284 = inttoptr i64 %t1283 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_344" to i64), ptr %t1284
  %t1285 = or i64 %t1283, 4
  %t1286 = call i64 @rt_root(i64 %t1285)
  store i64 %t1286, ptr @"scheme.base:vector"
  ret i64 %t1286
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1296 = call i64 @rt_alloc_words(i64 1)
  %t1297 = inttoptr i64 %t1296 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_370" to i64), ptr %t1297
  %t1298 = or i64 %t1296, 4
  %t1299 = call i64 @rt_root(i64 %t1298)
  store i64 %t1299, ptr @"scheme.base:rd-ws?"
  ret i64 %t1299
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1305 = call i64 @rt_alloc_words(i64 1)
  %t1306 = inttoptr i64 %t1305 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_382" to i64), ptr %t1306
  %t1307 = or i64 %t1305, 4
  %t1308 = call i64 @rt_root(i64 %t1307)
  store i64 %t1308, ptr @"scheme.base:rd-digit?"
  ret i64 %t1308
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1329 = call i64 @rt_alloc_words(i64 1)
  %t1330 = inttoptr i64 %t1329 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_422" to i64), ptr %t1330
  %t1331 = or i64 %t1329, 4
  %t1332 = call i64 @rt_root(i64 %t1331)
  store i64 %t1332, ptr @"scheme.base:rd-delim?"
  ret i64 %t1332
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1348 = call i64 @rt_alloc_words(i64 1)
  %t1349 = inttoptr i64 %t1348 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_435" to i64), ptr %t1349
  %t1350 = or i64 %t1348, 4
  %t1351 = call i64 @rt_root(i64 %t1350)
  store i64 %t1351, ptr @"scheme.base:rd-skip-line"
  ret i64 %t1351
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1386 = call i64 @rt_alloc_words(i64 1)
  %t1387 = inttoptr i64 %t1386 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_449" to i64), ptr %t1387
  %t1388 = or i64 %t1386, 4
  %t1389 = call i64 @rt_root(i64 %t1388)
  store i64 %t1389, ptr @"scheme.base:rd-skip-ws"
  ret i64 %t1389
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1408 = call i64 @rt_alloc_words(i64 1)
  %t1409 = inttoptr i64 %t1408 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_458" to i64), ptr %t1409
  %t1410 = or i64 %t1408, 4
  %t1411 = call i64 @rt_root(i64 %t1410)
  store i64 %t1411, ptr @"scheme.base:rd-token-end"
  ret i64 %t1411
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1430 = call i64 @rt_alloc_words(i64 1)
  %t1431 = inttoptr i64 %t1430 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_467" to i64), ptr %t1431
  %t1432 = or i64 %t1430, 4
  %t1433 = call i64 @rt_root(i64 %t1432)
  store i64 %t1433, ptr @"scheme.base:rd-all-digits?"
  ret i64 %t1433
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1467 = call i64 @rt_alloc_words(i64 1)
  %t1468 = inttoptr i64 %t1467 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_490" to i64), ptr %t1468
  %t1469 = or i64 %t1467, 4
  %t1470 = call i64 @rt_root(i64 %t1469)
  store i64 %t1470, ptr @"scheme.base:rd-numeric?"
  ret i64 %t1470
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1486 = call i64 @rt_alloc_words(i64 1)
  %t1487 = inttoptr i64 %t1486 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_500" to i64), ptr %t1487
  %t1488 = or i64 %t1486, 4
  %t1489 = call i64 @rt_root(i64 %t1488)
  store i64 %t1489, ptr @"scheme.base:rd-digits"
  ret i64 %t1489
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1517 = call i64 @rt_alloc_words(i64 1)
  %t1518 = inttoptr i64 %t1517 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_513" to i64), ptr %t1518
  %t1519 = or i64 %t1517, 4
  %t1520 = call i64 @rt_root(i64 %t1519)
  store i64 %t1520, ptr @"scheme.base:rd-parse-int"
  ret i64 %t1520
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1545 = call i64 @rt_alloc_words(i64 1)
  %t1546 = inttoptr i64 %t1545 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_520" to i64), ptr %t1546
  %t1547 = or i64 %t1545, 4
  %t1548 = call i64 @rt_root(i64 %t1547)
  store i64 %t1548, ptr @"scheme.base:rd-atom"
  ret i64 %t1548
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1569 = call i64 @rt_alloc_words(i64 1)
  %t1570 = inttoptr i64 %t1569 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_548" to i64), ptr %t1570
  %t1571 = or i64 %t1569, 4
  %t1572 = call i64 @rt_root(i64 %t1571)
  store i64 %t1572, ptr @"scheme.base:rd-hex-digit"
  ret i64 %t1572
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1599 = call i64 @rt_alloc_words(i64 1)
  %t1600 = inttoptr i64 %t1599 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_562" to i64), ptr %t1600
  %t1601 = or i64 %t1599, 4
  %t1602 = call i64 @rt_root(i64 %t1601)
  store i64 %t1602, ptr @"scheme.base:rd-hex"
  ret i64 %t1602
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1614 = call i64 @rt_alloc_words(i64 1)
  %t1615 = inttoptr i64 %t1614 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_578" to i64), ptr %t1615
  %t1616 = or i64 %t1614, 4
  %t1617 = call i64 @rt_root(i64 %t1616)
  store i64 %t1617, ptr @"scheme.base:rd-str-esc"
  ret i64 %t1617
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1729 = call i64 @rt_alloc_words(i64 1)
  %t1730 = inttoptr i64 %t1729 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_606" to i64), ptr %t1730
  %t1731 = or i64 %t1729, 4
  %t1732 = call i64 @rt_root(i64 %t1731)
  store i64 %t1732, ptr @"scheme.base:rd-string"
  ret i64 %t1732
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1779 = call i64 @rt_alloc_words(i64 1)
  %t1780 = inttoptr i64 %t1779 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_632" to i64), ptr %t1780
  %t1781 = or i64 %t1779, 4
  %t1782 = call i64 @rt_root(i64 %t1781)
  store i64 %t1782, ptr @"scheme.base:rd-hash"
  ret i64 %t1782
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1821 = call i64 @rt_alloc_words(i64 1)
  %t1822 = inttoptr i64 %t1821 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_635" to i64), ptr %t1822
  %t1823 = or i64 %t1821, 4
  %t1824 = call i64 @rt_root(i64 %t1823)
  store i64 %t1824, ptr @"scheme.base:rd-char-name"
  ret i64 %t1824
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1847 = call i64 @rt_alloc_words(i64 1)
  %t1848 = inttoptr i64 %t1847 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_647" to i64), ptr %t1848
  %t1849 = or i64 %t1847, 4
  %t1850 = call i64 @rt_root(i64 %t1849)
  store i64 %t1850, ptr @"scheme.base:rd-char"
  ret i64 %t1850
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1874 = call i64 @rt_alloc_words(i64 1)
  %t1875 = inttoptr i64 %t1874 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_654" to i64), ptr %t1875
  %t1876 = or i64 %t1874, 4
  %t1877 = call i64 @rt_root(i64 %t1876)
  store i64 %t1877, ptr @"scheme.base:rd-quote"
  ret i64 %t1877
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1901 = call i64 @rt_alloc_words(i64 1)
  %t1902 = inttoptr i64 %t1901 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_661" to i64), ptr %t1902
  %t1903 = or i64 %t1901, 4
  %t1904 = call i64 @rt_root(i64 %t1903)
  store i64 %t1904, ptr @"scheme.base:rd-quasi"
  ret i64 %t1904
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1958 = call i64 @rt_alloc_words(i64 1)
  %t1959 = inttoptr i64 %t1958 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_678" to i64), ptr %t1959
  %t1960 = or i64 %t1958, 4
  %t1961 = call i64 @rt_root(i64 %t1960)
  store i64 %t1961, ptr @"scheme.base:rd-unquote"
  ret i64 %t1961
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1976 = call i64 @rt_alloc_words(i64 1)
  %t1977 = inttoptr i64 %t1976 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_691" to i64), ptr %t1977
  %t1978 = or i64 %t1976, 4
  %t1979 = call i64 @rt_root(i64 %t1978)
  store i64 %t1979, ptr @"scheme.base:rd-dot?"
  ret i64 %t1979
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1992 = call i64 @rt_alloc_words(i64 1)
  %t1993 = inttoptr i64 %t1992 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_695" to i64), ptr %t1993
  %t1994 = or i64 %t1992, 4
  %t1995 = call i64 @rt_root(i64 %t1994)
  store i64 %t1995, ptr @"scheme.base:rd-append-reverse"
  ret i64 %t1995
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2078 = call i64 @rt_alloc_words(i64 1)
  %t2079 = inttoptr i64 %t2078 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_720" to i64), ptr %t2079
  %t2080 = or i64 %t2078, 4
  %t2081 = call i64 @rt_root(i64 %t2080)
  store i64 %t2081, ptr @"scheme.base:rd-list"
  ret i64 %t2081
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2154 = call i64 @rt_alloc_words(i64 1)
  %t2155 = inttoptr i64 %t2154 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_754" to i64), ptr %t2155
  %t2156 = or i64 %t2154, 4
  %t2157 = call i64 @rt_root(i64 %t2156)
  store i64 %t2157, ptr @"scheme.base:rd-datum"
  ret i64 %t2157
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2173 = call i64 @rt_alloc_words(i64 1)
  %t2174 = inttoptr i64 %t2173 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_758" to i64), ptr %t2174
  %t2175 = or i64 %t2173, 4
  %t2176 = call i64 @rt_root(i64 %t2175)
  store i64 %t2176, ptr @"scheme.base:read-from-string"
  ret i64 %t2176
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2249 = call i64 @rt_alloc_words(i64 1)
  %t2250 = inttoptr i64 %t2249 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_770" to i64), ptr %t2250
  %t2251 = or i64 %t2249, 4
  %t2252 = call i64 @rt_root(i64 %t2251)
  store i64 %t2252, ptr @"scheme.base:read-all-from-string"
  ret i64 %t2252
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

