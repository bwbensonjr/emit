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
declare i64 @rt_repl_mode()
declare i64 @rt_repl_input()
declare i64 @rt_repl_state_ref()
declare i64 @rt_repl_state_set(i64)
declare i64 @rt_root(i64)
declare i64 @rt_display(i64)
declare i64 @rt_write_val(i64)
declare i64 @rt_newline()
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
@.str.lit.3 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.lit.4 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.5 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.6 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.7 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.8 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.9 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.10 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.11 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.12 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.13 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.14 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.15 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.16 = private unnamed_addr constant [8 x i8] c"unquote\00"
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
  %t145 = or i64 %a1, 8
  %t146 = and i64 %t145, 7
  %t147 = icmp eq i64 %t146, 0
  br i1 %t147, label %fixfast31, label %fixslow32
fixfast31:
  %t148 = add i64 %a1, 8
  br label %fixmerge33
fixslow32:
  %t149 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge33
fixmerge33:
  %t150 = phi i64 [ %t148, %fixfast31 ], [ %t149, %fixslow32 ]
  %t151 = musttail call fastcc i64 @"scheme.base:code_45"(i64 %self, i64 2, i64 %t144, i64 %t150, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t151
}

define fastcc i64 @"scheme.base:code_43"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t152 = icmp eq i64 %argc, 1
  br i1 %t152, label %argok35, label %arityerr34
arityerr34:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok35:
  %t153 = call i64 @rt_alloc_words(i64 2)
  %t154 = inttoptr i64 %t153 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_45" to i64), ptr %t154
  %t155 = or i64 %t153, 4
  %t156 = getelementptr i64, ptr %t154, i64 1
  store i64 %t155, ptr %t156
  %t157 = and i64 %t155, -8
  %t158 = inttoptr i64 %t157 to ptr
  %t159 = load i64, ptr %t158
  %t160 = inttoptr i64 %t159 to ptr
  %t161 = musttail call fastcc i64 %t160(i64 %t155, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t161
}

define fastcc i64 @"scheme.base:code_53"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t166 = icmp eq i64 %argc, 2
  br i1 %t166, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t167 = call i64 @rt_null_p(i64 %a0)
  %t168 = icmp ne i64 %t167, 1
  br i1 %t168, label %then38, label %else39
then38:
  ret i64 %a1
else39:
  %t169 = call i64 @rt_cdr(i64 %a0)
  %t170 = call i64 @rt_car(i64 %a0)
  %t171 = call i64 @rt_cons(i64 %t170, i64 %a1)
  %t172 = musttail call fastcc i64 @"scheme.base:code_53"(i64 %self, i64 2, i64 %t169, i64 %t171, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t172
}

define fastcc i64 @"scheme.base:code_51"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t173 = icmp eq i64 %argc, 1
  br i1 %t173, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t174 = call i64 @rt_alloc_words(i64 2)
  %t175 = inttoptr i64 %t174 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_53" to i64), ptr %t175
  %t176 = or i64 %t174, 4
  %t177 = getelementptr i64, ptr %t175, i64 1
  store i64 %t176, ptr %t177
  %t178 = and i64 %t176, -8
  %t179 = inttoptr i64 %t178 to ptr
  %t180 = load i64, ptr %t179
  %t181 = inttoptr i64 %t180 to ptr
  %t182 = musttail call fastcc i64 %t181(i64 %t176, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t182
}

define fastcc i64 @"scheme.base:code_57"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t187 = icmp eq i64 %argc, 2
  br i1 %t187, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok43:
  %t188 = call i64 @rt_null_p(i64 %a0)
  %t189 = icmp ne i64 %t188, 1
  br i1 %t189, label %then44, label %else45
then44:
  ret i64 %a1
else45:
  %t190 = call i64 @rt_car(i64 %a0)
  %t191 = call i64 @rt_cdr(i64 %a0)
  %t192 = load i64, ptr @"scheme.base:%append2"
  %t193 = and i64 %t192, -8
  %t194 = inttoptr i64 %t193 to ptr
  %t195 = load i64, ptr %t194
  %t196 = inttoptr i64 %t195 to ptr
  %t197 = call fastcc i64%t196(i64 %t192, i64 2, i64 %t191, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t198 = call i64 @rt_cons(i64 %t190, i64 %t197)
  ret i64 %t198
}

define fastcc i64 @"scheme.base:code_60"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t203 = icmp sge i64 %argc, 0
  br i1 %t203, label %argok47, label %arityerr46
arityerr46:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok47:
  %t204 = call i64 @rt_alloc_words(i64 8)
  %t205 = inttoptr i64 %t204 to ptr
  %t206 = getelementptr i64, ptr %t205, i64 0
  store i64 %a0, ptr %t206
  %t207 = getelementptr i64, ptr %t205, i64 1
  store i64 %a1, ptr %t207
  %t208 = getelementptr i64, ptr %t205, i64 2
  store i64 %a2, ptr %t208
  %t209 = getelementptr i64, ptr %t205, i64 3
  store i64 %a3, ptr %t209
  %t210 = getelementptr i64, ptr %t205, i64 4
  store i64 %a4, ptr %t210
  %t211 = getelementptr i64, ptr %t205, i64 5
  store i64 %a5, ptr %t211
  %t212 = getelementptr i64, ptr %t205, i64 6
  store i64 %a6, ptr %t212
  %t213 = getelementptr i64, ptr %t205, i64 7
  store i64 %a7, ptr %t213
  %t214 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t205, ptr %overflow)
  %t215 = call i64 @rt_null_p(i64 %t214)
  %t216 = icmp ne i64 %t215, 1
  br i1 %t216, label %then48, label %else49
then48:
  ret i64 2
else49:
  %t217 = call i64 @rt_cdr(i64 %t214)
  %t218 = call i64 @rt_null_p(i64 %t217)
  %t219 = icmp ne i64 %t218, 1
  br i1 %t219, label %then50, label %else51
then50:
  %t220 = call i64 @rt_car(i64 %t214)
  ret i64 %t220
else51:
  %t221 = call i64 @rt_car(i64 %t214)
  %t222 = call i64 @rt_cdr(i64 %t214)
  %t223 = load i64, ptr @"scheme.base:append"
  %t224 = and i64 %t223, -8
  %t225 = inttoptr i64 %t224 to ptr
  %t226 = load i64, ptr %t225
  %t227 = inttoptr i64 %t226 to ptr
  %t228 = call i64 @rt_list_length(i64 %t222)
  %t229 = add i64 0, %t228
  %t230 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t222, i64 8)
  %t242 = getelementptr i64, ptr %t230, i64 0
  %t234 = load i64, ptr %t242
  %t243 = getelementptr i64, ptr %t230, i64 1
  %t235 = load i64, ptr %t243
  %t244 = getelementptr i64, ptr %t230, i64 2
  %t236 = load i64, ptr %t244
  %t245 = getelementptr i64, ptr %t230, i64 3
  %t237 = load i64, ptr %t245
  %t246 = getelementptr i64, ptr %t230, i64 4
  %t238 = load i64, ptr %t246
  %t247 = getelementptr i64, ptr %t230, i64 5
  %t239 = load i64, ptr %t247
  %t248 = getelementptr i64, ptr %t230, i64 6
  %t240 = load i64, ptr %t248
  %t249 = getelementptr i64, ptr %t230, i64 7
  %t241 = load i64, ptr %t249
  %t231 = icmp sgt i64 %t229, 8
  %t232 = getelementptr i64, ptr %t230, i64 8
  %t233 = select i1 %t231, ptr %t232, ptr null
  %t250 = call fastcc i64%t227(i64 %t223, i64 %t229, i64 %t234, i64 %t235, i64 %t236, i64 %t237, i64 %t238, i64 %t239, i64 %t240, i64 %t241, ptr %t233)
  %t251 = load i64, ptr @"scheme.base:%append2"
  %t252 = and i64 %t251, -8
  %t253 = inttoptr i64 %t252 to ptr
  %t254 = load i64, ptr %t253
  %t255 = inttoptr i64 %t254 to ptr
  %t256 = musttail call fastcc i64 %t255(i64 %t251, i64 2, i64 %t221, i64 %t250, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t256
}

define fastcc i64 @"scheme.base:code_64"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t261 = icmp eq i64 %argc, 2
  br i1 %t261, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok53:
  %t262 = call i64 @rt_null_p(i64 %a1)
  %t263 = icmp ne i64 %t262, 1
  br i1 %t263, label %then54, label %else55
then54:
  ret i64 2
else55:
  %t264 = call i64 @rt_car(i64 %a1)
  %t265 = and i64 %a0, -8
  %t266 = inttoptr i64 %t265 to ptr
  %t267 = load i64, ptr %t266
  %t268 = inttoptr i64 %t267 to ptr
  %t269 = call fastcc i64%t268(i64 %a0, i64 1, i64 %t264, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t270 = call i64 @rt_cdr(i64 %a1)
  %t271 = load i64, ptr @"scheme.base:%map1"
  %t272 = and i64 %t271, -8
  %t273 = inttoptr i64 %t272 to ptr
  %t274 = load i64, ptr %t273
  %t275 = inttoptr i64 %t274 to ptr
  %t276 = call fastcc i64%t275(i64 %t271, i64 2, i64 %a0, i64 %t270, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t277 = call i64 @rt_cons(i64 %t269, i64 %t276)
  ret i64 %t277
}

define fastcc i64 @"scheme.base:code_67"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t282 = icmp eq i64 %argc, 1
  br i1 %t282, label %argok57, label %arityerr56
arityerr56:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok57:
  %t283 = call i64 @rt_null_p(i64 %a0)
  %t284 = icmp ne i64 %t283, 1
  br i1 %t284, label %then58, label %else59
then58:
  ret i64 1
else59:
  %t285 = call i64 @rt_car(i64 %a0)
  %t286 = call i64 @rt_null_p(i64 %t285)
  %t287 = icmp ne i64 %t286, 1
  br i1 %t287, label %then60, label %else61
then60:
  ret i64 257
else61:
  %t288 = call i64 @rt_cdr(i64 %a0)
  %t289 = load i64, ptr @"scheme.base:%any-null?"
  %t290 = and i64 %t289, -8
  %t291 = inttoptr i64 %t290 to ptr
  %t292 = load i64, ptr %t291
  %t293 = inttoptr i64 %t292 to ptr
  %t294 = musttail call fastcc i64 %t293(i64 %t289, i64 1, i64 %t288, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t294
}

define fastcc i64 @"scheme.base:code_75"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t299 = icmp eq i64 %argc, 1
  br i1 %t299, label %argok63, label %arityerr62
arityerr62:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok63:
  %t300 = call i64 @rt_car(i64 %a0)
  ret i64 %t300
}

define fastcc i64 @"scheme.base:code_77"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t301 = icmp eq i64 %argc, 1
  br i1 %t301, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok65:
  %t302 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t302
}

define fastcc i64 @"scheme.base:code_73"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t303 = icmp eq i64 %argc, 2
  br i1 %t303, label %argok67, label %arityerr66
