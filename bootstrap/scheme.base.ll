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
@"scheme.base:rd-dotchar?" = global i64 0
@"scheme.base:rd-exp-char?" = global i64 0
@"scheme.base:rd-sign-char?" = global i64 0
@"scheme.base:rd-scan-digits" = global i64 0
@"scheme.base:rd-flonum?" = global i64 0
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

define fastcc i64 @"scheme.base:code:caaar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t44 = icmp eq i64 %argc, 1
  br i1 %t44, label %argok12, label %arityerr11
arityerr11:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok12:
  %t45 = load i64, ptr @"scheme.base:caar"
  %t46 = and i64 %t45, -8
  %t47 = inttoptr i64 %t46 to ptr
  %t48 = load i64, ptr %t47
  %t49 = inttoptr i64 %t48 to ptr
  %t50 = call fastcc i64%t49(i64 %t45, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t51 = call i64 @rt_car(i64 %t50)
  ret i64 %t51
}

define fastcc i64 @"scheme.base:code:caadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t56 = icmp eq i64 %argc, 1
  br i1 %t56, label %argok14, label %arityerr13
arityerr13:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok14:
  %t57 = load i64, ptr @"scheme.base:cadr"
  %t58 = and i64 %t57, -8
  %t59 = inttoptr i64 %t58 to ptr
  %t60 = load i64, ptr %t59
  %t61 = inttoptr i64 %t60 to ptr
  %t62 = call fastcc i64%t61(i64 %t57, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t63 = call i64 @rt_car(i64 %t62)
  ret i64 %t63
}

define fastcc i64 @"scheme.base:code:cadar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t68 = icmp eq i64 %argc, 1
  br i1 %t68, label %argok16, label %arityerr15
arityerr15:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok16:
  %t69 = load i64, ptr @"scheme.base:cdar"
  %t70 = and i64 %t69, -8
  %t71 = inttoptr i64 %t70 to ptr
  %t72 = load i64, ptr %t71
  %t73 = inttoptr i64 %t72 to ptr
  %t74 = call fastcc i64%t73(i64 %t69, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t75 = call i64 @rt_car(i64 %t74)
  ret i64 %t75
}

define fastcc i64 @"scheme.base:code:caddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t80 = icmp eq i64 %argc, 1
  br i1 %t80, label %argok18, label %arityerr17
arityerr17:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok18:
  %t81 = load i64, ptr @"scheme.base:cddr"
  %t82 = and i64 %t81, -8
  %t83 = inttoptr i64 %t82 to ptr
  %t84 = load i64, ptr %t83
  %t85 = inttoptr i64 %t84 to ptr
  %t86 = call fastcc i64%t85(i64 %t81, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t87 = call i64 @rt_car(i64 %t86)
  ret i64 %t87
}

define fastcc i64 @"scheme.base:code:cdaar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t92 = icmp eq i64 %argc, 1
  br i1 %t92, label %argok20, label %arityerr19
arityerr19:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok20:
  %t93 = load i64, ptr @"scheme.base:caar"
  %t94 = and i64 %t93, -8
  %t95 = inttoptr i64 %t94 to ptr
  %t96 = load i64, ptr %t95
  %t97 = inttoptr i64 %t96 to ptr
  %t98 = call fastcc i64%t97(i64 %t93, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t99 = call i64 @rt_cdr(i64 %t98)
  ret i64 %t99
}

define fastcc i64 @"scheme.base:code:cdadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t104 = icmp eq i64 %argc, 1
  br i1 %t104, label %argok22, label %arityerr21
arityerr21:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok22:
  %t105 = load i64, ptr @"scheme.base:cadr"
  %t106 = and i64 %t105, -8
  %t107 = inttoptr i64 %t106 to ptr
  %t108 = load i64, ptr %t107
  %t109 = inttoptr i64 %t108 to ptr
  %t110 = call fastcc i64%t109(i64 %t105, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t111 = call i64 @rt_cdr(i64 %t110)
  ret i64 %t111
}

define fastcc i64 @"scheme.base:code:cddar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t116 = icmp eq i64 %argc, 1
  br i1 %t116, label %argok24, label %arityerr23
arityerr23:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok24:
  %t117 = load i64, ptr @"scheme.base:cdar"
  %t118 = and i64 %t117, -8
  %t119 = inttoptr i64 %t118 to ptr
  %t120 = load i64, ptr %t119
  %t121 = inttoptr i64 %t120 to ptr
  %t122 = call fastcc i64%t121(i64 %t117, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t123 = call i64 @rt_cdr(i64 %t122)
  ret i64 %t123
}

define fastcc i64 @"scheme.base:code:cdddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t128 = icmp eq i64 %argc, 1
  br i1 %t128, label %argok26, label %arityerr25
arityerr25:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok26:
  %t129 = load i64, ptr @"scheme.base:cddr"
  %t130 = and i64 %t129, -8
  %t131 = inttoptr i64 %t130 to ptr
  %t132 = load i64, ptr %t131
  %t133 = inttoptr i64 %t132 to ptr
  %t134 = call fastcc i64%t133(i64 %t129, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t135 = call i64 @rt_cdr(i64 %t134)
  ret i64 %t135
}

define fastcc i64 @"scheme.base:code_31"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  %t147 = add i64 %a1, 8
  br label %fixmerge33
fixslow32:
  %t148 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge33
fixmerge33:
  %t149 = phi i64 [ %t147, %fixfast31 ], [ %t148, %fixslow32 ]
  %t150 = musttail call fastcc i64 @"scheme.base:code_31"(i64 %self, i64 2, i64 %t143, i64 %t149, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t150
}

define fastcc i64 @"scheme.base:code:length"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t151 = icmp eq i64 %argc, 1
  br i1 %t151, label %argok35, label %arityerr34
arityerr34:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok35:
  %t152 = call ptr @rt_alloc_words(i64 2)
  %t153 = ptrtoint ptr %t152 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_31" to i64), ptr %t152
  %t154 = or i64 %t153, 4
  %t155 = getelementptr i64, ptr %t152, i64 1
  store i64 %t154, ptr %t155
  %t156 = musttail call fastcc i64 @"scheme.base:code_31"(i64 %t154, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t156
}

define fastcc i64 @"scheme.base:code_38"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t161 = icmp eq i64 %argc, 2
  br i1 %t161, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t162 = call i64 @rt_null_p(i64 %a0)
  %t163 = icmp ne i64 %t162, 1
  br i1 %t163, label %then38, label %else39
then38:
  ret i64 %a1
else39:
  %t164 = call i64 @rt_cdr(i64 %a0)
  %t165 = call i64 @rt_car(i64 %a0)
  %t166 = call i64 @rt_cons(i64 %t165, i64 %a1)
  %t167 = musttail call fastcc i64 @"scheme.base:code_38"(i64 %self, i64 2, i64 %t164, i64 %t166, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t167
}

define fastcc i64 @"scheme.base:code:reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t168 = icmp eq i64 %argc, 1
  br i1 %t168, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t169 = call ptr @rt_alloc_words(i64 2)
  %t170 = ptrtoint ptr %t169 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_38" to i64), ptr %t169
  %t171 = or i64 %t170, 4
  %t172 = getelementptr i64, ptr %t169, i64 1
  store i64 %t171, ptr %t172
  %t173 = musttail call fastcc i64 @"scheme.base:code_38"(i64 %t171, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t173
}

define fastcc i64 @"scheme.base:code:%append2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t178 = icmp eq i64 %argc, 2
  br i1 %t178, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok43:
  %t179 = call i64 @rt_null_p(i64 %a0)
  %t180 = icmp ne i64 %t179, 1
  br i1 %t180, label %then44, label %else45
then44:
  ret i64 %a1
else45:
  %t181 = call i64 @rt_car(i64 %a0)
  %t182 = call i64 @rt_cdr(i64 %a0)
  %t183 = load i64, ptr @"scheme.base:%append2"
  %t184 = and i64 %t183, -8
  %t185 = inttoptr i64 %t184 to ptr
  %t186 = load i64, ptr %t185
  %t187 = inttoptr i64 %t186 to ptr
  %t188 = call fastcc i64%t187(i64 %t183, i64 2, i64 %t182, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t189 = call i64 @rt_cons(i64 %t181, i64 %t188)
  ret i64 %t189
}

define fastcc i64 @"scheme.base:code:append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t194 = icmp sge i64 %argc, 0
  br i1 %t194, label %argok47, label %arityerr46
arityerr46:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok47:
  %t195 = call ptr @rt_alloc_words(i64 8)
  %t196 = getelementptr i64, ptr %t195, i64 0
  store i64 %a0, ptr %t196
  %t197 = getelementptr i64, ptr %t195, i64 1
  store i64 %a1, ptr %t197
  %t198 = getelementptr i64, ptr %t195, i64 2
  store i64 %a2, ptr %t198
  %t199 = getelementptr i64, ptr %t195, i64 3
  store i64 %a3, ptr %t199
  %t200 = getelementptr i64, ptr %t195, i64 4
  store i64 %a4, ptr %t200
  %t201 = getelementptr i64, ptr %t195, i64 5
  store i64 %a5, ptr %t201
  %t202 = getelementptr i64, ptr %t195, i64 6
  store i64 %a6, ptr %t202
  %t203 = getelementptr i64, ptr %t195, i64 7
  store i64 %a7, ptr %t203
  %t204 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t195, ptr %overflow)
  %t205 = call i64 @rt_null_p(i64 %t204)
  %t206 = icmp ne i64 %t205, 1
  br i1 %t206, label %then48, label %else49
then48:
  ret i64 2
else49:
  %t207 = call i64 @rt_cdr(i64 %t204)
  %t208 = call i64 @rt_null_p(i64 %t207)
  %t209 = icmp ne i64 %t208, 1
  br i1 %t209, label %then50, label %else51
then50:
  %t210 = call i64 @rt_car(i64 %t204)
  ret i64 %t210
else51:
  %t211 = call i64 @rt_car(i64 %t204)
  %t212 = call i64 @rt_cdr(i64 %t204)
  %t213 = load i64, ptr @"scheme.base:append"
  %t214 = and i64 %t213, -8
  %t215 = inttoptr i64 %t214 to ptr
  %t216 = load i64, ptr %t215
  %t217 = inttoptr i64 %t216 to ptr
  %t218 = call i64 @rt_list_length(i64 %t212)
  %t219 = add i64 0, %t218
  %t220 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t212, i64 8)
  %t232 = getelementptr i64, ptr %t220, i64 0
  %t224 = load i64, ptr %t232
  %t233 = getelementptr i64, ptr %t220, i64 1
  %t225 = load i64, ptr %t233
  %t234 = getelementptr i64, ptr %t220, i64 2
  %t226 = load i64, ptr %t234
  %t235 = getelementptr i64, ptr %t220, i64 3
  %t227 = load i64, ptr %t235
  %t236 = getelementptr i64, ptr %t220, i64 4
  %t228 = load i64, ptr %t236
  %t237 = getelementptr i64, ptr %t220, i64 5
  %t229 = load i64, ptr %t237
  %t238 = getelementptr i64, ptr %t220, i64 6
  %t230 = load i64, ptr %t238
  %t239 = getelementptr i64, ptr %t220, i64 7
  %t231 = load i64, ptr %t239
  %t221 = icmp sgt i64 %t219, 8
  %t222 = getelementptr i64, ptr %t220, i64 8
  %t223 = select i1 %t221, ptr %t222, ptr null
  %t240 = call fastcc i64%t217(i64 %t213, i64 %t219, i64 %t224, i64 %t225, i64 %t226, i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, ptr %t223)
  %t241 = load i64, ptr @"scheme.base:%append2"
  %t242 = and i64 %t241, -8
  %t243 = inttoptr i64 %t242 to ptr
  %t244 = load i64, ptr %t243
  %t245 = inttoptr i64 %t244 to ptr
  %t246 = musttail call fastcc i64 %t245(i64 %t241, i64 2, i64 %t211, i64 %t240, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t246
}

define fastcc i64 @"scheme.base:code:%map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t251 = icmp eq i64 %argc, 2
  br i1 %t251, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok53:
  %t252 = call i64 @rt_null_p(i64 %a1)
  %t253 = icmp ne i64 %t252, 1
  br i1 %t253, label %then54, label %else55
then54:
  ret i64 2
else55:
  %t254 = call i64 @rt_car(i64 %a1)
  %t255 = and i64 %a0, -8
  %t256 = inttoptr i64 %t255 to ptr
  %t257 = load i64, ptr %t256
  %t258 = inttoptr i64 %t257 to ptr
  %t259 = call fastcc i64%t258(i64 %a0, i64 1, i64 %t254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t260 = call i64 @rt_cdr(i64 %a1)
  %t261 = load i64, ptr @"scheme.base:%map1"
  %t262 = and i64 %t261, -8
  %t263 = inttoptr i64 %t262 to ptr
  %t264 = load i64, ptr %t263
  %t265 = inttoptr i64 %t264 to ptr
  %t266 = call fastcc i64%t265(i64 %t261, i64 2, i64 %a0, i64 %t260, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t267 = call i64 @rt_cons(i64 %t259, i64 %t266)
  ret i64 %t267
}

define fastcc i64 @"scheme.base:code:%any-null?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t272 = icmp eq i64 %argc, 1
  br i1 %t272, label %argok57, label %arityerr56
arityerr56:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok57:
  %t273 = call i64 @rt_null_p(i64 %a0)
  %t274 = icmp ne i64 %t273, 1
  br i1 %t274, label %then58, label %else59
then58:
  ret i64 1
else59:
  %t275 = call i64 @rt_car(i64 %a0)
  %t276 = call i64 @rt_null_p(i64 %t275)
  %t277 = icmp ne i64 %t276, 1
  br i1 %t277, label %then60, label %else61
then60:
  ret i64 257
else61:
  %t278 = call i64 @rt_cdr(i64 %a0)
  %t279 = load i64, ptr @"scheme.base:%any-null?"
  %t280 = and i64 %t279, -8
  %t281 = inttoptr i64 %t280 to ptr
  %t282 = load i64, ptr %t281
  %t283 = inttoptr i64 %t282 to ptr
  %t284 = musttail call fastcc i64 %t283(i64 %t279, i64 1, i64 %t278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t284
}

define fastcc i64 @"scheme.base:code_55"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t289 = icmp eq i64 %argc, 1
  br i1 %t289, label %argok63, label %arityerr62
arityerr62:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok63:
  %t290 = call i64 @rt_car(i64 %a0)
  ret i64 %t290
}

define fastcc i64 @"scheme.base:code_57"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t291 = icmp eq i64 %argc, 1
  br i1 %t291, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok65:
  %t292 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t292
}

define fastcc i64 @"scheme.base:code:%mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t293 = icmp eq i64 %argc, 2
  br i1 %t293, label %argok67, label %arityerr66