arityerr66:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok67:
  %t304 = load i64, ptr @"scheme.base:%any-null?"
  %t305 = and i64 %t304, -8
  %t306 = inttoptr i64 %t305 to ptr
  %t307 = load i64, ptr %t306
  %t308 = inttoptr i64 %t307 to ptr
  %t309 = call fastcc i64%t308(i64 %t304, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t310 = icmp ne i64 %t309, 1
  br i1 %t310, label %then68, label %else69
then68:
  ret i64 2
else69:
  %t311 = call i64 @rt_alloc_words(i64 1)
  %t312 = inttoptr i64 %t311 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_75" to i64), ptr %t312
  %t313 = or i64 %t311, 4
  %t314 = load i64, ptr @"scheme.base:%map1"
  %t315 = and i64 %t314, -8
  %t316 = inttoptr i64 %t315 to ptr
  %t317 = load i64, ptr %t316
  %t318 = inttoptr i64 %t317 to ptr
  %t319 = call fastcc i64%t318(i64 %t314, i64 2, i64 %t313, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t320 = and i64 %a0, -8
  %t321 = inttoptr i64 %t320 to ptr
  %t322 = load i64, ptr %t321
  %t323 = inttoptr i64 %t322 to ptr
  %t324 = call i64 @rt_list_length(i64 %t319)
  %t325 = add i64 0, %t324
  %t326 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t319, i64 8)
  %t338 = getelementptr i64, ptr %t326, i64 0
  %t330 = load i64, ptr %t338
  %t339 = getelementptr i64, ptr %t326, i64 1
  %t331 = load i64, ptr %t339
  %t340 = getelementptr i64, ptr %t326, i64 2
  %t332 = load i64, ptr %t340
  %t341 = getelementptr i64, ptr %t326, i64 3
  %t333 = load i64, ptr %t341
  %t342 = getelementptr i64, ptr %t326, i64 4
  %t334 = load i64, ptr %t342
  %t343 = getelementptr i64, ptr %t326, i64 5
  %t335 = load i64, ptr %t343
  %t344 = getelementptr i64, ptr %t326, i64 6
  %t336 = load i64, ptr %t344
  %t345 = getelementptr i64, ptr %t326, i64 7
  %t337 = load i64, ptr %t345
  %t327 = icmp sgt i64 %t325, 8
  %t328 = getelementptr i64, ptr %t326, i64 8
  %t329 = select i1 %t327, ptr %t328, ptr null
  %t346 = call fastcc i64%t323(i64 %a0, i64 %t325, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 %t334, i64 %t335, i64 %t336, i64 %t337, ptr %t329)
  %t347 = call i64 @rt_alloc_words(i64 1)
  %t348 = inttoptr i64 %t347 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_77" to i64), ptr %t348
  %t349 = or i64 %t347, 4
  %t350 = load i64, ptr @"scheme.base:%map1"
  %t351 = and i64 %t350, -8
  %t352 = inttoptr i64 %t351 to ptr
  %t353 = load i64, ptr %t352
  %t354 = inttoptr i64 %t353 to ptr
  %t355 = call fastcc i64%t354(i64 %t350, i64 2, i64 %t349, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t356 = load i64, ptr @"scheme.base:%mapn"
  %t357 = and i64 %t356, -8
  %t358 = inttoptr i64 %t357 to ptr
  %t359 = load i64, ptr %t358
  %t360 = inttoptr i64 %t359 to ptr
  %t361 = call fastcc i64%t360(i64 %t356, i64 2, i64 %a0, i64 %t355, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t362 = call i64 @rt_cons(i64 %t346, i64 %t361)
  ret i64 %t362
}

define fastcc i64 @"scheme.base:code_82"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t367 = icmp sge i64 %argc, 2
  br i1 %t367, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t368 = call i64 @rt_alloc_words(i64 8)
  %t369 = inttoptr i64 %t368 to ptr
  %t370 = getelementptr i64, ptr %t369, i64 0
  store i64 %a0, ptr %t370
  %t371 = getelementptr i64, ptr %t369, i64 1
  store i64 %a1, ptr %t371
  %t372 = getelementptr i64, ptr %t369, i64 2
  store i64 %a2, ptr %t372
  %t373 = getelementptr i64, ptr %t369, i64 3
  store i64 %a3, ptr %t373
  %t374 = getelementptr i64, ptr %t369, i64 4
  store i64 %a4, ptr %t374
  %t375 = getelementptr i64, ptr %t369, i64 5
  store i64 %a5, ptr %t375
  %t376 = getelementptr i64, ptr %t369, i64 6
  store i64 %a6, ptr %t376
  %t377 = getelementptr i64, ptr %t369, i64 7
  store i64 %a7, ptr %t377
  %t378 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t369, ptr %overflow)
  %t379 = call i64 @rt_null_p(i64 %t378)
  %t380 = icmp ne i64 %t379, 1
  br i1 %t380, label %then72, label %else73
then72:
  %t381 = load i64, ptr @"scheme.base:%map1"
  %t382 = and i64 %t381, -8
  %t383 = inttoptr i64 %t382 to ptr
  %t384 = load i64, ptr %t383
  %t385 = inttoptr i64 %t384 to ptr
  %t386 = musttail call fastcc i64 %t385(i64 %t381, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t386
else73:
  %t387 = call i64 @rt_cons(i64 %a1, i64 %t378)
  %t388 = load i64, ptr @"scheme.base:%mapn"
  %t389 = and i64 %t388, -8
  %t390 = inttoptr i64 %t389 to ptr
  %t391 = load i64, ptr %t390
  %t392 = inttoptr i64 %t391 to ptr
  %t393 = musttail call fastcc i64 %t392(i64 %t388, i64 2, i64 %a0, i64 %t387, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t393
}

define fastcc i64 @"scheme.base:code_90"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t398 = icmp eq i64 %argc, 2
  br i1 %t398, label %argok75, label %arityerr74
arityerr74:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok75:
  %t399 = call i64 @rt_null_p(i64 %a1)
  %t400 = icmp ne i64 %t399, 1
  br i1 %t400, label %then76, label %else77
then76:
  ret i64 1
else77:
  %t401 = call i64 @rt_car(i64 %a1)
  %t402 = call i64 @rt_eq_p(i64 %a0, i64 %t401)
  %t403 = icmp ne i64 %t402, 1
  br i1 %t403, label %then78, label %else79
then78:
  ret i64 %a1
else79:
  %t404 = call i64 @rt_cdr(i64 %a1)
  %t405 = load i64, ptr @"scheme.base:memq"
  %t406 = and i64 %t405, -8
  %t407 = inttoptr i64 %t406 to ptr
  %t408 = load i64, ptr %t407
  %t409 = inttoptr i64 %t408 to ptr
  %t410 = musttail call fastcc i64 %t409(i64 %t405, i64 2, i64 %a0, i64 %t404, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t410
}

define fastcc i64 @"scheme.base:code_98"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t415 = icmp eq i64 %argc, 2
  br i1 %t415, label %argok81, label %arityerr80
arityerr80:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok81:
  %t416 = call i64 @rt_null_p(i64 %a1)
  %t417 = icmp ne i64 %t416, 1
  br i1 %t417, label %then82, label %else83
then82:
  ret i64 1
else83:
  %t418 = call i64 @rt_car(i64 %a1)
  %t419 = call i64 @rt_eqv_p(i64 %a0, i64 %t418)
  %t420 = icmp ne i64 %t419, 1
  br i1 %t420, label %then84, label %else85
then84:
  ret i64 %a1
else85:
  %t421 = call i64 @rt_cdr(i64 %a1)
  %t422 = load i64, ptr @"scheme.base:memv"
  %t423 = and i64 %t422, -8
  %t424 = inttoptr i64 %t423 to ptr
  %t425 = load i64, ptr %t424
  %t426 = inttoptr i64 %t425 to ptr
  %t427 = musttail call fastcc i64 %t426(i64 %t422, i64 2, i64 %a0, i64 %t421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t427
}

define fastcc i64 @"scheme.base:code_106"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t432 = icmp eq i64 %argc, 2
  br i1 %t432, label %argok87, label %arityerr86
arityerr86:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok87:
  %t433 = call i64 @rt_null_p(i64 %a1)
  %t434 = icmp ne i64 %t433, 1
  br i1 %t434, label %then88, label %else89
then88:
  ret i64 1
else89:
  %t435 = call i64 @rt_car(i64 %a1)
  %t436 = call i64 @rt_car(i64 %t435)
  %t437 = call i64 @rt_eq_p(i64 %a0, i64 %t436)
  %t438 = icmp ne i64 %t437, 1
  br i1 %t438, label %then90, label %else91
then90:
  %t439 = call i64 @rt_car(i64 %a1)
  ret i64 %t439
else91:
  %t440 = call i64 @rt_cdr(i64 %a1)
  %t441 = load i64, ptr @"scheme.base:assq"
  %t442 = and i64 %t441, -8
  %t443 = inttoptr i64 %t442 to ptr
  %t444 = load i64, ptr %t443
  %t445 = inttoptr i64 %t444 to ptr
  %t446 = musttail call fastcc i64 %t445(i64 %t441, i64 2, i64 %a0, i64 %t440, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t446
}

define fastcc i64 @"scheme.base:code_110"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t451 = icmp eq i64 %argc, 2
  br i1 %t451, label %argok93, label %arityerr92
arityerr92:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok93:
  %t452 = call i64 @rt_null_p(i64 %a1)
  %t453 = icmp ne i64 %t452, 1
  br i1 %t453, label %then94, label %else95
then94:
  ret i64 1
else95:
  %t454 = call i64 @rt_car(i64 %a1)
  %t455 = call i64 @rt_equal(i64 %a0, i64 %t454)
  %t456 = icmp ne i64 %t455, 1
  br i1 %t456, label %then96, label %else97
then96:
  ret i64 %a1
else97:
  %t457 = call i64 @rt_cdr(i64 %a1)
  %t458 = load i64, ptr @"scheme.base:member"
  %t459 = and i64 %t458, -8
  %t460 = inttoptr i64 %t459 to ptr
  %t461 = load i64, ptr %t460
  %t462 = inttoptr i64 %t461 to ptr
  %t463 = musttail call fastcc i64 %t462(i64 %t458, i64 2, i64 %a0, i64 %t457, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t463
}

define fastcc i64 @"scheme.base:code_114"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t468 = icmp eq i64 %argc, 2
  br i1 %t468, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok99:
  %t469 = call i64 @rt_null_p(i64 %a1)
  %t470 = icmp ne i64 %t469, 1
  br i1 %t470, label %then100, label %else101
then100:
  ret i64 1
else101:
  %t471 = call i64 @rt_car(i64 %a1)
  %t472 = call i64 @rt_car(i64 %t471)
  %t473 = call i64 @rt_equal(i64 %a0, i64 %t472)
  %t474 = icmp ne i64 %t473, 1
  br i1 %t474, label %then102, label %else103
then102:
  %t475 = call i64 @rt_car(i64 %a1)
  ret i64 %t475
else103:
  %t476 = call i64 @rt_cdr(i64 %a1)
  %t477 = load i64, ptr @"scheme.base:assoc"
  %t478 = and i64 %t477, -8
  %t479 = inttoptr i64 %t478 to ptr
  %t480 = load i64, ptr %t479
  %t481 = inttoptr i64 %t480 to ptr
  %t482 = musttail call fastcc i64 %t481(i64 %t477, i64 2, i64 %a0, i64 %t476, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t482
}

define fastcc i64 @"scheme.base:code_118"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t487 = icmp eq i64 %argc, 2
  br i1 %t487, label %argok105, label %arityerr104
arityerr104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok105:
  %t488 = call i64 @rt_null_p(i64 %a1)
  %t489 = icmp ne i64 %t488, 1
  br i1 %t489, label %then106, label %else107
then106:
  ret i64 2
else107:
  %t490 = call i64 @rt_car(i64 %a1)
  %t491 = and i64 %a0, -8
  %t492 = inttoptr i64 %t491 to ptr
  %t493 = load i64, ptr %t492
  %t494 = inttoptr i64 %t493 to ptr
  %t495 = call fastcc i64%t494(i64 %a0, i64 1, i64 %t490, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t496 = icmp ne i64 %t495, 1
  br i1 %t496, label %then108, label %else109
then108:
  %t497 = call i64 @rt_car(i64 %a1)
  %t498 = call i64 @rt_cdr(i64 %a1)
  %t499 = load i64, ptr @"scheme.base:filter"
  %t500 = and i64 %t499, -8
  %t501 = inttoptr i64 %t500 to ptr
  %t502 = load i64, ptr %t501
  %t503 = inttoptr i64 %t502 to ptr
  %t504 = call fastcc i64%t503(i64 %t499, i64 2, i64 %a0, i64 %t498, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t505 = call i64 @rt_cons(i64 %t497, i64 %t504)
  ret i64 %t505
else109:
  %t506 = call i64 @rt_cdr(i64 %a1)
  %t507 = load i64, ptr @"scheme.base:filter"
  %t508 = and i64 %t507, -8
  %t509 = inttoptr i64 %t508 to ptr
  %t510 = load i64, ptr %t509
  %t511 = inttoptr i64 %t510 to ptr
  %t512 = musttail call fastcc i64 %t511(i64 %t507, i64 2, i64 %a0, i64 %t506, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t512
}

define fastcc i64 @"scheme.base:code_123"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t517 = icmp eq i64 %argc, 3
  br i1 %t517, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok111:
  %t518 = call i64 @rt_null_p(i64 %a2)
  %t519 = icmp ne i64 %t518, 1
  br i1 %t519, label %then112, label %else113
then112:
  ret i64 %a1
else113:
  %t520 = call i64 @rt_car(i64 %a2)
  %t521 = and i64 %a0, -8
  %t522 = inttoptr i64 %t521 to ptr
  %t523 = load i64, ptr %t522
  %t524 = inttoptr i64 %t523 to ptr
  %t525 = call fastcc i64%t524(i64 %a0, i64 2, i64 %a1, i64 %t520, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t526 = call i64 @rt_cdr(i64 %a2)
  %t527 = load i64, ptr @"scheme.base:fold-left"
  %t528 = and i64 %t527, -8
  %t529 = inttoptr i64 %t528 to ptr
  %t530 = load i64, ptr %t529
  %t531 = inttoptr i64 %t530 to ptr
  %t532 = musttail call fastcc i64 %t531(i64 %t527, i64 3, i64 %a0, i64 %t525, i64 %t526, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t532
}

define fastcc i64 @"scheme.base:code_128"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t537 = icmp eq i64 %argc, 3
  br i1 %t537, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok115:
  %t538 = call i64 @rt_null_p(i64 %a2)
  %t539 = icmp ne i64 %t538, 1
  br i1 %t539, label %then116, label %else117
then116:
  ret i64 %a1
else117:
  %t540 = call i64 @rt_car(i64 %a2)
  %t541 = call i64 @rt_cdr(i64 %a2)
  %t542 = load i64, ptr @"scheme.base:fold-right"
  %t543 = and i64 %t542, -8
  %t544 = inttoptr i64 %t543 to ptr
  %t545 = load i64, ptr %t544
  %t546 = inttoptr i64 %t545 to ptr
  %t547 = call fastcc i64%t546(i64 %t542, i64 3, i64 %a0, i64 %a1, i64 %t541, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t548 = and i64 %a0, -8
  %t549 = inttoptr i64 %t548 to ptr
  %t550 = load i64, ptr %t549
  %t551 = inttoptr i64 %t550 to ptr
  %t552 = musttail call fastcc i64 %t551(i64 %a0, i64 2, i64 %t540, i64 %t547, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t552
}

define fastcc i64 @"scheme.base:code_132"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t557 = icmp eq i64 %argc, 2
  br i1 %t557, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t558 = call i64 @rt_null_p(i64 %a1)
  %t559 = icmp ne i64 %t558, 1
  br i1 %t559, label %then120, label %else121
then120:
  %t560 = icmp ne i64 1, 1
  br i1 %t560, label %then122, label %else123
then122:
  ret i64 1
else123:
  ret i64 1
else121:
  %t561 = call i64 @rt_car(i64 %a1)
  %t562 = and i64 %a0, -8
  %t563 = inttoptr i64 %t562 to ptr
  %t564 = load i64, ptr %t563
  %t565 = inttoptr i64 %t564 to ptr
  %t566 = call fastcc i64%t565(i64 %a0, i64 1, i64 %t561, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t567 = call i64 @rt_cdr(i64 %a1)
  %t568 = load i64, ptr @"scheme.base:%for-each1"
  %t569 = and i64 %t568, -8
  %t570 = inttoptr i64 %t569 to ptr
  %t571 = load i64, ptr %t570
  %t572 = inttoptr i64 %t571 to ptr
  %t573 = musttail call fastcc i64 %t572(i64 %t568, i64 2, i64 %a0, i64 %t567, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t573
}

define fastcc i64 @"scheme.base:code_140"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t578 = icmp eq i64 %argc, 1
  br i1 %t578, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok125:
  %t579 = call i64 @rt_car(i64 %a0)
  ret i64 %t579
}

define fastcc i64 @"scheme.base:code_142"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t580 = icmp eq i64 %argc, 1
  br i1 %t580, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok127:
  %t581 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t581
}

define fastcc i64 @"scheme.base:code_138"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t582 = icmp eq i64 %argc, 2
  br i1 %t582, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t583 = load i64, ptr @"scheme.base:%any-null?"
  %t584 = and i64 %t583, -8
  %t585 = inttoptr i64 %t584 to ptr
  %t586 = load i64, ptr %t585
  %t587 = inttoptr i64 %t586 to ptr
  %t588 = call fastcc i64%t587(i64 %t583, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t589 = icmp ne i64 %t588, 1
  br i1 %t589, label %then130, label %else131
then130:
  %t590 = icmp ne i64 1, 1
  br i1 %t590, label %then132, label %else133
then132:
  ret i64 1
else133:
  ret i64 1
else131:
  %t591 = call i64 @rt_alloc_words(i64 1)
  %t592 = inttoptr i64 %t591 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_140" to i64), ptr %t592
  %t593 = or i64 %t591, 4
  %t594 = load i64, ptr @"scheme.base:%map1"
  %t595 = and i64 %t594, -8
  %t596 = inttoptr i64 %t595 to ptr
  %t597 = load i64, ptr %t596
  %t598 = inttoptr i64 %t597 to ptr
  %t599 = call fastcc i64%t598(i64 %t594, i64 2, i64 %t593, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t600 = and i64 %a0, -8
  %t601 = inttoptr i64 %t600 to ptr
  %t602 = load i64, ptr %t601
  %t603 = inttoptr i64 %t602 to ptr
  %t604 = call i64 @rt_list_length(i64 %t599)
  %t605 = add i64 0, %t604
  %t606 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t599, i64 8)
  %t618 = getelementptr i64, ptr %t606, i64 0
  %t610 = load i64, ptr %t618
  %t619 = getelementptr i64, ptr %t606, i64 1
  %t611 = load i64, ptr %t619
  %t620 = getelementptr i64, ptr %t606, i64 2
  %t612 = load i64, ptr %t620
  %t621 = getelementptr i64, ptr %t606, i64 3
  %t613 = load i64, ptr %t621
  %t622 = getelementptr i64, ptr %t606, i64 4
  %t614 = load i64, ptr %t622
  %t623 = getelementptr i64, ptr %t606, i64 5
  %t615 = load i64, ptr %t623
  %t624 = getelementptr i64, ptr %t606, i64 6
  %t616 = load i64, ptr %t624
  %t625 = getelementptr i64, ptr %t606, i64 7
  %t617 = load i64, ptr %t625
  %t607 = icmp sgt i64 %t605, 8
  %t608 = getelementptr i64, ptr %t606, i64 8
  %t609 = select i1 %t607, ptr %t608, ptr null
  %t626 = call fastcc i64%t603(i64 %a0, i64 %t605, i64 %t610, i64 %t611, i64 %t612, i64 %t613, i64 %t614, i64 %t615, i64 %t616, i64 %t617, ptr %t609)
  %t627 = call i64 @rt_alloc_words(i64 1)
  %t628 = inttoptr i64 %t627 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_142" to i64), ptr %t628
  %t629 = or i64 %t627, 4
  %t630 = load i64, ptr @"scheme.base:%map1"
  %t631 = and i64 %t630, -8
  %t632 = inttoptr i64 %t631 to ptr
  %t633 = load i64, ptr %t632
  %t634 = inttoptr i64 %t633 to ptr
  %t635 = call fastcc i64%t634(i64 %t630, i64 2, i64 %t629, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t636 = load i64, ptr @"scheme.base:%for-eachn"
  %t637 = and i64 %t636, -8
  %t638 = inttoptr i64 %t637 to ptr
  %t639 = load i64, ptr %t638
  %t640 = inttoptr i64 %t639 to ptr
  %t641 = musttail call fastcc i64 %t640(i64 %t636, i64 2, i64 %a0, i64 %t635, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t641
}

define fastcc i64 @"scheme.base:code_147"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t646 = icmp sge i64 %argc, 2
  br i1 %t646, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok135:
  %t647 = call i64 @rt_alloc_words(i64 8)
  %t648 = inttoptr i64 %t647 to ptr
  %t649 = getelementptr i64, ptr %t648, i64 0
  store i64 %a0, ptr %t649
  %t650 = getelementptr i64, ptr %t648, i64 1
  store i64 %a1, ptr %t650
  %t651 = getelementptr i64, ptr %t648, i64 2
  store i64 %a2, ptr %t651
  %t652 = getelementptr i64, ptr %t648, i64 3
  store i64 %a3, ptr %t652
  %t653 = getelementptr i64, ptr %t648, i64 4
  store i64 %a4, ptr %t653
  %t654 = getelementptr i64, ptr %t648, i64 5
  store i64 %a5, ptr %t654
  %t655 = getelementptr i64, ptr %t648, i64 6
  store i64 %a6, ptr %t655
  %t656 = getelementptr i64, ptr %t648, i64 7
  store i64 %a7, ptr %t656
  %t657 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t648, ptr %overflow)
  %t658 = call i64 @rt_null_p(i64 %t657)
  %t659 = icmp ne i64 %t658, 1
  br i1 %t659, label %then136, label %else137
then136:
  %t660 = load i64, ptr @"scheme.base:%for-each1"
  %t661 = and i64 %t660, -8
  %t662 = inttoptr i64 %t661 to ptr
  %t663 = load i64, ptr %t662
  %t664 = inttoptr i64 %t663 to ptr
  %t665 = musttail call fastcc i64 %t664(i64 %t660, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t665
else137:
  %t666 = call i64 @rt_cons(i64 %a1, i64 %t657)
  %t667 = load i64, ptr @"scheme.base:%for-eachn"
  %t668 = and i64 %t667, -8
  %t669 = inttoptr i64 %t668 to ptr
  %t670 = load i64, ptr %t669
  %t671 = inttoptr i64 %t670 to ptr
  %t672 = musttail call fastcc i64 %t671(i64 %t667, i64 2, i64 %a0, i64 %t666, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t672
}

define fastcc i64 @"scheme.base:code_151"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t677 = icmp eq i64 %argc, 2
  br i1 %t677, label %argok139, label %arityerr138
arityerr138:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok139:
  %t678 = call i64 @rt_null_p(i64 %a1)
  %t679 = icmp ne i64 %t678, 1
  br i1 %t679, label %then140, label %else141
then140:
  ret i64 257
else141:
  %t680 = call i64 @rt_car(i64 %a1)
  %t681 = and i64 %a0, -8
  %t682 = inttoptr i64 %t681 to ptr
  %t683 = load i64, ptr %t682
  %t684 = inttoptr i64 %t683 to ptr
  %t685 = call fastcc i64%t684(i64 %a0, i64 1, i64 %t680, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t686 = icmp ne i64 %t685, 1
  br i1 %t686, label %then142, label %else143
then142:
  %t687 = call i64 @rt_cdr(i64 %a1)
  %t688 = load i64, ptr @"scheme.base:andmap"
  %t689 = and i64 %t688, -8
  %t690 = inttoptr i64 %t689 to ptr
  %t691 = load i64, ptr %t690
  %t692 = inttoptr i64 %t691 to ptr
  %t693 = musttail call fastcc i64 %t692(i64 %t688, i64 2, i64 %a0, i64 %t687, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t693
else143:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_155"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t698 = icmp eq i64 %argc, 2
  br i1 %t698, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok145:
  %t699 = call i64 @rt_null_p(i64 %a1)
  %t700 = icmp ne i64 %t699, 1
  br i1 %t700, label %then146, label %else147
then146:
  ret i64 1
else147:
  %t701 = call i64 @rt_car(i64 %a1)
  %t702 = and i64 %a0, -8
  %t703 = inttoptr i64 %t702 to ptr
  %t704 = load i64, ptr %t703
  %t705 = inttoptr i64 %t704 to ptr
  %t706 = call fastcc i64%t705(i64 %a0, i64 1, i64 %t701, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t707 = icmp ne i64 %t706, 1
  br i1 %t707, label %then148, label %else149
then148:
  ret i64 %a1
else149:
  %t708 = call i64 @rt_cdr(i64 %a1)
  %t709 = load i64, ptr @"scheme.base:memp"
  %t710 = and i64 %t709, -8
  %t711 = inttoptr i64 %t710 to ptr
  %t712 = load i64, ptr %t711
  %t713 = inttoptr i64 %t712 to ptr
  %t714 = musttail call fastcc i64 %t713(i64 %t709, i64 2, i64 %a0, i64 %t708, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t714
}

define fastcc i64 @"scheme.base:code_158"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t719 = icmp eq i64 %argc, 1
  br i1 %t719, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok151:
  %t720 = load i64, ptr @"scheme.base:cdddr"
  %t721 = and i64 %t720, -8
  %t722 = inttoptr i64 %t721 to ptr
  %t723 = load i64, ptr %t722
  %t724 = inttoptr i64 %t723 to ptr
  %t725 = call fastcc i64%t724(i64 %t720, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t726 = call i64 @rt_car(i64 %t725)
  ret i64 %t726
}

define fastcc i64 @"scheme.base:code_161"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t731 = icmp eq i64 %argc, 1
  br i1 %t731, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok153:
  %t732 = call i64 @rt_null_p(i64 %a0)
  %t733 = icmp ne i64 %t732, 1
  br i1 %t733, label %then154, label %else155
then154:
  ret i64 257
else155:
  %t734 = call i64 @rt_pair_p(i64 %a0)
  %t735 = icmp ne i64 %t734, 1
  br i1 %t735, label %then156, label %else157
then156:
  %t736 = call i64 @rt_cdr(i64 %a0)
  %t737 = load i64, ptr @"scheme.base:list?"
  %t738 = and i64 %t737, -8
  %t739 = inttoptr i64 %t738 to ptr
  %t740 = load i64, ptr %t739
  %t741 = inttoptr i64 %t740 to ptr
  %t742 = musttail call fastcc i64 %t741(i64 %t737, i64 1, i64 %t736, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t742
else157:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_168"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t747 = icmp eq i64 %argc, 1
  br i1 %t747, label %argok159, label %arityerr158
arityerr158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok159:
  %t748 = or i64 %a0, 0
  %t749 = and i64 %t748, 7
  %t750 = icmp eq i64 %t749, 0
  br i1 %t750, label %fixfast160, label %fixslow161
fixfast160:
  %t751 = icmp eq i64 %a0, 0
  %t752 = select i1 %t751, i64 257, i64 1
  br label %fixmerge162
fixslow161:
  %t753 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge162
fixmerge162:
  %t754 = phi i64 [ %t752, %fixfast160 ], [ %t753, %fixslow161 ]
  ret i64 %t754
}

define fastcc i64 @"scheme.base:code_172"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t759 = icmp eq i64 %argc, 2
  br i1 %t759, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok164:
  %t760 = load i64, ptr @"scheme.base:zero?"
  %t761 = and i64 %t760, -8
  %t762 = inttoptr i64 %t761 to ptr
  %t763 = load i64, ptr %t762
  %t764 = inttoptr i64 %t763 to ptr
  %t765 = call fastcc i64%t764(i64 %t760, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t766 = icmp ne i64 %t765, 1
  br i1 %t766, label %then165, label %else166
then165:
  ret i64 %a0
else166:
  %t767 = call i64 @rt_cdr(i64 %a0)
  %t768 = or i64 %a1, 8
  %t769 = and i64 %t768, 7
  %t770 = icmp eq i64 %t769, 0
  br i1 %t770, label %fixfast167, label %fixslow168
fixfast167:
  %t771 = sub i64 %a1, 8
  br label %fixmerge169
fixslow168:
  %t772 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge169
fixmerge169:
  %t773 = phi i64 [ %t771, %fixfast167 ], [ %t772, %fixslow168 ]
  %t774 = load i64, ptr @"scheme.base:list-tail"
  %t775 = and i64 %t774, -8
  %t776 = inttoptr i64 %t775 to ptr
  %t777 = load i64, ptr %t776
  %t778 = inttoptr i64 %t777 to ptr
  %t779 = musttail call fastcc i64 %t778(i64 %t774, i64 2, i64 %t767, i64 %t773, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t779
}

define fastcc i64 @"scheme.base:code_176"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t784 = icmp eq i64 %argc, 2
  br i1 %t784, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
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
  br i1 %t796, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok173:
  %t797 = load i64, ptr @"scheme.base:zero?"
  %t798 = and i64 %t797, -8
  %t799 = inttoptr i64 %t798 to ptr
  %t800 = load i64, ptr %t799
  %t801 = inttoptr i64 %t800 to ptr
  %t802 = call fastcc i64%t801(i64 %t797, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t803 = icmp ne i64 %t802, 1
  br i1 %t803, label %then174, label %else175
then174:
  ret i64 2
else175:
  %t804 = call i64 @rt_car(i64 %a0)
  %t805 = call i64 @rt_cdr(i64 %a0)
  %t806 = or i64 %a1, 8
  %t807 = and i64 %t806, 7
  %t808 = icmp eq i64 %t807, 0
  br i1 %t808, label %fixfast176, label %fixslow177
fixfast176:
  %t809 = sub i64 %a1, 8
  br label %fixmerge178
fixslow177:
  %t810 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge178
fixmerge178:
  %t811 = phi i64 [ %t809, %fixfast176 ], [ %t810, %fixslow177 ]
  %t812 = load i64, ptr @"scheme.base:list-head"
  %t813 = and i64 %t812, -8
  %t814 = inttoptr i64 %t813 to ptr
  %t815 = load i64, ptr %t814
  %t816 = inttoptr i64 %t815 to ptr
  %t817 = call fastcc i64%t816(i64 %t812, i64 2, i64 %t805, i64 %t811, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t818 = call i64 @rt_cons(i64 %t804, i64 %t817)
  ret i64 %t818
}

define fastcc i64 @"scheme.base:code_184"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t823 = icmp eq i64 %argc, 2
  br i1 %t823, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t824 = load i64, ptr @"scheme.base:zero?"
  %t825 = and i64 %t824, -8
  %t826 = inttoptr i64 %t825 to ptr
  %t827 = load i64, ptr %t826
  %t828 = inttoptr i64 %t827 to ptr
  %t829 = call fastcc i64%t828(i64 %t824, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t830 = icmp ne i64 %t829, 1
  br i1 %t830, label %then181, label %else182
then181:
  ret i64 2
else182:
  %t831 = or i64 %a0, 8
  %t832 = and i64 %t831, 7
  %t833 = icmp eq i64 %t832, 0
  br i1 %t833, label %fixfast183, label %fixslow184
fixfast183:
  %t834 = sub i64 %a0, 8
  br label %fixmerge185
fixslow184:
  %t835 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge185
fixmerge185:
  %t836 = phi i64 [ %t834, %fixfast183 ], [ %t835, %fixslow184 ]
  %t837 = load i64, ptr @"scheme.base:make-list"
  %t838 = and i64 %t837, -8
  %t839 = inttoptr i64 %t838 to ptr
  %t840 = load i64, ptr %t839
  %t841 = inttoptr i64 %t840 to ptr
  %t842 = call fastcc i64%t841(i64 %t837, i64 2, i64 %t836, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t843 = call i64 @rt_cons(i64 %a1, i64 %t842)
  ret i64 %t843
}

define fastcc i64 @"scheme.base:code_196"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t848 = icmp eq i64 %argc, 2
  br i1 %t848, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t849 = and i64 %self, -8
  %t850 = inttoptr i64 %t849 to ptr
  %t851 = getelementptr i64, ptr %t850, i64 1
  %t852 = load i64, ptr %t851
  %t853 = or i64 %a0, %t852
  %t854 = and i64 %t853, 7
  %t855 = icmp eq i64 %t854, 0
  br i1 %t855, label %fixfast188, label %fixslow189
fixfast188:
  %t856 = icmp eq i64 %a0, %t852
  %t857 = select i1 %t856, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t858 = call i64 @rt_num_eq(i64 %a0, i64 %t852)
  br label %fixmerge190
fixmerge190:
  %t859 = phi i64 [ %t857, %fixfast188 ], [ %t858, %fixslow189 ]
  %t860 = icmp ne i64 %t859, 1
  br i1 %t860, label %then191, label %else192
then191:
  %t861 = load i64, ptr @"scheme.base:reverse"
  %t862 = and i64 %t861, -8
  %t863 = inttoptr i64 %t862 to ptr
  %t864 = load i64, ptr %t863
  %t865 = inttoptr i64 %t864 to ptr
  %t866 = musttail call fastcc i64 %t865(i64 %t861, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t866
else192:
  %t867 = or i64 %a0, 8
  %t868 = and i64 %t867, 7
  %t869 = icmp eq i64 %t868, 0
  br i1 %t869, label %fixfast193, label %fixslow194
fixfast193:
  %t870 = add i64 %a0, 8
  br label %fixmerge195
fixslow194:
  %t871 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge195
fixmerge195:
  %t872 = phi i64 [ %t870, %fixfast193 ], [ %t871, %fixslow194 ]
  %t873 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t874 = musttail call fastcc i64 @"scheme.base:code_196"(i64 %self, i64 2, i64 %t872, i64 %t873, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t874
}

define fastcc i64 @"scheme.base:code_194"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t875 = icmp eq i64 %argc, 1
  br i1 %t875, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok197:
  %t876 = call i64 @rt_alloc_words(i64 3)
  %t877 = inttoptr i64 %t876 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_196" to i64), ptr %t877
  %t878 = or i64 %t876, 4
  %t879 = getelementptr i64, ptr %t877, i64 1
  store i64 %a0, ptr %t879
  %t880 = getelementptr i64, ptr %t877, i64 2
  store i64 %t878, ptr %t880
  %t881 = and i64 %t878, -8
  %t882 = inttoptr i64 %t881 to ptr
  %t883 = load i64, ptr %t882
  %t884 = inttoptr i64 %t883 to ptr
  %t885 = musttail call fastcc i64 %t884(i64 %t878, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t885
}

define fastcc i64 @"scheme.base:code_204"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t890 = icmp eq i64 %argc, 2
  br i1 %t890, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok199:
  %t891 = or i64 %a0, %a1
  %t892 = and i64 %t891, 7
  %t893 = icmp eq i64 %t892, 0
  br i1 %t893, label %fixfast200, label %fixslow201
fixfast200:
  %t894 = icmp slt i64 %a0, %a1
  %t895 = select i1 %t894, i64 257, i64 1
  br label %fixmerge202
fixslow201:
  %t896 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge202
fixmerge202:
  %t897 = phi i64 [ %t895, %fixfast200 ], [ %t896, %fixslow201 ]
  %t898 = icmp ne i64 %t897, 1
  br i1 %t898, label %then203, label %else204
then203:
  ret i64 %a1
else204:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_206"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t903 = icmp eq i64 %argc, 0
  br i1 %t903, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok206:
  %t904 = icmp ne i64 1, 1
  br i1 %t904, label %then207, label %else208
then207:
  ret i64 1
else208:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_209"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t909 = icmp sge i64 %argc, 0
  br i1 %t909, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok210:
  %t910 = call i64 @rt_alloc_words(i64 8)
  %t911 = inttoptr i64 %t910 to ptr
  %t912 = getelementptr i64, ptr %t911, i64 0
  store i64 %a0, ptr %t912
  %t913 = getelementptr i64, ptr %t911, i64 1
  store i64 %a1, ptr %t913
  %t914 = getelementptr i64, ptr %t911, i64 2
  store i64 %a2, ptr %t914
  %t915 = getelementptr i64, ptr %t911, i64 3
  store i64 %a3, ptr %t915
  %t916 = getelementptr i64, ptr %t911, i64 4
  store i64 %a4, ptr %t916
  %t917 = getelementptr i64, ptr %t911, i64 5
  store i64 %a5, ptr %t917
  %t918 = getelementptr i64, ptr %t911, i64 6
  store i64 %a6, ptr %t918
  %t919 = getelementptr i64, ptr %t911, i64 7
  store i64 %a7, ptr %t919
  %t920 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t911, ptr %overflow)
  %t921 = call i64 @rt_list_to_string(i64 %t920)
  ret i64 %t921
}

define fastcc i64 @"scheme.base:code_212"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t926 = icmp eq i64 %argc, 1
  br i1 %t926, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok212:
  %t927 = call i64 @rt_null_p(i64 %a0)
  %t928 = icmp ne i64 %t927, 1
  br i1 %t928, label %then213, label %else214
then213:
  %t929 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t929
else214:
  %t930 = call i64 @rt_car(i64 %a0)
  %t931 = call i64 @rt_cdr(i64 %a0)
  %t932 = load i64, ptr @"scheme.base:%str-concat"
  %t933 = and i64 %t932, -8
  %t934 = inttoptr i64 %t933 to ptr
  %t935 = load i64, ptr %t934
  %t936 = inttoptr i64 %t935 to ptr
  %t937 = call fastcc i64%t936(i64 %t932, i64 1, i64 %t931, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t938 = call i64 @rt_string_append(i64 %t930, i64 %t937)
  ret i64 %t938
}

define fastcc i64 @"scheme.base:code_218"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t943 = icmp eq i64 %argc, 4
  br i1 %t943, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok216:
  %t944 = call i64 @rt_char_to_integer(i64 %a1)
  %t945 = call i64 @rt_char_to_integer(i64 %a2)
  %t946 = and i64 %a0, -8
  %t947 = inttoptr i64 %t946 to ptr
  %t948 = load i64, ptr %t947
  %t949 = inttoptr i64 %t948 to ptr
  %t950 = call fastcc i64%t949(i64 %a0, i64 2, i64 %t944, i64 %t945, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t951 = icmp ne i64 %t950, 1
  br i1 %t951, label %then217, label %else218
then217:
  %t952 = call i64 @rt_null_p(i64 %a3)
  %t953 = icmp ne i64 %t952, 1
  br i1 %t953, label %then219, label %else220
then219:
  ret i64 257
else220:
  %t954 = call i64 @rt_car(i64 %a3)
  %t955 = call i64 @rt_cdr(i64 %a3)
  %t956 = load i64, ptr @"scheme.base:chr-cmp"
  %t957 = and i64 %t956, -8
  %t958 = inttoptr i64 %t957 to ptr
  %t959 = load i64, ptr %t958
  %t960 = inttoptr i64 %t959 to ptr
  %t961 = musttail call fastcc i64 %t960(i64 %t956, i64 4, i64 %a0, i64 %a2, i64 %t954, i64 %t955, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t961
else218:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t966 = icmp eq i64 %argc, 2
  br i1 %t966, label %argok222, label %arityerr221
arityerr221:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok222:
  %t967 = or i64 %a0, %a1
  %t968 = and i64 %t967, 7
  %t969 = icmp eq i64 %t968, 0
  br i1 %t969, label %fixfast223, label %fixslow224
fixfast223:
  %t970 = icmp eq i64 %a0, %a1
  %t971 = select i1 %t970, i64 257, i64 1
  br label %fixmerge225
fixslow224:
  %t972 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge225
fixmerge225:
  %t973 = phi i64 [ %t971, %fixfast223 ], [ %t972, %fixslow224 ]
  ret i64 %t973
}

define fastcc i64 @"scheme.base:code_229"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t974 = icmp sge i64 %argc, 2
  br i1 %t974, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok227:
  %t975 = call i64 @rt_alloc_words(i64 8)
  %t976 = inttoptr i64 %t975 to ptr
  %t977 = getelementptr i64, ptr %t976, i64 0
  store i64 %a0, ptr %t977
  %t978 = getelementptr i64, ptr %t976, i64 1
  store i64 %a1, ptr %t978
  %t979 = getelementptr i64, ptr %t976, i64 2
  store i64 %a2, ptr %t979
  %t980 = getelementptr i64, ptr %t976, i64 3
  store i64 %a3, ptr %t980
  %t981 = getelementptr i64, ptr %t976, i64 4
  store i64 %a4, ptr %t981
  %t982 = getelementptr i64, ptr %t976, i64 5
  store i64 %a5, ptr %t982
  %t983 = getelementptr i64, ptr %t976, i64 6
  store i64 %a6, ptr %t983
  %t984 = getelementptr i64, ptr %t976, i64 7
  store i64 %a7, ptr %t984
  %t985 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t976, ptr %overflow)
  %t986 = call i64 @rt_alloc_words(i64 1)
  %t987 = inttoptr i64 %t986 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t987
  %t988 = or i64 %t986, 4
  %t989 = load i64, ptr @"scheme.base:chr-cmp"
  %t990 = and i64 %t989, -8
  %t991 = inttoptr i64 %t990 to ptr
  %t992 = load i64, ptr %t991
  %t993 = inttoptr i64 %t992 to ptr
  %t994 = musttail call fastcc i64 %t993(i64 %t989, i64 4, i64 %t988, i64 %a0, i64 %a1, i64 %t985, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t994
}

define fastcc i64 @"scheme.base:code_244"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t999 = icmp eq i64 %argc, 2
  br i1 %t999, label %argok229, label %arityerr228
arityerr228:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok229:
  %t1000 = or i64 %a0, %a1
  %t1001 = and i64 %t1000, 7
  %t1002 = icmp eq i64 %t1001, 0
  br i1 %t1002, label %fixfast230, label %fixslow231
fixfast230:
  %t1003 = icmp slt i64 %a0, %a1
  %t1004 = select i1 %t1003, i64 257, i64 1
  br label %fixmerge232
fixslow231:
  %t1005 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge232
fixmerge232:
  %t1006 = phi i64 [ %t1004, %fixfast230 ], [ %t1005, %fixslow231 ]
  ret i64 %t1006
}

define fastcc i64 @"scheme.base:code_242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1007 = icmp sge i64 %argc, 2
  br i1 %t1007, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok234:
  %t1008 = call i64 @rt_alloc_words(i64 8)
  %t1009 = inttoptr i64 %t1008 to ptr
  %t1010 = getelementptr i64, ptr %t1009, i64 0
  store i64 %a0, ptr %t1010
  %t1011 = getelementptr i64, ptr %t1009, i64 1
  store i64 %a1, ptr %t1011
  %t1012 = getelementptr i64, ptr %t1009, i64 2
  store i64 %a2, ptr %t1012
  %t1013 = getelementptr i64, ptr %t1009, i64 3
  store i64 %a3, ptr %t1013
  %t1014 = getelementptr i64, ptr %t1009, i64 4
  store i64 %a4, ptr %t1014
  %t1015 = getelementptr i64, ptr %t1009, i64 5
  store i64 %a5, ptr %t1015
  %t1016 = getelementptr i64, ptr %t1009, i64 6
  store i64 %a6, ptr %t1016
  %t1017 = getelementptr i64, ptr %t1009, i64 7
  store i64 %a7, ptr %t1017
  %t1018 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1009, ptr %overflow)
  %t1019 = call i64 @rt_alloc_words(i64 1)
  %t1020 = inttoptr i64 %t1019 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_244" to i64), ptr %t1020
  %t1021 = or i64 %t1019, 4
  %t1022 = load i64, ptr @"scheme.base:chr-cmp"
  %t1023 = and i64 %t1022, -8
  %t1024 = inttoptr i64 %t1023 to ptr
  %t1025 = load i64, ptr %t1024
  %t1026 = inttoptr i64 %t1025 to ptr
  %t1027 = musttail call fastcc i64 %t1026(i64 %t1022, i64 4, i64 %t1021, i64 %a0, i64 %a1, i64 %t1018, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1027
}

define fastcc i64 @"scheme.base:code_257"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1032 = icmp eq i64 %argc, 2
  br i1 %t1032, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok236:
  %t1033 = or i64 %a1, %a0
  %t1034 = and i64 %t1033, 7
  %t1035 = icmp eq i64 %t1034, 0
  br i1 %t1035, label %fixfast237, label %fixslow238
fixfast237:
  %t1036 = icmp slt i64 %a1, %a0
  %t1037 = select i1 %t1036, i64 257, i64 1
  br label %fixmerge239
fixslow238:
  %t1038 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge239
fixmerge239:
  %t1039 = phi i64 [ %t1037, %fixfast237 ], [ %t1038, %fixslow238 ]
  ret i64 %t1039
}

define fastcc i64 @"scheme.base:code_255"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1040 = icmp sge i64 %argc, 2
  br i1 %t1040, label %argok241, label %arityerr240
arityerr240:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok241:
  %t1041 = call i64 @rt_alloc_words(i64 8)
  %t1042 = inttoptr i64 %t1041 to ptr
  %t1043 = getelementptr i64, ptr %t1042, i64 0
  store i64 %a0, ptr %t1043
  %t1044 = getelementptr i64, ptr %t1042, i64 1
  store i64 %a1, ptr %t1044
  %t1045 = getelementptr i64, ptr %t1042, i64 2
  store i64 %a2, ptr %t1045
  %t1046 = getelementptr i64, ptr %t1042, i64 3
  store i64 %a3, ptr %t1046
  %t1047 = getelementptr i64, ptr %t1042, i64 4
  store i64 %a4, ptr %t1047
  %t1048 = getelementptr i64, ptr %t1042, i64 5
  store i64 %a5, ptr %t1048
  %t1049 = getelementptr i64, ptr %t1042, i64 6
  store i64 %a6, ptr %t1049
  %t1050 = getelementptr i64, ptr %t1042, i64 7
  store i64 %a7, ptr %t1050
  %t1051 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1042, ptr %overflow)
  %t1052 = call i64 @rt_alloc_words(i64 1)
  %t1053 = inttoptr i64 %t1052 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_257" to i64), ptr %t1053
  %t1054 = or i64 %t1052, 4
  %t1055 = load i64, ptr @"scheme.base:chr-cmp"
  %t1056 = and i64 %t1055, -8
  %t1057 = inttoptr i64 %t1056 to ptr
  %t1058 = load i64, ptr %t1057
  %t1059 = inttoptr i64 %t1058 to ptr
  %t1060 = musttail call fastcc i64 %t1059(i64 %t1055, i64 4, i64 %t1054, i64 %a0, i64 %a1, i64 %t1051, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1060
}

define fastcc i64 @"scheme.base:code_270"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1065 = icmp eq i64 %argc, 2
  br i1 %t1065, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok243:
  %t1066 = or i64 %a0, %a1
  %t1067 = and i64 %t1066, 7
  %t1068 = icmp eq i64 %t1067, 0
  br i1 %t1068, label %fixfast244, label %fixslow245
fixfast244:
  %t1069 = icmp slt i64 %a0, %a1
  %t1070 = select i1 %t1069, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1071 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge246
fixmerge246:
  %t1072 = phi i64 [ %t1070, %fixfast244 ], [ %t1071, %fixslow245 ]
  %t1073 = icmp ne i64 %t1072, 1
  br i1 %t1073, label %then247, label %else248
then247:
  ret i64 257
else248:
  %t1074 = or i64 %a0, %a1
  %t1075 = and i64 %t1074, 7
  %t1076 = icmp eq i64 %t1075, 0
  br i1 %t1076, label %fixfast249, label %fixslow250
fixfast249:
  %t1077 = icmp eq i64 %a0, %a1
  %t1078 = select i1 %t1077, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1079 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge251
fixmerge251:
  %t1080 = phi i64 [ %t1078, %fixfast249 ], [ %t1079, %fixslow250 ]
  ret i64 %t1080
}

define fastcc i64 @"scheme.base:code_268"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1081 = icmp sge i64 %argc, 2
  br i1 %t1081, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok253:
  %t1082 = call i64 @rt_alloc_words(i64 8)
  %t1083 = inttoptr i64 %t1082 to ptr
  %t1084 = getelementptr i64, ptr %t1083, i64 0
  store i64 %a0, ptr %t1084
  %t1085 = getelementptr i64, ptr %t1083, i64 1
  store i64 %a1, ptr %t1085
  %t1086 = getelementptr i64, ptr %t1083, i64 2
  store i64 %a2, ptr %t1086
  %t1087 = getelementptr i64, ptr %t1083, i64 3
  store i64 %a3, ptr %t1087
  %t1088 = getelementptr i64, ptr %t1083, i64 4
  store i64 %a4, ptr %t1088
  %t1089 = getelementptr i64, ptr %t1083, i64 5
  store i64 %a5, ptr %t1089
  %t1090 = getelementptr i64, ptr %t1083, i64 6
  store i64 %a6, ptr %t1090
  %t1091 = getelementptr i64, ptr %t1083, i64 7
  store i64 %a7, ptr %t1091
  %t1092 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1083, ptr %overflow)
  %t1093 = call i64 @rt_alloc_words(i64 1)
  %t1094 = inttoptr i64 %t1093 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_270" to i64), ptr %t1094
  %t1095 = or i64 %t1093, 4
  %t1096 = load i64, ptr @"scheme.base:chr-cmp"
  %t1097 = and i64 %t1096, -8
  %t1098 = inttoptr i64 %t1097 to ptr
  %t1099 = load i64, ptr %t1098
  %t1100 = inttoptr i64 %t1099 to ptr
  %t1101 = musttail call fastcc i64 %t1100(i64 %t1096, i64 4, i64 %t1095, i64 %a0, i64 %a1, i64 %t1092, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1101
}

define fastcc i64 @"scheme.base:code_283"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1106 = icmp eq i64 %argc, 2
  br i1 %t1106, label %argok255, label %arityerr254
arityerr254:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok255:
  %t1107 = or i64 %a1, %a0
  %t1108 = and i64 %t1107, 7
  %t1109 = icmp eq i64 %t1108, 0
  br i1 %t1109, label %fixfast256, label %fixslow257
fixfast256:
  %t1110 = icmp slt i64 %a1, %a0
  %t1111 = select i1 %t1110, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t1112 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge258
fixmerge258:
  %t1113 = phi i64 [ %t1111, %fixfast256 ], [ %t1112, %fixslow257 ]
  %t1114 = icmp ne i64 %t1113, 1
  br i1 %t1114, label %then259, label %else260
then259:
  ret i64 257
else260:
  %t1115 = or i64 %a0, %a1
  %t1116 = and i64 %t1115, 7
  %t1117 = icmp eq i64 %t1116, 0
  br i1 %t1117, label %fixfast261, label %fixslow262
fixfast261:
  %t1118 = icmp eq i64 %a0, %a1
  %t1119 = select i1 %t1118, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1120 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge263
fixmerge263:
  %t1121 = phi i64 [ %t1119, %fixfast261 ], [ %t1120, %fixslow262 ]
  ret i64 %t1121
}

define fastcc i64 @"scheme.base:code_281"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1122 = icmp sge i64 %argc, 2
  br i1 %t1122, label %argok265, label %arityerr264
arityerr264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok265:
  %t1123 = call i64 @rt_alloc_words(i64 8)
  %t1124 = inttoptr i64 %t1123 to ptr
  %t1125 = getelementptr i64, ptr %t1124, i64 0
  store i64 %a0, ptr %t1125
  %t1126 = getelementptr i64, ptr %t1124, i64 1
  store i64 %a1, ptr %t1126
  %t1127 = getelementptr i64, ptr %t1124, i64 2
  store i64 %a2, ptr %t1127
  %t1128 = getelementptr i64, ptr %t1124, i64 3
  store i64 %a3, ptr %t1128
  %t1129 = getelementptr i64, ptr %t1124, i64 4
  store i64 %a4, ptr %t1129
  %t1130 = getelementptr i64, ptr %t1124, i64 5
  store i64 %a5, ptr %t1130
  %t1131 = getelementptr i64, ptr %t1124, i64 6
  store i64 %a6, ptr %t1131
  %t1132 = getelementptr i64, ptr %t1124, i64 7
  store i64 %a7, ptr %t1132
  %t1133 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1124, ptr %overflow)
  %t1134 = call i64 @rt_alloc_words(i64 1)
  %t1135 = inttoptr i64 %t1134 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_283" to i64), ptr %t1135
  %t1136 = or i64 %t1134, 4
  %t1137 = load i64, ptr @"scheme.base:chr-cmp"
  %t1138 = and i64 %t1137, -8
  %t1139 = inttoptr i64 %t1138 to ptr
  %t1140 = load i64, ptr %t1139
  %t1141 = inttoptr i64 %t1140 to ptr
  %t1142 = musttail call fastcc i64 %t1141(i64 %t1137, i64 4, i64 %t1136, i64 %a0, i64 %a1, i64 %t1133, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1142
}

define fastcc i64 @"scheme.base:code_295"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1147 = icmp eq i64 %argc, 2
  br i1 %t1147, label %argok267, label %arityerr266
arityerr266:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok267:
  %t1148 = or i64 %a0, 0
  %t1149 = and i64 %t1148, 7
  %t1150 = icmp eq i64 %t1149, 0
  br i1 %t1150, label %fixfast268, label %fixslow269
fixfast268:
  %t1151 = icmp slt i64 %a0, 0
  %t1152 = select i1 %t1151, i64 257, i64 1
  br label %fixmerge270
fixslow269:
  %t1153 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge270
fixmerge270:
  %t1154 = phi i64 [ %t1152, %fixfast268 ], [ %t1153, %fixslow269 ]
  %t1155 = icmp ne i64 %t1154, 1
  br i1 %t1155, label %then271, label %else272
then271:
  ret i64 %a1
else272:
  %t1156 = or i64 %a0, 8
  %t1157 = and i64 %t1156, 7
  %t1158 = icmp eq i64 %t1157, 0
  br i1 %t1158, label %fixfast273, label %fixslow274
fixfast273:
  %t1159 = sub i64 %a0, 8
  br label %fixmerge275
fixslow274:
  %t1160 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge275
fixmerge275:
  %t1161 = phi i64 [ %t1159, %fixfast273 ], [ %t1160, %fixslow274 ]
  %t1162 = and i64 %self, -8
  %t1163 = inttoptr i64 %t1162 to ptr
  %t1164 = getelementptr i64, ptr %t1163, i64 2
  %t1165 = load i64, ptr %t1164
  %t1166 = call i64 @rt_string_ref(i64 %t1165, i64 %a0)
  %t1167 = call i64 @rt_cons(i64 %t1166, i64 %a1)
  %t1168 = musttail call fastcc i64 @"scheme.base:code_295"(i64 %self, i64 2, i64 %t1161, i64 %t1167, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1168
}

define fastcc i64 @"scheme.base:code_293"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1169 = icmp eq i64 %argc, 1
  br i1 %t1169, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok277:
  %t1170 = call i64 @rt_alloc_words(i64 3)
  %t1171 = inttoptr i64 %t1170 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_295" to i64), ptr %t1171
  %t1172 = or i64 %t1170, 4
  %t1173 = getelementptr i64, ptr %t1171, i64 1
  store i64 %t1172, ptr %t1173
  %t1174 = getelementptr i64, ptr %t1171, i64 2
  store i64 %a0, ptr %t1174
  %t1175 = call i64 @rt_string_length(i64 %a0)
  %t1176 = or i64 %t1175, 8
  %t1177 = and i64 %t1176, 7
  %t1178 = icmp eq i64 %t1177, 0
  br i1 %t1178, label %fixfast278, label %fixslow279
fixfast278:
  %t1179 = sub i64 %t1175, 8
  br label %fixmerge280
fixslow279:
  %t1180 = call i64 @rt_sub(i64 %t1175, i64 8)
  br label %fixmerge280
fixmerge280:
  %t1181 = phi i64 [ %t1179, %fixfast278 ], [ %t1180, %fixslow279 ]
  %t1182 = and i64 %t1172, -8
  %t1183 = inttoptr i64 %t1182 to ptr
  %t1184 = load i64, ptr %t1183
  %t1185 = inttoptr i64 %t1184 to ptr
  %t1186 = musttail call fastcc i64 %t1185(i64 %t1172, i64 2, i64 %t1181, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1186
}

define fastcc i64 @"scheme.base:code_305"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1191 = icmp eq i64 %argc, 2
  br i1 %t1191, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1192 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1193 = or i64 0, %t1192
  %t1194 = and i64 %t1193, 7
  %t1195 = icmp eq i64 %t1194, 0
  br i1 %t1195, label %fixfast283, label %fixslow284
fixfast283:
  %t1196 = sub i64 0, %t1192
  br label %fixmerge285
fixslow284:
  %t1197 = call i64 @rt_sub(i64 0, i64 %t1192)
  br label %fixmerge285
fixmerge285:
  %t1198 = phi i64 [ %t1196, %fixfast283 ], [ %t1197, %fixslow284 ]
  %t1199 = or i64 384, %t1198
  %t1200 = and i64 %t1199, 7
  %t1201 = icmp eq i64 %t1200, 0
  br i1 %t1201, label %fixfast286, label %fixslow287
fixfast286:
  %t1202 = add i64 384, %t1198
  br label %fixmerge288
fixslow287:
  %t1203 = call i64 @rt_add(i64 384, i64 %t1198)
  br label %fixmerge288
fixmerge288:
  %t1204 = phi i64 [ %t1202, %fixfast286 ], [ %t1203, %fixslow287 ]
  %t1205 = call i64 @rt_integer_to_char(i64 %t1204)
  %t1206 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1207 = or i64 %t1206, 0
  %t1208 = and i64 %t1207, 7
  %t1209 = icmp eq i64 %t1208, 0
  br i1 %t1209, label %fixfast289, label %fixslow290
fixfast289:
  %t1210 = icmp eq i64 %t1206, 0
  %t1211 = select i1 %t1210, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1212 = call i64 @rt_num_eq(i64 %t1206, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1213 = phi i64 [ %t1211, %fixfast289 ], [ %t1212, %fixslow290 ]
  %t1214 = icmp ne i64 %t1213, 1
  br i1 %t1214, label %then292, label %else293
then292:
  %t1215 = call i64 @rt_cons(i64 %t1205, i64 %a1)
  ret i64 %t1215
else293:
  %t1216 = call i64 @rt_cons(i64 %t1205, i64 %a1)
  %t1217 = load i64, ptr @"scheme.base:ns-digits"
  %t1218 = and i64 %t1217, -8
  %t1219 = inttoptr i64 %t1218 to ptr
  %t1220 = load i64, ptr %t1219
  %t1221 = inttoptr i64 %t1220 to ptr
  %t1222 = musttail call fastcc i64 %t1221(i64 %t1217, i64 2, i64 %t1206, i64 %t1216, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1222
}

define fastcc i64 @"scheme.base:code_316"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1227 = icmp eq i64 %argc, 1
  br i1 %t1227, label %argok295, label %arityerr294
arityerr294:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok295:
  %t1228 = or i64 %a0, 0
  %t1229 = and i64 %t1228, 7
  %t1230 = icmp eq i64 %t1229, 0
  br i1 %t1230, label %fixfast296, label %fixslow297
fixfast296:
  %t1231 = icmp eq i64 %a0, 0
  %t1232 = select i1 %t1231, i64 257, i64 1
  br label %fixmerge298
fixslow297:
  %t1233 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge298
fixmerge298:
  %t1234 = phi i64 [ %t1232, %fixfast296 ], [ %t1233, %fixslow297 ]
  %t1235 = icmp ne i64 %t1234, 1
  br i1 %t1235, label %then299, label %else300
then299:
  %t1236 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1236
else300:
  %t1237 = or i64 %a0, 0
  %t1238 = and i64 %t1237, 7
  %t1239 = icmp eq i64 %t1238, 0
  br i1 %t1239, label %fixfast301, label %fixslow302
fixfast301:
  %t1240 = icmp slt i64 %a0, 0
  %t1241 = select i1 %t1240, i64 257, i64 1
  br label %fixmerge303
fixslow302:
  %t1242 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge303
fixmerge303:
  %t1243 = phi i64 [ %t1241, %fixfast301 ], [ %t1242, %fixslow302 ]
  %t1244 = icmp ne i64 %t1243, 1
  br i1 %t1244, label %then304, label %else305
then304:
  %t1245 = load i64, ptr @"scheme.base:ns-digits"
  %t1246 = and i64 %t1245, -8
  %t1247 = inttoptr i64 %t1246 to ptr
  %t1248 = load i64, ptr %t1247
  %t1249 = inttoptr i64 %t1248 to ptr
  %t1250 = call fastcc i64%t1249(i64 %t1245, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1251 = call i64 @rt_cons(i64 11529, i64 %t1250)
  %t1252 = call i64 @rt_list_to_string(i64 %t1251)
  ret i64 %t1252
else305:
  %t1253 = or i64 0, %a0
  %t1254 = and i64 %t1253, 7
  %t1255 = icmp eq i64 %t1254, 0
  br i1 %t1255, label %fixfast306, label %fixslow307
fixfast306:
  %t1256 = sub i64 0, %a0
  br label %fixmerge308
fixslow307:
  %t1257 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge308
fixmerge308:
  %t1258 = phi i64 [ %t1256, %fixfast306 ], [ %t1257, %fixslow307 ]
  %t1259 = load i64, ptr @"scheme.base:ns-digits"
  %t1260 = and i64 %t1259, -8
  %t1261 = inttoptr i64 %t1260 to ptr
  %t1262 = load i64, ptr %t1261
  %t1263 = inttoptr i64 %t1262 to ptr
  %t1264 = call fastcc i64%t1263(i64 %t1259, i64 2, i64 %t1258, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1265 = call i64 @rt_list_to_string(i64 %t1264)
  ret i64 %t1265
}

define fastcc i64 @"scheme.base:code_320"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1270 = icmp sge i64 %argc, 1
  br i1 %t1270, label %argok310, label %arityerr309
arityerr309:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok310:
  %t1271 = call i64 @rt_alloc_words(i64 8)
  %t1272 = inttoptr i64 %t1271 to ptr
  %t1273 = getelementptr i64, ptr %t1272, i64 0
  store i64 %a0, ptr %t1273
  %t1274 = getelementptr i64, ptr %t1272, i64 1
  store i64 %a1, ptr %t1274
  %t1275 = getelementptr i64, ptr %t1272, i64 2
  store i64 %a2, ptr %t1275
  %t1276 = getelementptr i64, ptr %t1272, i64 3
  store i64 %a3, ptr %t1276
  %t1277 = getelementptr i64, ptr %t1272, i64 4
  store i64 %a4, ptr %t1277
  %t1278 = getelementptr i64, ptr %t1272, i64 5
  store i64 %a5, ptr %t1278
  %t1279 = getelementptr i64, ptr %t1272, i64 6
  store i64 %a6, ptr %t1279
  %t1280 = getelementptr i64, ptr %t1272, i64 7
  store i64 %a7, ptr %t1280
  %t1281 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1272, ptr %overflow)
  %t1282 = call i64 @rt_string_p(i64 %a0)
  %t1283 = icmp ne i64 %t1282, 1
  br i1 %t1283, label %then311, label %else312
then311:
  %t1284 = call i64 @rt_error(i64 %a0, i64 %t1281)
  ret i64 %t1284
else312:
  %t1285 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1286 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1287 = call i64 @rt_car(i64 %t1281)
  %t1288 = call i64 @rt_string_append(i64 %t1286, i64 %t1287)
  %t1289 = call i64 @rt_string_append(i64 %t1285, i64 %t1288)
  %t1290 = call i64 @rt_cdr(i64 %t1281)
  %t1291 = call i64 @rt_error(i64 %t1289, i64 %t1290)
  ret i64 %t1291
}

define fastcc i64 @"scheme.base:code_323"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1296 = icmp eq i64 %argc, 1
  br i1 %t1296, label %argok314, label %arityerr313
arityerr313:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok314:
  %t1297 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1297
}

define fastcc i64 @"scheme.base:code_326"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1302 = icmp eq i64 %argc, 1
  br i1 %t1302, label %argok316, label %arityerr315
arityerr315:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok316:
  %t1303 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1303
}

define fastcc i64 @"scheme.base:code_329"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1308 = icmp eq i64 %argc, 1
  br i1 %t1308, label %argok318, label %arityerr317
arityerr317:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok318:
  %t1309 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1309
}

define fastcc i64 @"scheme.base:code_332"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1314 = icmp eq i64 %argc, 1
  br i1 %t1314, label %argok320, label %arityerr319
arityerr319:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok320:
  %t1315 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1315
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1320 = icmp eq i64 %argc, 2
  br i1 %t1320, label %argok322, label %arityerr321
arityerr321:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok322:
  %t1321 = call i64 @rt_null_p(i64 %a0)
  %t1322 = icmp ne i64 %t1321, 1
  br i1 %t1322, label %then323, label %else324
then323:
  %t1323 = and i64 %self, -8
  %t1324 = inttoptr i64 %t1323 to ptr
  %t1325 = getelementptr i64, ptr %t1324, i64 1
  %t1326 = load i64, ptr %t1325
  ret i64 %t1326
else324:
  %t1327 = and i64 %self, -8
  %t1328 = inttoptr i64 %t1327 to ptr
  %t1329 = getelementptr i64, ptr %t1328, i64 1
  %t1330 = load i64, ptr %t1329
  %t1331 = call i64 @rt_car(i64 %a0)
  %t1332 = call i64 @rt_vector_set(i64 %t1330, i64 %a1, i64 %t1331)
  %t1333 = call i64 @rt_cdr(i64 %a0)
  %t1334 = or i64 %a1, 8
  %t1335 = and i64 %t1334, 7
  %t1336 = icmp eq i64 %t1335, 0
  br i1 %t1336, label %fixfast325, label %fixslow326
fixfast325:
  %t1337 = add i64 %a1, 8
  br label %fixmerge327
fixslow326:
  %t1338 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge327
fixmerge327:
  %t1339 = phi i64 [ %t1337, %fixfast325 ], [ %t1338, %fixslow326 ]
  %t1340 = musttail call fastcc i64 @"scheme.base:code_341"(i64 %self, i64 2, i64 %t1333, i64 %t1339, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1340
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1341 = icmp eq i64 %argc, 1
  br i1 %t1341, label %argok329, label %arityerr328
arityerr328:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok329:
  %t1342 = load i64, ptr @"scheme.base:length"
  %t1343 = and i64 %t1342, -8
  %t1344 = inttoptr i64 %t1343 to ptr
  %t1345 = load i64, ptr %t1344
  %t1346 = inttoptr i64 %t1345 to ptr
  %t1347 = call fastcc i64%t1346(i64 %t1342, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1348 = call i64 @rt_make_vector(i64 %t1347, i64 0)
  %t1349 = call i64 @rt_alloc_words(i64 3)
  %t1350 = inttoptr i64 %t1349 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1350
  %t1351 = or i64 %t1349, 4
  %t1352 = getelementptr i64, ptr %t1350, i64 1
  store i64 %t1348, ptr %t1352
  %t1353 = getelementptr i64, ptr %t1350, i64 2
  store i64 %t1351, ptr %t1353
  %t1354 = and i64 %t1351, -8
  %t1355 = inttoptr i64 %t1354 to ptr
  %t1356 = load i64, ptr %t1355
  %t1357 = inttoptr i64 %t1356 to ptr
  %t1358 = musttail call fastcc i64 %t1357(i64 %t1351, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1358
}

define fastcc i64 @"scheme.base:code_344"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1363 = icmp sge i64 %argc, 0
  br i1 %t1363, label %argok331, label %arityerr330
arityerr330:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok331:
  %t1364 = call i64 @rt_alloc_words(i64 8)
  %t1365 = inttoptr i64 %t1364 to ptr
  %t1366 = getelementptr i64, ptr %t1365, i64 0
  store i64 %a0, ptr %t1366
  %t1367 = getelementptr i64, ptr %t1365, i64 1
  store i64 %a1, ptr %t1367
  %t1368 = getelementptr i64, ptr %t1365, i64 2
  store i64 %a2, ptr %t1368
  %t1369 = getelementptr i64, ptr %t1365, i64 3
  store i64 %a3, ptr %t1369
  %t1370 = getelementptr i64, ptr %t1365, i64 4
  store i64 %a4, ptr %t1370
  %t1371 = getelementptr i64, ptr %t1365, i64 5
  store i64 %a5, ptr %t1371
  %t1372 = getelementptr i64, ptr %t1365, i64 6
  store i64 %a6, ptr %t1372
  %t1373 = getelementptr i64, ptr %t1365, i64 7
  store i64 %a7, ptr %t1373
  %t1374 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1365, ptr %overflow)
  %t1375 = load i64, ptr @"scheme.base:list->vector"
  %t1376 = and i64 %t1375, -8
  %t1377 = inttoptr i64 %t1376 to ptr
  %t1378 = load i64, ptr %t1377
  %t1379 = inttoptr i64 %t1378 to ptr
  %t1380 = musttail call fastcc i64 %t1379(i64 %t1375, i64 1, i64 %t1374, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1380
}

define fastcc i64 @"scheme.base:code_353"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1385 = icmp eq i64 %argc, 2
  br i1 %t1385, label %argok333, label %arityerr332
arityerr332:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok333:
  %t1386 = call i64 @rt_null_p(i64 %a0)
  %t1387 = icmp ne i64 %t1386, 1
  br i1 %t1387, label %then334, label %else335
then334:
  %t1388 = and i64 %self, -8
  %t1389 = inttoptr i64 %t1388 to ptr
  %t1390 = getelementptr i64, ptr %t1389, i64 1
  %t1391 = load i64, ptr %t1390
  ret i64 %t1391
else335:
  %t1392 = and i64 %self, -8
  %t1393 = inttoptr i64 %t1392 to ptr
  %t1394 = getelementptr i64, ptr %t1393, i64 1
  %t1395 = load i64, ptr %t1394
  %t1396 = call i64 @rt_car(i64 %a0)
  %t1397 = call i64 @rt_bytevector_u8_set(i64 %t1395, i64 %a1, i64 %t1396)
  %t1398 = call i64 @rt_cdr(i64 %a0)
  %t1399 = or i64 %a1, 8
  %t1400 = and i64 %t1399, 7
  %t1401 = icmp eq i64 %t1400, 0
  br i1 %t1401, label %fixfast336, label %fixslow337
fixfast336:
  %t1402 = add i64 %a1, 8
  br label %fixmerge338
fixslow337:
  %t1403 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge338
fixmerge338:
  %t1404 = phi i64 [ %t1402, %fixfast336 ], [ %t1403, %fixslow337 ]
  %t1405 = musttail call fastcc i64 @"scheme.base:code_353"(i64 %self, i64 2, i64 %t1398, i64 %t1404, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1405
}

define fastcc i64 @"scheme.base:code_351"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1406 = icmp eq i64 %argc, 1
  br i1 %t1406, label %argok340, label %arityerr339
arityerr339:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok340:
  %t1407 = load i64, ptr @"scheme.base:length"
  %t1408 = and i64 %t1407, -8
  %t1409 = inttoptr i64 %t1408 to ptr
  %t1410 = load i64, ptr %t1409
  %t1411 = inttoptr i64 %t1410 to ptr
  %t1412 = call fastcc i64%t1411(i64 %t1407, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1413 = call i64 @rt_make_bytevector(i64 %t1412, i64 0)
  %t1414 = call i64 @rt_alloc_words(i64 3)
  %t1415 = inttoptr i64 %t1414 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1415
  %t1416 = or i64 %t1414, 4
  %t1417 = getelementptr i64, ptr %t1415, i64 1
  store i64 %t1413, ptr %t1417
  %t1418 = getelementptr i64, ptr %t1415, i64 2
  store i64 %t1416, ptr %t1418
  %t1419 = and i64 %t1416, -8
  %t1420 = inttoptr i64 %t1419 to ptr
  %t1421 = load i64, ptr %t1420
  %t1422 = inttoptr i64 %t1421 to ptr
  %t1423 = musttail call fastcc i64 %t1422(i64 %t1416, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1423
}

define fastcc i64 @"scheme.base:code_356"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1428 = icmp sge i64 %argc, 0
  br i1 %t1428, label %argok342, label %arityerr341
arityerr341:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok342:
  %t1429 = call i64 @rt_alloc_words(i64 8)
  %t1430 = inttoptr i64 %t1429 to ptr
  %t1431 = getelementptr i64, ptr %t1430, i64 0
  store i64 %a0, ptr %t1431
  %t1432 = getelementptr i64, ptr %t1430, i64 1
  store i64 %a1, ptr %t1432
  %t1433 = getelementptr i64, ptr %t1430, i64 2
  store i64 %a2, ptr %t1433
  %t1434 = getelementptr i64, ptr %t1430, i64 3
  store i64 %a3, ptr %t1434
  %t1435 = getelementptr i64, ptr %t1430, i64 4
  store i64 %a4, ptr %t1435
  %t1436 = getelementptr i64, ptr %t1430, i64 5
  store i64 %a5, ptr %t1436
  %t1437 = getelementptr i64, ptr %t1430, i64 6
  store i64 %a6, ptr %t1437
  %t1438 = getelementptr i64, ptr %t1430, i64 7
  store i64 %a7, ptr %t1438
  %t1439 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1430, ptr %overflow)
  %t1440 = load i64, ptr @"scheme.base:list->bytevector"
  %t1441 = and i64 %t1440, -8
  %t1442 = inttoptr i64 %t1441 to ptr
  %t1443 = load i64, ptr %t1442
  %t1444 = inttoptr i64 %t1443 to ptr
  %t1445 = musttail call fastcc i64 %t1444(i64 %t1440, i64 1, i64 %t1439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1445
}

define fastcc i64 @"scheme.base:code_359"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1450 = icmp sge i64 %argc, 0
  br i1 %t1450, label %argok344, label %arityerr343
arityerr343:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok344:
  %t1451 = call i64 @rt_alloc_words(i64 8)
  %t1452 = inttoptr i64 %t1451 to ptr
  %t1453 = getelementptr i64, ptr %t1452, i64 0
  store i64 %a0, ptr %t1453
  %t1454 = getelementptr i64, ptr %t1452, i64 1
  store i64 %a1, ptr %t1454
  %t1455 = getelementptr i64, ptr %t1452, i64 2
  store i64 %a2, ptr %t1455
  %t1456 = getelementptr i64, ptr %t1452, i64 3
  store i64 %a3, ptr %t1456
  %t1457 = getelementptr i64, ptr %t1452, i64 4
  store i64 %a4, ptr %t1457
  %t1458 = getelementptr i64, ptr %t1452, i64 5
  store i64 %a5, ptr %t1458
  %t1459 = getelementptr i64, ptr %t1452, i64 6
  store i64 %a6, ptr %t1459
  %t1460 = getelementptr i64, ptr %t1452, i64 7
  store i64 %a7, ptr %t1460
  %t1461 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1452, ptr %overflow)
  %t1462 = call i64 @rt_pair_p(i64 %t1461)
  %t1463 = icmp ne i64 %t1462, 1
  br i1 %t1463, label %then345, label %else346
then345:
  %t1464 = call i64 @rt_cdr(i64 %t1461)
  %t1465 = call i64 @rt_null_p(i64 %t1464)
  br label %merge347
else346:
  br label %merge347
merge347:
  %t1466 = phi i64 [ %t1465, %then345 ], [ 1, %else346 ]
  %t1467 = icmp ne i64 %t1466, 1
  br i1 %t1467, label %then348, label %else349
then348:
  %t1468 = call i64 @rt_car(i64 %t1461)
  ret i64 %t1468
else349:
  %t1469 = call i64 @rt_list_to_mv(i64 %t1461)
  ret i64 %t1469
}