arityerr66:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok67:
  %t294 = load i64, ptr @"scheme.base:%any-null?"
  %t295 = and i64 %t294, -8
  %t296 = inttoptr i64 %t295 to ptr
  %t297 = load i64, ptr %t296
  %t298 = inttoptr i64 %t297 to ptr
  %t299 = call fastcc i64%t298(i64 %t294, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t300 = icmp ne i64 %t299, 1
  br i1 %t300, label %then68, label %else69
then68:
  ret i64 2
else69:
  %t301 = call ptr @rt_alloc_words(i64 1)
  %t302 = ptrtoint ptr %t301 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_55" to i64), ptr %t301
  %t303 = or i64 %t302, 4
  %t304 = load i64, ptr @"scheme.base:%map1"
  %t305 = and i64 %t304, -8
  %t306 = inttoptr i64 %t305 to ptr
  %t307 = load i64, ptr %t306
  %t308 = inttoptr i64 %t307 to ptr
  %t309 = call fastcc i64%t308(i64 %t304, i64 2, i64 %t303, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t310 = and i64 %a0, -8
  %t311 = inttoptr i64 %t310 to ptr
  %t312 = load i64, ptr %t311
  %t313 = inttoptr i64 %t312 to ptr
  %t314 = call i64 @rt_list_length(i64 %t309)
  %t315 = add i64 0, %t314
  %t316 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t309, i64 8)
  %t328 = getelementptr i64, ptr %t316, i64 0
  %t320 = load i64, ptr %t328
  %t329 = getelementptr i64, ptr %t316, i64 1
  %t321 = load i64, ptr %t329
  %t330 = getelementptr i64, ptr %t316, i64 2
  %t322 = load i64, ptr %t330
  %t331 = getelementptr i64, ptr %t316, i64 3
  %t323 = load i64, ptr %t331
  %t332 = getelementptr i64, ptr %t316, i64 4
  %t324 = load i64, ptr %t332
  %t333 = getelementptr i64, ptr %t316, i64 5
  %t325 = load i64, ptr %t333
  %t334 = getelementptr i64, ptr %t316, i64 6
  %t326 = load i64, ptr %t334
  %t335 = getelementptr i64, ptr %t316, i64 7
  %t327 = load i64, ptr %t335
  %t317 = icmp sgt i64 %t315, 8
  %t318 = getelementptr i64, ptr %t316, i64 8
  %t319 = select i1 %t317, ptr %t318, ptr null
  %t336 = call fastcc i64%t313(i64 %a0, i64 %t315, i64 %t320, i64 %t321, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326, i64 %t327, ptr %t319)
  %t337 = call ptr @rt_alloc_words(i64 1)
  %t338 = ptrtoint ptr %t337 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_57" to i64), ptr %t337
  %t339 = or i64 %t338, 4
  %t340 = load i64, ptr @"scheme.base:%map1"
  %t341 = and i64 %t340, -8
  %t342 = inttoptr i64 %t341 to ptr
  %t343 = load i64, ptr %t342
  %t344 = inttoptr i64 %t343 to ptr
  %t345 = call fastcc i64%t344(i64 %t340, i64 2, i64 %t339, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t346 = load i64, ptr @"scheme.base:%mapn"
  %t347 = and i64 %t346, -8
  %t348 = inttoptr i64 %t347 to ptr
  %t349 = load i64, ptr %t348
  %t350 = inttoptr i64 %t349 to ptr
  %t351 = call fastcc i64%t350(i64 %t346, i64 2, i64 %a0, i64 %t345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t352 = call i64 @rt_cons(i64 %t336, i64 %t351)
  ret i64 %t352
}

define fastcc i64 @"scheme.base:code:map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t357 = icmp sge i64 %argc, 2
  br i1 %t357, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t358 = call ptr @rt_alloc_words(i64 8)
  %t359 = getelementptr i64, ptr %t358, i64 0
  store i64 %a0, ptr %t359
  %t360 = getelementptr i64, ptr %t358, i64 1
  store i64 %a1, ptr %t360
  %t361 = getelementptr i64, ptr %t358, i64 2
  store i64 %a2, ptr %t361
  %t362 = getelementptr i64, ptr %t358, i64 3
  store i64 %a3, ptr %t362
  %t363 = getelementptr i64, ptr %t358, i64 4
  store i64 %a4, ptr %t363
  %t364 = getelementptr i64, ptr %t358, i64 5
  store i64 %a5, ptr %t364
  %t365 = getelementptr i64, ptr %t358, i64 6
  store i64 %a6, ptr %t365
  %t366 = getelementptr i64, ptr %t358, i64 7
  store i64 %a7, ptr %t366
  %t367 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t358, ptr %overflow)
  %t368 = call i64 @rt_null_p(i64 %t367)
  %t369 = icmp ne i64 %t368, 1
  br i1 %t369, label %then72, label %else73
then72:
  %t370 = load i64, ptr @"scheme.base:%map1"
  %t371 = and i64 %t370, -8
  %t372 = inttoptr i64 %t371 to ptr
  %t373 = load i64, ptr %t372
  %t374 = inttoptr i64 %t373 to ptr
  %t375 = musttail call fastcc i64 %t374(i64 %t370, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t375
else73:
  %t376 = call i64 @rt_cons(i64 %a1, i64 %t367)
  %t377 = load i64, ptr @"scheme.base:%mapn"
  %t378 = and i64 %t377, -8
  %t379 = inttoptr i64 %t378 to ptr
  %t380 = load i64, ptr %t379
  %t381 = inttoptr i64 %t380 to ptr
  %t382 = musttail call fastcc i64 %t381(i64 %t377, i64 2, i64 %a0, i64 %t376, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t382
}

define fastcc i64 @"scheme.base:code:memq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t387 = icmp eq i64 %argc, 2
  br i1 %t387, label %argok75, label %arityerr74
arityerr74:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok75:
  %t388 = call i64 @rt_null_p(i64 %a1)
  %t389 = icmp ne i64 %t388, 1
  br i1 %t389, label %then76, label %else77
then76:
  ret i64 1
else77:
  %t390 = call i64 @rt_car(i64 %a1)
  %t391 = call i64 @rt_eq_p(i64 %a0, i64 %t390)
  %t392 = icmp ne i64 %t391, 1
  br i1 %t392, label %then78, label %else79
then78:
  ret i64 %a1
else79:
  %t393 = call i64 @rt_cdr(i64 %a1)
  %t394 = load i64, ptr @"scheme.base:memq"
  %t395 = and i64 %t394, -8
  %t396 = inttoptr i64 %t395 to ptr
  %t397 = load i64, ptr %t396
  %t398 = inttoptr i64 %t397 to ptr
  %t399 = musttail call fastcc i64 %t398(i64 %t394, i64 2, i64 %a0, i64 %t393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t399
}

define fastcc i64 @"scheme.base:code:memv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t404 = icmp eq i64 %argc, 2
  br i1 %t404, label %argok81, label %arityerr80
arityerr80:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok81:
  %t405 = call i64 @rt_null_p(i64 %a1)
  %t406 = icmp ne i64 %t405, 1
  br i1 %t406, label %then82, label %else83
then82:
  ret i64 1
else83:
  %t407 = call i64 @rt_car(i64 %a1)
  %t408 = call i64 @rt_eqv_p(i64 %a0, i64 %t407)
  %t409 = icmp ne i64 %t408, 1
  br i1 %t409, label %then84, label %else85
then84:
  ret i64 %a1
else85:
  %t410 = call i64 @rt_cdr(i64 %a1)
  %t411 = load i64, ptr @"scheme.base:memv"
  %t412 = and i64 %t411, -8
  %t413 = inttoptr i64 %t412 to ptr
  %t414 = load i64, ptr %t413
  %t415 = inttoptr i64 %t414 to ptr
  %t416 = musttail call fastcc i64 %t415(i64 %t411, i64 2, i64 %a0, i64 %t410, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t416
}

define fastcc i64 @"scheme.base:code:assq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t421 = icmp eq i64 %argc, 2
  br i1 %t421, label %argok87, label %arityerr86
arityerr86:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok87:
  %t422 = call i64 @rt_null_p(i64 %a1)
  %t423 = icmp ne i64 %t422, 1
  br i1 %t423, label %then88, label %else89
then88:
  ret i64 1
else89:
  %t424 = call i64 @rt_car(i64 %a1)
  %t425 = call i64 @rt_car(i64 %t424)
  %t426 = call i64 @rt_eq_p(i64 %a0, i64 %t425)
  %t427 = icmp ne i64 %t426, 1
  br i1 %t427, label %then90, label %else91
then90:
  %t428 = call i64 @rt_car(i64 %a1)
  ret i64 %t428
else91:
  %t429 = call i64 @rt_cdr(i64 %a1)
  %t430 = load i64, ptr @"scheme.base:assq"
  %t431 = and i64 %t430, -8
  %t432 = inttoptr i64 %t431 to ptr
  %t433 = load i64, ptr %t432
  %t434 = inttoptr i64 %t433 to ptr
  %t435 = musttail call fastcc i64 %t434(i64 %t430, i64 2, i64 %a0, i64 %t429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t435
}

define fastcc i64 @"scheme.base:code:member"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t440 = icmp eq i64 %argc, 2
  br i1 %t440, label %argok93, label %arityerr92
arityerr92:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok93:
  %t441 = call i64 @rt_null_p(i64 %a1)
  %t442 = icmp ne i64 %t441, 1
  br i1 %t442, label %then94, label %else95
then94:
  ret i64 1
else95:
  %t443 = call i64 @rt_car(i64 %a1)
  %t444 = call i64 @rt_equal(i64 %a0, i64 %t443)
  %t445 = icmp ne i64 %t444, 1
  br i1 %t445, label %then96, label %else97
then96:
  ret i64 %a1
else97:
  %t446 = call i64 @rt_cdr(i64 %a1)
  %t447 = load i64, ptr @"scheme.base:member"
  %t448 = and i64 %t447, -8
  %t449 = inttoptr i64 %t448 to ptr
  %t450 = load i64, ptr %t449
  %t451 = inttoptr i64 %t450 to ptr
  %t452 = musttail call fastcc i64 %t451(i64 %t447, i64 2, i64 %a0, i64 %t446, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t452
}

define fastcc i64 @"scheme.base:code:assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t457 = icmp eq i64 %argc, 2
  br i1 %t457, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok99:
  %t458 = call i64 @rt_null_p(i64 %a1)
  %t459 = icmp ne i64 %t458, 1
  br i1 %t459, label %then100, label %else101
then100:
  ret i64 1
else101:
  %t460 = call i64 @rt_car(i64 %a1)
  %t461 = call i64 @rt_car(i64 %t460)
  %t462 = call i64 @rt_equal(i64 %a0, i64 %t461)
  %t463 = icmp ne i64 %t462, 1
  br i1 %t463, label %then102, label %else103
then102:
  %t464 = call i64 @rt_car(i64 %a1)
  ret i64 %t464
else103:
  %t465 = call i64 @rt_cdr(i64 %a1)
  %t466 = load i64, ptr @"scheme.base:assoc"
  %t467 = and i64 %t466, -8
  %t468 = inttoptr i64 %t467 to ptr
  %t469 = load i64, ptr %t468
  %t470 = inttoptr i64 %t469 to ptr
  %t471 = musttail call fastcc i64 %t470(i64 %t466, i64 2, i64 %a0, i64 %t465, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t471
}

define fastcc i64 @"scheme.base:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t476 = icmp eq i64 %argc, 2
  br i1 %t476, label %argok105, label %arityerr104
arityerr104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok105:
  %t477 = call i64 @rt_null_p(i64 %a1)
  %t478 = icmp ne i64 %t477, 1
  br i1 %t478, label %then106, label %else107
then106:
  ret i64 2
else107:
  %t479 = call i64 @rt_car(i64 %a1)
  %t480 = and i64 %a0, -8
  %t481 = inttoptr i64 %t480 to ptr
  %t482 = load i64, ptr %t481
  %t483 = inttoptr i64 %t482 to ptr
  %t484 = call fastcc i64%t483(i64 %a0, i64 1, i64 %t479, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t485 = icmp ne i64 %t484, 1
  br i1 %t485, label %then108, label %else109
then108:
  %t486 = call i64 @rt_car(i64 %a1)
  %t487 = call i64 @rt_cdr(i64 %a1)
  %t488 = load i64, ptr @"scheme.base:filter"
  %t489 = and i64 %t488, -8
  %t490 = inttoptr i64 %t489 to ptr
  %t491 = load i64, ptr %t490
  %t492 = inttoptr i64 %t491 to ptr
  %t493 = call fastcc i64%t492(i64 %t488, i64 2, i64 %a0, i64 %t487, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t494 = call i64 @rt_cons(i64 %t486, i64 %t493)
  ret i64 %t494
else109:
  %t495 = call i64 @rt_cdr(i64 %a1)
  %t496 = load i64, ptr @"scheme.base:filter"
  %t497 = and i64 %t496, -8
  %t498 = inttoptr i64 %t497 to ptr
  %t499 = load i64, ptr %t498
  %t500 = inttoptr i64 %t499 to ptr
  %t501 = musttail call fastcc i64 %t500(i64 %t496, i64 2, i64 %a0, i64 %t495, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t501
}

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t506 = icmp eq i64 %argc, 3
  br i1 %t506, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok111:
  %t507 = call i64 @rt_null_p(i64 %a2)
  %t508 = icmp ne i64 %t507, 1
  br i1 %t508, label %then112, label %else113
then112:
  ret i64 %a1
else113:
  %t509 = call i64 @rt_car(i64 %a2)
  %t510 = and i64 %a0, -8
  %t511 = inttoptr i64 %t510 to ptr
  %t512 = load i64, ptr %t511
  %t513 = inttoptr i64 %t512 to ptr
  %t514 = call fastcc i64%t513(i64 %a0, i64 2, i64 %a1, i64 %t509, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t515 = call i64 @rt_cdr(i64 %a2)
  %t516 = load i64, ptr @"scheme.base:fold-left"
  %t517 = and i64 %t516, -8
  %t518 = inttoptr i64 %t517 to ptr
  %t519 = load i64, ptr %t518
  %t520 = inttoptr i64 %t519 to ptr
  %t521 = musttail call fastcc i64 %t520(i64 %t516, i64 3, i64 %a0, i64 %t514, i64 %t515, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t521
}

define fastcc i64 @"scheme.base:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t526 = icmp eq i64 %argc, 3
  br i1 %t526, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok115:
  %t527 = call i64 @rt_null_p(i64 %a2)
  %t528 = icmp ne i64 %t527, 1
  br i1 %t528, label %then116, label %else117
then116:
  ret i64 %a1
else117:
  %t529 = call i64 @rt_car(i64 %a2)
  %t530 = call i64 @rt_cdr(i64 %a2)
  %t531 = load i64, ptr @"scheme.base:fold-right"
  %t532 = and i64 %t531, -8
  %t533 = inttoptr i64 %t532 to ptr
  %t534 = load i64, ptr %t533
  %t535 = inttoptr i64 %t534 to ptr
  %t536 = call fastcc i64%t535(i64 %t531, i64 3, i64 %a0, i64 %a1, i64 %t530, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t537 = and i64 %a0, -8
  %t538 = inttoptr i64 %t537 to ptr
  %t539 = load i64, ptr %t538
  %t540 = inttoptr i64 %t539 to ptr
  %t541 = musttail call fastcc i64 %t540(i64 %a0, i64 2, i64 %t529, i64 %t536, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t541
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t546 = icmp eq i64 %argc, 2
  br i1 %t546, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t547 = call i64 @rt_null_p(i64 %a1)
  %t548 = icmp ne i64 %t547, 1
  br i1 %t548, label %then120, label %else121
then120:
  %t549 = icmp ne i64 1, 1
  br i1 %t549, label %then122, label %else123
then122:
  ret i64 1
else123:
  ret i64 17
else121:
  %t550 = call i64 @rt_car(i64 %a1)
  %t551 = and i64 %a0, -8
  %t552 = inttoptr i64 %t551 to ptr
  %t553 = load i64, ptr %t552
  %t554 = inttoptr i64 %t553 to ptr
  %t555 = call fastcc i64%t554(i64 %a0, i64 1, i64 %t550, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t556 = call i64 @rt_cdr(i64 %a1)
  %t557 = load i64, ptr @"scheme.base:%for-each1"
  %t558 = and i64 %t557, -8
  %t559 = inttoptr i64 %t558 to ptr
  %t560 = load i64, ptr %t559
  %t561 = inttoptr i64 %t560 to ptr
  %t562 = musttail call fastcc i64 %t561(i64 %t557, i64 2, i64 %a0, i64 %t556, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t562
}

define fastcc i64 @"scheme.base:code_109"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t567 = icmp eq i64 %argc, 1
  br i1 %t567, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok125:
  %t568 = call i64 @rt_car(i64 %a0)
  ret i64 %t568
}

define fastcc i64 @"scheme.base:code_111"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t569 = icmp eq i64 %argc, 1
  br i1 %t569, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok127:
  %t570 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t570
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t571 = icmp eq i64 %argc, 2
  br i1 %t571, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t572 = load i64, ptr @"scheme.base:%any-null?"
  %t573 = and i64 %t572, -8
  %t574 = inttoptr i64 %t573 to ptr
  %t575 = load i64, ptr %t574
  %t576 = inttoptr i64 %t575 to ptr
  %t577 = call fastcc i64%t576(i64 %t572, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t578 = icmp ne i64 %t577, 1
  br i1 %t578, label %then130, label %else131
then130:
  %t579 = icmp ne i64 1, 1
  br i1 %t579, label %then132, label %else133
then132:
  ret i64 1
else133:
  ret i64 17
else131:
  %t580 = call ptr @rt_alloc_words(i64 1)
  %t581 = ptrtoint ptr %t580 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_109" to i64), ptr %t580
  %t582 = or i64 %t581, 4
  %t583 = load i64, ptr @"scheme.base:%map1"
  %t584 = and i64 %t583, -8
  %t585 = inttoptr i64 %t584 to ptr
  %t586 = load i64, ptr %t585
  %t587 = inttoptr i64 %t586 to ptr
  %t588 = call fastcc i64%t587(i64 %t583, i64 2, i64 %t582, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t589 = and i64 %a0, -8
  %t590 = inttoptr i64 %t589 to ptr
  %t591 = load i64, ptr %t590
  %t592 = inttoptr i64 %t591 to ptr
  %t593 = call i64 @rt_list_length(i64 %t588)
  %t594 = add i64 0, %t593
  %t595 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t588, i64 8)
  %t607 = getelementptr i64, ptr %t595, i64 0
  %t599 = load i64, ptr %t607
  %t608 = getelementptr i64, ptr %t595, i64 1
  %t600 = load i64, ptr %t608
  %t609 = getelementptr i64, ptr %t595, i64 2
  %t601 = load i64, ptr %t609
  %t610 = getelementptr i64, ptr %t595, i64 3
  %t602 = load i64, ptr %t610
  %t611 = getelementptr i64, ptr %t595, i64 4
  %t603 = load i64, ptr %t611
  %t612 = getelementptr i64, ptr %t595, i64 5
  %t604 = load i64, ptr %t612
  %t613 = getelementptr i64, ptr %t595, i64 6
  %t605 = load i64, ptr %t613
  %t614 = getelementptr i64, ptr %t595, i64 7
  %t606 = load i64, ptr %t614
  %t596 = icmp sgt i64 %t594, 8
  %t597 = getelementptr i64, ptr %t595, i64 8
  %t598 = select i1 %t596, ptr %t597, ptr null
  %t615 = call fastcc i64%t592(i64 %a0, i64 %t594, i64 %t599, i64 %t600, i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 %t606, ptr %t598)
  %t616 = call ptr @rt_alloc_words(i64 1)
  %t617 = ptrtoint ptr %t616 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_111" to i64), ptr %t616
  %t618 = or i64 %t617, 4
  %t619 = load i64, ptr @"scheme.base:%map1"
  %t620 = and i64 %t619, -8
  %t621 = inttoptr i64 %t620 to ptr
  %t622 = load i64, ptr %t621
  %t623 = inttoptr i64 %t622 to ptr
  %t624 = call fastcc i64%t623(i64 %t619, i64 2, i64 %t618, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t625 = load i64, ptr @"scheme.base:%for-eachn"
  %t626 = and i64 %t625, -8
  %t627 = inttoptr i64 %t626 to ptr
  %t628 = load i64, ptr %t627
  %t629 = inttoptr i64 %t628 to ptr
  %t630 = musttail call fastcc i64 %t629(i64 %t625, i64 2, i64 %a0, i64 %t624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t630
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t635 = icmp sge i64 %argc, 2
  br i1 %t635, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok135:
  %t636 = call ptr @rt_alloc_words(i64 8)
  %t637 = getelementptr i64, ptr %t636, i64 0
  store i64 %a0, ptr %t637
  %t638 = getelementptr i64, ptr %t636, i64 1
  store i64 %a1, ptr %t638
  %t639 = getelementptr i64, ptr %t636, i64 2
  store i64 %a2, ptr %t639
  %t640 = getelementptr i64, ptr %t636, i64 3
  store i64 %a3, ptr %t640
  %t641 = getelementptr i64, ptr %t636, i64 4
  store i64 %a4, ptr %t641
  %t642 = getelementptr i64, ptr %t636, i64 5
  store i64 %a5, ptr %t642
  %t643 = getelementptr i64, ptr %t636, i64 6
  store i64 %a6, ptr %t643
  %t644 = getelementptr i64, ptr %t636, i64 7
  store i64 %a7, ptr %t644
  %t645 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t636, ptr %overflow)
  %t646 = call i64 @rt_null_p(i64 %t645)
  %t647 = icmp ne i64 %t646, 1
  br i1 %t647, label %then136, label %else137
then136:
  %t648 = load i64, ptr @"scheme.base:%for-each1"
  %t649 = and i64 %t648, -8
  %t650 = inttoptr i64 %t649 to ptr
  %t651 = load i64, ptr %t650
  %t652 = inttoptr i64 %t651 to ptr
  %t653 = musttail call fastcc i64 %t652(i64 %t648, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t653
else137:
  %t654 = call i64 @rt_cons(i64 %a1, i64 %t645)
  %t655 = load i64, ptr @"scheme.base:%for-eachn"
  %t656 = and i64 %t655, -8
  %t657 = inttoptr i64 %t656 to ptr
  %t658 = load i64, ptr %t657
  %t659 = inttoptr i64 %t658 to ptr
  %t660 = musttail call fastcc i64 %t659(i64 %t655, i64 2, i64 %a0, i64 %t654, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t660
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t665 = icmp eq i64 %argc, 2
  br i1 %t665, label %argok139, label %arityerr138
arityerr138:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok139:
  %t666 = call i64 @rt_null_p(i64 %a1)
  %t667 = icmp ne i64 %t666, 1
  br i1 %t667, label %then140, label %else141
then140:
  ret i64 257
else141:
  %t668 = call i64 @rt_car(i64 %a1)
  %t669 = and i64 %a0, -8
  %t670 = inttoptr i64 %t669 to ptr
  %t671 = load i64, ptr %t670
  %t672 = inttoptr i64 %t671 to ptr
  %t673 = call fastcc i64%t672(i64 %a0, i64 1, i64 %t668, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t674 = icmp ne i64 %t673, 1
  br i1 %t674, label %then142, label %else143
then142:
  %t675 = call i64 @rt_cdr(i64 %a1)
  %t676 = load i64, ptr @"scheme.base:andmap"
  %t677 = and i64 %t676, -8
  %t678 = inttoptr i64 %t677 to ptr
  %t679 = load i64, ptr %t678
  %t680 = inttoptr i64 %t679 to ptr
  %t681 = musttail call fastcc i64 %t680(i64 %t676, i64 2, i64 %a0, i64 %t675, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t681
else143:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t686 = icmp eq i64 %argc, 2
  br i1 %t686, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok145:
  %t687 = call i64 @rt_null_p(i64 %a1)
  %t688 = icmp ne i64 %t687, 1
  br i1 %t688, label %then146, label %else147
then146:
  ret i64 1
else147:
  %t689 = call i64 @rt_car(i64 %a1)
  %t690 = and i64 %a0, -8
  %t691 = inttoptr i64 %t690 to ptr
  %t692 = load i64, ptr %t691
  %t693 = inttoptr i64 %t692 to ptr
  %t694 = call fastcc i64%t693(i64 %a0, i64 1, i64 %t689, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t695 = icmp ne i64 %t694, 1
  br i1 %t695, label %then148, label %else149
then148:
  ret i64 %a1
else149:
  %t696 = call i64 @rt_cdr(i64 %a1)
  %t697 = load i64, ptr @"scheme.base:memp"
  %t698 = and i64 %t697, -8
  %t699 = inttoptr i64 %t698 to ptr
  %t700 = load i64, ptr %t699
  %t701 = inttoptr i64 %t700 to ptr
  %t702 = musttail call fastcc i64 %t701(i64 %t697, i64 2, i64 %a0, i64 %t696, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t702
}

define fastcc i64 @"scheme.base:code:cadddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t707 = icmp eq i64 %argc, 1
  br i1 %t707, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok151:
  %t708 = load i64, ptr @"scheme.base:cdddr"
  %t709 = and i64 %t708, -8
  %t710 = inttoptr i64 %t709 to ptr
  %t711 = load i64, ptr %t710
  %t712 = inttoptr i64 %t711 to ptr
  %t713 = call fastcc i64%t712(i64 %t708, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t714 = call i64 @rt_car(i64 %t713)
  ret i64 %t714
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t719 = icmp eq i64 %argc, 1
  br i1 %t719, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok153:
  %t720 = call i64 @rt_null_p(i64 %a0)
  %t721 = icmp ne i64 %t720, 1
  br i1 %t721, label %then154, label %else155
then154:
  ret i64 257
else155:
  %t722 = call i64 @rt_pair_p(i64 %a0)
  %t723 = icmp ne i64 %t722, 1
  br i1 %t723, label %then156, label %else157
then156:
  %t724 = call i64 @rt_cdr(i64 %a0)
  %t725 = load i64, ptr @"scheme.base:list?"
  %t726 = and i64 %t725, -8
  %t727 = inttoptr i64 %t726 to ptr
  %t728 = load i64, ptr %t727
  %t729 = inttoptr i64 %t728 to ptr
  %t730 = musttail call fastcc i64 %t729(i64 %t725, i64 1, i64 %t724, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t730
else157:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t735 = icmp eq i64 %argc, 1
  br i1 %t735, label %argok159, label %arityerr158
arityerr158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok159:
  %t736 = or i64 %a0, 0
  %t737 = and i64 %t736, 7
  %t738 = icmp eq i64 %t737, 0
  br i1 %t738, label %fixfast160, label %fixslow161
fixfast160:
  %t739 = icmp eq i64 %a0, 0
  %t740 = select i1 %t739, i64 257, i64 1
  br label %fixmerge162
fixslow161:
  %t741 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge162
fixmerge162:
  %t742 = phi i64 [ %t740, %fixfast160 ], [ %t741, %fixslow161 ]
  ret i64 %t742
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t747 = icmp eq i64 %argc, 2
  br i1 %t747, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok164:
  %t748 = load i64, ptr @"scheme.base:zero?"
  %t749 = and i64 %t748, -8
  %t750 = inttoptr i64 %t749 to ptr
  %t751 = load i64, ptr %t750
  %t752 = inttoptr i64 %t751 to ptr
  %t753 = call fastcc i64%t752(i64 %t748, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t754 = icmp ne i64 %t753, 1
  br i1 %t754, label %then165, label %else166
then165:
  ret i64 %a0
else166:
  %t755 = call i64 @rt_cdr(i64 %a0)
  %t756 = or i64 %a1, 8
  %t757 = and i64 %t756, 7
  %t758 = icmp eq i64 %t757, 0
  br i1 %t758, label %fixfast167, label %fixslow168
fixfast167:
  %t759 = sub i64 %a1, 8
  br label %fixmerge169
fixslow168:
  %t760 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge169
fixmerge169:
  %t761 = phi i64 [ %t759, %fixfast167 ], [ %t760, %fixslow168 ]
  %t762 = load i64, ptr @"scheme.base:list-tail"
  %t763 = and i64 %t762, -8
  %t764 = inttoptr i64 %t763 to ptr
  %t765 = load i64, ptr %t764
  %t766 = inttoptr i64 %t765 to ptr
  %t767 = musttail call fastcc i64 %t766(i64 %t762, i64 2, i64 %t755, i64 %t761, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t767
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t772 = icmp eq i64 %argc, 2
  br i1 %t772, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
  %t773 = load i64, ptr @"scheme.base:list-tail"
  %t774 = and i64 %t773, -8
  %t775 = inttoptr i64 %t774 to ptr
  %t776 = load i64, ptr %t775
  %t777 = inttoptr i64 %t776 to ptr
  %t778 = call fastcc i64%t777(i64 %t773, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t779 = call i64 @rt_car(i64 %t778)
  ret i64 %t779
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t784 = icmp eq i64 %argc, 2
  br i1 %t784, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok173:
  %t785 = load i64, ptr @"scheme.base:zero?"
  %t786 = and i64 %t785, -8
  %t787 = inttoptr i64 %t786 to ptr
  %t788 = load i64, ptr %t787
  %t789 = inttoptr i64 %t788 to ptr
  %t790 = call fastcc i64%t789(i64 %t785, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t791 = icmp ne i64 %t790, 1
  br i1 %t791, label %then174, label %else175
then174:
  ret i64 2
else175:
  %t792 = call i64 @rt_car(i64 %a0)
  %t793 = call i64 @rt_cdr(i64 %a0)
  %t794 = or i64 %a1, 8
  %t795 = and i64 %t794, 7
  %t796 = icmp eq i64 %t795, 0
  br i1 %t796, label %fixfast176, label %fixslow177
fixfast176:
  %t797 = sub i64 %a1, 8
  br label %fixmerge178
fixslow177:
  %t798 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge178
fixmerge178:
  %t799 = phi i64 [ %t797, %fixfast176 ], [ %t798, %fixslow177 ]
  %t800 = load i64, ptr @"scheme.base:list-head"
  %t801 = and i64 %t800, -8
  %t802 = inttoptr i64 %t801 to ptr
  %t803 = load i64, ptr %t802
  %t804 = inttoptr i64 %t803 to ptr
  %t805 = call fastcc i64%t804(i64 %t800, i64 2, i64 %t793, i64 %t799, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t806 = call i64 @rt_cons(i64 %t792, i64 %t805)
  ret i64 %t806
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t811 = icmp eq i64 %argc, 2
  br i1 %t811, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t812 = load i64, ptr @"scheme.base:zero?"
  %t813 = and i64 %t812, -8
  %t814 = inttoptr i64 %t813 to ptr
  %t815 = load i64, ptr %t814
  %t816 = inttoptr i64 %t815 to ptr
  %t817 = call fastcc i64%t816(i64 %t812, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t818 = icmp ne i64 %t817, 1
  br i1 %t818, label %then181, label %else182
then181:
  ret i64 2
else182:
  %t819 = or i64 %a0, 8
  %t820 = and i64 %t819, 7
  %t821 = icmp eq i64 %t820, 0
  br i1 %t821, label %fixfast183, label %fixslow184
fixfast183:
  %t822 = sub i64 %a0, 8
  br label %fixmerge185
fixslow184:
  %t823 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge185
fixmerge185:
  %t824 = phi i64 [ %t822, %fixfast183 ], [ %t823, %fixslow184 ]
  %t825 = load i64, ptr @"scheme.base:make-list"
  %t826 = and i64 %t825, -8
  %t827 = inttoptr i64 %t826 to ptr
  %t828 = load i64, ptr %t827
  %t829 = inttoptr i64 %t828 to ptr
  %t830 = call fastcc i64%t829(i64 %t825, i64 2, i64 %t824, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t831 = call i64 @rt_cons(i64 %a1, i64 %t830)
  ret i64 %t831
}

define fastcc i64 @"scheme.base:code_154"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t836 = icmp eq i64 %argc, 2
  br i1 %t836, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t837 = and i64 %self, -8
  %t838 = inttoptr i64 %t837 to ptr
  %t839 = getelementptr i64, ptr %t838, i64 1
  %t840 = load i64, ptr %t839
  %t841 = or i64 %a0, %t840
  %t842 = and i64 %t841, 7
  %t843 = icmp eq i64 %t842, 0
  br i1 %t843, label %fixfast188, label %fixslow189
fixfast188:
  %t844 = icmp eq i64 %a0, %t840
  %t845 = select i1 %t844, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t846 = call i64 @rt_num_eq(i64 %a0, i64 %t840)
  br label %fixmerge190
fixmerge190:
  %t847 = phi i64 [ %t845, %fixfast188 ], [ %t846, %fixslow189 ]
  %t848 = icmp ne i64 %t847, 1
  br i1 %t848, label %then191, label %else192
then191:
  %t849 = load i64, ptr @"scheme.base:reverse"
  %t850 = and i64 %t849, -8
  %t851 = inttoptr i64 %t850 to ptr
  %t852 = load i64, ptr %t851
  %t853 = inttoptr i64 %t852 to ptr
  %t854 = musttail call fastcc i64 %t853(i64 %t849, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t854
else192:
  %t855 = or i64 %a0, 8
  %t856 = and i64 %t855, 7
  %t857 = icmp eq i64 %t856, 0
  br i1 %t857, label %fixfast193, label %fixslow194
fixfast193:
  %t858 = add i64 %a0, 8
  br label %fixmerge195
fixslow194:
  %t859 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge195
fixmerge195:
  %t860 = phi i64 [ %t858, %fixfast193 ], [ %t859, %fixslow194 ]
  %t861 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t862 = musttail call fastcc i64 @"scheme.base:code_154"(i64 %self, i64 2, i64 %t860, i64 %t861, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t862
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t863 = icmp eq i64 %argc, 1
  br i1 %t863, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok197:
  %t864 = call ptr @rt_alloc_words(i64 3)
  %t865 = ptrtoint ptr %t864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_154" to i64), ptr %t864
  %t866 = or i64 %t865, 4
  %t867 = getelementptr i64, ptr %t864, i64 1
  store i64 %a0, ptr %t867
  %t868 = getelementptr i64, ptr %t864, i64 2
  store i64 %t866, ptr %t868
  %t869 = musttail call fastcc i64 @"scheme.base:code_154"(i64 %t866, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t869
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t874 = icmp eq i64 %argc, 2
  br i1 %t874, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok199:
  %t875 = or i64 %a0, %a1
  %t876 = and i64 %t875, 7
  %t877 = icmp eq i64 %t876, 0
  br i1 %t877, label %fixfast200, label %fixslow201
fixfast200:
  %t878 = icmp slt i64 %a0, %a1
  %t879 = select i1 %t878, i64 257, i64 1
  br label %fixmerge202
fixslow201:
  %t880 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge202
fixmerge202:
  %t881 = phi i64 [ %t879, %fixfast200 ], [ %t880, %fixslow201 ]
  %t882 = icmp ne i64 %t881, 1
  br i1 %t882, label %then203, label %else204
then203:
  ret i64 %a1
else204:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t887 = icmp eq i64 %argc, 0
  br i1 %t887, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok206:
  %t888 = icmp ne i64 1, 1
  br i1 %t888, label %then207, label %else208
then207:
  ret i64 1
else208:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t893 = icmp sge i64 %argc, 0
  br i1 %t893, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok210:
  %t894 = call ptr @rt_alloc_words(i64 8)
  %t895 = getelementptr i64, ptr %t894, i64 0
  store i64 %a0, ptr %t895
  %t896 = getelementptr i64, ptr %t894, i64 1
  store i64 %a1, ptr %t896
  %t897 = getelementptr i64, ptr %t894, i64 2
  store i64 %a2, ptr %t897
  %t898 = getelementptr i64, ptr %t894, i64 3
  store i64 %a3, ptr %t898
  %t899 = getelementptr i64, ptr %t894, i64 4
  store i64 %a4, ptr %t899
  %t900 = getelementptr i64, ptr %t894, i64 5
  store i64 %a5, ptr %t900
  %t901 = getelementptr i64, ptr %t894, i64 6
  store i64 %a6, ptr %t901
  %t902 = getelementptr i64, ptr %t894, i64 7
  store i64 %a7, ptr %t902
  %t903 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t894, ptr %overflow)
  %t904 = call i64 @rt_list_to_string(i64 %t903)
  ret i64 %t904
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t909 = icmp eq i64 %argc, 1
  br i1 %t909, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok212:
  %t910 = call i64 @rt_null_p(i64 %a0)
  %t911 = icmp ne i64 %t910, 1
  br i1 %t911, label %then213, label %else214
then213:
  %t912 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t912
else214:
  %t913 = call i64 @rt_car(i64 %a0)
  %t914 = call i64 @rt_cdr(i64 %a0)
  %t915 = load i64, ptr @"scheme.base:%str-concat"
  %t916 = and i64 %t915, -8
  %t917 = inttoptr i64 %t916 to ptr
  %t918 = load i64, ptr %t917
  %t919 = inttoptr i64 %t918 to ptr
  %t920 = call fastcc i64%t919(i64 %t915, i64 1, i64 %t914, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t921 = call i64 @rt_string_append(i64 %t913, i64 %t920)
  ret i64 %t921
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t926 = icmp eq i64 %argc, 4
  br i1 %t926, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok216:
  %t927 = call i64 @rt_char_to_integer(i64 %a1)
  %t928 = call i64 @rt_char_to_integer(i64 %a2)
  %t929 = and i64 %a0, -8
  %t930 = inttoptr i64 %t929 to ptr
  %t931 = load i64, ptr %t930
  %t932 = inttoptr i64 %t931 to ptr
  %t933 = call fastcc i64%t932(i64 %a0, i64 2, i64 %t927, i64 %t928, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t934 = icmp ne i64 %t933, 1
  br i1 %t934, label %then217, label %else218
then217:
  %t935 = call i64 @rt_null_p(i64 %a3)
  %t936 = icmp ne i64 %t935, 1
  br i1 %t936, label %then219, label %else220
then219:
  ret i64 257
else220:
  %t937 = call i64 @rt_car(i64 %a3)
  %t938 = call i64 @rt_cdr(i64 %a3)
  %t939 = load i64, ptr @"scheme.base:chr-cmp"
  %t940 = and i64 %t939, -8
  %t941 = inttoptr i64 %t940 to ptr
  %t942 = load i64, ptr %t941
  %t943 = inttoptr i64 %t942 to ptr
  %t944 = musttail call fastcc i64 %t943(i64 %t939, i64 4, i64 %a0, i64 %a2, i64 %t937, i64 %t938, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t944
else218:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_183"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t949 = icmp eq i64 %argc, 2
  br i1 %t949, label %argok222, label %arityerr221
arityerr221:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok222:
  %t950 = or i64 %a0, %a1
  %t951 = and i64 %t950, 7
  %t952 = icmp eq i64 %t951, 0
  br i1 %t952, label %fixfast223, label %fixslow224
fixfast223:
  %t953 = icmp eq i64 %a0, %a1
  %t954 = select i1 %t953, i64 257, i64 1
  br label %fixmerge225
fixslow224:
  %t955 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge225
fixmerge225:
  %t956 = phi i64 [ %t954, %fixfast223 ], [ %t955, %fixslow224 ]
  ret i64 %t956
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t957 = icmp sge i64 %argc, 2
  br i1 %t957, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok227:
  %t958 = call ptr @rt_alloc_words(i64 8)
  %t959 = getelementptr i64, ptr %t958, i64 0
  store i64 %a0, ptr %t959
  %t960 = getelementptr i64, ptr %t958, i64 1
  store i64 %a1, ptr %t960
  %t961 = getelementptr i64, ptr %t958, i64 2
  store i64 %a2, ptr %t961
  %t962 = getelementptr i64, ptr %t958, i64 3
  store i64 %a3, ptr %t962
  %t963 = getelementptr i64, ptr %t958, i64 4
  store i64 %a4, ptr %t963
  %t964 = getelementptr i64, ptr %t958, i64 5
  store i64 %a5, ptr %t964
  %t965 = getelementptr i64, ptr %t958, i64 6
  store i64 %a6, ptr %t965
  %t966 = getelementptr i64, ptr %t958, i64 7
  store i64 %a7, ptr %t966
  %t967 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t958, ptr %overflow)
  %t968 = call ptr @rt_alloc_words(i64 1)
  %t969 = ptrtoint ptr %t968 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_183" to i64), ptr %t968
  %t970 = or i64 %t969, 4
  %t971 = load i64, ptr @"scheme.base:chr-cmp"
  %t972 = and i64 %t971, -8
  %t973 = inttoptr i64 %t972 to ptr
  %t974 = load i64, ptr %t973
  %t975 = inttoptr i64 %t974 to ptr
  %t976 = musttail call fastcc i64 %t975(i64 %t971, i64 4, i64 %t970, i64 %a0, i64 %a1, i64 %t967, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t976
}

define fastcc i64 @"scheme.base:code_195"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t981 = icmp eq i64 %argc, 2
  br i1 %t981, label %argok229, label %arityerr228
arityerr228:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok229:
  %t982 = or i64 %a0, %a1
  %t983 = and i64 %t982, 7
  %t984 = icmp eq i64 %t983, 0
  br i1 %t984, label %fixfast230, label %fixslow231
fixfast230:
  %t985 = icmp slt i64 %a0, %a1
  %t986 = select i1 %t985, i64 257, i64 1
  br label %fixmerge232
fixslow231:
  %t987 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge232
fixmerge232:
  %t988 = phi i64 [ %t986, %fixfast230 ], [ %t987, %fixslow231 ]
  ret i64 %t988
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t989 = icmp sge i64 %argc, 2
  br i1 %t989, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok234:
  %t990 = call ptr @rt_alloc_words(i64 8)
  %t991 = getelementptr i64, ptr %t990, i64 0
  store i64 %a0, ptr %t991
  %t992 = getelementptr i64, ptr %t990, i64 1
  store i64 %a1, ptr %t992
  %t993 = getelementptr i64, ptr %t990, i64 2
  store i64 %a2, ptr %t993
  %t994 = getelementptr i64, ptr %t990, i64 3
  store i64 %a3, ptr %t994
  %t995 = getelementptr i64, ptr %t990, i64 4
  store i64 %a4, ptr %t995
  %t996 = getelementptr i64, ptr %t990, i64 5
  store i64 %a5, ptr %t996
  %t997 = getelementptr i64, ptr %t990, i64 6
  store i64 %a6, ptr %t997
  %t998 = getelementptr i64, ptr %t990, i64 7
  store i64 %a7, ptr %t998
  %t999 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t990, ptr %overflow)
  %t1000 = call ptr @rt_alloc_words(i64 1)
  %t1001 = ptrtoint ptr %t1000 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_195" to i64), ptr %t1000
  %t1002 = or i64 %t1001, 4
  %t1003 = load i64, ptr @"scheme.base:chr-cmp"
  %t1004 = and i64 %t1003, -8
  %t1005 = inttoptr i64 %t1004 to ptr
  %t1006 = load i64, ptr %t1005
  %t1007 = inttoptr i64 %t1006 to ptr
  %t1008 = musttail call fastcc i64 %t1007(i64 %t1003, i64 4, i64 %t1002, i64 %a0, i64 %a1, i64 %t999, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1008
}

define fastcc i64 @"scheme.base:code_207"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1013 = icmp eq i64 %argc, 2
  br i1 %t1013, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok236:
  %t1014 = or i64 %a1, %a0
  %t1015 = and i64 %t1014, 7
  %t1016 = icmp eq i64 %t1015, 0
  br i1 %t1016, label %fixfast237, label %fixslow238
fixfast237:
  %t1017 = icmp slt i64 %a1, %a0
  %t1018 = select i1 %t1017, i64 257, i64 1
  br label %fixmerge239
fixslow238:
  %t1019 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge239
fixmerge239:
  %t1020 = phi i64 [ %t1018, %fixfast237 ], [ %t1019, %fixslow238 ]
  ret i64 %t1020
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1021 = icmp sge i64 %argc, 2
  br i1 %t1021, label %argok241, label %arityerr240
arityerr240:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok241:
  %t1022 = call ptr @rt_alloc_words(i64 8)
  %t1023 = getelementptr i64, ptr %t1022, i64 0
  store i64 %a0, ptr %t1023
  %t1024 = getelementptr i64, ptr %t1022, i64 1
  store i64 %a1, ptr %t1024
  %t1025 = getelementptr i64, ptr %t1022, i64 2
  store i64 %a2, ptr %t1025
  %t1026 = getelementptr i64, ptr %t1022, i64 3
  store i64 %a3, ptr %t1026
  %t1027 = getelementptr i64, ptr %t1022, i64 4
  store i64 %a4, ptr %t1027
  %t1028 = getelementptr i64, ptr %t1022, i64 5
  store i64 %a5, ptr %t1028
  %t1029 = getelementptr i64, ptr %t1022, i64 6
  store i64 %a6, ptr %t1029
  %t1030 = getelementptr i64, ptr %t1022, i64 7
  store i64 %a7, ptr %t1030
  %t1031 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1022, ptr %overflow)
  %t1032 = call ptr @rt_alloc_words(i64 1)
  %t1033 = ptrtoint ptr %t1032 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_207" to i64), ptr %t1032
  %t1034 = or i64 %t1033, 4
  %t1035 = load i64, ptr @"scheme.base:chr-cmp"
  %t1036 = and i64 %t1035, -8
  %t1037 = inttoptr i64 %t1036 to ptr
  %t1038 = load i64, ptr %t1037
  %t1039 = inttoptr i64 %t1038 to ptr
  %t1040 = musttail call fastcc i64 %t1039(i64 %t1035, i64 4, i64 %t1034, i64 %a0, i64 %a1, i64 %t1031, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1040
}

define fastcc i64 @"scheme.base:code_219"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1045 = icmp eq i64 %argc, 2
  br i1 %t1045, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok243:
  %t1046 = or i64 %a0, %a1
  %t1047 = and i64 %t1046, 7
  %t1048 = icmp eq i64 %t1047, 0
  br i1 %t1048, label %fixfast244, label %fixslow245
fixfast244:
  %t1049 = icmp slt i64 %a0, %a1
  %t1050 = select i1 %t1049, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1051 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge246
fixmerge246:
  %t1052 = phi i64 [ %t1050, %fixfast244 ], [ %t1051, %fixslow245 ]
  %t1053 = icmp ne i64 %t1052, 1
  br i1 %t1053, label %then247, label %else248
then247:
  ret i64 257
else248:
  %t1054 = or i64 %a0, %a1
  %t1055 = and i64 %t1054, 7
  %t1056 = icmp eq i64 %t1055, 0
  br i1 %t1056, label %fixfast249, label %fixslow250
fixfast249:
  %t1057 = icmp eq i64 %a0, %a1
  %t1058 = select i1 %t1057, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1059 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge251
fixmerge251:
  %t1060 = phi i64 [ %t1058, %fixfast249 ], [ %t1059, %fixslow250 ]
  ret i64 %t1060
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1061 = icmp sge i64 %argc, 2
  br i1 %t1061, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok253:
  %t1062 = call ptr @rt_alloc_words(i64 8)
  %t1063 = getelementptr i64, ptr %t1062, i64 0
  store i64 %a0, ptr %t1063
  %t1064 = getelementptr i64, ptr %t1062, i64 1
  store i64 %a1, ptr %t1064
  %t1065 = getelementptr i64, ptr %t1062, i64 2
  store i64 %a2, ptr %t1065
  %t1066 = getelementptr i64, ptr %t1062, i64 3
  store i64 %a3, ptr %t1066
  %t1067 = getelementptr i64, ptr %t1062, i64 4
  store i64 %a4, ptr %t1067
  %t1068 = getelementptr i64, ptr %t1062, i64 5
  store i64 %a5, ptr %t1068
  %t1069 = getelementptr i64, ptr %t1062, i64 6
  store i64 %a6, ptr %t1069
  %t1070 = getelementptr i64, ptr %t1062, i64 7
  store i64 %a7, ptr %t1070
  %t1071 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1062, ptr %overflow)
  %t1072 = call ptr @rt_alloc_words(i64 1)
  %t1073 = ptrtoint ptr %t1072 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_219" to i64), ptr %t1072
  %t1074 = or i64 %t1073, 4
  %t1075 = load i64, ptr @"scheme.base:chr-cmp"
  %t1076 = and i64 %t1075, -8
  %t1077 = inttoptr i64 %t1076 to ptr
  %t1078 = load i64, ptr %t1077
  %t1079 = inttoptr i64 %t1078 to ptr
  %t1080 = musttail call fastcc i64 %t1079(i64 %t1075, i64 4, i64 %t1074, i64 %a0, i64 %a1, i64 %t1071, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1080
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1085 = icmp eq i64 %argc, 2
  br i1 %t1085, label %argok255, label %arityerr254
arityerr254:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok255:
  %t1086 = or i64 %a1, %a0
  %t1087 = and i64 %t1086, 7
  %t1088 = icmp eq i64 %t1087, 0
  br i1 %t1088, label %fixfast256, label %fixslow257
fixfast256:
  %t1089 = icmp slt i64 %a1, %a0
  %t1090 = select i1 %t1089, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t1091 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge258
fixmerge258:
  %t1092 = phi i64 [ %t1090, %fixfast256 ], [ %t1091, %fixslow257 ]
  %t1093 = icmp ne i64 %t1092, 1
  br i1 %t1093, label %then259, label %else260
then259:
  ret i64 257
else260:
  %t1094 = or i64 %a0, %a1
  %t1095 = and i64 %t1094, 7
  %t1096 = icmp eq i64 %t1095, 0
  br i1 %t1096, label %fixfast261, label %fixslow262
fixfast261:
  %t1097 = icmp eq i64 %a0, %a1
  %t1098 = select i1 %t1097, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1099 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge263
fixmerge263:
  %t1100 = phi i64 [ %t1098, %fixfast261 ], [ %t1099, %fixslow262 ]
  ret i64 %t1100
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1101 = icmp sge i64 %argc, 2
  br i1 %t1101, label %argok265, label %arityerr264
arityerr264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok265:
  %t1102 = call ptr @rt_alloc_words(i64 8)
  %t1103 = getelementptr i64, ptr %t1102, i64 0
  store i64 %a0, ptr %t1103
  %t1104 = getelementptr i64, ptr %t1102, i64 1
  store i64 %a1, ptr %t1104
  %t1105 = getelementptr i64, ptr %t1102, i64 2
  store i64 %a2, ptr %t1105
  %t1106 = getelementptr i64, ptr %t1102, i64 3
  store i64 %a3, ptr %t1106
  %t1107 = getelementptr i64, ptr %t1102, i64 4
  store i64 %a4, ptr %t1107
  %t1108 = getelementptr i64, ptr %t1102, i64 5
  store i64 %a5, ptr %t1108
  %t1109 = getelementptr i64, ptr %t1102, i64 6
  store i64 %a6, ptr %t1109
  %t1110 = getelementptr i64, ptr %t1102, i64 7
  store i64 %a7, ptr %t1110
  %t1111 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1102, ptr %overflow)
  %t1112 = call ptr @rt_alloc_words(i64 1)
  %t1113 = ptrtoint ptr %t1112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t1112
  %t1114 = or i64 %t1113, 4
  %t1115 = load i64, ptr @"scheme.base:chr-cmp"
  %t1116 = and i64 %t1115, -8
  %t1117 = inttoptr i64 %t1116 to ptr
  %t1118 = load i64, ptr %t1117
  %t1119 = inttoptr i64 %t1118 to ptr
  %t1120 = musttail call fastcc i64 %t1119(i64 %t1115, i64 4, i64 %t1114, i64 %a0, i64 %a1, i64 %t1111, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1120
}

define fastcc i64 @"scheme.base:code_242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1125 = icmp eq i64 %argc, 2
  br i1 %t1125, label %argok267, label %arityerr266
arityerr266:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok267:
  %t1126 = or i64 %a0, 0
  %t1127 = and i64 %t1126, 7
  %t1128 = icmp eq i64 %t1127, 0
  br i1 %t1128, label %fixfast268, label %fixslow269
fixfast268:
  %t1129 = icmp slt i64 %a0, 0
  %t1130 = select i1 %t1129, i64 257, i64 1
  br label %fixmerge270
fixslow269:
  %t1131 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge270
fixmerge270:
  %t1132 = phi i64 [ %t1130, %fixfast268 ], [ %t1131, %fixslow269 ]
  %t1133 = icmp ne i64 %t1132, 1
  br i1 %t1133, label %then271, label %else272
then271:
  ret i64 %a1
else272:
  %t1134 = or i64 %a0, 8
  %t1135 = and i64 %t1134, 7
  %t1136 = icmp eq i64 %t1135, 0
  br i1 %t1136, label %fixfast273, label %fixslow274
fixfast273:
  %t1137 = sub i64 %a0, 8
  br label %fixmerge275
fixslow274:
  %t1138 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge275
fixmerge275:
  %t1139 = phi i64 [ %t1137, %fixfast273 ], [ %t1138, %fixslow274 ]
  %t1140 = and i64 %self, -8
  %t1141 = inttoptr i64 %t1140 to ptr
  %t1142 = getelementptr i64, ptr %t1141, i64 2
  %t1143 = load i64, ptr %t1142
  %t1144 = call i64 @rt_string_ref(i64 %t1143, i64 %a0)
  %t1145 = call i64 @rt_cons(i64 %t1144, i64 %a1)
  %t1146 = musttail call fastcc i64 @"scheme.base:code_242"(i64 %self, i64 2, i64 %t1139, i64 %t1145, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1146
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1147 = icmp eq i64 %argc, 1
  br i1 %t1147, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok277:
  %t1148 = call ptr @rt_alloc_words(i64 3)
  %t1149 = ptrtoint ptr %t1148 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_242" to i64), ptr %t1148
  %t1150 = or i64 %t1149, 4
  %t1151 = getelementptr i64, ptr %t1148, i64 1
  store i64 %t1150, ptr %t1151
  %t1152 = getelementptr i64, ptr %t1148, i64 2
  store i64 %a0, ptr %t1152
  %t1153 = call i64 @rt_string_length(i64 %a0)
  %t1154 = or i64 %t1153, 8
  %t1155 = and i64 %t1154, 7
  %t1156 = icmp eq i64 %t1155, 0
  br i1 %t1156, label %fixfast278, label %fixslow279
fixfast278:
  %t1157 = sub i64 %t1153, 8
  br label %fixmerge280
fixslow279:
  %t1158 = call i64 @rt_sub(i64 %t1153, i64 8)
  br label %fixmerge280
fixmerge280:
  %t1159 = phi i64 [ %t1157, %fixfast278 ], [ %t1158, %fixslow279 ]
  %t1160 = musttail call fastcc i64 @"scheme.base:code_242"(i64 %t1150, i64 2, i64 %t1159, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1160
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1165 = icmp eq i64 %argc, 2
  br i1 %t1165, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1166 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1167 = or i64 0, %t1166
  %t1168 = and i64 %t1167, 7
  %t1169 = icmp eq i64 %t1168, 0
  br i1 %t1169, label %fixfast283, label %fixslow284
fixfast283:
  %t1170 = sub i64 0, %t1166
  br label %fixmerge285
fixslow284:
  %t1171 = call i64 @rt_sub(i64 0, i64 %t1166)
  br label %fixmerge285
fixmerge285:
  %t1172 = phi i64 [ %t1170, %fixfast283 ], [ %t1171, %fixslow284 ]
  %t1173 = or i64 384, %t1172
  %t1174 = and i64 %t1173, 7
  %t1175 = icmp eq i64 %t1174, 0
  br i1 %t1175, label %fixfast286, label %fixslow287
fixfast286:
  %t1176 = add i64 384, %t1172
  br label %fixmerge288
fixslow287:
  %t1177 = call i64 @rt_add(i64 384, i64 %t1172)
  br label %fixmerge288
fixmerge288:
  %t1178 = phi i64 [ %t1176, %fixfast286 ], [ %t1177, %fixslow287 ]
  %t1179 = call i64 @rt_integer_to_char(i64 %t1178)
  %t1180 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1181 = or i64 %t1180, 0
  %t1182 = and i64 %t1181, 7
  %t1183 = icmp eq i64 %t1182, 0
  br i1 %t1183, label %fixfast289, label %fixslow290
fixfast289:
  %t1184 = icmp eq i64 %t1180, 0
  %t1185 = select i1 %t1184, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1186 = call i64 @rt_num_eq(i64 %t1180, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1187 = phi i64 [ %t1185, %fixfast289 ], [ %t1186, %fixslow290 ]
  %t1188 = icmp ne i64 %t1187, 1
  br i1 %t1188, label %then292, label %else293
then292:
  %t1189 = call i64 @rt_cons(i64 %t1179, i64 %a1)
  ret i64 %t1189
else293:
  %t1190 = call i64 @rt_cons(i64 %t1179, i64 %a1)
  %t1191 = load i64, ptr @"scheme.base:ns-digits"
  %t1192 = and i64 %t1191, -8
  %t1193 = inttoptr i64 %t1192 to ptr
  %t1194 = load i64, ptr %t1193
  %t1195 = inttoptr i64 %t1194 to ptr
  %t1196 = musttail call fastcc i64 %t1195(i64 %t1191, i64 2, i64 %t1180, i64 %t1190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1196
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1201 = icmp eq i64 %argc, 1
  br i1 %t1201, label %argok295, label %arityerr294
arityerr294:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok295:
  %t1202 = call i64 @rt_exact_p(i64 %a0)
  %t1203 = icmp ne i64 %t1202, 1
  br i1 %t1203, label %then296, label %else297
then296:
  %t1204 = or i64 %a0, 0
  %t1205 = and i64 %t1204, 7
  %t1206 = icmp eq i64 %t1205, 0
  br i1 %t1206, label %fixfast298, label %fixslow299
fixfast298:
  %t1207 = icmp eq i64 %a0, 0
  %t1208 = select i1 %t1207, i64 257, i64 1
  br label %fixmerge300
fixslow299:
  %t1209 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge300
fixmerge300:
  %t1210 = phi i64 [ %t1208, %fixfast298 ], [ %t1209, %fixslow299 ]
  %t1211 = icmp ne i64 %t1210, 1
  br i1 %t1211, label %then301, label %else302
then301:
  %t1212 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1212
else302:
  %t1213 = or i64 %a0, 0
  %t1214 = and i64 %t1213, 7
  %t1215 = icmp eq i64 %t1214, 0
  br i1 %t1215, label %fixfast303, label %fixslow304
fixfast303:
  %t1216 = icmp slt i64 %a0, 0
  %t1217 = select i1 %t1216, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1218 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1219 = phi i64 [ %t1217, %fixfast303 ], [ %t1218, %fixslow304 ]
  %t1220 = icmp ne i64 %t1219, 1
  br i1 %t1220, label %then306, label %else307
then306:
  %t1221 = load i64, ptr @"scheme.base:ns-digits"
  %t1222 = and i64 %t1221, -8
  %t1223 = inttoptr i64 %t1222 to ptr
  %t1224 = load i64, ptr %t1223
  %t1225 = inttoptr i64 %t1224 to ptr
  %t1226 = call fastcc i64%t1225(i64 %t1221, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1227 = call i64 @rt_cons(i64 11529, i64 %t1226)
  %t1228 = call i64 @rt_list_to_string(i64 %t1227)
  ret i64 %t1228
else307:
  %t1229 = or i64 0, %a0
  %t1230 = and i64 %t1229, 7
  %t1231 = icmp eq i64 %t1230, 0
  br i1 %t1231, label %fixfast308, label %fixslow309
fixfast308:
  %t1232 = sub i64 0, %a0
  br label %fixmerge310
fixslow309:
  %t1233 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge310
fixmerge310:
  %t1234 = phi i64 [ %t1232, %fixfast308 ], [ %t1233, %fixslow309 ]
  %t1235 = load i64, ptr @"scheme.base:ns-digits"
  %t1236 = and i64 %t1235, -8
  %t1237 = inttoptr i64 %t1236 to ptr
  %t1238 = load i64, ptr %t1237
  %t1239 = inttoptr i64 %t1238 to ptr
  %t1240 = call fastcc i64%t1239(i64 %t1235, i64 2, i64 %t1234, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1241 = call i64 @rt_list_to_string(i64 %t1240)
  ret i64 %t1241
else297:
  %t1242 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t1242
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1247 = icmp sge i64 %argc, 1
  br i1 %t1247, label %argok312, label %arityerr311
arityerr311:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok312:
  %t1248 = call ptr @rt_alloc_words(i64 8)
  %t1249 = getelementptr i64, ptr %t1248, i64 0
  store i64 %a0, ptr %t1249
  %t1250 = getelementptr i64, ptr %t1248, i64 1
  store i64 %a1, ptr %t1250
  %t1251 = getelementptr i64, ptr %t1248, i64 2
  store i64 %a2, ptr %t1251
  %t1252 = getelementptr i64, ptr %t1248, i64 3
  store i64 %a3, ptr %t1252
  %t1253 = getelementptr i64, ptr %t1248, i64 4
  store i64 %a4, ptr %t1253
  %t1254 = getelementptr i64, ptr %t1248, i64 5
  store i64 %a5, ptr %t1254
  %t1255 = getelementptr i64, ptr %t1248, i64 6
  store i64 %a6, ptr %t1255
  %t1256 = getelementptr i64, ptr %t1248, i64 7
  store i64 %a7, ptr %t1256
  %t1257 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1248, ptr %overflow)
  %t1258 = call i64 @rt_string_p(i64 %a0)
  %t1259 = icmp ne i64 %t1258, 1
  br i1 %t1259, label %then313, label %else314
then313:
  %t1260 = call i64 @rt_error(i64 %a0, i64 %t1257)
  ret i64 %t1260
else314:
  %t1261 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1262 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1263 = call i64 @rt_car(i64 %t1257)
  %t1264 = call i64 @rt_string_append(i64 %t1262, i64 %t1263)
  %t1265 = call i64 @rt_string_append(i64 %t1261, i64 %t1264)
  %t1266 = call i64 @rt_cdr(i64 %t1257)
  %t1267 = call i64 @rt_error(i64 %t1265, i64 %t1266)
  ret i64 %t1267
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1272 = icmp eq i64 %argc, 1
  br i1 %t1272, label %argok316, label %arityerr315
arityerr315:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok316:
  %t1273 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1273
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1278 = icmp eq i64 %argc, 1
  br i1 %t1278, label %argok318, label %arityerr317
arityerr317:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok318:
  %t1279 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1279
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1284 = icmp eq i64 %argc, 1
  br i1 %t1284, label %argok320, label %arityerr319
arityerr319:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok320:
  %t1285 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1285
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1290 = icmp eq i64 %argc, 1
  br i1 %t1290, label %argok322, label %arityerr321
arityerr321:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok322:
  %t1291 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1291
}

define fastcc i64 @"scheme.base:code_280"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1296 = icmp eq i64 %argc, 2
  br i1 %t1296, label %argok324, label %arityerr323
arityerr323:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok324:
  %t1297 = call i64 @rt_null_p(i64 %a0)
  %t1298 = icmp ne i64 %t1297, 1
  br i1 %t1298, label %then325, label %else326
then325:
  %t1299 = and i64 %self, -8
  %t1300 = inttoptr i64 %t1299 to ptr
  %t1301 = getelementptr i64, ptr %t1300, i64 1
  %t1302 = load i64, ptr %t1301
  ret i64 %t1302
else326:
  %t1303 = and i64 %self, -8
  %t1304 = inttoptr i64 %t1303 to ptr
  %t1305 = getelementptr i64, ptr %t1304, i64 1
  %t1306 = load i64, ptr %t1305
  %t1307 = call i64 @rt_car(i64 %a0)
  %t1308 = call i64 @rt_vector_set(i64 %t1306, i64 %a1, i64 %t1307)
  %t1309 = call i64 @rt_cdr(i64 %a0)
  %t1310 = or i64 %a1, 8
  %t1311 = and i64 %t1310, 7
  %t1312 = icmp eq i64 %t1311, 0
  br i1 %t1312, label %fixfast327, label %fixslow328
fixfast327:
  %t1313 = add i64 %a1, 8
  br label %fixmerge329
fixslow328:
  %t1314 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge329
fixmerge329:
  %t1315 = phi i64 [ %t1313, %fixfast327 ], [ %t1314, %fixslow328 ]
  %t1316 = musttail call fastcc i64 @"scheme.base:code_280"(i64 %self, i64 2, i64 %t1309, i64 %t1315, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1316
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1317 = icmp eq i64 %argc, 1
  br i1 %t1317, label %argok331, label %arityerr330
arityerr330:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok331:
  %t1318 = load i64, ptr @"scheme.base:length"
  %t1319 = and i64 %t1318, -8
  %t1320 = inttoptr i64 %t1319 to ptr
  %t1321 = load i64, ptr %t1320
  %t1322 = inttoptr i64 %t1321 to ptr
  %t1323 = call fastcc i64%t1322(i64 %t1318, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1324 = call i64 @rt_make_vector(i64 %t1323, i64 0)
  %t1325 = call ptr @rt_alloc_words(i64 3)
  %t1326 = ptrtoint ptr %t1325 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_280" to i64), ptr %t1325
  %t1327 = or i64 %t1326, 4
  %t1328 = getelementptr i64, ptr %t1325, i64 1
  store i64 %t1324, ptr %t1328
  %t1329 = getelementptr i64, ptr %t1325, i64 2
  store i64 %t1327, ptr %t1329
  %t1330 = musttail call fastcc i64 @"scheme.base:code_280"(i64 %t1327, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1330
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1335 = icmp sge i64 %argc, 0
  br i1 %t1335, label %argok333, label %arityerr332
arityerr332:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok333:
  %t1336 = call ptr @rt_alloc_words(i64 8)
  %t1337 = getelementptr i64, ptr %t1336, i64 0
  store i64 %a0, ptr %t1337
  %t1338 = getelementptr i64, ptr %t1336, i64 1
  store i64 %a1, ptr %t1338
  %t1339 = getelementptr i64, ptr %t1336, i64 2
  store i64 %a2, ptr %t1339
  %t1340 = getelementptr i64, ptr %t1336, i64 3
  store i64 %a3, ptr %t1340
  %t1341 = getelementptr i64, ptr %t1336, i64 4
  store i64 %a4, ptr %t1341
  %t1342 = getelementptr i64, ptr %t1336, i64 5
  store i64 %a5, ptr %t1342
  %t1343 = getelementptr i64, ptr %t1336, i64 6
  store i64 %a6, ptr %t1343
  %t1344 = getelementptr i64, ptr %t1336, i64 7
  store i64 %a7, ptr %t1344
  %t1345 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1336, ptr %overflow)
  %t1346 = load i64, ptr @"scheme.base:list->vector"
  %t1347 = and i64 %t1346, -8
  %t1348 = inttoptr i64 %t1347 to ptr
  %t1349 = load i64, ptr %t1348
  %t1350 = inttoptr i64 %t1349 to ptr
  %t1351 = musttail call fastcc i64 %t1350(i64 %t1346, i64 1, i64 %t1345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1351
}

define fastcc i64 @"scheme.base:code_290"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1356 = icmp eq i64 %argc, 2
  br i1 %t1356, label %argok335, label %arityerr334
arityerr334:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok335:
  %t1357 = call i64 @rt_null_p(i64 %a0)
  %t1358 = icmp ne i64 %t1357, 1
  br i1 %t1358, label %then336, label %else337
then336:
  %t1359 = and i64 %self, -8
  %t1360 = inttoptr i64 %t1359 to ptr
  %t1361 = getelementptr i64, ptr %t1360, i64 1
  %t1362 = load i64, ptr %t1361
  ret i64 %t1362
else337:
  %t1363 = and i64 %self, -8
  %t1364 = inttoptr i64 %t1363 to ptr
  %t1365 = getelementptr i64, ptr %t1364, i64 1
  %t1366 = load i64, ptr %t1365
  %t1367 = call i64 @rt_car(i64 %a0)
  %t1368 = call i64 @rt_bytevector_u8_set(i64 %t1366, i64 %a1, i64 %t1367)
  %t1369 = call i64 @rt_cdr(i64 %a0)
  %t1370 = or i64 %a1, 8
  %t1371 = and i64 %t1370, 7
  %t1372 = icmp eq i64 %t1371, 0
  br i1 %t1372, label %fixfast338, label %fixslow339
fixfast338:
  %t1373 = add i64 %a1, 8
  br label %fixmerge340
fixslow339:
  %t1374 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge340
fixmerge340:
  %t1375 = phi i64 [ %t1373, %fixfast338 ], [ %t1374, %fixslow339 ]
  %t1376 = musttail call fastcc i64 @"scheme.base:code_290"(i64 %self, i64 2, i64 %t1369, i64 %t1375, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1376
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1377 = icmp eq i64 %argc, 1
  br i1 %t1377, label %argok342, label %arityerr341
arityerr341:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok342:
  %t1378 = load i64, ptr @"scheme.base:length"
  %t1379 = and i64 %t1378, -8
  %t1380 = inttoptr i64 %t1379 to ptr
  %t1381 = load i64, ptr %t1380
  %t1382 = inttoptr i64 %t1381 to ptr
  %t1383 = call fastcc i64%t1382(i64 %t1378, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1384 = call i64 @rt_make_bytevector(i64 %t1383, i64 0)
  %t1385 = call ptr @rt_alloc_words(i64 3)
  %t1386 = ptrtoint ptr %t1385 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_290" to i64), ptr %t1385
  %t1387 = or i64 %t1386, 4
  %t1388 = getelementptr i64, ptr %t1385, i64 1
  store i64 %t1384, ptr %t1388
  %t1389 = getelementptr i64, ptr %t1385, i64 2
  store i64 %t1387, ptr %t1389
  %t1390 = musttail call fastcc i64 @"scheme.base:code_290"(i64 %t1387, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1390
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1395 = icmp sge i64 %argc, 0
  br i1 %t1395, label %argok344, label %arityerr343
arityerr343:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok344:
  %t1396 = call ptr @rt_alloc_words(i64 8)
  %t1397 = getelementptr i64, ptr %t1396, i64 0
  store i64 %a0, ptr %t1397
  %t1398 = getelementptr i64, ptr %t1396, i64 1
  store i64 %a1, ptr %t1398
  %t1399 = getelementptr i64, ptr %t1396, i64 2
  store i64 %a2, ptr %t1399
  %t1400 = getelementptr i64, ptr %t1396, i64 3
  store i64 %a3, ptr %t1400
  %t1401 = getelementptr i64, ptr %t1396, i64 4
  store i64 %a4, ptr %t1401
  %t1402 = getelementptr i64, ptr %t1396, i64 5
  store i64 %a5, ptr %t1402
  %t1403 = getelementptr i64, ptr %t1396, i64 6
  store i64 %a6, ptr %t1403
  %t1404 = getelementptr i64, ptr %t1396, i64 7
  store i64 %a7, ptr %t1404
  %t1405 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1396, ptr %overflow)
  %t1406 = load i64, ptr @"scheme.base:list->bytevector"
  %t1407 = and i64 %t1406, -8
  %t1408 = inttoptr i64 %t1407 to ptr
  %t1409 = load i64, ptr %t1408
  %t1410 = inttoptr i64 %t1409 to ptr
  %t1411 = musttail call fastcc i64 %t1410(i64 %t1406, i64 1, i64 %t1405, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1411
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1416 = icmp sge i64 %argc, 0
  br i1 %t1416, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok346:
  %t1417 = call ptr @rt_alloc_words(i64 8)
  %t1418 = getelementptr i64, ptr %t1417, i64 0
  store i64 %a0, ptr %t1418
  %t1419 = getelementptr i64, ptr %t1417, i64 1
  store i64 %a1, ptr %t1419
  %t1420 = getelementptr i64, ptr %t1417, i64 2
  store i64 %a2, ptr %t1420
  %t1421 = getelementptr i64, ptr %t1417, i64 3
  store i64 %a3, ptr %t1421
  %t1422 = getelementptr i64, ptr %t1417, i64 4
  store i64 %a4, ptr %t1422
  %t1423 = getelementptr i64, ptr %t1417, i64 5
  store i64 %a5, ptr %t1423
  %t1424 = getelementptr i64, ptr %t1417, i64 6
  store i64 %a6, ptr %t1424
  %t1425 = getelementptr i64, ptr %t1417, i64 7
  store i64 %a7, ptr %t1425
  %t1426 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1417, ptr %overflow)
  %t1427 = call i64 @rt_pair_p(i64 %t1426)
  %t1428 = icmp ne i64 %t1427, 1
  br i1 %t1428, label %then347, label %else348
then347:
  %t1429 = call i64 @rt_cdr(i64 %t1426)
  %t1430 = call i64 @rt_null_p(i64 %t1429)
  br label %merge349
else348:
  br label %merge349
merge349:
  %t1431 = phi i64 [ %t1430, %then347 ], [ 1, %else348 ]
  %t1432 = icmp ne i64 %t1431, 1
  br i1 %t1432, label %then350, label %else351
then350:
  %t1433 = call i64 @rt_car(i64 %t1426)
  ret i64 %t1433
else351:
  %t1434 = call i64 @rt_list_to_mv(i64 %t1426)
  ret i64 %t1434
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1439 = icmp eq i64 %argc, 2
  br i1 %t1439, label %argok353, label %arityerr352
arityerr352:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok353:
  %t1440 = and i64 %a0, -8
  %t1441 = inttoptr i64 %t1440 to ptr
  %t1442 = load i64, ptr %t1441
  %t1443 = inttoptr i64 %t1442 to ptr
  %t1444 = call fastcc i64%t1443(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1445 = call i64 @rt_mv_p(i64 %t1444)
  %t1446 = icmp ne i64 %t1445, 1
  br i1 %t1446, label %then354, label %else355
then354:
  %t1447 = call i64 @rt_mv_to_list(i64 %t1444)
  %t1448 = and i64 %a1, -8
  %t1449 = inttoptr i64 %t1448 to ptr
  %t1450 = load i64, ptr %t1449
  %t1451 = inttoptr i64 %t1450 to ptr
  %t1452 = call i64 @rt_list_length(i64 %t1447)
  %t1453 = add i64 0, %t1452
  %t1454 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t1447, i64 8)
  %t1466 = getelementptr i64, ptr %t1454, i64 0
  %t1458 = load i64, ptr %t1466
  %t1467 = getelementptr i64, ptr %t1454, i64 1
  %t1459 = load i64, ptr %t1467
  %t1468 = getelementptr i64, ptr %t1454, i64 2
  %t1460 = load i64, ptr %t1468
  %t1469 = getelementptr i64, ptr %t1454, i64 3
  %t1461 = load i64, ptr %t1469
  %t1470 = getelementptr i64, ptr %t1454, i64 4
  %t1462 = load i64, ptr %t1470
  %t1471 = getelementptr i64, ptr %t1454, i64 5
  %t1463 = load i64, ptr %t1471
  %t1472 = getelementptr i64, ptr %t1454, i64 6
  %t1464 = load i64, ptr %t1472
  %t1473 = getelementptr i64, ptr %t1454, i64 7
  %t1465 = load i64, ptr %t1473
  %t1455 = icmp sgt i64 %t1453, 8
  %t1456 = getelementptr i64, ptr %t1454, i64 8
  %t1457 = select i1 %t1455, ptr %t1456, ptr null
  %t1474 = musttail call fastcc i64 %t1451(i64 %a1, i64 %t1453, i64 %t1458, i64 %t1459, i64 %t1460, i64 %t1461, i64 %t1462, i64 %t1463, i64 %t1464, i64 %t1465, ptr %t1457)
  ret i64 %t1474
else355:
  %t1475 = and i64 %a1, -8
  %t1476 = inttoptr i64 %t1475 to ptr
  %t1477 = load i64, ptr %t1476
  %t1478 = inttoptr i64 %t1477 to ptr
  %t1479 = musttail call fastcc i64 %t1478(i64 %a1, i64 1, i64 %t1444, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1479
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1486 = icmp eq i64 %argc, 0
  br i1 %t1486, label %argok357, label %arityerr356
arityerr356:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok357:
  %t1487 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t1488 = call i64 @rt_make_vector(i64 %t1487, i64 2)
  %t1489 = load i64, ptr @"scheme.base:vector"
  %t1490 = and i64 %t1489, -8
  %t1491 = inttoptr i64 %t1490 to ptr
  %t1492 = load i64, ptr %t1491
  %t1493 = inttoptr i64 %t1492 to ptr
  %t1494 = call fastcc i64%t1493(i64 %t1489, i64 3, i64 0, i64 %t1488, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1495 = call i64 @rt_make_hash_table(i64 %t1494)
  ret i64 %t1495
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1500 = icmp eq i64 %argc, 1
  br i1 %t1500, label %argok359, label %arityerr358
arityerr358:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok359:
  %t1501 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t1501
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1506 = icmp eq i64 %argc, 1
  br i1 %t1506, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok361:
  %t1507 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1508 = call i64 @rt_vector_ref(i64 %t1507, i64 0)
  ret i64 %t1508
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1513 = icmp eq i64 %argc, 1
  br i1 %t1513, label %argok363, label %arityerr362
arityerr362:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok363:
  %t1514 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1515 = call i64 @rt_vector_ref(i64 %t1514, i64 8)
  ret i64 %t1515
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1520 = icmp eq i64 %argc, 2
  br i1 %t1520, label %argok365, label %arityerr364
arityerr364:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok365:
  %t1521 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1522 = call i64 @rt_vector_set(i64 %t1521, i64 0, i64 %a1)
  ret i64 %t1522
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1527 = icmp eq i64 %argc, 2
  br i1 %t1527, label %argok367, label %arityerr366
arityerr366:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok367:
  %t1528 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1529 = call i64 @rt_vector_set(i64 %t1528, i64 8, i64 %a1)
  ret i64 %t1529
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1534 = icmp eq i64 %argc, 2
  br i1 %t1534, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok369:
  %t1535 = call i64 @rt_hash(i64 %a0)
  %t1536 = call i64 @rt_remainder(i64 %t1535, i64 %a1)
  ret i64 %t1536
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1541 = icmp eq i64 %argc, 2
  br i1 %t1541, label %argok371, label %arityerr370
arityerr370:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok371:
  %t1542 = call i64 @rt_null_p(i64 %a1)
  %t1543 = icmp ne i64 %t1542, 1
  br i1 %t1543, label %then372, label %else373
then372:
  ret i64 1
else373:
  %t1544 = call i64 @rt_car(i64 %a1)
  %t1545 = call i64 @rt_car(i64 %t1544)
  %t1546 = call i64 @rt_equal(i64 %a0, i64 %t1545)
  %t1547 = icmp ne i64 %t1546, 1
  br i1 %t1547, label %then374, label %else375
then374:
  %t1548 = call i64 @rt_car(i64 %a1)
  ret i64 %t1548
else375:
  %t1549 = call i64 @rt_cdr(i64 %a1)
  %t1550 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1551 = and i64 %t1550, -8
  %t1552 = inttoptr i64 %t1551 to ptr
  %t1553 = load i64, ptr %t1552
  %t1554 = inttoptr i64 %t1553 to ptr
  %t1555 = musttail call fastcc i64 %t1554(i64 %t1550, i64 2, i64 %a0, i64 %t1549, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1555
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1560 = icmp eq i64 %argc, 2
  br i1 %t1560, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok377:
  %t1561 = call i64 @rt_null_p(i64 %a1)
  %t1562 = icmp ne i64 %t1561, 1
  br i1 %t1562, label %then378, label %else379
then378:
  ret i64 2
else379:
  %t1563 = call i64 @rt_car(i64 %a1)
  %t1564 = call i64 @rt_car(i64 %t1563)
  %t1565 = call i64 @rt_equal(i64 %a0, i64 %t1564)
  %t1566 = icmp ne i64 %t1565, 1
  br i1 %t1566, label %then380, label %else381
then380:
  %t1567 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t1567
else381:
  %t1568 = call i64 @rt_car(i64 %a1)
  %t1569 = call i64 @rt_cdr(i64 %a1)
  %t1570 = load i64, ptr @"scheme.base:%ht-remove"
  %t1571 = and i64 %t1570, -8
  %t1572 = inttoptr i64 %t1571 to ptr
  %t1573 = load i64, ptr %t1572
  %t1574 = inttoptr i64 %t1573 to ptr
  %t1575 = call fastcc i64%t1574(i64 %t1570, i64 2, i64 %a0, i64 %t1569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1576 = call i64 @rt_cons(i64 %t1568, i64 %t1575)
  ret i64 %t1576
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1581 = icmp eq i64 %argc, 3
  br i1 %t1581, label %argok383, label %arityerr382
arityerr382:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok383:
  %t1582 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1583 = and i64 %t1582, -8
  %t1584 = inttoptr i64 %t1583 to ptr
  %t1585 = load i64, ptr %t1584
  %t1586 = inttoptr i64 %t1585 to ptr
  %t1587 = call fastcc i64%t1586(i64 %t1582, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1588 = call i64 @rt_vector_length(i64 %t1587)
  %t1589 = load i64, ptr @"scheme.base:%ht-index"
  %t1590 = and i64 %t1589, -8
  %t1591 = inttoptr i64 %t1590 to ptr
  %t1592 = load i64, ptr %t1591
  %t1593 = inttoptr i64 %t1592 to ptr
  %t1594 = call fastcc i64%t1593(i64 %t1589, i64 2, i64 %a1, i64 %t1588, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1595 = call i64 @rt_vector_ref(i64 %t1587, i64 %t1594)
  %t1596 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1597 = and i64 %t1596, -8
  %t1598 = inttoptr i64 %t1597 to ptr
  %t1599 = load i64, ptr %t1598
  %t1600 = inttoptr i64 %t1599 to ptr
  %t1601 = call fastcc i64%t1600(i64 %t1596, i64 2, i64 %a1, i64 %t1595, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1602 = icmp ne i64 %t1601, 1
  br i1 %t1602, label %then384, label %else385
then384:
  %t1603 = call i64 @rt_cdr(i64 %t1601)
  ret i64 %t1603
else385:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1608 = icmp eq i64 %argc, 2
  br i1 %t1608, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok387:
  %t1609 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1610 = and i64 %t1609, -8
  %t1611 = inttoptr i64 %t1610 to ptr
  %t1612 = load i64, ptr %t1611
  %t1613 = inttoptr i64 %t1612 to ptr
  %t1614 = call fastcc i64%t1613(i64 %t1609, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1615 = call i64 @rt_vector_length(i64 %t1614)
  %t1616 = load i64, ptr @"scheme.base:%ht-index"
  %t1617 = and i64 %t1616, -8
  %t1618 = inttoptr i64 %t1617 to ptr
  %t1619 = load i64, ptr %t1618
  %t1620 = inttoptr i64 %t1619 to ptr
  %t1621 = call fastcc i64%t1620(i64 %t1616, i64 2, i64 %a1, i64 %t1615, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1622 = call i64 @rt_vector_ref(i64 %t1614, i64 %t1621)
  %t1623 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1624 = and i64 %t1623, -8
  %t1625 = inttoptr i64 %t1624 to ptr
  %t1626 = load i64, ptr %t1625
  %t1627 = inttoptr i64 %t1626 to ptr
  %t1628 = call fastcc i64%t1627(i64 %t1623, i64 2, i64 %a1, i64 %t1622, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1629 = icmp ne i64 %t1628, 1
  br i1 %t1629, label %then388, label %else389
then388:
  ret i64 257
else389:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1634 = icmp eq i64 %argc, 2
  br i1 %t1634, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok391:
  %t1635 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1636 = and i64 %t1635, -8
  %t1637 = inttoptr i64 %t1636 to ptr
  %t1638 = load i64, ptr %t1637
  %t1639 = inttoptr i64 %t1638 to ptr
  %t1640 = call fastcc i64%t1639(i64 %t1635, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1641 = call i64 @rt_vector_length(i64 %t1640)
  %t1642 = load i64, ptr @"scheme.base:%ht-index"
  %t1643 = and i64 %t1642, -8
  %t1644 = inttoptr i64 %t1643 to ptr
  %t1645 = load i64, ptr %t1644
  %t1646 = inttoptr i64 %t1645 to ptr
  %t1647 = call fastcc i64%t1646(i64 %t1642, i64 2, i64 %a1, i64 %t1641, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1648 = call i64 @rt_vector_ref(i64 %t1640, i64 %t1647)
  %t1649 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1650 = and i64 %t1649, -8
  %t1651 = inttoptr i64 %t1650 to ptr
  %t1652 = load i64, ptr %t1651
  %t1653 = inttoptr i64 %t1652 to ptr
  %t1654 = call fastcc i64%t1653(i64 %t1649, i64 2, i64 %a1, i64 %t1648, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1655 = icmp ne i64 %t1654, 1
  br i1 %t1655, label %then392, label %else393
then392:
  %t1656 = call i64 @rt_cdr(i64 %t1654)
  ret i64 %t1656
else393:
  %t1657 = call i64 @rt_make_string(ptr @.str.lit.3, i64 29)
  %t1658 = load i64, ptr @"scheme.base:error"
  %t1659 = and i64 %t1658, -8
  %t1660 = inttoptr i64 %t1659 to ptr
  %t1661 = load i64, ptr %t1660
  %t1662 = inttoptr i64 %t1661 to ptr
  %t1663 = musttail call fastcc i64 %t1662(i64 %t1658, i64 2, i64 %t1657, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1663
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1668 = icmp eq i64 %argc, 3
  br i1 %t1668, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok395:
  %t1669 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1670 = and i64 %t1669, -8
  %t1671 = inttoptr i64 %t1670 to ptr
  %t1672 = load i64, ptr %t1671
  %t1673 = inttoptr i64 %t1672 to ptr
  %t1674 = call fastcc i64%t1673(i64 %t1669, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1675 = call i64 @rt_vector_length(i64 %t1674)
  %t1676 = load i64, ptr @"scheme.base:%ht-index"
  %t1677 = and i64 %t1676, -8
  %t1678 = inttoptr i64 %t1677 to ptr
  %t1679 = load i64, ptr %t1678
  %t1680 = inttoptr i64 %t1679 to ptr
  %t1681 = call fastcc i64%t1680(i64 %t1676, i64 2, i64 %a1, i64 %t1675, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1682 = call i64 @rt_vector_ref(i64 %t1674, i64 %t1681)
  %t1683 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1684 = and i64 %t1683, -8
  %t1685 = inttoptr i64 %t1684 to ptr
  %t1686 = load i64, ptr %t1685
  %t1687 = inttoptr i64 %t1686 to ptr
  %t1688 = call fastcc i64%t1687(i64 %t1683, i64 2, i64 %a1, i64 %t1682, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1689 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t1690 = icmp ne i64 %t1688, 1
  br i1 %t1690, label %then396, label %else397
then396:
  %t1691 = load i64, ptr @"scheme.base:%ht-remove"
  %t1692 = and i64 %t1691, -8
  %t1693 = inttoptr i64 %t1692 to ptr
  %t1694 = load i64, ptr %t1693
  %t1695 = inttoptr i64 %t1694 to ptr
  %t1696 = call fastcc i64%t1695(i64 %t1691, i64 2, i64 %a1, i64 %t1682, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge398
else397:
  br label %merge398
merge398:
  %t1697 = phi i64 [ %t1696, %then396 ], [ %t1682, %else397 ]
  %t1698 = call i64 @rt_cons(i64 %t1689, i64 %t1697)
  %t1699 = call i64 @rt_vector_set(i64 %t1674, i64 %t1681, i64 %t1698)
  %t1700 = icmp ne i64 %t1688, 1
  br i1 %t1700, label %then399, label %else400
then399:
  ret i64 1
else400:
  %t1701 = load i64, ptr @"scheme.base:%ht-count"
  %t1702 = and i64 %t1701, -8
  %t1703 = inttoptr i64 %t1702 to ptr
  %t1704 = load i64, ptr %t1703
  %t1705 = inttoptr i64 %t1704 to ptr
  %t1706 = call fastcc i64%t1705(i64 %t1701, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1707 = or i64 %t1706, 8
  %t1708 = and i64 %t1707, 7
  %t1709 = icmp eq i64 %t1708, 0
  br i1 %t1709, label %fixfast401, label %fixslow402
fixfast401:
  %t1710 = add i64 %t1706, 8
  br label %fixmerge403
fixslow402:
  %t1711 = call i64 @rt_add(i64 %t1706, i64 8)
  br label %fixmerge403
fixmerge403:
  %t1712 = phi i64 [ %t1710, %fixfast401 ], [ %t1711, %fixslow402 ]
  %t1713 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t1714 = and i64 %t1713, -8
  %t1715 = inttoptr i64 %t1714 to ptr
  %t1716 = load i64, ptr %t1715
  %t1717 = inttoptr i64 %t1716 to ptr
  %t1718 = call fastcc i64%t1717(i64 %t1713, i64 2, i64 %a0, i64 %t1712, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1719 = load i64, ptr @"scheme.base:%ht-count"
  %t1720 = and i64 %t1719, -8
  %t1721 = inttoptr i64 %t1720 to ptr
  %t1722 = load i64, ptr %t1721
  %t1723 = inttoptr i64 %t1722 to ptr
  %t1724 = call fastcc i64%t1723(i64 %t1719, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1725 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t1726 = or i64 %t1725, %t1675
  %t1727 = and i64 %t1726, 7
  %t1728 = icmp eq i64 %t1727, 0
  br i1 %t1728, label %fixfast404, label %fixslow405
fixfast404:
  %t1729 = ashr i64 %t1725, 3
  %t1730 = mul i64 %t1729, %t1675
  br label %fixmerge406
fixslow405:
  %t1731 = call i64 @rt_mul(i64 %t1725, i64 %t1675)
  br label %fixmerge406
fixmerge406:
  %t1732 = phi i64 [ %t1730, %fixfast404 ], [ %t1731, %fixslow405 ]
  %t1733 = or i64 %t1732, %t1724
  %t1734 = and i64 %t1733, 7
  %t1735 = icmp eq i64 %t1734, 0
  br i1 %t1735, label %fixfast407, label %fixslow408
fixfast407:
  %t1736 = icmp slt i64 %t1732, %t1724
  %t1737 = select i1 %t1736, i64 257, i64 1
  br label %fixmerge409
fixslow408:
  %t1738 = call i64 @rt_lt(i64 %t1732, i64 %t1724)
  br label %fixmerge409
fixmerge409:
  %t1739 = phi i64 [ %t1737, %fixfast407 ], [ %t1738, %fixslow408 ]
  %t1740 = icmp ne i64 %t1739, 1
  br i1 %t1740, label %then410, label %else411
then410:
  %t1741 = load i64, ptr @"scheme.base:%ht-grow!"
  %t1742 = and i64 %t1741, -8
  %t1743 = inttoptr i64 %t1742 to ptr
  %t1744 = load i64, ptr %t1743
  %t1745 = inttoptr i64 %t1744 to ptr
  %t1746 = musttail call fastcc i64 %t1745(i64 %t1741, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1746
else411:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1751 = icmp eq i64 %argc, 2
  br i1 %t1751, label %argok413, label %arityerr412
arityerr412:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok413:
  %t1752 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1753 = and i64 %t1752, -8
  %t1754 = inttoptr i64 %t1753 to ptr
  %t1755 = load i64, ptr %t1754
  %t1756 = inttoptr i64 %t1755 to ptr
  %t1757 = call fastcc i64%t1756(i64 %t1752, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1758 = call i64 @rt_vector_length(i64 %t1757)
  %t1759 = load i64, ptr @"scheme.base:%ht-index"
  %t1760 = and i64 %t1759, -8
  %t1761 = inttoptr i64 %t1760 to ptr
  %t1762 = load i64, ptr %t1761
  %t1763 = inttoptr i64 %t1762 to ptr
  %t1764 = call fastcc i64%t1763(i64 %t1759, i64 2, i64 %a1, i64 %t1758, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1765 = call i64 @rt_vector_ref(i64 %t1757, i64 %t1764)
  %t1766 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1767 = and i64 %t1766, -8
  %t1768 = inttoptr i64 %t1767 to ptr
  %t1769 = load i64, ptr %t1768
  %t1770 = inttoptr i64 %t1769 to ptr
  %t1771 = call fastcc i64%t1770(i64 %t1766, i64 2, i64 %a1, i64 %t1765, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1772 = icmp ne i64 %t1771, 1
  br i1 %t1772, label %then414, label %else415
then414:
  %t1773 = load i64, ptr @"scheme.base:%ht-remove"
  %t1774 = and i64 %t1773, -8
  %t1775 = inttoptr i64 %t1774 to ptr
  %t1776 = load i64, ptr %t1775
  %t1777 = inttoptr i64 %t1776 to ptr
  %t1778 = call fastcc i64%t1777(i64 %t1773, i64 2, i64 %a1, i64 %t1765, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1779 = call i64 @rt_vector_set(i64 %t1757, i64 %t1764, i64 %t1778)
  %t1780 = load i64, ptr @"scheme.base:%ht-count"
  %t1781 = and i64 %t1780, -8
  %t1782 = inttoptr i64 %t1781 to ptr
  %t1783 = load i64, ptr %t1782
  %t1784 = inttoptr i64 %t1783 to ptr
  %t1785 = call fastcc i64%t1784(i64 %t1780, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1786 = or i64 %t1785, 8
  %t1787 = and i64 %t1786, 7
  %t1788 = icmp eq i64 %t1787, 0
  br i1 %t1788, label %fixfast416, label %fixslow417
fixfast416:
  %t1789 = sub i64 %t1785, 8
  br label %fixmerge418
fixslow417:
  %t1790 = call i64 @rt_sub(i64 %t1785, i64 8)
  br label %fixmerge418
fixmerge418:
  %t1791 = phi i64 [ %t1789, %fixfast416 ], [ %t1790, %fixslow417 ]
  %t1792 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t1793 = and i64 %t1792, -8
  %t1794 = inttoptr i64 %t1793 to ptr
  %t1795 = load i64, ptr %t1794
  %t1796 = inttoptr i64 %t1795 to ptr
  %t1797 = musttail call fastcc i64 %t1796(i64 %t1792, i64 2, i64 %a0, i64 %t1791, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1797
else415:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_373"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1802 = icmp eq i64 %argc, 1
  br i1 %t1802, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok420:
  %t1803 = call i64 @rt_null_p(i64 %a0)
  %t1804 = icmp ne i64 %t1803, 1
  br i1 %t1804, label %then421, label %else422
then421:
  ret i64 1
else422:
  %t1805 = call i64 @rt_car(i64 %a0)
  %t1806 = call i64 @rt_car(i64 %t1805)
  %t1807 = and i64 %self, -8
  %t1808 = inttoptr i64 %t1807 to ptr
  %t1809 = getelementptr i64, ptr %t1808, i64 1
  %t1810 = load i64, ptr %t1809
  %t1811 = load i64, ptr @"scheme.base:%ht-index"
  %t1812 = and i64 %t1811, -8
  %t1813 = inttoptr i64 %t1812 to ptr
  %t1814 = load i64, ptr %t1813
  %t1815 = inttoptr i64 %t1814 to ptr
  %t1816 = call fastcc i64%t1815(i64 %t1811, i64 2, i64 %t1806, i64 %t1810, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1817 = and i64 %self, -8
  %t1818 = inttoptr i64 %t1817 to ptr
  %t1819 = getelementptr i64, ptr %t1818, i64 2
  %t1820 = load i64, ptr %t1819
  %t1821 = and i64 %self, -8
  %t1822 = inttoptr i64 %t1821 to ptr
  %t1823 = getelementptr i64, ptr %t1822, i64 2
  %t1824 = load i64, ptr %t1823
  %t1825 = call i64 @rt_vector_ref(i64 %t1824, i64 %t1816)
  %t1826 = call i64 @rt_cons(i64 %t1805, i64 %t1825)
  %t1827 = call i64 @rt_vector_set(i64 %t1820, i64 %t1816, i64 %t1826)
  %t1828 = call i64 @rt_cdr(i64 %a0)
  %t1829 = musttail call fastcc i64 @"scheme.base:code_373"(i64 %self, i64 1, i64 %t1828, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1829
}

define fastcc i64 @"scheme.base:code_371"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1830 = icmp eq i64 %argc, 1
  br i1 %t1830, label %argok424, label %arityerr423
arityerr423:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok424:
  %t1831 = and i64 %self, -8
  %t1832 = inttoptr i64 %t1831 to ptr
  %t1833 = getelementptr i64, ptr %t1832, i64 1
  %t1834 = load i64, ptr %t1833
  %t1835 = call i64 @rt_vector_length(i64 %t1834)
  %t1836 = or i64 %a0, %t1835
  %t1837 = and i64 %t1836, 7
  %t1838 = icmp eq i64 %t1837, 0
  br i1 %t1838, label %fixfast425, label %fixslow426
fixfast425:
  %t1839 = icmp slt i64 %a0, %t1835
  %t1840 = select i1 %t1839, i64 257, i64 1
  br label %fixmerge427
fixslow426:
  %t1841 = call i64 @rt_lt(i64 %a0, i64 %t1835)
  br label %fixmerge427
fixmerge427:
  %t1842 = phi i64 [ %t1840, %fixfast425 ], [ %t1841, %fixslow426 ]
  %t1843 = icmp ne i64 %t1842, 1
  br i1 %t1843, label %then428, label %else429
then428:
  %t1844 = call ptr @rt_alloc_words(i64 4)
  %t1845 = ptrtoint ptr %t1844 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_373" to i64), ptr %t1844
  %t1846 = or i64 %t1845, 4
  %t1847 = and i64 %self, -8
  %t1848 = inttoptr i64 %t1847 to ptr
  %t1849 = getelementptr i64, ptr %t1848, i64 2
  %t1850 = load i64, ptr %t1849
  %t1851 = getelementptr i64, ptr %t1844, i64 1
  store i64 %t1850, ptr %t1851
  %t1852 = and i64 %self, -8
  %t1853 = inttoptr i64 %t1852 to ptr
  %t1854 = getelementptr i64, ptr %t1853, i64 3
  %t1855 = load i64, ptr %t1854
  %t1856 = getelementptr i64, ptr %t1844, i64 2
  store i64 %t1855, ptr %t1856
  %t1857 = getelementptr i64, ptr %t1844, i64 3
  store i64 %t1846, ptr %t1857
  %t1858 = and i64 %self, -8
  %t1859 = inttoptr i64 %t1858 to ptr
  %t1860 = getelementptr i64, ptr %t1859, i64 1
  %t1861 = load i64, ptr %t1860
  %t1862 = call i64 @rt_vector_ref(i64 %t1861, i64 %a0)
  %t1863 = call fastcc i64 @"scheme.base:code_373"(i64 %t1846, i64 1, i64 %t1862, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1864 = or i64 %a0, 8
  %t1865 = and i64 %t1864, 7
  %t1866 = icmp eq i64 %t1865, 0
  br i1 %t1866, label %fixfast430, label %fixslow431
fixfast430:
  %t1867 = add i64 %a0, 8
  br label %fixmerge432
fixslow431:
  %t1868 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge432
fixmerge432:
  %t1869 = phi i64 [ %t1867, %fixfast430 ], [ %t1868, %fixslow431 ]
  %t1870 = musttail call fastcc i64 @"scheme.base:code_371"(i64 %self, i64 1, i64 %t1869, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1870
else429:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1871 = icmp eq i64 %argc, 1
  br i1 %t1871, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok434:
  %t1872 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1873 = and i64 %t1872, -8
  %t1874 = inttoptr i64 %t1873 to ptr
  %t1875 = load i64, ptr %t1874
  %t1876 = inttoptr i64 %t1875 to ptr
  %t1877 = call fastcc i64%t1876(i64 %t1872, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1878 = call i64 @rt_vector_length(i64 %t1877)
  %t1879 = or i64 16, %t1878
  %t1880 = and i64 %t1879, 7
  %t1881 = icmp eq i64 %t1880, 0
  br i1 %t1881, label %fixfast435, label %fixslow436
fixfast435:
  %t1882 = ashr i64 16, 3
  %t1883 = mul i64 %t1882, %t1878
  br label %fixmerge437
fixslow436:
  %t1884 = call i64 @rt_mul(i64 16, i64 %t1878)
  br label %fixmerge437
fixmerge437:
  %t1885 = phi i64 [ %t1883, %fixfast435 ], [ %t1884, %fixslow436 ]
  %t1886 = call i64 @rt_make_vector(i64 %t1885, i64 2)
  %t1887 = call ptr @rt_alloc_words(i64 5)
  %t1888 = ptrtoint ptr %t1887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_371" to i64), ptr %t1887
  %t1889 = or i64 %t1888, 4
  %t1890 = getelementptr i64, ptr %t1887, i64 1
  store i64 %t1877, ptr %t1890
  %t1891 = getelementptr i64, ptr %t1887, i64 2
  store i64 %t1885, ptr %t1891
  %t1892 = getelementptr i64, ptr %t1887, i64 3
  store i64 %t1886, ptr %t1892
  %t1893 = getelementptr i64, ptr %t1887, i64 4
  store i64 %t1889, ptr %t1893
  %t1894 = call fastcc i64 @"scheme.base:code_371"(i64 %t1889, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1895 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t1896 = and i64 %t1895, -8
  %t1897 = inttoptr i64 %t1896 to ptr
  %t1898 = load i64, ptr %t1897
  %t1899 = inttoptr i64 %t1898 to ptr
  %t1900 = musttail call fastcc i64 %t1899(i64 %t1895, i64 2, i64 %a0, i64 %t1886, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1900
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1905 = icmp eq i64 %argc, 1
  br i1 %t1905, label %argok439, label %arityerr438
arityerr438:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok439:
  %t1906 = load i64, ptr @"scheme.base:%ht-count"
  %t1907 = and i64 %t1906, -8
  %t1908 = inttoptr i64 %t1907 to ptr
  %t1909 = load i64, ptr %t1908
  %t1910 = inttoptr i64 %t1909 to ptr
  %t1911 = musttail call fastcc i64 %t1910(i64 %t1906, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1911
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1916 = icmp eq i64 %argc, 2
  br i1 %t1916, label %argok441, label %arityerr440
arityerr440:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok441:
  %t1917 = call i64 @rt_null_p(i64 %a0)
  %t1918 = icmp ne i64 %t1917, 1
  br i1 %t1918, label %then442, label %else443
then442:
  ret i64 %a1
else443:
  %t1919 = call i64 @rt_car(i64 %a0)
  %t1920 = call i64 @rt_car(i64 %t1919)
  %t1921 = call i64 @rt_car(i64 %a0)
  %t1922 = call i64 @rt_cdr(i64 %t1921)
  %t1923 = call i64 @rt_cons(i64 %t1920, i64 %t1922)
  %t1924 = call i64 @rt_cdr(i64 %a0)
  %t1925 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t1926 = and i64 %t1925, -8
  %t1927 = inttoptr i64 %t1926 to ptr
  %t1928 = load i64, ptr %t1927
  %t1929 = inttoptr i64 %t1928 to ptr
  %t1930 = call fastcc i64%t1929(i64 %t1925, i64 2, i64 %t1924, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1931 = call i64 @rt_cons(i64 %t1923, i64 %t1930)
  ret i64 %t1931
}

define fastcc i64 @"scheme.base:code_390"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1936 = icmp eq i64 %argc, 2
  br i1 %t1936, label %argok445, label %arityerr444
arityerr444:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok445:
  %t1937 = and i64 %self, -8
  %t1938 = inttoptr i64 %t1937 to ptr
  %t1939 = getelementptr i64, ptr %t1938, i64 1
  %t1940 = load i64, ptr %t1939
  %t1941 = call i64 @rt_vector_length(i64 %t1940)
  %t1942 = or i64 %a0, %t1941
  %t1943 = and i64 %t1942, 7
  %t1944 = icmp eq i64 %t1943, 0
  br i1 %t1944, label %fixfast446, label %fixslow447
fixfast446:
  %t1945 = icmp slt i64 %a0, %t1941
  %t1946 = select i1 %t1945, i64 257, i64 1
  br label %fixmerge448
fixslow447:
  %t1947 = call i64 @rt_lt(i64 %a0, i64 %t1941)
  br label %fixmerge448
fixmerge448:
  %t1948 = phi i64 [ %t1946, %fixfast446 ], [ %t1947, %fixslow447 ]
  %t1949 = icmp ne i64 %t1948, 1
  br i1 %t1949, label %then449, label %else450
then449:
  %t1950 = or i64 %a0, 8
  %t1951 = and i64 %t1950, 7
  %t1952 = icmp eq i64 %t1951, 0
  br i1 %t1952, label %fixfast451, label %fixslow452
fixfast451:
  %t1953 = add i64 %a0, 8
  br label %fixmerge453
fixslow452:
  %t1954 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge453
fixmerge453:
  %t1955 = phi i64 [ %t1953, %fixfast451 ], [ %t1954, %fixslow452 ]
  %t1956 = and i64 %self, -8
  %t1957 = inttoptr i64 %t1956 to ptr
  %t1958 = getelementptr i64, ptr %t1957, i64 1
  %t1959 = load i64, ptr %t1958
  %t1960 = call i64 @rt_vector_ref(i64 %t1959, i64 %a0)
  %t1961 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t1962 = and i64 %t1961, -8
  %t1963 = inttoptr i64 %t1962 to ptr
  %t1964 = load i64, ptr %t1963
  %t1965 = inttoptr i64 %t1964 to ptr
  %t1966 = call fastcc i64%t1965(i64 %t1961, i64 2, i64 %t1960, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1967 = musttail call fastcc i64 @"scheme.base:code_390"(i64 %self, i64 2, i64 %t1955, i64 %t1966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1967
else450:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1968 = icmp eq i64 %argc, 1
  br i1 %t1968, label %argok455, label %arityerr454
arityerr454:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok455:
  %t1969 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1970 = and i64 %t1969, -8
  %t1971 = inttoptr i64 %t1970 to ptr
  %t1972 = load i64, ptr %t1971
  %t1973 = inttoptr i64 %t1972 to ptr
  %t1974 = call fastcc i64%t1973(i64 %t1969, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1975 = call ptr @rt_alloc_words(i64 3)
  %t1976 = ptrtoint ptr %t1975 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_390" to i64), ptr %t1975
  %t1977 = or i64 %t1976, 4
  %t1978 = getelementptr i64, ptr %t1975, i64 1
  store i64 %t1974, ptr %t1978
  %t1979 = getelementptr i64, ptr %t1975, i64 2
  store i64 %t1977, ptr %t1979
  %t1980 = musttail call fastcc i64 @"scheme.base:code_390"(i64 %t1977, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1980
}

define fastcc i64 @"scheme.base:code_395"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1985 = icmp eq i64 %argc, 1
  br i1 %t1985, label %argok457, label %arityerr456
arityerr456:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok457:
  %t1986 = call i64 @rt_car(i64 %a0)
  ret i64 %t1986
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1987 = icmp eq i64 %argc, 1
  br i1 %t1987, label %argok459, label %arityerr458
arityerr458:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok459:
  %t1988 = call ptr @rt_alloc_words(i64 1)
  %t1989 = ptrtoint ptr %t1988 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_395" to i64), ptr %t1988
  %t1990 = or i64 %t1989, 4
  %t1991 = load i64, ptr @"scheme.base:hash-table->alist"
  %t1992 = and i64 %t1991, -8
  %t1993 = inttoptr i64 %t1992 to ptr
  %t1994 = load i64, ptr %t1993
  %t1995 = inttoptr i64 %t1994 to ptr
  %t1996 = call fastcc i64%t1995(i64 %t1991, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1997 = load i64, ptr @"scheme.base:map"
  %t1998 = and i64 %t1997, -8
  %t1999 = inttoptr i64 %t1998 to ptr
  %t2000 = load i64, ptr %t1999
  %t2001 = inttoptr i64 %t2000 to ptr
  %t2002 = musttail call fastcc i64 %t2001(i64 %t1997, i64 2, i64 %t1990, i64 %t1996, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2002
}

define fastcc i64 @"scheme.base:code_400"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2007 = icmp eq i64 %argc, 1
  br i1 %t2007, label %argok461, label %arityerr460
arityerr460:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok461:
  %t2008 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t2008
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2009 = icmp eq i64 %argc, 1
  br i1 %t2009, label %argok463, label %arityerr462
arityerr462:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok463:
  %t2010 = call ptr @rt_alloc_words(i64 1)
  %t2011 = ptrtoint ptr %t2010 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_400" to i64), ptr %t2010
  %t2012 = or i64 %t2011, 4
  %t2013 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2014 = and i64 %t2013, -8
  %t2015 = inttoptr i64 %t2014 to ptr
  %t2016 = load i64, ptr %t2015
  %t2017 = inttoptr i64 %t2016 to ptr
  %t2018 = call fastcc i64%t2017(i64 %t2013, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2019 = load i64, ptr @"scheme.base:map"
  %t2020 = and i64 %t2019, -8
  %t2021 = inttoptr i64 %t2020 to ptr
  %t2022 = load i64, ptr %t2021
  %t2023 = inttoptr i64 %t2022 to ptr
  %t2024 = musttail call fastcc i64 %t2023(i64 %t2019, i64 2, i64 %t2012, i64 %t2018, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2024
}

define fastcc i64 @"scheme.base:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2029 = icmp eq i64 %argc, 1
  br i1 %t2029, label %argok465, label %arityerr464
arityerr464:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok465:
  %t2030 = call i64 @rt_char_to_integer(i64 %a0)
  %t2031 = or i64 %t2030, 256
  %t2032 = and i64 %t2031, 7
  %t2033 = icmp eq i64 %t2032, 0
  br i1 %t2033, label %fixfast466, label %fixslow467
fixfast466:
  %t2034 = icmp eq i64 %t2030, 256
  %t2035 = select i1 %t2034, i64 257, i64 1
  br label %fixmerge468
fixslow467:
  %t2036 = call i64 @rt_num_eq(i64 %t2030, i64 256)
  br label %fixmerge468
fixmerge468:
  %t2037 = phi i64 [ %t2035, %fixfast466 ], [ %t2036, %fixslow467 ]
  %t2038 = icmp ne i64 %t2037, 1
  br i1 %t2038, label %then469, label %else470
then469:
  ret i64 %t2037
else470:
  %t2039 = or i64 %t2030, 72
  %t2040 = and i64 %t2039, 7
  %t2041 = icmp eq i64 %t2040, 0
  br i1 %t2041, label %fixfast471, label %fixslow472
fixfast471:
  %t2042 = icmp eq i64 %t2030, 72
  %t2043 = select i1 %t2042, i64 257, i64 1
  br label %fixmerge473
fixslow472:
  %t2044 = call i64 @rt_num_eq(i64 %t2030, i64 72)
  br label %fixmerge473
fixmerge473:
  %t2045 = phi i64 [ %t2043, %fixfast471 ], [ %t2044, %fixslow472 ]
  %t2046 = icmp ne i64 %t2045, 1
  br i1 %t2046, label %then474, label %else475
then474:
  ret i64 %t2045
else475:
  %t2047 = or i64 %t2030, 80
  %t2048 = and i64 %t2047, 7
  %t2049 = icmp eq i64 %t2048, 0
  br i1 %t2049, label %fixfast476, label %fixslow477
fixfast476:
  %t2050 = icmp eq i64 %t2030, 80
  %t2051 = select i1 %t2050, i64 257, i64 1
  br label %fixmerge478
fixslow477:
  %t2052 = call i64 @rt_num_eq(i64 %t2030, i64 80)
  br label %fixmerge478
fixmerge478:
  %t2053 = phi i64 [ %t2051, %fixfast476 ], [ %t2052, %fixslow477 ]
  %t2054 = icmp ne i64 %t2053, 1
  br i1 %t2054, label %then479, label %else480
then479:
  ret i64 %t2053
else480:
  %t2055 = or i64 %t2030, 104
  %t2056 = and i64 %t2055, 7
  %t2057 = icmp eq i64 %t2056, 0
  br i1 %t2057, label %fixfast481, label %fixslow482
fixfast481:
  %t2058 = icmp eq i64 %t2030, 104
  %t2059 = select i1 %t2058, i64 257, i64 1
  br label %fixmerge483
fixslow482:
  %t2060 = call i64 @rt_num_eq(i64 %t2030, i64 104)
  br label %fixmerge483
fixmerge483:
  %t2061 = phi i64 [ %t2059, %fixfast481 ], [ %t2060, %fixslow482 ]
  ret i64 %t2061
}

define fastcc i64 @"scheme.base:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2066 = icmp eq i64 %argc, 1
  br i1 %t2066, label %argok485, label %arityerr484
arityerr484:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok485:
  %t2067 = call i64 @rt_char_to_integer(i64 %a0)
  %t2068 = or i64 376, %t2067
  %t2069 = and i64 %t2068, 7
  %t2070 = icmp eq i64 %t2069, 0
  br i1 %t2070, label %fixfast486, label %fixslow487
fixfast486:
  %t2071 = icmp slt i64 376, %t2067
  %t2072 = select i1 %t2071, i64 257, i64 1
  br label %fixmerge488
fixslow487:
  %t2073 = call i64 @rt_lt(i64 376, i64 %t2067)
  br label %fixmerge488
fixmerge488:
  %t2074 = phi i64 [ %t2072, %fixfast486 ], [ %t2073, %fixslow487 ]
  %t2075 = icmp ne i64 %t2074, 1
  br i1 %t2075, label %then489, label %else490
then489:
  %t2076 = or i64 %t2067, 464
  %t2077 = and i64 %t2076, 7
  %t2078 = icmp eq i64 %t2077, 0
  br i1 %t2078, label %fixfast491, label %fixslow492
fixfast491:
  %t2079 = icmp slt i64 %t2067, 464
  %t2080 = select i1 %t2079, i64 257, i64 1
  br label %fixmerge493
fixslow492:
  %t2081 = call i64 @rt_lt(i64 %t2067, i64 464)
  br label %fixmerge493
fixmerge493:
  %t2082 = phi i64 [ %t2080, %fixfast491 ], [ %t2081, %fixslow492 ]
  ret i64 %t2082
else490:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2087 = icmp eq i64 %argc, 1
  br i1 %t2087, label %argok495, label %arityerr494
arityerr494:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok495:
  %t2088 = call i64 @rt_char_to_integer(i64 %a0)
  %t2089 = load i64, ptr @"scheme.base:rd-ws?"
  %t2090 = and i64 %t2089, -8
  %t2091 = inttoptr i64 %t2090 to ptr
  %t2092 = load i64, ptr %t2091
  %t2093 = inttoptr i64 %t2092 to ptr
  %t2094 = call fastcc i64%t2093(i64 %t2089, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2095 = icmp ne i64 %t2094, 1
  br i1 %t2095, label %then496, label %else497
then496:
  ret i64 %t2094
else497:
  %t2096 = or i64 %t2088, 320
  %t2097 = and i64 %t2096, 7
  %t2098 = icmp eq i64 %t2097, 0
  br i1 %t2098, label %fixfast498, label %fixslow499
fixfast498:
  %t2099 = icmp eq i64 %t2088, 320
  %t2100 = select i1 %t2099, i64 257, i64 1
  br label %fixmerge500
fixslow499:
  %t2101 = call i64 @rt_num_eq(i64 %t2088, i64 320)
  br label %fixmerge500
fixmerge500:
  %t2102 = phi i64 [ %t2100, %fixfast498 ], [ %t2101, %fixslow499 ]
  %t2103 = icmp ne i64 %t2102, 1
  br i1 %t2103, label %then501, label %else502
then501:
  ret i64 %t2102
else502:
  %t2104 = or i64 %t2088, 328
  %t2105 = and i64 %t2104, 7
  %t2106 = icmp eq i64 %t2105, 0
  br i1 %t2106, label %fixfast503, label %fixslow504
fixfast503:
  %t2107 = icmp eq i64 %t2088, 328
  %t2108 = select i1 %t2107, i64 257, i64 1
  br label %fixmerge505
fixslow504:
  %t2109 = call i64 @rt_num_eq(i64 %t2088, i64 328)
  br label %fixmerge505
fixmerge505:
  %t2110 = phi i64 [ %t2108, %fixfast503 ], [ %t2109, %fixslow504 ]
  %t2111 = icmp ne i64 %t2110, 1
  br i1 %t2111, label %then506, label %else507
then506:
  ret i64 %t2110
else507:
  %t2112 = or i64 %t2088, 728
  %t2113 = and i64 %t2112, 7
  %t2114 = icmp eq i64 %t2113, 0
  br i1 %t2114, label %fixfast508, label %fixslow509
fixfast508:
  %t2115 = icmp eq i64 %t2088, 728
  %t2116 = select i1 %t2115, i64 257, i64 1
  br label %fixmerge510
fixslow509:
  %t2117 = call i64 @rt_num_eq(i64 %t2088, i64 728)
  br label %fixmerge510
fixmerge510:
  %t2118 = phi i64 [ %t2116, %fixfast508 ], [ %t2117, %fixslow509 ]
  %t2119 = icmp ne i64 %t2118, 1
  br i1 %t2119, label %then511, label %else512
then511:
  ret i64 %t2118
else512:
  %t2120 = or i64 %t2088, 744
  %t2121 = and i64 %t2120, 7
  %t2122 = icmp eq i64 %t2121, 0
  br i1 %t2122, label %fixfast513, label %fixslow514
fixfast513:
  %t2123 = icmp eq i64 %t2088, 744
  %t2124 = select i1 %t2123, i64 257, i64 1
  br label %fixmerge515
fixslow514:
  %t2125 = call i64 @rt_num_eq(i64 %t2088, i64 744)
  br label %fixmerge515
fixmerge515:
  %t2126 = phi i64 [ %t2124, %fixfast513 ], [ %t2125, %fixslow514 ]
  %t2127 = icmp ne i64 %t2126, 1
  br i1 %t2127, label %then516, label %else517
then516:
  ret i64 %t2126
else517:
  %t2128 = or i64 %t2088, 272
  %t2129 = and i64 %t2128, 7
  %t2130 = icmp eq i64 %t2129, 0
  br i1 %t2130, label %fixfast518, label %fixslow519
fixfast518:
  %t2131 = icmp eq i64 %t2088, 272
  %t2132 = select i1 %t2131, i64 257, i64 1
  br label %fixmerge520
fixslow519:
  %t2133 = call i64 @rt_num_eq(i64 %t2088, i64 272)
  br label %fixmerge520
fixmerge520:
  %t2134 = phi i64 [ %t2132, %fixfast518 ], [ %t2133, %fixslow519 ]
  %t2135 = icmp ne i64 %t2134, 1
  br i1 %t2135, label %then521, label %else522
then521:
  ret i64 %t2134
else522:
  %t2136 = or i64 %t2088, 472
  %t2137 = and i64 %t2136, 7
  %t2138 = icmp eq i64 %t2137, 0
  br i1 %t2138, label %fixfast523, label %fixslow524
fixfast523:
  %t2139 = icmp eq i64 %t2088, 472
  %t2140 = select i1 %t2139, i64 257, i64 1
  br label %fixmerge525
fixslow524:
  %t2141 = call i64 @rt_num_eq(i64 %t2088, i64 472)
  br label %fixmerge525
fixmerge525:
  %t2142 = phi i64 [ %t2140, %fixfast523 ], [ %t2141, %fixslow524 ]
  ret i64 %t2142
}

define fastcc i64 @"scheme.base:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2147 = icmp eq i64 %argc, 3
  br i1 %t2147, label %argok527, label %arityerr526
arityerr526:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok527:
  %t2148 = or i64 %a2, %a1
  %t2149 = and i64 %t2148, 7
  %t2150 = icmp eq i64 %t2149, 0
  br i1 %t2150, label %fixfast528, label %fixslow529
fixfast528:
  %t2151 = icmp slt i64 %a2, %a1
  %t2152 = select i1 %t2151, i64 257, i64 1
  br label %fixmerge530
fixslow529:
  %t2153 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge530
fixmerge530:
  %t2154 = phi i64 [ %t2152, %fixfast528 ], [ %t2153, %fixslow529 ]
  %t2155 = icmp ne i64 %t2154, 1
  br i1 %t2155, label %then531, label %else532
then531:
  %t2156 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2157 = call i64 @rt_char_to_integer(i64 %t2156)
  %t2158 = or i64 %t2157, 80
  %t2159 = and i64 %t2158, 7
  %t2160 = icmp eq i64 %t2159, 0
  br i1 %t2160, label %fixfast533, label %fixslow534
fixfast533:
  %t2161 = icmp eq i64 %t2157, 80
  %t2162 = select i1 %t2161, i64 257, i64 1
  br label %fixmerge535
fixslow534:
  %t2163 = call i64 @rt_num_eq(i64 %t2157, i64 80)
  br label %fixmerge535
fixmerge535:
  %t2164 = phi i64 [ %t2162, %fixfast533 ], [ %t2163, %fixslow534 ]
  %t2165 = icmp ne i64 %t2164, 1
  br i1 %t2165, label %then536, label %else537
then536:
  %t2166 = or i64 %a2, 8
  %t2167 = and i64 %t2166, 7
  %t2168 = icmp eq i64 %t2167, 0
  br i1 %t2168, label %fixfast538, label %fixslow539
fixfast538:
  %t2169 = add i64 %a2, 8
  br label %fixmerge540
fixslow539:
  %t2170 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge540
fixmerge540:
  %t2171 = phi i64 [ %t2169, %fixfast538 ], [ %t2170, %fixslow539 ]
  ret i64 %t2171
else537:
  %t2172 = or i64 %a2, 8
  %t2173 = and i64 %t2172, 7
  %t2174 = icmp eq i64 %t2173, 0
  br i1 %t2174, label %fixfast541, label %fixslow542
fixfast541:
  %t2175 = add i64 %a2, 8
  br label %fixmerge543
fixslow542:
  %t2176 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge543
fixmerge543:
  %t2177 = phi i64 [ %t2175, %fixfast541 ], [ %t2176, %fixslow542 ]
  %t2178 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2179 = and i64 %t2178, -8
  %t2180 = inttoptr i64 %t2179 to ptr
  %t2181 = load i64, ptr %t2180
  %t2182 = inttoptr i64 %t2181 to ptr
  %t2183 = musttail call fastcc i64 %t2182(i64 %t2178, i64 3, i64 %a0, i64 %a1, i64 %t2177, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2183
else532:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2188 = icmp eq i64 %argc, 3
  br i1 %t2188, label %argok545, label %arityerr544
arityerr544:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok545:
  %t2189 = or i64 %a2, %a1
  %t2190 = and i64 %t2189, 7
  %t2191 = icmp eq i64 %t2190, 0
  br i1 %t2191, label %fixfast546, label %fixslow547
fixfast546:
  %t2192 = icmp slt i64 %a2, %a1
  %t2193 = select i1 %t2192, i64 257, i64 1
  br label %fixmerge548
fixslow547:
  %t2194 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge548
fixmerge548:
  %t2195 = phi i64 [ %t2193, %fixfast546 ], [ %t2194, %fixslow547 ]
  %t2196 = icmp ne i64 %t2195, 1
  br i1 %t2196, label %then549, label %else550
then549:
  %t2197 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2198 = load i64, ptr @"scheme.base:rd-ws?"
  %t2199 = and i64 %t2198, -8
  %t2200 = inttoptr i64 %t2199 to ptr
  %t2201 = load i64, ptr %t2200
  %t2202 = inttoptr i64 %t2201 to ptr
  %t2203 = call fastcc i64%t2202(i64 %t2198, i64 1, i64 %t2197, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2204 = icmp ne i64 %t2203, 1
  br i1 %t2204, label %then551, label %else552
then551:
  %t2205 = or i64 %a2, 8
  %t2206 = and i64 %t2205, 7
  %t2207 = icmp eq i64 %t2206, 0
  br i1 %t2207, label %fixfast553, label %fixslow554
fixfast553:
  %t2208 = add i64 %a2, 8
  br label %fixmerge555
fixslow554:
  %t2209 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge555
fixmerge555:
  %t2210 = phi i64 [ %t2208, %fixfast553 ], [ %t2209, %fixslow554 ]
  %t2211 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2212 = and i64 %t2211, -8
  %t2213 = inttoptr i64 %t2212 to ptr
  %t2214 = load i64, ptr %t2213
  %t2215 = inttoptr i64 %t2214 to ptr
  %t2216 = musttail call fastcc i64 %t2215(i64 %t2211, i64 3, i64 %a0, i64 %a1, i64 %t2210, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2216
else552:
  %t2217 = call i64 @rt_char_to_integer(i64 %t2197)
  %t2218 = or i64 %t2217, 472
  %t2219 = and i64 %t2218, 7
  %t2220 = icmp eq i64 %t2219, 0
  br i1 %t2220, label %fixfast556, label %fixslow557
fixfast556:
  %t2221 = icmp eq i64 %t2217, 472
  %t2222 = select i1 %t2221, i64 257, i64 1
  br label %fixmerge558
fixslow557:
  %t2223 = call i64 @rt_num_eq(i64 %t2217, i64 472)
  br label %fixmerge558
fixmerge558:
  %t2224 = phi i64 [ %t2222, %fixfast556 ], [ %t2223, %fixslow557 ]
  %t2225 = icmp ne i64 %t2224, 1
  br i1 %t2225, label %then559, label %else560
then559:
  %t2226 = or i64 %a2, 8
  %t2227 = and i64 %t2226, 7
  %t2228 = icmp eq i64 %t2227, 0
  br i1 %t2228, label %fixfast561, label %fixslow562
fixfast561:
  %t2229 = add i64 %a2, 8
  br label %fixmerge563
fixslow562:
  %t2230 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge563
fixmerge563:
  %t2231 = phi i64 [ %t2229, %fixfast561 ], [ %t2230, %fixslow562 ]
  %t2232 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2233 = and i64 %t2232, -8
  %t2234 = inttoptr i64 %t2233 to ptr
  %t2235 = load i64, ptr %t2234
  %t2236 = inttoptr i64 %t2235 to ptr
  %t2237 = call fastcc i64%t2236(i64 %t2232, i64 3, i64 %a0, i64 %a1, i64 %t2231, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2238 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2239 = and i64 %t2238, -8
  %t2240 = inttoptr i64 %t2239 to ptr
  %t2241 = load i64, ptr %t2240
  %t2242 = inttoptr i64 %t2241 to ptr
  %t2243 = musttail call fastcc i64 %t2242(i64 %t2238, i64 3, i64 %a0, i64 %a1, i64 %t2237, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2243
else560:
  ret i64 %a2
else550:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2248 = icmp eq i64 %argc, 3
  br i1 %t2248, label %argok565, label %arityerr564
arityerr564:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok565:
  %t2249 = or i64 %a2, %a1
  %t2250 = and i64 %t2249, 7
  %t2251 = icmp eq i64 %t2250, 0
  br i1 %t2251, label %fixfast566, label %fixslow567
fixfast566:
  %t2252 = icmp slt i64 %a2, %a1
  %t2253 = select i1 %t2252, i64 257, i64 1
  br label %fixmerge568
fixslow567:
  %t2254 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge568
fixmerge568:
  %t2255 = phi i64 [ %t2253, %fixfast566 ], [ %t2254, %fixslow567 ]
  %t2256 = icmp ne i64 %t2255, 1
  br i1 %t2256, label %then569, label %else570
then569:
  %t2257 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2258 = load i64, ptr @"scheme.base:rd-delim?"
  %t2259 = and i64 %t2258, -8
  %t2260 = inttoptr i64 %t2259 to ptr
  %t2261 = load i64, ptr %t2260
  %t2262 = inttoptr i64 %t2261 to ptr
  %t2263 = call fastcc i64%t2262(i64 %t2258, i64 1, i64 %t2257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2264 = icmp ne i64 %t2263, 1
  br i1 %t2264, label %then571, label %else572
then571:
  ret i64 %a2
else572:
  %t2265 = or i64 %a2, 8
  %t2266 = and i64 %t2265, 7
  %t2267 = icmp eq i64 %t2266, 0
  br i1 %t2267, label %fixfast573, label %fixslow574
fixfast573:
  %t2268 = add i64 %a2, 8
  br label %fixmerge575
fixslow574:
  %t2269 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge575
fixmerge575:
  %t2270 = phi i64 [ %t2268, %fixfast573 ], [ %t2269, %fixslow574 ]
  %t2271 = load i64, ptr @"scheme.base:rd-token-end"
  %t2272 = and i64 %t2271, -8
  %t2273 = inttoptr i64 %t2272 to ptr
  %t2274 = load i64, ptr %t2273
  %t2275 = inttoptr i64 %t2274 to ptr
  %t2276 = musttail call fastcc i64 %t2275(i64 %t2271, i64 3, i64 %a0, i64 %a1, i64 %t2270, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2276
else570:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2281 = icmp eq i64 %argc, 3
  br i1 %t2281, label %argok577, label %arityerr576
arityerr576:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok577:
  %t2282 = or i64 %a1, %a2
  %t2283 = and i64 %t2282, 7
  %t2284 = icmp eq i64 %t2283, 0
  br i1 %t2284, label %fixfast578, label %fixslow579
fixfast578:
  %t2285 = icmp slt i64 %a1, %a2
  %t2286 = select i1 %t2285, i64 257, i64 1
  br label %fixmerge580
fixslow579:
  %t2287 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge580
fixmerge580:
  %t2288 = phi i64 [ %t2286, %fixfast578 ], [ %t2287, %fixslow579 ]
  %t2289 = icmp ne i64 %t2288, 1
  br i1 %t2289, label %then581, label %else582
then581:
  %t2290 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2291 = load i64, ptr @"scheme.base:rd-digit?"
  %t2292 = and i64 %t2291, -8
  %t2293 = inttoptr i64 %t2292 to ptr
  %t2294 = load i64, ptr %t2293
  %t2295 = inttoptr i64 %t2294 to ptr
  %t2296 = call fastcc i64%t2295(i64 %t2291, i64 1, i64 %t2290, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2297 = icmp ne i64 %t2296, 1
  br i1 %t2297, label %then583, label %else584
then583:
  %t2298 = or i64 %a1, 8
  %t2299 = and i64 %t2298, 7
  %t2300 = icmp eq i64 %t2299, 0
  br i1 %t2300, label %fixfast585, label %fixslow586
fixfast585:
  %t2301 = add i64 %a1, 8
  br label %fixmerge587
fixslow586:
  %t2302 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge587
fixmerge587:
  %t2303 = phi i64 [ %t2301, %fixfast585 ], [ %t2302, %fixslow586 ]
  %t2304 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2305 = and i64 %t2304, -8
  %t2306 = inttoptr i64 %t2305 to ptr
  %t2307 = load i64, ptr %t2306
  %t2308 = inttoptr i64 %t2307 to ptr
  %t2309 = musttail call fastcc i64 %t2308(i64 %t2304, i64 3, i64 %a0, i64 %t2303, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2309
else584:
  ret i64 1
else582:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2314 = icmp eq i64 %argc, 1
  br i1 %t2314, label %argok589, label %arityerr588
arityerr588:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok589:
  %t2315 = call i64 @rt_string_length(i64 %a0)
  %t2316 = or i64 0, %t2315
  %t2317 = and i64 %t2316, 7
  %t2318 = icmp eq i64 %t2317, 0
  br i1 %t2318, label %fixfast590, label %fixslow591
fixfast590:
  %t2319 = icmp slt i64 0, %t2315
  %t2320 = select i1 %t2319, i64 257, i64 1
  br label %fixmerge592
fixslow591:
  %t2321 = call i64 @rt_lt(i64 0, i64 %t2315)
  br label %fixmerge592
fixmerge592:
  %t2322 = phi i64 [ %t2320, %fixfast590 ], [ %t2321, %fixslow591 ]
  %t2323 = icmp ne i64 %t2322, 1
  br i1 %t2323, label %then593, label %else594
then593:
  %t2324 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2325 = call i64 @rt_char_to_integer(i64 %t2324)
  %t2326 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2327 = load i64, ptr @"scheme.base:rd-digit?"
  %t2328 = and i64 %t2327, -8
  %t2329 = inttoptr i64 %t2328 to ptr
  %t2330 = load i64, ptr %t2329
  %t2331 = inttoptr i64 %t2330 to ptr
  %t2332 = call fastcc i64%t2331(i64 %t2327, i64 1, i64 %t2326, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2333 = icmp ne i64 %t2332, 1
  br i1 %t2333, label %then595, label %else596
then595:
  %t2334 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2335 = and i64 %t2334, -8
  %t2336 = inttoptr i64 %t2335 to ptr
  %t2337 = load i64, ptr %t2336
  %t2338 = inttoptr i64 %t2337 to ptr
  %t2339 = musttail call fastcc i64 %t2338(i64 %t2334, i64 3, i64 %a0, i64 0, i64 %t2315, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2339
else596:
  %t2340 = or i64 %t2325, 360
  %t2341 = and i64 %t2340, 7
  %t2342 = icmp eq i64 %t2341, 0
  br i1 %t2342, label %fixfast597, label %fixslow598
fixfast597:
  %t2343 = icmp eq i64 %t2325, 360
  %t2344 = select i1 %t2343, i64 257, i64 1
  br label %fixmerge599
fixslow598:
  %t2345 = call i64 @rt_num_eq(i64 %t2325, i64 360)
  br label %fixmerge599
fixmerge599:
  %t2346 = phi i64 [ %t2344, %fixfast597 ], [ %t2345, %fixslow598 ]
  %t2347 = icmp ne i64 %t2346, 1
  br i1 %t2347, label %then600, label %else601
then600:
  br label %merge602
else601:
  %t2348 = or i64 %t2325, 344
  %t2349 = and i64 %t2348, 7
  %t2350 = icmp eq i64 %t2349, 0
  br i1 %t2350, label %fixfast603, label %fixslow604
fixfast603:
  %t2351 = icmp eq i64 %t2325, 344
  %t2352 = select i1 %t2351, i64 257, i64 1
  br label %fixmerge605
fixslow604:
  %t2353 = call i64 @rt_num_eq(i64 %t2325, i64 344)
  br label %fixmerge605
fixmerge605:
  %t2354 = phi i64 [ %t2352, %fixfast603 ], [ %t2353, %fixslow604 ]
  br label %merge602
merge602:
  %t2355 = phi i64 [ %t2346, %then600 ], [ %t2354, %fixmerge605 ]
  %t2356 = icmp ne i64 %t2355, 1
  br i1 %t2356, label %then606, label %else607
then606:
  %t2357 = or i64 8, %t2315
  %t2358 = and i64 %t2357, 7
  %t2359 = icmp eq i64 %t2358, 0
  br i1 %t2359, label %fixfast608, label %fixslow609
fixfast608:
  %t2360 = icmp slt i64 8, %t2315
  %t2361 = select i1 %t2360, i64 257, i64 1
  br label %fixmerge610
fixslow609:
  %t2362 = call i64 @rt_lt(i64 8, i64 %t2315)
  br label %fixmerge610
fixmerge610:
  %t2363 = phi i64 [ %t2361, %fixfast608 ], [ %t2362, %fixslow609 ]
  %t2364 = icmp ne i64 %t2363, 1
  br i1 %t2364, label %then611, label %else612
then611:
  %t2365 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2366 = and i64 %t2365, -8
  %t2367 = inttoptr i64 %t2366 to ptr
  %t2368 = load i64, ptr %t2367
  %t2369 = inttoptr i64 %t2368 to ptr
  %t2370 = musttail call fastcc i64 %t2369(i64 %t2365, i64 3, i64 %a0, i64 8, i64 %t2315, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2370
else612:
  ret i64 1
else607:
  ret i64 1
else594:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2375 = icmp eq i64 %argc, 4
  br i1 %t2375, label %argok614, label %arityerr613
arityerr613:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok614:
  %t2376 = or i64 %a1, %a2
  %t2377 = and i64 %t2376, 7
  %t2378 = icmp eq i64 %t2377, 0
  br i1 %t2378, label %fixfast615, label %fixslow616
fixfast615:
  %t2379 = icmp slt i64 %a1, %a2
  %t2380 = select i1 %t2379, i64 257, i64 1
  br label %fixmerge617
fixslow616:
  %t2381 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge617
fixmerge617:
  %t2382 = phi i64 [ %t2380, %fixfast615 ], [ %t2381, %fixslow616 ]
  %t2383 = icmp ne i64 %t2382, 1
  br i1 %t2383, label %then618, label %else619
then618:
  %t2384 = or i64 %a1, 8
  %t2385 = and i64 %t2384, 7
  %t2386 = icmp eq i64 %t2385, 0
  br i1 %t2386, label %fixfast620, label %fixslow621
fixfast620:
  %t2387 = add i64 %a1, 8
  br label %fixmerge622
fixslow621:
  %t2388 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge622
fixmerge622:
  %t2389 = phi i64 [ %t2387, %fixfast620 ], [ %t2388, %fixslow621 ]
  %t2390 = or i64 %a3, 80
  %t2391 = and i64 %t2390, 7
  %t2392 = icmp eq i64 %t2391, 0
  br i1 %t2392, label %fixfast623, label %fixslow624
fixfast623:
  %t2393 = ashr i64 %a3, 3
  %t2394 = mul i64 %t2393, 80
  br label %fixmerge625
fixslow624:
  %t2395 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge625
fixmerge625:
  %t2396 = phi i64 [ %t2394, %fixfast623 ], [ %t2395, %fixslow624 ]
  %t2397 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2398 = call i64 @rt_char_to_integer(i64 %t2397)
  %t2399 = or i64 %t2398, 384
  %t2400 = and i64 %t2399, 7
  %t2401 = icmp eq i64 %t2400, 0
  br i1 %t2401, label %fixfast626, label %fixslow627
fixfast626:
  %t2402 = sub i64 %t2398, 384
  br label %fixmerge628
fixslow627:
  %t2403 = call i64 @rt_sub(i64 %t2398, i64 384)
  br label %fixmerge628
fixmerge628:
  %t2404 = phi i64 [ %t2402, %fixfast626 ], [ %t2403, %fixslow627 ]
  %t2405 = or i64 %t2396, %t2404
  %t2406 = and i64 %t2405, 7
  %t2407 = icmp eq i64 %t2406, 0
  br i1 %t2407, label %fixfast629, label %fixslow630
fixfast629:
  %t2408 = add i64 %t2396, %t2404
  br label %fixmerge631
fixslow630:
  %t2409 = call i64 @rt_add(i64 %t2396, i64 %t2404)
  br label %fixmerge631
fixmerge631:
  %t2410 = phi i64 [ %t2408, %fixfast629 ], [ %t2409, %fixslow630 ]
  %t2411 = load i64, ptr @"scheme.base:rd-digits"
  %t2412 = and i64 %t2411, -8
  %t2413 = inttoptr i64 %t2412 to ptr
  %t2414 = load i64, ptr %t2413
  %t2415 = inttoptr i64 %t2414 to ptr
  %t2416 = musttail call fastcc i64 %t2415(i64 %t2411, i64 4, i64 %a0, i64 %t2389, i64 %a2, i64 %t2410, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2416
else619:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2421 = icmp eq i64 %argc, 1
  br i1 %t2421, label %argok633, label %arityerr632
arityerr632:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok633:
  %t2422 = call i64 @rt_string_length(i64 %a0)
  %t2423 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2424 = call i64 @rt_char_to_integer(i64 %t2423)
  %t2425 = or i64 %t2424, 360
  %t2426 = and i64 %t2425, 7
  %t2427 = icmp eq i64 %t2426, 0
  br i1 %t2427, label %fixfast634, label %fixslow635
fixfast634:
  %t2428 = icmp eq i64 %t2424, 360
  %t2429 = select i1 %t2428, i64 257, i64 1
  br label %fixmerge636
fixslow635:
  %t2430 = call i64 @rt_num_eq(i64 %t2424, i64 360)
  br label %fixmerge636
fixmerge636:
  %t2431 = phi i64 [ %t2429, %fixfast634 ], [ %t2430, %fixslow635 ]
  %t2432 = icmp ne i64 %t2431, 1
  br i1 %t2432, label %then637, label %else638
then637:
  %t2433 = load i64, ptr @"scheme.base:rd-digits"
  %t2434 = and i64 %t2433, -8
  %t2435 = inttoptr i64 %t2434 to ptr
  %t2436 = load i64, ptr %t2435
  %t2437 = inttoptr i64 %t2436 to ptr
  %t2438 = call fastcc i64%t2437(i64 %t2433, i64 4, i64 %a0, i64 8, i64 %t2422, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2439 = or i64 0, %t2438
  %t2440 = and i64 %t2439, 7
  %t2441 = icmp eq i64 %t2440, 0
  br i1 %t2441, label %fixfast639, label %fixslow640
fixfast639:
  %t2442 = sub i64 0, %t2438
  br label %fixmerge641
fixslow640:
  %t2443 = call i64 @rt_sub(i64 0, i64 %t2438)
  br label %fixmerge641
fixmerge641:
  %t2444 = phi i64 [ %t2442, %fixfast639 ], [ %t2443, %fixslow640 ]
  ret i64 %t2444
else638:
  %t2445 = or i64 %t2424, 344
  %t2446 = and i64 %t2445, 7
  %t2447 = icmp eq i64 %t2446, 0
  br i1 %t2447, label %fixfast642, label %fixslow643
fixfast642:
  %t2448 = icmp eq i64 %t2424, 344
  %t2449 = select i1 %t2448, i64 257, i64 1
  br label %fixmerge644
fixslow643:
  %t2450 = call i64 @rt_num_eq(i64 %t2424, i64 344)
  br label %fixmerge644
fixmerge644:
  %t2451 = phi i64 [ %t2449, %fixfast642 ], [ %t2450, %fixslow643 ]
  %t2452 = icmp ne i64 %t2451, 1
  br i1 %t2452, label %then645, label %else646
then645:
  %t2453 = load i64, ptr @"scheme.base:rd-digits"
  %t2454 = and i64 %t2453, -8
  %t2455 = inttoptr i64 %t2454 to ptr
  %t2456 = load i64, ptr %t2455
  %t2457 = inttoptr i64 %t2456 to ptr
  %t2458 = musttail call fastcc i64 %t2457(i64 %t2453, i64 4, i64 %a0, i64 8, i64 %t2422, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2458
else646:
  %t2459 = load i64, ptr @"scheme.base:rd-digits"
  %t2460 = and i64 %t2459, -8
  %t2461 = inttoptr i64 %t2460 to ptr
  %t2462 = load i64, ptr %t2461
  %t2463 = inttoptr i64 %t2462 to ptr
  %t2464 = musttail call fastcc i64 %t2463(i64 %t2459, i64 4, i64 %a0, i64 0, i64 %t2422, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2464
}

define fastcc i64 @"scheme.base:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2469 = icmp eq i64 %argc, 1
  br i1 %t2469, label %argok648, label %arityerr647
arityerr647:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok648:
  %t2470 = call i64 @rt_char_to_integer(i64 %a0)
  %t2471 = or i64 %t2470, 368
  %t2472 = and i64 %t2471, 7
  %t2473 = icmp eq i64 %t2472, 0
  br i1 %t2473, label %fixfast649, label %fixslow650
fixfast649:
  %t2474 = icmp eq i64 %t2470, 368
  %t2475 = select i1 %t2474, i64 257, i64 1
  br label %fixmerge651
fixslow650:
  %t2476 = call i64 @rt_num_eq(i64 %t2470, i64 368)
  br label %fixmerge651
fixmerge651:
  %t2477 = phi i64 [ %t2475, %fixfast649 ], [ %t2476, %fixslow650 ]
  ret i64 %t2477
}

define fastcc i64 @"scheme.base:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2482 = icmp eq i64 %argc, 1
  br i1 %t2482, label %argok653, label %arityerr652
arityerr652:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok653:
  %t2483 = call i64 @rt_char_to_integer(i64 %a0)
  %t2484 = or i64 %t2483, 808
  %t2485 = and i64 %t2484, 7
  %t2486 = icmp eq i64 %t2485, 0
  br i1 %t2486, label %fixfast654, label %fixslow655
fixfast654:
  %t2487 = icmp eq i64 %t2483, 808
  %t2488 = select i1 %t2487, i64 257, i64 1
  br label %fixmerge656
fixslow655:
  %t2489 = call i64 @rt_num_eq(i64 %t2483, i64 808)
  br label %fixmerge656
fixmerge656:
  %t2490 = phi i64 [ %t2488, %fixfast654 ], [ %t2489, %fixslow655 ]
  %t2491 = icmp ne i64 %t2490, 1
  br i1 %t2491, label %then657, label %else658
then657:
  ret i64 %t2490
else658:
  %t2492 = or i64 %t2483, 552
  %t2493 = and i64 %t2492, 7
  %t2494 = icmp eq i64 %t2493, 0
  br i1 %t2494, label %fixfast659, label %fixslow660
fixfast659:
  %t2495 = icmp eq i64 %t2483, 552
  %t2496 = select i1 %t2495, i64 257, i64 1
  br label %fixmerge661
fixslow660:
  %t2497 = call i64 @rt_num_eq(i64 %t2483, i64 552)
  br label %fixmerge661
fixmerge661:
  %t2498 = phi i64 [ %t2496, %fixfast659 ], [ %t2497, %fixslow660 ]
  ret i64 %t2498
}

define fastcc i64 @"scheme.base:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2503 = icmp eq i64 %argc, 1
  br i1 %t2503, label %argok663, label %arityerr662
arityerr662:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok663:
  %t2504 = call i64 @rt_char_to_integer(i64 %a0)
  %t2505 = or i64 %t2504, 344
  %t2506 = and i64 %t2505, 7
  %t2507 = icmp eq i64 %t2506, 0
  br i1 %t2507, label %fixfast664, label %fixslow665
fixfast664:
  %t2508 = icmp eq i64 %t2504, 344
  %t2509 = select i1 %t2508, i64 257, i64 1
  br label %fixmerge666
fixslow665:
  %t2510 = call i64 @rt_num_eq(i64 %t2504, i64 344)
  br label %fixmerge666
fixmerge666:
  %t2511 = phi i64 [ %t2509, %fixfast664 ], [ %t2510, %fixslow665 ]
  %t2512 = icmp ne i64 %t2511, 1
  br i1 %t2512, label %then667, label %else668
then667:
  ret i64 %t2511
else668:
  %t2513 = or i64 %t2504, 360
  %t2514 = and i64 %t2513, 7
  %t2515 = icmp eq i64 %t2514, 0
  br i1 %t2515, label %fixfast669, label %fixslow670
fixfast669:
  %t2516 = icmp eq i64 %t2504, 360
  %t2517 = select i1 %t2516, i64 257, i64 1
  br label %fixmerge671
fixslow670:
  %t2518 = call i64 @rt_num_eq(i64 %t2504, i64 360)
  br label %fixmerge671
fixmerge671:
  %t2519 = phi i64 [ %t2517, %fixfast669 ], [ %t2518, %fixslow670 ]
  ret i64 %t2519
}

define fastcc i64 @"scheme.base:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2524 = icmp eq i64 %argc, 3
  br i1 %t2524, label %argok673, label %arityerr672
arityerr672:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok673:
  %t2525 = or i64 %a1, %a2
  %t2526 = and i64 %t2525, 7
  %t2527 = icmp eq i64 %t2526, 0
  br i1 %t2527, label %fixfast674, label %fixslow675
fixfast674:
  %t2528 = icmp slt i64 %a1, %a2
  %t2529 = select i1 %t2528, i64 257, i64 1
  br label %fixmerge676
fixslow675:
  %t2530 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge676
fixmerge676:
  %t2531 = phi i64 [ %t2529, %fixfast674 ], [ %t2530, %fixslow675 ]
  %t2532 = icmp ne i64 %t2531, 1
  br i1 %t2532, label %then677, label %else678
then677:
  %t2533 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2534 = load i64, ptr @"scheme.base:rd-digit?"
  %t2535 = and i64 %t2534, -8
  %t2536 = inttoptr i64 %t2535 to ptr
  %t2537 = load i64, ptr %t2536
  %t2538 = inttoptr i64 %t2537 to ptr
  %t2539 = call fastcc i64%t2538(i64 %t2534, i64 1, i64 %t2533, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge679
else678:
  br label %merge679
merge679:
  %t2540 = phi i64 [ %t2539, %then677 ], [ 1, %else678 ]
  %t2541 = icmp ne i64 %t2540, 1
  br i1 %t2541, label %then680, label %else681
then680:
  %t2542 = or i64 %a1, 8
  %t2543 = and i64 %t2542, 7
  %t2544 = icmp eq i64 %t2543, 0
  br i1 %t2544, label %fixfast682, label %fixslow683
fixfast682:
  %t2545 = add i64 %a1, 8
  br label %fixmerge684
fixslow683:
  %t2546 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge684
fixmerge684:
  %t2547 = phi i64 [ %t2545, %fixfast682 ], [ %t2546, %fixslow683 ]
  %t2548 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2549 = and i64 %t2548, -8
  %t2550 = inttoptr i64 %t2549 to ptr
  %t2551 = load i64, ptr %t2550
  %t2552 = inttoptr i64 %t2551 to ptr
  %t2553 = musttail call fastcc i64 %t2552(i64 %t2548, i64 3, i64 %a0, i64 %t2547, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2553
else681:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2558 = icmp eq i64 %argc, 1
  br i1 %t2558, label %argok686, label %arityerr685
arityerr685:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok686:
  %t2559 = call i64 @rt_string_length(i64 %a0)
  %t2560 = or i64 0, %t2559
  %t2561 = and i64 %t2560, 7
  %t2562 = icmp eq i64 %t2561, 0
  br i1 %t2562, label %fixfast687, label %fixslow688
fixfast687:
  %t2563 = icmp slt i64 0, %t2559
  %t2564 = select i1 %t2563, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t2565 = call i64 @rt_lt(i64 0, i64 %t2559)
  br label %fixmerge689
fixmerge689:
  %t2566 = phi i64 [ %t2564, %fixfast687 ], [ %t2565, %fixslow688 ]
  %t2567 = icmp ne i64 %t2566, 1
  br i1 %t2567, label %then690, label %else691
then690:
  %t2568 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2569 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t2570 = and i64 %t2569, -8
  %t2571 = inttoptr i64 %t2570 to ptr
  %t2572 = load i64, ptr %t2571
  %t2573 = inttoptr i64 %t2572 to ptr
  %t2574 = call fastcc i64%t2573(i64 %t2569, i64 1, i64 %t2568, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2575 = icmp ne i64 %t2574, 1
  br i1 %t2575, label %then692, label %else693
then692:
  br label %merge694
else693:
  br label %merge694
merge694:
  %t2576 = phi i64 [ 8, %then692 ], [ 0, %else693 ]
  %t2577 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2578 = and i64 %t2577, -8
  %t2579 = inttoptr i64 %t2578 to ptr
  %t2580 = load i64, ptr %t2579
  %t2581 = inttoptr i64 %t2580 to ptr
  %t2582 = call fastcc i64%t2581(i64 %t2577, i64 3, i64 %a0, i64 %t2576, i64 %t2559, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2583 = or i64 %t2582, %t2559
  %t2584 = and i64 %t2583, 7
  %t2585 = icmp eq i64 %t2584, 0
  br i1 %t2585, label %fixfast695, label %fixslow696
fixfast695:
  %t2586 = icmp slt i64 %t2582, %t2559
  %t2587 = select i1 %t2586, i64 257, i64 1
  br label %fixmerge697
fixslow696:
  %t2588 = call i64 @rt_lt(i64 %t2582, i64 %t2559)
  br label %fixmerge697
fixmerge697:
  %t2589 = phi i64 [ %t2587, %fixfast695 ], [ %t2588, %fixslow696 ]
  %t2590 = icmp ne i64 %t2589, 1
  br i1 %t2590, label %then698, label %else699
then698:
  %t2591 = call i64 @rt_string_ref(i64 %a0, i64 %t2582)
  %t2592 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t2593 = and i64 %t2592, -8
  %t2594 = inttoptr i64 %t2593 to ptr
  %t2595 = load i64, ptr %t2594
  %t2596 = inttoptr i64 %t2595 to ptr
  %t2597 = call fastcc i64%t2596(i64 %t2592, i64 1, i64 %t2591, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge700
else699:
  br label %merge700
merge700:
  %t2598 = phi i64 [ %t2597, %then698 ], [ 1, %else699 ]
  %t2599 = icmp ne i64 %t2598, 1
  br i1 %t2599, label %then701, label %else702
then701:
  %t2600 = or i64 %t2582, 8
  %t2601 = and i64 %t2600, 7
  %t2602 = icmp eq i64 %t2601, 0
  br i1 %t2602, label %fixfast704, label %fixslow705
fixfast704:
  %t2603 = add i64 %t2582, 8
  br label %fixmerge706
fixslow705:
  %t2604 = call i64 @rt_add(i64 %t2582, i64 8)
  br label %fixmerge706
fixmerge706:
  %t2605 = phi i64 [ %t2603, %fixfast704 ], [ %t2604, %fixslow705 ]
  br label %merge703
else702:
  br label %merge703
merge703:
  %t2606 = phi i64 [ %t2605, %fixmerge706 ], [ %t2582, %else702 ]
  %t2607 = or i64 %t2582, %t2606
  %t2608 = and i64 %t2607, 7
  %t2609 = icmp eq i64 %t2608, 0
  br i1 %t2609, label %fixfast707, label %fixslow708
fixfast707:
  %t2610 = icmp slt i64 %t2582, %t2606
  %t2611 = select i1 %t2610, i64 257, i64 1
  br label %fixmerge709
fixslow708:
  %t2612 = call i64 @rt_lt(i64 %t2582, i64 %t2606)
  br label %fixmerge709
fixmerge709:
  %t2613 = phi i64 [ %t2611, %fixfast707 ], [ %t2612, %fixslow708 ]
  %t2614 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2615 = and i64 %t2614, -8
  %t2616 = inttoptr i64 %t2615 to ptr
  %t2617 = load i64, ptr %t2616
  %t2618 = inttoptr i64 %t2617 to ptr
  %t2619 = call fastcc i64%t2618(i64 %t2614, i64 3, i64 %a0, i64 %t2606, i64 %t2559, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2620 = or i64 %t2576, %t2582
  %t2621 = and i64 %t2620, 7
  %t2622 = icmp eq i64 %t2621, 0
  br i1 %t2622, label %fixfast710, label %fixslow711
fixfast710:
  %t2623 = icmp slt i64 %t2576, %t2582
  %t2624 = select i1 %t2623, i64 257, i64 1
  br label %fixmerge712
fixslow711:
  %t2625 = call i64 @rt_lt(i64 %t2576, i64 %t2582)
  br label %fixmerge712
fixmerge712:
  %t2626 = phi i64 [ %t2624, %fixfast710 ], [ %t2625, %fixslow711 ]
  %t2627 = icmp ne i64 %t2626, 1
  br i1 %t2627, label %then713, label %else714
then713:
  br label %merge715
else714:
  %t2628 = or i64 %t2606, %t2619
  %t2629 = and i64 %t2628, 7
  %t2630 = icmp eq i64 %t2629, 0
  br i1 %t2630, label %fixfast716, label %fixslow717
fixfast716:
  %t2631 = icmp slt i64 %t2606, %t2619
  %t2632 = select i1 %t2631, i64 257, i64 1
  br label %fixmerge718
fixslow717:
  %t2633 = call i64 @rt_lt(i64 %t2606, i64 %t2619)
  br label %fixmerge718
fixmerge718:
  %t2634 = phi i64 [ %t2632, %fixfast716 ], [ %t2633, %fixslow717 ]
  br label %merge715
merge715:
  %t2635 = phi i64 [ %t2626, %then713 ], [ %t2634, %fixmerge718 ]
  %t2636 = icmp ne i64 %t2635, 1
  br i1 %t2636, label %then719, label %else720
then719:
  %t2637 = or i64 %t2619, %t2559
  %t2638 = and i64 %t2637, 7
  %t2639 = icmp eq i64 %t2638, 0
  br i1 %t2639, label %fixfast721, label %fixslow722
fixfast721:
  %t2640 = icmp slt i64 %t2619, %t2559
  %t2641 = select i1 %t2640, i64 257, i64 1
  br label %fixmerge723
fixslow722:
  %t2642 = call i64 @rt_lt(i64 %t2619, i64 %t2559)
  br label %fixmerge723
fixmerge723:
  %t2643 = phi i64 [ %t2641, %fixfast721 ], [ %t2642, %fixslow722 ]
  %t2644 = icmp ne i64 %t2643, 1
  br i1 %t2644, label %then724, label %else725
then724:
  %t2645 = call i64 @rt_string_ref(i64 %a0, i64 %t2619)
  %t2646 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t2647 = and i64 %t2646, -8
  %t2648 = inttoptr i64 %t2647 to ptr
  %t2649 = load i64, ptr %t2648
  %t2650 = inttoptr i64 %t2649 to ptr
  %t2651 = call fastcc i64%t2650(i64 %t2646, i64 1, i64 %t2645, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge726
else725:
  br label %merge726
merge726:
  %t2652 = phi i64 [ %t2651, %then724 ], [ 1, %else725 ]
  %t2653 = icmp ne i64 %t2652, 1
  br i1 %t2653, label %then727, label %else728
then727:
  %t2654 = or i64 %t2619, 8
  %t2655 = and i64 %t2654, 7
  %t2656 = icmp eq i64 %t2655, 0
  br i1 %t2656, label %fixfast730, label %fixslow731
fixfast730:
  %t2657 = add i64 %t2619, 8
  br label %fixmerge732
fixslow731:
  %t2658 = call i64 @rt_add(i64 %t2619, i64 8)
  br label %fixmerge732
fixmerge732:
  %t2659 = phi i64 [ %t2657, %fixfast730 ], [ %t2658, %fixslow731 ]
  %t2660 = or i64 %t2659, %t2559
  %t2661 = and i64 %t2660, 7
  %t2662 = icmp eq i64 %t2661, 0
  br i1 %t2662, label %fixfast733, label %fixslow734
fixfast733:
  %t2663 = icmp slt i64 %t2659, %t2559
  %t2664 = select i1 %t2663, i64 257, i64 1
  br label %fixmerge735
fixslow734:
  %t2665 = call i64 @rt_lt(i64 %t2659, i64 %t2559)
  br label %fixmerge735
fixmerge735:
  %t2666 = phi i64 [ %t2664, %fixfast733 ], [ %t2665, %fixslow734 ]
  %t2667 = icmp ne i64 %t2666, 1
  br i1 %t2667, label %then736, label %else737
then736:
  %t2668 = or i64 %t2619, 8
  %t2669 = and i64 %t2668, 7
  %t2670 = icmp eq i64 %t2669, 0
  br i1 %t2670, label %fixfast739, label %fixslow740
fixfast739:
  %t2671 = add i64 %t2619, 8
  br label %fixmerge741
fixslow740:
  %t2672 = call i64 @rt_add(i64 %t2619, i64 8)
  br label %fixmerge741
fixmerge741:
  %t2673 = phi i64 [ %t2671, %fixfast739 ], [ %t2672, %fixslow740 ]
  %t2674 = call i64 @rt_string_ref(i64 %a0, i64 %t2673)
  %t2675 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t2676 = and i64 %t2675, -8
  %t2677 = inttoptr i64 %t2676 to ptr
  %t2678 = load i64, ptr %t2677
  %t2679 = inttoptr i64 %t2678 to ptr
  %t2680 = call fastcc i64%t2679(i64 %t2675, i64 1, i64 %t2674, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge738
else737:
  br label %merge738
merge738:
  %t2681 = phi i64 [ %t2680, %fixmerge741 ], [ 1, %else737 ]
  %t2682 = icmp ne i64 %t2681, 1
  br i1 %t2682, label %then742, label %else743
then742:
  %t2683 = or i64 %t2619, 16
  %t2684 = and i64 %t2683, 7
  %t2685 = icmp eq i64 %t2684, 0
  br i1 %t2685, label %fixfast745, label %fixslow746
fixfast745:
  %t2686 = add i64 %t2619, 16
  br label %fixmerge747
fixslow746:
  %t2687 = call i64 @rt_add(i64 %t2619, i64 16)
  br label %fixmerge747
fixmerge747:
  %t2688 = phi i64 [ %t2686, %fixfast745 ], [ %t2687, %fixslow746 ]
  br label %merge744
else743:
  %t2689 = or i64 %t2619, 8
  %t2690 = and i64 %t2689, 7
  %t2691 = icmp eq i64 %t2690, 0
  br i1 %t2691, label %fixfast748, label %fixslow749
fixfast748:
  %t2692 = add i64 %t2619, 8
  br label %fixmerge750
fixslow749:
  %t2693 = call i64 @rt_add(i64 %t2619, i64 8)
  br label %fixmerge750
fixmerge750:
  %t2694 = phi i64 [ %t2692, %fixfast748 ], [ %t2693, %fixslow749 ]
  br label %merge744
merge744:
  %t2695 = phi i64 [ %t2688, %fixmerge747 ], [ %t2694, %fixmerge750 ]
  %t2696 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2697 = and i64 %t2696, -8
  %t2698 = inttoptr i64 %t2697 to ptr
  %t2699 = load i64, ptr %t2698
  %t2700 = inttoptr i64 %t2699 to ptr
  %t2701 = call fastcc i64%t2700(i64 %t2696, i64 3, i64 %a0, i64 %t2695, i64 %t2559, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2702 = or i64 %t2695, %t2701
  %t2703 = and i64 %t2702, 7
  %t2704 = icmp eq i64 %t2703, 0
  br i1 %t2704, label %fixfast751, label %fixslow752
fixfast751:
  %t2705 = icmp slt i64 %t2695, %t2701
  %t2706 = select i1 %t2705, i64 257, i64 1
  br label %fixmerge753
fixslow752:
  %t2707 = call i64 @rt_lt(i64 %t2695, i64 %t2701)
  br label %fixmerge753
fixmerge753:
  %t2708 = phi i64 [ %t2706, %fixfast751 ], [ %t2707, %fixslow752 ]
  %t2709 = icmp ne i64 %t2708, 1
  br i1 %t2709, label %then754, label %else755
then754:
  br label %merge756
else755:
  br label %merge756
merge756:
  %t2710 = phi i64 [ %t2701, %then754 ], [ -8, %else755 ]
  br label %merge729
else728:
  br label %merge729
merge729:
  %t2711 = phi i64 [ %t2710, %merge756 ], [ %t2619, %else728 ]
  %t2712 = or i64 -8, %t2711
  %t2713 = and i64 %t2712, 7
  %t2714 = icmp eq i64 %t2713, 0
  br i1 %t2714, label %fixfast757, label %fixslow758
fixfast757:
  %t2715 = icmp slt i64 -8, %t2711
  %t2716 = select i1 %t2715, i64 257, i64 1
  br label %fixmerge759
fixslow758:
  %t2717 = call i64 @rt_lt(i64 -8, i64 %t2711)
  br label %fixmerge759
fixmerge759:
  %t2718 = phi i64 [ %t2716, %fixfast757 ], [ %t2717, %fixslow758 ]
  %t2719 = icmp ne i64 %t2718, 1
  br i1 %t2719, label %then760, label %else761
then760:
  %t2720 = or i64 %t2711, %t2559
  %t2721 = and i64 %t2720, 7
  %t2722 = icmp eq i64 %t2721, 0
  br i1 %t2722, label %fixfast762, label %fixslow763
fixfast762:
  %t2723 = icmp eq i64 %t2711, %t2559
  %t2724 = select i1 %t2723, i64 257, i64 1
  br label %fixmerge764
fixslow763:
  %t2725 = call i64 @rt_num_eq(i64 %t2711, i64 %t2559)
  br label %fixmerge764
fixmerge764:
  %t2726 = phi i64 [ %t2724, %fixfast762 ], [ %t2725, %fixslow763 ]
  %t2727 = icmp ne i64 %t2726, 1
  br i1 %t2727, label %then765, label %else766
then765:
  %t2728 = icmp ne i64 %t2613, 1
  br i1 %t2728, label %then767, label %else768
then767:
  ret i64 %t2613
else768:
  %t2729 = or i64 %t2619, %t2711
  %t2730 = and i64 %t2729, 7
  %t2731 = icmp eq i64 %t2730, 0
  br i1 %t2731, label %fixfast769, label %fixslow770
fixfast769:
  %t2732 = icmp slt i64 %t2619, %t2711
  %t2733 = select i1 %t2732, i64 257, i64 1
  br label %fixmerge771
fixslow770:
  %t2734 = call i64 @rt_lt(i64 %t2619, i64 %t2711)
  br label %fixmerge771
fixmerge771:
  %t2735 = phi i64 [ %t2733, %fixfast769 ], [ %t2734, %fixslow770 ]
  ret i64 %t2735
else766:
  ret i64 1
else761:
  ret i64 1
else720:
  ret i64 1
else691:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2740 = icmp eq i64 %argc, 3
  br i1 %t2740, label %argok773, label %arityerr772
arityerr772:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok773:
  %t2741 = load i64, ptr @"scheme.base:rd-token-end"
  %t2742 = and i64 %t2741, -8
  %t2743 = inttoptr i64 %t2742 to ptr
  %t2744 = load i64, ptr %t2743
  %t2745 = inttoptr i64 %t2744 to ptr
  %t2746 = call fastcc i64%t2745(i64 %t2741, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2747 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2746)
  %t2748 = load i64, ptr @"scheme.base:rd-numeric?"
  %t2749 = and i64 %t2748, -8
  %t2750 = inttoptr i64 %t2749 to ptr
  %t2751 = load i64, ptr %t2750
  %t2752 = inttoptr i64 %t2751 to ptr
  %t2753 = call fastcc i64%t2752(i64 %t2748, i64 1, i64 %t2747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2754 = icmp ne i64 %t2753, 1
  br i1 %t2754, label %then774, label %else775
then774:
  %t2755 = load i64, ptr @"scheme.base:rd-parse-int"
  %t2756 = and i64 %t2755, -8
  %t2757 = inttoptr i64 %t2756 to ptr
  %t2758 = load i64, ptr %t2757
  %t2759 = inttoptr i64 %t2758 to ptr
  %t2760 = call fastcc i64%t2759(i64 %t2755, i64 1, i64 %t2747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge776
else775:
  %t2761 = load i64, ptr @"scheme.base:rd-flonum?"
  %t2762 = and i64 %t2761, -8
  %t2763 = inttoptr i64 %t2762 to ptr
  %t2764 = load i64, ptr %t2763
  %t2765 = inttoptr i64 %t2764 to ptr
  %t2766 = call fastcc i64%t2765(i64 %t2761, i64 1, i64 %t2747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2767 = icmp ne i64 %t2766, 1
  br i1 %t2767, label %then777, label %else778
then777:
  %t2768 = call i64 @rt_string_to_flonum(i64 %t2747)
  br label %merge779
else778:
  %t2769 = call i64 @rt_string_to_symbol(i64 %t2747)
  br label %merge779
merge779:
  %t2770 = phi i64 [ %t2768, %then777 ], [ %t2769, %else778 ]
  br label %merge776
merge776:
  %t2771 = phi i64 [ %t2760, %then774 ], [ %t2770, %merge779 ]
  %t2772 = call i64 @rt_cons(i64 %t2771, i64 %t2746)
  ret i64 %t2772
}

define fastcc i64 @"scheme.base:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2777 = icmp eq i64 %argc, 1
  br i1 %t2777, label %argok781, label %arityerr780
arityerr780:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok781:
  %t2778 = call i64 @rt_char_to_integer(i64 %a0)
  %t2779 = or i64 376, %t2778
  %t2780 = and i64 %t2779, 7
  %t2781 = icmp eq i64 %t2780, 0
  br i1 %t2781, label %fixfast782, label %fixslow783
fixfast782:
  %t2782 = icmp slt i64 376, %t2778
  %t2783 = select i1 %t2782, i64 257, i64 1
  br label %fixmerge784
fixslow783:
  %t2784 = call i64 @rt_lt(i64 376, i64 %t2778)
  br label %fixmerge784
fixmerge784:
  %t2785 = phi i64 [ %t2783, %fixfast782 ], [ %t2784, %fixslow783 ]
  %t2786 = icmp ne i64 %t2785, 1
  br i1 %t2786, label %then785, label %else786
then785:
  %t2787 = or i64 %t2778, 464
  %t2788 = and i64 %t2787, 7
  %t2789 = icmp eq i64 %t2788, 0
  br i1 %t2789, label %fixfast788, label %fixslow789
fixfast788:
  %t2790 = icmp slt i64 %t2778, 464
  %t2791 = select i1 %t2790, i64 257, i64 1
  br label %fixmerge790
fixslow789:
  %t2792 = call i64 @rt_lt(i64 %t2778, i64 464)
  br label %fixmerge790
fixmerge790:
  %t2793 = phi i64 [ %t2791, %fixfast788 ], [ %t2792, %fixslow789 ]
  br label %merge787
else786:
  br label %merge787
merge787:
  %t2794 = phi i64 [ %t2793, %fixmerge790 ], [ 1, %else786 ]
  %t2795 = icmp ne i64 %t2794, 1
  br i1 %t2795, label %then791, label %else792
then791:
  %t2796 = or i64 %t2778, 384
  %t2797 = and i64 %t2796, 7
  %t2798 = icmp eq i64 %t2797, 0
  br i1 %t2798, label %fixfast793, label %fixslow794
fixfast793:
  %t2799 = sub i64 %t2778, 384
  br label %fixmerge795
fixslow794:
  %t2800 = call i64 @rt_sub(i64 %t2778, i64 384)
  br label %fixmerge795
fixmerge795:
  %t2801 = phi i64 [ %t2799, %fixfast793 ], [ %t2800, %fixslow794 ]
  ret i64 %t2801
else792:
  %t2802 = or i64 768, %t2778
  %t2803 = and i64 %t2802, 7
  %t2804 = icmp eq i64 %t2803, 0
  br i1 %t2804, label %fixfast796, label %fixslow797
fixfast796:
  %t2805 = icmp slt i64 768, %t2778
  %t2806 = select i1 %t2805, i64 257, i64 1
  br label %fixmerge798
fixslow797:
  %t2807 = call i64 @rt_lt(i64 768, i64 %t2778)
  br label %fixmerge798
fixmerge798:
  %t2808 = phi i64 [ %t2806, %fixfast796 ], [ %t2807, %fixslow797 ]
  %t2809 = icmp ne i64 %t2808, 1
  br i1 %t2809, label %then799, label %else800
then799:
  %t2810 = or i64 %t2778, 824
  %t2811 = and i64 %t2810, 7
  %t2812 = icmp eq i64 %t2811, 0
  br i1 %t2812, label %fixfast802, label %fixslow803
fixfast802:
  %t2813 = icmp slt i64 %t2778, 824
  %t2814 = select i1 %t2813, i64 257, i64 1
  br label %fixmerge804
fixslow803:
  %t2815 = call i64 @rt_lt(i64 %t2778, i64 824)
  br label %fixmerge804
fixmerge804:
  %t2816 = phi i64 [ %t2814, %fixfast802 ], [ %t2815, %fixslow803 ]
  br label %merge801
else800:
  br label %merge801
merge801:
  %t2817 = phi i64 [ %t2816, %fixmerge804 ], [ 1, %else800 ]
  %t2818 = icmp ne i64 %t2817, 1
  br i1 %t2818, label %then805, label %else806
then805:
  %t2819 = or i64 %t2778, 696
  %t2820 = and i64 %t2819, 7
  %t2821 = icmp eq i64 %t2820, 0
  br i1 %t2821, label %fixfast807, label %fixslow808
fixfast807:
  %t2822 = sub i64 %t2778, 696
  br label %fixmerge809
fixslow808:
  %t2823 = call i64 @rt_sub(i64 %t2778, i64 696)
  br label %fixmerge809
fixmerge809:
  %t2824 = phi i64 [ %t2822, %fixfast807 ], [ %t2823, %fixslow808 ]
  ret i64 %t2824
else806:
  %t2825 = or i64 512, %t2778
  %t2826 = and i64 %t2825, 7
  %t2827 = icmp eq i64 %t2826, 0
  br i1 %t2827, label %fixfast810, label %fixslow811
fixfast810:
  %t2828 = icmp slt i64 512, %t2778
  %t2829 = select i1 %t2828, i64 257, i64 1
  br label %fixmerge812
fixslow811:
  %t2830 = call i64 @rt_lt(i64 512, i64 %t2778)
  br label %fixmerge812
fixmerge812:
  %t2831 = phi i64 [ %t2829, %fixfast810 ], [ %t2830, %fixslow811 ]
  %t2832 = icmp ne i64 %t2831, 1
  br i1 %t2832, label %then813, label %else814
then813:
  %t2833 = or i64 %t2778, 568
  %t2834 = and i64 %t2833, 7
  %t2835 = icmp eq i64 %t2834, 0
  br i1 %t2835, label %fixfast816, label %fixslow817
fixfast816:
  %t2836 = icmp slt i64 %t2778, 568
  %t2837 = select i1 %t2836, i64 257, i64 1
  br label %fixmerge818
fixslow817:
  %t2838 = call i64 @rt_lt(i64 %t2778, i64 568)
  br label %fixmerge818
fixmerge818:
  %t2839 = phi i64 [ %t2837, %fixfast816 ], [ %t2838, %fixslow817 ]
  br label %merge815
else814:
  br label %merge815
merge815:
  %t2840 = phi i64 [ %t2839, %fixmerge818 ], [ 1, %else814 ]
  %t2841 = icmp ne i64 %t2840, 1
  br i1 %t2841, label %then819, label %else820
then819:
  %t2842 = or i64 %t2778, 440
  %t2843 = and i64 %t2842, 7
  %t2844 = icmp eq i64 %t2843, 0
  br i1 %t2844, label %fixfast821, label %fixslow822
fixfast821:
  %t2845 = sub i64 %t2778, 440
  br label %fixmerge823
fixslow822:
  %t2846 = call i64 @rt_sub(i64 %t2778, i64 440)
  br label %fixmerge823
fixmerge823:
  %t2847 = phi i64 [ %t2845, %fixfast821 ], [ %t2846, %fixslow822 ]
  ret i64 %t2847
else820:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2852 = icmp eq i64 %argc, 4
  br i1 %t2852, label %argok825, label %arityerr824
arityerr824:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok825:
  %t2853 = or i64 %a2, %a1
  %t2854 = and i64 %t2853, 7
  %t2855 = icmp eq i64 %t2854, 0
  br i1 %t2855, label %fixfast826, label %fixslow827
fixfast826:
  %t2856 = icmp slt i64 %a2, %a1
  %t2857 = select i1 %t2856, i64 257, i64 1
  br label %fixmerge828
fixslow827:
  %t2858 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge828
fixmerge828:
  %t2859 = phi i64 [ %t2857, %fixfast826 ], [ %t2858, %fixslow827 ]
  %t2860 = icmp ne i64 %t2859, 1
  br i1 %t2860, label %then829, label %else830
then829:
  %t2861 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2862 = call i64 @rt_char_to_integer(i64 %t2861)
  %t2863 = or i64 %t2862, 472
  %t2864 = and i64 %t2863, 7
  %t2865 = icmp eq i64 %t2864, 0
  br i1 %t2865, label %fixfast831, label %fixslow832
fixfast831:
  %t2866 = icmp eq i64 %t2862, 472
  %t2867 = select i1 %t2866, i64 257, i64 1
  br label %fixmerge833
fixslow832:
  %t2868 = call i64 @rt_num_eq(i64 %t2862, i64 472)
  br label %fixmerge833
fixmerge833:
  %t2869 = phi i64 [ %t2867, %fixfast831 ], [ %t2868, %fixslow832 ]
  %t2870 = icmp ne i64 %t2869, 1
  br i1 %t2870, label %then834, label %else835
then834:
  %t2871 = or i64 %a2, 8
  %t2872 = and i64 %t2871, 7
  %t2873 = icmp eq i64 %t2872, 0
  br i1 %t2873, label %fixfast836, label %fixslow837
fixfast836:
  %t2874 = add i64 %a2, 8
  br label %fixmerge838
fixslow837:
  %t2875 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge838
fixmerge838:
  %t2876 = phi i64 [ %t2874, %fixfast836 ], [ %t2875, %fixslow837 ]
  %t2877 = call i64 @rt_cons(i64 %a3, i64 %t2876)
  ret i64 %t2877
else835:
  %t2878 = or i64 %a2, 8
  %t2879 = and i64 %t2878, 7
  %t2880 = icmp eq i64 %t2879, 0
  br i1 %t2880, label %fixfast839, label %fixslow840
fixfast839:
  %t2881 = add i64 %a2, 8
  br label %fixmerge841
fixslow840:
  %t2882 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge841
fixmerge841:
  %t2883 = phi i64 [ %t2881, %fixfast839 ], [ %t2882, %fixslow840 ]
  %t2884 = or i64 %a3, 128
  %t2885 = and i64 %t2884, 7
  %t2886 = icmp eq i64 %t2885, 0
  br i1 %t2886, label %fixfast842, label %fixslow843
fixfast842:
  %t2887 = ashr i64 %a3, 3
  %t2888 = mul i64 %t2887, 128
  br label %fixmerge844
fixslow843:
  %t2889 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge844
fixmerge844:
  %t2890 = phi i64 [ %t2888, %fixfast842 ], [ %t2889, %fixslow843 ]
  %t2891 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2892 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t2893 = and i64 %t2892, -8
  %t2894 = inttoptr i64 %t2893 to ptr
  %t2895 = load i64, ptr %t2894
  %t2896 = inttoptr i64 %t2895 to ptr
  %t2897 = call fastcc i64%t2896(i64 %t2892, i64 1, i64 %t2891, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2898 = or i64 %t2890, %t2897
  %t2899 = and i64 %t2898, 7
  %t2900 = icmp eq i64 %t2899, 0
  br i1 %t2900, label %fixfast845, label %fixslow846
fixfast845:
  %t2901 = add i64 %t2890, %t2897
  br label %fixmerge847
fixslow846:
  %t2902 = call i64 @rt_add(i64 %t2890, i64 %t2897)
  br label %fixmerge847
fixmerge847:
  %t2903 = phi i64 [ %t2901, %fixfast845 ], [ %t2902, %fixslow846 ]
  %t2904 = load i64, ptr @"scheme.base:rd-hex"
  %t2905 = and i64 %t2904, -8
  %t2906 = inttoptr i64 %t2905 to ptr
  %t2907 = load i64, ptr %t2906
  %t2908 = inttoptr i64 %t2907 to ptr
  %t2909 = musttail call fastcc i64 %t2908(i64 %t2904, i64 4, i64 %a0, i64 %a1, i64 %t2883, i64 %t2903, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2909
else830:
  %t2910 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2910
}

define fastcc i64 @"scheme.base:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2915 = icmp eq i64 %argc, 1
  br i1 %t2915, label %argok849, label %arityerr848
arityerr848:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok849:
  %t2916 = call i64 @rt_char_to_integer(i64 %a0)
  %t2917 = or i64 %t2916, 880
  %t2918 = and i64 %t2917, 7
  %t2919 = icmp eq i64 %t2918, 0
  br i1 %t2919, label %fixfast850, label %fixslow851
fixfast850:
  %t2920 = icmp eq i64 %t2916, 880
  %t2921 = select i1 %t2920, i64 257, i64 1
  br label %fixmerge852
fixslow851:
  %t2922 = call i64 @rt_num_eq(i64 %t2916, i64 880)
  br label %fixmerge852
fixmerge852:
  %t2923 = phi i64 [ %t2921, %fixfast850 ], [ %t2922, %fixslow851 ]
  %t2924 = icmp ne i64 %t2923, 1
  br i1 %t2924, label %then853, label %else854
then853:
  %t2925 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2925
else854:
  %t2926 = or i64 %t2916, 928
  %t2927 = and i64 %t2926, 7
  %t2928 = icmp eq i64 %t2927, 0
  br i1 %t2928, label %fixfast855, label %fixslow856
fixfast855:
  %t2929 = icmp eq i64 %t2916, 928
  %t2930 = select i1 %t2929, i64 257, i64 1
  br label %fixmerge857
fixslow856:
  %t2931 = call i64 @rt_num_eq(i64 %t2916, i64 928)
  br label %fixmerge857
fixmerge857:
  %t2932 = phi i64 [ %t2930, %fixfast855 ], [ %t2931, %fixslow856 ]
  %t2933 = icmp ne i64 %t2932, 1
  br i1 %t2933, label %then858, label %else859
then858:
  %t2934 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2934
else859:
  %t2935 = or i64 %t2916, 912
  %t2936 = and i64 %t2935, 7
  %t2937 = icmp eq i64 %t2936, 0
  br i1 %t2937, label %fixfast860, label %fixslow861
fixfast860:
  %t2938 = icmp eq i64 %t2916, 912
  %t2939 = select i1 %t2938, i64 257, i64 1
  br label %fixmerge862
fixslow861:
  %t2940 = call i64 @rt_num_eq(i64 %t2916, i64 912)
  br label %fixmerge862
fixmerge862:
  %t2941 = phi i64 [ %t2939, %fixfast860 ], [ %t2940, %fixslow861 ]
  %t2942 = icmp ne i64 %t2941, 1
  br i1 %t2942, label %then863, label %else864
then863:
  %t2943 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2943
else864:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_748"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2948 = icmp eq i64 %argc, 2
  br i1 %t2948, label %argok866, label %arityerr865
arityerr865:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok866:
  %t2949 = and i64 %self, -8
  %t2950 = inttoptr i64 %t2949 to ptr
  %t2951 = getelementptr i64, ptr %t2950, i64 1
  %t2952 = load i64, ptr %t2951
  %t2953 = or i64 %a0, %t2952
  %t2954 = and i64 %t2953, 7
  %t2955 = icmp eq i64 %t2954, 0
  br i1 %t2955, label %fixfast867, label %fixslow868
fixfast867:
  %t2956 = icmp slt i64 %a0, %t2952
  %t2957 = select i1 %t2956, i64 257, i64 1
  br label %fixmerge869
fixslow868:
  %t2958 = call i64 @rt_lt(i64 %a0, i64 %t2952)
  br label %fixmerge869
fixmerge869:
  %t2959 = phi i64 [ %t2957, %fixfast867 ], [ %t2958, %fixslow868 ]
  %t2960 = icmp ne i64 %t2959, 1
  br i1 %t2960, label %then870, label %else871
then870:
  %t2961 = and i64 %self, -8
  %t2962 = inttoptr i64 %t2961 to ptr
  %t2963 = getelementptr i64, ptr %t2962, i64 2
  %t2964 = load i64, ptr %t2963
  %t2965 = call i64 @rt_string_ref(i64 %t2964, i64 %a0)
  %t2966 = call i64 @rt_char_to_integer(i64 %t2965)
  %t2967 = or i64 %t2966, 272
  %t2968 = and i64 %t2967, 7
  %t2969 = icmp eq i64 %t2968, 0
  br i1 %t2969, label %fixfast872, label %fixslow873
fixfast872:
  %t2970 = icmp eq i64 %t2966, 272
  %t2971 = select i1 %t2970, i64 257, i64 1
  br label %fixmerge874
fixslow873:
  %t2972 = call i64 @rt_num_eq(i64 %t2966, i64 272)
  br label %fixmerge874
fixmerge874:
  %t2973 = phi i64 [ %t2971, %fixfast872 ], [ %t2972, %fixslow873 ]
  %t2974 = icmp ne i64 %t2973, 1
  br i1 %t2974, label %then875, label %else876
then875:
  %t2975 = load i64, ptr @"scheme.base:reverse"
  %t2976 = and i64 %t2975, -8
  %t2977 = inttoptr i64 %t2976 to ptr
  %t2978 = load i64, ptr %t2977
  %t2979 = inttoptr i64 %t2978 to ptr
  %t2980 = call fastcc i64%t2979(i64 %t2975, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2981 = call i64 @rt_list_to_string(i64 %t2980)
  %t2982 = or i64 %a0, 8
  %t2983 = and i64 %t2982, 7
  %t2984 = icmp eq i64 %t2983, 0
  br i1 %t2984, label %fixfast877, label %fixslow878
fixfast877:
  %t2985 = add i64 %a0, 8
  br label %fixmerge879
fixslow878:
  %t2986 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge879
fixmerge879:
  %t2987 = phi i64 [ %t2985, %fixfast877 ], [ %t2986, %fixslow878 ]
  %t2988 = call i64 @rt_cons(i64 %t2981, i64 %t2987)
  ret i64 %t2988
else876:
  %t2989 = or i64 %t2966, 736
  %t2990 = and i64 %t2989, 7
  %t2991 = icmp eq i64 %t2990, 0
  br i1 %t2991, label %fixfast880, label %fixslow881
fixfast880:
  %t2992 = icmp eq i64 %t2966, 736
  %t2993 = select i1 %t2992, i64 257, i64 1
  br label %fixmerge882
fixslow881:
  %t2994 = call i64 @rt_num_eq(i64 %t2966, i64 736)
  br label %fixmerge882
fixmerge882:
  %t2995 = phi i64 [ %t2993, %fixfast880 ], [ %t2994, %fixslow881 ]
  %t2996 = icmp ne i64 %t2995, 1
  br i1 %t2996, label %then883, label %else884
then883:
  %t2997 = and i64 %self, -8
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = getelementptr i64, ptr %t2998, i64 2
  %t3000 = load i64, ptr %t2999
  %t3001 = or i64 %a0, 8
  %t3002 = and i64 %t3001, 7
  %t3003 = icmp eq i64 %t3002, 0
  br i1 %t3003, label %fixfast885, label %fixslow886
fixfast885:
  %t3004 = add i64 %a0, 8
  br label %fixmerge887
fixslow886:
  %t3005 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge887
fixmerge887:
  %t3006 = phi i64 [ %t3004, %fixfast885 ], [ %t3005, %fixslow886 ]
  %t3007 = call i64 @rt_string_ref(i64 %t3000, i64 %t3006)
  %t3008 = call i64 @rt_char_to_integer(i64 %t3007)
  %t3009 = or i64 %t3008, 960
  %t3010 = and i64 %t3009, 7
  %t3011 = icmp eq i64 %t3010, 0
  br i1 %t3011, label %fixfast888, label %fixslow889
fixfast888:
  %t3012 = icmp eq i64 %t3008, 960
  %t3013 = select i1 %t3012, i64 257, i64 1
  br label %fixmerge890
fixslow889:
  %t3014 = call i64 @rt_num_eq(i64 %t3008, i64 960)
  br label %fixmerge890
fixmerge890:
  %t3015 = phi i64 [ %t3013, %fixfast888 ], [ %t3014, %fixslow889 ]
  %t3016 = icmp ne i64 %t3015, 1
  br i1 %t3016, label %then891, label %else892
then891:
  %t3017 = and i64 %self, -8
  %t3018 = inttoptr i64 %t3017 to ptr
  %t3019 = getelementptr i64, ptr %t3018, i64 2
  %t3020 = load i64, ptr %t3019
  %t3021 = and i64 %self, -8
  %t3022 = inttoptr i64 %t3021 to ptr
  %t3023 = getelementptr i64, ptr %t3022, i64 1
  %t3024 = load i64, ptr %t3023
  %t3025 = or i64 %a0, 16
  %t3026 = and i64 %t3025, 7
  %t3027 = icmp eq i64 %t3026, 0
  br i1 %t3027, label %fixfast893, label %fixslow894
fixfast893:
  %t3028 = add i64 %a0, 16
  br label %fixmerge895
fixslow894:
  %t3029 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge895
fixmerge895:
  %t3030 = phi i64 [ %t3028, %fixfast893 ], [ %t3029, %fixslow894 ]
  %t3031 = load i64, ptr @"scheme.base:rd-hex"
  %t3032 = and i64 %t3031, -8
  %t3033 = inttoptr i64 %t3032 to ptr
  %t3034 = load i64, ptr %t3033
  %t3035 = inttoptr i64 %t3034 to ptr
  %t3036 = call fastcc i64%t3035(i64 %t3031, i64 4, i64 %t3020, i64 %t3024, i64 %t3030, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3037 = call i64 @rt_cdr(i64 %t3036)
  %t3038 = call i64 @rt_car(i64 %t3036)
  %t3039 = call i64 @rt_integer_to_char(i64 %t3038)
  %t3040 = call i64 @rt_cons(i64 %t3039, i64 %a1)
  %t3041 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %self, i64 2, i64 %t3037, i64 %t3040, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3041
else892:
  %t3042 = or i64 %a0, 16
  %t3043 = and i64 %t3042, 7
  %t3044 = icmp eq i64 %t3043, 0
  br i1 %t3044, label %fixfast896, label %fixslow897
fixfast896:
  %t3045 = add i64 %a0, 16
  br label %fixmerge898
fixslow897:
  %t3046 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge898
fixmerge898:
  %t3047 = phi i64 [ %t3045, %fixfast896 ], [ %t3046, %fixslow897 ]
  %t3048 = load i64, ptr @"scheme.base:rd-str-esc"
  %t3049 = and i64 %t3048, -8
  %t3050 = inttoptr i64 %t3049 to ptr
  %t3051 = load i64, ptr %t3050
  %t3052 = inttoptr i64 %t3051 to ptr
  %t3053 = call fastcc i64%t3052(i64 %t3048, i64 1, i64 %t3007, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3054 = call i64 @rt_cons(i64 %t3053, i64 %a1)
  %t3055 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %self, i64 2, i64 %t3047, i64 %t3054, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3055
else884:
  %t3056 = or i64 %a0, 8
  %t3057 = and i64 %t3056, 7
  %t3058 = icmp eq i64 %t3057, 0
  br i1 %t3058, label %fixfast899, label %fixslow900
fixfast899:
  %t3059 = add i64 %a0, 8
  br label %fixmerge901
fixslow900:
  %t3060 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge901
fixmerge901:
  %t3061 = phi i64 [ %t3059, %fixfast899 ], [ %t3060, %fixslow900 ]
  %t3062 = call i64 @rt_cons(i64 %t2965, i64 %a1)
  %t3063 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %self, i64 2, i64 %t3061, i64 %t3062, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3063
else871:
  %t3064 = load i64, ptr @"scheme.base:reverse"
  %t3065 = and i64 %t3064, -8
  %t3066 = inttoptr i64 %t3065 to ptr
  %t3067 = load i64, ptr %t3066
  %t3068 = inttoptr i64 %t3067 to ptr
  %t3069 = call fastcc i64%t3068(i64 %t3064, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3070 = call i64 @rt_list_to_string(i64 %t3069)
  %t3071 = call i64 @rt_cons(i64 %t3070, i64 %a0)
  ret i64 %t3071
}

define fastcc i64 @"scheme.base:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3072 = icmp eq i64 %argc, 3
  br i1 %t3072, label %argok903, label %arityerr902
arityerr902:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok903:
  %t3073 = call ptr @rt_alloc_words(i64 4)
  %t3074 = ptrtoint ptr %t3073 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_748" to i64), ptr %t3073
  %t3075 = or i64 %t3074, 4
  %t3076 = getelementptr i64, ptr %t3073, i64 1
  store i64 %a1, ptr %t3076
  %t3077 = getelementptr i64, ptr %t3073, i64 2
  store i64 %a0, ptr %t3077
  %t3078 = getelementptr i64, ptr %t3073, i64 3
  store i64 %t3075, ptr %t3078
  %t3079 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %t3075, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3079
}

define fastcc i64 @"scheme.base:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3084 = icmp eq i64 %argc, 3
  br i1 %t3084, label %argok905, label %arityerr904
arityerr904:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok905:
  %t3085 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3086 = call i64 @rt_char_to_integer(i64 %t3085)
  %t3087 = or i64 %t3086, 928
  %t3088 = and i64 %t3087, 7
  %t3089 = icmp eq i64 %t3088, 0
  br i1 %t3089, label %fixfast906, label %fixslow907
fixfast906:
  %t3090 = icmp eq i64 %t3086, 928
  %t3091 = select i1 %t3090, i64 257, i64 1
  br label %fixmerge908
fixslow907:
  %t3092 = call i64 @rt_num_eq(i64 %t3086, i64 928)
  br label %fixmerge908
fixmerge908:
  %t3093 = phi i64 [ %t3091, %fixfast906 ], [ %t3092, %fixslow907 ]
  %t3094 = icmp ne i64 %t3093, 1
  br i1 %t3094, label %then909, label %else910
then909:
  %t3095 = or i64 %a2, 8
  %t3096 = and i64 %t3095, 7
  %t3097 = icmp eq i64 %t3096, 0
  br i1 %t3097, label %fixfast911, label %fixslow912
fixfast911:
  %t3098 = add i64 %a2, 8
  br label %fixmerge913
fixslow912:
  %t3099 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge913
fixmerge913:
  %t3100 = phi i64 [ %t3098, %fixfast911 ], [ %t3099, %fixslow912 ]
  %t3101 = call i64 @rt_cons(i64 257, i64 %t3100)
  ret i64 %t3101
else910:
  %t3102 = or i64 %t3086, 816
  %t3103 = and i64 %t3102, 7
  %t3104 = icmp eq i64 %t3103, 0
  br i1 %t3104, label %fixfast914, label %fixslow915
fixfast914:
  %t3105 = icmp eq i64 %t3086, 816
  %t3106 = select i1 %t3105, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t3107 = call i64 @rt_num_eq(i64 %t3086, i64 816)
  br label %fixmerge916
fixmerge916:
  %t3108 = phi i64 [ %t3106, %fixfast914 ], [ %t3107, %fixslow915 ]
  %t3109 = icmp ne i64 %t3108, 1
  br i1 %t3109, label %then917, label %else918
then917:
  %t3110 = or i64 %a2, 8
  %t3111 = and i64 %t3110, 7
  %t3112 = icmp eq i64 %t3111, 0
  br i1 %t3112, label %fixfast919, label %fixslow920
fixfast919:
  %t3113 = add i64 %a2, 8
  br label %fixmerge921
fixslow920:
  %t3114 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge921
fixmerge921:
  %t3115 = phi i64 [ %t3113, %fixfast919 ], [ %t3114, %fixslow920 ]
  %t3116 = call i64 @rt_cons(i64 1, i64 %t3115)
  ret i64 %t3116
else918:
  %t3117 = or i64 %t3086, 736
  %t3118 = and i64 %t3117, 7
  %t3119 = icmp eq i64 %t3118, 0
  br i1 %t3119, label %fixfast922, label %fixslow923
fixfast922:
  %t3120 = icmp eq i64 %t3086, 736
  %t3121 = select i1 %t3120, i64 257, i64 1
  br label %fixmerge924
fixslow923:
  %t3122 = call i64 @rt_num_eq(i64 %t3086, i64 736)
  br label %fixmerge924
fixmerge924:
  %t3123 = phi i64 [ %t3121, %fixfast922 ], [ %t3122, %fixslow923 ]
  %t3124 = icmp ne i64 %t3123, 1
  br i1 %t3124, label %then925, label %else926
then925:
  %t3125 = load i64, ptr @"scheme.base:rd-char"
  %t3126 = and i64 %t3125, -8
  %t3127 = inttoptr i64 %t3126 to ptr
  %t3128 = load i64, ptr %t3127
  %t3129 = inttoptr i64 %t3128 to ptr
  %t3130 = musttail call fastcc i64 %t3129(i64 %t3125, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3130
else926:
  %t3131 = or i64 %t3086, 320
  %t3132 = and i64 %t3131, 7
  %t3133 = icmp eq i64 %t3132, 0
  br i1 %t3133, label %fixfast927, label %fixslow928
fixfast927:
  %t3134 = icmp eq i64 %t3086, 320
  %t3135 = select i1 %t3134, i64 257, i64 1
  br label %fixmerge929
fixslow928:
  %t3136 = call i64 @rt_num_eq(i64 %t3086, i64 320)
  br label %fixmerge929
fixmerge929:
  %t3137 = phi i64 [ %t3135, %fixfast927 ], [ %t3136, %fixslow928 ]
  %t3138 = icmp ne i64 %t3137, 1
  br i1 %t3138, label %then930, label %else931
then930:
  %t3139 = or i64 %a2, 8
  %t3140 = and i64 %t3139, 7
  %t3141 = icmp eq i64 %t3140, 0
  br i1 %t3141, label %fixfast932, label %fixslow933
fixfast932:
  %t3142 = add i64 %a2, 8
  br label %fixmerge934
fixslow933:
  %t3143 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge934
fixmerge934:
  %t3144 = phi i64 [ %t3142, %fixfast932 ], [ %t3143, %fixslow933 ]
  %t3145 = load i64, ptr @"scheme.base:rd-list"
  %t3146 = and i64 %t3145, -8
  %t3147 = inttoptr i64 %t3146 to ptr
  %t3148 = load i64, ptr %t3147
  %t3149 = inttoptr i64 %t3148 to ptr
  %t3150 = call fastcc i64%t3149(i64 %t3145, i64 4, i64 %a0, i64 %a1, i64 %t3144, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3151 = call i64 @rt_car(i64 %t3150)
  %t3152 = load i64, ptr @"scheme.base:list->vector"
  %t3153 = and i64 %t3152, -8
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = load i64, ptr %t3154
  %t3156 = inttoptr i64 %t3155 to ptr
  %t3157 = call fastcc i64%t3156(i64 %t3152, i64 1, i64 %t3151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3158 = call i64 @rt_cdr(i64 %t3150)
  %t3159 = call i64 @rt_cons(i64 %t3157, i64 %t3158)
  ret i64 %t3159
else931:
  %t3160 = or i64 %t3086, 936
  %t3161 = and i64 %t3160, 7
  %t3162 = icmp eq i64 %t3161, 0
  br i1 %t3162, label %fixfast935, label %fixslow936
fixfast935:
  %t3163 = icmp eq i64 %t3086, 936
  %t3164 = select i1 %t3163, i64 257, i64 1
  br label %fixmerge937
fixslow936:
  %t3165 = call i64 @rt_num_eq(i64 %t3086, i64 936)
  br label %fixmerge937
fixmerge937:
  %t3166 = phi i64 [ %t3164, %fixfast935 ], [ %t3165, %fixslow936 ]
  %t3167 = icmp ne i64 %t3166, 1
  br i1 %t3167, label %then938, label %else939
then938:
  %t3168 = or i64 %a2, 16
  %t3169 = and i64 %t3168, 7
  %t3170 = icmp eq i64 %t3169, 0
  br i1 %t3170, label %fixfast941, label %fixslow942
fixfast941:
  %t3171 = add i64 %a2, 16
  br label %fixmerge943
fixslow942:
  %t3172 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge943
fixmerge943:
  %t3173 = phi i64 [ %t3171, %fixfast941 ], [ %t3172, %fixslow942 ]
  %t3174 = or i64 %t3173, %a1
  %t3175 = and i64 %t3174, 7
  %t3176 = icmp eq i64 %t3175, 0
  br i1 %t3176, label %fixfast944, label %fixslow945
fixfast944:
  %t3177 = icmp slt i64 %t3173, %a1
  %t3178 = select i1 %t3177, i64 257, i64 1
  br label %fixmerge946
fixslow945:
  %t3179 = call i64 @rt_lt(i64 %t3173, i64 %a1)
  br label %fixmerge946
fixmerge946:
  %t3180 = phi i64 [ %t3178, %fixfast944 ], [ %t3179, %fixslow945 ]
  %t3181 = icmp ne i64 %t3180, 1
  br i1 %t3181, label %then947, label %else948
then947:
  %t3182 = or i64 %a2, 8
  %t3183 = and i64 %t3182, 7
  %t3184 = icmp eq i64 %t3183, 0
  br i1 %t3184, label %fixfast950, label %fixslow951
fixfast950:
  %t3185 = add i64 %a2, 8
  br label %fixmerge952
fixslow951:
  %t3186 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge952
fixmerge952:
  %t3187 = phi i64 [ %t3185, %fixfast950 ], [ %t3186, %fixslow951 ]
  %t3188 = call i64 @rt_string_ref(i64 %a0, i64 %t3187)
  %t3189 = call i64 @rt_char_to_integer(i64 %t3188)
  %t3190 = or i64 %t3189, 448
  %t3191 = and i64 %t3190, 7
  %t3192 = icmp eq i64 %t3191, 0
  br i1 %t3192, label %fixfast953, label %fixslow954
fixfast953:
  %t3193 = icmp eq i64 %t3189, 448
  %t3194 = select i1 %t3193, i64 257, i64 1
  br label %fixmerge955
fixslow954:
  %t3195 = call i64 @rt_num_eq(i64 %t3189, i64 448)
  br label %fixmerge955
fixmerge955:
  %t3196 = phi i64 [ %t3194, %fixfast953 ], [ %t3195, %fixslow954 ]
  %t3197 = icmp ne i64 %t3196, 1
  br i1 %t3197, label %then956, label %else957
then956:
  %t3198 = or i64 %a2, 16
  %t3199 = and i64 %t3198, 7
  %t3200 = icmp eq i64 %t3199, 0
  br i1 %t3200, label %fixfast959, label %fixslow960
fixfast959:
  %t3201 = add i64 %a2, 16
  br label %fixmerge961
fixslow960:
  %t3202 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge961
fixmerge961:
  %t3203 = phi i64 [ %t3201, %fixfast959 ], [ %t3202, %fixslow960 ]
  %t3204 = call i64 @rt_string_ref(i64 %a0, i64 %t3203)
  %t3205 = call i64 @rt_char_to_integer(i64 %t3204)
  %t3206 = or i64 %t3205, 320
  %t3207 = and i64 %t3206, 7
  %t3208 = icmp eq i64 %t3207, 0
  br i1 %t3208, label %fixfast962, label %fixslow963
fixfast962:
  %t3209 = icmp eq i64 %t3205, 320
  %t3210 = select i1 %t3209, i64 257, i64 1
  br label %fixmerge964
fixslow963:
  %t3211 = call i64 @rt_num_eq(i64 %t3205, i64 320)
  br label %fixmerge964
fixmerge964:
  %t3212 = phi i64 [ %t3210, %fixfast962 ], [ %t3211, %fixslow963 ]
  br label %merge958
else957:
  br label %merge958
merge958:
  %t3213 = phi i64 [ %t3212, %fixmerge964 ], [ 1, %else957 ]
  br label %merge949
else948:
  br label %merge949
merge949:
  %t3214 = phi i64 [ %t3213, %merge958 ], [ 1, %else948 ]
  br label %merge940
else939:
  br label %merge940
merge940:
  %t3215 = phi i64 [ %t3214, %merge949 ], [ 1, %else939 ]
  %t3216 = icmp ne i64 %t3215, 1
  br i1 %t3216, label %then965, label %else966
then965:
  %t3217 = or i64 %a2, 24
  %t3218 = and i64 %t3217, 7
  %t3219 = icmp eq i64 %t3218, 0
  br i1 %t3219, label %fixfast967, label %fixslow968
fixfast967:
  %t3220 = add i64 %a2, 24
  br label %fixmerge969
fixslow968:
  %t3221 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge969
fixmerge969:
  %t3222 = phi i64 [ %t3220, %fixfast967 ], [ %t3221, %fixslow968 ]
  %t3223 = load i64, ptr @"scheme.base:rd-list"
  %t3224 = and i64 %t3223, -8
  %t3225 = inttoptr i64 %t3224 to ptr
  %t3226 = load i64, ptr %t3225
  %t3227 = inttoptr i64 %t3226 to ptr
  %t3228 = call fastcc i64%t3227(i64 %t3223, i64 4, i64 %a0, i64 %a1, i64 %t3222, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3229 = call i64 @rt_car(i64 %t3228)
  %t3230 = load i64, ptr @"scheme.base:list->bytevector"
  %t3231 = and i64 %t3230, -8
  %t3232 = inttoptr i64 %t3231 to ptr
  %t3233 = load i64, ptr %t3232
  %t3234 = inttoptr i64 %t3233 to ptr
  %t3235 = call fastcc i64%t3234(i64 %t3230, i64 1, i64 %t3229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3236 = call i64 @rt_cdr(i64 %t3228)
  %t3237 = call i64 @rt_cons(i64 %t3235, i64 %t3236)
  ret i64 %t3237
else966:
  %t3238 = load i64, ptr @"scheme.base:rd-token-end"
  %t3239 = and i64 %t3238, -8
  %t3240 = inttoptr i64 %t3239 to ptr
  %t3241 = load i64, ptr %t3240
  %t3242 = inttoptr i64 %t3241 to ptr
  %t3243 = call fastcc i64%t3242(i64 %t3238, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3244 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3243)
  %t3245 = call i64 @rt_string_to_symbol(i64 %t3244)
  %t3246 = call i64 @rt_cons(i64 %t3245, i64 %t3243)
  ret i64 %t3246
}

define fastcc i64 @"scheme.base:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3251 = icmp eq i64 %argc, 1
  br i1 %t3251, label %argok971, label %arityerr970
arityerr970:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok971:
  %t3252 = call i64 @rt_make_string(ptr @.str.lit.4, i64 5)
  %t3253 = call i64 @rt_string_eq(i64 %a0, i64 %t3252)
  %t3254 = icmp ne i64 %t3253, 1
  br i1 %t3254, label %then972, label %else973
then972:
  %t3255 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3255
else973:
  %t3256 = call i64 @rt_make_string(ptr @.str.lit.5, i64 7)
  %t3257 = call i64 @rt_string_eq(i64 %a0, i64 %t3256)
  %t3258 = icmp ne i64 %t3257, 1
  br i1 %t3258, label %then974, label %else975
then974:
  %t3259 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3259
else975:
  %t3260 = call i64 @rt_make_string(ptr @.str.lit.6, i64 3)
  %t3261 = call i64 @rt_string_eq(i64 %a0, i64 %t3260)
  %t3262 = icmp ne i64 %t3261, 1
  br i1 %t3262, label %then976, label %else977
then976:
  %t3263 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3263
else977:
  %t3264 = call i64 @rt_make_string(ptr @.str.lit.7, i64 6)
  %t3265 = call i64 @rt_string_eq(i64 %a0, i64 %t3264)
  %t3266 = icmp ne i64 %t3265, 1
  br i1 %t3266, label %then978, label %else979
then978:
  %t3267 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3267
else979:
  %t3268 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t3269 = call i64 @rt_string_eq(i64 %a0, i64 %t3268)
  %t3270 = icmp ne i64 %t3269, 1
  br i1 %t3270, label %then980, label %else981
then980:
  %t3271 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3271
else981:
  %t3272 = call i64 @rt_make_string(ptr @.str.lit.9, i64 4)
  %t3273 = call i64 @rt_string_eq(i64 %a0, i64 %t3272)
  %t3274 = icmp ne i64 %t3273, 1
  br i1 %t3274, label %then982, label %else983
then982:
  %t3275 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3275
else983:
  %t3276 = call i64 @rt_make_string(ptr @.str.lit.10, i64 6)
  %t3277 = call i64 @rt_string_eq(i64 %a0, i64 %t3276)
  %t3278 = icmp ne i64 %t3277, 1
  br i1 %t3278, label %then984, label %else985
then984:
  %t3279 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3279
else985:
  %t3280 = call i64 @rt_make_string(ptr @.str.lit.11, i64 7)
  %t3281 = call i64 @rt_string_eq(i64 %a0, i64 %t3280)
  %t3282 = icmp ne i64 %t3281, 1
  br i1 %t3282, label %then986, label %else987
then986:
  %t3283 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3283
else987:
  %t3284 = call i64 @rt_make_string(ptr @.str.lit.12, i64 3)
  %t3285 = call i64 @rt_string_eq(i64 %a0, i64 %t3284)
  %t3286 = icmp ne i64 %t3285, 1
  br i1 %t3286, label %then988, label %else989
then988:
  %t3287 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3287
else989:
  %t3288 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3288
}

define fastcc i64 @"scheme.base:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3293 = icmp eq i64 %argc, 3
  br i1 %t3293, label %argok991, label %arityerr990
arityerr990:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok991:
  %t3294 = or i64 %a2, 8
  %t3295 = and i64 %t3294, 7
  %t3296 = icmp eq i64 %t3295, 0
  br i1 %t3296, label %fixfast992, label %fixslow993
fixfast992:
  %t3297 = add i64 %a2, 8
  br label %fixmerge994
fixslow993:
  %t3298 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge994
fixmerge994:
  %t3299 = phi i64 [ %t3297, %fixfast992 ], [ %t3298, %fixslow993 ]
  %t3300 = or i64 %t3299, 8
  %t3301 = and i64 %t3300, 7
  %t3302 = icmp eq i64 %t3301, 0
  br i1 %t3302, label %fixfast995, label %fixslow996
fixfast995:
  %t3303 = add i64 %t3299, 8
  br label %fixmerge997
fixslow996:
  %t3304 = call i64 @rt_add(i64 %t3299, i64 8)
  br label %fixmerge997
fixmerge997:
  %t3305 = phi i64 [ %t3303, %fixfast995 ], [ %t3304, %fixslow996 ]
  %t3306 = load i64, ptr @"scheme.base:rd-token-end"
  %t3307 = and i64 %t3306, -8
  %t3308 = inttoptr i64 %t3307 to ptr
  %t3309 = load i64, ptr %t3308
  %t3310 = inttoptr i64 %t3309 to ptr
  %t3311 = call fastcc i64%t3310(i64 %t3306, i64 3, i64 %a0, i64 %a1, i64 %t3305, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3312 = call i64 @rt_substring(i64 %a0, i64 %t3299, i64 %t3311)
  %t3313 = call i64 @rt_string_length(i64 %t3312)
  %t3314 = or i64 %t3313, 8
  %t3315 = and i64 %t3314, 7
  %t3316 = icmp eq i64 %t3315, 0
  br i1 %t3316, label %fixfast998, label %fixslow999
fixfast998:
  %t3317 = icmp eq i64 %t3313, 8
  %t3318 = select i1 %t3317, i64 257, i64 1
  br label %fixmerge1000
fixslow999:
  %t3319 = call i64 @rt_num_eq(i64 %t3313, i64 8)
  br label %fixmerge1000
fixmerge1000:
  %t3320 = phi i64 [ %t3318, %fixfast998 ], [ %t3319, %fixslow999 ]
  %t3321 = icmp ne i64 %t3320, 1
  br i1 %t3321, label %then1001, label %else1002
then1001:
  %t3322 = call i64 @rt_string_ref(i64 %a0, i64 %t3299)
  %t3323 = call i64 @rt_cons(i64 %t3322, i64 %t3311)
  ret i64 %t3323
else1002:
  %t3324 = load i64, ptr @"scheme.base:rd-char-name"
  %t3325 = and i64 %t3324, -8
  %t3326 = inttoptr i64 %t3325 to ptr
  %t3327 = load i64, ptr %t3326
  %t3328 = inttoptr i64 %t3327 to ptr
  %t3329 = call fastcc i64%t3328(i64 %t3324, i64 1, i64 %t3312, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3330 = call i64 @rt_cons(i64 %t3329, i64 %t3311)
  ret i64 %t3330
}

define fastcc i64 @"scheme.base:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3335 = icmp eq i64 %argc, 3
  br i1 %t3335, label %argok1004, label %arityerr1003
arityerr1003:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1004:
  %t3336 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3337 = and i64 %t3336, -8
  %t3338 = inttoptr i64 %t3337 to ptr
  %t3339 = load i64, ptr %t3338
  %t3340 = inttoptr i64 %t3339 to ptr
  %t3341 = call fastcc i64%t3340(i64 %t3336, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3342 = load i64, ptr @"scheme.base:rd-datum"
  %t3343 = and i64 %t3342, -8
  %t3344 = inttoptr i64 %t3343 to ptr
  %t3345 = load i64, ptr %t3344
  %t3346 = inttoptr i64 %t3345 to ptr
  %t3347 = call fastcc i64%t3346(i64 %t3342, i64 3, i64 %a0, i64 %a1, i64 %t3341, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3348 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3349 = call i64 @rt_car(i64 %t3347)
  %t3350 = load i64, ptr @"scheme.base:list"
  %t3351 = and i64 %t3350, -8
  %t3352 = inttoptr i64 %t3351 to ptr
  %t3353 = load i64, ptr %t3352
  %t3354 = inttoptr i64 %t3353 to ptr
  %t3355 = call fastcc i64%t3354(i64 %t3350, i64 2, i64 %t3348, i64 %t3349, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3356 = call i64 @rt_cdr(i64 %t3347)
  %t3357 = call i64 @rt_cons(i64 %t3355, i64 %t3356)
  ret i64 %t3357
}

define fastcc i64 @"scheme.base:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3362 = icmp eq i64 %argc, 3
  br i1 %t3362, label %argok1006, label %arityerr1005
arityerr1005:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1006:
  %t3363 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3364 = and i64 %t3363, -8
  %t3365 = inttoptr i64 %t3364 to ptr
  %t3366 = load i64, ptr %t3365
  %t3367 = inttoptr i64 %t3366 to ptr
  %t3368 = call fastcc i64%t3367(i64 %t3363, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3369 = load i64, ptr @"scheme.base:rd-datum"
  %t3370 = and i64 %t3369, -8
  %t3371 = inttoptr i64 %t3370 to ptr
  %t3372 = load i64, ptr %t3371
  %t3373 = inttoptr i64 %t3372 to ptr
  %t3374 = call fastcc i64%t3373(i64 %t3369, i64 3, i64 %a0, i64 %a1, i64 %t3368, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3375 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3376 = call i64 @rt_car(i64 %t3374)
  %t3377 = load i64, ptr @"scheme.base:list"
  %t3378 = and i64 %t3377, -8
  %t3379 = inttoptr i64 %t3378 to ptr
  %t3380 = load i64, ptr %t3379
  %t3381 = inttoptr i64 %t3380 to ptr
  %t3382 = call fastcc i64%t3381(i64 %t3377, i64 2, i64 %t3375, i64 %t3376, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3383 = call i64 @rt_cdr(i64 %t3374)
  %t3384 = call i64 @rt_cons(i64 %t3382, i64 %t3383)
  ret i64 %t3384
}

define fastcc i64 @"scheme.base:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3389 = icmp eq i64 %argc, 3
  br i1 %t3389, label %argok1008, label %arityerr1007
arityerr1007:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1008:
  %t3390 = or i64 %a2, %a1
  %t3391 = and i64 %t3390, 7
  %t3392 = icmp eq i64 %t3391, 0
  br i1 %t3392, label %fixfast1009, label %fixslow1010
fixfast1009:
  %t3393 = icmp slt i64 %a2, %a1
  %t3394 = select i1 %t3393, i64 257, i64 1
  br label %fixmerge1011
fixslow1010:
  %t3395 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1011
fixmerge1011:
  %t3396 = phi i64 [ %t3394, %fixfast1009 ], [ %t3395, %fixslow1010 ]
  %t3397 = icmp ne i64 %t3396, 1
  br i1 %t3397, label %then1012, label %else1013
then1012:
  %t3398 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3399 = call i64 @rt_char_to_integer(i64 %t3398)
  %t3400 = or i64 %t3399, 512
  %t3401 = and i64 %t3400, 7
  %t3402 = icmp eq i64 %t3401, 0
  br i1 %t3402, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t3403 = icmp eq i64 %t3399, 512
  %t3404 = select i1 %t3403, i64 257, i64 1
  br label %fixmerge1017
fixslow1016:
  %t3405 = call i64 @rt_num_eq(i64 %t3399, i64 512)
  br label %fixmerge1017
fixmerge1017:
  %t3406 = phi i64 [ %t3404, %fixfast1015 ], [ %t3405, %fixslow1016 ]
  br label %merge1014
else1013:
  br label %merge1014
merge1014:
  %t3407 = phi i64 [ %t3406, %fixmerge1017 ], [ 1, %else1013 ]
  %t3408 = icmp ne i64 %t3407, 1
  br i1 %t3408, label %then1018, label %else1019
then1018:
  %t3409 = or i64 %a2, 8
  %t3410 = and i64 %t3409, 7
  %t3411 = icmp eq i64 %t3410, 0
  br i1 %t3411, label %fixfast1020, label %fixslow1021
fixfast1020:
  %t3412 = add i64 %a2, 8
  br label %fixmerge1022
fixslow1021:
  %t3413 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1022
fixmerge1022:
  %t3414 = phi i64 [ %t3412, %fixfast1020 ], [ %t3413, %fixslow1021 ]
  %t3415 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3416 = and i64 %t3415, -8
  %t3417 = inttoptr i64 %t3416 to ptr
  %t3418 = load i64, ptr %t3417
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = call fastcc i64%t3419(i64 %t3415, i64 3, i64 %a0, i64 %a1, i64 %t3414, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3421 = load i64, ptr @"scheme.base:rd-datum"
  %t3422 = and i64 %t3421, -8
  %t3423 = inttoptr i64 %t3422 to ptr
  %t3424 = load i64, ptr %t3423
  %t3425 = inttoptr i64 %t3424 to ptr
  %t3426 = call fastcc i64%t3425(i64 %t3421, i64 3, i64 %a0, i64 %a1, i64 %t3420, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3427 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3428 = call i64 @rt_car(i64 %t3426)
  %t3429 = load i64, ptr @"scheme.base:list"
  %t3430 = and i64 %t3429, -8
  %t3431 = inttoptr i64 %t3430 to ptr
  %t3432 = load i64, ptr %t3431
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = call fastcc i64%t3433(i64 %t3429, i64 2, i64 %t3427, i64 %t3428, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3435 = call i64 @rt_cdr(i64 %t3426)
  %t3436 = call i64 @rt_cons(i64 %t3434, i64 %t3435)
  ret i64 %t3436
else1019:
  %t3437 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3438 = and i64 %t3437, -8
  %t3439 = inttoptr i64 %t3438 to ptr
  %t3440 = load i64, ptr %t3439
  %t3441 = inttoptr i64 %t3440 to ptr
  %t3442 = call fastcc i64%t3441(i64 %t3437, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3443 = load i64, ptr @"scheme.base:rd-datum"
  %t3444 = and i64 %t3443, -8
  %t3445 = inttoptr i64 %t3444 to ptr
  %t3446 = load i64, ptr %t3445
  %t3447 = inttoptr i64 %t3446 to ptr
  %t3448 = call fastcc i64%t3447(i64 %t3443, i64 3, i64 %a0, i64 %a1, i64 %t3442, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3449 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3450 = call i64 @rt_car(i64 %t3448)
  %t3451 = load i64, ptr @"scheme.base:list"
  %t3452 = and i64 %t3451, -8
  %t3453 = inttoptr i64 %t3452 to ptr
  %t3454 = load i64, ptr %t3453
  %t3455 = inttoptr i64 %t3454 to ptr
  %t3456 = call fastcc i64%t3455(i64 %t3451, i64 2, i64 %t3449, i64 %t3450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3457 = call i64 @rt_cdr(i64 %t3448)
  %t3458 = call i64 @rt_cons(i64 %t3456, i64 %t3457)
  ret i64 %t3458
}

define fastcc i64 @"scheme.base:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3463 = icmp eq i64 %argc, 3
  br i1 %t3463, label %argok1024, label %arityerr1023
arityerr1023:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1024:
  %t3464 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3465 = call i64 @rt_char_to_integer(i64 %t3464)
  %t3466 = or i64 %t3465, 368
  %t3467 = and i64 %t3466, 7
  %t3468 = icmp eq i64 %t3467, 0
  br i1 %t3468, label %fixfast1025, label %fixslow1026
fixfast1025:
  %t3469 = icmp eq i64 %t3465, 368
  %t3470 = select i1 %t3469, i64 257, i64 1
  br label %fixmerge1027
fixslow1026:
  %t3471 = call i64 @rt_num_eq(i64 %t3465, i64 368)
  br label %fixmerge1027
fixmerge1027:
  %t3472 = phi i64 [ %t3470, %fixfast1025 ], [ %t3471, %fixslow1026 ]
  %t3473 = icmp ne i64 %t3472, 1
  br i1 %t3473, label %then1028, label %else1029
then1028:
  %t3474 = or i64 %a2, 8
  %t3475 = and i64 %t3474, 7
  %t3476 = icmp eq i64 %t3475, 0
  br i1 %t3476, label %fixfast1030, label %fixslow1031
fixfast1030:
  %t3477 = add i64 %a2, 8
  br label %fixmerge1032
fixslow1031:
  %t3478 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1032
fixmerge1032:
  %t3479 = phi i64 [ %t3477, %fixfast1030 ], [ %t3478, %fixslow1031 ]
  %t3480 = load i64, ptr @"scheme.base:rd-token-end"
  %t3481 = and i64 %t3480, -8
  %t3482 = inttoptr i64 %t3481 to ptr
  %t3483 = load i64, ptr %t3482
  %t3484 = inttoptr i64 %t3483 to ptr
  %t3485 = call fastcc i64%t3484(i64 %t3480, i64 3, i64 %a0, i64 %a1, i64 %t3479, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3486 = or i64 %a2, 8
  %t3487 = and i64 %t3486, 7
  %t3488 = icmp eq i64 %t3487, 0
  br i1 %t3488, label %fixfast1033, label %fixslow1034
fixfast1033:
  %t3489 = add i64 %a2, 8
  br label %fixmerge1035
fixslow1034:
  %t3490 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1035
fixmerge1035:
  %t3491 = phi i64 [ %t3489, %fixfast1033 ], [ %t3490, %fixslow1034 ]
  %t3492 = or i64 %t3485, %t3491
  %t3493 = and i64 %t3492, 7
  %t3494 = icmp eq i64 %t3493, 0
  br i1 %t3494, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t3495 = icmp eq i64 %t3485, %t3491
  %t3496 = select i1 %t3495, i64 257, i64 1
  br label %fixmerge1038
fixslow1037:
  %t3497 = call i64 @rt_num_eq(i64 %t3485, i64 %t3491)
  br label %fixmerge1038
fixmerge1038:
  %t3498 = phi i64 [ %t3496, %fixfast1036 ], [ %t3497, %fixslow1037 ]
  ret i64 %t3498
else1029:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3503 = icmp eq i64 %argc, 2
  br i1 %t3503, label %argok1040, label %arityerr1039
arityerr1039:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1040:
  %t3504 = call i64 @rt_null_p(i64 %a0)
  %t3505 = icmp ne i64 %t3504, 1
  br i1 %t3505, label %then1041, label %else1042
then1041:
  ret i64 %a1
else1042:
  %t3506 = call i64 @rt_cdr(i64 %a0)
  %t3507 = call i64 @rt_car(i64 %a0)
  %t3508 = call i64 @rt_cons(i64 %t3507, i64 %a1)
  %t3509 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3510 = and i64 %t3509, -8
  %t3511 = inttoptr i64 %t3510 to ptr
  %t3512 = load i64, ptr %t3511
  %t3513 = inttoptr i64 %t3512 to ptr
  %t3514 = musttail call fastcc i64 %t3513(i64 %t3509, i64 2, i64 %t3506, i64 %t3508, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3514
}

define fastcc i64 @"scheme.base:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3519 = icmp eq i64 %argc, 4
  br i1 %t3519, label %argok1044, label %arityerr1043
arityerr1043:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1044:
  %t3520 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3521 = and i64 %t3520, -8
  %t3522 = inttoptr i64 %t3521 to ptr
  %t3523 = load i64, ptr %t3522
  %t3524 = inttoptr i64 %t3523 to ptr
  %t3525 = call fastcc i64%t3524(i64 %t3520, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3526 = or i64 %t3525, %a1
  %t3527 = and i64 %t3526, 7
  %t3528 = icmp eq i64 %t3527, 0
  br i1 %t3528, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t3529 = icmp slt i64 %t3525, %a1
  %t3530 = select i1 %t3529, i64 257, i64 1
  br label %fixmerge1047
fixslow1046:
  %t3531 = call i64 @rt_lt(i64 %t3525, i64 %a1)
  br label %fixmerge1047
fixmerge1047:
  %t3532 = phi i64 [ %t3530, %fixfast1045 ], [ %t3531, %fixslow1046 ]
  %t3533 = icmp ne i64 %t3532, 1
  br i1 %t3533, label %then1048, label %else1049
then1048:
  %t3534 = call i64 @rt_string_ref(i64 %a0, i64 %t3525)
  %t3535 = call i64 @rt_char_to_integer(i64 %t3534)
  %t3536 = or i64 %t3535, 328
  %t3537 = and i64 %t3536, 7
  %t3538 = icmp eq i64 %t3537, 0
  br i1 %t3538, label %fixfast1050, label %fixslow1051
fixfast1050:
  %t3539 = icmp eq i64 %t3535, 328
  %t3540 = select i1 %t3539, i64 257, i64 1
  br label %fixmerge1052
fixslow1051:
  %t3541 = call i64 @rt_num_eq(i64 %t3535, i64 328)
  br label %fixmerge1052
fixmerge1052:
  %t3542 = phi i64 [ %t3540, %fixfast1050 ], [ %t3541, %fixslow1051 ]
  %t3543 = icmp ne i64 %t3542, 1
  br i1 %t3543, label %then1053, label %else1054
then1053:
  br label %merge1055
else1054:
  %t3544 = or i64 %t3535, 744
  %t3545 = and i64 %t3544, 7
  %t3546 = icmp eq i64 %t3545, 0
  br i1 %t3546, label %fixfast1056, label %fixslow1057
fixfast1056:
  %t3547 = icmp eq i64 %t3535, 744
  %t3548 = select i1 %t3547, i64 257, i64 1
  br label %fixmerge1058
fixslow1057:
  %t3549 = call i64 @rt_num_eq(i64 %t3535, i64 744)
  br label %fixmerge1058
fixmerge1058:
  %t3550 = phi i64 [ %t3548, %fixfast1056 ], [ %t3549, %fixslow1057 ]
  br label %merge1055
merge1055:
  %t3551 = phi i64 [ %t3542, %then1053 ], [ %t3550, %fixmerge1058 ]
  %t3552 = icmp ne i64 %t3551, 1
  br i1 %t3552, label %then1059, label %else1060
then1059:
  %t3553 = load i64, ptr @"scheme.base:reverse"
  %t3554 = and i64 %t3553, -8
  %t3555 = inttoptr i64 %t3554 to ptr
  %t3556 = load i64, ptr %t3555
  %t3557 = inttoptr i64 %t3556 to ptr
  %t3558 = call fastcc i64%t3557(i64 %t3553, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3559 = or i64 %t3525, 8
  %t3560 = and i64 %t3559, 7
  %t3561 = icmp eq i64 %t3560, 0
  br i1 %t3561, label %fixfast1061, label %fixslow1062
fixfast1061:
  %t3562 = add i64 %t3525, 8
  br label %fixmerge1063
fixslow1062:
  %t3563 = call i64 @rt_add(i64 %t3525, i64 8)
  br label %fixmerge1063
fixmerge1063:
  %t3564 = phi i64 [ %t3562, %fixfast1061 ], [ %t3563, %fixslow1062 ]
  %t3565 = call i64 @rt_cons(i64 %t3558, i64 %t3564)
  ret i64 %t3565
else1060:
  %t3566 = load i64, ptr @"scheme.base:rd-dot?"
  %t3567 = and i64 %t3566, -8
  %t3568 = inttoptr i64 %t3567 to ptr
  %t3569 = load i64, ptr %t3568
  %t3570 = inttoptr i64 %t3569 to ptr
  %t3571 = call fastcc i64%t3570(i64 %t3566, i64 3, i64 %a0, i64 %a1, i64 %t3525, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3572 = icmp ne i64 %t3571, 1
  br i1 %t3572, label %then1064, label %else1065
then1064:
  %t3573 = or i64 %t3525, 8
  %t3574 = and i64 %t3573, 7
  %t3575 = icmp eq i64 %t3574, 0
  br i1 %t3575, label %fixfast1066, label %fixslow1067
fixfast1066:
  %t3576 = add i64 %t3525, 8
  br label %fixmerge1068
fixslow1067:
  %t3577 = call i64 @rt_add(i64 %t3525, i64 8)
  br label %fixmerge1068
fixmerge1068:
  %t3578 = phi i64 [ %t3576, %fixfast1066 ], [ %t3577, %fixslow1067 ]
  %t3579 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3580 = and i64 %t3579, -8
  %t3581 = inttoptr i64 %t3580 to ptr
  %t3582 = load i64, ptr %t3581
  %t3583 = inttoptr i64 %t3582 to ptr
  %t3584 = call fastcc i64%t3583(i64 %t3579, i64 3, i64 %a0, i64 %a1, i64 %t3578, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3585 = load i64, ptr @"scheme.base:rd-datum"
  %t3586 = and i64 %t3585, -8
  %t3587 = inttoptr i64 %t3586 to ptr
  %t3588 = load i64, ptr %t3587
  %t3589 = inttoptr i64 %t3588 to ptr
  %t3590 = call fastcc i64%t3589(i64 %t3585, i64 3, i64 %a0, i64 %a1, i64 %t3584, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3591 = call i64 @rt_cdr(i64 %t3590)
  %t3592 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3593 = and i64 %t3592, -8
  %t3594 = inttoptr i64 %t3593 to ptr
  %t3595 = load i64, ptr %t3594
  %t3596 = inttoptr i64 %t3595 to ptr
  %t3597 = call fastcc i64%t3596(i64 %t3592, i64 3, i64 %a0, i64 %a1, i64 %t3591, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3598 = call i64 @rt_car(i64 %t3590)
  %t3599 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3600 = and i64 %t3599, -8
  %t3601 = inttoptr i64 %t3600 to ptr
  %t3602 = load i64, ptr %t3601
  %t3603 = inttoptr i64 %t3602 to ptr
  %t3604 = call fastcc i64%t3603(i64 %t3599, i64 2, i64 %a3, i64 %t3598, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3605 = or i64 %t3597, 8
  %t3606 = and i64 %t3605, 7
  %t3607 = icmp eq i64 %t3606, 0
  br i1 %t3607, label %fixfast1069, label %fixslow1070
fixfast1069:
  %t3608 = add i64 %t3597, 8
  br label %fixmerge1071
fixslow1070:
  %t3609 = call i64 @rt_add(i64 %t3597, i64 8)
  br label %fixmerge1071
fixmerge1071:
  %t3610 = phi i64 [ %t3608, %fixfast1069 ], [ %t3609, %fixslow1070 ]
  %t3611 = call i64 @rt_cons(i64 %t3604, i64 %t3610)
  ret i64 %t3611
else1065:
  %t3612 = load i64, ptr @"scheme.base:rd-datum"
  %t3613 = and i64 %t3612, -8
  %t3614 = inttoptr i64 %t3613 to ptr
  %t3615 = load i64, ptr %t3614
  %t3616 = inttoptr i64 %t3615 to ptr
  %t3617 = call fastcc i64%t3616(i64 %t3612, i64 3, i64 %a0, i64 %a1, i64 %t3525, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3618 = call i64 @rt_cdr(i64 %t3617)
  %t3619 = call i64 @rt_car(i64 %t3617)
  %t3620 = call i64 @rt_cons(i64 %t3619, i64 %a3)
  %t3621 = load i64, ptr @"scheme.base:rd-list"
  %t3622 = and i64 %t3621, -8
  %t3623 = inttoptr i64 %t3622 to ptr
  %t3624 = load i64, ptr %t3623
  %t3625 = inttoptr i64 %t3624 to ptr
  %t3626 = musttail call fastcc i64 %t3625(i64 %t3621, i64 4, i64 %a0, i64 %a1, i64 %t3618, i64 %t3620, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3626
else1049:
  %t3627 = load i64, ptr @"scheme.base:reverse"
  %t3628 = and i64 %t3627, -8
  %t3629 = inttoptr i64 %t3628 to ptr
  %t3630 = load i64, ptr %t3629
  %t3631 = inttoptr i64 %t3630 to ptr
  %t3632 = call fastcc i64%t3631(i64 %t3627, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3633 = call i64 @rt_cons(i64 %t3632, i64 %t3525)
  ret i64 %t3633
}

define fastcc i64 @"scheme.base:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3638 = icmp eq i64 %argc, 3
  br i1 %t3638, label %argok1073, label %arityerr1072
arityerr1072:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1073:
  %t3639 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3640 = call i64 @rt_char_to_integer(i64 %t3639)
  %t3641 = or i64 %t3640, 320
  %t3642 = and i64 %t3641, 7
  %t3643 = icmp eq i64 %t3642, 0
  br i1 %t3643, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t3644 = icmp eq i64 %t3640, 320
  %t3645 = select i1 %t3644, i64 257, i64 1
  br label %fixmerge1076
fixslow1075:
  %t3646 = call i64 @rt_num_eq(i64 %t3640, i64 320)
  br label %fixmerge1076
fixmerge1076:
  %t3647 = phi i64 [ %t3645, %fixfast1074 ], [ %t3646, %fixslow1075 ]
  %t3648 = icmp ne i64 %t3647, 1
  br i1 %t3648, label %then1077, label %else1078
then1077:
  %t3649 = or i64 %a2, 8
  %t3650 = and i64 %t3649, 7
  %t3651 = icmp eq i64 %t3650, 0
  br i1 %t3651, label %fixfast1079, label %fixslow1080
fixfast1079:
  %t3652 = add i64 %a2, 8
  br label %fixmerge1081
fixslow1080:
  %t3653 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1081
fixmerge1081:
  %t3654 = phi i64 [ %t3652, %fixfast1079 ], [ %t3653, %fixslow1080 ]
  %t3655 = load i64, ptr @"scheme.base:rd-list"
  %t3656 = and i64 %t3655, -8
  %t3657 = inttoptr i64 %t3656 to ptr
  %t3658 = load i64, ptr %t3657
  %t3659 = inttoptr i64 %t3658 to ptr
  %t3660 = musttail call fastcc i64 %t3659(i64 %t3655, i64 4, i64 %a0, i64 %a1, i64 %t3654, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3660
else1078:
  %t3661 = or i64 %t3640, 728
  %t3662 = and i64 %t3661, 7
  %t3663 = icmp eq i64 %t3662, 0
  br i1 %t3663, label %fixfast1082, label %fixslow1083
fixfast1082:
  %t3664 = icmp eq i64 %t3640, 728
  %t3665 = select i1 %t3664, i64 257, i64 1
  br label %fixmerge1084
fixslow1083:
  %t3666 = call i64 @rt_num_eq(i64 %t3640, i64 728)
  br label %fixmerge1084
fixmerge1084:
  %t3667 = phi i64 [ %t3665, %fixfast1082 ], [ %t3666, %fixslow1083 ]
  %t3668 = icmp ne i64 %t3667, 1
  br i1 %t3668, label %then1085, label %else1086
then1085:
  %t3669 = or i64 %a2, 8
  %t3670 = and i64 %t3669, 7
  %t3671 = icmp eq i64 %t3670, 0
  br i1 %t3671, label %fixfast1087, label %fixslow1088
fixfast1087:
  %t3672 = add i64 %a2, 8
  br label %fixmerge1089
fixslow1088:
  %t3673 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1089
fixmerge1089:
  %t3674 = phi i64 [ %t3672, %fixfast1087 ], [ %t3673, %fixslow1088 ]
  %t3675 = load i64, ptr @"scheme.base:rd-list"
  %t3676 = and i64 %t3675, -8
  %t3677 = inttoptr i64 %t3676 to ptr
  %t3678 = load i64, ptr %t3677
  %t3679 = inttoptr i64 %t3678 to ptr
  %t3680 = musttail call fastcc i64 %t3679(i64 %t3675, i64 4, i64 %a0, i64 %a1, i64 %t3674, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3680
else1086:
  %t3681 = or i64 %t3640, 312
  %t3682 = and i64 %t3681, 7
  %t3683 = icmp eq i64 %t3682, 0
  br i1 %t3683, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t3684 = icmp eq i64 %t3640, 312
  %t3685 = select i1 %t3684, i64 257, i64 1
  br label %fixmerge1092
fixslow1091:
  %t3686 = call i64 @rt_num_eq(i64 %t3640, i64 312)
  br label %fixmerge1092
fixmerge1092:
  %t3687 = phi i64 [ %t3685, %fixfast1090 ], [ %t3686, %fixslow1091 ]
  %t3688 = icmp ne i64 %t3687, 1
  br i1 %t3688, label %then1093, label %else1094
then1093:
  %t3689 = or i64 %a2, 8
  %t3690 = and i64 %t3689, 7
  %t3691 = icmp eq i64 %t3690, 0
  br i1 %t3691, label %fixfast1095, label %fixslow1096
fixfast1095:
  %t3692 = add i64 %a2, 8
  br label %fixmerge1097
fixslow1096:
  %t3693 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1097
fixmerge1097:
  %t3694 = phi i64 [ %t3692, %fixfast1095 ], [ %t3693, %fixslow1096 ]
  %t3695 = load i64, ptr @"scheme.base:rd-quote"
  %t3696 = and i64 %t3695, -8
  %t3697 = inttoptr i64 %t3696 to ptr
  %t3698 = load i64, ptr %t3697
  %t3699 = inttoptr i64 %t3698 to ptr
  %t3700 = musttail call fastcc i64 %t3699(i64 %t3695, i64 3, i64 %a0, i64 %a1, i64 %t3694, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3700
else1094:
  %t3701 = or i64 %t3640, 768
  %t3702 = and i64 %t3701, 7
  %t3703 = icmp eq i64 %t3702, 0
  br i1 %t3703, label %fixfast1098, label %fixslow1099
fixfast1098:
  %t3704 = icmp eq i64 %t3640, 768
  %t3705 = select i1 %t3704, i64 257, i64 1
  br label %fixmerge1100
fixslow1099:
  %t3706 = call i64 @rt_num_eq(i64 %t3640, i64 768)
  br label %fixmerge1100
fixmerge1100:
  %t3707 = phi i64 [ %t3705, %fixfast1098 ], [ %t3706, %fixslow1099 ]
  %t3708 = icmp ne i64 %t3707, 1
  br i1 %t3708, label %then1101, label %else1102
then1101:
  %t3709 = or i64 %a2, 8
  %t3710 = and i64 %t3709, 7
  %t3711 = icmp eq i64 %t3710, 0
  br i1 %t3711, label %fixfast1103, label %fixslow1104
fixfast1103:
  %t3712 = add i64 %a2, 8
  br label %fixmerge1105
fixslow1104:
  %t3713 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1105
fixmerge1105:
  %t3714 = phi i64 [ %t3712, %fixfast1103 ], [ %t3713, %fixslow1104 ]
  %t3715 = load i64, ptr @"scheme.base:rd-quasi"
  %t3716 = and i64 %t3715, -8
  %t3717 = inttoptr i64 %t3716 to ptr
  %t3718 = load i64, ptr %t3717
  %t3719 = inttoptr i64 %t3718 to ptr
  %t3720 = musttail call fastcc i64 %t3719(i64 %t3715, i64 3, i64 %a0, i64 %a1, i64 %t3714, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3720
else1102:
  %t3721 = or i64 %t3640, 352
  %t3722 = and i64 %t3721, 7
  %t3723 = icmp eq i64 %t3722, 0
  br i1 %t3723, label %fixfast1106, label %fixslow1107
fixfast1106:
  %t3724 = icmp eq i64 %t3640, 352
  %t3725 = select i1 %t3724, i64 257, i64 1
  br label %fixmerge1108
fixslow1107:
  %t3726 = call i64 @rt_num_eq(i64 %t3640, i64 352)
  br label %fixmerge1108
fixmerge1108:
  %t3727 = phi i64 [ %t3725, %fixfast1106 ], [ %t3726, %fixslow1107 ]
  %t3728 = icmp ne i64 %t3727, 1
  br i1 %t3728, label %then1109, label %else1110
then1109:
  %t3729 = or i64 %a2, 8
  %t3730 = and i64 %t3729, 7
  %t3731 = icmp eq i64 %t3730, 0
  br i1 %t3731, label %fixfast1111, label %fixslow1112
fixfast1111:
  %t3732 = add i64 %a2, 8
  br label %fixmerge1113
fixslow1112:
  %t3733 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1113
fixmerge1113:
  %t3734 = phi i64 [ %t3732, %fixfast1111 ], [ %t3733, %fixslow1112 ]
  %t3735 = load i64, ptr @"scheme.base:rd-unquote"
  %t3736 = and i64 %t3735, -8
  %t3737 = inttoptr i64 %t3736 to ptr
  %t3738 = load i64, ptr %t3737
  %t3739 = inttoptr i64 %t3738 to ptr
  %t3740 = musttail call fastcc i64 %t3739(i64 %t3735, i64 3, i64 %a0, i64 %a1, i64 %t3734, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3740
else1110:
  %t3741 = or i64 %t3640, 272
  %t3742 = and i64 %t3741, 7
  %t3743 = icmp eq i64 %t3742, 0
  br i1 %t3743, label %fixfast1114, label %fixslow1115
fixfast1114:
  %t3744 = icmp eq i64 %t3640, 272
  %t3745 = select i1 %t3744, i64 257, i64 1
  br label %fixmerge1116
fixslow1115:
  %t3746 = call i64 @rt_num_eq(i64 %t3640, i64 272)
  br label %fixmerge1116
fixmerge1116:
  %t3747 = phi i64 [ %t3745, %fixfast1114 ], [ %t3746, %fixslow1115 ]
  %t3748 = icmp ne i64 %t3747, 1
  br i1 %t3748, label %then1117, label %else1118
then1117:
  %t3749 = or i64 %a2, 8
  %t3750 = and i64 %t3749, 7
  %t3751 = icmp eq i64 %t3750, 0
  br i1 %t3751, label %fixfast1119, label %fixslow1120
fixfast1119:
  %t3752 = add i64 %a2, 8
  br label %fixmerge1121
fixslow1120:
  %t3753 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1121
fixmerge1121:
  %t3754 = phi i64 [ %t3752, %fixfast1119 ], [ %t3753, %fixslow1120 ]
  %t3755 = load i64, ptr @"scheme.base:rd-string"
  %t3756 = and i64 %t3755, -8
  %t3757 = inttoptr i64 %t3756 to ptr
  %t3758 = load i64, ptr %t3757
  %t3759 = inttoptr i64 %t3758 to ptr
  %t3760 = musttail call fastcc i64 %t3759(i64 %t3755, i64 3, i64 %a0, i64 %a1, i64 %t3754, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3760
else1118:
  %t3761 = or i64 %t3640, 280
  %t3762 = and i64 %t3761, 7
  %t3763 = icmp eq i64 %t3762, 0
  br i1 %t3763, label %fixfast1122, label %fixslow1123
fixfast1122:
  %t3764 = icmp eq i64 %t3640, 280
  %t3765 = select i1 %t3764, i64 257, i64 1
  br label %fixmerge1124
fixslow1123:
  %t3766 = call i64 @rt_num_eq(i64 %t3640, i64 280)
  br label %fixmerge1124
fixmerge1124:
  %t3767 = phi i64 [ %t3765, %fixfast1122 ], [ %t3766, %fixslow1123 ]
  %t3768 = icmp ne i64 %t3767, 1
  br i1 %t3768, label %then1125, label %else1126
then1125:
  %t3769 = or i64 %a2, 8
  %t3770 = and i64 %t3769, 7
  %t3771 = icmp eq i64 %t3770, 0
  br i1 %t3771, label %fixfast1127, label %fixslow1128
fixfast1127:
  %t3772 = add i64 %a2, 8
  br label %fixmerge1129
fixslow1128:
  %t3773 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1129
fixmerge1129:
  %t3774 = phi i64 [ %t3772, %fixfast1127 ], [ %t3773, %fixslow1128 ]
  %t3775 = load i64, ptr @"scheme.base:rd-hash"
  %t3776 = and i64 %t3775, -8
  %t3777 = inttoptr i64 %t3776 to ptr
  %t3778 = load i64, ptr %t3777
  %t3779 = inttoptr i64 %t3778 to ptr
  %t3780 = musttail call fastcc i64 %t3779(i64 %t3775, i64 3, i64 %a0, i64 %a1, i64 %t3774, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3780
else1126:
  %t3781 = load i64, ptr @"scheme.base:rd-atom"
  %t3782 = and i64 %t3781, -8
  %t3783 = inttoptr i64 %t3782 to ptr
  %t3784 = load i64, ptr %t3783
  %t3785 = inttoptr i64 %t3784 to ptr
  %t3786 = musttail call fastcc i64 %t3785(i64 %t3781, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3786
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3791 = icmp eq i64 %argc, 1
  br i1 %t3791, label %argok1131, label %arityerr1130
arityerr1130:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1131:
  %t3792 = call i64 @rt_string_length(i64 %a0)
  %t3793 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3794 = and i64 %t3793, -8
  %t3795 = inttoptr i64 %t3794 to ptr
  %t3796 = load i64, ptr %t3795
  %t3797 = inttoptr i64 %t3796 to ptr
  %t3798 = call fastcc i64%t3797(i64 %t3793, i64 3, i64 %a0, i64 %t3792, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3799 = load i64, ptr @"scheme.base:rd-datum"
  %t3800 = and i64 %t3799, -8
  %t3801 = inttoptr i64 %t3800 to ptr
  %t3802 = load i64, ptr %t3801
  %t3803 = inttoptr i64 %t3802 to ptr
  %t3804 = call fastcc i64%t3803(i64 %t3799, i64 3, i64 %a0, i64 %t3792, i64 %t3798, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3805 = call i64 @rt_car(i64 %t3804)
  ret i64 %t3805
}

define fastcc i64 @"scheme.base:code_917"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3810 = icmp eq i64 %argc, 2
  br i1 %t3810, label %argok1133, label %arityerr1132
arityerr1132:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1133:
  %t3811 = and i64 %self, -8
  %t3812 = inttoptr i64 %t3811 to ptr
  %t3813 = getelementptr i64, ptr %t3812, i64 1
  %t3814 = load i64, ptr %t3813
  %t3815 = or i64 %a0, %t3814
  %t3816 = and i64 %t3815, 7
  %t3817 = icmp eq i64 %t3816, 0
  br i1 %t3817, label %fixfast1134, label %fixslow1135
fixfast1134:
  %t3818 = icmp slt i64 %a0, %t3814
  %t3819 = select i1 %t3818, i64 257, i64 1
  br label %fixmerge1136
fixslow1135:
  %t3820 = call i64 @rt_lt(i64 %a0, i64 %t3814)
  br label %fixmerge1136
fixmerge1136:
  %t3821 = phi i64 [ %t3819, %fixfast1134 ], [ %t3820, %fixslow1135 ]
  %t3822 = icmp ne i64 %t3821, 1
  br i1 %t3822, label %then1137, label %else1138
then1137:
  %t3823 = and i64 %self, -8
  %t3824 = inttoptr i64 %t3823 to ptr
  %t3825 = getelementptr i64, ptr %t3824, i64 2
  %t3826 = load i64, ptr %t3825
  %t3827 = and i64 %self, -8
  %t3828 = inttoptr i64 %t3827 to ptr
  %t3829 = getelementptr i64, ptr %t3828, i64 1
  %t3830 = load i64, ptr %t3829
  %t3831 = load i64, ptr @"scheme.base:rd-datum"
  %t3832 = and i64 %t3831, -8
  %t3833 = inttoptr i64 %t3832 to ptr
  %t3834 = load i64, ptr %t3833
  %t3835 = inttoptr i64 %t3834 to ptr
  %t3836 = call fastcc i64%t3835(i64 %t3831, i64 3, i64 %t3826, i64 %t3830, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3837 = and i64 %self, -8
  %t3838 = inttoptr i64 %t3837 to ptr
  %t3839 = getelementptr i64, ptr %t3838, i64 2
  %t3840 = load i64, ptr %t3839
  %t3841 = and i64 %self, -8
  %t3842 = inttoptr i64 %t3841 to ptr
  %t3843 = getelementptr i64, ptr %t3842, i64 1
  %t3844 = load i64, ptr %t3843
  %t3845 = call i64 @rt_cdr(i64 %t3836)
  %t3846 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3847 = and i64 %t3846, -8
  %t3848 = inttoptr i64 %t3847 to ptr
  %t3849 = load i64, ptr %t3848
  %t3850 = inttoptr i64 %t3849 to ptr
  %t3851 = call fastcc i64%t3850(i64 %t3846, i64 3, i64 %t3840, i64 %t3844, i64 %t3845, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3852 = call i64 @rt_car(i64 %t3836)
  %t3853 = call i64 @rt_cons(i64 %t3852, i64 %a1)
  %t3854 = musttail call fastcc i64 @"scheme.base:code_917"(i64 %self, i64 2, i64 %t3851, i64 %t3853, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3854
else1138:
  %t3855 = load i64, ptr @"scheme.base:reverse"
  %t3856 = and i64 %t3855, -8
  %t3857 = inttoptr i64 %t3856 to ptr
  %t3858 = load i64, ptr %t3857
  %t3859 = inttoptr i64 %t3858 to ptr
  %t3860 = musttail call fastcc i64 %t3859(i64 %t3855, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3860
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3861 = icmp eq i64 %argc, 1
  br i1 %t3861, label %argok1140, label %arityerr1139
arityerr1139:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1140:
  %t3862 = call i64 @rt_string_length(i64 %a0)
  %t3863 = call ptr @rt_alloc_words(i64 4)
  %t3864 = ptrtoint ptr %t3863 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_917" to i64), ptr %t3863
  %t3865 = or i64 %t3864, 4
  %t3866 = getelementptr i64, ptr %t3863, i64 1
  store i64 %t3862, ptr %t3866
  %t3867 = getelementptr i64, ptr %t3863, i64 2
  store i64 %a0, ptr %t3867
  %t3868 = getelementptr i64, ptr %t3863, i64 3
  store i64 %t3865, ptr %t3868
  %t3869 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3870 = and i64 %t3869, -8
  %t3871 = inttoptr i64 %t3870 to ptr
  %t3872 = load i64, ptr %t3871
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = call fastcc i64%t3873(i64 %t3869, i64 3, i64 %a0, i64 %t3862, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3875 = musttail call fastcc i64 @"scheme.base:code_917"(i64 %t3865, i64 2, i64 %t3874, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3875
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
  %t52 = call ptr @rt_alloc_words(i64 1)
  %t53 = ptrtoint ptr %t52 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caaar" to i64), ptr %t52
  %t54 = or i64 %t53, 4
  %t55 = call i64 @rt_root(i64 %t54)
  store i64 %t55, ptr @"scheme.base:caaar"
  ret i64 17
}

define i64 @"scheme.base:__init_7"() {
entry:
  %t64 = call ptr @rt_alloc_words(i64 1)
  %t65 = ptrtoint ptr %t64 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caadr" to i64), ptr %t64
  %t66 = or i64 %t65, 4
  %t67 = call i64 @rt_root(i64 %t66)
  store i64 %t67, ptr @"scheme.base:caadr"
  ret i64 17
}

define i64 @"scheme.base:__init_8"() {
entry:
  %t76 = call ptr @rt_alloc_words(i64 1)
  %t77 = ptrtoint ptr %t76 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cadar" to i64), ptr %t76
  %t78 = or i64 %t77, 4
  %t79 = call i64 @rt_root(i64 %t78)
  store i64 %t79, ptr @"scheme.base:cadar"
  ret i64 17
}

define i64 @"scheme.base:__init_9"() {
entry:
  %t88 = call ptr @rt_alloc_words(i64 1)
  %t89 = ptrtoint ptr %t88 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caddr" to i64), ptr %t88
  %t90 = or i64 %t89, 4
  %t91 = call i64 @rt_root(i64 %t90)
  store i64 %t91, ptr @"scheme.base:caddr"
  ret i64 17
}

define i64 @"scheme.base:__init_10"() {
entry:
  %t100 = call ptr @rt_alloc_words(i64 1)
  %t101 = ptrtoint ptr %t100 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdaar" to i64), ptr %t100
  %t102 = or i64 %t101, 4
  %t103 = call i64 @rt_root(i64 %t102)
  store i64 %t103, ptr @"scheme.base:cdaar"
  ret i64 17
}

define i64 @"scheme.base:__init_11"() {
entry:
  %t112 = call ptr @rt_alloc_words(i64 1)
  %t113 = ptrtoint ptr %t112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdadr" to i64), ptr %t112
  %t114 = or i64 %t113, 4
  %t115 = call i64 @rt_root(i64 %t114)
  store i64 %t115, ptr @"scheme.base:cdadr"
  ret i64 17
}

define i64 @"scheme.base:__init_12"() {
entry:
  %t124 = call ptr @rt_alloc_words(i64 1)
  %t125 = ptrtoint ptr %t124 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cddar" to i64), ptr %t124
  %t126 = or i64 %t125, 4
  %t127 = call i64 @rt_root(i64 %t126)
  store i64 %t127, ptr @"scheme.base:cddar"
  ret i64 17
}

define i64 @"scheme.base:__init_13"() {
entry:
  %t136 = call ptr @rt_alloc_words(i64 1)
  %t137 = ptrtoint ptr %t136 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdddr" to i64), ptr %t136
  %t138 = or i64 %t137, 4
  %t139 = call i64 @rt_root(i64 %t138)
  store i64 %t139, ptr @"scheme.base:cdddr"
  ret i64 17
}

define i64 @"scheme.base:__init_14"() {
entry:
  %t157 = call ptr @rt_alloc_words(i64 1)
  %t158 = ptrtoint ptr %t157 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:length" to i64), ptr %t157
  %t159 = or i64 %t158, 4
  %t160 = call i64 @rt_root(i64 %t159)
  store i64 %t160, ptr @"scheme.base:length"
  ret i64 17
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t174 = call ptr @rt_alloc_words(i64 1)
  %t175 = ptrtoint ptr %t174 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:reverse" to i64), ptr %t174
  %t176 = or i64 %t175, 4
  %t177 = call i64 @rt_root(i64 %t176)
  store i64 %t177, ptr @"scheme.base:reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t190 = call ptr @rt_alloc_words(i64 1)
  %t191 = ptrtoint ptr %t190 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%append2" to i64), ptr %t190
  %t192 = or i64 %t191, 4
  %t193 = call i64 @rt_root(i64 %t192)
  store i64 %t193, ptr @"scheme.base:%append2"
  ret i64 17
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t247 = call ptr @rt_alloc_words(i64 1)
  %t248 = ptrtoint ptr %t247 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:append" to i64), ptr %t247
  %t249 = or i64 %t248, 4
  %t250 = call i64 @rt_root(i64 %t249)
  store i64 %t250, ptr @"scheme.base:append"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t268 = call ptr @rt_alloc_words(i64 1)
  %t269 = ptrtoint ptr %t268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%map1" to i64), ptr %t268
  %t270 = or i64 %t269, 4
  %t271 = call i64 @rt_root(i64 %t270)
  store i64 %t271, ptr @"scheme.base:%map1"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t285 = call ptr @rt_alloc_words(i64 1)
  %t286 = ptrtoint ptr %t285 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%any-null?" to i64), ptr %t285
  %t287 = or i64 %t286, 4
  %t288 = call i64 @rt_root(i64 %t287)
  store i64 %t288, ptr @"scheme.base:%any-null?"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t353 = call ptr @rt_alloc_words(i64 1)
  %t354 = ptrtoint ptr %t353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%mapn" to i64), ptr %t353
  %t355 = or i64 %t354, 4
  %t356 = call i64 @rt_root(i64 %t355)
  store i64 %t356, ptr @"scheme.base:%mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t383 = call ptr @rt_alloc_words(i64 1)
  %t384 = ptrtoint ptr %t383 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:map" to i64), ptr %t383
  %t385 = or i64 %t384, 4
  %t386 = call i64 @rt_root(i64 %t385)
  store i64 %t386, ptr @"scheme.base:map"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t400 = call ptr @rt_alloc_words(i64 1)
  %t401 = ptrtoint ptr %t400 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memq" to i64), ptr %t400
  %t402 = or i64 %t401, 4
  %t403 = call i64 @rt_root(i64 %t402)
  store i64 %t403, ptr @"scheme.base:memq"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t417 = call ptr @rt_alloc_words(i64 1)
  %t418 = ptrtoint ptr %t417 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memv" to i64), ptr %t417
  %t419 = or i64 %t418, 4
  %t420 = call i64 @rt_root(i64 %t419)
  store i64 %t420, ptr @"scheme.base:memv"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t436 = call ptr @rt_alloc_words(i64 1)
  %t437 = ptrtoint ptr %t436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assq" to i64), ptr %t436
  %t438 = or i64 %t437, 4
  %t439 = call i64 @rt_root(i64 %t438)
  store i64 %t439, ptr @"scheme.base:assq"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t453 = call ptr @rt_alloc_words(i64 1)
  %t454 = ptrtoint ptr %t453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member" to i64), ptr %t453
  %t455 = or i64 %t454, 4
  %t456 = call i64 @rt_root(i64 %t455)
  store i64 %t456, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t472 = call ptr @rt_alloc_words(i64 1)
  %t473 = ptrtoint ptr %t472 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc" to i64), ptr %t472
  %t474 = or i64 %t473, 4
  %t475 = call i64 @rt_root(i64 %t474)
  store i64 %t475, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t502 = call ptr @rt_alloc_words(i64 1)
  %t503 = ptrtoint ptr %t502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:filter" to i64), ptr %t502
  %t504 = or i64 %t503, 4
  %t505 = call i64 @rt_root(i64 %t504)
  store i64 %t505, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t522 = call ptr @rt_alloc_words(i64 1)
  %t523 = ptrtoint ptr %t522 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t522
  %t524 = or i64 %t523, 4
  %t525 = call i64 @rt_root(i64 %t524)
  store i64 %t525, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t542 = call ptr @rt_alloc_words(i64 1)
  %t543 = ptrtoint ptr %t542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-right" to i64), ptr %t542
  %t544 = or i64 %t543, 4
  %t545 = call i64 @rt_root(i64 %t544)
  store i64 %t545, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t563 = call ptr @rt_alloc_words(i64 1)
  %t564 = ptrtoint ptr %t563 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t563
  %t565 = or i64 %t564, 4
  %t566 = call i64 @rt_root(i64 %t565)
  store i64 %t566, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t631 = call ptr @rt_alloc_words(i64 1)
  %t632 = ptrtoint ptr %t631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t631
  %t633 = or i64 %t632, 4
  %t634 = call i64 @rt_root(i64 %t633)
  store i64 %t634, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t661 = call ptr @rt_alloc_words(i64 1)
  %t662 = ptrtoint ptr %t661 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t661
  %t663 = or i64 %t662, 4
  %t664 = call i64 @rt_root(i64 %t663)
  store i64 %t664, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t682 = call ptr @rt_alloc_words(i64 1)
  %t683 = ptrtoint ptr %t682 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t682
  %t684 = or i64 %t683, 4
  %t685 = call i64 @rt_root(i64 %t684)
  store i64 %t685, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t703 = call ptr @rt_alloc_words(i64 1)
  %t704 = ptrtoint ptr %t703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t703
  %t705 = or i64 %t704, 4
  %t706 = call i64 @rt_root(i64 %t705)
  store i64 %t706, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t715 = call ptr @rt_alloc_words(i64 1)
  %t716 = ptrtoint ptr %t715 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cadddr" to i64), ptr %t715
  %t717 = or i64 %t716, 4
  %t718 = call i64 @rt_root(i64 %t717)
  store i64 %t718, ptr @"scheme.base:cadddr"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t731 = call ptr @rt_alloc_words(i64 1)
  %t732 = ptrtoint ptr %t731 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t731
  %t733 = or i64 %t732, 4
  %t734 = call i64 @rt_root(i64 %t733)
  store i64 %t734, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t743 = call ptr @rt_alloc_words(i64 1)
  %t744 = ptrtoint ptr %t743 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t743
  %t745 = or i64 %t744, 4
  %t746 = call i64 @rt_root(i64 %t745)
  store i64 %t746, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t768 = call ptr @rt_alloc_words(i64 1)
  %t769 = ptrtoint ptr %t768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t768
  %t770 = or i64 %t769, 4
  %t771 = call i64 @rt_root(i64 %t770)
  store i64 %t771, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t780 = call ptr @rt_alloc_words(i64 1)
  %t781 = ptrtoint ptr %t780 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t780
  %t782 = or i64 %t781, 4
  %t783 = call i64 @rt_root(i64 %t782)
  store i64 %t783, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t807 = call ptr @rt_alloc_words(i64 1)
  %t808 = ptrtoint ptr %t807 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t807
  %t809 = or i64 %t808, 4
  %t810 = call i64 @rt_root(i64 %t809)
  store i64 %t810, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t832 = call ptr @rt_alloc_words(i64 1)
  %t833 = ptrtoint ptr %t832 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t832
  %t834 = or i64 %t833, 4
  %t835 = call i64 @rt_root(i64 %t834)
  store i64 %t835, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t870 = call ptr @rt_alloc_words(i64 1)
  %t871 = ptrtoint ptr %t870 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t870
  %t872 = or i64 %t871, 4
  %t873 = call i64 @rt_root(i64 %t872)
  store i64 %t873, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t883 = call ptr @rt_alloc_words(i64 1)
  %t884 = ptrtoint ptr %t883 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t883
  %t885 = or i64 %t884, 4
  %t886 = call i64 @rt_root(i64 %t885)
  store i64 %t886, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t889 = call ptr @rt_alloc_words(i64 1)
  %t890 = ptrtoint ptr %t889 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t889
  %t891 = or i64 %t890, 4
  %t892 = call i64 @rt_root(i64 %t891)
  store i64 %t892, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t905 = call ptr @rt_alloc_words(i64 1)
  %t906 = ptrtoint ptr %t905 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t905
  %t907 = or i64 %t906, 4
  %t908 = call i64 @rt_root(i64 %t907)
  store i64 %t908, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t922 = call ptr @rt_alloc_words(i64 1)
  %t923 = ptrtoint ptr %t922 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t922
  %t924 = or i64 %t923, 4
  %t925 = call i64 @rt_root(i64 %t924)
  store i64 %t925, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t945 = call ptr @rt_alloc_words(i64 1)
  %t946 = ptrtoint ptr %t945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t945
  %t947 = or i64 %t946, 4
  %t948 = call i64 @rt_root(i64 %t947)
  store i64 %t948, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t977 = call ptr @rt_alloc_words(i64 1)
  %t978 = ptrtoint ptr %t977 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t977
  %t979 = or i64 %t978, 4
  %t980 = call i64 @rt_root(i64 %t979)
  store i64 %t980, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1009 = call ptr @rt_alloc_words(i64 1)
  %t1010 = ptrtoint ptr %t1009 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1009
  %t1011 = or i64 %t1010, 4
  %t1012 = call i64 @rt_root(i64 %t1011)
  store i64 %t1012, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1041 = call ptr @rt_alloc_words(i64 1)
  %t1042 = ptrtoint ptr %t1041 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1041
  %t1043 = or i64 %t1042, 4
  %t1044 = call i64 @rt_root(i64 %t1043)
  store i64 %t1044, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1081 = call ptr @rt_alloc_words(i64 1)
  %t1082 = ptrtoint ptr %t1081 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1081
  %t1083 = or i64 %t1082, 4
  %t1084 = call i64 @rt_root(i64 %t1083)
  store i64 %t1084, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1121 = call ptr @rt_alloc_words(i64 1)
  %t1122 = ptrtoint ptr %t1121 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1121
  %t1123 = or i64 %t1122, 4
  %t1124 = call i64 @rt_root(i64 %t1123)
  store i64 %t1124, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1161 = call ptr @rt_alloc_words(i64 1)
  %t1162 = ptrtoint ptr %t1161 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1161
  %t1163 = or i64 %t1162, 4
  %t1164 = call i64 @rt_root(i64 %t1163)
  store i64 %t1164, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1197 = call ptr @rt_alloc_words(i64 1)
  %t1198 = ptrtoint ptr %t1197 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1197
  %t1199 = or i64 %t1198, 4
  %t1200 = call i64 @rt_root(i64 %t1199)
  store i64 %t1200, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1243 = call ptr @rt_alloc_words(i64 1)
  %t1244 = ptrtoint ptr %t1243 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t1243
  %t1245 = or i64 %t1244, 4
  %t1246 = call i64 @rt_root(i64 %t1245)
  store i64 %t1246, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1268 = call ptr @rt_alloc_words(i64 1)
  %t1269 = ptrtoint ptr %t1268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t1268
  %t1270 = or i64 %t1269, 4
  %t1271 = call i64 @rt_root(i64 %t1270)
  store i64 %t1271, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1274 = call ptr @rt_alloc_words(i64 1)
  %t1275 = ptrtoint ptr %t1274 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t1274
  %t1276 = or i64 %t1275, 4
  %t1277 = call i64 @rt_root(i64 %t1276)
  store i64 %t1277, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1280 = call ptr @rt_alloc_words(i64 1)
  %t1281 = ptrtoint ptr %t1280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t1280
  %t1282 = or i64 %t1281, 4
  %t1283 = call i64 @rt_root(i64 %t1282)
  store i64 %t1283, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1286 = call ptr @rt_alloc_words(i64 1)
  %t1287 = ptrtoint ptr %t1286 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t1286
  %t1288 = or i64 %t1287, 4
  %t1289 = call i64 @rt_root(i64 %t1288)
  store i64 %t1289, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1292 = call ptr @rt_alloc_words(i64 1)
  %t1293 = ptrtoint ptr %t1292 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t1292
  %t1294 = or i64 %t1293, 4
  %t1295 = call i64 @rt_root(i64 %t1294)
  store i64 %t1295, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1331 = call ptr @rt_alloc_words(i64 1)
  %t1332 = ptrtoint ptr %t1331 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t1331
  %t1333 = or i64 %t1332, 4
  %t1334 = call i64 @rt_root(i64 %t1333)
  store i64 %t1334, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1352 = call ptr @rt_alloc_words(i64 1)
  %t1353 = ptrtoint ptr %t1352 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t1352
  %t1354 = or i64 %t1353, 4
  %t1355 = call i64 @rt_root(i64 %t1354)
  store i64 %t1355, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1391 = call ptr @rt_alloc_words(i64 1)
  %t1392 = ptrtoint ptr %t1391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t1391
  %t1393 = or i64 %t1392, 4
  %t1394 = call i64 @rt_root(i64 %t1393)
  store i64 %t1394, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1412 = call ptr @rt_alloc_words(i64 1)
  %t1413 = ptrtoint ptr %t1412 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t1412
  %t1414 = or i64 %t1413, 4
  %t1415 = call i64 @rt_root(i64 %t1414)
  store i64 %t1415, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1435 = call ptr @rt_alloc_words(i64 1)
  %t1436 = ptrtoint ptr %t1435 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t1435
  %t1437 = or i64 %t1436, 4
  %t1438 = call i64 @rt_root(i64 %t1437)
  store i64 %t1438, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1480 = call ptr @rt_alloc_words(i64 1)
  %t1481 = ptrtoint ptr %t1480 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t1480
  %t1482 = or i64 %t1481, 4
  %t1483 = call i64 @rt_root(i64 %t1482)
  store i64 %t1483, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1484 = call i64 @rt_root(i64 64)
  store i64 %t1484, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1485 = call i64 @rt_root(i64 24)
  store i64 %t1485, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1496 = call ptr @rt_alloc_words(i64 1)
  %t1497 = ptrtoint ptr %t1496 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t1496
  %t1498 = or i64 %t1497, 4
  %t1499 = call i64 @rt_root(i64 %t1498)
  store i64 %t1499, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1502 = call ptr @rt_alloc_words(i64 1)
  %t1503 = ptrtoint ptr %t1502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t1502
  %t1504 = or i64 %t1503, 4
  %t1505 = call i64 @rt_root(i64 %t1504)
  store i64 %t1505, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1509 = call ptr @rt_alloc_words(i64 1)
  %t1510 = ptrtoint ptr %t1509 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t1509
  %t1511 = or i64 %t1510, 4
  %t1512 = call i64 @rt_root(i64 %t1511)
  store i64 %t1512, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1516 = call ptr @rt_alloc_words(i64 1)
  %t1517 = ptrtoint ptr %t1516 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t1516
  %t1518 = or i64 %t1517, 4
  %t1519 = call i64 @rt_root(i64 %t1518)
  store i64 %t1519, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1523 = call ptr @rt_alloc_words(i64 1)
  %t1524 = ptrtoint ptr %t1523 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t1523
  %t1525 = or i64 %t1524, 4
  %t1526 = call i64 @rt_root(i64 %t1525)
  store i64 %t1526, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1530 = call ptr @rt_alloc_words(i64 1)
  %t1531 = ptrtoint ptr %t1530 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t1530
  %t1532 = or i64 %t1531, 4
  %t1533 = call i64 @rt_root(i64 %t1532)
  store i64 %t1533, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1537 = call ptr @rt_alloc_words(i64 1)
  %t1538 = ptrtoint ptr %t1537 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t1537
  %t1539 = or i64 %t1538, 4
  %t1540 = call i64 @rt_root(i64 %t1539)
  store i64 %t1540, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1556 = call ptr @rt_alloc_words(i64 1)
  %t1557 = ptrtoint ptr %t1556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t1556
  %t1558 = or i64 %t1557, 4
  %t1559 = call i64 @rt_root(i64 %t1558)
  store i64 %t1559, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1577 = call ptr @rt_alloc_words(i64 1)
  %t1578 = ptrtoint ptr %t1577 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t1577
  %t1579 = or i64 %t1578, 4
  %t1580 = call i64 @rt_root(i64 %t1579)
  store i64 %t1580, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1604 = call ptr @rt_alloc_words(i64 1)
  %t1605 = ptrtoint ptr %t1604 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t1604
  %t1606 = or i64 %t1605, 4
  %t1607 = call i64 @rt_root(i64 %t1606)
  store i64 %t1607, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1630 = call ptr @rt_alloc_words(i64 1)
  %t1631 = ptrtoint ptr %t1630 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t1630
  %t1632 = or i64 %t1631, 4
  %t1633 = call i64 @rt_root(i64 %t1632)
  store i64 %t1633, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1664 = call ptr @rt_alloc_words(i64 1)
  %t1665 = ptrtoint ptr %t1664 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t1664
  %t1666 = or i64 %t1665, 4
  %t1667 = call i64 @rt_root(i64 %t1666)
  store i64 %t1667, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1747 = call ptr @rt_alloc_words(i64 1)
  %t1748 = ptrtoint ptr %t1747 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t1747
  %t1749 = or i64 %t1748, 4
  %t1750 = call i64 @rt_root(i64 %t1749)
  store i64 %t1750, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1798 = call ptr @rt_alloc_words(i64 1)
  %t1799 = ptrtoint ptr %t1798 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t1798
  %t1800 = or i64 %t1799, 4
  %t1801 = call i64 @rt_root(i64 %t1800)
  store i64 %t1801, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1901 = call ptr @rt_alloc_words(i64 1)
  %t1902 = ptrtoint ptr %t1901 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t1901
  %t1903 = or i64 %t1902, 4
  %t1904 = call i64 @rt_root(i64 %t1903)
  store i64 %t1904, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1912 = call ptr @rt_alloc_words(i64 1)
  %t1913 = ptrtoint ptr %t1912 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t1912
  %t1914 = or i64 %t1913, 4
  %t1915 = call i64 @rt_root(i64 %t1914)
  store i64 %t1915, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1932 = call ptr @rt_alloc_words(i64 1)
  %t1933 = ptrtoint ptr %t1932 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t1932
  %t1934 = or i64 %t1933, 4
  %t1935 = call i64 @rt_root(i64 %t1934)
  store i64 %t1935, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1981 = call ptr @rt_alloc_words(i64 1)
  %t1982 = ptrtoint ptr %t1981 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t1981
  %t1983 = or i64 %t1982, 4
  %t1984 = call i64 @rt_root(i64 %t1983)
  store i64 %t1984, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2003 = call ptr @rt_alloc_words(i64 1)
  %t2004 = ptrtoint ptr %t2003 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t2003
  %t2005 = or i64 %t2004, 4
  %t2006 = call i64 @rt_root(i64 %t2005)
  store i64 %t2006, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2025 = call ptr @rt_alloc_words(i64 1)
  %t2026 = ptrtoint ptr %t2025 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t2025
  %t2027 = or i64 %t2026, 4
  %t2028 = call i64 @rt_root(i64 %t2027)
  store i64 %t2028, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2062 = call ptr @rt_alloc_words(i64 1)
  %t2063 = ptrtoint ptr %t2062 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-ws?" to i64), ptr %t2062
  %t2064 = or i64 %t2063, 4
  %t2065 = call i64 @rt_root(i64 %t2064)
  store i64 %t2065, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2083 = call ptr @rt_alloc_words(i64 1)
  %t2084 = ptrtoint ptr %t2083 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digit?" to i64), ptr %t2083
  %t2085 = or i64 %t2084, 4
  %t2086 = call i64 @rt_root(i64 %t2085)
  store i64 %t2086, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2143 = call ptr @rt_alloc_words(i64 1)
  %t2144 = ptrtoint ptr %t2143 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-delim?" to i64), ptr %t2143
  %t2145 = or i64 %t2144, 4
  %t2146 = call i64 @rt_root(i64 %t2145)
  store i64 %t2146, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2184 = call ptr @rt_alloc_words(i64 1)
  %t2185 = ptrtoint ptr %t2184 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-line" to i64), ptr %t2184
  %t2186 = or i64 %t2185, 4
  %t2187 = call i64 @rt_root(i64 %t2186)
  store i64 %t2187, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2244 = call ptr @rt_alloc_words(i64 1)
  %t2245 = ptrtoint ptr %t2244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-ws" to i64), ptr %t2244
  %t2246 = or i64 %t2245, 4
  %t2247 = call i64 @rt_root(i64 %t2246)
  store i64 %t2247, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2277 = call ptr @rt_alloc_words(i64 1)
  %t2278 = ptrtoint ptr %t2277 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-token-end" to i64), ptr %t2277
  %t2279 = or i64 %t2278, 4
  %t2280 = call i64 @rt_root(i64 %t2279)
  store i64 %t2280, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2310 = call ptr @rt_alloc_words(i64 1)
  %t2311 = ptrtoint ptr %t2310 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all-digits?" to i64), ptr %t2310
  %t2312 = or i64 %t2311, 4
  %t2313 = call i64 @rt_root(i64 %t2312)
  store i64 %t2313, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2371 = call ptr @rt_alloc_words(i64 1)
  %t2372 = ptrtoint ptr %t2371 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-numeric?" to i64), ptr %t2371
  %t2373 = or i64 %t2372, 4
  %t2374 = call i64 @rt_root(i64 %t2373)
  store i64 %t2374, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2417 = call ptr @rt_alloc_words(i64 1)
  %t2418 = ptrtoint ptr %t2417 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits" to i64), ptr %t2417
  %t2419 = or i64 %t2418, 4
  %t2420 = call i64 @rt_root(i64 %t2419)
  store i64 %t2420, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2465 = call ptr @rt_alloc_words(i64 1)
  %t2466 = ptrtoint ptr %t2465 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-parse-int" to i64), ptr %t2465
  %t2467 = or i64 %t2466, 4
  %t2468 = call i64 @rt_root(i64 %t2467)
  store i64 %t2468, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2478 = call ptr @rt_alloc_words(i64 1)
  %t2479 = ptrtoint ptr %t2478 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dotchar?" to i64), ptr %t2478
  %t2480 = or i64 %t2479, 4
  %t2481 = call i64 @rt_root(i64 %t2480)
  store i64 %t2481, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2499 = call ptr @rt_alloc_words(i64 1)
  %t2500 = ptrtoint ptr %t2499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-exp-char?" to i64), ptr %t2499
  %t2501 = or i64 %t2500, 4
  %t2502 = call i64 @rt_root(i64 %t2501)
  store i64 %t2502, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2520 = call ptr @rt_alloc_words(i64 1)
  %t2521 = ptrtoint ptr %t2520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-sign-char?" to i64), ptr %t2520
  %t2522 = or i64 %t2521, 4
  %t2523 = call i64 @rt_root(i64 %t2522)
  store i64 %t2523, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2554 = call ptr @rt_alloc_words(i64 1)
  %t2555 = ptrtoint ptr %t2554 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-scan-digits" to i64), ptr %t2554
  %t2556 = or i64 %t2555, 4
  %t2557 = call i64 @rt_root(i64 %t2556)
  store i64 %t2557, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2736 = call ptr @rt_alloc_words(i64 1)
  %t2737 = ptrtoint ptr %t2736 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-flonum?" to i64), ptr %t2736
  %t2738 = or i64 %t2737, 4
  %t2739 = call i64 @rt_root(i64 %t2738)
  store i64 %t2739, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2773 = call ptr @rt_alloc_words(i64 1)
  %t2774 = ptrtoint ptr %t2773 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-atom" to i64), ptr %t2773
  %t2775 = or i64 %t2774, 4
  %t2776 = call i64 @rt_root(i64 %t2775)
  store i64 %t2776, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2848 = call ptr @rt_alloc_words(i64 1)
  %t2849 = ptrtoint ptr %t2848 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex-digit" to i64), ptr %t2848
  %t2850 = or i64 %t2849, 4
  %t2851 = call i64 @rt_root(i64 %t2850)
  store i64 %t2851, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2911 = call ptr @rt_alloc_words(i64 1)
  %t2912 = ptrtoint ptr %t2911 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex" to i64), ptr %t2911
  %t2913 = or i64 %t2912, 4
  %t2914 = call i64 @rt_root(i64 %t2913)
  store i64 %t2914, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2944 = call ptr @rt_alloc_words(i64 1)
  %t2945 = ptrtoint ptr %t2944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-str-esc" to i64), ptr %t2944
  %t2946 = or i64 %t2945, 4
  %t2947 = call i64 @rt_root(i64 %t2946)
  store i64 %t2947, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3080 = call ptr @rt_alloc_words(i64 1)
  %t3081 = ptrtoint ptr %t3080 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-string" to i64), ptr %t3080
  %t3082 = or i64 %t3081, 4
  %t3083 = call i64 @rt_root(i64 %t3082)
  store i64 %t3083, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3247 = call ptr @rt_alloc_words(i64 1)
  %t3248 = ptrtoint ptr %t3247 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hash" to i64), ptr %t3247
  %t3249 = or i64 %t3248, 4
  %t3250 = call i64 @rt_root(i64 %t3249)
  store i64 %t3250, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3289 = call ptr @rt_alloc_words(i64 1)
  %t3290 = ptrtoint ptr %t3289 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char-name" to i64), ptr %t3289
  %t3291 = or i64 %t3290, 4
  %t3292 = call i64 @rt_root(i64 %t3291)
  store i64 %t3292, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3331 = call ptr @rt_alloc_words(i64 1)
  %t3332 = ptrtoint ptr %t3331 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char" to i64), ptr %t3331
  %t3333 = or i64 %t3332, 4
  %t3334 = call i64 @rt_root(i64 %t3333)
  store i64 %t3334, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3358 = call ptr @rt_alloc_words(i64 1)
  %t3359 = ptrtoint ptr %t3358 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quote" to i64), ptr %t3358
  %t3360 = or i64 %t3359, 4
  %t3361 = call i64 @rt_root(i64 %t3360)
  store i64 %t3361, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3385 = call ptr @rt_alloc_words(i64 1)
  %t3386 = ptrtoint ptr %t3385 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quasi" to i64), ptr %t3385
  %t3387 = or i64 %t3386, 4
  %t3388 = call i64 @rt_root(i64 %t3387)
  store i64 %t3388, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3459 = call ptr @rt_alloc_words(i64 1)
  %t3460 = ptrtoint ptr %t3459 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-unquote" to i64), ptr %t3459
  %t3461 = or i64 %t3460, 4
  %t3462 = call i64 @rt_root(i64 %t3461)
  store i64 %t3462, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3499 = call ptr @rt_alloc_words(i64 1)
  %t3500 = ptrtoint ptr %t3499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dot?" to i64), ptr %t3499
  %t3501 = or i64 %t3500, 4
  %t3502 = call i64 @rt_root(i64 %t3501)
  store i64 %t3502, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3515 = call ptr @rt_alloc_words(i64 1)
  %t3516 = ptrtoint ptr %t3515 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-append-reverse" to i64), ptr %t3515
  %t3517 = or i64 %t3516, 4
  %t3518 = call i64 @rt_root(i64 %t3517)
  store i64 %t3518, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3634 = call ptr @rt_alloc_words(i64 1)
  %t3635 = ptrtoint ptr %t3634 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-list" to i64), ptr %t3634
  %t3636 = or i64 %t3635, 4
  %t3637 = call i64 @rt_root(i64 %t3636)
  store i64 %t3637, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3787 = call ptr @rt_alloc_words(i64 1)
  %t3788 = ptrtoint ptr %t3787 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-datum" to i64), ptr %t3787
  %t3789 = or i64 %t3788, 4
  %t3790 = call i64 @rt_root(i64 %t3789)
  store i64 %t3790, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3806 = call ptr @rt_alloc_words(i64 1)
  %t3807 = ptrtoint ptr %t3806 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t3806
  %t3808 = or i64 %t3807, 4
  %t3809 = call i64 @rt_root(i64 %t3808)
  store i64 %t3809, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3876 = call ptr @rt_alloc_words(i64 1)
  %t3877 = ptrtoint ptr %t3876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t3876
  %t3878 = or i64 %t3877, 4
  %t3879 = call i64 @rt_root(i64 %t3878)
  store i64 %t3879, ptr @"scheme.base:read-all-from-string"
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