define fastcc i64 @"scheme.base:code_364"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1474 = icmp eq i64 %argc, 2
  br i1 %t1474, label %argok351, label %arityerr350
arityerr350:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok351:
  %t1475 = and i64 %a0, -8
  %t1476 = inttoptr i64 %t1475 to ptr
  %t1477 = load i64, ptr %t1476
  %t1478 = inttoptr i64 %t1477 to ptr
  %t1479 = call fastcc i64%t1478(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1480 = call i64 @rt_mv_p(i64 %t1479)
  %t1481 = icmp ne i64 %t1480, 1
  br i1 %t1481, label %then352, label %else353
then352:
  %t1482 = call i64 @rt_mv_to_list(i64 %t1479)
  %t1483 = and i64 %a1, -8
  %t1484 = inttoptr i64 %t1483 to ptr
  %t1485 = load i64, ptr %t1484
  %t1486 = inttoptr i64 %t1485 to ptr
  %t1487 = call i64 @rt_list_length(i64 %t1482)
  %t1488 = add i64 0, %t1487
  %t1489 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t1482, i64 8)
  %t1501 = getelementptr i64, ptr %t1489, i64 0
  %t1493 = load i64, ptr %t1501
  %t1502 = getelementptr i64, ptr %t1489, i64 1
  %t1494 = load i64, ptr %t1502
  %t1503 = getelementptr i64, ptr %t1489, i64 2
  %t1495 = load i64, ptr %t1503
  %t1504 = getelementptr i64, ptr %t1489, i64 3
  %t1496 = load i64, ptr %t1504
  %t1505 = getelementptr i64, ptr %t1489, i64 4
  %t1497 = load i64, ptr %t1505
  %t1506 = getelementptr i64, ptr %t1489, i64 5
  %t1498 = load i64, ptr %t1506
  %t1507 = getelementptr i64, ptr %t1489, i64 6
  %t1499 = load i64, ptr %t1507
  %t1508 = getelementptr i64, ptr %t1489, i64 7
  %t1500 = load i64, ptr %t1508
  %t1490 = icmp sgt i64 %t1488, 8
  %t1491 = getelementptr i64, ptr %t1489, i64 8
  %t1492 = select i1 %t1490, ptr %t1491, ptr null
  %t1509 = musttail call fastcc i64 %t1486(i64 %a1, i64 %t1488, i64 %t1493, i64 %t1494, i64 %t1495, i64 %t1496, i64 %t1497, i64 %t1498, i64 %t1499, i64 %t1500, ptr %t1492)
  ret i64 %t1509
else353:
  %t1510 = and i64 %a1, -8
  %t1511 = inttoptr i64 %t1510 to ptr
  %t1512 = load i64, ptr %t1511
  %t1513 = inttoptr i64 %t1512 to ptr
  %t1514 = musttail call fastcc i64 %t1513(i64 %a1, i64 1, i64 %t1479, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1514
}

define fastcc i64 @"scheme.base:code_366"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1521 = icmp eq i64 %argc, 0
  br i1 %t1521, label %argok355, label %arityerr354
arityerr354:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok355:
  %t1522 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t1523 = call i64 @rt_make_vector(i64 %t1522, i64 2)
  %t1524 = load i64, ptr @"scheme.base:vector"
  %t1525 = and i64 %t1524, -8
  %t1526 = inttoptr i64 %t1525 to ptr
  %t1527 = load i64, ptr %t1526
  %t1528 = inttoptr i64 %t1527 to ptr
  %t1529 = call fastcc i64%t1528(i64 %t1524, i64 3, i64 0, i64 %t1523, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1530 = call i64 @rt_make_hash_table(i64 %t1529)
  ret i64 %t1530
}

define fastcc i64 @"scheme.base:code_369"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1535 = icmp eq i64 %argc, 1
  br i1 %t1535, label %argok357, label %arityerr356
arityerr356:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok357:
  %t1536 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t1536
}

define fastcc i64 @"scheme.base:code_372"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1541 = icmp eq i64 %argc, 1
  br i1 %t1541, label %argok359, label %arityerr358
arityerr358:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok359:
  %t1542 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1543 = call i64 @rt_vector_ref(i64 %t1542, i64 0)
  ret i64 %t1543
}

define fastcc i64 @"scheme.base:code_375"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1548 = icmp eq i64 %argc, 1
  br i1 %t1548, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok361:
  %t1549 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1550 = call i64 @rt_vector_ref(i64 %t1549, i64 8)
  ret i64 %t1550
}

define fastcc i64 @"scheme.base:code_379"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1555 = icmp eq i64 %argc, 2
  br i1 %t1555, label %argok363, label %arityerr362
arityerr362:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok363:
  %t1556 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1557 = call i64 @rt_vector_set(i64 %t1556, i64 0, i64 %a1)
  ret i64 %t1557
}

define fastcc i64 @"scheme.base:code_383"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1562 = icmp eq i64 %argc, 2
  br i1 %t1562, label %argok365, label %arityerr364
arityerr364:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok365:
  %t1563 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1564 = call i64 @rt_vector_set(i64 %t1563, i64 8, i64 %a1)
  ret i64 %t1564
}

define fastcc i64 @"scheme.base:code_387"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1569 = icmp eq i64 %argc, 2
  br i1 %t1569, label %argok367, label %arityerr366
arityerr366:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok367:
  %t1570 = call i64 @rt_hash(i64 %a0)
  %t1571 = call i64 @rt_remainder(i64 %t1570, i64 %a1)
  ret i64 %t1571
}

define fastcc i64 @"scheme.base:code_391"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1576 = icmp eq i64 %argc, 2
  br i1 %t1576, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok369:
  %t1577 = call i64 @rt_null_p(i64 %a1)
  %t1578 = icmp ne i64 %t1577, 1
  br i1 %t1578, label %then370, label %else371
then370:
  ret i64 1
else371:
  %t1579 = call i64 @rt_car(i64 %a1)
  %t1580 = call i64 @rt_car(i64 %t1579)
  %t1581 = call i64 @rt_equal(i64 %a0, i64 %t1580)
  %t1582 = icmp ne i64 %t1581, 1
  br i1 %t1582, label %then372, label %else373
then372:
  %t1583 = call i64 @rt_car(i64 %a1)
  ret i64 %t1583
else373:
  %t1584 = call i64 @rt_cdr(i64 %a1)
  %t1585 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1586 = and i64 %t1585, -8
  %t1587 = inttoptr i64 %t1586 to ptr
  %t1588 = load i64, ptr %t1587
  %t1589 = inttoptr i64 %t1588 to ptr
  %t1590 = musttail call fastcc i64 %t1589(i64 %t1585, i64 2, i64 %a0, i64 %t1584, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1590
}

define fastcc i64 @"scheme.base:code_395"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1595 = icmp eq i64 %argc, 2
  br i1 %t1595, label %argok375, label %arityerr374
arityerr374:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok375:
  %t1596 = call i64 @rt_null_p(i64 %a1)
  %t1597 = icmp ne i64 %t1596, 1
  br i1 %t1597, label %then376, label %else377
then376:
  ret i64 2
else377:
  %t1598 = call i64 @rt_car(i64 %a1)
  %t1599 = call i64 @rt_car(i64 %t1598)
  %t1600 = call i64 @rt_equal(i64 %a0, i64 %t1599)
  %t1601 = icmp ne i64 %t1600, 1
  br i1 %t1601, label %then378, label %else379
then378:
  %t1602 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t1602
else379:
  %t1603 = call i64 @rt_car(i64 %a1)
  %t1604 = call i64 @rt_cdr(i64 %a1)
  %t1605 = load i64, ptr @"scheme.base:%ht-remove"
  %t1606 = and i64 %t1605, -8
  %t1607 = inttoptr i64 %t1606 to ptr
  %t1608 = load i64, ptr %t1607
  %t1609 = inttoptr i64 %t1608 to ptr
  %t1610 = call fastcc i64%t1609(i64 %t1605, i64 2, i64 %a0, i64 %t1604, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1611 = call i64 @rt_cons(i64 %t1603, i64 %t1610)
  ret i64 %t1611
}

define fastcc i64 @"scheme.base:code_402"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1616 = icmp eq i64 %argc, 3
  br i1 %t1616, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok381:
  %t1617 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1618 = and i64 %t1617, -8
  %t1619 = inttoptr i64 %t1618 to ptr
  %t1620 = load i64, ptr %t1619
  %t1621 = inttoptr i64 %t1620 to ptr
  %t1622 = call fastcc i64%t1621(i64 %t1617, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1623 = call i64 @rt_vector_length(i64 %t1622)
  %t1624 = load i64, ptr @"scheme.base:%ht-index"
  %t1625 = and i64 %t1624, -8
  %t1626 = inttoptr i64 %t1625 to ptr
  %t1627 = load i64, ptr %t1626
  %t1628 = inttoptr i64 %t1627 to ptr
  %t1629 = call fastcc i64%t1628(i64 %t1624, i64 2, i64 %a1, i64 %t1623, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1630 = call i64 @rt_vector_ref(i64 %t1622, i64 %t1629)
  %t1631 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1632 = and i64 %t1631, -8
  %t1633 = inttoptr i64 %t1632 to ptr
  %t1634 = load i64, ptr %t1633
  %t1635 = inttoptr i64 %t1634 to ptr
  %t1636 = call fastcc i64%t1635(i64 %t1631, i64 2, i64 %a1, i64 %t1630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1637 = icmp ne i64 %t1636, 1
  br i1 %t1637, label %then382, label %else383
then382:
  %t1638 = call i64 @rt_cdr(i64 %t1636)
  ret i64 %t1638
else383:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_407"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1643 = icmp eq i64 %argc, 2
  br i1 %t1643, label %argok385, label %arityerr384
arityerr384:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok385:
  %t1644 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1645 = and i64 %t1644, -8
  %t1646 = inttoptr i64 %t1645 to ptr
  %t1647 = load i64, ptr %t1646
  %t1648 = inttoptr i64 %t1647 to ptr
  %t1649 = call fastcc i64%t1648(i64 %t1644, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1650 = call i64 @rt_vector_length(i64 %t1649)
  %t1651 = load i64, ptr @"scheme.base:%ht-index"
  %t1652 = and i64 %t1651, -8
  %t1653 = inttoptr i64 %t1652 to ptr
  %t1654 = load i64, ptr %t1653
  %t1655 = inttoptr i64 %t1654 to ptr
  %t1656 = call fastcc i64%t1655(i64 %t1651, i64 2, i64 %a1, i64 %t1650, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1657 = call i64 @rt_vector_ref(i64 %t1649, i64 %t1656)
  %t1658 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1659 = and i64 %t1658, -8
  %t1660 = inttoptr i64 %t1659 to ptr
  %t1661 = load i64, ptr %t1660
  %t1662 = inttoptr i64 %t1661 to ptr
  %t1663 = call fastcc i64%t1662(i64 %t1658, i64 2, i64 %a1, i64 %t1657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1664 = icmp ne i64 %t1663, 1
  br i1 %t1664, label %then386, label %else387
then386:
  ret i64 257
else387:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_413"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1669 = icmp eq i64 %argc, 2
  br i1 %t1669, label %argok389, label %arityerr388
arityerr388:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok389:
  %t1670 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1671 = and i64 %t1670, -8
  %t1672 = inttoptr i64 %t1671 to ptr
  %t1673 = load i64, ptr %t1672
  %t1674 = inttoptr i64 %t1673 to ptr
  %t1675 = call fastcc i64%t1674(i64 %t1670, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1676 = call i64 @rt_vector_length(i64 %t1675)
  %t1677 = load i64, ptr @"scheme.base:%ht-index"
  %t1678 = and i64 %t1677, -8
  %t1679 = inttoptr i64 %t1678 to ptr
  %t1680 = load i64, ptr %t1679
  %t1681 = inttoptr i64 %t1680 to ptr
  %t1682 = call fastcc i64%t1681(i64 %t1677, i64 2, i64 %a1, i64 %t1676, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1683 = call i64 @rt_vector_ref(i64 %t1675, i64 %t1682)
  %t1684 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1685 = and i64 %t1684, -8
  %t1686 = inttoptr i64 %t1685 to ptr
  %t1687 = load i64, ptr %t1686
  %t1688 = inttoptr i64 %t1687 to ptr
  %t1689 = call fastcc i64%t1688(i64 %t1684, i64 2, i64 %a1, i64 %t1683, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1690 = icmp ne i64 %t1689, 1
  br i1 %t1690, label %then390, label %else391
then390:
  %t1691 = call i64 @rt_cdr(i64 %t1689)
  ret i64 %t1691
else391:
  %t1692 = call i64 @rt_make_string(ptr @.str.lit.3, i64 29)
  %t1693 = load i64, ptr @"scheme.base:error"
  %t1694 = and i64 %t1693, -8
  %t1695 = inttoptr i64 %t1694 to ptr
  %t1696 = load i64, ptr %t1695
  %t1697 = inttoptr i64 %t1696 to ptr
  %t1698 = musttail call fastcc i64 %t1697(i64 %t1693, i64 2, i64 %t1692, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1698
}

define fastcc i64 @"scheme.base:code_427"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1703 = icmp eq i64 %argc, 3
  br i1 %t1703, label %argok393, label %arityerr392
arityerr392:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok393:
  %t1704 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1705 = and i64 %t1704, -8
  %t1706 = inttoptr i64 %t1705 to ptr
  %t1707 = load i64, ptr %t1706
  %t1708 = inttoptr i64 %t1707 to ptr
  %t1709 = call fastcc i64%t1708(i64 %t1704, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1710 = call i64 @rt_vector_length(i64 %t1709)
  %t1711 = load i64, ptr @"scheme.base:%ht-index"
  %t1712 = and i64 %t1711, -8
  %t1713 = inttoptr i64 %t1712 to ptr
  %t1714 = load i64, ptr %t1713
  %t1715 = inttoptr i64 %t1714 to ptr
  %t1716 = call fastcc i64%t1715(i64 %t1711, i64 2, i64 %a1, i64 %t1710, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1717 = call i64 @rt_vector_ref(i64 %t1709, i64 %t1716)
  %t1718 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1719 = and i64 %t1718, -8
  %t1720 = inttoptr i64 %t1719 to ptr
  %t1721 = load i64, ptr %t1720
  %t1722 = inttoptr i64 %t1721 to ptr
  %t1723 = call fastcc i64%t1722(i64 %t1718, i64 2, i64 %a1, i64 %t1717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1724 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t1725 = icmp ne i64 %t1723, 1
  br i1 %t1725, label %then394, label %else395
then394:
  %t1726 = load i64, ptr @"scheme.base:%ht-remove"
  %t1727 = and i64 %t1726, -8
  %t1728 = inttoptr i64 %t1727 to ptr
  %t1729 = load i64, ptr %t1728
  %t1730 = inttoptr i64 %t1729 to ptr
  %t1731 = call fastcc i64%t1730(i64 %t1726, i64 2, i64 %a1, i64 %t1717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge396
else395:
  br label %merge396
merge396:
  %t1732 = phi i64 [ %t1731, %then394 ], [ %t1717, %else395 ]
  %t1733 = call i64 @rt_cons(i64 %t1724, i64 %t1732)
  %t1734 = call i64 @rt_vector_set(i64 %t1709, i64 %t1716, i64 %t1733)
  %t1735 = icmp ne i64 %t1723, 1
  br i1 %t1735, label %then397, label %else398
then397:
  ret i64 1
else398:
  %t1736 = load i64, ptr @"scheme.base:%ht-count"
  %t1737 = and i64 %t1736, -8
  %t1738 = inttoptr i64 %t1737 to ptr
  %t1739 = load i64, ptr %t1738
  %t1740 = inttoptr i64 %t1739 to ptr
  %t1741 = call fastcc i64%t1740(i64 %t1736, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1742 = or i64 %t1741, 8
  %t1743 = and i64 %t1742, 7
  %t1744 = icmp eq i64 %t1743, 0
  br i1 %t1744, label %fixfast399, label %fixslow400
fixfast399:
  %t1745 = add i64 %t1741, 8
  br label %fixmerge401
fixslow400:
  %t1746 = call i64 @rt_add(i64 %t1741, i64 8)
  br label %fixmerge401
fixmerge401:
  %t1747 = phi i64 [ %t1745, %fixfast399 ], [ %t1746, %fixslow400 ]
  %t1748 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t1749 = and i64 %t1748, -8
  %t1750 = inttoptr i64 %t1749 to ptr
  %t1751 = load i64, ptr %t1750
  %t1752 = inttoptr i64 %t1751 to ptr
  %t1753 = call fastcc i64%t1752(i64 %t1748, i64 2, i64 %a0, i64 %t1747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1754 = load i64, ptr @"scheme.base:%ht-count"
  %t1755 = and i64 %t1754, -8
  %t1756 = inttoptr i64 %t1755 to ptr
  %t1757 = load i64, ptr %t1756
  %t1758 = inttoptr i64 %t1757 to ptr
  %t1759 = call fastcc i64%t1758(i64 %t1754, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1760 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t1761 = or i64 %t1760, %t1710
  %t1762 = and i64 %t1761, 7
  %t1763 = icmp eq i64 %t1762, 0
  br i1 %t1763, label %fixfast402, label %fixslow403
fixfast402:
  %t1764 = ashr i64 %t1760, 3
  %t1765 = mul i64 %t1764, %t1710
  br label %fixmerge404
fixslow403:
  %t1766 = call i64 @rt_mul(i64 %t1760, i64 %t1710)
  br label %fixmerge404
fixmerge404:
  %t1767 = phi i64 [ %t1765, %fixfast402 ], [ %t1766, %fixslow403 ]
  %t1768 = or i64 %t1767, %t1759
  %t1769 = and i64 %t1768, 7
  %t1770 = icmp eq i64 %t1769, 0
  br i1 %t1770, label %fixfast405, label %fixslow406
fixfast405:
  %t1771 = icmp slt i64 %t1767, %t1759
  %t1772 = select i1 %t1771, i64 257, i64 1
  br label %fixmerge407
fixslow406:
  %t1773 = call i64 @rt_lt(i64 %t1767, i64 %t1759)
  br label %fixmerge407
fixmerge407:
  %t1774 = phi i64 [ %t1772, %fixfast405 ], [ %t1773, %fixslow406 ]
  %t1775 = icmp ne i64 %t1774, 1
  br i1 %t1775, label %then408, label %else409
then408:
  %t1776 = load i64, ptr @"scheme.base:%ht-grow!"
  %t1777 = and i64 %t1776, -8
  %t1778 = inttoptr i64 %t1777 to ptr
  %t1779 = load i64, ptr %t1778
  %t1780 = inttoptr i64 %t1779 to ptr
  %t1781 = musttail call fastcc i64 %t1780(i64 %t1776, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1781
else409:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_434"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1786 = icmp eq i64 %argc, 2
  br i1 %t1786, label %argok411, label %arityerr410
arityerr410:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok411:
  %t1787 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1788 = and i64 %t1787, -8
  %t1789 = inttoptr i64 %t1788 to ptr
  %t1790 = load i64, ptr %t1789
  %t1791 = inttoptr i64 %t1790 to ptr
  %t1792 = call fastcc i64%t1791(i64 %t1787, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1793 = call i64 @rt_vector_length(i64 %t1792)
  %t1794 = load i64, ptr @"scheme.base:%ht-index"
  %t1795 = and i64 %t1794, -8
  %t1796 = inttoptr i64 %t1795 to ptr
  %t1797 = load i64, ptr %t1796
  %t1798 = inttoptr i64 %t1797 to ptr
  %t1799 = call fastcc i64%t1798(i64 %t1794, i64 2, i64 %a1, i64 %t1793, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1800 = call i64 @rt_vector_ref(i64 %t1792, i64 %t1799)
  %t1801 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1802 = and i64 %t1801, -8
  %t1803 = inttoptr i64 %t1802 to ptr
  %t1804 = load i64, ptr %t1803
  %t1805 = inttoptr i64 %t1804 to ptr
  %t1806 = call fastcc i64%t1805(i64 %t1801, i64 2, i64 %a1, i64 %t1800, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1807 = icmp ne i64 %t1806, 1
  br i1 %t1807, label %then412, label %else413
then412:
  %t1808 = load i64, ptr @"scheme.base:%ht-remove"
  %t1809 = and i64 %t1808, -8
  %t1810 = inttoptr i64 %t1809 to ptr
  %t1811 = load i64, ptr %t1810
  %t1812 = inttoptr i64 %t1811 to ptr
  %t1813 = call fastcc i64%t1812(i64 %t1808, i64 2, i64 %a1, i64 %t1800, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1814 = call i64 @rt_vector_set(i64 %t1792, i64 %t1799, i64 %t1813)
  %t1815 = load i64, ptr @"scheme.base:%ht-count"
  %t1816 = and i64 %t1815, -8
  %t1817 = inttoptr i64 %t1816 to ptr
  %t1818 = load i64, ptr %t1817
  %t1819 = inttoptr i64 %t1818 to ptr
  %t1820 = call fastcc i64%t1819(i64 %t1815, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1821 = or i64 %t1820, 8
  %t1822 = and i64 %t1821, 7
  %t1823 = icmp eq i64 %t1822, 0
  br i1 %t1823, label %fixfast414, label %fixslow415
fixfast414:
  %t1824 = sub i64 %t1820, 8
  br label %fixmerge416
fixslow415:
  %t1825 = call i64 @rt_sub(i64 %t1820, i64 8)
  br label %fixmerge416
fixmerge416:
  %t1826 = phi i64 [ %t1824, %fixfast414 ], [ %t1825, %fixslow415 ]
  %t1827 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t1828 = and i64 %t1827, -8
  %t1829 = inttoptr i64 %t1828 to ptr
  %t1830 = load i64, ptr %t1829
  %t1831 = inttoptr i64 %t1830 to ptr
  %t1832 = musttail call fastcc i64 %t1831(i64 %t1827, i64 2, i64 %a0, i64 %t1826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1832
else413:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_454"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1837 = icmp eq i64 %argc, 1
  br i1 %t1837, label %argok418, label %arityerr417
arityerr417:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok418:
  %t1838 = call i64 @rt_null_p(i64 %a0)
  %t1839 = icmp ne i64 %t1838, 1
  br i1 %t1839, label %then419, label %else420
then419:
  ret i64 1
else420:
  %t1840 = call i64 @rt_car(i64 %a0)
  %t1841 = call i64 @rt_car(i64 %t1840)
  %t1842 = and i64 %self, -8
  %t1843 = inttoptr i64 %t1842 to ptr
  %t1844 = getelementptr i64, ptr %t1843, i64 1
  %t1845 = load i64, ptr %t1844
  %t1846 = load i64, ptr @"scheme.base:%ht-index"
  %t1847 = and i64 %t1846, -8
  %t1848 = inttoptr i64 %t1847 to ptr
  %t1849 = load i64, ptr %t1848
  %t1850 = inttoptr i64 %t1849 to ptr
  %t1851 = call fastcc i64%t1850(i64 %t1846, i64 2, i64 %t1841, i64 %t1845, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1852 = and i64 %self, -8
  %t1853 = inttoptr i64 %t1852 to ptr
  %t1854 = getelementptr i64, ptr %t1853, i64 2
  %t1855 = load i64, ptr %t1854
  %t1856 = and i64 %self, -8
  %t1857 = inttoptr i64 %t1856 to ptr
  %t1858 = getelementptr i64, ptr %t1857, i64 2
  %t1859 = load i64, ptr %t1858
  %t1860 = call i64 @rt_vector_ref(i64 %t1859, i64 %t1851)
  %t1861 = call i64 @rt_cons(i64 %t1840, i64 %t1860)
  %t1862 = call i64 @rt_vector_set(i64 %t1855, i64 %t1851, i64 %t1861)
  %t1863 = call i64 @rt_cdr(i64 %a0)
  %t1864 = musttail call fastcc i64 @"scheme.base:code_454"(i64 %self, i64 1, i64 %t1863, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1864
}

define fastcc i64 @"scheme.base:code_452"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1865 = icmp eq i64 %argc, 1
  br i1 %t1865, label %argok422, label %arityerr421
arityerr421:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok422:
  %t1866 = and i64 %self, -8
  %t1867 = inttoptr i64 %t1866 to ptr
  %t1868 = getelementptr i64, ptr %t1867, i64 1
  %t1869 = load i64, ptr %t1868
  %t1870 = call i64 @rt_vector_length(i64 %t1869)
  %t1871 = or i64 %a0, %t1870
  %t1872 = and i64 %t1871, 7
  %t1873 = icmp eq i64 %t1872, 0
  br i1 %t1873, label %fixfast423, label %fixslow424
fixfast423:
  %t1874 = icmp slt i64 %a0, %t1870
  %t1875 = select i1 %t1874, i64 257, i64 1
  br label %fixmerge425
fixslow424:
  %t1876 = call i64 @rt_lt(i64 %a0, i64 %t1870)
  br label %fixmerge425
fixmerge425:
  %t1877 = phi i64 [ %t1875, %fixfast423 ], [ %t1876, %fixslow424 ]
  %t1878 = icmp ne i64 %t1877, 1
  br i1 %t1878, label %then426, label %else427
then426:
  %t1879 = call i64 @rt_alloc_words(i64 4)
  %t1880 = inttoptr i64 %t1879 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_454" to i64), ptr %t1880
  %t1881 = or i64 %t1879, 4
  %t1882 = and i64 %self, -8
  %t1883 = inttoptr i64 %t1882 to ptr
  %t1884 = getelementptr i64, ptr %t1883, i64 2
  %t1885 = load i64, ptr %t1884
  %t1886 = getelementptr i64, ptr %t1880, i64 1
  store i64 %t1885, ptr %t1886
  %t1887 = and i64 %self, -8
  %t1888 = inttoptr i64 %t1887 to ptr
  %t1889 = getelementptr i64, ptr %t1888, i64 3
  %t1890 = load i64, ptr %t1889
  %t1891 = getelementptr i64, ptr %t1880, i64 2
  store i64 %t1890, ptr %t1891
  %t1892 = getelementptr i64, ptr %t1880, i64 3
  store i64 %t1881, ptr %t1892
  %t1893 = and i64 %self, -8
  %t1894 = inttoptr i64 %t1893 to ptr
  %t1895 = getelementptr i64, ptr %t1894, i64 1
  %t1896 = load i64, ptr %t1895
  %t1897 = call i64 @rt_vector_ref(i64 %t1896, i64 %a0)
  %t1898 = and i64 %t1881, -8
  %t1899 = inttoptr i64 %t1898 to ptr
  %t1900 = load i64, ptr %t1899
  %t1901 = inttoptr i64 %t1900 to ptr
  %t1902 = call fastcc i64%t1901(i64 %t1881, i64 1, i64 %t1897, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1903 = or i64 %a0, 8
  %t1904 = and i64 %t1903, 7
  %t1905 = icmp eq i64 %t1904, 0
  br i1 %t1905, label %fixfast428, label %fixslow429
fixfast428:
  %t1906 = add i64 %a0, 8
  br label %fixmerge430
fixslow429:
  %t1907 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge430
fixmerge430:
  %t1908 = phi i64 [ %t1906, %fixfast428 ], [ %t1907, %fixslow429 ]
  %t1909 = musttail call fastcc i64 @"scheme.base:code_452"(i64 %self, i64 1, i64 %t1908, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1909
else427:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_450"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1910 = icmp eq i64 %argc, 1
  br i1 %t1910, label %argok432, label %arityerr431
arityerr431:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok432:
  %t1911 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1912 = and i64 %t1911, -8
  %t1913 = inttoptr i64 %t1912 to ptr
  %t1914 = load i64, ptr %t1913
  %t1915 = inttoptr i64 %t1914 to ptr
  %t1916 = call fastcc i64%t1915(i64 %t1911, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1917 = call i64 @rt_vector_length(i64 %t1916)
  %t1918 = or i64 16, %t1917
  %t1919 = and i64 %t1918, 7
  %t1920 = icmp eq i64 %t1919, 0
  br i1 %t1920, label %fixfast433, label %fixslow434
fixfast433:
  %t1921 = ashr i64 16, 3
  %t1922 = mul i64 %t1921, %t1917
  br label %fixmerge435
fixslow434:
  %t1923 = call i64 @rt_mul(i64 16, i64 %t1917)
  br label %fixmerge435
fixmerge435:
  %t1924 = phi i64 [ %t1922, %fixfast433 ], [ %t1923, %fixslow434 ]
  %t1925 = call i64 @rt_make_vector(i64 %t1924, i64 2)
  %t1926 = call i64 @rt_alloc_words(i64 5)
  %t1927 = inttoptr i64 %t1926 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_452" to i64), ptr %t1927
  %t1928 = or i64 %t1926, 4
  %t1929 = getelementptr i64, ptr %t1927, i64 1
  store i64 %t1916, ptr %t1929
  %t1930 = getelementptr i64, ptr %t1927, i64 2
  store i64 %t1924, ptr %t1930
  %t1931 = getelementptr i64, ptr %t1927, i64 3
  store i64 %t1925, ptr %t1931
  %t1932 = getelementptr i64, ptr %t1927, i64 4
  store i64 %t1928, ptr %t1932
  %t1933 = and i64 %t1928, -8
  %t1934 = inttoptr i64 %t1933 to ptr
  %t1935 = load i64, ptr %t1934
  %t1936 = inttoptr i64 %t1935 to ptr
  %t1937 = call fastcc i64%t1936(i64 %t1928, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1938 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t1939 = and i64 %t1938, -8
  %t1940 = inttoptr i64 %t1939 to ptr
  %t1941 = load i64, ptr %t1940
  %t1942 = inttoptr i64 %t1941 to ptr
  %t1943 = musttail call fastcc i64 %t1942(i64 %t1938, i64 2, i64 %a0, i64 %t1925, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1943
}

define fastcc i64 @"scheme.base:code_457"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1948 = icmp eq i64 %argc, 1
  br i1 %t1948, label %argok437, label %arityerr436
arityerr436:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok437:
  %t1949 = load i64, ptr @"scheme.base:%ht-count"
  %t1950 = and i64 %t1949, -8
  %t1951 = inttoptr i64 %t1950 to ptr
  %t1952 = load i64, ptr %t1951
  %t1953 = inttoptr i64 %t1952 to ptr
  %t1954 = musttail call fastcc i64 %t1953(i64 %t1949, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1954
}

define fastcc i64 @"scheme.base:code_461"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1959 = icmp eq i64 %argc, 2
  br i1 %t1959, label %argok439, label %arityerr438
arityerr438:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok439:
  %t1960 = call i64 @rt_null_p(i64 %a0)
  %t1961 = icmp ne i64 %t1960, 1
  br i1 %t1961, label %then440, label %else441
then440:
  ret i64 %a1
else441:
  %t1962 = call i64 @rt_car(i64 %a0)
  %t1963 = call i64 @rt_car(i64 %t1962)
  %t1964 = call i64 @rt_car(i64 %a0)
  %t1965 = call i64 @rt_cdr(i64 %t1964)
  %t1966 = call i64 @rt_cons(i64 %t1963, i64 %t1965)
  %t1967 = call i64 @rt_cdr(i64 %a0)
  %t1968 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t1969 = and i64 %t1968, -8
  %t1970 = inttoptr i64 %t1969 to ptr
  %t1971 = load i64, ptr %t1970
  %t1972 = inttoptr i64 %t1971 to ptr
  %t1973 = call fastcc i64%t1972(i64 %t1968, i64 2, i64 %t1967, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1974 = call i64 @rt_cons(i64 %t1966, i64 %t1973)
  ret i64 %t1974
}

define fastcc i64 @"scheme.base:code_474"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1979 = icmp eq i64 %argc, 2
  br i1 %t1979, label %argok443, label %arityerr442
arityerr442:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok443:
  %t1980 = and i64 %self, -8
  %t1981 = inttoptr i64 %t1980 to ptr
  %t1982 = getelementptr i64, ptr %t1981, i64 1
  %t1983 = load i64, ptr %t1982
  %t1984 = call i64 @rt_vector_length(i64 %t1983)
  %t1985 = or i64 %a0, %t1984
  %t1986 = and i64 %t1985, 7
  %t1987 = icmp eq i64 %t1986, 0
  br i1 %t1987, label %fixfast444, label %fixslow445
fixfast444:
  %t1988 = icmp slt i64 %a0, %t1984
  %t1989 = select i1 %t1988, i64 257, i64 1
  br label %fixmerge446
fixslow445:
  %t1990 = call i64 @rt_lt(i64 %a0, i64 %t1984)
  br label %fixmerge446
fixmerge446:
  %t1991 = phi i64 [ %t1989, %fixfast444 ], [ %t1990, %fixslow445 ]
  %t1992 = icmp ne i64 %t1991, 1
  br i1 %t1992, label %then447, label %else448
then447:
  %t1993 = or i64 %a0, 8
  %t1994 = and i64 %t1993, 7
  %t1995 = icmp eq i64 %t1994, 0
  br i1 %t1995, label %fixfast449, label %fixslow450
fixfast449:
  %t1996 = add i64 %a0, 8
  br label %fixmerge451
fixslow450:
  %t1997 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge451
fixmerge451:
  %t1998 = phi i64 [ %t1996, %fixfast449 ], [ %t1997, %fixslow450 ]
  %t1999 = and i64 %self, -8
  %t2000 = inttoptr i64 %t1999 to ptr
  %t2001 = getelementptr i64, ptr %t2000, i64 1
  %t2002 = load i64, ptr %t2001
  %t2003 = call i64 @rt_vector_ref(i64 %t2002, i64 %a0)
  %t2004 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2005 = and i64 %t2004, -8
  %t2006 = inttoptr i64 %t2005 to ptr
  %t2007 = load i64, ptr %t2006
  %t2008 = inttoptr i64 %t2007 to ptr
  %t2009 = call fastcc i64%t2008(i64 %t2004, i64 2, i64 %t2003, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2010 = musttail call fastcc i64 @"scheme.base:code_474"(i64 %self, i64 2, i64 %t1998, i64 %t2009, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2010
else448:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code_472"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2011 = icmp eq i64 %argc, 1
  br i1 %t2011, label %argok453, label %arityerr452
arityerr452:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok453:
  %t2012 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2013 = and i64 %t2012, -8
  %t2014 = inttoptr i64 %t2013 to ptr
  %t2015 = load i64, ptr %t2014
  %t2016 = inttoptr i64 %t2015 to ptr
  %t2017 = call fastcc i64%t2016(i64 %t2012, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2018 = call i64 @rt_alloc_words(i64 3)
  %t2019 = inttoptr i64 %t2018 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_474" to i64), ptr %t2019
  %t2020 = or i64 %t2018, 4
  %t2021 = getelementptr i64, ptr %t2019, i64 1
  store i64 %t2017, ptr %t2021
  %t2022 = getelementptr i64, ptr %t2019, i64 2
  store i64 %t2020, ptr %t2022
  %t2023 = and i64 %t2020, -8
  %t2024 = inttoptr i64 %t2023 to ptr
  %t2025 = load i64, ptr %t2024
  %t2026 = inttoptr i64 %t2025 to ptr
  %t2027 = musttail call fastcc i64 %t2026(i64 %t2020, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2027
}

define fastcc i64 @"scheme.base:code_480"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2032 = icmp eq i64 %argc, 1
  br i1 %t2032, label %argok455, label %arityerr454
arityerr454:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok455:
  %t2033 = call i64 @rt_car(i64 %a0)
  ret i64 %t2033
}

define fastcc i64 @"scheme.base:code_478"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2034 = icmp eq i64 %argc, 1
  br i1 %t2034, label %argok457, label %arityerr456
arityerr456:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok457:
  %t2035 = call i64 @rt_alloc_words(i64 1)
  %t2036 = inttoptr i64 %t2035 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_480" to i64), ptr %t2036
  %t2037 = or i64 %t2035, 4
  %t2038 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2039 = and i64 %t2038, -8
  %t2040 = inttoptr i64 %t2039 to ptr
  %t2041 = load i64, ptr %t2040
  %t2042 = inttoptr i64 %t2041 to ptr
  %t2043 = call fastcc i64%t2042(i64 %t2038, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2044 = load i64, ptr @"scheme.base:map"
  %t2045 = and i64 %t2044, -8
  %t2046 = inttoptr i64 %t2045 to ptr
  %t2047 = load i64, ptr %t2046
  %t2048 = inttoptr i64 %t2047 to ptr
  %t2049 = musttail call fastcc i64 %t2048(i64 %t2044, i64 2, i64 %t2037, i64 %t2043, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2049
}

define fastcc i64 @"scheme.base:code_486"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2054 = icmp eq i64 %argc, 1
  br i1 %t2054, label %argok459, label %arityerr458
arityerr458:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok459:
  %t2055 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t2055
}

define fastcc i64 @"scheme.base:code_484"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2056 = icmp eq i64 %argc, 1
  br i1 %t2056, label %argok461, label %arityerr460
arityerr460:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok461:
  %t2057 = call i64 @rt_alloc_words(i64 1)
  %t2058 = inttoptr i64 %t2057 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_486" to i64), ptr %t2058
  %t2059 = or i64 %t2057, 4
  %t2060 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2061 = and i64 %t2060, -8
  %t2062 = inttoptr i64 %t2061 to ptr
  %t2063 = load i64, ptr %t2062
  %t2064 = inttoptr i64 %t2063 to ptr
  %t2065 = call fastcc i64%t2064(i64 %t2060, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2066 = load i64, ptr @"scheme.base:map"
  %t2067 = and i64 %t2066, -8
  %t2068 = inttoptr i64 %t2067 to ptr
  %t2069 = load i64, ptr %t2068
  %t2070 = inttoptr i64 %t2069 to ptr
  %t2071 = musttail call fastcc i64 %t2070(i64 %t2066, i64 2, i64 %t2059, i64 %t2065, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2071
}

define fastcc i64 @"scheme.base:code_512"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2076 = icmp eq i64 %argc, 1
  br i1 %t2076, label %argok463, label %arityerr462
arityerr462:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok463:
  %t2077 = call i64 @rt_char_to_integer(i64 %a0)
  %t2078 = or i64 %t2077, 256
  %t2079 = and i64 %t2078, 7
  %t2080 = icmp eq i64 %t2079, 0
  br i1 %t2080, label %fixfast464, label %fixslow465
fixfast464:
  %t2081 = icmp eq i64 %t2077, 256
  %t2082 = select i1 %t2081, i64 257, i64 1
  br label %fixmerge466
fixslow465:
  %t2083 = call i64 @rt_num_eq(i64 %t2077, i64 256)
  br label %fixmerge466
fixmerge466:
  %t2084 = phi i64 [ %t2082, %fixfast464 ], [ %t2083, %fixslow465 ]
  %t2085 = icmp ne i64 %t2084, 1
  br i1 %t2085, label %then467, label %else468
then467:
  ret i64 %t2084
else468:
  %t2086 = or i64 %t2077, 72
  %t2087 = and i64 %t2086, 7
  %t2088 = icmp eq i64 %t2087, 0
  br i1 %t2088, label %fixfast469, label %fixslow470
fixfast469:
  %t2089 = icmp eq i64 %t2077, 72
  %t2090 = select i1 %t2089, i64 257, i64 1
  br label %fixmerge471
fixslow470:
  %t2091 = call i64 @rt_num_eq(i64 %t2077, i64 72)
  br label %fixmerge471
fixmerge471:
  %t2092 = phi i64 [ %t2090, %fixfast469 ], [ %t2091, %fixslow470 ]
  %t2093 = icmp ne i64 %t2092, 1
  br i1 %t2093, label %then472, label %else473
then472:
  ret i64 %t2092
else473:
  %t2094 = or i64 %t2077, 80
  %t2095 = and i64 %t2094, 7
  %t2096 = icmp eq i64 %t2095, 0
  br i1 %t2096, label %fixfast474, label %fixslow475
fixfast474:
  %t2097 = icmp eq i64 %t2077, 80
  %t2098 = select i1 %t2097, i64 257, i64 1
  br label %fixmerge476
fixslow475:
  %t2099 = call i64 @rt_num_eq(i64 %t2077, i64 80)
  br label %fixmerge476
fixmerge476:
  %t2100 = phi i64 [ %t2098, %fixfast474 ], [ %t2099, %fixslow475 ]
  %t2101 = icmp ne i64 %t2100, 1
  br i1 %t2101, label %then477, label %else478
then477:
  ret i64 %t2100
else478:
  %t2102 = or i64 %t2077, 104
  %t2103 = and i64 %t2102, 7
  %t2104 = icmp eq i64 %t2103, 0
  br i1 %t2104, label %fixfast479, label %fixslow480
fixfast479:
  %t2105 = icmp eq i64 %t2077, 104
  %t2106 = select i1 %t2105, i64 257, i64 1
  br label %fixmerge481
fixslow480:
  %t2107 = call i64 @rt_num_eq(i64 %t2077, i64 104)
  br label %fixmerge481
fixmerge481:
  %t2108 = phi i64 [ %t2106, %fixfast479 ], [ %t2107, %fixslow480 ]
  ret i64 %t2108
}

define fastcc i64 @"scheme.base:code_524"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2113 = icmp eq i64 %argc, 1
  br i1 %t2113, label %argok483, label %arityerr482
arityerr482:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok483:
  %t2114 = call i64 @rt_char_to_integer(i64 %a0)
  %t2115 = or i64 376, %t2114
  %t2116 = and i64 %t2115, 7
  %t2117 = icmp eq i64 %t2116, 0
  br i1 %t2117, label %fixfast484, label %fixslow485
fixfast484:
  %t2118 = icmp slt i64 376, %t2114
  %t2119 = select i1 %t2118, i64 257, i64 1
  br label %fixmerge486
fixslow485:
  %t2120 = call i64 @rt_lt(i64 376, i64 %t2114)
  br label %fixmerge486
fixmerge486:
  %t2121 = phi i64 [ %t2119, %fixfast484 ], [ %t2120, %fixslow485 ]
  %t2122 = icmp ne i64 %t2121, 1
  br i1 %t2122, label %then487, label %else488
then487:
  %t2123 = or i64 %t2114, 464
  %t2124 = and i64 %t2123, 7
  %t2125 = icmp eq i64 %t2124, 0
  br i1 %t2125, label %fixfast489, label %fixslow490
fixfast489:
  %t2126 = icmp slt i64 %t2114, 464
  %t2127 = select i1 %t2126, i64 257, i64 1
  br label %fixmerge491
fixslow490:
  %t2128 = call i64 @rt_lt(i64 %t2114, i64 464)
  br label %fixmerge491
fixmerge491:
  %t2129 = phi i64 [ %t2127, %fixfast489 ], [ %t2128, %fixslow490 ]
  ret i64 %t2129
else488:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_564"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2134 = icmp eq i64 %argc, 1
  br i1 %t2134, label %argok493, label %arityerr492
arityerr492:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok493:
  %t2135 = call i64 @rt_char_to_integer(i64 %a0)
  %t2136 = load i64, ptr @"scheme.base:rd-ws?"
  %t2137 = and i64 %t2136, -8
  %t2138 = inttoptr i64 %t2137 to ptr
  %t2139 = load i64, ptr %t2138
  %t2140 = inttoptr i64 %t2139 to ptr
  %t2141 = call fastcc i64%t2140(i64 %t2136, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2142 = icmp ne i64 %t2141, 1
  br i1 %t2142, label %then494, label %else495
then494:
  ret i64 %t2141
else495:
  %t2143 = or i64 %t2135, 320
  %t2144 = and i64 %t2143, 7
  %t2145 = icmp eq i64 %t2144, 0
  br i1 %t2145, label %fixfast496, label %fixslow497
fixfast496:
  %t2146 = icmp eq i64 %t2135, 320
  %t2147 = select i1 %t2146, i64 257, i64 1
  br label %fixmerge498
fixslow497:
  %t2148 = call i64 @rt_num_eq(i64 %t2135, i64 320)
  br label %fixmerge498
fixmerge498:
  %t2149 = phi i64 [ %t2147, %fixfast496 ], [ %t2148, %fixslow497 ]
  %t2150 = icmp ne i64 %t2149, 1
  br i1 %t2150, label %then499, label %else500
then499:
  ret i64 %t2149
else500:
  %t2151 = or i64 %t2135, 328
  %t2152 = and i64 %t2151, 7
  %t2153 = icmp eq i64 %t2152, 0
  br i1 %t2153, label %fixfast501, label %fixslow502
fixfast501:
  %t2154 = icmp eq i64 %t2135, 328
  %t2155 = select i1 %t2154, i64 257, i64 1
  br label %fixmerge503
fixslow502:
  %t2156 = call i64 @rt_num_eq(i64 %t2135, i64 328)
  br label %fixmerge503
fixmerge503:
  %t2157 = phi i64 [ %t2155, %fixfast501 ], [ %t2156, %fixslow502 ]
  %t2158 = icmp ne i64 %t2157, 1
  br i1 %t2158, label %then504, label %else505
then504:
  ret i64 %t2157
else505:
  %t2159 = or i64 %t2135, 728
  %t2160 = and i64 %t2159, 7
  %t2161 = icmp eq i64 %t2160, 0
  br i1 %t2161, label %fixfast506, label %fixslow507
fixfast506:
  %t2162 = icmp eq i64 %t2135, 728
  %t2163 = select i1 %t2162, i64 257, i64 1
  br label %fixmerge508
fixslow507:
  %t2164 = call i64 @rt_num_eq(i64 %t2135, i64 728)
  br label %fixmerge508
fixmerge508:
  %t2165 = phi i64 [ %t2163, %fixfast506 ], [ %t2164, %fixslow507 ]
  %t2166 = icmp ne i64 %t2165, 1
  br i1 %t2166, label %then509, label %else510
then509:
  ret i64 %t2165
else510:
  %t2167 = or i64 %t2135, 744
  %t2168 = and i64 %t2167, 7
  %t2169 = icmp eq i64 %t2168, 0
  br i1 %t2169, label %fixfast511, label %fixslow512
fixfast511:
  %t2170 = icmp eq i64 %t2135, 744
  %t2171 = select i1 %t2170, i64 257, i64 1
  br label %fixmerge513
fixslow512:
  %t2172 = call i64 @rt_num_eq(i64 %t2135, i64 744)
  br label %fixmerge513
fixmerge513:
  %t2173 = phi i64 [ %t2171, %fixfast511 ], [ %t2172, %fixslow512 ]
  %t2174 = icmp ne i64 %t2173, 1
  br i1 %t2174, label %then514, label %else515
then514:
  ret i64 %t2173
else515:
  %t2175 = or i64 %t2135, 272
  %t2176 = and i64 %t2175, 7
  %t2177 = icmp eq i64 %t2176, 0
  br i1 %t2177, label %fixfast516, label %fixslow517
fixfast516:
  %t2178 = icmp eq i64 %t2135, 272
  %t2179 = select i1 %t2178, i64 257, i64 1
  br label %fixmerge518
fixslow517:
  %t2180 = call i64 @rt_num_eq(i64 %t2135, i64 272)
  br label %fixmerge518
fixmerge518:
  %t2181 = phi i64 [ %t2179, %fixfast516 ], [ %t2180, %fixslow517 ]
  %t2182 = icmp ne i64 %t2181, 1
  br i1 %t2182, label %then519, label %else520
then519:
  ret i64 %t2181
else520:
  %t2183 = or i64 %t2135, 472
  %t2184 = and i64 %t2183, 7
  %t2185 = icmp eq i64 %t2184, 0
  br i1 %t2185, label %fixfast521, label %fixslow522
fixfast521:
  %t2186 = icmp eq i64 %t2135, 472
  %t2187 = select i1 %t2186, i64 257, i64 1
  br label %fixmerge523
fixslow522:
  %t2188 = call i64 @rt_num_eq(i64 %t2135, i64 472)
  br label %fixmerge523
fixmerge523:
  %t2189 = phi i64 [ %t2187, %fixfast521 ], [ %t2188, %fixslow522 ]
  ret i64 %t2189
}

define fastcc i64 @"scheme.base:code_577"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2194 = icmp eq i64 %argc, 3
  br i1 %t2194, label %argok525, label %arityerr524
arityerr524:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok525:
  %t2195 = or i64 %a2, %a1
  %t2196 = and i64 %t2195, 7
  %t2197 = icmp eq i64 %t2196, 0
  br i1 %t2197, label %fixfast526, label %fixslow527
fixfast526:
  %t2198 = icmp slt i64 %a2, %a1
  %t2199 = select i1 %t2198, i64 257, i64 1
  br label %fixmerge528
fixslow527:
  %t2200 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge528
fixmerge528:
  %t2201 = phi i64 [ %t2199, %fixfast526 ], [ %t2200, %fixslow527 ]
  %t2202 = icmp ne i64 %t2201, 1
  br i1 %t2202, label %then529, label %else530
then529:
  %t2203 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2204 = call i64 @rt_char_to_integer(i64 %t2203)
  %t2205 = or i64 %t2204, 80
  %t2206 = and i64 %t2205, 7
  %t2207 = icmp eq i64 %t2206, 0
  br i1 %t2207, label %fixfast531, label %fixslow532
fixfast531:
  %t2208 = icmp eq i64 %t2204, 80
  %t2209 = select i1 %t2208, i64 257, i64 1
  br label %fixmerge533
fixslow532:
  %t2210 = call i64 @rt_num_eq(i64 %t2204, i64 80)
  br label %fixmerge533
fixmerge533:
  %t2211 = phi i64 [ %t2209, %fixfast531 ], [ %t2210, %fixslow532 ]
  %t2212 = icmp ne i64 %t2211, 1
  br i1 %t2212, label %then534, label %else535
then534:
  %t2213 = or i64 %a2, 8
  %t2214 = and i64 %t2213, 7
  %t2215 = icmp eq i64 %t2214, 0
  br i1 %t2215, label %fixfast536, label %fixslow537
fixfast536:
  %t2216 = add i64 %a2, 8
  br label %fixmerge538
fixslow537:
  %t2217 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge538
fixmerge538:
  %t2218 = phi i64 [ %t2216, %fixfast536 ], [ %t2217, %fixslow537 ]
  ret i64 %t2218
else535:
  %t2219 = or i64 %a2, 8
  %t2220 = and i64 %t2219, 7
  %t2221 = icmp eq i64 %t2220, 0
  br i1 %t2221, label %fixfast539, label %fixslow540
fixfast539:
  %t2222 = add i64 %a2, 8
  br label %fixmerge541
fixslow540:
  %t2223 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge541
fixmerge541:
  %t2224 = phi i64 [ %t2222, %fixfast539 ], [ %t2223, %fixslow540 ]
  %t2225 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2226 = and i64 %t2225, -8
  %t2227 = inttoptr i64 %t2226 to ptr
  %t2228 = load i64, ptr %t2227
  %t2229 = inttoptr i64 %t2228 to ptr
  %t2230 = musttail call fastcc i64 %t2229(i64 %t2225, i64 3, i64 %a0, i64 %a1, i64 %t2224, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2230
else530:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_591"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2235 = icmp eq i64 %argc, 3
  br i1 %t2235, label %argok543, label %arityerr542
arityerr542:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok543:
  %t2236 = or i64 %a2, %a1
  %t2237 = and i64 %t2236, 7
  %t2238 = icmp eq i64 %t2237, 0
  br i1 %t2238, label %fixfast544, label %fixslow545
fixfast544:
  %t2239 = icmp slt i64 %a2, %a1
  %t2240 = select i1 %t2239, i64 257, i64 1
  br label %fixmerge546
fixslow545:
  %t2241 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge546
fixmerge546:
  %t2242 = phi i64 [ %t2240, %fixfast544 ], [ %t2241, %fixslow545 ]
  %t2243 = icmp ne i64 %t2242, 1
  br i1 %t2243, label %then547, label %else548
then547:
  %t2244 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2245 = load i64, ptr @"scheme.base:rd-ws?"
  %t2246 = and i64 %t2245, -8
  %t2247 = inttoptr i64 %t2246 to ptr
  %t2248 = load i64, ptr %t2247
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = call fastcc i64%t2249(i64 %t2245, i64 1, i64 %t2244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2251 = icmp ne i64 %t2250, 1
  br i1 %t2251, label %then549, label %else550
then549:
  %t2252 = or i64 %a2, 8
  %t2253 = and i64 %t2252, 7
  %t2254 = icmp eq i64 %t2253, 0
  br i1 %t2254, label %fixfast551, label %fixslow552
fixfast551:
  %t2255 = add i64 %a2, 8
  br label %fixmerge553
fixslow552:
  %t2256 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge553
fixmerge553:
  %t2257 = phi i64 [ %t2255, %fixfast551 ], [ %t2256, %fixslow552 ]
  %t2258 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2259 = and i64 %t2258, -8
  %t2260 = inttoptr i64 %t2259 to ptr
  %t2261 = load i64, ptr %t2260
  %t2262 = inttoptr i64 %t2261 to ptr
  %t2263 = musttail call fastcc i64 %t2262(i64 %t2258, i64 3, i64 %a0, i64 %a1, i64 %t2257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2263
else550:
  %t2264 = call i64 @rt_char_to_integer(i64 %t2244)
  %t2265 = or i64 %t2264, 472
  %t2266 = and i64 %t2265, 7
  %t2267 = icmp eq i64 %t2266, 0
  br i1 %t2267, label %fixfast554, label %fixslow555
fixfast554:
  %t2268 = icmp eq i64 %t2264, 472
  %t2269 = select i1 %t2268, i64 257, i64 1
  br label %fixmerge556
fixslow555:
  %t2270 = call i64 @rt_num_eq(i64 %t2264, i64 472)
  br label %fixmerge556
fixmerge556:
  %t2271 = phi i64 [ %t2269, %fixfast554 ], [ %t2270, %fixslow555 ]
  %t2272 = icmp ne i64 %t2271, 1
  br i1 %t2272, label %then557, label %else558
then557:
  %t2273 = or i64 %a2, 8
  %t2274 = and i64 %t2273, 7
  %t2275 = icmp eq i64 %t2274, 0
  br i1 %t2275, label %fixfast559, label %fixslow560
fixfast559:
  %t2276 = add i64 %a2, 8
  br label %fixmerge561
fixslow560:
  %t2277 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge561
fixmerge561:
  %t2278 = phi i64 [ %t2276, %fixfast559 ], [ %t2277, %fixslow560 ]
  %t2279 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2280 = and i64 %t2279, -8
  %t2281 = inttoptr i64 %t2280 to ptr
  %t2282 = load i64, ptr %t2281
  %t2283 = inttoptr i64 %t2282 to ptr
  %t2284 = call fastcc i64%t2283(i64 %t2279, i64 3, i64 %a0, i64 %a1, i64 %t2278, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2285 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2286 = and i64 %t2285, -8
  %t2287 = inttoptr i64 %t2286 to ptr
  %t2288 = load i64, ptr %t2287
  %t2289 = inttoptr i64 %t2288 to ptr
  %t2290 = musttail call fastcc i64 %t2289(i64 %t2285, i64 3, i64 %a0, i64 %a1, i64 %t2284, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2290
else558:
  ret i64 %a2
else548:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_600"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2295 = icmp eq i64 %argc, 3
  br i1 %t2295, label %argok563, label %arityerr562
arityerr562:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok563:
  %t2296 = or i64 %a2, %a1
  %t2297 = and i64 %t2296, 7
  %t2298 = icmp eq i64 %t2297, 0
  br i1 %t2298, label %fixfast564, label %fixslow565
fixfast564:
  %t2299 = icmp slt i64 %a2, %a1
  %t2300 = select i1 %t2299, i64 257, i64 1
  br label %fixmerge566
fixslow565:
  %t2301 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge566
fixmerge566:
  %t2302 = phi i64 [ %t2300, %fixfast564 ], [ %t2301, %fixslow565 ]
  %t2303 = icmp ne i64 %t2302, 1
  br i1 %t2303, label %then567, label %else568
then567:
  %t2304 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2305 = load i64, ptr @"scheme.base:rd-delim?"
  %t2306 = and i64 %t2305, -8
  %t2307 = inttoptr i64 %t2306 to ptr
  %t2308 = load i64, ptr %t2307
  %t2309 = inttoptr i64 %t2308 to ptr
  %t2310 = call fastcc i64%t2309(i64 %t2305, i64 1, i64 %t2304, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2311 = icmp ne i64 %t2310, 1
  br i1 %t2311, label %then569, label %else570
then569:
  ret i64 %a2
else570:
  %t2312 = or i64 %a2, 8
  %t2313 = and i64 %t2312, 7
  %t2314 = icmp eq i64 %t2313, 0
  br i1 %t2314, label %fixfast571, label %fixslow572
fixfast571:
  %t2315 = add i64 %a2, 8
  br label %fixmerge573
fixslow572:
  %t2316 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge573
fixmerge573:
  %t2317 = phi i64 [ %t2315, %fixfast571 ], [ %t2316, %fixslow572 ]
  %t2318 = load i64, ptr @"scheme.base:rd-token-end"
  %t2319 = and i64 %t2318, -8
  %t2320 = inttoptr i64 %t2319 to ptr
  %t2321 = load i64, ptr %t2320
  %t2322 = inttoptr i64 %t2321 to ptr
  %t2323 = musttail call fastcc i64 %t2322(i64 %t2318, i64 3, i64 %a0, i64 %a1, i64 %t2317, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2323
else568:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_609"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2328 = icmp eq i64 %argc, 3
  br i1 %t2328, label %argok575, label %arityerr574
arityerr574:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok575:
  %t2329 = or i64 %a1, %a2
  %t2330 = and i64 %t2329, 7
  %t2331 = icmp eq i64 %t2330, 0
  br i1 %t2331, label %fixfast576, label %fixslow577
fixfast576:
  %t2332 = icmp slt i64 %a1, %a2
  %t2333 = select i1 %t2332, i64 257, i64 1
  br label %fixmerge578
fixslow577:
  %t2334 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge578
fixmerge578:
  %t2335 = phi i64 [ %t2333, %fixfast576 ], [ %t2334, %fixslow577 ]
  %t2336 = icmp ne i64 %t2335, 1
  br i1 %t2336, label %then579, label %else580
then579:
  %t2337 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2338 = load i64, ptr @"scheme.base:rd-digit?"
  %t2339 = and i64 %t2338, -8
  %t2340 = inttoptr i64 %t2339 to ptr
  %t2341 = load i64, ptr %t2340
  %t2342 = inttoptr i64 %t2341 to ptr
  %t2343 = call fastcc i64%t2342(i64 %t2338, i64 1, i64 %t2337, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2344 = icmp ne i64 %t2343, 1
  br i1 %t2344, label %then581, label %else582
then581:
  %t2345 = or i64 %a1, 8
  %t2346 = and i64 %t2345, 7
  %t2347 = icmp eq i64 %t2346, 0
  br i1 %t2347, label %fixfast583, label %fixslow584
fixfast583:
  %t2348 = add i64 %a1, 8
  br label %fixmerge585
fixslow584:
  %t2349 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge585
fixmerge585:
  %t2350 = phi i64 [ %t2348, %fixfast583 ], [ %t2349, %fixslow584 ]
  %t2351 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2352 = and i64 %t2351, -8
  %t2353 = inttoptr i64 %t2352 to ptr
  %t2354 = load i64, ptr %t2353
  %t2355 = inttoptr i64 %t2354 to ptr
  %t2356 = musttail call fastcc i64 %t2355(i64 %t2351, i64 3, i64 %a0, i64 %t2350, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2356
else582:
  ret i64 1
else580:
  ret i64 257
}

define fastcc i64 @"scheme.base:code_632"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2361 = icmp eq i64 %argc, 1
  br i1 %t2361, label %argok587, label %arityerr586
arityerr586:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok587:
  %t2362 = call i64 @rt_string_length(i64 %a0)
  %t2363 = or i64 0, %t2362
  %t2364 = and i64 %t2363, 7
  %t2365 = icmp eq i64 %t2364, 0
  br i1 %t2365, label %fixfast588, label %fixslow589
fixfast588:
  %t2366 = icmp slt i64 0, %t2362
  %t2367 = select i1 %t2366, i64 257, i64 1
  br label %fixmerge590
fixslow589:
  %t2368 = call i64 @rt_lt(i64 0, i64 %t2362)
  br label %fixmerge590
fixmerge590:
  %t2369 = phi i64 [ %t2367, %fixfast588 ], [ %t2368, %fixslow589 ]
  %t2370 = icmp ne i64 %t2369, 1
  br i1 %t2370, label %then591, label %else592
then591:
  %t2371 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2372 = call i64 @rt_char_to_integer(i64 %t2371)
  %t2373 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2374 = load i64, ptr @"scheme.base:rd-digit?"
  %t2375 = and i64 %t2374, -8
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = load i64, ptr %t2376
  %t2378 = inttoptr i64 %t2377 to ptr
  %t2379 = call fastcc i64%t2378(i64 %t2374, i64 1, i64 %t2373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2380 = icmp ne i64 %t2379, 1
  br i1 %t2380, label %then593, label %else594
then593:
  %t2381 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2382 = and i64 %t2381, -8
  %t2383 = inttoptr i64 %t2382 to ptr
  %t2384 = load i64, ptr %t2383
  %t2385 = inttoptr i64 %t2384 to ptr
  %t2386 = musttail call fastcc i64 %t2385(i64 %t2381, i64 3, i64 %a0, i64 0, i64 %t2362, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2386
else594:
  %t2387 = or i64 %t2372, 360
  %t2388 = and i64 %t2387, 7
  %t2389 = icmp eq i64 %t2388, 0
  br i1 %t2389, label %fixfast595, label %fixslow596
fixfast595:
  %t2390 = icmp eq i64 %t2372, 360
  %t2391 = select i1 %t2390, i64 257, i64 1
  br label %fixmerge597
fixslow596:
  %t2392 = call i64 @rt_num_eq(i64 %t2372, i64 360)
  br label %fixmerge597
fixmerge597:
  %t2393 = phi i64 [ %t2391, %fixfast595 ], [ %t2392, %fixslow596 ]
  %t2394 = icmp ne i64 %t2393, 1
  br i1 %t2394, label %then598, label %else599
then598:
  br label %merge600
else599:
  %t2395 = or i64 %t2372, 344
  %t2396 = and i64 %t2395, 7
  %t2397 = icmp eq i64 %t2396, 0
  br i1 %t2397, label %fixfast601, label %fixslow602
fixfast601:
  %t2398 = icmp eq i64 %t2372, 344
  %t2399 = select i1 %t2398, i64 257, i64 1
  br label %fixmerge603
fixslow602:
  %t2400 = call i64 @rt_num_eq(i64 %t2372, i64 344)
  br label %fixmerge603
fixmerge603:
  %t2401 = phi i64 [ %t2399, %fixfast601 ], [ %t2400, %fixslow602 ]
  br label %merge600
merge600:
  %t2402 = phi i64 [ %t2393, %then598 ], [ %t2401, %fixmerge603 ]
  %t2403 = icmp ne i64 %t2402, 1
  br i1 %t2403, label %then604, label %else605
then604:
  %t2404 = or i64 8, %t2362
  %t2405 = and i64 %t2404, 7
  %t2406 = icmp eq i64 %t2405, 0
  br i1 %t2406, label %fixfast606, label %fixslow607
fixfast606:
  %t2407 = icmp slt i64 8, %t2362
  %t2408 = select i1 %t2407, i64 257, i64 1
  br label %fixmerge608
fixslow607:
  %t2409 = call i64 @rt_lt(i64 8, i64 %t2362)
  br label %fixmerge608
fixmerge608:
  %t2410 = phi i64 [ %t2408, %fixfast606 ], [ %t2409, %fixslow607 ]
  %t2411 = icmp ne i64 %t2410, 1
  br i1 %t2411, label %then609, label %else610
then609:
  %t2412 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2413 = and i64 %t2412, -8
  %t2414 = inttoptr i64 %t2413 to ptr
  %t2415 = load i64, ptr %t2414
  %t2416 = inttoptr i64 %t2415 to ptr
  %t2417 = musttail call fastcc i64 %t2416(i64 %t2412, i64 3, i64 %a0, i64 8, i64 %t2362, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2417
else610:
  ret i64 1
else605:
  ret i64 1
else592:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_642"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2422 = icmp eq i64 %argc, 4
  br i1 %t2422, label %argok612, label %arityerr611
arityerr611:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok612:
  %t2423 = or i64 %a1, %a2
  %t2424 = and i64 %t2423, 7
  %t2425 = icmp eq i64 %t2424, 0
  br i1 %t2425, label %fixfast613, label %fixslow614
fixfast613:
  %t2426 = icmp slt i64 %a1, %a2
  %t2427 = select i1 %t2426, i64 257, i64 1
  br label %fixmerge615
fixslow614:
  %t2428 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge615
fixmerge615:
  %t2429 = phi i64 [ %t2427, %fixfast613 ], [ %t2428, %fixslow614 ]
  %t2430 = icmp ne i64 %t2429, 1
  br i1 %t2430, label %then616, label %else617
then616:
  %t2431 = or i64 %a1, 8
  %t2432 = and i64 %t2431, 7
  %t2433 = icmp eq i64 %t2432, 0
  br i1 %t2433, label %fixfast618, label %fixslow619
fixfast618:
  %t2434 = add i64 %a1, 8
  br label %fixmerge620
fixslow619:
  %t2435 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge620
fixmerge620:
  %t2436 = phi i64 [ %t2434, %fixfast618 ], [ %t2435, %fixslow619 ]
  %t2437 = or i64 %a3, 80
  %t2438 = and i64 %t2437, 7
  %t2439 = icmp eq i64 %t2438, 0
  br i1 %t2439, label %fixfast621, label %fixslow622
fixfast621:
  %t2440 = ashr i64 %a3, 3
  %t2441 = mul i64 %t2440, 80
  br label %fixmerge623
fixslow622:
  %t2442 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge623
fixmerge623:
  %t2443 = phi i64 [ %t2441, %fixfast621 ], [ %t2442, %fixslow622 ]
  %t2444 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2445 = call i64 @rt_char_to_integer(i64 %t2444)
  %t2446 = or i64 %t2445, 384
  %t2447 = and i64 %t2446, 7
  %t2448 = icmp eq i64 %t2447, 0
  br i1 %t2448, label %fixfast624, label %fixslow625
fixfast624:
  %t2449 = sub i64 %t2445, 384
  br label %fixmerge626
fixslow625:
  %t2450 = call i64 @rt_sub(i64 %t2445, i64 384)
  br label %fixmerge626
fixmerge626:
  %t2451 = phi i64 [ %t2449, %fixfast624 ], [ %t2450, %fixslow625 ]
  %t2452 = or i64 %t2443, %t2451
  %t2453 = and i64 %t2452, 7
  %t2454 = icmp eq i64 %t2453, 0
  br i1 %t2454, label %fixfast627, label %fixslow628
fixfast627:
  %t2455 = add i64 %t2443, %t2451
  br label %fixmerge629
fixslow628:
  %t2456 = call i64 @rt_add(i64 %t2443, i64 %t2451)
  br label %fixmerge629
fixmerge629:
  %t2457 = phi i64 [ %t2455, %fixfast627 ], [ %t2456, %fixslow628 ]
  %t2458 = load i64, ptr @"scheme.base:rd-digits"
  %t2459 = and i64 %t2458, -8
  %t2460 = inttoptr i64 %t2459 to ptr
  %t2461 = load i64, ptr %t2460
  %t2462 = inttoptr i64 %t2461 to ptr
  %t2463 = musttail call fastcc i64 %t2462(i64 %t2458, i64 4, i64 %a0, i64 %t2436, i64 %a2, i64 %t2457, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2463
else617:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code_655"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2468 = icmp eq i64 %argc, 1
  br i1 %t2468, label %argok631, label %arityerr630
arityerr630:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok631:
  %t2469 = call i64 @rt_string_length(i64 %a0)
  %t2470 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2471 = call i64 @rt_char_to_integer(i64 %t2470)
  %t2472 = or i64 %t2471, 360
  %t2473 = and i64 %t2472, 7
  %t2474 = icmp eq i64 %t2473, 0
  br i1 %t2474, label %fixfast632, label %fixslow633
fixfast632:
  %t2475 = icmp eq i64 %t2471, 360
  %t2476 = select i1 %t2475, i64 257, i64 1
  br label %fixmerge634
fixslow633:
  %t2477 = call i64 @rt_num_eq(i64 %t2471, i64 360)
  br label %fixmerge634
fixmerge634:
  %t2478 = phi i64 [ %t2476, %fixfast632 ], [ %t2477, %fixslow633 ]
  %t2479 = icmp ne i64 %t2478, 1
  br i1 %t2479, label %then635, label %else636
then635:
  %t2480 = load i64, ptr @"scheme.base:rd-digits"
  %t2481 = and i64 %t2480, -8
  %t2482 = inttoptr i64 %t2481 to ptr
  %t2483 = load i64, ptr %t2482
  %t2484 = inttoptr i64 %t2483 to ptr
  %t2485 = call fastcc i64%t2484(i64 %t2480, i64 4, i64 %a0, i64 8, i64 %t2469, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2486 = or i64 0, %t2485
  %t2487 = and i64 %t2486, 7
  %t2488 = icmp eq i64 %t2487, 0
  br i1 %t2488, label %fixfast637, label %fixslow638
fixfast637:
  %t2489 = sub i64 0, %t2485
  br label %fixmerge639
fixslow638:
  %t2490 = call i64 @rt_sub(i64 0, i64 %t2485)
  br label %fixmerge639
fixmerge639:
  %t2491 = phi i64 [ %t2489, %fixfast637 ], [ %t2490, %fixslow638 ]
  ret i64 %t2491
else636:
  %t2492 = or i64 %t2471, 344
  %t2493 = and i64 %t2492, 7
  %t2494 = icmp eq i64 %t2493, 0
  br i1 %t2494, label %fixfast640, label %fixslow641
fixfast640:
  %t2495 = icmp eq i64 %t2471, 344
  %t2496 = select i1 %t2495, i64 257, i64 1
  br label %fixmerge642
fixslow641:
  %t2497 = call i64 @rt_num_eq(i64 %t2471, i64 344)
  br label %fixmerge642
fixmerge642:
  %t2498 = phi i64 [ %t2496, %fixfast640 ], [ %t2497, %fixslow641 ]
  %t2499 = icmp ne i64 %t2498, 1
  br i1 %t2499, label %then643, label %else644
then643:
  %t2500 = load i64, ptr @"scheme.base:rd-digits"
  %t2501 = and i64 %t2500, -8
  %t2502 = inttoptr i64 %t2501 to ptr
  %t2503 = load i64, ptr %t2502
  %t2504 = inttoptr i64 %t2503 to ptr
  %t2505 = musttail call fastcc i64 %t2504(i64 %t2500, i64 4, i64 %a0, i64 8, i64 %t2469, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2505
else644:
  %t2506 = load i64, ptr @"scheme.base:rd-digits"
  %t2507 = and i64 %t2506, -8
  %t2508 = inttoptr i64 %t2507 to ptr
  %t2509 = load i64, ptr %t2508
  %t2510 = inttoptr i64 %t2509 to ptr
  %t2511 = musttail call fastcc i64 %t2510(i64 %t2506, i64 4, i64 %a0, i64 0, i64 %t2469, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2511
}

define fastcc i64 @"scheme.base:code_662"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2516 = icmp eq i64 %argc, 3
  br i1 %t2516, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok646:
  %t2517 = load i64, ptr @"scheme.base:rd-token-end"
  %t2518 = and i64 %t2517, -8
  %t2519 = inttoptr i64 %t2518 to ptr
  %t2520 = load i64, ptr %t2519
  %t2521 = inttoptr i64 %t2520 to ptr
  %t2522 = call fastcc i64%t2521(i64 %t2517, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2523 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2522)
  %t2524 = load i64, ptr @"scheme.base:rd-numeric?"
  %t2525 = and i64 %t2524, -8
  %t2526 = inttoptr i64 %t2525 to ptr
  %t2527 = load i64, ptr %t2526
  %t2528 = inttoptr i64 %t2527 to ptr
  %t2529 = call fastcc i64%t2528(i64 %t2524, i64 1, i64 %t2523, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2530 = icmp ne i64 %t2529, 1
  br i1 %t2530, label %then647, label %else648
then647:
  %t2531 = load i64, ptr @"scheme.base:rd-parse-int"
  %t2532 = and i64 %t2531, -8
  %t2533 = inttoptr i64 %t2532 to ptr
  %t2534 = load i64, ptr %t2533
  %t2535 = inttoptr i64 %t2534 to ptr
  %t2536 = call fastcc i64%t2535(i64 %t2531, i64 1, i64 %t2523, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge649
else648:
  %t2537 = call i64 @rt_string_to_symbol(i64 %t2523)
  br label %merge649
merge649:
  %t2538 = phi i64 [ %t2536, %then647 ], [ %t2537, %else648 ]
  %t2539 = call i64 @rt_cons(i64 %t2538, i64 %t2522)
  ret i64 %t2539
}

define fastcc i64 @"scheme.base:code_690"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2544 = icmp eq i64 %argc, 1
  br i1 %t2544, label %argok651, label %arityerr650
arityerr650:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok651:
  %t2545 = call i64 @rt_char_to_integer(i64 %a0)
  %t2546 = or i64 376, %t2545
  %t2547 = and i64 %t2546, 7
  %t2548 = icmp eq i64 %t2547, 0
  br i1 %t2548, label %fixfast652, label %fixslow653
fixfast652:
  %t2549 = icmp slt i64 376, %t2545
  %t2550 = select i1 %t2549, i64 257, i64 1
  br label %fixmerge654
fixslow653:
  %t2551 = call i64 @rt_lt(i64 376, i64 %t2545)
  br label %fixmerge654
fixmerge654:
  %t2552 = phi i64 [ %t2550, %fixfast652 ], [ %t2551, %fixslow653 ]
  %t2553 = icmp ne i64 %t2552, 1
  br i1 %t2553, label %then655, label %else656
then655:
  %t2554 = or i64 %t2545, 464
  %t2555 = and i64 %t2554, 7
  %t2556 = icmp eq i64 %t2555, 0
  br i1 %t2556, label %fixfast658, label %fixslow659
fixfast658:
  %t2557 = icmp slt i64 %t2545, 464
  %t2558 = select i1 %t2557, i64 257, i64 1
  br label %fixmerge660
fixslow659:
  %t2559 = call i64 @rt_lt(i64 %t2545, i64 464)
  br label %fixmerge660
fixmerge660:
  %t2560 = phi i64 [ %t2558, %fixfast658 ], [ %t2559, %fixslow659 ]
  br label %merge657
else656:
  br label %merge657
merge657:
  %t2561 = phi i64 [ %t2560, %fixmerge660 ], [ 1, %else656 ]
  %t2562 = icmp ne i64 %t2561, 1
  br i1 %t2562, label %then661, label %else662
then661:
  %t2563 = or i64 %t2545, 384
  %t2564 = and i64 %t2563, 7
  %t2565 = icmp eq i64 %t2564, 0
  br i1 %t2565, label %fixfast663, label %fixslow664
fixfast663:
  %t2566 = sub i64 %t2545, 384
  br label %fixmerge665
fixslow664:
  %t2567 = call i64 @rt_sub(i64 %t2545, i64 384)
  br label %fixmerge665
fixmerge665:
  %t2568 = phi i64 [ %t2566, %fixfast663 ], [ %t2567, %fixslow664 ]
  ret i64 %t2568
else662:
  %t2569 = or i64 768, %t2545
  %t2570 = and i64 %t2569, 7
  %t2571 = icmp eq i64 %t2570, 0
  br i1 %t2571, label %fixfast666, label %fixslow667
fixfast666:
  %t2572 = icmp slt i64 768, %t2545
  %t2573 = select i1 %t2572, i64 257, i64 1
  br label %fixmerge668
fixslow667:
  %t2574 = call i64 @rt_lt(i64 768, i64 %t2545)
  br label %fixmerge668
fixmerge668:
  %t2575 = phi i64 [ %t2573, %fixfast666 ], [ %t2574, %fixslow667 ]
  %t2576 = icmp ne i64 %t2575, 1
  br i1 %t2576, label %then669, label %else670
then669:
  %t2577 = or i64 %t2545, 824
  %t2578 = and i64 %t2577, 7
  %t2579 = icmp eq i64 %t2578, 0
  br i1 %t2579, label %fixfast672, label %fixslow673
fixfast672:
  %t2580 = icmp slt i64 %t2545, 824
  %t2581 = select i1 %t2580, i64 257, i64 1
  br label %fixmerge674
fixslow673:
  %t2582 = call i64 @rt_lt(i64 %t2545, i64 824)
  br label %fixmerge674
fixmerge674:
  %t2583 = phi i64 [ %t2581, %fixfast672 ], [ %t2582, %fixslow673 ]
  br label %merge671
else670:
  br label %merge671
merge671:
  %t2584 = phi i64 [ %t2583, %fixmerge674 ], [ 1, %else670 ]
  %t2585 = icmp ne i64 %t2584, 1
  br i1 %t2585, label %then675, label %else676
then675:
  %t2586 = or i64 %t2545, 696
  %t2587 = and i64 %t2586, 7
  %t2588 = icmp eq i64 %t2587, 0
  br i1 %t2588, label %fixfast677, label %fixslow678
fixfast677:
  %t2589 = sub i64 %t2545, 696
  br label %fixmerge679
fixslow678:
  %t2590 = call i64 @rt_sub(i64 %t2545, i64 696)
  br label %fixmerge679
fixmerge679:
  %t2591 = phi i64 [ %t2589, %fixfast677 ], [ %t2590, %fixslow678 ]
  ret i64 %t2591
else676:
  %t2592 = or i64 512, %t2545
  %t2593 = and i64 %t2592, 7
  %t2594 = icmp eq i64 %t2593, 0
  br i1 %t2594, label %fixfast680, label %fixslow681
fixfast680:
  %t2595 = icmp slt i64 512, %t2545
  %t2596 = select i1 %t2595, i64 257, i64 1
  br label %fixmerge682
fixslow681:
  %t2597 = call i64 @rt_lt(i64 512, i64 %t2545)
  br label %fixmerge682
fixmerge682:
  %t2598 = phi i64 [ %t2596, %fixfast680 ], [ %t2597, %fixslow681 ]
  %t2599 = icmp ne i64 %t2598, 1
  br i1 %t2599, label %then683, label %else684
then683:
  %t2600 = or i64 %t2545, 568
  %t2601 = and i64 %t2600, 7
  %t2602 = icmp eq i64 %t2601, 0
  br i1 %t2602, label %fixfast686, label %fixslow687
fixfast686:
  %t2603 = icmp slt i64 %t2545, 568
  %t2604 = select i1 %t2603, i64 257, i64 1
  br label %fixmerge688
fixslow687:
  %t2605 = call i64 @rt_lt(i64 %t2545, i64 568)
  br label %fixmerge688
fixmerge688:
  %t2606 = phi i64 [ %t2604, %fixfast686 ], [ %t2605, %fixslow687 ]
  br label %merge685
else684:
  br label %merge685
merge685:
  %t2607 = phi i64 [ %t2606, %fixmerge688 ], [ 1, %else684 ]
  %t2608 = icmp ne i64 %t2607, 1
  br i1 %t2608, label %then689, label %else690
then689:
  %t2609 = or i64 %t2545, 440
  %t2610 = and i64 %t2609, 7
  %t2611 = icmp eq i64 %t2610, 0
  br i1 %t2611, label %fixfast691, label %fixslow692
fixfast691:
  %t2612 = sub i64 %t2545, 440
  br label %fixmerge693
fixslow692:
  %t2613 = call i64 @rt_sub(i64 %t2545, i64 440)
  br label %fixmerge693
fixmerge693:
  %t2614 = phi i64 [ %t2612, %fixfast691 ], [ %t2613, %fixslow692 ]
  ret i64 %t2614
else690:
  ret i64 0
}

define fastcc i64 @"scheme.base:code_704"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2619 = icmp eq i64 %argc, 4
  br i1 %t2619, label %argok695, label %arityerr694
arityerr694:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok695:
  %t2620 = or i64 %a2, %a1
  %t2621 = and i64 %t2620, 7
  %t2622 = icmp eq i64 %t2621, 0
  br i1 %t2622, label %fixfast696, label %fixslow697
fixfast696:
  %t2623 = icmp slt i64 %a2, %a1
  %t2624 = select i1 %t2623, i64 257, i64 1
  br label %fixmerge698
fixslow697:
  %t2625 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge698
fixmerge698:
  %t2626 = phi i64 [ %t2624, %fixfast696 ], [ %t2625, %fixslow697 ]
  %t2627 = icmp ne i64 %t2626, 1
  br i1 %t2627, label %then699, label %else700
then699:
  %t2628 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2629 = call i64 @rt_char_to_integer(i64 %t2628)
  %t2630 = or i64 %t2629, 472
  %t2631 = and i64 %t2630, 7
  %t2632 = icmp eq i64 %t2631, 0
  br i1 %t2632, label %fixfast701, label %fixslow702
fixfast701:
  %t2633 = icmp eq i64 %t2629, 472
  %t2634 = select i1 %t2633, i64 257, i64 1
  br label %fixmerge703
fixslow702:
  %t2635 = call i64 @rt_num_eq(i64 %t2629, i64 472)
  br label %fixmerge703
fixmerge703:
  %t2636 = phi i64 [ %t2634, %fixfast701 ], [ %t2635, %fixslow702 ]
  %t2637 = icmp ne i64 %t2636, 1
  br i1 %t2637, label %then704, label %else705
then704:
  %t2638 = or i64 %a2, 8
  %t2639 = and i64 %t2638, 7
  %t2640 = icmp eq i64 %t2639, 0
  br i1 %t2640, label %fixfast706, label %fixslow707
fixfast706:
  %t2641 = add i64 %a2, 8
  br label %fixmerge708
fixslow707:
  %t2642 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge708
fixmerge708:
  %t2643 = phi i64 [ %t2641, %fixfast706 ], [ %t2642, %fixslow707 ]
  %t2644 = call i64 @rt_cons(i64 %a3, i64 %t2643)
  ret i64 %t2644
else705:
  %t2645 = or i64 %a2, 8
  %t2646 = and i64 %t2645, 7
  %t2647 = icmp eq i64 %t2646, 0
  br i1 %t2647, label %fixfast709, label %fixslow710
fixfast709:
  %t2648 = add i64 %a2, 8
  br label %fixmerge711
fixslow710:
  %t2649 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge711
fixmerge711:
  %t2650 = phi i64 [ %t2648, %fixfast709 ], [ %t2649, %fixslow710 ]
  %t2651 = or i64 %a3, 128
  %t2652 = and i64 %t2651, 7
  %t2653 = icmp eq i64 %t2652, 0
  br i1 %t2653, label %fixfast712, label %fixslow713
fixfast712:
  %t2654 = ashr i64 %a3, 3
  %t2655 = mul i64 %t2654, 128
  br label %fixmerge714
fixslow713:
  %t2656 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge714
fixmerge714:
  %t2657 = phi i64 [ %t2655, %fixfast712 ], [ %t2656, %fixslow713 ]
  %t2658 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2659 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t2660 = and i64 %t2659, -8
  %t2661 = inttoptr i64 %t2660 to ptr
  %t2662 = load i64, ptr %t2661
  %t2663 = inttoptr i64 %t2662 to ptr
  %t2664 = call fastcc i64%t2663(i64 %t2659, i64 1, i64 %t2658, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2665 = or i64 %t2657, %t2664
  %t2666 = and i64 %t2665, 7
  %t2667 = icmp eq i64 %t2666, 0
  br i1 %t2667, label %fixfast715, label %fixslow716
fixfast715:
  %t2668 = add i64 %t2657, %t2664
  br label %fixmerge717
fixslow716:
  %t2669 = call i64 @rt_add(i64 %t2657, i64 %t2664)
  br label %fixmerge717
fixmerge717:
  %t2670 = phi i64 [ %t2668, %fixfast715 ], [ %t2669, %fixslow716 ]
  %t2671 = load i64, ptr @"scheme.base:rd-hex"
  %t2672 = and i64 %t2671, -8
  %t2673 = inttoptr i64 %t2672 to ptr
  %t2674 = load i64, ptr %t2673
  %t2675 = inttoptr i64 %t2674 to ptr
  %t2676 = musttail call fastcc i64 %t2675(i64 %t2671, i64 4, i64 %a0, i64 %a1, i64 %t2650, i64 %t2670, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2676
else700:
  %t2677 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2677
}

define fastcc i64 @"scheme.base:code_720"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2682 = icmp eq i64 %argc, 1
  br i1 %t2682, label %argok719, label %arityerr718
arityerr718:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok719:
  %t2683 = call i64 @rt_char_to_integer(i64 %a0)
  %t2684 = or i64 %t2683, 880
  %t2685 = and i64 %t2684, 7
  %t2686 = icmp eq i64 %t2685, 0
  br i1 %t2686, label %fixfast720, label %fixslow721
fixfast720:
  %t2687 = icmp eq i64 %t2683, 880
  %t2688 = select i1 %t2687, i64 257, i64 1
  br label %fixmerge722
fixslow721:
  %t2689 = call i64 @rt_num_eq(i64 %t2683, i64 880)
  br label %fixmerge722
fixmerge722:
  %t2690 = phi i64 [ %t2688, %fixfast720 ], [ %t2689, %fixslow721 ]
  %t2691 = icmp ne i64 %t2690, 1
  br i1 %t2691, label %then723, label %else724
then723:
  %t2692 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2692
else724:
  %t2693 = or i64 %t2683, 928
  %t2694 = and i64 %t2693, 7
  %t2695 = icmp eq i64 %t2694, 0
  br i1 %t2695, label %fixfast725, label %fixslow726
fixfast725:
  %t2696 = icmp eq i64 %t2683, 928
  %t2697 = select i1 %t2696, i64 257, i64 1
  br label %fixmerge727
fixslow726:
  %t2698 = call i64 @rt_num_eq(i64 %t2683, i64 928)
  br label %fixmerge727
fixmerge727:
  %t2699 = phi i64 [ %t2697, %fixfast725 ], [ %t2698, %fixslow726 ]
  %t2700 = icmp ne i64 %t2699, 1
  br i1 %t2700, label %then728, label %else729
then728:
  %t2701 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2701
else729:
  %t2702 = or i64 %t2683, 912
  %t2703 = and i64 %t2702, 7
  %t2704 = icmp eq i64 %t2703, 0
  br i1 %t2704, label %fixfast730, label %fixslow731
fixfast730:
  %t2705 = icmp eq i64 %t2683, 912
  %t2706 = select i1 %t2705, i64 257, i64 1
  br label %fixmerge732
fixslow731:
  %t2707 = call i64 @rt_num_eq(i64 %t2683, i64 912)
  br label %fixmerge732
fixmerge732:
  %t2708 = phi i64 [ %t2706, %fixfast730 ], [ %t2707, %fixslow731 ]
  %t2709 = icmp ne i64 %t2708, 1
  br i1 %t2709, label %then733, label %else734
then733:
  %t2710 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2710
else734:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_750"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2715 = icmp eq i64 %argc, 2
  br i1 %t2715, label %argok736, label %arityerr735
arityerr735:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok736:
  %t2716 = and i64 %self, -8
  %t2717 = inttoptr i64 %t2716 to ptr
  %t2718 = getelementptr i64, ptr %t2717, i64 1
  %t2719 = load i64, ptr %t2718
  %t2720 = or i64 %a0, %t2719
  %t2721 = and i64 %t2720, 7
  %t2722 = icmp eq i64 %t2721, 0
  br i1 %t2722, label %fixfast737, label %fixslow738
fixfast737:
  %t2723 = icmp slt i64 %a0, %t2719
  %t2724 = select i1 %t2723, i64 257, i64 1
  br label %fixmerge739
fixslow738:
  %t2725 = call i64 @rt_lt(i64 %a0, i64 %t2719)
  br label %fixmerge739
fixmerge739:
  %t2726 = phi i64 [ %t2724, %fixfast737 ], [ %t2725, %fixslow738 ]
  %t2727 = icmp ne i64 %t2726, 1
  br i1 %t2727, label %then740, label %else741
then740:
  %t2728 = and i64 %self, -8
  %t2729 = inttoptr i64 %t2728 to ptr
  %t2730 = getelementptr i64, ptr %t2729, i64 2
  %t2731 = load i64, ptr %t2730
  %t2732 = call i64 @rt_string_ref(i64 %t2731, i64 %a0)
  %t2733 = call i64 @rt_char_to_integer(i64 %t2732)
  %t2734 = or i64 %t2733, 272
  %t2735 = and i64 %t2734, 7
  %t2736 = icmp eq i64 %t2735, 0
  br i1 %t2736, label %fixfast742, label %fixslow743
fixfast742:
  %t2737 = icmp eq i64 %t2733, 272
  %t2738 = select i1 %t2737, i64 257, i64 1
  br label %fixmerge744
fixslow743:
  %t2739 = call i64 @rt_num_eq(i64 %t2733, i64 272)
  br label %fixmerge744
fixmerge744:
  %t2740 = phi i64 [ %t2738, %fixfast742 ], [ %t2739, %fixslow743 ]
  %t2741 = icmp ne i64 %t2740, 1
  br i1 %t2741, label %then745, label %else746
then745:
  %t2742 = load i64, ptr @"scheme.base:reverse"
  %t2743 = and i64 %t2742, -8
  %t2744 = inttoptr i64 %t2743 to ptr
  %t2745 = load i64, ptr %t2744
  %t2746 = inttoptr i64 %t2745 to ptr
  %t2747 = call fastcc i64%t2746(i64 %t2742, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2748 = call i64 @rt_list_to_string(i64 %t2747)
  %t2749 = or i64 %a0, 8
  %t2750 = and i64 %t2749, 7
  %t2751 = icmp eq i64 %t2750, 0
  br i1 %t2751, label %fixfast747, label %fixslow748
fixfast747:
  %t2752 = add i64 %a0, 8
  br label %fixmerge749
fixslow748:
  %t2753 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge749
fixmerge749:
  %t2754 = phi i64 [ %t2752, %fixfast747 ], [ %t2753, %fixslow748 ]
  %t2755 = call i64 @rt_cons(i64 %t2748, i64 %t2754)
  ret i64 %t2755
else746:
  %t2756 = or i64 %t2733, 736
  %t2757 = and i64 %t2756, 7
  %t2758 = icmp eq i64 %t2757, 0
  br i1 %t2758, label %fixfast750, label %fixslow751
fixfast750:
  %t2759 = icmp eq i64 %t2733, 736
  %t2760 = select i1 %t2759, i64 257, i64 1
  br label %fixmerge752
fixslow751:
  %t2761 = call i64 @rt_num_eq(i64 %t2733, i64 736)
  br label %fixmerge752
fixmerge752:
  %t2762 = phi i64 [ %t2760, %fixfast750 ], [ %t2761, %fixslow751 ]
  %t2763 = icmp ne i64 %t2762, 1
  br i1 %t2763, label %then753, label %else754
then753:
  %t2764 = and i64 %self, -8
  %t2765 = inttoptr i64 %t2764 to ptr
  %t2766 = getelementptr i64, ptr %t2765, i64 2
  %t2767 = load i64, ptr %t2766
  %t2768 = or i64 %a0, 8
  %t2769 = and i64 %t2768, 7
  %t2770 = icmp eq i64 %t2769, 0
  br i1 %t2770, label %fixfast755, label %fixslow756
fixfast755:
  %t2771 = add i64 %a0, 8
  br label %fixmerge757
fixslow756:
  %t2772 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge757
fixmerge757:
  %t2773 = phi i64 [ %t2771, %fixfast755 ], [ %t2772, %fixslow756 ]
  %t2774 = call i64 @rt_string_ref(i64 %t2767, i64 %t2773)
  %t2775 = call i64 @rt_char_to_integer(i64 %t2774)
  %t2776 = or i64 %t2775, 960
  %t2777 = and i64 %t2776, 7
  %t2778 = icmp eq i64 %t2777, 0
  br i1 %t2778, label %fixfast758, label %fixslow759
fixfast758:
  %t2779 = icmp eq i64 %t2775, 960
  %t2780 = select i1 %t2779, i64 257, i64 1
  br label %fixmerge760
fixslow759:
  %t2781 = call i64 @rt_num_eq(i64 %t2775, i64 960)
  br label %fixmerge760
fixmerge760:
  %t2782 = phi i64 [ %t2780, %fixfast758 ], [ %t2781, %fixslow759 ]
  %t2783 = icmp ne i64 %t2782, 1
  br i1 %t2783, label %then761, label %else762
then761:
  %t2784 = and i64 %self, -8
  %t2785 = inttoptr i64 %t2784 to ptr
  %t2786 = getelementptr i64, ptr %t2785, i64 2
  %t2787 = load i64, ptr %t2786
  %t2788 = and i64 %self, -8
  %t2789 = inttoptr i64 %t2788 to ptr
  %t2790 = getelementptr i64, ptr %t2789, i64 1
  %t2791 = load i64, ptr %t2790
  %t2792 = or i64 %a0, 16
  %t2793 = and i64 %t2792, 7
  %t2794 = icmp eq i64 %t2793, 0
  br i1 %t2794, label %fixfast763, label %fixslow764
fixfast763:
  %t2795 = add i64 %a0, 16
  br label %fixmerge765
fixslow764:
  %t2796 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge765
fixmerge765:
  %t2797 = phi i64 [ %t2795, %fixfast763 ], [ %t2796, %fixslow764 ]
  %t2798 = load i64, ptr @"scheme.base:rd-hex"
  %t2799 = and i64 %t2798, -8
  %t2800 = inttoptr i64 %t2799 to ptr
  %t2801 = load i64, ptr %t2800
  %t2802 = inttoptr i64 %t2801 to ptr
  %t2803 = call fastcc i64%t2802(i64 %t2798, i64 4, i64 %t2787, i64 %t2791, i64 %t2797, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2804 = call i64 @rt_cdr(i64 %t2803)
  %t2805 = call i64 @rt_car(i64 %t2803)
  %t2806 = call i64 @rt_integer_to_char(i64 %t2805)
  %t2807 = call i64 @rt_cons(i64 %t2806, i64 %a1)
  %t2808 = musttail call fastcc i64 @"scheme.base:code_750"(i64 %self, i64 2, i64 %t2804, i64 %t2807, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2808
else762:
  %t2809 = or i64 %a0, 16
  %t2810 = and i64 %t2809, 7
  %t2811 = icmp eq i64 %t2810, 0
  br i1 %t2811, label %fixfast766, label %fixslow767
fixfast766:
  %t2812 = add i64 %a0, 16
  br label %fixmerge768
fixslow767:
  %t2813 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge768
fixmerge768:
  %t2814 = phi i64 [ %t2812, %fixfast766 ], [ %t2813, %fixslow767 ]
  %t2815 = load i64, ptr @"scheme.base:rd-str-esc"
  %t2816 = and i64 %t2815, -8
  %t2817 = inttoptr i64 %t2816 to ptr
  %t2818 = load i64, ptr %t2817
  %t2819 = inttoptr i64 %t2818 to ptr
  %t2820 = call fastcc i64%t2819(i64 %t2815, i64 1, i64 %t2774, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2821 = call i64 @rt_cons(i64 %t2820, i64 %a1)
  %t2822 = musttail call fastcc i64 @"scheme.base:code_750"(i64 %self, i64 2, i64 %t2814, i64 %t2821, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2822
else754:
  %t2823 = or i64 %a0, 8
  %t2824 = and i64 %t2823, 7
  %t2825 = icmp eq i64 %t2824, 0
  br i1 %t2825, label %fixfast769, label %fixslow770
fixfast769:
  %t2826 = add i64 %a0, 8
  br label %fixmerge771
fixslow770:
  %t2827 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge771
fixmerge771:
  %t2828 = phi i64 [ %t2826, %fixfast769 ], [ %t2827, %fixslow770 ]
  %t2829 = call i64 @rt_cons(i64 %t2732, i64 %a1)
  %t2830 = musttail call fastcc i64 @"scheme.base:code_750"(i64 %self, i64 2, i64 %t2828, i64 %t2829, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2830
else741:
  %t2831 = load i64, ptr @"scheme.base:reverse"
  %t2832 = and i64 %t2831, -8
  %t2833 = inttoptr i64 %t2832 to ptr
  %t2834 = load i64, ptr %t2833
  %t2835 = inttoptr i64 %t2834 to ptr
  %t2836 = call fastcc i64%t2835(i64 %t2831, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2837 = call i64 @rt_list_to_string(i64 %t2836)
  %t2838 = call i64 @rt_cons(i64 %t2837, i64 %a0)
  ret i64 %t2838
}

define fastcc i64 @"scheme.base:code_748"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2839 = icmp eq i64 %argc, 3
  br i1 %t2839, label %argok773, label %arityerr772
arityerr772:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok773:
  %t2840 = call i64 @rt_alloc_words(i64 4)
  %t2841 = inttoptr i64 %t2840 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_750" to i64), ptr %t2841
  %t2842 = or i64 %t2840, 4
  %t2843 = getelementptr i64, ptr %t2841, i64 1
  store i64 %a1, ptr %t2843
  %t2844 = getelementptr i64, ptr %t2841, i64 2
  store i64 %a0, ptr %t2844
  %t2845 = getelementptr i64, ptr %t2841, i64 3
  store i64 %t2842, ptr %t2845
  %t2846 = and i64 %t2842, -8
  %t2847 = inttoptr i64 %t2846 to ptr
  %t2848 = load i64, ptr %t2847
  %t2849 = inttoptr i64 %t2848 to ptr
  %t2850 = musttail call fastcc i64 %t2849(i64 %t2842, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2850
}

define fastcc i64 @"scheme.base:code_791"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2855 = icmp eq i64 %argc, 3
  br i1 %t2855, label %argok775, label %arityerr774
arityerr774:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok775:
  %t2856 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2857 = call i64 @rt_char_to_integer(i64 %t2856)
  %t2858 = or i64 %t2857, 928
  %t2859 = and i64 %t2858, 7
  %t2860 = icmp eq i64 %t2859, 0
  br i1 %t2860, label %fixfast776, label %fixslow777
fixfast776:
  %t2861 = icmp eq i64 %t2857, 928
  %t2862 = select i1 %t2861, i64 257, i64 1
  br label %fixmerge778
fixslow777:
  %t2863 = call i64 @rt_num_eq(i64 %t2857, i64 928)
  br label %fixmerge778
fixmerge778:
  %t2864 = phi i64 [ %t2862, %fixfast776 ], [ %t2863, %fixslow777 ]
  %t2865 = icmp ne i64 %t2864, 1
  br i1 %t2865, label %then779, label %else780
then779:
  %t2866 = or i64 %a2, 8
  %t2867 = and i64 %t2866, 7
  %t2868 = icmp eq i64 %t2867, 0
  br i1 %t2868, label %fixfast781, label %fixslow782
fixfast781:
  %t2869 = add i64 %a2, 8
  br label %fixmerge783
fixslow782:
  %t2870 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge783
fixmerge783:
  %t2871 = phi i64 [ %t2869, %fixfast781 ], [ %t2870, %fixslow782 ]
  %t2872 = call i64 @rt_cons(i64 257, i64 %t2871)
  ret i64 %t2872
else780:
  %t2873 = or i64 %t2857, 816
  %t2874 = and i64 %t2873, 7
  %t2875 = icmp eq i64 %t2874, 0
  br i1 %t2875, label %fixfast784, label %fixslow785
fixfast784:
  %t2876 = icmp eq i64 %t2857, 816
  %t2877 = select i1 %t2876, i64 257, i64 1
  br label %fixmerge786
fixslow785:
  %t2878 = call i64 @rt_num_eq(i64 %t2857, i64 816)
  br label %fixmerge786
fixmerge786:
  %t2879 = phi i64 [ %t2877, %fixfast784 ], [ %t2878, %fixslow785 ]
  %t2880 = icmp ne i64 %t2879, 1
  br i1 %t2880, label %then787, label %else788
then787:
  %t2881 = or i64 %a2, 8
  %t2882 = and i64 %t2881, 7
  %t2883 = icmp eq i64 %t2882, 0
  br i1 %t2883, label %fixfast789, label %fixslow790
fixfast789:
  %t2884 = add i64 %a2, 8
  br label %fixmerge791
fixslow790:
  %t2885 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge791
fixmerge791:
  %t2886 = phi i64 [ %t2884, %fixfast789 ], [ %t2885, %fixslow790 ]
  %t2887 = call i64 @rt_cons(i64 1, i64 %t2886)
  ret i64 %t2887
else788:
  %t2888 = or i64 %t2857, 736
  %t2889 = and i64 %t2888, 7
  %t2890 = icmp eq i64 %t2889, 0
  br i1 %t2890, label %fixfast792, label %fixslow793
fixfast792:
  %t2891 = icmp eq i64 %t2857, 736
  %t2892 = select i1 %t2891, i64 257, i64 1
  br label %fixmerge794
fixslow793:
  %t2893 = call i64 @rt_num_eq(i64 %t2857, i64 736)
  br label %fixmerge794
fixmerge794:
  %t2894 = phi i64 [ %t2892, %fixfast792 ], [ %t2893, %fixslow793 ]
  %t2895 = icmp ne i64 %t2894, 1
  br i1 %t2895, label %then795, label %else796
then795:
  %t2896 = load i64, ptr @"scheme.base:rd-char"
  %t2897 = and i64 %t2896, -8
  %t2898 = inttoptr i64 %t2897 to ptr
  %t2899 = load i64, ptr %t2898
  %t2900 = inttoptr i64 %t2899 to ptr
  %t2901 = musttail call fastcc i64 %t2900(i64 %t2896, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2901
else796:
  %t2902 = or i64 %t2857, 320
  %t2903 = and i64 %t2902, 7
  %t2904 = icmp eq i64 %t2903, 0
  br i1 %t2904, label %fixfast797, label %fixslow798
fixfast797:
  %t2905 = icmp eq i64 %t2857, 320
  %t2906 = select i1 %t2905, i64 257, i64 1
  br label %fixmerge799
fixslow798:
  %t2907 = call i64 @rt_num_eq(i64 %t2857, i64 320)
  br label %fixmerge799
fixmerge799:
  %t2908 = phi i64 [ %t2906, %fixfast797 ], [ %t2907, %fixslow798 ]
  %t2909 = icmp ne i64 %t2908, 1
  br i1 %t2909, label %then800, label %else801
then800:
  %t2910 = or i64 %a2, 8
  %t2911 = and i64 %t2910, 7
  %t2912 = icmp eq i64 %t2911, 0
  br i1 %t2912, label %fixfast802, label %fixslow803
fixfast802:
  %t2913 = add i64 %a2, 8
  br label %fixmerge804
fixslow803:
  %t2914 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge804
fixmerge804:
  %t2915 = phi i64 [ %t2913, %fixfast802 ], [ %t2914, %fixslow803 ]
  %t2916 = load i64, ptr @"scheme.base:rd-list"
  %t2917 = and i64 %t2916, -8
  %t2918 = inttoptr i64 %t2917 to ptr
  %t2919 = load i64, ptr %t2918
  %t2920 = inttoptr i64 %t2919 to ptr
  %t2921 = call fastcc i64%t2920(i64 %t2916, i64 4, i64 %a0, i64 %a1, i64 %t2915, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2922 = call i64 @rt_car(i64 %t2921)
  %t2923 = load i64, ptr @"scheme.base:list->vector"
  %t2924 = and i64 %t2923, -8
  %t2925 = inttoptr i64 %t2924 to ptr
  %t2926 = load i64, ptr %t2925
  %t2927 = inttoptr i64 %t2926 to ptr
  %t2928 = call fastcc i64%t2927(i64 %t2923, i64 1, i64 %t2922, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2929 = call i64 @rt_cdr(i64 %t2921)
  %t2930 = call i64 @rt_cons(i64 %t2928, i64 %t2929)
  ret i64 %t2930
else801:
  %t2931 = or i64 %t2857, 936
  %t2932 = and i64 %t2931, 7
  %t2933 = icmp eq i64 %t2932, 0
  br i1 %t2933, label %fixfast805, label %fixslow806
fixfast805:
  %t2934 = icmp eq i64 %t2857, 936
  %t2935 = select i1 %t2934, i64 257, i64 1
  br label %fixmerge807
fixslow806:
  %t2936 = call i64 @rt_num_eq(i64 %t2857, i64 936)
  br label %fixmerge807
fixmerge807:
  %t2937 = phi i64 [ %t2935, %fixfast805 ], [ %t2936, %fixslow806 ]
  %t2938 = icmp ne i64 %t2937, 1
  br i1 %t2938, label %then808, label %else809
then808:
  %t2939 = or i64 %a2, 16
  %t2940 = and i64 %t2939, 7
  %t2941 = icmp eq i64 %t2940, 0
  br i1 %t2941, label %fixfast811, label %fixslow812
fixfast811:
  %t2942 = add i64 %a2, 16
  br label %fixmerge813
fixslow812:
  %t2943 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge813
fixmerge813:
  %t2944 = phi i64 [ %t2942, %fixfast811 ], [ %t2943, %fixslow812 ]
  %t2945 = or i64 %t2944, %a1
  %t2946 = and i64 %t2945, 7
  %t2947 = icmp eq i64 %t2946, 0
  br i1 %t2947, label %fixfast814, label %fixslow815
fixfast814:
  %t2948 = icmp slt i64 %t2944, %a1
  %t2949 = select i1 %t2948, i64 257, i64 1
  br label %fixmerge816
fixslow815:
  %t2950 = call i64 @rt_lt(i64 %t2944, i64 %a1)
  br label %fixmerge816
fixmerge816:
  %t2951 = phi i64 [ %t2949, %fixfast814 ], [ %t2950, %fixslow815 ]
  %t2952 = icmp ne i64 %t2951, 1
  br i1 %t2952, label %then817, label %else818
then817:
  %t2953 = or i64 %a2, 8
  %t2954 = and i64 %t2953, 7
  %t2955 = icmp eq i64 %t2954, 0
  br i1 %t2955, label %fixfast820, label %fixslow821
fixfast820:
  %t2956 = add i64 %a2, 8
  br label %fixmerge822
fixslow821:
  %t2957 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge822
fixmerge822:
  %t2958 = phi i64 [ %t2956, %fixfast820 ], [ %t2957, %fixslow821 ]
  %t2959 = call i64 @rt_string_ref(i64 %a0, i64 %t2958)
  %t2960 = call i64 @rt_char_to_integer(i64 %t2959)
  %t2961 = or i64 %t2960, 448
  %t2962 = and i64 %t2961, 7
  %t2963 = icmp eq i64 %t2962, 0
  br i1 %t2963, label %fixfast823, label %fixslow824
fixfast823:
  %t2964 = icmp eq i64 %t2960, 448
  %t2965 = select i1 %t2964, i64 257, i64 1
  br label %fixmerge825
fixslow824:
  %t2966 = call i64 @rt_num_eq(i64 %t2960, i64 448)
  br label %fixmerge825
fixmerge825:
  %t2967 = phi i64 [ %t2965, %fixfast823 ], [ %t2966, %fixslow824 ]
  %t2968 = icmp ne i64 %t2967, 1
  br i1 %t2968, label %then826, label %else827
then826:
  %t2969 = or i64 %a2, 16
  %t2970 = and i64 %t2969, 7
  %t2971 = icmp eq i64 %t2970, 0
  br i1 %t2971, label %fixfast829, label %fixslow830
fixfast829:
  %t2972 = add i64 %a2, 16
  br label %fixmerge831
fixslow830:
  %t2973 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge831
fixmerge831:
  %t2974 = phi i64 [ %t2972, %fixfast829 ], [ %t2973, %fixslow830 ]
  %t2975 = call i64 @rt_string_ref(i64 %a0, i64 %t2974)
  %t2976 = call i64 @rt_char_to_integer(i64 %t2975)
  %t2977 = or i64 %t2976, 320
  %t2978 = and i64 %t2977, 7
  %t2979 = icmp eq i64 %t2978, 0
  br i1 %t2979, label %fixfast832, label %fixslow833
fixfast832:
  %t2980 = icmp eq i64 %t2976, 320
  %t2981 = select i1 %t2980, i64 257, i64 1
  br label %fixmerge834
fixslow833:
  %t2982 = call i64 @rt_num_eq(i64 %t2976, i64 320)
  br label %fixmerge834
fixmerge834:
  %t2983 = phi i64 [ %t2981, %fixfast832 ], [ %t2982, %fixslow833 ]
  br label %merge828
else827:
  br label %merge828
merge828:
  %t2984 = phi i64 [ %t2983, %fixmerge834 ], [ 1, %else827 ]
  br label %merge819
else818:
  br label %merge819
merge819:
  %t2985 = phi i64 [ %t2984, %merge828 ], [ 1, %else818 ]
  br label %merge810
else809:
  br label %merge810
merge810:
  %t2986 = phi i64 [ %t2985, %merge819 ], [ 1, %else809 ]
  %t2987 = icmp ne i64 %t2986, 1
  br i1 %t2987, label %then835, label %else836
then835:
  %t2988 = or i64 %a2, 24
  %t2989 = and i64 %t2988, 7
  %t2990 = icmp eq i64 %t2989, 0
  br i1 %t2990, label %fixfast837, label %fixslow838
fixfast837:
  %t2991 = add i64 %a2, 24
  br label %fixmerge839
fixslow838:
  %t2992 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge839
fixmerge839:
  %t2993 = phi i64 [ %t2991, %fixfast837 ], [ %t2992, %fixslow838 ]
  %t2994 = load i64, ptr @"scheme.base:rd-list"
  %t2995 = and i64 %t2994, -8
  %t2996 = inttoptr i64 %t2995 to ptr
  %t2997 = load i64, ptr %t2996
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = call fastcc i64%t2998(i64 %t2994, i64 4, i64 %a0, i64 %a1, i64 %t2993, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3000 = call i64 @rt_car(i64 %t2999)
  %t3001 = load i64, ptr @"scheme.base:list->bytevector"
  %t3002 = and i64 %t3001, -8
  %t3003 = inttoptr i64 %t3002 to ptr
  %t3004 = load i64, ptr %t3003
  %t3005 = inttoptr i64 %t3004 to ptr
  %t3006 = call fastcc i64%t3005(i64 %t3001, i64 1, i64 %t3000, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3007 = call i64 @rt_cdr(i64 %t2999)
  %t3008 = call i64 @rt_cons(i64 %t3006, i64 %t3007)
  ret i64 %t3008
else836:
  %t3009 = load i64, ptr @"scheme.base:rd-token-end"
  %t3010 = and i64 %t3009, -8
  %t3011 = inttoptr i64 %t3010 to ptr
  %t3012 = load i64, ptr %t3011
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = call fastcc i64%t3013(i64 %t3009, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3015 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3014)
  %t3016 = call i64 @rt_string_to_symbol(i64 %t3015)
  %t3017 = call i64 @rt_cons(i64 %t3016, i64 %t3014)
  ret i64 %t3017
}

define fastcc i64 @"scheme.base:code_794"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3022 = icmp eq i64 %argc, 1
  br i1 %t3022, label %argok841, label %arityerr840
arityerr840:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok841:
  %t3023 = call i64 @rt_make_string(ptr @.str.lit.4, i64 5)
  %t3024 = call i64 @rt_string_eq(i64 %a0, i64 %t3023)
  %t3025 = icmp ne i64 %t3024, 1
  br i1 %t3025, label %then842, label %else843
then842:
  %t3026 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3026
else843:
  %t3027 = call i64 @rt_make_string(ptr @.str.lit.5, i64 7)
  %t3028 = call i64 @rt_string_eq(i64 %a0, i64 %t3027)
  %t3029 = icmp ne i64 %t3028, 1
  br i1 %t3029, label %then844, label %else845
then844:
  %t3030 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3030
else845:
  %t3031 = call i64 @rt_make_string(ptr @.str.lit.6, i64 3)
  %t3032 = call i64 @rt_string_eq(i64 %a0, i64 %t3031)
  %t3033 = icmp ne i64 %t3032, 1
  br i1 %t3033, label %then846, label %else847
then846:
  %t3034 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3034
else847:
  %t3035 = call i64 @rt_make_string(ptr @.str.lit.7, i64 6)
  %t3036 = call i64 @rt_string_eq(i64 %a0, i64 %t3035)
  %t3037 = icmp ne i64 %t3036, 1
  br i1 %t3037, label %then848, label %else849
then848:
  %t3038 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3038
else849:
  %t3039 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t3040 = call i64 @rt_string_eq(i64 %a0, i64 %t3039)
  %t3041 = icmp ne i64 %t3040, 1
  br i1 %t3041, label %then850, label %else851
then850:
  %t3042 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3042
else851:
  %t3043 = call i64 @rt_make_string(ptr @.str.lit.9, i64 4)
  %t3044 = call i64 @rt_string_eq(i64 %a0, i64 %t3043)
  %t3045 = icmp ne i64 %t3044, 1
  br i1 %t3045, label %then852, label %else853
then852:
  %t3046 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3046
else853:
  %t3047 = call i64 @rt_make_string(ptr @.str.lit.10, i64 6)
  %t3048 = call i64 @rt_string_eq(i64 %a0, i64 %t3047)
  %t3049 = icmp ne i64 %t3048, 1
  br i1 %t3049, label %then854, label %else855
then854:
  %t3050 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3050
else855:
  %t3051 = call i64 @rt_make_string(ptr @.str.lit.11, i64 7)
  %t3052 = call i64 @rt_string_eq(i64 %a0, i64 %t3051)
  %t3053 = icmp ne i64 %t3052, 1
  br i1 %t3053, label %then856, label %else857
then856:
  %t3054 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3054
else857:
  %t3055 = call i64 @rt_make_string(ptr @.str.lit.12, i64 3)
  %t3056 = call i64 @rt_string_eq(i64 %a0, i64 %t3055)
  %t3057 = icmp ne i64 %t3056, 1
  br i1 %t3057, label %then858, label %else859
then858:
  %t3058 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3058
else859:
  %t3059 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3059
}

define fastcc i64 @"scheme.base:code_806"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3064 = icmp eq i64 %argc, 3
  br i1 %t3064, label %argok861, label %arityerr860
arityerr860:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok861:
  %t3065 = or i64 %a2, 8
  %t3066 = and i64 %t3065, 7
  %t3067 = icmp eq i64 %t3066, 0
  br i1 %t3067, label %fixfast862, label %fixslow863
fixfast862:
  %t3068 = add i64 %a2, 8
  br label %fixmerge864
fixslow863:
  %t3069 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge864
fixmerge864:
  %t3070 = phi i64 [ %t3068, %fixfast862 ], [ %t3069, %fixslow863 ]
  %t3071 = or i64 %t3070, 8
  %t3072 = and i64 %t3071, 7
  %t3073 = icmp eq i64 %t3072, 0
  br i1 %t3073, label %fixfast865, label %fixslow866
fixfast865:
  %t3074 = add i64 %t3070, 8
  br label %fixmerge867
fixslow866:
  %t3075 = call i64 @rt_add(i64 %t3070, i64 8)
  br label %fixmerge867
fixmerge867:
  %t3076 = phi i64 [ %t3074, %fixfast865 ], [ %t3075, %fixslow866 ]
  %t3077 = load i64, ptr @"scheme.base:rd-token-end"
  %t3078 = and i64 %t3077, -8
  %t3079 = inttoptr i64 %t3078 to ptr
  %t3080 = load i64, ptr %t3079
  %t3081 = inttoptr i64 %t3080 to ptr
  %t3082 = call fastcc i64%t3081(i64 %t3077, i64 3, i64 %a0, i64 %a1, i64 %t3076, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3083 = call i64 @rt_substring(i64 %a0, i64 %t3070, i64 %t3082)
  %t3084 = call i64 @rt_string_length(i64 %t3083)
  %t3085 = or i64 %t3084, 8
  %t3086 = and i64 %t3085, 7
  %t3087 = icmp eq i64 %t3086, 0
  br i1 %t3087, label %fixfast868, label %fixslow869
fixfast868:
  %t3088 = icmp eq i64 %t3084, 8
  %t3089 = select i1 %t3088, i64 257, i64 1
  br label %fixmerge870
fixslow869:
  %t3090 = call i64 @rt_num_eq(i64 %t3084, i64 8)
  br label %fixmerge870
fixmerge870:
  %t3091 = phi i64 [ %t3089, %fixfast868 ], [ %t3090, %fixslow869 ]
  %t3092 = icmp ne i64 %t3091, 1
  br i1 %t3092, label %then871, label %else872
then871:
  %t3093 = call i64 @rt_string_ref(i64 %a0, i64 %t3070)
  %t3094 = call i64 @rt_cons(i64 %t3093, i64 %t3082)
  ret i64 %t3094
else872:
  %t3095 = load i64, ptr @"scheme.base:rd-char-name"
  %t3096 = and i64 %t3095, -8
  %t3097 = inttoptr i64 %t3096 to ptr
  %t3098 = load i64, ptr %t3097
  %t3099 = inttoptr i64 %t3098 to ptr
  %t3100 = call fastcc i64%t3099(i64 %t3095, i64 1, i64 %t3083, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3101 = call i64 @rt_cons(i64 %t3100, i64 %t3082)
  ret i64 %t3101
}

define fastcc i64 @"scheme.base:code_813"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3106 = icmp eq i64 %argc, 3
  br i1 %t3106, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok874:
  %t3107 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3108 = and i64 %t3107, -8
  %t3109 = inttoptr i64 %t3108 to ptr
  %t3110 = load i64, ptr %t3109
  %t3111 = inttoptr i64 %t3110 to ptr
  %t3112 = call fastcc i64%t3111(i64 %t3107, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3113 = load i64, ptr @"scheme.base:rd-datum"
  %t3114 = and i64 %t3113, -8
  %t3115 = inttoptr i64 %t3114 to ptr
  %t3116 = load i64, ptr %t3115
  %t3117 = inttoptr i64 %t3116 to ptr
  %t3118 = call fastcc i64%t3117(i64 %t3113, i64 3, i64 %a0, i64 %a1, i64 %t3112, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3119 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3120 = call i64 @rt_car(i64 %t3118)
  %t3121 = load i64, ptr @"scheme.base:list"
  %t3122 = and i64 %t3121, -8
  %t3123 = inttoptr i64 %t3122 to ptr
  %t3124 = load i64, ptr %t3123
  %t3125 = inttoptr i64 %t3124 to ptr
  %t3126 = call fastcc i64%t3125(i64 %t3121, i64 2, i64 %t3119, i64 %t3120, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3127 = call i64 @rt_cdr(i64 %t3118)
  %t3128 = call i64 @rt_cons(i64 %t3126, i64 %t3127)
  ret i64 %t3128
}

define fastcc i64 @"scheme.base:code_820"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3133 = icmp eq i64 %argc, 3
  br i1 %t3133, label %argok876, label %arityerr875
arityerr875:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok876:
  %t3134 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3135 = and i64 %t3134, -8
  %t3136 = inttoptr i64 %t3135 to ptr
  %t3137 = load i64, ptr %t3136
  %t3138 = inttoptr i64 %t3137 to ptr
  %t3139 = call fastcc i64%t3138(i64 %t3134, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3140 = load i64, ptr @"scheme.base:rd-datum"
  %t3141 = and i64 %t3140, -8
  %t3142 = inttoptr i64 %t3141 to ptr
  %t3143 = load i64, ptr %t3142
  %t3144 = inttoptr i64 %t3143 to ptr
  %t3145 = call fastcc i64%t3144(i64 %t3140, i64 3, i64 %a0, i64 %a1, i64 %t3139, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3146 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3147 = call i64 @rt_car(i64 %t3145)
  %t3148 = load i64, ptr @"scheme.base:list"
  %t3149 = and i64 %t3148, -8
  %t3150 = inttoptr i64 %t3149 to ptr
  %t3151 = load i64, ptr %t3150
  %t3152 = inttoptr i64 %t3151 to ptr
  %t3153 = call fastcc i64%t3152(i64 %t3148, i64 2, i64 %t3146, i64 %t3147, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3154 = call i64 @rt_cdr(i64 %t3145)
  %t3155 = call i64 @rt_cons(i64 %t3153, i64 %t3154)
  ret i64 %t3155
}

define fastcc i64 @"scheme.base:code_837"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3160 = icmp eq i64 %argc, 3
  br i1 %t3160, label %argok878, label %arityerr877
arityerr877:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok878:
  %t3161 = or i64 %a2, %a1
  %t3162 = and i64 %t3161, 7
  %t3163 = icmp eq i64 %t3162, 0
  br i1 %t3163, label %fixfast879, label %fixslow880
fixfast879:
  %t3164 = icmp slt i64 %a2, %a1
  %t3165 = select i1 %t3164, i64 257, i64 1
  br label %fixmerge881
fixslow880:
  %t3166 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge881
fixmerge881:
  %t3167 = phi i64 [ %t3165, %fixfast879 ], [ %t3166, %fixslow880 ]
  %t3168 = icmp ne i64 %t3167, 1
  br i1 %t3168, label %then882, label %else883
then882:
  %t3169 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3170 = call i64 @rt_char_to_integer(i64 %t3169)
  %t3171 = or i64 %t3170, 512
  %t3172 = and i64 %t3171, 7
  %t3173 = icmp eq i64 %t3172, 0
  br i1 %t3173, label %fixfast885, label %fixslow886
fixfast885:
  %t3174 = icmp eq i64 %t3170, 512
  %t3175 = select i1 %t3174, i64 257, i64 1
  br label %fixmerge887
fixslow886:
  %t3176 = call i64 @rt_num_eq(i64 %t3170, i64 512)
  br label %fixmerge887
fixmerge887:
  %t3177 = phi i64 [ %t3175, %fixfast885 ], [ %t3176, %fixslow886 ]
  br label %merge884
else883:
  br label %merge884
merge884:
  %t3178 = phi i64 [ %t3177, %fixmerge887 ], [ 1, %else883 ]
  %t3179 = icmp ne i64 %t3178, 1
  br i1 %t3179, label %then888, label %else889
then888:
  %t3180 = or i64 %a2, 8
  %t3181 = and i64 %t3180, 7
  %t3182 = icmp eq i64 %t3181, 0
  br i1 %t3182, label %fixfast890, label %fixslow891
fixfast890:
  %t3183 = add i64 %a2, 8
  br label %fixmerge892
fixslow891:
  %t3184 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge892
fixmerge892:
  %t3185 = phi i64 [ %t3183, %fixfast890 ], [ %t3184, %fixslow891 ]
  %t3186 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3187 = and i64 %t3186, -8
  %t3188 = inttoptr i64 %t3187 to ptr
  %t3189 = load i64, ptr %t3188
  %t3190 = inttoptr i64 %t3189 to ptr
  %t3191 = call fastcc i64%t3190(i64 %t3186, i64 3, i64 %a0, i64 %a1, i64 %t3185, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3192 = load i64, ptr @"scheme.base:rd-datum"
  %t3193 = and i64 %t3192, -8
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = load i64, ptr %t3194
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = call fastcc i64%t3196(i64 %t3192, i64 3, i64 %a0, i64 %a1, i64 %t3191, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3198 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3199 = call i64 @rt_car(i64 %t3197)
  %t3200 = load i64, ptr @"scheme.base:list"
  %t3201 = and i64 %t3200, -8
  %t3202 = inttoptr i64 %t3201 to ptr
  %t3203 = load i64, ptr %t3202
  %t3204 = inttoptr i64 %t3203 to ptr
  %t3205 = call fastcc i64%t3204(i64 %t3200, i64 2, i64 %t3198, i64 %t3199, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3206 = call i64 @rt_cdr(i64 %t3197)
  %t3207 = call i64 @rt_cons(i64 %t3205, i64 %t3206)
  ret i64 %t3207
else889:
  %t3208 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3209 = and i64 %t3208, -8
  %t3210 = inttoptr i64 %t3209 to ptr
  %t3211 = load i64, ptr %t3210
  %t3212 = inttoptr i64 %t3211 to ptr
  %t3213 = call fastcc i64%t3212(i64 %t3208, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3214 = load i64, ptr @"scheme.base:rd-datum"
  %t3215 = and i64 %t3214, -8
  %t3216 = inttoptr i64 %t3215 to ptr
  %t3217 = load i64, ptr %t3216
  %t3218 = inttoptr i64 %t3217 to ptr
  %t3219 = call fastcc i64%t3218(i64 %t3214, i64 3, i64 %a0, i64 %a1, i64 %t3213, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3220 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3221 = call i64 @rt_car(i64 %t3219)
  %t3222 = load i64, ptr @"scheme.base:list"
  %t3223 = and i64 %t3222, -8
  %t3224 = inttoptr i64 %t3223 to ptr
  %t3225 = load i64, ptr %t3224
  %t3226 = inttoptr i64 %t3225 to ptr
  %t3227 = call fastcc i64%t3226(i64 %t3222, i64 2, i64 %t3220, i64 %t3221, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3228 = call i64 @rt_cdr(i64 %t3219)
  %t3229 = call i64 @rt_cons(i64 %t3227, i64 %t3228)
  ret i64 %t3229
}

define fastcc i64 @"scheme.base:code_850"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3234 = icmp eq i64 %argc, 3
  br i1 %t3234, label %argok894, label %arityerr893
arityerr893:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok894:
  %t3235 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3236 = call i64 @rt_char_to_integer(i64 %t3235)
  %t3237 = or i64 %t3236, 368
  %t3238 = and i64 %t3237, 7
  %t3239 = icmp eq i64 %t3238, 0
  br i1 %t3239, label %fixfast895, label %fixslow896
fixfast895:
  %t3240 = icmp eq i64 %t3236, 368
  %t3241 = select i1 %t3240, i64 257, i64 1
  br label %fixmerge897
fixslow896:
  %t3242 = call i64 @rt_num_eq(i64 %t3236, i64 368)
  br label %fixmerge897
fixmerge897:
  %t3243 = phi i64 [ %t3241, %fixfast895 ], [ %t3242, %fixslow896 ]
  %t3244 = icmp ne i64 %t3243, 1
  br i1 %t3244, label %then898, label %else899
then898:
  %t3245 = or i64 %a2, 8
  %t3246 = and i64 %t3245, 7
  %t3247 = icmp eq i64 %t3246, 0
  br i1 %t3247, label %fixfast900, label %fixslow901
fixfast900:
  %t3248 = add i64 %a2, 8
  br label %fixmerge902
fixslow901:
  %t3249 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge902
fixmerge902:
  %t3250 = phi i64 [ %t3248, %fixfast900 ], [ %t3249, %fixslow901 ]
  %t3251 = load i64, ptr @"scheme.base:rd-token-end"
  %t3252 = and i64 %t3251, -8
  %t3253 = inttoptr i64 %t3252 to ptr
  %t3254 = load i64, ptr %t3253
  %t3255 = inttoptr i64 %t3254 to ptr
  %t3256 = call fastcc i64%t3255(i64 %t3251, i64 3, i64 %a0, i64 %a1, i64 %t3250, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3257 = or i64 %a2, 8
  %t3258 = and i64 %t3257, 7
  %t3259 = icmp eq i64 %t3258, 0
  br i1 %t3259, label %fixfast903, label %fixslow904
fixfast903:
  %t3260 = add i64 %a2, 8
  br label %fixmerge905
fixslow904:
  %t3261 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge905
fixmerge905:
  %t3262 = phi i64 [ %t3260, %fixfast903 ], [ %t3261, %fixslow904 ]
  %t3263 = or i64 %t3256, %t3262
  %t3264 = and i64 %t3263, 7
  %t3265 = icmp eq i64 %t3264, 0
  br i1 %t3265, label %fixfast906, label %fixslow907
fixfast906:
  %t3266 = icmp eq i64 %t3256, %t3262
  %t3267 = select i1 %t3266, i64 257, i64 1
  br label %fixmerge908
fixslow907:
  %t3268 = call i64 @rt_num_eq(i64 %t3256, i64 %t3262)
  br label %fixmerge908
fixmerge908:
  %t3269 = phi i64 [ %t3267, %fixfast906 ], [ %t3268, %fixslow907 ]
  ret i64 %t3269
else899:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_854"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3274 = icmp eq i64 %argc, 2
  br i1 %t3274, label %argok910, label %arityerr909
arityerr909:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok910:
  %t3275 = call i64 @rt_null_p(i64 %a0)
  %t3276 = icmp ne i64 %t3275, 1
  br i1 %t3276, label %then911, label %else912
then911:
  ret i64 %a1
else912:
  %t3277 = call i64 @rt_cdr(i64 %a0)
  %t3278 = call i64 @rt_car(i64 %a0)
  %t3279 = call i64 @rt_cons(i64 %t3278, i64 %a1)
  %t3280 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3281 = and i64 %t3280, -8
  %t3282 = inttoptr i64 %t3281 to ptr
  %t3283 = load i64, ptr %t3282
  %t3284 = inttoptr i64 %t3283 to ptr
  %t3285 = musttail call fastcc i64 %t3284(i64 %t3280, i64 2, i64 %t3277, i64 %t3279, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3285
}

define fastcc i64 @"scheme.base:code_879"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3290 = icmp eq i64 %argc, 4
  br i1 %t3290, label %argok914, label %arityerr913
arityerr913:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok914:
  %t3291 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3292 = and i64 %t3291, -8
  %t3293 = inttoptr i64 %t3292 to ptr
  %t3294 = load i64, ptr %t3293
  %t3295 = inttoptr i64 %t3294 to ptr
  %t3296 = call fastcc i64%t3295(i64 %t3291, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3297 = or i64 %t3296, %a1
  %t3298 = and i64 %t3297, 7
  %t3299 = icmp eq i64 %t3298, 0
  br i1 %t3299, label %fixfast915, label %fixslow916
fixfast915:
  %t3300 = icmp slt i64 %t3296, %a1
  %t3301 = select i1 %t3300, i64 257, i64 1
  br label %fixmerge917
fixslow916:
  %t3302 = call i64 @rt_lt(i64 %t3296, i64 %a1)
  br label %fixmerge917
fixmerge917:
  %t3303 = phi i64 [ %t3301, %fixfast915 ], [ %t3302, %fixslow916 ]
  %t3304 = icmp ne i64 %t3303, 1
  br i1 %t3304, label %then918, label %else919
then918:
  %t3305 = call i64 @rt_string_ref(i64 %a0, i64 %t3296)
  %t3306 = call i64 @rt_char_to_integer(i64 %t3305)
  %t3307 = or i64 %t3306, 328
  %t3308 = and i64 %t3307, 7
  %t3309 = icmp eq i64 %t3308, 0
  br i1 %t3309, label %fixfast920, label %fixslow921
fixfast920:
  %t3310 = icmp eq i64 %t3306, 328
  %t3311 = select i1 %t3310, i64 257, i64 1
  br label %fixmerge922
fixslow921:
  %t3312 = call i64 @rt_num_eq(i64 %t3306, i64 328)
  br label %fixmerge922
fixmerge922:
  %t3313 = phi i64 [ %t3311, %fixfast920 ], [ %t3312, %fixslow921 ]
  %t3314 = icmp ne i64 %t3313, 1
  br i1 %t3314, label %then923, label %else924
then923:
  br label %merge925
else924:
  %t3315 = or i64 %t3306, 744
  %t3316 = and i64 %t3315, 7
  %t3317 = icmp eq i64 %t3316, 0
  br i1 %t3317, label %fixfast926, label %fixslow927
fixfast926:
  %t3318 = icmp eq i64 %t3306, 744
  %t3319 = select i1 %t3318, i64 257, i64 1
  br label %fixmerge928
fixslow927:
  %t3320 = call i64 @rt_num_eq(i64 %t3306, i64 744)
  br label %fixmerge928
fixmerge928:
  %t3321 = phi i64 [ %t3319, %fixfast926 ], [ %t3320, %fixslow927 ]
  br label %merge925
merge925:
  %t3322 = phi i64 [ %t3313, %then923 ], [ %t3321, %fixmerge928 ]
  %t3323 = icmp ne i64 %t3322, 1
  br i1 %t3323, label %then929, label %else930
then929:
  %t3324 = load i64, ptr @"scheme.base:reverse"
  %t3325 = and i64 %t3324, -8
  %t3326 = inttoptr i64 %t3325 to ptr
  %t3327 = load i64, ptr %t3326
  %t3328 = inttoptr i64 %t3327 to ptr
  %t3329 = call fastcc i64%t3328(i64 %t3324, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3330 = or i64 %t3296, 8
  %t3331 = and i64 %t3330, 7
  %t3332 = icmp eq i64 %t3331, 0
  br i1 %t3332, label %fixfast931, label %fixslow932
fixfast931:
  %t3333 = add i64 %t3296, 8
  br label %fixmerge933
fixslow932:
  %t3334 = call i64 @rt_add(i64 %t3296, i64 8)
  br label %fixmerge933
fixmerge933:
  %t3335 = phi i64 [ %t3333, %fixfast931 ], [ %t3334, %fixslow932 ]
  %t3336 = call i64 @rt_cons(i64 %t3329, i64 %t3335)
  ret i64 %t3336
else930:
  %t3337 = load i64, ptr @"scheme.base:rd-dot?"
  %t3338 = and i64 %t3337, -8
  %t3339 = inttoptr i64 %t3338 to ptr
  %t3340 = load i64, ptr %t3339
  %t3341 = inttoptr i64 %t3340 to ptr
  %t3342 = call fastcc i64%t3341(i64 %t3337, i64 3, i64 %a0, i64 %a1, i64 %t3296, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3343 = icmp ne i64 %t3342, 1
  br i1 %t3343, label %then934, label %else935
then934:
  %t3344 = or i64 %t3296, 8
  %t3345 = and i64 %t3344, 7
  %t3346 = icmp eq i64 %t3345, 0
  br i1 %t3346, label %fixfast936, label %fixslow937
fixfast936:
  %t3347 = add i64 %t3296, 8
  br label %fixmerge938
fixslow937:
  %t3348 = call i64 @rt_add(i64 %t3296, i64 8)
  br label %fixmerge938
fixmerge938:
  %t3349 = phi i64 [ %t3347, %fixfast936 ], [ %t3348, %fixslow937 ]
  %t3350 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3351 = and i64 %t3350, -8
  %t3352 = inttoptr i64 %t3351 to ptr
  %t3353 = load i64, ptr %t3352
  %t3354 = inttoptr i64 %t3353 to ptr
  %t3355 = call fastcc i64%t3354(i64 %t3350, i64 3, i64 %a0, i64 %a1, i64 %t3349, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3356 = load i64, ptr @"scheme.base:rd-datum"
  %t3357 = and i64 %t3356, -8
  %t3358 = inttoptr i64 %t3357 to ptr
  %t3359 = load i64, ptr %t3358
  %t3360 = inttoptr i64 %t3359 to ptr
  %t3361 = call fastcc i64%t3360(i64 %t3356, i64 3, i64 %a0, i64 %a1, i64 %t3355, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3362 = call i64 @rt_cdr(i64 %t3361)
  %t3363 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3364 = and i64 %t3363, -8
  %t3365 = inttoptr i64 %t3364 to ptr
  %t3366 = load i64, ptr %t3365
  %t3367 = inttoptr i64 %t3366 to ptr
  %t3368 = call fastcc i64%t3367(i64 %t3363, i64 3, i64 %a0, i64 %a1, i64 %t3362, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3369 = call i64 @rt_car(i64 %t3361)
  %t3370 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3371 = and i64 %t3370, -8
  %t3372 = inttoptr i64 %t3371 to ptr
  %t3373 = load i64, ptr %t3372
  %t3374 = inttoptr i64 %t3373 to ptr
  %t3375 = call fastcc i64%t3374(i64 %t3370, i64 2, i64 %a3, i64 %t3369, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3376 = or i64 %t3368, 8
  %t3377 = and i64 %t3376, 7
  %t3378 = icmp eq i64 %t3377, 0
  br i1 %t3378, label %fixfast939, label %fixslow940
fixfast939:
  %t3379 = add i64 %t3368, 8
  br label %fixmerge941
fixslow940:
  %t3380 = call i64 @rt_add(i64 %t3368, i64 8)
  br label %fixmerge941
fixmerge941:
  %t3381 = phi i64 [ %t3379, %fixfast939 ], [ %t3380, %fixslow940 ]
  %t3382 = call i64 @rt_cons(i64 %t3375, i64 %t3381)
  ret i64 %t3382
else935:
  %t3383 = load i64, ptr @"scheme.base:rd-datum"
  %t3384 = and i64 %t3383, -8
  %t3385 = inttoptr i64 %t3384 to ptr
  %t3386 = load i64, ptr %t3385
  %t3387 = inttoptr i64 %t3386 to ptr
  %t3388 = call fastcc i64%t3387(i64 %t3383, i64 3, i64 %a0, i64 %a1, i64 %t3296, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3389 = call i64 @rt_cdr(i64 %t3388)
  %t3390 = call i64 @rt_car(i64 %t3388)
  %t3391 = call i64 @rt_cons(i64 %t3390, i64 %a3)
  %t3392 = load i64, ptr @"scheme.base:rd-list"
  %t3393 = and i64 %t3392, -8
  %t3394 = inttoptr i64 %t3393 to ptr
  %t3395 = load i64, ptr %t3394
  %t3396 = inttoptr i64 %t3395 to ptr
  %t3397 = musttail call fastcc i64 %t3396(i64 %t3392, i64 4, i64 %a0, i64 %a1, i64 %t3389, i64 %t3391, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3397
else919:
  %t3398 = load i64, ptr @"scheme.base:reverse"
  %t3399 = and i64 %t3398, -8
  %t3400 = inttoptr i64 %t3399 to ptr
  %t3401 = load i64, ptr %t3400
  %t3402 = inttoptr i64 %t3401 to ptr
  %t3403 = call fastcc i64%t3402(i64 %t3398, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3404 = call i64 @rt_cons(i64 %t3403, i64 %t3296)
  ret i64 %t3404
}

define fastcc i64 @"scheme.base:code_913"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3409 = icmp eq i64 %argc, 3
  br i1 %t3409, label %argok943, label %arityerr942
arityerr942:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok943:
  %t3410 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3411 = call i64 @rt_char_to_integer(i64 %t3410)
  %t3412 = or i64 %t3411, 320
  %t3413 = and i64 %t3412, 7
  %t3414 = icmp eq i64 %t3413, 0
  br i1 %t3414, label %fixfast944, label %fixslow945
fixfast944:
  %t3415 = icmp eq i64 %t3411, 320
  %t3416 = select i1 %t3415, i64 257, i64 1
  br label %fixmerge946
fixslow945:
  %t3417 = call i64 @rt_num_eq(i64 %t3411, i64 320)
  br label %fixmerge946
fixmerge946:
  %t3418 = phi i64 [ %t3416, %fixfast944 ], [ %t3417, %fixslow945 ]
  %t3419 = icmp ne i64 %t3418, 1
  br i1 %t3419, label %then947, label %else948
then947:
  %t3420 = or i64 %a2, 8
  %t3421 = and i64 %t3420, 7
  %t3422 = icmp eq i64 %t3421, 0
  br i1 %t3422, label %fixfast949, label %fixslow950
fixfast949:
  %t3423 = add i64 %a2, 8
  br label %fixmerge951
fixslow950:
  %t3424 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge951
fixmerge951:
  %t3425 = phi i64 [ %t3423, %fixfast949 ], [ %t3424, %fixslow950 ]
  %t3426 = load i64, ptr @"scheme.base:rd-list"
  %t3427 = and i64 %t3426, -8
  %t3428 = inttoptr i64 %t3427 to ptr
  %t3429 = load i64, ptr %t3428
  %t3430 = inttoptr i64 %t3429 to ptr
  %t3431 = musttail call fastcc i64 %t3430(i64 %t3426, i64 4, i64 %a0, i64 %a1, i64 %t3425, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3431
else948:
  %t3432 = or i64 %t3411, 728
  %t3433 = and i64 %t3432, 7
  %t3434 = icmp eq i64 %t3433, 0
  br i1 %t3434, label %fixfast952, label %fixslow953
fixfast952:
  %t3435 = icmp eq i64 %t3411, 728
  %t3436 = select i1 %t3435, i64 257, i64 1
  br label %fixmerge954
fixslow953:
  %t3437 = call i64 @rt_num_eq(i64 %t3411, i64 728)
  br label %fixmerge954
fixmerge954:
  %t3438 = phi i64 [ %t3436, %fixfast952 ], [ %t3437, %fixslow953 ]
  %t3439 = icmp ne i64 %t3438, 1
  br i1 %t3439, label %then955, label %else956
then955:
  %t3440 = or i64 %a2, 8
  %t3441 = and i64 %t3440, 7
  %t3442 = icmp eq i64 %t3441, 0
  br i1 %t3442, label %fixfast957, label %fixslow958
fixfast957:
  %t3443 = add i64 %a2, 8
  br label %fixmerge959
fixslow958:
  %t3444 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge959
fixmerge959:
  %t3445 = phi i64 [ %t3443, %fixfast957 ], [ %t3444, %fixslow958 ]
  %t3446 = load i64, ptr @"scheme.base:rd-list"
  %t3447 = and i64 %t3446, -8
  %t3448 = inttoptr i64 %t3447 to ptr
  %t3449 = load i64, ptr %t3448
  %t3450 = inttoptr i64 %t3449 to ptr
  %t3451 = musttail call fastcc i64 %t3450(i64 %t3446, i64 4, i64 %a0, i64 %a1, i64 %t3445, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3451
else956:
  %t3452 = or i64 %t3411, 312
  %t3453 = and i64 %t3452, 7
  %t3454 = icmp eq i64 %t3453, 0
  br i1 %t3454, label %fixfast960, label %fixslow961
fixfast960:
  %t3455 = icmp eq i64 %t3411, 312
  %t3456 = select i1 %t3455, i64 257, i64 1
  br label %fixmerge962
fixslow961:
  %t3457 = call i64 @rt_num_eq(i64 %t3411, i64 312)
  br label %fixmerge962
fixmerge962:
  %t3458 = phi i64 [ %t3456, %fixfast960 ], [ %t3457, %fixslow961 ]
  %t3459 = icmp ne i64 %t3458, 1
  br i1 %t3459, label %then963, label %else964
then963:
  %t3460 = or i64 %a2, 8
  %t3461 = and i64 %t3460, 7
  %t3462 = icmp eq i64 %t3461, 0
  br i1 %t3462, label %fixfast965, label %fixslow966
fixfast965:
  %t3463 = add i64 %a2, 8
  br label %fixmerge967
fixslow966:
  %t3464 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge967
fixmerge967:
  %t3465 = phi i64 [ %t3463, %fixfast965 ], [ %t3464, %fixslow966 ]
  %t3466 = load i64, ptr @"scheme.base:rd-quote"
  %t3467 = and i64 %t3466, -8
  %t3468 = inttoptr i64 %t3467 to ptr
  %t3469 = load i64, ptr %t3468
  %t3470 = inttoptr i64 %t3469 to ptr
  %t3471 = musttail call fastcc i64 %t3470(i64 %t3466, i64 3, i64 %a0, i64 %a1, i64 %t3465, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3471
else964:
  %t3472 = or i64 %t3411, 768
  %t3473 = and i64 %t3472, 7
  %t3474 = icmp eq i64 %t3473, 0
  br i1 %t3474, label %fixfast968, label %fixslow969
fixfast968:
  %t3475 = icmp eq i64 %t3411, 768
  %t3476 = select i1 %t3475, i64 257, i64 1
  br label %fixmerge970
fixslow969:
  %t3477 = call i64 @rt_num_eq(i64 %t3411, i64 768)
  br label %fixmerge970
fixmerge970:
  %t3478 = phi i64 [ %t3476, %fixfast968 ], [ %t3477, %fixslow969 ]
  %t3479 = icmp ne i64 %t3478, 1
  br i1 %t3479, label %then971, label %else972
then971:
  %t3480 = or i64 %a2, 8
  %t3481 = and i64 %t3480, 7
  %t3482 = icmp eq i64 %t3481, 0
  br i1 %t3482, label %fixfast973, label %fixslow974
fixfast973:
  %t3483 = add i64 %a2, 8
  br label %fixmerge975
fixslow974:
  %t3484 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge975
fixmerge975:
  %t3485 = phi i64 [ %t3483, %fixfast973 ], [ %t3484, %fixslow974 ]
  %t3486 = load i64, ptr @"scheme.base:rd-quasi"
  %t3487 = and i64 %t3486, -8
  %t3488 = inttoptr i64 %t3487 to ptr
  %t3489 = load i64, ptr %t3488
  %t3490 = inttoptr i64 %t3489 to ptr
  %t3491 = musttail call fastcc i64 %t3490(i64 %t3486, i64 3, i64 %a0, i64 %a1, i64 %t3485, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3491
else972:
  %t3492 = or i64 %t3411, 352
  %t3493 = and i64 %t3492, 7
  %t3494 = icmp eq i64 %t3493, 0
  br i1 %t3494, label %fixfast976, label %fixslow977
fixfast976:
  %t3495 = icmp eq i64 %t3411, 352
  %t3496 = select i1 %t3495, i64 257, i64 1
  br label %fixmerge978
fixslow977:
  %t3497 = call i64 @rt_num_eq(i64 %t3411, i64 352)
  br label %fixmerge978
fixmerge978:
  %t3498 = phi i64 [ %t3496, %fixfast976 ], [ %t3497, %fixslow977 ]
  %t3499 = icmp ne i64 %t3498, 1
  br i1 %t3499, label %then979, label %else980
then979:
  %t3500 = or i64 %a2, 8
  %t3501 = and i64 %t3500, 7
  %t3502 = icmp eq i64 %t3501, 0
  br i1 %t3502, label %fixfast981, label %fixslow982
fixfast981:
  %t3503 = add i64 %a2, 8
  br label %fixmerge983
fixslow982:
  %t3504 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge983
fixmerge983:
  %t3505 = phi i64 [ %t3503, %fixfast981 ], [ %t3504, %fixslow982 ]
  %t3506 = load i64, ptr @"scheme.base:rd-unquote"
  %t3507 = and i64 %t3506, -8
  %t3508 = inttoptr i64 %t3507 to ptr
  %t3509 = load i64, ptr %t3508
  %t3510 = inttoptr i64 %t3509 to ptr
  %t3511 = musttail call fastcc i64 %t3510(i64 %t3506, i64 3, i64 %a0, i64 %a1, i64 %t3505, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3511
else980:
  %t3512 = or i64 %t3411, 272
  %t3513 = and i64 %t3512, 7
  %t3514 = icmp eq i64 %t3513, 0
  br i1 %t3514, label %fixfast984, label %fixslow985
fixfast984:
  %t3515 = icmp eq i64 %t3411, 272
  %t3516 = select i1 %t3515, i64 257, i64 1
  br label %fixmerge986
fixslow985:
  %t3517 = call i64 @rt_num_eq(i64 %t3411, i64 272)
  br label %fixmerge986
fixmerge986:
  %t3518 = phi i64 [ %t3516, %fixfast984 ], [ %t3517, %fixslow985 ]
  %t3519 = icmp ne i64 %t3518, 1
  br i1 %t3519, label %then987, label %else988
then987:
  %t3520 = or i64 %a2, 8
  %t3521 = and i64 %t3520, 7
  %t3522 = icmp eq i64 %t3521, 0
  br i1 %t3522, label %fixfast989, label %fixslow990
fixfast989:
  %t3523 = add i64 %a2, 8
  br label %fixmerge991
fixslow990:
  %t3524 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge991
fixmerge991:
  %t3525 = phi i64 [ %t3523, %fixfast989 ], [ %t3524, %fixslow990 ]
  %t3526 = load i64, ptr @"scheme.base:rd-string"
  %t3527 = and i64 %t3526, -8
  %t3528 = inttoptr i64 %t3527 to ptr
  %t3529 = load i64, ptr %t3528
  %t3530 = inttoptr i64 %t3529 to ptr
  %t3531 = musttail call fastcc i64 %t3530(i64 %t3526, i64 3, i64 %a0, i64 %a1, i64 %t3525, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3531
else988:
  %t3532 = or i64 %t3411, 280
  %t3533 = and i64 %t3532, 7
  %t3534 = icmp eq i64 %t3533, 0
  br i1 %t3534, label %fixfast992, label %fixslow993
fixfast992:
  %t3535 = icmp eq i64 %t3411, 280
  %t3536 = select i1 %t3535, i64 257, i64 1
  br label %fixmerge994
fixslow993:
  %t3537 = call i64 @rt_num_eq(i64 %t3411, i64 280)
  br label %fixmerge994
fixmerge994:
  %t3538 = phi i64 [ %t3536, %fixfast992 ], [ %t3537, %fixslow993 ]
  %t3539 = icmp ne i64 %t3538, 1
  br i1 %t3539, label %then995, label %else996
then995:
  %t3540 = or i64 %a2, 8
  %t3541 = and i64 %t3540, 7
  %t3542 = icmp eq i64 %t3541, 0
  br i1 %t3542, label %fixfast997, label %fixslow998
fixfast997:
  %t3543 = add i64 %a2, 8
  br label %fixmerge999
fixslow998:
  %t3544 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge999
fixmerge999:
  %t3545 = phi i64 [ %t3543, %fixfast997 ], [ %t3544, %fixslow998 ]
  %t3546 = load i64, ptr @"scheme.base:rd-hash"
  %t3547 = and i64 %t3546, -8
  %t3548 = inttoptr i64 %t3547 to ptr
  %t3549 = load i64, ptr %t3548
  %t3550 = inttoptr i64 %t3549 to ptr
  %t3551 = musttail call fastcc i64 %t3550(i64 %t3546, i64 3, i64 %a0, i64 %a1, i64 %t3545, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3551
else996:
  %t3552 = load i64, ptr @"scheme.base:rd-atom"
  %t3553 = and i64 %t3552, -8
  %t3554 = inttoptr i64 %t3553 to ptr
  %t3555 = load i64, ptr %t3554
  %t3556 = inttoptr i64 %t3555 to ptr
  %t3557 = musttail call fastcc i64 %t3556(i64 %t3552, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3557
}

define fastcc i64 @"scheme.base:code_917"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3562 = icmp eq i64 %argc, 1
  br i1 %t3562, label %argok1001, label %arityerr1000
arityerr1000:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1001:
  %t3563 = call i64 @rt_string_length(i64 %a0)
  %t3564 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3565 = and i64 %t3564, -8
  %t3566 = inttoptr i64 %t3565 to ptr
  %t3567 = load i64, ptr %t3566
  %t3568 = inttoptr i64 %t3567 to ptr
  %t3569 = call fastcc i64%t3568(i64 %t3564, i64 3, i64 %a0, i64 %t3563, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3570 = load i64, ptr @"scheme.base:rd-datum"
  %t3571 = and i64 %t3570, -8
  %t3572 = inttoptr i64 %t3571 to ptr
  %t3573 = load i64, ptr %t3572
  %t3574 = inttoptr i64 %t3573 to ptr
  %t3575 = call fastcc i64%t3574(i64 %t3570, i64 3, i64 %a0, i64 %t3563, i64 %t3569, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3576 = call i64 @rt_car(i64 %t3575)
  ret i64 %t3576
}

define fastcc i64 @"scheme.base:code_931"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3581 = icmp eq i64 %argc, 2
  br i1 %t3581, label %argok1003, label %arityerr1002
arityerr1002:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1003:
  %t3582 = and i64 %self, -8
  %t3583 = inttoptr i64 %t3582 to ptr
  %t3584 = getelementptr i64, ptr %t3583, i64 1
  %t3585 = load i64, ptr %t3584
  %t3586 = or i64 %a0, %t3585
  %t3587 = and i64 %t3586, 7
  %t3588 = icmp eq i64 %t3587, 0
  br i1 %t3588, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t3589 = icmp slt i64 %a0, %t3585
  %t3590 = select i1 %t3589, i64 257, i64 1
  br label %fixmerge1006
fixslow1005:
  %t3591 = call i64 @rt_lt(i64 %a0, i64 %t3585)
  br label %fixmerge1006
fixmerge1006:
  %t3592 = phi i64 [ %t3590, %fixfast1004 ], [ %t3591, %fixslow1005 ]
  %t3593 = icmp ne i64 %t3592, 1
  br i1 %t3593, label %then1007, label %else1008
then1007:
  %t3594 = and i64 %self, -8
  %t3595 = inttoptr i64 %t3594 to ptr
  %t3596 = getelementptr i64, ptr %t3595, i64 2
  %t3597 = load i64, ptr %t3596
  %t3598 = and i64 %self, -8
  %t3599 = inttoptr i64 %t3598 to ptr
  %t3600 = getelementptr i64, ptr %t3599, i64 1
  %t3601 = load i64, ptr %t3600
  %t3602 = load i64, ptr @"scheme.base:rd-datum"
  %t3603 = and i64 %t3602, -8
  %t3604 = inttoptr i64 %t3603 to ptr
  %t3605 = load i64, ptr %t3604
  %t3606 = inttoptr i64 %t3605 to ptr
  %t3607 = call fastcc i64%t3606(i64 %t3602, i64 3, i64 %t3597, i64 %t3601, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3608 = and i64 %self, -8
  %t3609 = inttoptr i64 %t3608 to ptr
  %t3610 = getelementptr i64, ptr %t3609, i64 2
  %t3611 = load i64, ptr %t3610
  %t3612 = and i64 %self, -8
  %t3613 = inttoptr i64 %t3612 to ptr
  %t3614 = getelementptr i64, ptr %t3613, i64 1
  %t3615 = load i64, ptr %t3614
  %t3616 = call i64 @rt_cdr(i64 %t3607)
  %t3617 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3618 = and i64 %t3617, -8
  %t3619 = inttoptr i64 %t3618 to ptr
  %t3620 = load i64, ptr %t3619
  %t3621 = inttoptr i64 %t3620 to ptr
  %t3622 = call fastcc i64%t3621(i64 %t3617, i64 3, i64 %t3611, i64 %t3615, i64 %t3616, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3623 = call i64 @rt_car(i64 %t3607)
  %t3624 = call i64 @rt_cons(i64 %t3623, i64 %a1)
  %t3625 = musttail call fastcc i64 @"scheme.base:code_931"(i64 %self, i64 2, i64 %t3622, i64 %t3624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3625
else1008:
  %t3626 = load i64, ptr @"scheme.base:reverse"
  %t3627 = and i64 %t3626, -8
  %t3628 = inttoptr i64 %t3627 to ptr
  %t3629 = load i64, ptr %t3628
  %t3630 = inttoptr i64 %t3629 to ptr
  %t3631 = musttail call fastcc i64 %t3630(i64 %t3626, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3631
}

define fastcc i64 @"scheme.base:code_929"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3632 = icmp eq i64 %argc, 1
  br i1 %t3632, label %argok1010, label %arityerr1009
arityerr1009:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1010:
  %t3633 = call i64 @rt_string_length(i64 %a0)
  %t3634 = call i64 @rt_alloc_words(i64 4)
  %t3635 = inttoptr i64 %t3634 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_931" to i64), ptr %t3635
  %t3636 = or i64 %t3634, 4
  %t3637 = getelementptr i64, ptr %t3635, i64 1
  store i64 %t3633, ptr %t3637
  %t3638 = getelementptr i64, ptr %t3635, i64 2
  store i64 %a0, ptr %t3638
  %t3639 = getelementptr i64, ptr %t3635, i64 3
  store i64 %t3636, ptr %t3639
  %t3640 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3641 = and i64 %t3640, -8
  %t3642 = inttoptr i64 %t3641 to ptr
  %t3643 = load i64, ptr %t3642
  %t3644 = inttoptr i64 %t3643 to ptr
  %t3645 = call fastcc i64%t3644(i64 %t3640, i64 3, i64 %a0, i64 %t3633, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3646 = and i64 %t3636, -8
  %t3647 = inttoptr i64 %t3646 to ptr
  %t3648 = load i64, ptr %t3647
  %t3649 = inttoptr i64 %t3648 to ptr
  %t3650 = musttail call fastcc i64 %t3649(i64 %t3636, i64 2, i64 %t3645, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3650
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
  %t162 = call i64 @rt_alloc_words(i64 1)
  %t163 = inttoptr i64 %t162 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_43" to i64), ptr %t163
  %t164 = or i64 %t162, 4
  %t165 = call i64 @rt_root(i64 %t164)
  store i64 %t165, ptr @"scheme.base:length"
  ret i64 %t165
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t183 = call i64 @rt_alloc_words(i64 1)
  %t184 = inttoptr i64 %t183 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_51" to i64), ptr %t184
  %t185 = or i64 %t183, 4
  %t186 = call i64 @rt_root(i64 %t185)
  store i64 %t186, ptr @"scheme.base:reverse"
  ret i64 %t186
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t199 = call i64 @rt_alloc_words(i64 1)
  %t200 = inttoptr i64 %t199 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_57" to i64), ptr %t200
  %t201 = or i64 %t199, 4
  %t202 = call i64 @rt_root(i64 %t201)
  store i64 %t202, ptr @"scheme.base:%append2"
  ret i64 %t202
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t257 = call i64 @rt_alloc_words(i64 1)
  %t258 = inttoptr i64 %t257 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_60" to i64), ptr %t258
  %t259 = or i64 %t257, 4
  %t260 = call i64 @rt_root(i64 %t259)
  store i64 %t260, ptr @"scheme.base:append"
  ret i64 %t260
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t278 = call i64 @rt_alloc_words(i64 1)
  %t279 = inttoptr i64 %t278 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_64" to i64), ptr %t279
  %t280 = or i64 %t278, 4
  %t281 = call i64 @rt_root(i64 %t280)
  store i64 %t281, ptr @"scheme.base:%map1"
  ret i64 %t281
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t295 = call i64 @rt_alloc_words(i64 1)
  %t296 = inttoptr i64 %t295 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_67" to i64), ptr %t296
  %t297 = or i64 %t295, 4
  %t298 = call i64 @rt_root(i64 %t297)
  store i64 %t298, ptr @"scheme.base:%any-null?"
  ret i64 %t298
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t363 = call i64 @rt_alloc_words(i64 1)
  %t364 = inttoptr i64 %t363 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_73" to i64), ptr %t364
  %t365 = or i64 %t363, 4
  %t366 = call i64 @rt_root(i64 %t365)
  store i64 %t366, ptr @"scheme.base:%mapn"
  ret i64 %t366
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t394 = call i64 @rt_alloc_words(i64 1)
  %t395 = inttoptr i64 %t394 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_82" to i64), ptr %t395
  %t396 = or i64 %t394, 4
  %t397 = call i64 @rt_root(i64 %t396)
  store i64 %t397, ptr @"scheme.base:map"
  ret i64 %t397
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t411 = call i64 @rt_alloc_words(i64 1)
  %t412 = inttoptr i64 %t411 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_90" to i64), ptr %t412
  %t413 = or i64 %t411, 4
  %t414 = call i64 @rt_root(i64 %t413)
  store i64 %t414, ptr @"scheme.base:memq"
  ret i64 %t414
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t428 = call i64 @rt_alloc_words(i64 1)
  %t429 = inttoptr i64 %t428 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_98" to i64), ptr %t429
  %t430 = or i64 %t428, 4
  %t431 = call i64 @rt_root(i64 %t430)
  store i64 %t431, ptr @"scheme.base:memv"
  ret i64 %t431
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t447 = call i64 @rt_alloc_words(i64 1)
  %t448 = inttoptr i64 %t447 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_106" to i64), ptr %t448
  %t449 = or i64 %t447, 4
  %t450 = call i64 @rt_root(i64 %t449)
  store i64 %t450, ptr @"scheme.base:assq"
  ret i64 %t450
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t464 = call i64 @rt_alloc_words(i64 1)
  %t465 = inttoptr i64 %t464 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_110" to i64), ptr %t465
  %t466 = or i64 %t464, 4
  %t467 = call i64 @rt_root(i64 %t466)
  store i64 %t467, ptr @"scheme.base:member"
  ret i64 %t467
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t483 = call i64 @rt_alloc_words(i64 1)
  %t484 = inttoptr i64 %t483 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_114" to i64), ptr %t484
  %t485 = or i64 %t483, 4
  %t486 = call i64 @rt_root(i64 %t485)
  store i64 %t486, ptr @"scheme.base:assoc"
  ret i64 %t486
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t513 = call i64 @rt_alloc_words(i64 1)
  %t514 = inttoptr i64 %t513 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_118" to i64), ptr %t514
  %t515 = or i64 %t513, 4
  %t516 = call i64 @rt_root(i64 %t515)
  store i64 %t516, ptr @"scheme.base:filter"
  ret i64 %t516
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t533 = call i64 @rt_alloc_words(i64 1)
  %t534 = inttoptr i64 %t533 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_123" to i64), ptr %t534
  %t535 = or i64 %t533, 4
  %t536 = call i64 @rt_root(i64 %t535)
  store i64 %t536, ptr @"scheme.base:fold-left"
  ret i64 %t536
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t553 = call i64 @rt_alloc_words(i64 1)
  %t554 = inttoptr i64 %t553 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_128" to i64), ptr %t554
  %t555 = or i64 %t553, 4
  %t556 = call i64 @rt_root(i64 %t555)
  store i64 %t556, ptr @"scheme.base:fold-right"
  ret i64 %t556
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t574 = call i64 @rt_alloc_words(i64 1)
  %t575 = inttoptr i64 %t574 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_132" to i64), ptr %t575
  %t576 = or i64 %t574, 4
  %t577 = call i64 @rt_root(i64 %t576)
  store i64 %t577, ptr @"scheme.base:%for-each1"
  ret i64 %t577
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t642 = call i64 @rt_alloc_words(i64 1)
  %t643 = inttoptr i64 %t642 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_138" to i64), ptr %t643
  %t644 = or i64 %t642, 4
  %t645 = call i64 @rt_root(i64 %t644)
  store i64 %t645, ptr @"scheme.base:%for-eachn"
  ret i64 %t645
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t673 = call i64 @rt_alloc_words(i64 1)
  %t674 = inttoptr i64 %t673 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_147" to i64), ptr %t674
  %t675 = or i64 %t673, 4
  %t676 = call i64 @rt_root(i64 %t675)
  store i64 %t676, ptr @"scheme.base:for-each"
  ret i64 %t676
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t694 = call i64 @rt_alloc_words(i64 1)
  %t695 = inttoptr i64 %t694 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_151" to i64), ptr %t695
  %t696 = or i64 %t694, 4
  %t697 = call i64 @rt_root(i64 %t696)
  store i64 %t697, ptr @"scheme.base:andmap"
  ret i64 %t697
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t715 = call i64 @rt_alloc_words(i64 1)
  %t716 = inttoptr i64 %t715 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_155" to i64), ptr %t716
  %t717 = or i64 %t715, 4
  %t718 = call i64 @rt_root(i64 %t717)
  store i64 %t718, ptr @"scheme.base:memp"
  ret i64 %t718
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t727 = call i64 @rt_alloc_words(i64 1)
  %t728 = inttoptr i64 %t727 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_158" to i64), ptr %t728
  %t729 = or i64 %t727, 4
  %t730 = call i64 @rt_root(i64 %t729)
  store i64 %t730, ptr @"scheme.base:cadddr"
  ret i64 %t730
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t743 = call i64 @rt_alloc_words(i64 1)
  %t744 = inttoptr i64 %t743 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_161" to i64), ptr %t744
  %t745 = or i64 %t743, 4
  %t746 = call i64 @rt_root(i64 %t745)
  store i64 %t746, ptr @"scheme.base:list?"
  ret i64 %t746
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t755 = call i64 @rt_alloc_words(i64 1)
  %t756 = inttoptr i64 %t755 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_168" to i64), ptr %t756
  %t757 = or i64 %t755, 4
  %t758 = call i64 @rt_root(i64 %t757)
  store i64 %t758, ptr @"scheme.base:zero?"
  ret i64 %t758
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
  %t819 = call i64 @rt_alloc_words(i64 1)
  %t820 = inttoptr i64 %t819 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_180" to i64), ptr %t820
  %t821 = or i64 %t819, 4
  %t822 = call i64 @rt_root(i64 %t821)
  store i64 %t822, ptr @"scheme.base:list-head"
  ret i64 %t822
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t844 = call i64 @rt_alloc_words(i64 1)
  %t845 = inttoptr i64 %t844 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_184" to i64), ptr %t845
  %t846 = or i64 %t844, 4
  %t847 = call i64 @rt_root(i64 %t846)
  store i64 %t847, ptr @"scheme.base:make-list"
  ret i64 %t847
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t886 = call i64 @rt_alloc_words(i64 1)
  %t887 = inttoptr i64 %t886 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_194" to i64), ptr %t887
  %t888 = or i64 %t886, 4
  %t889 = call i64 @rt_root(i64 %t888)
  store i64 %t889, ptr @"scheme.base:iota"
  ret i64 %t889
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t899 = call i64 @rt_alloc_words(i64 1)
  %t900 = inttoptr i64 %t899 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_204" to i64), ptr %t900
  %t901 = or i64 %t899, 4
  %t902 = call i64 @rt_root(i64 %t901)
  store i64 %t902, ptr @"scheme.base:max"
  ret i64 %t902
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t905 = call i64 @rt_alloc_words(i64 1)
  %t906 = inttoptr i64 %t905 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_206" to i64), ptr %t906
  %t907 = or i64 %t905, 4
  %t908 = call i64 @rt_root(i64 %t907)
  store i64 %t908, ptr @"scheme.base:void"
  ret i64 %t908
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t922 = call i64 @rt_alloc_words(i64 1)
  %t923 = inttoptr i64 %t922 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_209" to i64), ptr %t923
  %t924 = or i64 %t922, 4
  %t925 = call i64 @rt_root(i64 %t924)
  store i64 %t925, ptr @"scheme.base:string"
  ret i64 %t925
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t939 = call i64 @rt_alloc_words(i64 1)
  %t940 = inttoptr i64 %t939 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_212" to i64), ptr %t940
  %t941 = or i64 %t939, 4
  %t942 = call i64 @rt_root(i64 %t941)
  store i64 %t942, ptr @"scheme.base:%str-concat"
  ret i64 %t942
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t962 = call i64 @rt_alloc_words(i64 1)
  %t963 = inttoptr i64 %t962 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_218" to i64), ptr %t963
  %t964 = or i64 %t962, 4
  %t965 = call i64 @rt_root(i64 %t964)
  store i64 %t965, ptr @"scheme.base:chr-cmp"
  ret i64 %t965
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t995 = call i64 @rt_alloc_words(i64 1)
  %t996 = inttoptr i64 %t995 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_229" to i64), ptr %t996
  %t997 = or i64 %t995, 4
  %t998 = call i64 @rt_root(i64 %t997)
  store i64 %t998, ptr @"scheme.base:char=?"
  ret i64 %t998
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1028 = call i64 @rt_alloc_words(i64 1)
  %t1029 = inttoptr i64 %t1028 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_242" to i64), ptr %t1029
  %t1030 = or i64 %t1028, 4
  %t1031 = call i64 @rt_root(i64 %t1030)
  store i64 %t1031, ptr @"scheme.base:char<?"
  ret i64 %t1031
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1061 = call i64 @rt_alloc_words(i64 1)
  %t1062 = inttoptr i64 %t1061 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_255" to i64), ptr %t1062
  %t1063 = or i64 %t1061, 4
  %t1064 = call i64 @rt_root(i64 %t1063)
  store i64 %t1064, ptr @"scheme.base:char>?"
  ret i64 %t1064
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1102 = call i64 @rt_alloc_words(i64 1)
  %t1103 = inttoptr i64 %t1102 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_268" to i64), ptr %t1103
  %t1104 = or i64 %t1102, 4
  %t1105 = call i64 @rt_root(i64 %t1104)
  store i64 %t1105, ptr @"scheme.base:char<=?"
  ret i64 %t1105
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1143 = call i64 @rt_alloc_words(i64 1)
  %t1144 = inttoptr i64 %t1143 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_281" to i64), ptr %t1144
  %t1145 = or i64 %t1143, 4
  %t1146 = call i64 @rt_root(i64 %t1145)
  store i64 %t1146, ptr @"scheme.base:char>=?"
  ret i64 %t1146
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1187 = call i64 @rt_alloc_words(i64 1)
  %t1188 = inttoptr i64 %t1187 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_293" to i64), ptr %t1188
  %t1189 = or i64 %t1187, 4
  %t1190 = call i64 @rt_root(i64 %t1189)
  store i64 %t1190, ptr @"scheme.base:string->list"
  ret i64 %t1190
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1223 = call i64 @rt_alloc_words(i64 1)
  %t1224 = inttoptr i64 %t1223 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_305" to i64), ptr %t1224
  %t1225 = or i64 %t1223, 4
  %t1226 = call i64 @rt_root(i64 %t1225)
  store i64 %t1226, ptr @"scheme.base:ns-digits"
  ret i64 %t1226
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1266 = call i64 @rt_alloc_words(i64 1)
  %t1267 = inttoptr i64 %t1266 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_316" to i64), ptr %t1267
  %t1268 = or i64 %t1266, 4
  %t1269 = call i64 @rt_root(i64 %t1268)
  store i64 %t1269, ptr @"scheme.base:number->string"
  ret i64 %t1269
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1292 = call i64 @rt_alloc_words(i64 1)
  %t1293 = inttoptr i64 %t1292 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_320" to i64), ptr %t1293
  %t1294 = or i64 %t1292, 4
  %t1295 = call i64 @rt_root(i64 %t1294)
  store i64 %t1295, ptr @"scheme.base:error"
  ret i64 %t1295
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1298 = call i64 @rt_alloc_words(i64 1)
  %t1299 = inttoptr i64 %t1298 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_323" to i64), ptr %t1299
  %t1300 = or i64 %t1298, 4
  %t1301 = call i64 @rt_root(i64 %t1300)
  store i64 %t1301, ptr @"scheme.base:raise"
  ret i64 %t1301
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1304 = call i64 @rt_alloc_words(i64 1)
  %t1305 = inttoptr i64 %t1304 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_326" to i64), ptr %t1305
  %t1306 = or i64 %t1304, 4
  %t1307 = call i64 @rt_root(i64 %t1306)
  store i64 %t1307, ptr @"scheme.base:error-object?"
  ret i64 %t1307
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1310 = call i64 @rt_alloc_words(i64 1)
  %t1311 = inttoptr i64 %t1310 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_329" to i64), ptr %t1311
  %t1312 = or i64 %t1310, 4
  %t1313 = call i64 @rt_root(i64 %t1312)
  store i64 %t1313, ptr @"scheme.base:error-object-message"
  ret i64 %t1313
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1316 = call i64 @rt_alloc_words(i64 1)
  %t1317 = inttoptr i64 %t1316 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_332" to i64), ptr %t1317
  %t1318 = or i64 %t1316, 4
  %t1319 = call i64 @rt_root(i64 %t1318)
  store i64 %t1319, ptr @"scheme.base:error-object-irritants"
  ret i64 %t1319
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1359 = call i64 @rt_alloc_words(i64 1)
  %t1360 = inttoptr i64 %t1359 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1360
  %t1361 = or i64 %t1359, 4
  %t1362 = call i64 @rt_root(i64 %t1361)
  store i64 %t1362, ptr @"scheme.base:list->vector"
  ret i64 %t1362
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1381 = call i64 @rt_alloc_words(i64 1)
  %t1382 = inttoptr i64 %t1381 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_344" to i64), ptr %t1382
  %t1383 = or i64 %t1381, 4
  %t1384 = call i64 @rt_root(i64 %t1383)
  store i64 %t1384, ptr @"scheme.base:vector"
  ret i64 %t1384
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1424 = call i64 @rt_alloc_words(i64 1)
  %t1425 = inttoptr i64 %t1424 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_351" to i64), ptr %t1425
  %t1426 = or i64 %t1424, 4
  %t1427 = call i64 @rt_root(i64 %t1426)
  store i64 %t1427, ptr @"scheme.base:list->bytevector"
  ret i64 %t1427
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1446 = call i64 @rt_alloc_words(i64 1)
  %t1447 = inttoptr i64 %t1446 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_356" to i64), ptr %t1447
  %t1448 = or i64 %t1446, 4
  %t1449 = call i64 @rt_root(i64 %t1448)
  store i64 %t1449, ptr @"scheme.base:bytevector"
  ret i64 %t1449
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1470 = call i64 @rt_alloc_words(i64 1)
  %t1471 = inttoptr i64 %t1470 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_359" to i64), ptr %t1471
  %t1472 = or i64 %t1470, 4
  %t1473 = call i64 @rt_root(i64 %t1472)
  store i64 %t1473, ptr @"scheme.base:values"
  ret i64 %t1473
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1515 = call i64 @rt_alloc_words(i64 1)
  %t1516 = inttoptr i64 %t1515 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_364" to i64), ptr %t1516
  %t1517 = or i64 %t1515, 4
  %t1518 = call i64 @rt_root(i64 %t1517)
  store i64 %t1518, ptr @"scheme.base:call-with-values"
  ret i64 %t1518
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1519 = call i64 @rt_root(i64 64)
  store i64 %t1519, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 %t1519
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1520 = call i64 @rt_root(i64 24)
  store i64 %t1520, ptr @"scheme.base:%ht-load-factor"
  ret i64 %t1520
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1531 = call i64 @rt_alloc_words(i64 1)
  %t1532 = inttoptr i64 %t1531 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_366" to i64), ptr %t1532
  %t1533 = or i64 %t1531, 4
  %t1534 = call i64 @rt_root(i64 %t1533)
  store i64 %t1534, ptr @"scheme.base:make-hash-table"
  ret i64 %t1534
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1537 = call i64 @rt_alloc_words(i64 1)
  %t1538 = inttoptr i64 %t1537 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_369" to i64), ptr %t1538
  %t1539 = or i64 %t1537, 4
  %t1540 = call i64 @rt_root(i64 %t1539)
  store i64 %t1540, ptr @"scheme.base:hash-table?"
  ret i64 %t1540
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1544 = call i64 @rt_alloc_words(i64 1)
  %t1545 = inttoptr i64 %t1544 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_372" to i64), ptr %t1545
  %t1546 = or i64 %t1544, 4
  %t1547 = call i64 @rt_root(i64 %t1546)
  store i64 %t1547, ptr @"scheme.base:%ht-count"
  ret i64 %t1547
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1551 = call i64 @rt_alloc_words(i64 1)
  %t1552 = inttoptr i64 %t1551 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_375" to i64), ptr %t1552
  %t1553 = or i64 %t1551, 4
  %t1554 = call i64 @rt_root(i64 %t1553)
  store i64 %t1554, ptr @"scheme.base:%ht-buckets"
  ret i64 %t1554
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1558 = call i64 @rt_alloc_words(i64 1)
  %t1559 = inttoptr i64 %t1558 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_379" to i64), ptr %t1559
  %t1560 = or i64 %t1558, 4
  %t1561 = call i64 @rt_root(i64 %t1560)
  store i64 %t1561, ptr @"scheme.base:%ht-set-count!"
  ret i64 %t1561
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1565 = call i64 @rt_alloc_words(i64 1)
  %t1566 = inttoptr i64 %t1565 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_383" to i64), ptr %t1566
  %t1567 = or i64 %t1565, 4
  %t1568 = call i64 @rt_root(i64 %t1567)
  store i64 %t1568, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 %t1568
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1572 = call i64 @rt_alloc_words(i64 1)
  %t1573 = inttoptr i64 %t1572 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_387" to i64), ptr %t1573
  %t1574 = or i64 %t1572, 4
  %t1575 = call i64 @rt_root(i64 %t1574)
  store i64 %t1575, ptr @"scheme.base:%ht-index"
  ret i64 %t1575
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1591 = call i64 @rt_alloc_words(i64 1)
  %t1592 = inttoptr i64 %t1591 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_391" to i64), ptr %t1592
  %t1593 = or i64 %t1591, 4
  %t1594 = call i64 @rt_root(i64 %t1593)
  store i64 %t1594, ptr @"scheme.base:%ht-assoc"
  ret i64 %t1594
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1612 = call i64 @rt_alloc_words(i64 1)
  %t1613 = inttoptr i64 %t1612 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_395" to i64), ptr %t1613
  %t1614 = or i64 %t1612, 4
  %t1615 = call i64 @rt_root(i64 %t1614)
  store i64 %t1615, ptr @"scheme.base:%ht-remove"
  ret i64 %t1615
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1639 = call i64 @rt_alloc_words(i64 1)
  %t1640 = inttoptr i64 %t1639 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_402" to i64), ptr %t1640
  %t1641 = or i64 %t1639, 4
  %t1642 = call i64 @rt_root(i64 %t1641)
  store i64 %t1642, ptr @"scheme.base:hash-table-ref/default"
  ret i64 %t1642
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1665 = call i64 @rt_alloc_words(i64 1)
  %t1666 = inttoptr i64 %t1665 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_407" to i64), ptr %t1666
  %t1667 = or i64 %t1665, 4
  %t1668 = call i64 @rt_root(i64 %t1667)
  store i64 %t1668, ptr @"scheme.base:hash-table-contains?"
  ret i64 %t1668
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1699 = call i64 @rt_alloc_words(i64 1)
  %t1700 = inttoptr i64 %t1699 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_413" to i64), ptr %t1700
  %t1701 = or i64 %t1699, 4
  %t1702 = call i64 @rt_root(i64 %t1701)
  store i64 %t1702, ptr @"scheme.base:hash-table-ref"
  ret i64 %t1702
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1782 = call i64 @rt_alloc_words(i64 1)
  %t1783 = inttoptr i64 %t1782 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_427" to i64), ptr %t1783
  %t1784 = or i64 %t1782, 4
  %t1785 = call i64 @rt_root(i64 %t1784)
  store i64 %t1785, ptr @"scheme.base:hash-table-set!"
  ret i64 %t1785
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1833 = call i64 @rt_alloc_words(i64 1)
  %t1834 = inttoptr i64 %t1833 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_434" to i64), ptr %t1834
  %t1835 = or i64 %t1833, 4
  %t1836 = call i64 @rt_root(i64 %t1835)
  store i64 %t1836, ptr @"scheme.base:hash-table-delete!"
  ret i64 %t1836
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1944 = call i64 @rt_alloc_words(i64 1)
  %t1945 = inttoptr i64 %t1944 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_450" to i64), ptr %t1945
  %t1946 = or i64 %t1944, 4
  %t1947 = call i64 @rt_root(i64 %t1946)
  store i64 %t1947, ptr @"scheme.base:%ht-grow!"
  ret i64 %t1947
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1955 = call i64 @rt_alloc_words(i64 1)
  %t1956 = inttoptr i64 %t1955 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_457" to i64), ptr %t1956
  %t1957 = or i64 %t1955, 4
  %t1958 = call i64 @rt_root(i64 %t1957)
  store i64 %t1958, ptr @"scheme.base:hash-table-size"
  ret i64 %t1958
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1975 = call i64 @rt_alloc_words(i64 1)
  %t1976 = inttoptr i64 %t1975 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_461" to i64), ptr %t1976
  %t1977 = or i64 %t1975, 4
  %t1978 = call i64 @rt_root(i64 %t1977)
  store i64 %t1978, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 %t1978
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2028 = call i64 @rt_alloc_words(i64 1)
  %t2029 = inttoptr i64 %t2028 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_472" to i64), ptr %t2029
  %t2030 = or i64 %t2028, 4
  %t2031 = call i64 @rt_root(i64 %t2030)
  store i64 %t2031, ptr @"scheme.base:hash-table->alist"
  ret i64 %t2031
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2050 = call i64 @rt_alloc_words(i64 1)
  %t2051 = inttoptr i64 %t2050 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_478" to i64), ptr %t2051
  %t2052 = or i64 %t2050, 4
  %t2053 = call i64 @rt_root(i64 %t2052)
  store i64 %t2053, ptr @"scheme.base:hash-table-keys"
  ret i64 %t2053
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2072 = call i64 @rt_alloc_words(i64 1)
  %t2073 = inttoptr i64 %t2072 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_484" to i64), ptr %t2073
  %t2074 = or i64 %t2072, 4
  %t2075 = call i64 @rt_root(i64 %t2074)
  store i64 %t2075, ptr @"scheme.base:hash-table-values"
  ret i64 %t2075
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2109 = call i64 @rt_alloc_words(i64 1)
  %t2110 = inttoptr i64 %t2109 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_512" to i64), ptr %t2110
  %t2111 = or i64 %t2109, 4
  %t2112 = call i64 @rt_root(i64 %t2111)
  store i64 %t2112, ptr @"scheme.base:rd-ws?"
  ret i64 %t2112
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2130 = call i64 @rt_alloc_words(i64 1)
  %t2131 = inttoptr i64 %t2130 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_524" to i64), ptr %t2131
  %t2132 = or i64 %t2130, 4
  %t2133 = call i64 @rt_root(i64 %t2132)
  store i64 %t2133, ptr @"scheme.base:rd-digit?"
  ret i64 %t2133
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2190 = call i64 @rt_alloc_words(i64 1)
  %t2191 = inttoptr i64 %t2190 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_564" to i64), ptr %t2191
  %t2192 = or i64 %t2190, 4
  %t2193 = call i64 @rt_root(i64 %t2192)
  store i64 %t2193, ptr @"scheme.base:rd-delim?"
  ret i64 %t2193
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2231 = call i64 @rt_alloc_words(i64 1)
  %t2232 = inttoptr i64 %t2231 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_577" to i64), ptr %t2232
  %t2233 = or i64 %t2231, 4
  %t2234 = call i64 @rt_root(i64 %t2233)
  store i64 %t2234, ptr @"scheme.base:rd-skip-line"
  ret i64 %t2234
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2291 = call i64 @rt_alloc_words(i64 1)
  %t2292 = inttoptr i64 %t2291 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_591" to i64), ptr %t2292
  %t2293 = or i64 %t2291, 4
  %t2294 = call i64 @rt_root(i64 %t2293)
  store i64 %t2294, ptr @"scheme.base:rd-skip-ws"
  ret i64 %t2294
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2324 = call i64 @rt_alloc_words(i64 1)
  %t2325 = inttoptr i64 %t2324 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_600" to i64), ptr %t2325
  %t2326 = or i64 %t2324, 4
  %t2327 = call i64 @rt_root(i64 %t2326)
  store i64 %t2327, ptr @"scheme.base:rd-token-end"
  ret i64 %t2327
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2357 = call i64 @rt_alloc_words(i64 1)
  %t2358 = inttoptr i64 %t2357 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_609" to i64), ptr %t2358
  %t2359 = or i64 %t2357, 4
  %t2360 = call i64 @rt_root(i64 %t2359)
  store i64 %t2360, ptr @"scheme.base:rd-all-digits?"
  ret i64 %t2360
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2418 = call i64 @rt_alloc_words(i64 1)
  %t2419 = inttoptr i64 %t2418 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_632" to i64), ptr %t2419
  %t2420 = or i64 %t2418, 4
  %t2421 = call i64 @rt_root(i64 %t2420)
  store i64 %t2421, ptr @"scheme.base:rd-numeric?"
  ret i64 %t2421
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2464 = call i64 @rt_alloc_words(i64 1)
  %t2465 = inttoptr i64 %t2464 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_642" to i64), ptr %t2465
  %t2466 = or i64 %t2464, 4
  %t2467 = call i64 @rt_root(i64 %t2466)
  store i64 %t2467, ptr @"scheme.base:rd-digits"
  ret i64 %t2467
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2512 = call i64 @rt_alloc_words(i64 1)
  %t2513 = inttoptr i64 %t2512 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_655" to i64), ptr %t2513
  %t2514 = or i64 %t2512, 4
  %t2515 = call i64 @rt_root(i64 %t2514)
  store i64 %t2515, ptr @"scheme.base:rd-parse-int"
  ret i64 %t2515
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2540 = call i64 @rt_alloc_words(i64 1)
  %t2541 = inttoptr i64 %t2540 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_662" to i64), ptr %t2541
  %t2542 = or i64 %t2540, 4
  %t2543 = call i64 @rt_root(i64 %t2542)
  store i64 %t2543, ptr @"scheme.base:rd-atom"
  ret i64 %t2543
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2615 = call i64 @rt_alloc_words(i64 1)
  %t2616 = inttoptr i64 %t2615 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t2616
  %t2617 = or i64 %t2615, 4
  %t2618 = call i64 @rt_root(i64 %t2617)
  store i64 %t2618, ptr @"scheme.base:rd-hex-digit"
  ret i64 %t2618
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2678 = call i64 @rt_alloc_words(i64 1)
  %t2679 = inttoptr i64 %t2678 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_704" to i64), ptr %t2679
  %t2680 = or i64 %t2678, 4
  %t2681 = call i64 @rt_root(i64 %t2680)
  store i64 %t2681, ptr @"scheme.base:rd-hex"
  ret i64 %t2681
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2711 = call i64 @rt_alloc_words(i64 1)
  %t2712 = inttoptr i64 %t2711 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_720" to i64), ptr %t2712
  %t2713 = or i64 %t2711, 4
  %t2714 = call i64 @rt_root(i64 %t2713)
  store i64 %t2714, ptr @"scheme.base:rd-str-esc"
  ret i64 %t2714
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2851 = call i64 @rt_alloc_words(i64 1)
  %t2852 = inttoptr i64 %t2851 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_748" to i64), ptr %t2852
  %t2853 = or i64 %t2851, 4
  %t2854 = call i64 @rt_root(i64 %t2853)
  store i64 %t2854, ptr @"scheme.base:rd-string"
  ret i64 %t2854
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t3018 = call i64 @rt_alloc_words(i64 1)
  %t3019 = inttoptr i64 %t3018 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_791" to i64), ptr %t3019
  %t3020 = or i64 %t3018, 4
  %t3021 = call i64 @rt_root(i64 %t3020)
  store i64 %t3021, ptr @"scheme.base:rd-hash"
  ret i64 %t3021
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t3060 = call i64 @rt_alloc_words(i64 1)
  %t3061 = inttoptr i64 %t3060 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_794" to i64), ptr %t3061
  %t3062 = or i64 %t3060, 4
  %t3063 = call i64 @rt_root(i64 %t3062)
  store i64 %t3063, ptr @"scheme.base:rd-char-name"
  ret i64 %t3063
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t3102 = call i64 @rt_alloc_words(i64 1)
  %t3103 = inttoptr i64 %t3102 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_806" to i64), ptr %t3103
  %t3104 = or i64 %t3102, 4
  %t3105 = call i64 @rt_root(i64 %t3104)
  store i64 %t3105, ptr @"scheme.base:rd-char"
  ret i64 %t3105
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t3129 = call i64 @rt_alloc_words(i64 1)
  %t3130 = inttoptr i64 %t3129 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_813" to i64), ptr %t3130
  %t3131 = or i64 %t3129, 4
  %t3132 = call i64 @rt_root(i64 %t3131)
  store i64 %t3132, ptr @"scheme.base:rd-quote"
  ret i64 %t3132
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3156 = call i64 @rt_alloc_words(i64 1)
  %t3157 = inttoptr i64 %t3156 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_820" to i64), ptr %t3157
  %t3158 = or i64 %t3156, 4
  %t3159 = call i64 @rt_root(i64 %t3158)
  store i64 %t3159, ptr @"scheme.base:rd-quasi"
  ret i64 %t3159
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3230 = call i64 @rt_alloc_words(i64 1)
  %t3231 = inttoptr i64 %t3230 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_837" to i64), ptr %t3231
  %t3232 = or i64 %t3230, 4
  %t3233 = call i64 @rt_root(i64 %t3232)
  store i64 %t3233, ptr @"scheme.base:rd-unquote"
  ret i64 %t3233
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3270 = call i64 @rt_alloc_words(i64 1)
  %t3271 = inttoptr i64 %t3270 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_850" to i64), ptr %t3271
  %t3272 = or i64 %t3270, 4
  %t3273 = call i64 @rt_root(i64 %t3272)
  store i64 %t3273, ptr @"scheme.base:rd-dot?"
  ret i64 %t3273
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3286 = call i64 @rt_alloc_words(i64 1)
  %t3287 = inttoptr i64 %t3286 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_854" to i64), ptr %t3287
  %t3288 = or i64 %t3286, 4
  %t3289 = call i64 @rt_root(i64 %t3288)
  store i64 %t3289, ptr @"scheme.base:rd-append-reverse"
  ret i64 %t3289
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3405 = call i64 @rt_alloc_words(i64 1)
  %t3406 = inttoptr i64 %t3405 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_879" to i64), ptr %t3406
  %t3407 = or i64 %t3405, 4
  %t3408 = call i64 @rt_root(i64 %t3407)
  store i64 %t3408, ptr @"scheme.base:rd-list"
  ret i64 %t3408
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3558 = call i64 @rt_alloc_words(i64 1)
  %t3559 = inttoptr i64 %t3558 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_913" to i64), ptr %t3559
  %t3560 = or i64 %t3558, 4
  %t3561 = call i64 @rt_root(i64 %t3560)
  store i64 %t3561, ptr @"scheme.base:rd-datum"
  ret i64 %t3561
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3577 = call i64 @rt_alloc_words(i64 1)
  %t3578 = inttoptr i64 %t3577 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_917" to i64), ptr %t3578
  %t3579 = or i64 %t3577, 4
  %t3580 = call i64 @rt_root(i64 %t3579)
  store i64 %t3580, ptr @"scheme.base:read-from-string"
  ret i64 %t3580
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3651 = call i64 @rt_alloc_words(i64 1)
  %t3652 = inttoptr i64 %t3651 to ptr
  store i64 ptrtoint (ptr @"scheme.base:code_929" to i64), ptr %t3652
  %t3653 = or i64 %t3651, 4
  %t3654 = call i64 @rt_root(i64 %t3653)
  store i64 %t3654, ptr @"scheme.base:read-all-from-string"
  ret i64 %t3654
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

