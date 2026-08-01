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
define fastcc i64 @"scheme.base:code_1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_4"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_7"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_10"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_13"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_16"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_19"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_22"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_25"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_28"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_31"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_34"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_37"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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

define fastcc i64 @"scheme.base:code_45"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
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
  %t150 = musttail call fastcc i64 @"scheme.base:code_45"(i64 %self, i64 2, i64 %t143, i64 %t149, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t150
}

define fastcc i64 @"scheme.base:code_43"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t151 = icmp eq i64 %argc, 1
  br i1 %t151, label %argok35, label %arityerr34
arityerr34:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok35:
  %t152 = call ptr @rt_alloc_words(i64 2)
  %t153 = ptrtoint ptr %t152 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_45" to i64), ptr %t152
  %t154 = or i64 %t153, 4
  %t155 = getelementptr i64, ptr %t152, i64 1
  store i64 %t154, ptr %t155
  %t156 = and i64 %t154, -8
  %t157 = inttoptr i64 %t156 to ptr
  %t158 = load i64, ptr %t157
  %t159 = inttoptr i64 %t158 to ptr
  %t160 = musttail call fastcc i64 %t159(i64 %t154, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t160
}

define fastcc i64 @"scheme.base:code_53"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t165 = icmp eq i64 %argc, 2
  br i1 %t165, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t166 = call i64 @rt_null_p(i64 %a0)
  %t167 = icmp ne i64 %t166, 1
  br i1 %t167, label %then38, label %else39
then38:
  ret i64 %a1
else39:
  %t168 = call i64 @rt_cdr(i64 %a0)
  %t169 = call i64 @rt_car(i64 %a0)
  %t170 = call i64 @rt_cons(i64 %t169, i64 %a1)
  %t171 = musttail call fastcc i64 @"scheme.base:code_53"(i64 %self, i64 2, i64 %t168, i64 %t170, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t171
}

define fastcc i64 @"scheme.base:code_51"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t172 = icmp eq i64 %argc, 1
  br i1 %t172, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t173 = call ptr @rt_alloc_words(i64 2)
  %t174 = ptrtoint ptr %t173 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_53" to i64), ptr %t173
  %t175 = or i64 %t174, 4
  %t176 = getelementptr i64, ptr %t173, i64 1
  store i64 %t175, ptr %t176
  %t177 = and i64 %t175, -8
  %t178 = inttoptr i64 %t177 to ptr
  %t179 = load i64, ptr %t178
  %t180 = inttoptr i64 %t179 to ptr
  %t181 = musttail call fastcc i64 %t180(i64 %t175, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t181
}

define fastcc i64 @"scheme.base:code_57"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t186 = icmp eq i64 %argc, 2
  br i1 %t186, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok43:
  %t187 = call i64 @rt_null_p(i64 %a0)
  %t188 = icmp ne i64 %t187, 1
  br i1 %t188, label %then44, label %else45
then44:
  ret i64 %a1
else45:
  %t189 = call i64 @rt_car(i64 %a0)
  %t190 = call i64 @rt_cdr(i64 %a0)
  %t191 = load i64, ptr @"scheme.base:%append2"
  %t192 = and i64 %t191, -8
  %t193 = inttoptr i64 %t192 to ptr
  %t194 = load i64, ptr %t193
  %t195 = inttoptr i64 %t194 to ptr
  %t196 = call fastcc i64%t195(i64 %t191, i64 2, i64 %t190, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t197 = call i64 @rt_cons(i64 %t189, i64 %t196)
  ret i64 %t197
}

define fastcc i64 @"scheme.base:code_60"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t202 = icmp sge i64 %argc, 0
  br i1 %t202, label %argok47, label %arityerr46
arityerr46:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok47:
  %t203 = call ptr @rt_alloc_words(i64 8)
  %t204 = getelementptr i64, ptr %t203, i64 0
  store i64 %a0, ptr %t204
  %t205 = getelementptr i64, ptr %t203, i64 1
  store i64 %a1, ptr %t205
  %t206 = getelementptr i64, ptr %t203, i64 2
  store i64 %a2, ptr %t206
  %t207 = getelementptr i64, ptr %t203, i64 3
  store i64 %a3, ptr %t207
  %t208 = getelementptr i64, ptr %t203, i64 4
  store i64 %a4, ptr %t208
  %t209 = getelementptr i64, ptr %t203, i64 5
  store i64 %a5, ptr %t209
  %t210 = getelementptr i64, ptr %t203, i64 6
  store i64 %a6, ptr %t210
  %t211 = getelementptr i64, ptr %t203, i64 7
  store i64 %a7, ptr %t211
  %t212 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t203, ptr %overflow)
  %t213 = call i64 @rt_null_p(i64 %t212)
  %t214 = icmp ne i64 %t213, 1
  br i1 %t214, label %then48, label %else49
then48:
  ret i64 2
else49:
  %t215 = call i64 @rt_cdr(i64 %t212)
  %t216 = call i64 @rt_null_p(i64 %t215)
  %t217 = icmp ne i64 %t216, 1
  br i1 %t217, label %then50, label %else51
then50:
  %t218 = call i64 @rt_car(i64 %t212)
  ret i64 %t218
else51:
  %t219 = call i64 @rt_car(i64 %t212)
  %t220 = call i64 @rt_cdr(i64 %t212)
  %t221 = load i64, ptr @"scheme.base:append"
  %t222 = and i64 %t221, -8
  %t223 = inttoptr i64 %t222 to ptr
  %t224 = load i64, ptr %t223
  %t225 = inttoptr i64 %t224 to ptr
  %t226 = call i64 @rt_list_length(i64 %t220)
  %t227 = add i64 0, %t226
  %t228 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t220, i64 8)
  %t240 = getelementptr i64, ptr %t228, i64 0
  %t232 = load i64, ptr %t240
  %t241 = getelementptr i64, ptr %t228, i64 1
  %t233 = load i64, ptr %t241
  %t242 = getelementptr i64, ptr %t228, i64 2
  %t234 = load i64, ptr %t242
  %t243 = getelementptr i64, ptr %t228, i64 3
  %t235 = load i64, ptr %t243
  %t244 = getelementptr i64, ptr %t228, i64 4
  %t236 = load i64, ptr %t244
  %t245 = getelementptr i64, ptr %t228, i64 5
  %t237 = load i64, ptr %t245
  %t246 = getelementptr i64, ptr %t228, i64 6
  %t238 = load i64, ptr %t246
  %t247 = getelementptr i64, ptr %t228, i64 7
  %t239 = load i64, ptr %t247
  %t229 = icmp sgt i64 %t227, 8
  %t230 = getelementptr i64, ptr %t228, i64 8
  %t231 = select i1 %t229, ptr %t230, ptr null
  %t248 = call fastcc i64%t225(i64 %t221, i64 %t227, i64 %t232, i64 %t233, i64 %t234, i64 %t235, i64 %t236, i64 %t237, i64 %t238, i64 %t239, ptr %t231)
  %t249 = load i64, ptr @"scheme.base:%append2"
  %t250 = and i64 %t249, -8
  %t251 = inttoptr i64 %t250 to ptr
  %t252 = load i64, ptr %t251
  %t253 = inttoptr i64 %t252 to ptr
  %t254 = musttail call fastcc i64 %t253(i64 %t249, i64 2, i64 %t219, i64 %t248, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t254
}

define fastcc i64 @"scheme.base:code_64"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t259 = icmp eq i64 %argc, 2
  br i1 %t259, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok53:
  %t260 = call i64 @rt_null_p(i64 %a1)
  %t261 = icmp ne i64 %t260, 1
  br i1 %t261, label %then54, label %else55
then54:
  ret i64 2
else55:
  %t262 = call i64 @rt_car(i64 %a1)
  %t263 = and i64 %a0, -8
  %t264 = inttoptr i64 %t263 to ptr
  %t265 = load i64, ptr %t264
  %t266 = inttoptr i64 %t265 to ptr
  %t267 = call fastcc i64%t266(i64 %a0, i64 1, i64 %t262, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t268 = call i64 @rt_cdr(i64 %a1)
  %t269 = load i64, ptr @"scheme.base:%map1"
  %t270 = and i64 %t269, -8
  %t271 = inttoptr i64 %t270 to ptr
  %t272 = load i64, ptr %t271
  %t273 = inttoptr i64 %t272 to ptr
  %t274 = call fastcc i64%t273(i64 %t269, i64 2, i64 %a0, i64 %t268, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t275 = call i64 @rt_cons(i64 %t267, i64 %t274)
  ret i64 %t275
}

define fastcc i64 @"scheme.base:code_67"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t280 = icmp eq i64 %argc, 1
  br i1 %t280, label %argok57, label %arityerr56
arityerr56:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok57:
  %t281 = call i64 @rt_null_p(i64 %a0)
  %t282 = icmp ne i64 %t281, 1
  br i1 %t282, label %then58, label %else59
then58:
  ret i64 1
else59:
  %t283 = call i64 @rt_car(i64 %a0)
  %t284 = call i64 @rt_null_p(i64 %t283)
  %t285 = icmp ne i64 %t284, 1
  br i1 %t285, label %then60, label %else61
then60:
  ret i64 257
else61:
  %t286 = call i64 @rt_cdr(i64 %a0)
  %t287 = load i64, ptr @"scheme.base:%any-null?"
  %t288 = and i64 %t287, -8
  %t289 = inttoptr i64 %t288 to ptr
  %t290 = load i64, ptr %t289
  %t291 = inttoptr i64 %t290 to ptr
  %t292 = musttail call fastcc i64 %t291(i64 %t287, i64 1, i64 %t286, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t292
}

define fastcc i64 @"scheme.base:code_75"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t297 = icmp eq i64 %argc, 1
  br i1 %t297, label %argok63, label %arityerr62
arityerr62:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok63:
  %t298 = call i64 @rt_car(i64 %a0)
  ret i64 %t298
}

define fastcc i64 @"scheme.base:code_77"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t299 = icmp eq i64 %argc, 1
  br i1 %t299, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok65:
  %t300 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t300
}

define fastcc i64 @"scheme.base:code_73"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t301 = icmp eq i64 %argc, 2
  br i1 %t301, label %argok67, label %arityerr66
arityerr66:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok67:
  %t302 = load i64, ptr @"scheme.base:%any-null?"
  %t303 = and i64 %t302, -8
  %t304 = inttoptr i64 %t303 to ptr
  %t305 = load i64, ptr %t304
  %t306 = inttoptr i64 %t305 to ptr
  %t307 = call fastcc i64%t306(i64 %t302, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t308 = icmp ne i64 %t307, 1
  br i1 %t308, label %then68, label %else69
then68:
  ret i64 2
else69:
  %t309 = call ptr @rt_alloc_words(i64 1)
  %t310 = ptrtoint ptr %t309 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_75" to i64), ptr %t309
  %t311 = or i64 %t310, 4
  %t312 = load i64, ptr @"scheme.base:%map1"
  %t313 = and i64 %t312, -8
  %t314 = inttoptr i64 %t313 to ptr
  %t315 = load i64, ptr %t314
  %t316 = inttoptr i64 %t315 to ptr
  %t317 = call fastcc i64%t316(i64 %t312, i64 2, i64 %t311, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t318 = and i64 %a0, -8
  %t319 = inttoptr i64 %t318 to ptr
  %t320 = load i64, ptr %t319
  %t321 = inttoptr i64 %t320 to ptr
  %t322 = call i64 @rt_list_length(i64 %t317)
  %t323 = add i64 0, %t322
  %t324 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t317, i64 8)
  %t336 = getelementptr i64, ptr %t324, i64 0
  %t328 = load i64, ptr %t336
  %t337 = getelementptr i64, ptr %t324, i64 1
  %t329 = load i64, ptr %t337
  %t338 = getelementptr i64, ptr %t324, i64 2
  %t330 = load i64, ptr %t338
  %t339 = getelementptr i64, ptr %t324, i64 3
  %t331 = load i64, ptr %t339
  %t340 = getelementptr i64, ptr %t324, i64 4
  %t332 = load i64, ptr %t340
  %t341 = getelementptr i64, ptr %t324, i64 5
  %t333 = load i64, ptr %t341
  %t342 = getelementptr i64, ptr %t324, i64 6
  %t334 = load i64, ptr %t342
  %t343 = getelementptr i64, ptr %t324, i64 7
  %t335 = load i64, ptr %t343
  %t325 = icmp sgt i64 %t323, 8
  %t326 = getelementptr i64, ptr %t324, i64 8
  %t327 = select i1 %t325, ptr %t326, ptr null
  %t344 = call fastcc i64%t321(i64 %a0, i64 %t323, i64 %t328, i64 %t329, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 %t334, i64 %t335, ptr %t327)
  %t345 = call ptr @rt_alloc_words(i64 1)
  %t346 = ptrtoint ptr %t345 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_77" to i64), ptr %t345
  %t347 = or i64 %t346, 4
  %t348 = load i64, ptr @"scheme.base:%map1"
  %t349 = and i64 %t348, -8
  %t350 = inttoptr i64 %t349 to ptr
  %t351 = load i64, ptr %t350
  %t352 = inttoptr i64 %t351 to ptr
  %t353 = call fastcc i64%t352(i64 %t348, i64 2, i64 %t347, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t354 = load i64, ptr @"scheme.base:%mapn"
  %t355 = and i64 %t354, -8
  %t356 = inttoptr i64 %t355 to ptr
  %t357 = load i64, ptr %t356
  %t358 = inttoptr i64 %t357 to ptr
  %t359 = call fastcc i64%t358(i64 %t354, i64 2, i64 %a0, i64 %t353, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t360 = call i64 @rt_cons(i64 %t344, i64 %t359)
  ret i64 %t360
}

define fastcc i64 @"scheme.base:code_82"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t365 = icmp sge i64 %argc, 2
  br i1 %t365, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t366 = call ptr @rt_alloc_words(i64 8)
  %t367 = getelementptr i64, ptr %t366, i64 0
  store i64 %a0, ptr %t367
  %t368 = getelementptr i64, ptr %t366, i64 1
  store i64 %a1, ptr %t368
  %t369 = getelementptr i64, ptr %t366, i64 2
  store i64 %a2, ptr %t369
  %t370 = getelementptr i64, ptr %t366, i64 3
  store i64 %a3, ptr %t370
  %t371 = getelementptr i64, ptr %t366, i64 4
  store i64 %a4, ptr %t371
  %t372 = getelementptr i64, ptr %t366, i64 5
  store i64 %a5, ptr %t372
  %t373 = getelementptr i64, ptr %t366, i64 6
  store i64 %a6, ptr %t373
  %t374 = getelementptr i64, ptr %t366, i64 7
  store i64 %a7, ptr %t374
  %t375 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t366, ptr %overflow)
  %t376 = call i64 @rt_null_p(i64 %t375)
  %t377 = icmp ne i64 %t376, 1
  br i1 %t377, label %then72, label %else73
then72:
  %t378 = load i64, ptr @"scheme.base:%map1"
  %t379 = and i64 %t378, -8
  %t380 = inttoptr i64 %t379 to ptr
  %t381 = load i64, ptr %t380
  %t382 = inttoptr i64 %t381 to ptr
  %t383 = musttail call fastcc i64 %t382(i64 %t378, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t383
else73:
  %t384 = call i64 @rt_cons(i64 %a1, i64 %t375)
  %t385 = load i64, ptr @"scheme.base:%mapn"
  %t386 = and i64 %t385, -8
  %t387 = inttoptr i64 %t386 to ptr
  %t388 = load i64, ptr %t387
  %t389 = inttoptr i64 %t388 to ptr
  %t390 = musttail call fastcc i64 %t389(i64 %t385, i64 2, i64 %a0, i64 %t384, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t390
}

define fastcc i64 @"scheme.base:code_90"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t395 = icmp eq i64 %argc, 2
  br i1 %t395, label %argok75, label %arityerr74
arityerr74:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok75:
  %t396 = call i64 @rt_null_p(i64 %a1)
  %t397 = icmp ne i64 %t396, 1
  br i1 %t397, label %then76, label %else77
then76:
  ret i64 1
else77:
  %t398 = call i64 @rt_car(i64 %a1)
  %t399 = call i64 @rt_eq_p(i64 %a0, i64 %t398)
  %t400 = icmp ne i64 %t399, 1
  br i1 %t400, label %then78, label %else79
then78:
  ret i64 %a1
else79:
  %t401 = call i64 @rt_cdr(i64 %a1)
  %t402 = load i64, ptr @"scheme.base:memq"
  %t403 = and i64 %t402, -8
  %t404 = inttoptr i64 %t403 to ptr
  %t405 = load i64, ptr %t404
  %t406 = inttoptr i64 %t405 to ptr
  %t407 = musttail call fastcc i64 %t406(i64 %t402, i64 2, i64 %a0, i64 %t401, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t407
}

define fastcc i64 @"scheme.base:code_98"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t412 = icmp eq i64 %argc, 2
  br i1 %t412, label %argok81, label %arityerr80
arityerr80:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok81:
  %t413 = call i64 @rt_null_p(i64 %a1)
  %t414 = icmp ne i64 %t413, 1
  br i1 %t414, label %then82, label %else83
then82:
  ret i64 1
else83:
  %t415 = call i64 @rt_car(i64 %a1)
  %t416 = call i64 @rt_eqv_p(i64 %a0, i64 %t415)
  %t417 = icmp ne i64 %t416, 1
  br i1 %t417, label %then84, label %else85
then84:
  ret i64 %a1
else85:
  %t418 = call i64 @rt_cdr(i64 %a1)
  %t419 = load i64, ptr @"scheme.base:memv"
  %t420 = and i64 %t419, -8
  %t421 = inttoptr i64 %t420 to ptr
  %t422 = load i64, ptr %t421
  %t423 = inttoptr i64 %t422 to ptr
  %t424 = musttail call fastcc i64 %t423(i64 %t419, i64 2, i64 %a0, i64 %t418, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t424
}

define fastcc i64 @"scheme.base:code_106"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t429 = icmp eq i64 %argc, 2
  br i1 %t429, label %argok87, label %arityerr86
arityerr86:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok87:
  %t430 = call i64 @rt_null_p(i64 %a1)
  %t431 = icmp ne i64 %t430, 1
  br i1 %t431, label %then88, label %else89
then88:
  ret i64 1
else89:
  %t432 = call i64 @rt_car(i64 %a1)
  %t433 = call i64 @rt_car(i64 %t432)
  %t434 = call i64 @rt_eq_p(i64 %a0, i64 %t433)
  %t435 = icmp ne i64 %t434, 1
  br i1 %t435, label %then90, label %else91
then90:
  %t436 = call i64 @rt_car(i64 %a1)
  ret i64 %t436
else91:
  %t437 = call i64 @rt_cdr(i64 %a1)
  %t438 = load i64, ptr @"scheme.base:assq"
  %t439 = and i64 %t438, -8
  %t440 = inttoptr i64 %t439 to ptr
  %t441 = load i64, ptr %t440
  %t442 = inttoptr i64 %t441 to ptr
  %t443 = musttail call fastcc i64 %t442(i64 %t438, i64 2, i64 %a0, i64 %t437, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t443
}

define fastcc i64 @"scheme.base:code_110"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t448 = icmp eq i64 %argc, 2
  br i1 %t448, label %argok93, label %arityerr92
arityerr92:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok93:
  %t449 = call i64 @rt_null_p(i64 %a1)
  %t450 = icmp ne i64 %t449, 1
  br i1 %t450, label %then94, label %else95
then94:
  ret i64 1
else95:
  %t451 = call i64 @rt_car(i64 %a1)
  %t452 = call i64 @rt_equal(i64 %a0, i64 %t451)
  %t453 = icmp ne i64 %t452, 1
  br i1 %t453, label %then96, label %else97
then96:
  ret i64 %a1
else97:
  %t454 = call i64 @rt_cdr(i64 %a1)
  %t455 = load i64, ptr @"scheme.base:member"
  %t456 = and i64 %t455, -8
  %t457 = inttoptr i64 %t456 to ptr
  %t458 = load i64, ptr %t457
  %t459 = inttoptr i64 %t458 to ptr
  %t460 = musttail call fastcc i64 %t459(i64 %t455, i64 2, i64 %a0, i64 %t454, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t460
}

define fastcc i64 @"scheme.base:code_114"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t465 = icmp eq i64 %argc, 2
  br i1 %t465, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok99:
  %t466 = call i64 @rt_null_p(i64 %a1)
  %t467 = icmp ne i64 %t466, 1
  br i1 %t467, label %then100, label %else101
then100:
  ret i64 1
else101:
  %t468 = call i64 @rt_car(i64 %a1)
  %t469 = call i64 @rt_car(i64 %t468)
  %t470 = call i64 @rt_equal(i64 %a0, i64 %t469)
  %t471 = icmp ne i64 %t470, 1
  br i1 %t471, label %then102, label %else103
then102:
  %t472 = call i64 @rt_car(i64 %a1)
  ret i64 %t472
else103:
  %t473 = call i64 @rt_cdr(i64 %a1)
  %t474 = load i64, ptr @"scheme.base:assoc"
  %t475 = and i64 %t474, -8
  %t476 = inttoptr i64 %t475 to ptr
  %t477 = load i64, ptr %t476
  %t478 = inttoptr i64 %t477 to ptr
  %t479 = musttail call fastcc i64 %t478(i64 %t474, i64 2, i64 %a0, i64 %t473, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t479
}

define fastcc i64 @"scheme.base:code_118"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t484 = icmp eq i64 %argc, 2
  br i1 %t484, label %argok105, label %arityerr104
arityerr104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok105:
  %t485 = call i64 @rt_null_p(i64 %a1)
  %t486 = icmp ne i64 %t485, 1
  br i1 %t486, label %then106, label %else107
then106:
  ret i64 2
else107:
  %t487 = call i64 @rt_car(i64 %a1)
  %t488 = and i64 %a0, -8
  %t489 = inttoptr i64 %t488 to ptr
  %t490 = load i64, ptr %t489
  %t491 = inttoptr i64 %t490 to ptr
  %t492 = call fastcc i64%t491(i64 %a0, i64 1, i64 %t487, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t493 = icmp ne i64 %t492, 1
  br i1 %t493, label %then108, label %else109
then108:
  %t494 = call i64 @rt_car(i64 %a1)
  %t495 = call i64 @rt_cdr(i64 %a1)
  %t496 = load i64, ptr @"scheme.base:filter"
  %t497 = and i64 %t496, -8
  %t498 = inttoptr i64 %t497 to ptr
  %t499 = load i64, ptr %t498
  %t500 = inttoptr i64 %t499 to ptr
  %t501 = call fastcc i64%t500(i64 %t496, i64 2, i64 %a0, i64 %t495, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t502 = call i64 @rt_cons(i64 %t494, i64 %t501)
  ret i64 %t502
else109:
  %t503 = call i64 @rt_cdr(i64 %a1)
  %t504 = load i64, ptr @"scheme.base:filter"
  %t505 = and i64 %t504, -8
  %t506 = inttoptr i64 %t505 to ptr
  %t507 = load i64, ptr %t506
  %t508 = inttoptr i64 %t507 to ptr
  %t509 = musttail call fastcc i64 %t508(i64 %t504, i64 2, i64 %a0, i64 %t503, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t509
}

define fastcc i64 @"scheme.base:code_123"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t514 = icmp eq i64 %argc, 3
  br i1 %t514, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok111:
  %t515 = call i64 @rt_null_p(i64 %a2)
  %t516 = icmp ne i64 %t515, 1
  br i1 %t516, label %then112, label %else113
then112:
  ret i64 %a1
else113:
  %t517 = call i64 @rt_car(i64 %a2)
  %t518 = and i64 %a0, -8
  %t519 = inttoptr i64 %t518 to ptr
  %t520 = load i64, ptr %t519
  %t521 = inttoptr i64 %t520 to ptr
  %t522 = call fastcc i64%t521(i64 %a0, i64 2, i64 %a1, i64 %t517, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t523 = call i64 @rt_cdr(i64 %a2)
  %t524 = load i64, ptr @"scheme.base:fold-left"
  %t525 = and i64 %t524, -8
  %t526 = inttoptr i64 %t525 to ptr
  %t527 = load i64, ptr %t526
  %t528 = inttoptr i64 %t527 to ptr
  %t529 = musttail call fastcc i64 %t528(i64 %t524, i64 3, i64 %a0, i64 %t522, i64 %t523, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t529
}

define fastcc i64 @"scheme.base:code_128"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t534 = icmp eq i64 %argc, 3
  br i1 %t534, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok115:
  %t535 = call i64 @rt_null_p(i64 %a2)
  %t536 = icmp ne i64 %t535, 1
  br i1 %t536, label %then116, label %else117
then116:
  ret i64 %a1
else117:
  %t537 = call i64 @rt_car(i64 %a2)
  %t538 = call i64 @rt_cdr(i64 %a2)
  %t539 = load i64, ptr @"scheme.base:fold-right"
  %t540 = and i64 %t539, -8
  %t541 = inttoptr i64 %t540 to ptr
  %t542 = load i64, ptr %t541
  %t543 = inttoptr i64 %t542 to ptr
  %t544 = call fastcc i64%t543(i64 %t539, i64 3, i64 %a0, i64 %a1, i64 %t538, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t545 = and i64 %a0, -8
  %t546 = inttoptr i64 %t545 to ptr
  %t547 = load i64, ptr %t546
  %t548 = inttoptr i64 %t547 to ptr
  %t549 = musttail call fastcc i64 %t548(i64 %a0, i64 2, i64 %t537, i64 %t544, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t549
}

define fastcc i64 @"scheme.base:code_132"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t554 = icmp eq i64 %argc, 2
  br i1 %t554, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t555 = call i64 @rt_null_p(i64 %a1)
  %t556 = icmp ne i64 %t555, 1
  br i1 %t556, label %then120, label %else121
then120:
  %t557 = icmp ne i64 1, 1
  br i1 %t557, label %then122, label %else123
then122:
  ret i64 1
else123:
  ret i64 17
else121:
  %t558 = call i64 @rt_car(i64 %a1)
  %t559 = and i64 %a0, -8
  %t560 = inttoptr i64 %t559 to ptr
  %t561 = load i64, ptr %t560
  %t562 = inttoptr i64 %t561 to ptr
  %t563 = call fastcc i64%t562(i64 %a0, i64 1, i64 %t558, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t564 = call i64 @rt_cdr(i64 %a1)
  %t565 = load i64, ptr @"scheme.base:%for-each1"
  %t566 = and i64 %t565, -8
  %t567 = inttoptr i64 %t566 to ptr
  %t568 = load i64, ptr %t567
  %t569 = inttoptr i64 %t568 to ptr
  %t570 = musttail call fastcc i64 %t569(i64 %t565, i64 2, i64 %a0, i64 %t564, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t570
}

define fastcc i64 @"scheme.base:code_140"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t575 = icmp eq i64 %argc, 1
  br i1 %t575, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok125:
  %t576 = call i64 @rt_car(i64 %a0)
  ret i64 %t576
}

define fastcc i64 @"scheme.base:code_142"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t577 = icmp eq i64 %argc, 1
  br i1 %t577, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok127:
  %t578 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t578
}

define fastcc i64 @"scheme.base:code_138"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t579 = icmp eq i64 %argc, 2
  br i1 %t579, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t580 = load i64, ptr @"scheme.base:%any-null?"
  %t581 = and i64 %t580, -8
  %t582 = inttoptr i64 %t581 to ptr
  %t583 = load i64, ptr %t582
  %t584 = inttoptr i64 %t583 to ptr
  %t585 = call fastcc i64%t584(i64 %t580, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t586 = icmp ne i64 %t585, 1
  br i1 %t586, label %then130, label %else131
then130:
  %t587 = icmp ne i64 1, 1
  br i1 %t587, label %then132, label %else133
then132:
  ret i64 1
else133:
  ret i64 17
else131:
  %t588 = call ptr @rt_alloc_words(i64 1)
  %t589 = ptrtoint ptr %t588 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_140" to i64), ptr %t588
  %t590 = or i64 %t589, 4
  %t591 = load i64, ptr @"scheme.base:%map1"
  %t592 = and i64 %t591, -8
  %t593 = inttoptr i64 %t592 to ptr
  %t594 = load i64, ptr %t593
  %t595 = inttoptr i64 %t594 to ptr
  %t596 = call fastcc i64%t595(i64 %t591, i64 2, i64 %t590, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t597 = and i64 %a0, -8
  %t598 = inttoptr i64 %t597 to ptr
  %t599 = load i64, ptr %t598
  %t600 = inttoptr i64 %t599 to ptr
  %t601 = call i64 @rt_list_length(i64 %t596)
  %t602 = add i64 0, %t601
  %t603 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t596, i64 8)
  %t615 = getelementptr i64, ptr %t603, i64 0
  %t607 = load i64, ptr %t615
  %t616 = getelementptr i64, ptr %t603, i64 1
  %t608 = load i64, ptr %t616
  %t617 = getelementptr i64, ptr %t603, i64 2
  %t609 = load i64, ptr %t617
  %t618 = getelementptr i64, ptr %t603, i64 3
  %t610 = load i64, ptr %t618
  %t619 = getelementptr i64, ptr %t603, i64 4
  %t611 = load i64, ptr %t619
  %t620 = getelementptr i64, ptr %t603, i64 5
  %t612 = load i64, ptr %t620
  %t621 = getelementptr i64, ptr %t603, i64 6
  %t613 = load i64, ptr %t621
  %t622 = getelementptr i64, ptr %t603, i64 7
  %t614 = load i64, ptr %t622
  %t604 = icmp sgt i64 %t602, 8
  %t605 = getelementptr i64, ptr %t603, i64 8
  %t606 = select i1 %t604, ptr %t605, ptr null
  %t623 = call fastcc i64%t600(i64 %a0, i64 %t602, i64 %t607, i64 %t608, i64 %t609, i64 %t610, i64 %t611, i64 %t612, i64 %t613, i64 %t614, ptr %t606)
  %t624 = call ptr @rt_alloc_words(i64 1)
  %t625 = ptrtoint ptr %t624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_142" to i64), ptr %t624
  %t626 = or i64 %t625, 4
  %t627 = load i64, ptr @"scheme.base:%map1"
  %t628 = and i64 %t627, -8
  %t629 = inttoptr i64 %t628 to ptr
  %t630 = load i64, ptr %t629
  %t631 = inttoptr i64 %t630 to ptr
  %t632 = call fastcc i64%t631(i64 %t627, i64 2, i64 %t626, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t633 = load i64, ptr @"scheme.base:%for-eachn"
  %t634 = and i64 %t633, -8
  %t635 = inttoptr i64 %t634 to ptr
  %t636 = load i64, ptr %t635
  %t637 = inttoptr i64 %t636 to ptr
  %t638 = musttail call fastcc i64 %t637(i64 %t633, i64 2, i64 %a0, i64 %t632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t638
}

define fastcc i64 @"scheme.base:code_147"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t643 = icmp sge i64 %argc, 2
  br i1 %t643, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok135:
  %t644 = call ptr @rt_alloc_words(i64 8)
  %t645 = getelementptr i64, ptr %t644, i64 0
  store i64 %a0, ptr %t645
  %t646 = getelementptr i64, ptr %t644, i64 1
  store i64 %a1, ptr %t646
  %t647 = getelementptr i64, ptr %t644, i64 2
  store i64 %a2, ptr %t647
  %t648 = getelementptr i64, ptr %t644, i64 3
  store i64 %a3, ptr %t648
  %t649 = getelementptr i64, ptr %t644, i64 4
  store i64 %a4, ptr %t649
  %t650 = getelementptr i64, ptr %t644, i64 5
  store i64 %a5, ptr %t650
  %t651 = getelementptr i64, ptr %t644, i64 6
  store i64 %a6, ptr %t651
  %t652 = getelementptr i64, ptr %t644, i64 7
  store i64 %a7, ptr %t652
  %t653 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t644, ptr %overflow)
  %t654 = call i64 @rt_null_p(i64 %t653)
  %t655 = icmp ne i64 %t654, 1
  br i1 %t655, label %then136, label %else137
then136:
  %t656 = load i64, ptr @"scheme.base:%for-each1"
  %t657 = and i64 %t656, -8
  %t658 = inttoptr i64 %t657 to ptr
  %t659 = load i64, ptr %t658
  %t660 = inttoptr i64 %t659 to ptr
  %t661 = musttail call fastcc i64 %t660(i64 %t656, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t661
else137:
  %t662 = call i64 @rt_cons(i64 %a1, i64 %t653)
  %t663 = load i64, ptr @"scheme.base:%for-eachn"
  %t664 = and i64 %t663, -8
  %t665 = inttoptr i64 %t664 to ptr
  %t666 = load i64, ptr %t665
  %t667 = inttoptr i64 %t666 to ptr
  %t668 = musttail call fastcc i64 %t667(i64 %t663, i64 2, i64 %a0, i64 %t662, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t668
}

define fastcc i64 @"scheme.base:code_151"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t673 = icmp eq i64 %argc, 2
  br i1 %t673, label %argok139, label %arityerr138
arityerr138:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok139:
  %t674 = call i64 @rt_null_p(i64 %a1)
  %t675 = icmp ne i64 %t674, 1
  br i1 %t675, label %then140, label %else141
then140:
  ret i64 257
else141:
  %t676 = call i64 @rt_car(i64 %a1)
  %t677 = and i64 %a0, -8
  %t678 = inttoptr i64 %t677 to ptr
  %t679 = load i64, ptr %t678
  %t680 = inttoptr i64 %t679 to ptr
  %t681 = call fastcc i64%t680(i64 %a0, i64 1, i64 %t676, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t682 = icmp ne i64 %t681, 1
  br i1 %t682, label %then142, label %else143
then142:
  %t683 = call i64 @rt_cdr(i64 %a1)
  %t684 = load i64, ptr @"scheme.base:andmap"
  %t685 = and i64 %t684, -8
  %t686 = inttoptr i64 %t685 to ptr
  %t687 = load i64, ptr %t686
  %t688 = inttoptr i64 %t687 to ptr
  %t689 = musttail call fastcc i64 %t688(i64 %t684, i64 2, i64 %a0, i64 %t683, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t689
else143:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_155"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t694 = icmp eq i64 %argc, 2
  br i1 %t694, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok145:
  %t695 = call i64 @rt_null_p(i64 %a1)
  %t696 = icmp ne i64 %t695, 1
  br i1 %t696, label %then146, label %else147
then146:
  ret i64 1
else147:
  %t697 = call i64 @rt_car(i64 %a1)
  %t698 = and i64 %a0, -8
  %t699 = inttoptr i64 %t698 to ptr
  %t700 = load i64, ptr %t699
  %t701 = inttoptr i64 %t700 to ptr
  %t702 = call fastcc i64%t701(i64 %a0, i64 1, i64 %t697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t703 = icmp ne i64 %t702, 1
  br i1 %t703, label %then148, label %else149
then148:
  ret i64 %a1
else149:
  %t704 = call i64 @rt_cdr(i64 %a1)
  %t705 = load i64, ptr @"scheme.base:memp"
  %t706 = and i64 %t705, -8
  %t707 = inttoptr i64 %t706 to ptr
  %t708 = load i64, ptr %t707
  %t709 = inttoptr i64 %t708 to ptr
  %t710 = musttail call fastcc i64 %t709(i64 %t705, i64 2, i64 %a0, i64 %t704, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t710
}

define fastcc i64 @"scheme.base:code_158"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t715 = icmp eq i64 %argc, 1
  br i1 %t715, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok151:
  %t716 = load i64, ptr @"scheme.base:cdddr"
  %t717 = and i64 %t716, -8
  %t718 = inttoptr i64 %t717 to ptr
  %t719 = load i64, ptr %t718
  %t720 = inttoptr i64 %t719 to ptr
  %t721 = call fastcc i64%t720(i64 %t716, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t722 = call i64 @rt_car(i64 %t721)
  ret i64 %t722
}

define fastcc i64 @"scheme.base:code_161"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t727 = icmp eq i64 %argc, 1
  br i1 %t727, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok153:
  %t728 = call i64 @rt_null_p(i64 %a0)
  %t729 = icmp ne i64 %t728, 1
  br i1 %t729, label %then154, label %else155
then154:
  ret i64 257
else155:
  %t730 = call i64 @rt_pair_p(i64 %a0)
  %t731 = icmp ne i64 %t730, 1
  br i1 %t731, label %then156, label %else157
then156:
  %t732 = call i64 @rt_cdr(i64 %a0)
  %t733 = load i64, ptr @"scheme.base:list?"
  %t734 = and i64 %t733, -8
  %t735 = inttoptr i64 %t734 to ptr
  %t736 = load i64, ptr %t735
  %t737 = inttoptr i64 %t736 to ptr
  %t738 = musttail call fastcc i64 %t737(i64 %t733, i64 1, i64 %t732, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t738
else157:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_168"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t743 = icmp eq i64 %argc, 1
  br i1 %t743, label %argok159, label %arityerr158
arityerr158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok159:
  %t744 = or i64 %a0, 0
  %t745 = and i64 %t744, 7
  %t746 = icmp eq i64 %t745, 0
  br i1 %t746, label %fixfast160, label %fixslow161
fixfast160:
  %t747 = icmp eq i64 %a0, 0
  %t748 = select i1 %t747, i64 257, i64 1
  br label %fixmerge162
fixslow161:
  %t749 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge162
fixmerge162:
  %t750 = phi i64 [ %t748, %fixfast160 ], [ %t749, %fixslow161 ]
  ret i64 %t750
}

define fastcc i64 @"scheme.base:code_172"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t755 = icmp eq i64 %argc, 2
  br i1 %t755, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok164:
  %t756 = load i64, ptr @"scheme.base:zero?"
  %t757 = and i64 %t756, -8
  %t758 = inttoptr i64 %t757 to ptr
  %t759 = load i64, ptr %t758
  %t760 = inttoptr i64 %t759 to ptr
  %t761 = call fastcc i64%t760(i64 %t756, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t762 = icmp ne i64 %t761, 1
  br i1 %t762, label %then165, label %else166
then165:
  ret i64 %a0
else166:
  %t763 = call i64 @rt_cdr(i64 %a0)
  %t764 = or i64 %a1, 8
  %t765 = and i64 %t764, 7
  %t766 = icmp eq i64 %t765, 0
  br i1 %t766, label %fixfast167, label %fixslow168
fixfast167:
  %t767 = sub i64 %a1, 8
  br label %fixmerge169
fixslow168:
  %t768 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge169
fixmerge169:
  %t769 = phi i64 [ %t767, %fixfast167 ], [ %t768, %fixslow168 ]
  %t770 = load i64, ptr @"scheme.base:list-tail"
  %t771 = and i64 %t770, -8
  %t772 = inttoptr i64 %t771 to ptr
  %t773 = load i64, ptr %t772
  %t774 = inttoptr i64 %t773 to ptr
  %t775 = musttail call fastcc i64 %t774(i64 %t770, i64 2, i64 %t763, i64 %t769, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t775
}

define fastcc i64 @"scheme.base:code_176"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t780 = icmp eq i64 %argc, 2
  br i1 %t780, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
  %t781 = load i64, ptr @"scheme.base:list-tail"
  %t782 = and i64 %t781, -8
  %t783 = inttoptr i64 %t782 to ptr
  %t784 = load i64, ptr %t783
  %t785 = inttoptr i64 %t784 to ptr
  %t786 = call fastcc i64%t785(i64 %t781, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t787 = call i64 @rt_car(i64 %t786)
  ret i64 %t787
}

define fastcc i64 @"scheme.base:code_180"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t792 = icmp eq i64 %argc, 2
  br i1 %t792, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok173:
  %t793 = load i64, ptr @"scheme.base:zero?"
  %t794 = and i64 %t793, -8
  %t795 = inttoptr i64 %t794 to ptr
  %t796 = load i64, ptr %t795
  %t797 = inttoptr i64 %t796 to ptr
  %t798 = call fastcc i64%t797(i64 %t793, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t799 = icmp ne i64 %t798, 1
  br i1 %t799, label %then174, label %else175
then174:
  ret i64 2
else175:
  %t800 = call i64 @rt_car(i64 %a0)
  %t801 = call i64 @rt_cdr(i64 %a0)
  %t802 = or i64 %a1, 8
  %t803 = and i64 %t802, 7
  %t804 = icmp eq i64 %t803, 0
  br i1 %t804, label %fixfast176, label %fixslow177
fixfast176:
  %t805 = sub i64 %a1, 8
  br label %fixmerge178
fixslow177:
  %t806 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge178
fixmerge178:
  %t807 = phi i64 [ %t805, %fixfast176 ], [ %t806, %fixslow177 ]
  %t808 = load i64, ptr @"scheme.base:list-head"
  %t809 = and i64 %t808, -8
  %t810 = inttoptr i64 %t809 to ptr
  %t811 = load i64, ptr %t810
  %t812 = inttoptr i64 %t811 to ptr
  %t813 = call fastcc i64%t812(i64 %t808, i64 2, i64 %t801, i64 %t807, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t814 = call i64 @rt_cons(i64 %t800, i64 %t813)
  ret i64 %t814
}

define fastcc i64 @"scheme.base:code_184"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t819 = icmp eq i64 %argc, 2
  br i1 %t819, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t820 = load i64, ptr @"scheme.base:zero?"
  %t821 = and i64 %t820, -8
  %t822 = inttoptr i64 %t821 to ptr
  %t823 = load i64, ptr %t822
  %t824 = inttoptr i64 %t823 to ptr
  %t825 = call fastcc i64%t824(i64 %t820, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t826 = icmp ne i64 %t825, 1
  br i1 %t826, label %then181, label %else182
then181:
  ret i64 2
else182:
  %t827 = or i64 %a0, 8
  %t828 = and i64 %t827, 7
  %t829 = icmp eq i64 %t828, 0
  br i1 %t829, label %fixfast183, label %fixslow184
fixfast183:
  %t830 = sub i64 %a0, 8
  br label %fixmerge185
fixslow184:
  %t831 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge185
fixmerge185:
  %t832 = phi i64 [ %t830, %fixfast183 ], [ %t831, %fixslow184 ]
  %t833 = load i64, ptr @"scheme.base:make-list"
  %t834 = and i64 %t833, -8
  %t835 = inttoptr i64 %t834 to ptr
  %t836 = load i64, ptr %t835
  %t837 = inttoptr i64 %t836 to ptr
  %t838 = call fastcc i64%t837(i64 %t833, i64 2, i64 %t832, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t839 = call i64 @rt_cons(i64 %a1, i64 %t838)
  ret i64 %t839
}

define fastcc i64 @"scheme.base:code_196"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t844 = icmp eq i64 %argc, 2
  br i1 %t844, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t845 = and i64 %self, -8
  %t846 = inttoptr i64 %t845 to ptr
  %t847 = getelementptr i64, ptr %t846, i64 1
  %t848 = load i64, ptr %t847
  %t849 = or i64 %a0, %t848
  %t850 = and i64 %t849, 7
  %t851 = icmp eq i64 %t850, 0
  br i1 %t851, label %fixfast188, label %fixslow189
fixfast188:
  %t852 = icmp eq i64 %a0, %t848
  %t853 = select i1 %t852, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t854 = call i64 @rt_num_eq(i64 %a0, i64 %t848)
  br label %fixmerge190
fixmerge190:
  %t855 = phi i64 [ %t853, %fixfast188 ], [ %t854, %fixslow189 ]
  %t856 = icmp ne i64 %t855, 1
  br i1 %t856, label %then191, label %else192
then191:
  %t857 = load i64, ptr @"scheme.base:reverse"
  %t858 = and i64 %t857, -8
  %t859 = inttoptr i64 %t858 to ptr
  %t860 = load i64, ptr %t859
  %t861 = inttoptr i64 %t860 to ptr
  %t862 = musttail call fastcc i64 %t861(i64 %t857, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t862
else192:
  %t863 = or i64 %a0, 8
  %t864 = and i64 %t863, 7
  %t865 = icmp eq i64 %t864, 0
  br i1 %t865, label %fixfast193, label %fixslow194
fixfast193:
  %t866 = add i64 %a0, 8
  br label %fixmerge195
fixslow194:
  %t867 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge195
fixmerge195:
  %t868 = phi i64 [ %t866, %fixfast193 ], [ %t867, %fixslow194 ]
  %t869 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t870 = musttail call fastcc i64 @"scheme.base:code_196"(i64 %self, i64 2, i64 %t868, i64 %t869, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t870
}

define fastcc i64 @"scheme.base:code_194"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t871 = icmp eq i64 %argc, 1
  br i1 %t871, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok197:
  %t872 = call ptr @rt_alloc_words(i64 3)
  %t873 = ptrtoint ptr %t872 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_196" to i64), ptr %t872
  %t874 = or i64 %t873, 4
  %t875 = getelementptr i64, ptr %t872, i64 1
  store i64 %a0, ptr %t875
  %t876 = getelementptr i64, ptr %t872, i64 2
  store i64 %t874, ptr %t876
  %t877 = and i64 %t874, -8
  %t878 = inttoptr i64 %t877 to ptr
  %t879 = load i64, ptr %t878
  %t880 = inttoptr i64 %t879 to ptr
  %t881 = musttail call fastcc i64 %t880(i64 %t874, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t881
}

define fastcc i64 @"scheme.base:code_204"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t886 = icmp eq i64 %argc, 2
  br i1 %t886, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok199:
  %t887 = or i64 %a0, %a1
  %t888 = and i64 %t887, 7
  %t889 = icmp eq i64 %t888, 0
  br i1 %t889, label %fixfast200, label %fixslow201
fixfast200:
  %t890 = icmp slt i64 %a0, %a1
  %t891 = select i1 %t890, i64 257, i64 1
  br label %fixmerge202
fixslow201:
  %t892 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge202
fixmerge202:
  %t893 = phi i64 [ %t891, %fixfast200 ], [ %t892, %fixslow201 ]
  %t894 = icmp ne i64 %t893, 1
  br i1 %t894, label %then203, label %else204
then203:
  ret i64 %a1
else204:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_206"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t899 = icmp eq i64 %argc, 0
  br i1 %t899, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok206:
  %t900 = icmp ne i64 1, 1
  br i1 %t900, label %then207, label %else208
then207:
  ret i64 1
else208:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_209"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t905 = icmp sge i64 %argc, 0
  br i1 %t905, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok210:
  %t906 = call ptr @rt_alloc_words(i64 8)
  %t907 = getelementptr i64, ptr %t906, i64 0
  store i64 %a0, ptr %t907
  %t908 = getelementptr i64, ptr %t906, i64 1
  store i64 %a1, ptr %t908
  %t909 = getelementptr i64, ptr %t906, i64 2
  store i64 %a2, ptr %t909
  %t910 = getelementptr i64, ptr %t906, i64 3
  store i64 %a3, ptr %t910
  %t911 = getelementptr i64, ptr %t906, i64 4
  store i64 %a4, ptr %t911
  %t912 = getelementptr i64, ptr %t906, i64 5
  store i64 %a5, ptr %t912
  %t913 = getelementptr i64, ptr %t906, i64 6
  store i64 %a6, ptr %t913
  %t914 = getelementptr i64, ptr %t906, i64 7
  store i64 %a7, ptr %t914
  %t915 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t906, ptr %overflow)
  %t916 = call i64 @rt_list_to_string(i64 %t915)
  ret i64 %t916
}

define fastcc i64 @"scheme.base:code_212"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t921 = icmp eq i64 %argc, 1
  br i1 %t921, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok212:
  %t922 = call i64 @rt_null_p(i64 %a0)
  %t923 = icmp ne i64 %t922, 1
  br i1 %t923, label %then213, label %else214
then213:
  %t924 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t924
else214:
  %t925 = call i64 @rt_car(i64 %a0)
  %t926 = call i64 @rt_cdr(i64 %a0)
  %t927 = load i64, ptr @"scheme.base:%str-concat"
  %t928 = and i64 %t927, -8
  %t929 = inttoptr i64 %t928 to ptr
  %t930 = load i64, ptr %t929
  %t931 = inttoptr i64 %t930 to ptr
  %t932 = call fastcc i64%t931(i64 %t927, i64 1, i64 %t926, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t933 = call i64 @rt_string_append(i64 %t925, i64 %t932)
  ret i64 %t933
}

define fastcc i64 @"scheme.base:code_218"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t938 = icmp eq i64 %argc, 4
  br i1 %t938, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok216:
  %t939 = call i64 @rt_char_to_integer(i64 %a1)
  %t940 = call i64 @rt_char_to_integer(i64 %a2)
  %t941 = and i64 %a0, -8
  %t942 = inttoptr i64 %t941 to ptr
  %t943 = load i64, ptr %t942
  %t944 = inttoptr i64 %t943 to ptr
  %t945 = call fastcc i64%t944(i64 %a0, i64 2, i64 %t939, i64 %t940, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t946 = icmp ne i64 %t945, 1
  br i1 %t946, label %then217, label %else218
then217:
  %t947 = call i64 @rt_null_p(i64 %a3)
  %t948 = icmp ne i64 %t947, 1
  br i1 %t948, label %then219, label %else220
then219:
  ret i64 257
else220:
  %t949 = call i64 @rt_car(i64 %a3)
  %t950 = call i64 @rt_cdr(i64 %a3)
  %t951 = load i64, ptr @"scheme.base:chr-cmp"
  %t952 = and i64 %t951, -8
  %t953 = inttoptr i64 %t952 to ptr
  %t954 = load i64, ptr %t953
  %t955 = inttoptr i64 %t954 to ptr
  %t956 = musttail call fastcc i64 %t955(i64 %t951, i64 4, i64 %a0, i64 %a2, i64 %t949, i64 %t950, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t956
else218:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t961 = icmp eq i64 %argc, 2
  br i1 %t961, label %argok222, label %arityerr221
arityerr221:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok222:
  %t962 = or i64 %a0, %a1
  %t963 = and i64 %t962, 7
  %t964 = icmp eq i64 %t963, 0
  br i1 %t964, label %fixfast223, label %fixslow224
fixfast223:
  %t965 = icmp eq i64 %a0, %a1
  %t966 = select i1 %t965, i64 257, i64 1
  br label %fixmerge225
fixslow224:
  %t967 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge225
fixmerge225:
  %t968 = phi i64 [ %t966, %fixfast223 ], [ %t967, %fixslow224 ]
  ret i64 %t968
}

define fastcc i64 @"scheme.base:code_229"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t969 = icmp sge i64 %argc, 2
  br i1 %t969, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok227:
  %t970 = call ptr @rt_alloc_words(i64 8)
  %t971 = getelementptr i64, ptr %t970, i64 0
  store i64 %a0, ptr %t971
  %t972 = getelementptr i64, ptr %t970, i64 1
  store i64 %a1, ptr %t972
  %t973 = getelementptr i64, ptr %t970, i64 2
  store i64 %a2, ptr %t973
  %t974 = getelementptr i64, ptr %t970, i64 3
  store i64 %a3, ptr %t974
  %t975 = getelementptr i64, ptr %t970, i64 4
  store i64 %a4, ptr %t975
  %t976 = getelementptr i64, ptr %t970, i64 5
  store i64 %a5, ptr %t976
  %t977 = getelementptr i64, ptr %t970, i64 6
  store i64 %a6, ptr %t977
  %t978 = getelementptr i64, ptr %t970, i64 7
  store i64 %a7, ptr %t978
  %t979 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t970, ptr %overflow)
  %t980 = call ptr @rt_alloc_words(i64 1)
  %t981 = ptrtoint ptr %t980 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t980
  %t982 = or i64 %t981, 4
  %t983 = load i64, ptr @"scheme.base:chr-cmp"
  %t984 = and i64 %t983, -8
  %t985 = inttoptr i64 %t984 to ptr
  %t986 = load i64, ptr %t985
  %t987 = inttoptr i64 %t986 to ptr
  %t988 = musttail call fastcc i64 %t987(i64 %t983, i64 4, i64 %t982, i64 %a0, i64 %a1, i64 %t979, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t988
}

define fastcc i64 @"scheme.base:code_244"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t993 = icmp eq i64 %argc, 2
  br i1 %t993, label %argok229, label %arityerr228
arityerr228:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok229:
  %t994 = or i64 %a0, %a1
  %t995 = and i64 %t994, 7
  %t996 = icmp eq i64 %t995, 0
  br i1 %t996, label %fixfast230, label %fixslow231
fixfast230:
  %t997 = icmp slt i64 %a0, %a1
  %t998 = select i1 %t997, i64 257, i64 1
  br label %fixmerge232
fixslow231:
  %t999 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge232
fixmerge232:
  %t1000 = phi i64 [ %t998, %fixfast230 ], [ %t999, %fixslow231 ]
  ret i64 %t1000
}

define fastcc i64 @"scheme.base:code_242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1001 = icmp sge i64 %argc, 2
  br i1 %t1001, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok234:
  %t1002 = call ptr @rt_alloc_words(i64 8)
  %t1003 = getelementptr i64, ptr %t1002, i64 0
  store i64 %a0, ptr %t1003
  %t1004 = getelementptr i64, ptr %t1002, i64 1
  store i64 %a1, ptr %t1004
  %t1005 = getelementptr i64, ptr %t1002, i64 2
  store i64 %a2, ptr %t1005
  %t1006 = getelementptr i64, ptr %t1002, i64 3
  store i64 %a3, ptr %t1006
  %t1007 = getelementptr i64, ptr %t1002, i64 4
  store i64 %a4, ptr %t1007
  %t1008 = getelementptr i64, ptr %t1002, i64 5
  store i64 %a5, ptr %t1008
  %t1009 = getelementptr i64, ptr %t1002, i64 6
  store i64 %a6, ptr %t1009
  %t1010 = getelementptr i64, ptr %t1002, i64 7
  store i64 %a7, ptr %t1010
  %t1011 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1002, ptr %overflow)
  %t1012 = call ptr @rt_alloc_words(i64 1)
  %t1013 = ptrtoint ptr %t1012 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_244" to i64), ptr %t1012
  %t1014 = or i64 %t1013, 4
  %t1015 = load i64, ptr @"scheme.base:chr-cmp"
  %t1016 = and i64 %t1015, -8
  %t1017 = inttoptr i64 %t1016 to ptr
  %t1018 = load i64, ptr %t1017
  %t1019 = inttoptr i64 %t1018 to ptr
  %t1020 = musttail call fastcc i64 %t1019(i64 %t1015, i64 4, i64 %t1014, i64 %a0, i64 %a1, i64 %t1011, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1020
}

define fastcc i64 @"scheme.base:code_257"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1025 = icmp eq i64 %argc, 2
  br i1 %t1025, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok236:
  %t1026 = or i64 %a1, %a0
  %t1027 = and i64 %t1026, 7
  %t1028 = icmp eq i64 %t1027, 0
  br i1 %t1028, label %fixfast237, label %fixslow238
fixfast237:
  %t1029 = icmp slt i64 %a1, %a0
  %t1030 = select i1 %t1029, i64 257, i64 1
  br label %fixmerge239
fixslow238:
  %t1031 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge239
fixmerge239:
  %t1032 = phi i64 [ %t1030, %fixfast237 ], [ %t1031, %fixslow238 ]
  ret i64 %t1032
}

define fastcc i64 @"scheme.base:code_255"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1033 = icmp sge i64 %argc, 2
  br i1 %t1033, label %argok241, label %arityerr240
arityerr240:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok241:
  %t1034 = call ptr @rt_alloc_words(i64 8)
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
  %t1044 = call ptr @rt_alloc_words(i64 1)
  %t1045 = ptrtoint ptr %t1044 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_257" to i64), ptr %t1044
  %t1046 = or i64 %t1045, 4
  %t1047 = load i64, ptr @"scheme.base:chr-cmp"
  %t1048 = and i64 %t1047, -8
  %t1049 = inttoptr i64 %t1048 to ptr
  %t1050 = load i64, ptr %t1049
  %t1051 = inttoptr i64 %t1050 to ptr
  %t1052 = musttail call fastcc i64 %t1051(i64 %t1047, i64 4, i64 %t1046, i64 %a0, i64 %a1, i64 %t1043, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1052
}

define fastcc i64 @"scheme.base:code_270"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1057 = icmp eq i64 %argc, 2
  br i1 %t1057, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok243:
  %t1058 = or i64 %a0, %a1
  %t1059 = and i64 %t1058, 7
  %t1060 = icmp eq i64 %t1059, 0
  br i1 %t1060, label %fixfast244, label %fixslow245
fixfast244:
  %t1061 = icmp slt i64 %a0, %a1
  %t1062 = select i1 %t1061, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1063 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge246
fixmerge246:
  %t1064 = phi i64 [ %t1062, %fixfast244 ], [ %t1063, %fixslow245 ]
  %t1065 = icmp ne i64 %t1064, 1
  br i1 %t1065, label %then247, label %else248
then247:
  ret i64 257
else248:
  %t1066 = or i64 %a0, %a1
  %t1067 = and i64 %t1066, 7
  %t1068 = icmp eq i64 %t1067, 0
  br i1 %t1068, label %fixfast249, label %fixslow250
fixfast249:
  %t1069 = icmp eq i64 %a0, %a1
  %t1070 = select i1 %t1069, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1071 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge251
fixmerge251:
  %t1072 = phi i64 [ %t1070, %fixfast249 ], [ %t1071, %fixslow250 ]
  ret i64 %t1072
}

define fastcc i64 @"scheme.base:code_268"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1073 = icmp sge i64 %argc, 2
  br i1 %t1073, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok253:
  %t1074 = call ptr @rt_alloc_words(i64 8)
  %t1075 = getelementptr i64, ptr %t1074, i64 0
  store i64 %a0, ptr %t1075
  %t1076 = getelementptr i64, ptr %t1074, i64 1
  store i64 %a1, ptr %t1076
  %t1077 = getelementptr i64, ptr %t1074, i64 2
  store i64 %a2, ptr %t1077
  %t1078 = getelementptr i64, ptr %t1074, i64 3
  store i64 %a3, ptr %t1078
  %t1079 = getelementptr i64, ptr %t1074, i64 4
  store i64 %a4, ptr %t1079
  %t1080 = getelementptr i64, ptr %t1074, i64 5
  store i64 %a5, ptr %t1080
  %t1081 = getelementptr i64, ptr %t1074, i64 6
  store i64 %a6, ptr %t1081
  %t1082 = getelementptr i64, ptr %t1074, i64 7
  store i64 %a7, ptr %t1082
  %t1083 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1074, ptr %overflow)
  %t1084 = call ptr @rt_alloc_words(i64 1)
  %t1085 = ptrtoint ptr %t1084 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_270" to i64), ptr %t1084
  %t1086 = or i64 %t1085, 4
  %t1087 = load i64, ptr @"scheme.base:chr-cmp"
  %t1088 = and i64 %t1087, -8
  %t1089 = inttoptr i64 %t1088 to ptr
  %t1090 = load i64, ptr %t1089
  %t1091 = inttoptr i64 %t1090 to ptr
  %t1092 = musttail call fastcc i64 %t1091(i64 %t1087, i64 4, i64 %t1086, i64 %a0, i64 %a1, i64 %t1083, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1092
}

define fastcc i64 @"scheme.base:code_283"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1097 = icmp eq i64 %argc, 2
  br i1 %t1097, label %argok255, label %arityerr254
arityerr254:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok255:
  %t1098 = or i64 %a1, %a0
  %t1099 = and i64 %t1098, 7
  %t1100 = icmp eq i64 %t1099, 0
  br i1 %t1100, label %fixfast256, label %fixslow257
fixfast256:
  %t1101 = icmp slt i64 %a1, %a0
  %t1102 = select i1 %t1101, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t1103 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge258
fixmerge258:
  %t1104 = phi i64 [ %t1102, %fixfast256 ], [ %t1103, %fixslow257 ]
  %t1105 = icmp ne i64 %t1104, 1
  br i1 %t1105, label %then259, label %else260
then259:
  ret i64 257
else260:
  %t1106 = or i64 %a0, %a1
  %t1107 = and i64 %t1106, 7
  %t1108 = icmp eq i64 %t1107, 0
  br i1 %t1108, label %fixfast261, label %fixslow262
fixfast261:
  %t1109 = icmp eq i64 %a0, %a1
  %t1110 = select i1 %t1109, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1111 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge263
fixmerge263:
  %t1112 = phi i64 [ %t1110, %fixfast261 ], [ %t1111, %fixslow262 ]
  ret i64 %t1112
}

define fastcc i64 @"scheme.base:code_281"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1113 = icmp sge i64 %argc, 2
  br i1 %t1113, label %argok265, label %arityerr264
arityerr264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok265:
  %t1114 = call ptr @rt_alloc_words(i64 8)
  %t1115 = getelementptr i64, ptr %t1114, i64 0
  store i64 %a0, ptr %t1115
  %t1116 = getelementptr i64, ptr %t1114, i64 1
  store i64 %a1, ptr %t1116
  %t1117 = getelementptr i64, ptr %t1114, i64 2
  store i64 %a2, ptr %t1117
  %t1118 = getelementptr i64, ptr %t1114, i64 3
  store i64 %a3, ptr %t1118
  %t1119 = getelementptr i64, ptr %t1114, i64 4
  store i64 %a4, ptr %t1119
  %t1120 = getelementptr i64, ptr %t1114, i64 5
  store i64 %a5, ptr %t1120
  %t1121 = getelementptr i64, ptr %t1114, i64 6
  store i64 %a6, ptr %t1121
  %t1122 = getelementptr i64, ptr %t1114, i64 7
  store i64 %a7, ptr %t1122
  %t1123 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1114, ptr %overflow)
  %t1124 = call ptr @rt_alloc_words(i64 1)
  %t1125 = ptrtoint ptr %t1124 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_283" to i64), ptr %t1124
  %t1126 = or i64 %t1125, 4
  %t1127 = load i64, ptr @"scheme.base:chr-cmp"
  %t1128 = and i64 %t1127, -8
  %t1129 = inttoptr i64 %t1128 to ptr
  %t1130 = load i64, ptr %t1129
  %t1131 = inttoptr i64 %t1130 to ptr
  %t1132 = musttail call fastcc i64 %t1131(i64 %t1127, i64 4, i64 %t1126, i64 %a0, i64 %a1, i64 %t1123, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1132
}

define fastcc i64 @"scheme.base:code_295"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1137 = icmp eq i64 %argc, 2
  br i1 %t1137, label %argok267, label %arityerr266
arityerr266:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok267:
  %t1138 = or i64 %a0, 0
  %t1139 = and i64 %t1138, 7
  %t1140 = icmp eq i64 %t1139, 0
  br i1 %t1140, label %fixfast268, label %fixslow269
fixfast268:
  %t1141 = icmp slt i64 %a0, 0
  %t1142 = select i1 %t1141, i64 257, i64 1
  br label %fixmerge270
fixslow269:
  %t1143 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge270
fixmerge270:
  %t1144 = phi i64 [ %t1142, %fixfast268 ], [ %t1143, %fixslow269 ]
  %t1145 = icmp ne i64 %t1144, 1
  br i1 %t1145, label %then271, label %else272
then271:
  ret i64 %a1
else272:
  %t1146 = or i64 %a0, 8
  %t1147 = and i64 %t1146, 7
  %t1148 = icmp eq i64 %t1147, 0
  br i1 %t1148, label %fixfast273, label %fixslow274
fixfast273:
  %t1149 = sub i64 %a0, 8
  br label %fixmerge275
fixslow274:
  %t1150 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge275
fixmerge275:
  %t1151 = phi i64 [ %t1149, %fixfast273 ], [ %t1150, %fixslow274 ]
  %t1152 = and i64 %self, -8
  %t1153 = inttoptr i64 %t1152 to ptr
  %t1154 = getelementptr i64, ptr %t1153, i64 2
  %t1155 = load i64, ptr %t1154
  %t1156 = call i64 @rt_string_ref(i64 %t1155, i64 %a0)
  %t1157 = call i64 @rt_cons(i64 %t1156, i64 %a1)
  %t1158 = musttail call fastcc i64 @"scheme.base:code_295"(i64 %self, i64 2, i64 %t1151, i64 %t1157, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1158
}

define fastcc i64 @"scheme.base:code_293"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1159 = icmp eq i64 %argc, 1
  br i1 %t1159, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok277:
  %t1160 = call ptr @rt_alloc_words(i64 3)
  %t1161 = ptrtoint ptr %t1160 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_295" to i64), ptr %t1160
  %t1162 = or i64 %t1161, 4
  %t1163 = getelementptr i64, ptr %t1160, i64 1
  store i64 %t1162, ptr %t1163
  %t1164 = getelementptr i64, ptr %t1160, i64 2
  store i64 %a0, ptr %t1164
  %t1165 = call i64 @rt_string_length(i64 %a0)
  %t1166 = or i64 %t1165, 8
  %t1167 = and i64 %t1166, 7
  %t1168 = icmp eq i64 %t1167, 0
  br i1 %t1168, label %fixfast278, label %fixslow279
fixfast278:
  %t1169 = sub i64 %t1165, 8
  br label %fixmerge280
fixslow279:
  %t1170 = call i64 @rt_sub(i64 %t1165, i64 8)
  br label %fixmerge280
fixmerge280:
  %t1171 = phi i64 [ %t1169, %fixfast278 ], [ %t1170, %fixslow279 ]
  %t1172 = and i64 %t1162, -8
  %t1173 = inttoptr i64 %t1172 to ptr
  %t1174 = load i64, ptr %t1173
  %t1175 = inttoptr i64 %t1174 to ptr
  %t1176 = musttail call fastcc i64 %t1175(i64 %t1162, i64 2, i64 %t1171, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1176
}

define fastcc i64 @"scheme.base:code_305"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1181 = icmp eq i64 %argc, 2
  br i1 %t1181, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1182 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1183 = or i64 0, %t1182
  %t1184 = and i64 %t1183, 7
  %t1185 = icmp eq i64 %t1184, 0
  br i1 %t1185, label %fixfast283, label %fixslow284
fixfast283:
  %t1186 = sub i64 0, %t1182
  br label %fixmerge285
fixslow284:
  %t1187 = call i64 @rt_sub(i64 0, i64 %t1182)
  br label %fixmerge285
fixmerge285:
  %t1188 = phi i64 [ %t1186, %fixfast283 ], [ %t1187, %fixslow284 ]
  %t1189 = or i64 384, %t1188
  %t1190 = and i64 %t1189, 7
  %t1191 = icmp eq i64 %t1190, 0
  br i1 %t1191, label %fixfast286, label %fixslow287
fixfast286:
  %t1192 = add i64 384, %t1188
  br label %fixmerge288
fixslow287:
  %t1193 = call i64 @rt_add(i64 384, i64 %t1188)
  br label %fixmerge288
fixmerge288:
  %t1194 = phi i64 [ %t1192, %fixfast286 ], [ %t1193, %fixslow287 ]
  %t1195 = call i64 @rt_integer_to_char(i64 %t1194)
  %t1196 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1197 = or i64 %t1196, 0
  %t1198 = and i64 %t1197, 7
  %t1199 = icmp eq i64 %t1198, 0
  br i1 %t1199, label %fixfast289, label %fixslow290
fixfast289:
  %t1200 = icmp eq i64 %t1196, 0
  %t1201 = select i1 %t1200, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1202 = call i64 @rt_num_eq(i64 %t1196, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1203 = phi i64 [ %t1201, %fixfast289 ], [ %t1202, %fixslow290 ]
  %t1204 = icmp ne i64 %t1203, 1
  br i1 %t1204, label %then292, label %else293
then292:
  %t1205 = call i64 @rt_cons(i64 %t1195, i64 %a1)
  ret i64 %t1205
else293:
  %t1206 = call i64 @rt_cons(i64 %t1195, i64 %a1)
  %t1207 = load i64, ptr @"scheme.base:ns-digits"
  %t1208 = and i64 %t1207, -8
  %t1209 = inttoptr i64 %t1208 to ptr
  %t1210 = load i64, ptr %t1209
  %t1211 = inttoptr i64 %t1210 to ptr
  %t1212 = musttail call fastcc i64 %t1211(i64 %t1207, i64 2, i64 %t1196, i64 %t1206, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1212
}

define fastcc i64 @"scheme.base:code_316"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1217 = icmp eq i64 %argc, 1
  br i1 %t1217, label %argok295, label %arityerr294
arityerr294:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok295:
  %t1218 = call i64 @rt_exact_p(i64 %a0)
  %t1219 = icmp ne i64 %t1218, 1
  br i1 %t1219, label %then296, label %else297
then296:
  %t1220 = or i64 %a0, 0
  %t1221 = and i64 %t1220, 7
  %t1222 = icmp eq i64 %t1221, 0
  br i1 %t1222, label %fixfast298, label %fixslow299
fixfast298:
  %t1223 = icmp eq i64 %a0, 0
  %t1224 = select i1 %t1223, i64 257, i64 1
  br label %fixmerge300
fixslow299:
  %t1225 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge300
fixmerge300:
  %t1226 = phi i64 [ %t1224, %fixfast298 ], [ %t1225, %fixslow299 ]
  %t1227 = icmp ne i64 %t1226, 1
  br i1 %t1227, label %then301, label %else302
then301:
  %t1228 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1228
else302:
  %t1229 = or i64 %a0, 0
  %t1230 = and i64 %t1229, 7
  %t1231 = icmp eq i64 %t1230, 0
  br i1 %t1231, label %fixfast303, label %fixslow304
fixfast303:
  %t1232 = icmp slt i64 %a0, 0
  %t1233 = select i1 %t1232, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1234 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1235 = phi i64 [ %t1233, %fixfast303 ], [ %t1234, %fixslow304 ]
  %t1236 = icmp ne i64 %t1235, 1
  br i1 %t1236, label %then306, label %else307
then306:
  %t1237 = load i64, ptr @"scheme.base:ns-digits"
  %t1238 = and i64 %t1237, -8
  %t1239 = inttoptr i64 %t1238 to ptr
  %t1240 = load i64, ptr %t1239
  %t1241 = inttoptr i64 %t1240 to ptr
  %t1242 = call fastcc i64%t1241(i64 %t1237, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1243 = call i64 @rt_cons(i64 11529, i64 %t1242)
  %t1244 = call i64 @rt_list_to_string(i64 %t1243)
  ret i64 %t1244
else307:
  %t1245 = or i64 0, %a0
  %t1246 = and i64 %t1245, 7
  %t1247 = icmp eq i64 %t1246, 0
  br i1 %t1247, label %fixfast308, label %fixslow309
fixfast308:
  %t1248 = sub i64 0, %a0
  br label %fixmerge310
fixslow309:
  %t1249 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge310
fixmerge310:
  %t1250 = phi i64 [ %t1248, %fixfast308 ], [ %t1249, %fixslow309 ]
  %t1251 = load i64, ptr @"scheme.base:ns-digits"
  %t1252 = and i64 %t1251, -8
  %t1253 = inttoptr i64 %t1252 to ptr
  %t1254 = load i64, ptr %t1253
  %t1255 = inttoptr i64 %t1254 to ptr
  %t1256 = call fastcc i64%t1255(i64 %t1251, i64 2, i64 %t1250, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1257 = call i64 @rt_list_to_string(i64 %t1256)
  ret i64 %t1257
else297:
  %t1258 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t1258
}

define fastcc i64 @"scheme.base:code_320"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1263 = icmp sge i64 %argc, 1
  br i1 %t1263, label %argok312, label %arityerr311
arityerr311:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok312:
  %t1264 = call ptr @rt_alloc_words(i64 8)
  %t1265 = getelementptr i64, ptr %t1264, i64 0
  store i64 %a0, ptr %t1265
  %t1266 = getelementptr i64, ptr %t1264, i64 1
  store i64 %a1, ptr %t1266
  %t1267 = getelementptr i64, ptr %t1264, i64 2
  store i64 %a2, ptr %t1267
  %t1268 = getelementptr i64, ptr %t1264, i64 3
  store i64 %a3, ptr %t1268
  %t1269 = getelementptr i64, ptr %t1264, i64 4
  store i64 %a4, ptr %t1269
  %t1270 = getelementptr i64, ptr %t1264, i64 5
  store i64 %a5, ptr %t1270
  %t1271 = getelementptr i64, ptr %t1264, i64 6
  store i64 %a6, ptr %t1271
  %t1272 = getelementptr i64, ptr %t1264, i64 7
  store i64 %a7, ptr %t1272
  %t1273 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1264, ptr %overflow)
  %t1274 = call i64 @rt_string_p(i64 %a0)
  %t1275 = icmp ne i64 %t1274, 1
  br i1 %t1275, label %then313, label %else314
then313:
  %t1276 = call i64 @rt_error(i64 %a0, i64 %t1273)
  ret i64 %t1276
else314:
  %t1277 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1278 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1279 = call i64 @rt_car(i64 %t1273)
  %t1280 = call i64 @rt_string_append(i64 %t1278, i64 %t1279)
  %t1281 = call i64 @rt_string_append(i64 %t1277, i64 %t1280)
  %t1282 = call i64 @rt_cdr(i64 %t1273)
  %t1283 = call i64 @rt_error(i64 %t1281, i64 %t1282)
  ret i64 %t1283
}

define fastcc i64 @"scheme.base:code_323"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1288 = icmp eq i64 %argc, 1
  br i1 %t1288, label %argok316, label %arityerr315
arityerr315:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok316:
  %t1289 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1289
}

define fastcc i64 @"scheme.base:code_326"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1294 = icmp eq i64 %argc, 1
  br i1 %t1294, label %argok318, label %arityerr317
arityerr317:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok318:
  %t1295 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1295
}

define fastcc i64 @"scheme.base:code_329"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1300 = icmp eq i64 %argc, 1
  br i1 %t1300, label %argok320, label %arityerr319
arityerr319:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok320:
  %t1301 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1301
}

define fastcc i64 @"scheme.base:code_332"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1306 = icmp eq i64 %argc, 1
  br i1 %t1306, label %argok322, label %arityerr321
arityerr321:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok322:
  %t1307 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1307
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1312 = icmp eq i64 %argc, 2
  br i1 %t1312, label %argok324, label %arityerr323
arityerr323:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok324:
  %t1313 = call i64 @rt_null_p(i64 %a0)
  %t1314 = icmp ne i64 %t1313, 1
  br i1 %t1314, label %then325, label %else326
then325:
  %t1315 = and i64 %self, -8
  %t1316 = inttoptr i64 %t1315 to ptr
  %t1317 = getelementptr i64, ptr %t1316, i64 1
  %t1318 = load i64, ptr %t1317
  ret i64 %t1318
else326:
  %t1319 = and i64 %self, -8
  %t1320 = inttoptr i64 %t1319 to ptr
  %t1321 = getelementptr i64, ptr %t1320, i64 1
  %t1322 = load i64, ptr %t1321
  %t1323 = call i64 @rt_car(i64 %a0)
  %t1324 = call i64 @rt_vector_set(i64 %t1322, i64 %a1, i64 %t1323)
  %t1325 = call i64 @rt_cdr(i64 %a0)
  %t1326 = or i64 %a1, 8
  %t1327 = and i64 %t1326, 7
  %t1328 = icmp eq i64 %t1327, 0
  br i1 %t1328, label %fixfast327, label %fixslow328
fixfast327:
  %t1329 = add i64 %a1, 8
  br label %fixmerge329
fixslow328:
  %t1330 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge329
fixmerge329:
  %t1331 = phi i64 [ %t1329, %fixfast327 ], [ %t1330, %fixslow328 ]
  %t1332 = musttail call fastcc i64 @"scheme.base:code_341"(i64 %self, i64 2, i64 %t1325, i64 %t1331, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1332
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1333 = icmp eq i64 %argc, 1
  br i1 %t1333, label %argok331, label %arityerr330
arityerr330:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok331:
  %t1334 = load i64, ptr @"scheme.base:length"
  %t1335 = and i64 %t1334, -8
  %t1336 = inttoptr i64 %t1335 to ptr
  %t1337 = load i64, ptr %t1336
  %t1338 = inttoptr i64 %t1337 to ptr
  %t1339 = call fastcc i64%t1338(i64 %t1334, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1340 = call i64 @rt_make_vector(i64 %t1339, i64 0)
  %t1341 = call ptr @rt_alloc_words(i64 3)
  %t1342 = ptrtoint ptr %t1341 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1341
  %t1343 = or i64 %t1342, 4
  %t1344 = getelementptr i64, ptr %t1341, i64 1
  store i64 %t1340, ptr %t1344
  %t1345 = getelementptr i64, ptr %t1341, i64 2
  store i64 %t1343, ptr %t1345
  %t1346 = and i64 %t1343, -8
  %t1347 = inttoptr i64 %t1346 to ptr
  %t1348 = load i64, ptr %t1347
  %t1349 = inttoptr i64 %t1348 to ptr
  %t1350 = musttail call fastcc i64 %t1349(i64 %t1343, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1350
}

define fastcc i64 @"scheme.base:code_344"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1355 = icmp sge i64 %argc, 0
  br i1 %t1355, label %argok333, label %arityerr332
arityerr332:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok333:
  %t1356 = call ptr @rt_alloc_words(i64 8)
  %t1357 = getelementptr i64, ptr %t1356, i64 0
  store i64 %a0, ptr %t1357
  %t1358 = getelementptr i64, ptr %t1356, i64 1
  store i64 %a1, ptr %t1358
  %t1359 = getelementptr i64, ptr %t1356, i64 2
  store i64 %a2, ptr %t1359
  %t1360 = getelementptr i64, ptr %t1356, i64 3
  store i64 %a3, ptr %t1360
  %t1361 = getelementptr i64, ptr %t1356, i64 4
  store i64 %a4, ptr %t1361
  %t1362 = getelementptr i64, ptr %t1356, i64 5
  store i64 %a5, ptr %t1362
  %t1363 = getelementptr i64, ptr %t1356, i64 6
  store i64 %a6, ptr %t1363
  %t1364 = getelementptr i64, ptr %t1356, i64 7
  store i64 %a7, ptr %t1364
  %t1365 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1356, ptr %overflow)
  %t1366 = load i64, ptr @"scheme.base:list->vector"
  %t1367 = and i64 %t1366, -8
  %t1368 = inttoptr i64 %t1367 to ptr
  %t1369 = load i64, ptr %t1368
  %t1370 = inttoptr i64 %t1369 to ptr
  %t1371 = musttail call fastcc i64 %t1370(i64 %t1366, i64 1, i64 %t1365, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1371
}

define fastcc i64 @"scheme.base:code_353"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1376 = icmp eq i64 %argc, 2
  br i1 %t1376, label %argok335, label %arityerr334
arityerr334:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok335:
  %t1377 = call i64 @rt_null_p(i64 %a0)
  %t1378 = icmp ne i64 %t1377, 1
  br i1 %t1378, label %then336, label %else337
then336:
  %t1379 = and i64 %self, -8
  %t1380 = inttoptr i64 %t1379 to ptr
  %t1381 = getelementptr i64, ptr %t1380, i64 1
  %t1382 = load i64, ptr %t1381
  ret i64 %t1382
else337:
  %t1383 = and i64 %self, -8
  %t1384 = inttoptr i64 %t1383 to ptr
  %t1385 = getelementptr i64, ptr %t1384, i64 1
  %t1386 = load i64, ptr %t1385
  %t1387 = call i64 @rt_car(i64 %a0)
  %t1388 = call i64 @rt_bytevector_u8_set(i64 %t1386, i64 %a1, i64 %t1387)
  %t1389 = call i64 @rt_cdr(i64 %a0)
  %t1390 = or i64 %a1, 8
  %t1391 = and i64 %t1390, 7
  %t1392 = icmp eq i64 %t1391, 0
  br i1 %t1392, label %fixfast338, label %fixslow339
fixfast338:
  %t1393 = add i64 %a1, 8
  br label %fixmerge340
fixslow339:
  %t1394 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge340
fixmerge340:
  %t1395 = phi i64 [ %t1393, %fixfast338 ], [ %t1394, %fixslow339 ]
  %t1396 = musttail call fastcc i64 @"scheme.base:code_353"(i64 %self, i64 2, i64 %t1389, i64 %t1395, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1396
}

define fastcc i64 @"scheme.base:code_351"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1397 = icmp eq i64 %argc, 1
  br i1 %t1397, label %argok342, label %arityerr341
arityerr341:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok342:
  %t1398 = load i64, ptr @"scheme.base:length"
  %t1399 = and i64 %t1398, -8
  %t1400 = inttoptr i64 %t1399 to ptr
  %t1401 = load i64, ptr %t1400
  %t1402 = inttoptr i64 %t1401 to ptr
  %t1403 = call fastcc i64%t1402(i64 %t1398, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1404 = call i64 @rt_make_bytevector(i64 %t1403, i64 0)
  %t1405 = call ptr @rt_alloc_words(i64 3)
  %t1406 = ptrtoint ptr %t1405 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1405
  %t1407 = or i64 %t1406, 4
  %t1408 = getelementptr i64, ptr %t1405, i64 1
  store i64 %t1404, ptr %t1408
  %t1409 = getelementptr i64, ptr %t1405, i64 2
  store i64 %t1407, ptr %t1409
  %t1410 = and i64 %t1407, -8
  %t1411 = inttoptr i64 %t1410 to ptr
  %t1412 = load i64, ptr %t1411
  %t1413 = inttoptr i64 %t1412 to ptr
  %t1414 = musttail call fastcc i64 %t1413(i64 %t1407, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1414
}

define fastcc i64 @"scheme.base:code_356"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1419 = icmp sge i64 %argc, 0
  br i1 %t1419, label %argok344, label %arityerr343
arityerr343:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok344:
  %t1420 = call ptr @rt_alloc_words(i64 8)
  %t1421 = getelementptr i64, ptr %t1420, i64 0
  store i64 %a0, ptr %t1421
  %t1422 = getelementptr i64, ptr %t1420, i64 1
  store i64 %a1, ptr %t1422
  %t1423 = getelementptr i64, ptr %t1420, i64 2
  store i64 %a2, ptr %t1423
  %t1424 = getelementptr i64, ptr %t1420, i64 3
  store i64 %a3, ptr %t1424
  %t1425 = getelementptr i64, ptr %t1420, i64 4
  store i64 %a4, ptr %t1425
  %t1426 = getelementptr i64, ptr %t1420, i64 5
  store i64 %a5, ptr %t1426
  %t1427 = getelementptr i64, ptr %t1420, i64 6
  store i64 %a6, ptr %t1427
  %t1428 = getelementptr i64, ptr %t1420, i64 7
  store i64 %a7, ptr %t1428
  %t1429 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1420, ptr %overflow)
  %t1430 = load i64, ptr @"scheme.base:list->bytevector"
  %t1431 = and i64 %t1430, -8
  %t1432 = inttoptr i64 %t1431 to ptr
  %t1433 = load i64, ptr %t1432
  %t1434 = inttoptr i64 %t1433 to ptr
  %t1435 = musttail call fastcc i64 %t1434(i64 %t1430, i64 1, i64 %t1429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1435
}

define fastcc i64 @"scheme.base:code_359"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1440 = icmp sge i64 %argc, 0
  br i1 %t1440, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok346:
  %t1441 = call ptr @rt_alloc_words(i64 8)
  %t1442 = getelementptr i64, ptr %t1441, i64 0
  store i64 %a0, ptr %t1442
  %t1443 = getelementptr i64, ptr %t1441, i64 1
  store i64 %a1, ptr %t1443
  %t1444 = getelementptr i64, ptr %t1441, i64 2
  store i64 %a2, ptr %t1444
  %t1445 = getelementptr i64, ptr %t1441, i64 3
  store i64 %a3, ptr %t1445
  %t1446 = getelementptr i64, ptr %t1441, i64 4
  store i64 %a4, ptr %t1446
  %t1447 = getelementptr i64, ptr %t1441, i64 5
  store i64 %a5, ptr %t1447
  %t1448 = getelementptr i64, ptr %t1441, i64 6
  store i64 %a6, ptr %t1448
  %t1449 = getelementptr i64, ptr %t1441, i64 7
  store i64 %a7, ptr %t1449
  %t1450 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1441, ptr %overflow)
  %t1451 = call i64 @rt_pair_p(i64 %t1450)
  %t1452 = icmp ne i64 %t1451, 1
  br i1 %t1452, label %then347, label %else348
then347:
  %t1453 = call i64 @rt_cdr(i64 %t1450)
  %t1454 = call i64 @rt_null_p(i64 %t1453)
  br label %merge349
else348:
  br label %merge349
merge349:
  %t1455 = phi i64 [ %t1454, %then347 ], [ 1, %else348 ]
  %t1456 = icmp ne i64 %t1455, 1
  br i1 %t1456, label %then350, label %else351
then350:
  %t1457 = call i64 @rt_car(i64 %t1450)
  ret i64 %t1457
else351:
  %t1458 = call i64 @rt_list_to_mv(i64 %t1450)
  ret i64 %t1458
}

define fastcc i64 @"scheme.base:code_364"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1463 = icmp eq i64 %argc, 2
  br i1 %t1463, label %argok353, label %arityerr352
arityerr352:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok353:
  %t1464 = and i64 %a0, -8
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = load i64, ptr %t1465
  %t1467 = inttoptr i64 %t1466 to ptr
  %t1468 = call fastcc i64%t1467(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1469 = call i64 @rt_mv_p(i64 %t1468)
  %t1470 = icmp ne i64 %t1469, 1
  br i1 %t1470, label %then354, label %else355
then354:
  %t1471 = call i64 @rt_mv_to_list(i64 %t1468)
  %t1472 = and i64 %a1, -8
  %t1473 = inttoptr i64 %t1472 to ptr
  %t1474 = load i64, ptr %t1473
  %t1475 = inttoptr i64 %t1474 to ptr
  %t1476 = call i64 @rt_list_length(i64 %t1471)
  %t1477 = add i64 0, %t1476
  %t1478 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t1471, i64 8)
  %t1490 = getelementptr i64, ptr %t1478, i64 0
  %t1482 = load i64, ptr %t1490
  %t1491 = getelementptr i64, ptr %t1478, i64 1
  %t1483 = load i64, ptr %t1491
  %t1492 = getelementptr i64, ptr %t1478, i64 2
  %t1484 = load i64, ptr %t1492
  %t1493 = getelementptr i64, ptr %t1478, i64 3
  %t1485 = load i64, ptr %t1493
  %t1494 = getelementptr i64, ptr %t1478, i64 4
  %t1486 = load i64, ptr %t1494
  %t1495 = getelementptr i64, ptr %t1478, i64 5
  %t1487 = load i64, ptr %t1495
  %t1496 = getelementptr i64, ptr %t1478, i64 6
  %t1488 = load i64, ptr %t1496
  %t1497 = getelementptr i64, ptr %t1478, i64 7
  %t1489 = load i64, ptr %t1497
  %t1479 = icmp sgt i64 %t1477, 8
  %t1480 = getelementptr i64, ptr %t1478, i64 8
  %t1481 = select i1 %t1479, ptr %t1480, ptr null
  %t1498 = musttail call fastcc i64 %t1475(i64 %a1, i64 %t1477, i64 %t1482, i64 %t1483, i64 %t1484, i64 %t1485, i64 %t1486, i64 %t1487, i64 %t1488, i64 %t1489, ptr %t1481)
  ret i64 %t1498
else355:
  %t1499 = and i64 %a1, -8
  %t1500 = inttoptr i64 %t1499 to ptr
  %t1501 = load i64, ptr %t1500
  %t1502 = inttoptr i64 %t1501 to ptr
  %t1503 = musttail call fastcc i64 %t1502(i64 %a1, i64 1, i64 %t1468, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1503
}

define fastcc i64 @"scheme.base:code_366"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1510 = icmp eq i64 %argc, 0
  br i1 %t1510, label %argok357, label %arityerr356
arityerr356:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok357:
  %t1511 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t1512 = call i64 @rt_make_vector(i64 %t1511, i64 2)
  %t1513 = load i64, ptr @"scheme.base:vector"
  %t1514 = and i64 %t1513, -8
  %t1515 = inttoptr i64 %t1514 to ptr
  %t1516 = load i64, ptr %t1515
  %t1517 = inttoptr i64 %t1516 to ptr
  %t1518 = call fastcc i64%t1517(i64 %t1513, i64 3, i64 0, i64 %t1512, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1519 = call i64 @rt_make_hash_table(i64 %t1518)
  ret i64 %t1519
}

define fastcc i64 @"scheme.base:code_369"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1524 = icmp eq i64 %argc, 1
  br i1 %t1524, label %argok359, label %arityerr358
arityerr358:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok359:
  %t1525 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t1525
}

define fastcc i64 @"scheme.base:code_372"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1530 = icmp eq i64 %argc, 1
  br i1 %t1530, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok361:
  %t1531 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1532 = call i64 @rt_vector_ref(i64 %t1531, i64 0)
  ret i64 %t1532
}

define fastcc i64 @"scheme.base:code_375"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1537 = icmp eq i64 %argc, 1
  br i1 %t1537, label %argok363, label %arityerr362
arityerr362:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok363:
  %t1538 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1539 = call i64 @rt_vector_ref(i64 %t1538, i64 8)
  ret i64 %t1539
}

define fastcc i64 @"scheme.base:code_379"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1544 = icmp eq i64 %argc, 2
  br i1 %t1544, label %argok365, label %arityerr364
arityerr364:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok365:
  %t1545 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1546 = call i64 @rt_vector_set(i64 %t1545, i64 0, i64 %a1)
  ret i64 %t1546
}

define fastcc i64 @"scheme.base:code_383"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1551 = icmp eq i64 %argc, 2
  br i1 %t1551, label %argok367, label %arityerr366
arityerr366:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok367:
  %t1552 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1553 = call i64 @rt_vector_set(i64 %t1552, i64 8, i64 %a1)
  ret i64 %t1553
}

define fastcc i64 @"scheme.base:code_387"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1558 = icmp eq i64 %argc, 2
  br i1 %t1558, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok369:
  %t1559 = call i64 @rt_hash(i64 %a0)
  %t1560 = call i64 @rt_remainder(i64 %t1559, i64 %a1)
  ret i64 %t1560
}

define fastcc i64 @"scheme.base:code_391"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1565 = icmp eq i64 %argc, 2
  br i1 %t1565, label %argok371, label %arityerr370
arityerr370:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok371:
  %t1566 = call i64 @rt_null_p(i64 %a1)
  %t1567 = icmp ne i64 %t1566, 1
  br i1 %t1567, label %then372, label %else373
then372:
  ret i64 1
else373:
  %t1568 = call i64 @rt_car(i64 %a1)
  %t1569 = call i64 @rt_car(i64 %t1568)
  %t1570 = call i64 @rt_equal(i64 %a0, i64 %t1569)
  %t1571 = icmp ne i64 %t1570, 1
  br i1 %t1571, label %then374, label %else375
then374:
  %t1572 = call i64 @rt_car(i64 %a1)
  ret i64 %t1572
else375:
  %t1573 = call i64 @rt_cdr(i64 %a1)
  %t1574 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1575 = and i64 %t1574, -8
  %t1576 = inttoptr i64 %t1575 to ptr
  %t1577 = load i64, ptr %t1576
  %t1578 = inttoptr i64 %t1577 to ptr
  %t1579 = musttail call fastcc i64 %t1578(i64 %t1574, i64 2, i64 %a0, i64 %t1573, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1579
}

define fastcc i64 @"scheme.base:code_395"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1584 = icmp eq i64 %argc, 2
  br i1 %t1584, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok377:
  %t1585 = call i64 @rt_null_p(i64 %a1)
  %t1586 = icmp ne i64 %t1585, 1
  br i1 %t1586, label %then378, label %else379
then378:
  ret i64 2
else379:
  %t1587 = call i64 @rt_car(i64 %a1)
  %t1588 = call i64 @rt_car(i64 %t1587)
  %t1589 = call i64 @rt_equal(i64 %a0, i64 %t1588)
  %t1590 = icmp ne i64 %t1589, 1
  br i1 %t1590, label %then380, label %else381
then380:
  %t1591 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t1591
else381:
  %t1592 = call i64 @rt_car(i64 %a1)
  %t1593 = call i64 @rt_cdr(i64 %a1)
  %t1594 = load i64, ptr @"scheme.base:%ht-remove"
  %t1595 = and i64 %t1594, -8
  %t1596 = inttoptr i64 %t1595 to ptr
  %t1597 = load i64, ptr %t1596
  %t1598 = inttoptr i64 %t1597 to ptr
  %t1599 = call fastcc i64%t1598(i64 %t1594, i64 2, i64 %a0, i64 %t1593, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1600 = call i64 @rt_cons(i64 %t1592, i64 %t1599)
  ret i64 %t1600
}

define fastcc i64 @"scheme.base:code_402"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1605 = icmp eq i64 %argc, 3
  br i1 %t1605, label %argok383, label %arityerr382
arityerr382:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok383:
  %t1606 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1607 = and i64 %t1606, -8
  %t1608 = inttoptr i64 %t1607 to ptr
  %t1609 = load i64, ptr %t1608
  %t1610 = inttoptr i64 %t1609 to ptr
  %t1611 = call fastcc i64%t1610(i64 %t1606, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1612 = call i64 @rt_vector_length(i64 %t1611)
  %t1613 = load i64, ptr @"scheme.base:%ht-index"
  %t1614 = and i64 %t1613, -8
  %t1615 = inttoptr i64 %t1614 to ptr
  %t1616 = load i64, ptr %t1615
  %t1617 = inttoptr i64 %t1616 to ptr
  %t1618 = call fastcc i64%t1617(i64 %t1613, i64 2, i64 %a1, i64 %t1612, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1619 = call i64 @rt_vector_ref(i64 %t1611, i64 %t1618)
  %t1620 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1621 = and i64 %t1620, -8
  %t1622 = inttoptr i64 %t1621 to ptr
  %t1623 = load i64, ptr %t1622
  %t1624 = inttoptr i64 %t1623 to ptr
  %t1625 = call fastcc i64%t1624(i64 %t1620, i64 2, i64 %a1, i64 %t1619, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1626 = icmp ne i64 %t1625, 1
  br i1 %t1626, label %then384, label %else385
then384:
  %t1627 = call i64 @rt_cdr(i64 %t1625)
  ret i64 %t1627
else385:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_407"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1632 = icmp eq i64 %argc, 2
  br i1 %t1632, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok387:
  %t1633 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1634 = and i64 %t1633, -8
  %t1635 = inttoptr i64 %t1634 to ptr
  %t1636 = load i64, ptr %t1635
  %t1637 = inttoptr i64 %t1636 to ptr
  %t1638 = call fastcc i64%t1637(i64 %t1633, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1639 = call i64 @rt_vector_length(i64 %t1638)
  %t1640 = load i64, ptr @"scheme.base:%ht-index"
  %t1641 = and i64 %t1640, -8
  %t1642 = inttoptr i64 %t1641 to ptr
  %t1643 = load i64, ptr %t1642
  %t1644 = inttoptr i64 %t1643 to ptr
  %t1645 = call fastcc i64%t1644(i64 %t1640, i64 2, i64 %a1, i64 %t1639, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1646 = call i64 @rt_vector_ref(i64 %t1638, i64 %t1645)
  %t1647 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1648 = and i64 %t1647, -8
  %t1649 = inttoptr i64 %t1648 to ptr
  %t1650 = load i64, ptr %t1649
  %t1651 = inttoptr i64 %t1650 to ptr
  %t1652 = call fastcc i64%t1651(i64 %t1647, i64 2, i64 %a1, i64 %t1646, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1653 = icmp ne i64 %t1652, 1
  br i1 %t1653, label %then388, label %else389
then388:
  ret i64 257
else389:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_413"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1658 = icmp eq i64 %argc, 2
  br i1 %t1658, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok391:
  %t1659 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1660 = and i64 %t1659, -8
  %t1661 = inttoptr i64 %t1660 to ptr
  %t1662 = load i64, ptr %t1661
  %t1663 = inttoptr i64 %t1662 to ptr
  %t1664 = call fastcc i64%t1663(i64 %t1659, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1665 = call i64 @rt_vector_length(i64 %t1664)
  %t1666 = load i64, ptr @"scheme.base:%ht-index"
  %t1667 = and i64 %t1666, -8
  %t1668 = inttoptr i64 %t1667 to ptr
  %t1669 = load i64, ptr %t1668
  %t1670 = inttoptr i64 %t1669 to ptr
  %t1671 = call fastcc i64%t1670(i64 %t1666, i64 2, i64 %a1, i64 %t1665, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1672 = call i64 @rt_vector_ref(i64 %t1664, i64 %t1671)
  %t1673 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1674 = and i64 %t1673, -8
  %t1675 = inttoptr i64 %t1674 to ptr
  %t1676 = load i64, ptr %t1675
  %t1677 = inttoptr i64 %t1676 to ptr
  %t1678 = call fastcc i64%t1677(i64 %t1673, i64 2, i64 %a1, i64 %t1672, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1679 = icmp ne i64 %t1678, 1
  br i1 %t1679, label %then392, label %else393
then392:
  %t1680 = call i64 @rt_cdr(i64 %t1678)
  ret i64 %t1680
else393:
  %t1681 = call i64 @rt_make_string(ptr @.str.lit.3, i64 29)
  %t1682 = load i64, ptr @"scheme.base:error"
  %t1683 = and i64 %t1682, -8
  %t1684 = inttoptr i64 %t1683 to ptr
  %t1685 = load i64, ptr %t1684
  %t1686 = inttoptr i64 %t1685 to ptr
  %t1687 = musttail call fastcc i64 %t1686(i64 %t1682, i64 2, i64 %t1681, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1687
}

define fastcc i64 @"scheme.base:code_427"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1692 = icmp eq i64 %argc, 3
  br i1 %t1692, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok395:
  %t1693 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1694 = and i64 %t1693, -8
  %t1695 = inttoptr i64 %t1694 to ptr
  %t1696 = load i64, ptr %t1695
  %t1697 = inttoptr i64 %t1696 to ptr
  %t1698 = call fastcc i64%t1697(i64 %t1693, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1699 = call i64 @rt_vector_length(i64 %t1698)
  %t1700 = load i64, ptr @"scheme.base:%ht-index"
  %t1701 = and i64 %t1700, -8
  %t1702 = inttoptr i64 %t1701 to ptr
  %t1703 = load i64, ptr %t1702
  %t1704 = inttoptr i64 %t1703 to ptr
  %t1705 = call fastcc i64%t1704(i64 %t1700, i64 2, i64 %a1, i64 %t1699, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1706 = call i64 @rt_vector_ref(i64 %t1698, i64 %t1705)
  %t1707 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1708 = and i64 %t1707, -8
  %t1709 = inttoptr i64 %t1708 to ptr
  %t1710 = load i64, ptr %t1709
  %t1711 = inttoptr i64 %t1710 to ptr
  %t1712 = call fastcc i64%t1711(i64 %t1707, i64 2, i64 %a1, i64 %t1706, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1713 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t1714 = icmp ne i64 %t1712, 1
  br i1 %t1714, label %then396, label %else397
then396:
  %t1715 = load i64, ptr @"scheme.base:%ht-remove"
  %t1716 = and i64 %t1715, -8
  %t1717 = inttoptr i64 %t1716 to ptr
  %t1718 = load i64, ptr %t1717
  %t1719 = inttoptr i64 %t1718 to ptr
  %t1720 = call fastcc i64%t1719(i64 %t1715, i64 2, i64 %a1, i64 %t1706, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge398
else397:
  br label %merge398
merge398:
  %t1721 = phi i64 [ %t1720, %then396 ], [ %t1706, %else397 ]
  %t1722 = call i64 @rt_cons(i64 %t1713, i64 %t1721)
  %t1723 = call i64 @rt_vector_set(i64 %t1698, i64 %t1705, i64 %t1722)
  %t1724 = icmp ne i64 %t1712, 1
  br i1 %t1724, label %then399, label %else400
then399:
  ret i64 1
else400:
  %t1725 = load i64, ptr @"scheme.base:%ht-count"
  %t1726 = and i64 %t1725, -8
  %t1727 = inttoptr i64 %t1726 to ptr
  %t1728 = load i64, ptr %t1727
  %t1729 = inttoptr i64 %t1728 to ptr
  %t1730 = call fastcc i64%t1729(i64 %t1725, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1731 = or i64 %t1730, 8
  %t1732 = and i64 %t1731, 7
  %t1733 = icmp eq i64 %t1732, 0
  br i1 %t1733, label %fixfast401, label %fixslow402
fixfast401:
  %t1734 = add i64 %t1730, 8
  br label %fixmerge403
fixslow402:
  %t1735 = call i64 @rt_add(i64 %t1730, i64 8)
  br label %fixmerge403
fixmerge403:
  %t1736 = phi i64 [ %t1734, %fixfast401 ], [ %t1735, %fixslow402 ]
  %t1737 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t1738 = and i64 %t1737, -8
  %t1739 = inttoptr i64 %t1738 to ptr
  %t1740 = load i64, ptr %t1739
  %t1741 = inttoptr i64 %t1740 to ptr
  %t1742 = call fastcc i64%t1741(i64 %t1737, i64 2, i64 %a0, i64 %t1736, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1743 = load i64, ptr @"scheme.base:%ht-count"
  %t1744 = and i64 %t1743, -8
  %t1745 = inttoptr i64 %t1744 to ptr
  %t1746 = load i64, ptr %t1745
  %t1747 = inttoptr i64 %t1746 to ptr
  %t1748 = call fastcc i64%t1747(i64 %t1743, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1749 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t1750 = or i64 %t1749, %t1699
  %t1751 = and i64 %t1750, 7
  %t1752 = icmp eq i64 %t1751, 0
  br i1 %t1752, label %fixfast404, label %fixslow405
fixfast404:
  %t1753 = ashr i64 %t1749, 3
  %t1754 = mul i64 %t1753, %t1699
  br label %fixmerge406
fixslow405:
  %t1755 = call i64 @rt_mul(i64 %t1749, i64 %t1699)
  br label %fixmerge406
fixmerge406:
  %t1756 = phi i64 [ %t1754, %fixfast404 ], [ %t1755, %fixslow405 ]
  %t1757 = or i64 %t1756, %t1748
  %t1758 = and i64 %t1757, 7
  %t1759 = icmp eq i64 %t1758, 0
  br i1 %t1759, label %fixfast407, label %fixslow408
fixfast407:
  %t1760 = icmp slt i64 %t1756, %t1748
  %t1761 = select i1 %t1760, i64 257, i64 1
  br label %fixmerge409
fixslow408:
  %t1762 = call i64 @rt_lt(i64 %t1756, i64 %t1748)
  br label %fixmerge409
fixmerge409:
  %t1763 = phi i64 [ %t1761, %fixfast407 ], [ %t1762, %fixslow408 ]
  %t1764 = icmp ne i64 %t1763, 1
  br i1 %t1764, label %then410, label %else411
then410:
  %t1765 = load i64, ptr @"scheme.base:%ht-grow!"
  %t1766 = and i64 %t1765, -8
  %t1767 = inttoptr i64 %t1766 to ptr
  %t1768 = load i64, ptr %t1767
  %t1769 = inttoptr i64 %t1768 to ptr
  %t1770 = musttail call fastcc i64 %t1769(i64 %t1765, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1770
else411:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_434"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1775 = icmp eq i64 %argc, 2
  br i1 %t1775, label %argok413, label %arityerr412
arityerr412:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok413:
  %t1776 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1777 = and i64 %t1776, -8
  %t1778 = inttoptr i64 %t1777 to ptr
  %t1779 = load i64, ptr %t1778
  %t1780 = inttoptr i64 %t1779 to ptr
  %t1781 = call fastcc i64%t1780(i64 %t1776, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1782 = call i64 @rt_vector_length(i64 %t1781)
  %t1783 = load i64, ptr @"scheme.base:%ht-index"
  %t1784 = and i64 %t1783, -8
  %t1785 = inttoptr i64 %t1784 to ptr
  %t1786 = load i64, ptr %t1785
  %t1787 = inttoptr i64 %t1786 to ptr
  %t1788 = call fastcc i64%t1787(i64 %t1783, i64 2, i64 %a1, i64 %t1782, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1789 = call i64 @rt_vector_ref(i64 %t1781, i64 %t1788)
  %t1790 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1791 = and i64 %t1790, -8
  %t1792 = inttoptr i64 %t1791 to ptr
  %t1793 = load i64, ptr %t1792
  %t1794 = inttoptr i64 %t1793 to ptr
  %t1795 = call fastcc i64%t1794(i64 %t1790, i64 2, i64 %a1, i64 %t1789, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1796 = icmp ne i64 %t1795, 1
  br i1 %t1796, label %then414, label %else415
then414:
  %t1797 = load i64, ptr @"scheme.base:%ht-remove"
  %t1798 = and i64 %t1797, -8
  %t1799 = inttoptr i64 %t1798 to ptr
  %t1800 = load i64, ptr %t1799
  %t1801 = inttoptr i64 %t1800 to ptr
  %t1802 = call fastcc i64%t1801(i64 %t1797, i64 2, i64 %a1, i64 %t1789, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1803 = call i64 @rt_vector_set(i64 %t1781, i64 %t1788, i64 %t1802)
  %t1804 = load i64, ptr @"scheme.base:%ht-count"
  %t1805 = and i64 %t1804, -8
  %t1806 = inttoptr i64 %t1805 to ptr
  %t1807 = load i64, ptr %t1806
  %t1808 = inttoptr i64 %t1807 to ptr
  %t1809 = call fastcc i64%t1808(i64 %t1804, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1810 = or i64 %t1809, 8
  %t1811 = and i64 %t1810, 7
  %t1812 = icmp eq i64 %t1811, 0
  br i1 %t1812, label %fixfast416, label %fixslow417
fixfast416:
  %t1813 = sub i64 %t1809, 8
  br label %fixmerge418
fixslow417:
  %t1814 = call i64 @rt_sub(i64 %t1809, i64 8)
  br label %fixmerge418
fixmerge418:
  %t1815 = phi i64 [ %t1813, %fixfast416 ], [ %t1814, %fixslow417 ]
  %t1816 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t1817 = and i64 %t1816, -8
  %t1818 = inttoptr i64 %t1817 to ptr
  %t1819 = load i64, ptr %t1818
  %t1820 = inttoptr i64 %t1819 to ptr
  %t1821 = musttail call fastcc i64 %t1820(i64 %t1816, i64 2, i64 %a0, i64 %t1815, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1821
else415:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_454"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1826 = icmp eq i64 %argc, 1
  br i1 %t1826, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok420:
  %t1827 = call i64 @rt_null_p(i64 %a0)
  %t1828 = icmp ne i64 %t1827, 1
  br i1 %t1828, label %then421, label %else422
then421:
  ret i64 1
else422:
  %t1829 = call i64 @rt_car(i64 %a0)
  %t1830 = call i64 @rt_car(i64 %t1829)
  %t1831 = and i64 %self, -8
  %t1832 = inttoptr i64 %t1831 to ptr
  %t1833 = getelementptr i64, ptr %t1832, i64 1
  %t1834 = load i64, ptr %t1833
  %t1835 = load i64, ptr @"scheme.base:%ht-index"
  %t1836 = and i64 %t1835, -8
  %t1837 = inttoptr i64 %t1836 to ptr
  %t1838 = load i64, ptr %t1837
  %t1839 = inttoptr i64 %t1838 to ptr
  %t1840 = call fastcc i64%t1839(i64 %t1835, i64 2, i64 %t1830, i64 %t1834, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1841 = and i64 %self, -8
  %t1842 = inttoptr i64 %t1841 to ptr
  %t1843 = getelementptr i64, ptr %t1842, i64 2
  %t1844 = load i64, ptr %t1843
  %t1845 = and i64 %self, -8
  %t1846 = inttoptr i64 %t1845 to ptr
  %t1847 = getelementptr i64, ptr %t1846, i64 2
  %t1848 = load i64, ptr %t1847
  %t1849 = call i64 @rt_vector_ref(i64 %t1848, i64 %t1840)
  %t1850 = call i64 @rt_cons(i64 %t1829, i64 %t1849)
  %t1851 = call i64 @rt_vector_set(i64 %t1844, i64 %t1840, i64 %t1850)
  %t1852 = call i64 @rt_cdr(i64 %a0)
  %t1853 = musttail call fastcc i64 @"scheme.base:code_454"(i64 %self, i64 1, i64 %t1852, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1853
}

define fastcc i64 @"scheme.base:code_452"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1854 = icmp eq i64 %argc, 1
  br i1 %t1854, label %argok424, label %arityerr423
arityerr423:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok424:
  %t1855 = and i64 %self, -8
  %t1856 = inttoptr i64 %t1855 to ptr
  %t1857 = getelementptr i64, ptr %t1856, i64 1
  %t1858 = load i64, ptr %t1857
  %t1859 = call i64 @rt_vector_length(i64 %t1858)
  %t1860 = or i64 %a0, %t1859
  %t1861 = and i64 %t1860, 7
  %t1862 = icmp eq i64 %t1861, 0
  br i1 %t1862, label %fixfast425, label %fixslow426
fixfast425:
  %t1863 = icmp slt i64 %a0, %t1859
  %t1864 = select i1 %t1863, i64 257, i64 1
  br label %fixmerge427
fixslow426:
  %t1865 = call i64 @rt_lt(i64 %a0, i64 %t1859)
  br label %fixmerge427
fixmerge427:
  %t1866 = phi i64 [ %t1864, %fixfast425 ], [ %t1865, %fixslow426 ]
  %t1867 = icmp ne i64 %t1866, 1
  br i1 %t1867, label %then428, label %else429
then428:
  %t1868 = call ptr @rt_alloc_words(i64 4)
  %t1869 = ptrtoint ptr %t1868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_454" to i64), ptr %t1868
  %t1870 = or i64 %t1869, 4
  %t1871 = and i64 %self, -8
  %t1872 = inttoptr i64 %t1871 to ptr
  %t1873 = getelementptr i64, ptr %t1872, i64 2
  %t1874 = load i64, ptr %t1873
  %t1875 = getelementptr i64, ptr %t1868, i64 1
  store i64 %t1874, ptr %t1875
  %t1876 = and i64 %self, -8
  %t1877 = inttoptr i64 %t1876 to ptr
  %t1878 = getelementptr i64, ptr %t1877, i64 3
  %t1879 = load i64, ptr %t1878
  %t1880 = getelementptr i64, ptr %t1868, i64 2
  store i64 %t1879, ptr %t1880
  %t1881 = getelementptr i64, ptr %t1868, i64 3
  store i64 %t1870, ptr %t1881
  %t1882 = and i64 %self, -8
  %t1883 = inttoptr i64 %t1882 to ptr
  %t1884 = getelementptr i64, ptr %t1883, i64 1
  %t1885 = load i64, ptr %t1884
  %t1886 = call i64 @rt_vector_ref(i64 %t1885, i64 %a0)
  %t1887 = and i64 %t1870, -8
  %t1888 = inttoptr i64 %t1887 to ptr
  %t1889 = load i64, ptr %t1888
  %t1890 = inttoptr i64 %t1889 to ptr
  %t1891 = call fastcc i64%t1890(i64 %t1870, i64 1, i64 %t1886, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1892 = or i64 %a0, 8
  %t1893 = and i64 %t1892, 7
  %t1894 = icmp eq i64 %t1893, 0
  br i1 %t1894, label %fixfast430, label %fixslow431
fixfast430:
  %t1895 = add i64 %a0, 8
  br label %fixmerge432
fixslow431:
  %t1896 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge432
fixmerge432:
  %t1897 = phi i64 [ %t1895, %fixfast430 ], [ %t1896, %fixslow431 ]
  %t1898 = musttail call fastcc i64 @"scheme.base:code_452"(i64 %self, i64 1, i64 %t1897, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1898
else429:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_450"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1899 = icmp eq i64 %argc, 1
  br i1 %t1899, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok434:
  %t1900 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1901 = and i64 %t1900, -8
  %t1902 = inttoptr i64 %t1901 to ptr
  %t1903 = load i64, ptr %t1902
  %t1904 = inttoptr i64 %t1903 to ptr
  %t1905 = call fastcc i64%t1904(i64 %t1900, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1906 = call i64 @rt_vector_length(i64 %t1905)
  %t1907 = or i64 16, %t1906
  %t1908 = and i64 %t1907, 7
  %t1909 = icmp eq i64 %t1908, 0
  br i1 %t1909, label %fixfast435, label %fixslow436
fixfast435:
  %t1910 = ashr i64 16, 3
  %t1911 = mul i64 %t1910, %t1906
  br label %fixmerge437
fixslow436:
  %t1912 = call i64 @rt_mul(i64 16, i64 %t1906)
  br label %fixmerge437
fixmerge437:
  %t1913 = phi i64 [ %t1911, %fixfast435 ], [ %t1912, %fixslow436 ]
  %t1914 = call i64 @rt_make_vector(i64 %t1913, i64 2)
  %t1915 = call ptr @rt_alloc_words(i64 5)
  %t1916 = ptrtoint ptr %t1915 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_452" to i64), ptr %t1915
  %t1917 = or i64 %t1916, 4
  %t1918 = getelementptr i64, ptr %t1915, i64 1
  store i64 %t1905, ptr %t1918
  %t1919 = getelementptr i64, ptr %t1915, i64 2
  store i64 %t1913, ptr %t1919
  %t1920 = getelementptr i64, ptr %t1915, i64 3
  store i64 %t1914, ptr %t1920
  %t1921 = getelementptr i64, ptr %t1915, i64 4
  store i64 %t1917, ptr %t1921
  %t1922 = and i64 %t1917, -8
  %t1923 = inttoptr i64 %t1922 to ptr
  %t1924 = load i64, ptr %t1923
  %t1925 = inttoptr i64 %t1924 to ptr
  %t1926 = call fastcc i64%t1925(i64 %t1917, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1927 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t1928 = and i64 %t1927, -8
  %t1929 = inttoptr i64 %t1928 to ptr
  %t1930 = load i64, ptr %t1929
  %t1931 = inttoptr i64 %t1930 to ptr
  %t1932 = musttail call fastcc i64 %t1931(i64 %t1927, i64 2, i64 %a0, i64 %t1914, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1932
}

define fastcc i64 @"scheme.base:code_457"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1937 = icmp eq i64 %argc, 1
  br i1 %t1937, label %argok439, label %arityerr438
arityerr438:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok439:
  %t1938 = load i64, ptr @"scheme.base:%ht-count"
  %t1939 = and i64 %t1938, -8
  %t1940 = inttoptr i64 %t1939 to ptr
  %t1941 = load i64, ptr %t1940
  %t1942 = inttoptr i64 %t1941 to ptr
  %t1943 = musttail call fastcc i64 %t1942(i64 %t1938, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1943
}

define fastcc i64 @"scheme.base:code_461"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1948 = icmp eq i64 %argc, 2
  br i1 %t1948, label %argok441, label %arityerr440
arityerr440:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok441:
  %t1949 = call i64 @rt_null_p(i64 %a0)
  %t1950 = icmp ne i64 %t1949, 1
  br i1 %t1950, label %then442, label %else443
then442:
  ret i64 %a1
else443:
  %t1951 = call i64 @rt_car(i64 %a0)
  %t1952 = call i64 @rt_car(i64 %t1951)
  %t1953 = call i64 @rt_car(i64 %a0)
  %t1954 = call i64 @rt_cdr(i64 %t1953)
  %t1955 = call i64 @rt_cons(i64 %t1952, i64 %t1954)
  %t1956 = call i64 @rt_cdr(i64 %a0)
  %t1957 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t1958 = and i64 %t1957, -8
  %t1959 = inttoptr i64 %t1958 to ptr
  %t1960 = load i64, ptr %t1959
  %t1961 = inttoptr i64 %t1960 to ptr
  %t1962 = call fastcc i64%t1961(i64 %t1957, i64 2, i64 %t1956, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1963 = call i64 @rt_cons(i64 %t1955, i64 %t1962)
  ret i64 %t1963
}

define fastcc i64 @"scheme.base:code_474"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1968 = icmp eq i64 %argc, 2
  br i1 %t1968, label %argok445, label %arityerr444
arityerr444:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok445:
  %t1969 = and i64 %self, -8
  %t1970 = inttoptr i64 %t1969 to ptr
  %t1971 = getelementptr i64, ptr %t1970, i64 1
  %t1972 = load i64, ptr %t1971
  %t1973 = call i64 @rt_vector_length(i64 %t1972)
  %t1974 = or i64 %a0, %t1973
  %t1975 = and i64 %t1974, 7
  %t1976 = icmp eq i64 %t1975, 0
  br i1 %t1976, label %fixfast446, label %fixslow447
fixfast446:
  %t1977 = icmp slt i64 %a0, %t1973
  %t1978 = select i1 %t1977, i64 257, i64 1
  br label %fixmerge448
fixslow447:
  %t1979 = call i64 @rt_lt(i64 %a0, i64 %t1973)
  br label %fixmerge448
fixmerge448:
  %t1980 = phi i64 [ %t1978, %fixfast446 ], [ %t1979, %fixslow447 ]
  %t1981 = icmp ne i64 %t1980, 1
  br i1 %t1981, label %then449, label %else450
then449:
  %t1982 = or i64 %a0, 8
  %t1983 = and i64 %t1982, 7
  %t1984 = icmp eq i64 %t1983, 0
  br i1 %t1984, label %fixfast451, label %fixslow452
fixfast451:
  %t1985 = add i64 %a0, 8
  br label %fixmerge453
fixslow452:
  %t1986 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge453
fixmerge453:
  %t1987 = phi i64 [ %t1985, %fixfast451 ], [ %t1986, %fixslow452 ]
  %t1988 = and i64 %self, -8
  %t1989 = inttoptr i64 %t1988 to ptr
  %t1990 = getelementptr i64, ptr %t1989, i64 1
  %t1991 = load i64, ptr %t1990
  %t1992 = call i64 @rt_vector_ref(i64 %t1991, i64 %a0)
  %t1993 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t1994 = and i64 %t1993, -8
  %t1995 = inttoptr i64 %t1994 to ptr
  %t1996 = load i64, ptr %t1995
  %t1997 = inttoptr i64 %t1996 to ptr
  %t1998 = call fastcc i64%t1997(i64 %t1993, i64 2, i64 %t1992, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1999 = musttail call fastcc i64 @"scheme.base:code_474"(i64 %self, i64 2, i64 %t1987, i64 %t1998, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1999
else450:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code_472"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2000 = icmp eq i64 %argc, 1
  br i1 %t2000, label %argok455, label %arityerr454
arityerr454:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok455:
  %t2001 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2002 = and i64 %t2001, -8
  %t2003 = inttoptr i64 %t2002 to ptr
  %t2004 = load i64, ptr %t2003
  %t2005 = inttoptr i64 %t2004 to ptr
  %t2006 = call fastcc i64%t2005(i64 %t2001, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2007 = call ptr @rt_alloc_words(i64 3)
  %t2008 = ptrtoint ptr %t2007 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_474" to i64), ptr %t2007
  %t2009 = or i64 %t2008, 4
  %t2010 = getelementptr i64, ptr %t2007, i64 1
  store i64 %t2006, ptr %t2010
  %t2011 = getelementptr i64, ptr %t2007, i64 2
  store i64 %t2009, ptr %t2011
  %t2012 = and i64 %t2009, -8
  %t2013 = inttoptr i64 %t2012 to ptr
  %t2014 = load i64, ptr %t2013
  %t2015 = inttoptr i64 %t2014 to ptr
  %t2016 = musttail call fastcc i64 %t2015(i64 %t2009, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2016
}

define fastcc i64 @"scheme.base:code_480"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2021 = icmp eq i64 %argc, 1
  br i1 %t2021, label %argok457, label %arityerr456
arityerr456:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok457:
  %t2022 = call i64 @rt_car(i64 %a0)
  ret i64 %t2022
}

define fastcc i64 @"scheme.base:code_478"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2023 = icmp eq i64 %argc, 1
  br i1 %t2023, label %argok459, label %arityerr458
arityerr458:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok459:
  %t2024 = call ptr @rt_alloc_words(i64 1)
  %t2025 = ptrtoint ptr %t2024 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_480" to i64), ptr %t2024
  %t2026 = or i64 %t2025, 4
  %t2027 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2028 = and i64 %t2027, -8
  %t2029 = inttoptr i64 %t2028 to ptr
  %t2030 = load i64, ptr %t2029
  %t2031 = inttoptr i64 %t2030 to ptr
  %t2032 = call fastcc i64%t2031(i64 %t2027, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2033 = load i64, ptr @"scheme.base:map"
  %t2034 = and i64 %t2033, -8
  %t2035 = inttoptr i64 %t2034 to ptr
  %t2036 = load i64, ptr %t2035
  %t2037 = inttoptr i64 %t2036 to ptr
  %t2038 = musttail call fastcc i64 %t2037(i64 %t2033, i64 2, i64 %t2026, i64 %t2032, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2038
}

define fastcc i64 @"scheme.base:code_486"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2043 = icmp eq i64 %argc, 1
  br i1 %t2043, label %argok461, label %arityerr460
arityerr460:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok461:
  %t2044 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t2044
}

define fastcc i64 @"scheme.base:code_484"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2045 = icmp eq i64 %argc, 1
  br i1 %t2045, label %argok463, label %arityerr462
arityerr462:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok463:
  %t2046 = call ptr @rt_alloc_words(i64 1)
  %t2047 = ptrtoint ptr %t2046 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_486" to i64), ptr %t2046
  %t2048 = or i64 %t2047, 4
  %t2049 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2050 = and i64 %t2049, -8
  %t2051 = inttoptr i64 %t2050 to ptr
  %t2052 = load i64, ptr %t2051
  %t2053 = inttoptr i64 %t2052 to ptr
  %t2054 = call fastcc i64%t2053(i64 %t2049, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2055 = load i64, ptr @"scheme.base:map"
  %t2056 = and i64 %t2055, -8
  %t2057 = inttoptr i64 %t2056 to ptr
  %t2058 = load i64, ptr %t2057
  %t2059 = inttoptr i64 %t2058 to ptr
  %t2060 = musttail call fastcc i64 %t2059(i64 %t2055, i64 2, i64 %t2048, i64 %t2054, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2060
}

define fastcc i64 @"scheme.base:code_512"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2065 = icmp eq i64 %argc, 1
  br i1 %t2065, label %argok465, label %arityerr464
arityerr464:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok465:
  %t2066 = call i64 @rt_char_to_integer(i64 %a0)
  %t2067 = or i64 %t2066, 256
  %t2068 = and i64 %t2067, 7
  %t2069 = icmp eq i64 %t2068, 0
  br i1 %t2069, label %fixfast466, label %fixslow467
fixfast466:
  %t2070 = icmp eq i64 %t2066, 256
  %t2071 = select i1 %t2070, i64 257, i64 1
  br label %fixmerge468
fixslow467:
  %t2072 = call i64 @rt_num_eq(i64 %t2066, i64 256)
  br label %fixmerge468
fixmerge468:
  %t2073 = phi i64 [ %t2071, %fixfast466 ], [ %t2072, %fixslow467 ]
  %t2074 = icmp ne i64 %t2073, 1
  br i1 %t2074, label %then469, label %else470
then469:
  ret i64 %t2073
else470:
  %t2075 = or i64 %t2066, 72
  %t2076 = and i64 %t2075, 7
  %t2077 = icmp eq i64 %t2076, 0
  br i1 %t2077, label %fixfast471, label %fixslow472
fixfast471:
  %t2078 = icmp eq i64 %t2066, 72
  %t2079 = select i1 %t2078, i64 257, i64 1
  br label %fixmerge473
fixslow472:
  %t2080 = call i64 @rt_num_eq(i64 %t2066, i64 72)
  br label %fixmerge473
fixmerge473:
  %t2081 = phi i64 [ %t2079, %fixfast471 ], [ %t2080, %fixslow472 ]
  %t2082 = icmp ne i64 %t2081, 1
  br i1 %t2082, label %then474, label %else475
then474:
  ret i64 %t2081
else475:
  %t2083 = or i64 %t2066, 80
  %t2084 = and i64 %t2083, 7
  %t2085 = icmp eq i64 %t2084, 0
  br i1 %t2085, label %fixfast476, label %fixslow477
fixfast476:
  %t2086 = icmp eq i64 %t2066, 80
  %t2087 = select i1 %t2086, i64 257, i64 1
  br label %fixmerge478
fixslow477:
  %t2088 = call i64 @rt_num_eq(i64 %t2066, i64 80)
  br label %fixmerge478
fixmerge478:
  %t2089 = phi i64 [ %t2087, %fixfast476 ], [ %t2088, %fixslow477 ]
  %t2090 = icmp ne i64 %t2089, 1
  br i1 %t2090, label %then479, label %else480
then479:
  ret i64 %t2089
else480:
  %t2091 = or i64 %t2066, 104
  %t2092 = and i64 %t2091, 7
  %t2093 = icmp eq i64 %t2092, 0
  br i1 %t2093, label %fixfast481, label %fixslow482
fixfast481:
  %t2094 = icmp eq i64 %t2066, 104
  %t2095 = select i1 %t2094, i64 257, i64 1
  br label %fixmerge483
fixslow482:
  %t2096 = call i64 @rt_num_eq(i64 %t2066, i64 104)
  br label %fixmerge483
fixmerge483:
  %t2097 = phi i64 [ %t2095, %fixfast481 ], [ %t2096, %fixslow482 ]
  ret i64 %t2097
}

define fastcc i64 @"scheme.base:code_524"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2102 = icmp eq i64 %argc, 1
  br i1 %t2102, label %argok485, label %arityerr484
arityerr484:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok485:
  %t2103 = call i64 @rt_char_to_integer(i64 %a0)
  %t2104 = or i64 376, %t2103
  %t2105 = and i64 %t2104, 7
  %t2106 = icmp eq i64 %t2105, 0
  br i1 %t2106, label %fixfast486, label %fixslow487
fixfast486:
  %t2107 = icmp slt i64 376, %t2103
  %t2108 = select i1 %t2107, i64 257, i64 1
  br label %fixmerge488
fixslow487:
  %t2109 = call i64 @rt_lt(i64 376, i64 %t2103)
  br label %fixmerge488
fixmerge488:
  %t2110 = phi i64 [ %t2108, %fixfast486 ], [ %t2109, %fixslow487 ]
  %t2111 = icmp ne i64 %t2110, 1
  br i1 %t2111, label %then489, label %else490
then489:
  %t2112 = or i64 %t2103, 464
  %t2113 = and i64 %t2112, 7
  %t2114 = icmp eq i64 %t2113, 0
  br i1 %t2114, label %fixfast491, label %fixslow492
fixfast491:
  %t2115 = icmp slt i64 %t2103, 464
  %t2116 = select i1 %t2115, i64 257, i64 1
  br label %fixmerge493
fixslow492:
  %t2117 = call i64 @rt_lt(i64 %t2103, i64 464)
  br label %fixmerge493
fixmerge493:
  %t2118 = phi i64 [ %t2116, %fixfast491 ], [ %t2117, %fixslow492 ]
  ret i64 %t2118
else490:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_564"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2123 = icmp eq i64 %argc, 1
  br i1 %t2123, label %argok495, label %arityerr494
arityerr494:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok495:
  %t2124 = call i64 @rt_char_to_integer(i64 %a0)
  %t2125 = load i64, ptr @"scheme.base:rd-ws?"
  %t2126 = and i64 %t2125, -8
  %t2127 = inttoptr i64 %t2126 to ptr
  %t2128 = load i64, ptr %t2127
  %t2129 = inttoptr i64 %t2128 to ptr
  %t2130 = call fastcc i64%t2129(i64 %t2125, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2131 = icmp ne i64 %t2130, 1
  br i1 %t2131, label %then496, label %else497
then496:
  ret i64 %t2130
else497:
  %t2132 = or i64 %t2124, 320
  %t2133 = and i64 %t2132, 7
  %t2134 = icmp eq i64 %t2133, 0
  br i1 %t2134, label %fixfast498, label %fixslow499
fixfast498:
  %t2135 = icmp eq i64 %t2124, 320
  %t2136 = select i1 %t2135, i64 257, i64 1
  br label %fixmerge500
fixslow499:
  %t2137 = call i64 @rt_num_eq(i64 %t2124, i64 320)
  br label %fixmerge500
fixmerge500:
  %t2138 = phi i64 [ %t2136, %fixfast498 ], [ %t2137, %fixslow499 ]
  %t2139 = icmp ne i64 %t2138, 1
  br i1 %t2139, label %then501, label %else502
then501:
  ret i64 %t2138
else502:
  %t2140 = or i64 %t2124, 328
  %t2141 = and i64 %t2140, 7
  %t2142 = icmp eq i64 %t2141, 0
  br i1 %t2142, label %fixfast503, label %fixslow504
fixfast503:
  %t2143 = icmp eq i64 %t2124, 328
  %t2144 = select i1 %t2143, i64 257, i64 1
  br label %fixmerge505
fixslow504:
  %t2145 = call i64 @rt_num_eq(i64 %t2124, i64 328)
  br label %fixmerge505
fixmerge505:
  %t2146 = phi i64 [ %t2144, %fixfast503 ], [ %t2145, %fixslow504 ]
  %t2147 = icmp ne i64 %t2146, 1
  br i1 %t2147, label %then506, label %else507
then506:
  ret i64 %t2146
else507:
  %t2148 = or i64 %t2124, 728
  %t2149 = and i64 %t2148, 7
  %t2150 = icmp eq i64 %t2149, 0
  br i1 %t2150, label %fixfast508, label %fixslow509
fixfast508:
  %t2151 = icmp eq i64 %t2124, 728
  %t2152 = select i1 %t2151, i64 257, i64 1
  br label %fixmerge510
fixslow509:
  %t2153 = call i64 @rt_num_eq(i64 %t2124, i64 728)
  br label %fixmerge510
fixmerge510:
  %t2154 = phi i64 [ %t2152, %fixfast508 ], [ %t2153, %fixslow509 ]
  %t2155 = icmp ne i64 %t2154, 1
  br i1 %t2155, label %then511, label %else512
then511:
  ret i64 %t2154
else512:
  %t2156 = or i64 %t2124, 744
  %t2157 = and i64 %t2156, 7
  %t2158 = icmp eq i64 %t2157, 0
  br i1 %t2158, label %fixfast513, label %fixslow514
fixfast513:
  %t2159 = icmp eq i64 %t2124, 744
  %t2160 = select i1 %t2159, i64 257, i64 1
  br label %fixmerge515
fixslow514:
  %t2161 = call i64 @rt_num_eq(i64 %t2124, i64 744)
  br label %fixmerge515
fixmerge515:
  %t2162 = phi i64 [ %t2160, %fixfast513 ], [ %t2161, %fixslow514 ]
  %t2163 = icmp ne i64 %t2162, 1
  br i1 %t2163, label %then516, label %else517
then516:
  ret i64 %t2162
else517:
  %t2164 = or i64 %t2124, 272
  %t2165 = and i64 %t2164, 7
  %t2166 = icmp eq i64 %t2165, 0
  br i1 %t2166, label %fixfast518, label %fixslow519
fixfast518:
  %t2167 = icmp eq i64 %t2124, 272
  %t2168 = select i1 %t2167, i64 257, i64 1
  br label %fixmerge520
fixslow519:
  %t2169 = call i64 @rt_num_eq(i64 %t2124, i64 272)
  br label %fixmerge520
fixmerge520:
  %t2170 = phi i64 [ %t2168, %fixfast518 ], [ %t2169, %fixslow519 ]
  %t2171 = icmp ne i64 %t2170, 1
  br i1 %t2171, label %then521, label %else522
then521:
  ret i64 %t2170
else522:
  %t2172 = or i64 %t2124, 472
  %t2173 = and i64 %t2172, 7
  %t2174 = icmp eq i64 %t2173, 0
  br i1 %t2174, label %fixfast523, label %fixslow524
fixfast523:
  %t2175 = icmp eq i64 %t2124, 472
  %t2176 = select i1 %t2175, i64 257, i64 1
  br label %fixmerge525
fixslow524:
  %t2177 = call i64 @rt_num_eq(i64 %t2124, i64 472)
  br label %fixmerge525
fixmerge525:
  %t2178 = phi i64 [ %t2176, %fixfast523 ], [ %t2177, %fixslow524 ]
  ret i64 %t2178
}

define fastcc i64 @"scheme.base:code_577"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2183 = icmp eq i64 %argc, 3
  br i1 %t2183, label %argok527, label %arityerr526
arityerr526:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok527:
  %t2184 = or i64 %a2, %a1
  %t2185 = and i64 %t2184, 7
  %t2186 = icmp eq i64 %t2185, 0
  br i1 %t2186, label %fixfast528, label %fixslow529
fixfast528:
  %t2187 = icmp slt i64 %a2, %a1
  %t2188 = select i1 %t2187, i64 257, i64 1
  br label %fixmerge530
fixslow529:
  %t2189 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge530
fixmerge530:
  %t2190 = phi i64 [ %t2188, %fixfast528 ], [ %t2189, %fixslow529 ]
  %t2191 = icmp ne i64 %t2190, 1
  br i1 %t2191, label %then531, label %else532
then531:
  %t2192 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2193 = call i64 @rt_char_to_integer(i64 %t2192)
  %t2194 = or i64 %t2193, 80
  %t2195 = and i64 %t2194, 7
  %t2196 = icmp eq i64 %t2195, 0
  br i1 %t2196, label %fixfast533, label %fixslow534
fixfast533:
  %t2197 = icmp eq i64 %t2193, 80
  %t2198 = select i1 %t2197, i64 257, i64 1
  br label %fixmerge535
fixslow534:
  %t2199 = call i64 @rt_num_eq(i64 %t2193, i64 80)
  br label %fixmerge535
fixmerge535:
  %t2200 = phi i64 [ %t2198, %fixfast533 ], [ %t2199, %fixslow534 ]
  %t2201 = icmp ne i64 %t2200, 1
  br i1 %t2201, label %then536, label %else537
then536:
  %t2202 = or i64 %a2, 8
  %t2203 = and i64 %t2202, 7
  %t2204 = icmp eq i64 %t2203, 0
  br i1 %t2204, label %fixfast538, label %fixslow539
fixfast538:
  %t2205 = add i64 %a2, 8
  br label %fixmerge540
fixslow539:
  %t2206 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge540
fixmerge540:
  %t2207 = phi i64 [ %t2205, %fixfast538 ], [ %t2206, %fixslow539 ]
  ret i64 %t2207
else537:
  %t2208 = or i64 %a2, 8
  %t2209 = and i64 %t2208, 7
  %t2210 = icmp eq i64 %t2209, 0
  br i1 %t2210, label %fixfast541, label %fixslow542
fixfast541:
  %t2211 = add i64 %a2, 8
  br label %fixmerge543
fixslow542:
  %t2212 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge543
fixmerge543:
  %t2213 = phi i64 [ %t2211, %fixfast541 ], [ %t2212, %fixslow542 ]
  %t2214 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2215 = and i64 %t2214, -8
  %t2216 = inttoptr i64 %t2215 to ptr
  %t2217 = load i64, ptr %t2216
  %t2218 = inttoptr i64 %t2217 to ptr
  %t2219 = musttail call fastcc i64 %t2218(i64 %t2214, i64 3, i64 %a0, i64 %a1, i64 %t2213, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2219
else532:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_591"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2224 = icmp eq i64 %argc, 3
  br i1 %t2224, label %argok545, label %arityerr544
arityerr544:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok545:
  %t2225 = or i64 %a2, %a1
  %t2226 = and i64 %t2225, 7
  %t2227 = icmp eq i64 %t2226, 0
  br i1 %t2227, label %fixfast546, label %fixslow547
fixfast546:
  %t2228 = icmp slt i64 %a2, %a1
  %t2229 = select i1 %t2228, i64 257, i64 1
  br label %fixmerge548
fixslow547:
  %t2230 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge548
fixmerge548:
  %t2231 = phi i64 [ %t2229, %fixfast546 ], [ %t2230, %fixslow547 ]
  %t2232 = icmp ne i64 %t2231, 1
  br i1 %t2232, label %then549, label %else550
then549:
  %t2233 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2234 = load i64, ptr @"scheme.base:rd-ws?"
  %t2235 = and i64 %t2234, -8
  %t2236 = inttoptr i64 %t2235 to ptr
  %t2237 = load i64, ptr %t2236
  %t2238 = inttoptr i64 %t2237 to ptr
  %t2239 = call fastcc i64%t2238(i64 %t2234, i64 1, i64 %t2233, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2240 = icmp ne i64 %t2239, 1
  br i1 %t2240, label %then551, label %else552
then551:
  %t2241 = or i64 %a2, 8
  %t2242 = and i64 %t2241, 7
  %t2243 = icmp eq i64 %t2242, 0
  br i1 %t2243, label %fixfast553, label %fixslow554
fixfast553:
  %t2244 = add i64 %a2, 8
  br label %fixmerge555
fixslow554:
  %t2245 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge555
fixmerge555:
  %t2246 = phi i64 [ %t2244, %fixfast553 ], [ %t2245, %fixslow554 ]
  %t2247 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2248 = and i64 %t2247, -8
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = load i64, ptr %t2249
  %t2251 = inttoptr i64 %t2250 to ptr
  %t2252 = musttail call fastcc i64 %t2251(i64 %t2247, i64 3, i64 %a0, i64 %a1, i64 %t2246, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2252
else552:
  %t2253 = call i64 @rt_char_to_integer(i64 %t2233)
  %t2254 = or i64 %t2253, 472
  %t2255 = and i64 %t2254, 7
  %t2256 = icmp eq i64 %t2255, 0
  br i1 %t2256, label %fixfast556, label %fixslow557
fixfast556:
  %t2257 = icmp eq i64 %t2253, 472
  %t2258 = select i1 %t2257, i64 257, i64 1
  br label %fixmerge558
fixslow557:
  %t2259 = call i64 @rt_num_eq(i64 %t2253, i64 472)
  br label %fixmerge558
fixmerge558:
  %t2260 = phi i64 [ %t2258, %fixfast556 ], [ %t2259, %fixslow557 ]
  %t2261 = icmp ne i64 %t2260, 1
  br i1 %t2261, label %then559, label %else560
then559:
  %t2262 = or i64 %a2, 8
  %t2263 = and i64 %t2262, 7
  %t2264 = icmp eq i64 %t2263, 0
  br i1 %t2264, label %fixfast561, label %fixslow562
fixfast561:
  %t2265 = add i64 %a2, 8
  br label %fixmerge563
fixslow562:
  %t2266 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge563
fixmerge563:
  %t2267 = phi i64 [ %t2265, %fixfast561 ], [ %t2266, %fixslow562 ]
  %t2268 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2269 = and i64 %t2268, -8
  %t2270 = inttoptr i64 %t2269 to ptr
  %t2271 = load i64, ptr %t2270
  %t2272 = inttoptr i64 %t2271 to ptr
  %t2273 = call fastcc i64%t2272(i64 %t2268, i64 3, i64 %a0, i64 %a1, i64 %t2267, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2274 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2275 = and i64 %t2274, -8
  %t2276 = inttoptr i64 %t2275 to ptr
  %t2277 = load i64, ptr %t2276
  %t2278 = inttoptr i64 %t2277 to ptr
  %t2279 = musttail call fastcc i64 %t2278(i64 %t2274, i64 3, i64 %a0, i64 %a1, i64 %t2273, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2279
else560:
  ret i64 %a2
else550:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_600"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2284 = icmp eq i64 %argc, 3
  br i1 %t2284, label %argok565, label %arityerr564
arityerr564:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok565:
  %t2285 = or i64 %a2, %a1
  %t2286 = and i64 %t2285, 7
  %t2287 = icmp eq i64 %t2286, 0
  br i1 %t2287, label %fixfast566, label %fixslow567
fixfast566:
  %t2288 = icmp slt i64 %a2, %a1
  %t2289 = select i1 %t2288, i64 257, i64 1
  br label %fixmerge568
fixslow567:
  %t2290 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge568
fixmerge568:
  %t2291 = phi i64 [ %t2289, %fixfast566 ], [ %t2290, %fixslow567 ]
  %t2292 = icmp ne i64 %t2291, 1
  br i1 %t2292, label %then569, label %else570
then569:
  %t2293 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2294 = load i64, ptr @"scheme.base:rd-delim?"
  %t2295 = and i64 %t2294, -8
  %t2296 = inttoptr i64 %t2295 to ptr
  %t2297 = load i64, ptr %t2296
  %t2298 = inttoptr i64 %t2297 to ptr
  %t2299 = call fastcc i64%t2298(i64 %t2294, i64 1, i64 %t2293, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2300 = icmp ne i64 %t2299, 1
  br i1 %t2300, label %then571, label %else572
then571:
  ret i64 %a2
else572:
  %t2301 = or i64 %a2, 8
  %t2302 = and i64 %t2301, 7
  %t2303 = icmp eq i64 %t2302, 0
  br i1 %t2303, label %fixfast573, label %fixslow574
fixfast573:
  %t2304 = add i64 %a2, 8
  br label %fixmerge575
fixslow574:
  %t2305 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge575
fixmerge575:
  %t2306 = phi i64 [ %t2304, %fixfast573 ], [ %t2305, %fixslow574 ]
  %t2307 = load i64, ptr @"scheme.base:rd-token-end"
  %t2308 = and i64 %t2307, -8
  %t2309 = inttoptr i64 %t2308 to ptr
  %t2310 = load i64, ptr %t2309
  %t2311 = inttoptr i64 %t2310 to ptr
  %t2312 = musttail call fastcc i64 %t2311(i64 %t2307, i64 3, i64 %a0, i64 %a1, i64 %t2306, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2312
else570:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code_609"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2317 = icmp eq i64 %argc, 3
  br i1 %t2317, label %argok577, label %arityerr576
arityerr576:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok577:
  %t2318 = or i64 %a1, %a2
  %t2319 = and i64 %t2318, 7
  %t2320 = icmp eq i64 %t2319, 0
  br i1 %t2320, label %fixfast578, label %fixslow579
fixfast578:
  %t2321 = icmp slt i64 %a1, %a2
  %t2322 = select i1 %t2321, i64 257, i64 1
  br label %fixmerge580
fixslow579:
  %t2323 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge580
fixmerge580:
  %t2324 = phi i64 [ %t2322, %fixfast578 ], [ %t2323, %fixslow579 ]
  %t2325 = icmp ne i64 %t2324, 1
  br i1 %t2325, label %then581, label %else582
then581:
  %t2326 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2327 = load i64, ptr @"scheme.base:rd-digit?"
  %t2328 = and i64 %t2327, -8
  %t2329 = inttoptr i64 %t2328 to ptr
  %t2330 = load i64, ptr %t2329
  %t2331 = inttoptr i64 %t2330 to ptr
  %t2332 = call fastcc i64%t2331(i64 %t2327, i64 1, i64 %t2326, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2333 = icmp ne i64 %t2332, 1
  br i1 %t2333, label %then583, label %else584
then583:
  %t2334 = or i64 %a1, 8
  %t2335 = and i64 %t2334, 7
  %t2336 = icmp eq i64 %t2335, 0
  br i1 %t2336, label %fixfast585, label %fixslow586
fixfast585:
  %t2337 = add i64 %a1, 8
  br label %fixmerge587
fixslow586:
  %t2338 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge587
fixmerge587:
  %t2339 = phi i64 [ %t2337, %fixfast585 ], [ %t2338, %fixslow586 ]
  %t2340 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2341 = and i64 %t2340, -8
  %t2342 = inttoptr i64 %t2341 to ptr
  %t2343 = load i64, ptr %t2342
  %t2344 = inttoptr i64 %t2343 to ptr
  %t2345 = musttail call fastcc i64 %t2344(i64 %t2340, i64 3, i64 %a0, i64 %t2339, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2345
else584:
  ret i64 1
else582:
  ret i64 257
}

define fastcc i64 @"scheme.base:code_632"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2350 = icmp eq i64 %argc, 1
  br i1 %t2350, label %argok589, label %arityerr588
arityerr588:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok589:
  %t2351 = call i64 @rt_string_length(i64 %a0)
  %t2352 = or i64 0, %t2351
  %t2353 = and i64 %t2352, 7
  %t2354 = icmp eq i64 %t2353, 0
  br i1 %t2354, label %fixfast590, label %fixslow591
fixfast590:
  %t2355 = icmp slt i64 0, %t2351
  %t2356 = select i1 %t2355, i64 257, i64 1
  br label %fixmerge592
fixslow591:
  %t2357 = call i64 @rt_lt(i64 0, i64 %t2351)
  br label %fixmerge592
fixmerge592:
  %t2358 = phi i64 [ %t2356, %fixfast590 ], [ %t2357, %fixslow591 ]
  %t2359 = icmp ne i64 %t2358, 1
  br i1 %t2359, label %then593, label %else594
then593:
  %t2360 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2361 = call i64 @rt_char_to_integer(i64 %t2360)
  %t2362 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2363 = load i64, ptr @"scheme.base:rd-digit?"
  %t2364 = and i64 %t2363, -8
  %t2365 = inttoptr i64 %t2364 to ptr
  %t2366 = load i64, ptr %t2365
  %t2367 = inttoptr i64 %t2366 to ptr
  %t2368 = call fastcc i64%t2367(i64 %t2363, i64 1, i64 %t2362, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2369 = icmp ne i64 %t2368, 1
  br i1 %t2369, label %then595, label %else596
then595:
  %t2370 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2371 = and i64 %t2370, -8
  %t2372 = inttoptr i64 %t2371 to ptr
  %t2373 = load i64, ptr %t2372
  %t2374 = inttoptr i64 %t2373 to ptr
  %t2375 = musttail call fastcc i64 %t2374(i64 %t2370, i64 3, i64 %a0, i64 0, i64 %t2351, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2375
else596:
  %t2376 = or i64 %t2361, 360
  %t2377 = and i64 %t2376, 7
  %t2378 = icmp eq i64 %t2377, 0
  br i1 %t2378, label %fixfast597, label %fixslow598
fixfast597:
  %t2379 = icmp eq i64 %t2361, 360
  %t2380 = select i1 %t2379, i64 257, i64 1
  br label %fixmerge599
fixslow598:
  %t2381 = call i64 @rt_num_eq(i64 %t2361, i64 360)
  br label %fixmerge599
fixmerge599:
  %t2382 = phi i64 [ %t2380, %fixfast597 ], [ %t2381, %fixslow598 ]
  %t2383 = icmp ne i64 %t2382, 1
  br i1 %t2383, label %then600, label %else601
then600:
  br label %merge602
else601:
  %t2384 = or i64 %t2361, 344
  %t2385 = and i64 %t2384, 7
  %t2386 = icmp eq i64 %t2385, 0
  br i1 %t2386, label %fixfast603, label %fixslow604
fixfast603:
  %t2387 = icmp eq i64 %t2361, 344
  %t2388 = select i1 %t2387, i64 257, i64 1
  br label %fixmerge605
fixslow604:
  %t2389 = call i64 @rt_num_eq(i64 %t2361, i64 344)
  br label %fixmerge605
fixmerge605:
  %t2390 = phi i64 [ %t2388, %fixfast603 ], [ %t2389, %fixslow604 ]
  br label %merge602
merge602:
  %t2391 = phi i64 [ %t2382, %then600 ], [ %t2390, %fixmerge605 ]
  %t2392 = icmp ne i64 %t2391, 1
  br i1 %t2392, label %then606, label %else607
then606:
  %t2393 = or i64 8, %t2351
  %t2394 = and i64 %t2393, 7
  %t2395 = icmp eq i64 %t2394, 0
  br i1 %t2395, label %fixfast608, label %fixslow609
fixfast608:
  %t2396 = icmp slt i64 8, %t2351
  %t2397 = select i1 %t2396, i64 257, i64 1
  br label %fixmerge610
fixslow609:
  %t2398 = call i64 @rt_lt(i64 8, i64 %t2351)
  br label %fixmerge610
fixmerge610:
  %t2399 = phi i64 [ %t2397, %fixfast608 ], [ %t2398, %fixslow609 ]
  %t2400 = icmp ne i64 %t2399, 1
  br i1 %t2400, label %then611, label %else612
then611:
  %t2401 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2402 = and i64 %t2401, -8
  %t2403 = inttoptr i64 %t2402 to ptr
  %t2404 = load i64, ptr %t2403
  %t2405 = inttoptr i64 %t2404 to ptr
  %t2406 = musttail call fastcc i64 %t2405(i64 %t2401, i64 3, i64 %a0, i64 8, i64 %t2351, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2406
else612:
  ret i64 1
else607:
  ret i64 1
else594:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_642"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2411 = icmp eq i64 %argc, 4
  br i1 %t2411, label %argok614, label %arityerr613
arityerr613:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok614:
  %t2412 = or i64 %a1, %a2
  %t2413 = and i64 %t2412, 7
  %t2414 = icmp eq i64 %t2413, 0
  br i1 %t2414, label %fixfast615, label %fixslow616
fixfast615:
  %t2415 = icmp slt i64 %a1, %a2
  %t2416 = select i1 %t2415, i64 257, i64 1
  br label %fixmerge617
fixslow616:
  %t2417 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge617
fixmerge617:
  %t2418 = phi i64 [ %t2416, %fixfast615 ], [ %t2417, %fixslow616 ]
  %t2419 = icmp ne i64 %t2418, 1
  br i1 %t2419, label %then618, label %else619
then618:
  %t2420 = or i64 %a1, 8
  %t2421 = and i64 %t2420, 7
  %t2422 = icmp eq i64 %t2421, 0
  br i1 %t2422, label %fixfast620, label %fixslow621
fixfast620:
  %t2423 = add i64 %a1, 8
  br label %fixmerge622
fixslow621:
  %t2424 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge622
fixmerge622:
  %t2425 = phi i64 [ %t2423, %fixfast620 ], [ %t2424, %fixslow621 ]
  %t2426 = or i64 %a3, 80
  %t2427 = and i64 %t2426, 7
  %t2428 = icmp eq i64 %t2427, 0
  br i1 %t2428, label %fixfast623, label %fixslow624
fixfast623:
  %t2429 = ashr i64 %a3, 3
  %t2430 = mul i64 %t2429, 80
  br label %fixmerge625
fixslow624:
  %t2431 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge625
fixmerge625:
  %t2432 = phi i64 [ %t2430, %fixfast623 ], [ %t2431, %fixslow624 ]
  %t2433 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2434 = call i64 @rt_char_to_integer(i64 %t2433)
  %t2435 = or i64 %t2434, 384
  %t2436 = and i64 %t2435, 7
  %t2437 = icmp eq i64 %t2436, 0
  br i1 %t2437, label %fixfast626, label %fixslow627
fixfast626:
  %t2438 = sub i64 %t2434, 384
  br label %fixmerge628
fixslow627:
  %t2439 = call i64 @rt_sub(i64 %t2434, i64 384)
  br label %fixmerge628
fixmerge628:
  %t2440 = phi i64 [ %t2438, %fixfast626 ], [ %t2439, %fixslow627 ]
  %t2441 = or i64 %t2432, %t2440
  %t2442 = and i64 %t2441, 7
  %t2443 = icmp eq i64 %t2442, 0
  br i1 %t2443, label %fixfast629, label %fixslow630
fixfast629:
  %t2444 = add i64 %t2432, %t2440
  br label %fixmerge631
fixslow630:
  %t2445 = call i64 @rt_add(i64 %t2432, i64 %t2440)
  br label %fixmerge631
fixmerge631:
  %t2446 = phi i64 [ %t2444, %fixfast629 ], [ %t2445, %fixslow630 ]
  %t2447 = load i64, ptr @"scheme.base:rd-digits"
  %t2448 = and i64 %t2447, -8
  %t2449 = inttoptr i64 %t2448 to ptr
  %t2450 = load i64, ptr %t2449
  %t2451 = inttoptr i64 %t2450 to ptr
  %t2452 = musttail call fastcc i64 %t2451(i64 %t2447, i64 4, i64 %a0, i64 %t2425, i64 %a2, i64 %t2446, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2452
else619:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code_655"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2457 = icmp eq i64 %argc, 1
  br i1 %t2457, label %argok633, label %arityerr632
arityerr632:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok633:
  %t2458 = call i64 @rt_string_length(i64 %a0)
  %t2459 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2460 = call i64 @rt_char_to_integer(i64 %t2459)
  %t2461 = or i64 %t2460, 360
  %t2462 = and i64 %t2461, 7
  %t2463 = icmp eq i64 %t2462, 0
  br i1 %t2463, label %fixfast634, label %fixslow635
fixfast634:
  %t2464 = icmp eq i64 %t2460, 360
  %t2465 = select i1 %t2464, i64 257, i64 1
  br label %fixmerge636
fixslow635:
  %t2466 = call i64 @rt_num_eq(i64 %t2460, i64 360)
  br label %fixmerge636
fixmerge636:
  %t2467 = phi i64 [ %t2465, %fixfast634 ], [ %t2466, %fixslow635 ]
  %t2468 = icmp ne i64 %t2467, 1
  br i1 %t2468, label %then637, label %else638
then637:
  %t2469 = load i64, ptr @"scheme.base:rd-digits"
  %t2470 = and i64 %t2469, -8
  %t2471 = inttoptr i64 %t2470 to ptr
  %t2472 = load i64, ptr %t2471
  %t2473 = inttoptr i64 %t2472 to ptr
  %t2474 = call fastcc i64%t2473(i64 %t2469, i64 4, i64 %a0, i64 8, i64 %t2458, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2475 = or i64 0, %t2474
  %t2476 = and i64 %t2475, 7
  %t2477 = icmp eq i64 %t2476, 0
  br i1 %t2477, label %fixfast639, label %fixslow640
fixfast639:
  %t2478 = sub i64 0, %t2474
  br label %fixmerge641
fixslow640:
  %t2479 = call i64 @rt_sub(i64 0, i64 %t2474)
  br label %fixmerge641
fixmerge641:
  %t2480 = phi i64 [ %t2478, %fixfast639 ], [ %t2479, %fixslow640 ]
  ret i64 %t2480
else638:
  %t2481 = or i64 %t2460, 344
  %t2482 = and i64 %t2481, 7
  %t2483 = icmp eq i64 %t2482, 0
  br i1 %t2483, label %fixfast642, label %fixslow643
fixfast642:
  %t2484 = icmp eq i64 %t2460, 344
  %t2485 = select i1 %t2484, i64 257, i64 1
  br label %fixmerge644
fixslow643:
  %t2486 = call i64 @rt_num_eq(i64 %t2460, i64 344)
  br label %fixmerge644
fixmerge644:
  %t2487 = phi i64 [ %t2485, %fixfast642 ], [ %t2486, %fixslow643 ]
  %t2488 = icmp ne i64 %t2487, 1
  br i1 %t2488, label %then645, label %else646
then645:
  %t2489 = load i64, ptr @"scheme.base:rd-digits"
  %t2490 = and i64 %t2489, -8
  %t2491 = inttoptr i64 %t2490 to ptr
  %t2492 = load i64, ptr %t2491
  %t2493 = inttoptr i64 %t2492 to ptr
  %t2494 = musttail call fastcc i64 %t2493(i64 %t2489, i64 4, i64 %a0, i64 8, i64 %t2458, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2494
else646:
  %t2495 = load i64, ptr @"scheme.base:rd-digits"
  %t2496 = and i64 %t2495, -8
  %t2497 = inttoptr i64 %t2496 to ptr
  %t2498 = load i64, ptr %t2497
  %t2499 = inttoptr i64 %t2498 to ptr
  %t2500 = musttail call fastcc i64 %t2499(i64 %t2495, i64 4, i64 %a0, i64 0, i64 %t2458, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2500
}

define fastcc i64 @"scheme.base:code_662"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2505 = icmp eq i64 %argc, 1
  br i1 %t2505, label %argok648, label %arityerr647
arityerr647:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok648:
  %t2506 = call i64 @rt_char_to_integer(i64 %a0)
  %t2507 = or i64 %t2506, 368
  %t2508 = and i64 %t2507, 7
  %t2509 = icmp eq i64 %t2508, 0
  br i1 %t2509, label %fixfast649, label %fixslow650
fixfast649:
  %t2510 = icmp eq i64 %t2506, 368
  %t2511 = select i1 %t2510, i64 257, i64 1
  br label %fixmerge651
fixslow650:
  %t2512 = call i64 @rt_num_eq(i64 %t2506, i64 368)
  br label %fixmerge651
fixmerge651:
  %t2513 = phi i64 [ %t2511, %fixfast649 ], [ %t2512, %fixslow650 ]
  ret i64 %t2513
}

define fastcc i64 @"scheme.base:code_676"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2518 = icmp eq i64 %argc, 1
  br i1 %t2518, label %argok653, label %arityerr652
arityerr652:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok653:
  %t2519 = call i64 @rt_char_to_integer(i64 %a0)
  %t2520 = or i64 %t2519, 808
  %t2521 = and i64 %t2520, 7
  %t2522 = icmp eq i64 %t2521, 0
  br i1 %t2522, label %fixfast654, label %fixslow655
fixfast654:
  %t2523 = icmp eq i64 %t2519, 808
  %t2524 = select i1 %t2523, i64 257, i64 1
  br label %fixmerge656
fixslow655:
  %t2525 = call i64 @rt_num_eq(i64 %t2519, i64 808)
  br label %fixmerge656
fixmerge656:
  %t2526 = phi i64 [ %t2524, %fixfast654 ], [ %t2525, %fixslow655 ]
  %t2527 = icmp ne i64 %t2526, 1
  br i1 %t2527, label %then657, label %else658
then657:
  ret i64 %t2526
else658:
  %t2528 = or i64 %t2519, 552
  %t2529 = and i64 %t2528, 7
  %t2530 = icmp eq i64 %t2529, 0
  br i1 %t2530, label %fixfast659, label %fixslow660
fixfast659:
  %t2531 = icmp eq i64 %t2519, 552
  %t2532 = select i1 %t2531, i64 257, i64 1
  br label %fixmerge661
fixslow660:
  %t2533 = call i64 @rt_num_eq(i64 %t2519, i64 552)
  br label %fixmerge661
fixmerge661:
  %t2534 = phi i64 [ %t2532, %fixfast659 ], [ %t2533, %fixslow660 ]
  ret i64 %t2534
}

define fastcc i64 @"scheme.base:code_690"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2539 = icmp eq i64 %argc, 1
  br i1 %t2539, label %argok663, label %arityerr662
arityerr662:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok663:
  %t2540 = call i64 @rt_char_to_integer(i64 %a0)
  %t2541 = or i64 %t2540, 344
  %t2542 = and i64 %t2541, 7
  %t2543 = icmp eq i64 %t2542, 0
  br i1 %t2543, label %fixfast664, label %fixslow665
fixfast664:
  %t2544 = icmp eq i64 %t2540, 344
  %t2545 = select i1 %t2544, i64 257, i64 1
  br label %fixmerge666
fixslow665:
  %t2546 = call i64 @rt_num_eq(i64 %t2540, i64 344)
  br label %fixmerge666
fixmerge666:
  %t2547 = phi i64 [ %t2545, %fixfast664 ], [ %t2546, %fixslow665 ]
  %t2548 = icmp ne i64 %t2547, 1
  br i1 %t2548, label %then667, label %else668
then667:
  ret i64 %t2547
else668:
  %t2549 = or i64 %t2540, 360
  %t2550 = and i64 %t2549, 7
  %t2551 = icmp eq i64 %t2550, 0
  br i1 %t2551, label %fixfast669, label %fixslow670
fixfast669:
  %t2552 = icmp eq i64 %t2540, 360
  %t2553 = select i1 %t2552, i64 257, i64 1
  br label %fixmerge671
fixslow670:
  %t2554 = call i64 @rt_num_eq(i64 %t2540, i64 360)
  br label %fixmerge671
fixmerge671:
  %t2555 = phi i64 [ %t2553, %fixfast669 ], [ %t2554, %fixslow670 ]
  ret i64 %t2555
}

define fastcc i64 @"scheme.base:code_699"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2560 = icmp eq i64 %argc, 3
  br i1 %t2560, label %argok673, label %arityerr672
arityerr672:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok673:
  %t2561 = or i64 %a1, %a2
  %t2562 = and i64 %t2561, 7
  %t2563 = icmp eq i64 %t2562, 0
  br i1 %t2563, label %fixfast674, label %fixslow675
fixfast674:
  %t2564 = icmp slt i64 %a1, %a2
  %t2565 = select i1 %t2564, i64 257, i64 1
  br label %fixmerge676
fixslow675:
  %t2566 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge676
fixmerge676:
  %t2567 = phi i64 [ %t2565, %fixfast674 ], [ %t2566, %fixslow675 ]
  %t2568 = icmp ne i64 %t2567, 1
  br i1 %t2568, label %then677, label %else678
then677:
  %t2569 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2570 = load i64, ptr @"scheme.base:rd-digit?"
  %t2571 = and i64 %t2570, -8
  %t2572 = inttoptr i64 %t2571 to ptr
  %t2573 = load i64, ptr %t2572
  %t2574 = inttoptr i64 %t2573 to ptr
  %t2575 = call fastcc i64%t2574(i64 %t2570, i64 1, i64 %t2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge679
else678:
  br label %merge679
merge679:
  %t2576 = phi i64 [ %t2575, %then677 ], [ 1, %else678 ]
  %t2577 = icmp ne i64 %t2576, 1
  br i1 %t2577, label %then680, label %else681
then680:
  %t2578 = or i64 %a1, 8
  %t2579 = and i64 %t2578, 7
  %t2580 = icmp eq i64 %t2579, 0
  br i1 %t2580, label %fixfast682, label %fixslow683
fixfast682:
  %t2581 = add i64 %a1, 8
  br label %fixmerge684
fixslow683:
  %t2582 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge684
fixmerge684:
  %t2583 = phi i64 [ %t2581, %fixfast682 ], [ %t2582, %fixslow683 ]
  %t2584 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2585 = and i64 %t2584, -8
  %t2586 = inttoptr i64 %t2585 to ptr
  %t2587 = load i64, ptr %t2586
  %t2588 = inttoptr i64 %t2587 to ptr
  %t2589 = musttail call fastcc i64 %t2588(i64 %t2584, i64 3, i64 %a0, i64 %t2583, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2589
else681:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code_759"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2594 = icmp eq i64 %argc, 1
  br i1 %t2594, label %argok686, label %arityerr685
arityerr685:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok686:
  %t2595 = call i64 @rt_string_length(i64 %a0)
  %t2596 = or i64 0, %t2595
  %t2597 = and i64 %t2596, 7
  %t2598 = icmp eq i64 %t2597, 0
  br i1 %t2598, label %fixfast687, label %fixslow688
fixfast687:
  %t2599 = icmp slt i64 0, %t2595
  %t2600 = select i1 %t2599, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t2601 = call i64 @rt_lt(i64 0, i64 %t2595)
  br label %fixmerge689
fixmerge689:
  %t2602 = phi i64 [ %t2600, %fixfast687 ], [ %t2601, %fixslow688 ]
  %t2603 = icmp ne i64 %t2602, 1
  br i1 %t2603, label %then690, label %else691
then690:
  %t2604 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2605 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t2606 = and i64 %t2605, -8
  %t2607 = inttoptr i64 %t2606 to ptr
  %t2608 = load i64, ptr %t2607
  %t2609 = inttoptr i64 %t2608 to ptr
  %t2610 = call fastcc i64%t2609(i64 %t2605, i64 1, i64 %t2604, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2611 = icmp ne i64 %t2610, 1
  br i1 %t2611, label %then692, label %else693
then692:
  br label %merge694
else693:
  br label %merge694
merge694:
  %t2612 = phi i64 [ 8, %then692 ], [ 0, %else693 ]
  %t2613 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2614 = and i64 %t2613, -8
  %t2615 = inttoptr i64 %t2614 to ptr
  %t2616 = load i64, ptr %t2615
  %t2617 = inttoptr i64 %t2616 to ptr
  %t2618 = call fastcc i64%t2617(i64 %t2613, i64 3, i64 %a0, i64 %t2612, i64 %t2595, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2619 = or i64 %t2618, %t2595
  %t2620 = and i64 %t2619, 7
  %t2621 = icmp eq i64 %t2620, 0
  br i1 %t2621, label %fixfast695, label %fixslow696
fixfast695:
  %t2622 = icmp slt i64 %t2618, %t2595
  %t2623 = select i1 %t2622, i64 257, i64 1
  br label %fixmerge697
fixslow696:
  %t2624 = call i64 @rt_lt(i64 %t2618, i64 %t2595)
  br label %fixmerge697
fixmerge697:
  %t2625 = phi i64 [ %t2623, %fixfast695 ], [ %t2624, %fixslow696 ]
  %t2626 = icmp ne i64 %t2625, 1
  br i1 %t2626, label %then698, label %else699
then698:
  %t2627 = call i64 @rt_string_ref(i64 %a0, i64 %t2618)
  %t2628 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t2629 = and i64 %t2628, -8
  %t2630 = inttoptr i64 %t2629 to ptr
  %t2631 = load i64, ptr %t2630
  %t2632 = inttoptr i64 %t2631 to ptr
  %t2633 = call fastcc i64%t2632(i64 %t2628, i64 1, i64 %t2627, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge700
else699:
  br label %merge700
merge700:
  %t2634 = phi i64 [ %t2633, %then698 ], [ 1, %else699 ]
  %t2635 = icmp ne i64 %t2634, 1
  br i1 %t2635, label %then701, label %else702
then701:
  %t2636 = or i64 %t2618, 8
  %t2637 = and i64 %t2636, 7
  %t2638 = icmp eq i64 %t2637, 0
  br i1 %t2638, label %fixfast704, label %fixslow705
fixfast704:
  %t2639 = add i64 %t2618, 8
  br label %fixmerge706
fixslow705:
  %t2640 = call i64 @rt_add(i64 %t2618, i64 8)
  br label %fixmerge706
fixmerge706:
  %t2641 = phi i64 [ %t2639, %fixfast704 ], [ %t2640, %fixslow705 ]
  br label %merge703
else702:
  br label %merge703
merge703:
  %t2642 = phi i64 [ %t2641, %fixmerge706 ], [ %t2618, %else702 ]
  %t2643 = or i64 %t2618, %t2642
  %t2644 = and i64 %t2643, 7
  %t2645 = icmp eq i64 %t2644, 0
  br i1 %t2645, label %fixfast707, label %fixslow708
fixfast707:
  %t2646 = icmp slt i64 %t2618, %t2642
  %t2647 = select i1 %t2646, i64 257, i64 1
  br label %fixmerge709
fixslow708:
  %t2648 = call i64 @rt_lt(i64 %t2618, i64 %t2642)
  br label %fixmerge709
fixmerge709:
  %t2649 = phi i64 [ %t2647, %fixfast707 ], [ %t2648, %fixslow708 ]
  %t2650 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2651 = and i64 %t2650, -8
  %t2652 = inttoptr i64 %t2651 to ptr
  %t2653 = load i64, ptr %t2652
  %t2654 = inttoptr i64 %t2653 to ptr
  %t2655 = call fastcc i64%t2654(i64 %t2650, i64 3, i64 %a0, i64 %t2642, i64 %t2595, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2656 = or i64 %t2612, %t2618
  %t2657 = and i64 %t2656, 7
  %t2658 = icmp eq i64 %t2657, 0
  br i1 %t2658, label %fixfast710, label %fixslow711
fixfast710:
  %t2659 = icmp slt i64 %t2612, %t2618
  %t2660 = select i1 %t2659, i64 257, i64 1
  br label %fixmerge712
fixslow711:
  %t2661 = call i64 @rt_lt(i64 %t2612, i64 %t2618)
  br label %fixmerge712
fixmerge712:
  %t2662 = phi i64 [ %t2660, %fixfast710 ], [ %t2661, %fixslow711 ]
  %t2663 = icmp ne i64 %t2662, 1
  br i1 %t2663, label %then713, label %else714
then713:
  br label %merge715
else714:
  %t2664 = or i64 %t2642, %t2655
  %t2665 = and i64 %t2664, 7
  %t2666 = icmp eq i64 %t2665, 0
  br i1 %t2666, label %fixfast716, label %fixslow717
fixfast716:
  %t2667 = icmp slt i64 %t2642, %t2655
  %t2668 = select i1 %t2667, i64 257, i64 1
  br label %fixmerge718
fixslow717:
  %t2669 = call i64 @rt_lt(i64 %t2642, i64 %t2655)
  br label %fixmerge718
fixmerge718:
  %t2670 = phi i64 [ %t2668, %fixfast716 ], [ %t2669, %fixslow717 ]
  br label %merge715
merge715:
  %t2671 = phi i64 [ %t2662, %then713 ], [ %t2670, %fixmerge718 ]
  %t2672 = icmp ne i64 %t2671, 1
  br i1 %t2672, label %then719, label %else720
then719:
  %t2673 = or i64 %t2655, %t2595
  %t2674 = and i64 %t2673, 7
  %t2675 = icmp eq i64 %t2674, 0
  br i1 %t2675, label %fixfast721, label %fixslow722
fixfast721:
  %t2676 = icmp slt i64 %t2655, %t2595
  %t2677 = select i1 %t2676, i64 257, i64 1
  br label %fixmerge723
fixslow722:
  %t2678 = call i64 @rt_lt(i64 %t2655, i64 %t2595)
  br label %fixmerge723
fixmerge723:
  %t2679 = phi i64 [ %t2677, %fixfast721 ], [ %t2678, %fixslow722 ]
  %t2680 = icmp ne i64 %t2679, 1
  br i1 %t2680, label %then724, label %else725
then724:
  %t2681 = call i64 @rt_string_ref(i64 %a0, i64 %t2655)
  %t2682 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t2683 = and i64 %t2682, -8
  %t2684 = inttoptr i64 %t2683 to ptr
  %t2685 = load i64, ptr %t2684
  %t2686 = inttoptr i64 %t2685 to ptr
  %t2687 = call fastcc i64%t2686(i64 %t2682, i64 1, i64 %t2681, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge726
else725:
  br label %merge726
merge726:
  %t2688 = phi i64 [ %t2687, %then724 ], [ 1, %else725 ]
  %t2689 = icmp ne i64 %t2688, 1
  br i1 %t2689, label %then727, label %else728
then727:
  %t2690 = or i64 %t2655, 8
  %t2691 = and i64 %t2690, 7
  %t2692 = icmp eq i64 %t2691, 0
  br i1 %t2692, label %fixfast730, label %fixslow731
fixfast730:
  %t2693 = add i64 %t2655, 8
  br label %fixmerge732
fixslow731:
  %t2694 = call i64 @rt_add(i64 %t2655, i64 8)
  br label %fixmerge732
fixmerge732:
  %t2695 = phi i64 [ %t2693, %fixfast730 ], [ %t2694, %fixslow731 ]
  %t2696 = or i64 %t2695, %t2595
  %t2697 = and i64 %t2696, 7
  %t2698 = icmp eq i64 %t2697, 0
  br i1 %t2698, label %fixfast733, label %fixslow734
fixfast733:
  %t2699 = icmp slt i64 %t2695, %t2595
  %t2700 = select i1 %t2699, i64 257, i64 1
  br label %fixmerge735
fixslow734:
  %t2701 = call i64 @rt_lt(i64 %t2695, i64 %t2595)
  br label %fixmerge735
fixmerge735:
  %t2702 = phi i64 [ %t2700, %fixfast733 ], [ %t2701, %fixslow734 ]
  %t2703 = icmp ne i64 %t2702, 1
  br i1 %t2703, label %then736, label %else737
then736:
  %t2704 = or i64 %t2655, 8
  %t2705 = and i64 %t2704, 7
  %t2706 = icmp eq i64 %t2705, 0
  br i1 %t2706, label %fixfast739, label %fixslow740
fixfast739:
  %t2707 = add i64 %t2655, 8
  br label %fixmerge741
fixslow740:
  %t2708 = call i64 @rt_add(i64 %t2655, i64 8)
  br label %fixmerge741
fixmerge741:
  %t2709 = phi i64 [ %t2707, %fixfast739 ], [ %t2708, %fixslow740 ]
  %t2710 = call i64 @rt_string_ref(i64 %a0, i64 %t2709)
  %t2711 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t2712 = and i64 %t2711, -8
  %t2713 = inttoptr i64 %t2712 to ptr
  %t2714 = load i64, ptr %t2713
  %t2715 = inttoptr i64 %t2714 to ptr
  %t2716 = call fastcc i64%t2715(i64 %t2711, i64 1, i64 %t2710, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge738
else737:
  br label %merge738
merge738:
  %t2717 = phi i64 [ %t2716, %fixmerge741 ], [ 1, %else737 ]
  %t2718 = icmp ne i64 %t2717, 1
  br i1 %t2718, label %then742, label %else743
then742:
  %t2719 = or i64 %t2655, 16
  %t2720 = and i64 %t2719, 7
  %t2721 = icmp eq i64 %t2720, 0
  br i1 %t2721, label %fixfast745, label %fixslow746
fixfast745:
  %t2722 = add i64 %t2655, 16
  br label %fixmerge747
fixslow746:
  %t2723 = call i64 @rt_add(i64 %t2655, i64 16)
  br label %fixmerge747
fixmerge747:
  %t2724 = phi i64 [ %t2722, %fixfast745 ], [ %t2723, %fixslow746 ]
  br label %merge744
else743:
  %t2725 = or i64 %t2655, 8
  %t2726 = and i64 %t2725, 7
  %t2727 = icmp eq i64 %t2726, 0
  br i1 %t2727, label %fixfast748, label %fixslow749
fixfast748:
  %t2728 = add i64 %t2655, 8
  br label %fixmerge750
fixslow749:
  %t2729 = call i64 @rt_add(i64 %t2655, i64 8)
  br label %fixmerge750
fixmerge750:
  %t2730 = phi i64 [ %t2728, %fixfast748 ], [ %t2729, %fixslow749 ]
  br label %merge744
merge744:
  %t2731 = phi i64 [ %t2724, %fixmerge747 ], [ %t2730, %fixmerge750 ]
  %t2732 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2733 = and i64 %t2732, -8
  %t2734 = inttoptr i64 %t2733 to ptr
  %t2735 = load i64, ptr %t2734
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = call fastcc i64%t2736(i64 %t2732, i64 3, i64 %a0, i64 %t2731, i64 %t2595, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2738 = or i64 %t2731, %t2737
  %t2739 = and i64 %t2738, 7
  %t2740 = icmp eq i64 %t2739, 0
  br i1 %t2740, label %fixfast751, label %fixslow752
fixfast751:
  %t2741 = icmp slt i64 %t2731, %t2737
  %t2742 = select i1 %t2741, i64 257, i64 1
  br label %fixmerge753
fixslow752:
  %t2743 = call i64 @rt_lt(i64 %t2731, i64 %t2737)
  br label %fixmerge753
fixmerge753:
  %t2744 = phi i64 [ %t2742, %fixfast751 ], [ %t2743, %fixslow752 ]
  %t2745 = icmp ne i64 %t2744, 1
  br i1 %t2745, label %then754, label %else755
then754:
  br label %merge756
else755:
  br label %merge756
merge756:
  %t2746 = phi i64 [ %t2737, %then754 ], [ -8, %else755 ]
  br label %merge729
else728:
  br label %merge729
merge729:
  %t2747 = phi i64 [ %t2746, %merge756 ], [ %t2655, %else728 ]
  %t2748 = or i64 -8, %t2747
  %t2749 = and i64 %t2748, 7
  %t2750 = icmp eq i64 %t2749, 0
  br i1 %t2750, label %fixfast757, label %fixslow758
fixfast757:
  %t2751 = icmp slt i64 -8, %t2747
  %t2752 = select i1 %t2751, i64 257, i64 1
  br label %fixmerge759
fixslow758:
  %t2753 = call i64 @rt_lt(i64 -8, i64 %t2747)
  br label %fixmerge759
fixmerge759:
  %t2754 = phi i64 [ %t2752, %fixfast757 ], [ %t2753, %fixslow758 ]
  %t2755 = icmp ne i64 %t2754, 1
  br i1 %t2755, label %then760, label %else761
then760:
  %t2756 = or i64 %t2747, %t2595
  %t2757 = and i64 %t2756, 7
  %t2758 = icmp eq i64 %t2757, 0
  br i1 %t2758, label %fixfast762, label %fixslow763
fixfast762:
  %t2759 = icmp eq i64 %t2747, %t2595
  %t2760 = select i1 %t2759, i64 257, i64 1
  br label %fixmerge764
fixslow763:
  %t2761 = call i64 @rt_num_eq(i64 %t2747, i64 %t2595)
  br label %fixmerge764
fixmerge764:
  %t2762 = phi i64 [ %t2760, %fixfast762 ], [ %t2761, %fixslow763 ]
  %t2763 = icmp ne i64 %t2762, 1
  br i1 %t2763, label %then765, label %else766
then765:
  %t2764 = icmp ne i64 %t2649, 1
  br i1 %t2764, label %then767, label %else768
then767:
  ret i64 %t2649
else768:
  %t2765 = or i64 %t2655, %t2747
  %t2766 = and i64 %t2765, 7
  %t2767 = icmp eq i64 %t2766, 0
  br i1 %t2767, label %fixfast769, label %fixslow770
fixfast769:
  %t2768 = icmp slt i64 %t2655, %t2747
  %t2769 = select i1 %t2768, i64 257, i64 1
  br label %fixmerge771
fixslow770:
  %t2770 = call i64 @rt_lt(i64 %t2655, i64 %t2747)
  br label %fixmerge771
fixmerge771:
  %t2771 = phi i64 [ %t2769, %fixfast769 ], [ %t2770, %fixslow770 ]
  ret i64 %t2771
else766:
  ret i64 1
else761:
  ret i64 1
else720:
  ret i64 1
else691:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_766"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2776 = icmp eq i64 %argc, 3
  br i1 %t2776, label %argok773, label %arityerr772
arityerr772:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok773:
  %t2777 = load i64, ptr @"scheme.base:rd-token-end"
  %t2778 = and i64 %t2777, -8
  %t2779 = inttoptr i64 %t2778 to ptr
  %t2780 = load i64, ptr %t2779
  %t2781 = inttoptr i64 %t2780 to ptr
  %t2782 = call fastcc i64%t2781(i64 %t2777, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2783 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t2782)
  %t2784 = load i64, ptr @"scheme.base:rd-numeric?"
  %t2785 = and i64 %t2784, -8
  %t2786 = inttoptr i64 %t2785 to ptr
  %t2787 = load i64, ptr %t2786
  %t2788 = inttoptr i64 %t2787 to ptr
  %t2789 = call fastcc i64%t2788(i64 %t2784, i64 1, i64 %t2783, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2790 = icmp ne i64 %t2789, 1
  br i1 %t2790, label %then774, label %else775
then774:
  %t2791 = load i64, ptr @"scheme.base:rd-parse-int"
  %t2792 = and i64 %t2791, -8
  %t2793 = inttoptr i64 %t2792 to ptr
  %t2794 = load i64, ptr %t2793
  %t2795 = inttoptr i64 %t2794 to ptr
  %t2796 = call fastcc i64%t2795(i64 %t2791, i64 1, i64 %t2783, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge776
else775:
  %t2797 = load i64, ptr @"scheme.base:rd-flonum?"
  %t2798 = and i64 %t2797, -8
  %t2799 = inttoptr i64 %t2798 to ptr
  %t2800 = load i64, ptr %t2799
  %t2801 = inttoptr i64 %t2800 to ptr
  %t2802 = call fastcc i64%t2801(i64 %t2797, i64 1, i64 %t2783, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2803 = icmp ne i64 %t2802, 1
  br i1 %t2803, label %then777, label %else778
then777:
  %t2804 = call i64 @rt_string_to_flonum(i64 %t2783)
  br label %merge779
else778:
  %t2805 = call i64 @rt_string_to_symbol(i64 %t2783)
  br label %merge779
merge779:
  %t2806 = phi i64 [ %t2804, %then777 ], [ %t2805, %else778 ]
  br label %merge776
merge776:
  %t2807 = phi i64 [ %t2796, %then774 ], [ %t2806, %merge779 ]
  %t2808 = call i64 @rt_cons(i64 %t2807, i64 %t2782)
  ret i64 %t2808
}

define fastcc i64 @"scheme.base:code_794"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2813 = icmp eq i64 %argc, 1
  br i1 %t2813, label %argok781, label %arityerr780
arityerr780:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok781:
  %t2814 = call i64 @rt_char_to_integer(i64 %a0)
  %t2815 = or i64 376, %t2814
  %t2816 = and i64 %t2815, 7
  %t2817 = icmp eq i64 %t2816, 0
  br i1 %t2817, label %fixfast782, label %fixslow783
fixfast782:
  %t2818 = icmp slt i64 376, %t2814
  %t2819 = select i1 %t2818, i64 257, i64 1
  br label %fixmerge784
fixslow783:
  %t2820 = call i64 @rt_lt(i64 376, i64 %t2814)
  br label %fixmerge784
fixmerge784:
  %t2821 = phi i64 [ %t2819, %fixfast782 ], [ %t2820, %fixslow783 ]
  %t2822 = icmp ne i64 %t2821, 1
  br i1 %t2822, label %then785, label %else786
then785:
  %t2823 = or i64 %t2814, 464
  %t2824 = and i64 %t2823, 7
  %t2825 = icmp eq i64 %t2824, 0
  br i1 %t2825, label %fixfast788, label %fixslow789
fixfast788:
  %t2826 = icmp slt i64 %t2814, 464
  %t2827 = select i1 %t2826, i64 257, i64 1
  br label %fixmerge790
fixslow789:
  %t2828 = call i64 @rt_lt(i64 %t2814, i64 464)
  br label %fixmerge790
fixmerge790:
  %t2829 = phi i64 [ %t2827, %fixfast788 ], [ %t2828, %fixslow789 ]
  br label %merge787
else786:
  br label %merge787
merge787:
  %t2830 = phi i64 [ %t2829, %fixmerge790 ], [ 1, %else786 ]
  %t2831 = icmp ne i64 %t2830, 1
  br i1 %t2831, label %then791, label %else792
then791:
  %t2832 = or i64 %t2814, 384
  %t2833 = and i64 %t2832, 7
  %t2834 = icmp eq i64 %t2833, 0
  br i1 %t2834, label %fixfast793, label %fixslow794
fixfast793:
  %t2835 = sub i64 %t2814, 384
  br label %fixmerge795
fixslow794:
  %t2836 = call i64 @rt_sub(i64 %t2814, i64 384)
  br label %fixmerge795
fixmerge795:
  %t2837 = phi i64 [ %t2835, %fixfast793 ], [ %t2836, %fixslow794 ]
  ret i64 %t2837
else792:
  %t2838 = or i64 768, %t2814
  %t2839 = and i64 %t2838, 7
  %t2840 = icmp eq i64 %t2839, 0
  br i1 %t2840, label %fixfast796, label %fixslow797
fixfast796:
  %t2841 = icmp slt i64 768, %t2814
  %t2842 = select i1 %t2841, i64 257, i64 1
  br label %fixmerge798
fixslow797:
  %t2843 = call i64 @rt_lt(i64 768, i64 %t2814)
  br label %fixmerge798
fixmerge798:
  %t2844 = phi i64 [ %t2842, %fixfast796 ], [ %t2843, %fixslow797 ]
  %t2845 = icmp ne i64 %t2844, 1
  br i1 %t2845, label %then799, label %else800
then799:
  %t2846 = or i64 %t2814, 824
  %t2847 = and i64 %t2846, 7
  %t2848 = icmp eq i64 %t2847, 0
  br i1 %t2848, label %fixfast802, label %fixslow803
fixfast802:
  %t2849 = icmp slt i64 %t2814, 824
  %t2850 = select i1 %t2849, i64 257, i64 1
  br label %fixmerge804
fixslow803:
  %t2851 = call i64 @rt_lt(i64 %t2814, i64 824)
  br label %fixmerge804
fixmerge804:
  %t2852 = phi i64 [ %t2850, %fixfast802 ], [ %t2851, %fixslow803 ]
  br label %merge801
else800:
  br label %merge801
merge801:
  %t2853 = phi i64 [ %t2852, %fixmerge804 ], [ 1, %else800 ]
  %t2854 = icmp ne i64 %t2853, 1
  br i1 %t2854, label %then805, label %else806
then805:
  %t2855 = or i64 %t2814, 696
  %t2856 = and i64 %t2855, 7
  %t2857 = icmp eq i64 %t2856, 0
  br i1 %t2857, label %fixfast807, label %fixslow808
fixfast807:
  %t2858 = sub i64 %t2814, 696
  br label %fixmerge809
fixslow808:
  %t2859 = call i64 @rt_sub(i64 %t2814, i64 696)
  br label %fixmerge809
fixmerge809:
  %t2860 = phi i64 [ %t2858, %fixfast807 ], [ %t2859, %fixslow808 ]
  ret i64 %t2860
else806:
  %t2861 = or i64 512, %t2814
  %t2862 = and i64 %t2861, 7
  %t2863 = icmp eq i64 %t2862, 0
  br i1 %t2863, label %fixfast810, label %fixslow811
fixfast810:
  %t2864 = icmp slt i64 512, %t2814
  %t2865 = select i1 %t2864, i64 257, i64 1
  br label %fixmerge812
fixslow811:
  %t2866 = call i64 @rt_lt(i64 512, i64 %t2814)
  br label %fixmerge812
fixmerge812:
  %t2867 = phi i64 [ %t2865, %fixfast810 ], [ %t2866, %fixslow811 ]
  %t2868 = icmp ne i64 %t2867, 1
  br i1 %t2868, label %then813, label %else814
then813:
  %t2869 = or i64 %t2814, 568
  %t2870 = and i64 %t2869, 7
  %t2871 = icmp eq i64 %t2870, 0
  br i1 %t2871, label %fixfast816, label %fixslow817
fixfast816:
  %t2872 = icmp slt i64 %t2814, 568
  %t2873 = select i1 %t2872, i64 257, i64 1
  br label %fixmerge818
fixslow817:
  %t2874 = call i64 @rt_lt(i64 %t2814, i64 568)
  br label %fixmerge818
fixmerge818:
  %t2875 = phi i64 [ %t2873, %fixfast816 ], [ %t2874, %fixslow817 ]
  br label %merge815
else814:
  br label %merge815
merge815:
  %t2876 = phi i64 [ %t2875, %fixmerge818 ], [ 1, %else814 ]
  %t2877 = icmp ne i64 %t2876, 1
  br i1 %t2877, label %then819, label %else820
then819:
  %t2878 = or i64 %t2814, 440
  %t2879 = and i64 %t2878, 7
  %t2880 = icmp eq i64 %t2879, 0
  br i1 %t2880, label %fixfast821, label %fixslow822
fixfast821:
  %t2881 = sub i64 %t2814, 440
  br label %fixmerge823
fixslow822:
  %t2882 = call i64 @rt_sub(i64 %t2814, i64 440)
  br label %fixmerge823
fixmerge823:
  %t2883 = phi i64 [ %t2881, %fixfast821 ], [ %t2882, %fixslow822 ]
  ret i64 %t2883
else820:
  ret i64 0
}

define fastcc i64 @"scheme.base:code_808"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2888 = icmp eq i64 %argc, 4
  br i1 %t2888, label %argok825, label %arityerr824
arityerr824:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok825:
  %t2889 = or i64 %a2, %a1
  %t2890 = and i64 %t2889, 7
  %t2891 = icmp eq i64 %t2890, 0
  br i1 %t2891, label %fixfast826, label %fixslow827
fixfast826:
  %t2892 = icmp slt i64 %a2, %a1
  %t2893 = select i1 %t2892, i64 257, i64 1
  br label %fixmerge828
fixslow827:
  %t2894 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge828
fixmerge828:
  %t2895 = phi i64 [ %t2893, %fixfast826 ], [ %t2894, %fixslow827 ]
  %t2896 = icmp ne i64 %t2895, 1
  br i1 %t2896, label %then829, label %else830
then829:
  %t2897 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2898 = call i64 @rt_char_to_integer(i64 %t2897)
  %t2899 = or i64 %t2898, 472
  %t2900 = and i64 %t2899, 7
  %t2901 = icmp eq i64 %t2900, 0
  br i1 %t2901, label %fixfast831, label %fixslow832
fixfast831:
  %t2902 = icmp eq i64 %t2898, 472
  %t2903 = select i1 %t2902, i64 257, i64 1
  br label %fixmerge833
fixslow832:
  %t2904 = call i64 @rt_num_eq(i64 %t2898, i64 472)
  br label %fixmerge833
fixmerge833:
  %t2905 = phi i64 [ %t2903, %fixfast831 ], [ %t2904, %fixslow832 ]
  %t2906 = icmp ne i64 %t2905, 1
  br i1 %t2906, label %then834, label %else835
then834:
  %t2907 = or i64 %a2, 8
  %t2908 = and i64 %t2907, 7
  %t2909 = icmp eq i64 %t2908, 0
  br i1 %t2909, label %fixfast836, label %fixslow837
fixfast836:
  %t2910 = add i64 %a2, 8
  br label %fixmerge838
fixslow837:
  %t2911 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge838
fixmerge838:
  %t2912 = phi i64 [ %t2910, %fixfast836 ], [ %t2911, %fixslow837 ]
  %t2913 = call i64 @rt_cons(i64 %a3, i64 %t2912)
  ret i64 %t2913
else835:
  %t2914 = or i64 %a2, 8
  %t2915 = and i64 %t2914, 7
  %t2916 = icmp eq i64 %t2915, 0
  br i1 %t2916, label %fixfast839, label %fixslow840
fixfast839:
  %t2917 = add i64 %a2, 8
  br label %fixmerge841
fixslow840:
  %t2918 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge841
fixmerge841:
  %t2919 = phi i64 [ %t2917, %fixfast839 ], [ %t2918, %fixslow840 ]
  %t2920 = or i64 %a3, 128
  %t2921 = and i64 %t2920, 7
  %t2922 = icmp eq i64 %t2921, 0
  br i1 %t2922, label %fixfast842, label %fixslow843
fixfast842:
  %t2923 = ashr i64 %a3, 3
  %t2924 = mul i64 %t2923, 128
  br label %fixmerge844
fixslow843:
  %t2925 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge844
fixmerge844:
  %t2926 = phi i64 [ %t2924, %fixfast842 ], [ %t2925, %fixslow843 ]
  %t2927 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2928 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t2929 = and i64 %t2928, -8
  %t2930 = inttoptr i64 %t2929 to ptr
  %t2931 = load i64, ptr %t2930
  %t2932 = inttoptr i64 %t2931 to ptr
  %t2933 = call fastcc i64%t2932(i64 %t2928, i64 1, i64 %t2927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2934 = or i64 %t2926, %t2933
  %t2935 = and i64 %t2934, 7
  %t2936 = icmp eq i64 %t2935, 0
  br i1 %t2936, label %fixfast845, label %fixslow846
fixfast845:
  %t2937 = add i64 %t2926, %t2933
  br label %fixmerge847
fixslow846:
  %t2938 = call i64 @rt_add(i64 %t2926, i64 %t2933)
  br label %fixmerge847
fixmerge847:
  %t2939 = phi i64 [ %t2937, %fixfast845 ], [ %t2938, %fixslow846 ]
  %t2940 = load i64, ptr @"scheme.base:rd-hex"
  %t2941 = and i64 %t2940, -8
  %t2942 = inttoptr i64 %t2941 to ptr
  %t2943 = load i64, ptr %t2942
  %t2944 = inttoptr i64 %t2943 to ptr
  %t2945 = musttail call fastcc i64 %t2944(i64 %t2940, i64 4, i64 %a0, i64 %a1, i64 %t2919, i64 %t2939, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2945
else830:
  %t2946 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t2946
}

define fastcc i64 @"scheme.base:code_824"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2951 = icmp eq i64 %argc, 1
  br i1 %t2951, label %argok849, label %arityerr848
arityerr848:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok849:
  %t2952 = call i64 @rt_char_to_integer(i64 %a0)
  %t2953 = or i64 %t2952, 880
  %t2954 = and i64 %t2953, 7
  %t2955 = icmp eq i64 %t2954, 0
  br i1 %t2955, label %fixfast850, label %fixslow851
fixfast850:
  %t2956 = icmp eq i64 %t2952, 880
  %t2957 = select i1 %t2956, i64 257, i64 1
  br label %fixmerge852
fixslow851:
  %t2958 = call i64 @rt_num_eq(i64 %t2952, i64 880)
  br label %fixmerge852
fixmerge852:
  %t2959 = phi i64 [ %t2957, %fixfast850 ], [ %t2958, %fixslow851 ]
  %t2960 = icmp ne i64 %t2959, 1
  br i1 %t2960, label %then853, label %else854
then853:
  %t2961 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t2961
else854:
  %t2962 = or i64 %t2952, 928
  %t2963 = and i64 %t2962, 7
  %t2964 = icmp eq i64 %t2963, 0
  br i1 %t2964, label %fixfast855, label %fixslow856
fixfast855:
  %t2965 = icmp eq i64 %t2952, 928
  %t2966 = select i1 %t2965, i64 257, i64 1
  br label %fixmerge857
fixslow856:
  %t2967 = call i64 @rt_num_eq(i64 %t2952, i64 928)
  br label %fixmerge857
fixmerge857:
  %t2968 = phi i64 [ %t2966, %fixfast855 ], [ %t2967, %fixslow856 ]
  %t2969 = icmp ne i64 %t2968, 1
  br i1 %t2969, label %then858, label %else859
then858:
  %t2970 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t2970
else859:
  %t2971 = or i64 %t2952, 912
  %t2972 = and i64 %t2971, 7
  %t2973 = icmp eq i64 %t2972, 0
  br i1 %t2973, label %fixfast860, label %fixslow861
fixfast860:
  %t2974 = icmp eq i64 %t2952, 912
  %t2975 = select i1 %t2974, i64 257, i64 1
  br label %fixmerge862
fixslow861:
  %t2976 = call i64 @rt_num_eq(i64 %t2952, i64 912)
  br label %fixmerge862
fixmerge862:
  %t2977 = phi i64 [ %t2975, %fixfast860 ], [ %t2976, %fixslow861 ]
  %t2978 = icmp ne i64 %t2977, 1
  br i1 %t2978, label %then863, label %else864
then863:
  %t2979 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t2979
else864:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_854"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2984 = icmp eq i64 %argc, 2
  br i1 %t2984, label %argok866, label %arityerr865
arityerr865:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok866:
  %t2985 = and i64 %self, -8
  %t2986 = inttoptr i64 %t2985 to ptr
  %t2987 = getelementptr i64, ptr %t2986, i64 1
  %t2988 = load i64, ptr %t2987
  %t2989 = or i64 %a0, %t2988
  %t2990 = and i64 %t2989, 7
  %t2991 = icmp eq i64 %t2990, 0
  br i1 %t2991, label %fixfast867, label %fixslow868
fixfast867:
  %t2992 = icmp slt i64 %a0, %t2988
  %t2993 = select i1 %t2992, i64 257, i64 1
  br label %fixmerge869
fixslow868:
  %t2994 = call i64 @rt_lt(i64 %a0, i64 %t2988)
  br label %fixmerge869
fixmerge869:
  %t2995 = phi i64 [ %t2993, %fixfast867 ], [ %t2994, %fixslow868 ]
  %t2996 = icmp ne i64 %t2995, 1
  br i1 %t2996, label %then870, label %else871
then870:
  %t2997 = and i64 %self, -8
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = getelementptr i64, ptr %t2998, i64 2
  %t3000 = load i64, ptr %t2999
  %t3001 = call i64 @rt_string_ref(i64 %t3000, i64 %a0)
  %t3002 = call i64 @rt_char_to_integer(i64 %t3001)
  %t3003 = or i64 %t3002, 272
  %t3004 = and i64 %t3003, 7
  %t3005 = icmp eq i64 %t3004, 0
  br i1 %t3005, label %fixfast872, label %fixslow873
fixfast872:
  %t3006 = icmp eq i64 %t3002, 272
  %t3007 = select i1 %t3006, i64 257, i64 1
  br label %fixmerge874
fixslow873:
  %t3008 = call i64 @rt_num_eq(i64 %t3002, i64 272)
  br label %fixmerge874
fixmerge874:
  %t3009 = phi i64 [ %t3007, %fixfast872 ], [ %t3008, %fixslow873 ]
  %t3010 = icmp ne i64 %t3009, 1
  br i1 %t3010, label %then875, label %else876
then875:
  %t3011 = load i64, ptr @"scheme.base:reverse"
  %t3012 = and i64 %t3011, -8
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = load i64, ptr %t3013
  %t3015 = inttoptr i64 %t3014 to ptr
  %t3016 = call fastcc i64%t3015(i64 %t3011, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3017 = call i64 @rt_list_to_string(i64 %t3016)
  %t3018 = or i64 %a0, 8
  %t3019 = and i64 %t3018, 7
  %t3020 = icmp eq i64 %t3019, 0
  br i1 %t3020, label %fixfast877, label %fixslow878
fixfast877:
  %t3021 = add i64 %a0, 8
  br label %fixmerge879
fixslow878:
  %t3022 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge879
fixmerge879:
  %t3023 = phi i64 [ %t3021, %fixfast877 ], [ %t3022, %fixslow878 ]
  %t3024 = call i64 @rt_cons(i64 %t3017, i64 %t3023)
  ret i64 %t3024
else876:
  %t3025 = or i64 %t3002, 736
  %t3026 = and i64 %t3025, 7
  %t3027 = icmp eq i64 %t3026, 0
  br i1 %t3027, label %fixfast880, label %fixslow881
fixfast880:
  %t3028 = icmp eq i64 %t3002, 736
  %t3029 = select i1 %t3028, i64 257, i64 1
  br label %fixmerge882
fixslow881:
  %t3030 = call i64 @rt_num_eq(i64 %t3002, i64 736)
  br label %fixmerge882
fixmerge882:
  %t3031 = phi i64 [ %t3029, %fixfast880 ], [ %t3030, %fixslow881 ]
  %t3032 = icmp ne i64 %t3031, 1
  br i1 %t3032, label %then883, label %else884
then883:
  %t3033 = and i64 %self, -8
  %t3034 = inttoptr i64 %t3033 to ptr
  %t3035 = getelementptr i64, ptr %t3034, i64 2
  %t3036 = load i64, ptr %t3035
  %t3037 = or i64 %a0, 8
  %t3038 = and i64 %t3037, 7
  %t3039 = icmp eq i64 %t3038, 0
  br i1 %t3039, label %fixfast885, label %fixslow886
fixfast885:
  %t3040 = add i64 %a0, 8
  br label %fixmerge887
fixslow886:
  %t3041 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge887
fixmerge887:
  %t3042 = phi i64 [ %t3040, %fixfast885 ], [ %t3041, %fixslow886 ]
  %t3043 = call i64 @rt_string_ref(i64 %t3036, i64 %t3042)
  %t3044 = call i64 @rt_char_to_integer(i64 %t3043)
  %t3045 = or i64 %t3044, 960
  %t3046 = and i64 %t3045, 7
  %t3047 = icmp eq i64 %t3046, 0
  br i1 %t3047, label %fixfast888, label %fixslow889
fixfast888:
  %t3048 = icmp eq i64 %t3044, 960
  %t3049 = select i1 %t3048, i64 257, i64 1
  br label %fixmerge890
fixslow889:
  %t3050 = call i64 @rt_num_eq(i64 %t3044, i64 960)
  br label %fixmerge890
fixmerge890:
  %t3051 = phi i64 [ %t3049, %fixfast888 ], [ %t3050, %fixslow889 ]
  %t3052 = icmp ne i64 %t3051, 1
  br i1 %t3052, label %then891, label %else892
then891:
  %t3053 = and i64 %self, -8
  %t3054 = inttoptr i64 %t3053 to ptr
  %t3055 = getelementptr i64, ptr %t3054, i64 2
  %t3056 = load i64, ptr %t3055
  %t3057 = and i64 %self, -8
  %t3058 = inttoptr i64 %t3057 to ptr
  %t3059 = getelementptr i64, ptr %t3058, i64 1
  %t3060 = load i64, ptr %t3059
  %t3061 = or i64 %a0, 16
  %t3062 = and i64 %t3061, 7
  %t3063 = icmp eq i64 %t3062, 0
  br i1 %t3063, label %fixfast893, label %fixslow894
fixfast893:
  %t3064 = add i64 %a0, 16
  br label %fixmerge895
fixslow894:
  %t3065 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge895
fixmerge895:
  %t3066 = phi i64 [ %t3064, %fixfast893 ], [ %t3065, %fixslow894 ]
  %t3067 = load i64, ptr @"scheme.base:rd-hex"
  %t3068 = and i64 %t3067, -8
  %t3069 = inttoptr i64 %t3068 to ptr
  %t3070 = load i64, ptr %t3069
  %t3071 = inttoptr i64 %t3070 to ptr
  %t3072 = call fastcc i64%t3071(i64 %t3067, i64 4, i64 %t3056, i64 %t3060, i64 %t3066, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3073 = call i64 @rt_cdr(i64 %t3072)
  %t3074 = call i64 @rt_car(i64 %t3072)
  %t3075 = call i64 @rt_integer_to_char(i64 %t3074)
  %t3076 = call i64 @rt_cons(i64 %t3075, i64 %a1)
  %t3077 = musttail call fastcc i64 @"scheme.base:code_854"(i64 %self, i64 2, i64 %t3073, i64 %t3076, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3077
else892:
  %t3078 = or i64 %a0, 16
  %t3079 = and i64 %t3078, 7
  %t3080 = icmp eq i64 %t3079, 0
  br i1 %t3080, label %fixfast896, label %fixslow897
fixfast896:
  %t3081 = add i64 %a0, 16
  br label %fixmerge898
fixslow897:
  %t3082 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge898
fixmerge898:
  %t3083 = phi i64 [ %t3081, %fixfast896 ], [ %t3082, %fixslow897 ]
  %t3084 = load i64, ptr @"scheme.base:rd-str-esc"
  %t3085 = and i64 %t3084, -8
  %t3086 = inttoptr i64 %t3085 to ptr
  %t3087 = load i64, ptr %t3086
  %t3088 = inttoptr i64 %t3087 to ptr
  %t3089 = call fastcc i64%t3088(i64 %t3084, i64 1, i64 %t3043, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3090 = call i64 @rt_cons(i64 %t3089, i64 %a1)
  %t3091 = musttail call fastcc i64 @"scheme.base:code_854"(i64 %self, i64 2, i64 %t3083, i64 %t3090, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3091
else884:
  %t3092 = or i64 %a0, 8
  %t3093 = and i64 %t3092, 7
  %t3094 = icmp eq i64 %t3093, 0
  br i1 %t3094, label %fixfast899, label %fixslow900
fixfast899:
  %t3095 = add i64 %a0, 8
  br label %fixmerge901
fixslow900:
  %t3096 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge901
fixmerge901:
  %t3097 = phi i64 [ %t3095, %fixfast899 ], [ %t3096, %fixslow900 ]
  %t3098 = call i64 @rt_cons(i64 %t3001, i64 %a1)
  %t3099 = musttail call fastcc i64 @"scheme.base:code_854"(i64 %self, i64 2, i64 %t3097, i64 %t3098, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3099
else871:
  %t3100 = load i64, ptr @"scheme.base:reverse"
  %t3101 = and i64 %t3100, -8
  %t3102 = inttoptr i64 %t3101 to ptr
  %t3103 = load i64, ptr %t3102
  %t3104 = inttoptr i64 %t3103 to ptr
  %t3105 = call fastcc i64%t3104(i64 %t3100, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3106 = call i64 @rt_list_to_string(i64 %t3105)
  %t3107 = call i64 @rt_cons(i64 %t3106, i64 %a0)
  ret i64 %t3107
}

define fastcc i64 @"scheme.base:code_852"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3108 = icmp eq i64 %argc, 3
  br i1 %t3108, label %argok903, label %arityerr902
arityerr902:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok903:
  %t3109 = call ptr @rt_alloc_words(i64 4)
  %t3110 = ptrtoint ptr %t3109 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_854" to i64), ptr %t3109
  %t3111 = or i64 %t3110, 4
  %t3112 = getelementptr i64, ptr %t3109, i64 1
  store i64 %a1, ptr %t3112
  %t3113 = getelementptr i64, ptr %t3109, i64 2
  store i64 %a0, ptr %t3113
  %t3114 = getelementptr i64, ptr %t3109, i64 3
  store i64 %t3111, ptr %t3114
  %t3115 = and i64 %t3111, -8
  %t3116 = inttoptr i64 %t3115 to ptr
  %t3117 = load i64, ptr %t3116
  %t3118 = inttoptr i64 %t3117 to ptr
  %t3119 = musttail call fastcc i64 %t3118(i64 %t3111, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3119
}

define fastcc i64 @"scheme.base:code_895"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3124 = icmp eq i64 %argc, 3
  br i1 %t3124, label %argok905, label %arityerr904
arityerr904:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok905:
  %t3125 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3126 = call i64 @rt_char_to_integer(i64 %t3125)
  %t3127 = or i64 %t3126, 928
  %t3128 = and i64 %t3127, 7
  %t3129 = icmp eq i64 %t3128, 0
  br i1 %t3129, label %fixfast906, label %fixslow907
fixfast906:
  %t3130 = icmp eq i64 %t3126, 928
  %t3131 = select i1 %t3130, i64 257, i64 1
  br label %fixmerge908
fixslow907:
  %t3132 = call i64 @rt_num_eq(i64 %t3126, i64 928)
  br label %fixmerge908
fixmerge908:
  %t3133 = phi i64 [ %t3131, %fixfast906 ], [ %t3132, %fixslow907 ]
  %t3134 = icmp ne i64 %t3133, 1
  br i1 %t3134, label %then909, label %else910
then909:
  %t3135 = or i64 %a2, 8
  %t3136 = and i64 %t3135, 7
  %t3137 = icmp eq i64 %t3136, 0
  br i1 %t3137, label %fixfast911, label %fixslow912
fixfast911:
  %t3138 = add i64 %a2, 8
  br label %fixmerge913
fixslow912:
  %t3139 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge913
fixmerge913:
  %t3140 = phi i64 [ %t3138, %fixfast911 ], [ %t3139, %fixslow912 ]
  %t3141 = call i64 @rt_cons(i64 257, i64 %t3140)
  ret i64 %t3141
else910:
  %t3142 = or i64 %t3126, 816
  %t3143 = and i64 %t3142, 7
  %t3144 = icmp eq i64 %t3143, 0
  br i1 %t3144, label %fixfast914, label %fixslow915
fixfast914:
  %t3145 = icmp eq i64 %t3126, 816
  %t3146 = select i1 %t3145, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t3147 = call i64 @rt_num_eq(i64 %t3126, i64 816)
  br label %fixmerge916
fixmerge916:
  %t3148 = phi i64 [ %t3146, %fixfast914 ], [ %t3147, %fixslow915 ]
  %t3149 = icmp ne i64 %t3148, 1
  br i1 %t3149, label %then917, label %else918
then917:
  %t3150 = or i64 %a2, 8
  %t3151 = and i64 %t3150, 7
  %t3152 = icmp eq i64 %t3151, 0
  br i1 %t3152, label %fixfast919, label %fixslow920
fixfast919:
  %t3153 = add i64 %a2, 8
  br label %fixmerge921
fixslow920:
  %t3154 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge921
fixmerge921:
  %t3155 = phi i64 [ %t3153, %fixfast919 ], [ %t3154, %fixslow920 ]
  %t3156 = call i64 @rt_cons(i64 1, i64 %t3155)
  ret i64 %t3156
else918:
  %t3157 = or i64 %t3126, 736
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast922, label %fixslow923
fixfast922:
  %t3160 = icmp eq i64 %t3126, 736
  %t3161 = select i1 %t3160, i64 257, i64 1
  br label %fixmerge924
fixslow923:
  %t3162 = call i64 @rt_num_eq(i64 %t3126, i64 736)
  br label %fixmerge924
fixmerge924:
  %t3163 = phi i64 [ %t3161, %fixfast922 ], [ %t3162, %fixslow923 ]
  %t3164 = icmp ne i64 %t3163, 1
  br i1 %t3164, label %then925, label %else926
then925:
  %t3165 = load i64, ptr @"scheme.base:rd-char"
  %t3166 = and i64 %t3165, -8
  %t3167 = inttoptr i64 %t3166 to ptr
  %t3168 = load i64, ptr %t3167
  %t3169 = inttoptr i64 %t3168 to ptr
  %t3170 = musttail call fastcc i64 %t3169(i64 %t3165, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3170
else926:
  %t3171 = or i64 %t3126, 320
  %t3172 = and i64 %t3171, 7
  %t3173 = icmp eq i64 %t3172, 0
  br i1 %t3173, label %fixfast927, label %fixslow928
fixfast927:
  %t3174 = icmp eq i64 %t3126, 320
  %t3175 = select i1 %t3174, i64 257, i64 1
  br label %fixmerge929
fixslow928:
  %t3176 = call i64 @rt_num_eq(i64 %t3126, i64 320)
  br label %fixmerge929
fixmerge929:
  %t3177 = phi i64 [ %t3175, %fixfast927 ], [ %t3176, %fixslow928 ]
  %t3178 = icmp ne i64 %t3177, 1
  br i1 %t3178, label %then930, label %else931
then930:
  %t3179 = or i64 %a2, 8
  %t3180 = and i64 %t3179, 7
  %t3181 = icmp eq i64 %t3180, 0
  br i1 %t3181, label %fixfast932, label %fixslow933
fixfast932:
  %t3182 = add i64 %a2, 8
  br label %fixmerge934
fixslow933:
  %t3183 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge934
fixmerge934:
  %t3184 = phi i64 [ %t3182, %fixfast932 ], [ %t3183, %fixslow933 ]
  %t3185 = load i64, ptr @"scheme.base:rd-list"
  %t3186 = and i64 %t3185, -8
  %t3187 = inttoptr i64 %t3186 to ptr
  %t3188 = load i64, ptr %t3187
  %t3189 = inttoptr i64 %t3188 to ptr
  %t3190 = call fastcc i64%t3189(i64 %t3185, i64 4, i64 %a0, i64 %a1, i64 %t3184, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3191 = call i64 @rt_car(i64 %t3190)
  %t3192 = load i64, ptr @"scheme.base:list->vector"
  %t3193 = and i64 %t3192, -8
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = load i64, ptr %t3194
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = call fastcc i64%t3196(i64 %t3192, i64 1, i64 %t3191, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3198 = call i64 @rt_cdr(i64 %t3190)
  %t3199 = call i64 @rt_cons(i64 %t3197, i64 %t3198)
  ret i64 %t3199
else931:
  %t3200 = or i64 %t3126, 936
  %t3201 = and i64 %t3200, 7
  %t3202 = icmp eq i64 %t3201, 0
  br i1 %t3202, label %fixfast935, label %fixslow936
fixfast935:
  %t3203 = icmp eq i64 %t3126, 936
  %t3204 = select i1 %t3203, i64 257, i64 1
  br label %fixmerge937
fixslow936:
  %t3205 = call i64 @rt_num_eq(i64 %t3126, i64 936)
  br label %fixmerge937
fixmerge937:
  %t3206 = phi i64 [ %t3204, %fixfast935 ], [ %t3205, %fixslow936 ]
  %t3207 = icmp ne i64 %t3206, 1
  br i1 %t3207, label %then938, label %else939
then938:
  %t3208 = or i64 %a2, 16
  %t3209 = and i64 %t3208, 7
  %t3210 = icmp eq i64 %t3209, 0
  br i1 %t3210, label %fixfast941, label %fixslow942
fixfast941:
  %t3211 = add i64 %a2, 16
  br label %fixmerge943
fixslow942:
  %t3212 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge943
fixmerge943:
  %t3213 = phi i64 [ %t3211, %fixfast941 ], [ %t3212, %fixslow942 ]
  %t3214 = or i64 %t3213, %a1
  %t3215 = and i64 %t3214, 7
  %t3216 = icmp eq i64 %t3215, 0
  br i1 %t3216, label %fixfast944, label %fixslow945
fixfast944:
  %t3217 = icmp slt i64 %t3213, %a1
  %t3218 = select i1 %t3217, i64 257, i64 1
  br label %fixmerge946
fixslow945:
  %t3219 = call i64 @rt_lt(i64 %t3213, i64 %a1)
  br label %fixmerge946
fixmerge946:
  %t3220 = phi i64 [ %t3218, %fixfast944 ], [ %t3219, %fixslow945 ]
  %t3221 = icmp ne i64 %t3220, 1
  br i1 %t3221, label %then947, label %else948
then947:
  %t3222 = or i64 %a2, 8
  %t3223 = and i64 %t3222, 7
  %t3224 = icmp eq i64 %t3223, 0
  br i1 %t3224, label %fixfast950, label %fixslow951
fixfast950:
  %t3225 = add i64 %a2, 8
  br label %fixmerge952
fixslow951:
  %t3226 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge952
fixmerge952:
  %t3227 = phi i64 [ %t3225, %fixfast950 ], [ %t3226, %fixslow951 ]
  %t3228 = call i64 @rt_string_ref(i64 %a0, i64 %t3227)
  %t3229 = call i64 @rt_char_to_integer(i64 %t3228)
  %t3230 = or i64 %t3229, 448
  %t3231 = and i64 %t3230, 7
  %t3232 = icmp eq i64 %t3231, 0
  br i1 %t3232, label %fixfast953, label %fixslow954
fixfast953:
  %t3233 = icmp eq i64 %t3229, 448
  %t3234 = select i1 %t3233, i64 257, i64 1
  br label %fixmerge955
fixslow954:
  %t3235 = call i64 @rt_num_eq(i64 %t3229, i64 448)
  br label %fixmerge955
fixmerge955:
  %t3236 = phi i64 [ %t3234, %fixfast953 ], [ %t3235, %fixslow954 ]
  %t3237 = icmp ne i64 %t3236, 1
  br i1 %t3237, label %then956, label %else957
then956:
  %t3238 = or i64 %a2, 16
  %t3239 = and i64 %t3238, 7
  %t3240 = icmp eq i64 %t3239, 0
  br i1 %t3240, label %fixfast959, label %fixslow960
fixfast959:
  %t3241 = add i64 %a2, 16
  br label %fixmerge961
fixslow960:
  %t3242 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge961
fixmerge961:
  %t3243 = phi i64 [ %t3241, %fixfast959 ], [ %t3242, %fixslow960 ]
  %t3244 = call i64 @rt_string_ref(i64 %a0, i64 %t3243)
  %t3245 = call i64 @rt_char_to_integer(i64 %t3244)
  %t3246 = or i64 %t3245, 320
  %t3247 = and i64 %t3246, 7
  %t3248 = icmp eq i64 %t3247, 0
  br i1 %t3248, label %fixfast962, label %fixslow963
fixfast962:
  %t3249 = icmp eq i64 %t3245, 320
  %t3250 = select i1 %t3249, i64 257, i64 1
  br label %fixmerge964
fixslow963:
  %t3251 = call i64 @rt_num_eq(i64 %t3245, i64 320)
  br label %fixmerge964
fixmerge964:
  %t3252 = phi i64 [ %t3250, %fixfast962 ], [ %t3251, %fixslow963 ]
  br label %merge958
else957:
  br label %merge958
merge958:
  %t3253 = phi i64 [ %t3252, %fixmerge964 ], [ 1, %else957 ]
  br label %merge949
else948:
  br label %merge949
merge949:
  %t3254 = phi i64 [ %t3253, %merge958 ], [ 1, %else948 ]
  br label %merge940
else939:
  br label %merge940
merge940:
  %t3255 = phi i64 [ %t3254, %merge949 ], [ 1, %else939 ]
  %t3256 = icmp ne i64 %t3255, 1
  br i1 %t3256, label %then965, label %else966
then965:
  %t3257 = or i64 %a2, 24
  %t3258 = and i64 %t3257, 7
  %t3259 = icmp eq i64 %t3258, 0
  br i1 %t3259, label %fixfast967, label %fixslow968
fixfast967:
  %t3260 = add i64 %a2, 24
  br label %fixmerge969
fixslow968:
  %t3261 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge969
fixmerge969:
  %t3262 = phi i64 [ %t3260, %fixfast967 ], [ %t3261, %fixslow968 ]
  %t3263 = load i64, ptr @"scheme.base:rd-list"
  %t3264 = and i64 %t3263, -8
  %t3265 = inttoptr i64 %t3264 to ptr
  %t3266 = load i64, ptr %t3265
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = call fastcc i64%t3267(i64 %t3263, i64 4, i64 %a0, i64 %a1, i64 %t3262, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3269 = call i64 @rt_car(i64 %t3268)
  %t3270 = load i64, ptr @"scheme.base:list->bytevector"
  %t3271 = and i64 %t3270, -8
  %t3272 = inttoptr i64 %t3271 to ptr
  %t3273 = load i64, ptr %t3272
  %t3274 = inttoptr i64 %t3273 to ptr
  %t3275 = call fastcc i64%t3274(i64 %t3270, i64 1, i64 %t3269, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3276 = call i64 @rt_cdr(i64 %t3268)
  %t3277 = call i64 @rt_cons(i64 %t3275, i64 %t3276)
  ret i64 %t3277
else966:
  %t3278 = load i64, ptr @"scheme.base:rd-token-end"
  %t3279 = and i64 %t3278, -8
  %t3280 = inttoptr i64 %t3279 to ptr
  %t3281 = load i64, ptr %t3280
  %t3282 = inttoptr i64 %t3281 to ptr
  %t3283 = call fastcc i64%t3282(i64 %t3278, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3284 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3283)
  %t3285 = call i64 @rt_string_to_symbol(i64 %t3284)
  %t3286 = call i64 @rt_cons(i64 %t3285, i64 %t3283)
  ret i64 %t3286
}

define fastcc i64 @"scheme.base:code_898"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3291 = icmp eq i64 %argc, 1
  br i1 %t3291, label %argok971, label %arityerr970
arityerr970:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok971:
  %t3292 = call i64 @rt_make_string(ptr @.str.lit.4, i64 5)
  %t3293 = call i64 @rt_string_eq(i64 %a0, i64 %t3292)
  %t3294 = icmp ne i64 %t3293, 1
  br i1 %t3294, label %then972, label %else973
then972:
  %t3295 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3295
else973:
  %t3296 = call i64 @rt_make_string(ptr @.str.lit.5, i64 7)
  %t3297 = call i64 @rt_string_eq(i64 %a0, i64 %t3296)
  %t3298 = icmp ne i64 %t3297, 1
  br i1 %t3298, label %then974, label %else975
then974:
  %t3299 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3299
else975:
  %t3300 = call i64 @rt_make_string(ptr @.str.lit.6, i64 3)
  %t3301 = call i64 @rt_string_eq(i64 %a0, i64 %t3300)
  %t3302 = icmp ne i64 %t3301, 1
  br i1 %t3302, label %then976, label %else977
then976:
  %t3303 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3303
else977:
  %t3304 = call i64 @rt_make_string(ptr @.str.lit.7, i64 6)
  %t3305 = call i64 @rt_string_eq(i64 %a0, i64 %t3304)
  %t3306 = icmp ne i64 %t3305, 1
  br i1 %t3306, label %then978, label %else979
then978:
  %t3307 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3307
else979:
  %t3308 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t3309 = call i64 @rt_string_eq(i64 %a0, i64 %t3308)
  %t3310 = icmp ne i64 %t3309, 1
  br i1 %t3310, label %then980, label %else981
then980:
  %t3311 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3311
else981:
  %t3312 = call i64 @rt_make_string(ptr @.str.lit.9, i64 4)
  %t3313 = call i64 @rt_string_eq(i64 %a0, i64 %t3312)
  %t3314 = icmp ne i64 %t3313, 1
  br i1 %t3314, label %then982, label %else983
then982:
  %t3315 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3315
else983:
  %t3316 = call i64 @rt_make_string(ptr @.str.lit.10, i64 6)
  %t3317 = call i64 @rt_string_eq(i64 %a0, i64 %t3316)
  %t3318 = icmp ne i64 %t3317, 1
  br i1 %t3318, label %then984, label %else985
then984:
  %t3319 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3319
else985:
  %t3320 = call i64 @rt_make_string(ptr @.str.lit.11, i64 7)
  %t3321 = call i64 @rt_string_eq(i64 %a0, i64 %t3320)
  %t3322 = icmp ne i64 %t3321, 1
  br i1 %t3322, label %then986, label %else987
then986:
  %t3323 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3323
else987:
  %t3324 = call i64 @rt_make_string(ptr @.str.lit.12, i64 3)
  %t3325 = call i64 @rt_string_eq(i64 %a0, i64 %t3324)
  %t3326 = icmp ne i64 %t3325, 1
  br i1 %t3326, label %then988, label %else989
then988:
  %t3327 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3327
else989:
  %t3328 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3328
}

define fastcc i64 @"scheme.base:code_910"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3333 = icmp eq i64 %argc, 3
  br i1 %t3333, label %argok991, label %arityerr990
arityerr990:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok991:
  %t3334 = or i64 %a2, 8
  %t3335 = and i64 %t3334, 7
  %t3336 = icmp eq i64 %t3335, 0
  br i1 %t3336, label %fixfast992, label %fixslow993
fixfast992:
  %t3337 = add i64 %a2, 8
  br label %fixmerge994
fixslow993:
  %t3338 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge994
fixmerge994:
  %t3339 = phi i64 [ %t3337, %fixfast992 ], [ %t3338, %fixslow993 ]
  %t3340 = or i64 %t3339, 8
  %t3341 = and i64 %t3340, 7
  %t3342 = icmp eq i64 %t3341, 0
  br i1 %t3342, label %fixfast995, label %fixslow996
fixfast995:
  %t3343 = add i64 %t3339, 8
  br label %fixmerge997
fixslow996:
  %t3344 = call i64 @rt_add(i64 %t3339, i64 8)
  br label %fixmerge997
fixmerge997:
  %t3345 = phi i64 [ %t3343, %fixfast995 ], [ %t3344, %fixslow996 ]
  %t3346 = load i64, ptr @"scheme.base:rd-token-end"
  %t3347 = and i64 %t3346, -8
  %t3348 = inttoptr i64 %t3347 to ptr
  %t3349 = load i64, ptr %t3348
  %t3350 = inttoptr i64 %t3349 to ptr
  %t3351 = call fastcc i64%t3350(i64 %t3346, i64 3, i64 %a0, i64 %a1, i64 %t3345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3352 = call i64 @rt_substring(i64 %a0, i64 %t3339, i64 %t3351)
  %t3353 = call i64 @rt_string_length(i64 %t3352)
  %t3354 = or i64 %t3353, 8
  %t3355 = and i64 %t3354, 7
  %t3356 = icmp eq i64 %t3355, 0
  br i1 %t3356, label %fixfast998, label %fixslow999
fixfast998:
  %t3357 = icmp eq i64 %t3353, 8
  %t3358 = select i1 %t3357, i64 257, i64 1
  br label %fixmerge1000
fixslow999:
  %t3359 = call i64 @rt_num_eq(i64 %t3353, i64 8)
  br label %fixmerge1000
fixmerge1000:
  %t3360 = phi i64 [ %t3358, %fixfast998 ], [ %t3359, %fixslow999 ]
  %t3361 = icmp ne i64 %t3360, 1
  br i1 %t3361, label %then1001, label %else1002
then1001:
  %t3362 = call i64 @rt_string_ref(i64 %a0, i64 %t3339)
  %t3363 = call i64 @rt_cons(i64 %t3362, i64 %t3351)
  ret i64 %t3363
else1002:
  %t3364 = load i64, ptr @"scheme.base:rd-char-name"
  %t3365 = and i64 %t3364, -8
  %t3366 = inttoptr i64 %t3365 to ptr
  %t3367 = load i64, ptr %t3366
  %t3368 = inttoptr i64 %t3367 to ptr
  %t3369 = call fastcc i64%t3368(i64 %t3364, i64 1, i64 %t3352, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3370 = call i64 @rt_cons(i64 %t3369, i64 %t3351)
  ret i64 %t3370
}

define fastcc i64 @"scheme.base:code_917"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3375 = icmp eq i64 %argc, 3
  br i1 %t3375, label %argok1004, label %arityerr1003
arityerr1003:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1004:
  %t3376 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3377 = and i64 %t3376, -8
  %t3378 = inttoptr i64 %t3377 to ptr
  %t3379 = load i64, ptr %t3378
  %t3380 = inttoptr i64 %t3379 to ptr
  %t3381 = call fastcc i64%t3380(i64 %t3376, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3382 = load i64, ptr @"scheme.base:rd-datum"
  %t3383 = and i64 %t3382, -8
  %t3384 = inttoptr i64 %t3383 to ptr
  %t3385 = load i64, ptr %t3384
  %t3386 = inttoptr i64 %t3385 to ptr
  %t3387 = call fastcc i64%t3386(i64 %t3382, i64 3, i64 %a0, i64 %a1, i64 %t3381, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3388 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3389 = call i64 @rt_car(i64 %t3387)
  %t3390 = load i64, ptr @"scheme.base:list"
  %t3391 = and i64 %t3390, -8
  %t3392 = inttoptr i64 %t3391 to ptr
  %t3393 = load i64, ptr %t3392
  %t3394 = inttoptr i64 %t3393 to ptr
  %t3395 = call fastcc i64%t3394(i64 %t3390, i64 2, i64 %t3388, i64 %t3389, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3396 = call i64 @rt_cdr(i64 %t3387)
  %t3397 = call i64 @rt_cons(i64 %t3395, i64 %t3396)
  ret i64 %t3397
}

define fastcc i64 @"scheme.base:code_924"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3402 = icmp eq i64 %argc, 3
  br i1 %t3402, label %argok1006, label %arityerr1005
arityerr1005:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1006:
  %t3403 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3404 = and i64 %t3403, -8
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = load i64, ptr %t3405
  %t3407 = inttoptr i64 %t3406 to ptr
  %t3408 = call fastcc i64%t3407(i64 %t3403, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3409 = load i64, ptr @"scheme.base:rd-datum"
  %t3410 = and i64 %t3409, -8
  %t3411 = inttoptr i64 %t3410 to ptr
  %t3412 = load i64, ptr %t3411
  %t3413 = inttoptr i64 %t3412 to ptr
  %t3414 = call fastcc i64%t3413(i64 %t3409, i64 3, i64 %a0, i64 %a1, i64 %t3408, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3415 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3416 = call i64 @rt_car(i64 %t3414)
  %t3417 = load i64, ptr @"scheme.base:list"
  %t3418 = and i64 %t3417, -8
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = load i64, ptr %t3419
  %t3421 = inttoptr i64 %t3420 to ptr
  %t3422 = call fastcc i64%t3421(i64 %t3417, i64 2, i64 %t3415, i64 %t3416, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3423 = call i64 @rt_cdr(i64 %t3414)
  %t3424 = call i64 @rt_cons(i64 %t3422, i64 %t3423)
  ret i64 %t3424
}

define fastcc i64 @"scheme.base:code_941"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3429 = icmp eq i64 %argc, 3
  br i1 %t3429, label %argok1008, label %arityerr1007
arityerr1007:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1008:
  %t3430 = or i64 %a2, %a1
  %t3431 = and i64 %t3430, 7
  %t3432 = icmp eq i64 %t3431, 0
  br i1 %t3432, label %fixfast1009, label %fixslow1010
fixfast1009:
  %t3433 = icmp slt i64 %a2, %a1
  %t3434 = select i1 %t3433, i64 257, i64 1
  br label %fixmerge1011
fixslow1010:
  %t3435 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1011
fixmerge1011:
  %t3436 = phi i64 [ %t3434, %fixfast1009 ], [ %t3435, %fixslow1010 ]
  %t3437 = icmp ne i64 %t3436, 1
  br i1 %t3437, label %then1012, label %else1013
then1012:
  %t3438 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3439 = call i64 @rt_char_to_integer(i64 %t3438)
  %t3440 = or i64 %t3439, 512
  %t3441 = and i64 %t3440, 7
  %t3442 = icmp eq i64 %t3441, 0
  br i1 %t3442, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t3443 = icmp eq i64 %t3439, 512
  %t3444 = select i1 %t3443, i64 257, i64 1
  br label %fixmerge1017
fixslow1016:
  %t3445 = call i64 @rt_num_eq(i64 %t3439, i64 512)
  br label %fixmerge1017
fixmerge1017:
  %t3446 = phi i64 [ %t3444, %fixfast1015 ], [ %t3445, %fixslow1016 ]
  br label %merge1014
else1013:
  br label %merge1014
merge1014:
  %t3447 = phi i64 [ %t3446, %fixmerge1017 ], [ 1, %else1013 ]
  %t3448 = icmp ne i64 %t3447, 1
  br i1 %t3448, label %then1018, label %else1019
then1018:
  %t3449 = or i64 %a2, 8
  %t3450 = and i64 %t3449, 7
  %t3451 = icmp eq i64 %t3450, 0
  br i1 %t3451, label %fixfast1020, label %fixslow1021
fixfast1020:
  %t3452 = add i64 %a2, 8
  br label %fixmerge1022
fixslow1021:
  %t3453 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1022
fixmerge1022:
  %t3454 = phi i64 [ %t3452, %fixfast1020 ], [ %t3453, %fixslow1021 ]
  %t3455 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3456 = and i64 %t3455, -8
  %t3457 = inttoptr i64 %t3456 to ptr
  %t3458 = load i64, ptr %t3457
  %t3459 = inttoptr i64 %t3458 to ptr
  %t3460 = call fastcc i64%t3459(i64 %t3455, i64 3, i64 %a0, i64 %a1, i64 %t3454, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3461 = load i64, ptr @"scheme.base:rd-datum"
  %t3462 = and i64 %t3461, -8
  %t3463 = inttoptr i64 %t3462 to ptr
  %t3464 = load i64, ptr %t3463
  %t3465 = inttoptr i64 %t3464 to ptr
  %t3466 = call fastcc i64%t3465(i64 %t3461, i64 3, i64 %a0, i64 %a1, i64 %t3460, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3467 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3468 = call i64 @rt_car(i64 %t3466)
  %t3469 = load i64, ptr @"scheme.base:list"
  %t3470 = and i64 %t3469, -8
  %t3471 = inttoptr i64 %t3470 to ptr
  %t3472 = load i64, ptr %t3471
  %t3473 = inttoptr i64 %t3472 to ptr
  %t3474 = call fastcc i64%t3473(i64 %t3469, i64 2, i64 %t3467, i64 %t3468, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3475 = call i64 @rt_cdr(i64 %t3466)
  %t3476 = call i64 @rt_cons(i64 %t3474, i64 %t3475)
  ret i64 %t3476
else1019:
  %t3477 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3478 = and i64 %t3477, -8
  %t3479 = inttoptr i64 %t3478 to ptr
  %t3480 = load i64, ptr %t3479
  %t3481 = inttoptr i64 %t3480 to ptr
  %t3482 = call fastcc i64%t3481(i64 %t3477, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3483 = load i64, ptr @"scheme.base:rd-datum"
  %t3484 = and i64 %t3483, -8
  %t3485 = inttoptr i64 %t3484 to ptr
  %t3486 = load i64, ptr %t3485
  %t3487 = inttoptr i64 %t3486 to ptr
  %t3488 = call fastcc i64%t3487(i64 %t3483, i64 3, i64 %a0, i64 %a1, i64 %t3482, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3489 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3490 = call i64 @rt_car(i64 %t3488)
  %t3491 = load i64, ptr @"scheme.base:list"
  %t3492 = and i64 %t3491, -8
  %t3493 = inttoptr i64 %t3492 to ptr
  %t3494 = load i64, ptr %t3493
  %t3495 = inttoptr i64 %t3494 to ptr
  %t3496 = call fastcc i64%t3495(i64 %t3491, i64 2, i64 %t3489, i64 %t3490, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3497 = call i64 @rt_cdr(i64 %t3488)
  %t3498 = call i64 @rt_cons(i64 %t3496, i64 %t3497)
  ret i64 %t3498
}

define fastcc i64 @"scheme.base:code_954"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3503 = icmp eq i64 %argc, 3
  br i1 %t3503, label %argok1024, label %arityerr1023
arityerr1023:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1024:
  %t3504 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3505 = call i64 @rt_char_to_integer(i64 %t3504)
  %t3506 = or i64 %t3505, 368
  %t3507 = and i64 %t3506, 7
  %t3508 = icmp eq i64 %t3507, 0
  br i1 %t3508, label %fixfast1025, label %fixslow1026
fixfast1025:
  %t3509 = icmp eq i64 %t3505, 368
  %t3510 = select i1 %t3509, i64 257, i64 1
  br label %fixmerge1027
fixslow1026:
  %t3511 = call i64 @rt_num_eq(i64 %t3505, i64 368)
  br label %fixmerge1027
fixmerge1027:
  %t3512 = phi i64 [ %t3510, %fixfast1025 ], [ %t3511, %fixslow1026 ]
  %t3513 = icmp ne i64 %t3512, 1
  br i1 %t3513, label %then1028, label %else1029
then1028:
  %t3514 = or i64 %a2, 8
  %t3515 = and i64 %t3514, 7
  %t3516 = icmp eq i64 %t3515, 0
  br i1 %t3516, label %fixfast1030, label %fixslow1031
fixfast1030:
  %t3517 = add i64 %a2, 8
  br label %fixmerge1032
fixslow1031:
  %t3518 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1032
fixmerge1032:
  %t3519 = phi i64 [ %t3517, %fixfast1030 ], [ %t3518, %fixslow1031 ]
  %t3520 = load i64, ptr @"scheme.base:rd-token-end"
  %t3521 = and i64 %t3520, -8
  %t3522 = inttoptr i64 %t3521 to ptr
  %t3523 = load i64, ptr %t3522
  %t3524 = inttoptr i64 %t3523 to ptr
  %t3525 = call fastcc i64%t3524(i64 %t3520, i64 3, i64 %a0, i64 %a1, i64 %t3519, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3526 = or i64 %a2, 8
  %t3527 = and i64 %t3526, 7
  %t3528 = icmp eq i64 %t3527, 0
  br i1 %t3528, label %fixfast1033, label %fixslow1034
fixfast1033:
  %t3529 = add i64 %a2, 8
  br label %fixmerge1035
fixslow1034:
  %t3530 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1035
fixmerge1035:
  %t3531 = phi i64 [ %t3529, %fixfast1033 ], [ %t3530, %fixslow1034 ]
  %t3532 = or i64 %t3525, %t3531
  %t3533 = and i64 %t3532, 7
  %t3534 = icmp eq i64 %t3533, 0
  br i1 %t3534, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t3535 = icmp eq i64 %t3525, %t3531
  %t3536 = select i1 %t3535, i64 257, i64 1
  br label %fixmerge1038
fixslow1037:
  %t3537 = call i64 @rt_num_eq(i64 %t3525, i64 %t3531)
  br label %fixmerge1038
fixmerge1038:
  %t3538 = phi i64 [ %t3536, %fixfast1036 ], [ %t3537, %fixslow1037 ]
  ret i64 %t3538
else1029:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_958"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3543 = icmp eq i64 %argc, 2
  br i1 %t3543, label %argok1040, label %arityerr1039
arityerr1039:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1040:
  %t3544 = call i64 @rt_null_p(i64 %a0)
  %t3545 = icmp ne i64 %t3544, 1
  br i1 %t3545, label %then1041, label %else1042
then1041:
  ret i64 %a1
else1042:
  %t3546 = call i64 @rt_cdr(i64 %a0)
  %t3547 = call i64 @rt_car(i64 %a0)
  %t3548 = call i64 @rt_cons(i64 %t3547, i64 %a1)
  %t3549 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3550 = and i64 %t3549, -8
  %t3551 = inttoptr i64 %t3550 to ptr
  %t3552 = load i64, ptr %t3551
  %t3553 = inttoptr i64 %t3552 to ptr
  %t3554 = musttail call fastcc i64 %t3553(i64 %t3549, i64 2, i64 %t3546, i64 %t3548, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3554
}

define fastcc i64 @"scheme.base:code_983"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3559 = icmp eq i64 %argc, 4
  br i1 %t3559, label %argok1044, label %arityerr1043
arityerr1043:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1044:
  %t3560 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3561 = and i64 %t3560, -8
  %t3562 = inttoptr i64 %t3561 to ptr
  %t3563 = load i64, ptr %t3562
  %t3564 = inttoptr i64 %t3563 to ptr
  %t3565 = call fastcc i64%t3564(i64 %t3560, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3566 = or i64 %t3565, %a1
  %t3567 = and i64 %t3566, 7
  %t3568 = icmp eq i64 %t3567, 0
  br i1 %t3568, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t3569 = icmp slt i64 %t3565, %a1
  %t3570 = select i1 %t3569, i64 257, i64 1
  br label %fixmerge1047
fixslow1046:
  %t3571 = call i64 @rt_lt(i64 %t3565, i64 %a1)
  br label %fixmerge1047
fixmerge1047:
  %t3572 = phi i64 [ %t3570, %fixfast1045 ], [ %t3571, %fixslow1046 ]
  %t3573 = icmp ne i64 %t3572, 1
  br i1 %t3573, label %then1048, label %else1049
then1048:
  %t3574 = call i64 @rt_string_ref(i64 %a0, i64 %t3565)
  %t3575 = call i64 @rt_char_to_integer(i64 %t3574)
  %t3576 = or i64 %t3575, 328
  %t3577 = and i64 %t3576, 7
  %t3578 = icmp eq i64 %t3577, 0
  br i1 %t3578, label %fixfast1050, label %fixslow1051
fixfast1050:
  %t3579 = icmp eq i64 %t3575, 328
  %t3580 = select i1 %t3579, i64 257, i64 1
  br label %fixmerge1052
fixslow1051:
  %t3581 = call i64 @rt_num_eq(i64 %t3575, i64 328)
  br label %fixmerge1052
fixmerge1052:
  %t3582 = phi i64 [ %t3580, %fixfast1050 ], [ %t3581, %fixslow1051 ]
  %t3583 = icmp ne i64 %t3582, 1
  br i1 %t3583, label %then1053, label %else1054
then1053:
  br label %merge1055
else1054:
  %t3584 = or i64 %t3575, 744
  %t3585 = and i64 %t3584, 7
  %t3586 = icmp eq i64 %t3585, 0
  br i1 %t3586, label %fixfast1056, label %fixslow1057
fixfast1056:
  %t3587 = icmp eq i64 %t3575, 744
  %t3588 = select i1 %t3587, i64 257, i64 1
  br label %fixmerge1058
fixslow1057:
  %t3589 = call i64 @rt_num_eq(i64 %t3575, i64 744)
  br label %fixmerge1058
fixmerge1058:
  %t3590 = phi i64 [ %t3588, %fixfast1056 ], [ %t3589, %fixslow1057 ]
  br label %merge1055
merge1055:
  %t3591 = phi i64 [ %t3582, %then1053 ], [ %t3590, %fixmerge1058 ]
  %t3592 = icmp ne i64 %t3591, 1
  br i1 %t3592, label %then1059, label %else1060
then1059:
  %t3593 = load i64, ptr @"scheme.base:reverse"
  %t3594 = and i64 %t3593, -8
  %t3595 = inttoptr i64 %t3594 to ptr
  %t3596 = load i64, ptr %t3595
  %t3597 = inttoptr i64 %t3596 to ptr
  %t3598 = call fastcc i64%t3597(i64 %t3593, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3599 = or i64 %t3565, 8
  %t3600 = and i64 %t3599, 7
  %t3601 = icmp eq i64 %t3600, 0
  br i1 %t3601, label %fixfast1061, label %fixslow1062
fixfast1061:
  %t3602 = add i64 %t3565, 8
  br label %fixmerge1063
fixslow1062:
  %t3603 = call i64 @rt_add(i64 %t3565, i64 8)
  br label %fixmerge1063
fixmerge1063:
  %t3604 = phi i64 [ %t3602, %fixfast1061 ], [ %t3603, %fixslow1062 ]
  %t3605 = call i64 @rt_cons(i64 %t3598, i64 %t3604)
  ret i64 %t3605
else1060:
  %t3606 = load i64, ptr @"scheme.base:rd-dot?"
  %t3607 = and i64 %t3606, -8
  %t3608 = inttoptr i64 %t3607 to ptr
  %t3609 = load i64, ptr %t3608
  %t3610 = inttoptr i64 %t3609 to ptr
  %t3611 = call fastcc i64%t3610(i64 %t3606, i64 3, i64 %a0, i64 %a1, i64 %t3565, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3612 = icmp ne i64 %t3611, 1
  br i1 %t3612, label %then1064, label %else1065
then1064:
  %t3613 = or i64 %t3565, 8
  %t3614 = and i64 %t3613, 7
  %t3615 = icmp eq i64 %t3614, 0
  br i1 %t3615, label %fixfast1066, label %fixslow1067
fixfast1066:
  %t3616 = add i64 %t3565, 8
  br label %fixmerge1068
fixslow1067:
  %t3617 = call i64 @rt_add(i64 %t3565, i64 8)
  br label %fixmerge1068
fixmerge1068:
  %t3618 = phi i64 [ %t3616, %fixfast1066 ], [ %t3617, %fixslow1067 ]
  %t3619 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3620 = and i64 %t3619, -8
  %t3621 = inttoptr i64 %t3620 to ptr
  %t3622 = load i64, ptr %t3621
  %t3623 = inttoptr i64 %t3622 to ptr
  %t3624 = call fastcc i64%t3623(i64 %t3619, i64 3, i64 %a0, i64 %a1, i64 %t3618, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3625 = load i64, ptr @"scheme.base:rd-datum"
  %t3626 = and i64 %t3625, -8
  %t3627 = inttoptr i64 %t3626 to ptr
  %t3628 = load i64, ptr %t3627
  %t3629 = inttoptr i64 %t3628 to ptr
  %t3630 = call fastcc i64%t3629(i64 %t3625, i64 3, i64 %a0, i64 %a1, i64 %t3624, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3631 = call i64 @rt_cdr(i64 %t3630)
  %t3632 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3633 = and i64 %t3632, -8
  %t3634 = inttoptr i64 %t3633 to ptr
  %t3635 = load i64, ptr %t3634
  %t3636 = inttoptr i64 %t3635 to ptr
  %t3637 = call fastcc i64%t3636(i64 %t3632, i64 3, i64 %a0, i64 %a1, i64 %t3631, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3638 = call i64 @rt_car(i64 %t3630)
  %t3639 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3640 = and i64 %t3639, -8
  %t3641 = inttoptr i64 %t3640 to ptr
  %t3642 = load i64, ptr %t3641
  %t3643 = inttoptr i64 %t3642 to ptr
  %t3644 = call fastcc i64%t3643(i64 %t3639, i64 2, i64 %a3, i64 %t3638, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3645 = or i64 %t3637, 8
  %t3646 = and i64 %t3645, 7
  %t3647 = icmp eq i64 %t3646, 0
  br i1 %t3647, label %fixfast1069, label %fixslow1070
fixfast1069:
  %t3648 = add i64 %t3637, 8
  br label %fixmerge1071
fixslow1070:
  %t3649 = call i64 @rt_add(i64 %t3637, i64 8)
  br label %fixmerge1071
fixmerge1071:
  %t3650 = phi i64 [ %t3648, %fixfast1069 ], [ %t3649, %fixslow1070 ]
  %t3651 = call i64 @rt_cons(i64 %t3644, i64 %t3650)
  ret i64 %t3651
else1065:
  %t3652 = load i64, ptr @"scheme.base:rd-datum"
  %t3653 = and i64 %t3652, -8
  %t3654 = inttoptr i64 %t3653 to ptr
  %t3655 = load i64, ptr %t3654
  %t3656 = inttoptr i64 %t3655 to ptr
  %t3657 = call fastcc i64%t3656(i64 %t3652, i64 3, i64 %a0, i64 %a1, i64 %t3565, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3658 = call i64 @rt_cdr(i64 %t3657)
  %t3659 = call i64 @rt_car(i64 %t3657)
  %t3660 = call i64 @rt_cons(i64 %t3659, i64 %a3)
  %t3661 = load i64, ptr @"scheme.base:rd-list"
  %t3662 = and i64 %t3661, -8
  %t3663 = inttoptr i64 %t3662 to ptr
  %t3664 = load i64, ptr %t3663
  %t3665 = inttoptr i64 %t3664 to ptr
  %t3666 = musttail call fastcc i64 %t3665(i64 %t3661, i64 4, i64 %a0, i64 %a1, i64 %t3658, i64 %t3660, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3666
else1049:
  %t3667 = load i64, ptr @"scheme.base:reverse"
  %t3668 = and i64 %t3667, -8
  %t3669 = inttoptr i64 %t3668 to ptr
  %t3670 = load i64, ptr %t3669
  %t3671 = inttoptr i64 %t3670 to ptr
  %t3672 = call fastcc i64%t3671(i64 %t3667, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3673 = call i64 @rt_cons(i64 %t3672, i64 %t3565)
  ret i64 %t3673
}

define fastcc i64 @"scheme.base:code_1017"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3678 = icmp eq i64 %argc, 3
  br i1 %t3678, label %argok1073, label %arityerr1072
arityerr1072:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1073:
  %t3679 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3680 = call i64 @rt_char_to_integer(i64 %t3679)
  %t3681 = or i64 %t3680, 320
  %t3682 = and i64 %t3681, 7
  %t3683 = icmp eq i64 %t3682, 0
  br i1 %t3683, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t3684 = icmp eq i64 %t3680, 320
  %t3685 = select i1 %t3684, i64 257, i64 1
  br label %fixmerge1076
fixslow1075:
  %t3686 = call i64 @rt_num_eq(i64 %t3680, i64 320)
  br label %fixmerge1076
fixmerge1076:
  %t3687 = phi i64 [ %t3685, %fixfast1074 ], [ %t3686, %fixslow1075 ]
  %t3688 = icmp ne i64 %t3687, 1
  br i1 %t3688, label %then1077, label %else1078
then1077:
  %t3689 = or i64 %a2, 8
  %t3690 = and i64 %t3689, 7
  %t3691 = icmp eq i64 %t3690, 0
  br i1 %t3691, label %fixfast1079, label %fixslow1080
fixfast1079:
  %t3692 = add i64 %a2, 8
  br label %fixmerge1081
fixslow1080:
  %t3693 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1081
fixmerge1081:
  %t3694 = phi i64 [ %t3692, %fixfast1079 ], [ %t3693, %fixslow1080 ]
  %t3695 = load i64, ptr @"scheme.base:rd-list"
  %t3696 = and i64 %t3695, -8
  %t3697 = inttoptr i64 %t3696 to ptr
  %t3698 = load i64, ptr %t3697
  %t3699 = inttoptr i64 %t3698 to ptr
  %t3700 = musttail call fastcc i64 %t3699(i64 %t3695, i64 4, i64 %a0, i64 %a1, i64 %t3694, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3700
else1078:
  %t3701 = or i64 %t3680, 728
  %t3702 = and i64 %t3701, 7
  %t3703 = icmp eq i64 %t3702, 0
  br i1 %t3703, label %fixfast1082, label %fixslow1083
fixfast1082:
  %t3704 = icmp eq i64 %t3680, 728
  %t3705 = select i1 %t3704, i64 257, i64 1
  br label %fixmerge1084
fixslow1083:
  %t3706 = call i64 @rt_num_eq(i64 %t3680, i64 728)
  br label %fixmerge1084
fixmerge1084:
  %t3707 = phi i64 [ %t3705, %fixfast1082 ], [ %t3706, %fixslow1083 ]
  %t3708 = icmp ne i64 %t3707, 1
  br i1 %t3708, label %then1085, label %else1086
then1085:
  %t3709 = or i64 %a2, 8
  %t3710 = and i64 %t3709, 7
  %t3711 = icmp eq i64 %t3710, 0
  br i1 %t3711, label %fixfast1087, label %fixslow1088
fixfast1087:
  %t3712 = add i64 %a2, 8
  br label %fixmerge1089
fixslow1088:
  %t3713 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1089
fixmerge1089:
  %t3714 = phi i64 [ %t3712, %fixfast1087 ], [ %t3713, %fixslow1088 ]
  %t3715 = load i64, ptr @"scheme.base:rd-list"
  %t3716 = and i64 %t3715, -8
  %t3717 = inttoptr i64 %t3716 to ptr
  %t3718 = load i64, ptr %t3717
  %t3719 = inttoptr i64 %t3718 to ptr
  %t3720 = musttail call fastcc i64 %t3719(i64 %t3715, i64 4, i64 %a0, i64 %a1, i64 %t3714, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3720
else1086:
  %t3721 = or i64 %t3680, 312
  %t3722 = and i64 %t3721, 7
  %t3723 = icmp eq i64 %t3722, 0
  br i1 %t3723, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t3724 = icmp eq i64 %t3680, 312
  %t3725 = select i1 %t3724, i64 257, i64 1
  br label %fixmerge1092
fixslow1091:
  %t3726 = call i64 @rt_num_eq(i64 %t3680, i64 312)
  br label %fixmerge1092
fixmerge1092:
  %t3727 = phi i64 [ %t3725, %fixfast1090 ], [ %t3726, %fixslow1091 ]
  %t3728 = icmp ne i64 %t3727, 1
  br i1 %t3728, label %then1093, label %else1094
then1093:
  %t3729 = or i64 %a2, 8
  %t3730 = and i64 %t3729, 7
  %t3731 = icmp eq i64 %t3730, 0
  br i1 %t3731, label %fixfast1095, label %fixslow1096
fixfast1095:
  %t3732 = add i64 %a2, 8
  br label %fixmerge1097
fixslow1096:
  %t3733 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1097
fixmerge1097:
  %t3734 = phi i64 [ %t3732, %fixfast1095 ], [ %t3733, %fixslow1096 ]
  %t3735 = load i64, ptr @"scheme.base:rd-quote"
  %t3736 = and i64 %t3735, -8
  %t3737 = inttoptr i64 %t3736 to ptr
  %t3738 = load i64, ptr %t3737
  %t3739 = inttoptr i64 %t3738 to ptr
  %t3740 = musttail call fastcc i64 %t3739(i64 %t3735, i64 3, i64 %a0, i64 %a1, i64 %t3734, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3740
else1094:
  %t3741 = or i64 %t3680, 768
  %t3742 = and i64 %t3741, 7
  %t3743 = icmp eq i64 %t3742, 0
  br i1 %t3743, label %fixfast1098, label %fixslow1099
fixfast1098:
  %t3744 = icmp eq i64 %t3680, 768
  %t3745 = select i1 %t3744, i64 257, i64 1
  br label %fixmerge1100
fixslow1099:
  %t3746 = call i64 @rt_num_eq(i64 %t3680, i64 768)
  br label %fixmerge1100
fixmerge1100:
  %t3747 = phi i64 [ %t3745, %fixfast1098 ], [ %t3746, %fixslow1099 ]
  %t3748 = icmp ne i64 %t3747, 1
  br i1 %t3748, label %then1101, label %else1102
then1101:
  %t3749 = or i64 %a2, 8
  %t3750 = and i64 %t3749, 7
  %t3751 = icmp eq i64 %t3750, 0
  br i1 %t3751, label %fixfast1103, label %fixslow1104
fixfast1103:
  %t3752 = add i64 %a2, 8
  br label %fixmerge1105
fixslow1104:
  %t3753 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1105
fixmerge1105:
  %t3754 = phi i64 [ %t3752, %fixfast1103 ], [ %t3753, %fixslow1104 ]
  %t3755 = load i64, ptr @"scheme.base:rd-quasi"
  %t3756 = and i64 %t3755, -8
  %t3757 = inttoptr i64 %t3756 to ptr
  %t3758 = load i64, ptr %t3757
  %t3759 = inttoptr i64 %t3758 to ptr
  %t3760 = musttail call fastcc i64 %t3759(i64 %t3755, i64 3, i64 %a0, i64 %a1, i64 %t3754, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3760
else1102:
  %t3761 = or i64 %t3680, 352
  %t3762 = and i64 %t3761, 7
  %t3763 = icmp eq i64 %t3762, 0
  br i1 %t3763, label %fixfast1106, label %fixslow1107
fixfast1106:
  %t3764 = icmp eq i64 %t3680, 352
  %t3765 = select i1 %t3764, i64 257, i64 1
  br label %fixmerge1108
fixslow1107:
  %t3766 = call i64 @rt_num_eq(i64 %t3680, i64 352)
  br label %fixmerge1108
fixmerge1108:
  %t3767 = phi i64 [ %t3765, %fixfast1106 ], [ %t3766, %fixslow1107 ]
  %t3768 = icmp ne i64 %t3767, 1
  br i1 %t3768, label %then1109, label %else1110
then1109:
  %t3769 = or i64 %a2, 8
  %t3770 = and i64 %t3769, 7
  %t3771 = icmp eq i64 %t3770, 0
  br i1 %t3771, label %fixfast1111, label %fixslow1112
fixfast1111:
  %t3772 = add i64 %a2, 8
  br label %fixmerge1113
fixslow1112:
  %t3773 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1113
fixmerge1113:
  %t3774 = phi i64 [ %t3772, %fixfast1111 ], [ %t3773, %fixslow1112 ]
  %t3775 = load i64, ptr @"scheme.base:rd-unquote"
  %t3776 = and i64 %t3775, -8
  %t3777 = inttoptr i64 %t3776 to ptr
  %t3778 = load i64, ptr %t3777
  %t3779 = inttoptr i64 %t3778 to ptr
  %t3780 = musttail call fastcc i64 %t3779(i64 %t3775, i64 3, i64 %a0, i64 %a1, i64 %t3774, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3780
else1110:
  %t3781 = or i64 %t3680, 272
  %t3782 = and i64 %t3781, 7
  %t3783 = icmp eq i64 %t3782, 0
  br i1 %t3783, label %fixfast1114, label %fixslow1115
fixfast1114:
  %t3784 = icmp eq i64 %t3680, 272
  %t3785 = select i1 %t3784, i64 257, i64 1
  br label %fixmerge1116
fixslow1115:
  %t3786 = call i64 @rt_num_eq(i64 %t3680, i64 272)
  br label %fixmerge1116
fixmerge1116:
  %t3787 = phi i64 [ %t3785, %fixfast1114 ], [ %t3786, %fixslow1115 ]
  %t3788 = icmp ne i64 %t3787, 1
  br i1 %t3788, label %then1117, label %else1118
then1117:
  %t3789 = or i64 %a2, 8
  %t3790 = and i64 %t3789, 7
  %t3791 = icmp eq i64 %t3790, 0
  br i1 %t3791, label %fixfast1119, label %fixslow1120
fixfast1119:
  %t3792 = add i64 %a2, 8
  br label %fixmerge1121
fixslow1120:
  %t3793 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1121
fixmerge1121:
  %t3794 = phi i64 [ %t3792, %fixfast1119 ], [ %t3793, %fixslow1120 ]
  %t3795 = load i64, ptr @"scheme.base:rd-string"
  %t3796 = and i64 %t3795, -8
  %t3797 = inttoptr i64 %t3796 to ptr
  %t3798 = load i64, ptr %t3797
  %t3799 = inttoptr i64 %t3798 to ptr
  %t3800 = musttail call fastcc i64 %t3799(i64 %t3795, i64 3, i64 %a0, i64 %a1, i64 %t3794, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3800
else1118:
  %t3801 = or i64 %t3680, 280
  %t3802 = and i64 %t3801, 7
  %t3803 = icmp eq i64 %t3802, 0
  br i1 %t3803, label %fixfast1122, label %fixslow1123
fixfast1122:
  %t3804 = icmp eq i64 %t3680, 280
  %t3805 = select i1 %t3804, i64 257, i64 1
  br label %fixmerge1124
fixslow1123:
  %t3806 = call i64 @rt_num_eq(i64 %t3680, i64 280)
  br label %fixmerge1124
fixmerge1124:
  %t3807 = phi i64 [ %t3805, %fixfast1122 ], [ %t3806, %fixslow1123 ]
  %t3808 = icmp ne i64 %t3807, 1
  br i1 %t3808, label %then1125, label %else1126
then1125:
  %t3809 = or i64 %a2, 8
  %t3810 = and i64 %t3809, 7
  %t3811 = icmp eq i64 %t3810, 0
  br i1 %t3811, label %fixfast1127, label %fixslow1128
fixfast1127:
  %t3812 = add i64 %a2, 8
  br label %fixmerge1129
fixslow1128:
  %t3813 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1129
fixmerge1129:
  %t3814 = phi i64 [ %t3812, %fixfast1127 ], [ %t3813, %fixslow1128 ]
  %t3815 = load i64, ptr @"scheme.base:rd-hash"
  %t3816 = and i64 %t3815, -8
  %t3817 = inttoptr i64 %t3816 to ptr
  %t3818 = load i64, ptr %t3817
  %t3819 = inttoptr i64 %t3818 to ptr
  %t3820 = musttail call fastcc i64 %t3819(i64 %t3815, i64 3, i64 %a0, i64 %a1, i64 %t3814, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3820
else1126:
  %t3821 = load i64, ptr @"scheme.base:rd-atom"
  %t3822 = and i64 %t3821, -8
  %t3823 = inttoptr i64 %t3822 to ptr
  %t3824 = load i64, ptr %t3823
  %t3825 = inttoptr i64 %t3824 to ptr
  %t3826 = musttail call fastcc i64 %t3825(i64 %t3821, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3826
}

define fastcc i64 @"scheme.base:code_1021"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3831 = icmp eq i64 %argc, 1
  br i1 %t3831, label %argok1131, label %arityerr1130
arityerr1130:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1131:
  %t3832 = call i64 @rt_string_length(i64 %a0)
  %t3833 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3834 = and i64 %t3833, -8
  %t3835 = inttoptr i64 %t3834 to ptr
  %t3836 = load i64, ptr %t3835
  %t3837 = inttoptr i64 %t3836 to ptr
  %t3838 = call fastcc i64%t3837(i64 %t3833, i64 3, i64 %a0, i64 %t3832, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3839 = load i64, ptr @"scheme.base:rd-datum"
  %t3840 = and i64 %t3839, -8
  %t3841 = inttoptr i64 %t3840 to ptr
  %t3842 = load i64, ptr %t3841
  %t3843 = inttoptr i64 %t3842 to ptr
  %t3844 = call fastcc i64%t3843(i64 %t3839, i64 3, i64 %a0, i64 %t3832, i64 %t3838, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3845 = call i64 @rt_car(i64 %t3844)
  ret i64 %t3845
}

define fastcc i64 @"scheme.base:code_1035"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3850 = icmp eq i64 %argc, 2
  br i1 %t3850, label %argok1133, label %arityerr1132
arityerr1132:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1133:
  %t3851 = and i64 %self, -8
  %t3852 = inttoptr i64 %t3851 to ptr
  %t3853 = getelementptr i64, ptr %t3852, i64 1
  %t3854 = load i64, ptr %t3853
  %t3855 = or i64 %a0, %t3854
  %t3856 = and i64 %t3855, 7
  %t3857 = icmp eq i64 %t3856, 0
  br i1 %t3857, label %fixfast1134, label %fixslow1135
fixfast1134:
  %t3858 = icmp slt i64 %a0, %t3854
  %t3859 = select i1 %t3858, i64 257, i64 1
  br label %fixmerge1136
fixslow1135:
  %t3860 = call i64 @rt_lt(i64 %a0, i64 %t3854)
  br label %fixmerge1136
fixmerge1136:
  %t3861 = phi i64 [ %t3859, %fixfast1134 ], [ %t3860, %fixslow1135 ]
  %t3862 = icmp ne i64 %t3861, 1
  br i1 %t3862, label %then1137, label %else1138
then1137:
  %t3863 = and i64 %self, -8
  %t3864 = inttoptr i64 %t3863 to ptr
  %t3865 = getelementptr i64, ptr %t3864, i64 2
  %t3866 = load i64, ptr %t3865
  %t3867 = and i64 %self, -8
  %t3868 = inttoptr i64 %t3867 to ptr
  %t3869 = getelementptr i64, ptr %t3868, i64 1
  %t3870 = load i64, ptr %t3869
  %t3871 = load i64, ptr @"scheme.base:rd-datum"
  %t3872 = and i64 %t3871, -8
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = load i64, ptr %t3873
  %t3875 = inttoptr i64 %t3874 to ptr
  %t3876 = call fastcc i64%t3875(i64 %t3871, i64 3, i64 %t3866, i64 %t3870, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3877 = and i64 %self, -8
  %t3878 = inttoptr i64 %t3877 to ptr
  %t3879 = getelementptr i64, ptr %t3878, i64 2
  %t3880 = load i64, ptr %t3879
  %t3881 = and i64 %self, -8
  %t3882 = inttoptr i64 %t3881 to ptr
  %t3883 = getelementptr i64, ptr %t3882, i64 1
  %t3884 = load i64, ptr %t3883
  %t3885 = call i64 @rt_cdr(i64 %t3876)
  %t3886 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3887 = and i64 %t3886, -8
  %t3888 = inttoptr i64 %t3887 to ptr
  %t3889 = load i64, ptr %t3888
  %t3890 = inttoptr i64 %t3889 to ptr
  %t3891 = call fastcc i64%t3890(i64 %t3886, i64 3, i64 %t3880, i64 %t3884, i64 %t3885, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3892 = call i64 @rt_car(i64 %t3876)
  %t3893 = call i64 @rt_cons(i64 %t3892, i64 %a1)
  %t3894 = musttail call fastcc i64 @"scheme.base:code_1035"(i64 %self, i64 2, i64 %t3891, i64 %t3893, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3894
else1138:
  %t3895 = load i64, ptr @"scheme.base:reverse"
  %t3896 = and i64 %t3895, -8
  %t3897 = inttoptr i64 %t3896 to ptr
  %t3898 = load i64, ptr %t3897
  %t3899 = inttoptr i64 %t3898 to ptr
  %t3900 = musttail call fastcc i64 %t3899(i64 %t3895, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3900
}

define fastcc i64 @"scheme.base:code_1033"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3901 = icmp eq i64 %argc, 1
  br i1 %t3901, label %argok1140, label %arityerr1139
arityerr1139:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1140:
  %t3902 = call i64 @rt_string_length(i64 %a0)
  %t3903 = call ptr @rt_alloc_words(i64 4)
  %t3904 = ptrtoint ptr %t3903 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1035" to i64), ptr %t3903
  %t3905 = or i64 %t3904, 4
  %t3906 = getelementptr i64, ptr %t3903, i64 1
  store i64 %t3902, ptr %t3906
  %t3907 = getelementptr i64, ptr %t3903, i64 2
  store i64 %a0, ptr %t3907
  %t3908 = getelementptr i64, ptr %t3903, i64 3
  store i64 %t3905, ptr %t3908
  %t3909 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3910 = and i64 %t3909, -8
  %t3911 = inttoptr i64 %t3910 to ptr
  %t3912 = load i64, ptr %t3911
  %t3913 = inttoptr i64 %t3912 to ptr
  %t3914 = call fastcc i64%t3913(i64 %t3909, i64 3, i64 %a0, i64 %t3902, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3915 = and i64 %t3905, -8
  %t3916 = inttoptr i64 %t3915 to ptr
  %t3917 = load i64, ptr %t3916
  %t3918 = inttoptr i64 %t3917 to ptr
  %t3919 = musttail call fastcc i64 %t3918(i64 %t3905, i64 2, i64 %t3914, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3919
}

define i64 @"scheme.base:__init_1"() {
entry:
  %t12 = call ptr @rt_alloc_words(i64 1)
  %t13 = ptrtoint ptr %t12 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1" to i64), ptr %t12
  %t14 = or i64 %t13, 4
  %t15 = call i64 @rt_root(i64 %t14)
  store i64 %t15, ptr @"scheme.base:list"
  ret i64 17
}

define i64 @"scheme.base:__init_2"() {
entry:
  %t19 = call ptr @rt_alloc_words(i64 1)
  %t20 = ptrtoint ptr %t19 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_4" to i64), ptr %t19
  %t21 = or i64 %t20, 4
  %t22 = call i64 @rt_root(i64 %t21)
  store i64 %t22, ptr @"scheme.base:caar"
  ret i64 17
}

define i64 @"scheme.base:__init_3"() {
entry:
  %t26 = call ptr @rt_alloc_words(i64 1)
  %t27 = ptrtoint ptr %t26 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_7" to i64), ptr %t26
  %t28 = or i64 %t27, 4
  %t29 = call i64 @rt_root(i64 %t28)
  store i64 %t29, ptr @"scheme.base:cadr"
  ret i64 17
}

define i64 @"scheme.base:__init_4"() {
entry:
  %t33 = call ptr @rt_alloc_words(i64 1)
  %t34 = ptrtoint ptr %t33 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_10" to i64), ptr %t33
  %t35 = or i64 %t34, 4
  %t36 = call i64 @rt_root(i64 %t35)
  store i64 %t36, ptr @"scheme.base:cdar"
  ret i64 17
}

define i64 @"scheme.base:__init_5"() {
entry:
  %t40 = call ptr @rt_alloc_words(i64 1)
  %t41 = ptrtoint ptr %t40 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_13" to i64), ptr %t40
  %t42 = or i64 %t41, 4
  %t43 = call i64 @rt_root(i64 %t42)
  store i64 %t43, ptr @"scheme.base:cddr"
  ret i64 17
}

define i64 @"scheme.base:__init_6"() {
entry:
  %t52 = call ptr @rt_alloc_words(i64 1)
  %t53 = ptrtoint ptr %t52 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_16" to i64), ptr %t52
  %t54 = or i64 %t53, 4
  %t55 = call i64 @rt_root(i64 %t54)
  store i64 %t55, ptr @"scheme.base:caaar"
  ret i64 17
}

define i64 @"scheme.base:__init_7"() {
entry:
  %t64 = call ptr @rt_alloc_words(i64 1)
  %t65 = ptrtoint ptr %t64 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_19" to i64), ptr %t64
  %t66 = or i64 %t65, 4
  %t67 = call i64 @rt_root(i64 %t66)
  store i64 %t67, ptr @"scheme.base:caadr"
  ret i64 17
}

define i64 @"scheme.base:__init_8"() {
entry:
  %t76 = call ptr @rt_alloc_words(i64 1)
  %t77 = ptrtoint ptr %t76 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_22" to i64), ptr %t76
  %t78 = or i64 %t77, 4
  %t79 = call i64 @rt_root(i64 %t78)
  store i64 %t79, ptr @"scheme.base:cadar"
  ret i64 17
}

define i64 @"scheme.base:__init_9"() {
entry:
  %t88 = call ptr @rt_alloc_words(i64 1)
  %t89 = ptrtoint ptr %t88 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_25" to i64), ptr %t88
  %t90 = or i64 %t89, 4
  %t91 = call i64 @rt_root(i64 %t90)
  store i64 %t91, ptr @"scheme.base:caddr"
  ret i64 17
}

define i64 @"scheme.base:__init_10"() {
entry:
  %t100 = call ptr @rt_alloc_words(i64 1)
  %t101 = ptrtoint ptr %t100 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_28" to i64), ptr %t100
  %t102 = or i64 %t101, 4
  %t103 = call i64 @rt_root(i64 %t102)
  store i64 %t103, ptr @"scheme.base:cdaar"
  ret i64 17
}

define i64 @"scheme.base:__init_11"() {
entry:
  %t112 = call ptr @rt_alloc_words(i64 1)
  %t113 = ptrtoint ptr %t112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_31" to i64), ptr %t112
  %t114 = or i64 %t113, 4
  %t115 = call i64 @rt_root(i64 %t114)
  store i64 %t115, ptr @"scheme.base:cdadr"
  ret i64 17
}

define i64 @"scheme.base:__init_12"() {
entry:
  %t124 = call ptr @rt_alloc_words(i64 1)
  %t125 = ptrtoint ptr %t124 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_34" to i64), ptr %t124
  %t126 = or i64 %t125, 4
  %t127 = call i64 @rt_root(i64 %t126)
  store i64 %t127, ptr @"scheme.base:cddar"
  ret i64 17
}

define i64 @"scheme.base:__init_13"() {
entry:
  %t136 = call ptr @rt_alloc_words(i64 1)
  %t137 = ptrtoint ptr %t136 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_37" to i64), ptr %t136
  %t138 = or i64 %t137, 4
  %t139 = call i64 @rt_root(i64 %t138)
  store i64 %t139, ptr @"scheme.base:cdddr"
  ret i64 17
}

define i64 @"scheme.base:__init_14"() {
entry:
  %t161 = call ptr @rt_alloc_words(i64 1)
  %t162 = ptrtoint ptr %t161 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_43" to i64), ptr %t161
  %t163 = or i64 %t162, 4
  %t164 = call i64 @rt_root(i64 %t163)
  store i64 %t164, ptr @"scheme.base:length"
  ret i64 17
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t182 = call ptr @rt_alloc_words(i64 1)
  %t183 = ptrtoint ptr %t182 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_51" to i64), ptr %t182
  %t184 = or i64 %t183, 4
  %t185 = call i64 @rt_root(i64 %t184)
  store i64 %t185, ptr @"scheme.base:reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t198 = call ptr @rt_alloc_words(i64 1)
  %t199 = ptrtoint ptr %t198 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_57" to i64), ptr %t198
  %t200 = or i64 %t199, 4
  %t201 = call i64 @rt_root(i64 %t200)
  store i64 %t201, ptr @"scheme.base:%append2"
  ret i64 17
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t255 = call ptr @rt_alloc_words(i64 1)
  %t256 = ptrtoint ptr %t255 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_60" to i64), ptr %t255
  %t257 = or i64 %t256, 4
  %t258 = call i64 @rt_root(i64 %t257)
  store i64 %t258, ptr @"scheme.base:append"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t276 = call ptr @rt_alloc_words(i64 1)
  %t277 = ptrtoint ptr %t276 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_64" to i64), ptr %t276
  %t278 = or i64 %t277, 4
  %t279 = call i64 @rt_root(i64 %t278)
  store i64 %t279, ptr @"scheme.base:%map1"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t293 = call ptr @rt_alloc_words(i64 1)
  %t294 = ptrtoint ptr %t293 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_67" to i64), ptr %t293
  %t295 = or i64 %t294, 4
  %t296 = call i64 @rt_root(i64 %t295)
  store i64 %t296, ptr @"scheme.base:%any-null?"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t361 = call ptr @rt_alloc_words(i64 1)
  %t362 = ptrtoint ptr %t361 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_73" to i64), ptr %t361
  %t363 = or i64 %t362, 4
  %t364 = call i64 @rt_root(i64 %t363)
  store i64 %t364, ptr @"scheme.base:%mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t391 = call ptr @rt_alloc_words(i64 1)
  %t392 = ptrtoint ptr %t391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_82" to i64), ptr %t391
  %t393 = or i64 %t392, 4
  %t394 = call i64 @rt_root(i64 %t393)
  store i64 %t394, ptr @"scheme.base:map"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t408 = call ptr @rt_alloc_words(i64 1)
  %t409 = ptrtoint ptr %t408 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_90" to i64), ptr %t408
  %t410 = or i64 %t409, 4
  %t411 = call i64 @rt_root(i64 %t410)
  store i64 %t411, ptr @"scheme.base:memq"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t425 = call ptr @rt_alloc_words(i64 1)
  %t426 = ptrtoint ptr %t425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_98" to i64), ptr %t425
  %t427 = or i64 %t426, 4
  %t428 = call i64 @rt_root(i64 %t427)
  store i64 %t428, ptr @"scheme.base:memv"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t444 = call ptr @rt_alloc_words(i64 1)
  %t445 = ptrtoint ptr %t444 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_106" to i64), ptr %t444
  %t446 = or i64 %t445, 4
  %t447 = call i64 @rt_root(i64 %t446)
  store i64 %t447, ptr @"scheme.base:assq"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t461 = call ptr @rt_alloc_words(i64 1)
  %t462 = ptrtoint ptr %t461 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_110" to i64), ptr %t461
  %t463 = or i64 %t462, 4
  %t464 = call i64 @rt_root(i64 %t463)
  store i64 %t464, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t480 = call ptr @rt_alloc_words(i64 1)
  %t481 = ptrtoint ptr %t480 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_114" to i64), ptr %t480
  %t482 = or i64 %t481, 4
  %t483 = call i64 @rt_root(i64 %t482)
  store i64 %t483, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t510 = call ptr @rt_alloc_words(i64 1)
  %t511 = ptrtoint ptr %t510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_118" to i64), ptr %t510
  %t512 = or i64 %t511, 4
  %t513 = call i64 @rt_root(i64 %t512)
  store i64 %t513, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t530 = call ptr @rt_alloc_words(i64 1)
  %t531 = ptrtoint ptr %t530 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_123" to i64), ptr %t530
  %t532 = or i64 %t531, 4
  %t533 = call i64 @rt_root(i64 %t532)
  store i64 %t533, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t550 = call ptr @rt_alloc_words(i64 1)
  %t551 = ptrtoint ptr %t550 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_128" to i64), ptr %t550
  %t552 = or i64 %t551, 4
  %t553 = call i64 @rt_root(i64 %t552)
  store i64 %t553, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t571 = call ptr @rt_alloc_words(i64 1)
  %t572 = ptrtoint ptr %t571 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_132" to i64), ptr %t571
  %t573 = or i64 %t572, 4
  %t574 = call i64 @rt_root(i64 %t573)
  store i64 %t574, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t639 = call ptr @rt_alloc_words(i64 1)
  %t640 = ptrtoint ptr %t639 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_138" to i64), ptr %t639
  %t641 = or i64 %t640, 4
  %t642 = call i64 @rt_root(i64 %t641)
  store i64 %t642, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t669 = call ptr @rt_alloc_words(i64 1)
  %t670 = ptrtoint ptr %t669 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_147" to i64), ptr %t669
  %t671 = or i64 %t670, 4
  %t672 = call i64 @rt_root(i64 %t671)
  store i64 %t672, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t690 = call ptr @rt_alloc_words(i64 1)
  %t691 = ptrtoint ptr %t690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_151" to i64), ptr %t690
  %t692 = or i64 %t691, 4
  %t693 = call i64 @rt_root(i64 %t692)
  store i64 %t693, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t711 = call ptr @rt_alloc_words(i64 1)
  %t712 = ptrtoint ptr %t711 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_155" to i64), ptr %t711
  %t713 = or i64 %t712, 4
  %t714 = call i64 @rt_root(i64 %t713)
  store i64 %t714, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t723 = call ptr @rt_alloc_words(i64 1)
  %t724 = ptrtoint ptr %t723 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_158" to i64), ptr %t723
  %t725 = or i64 %t724, 4
  %t726 = call i64 @rt_root(i64 %t725)
  store i64 %t726, ptr @"scheme.base:cadddr"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t739 = call ptr @rt_alloc_words(i64 1)
  %t740 = ptrtoint ptr %t739 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_161" to i64), ptr %t739
  %t741 = or i64 %t740, 4
  %t742 = call i64 @rt_root(i64 %t741)
  store i64 %t742, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t751 = call ptr @rt_alloc_words(i64 1)
  %t752 = ptrtoint ptr %t751 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_168" to i64), ptr %t751
  %t753 = or i64 %t752, 4
  %t754 = call i64 @rt_root(i64 %t753)
  store i64 %t754, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t776 = call ptr @rt_alloc_words(i64 1)
  %t777 = ptrtoint ptr %t776 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_172" to i64), ptr %t776
  %t778 = or i64 %t777, 4
  %t779 = call i64 @rt_root(i64 %t778)
  store i64 %t779, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t788 = call ptr @rt_alloc_words(i64 1)
  %t789 = ptrtoint ptr %t788 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_176" to i64), ptr %t788
  %t790 = or i64 %t789, 4
  %t791 = call i64 @rt_root(i64 %t790)
  store i64 %t791, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t815 = call ptr @rt_alloc_words(i64 1)
  %t816 = ptrtoint ptr %t815 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_180" to i64), ptr %t815
  %t817 = or i64 %t816, 4
  %t818 = call i64 @rt_root(i64 %t817)
  store i64 %t818, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t840 = call ptr @rt_alloc_words(i64 1)
  %t841 = ptrtoint ptr %t840 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_184" to i64), ptr %t840
  %t842 = or i64 %t841, 4
  %t843 = call i64 @rt_root(i64 %t842)
  store i64 %t843, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t882 = call ptr @rt_alloc_words(i64 1)
  %t883 = ptrtoint ptr %t882 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_194" to i64), ptr %t882
  %t884 = or i64 %t883, 4
  %t885 = call i64 @rt_root(i64 %t884)
  store i64 %t885, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t895 = call ptr @rt_alloc_words(i64 1)
  %t896 = ptrtoint ptr %t895 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_204" to i64), ptr %t895
  %t897 = or i64 %t896, 4
  %t898 = call i64 @rt_root(i64 %t897)
  store i64 %t898, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t901 = call ptr @rt_alloc_words(i64 1)
  %t902 = ptrtoint ptr %t901 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_206" to i64), ptr %t901
  %t903 = or i64 %t902, 4
  %t904 = call i64 @rt_root(i64 %t903)
  store i64 %t904, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t917 = call ptr @rt_alloc_words(i64 1)
  %t918 = ptrtoint ptr %t917 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_209" to i64), ptr %t917
  %t919 = or i64 %t918, 4
  %t920 = call i64 @rt_root(i64 %t919)
  store i64 %t920, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t934 = call ptr @rt_alloc_words(i64 1)
  %t935 = ptrtoint ptr %t934 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_212" to i64), ptr %t934
  %t936 = or i64 %t935, 4
  %t937 = call i64 @rt_root(i64 %t936)
  store i64 %t937, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t957 = call ptr @rt_alloc_words(i64 1)
  %t958 = ptrtoint ptr %t957 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_218" to i64), ptr %t957
  %t959 = or i64 %t958, 4
  %t960 = call i64 @rt_root(i64 %t959)
  store i64 %t960, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t989 = call ptr @rt_alloc_words(i64 1)
  %t990 = ptrtoint ptr %t989 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_229" to i64), ptr %t989
  %t991 = or i64 %t990, 4
  %t992 = call i64 @rt_root(i64 %t991)
  store i64 %t992, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1021 = call ptr @rt_alloc_words(i64 1)
  %t1022 = ptrtoint ptr %t1021 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_242" to i64), ptr %t1021
  %t1023 = or i64 %t1022, 4
  %t1024 = call i64 @rt_root(i64 %t1023)
  store i64 %t1024, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1053 = call ptr @rt_alloc_words(i64 1)
  %t1054 = ptrtoint ptr %t1053 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_255" to i64), ptr %t1053
  %t1055 = or i64 %t1054, 4
  %t1056 = call i64 @rt_root(i64 %t1055)
  store i64 %t1056, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1093 = call ptr @rt_alloc_words(i64 1)
  %t1094 = ptrtoint ptr %t1093 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_268" to i64), ptr %t1093
  %t1095 = or i64 %t1094, 4
  %t1096 = call i64 @rt_root(i64 %t1095)
  store i64 %t1096, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1133 = call ptr @rt_alloc_words(i64 1)
  %t1134 = ptrtoint ptr %t1133 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_281" to i64), ptr %t1133
  %t1135 = or i64 %t1134, 4
  %t1136 = call i64 @rt_root(i64 %t1135)
  store i64 %t1136, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1177 = call ptr @rt_alloc_words(i64 1)
  %t1178 = ptrtoint ptr %t1177 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_293" to i64), ptr %t1177
  %t1179 = or i64 %t1178, 4
  %t1180 = call i64 @rt_root(i64 %t1179)
  store i64 %t1180, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1213 = call ptr @rt_alloc_words(i64 1)
  %t1214 = ptrtoint ptr %t1213 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_305" to i64), ptr %t1213
  %t1215 = or i64 %t1214, 4
  %t1216 = call i64 @rt_root(i64 %t1215)
  store i64 %t1216, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1259 = call ptr @rt_alloc_words(i64 1)
  %t1260 = ptrtoint ptr %t1259 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_316" to i64), ptr %t1259
  %t1261 = or i64 %t1260, 4
  %t1262 = call i64 @rt_root(i64 %t1261)
  store i64 %t1262, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1284 = call ptr @rt_alloc_words(i64 1)
  %t1285 = ptrtoint ptr %t1284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_320" to i64), ptr %t1284
  %t1286 = or i64 %t1285, 4
  %t1287 = call i64 @rt_root(i64 %t1286)
  store i64 %t1287, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1290 = call ptr @rt_alloc_words(i64 1)
  %t1291 = ptrtoint ptr %t1290 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_323" to i64), ptr %t1290
  %t1292 = or i64 %t1291, 4
  %t1293 = call i64 @rt_root(i64 %t1292)
  store i64 %t1293, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1296 = call ptr @rt_alloc_words(i64 1)
  %t1297 = ptrtoint ptr %t1296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_326" to i64), ptr %t1296
  %t1298 = or i64 %t1297, 4
  %t1299 = call i64 @rt_root(i64 %t1298)
  store i64 %t1299, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1302 = call ptr @rt_alloc_words(i64 1)
  %t1303 = ptrtoint ptr %t1302 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_329" to i64), ptr %t1302
  %t1304 = or i64 %t1303, 4
  %t1305 = call i64 @rt_root(i64 %t1304)
  store i64 %t1305, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1308 = call ptr @rt_alloc_words(i64 1)
  %t1309 = ptrtoint ptr %t1308 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_332" to i64), ptr %t1308
  %t1310 = or i64 %t1309, 4
  %t1311 = call i64 @rt_root(i64 %t1310)
  store i64 %t1311, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1351 = call ptr @rt_alloc_words(i64 1)
  %t1352 = ptrtoint ptr %t1351 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1351
  %t1353 = or i64 %t1352, 4
  %t1354 = call i64 @rt_root(i64 %t1353)
  store i64 %t1354, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1372 = call ptr @rt_alloc_words(i64 1)
  %t1373 = ptrtoint ptr %t1372 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_344" to i64), ptr %t1372
  %t1374 = or i64 %t1373, 4
  %t1375 = call i64 @rt_root(i64 %t1374)
  store i64 %t1375, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1415 = call ptr @rt_alloc_words(i64 1)
  %t1416 = ptrtoint ptr %t1415 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_351" to i64), ptr %t1415
  %t1417 = or i64 %t1416, 4
  %t1418 = call i64 @rt_root(i64 %t1417)
  store i64 %t1418, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1436 = call ptr @rt_alloc_words(i64 1)
  %t1437 = ptrtoint ptr %t1436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_356" to i64), ptr %t1436
  %t1438 = or i64 %t1437, 4
  %t1439 = call i64 @rt_root(i64 %t1438)
  store i64 %t1439, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1459 = call ptr @rt_alloc_words(i64 1)
  %t1460 = ptrtoint ptr %t1459 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_359" to i64), ptr %t1459
  %t1461 = or i64 %t1460, 4
  %t1462 = call i64 @rt_root(i64 %t1461)
  store i64 %t1462, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1504 = call ptr @rt_alloc_words(i64 1)
  %t1505 = ptrtoint ptr %t1504 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_364" to i64), ptr %t1504
  %t1506 = or i64 %t1505, 4
  %t1507 = call i64 @rt_root(i64 %t1506)
  store i64 %t1507, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1508 = call i64 @rt_root(i64 64)
  store i64 %t1508, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1509 = call i64 @rt_root(i64 24)
  store i64 %t1509, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1520 = call ptr @rt_alloc_words(i64 1)
  %t1521 = ptrtoint ptr %t1520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_366" to i64), ptr %t1520
  %t1522 = or i64 %t1521, 4
  %t1523 = call i64 @rt_root(i64 %t1522)
  store i64 %t1523, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1526 = call ptr @rt_alloc_words(i64 1)
  %t1527 = ptrtoint ptr %t1526 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_369" to i64), ptr %t1526
  %t1528 = or i64 %t1527, 4
  %t1529 = call i64 @rt_root(i64 %t1528)
  store i64 %t1529, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1533 = call ptr @rt_alloc_words(i64 1)
  %t1534 = ptrtoint ptr %t1533 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_372" to i64), ptr %t1533
  %t1535 = or i64 %t1534, 4
  %t1536 = call i64 @rt_root(i64 %t1535)
  store i64 %t1536, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1540 = call ptr @rt_alloc_words(i64 1)
  %t1541 = ptrtoint ptr %t1540 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_375" to i64), ptr %t1540
  %t1542 = or i64 %t1541, 4
  %t1543 = call i64 @rt_root(i64 %t1542)
  store i64 %t1543, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1547 = call ptr @rt_alloc_words(i64 1)
  %t1548 = ptrtoint ptr %t1547 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_379" to i64), ptr %t1547
  %t1549 = or i64 %t1548, 4
  %t1550 = call i64 @rt_root(i64 %t1549)
  store i64 %t1550, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1554 = call ptr @rt_alloc_words(i64 1)
  %t1555 = ptrtoint ptr %t1554 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_383" to i64), ptr %t1554
  %t1556 = or i64 %t1555, 4
  %t1557 = call i64 @rt_root(i64 %t1556)
  store i64 %t1557, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1561 = call ptr @rt_alloc_words(i64 1)
  %t1562 = ptrtoint ptr %t1561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_387" to i64), ptr %t1561
  %t1563 = or i64 %t1562, 4
  %t1564 = call i64 @rt_root(i64 %t1563)
  store i64 %t1564, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1580 = call ptr @rt_alloc_words(i64 1)
  %t1581 = ptrtoint ptr %t1580 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_391" to i64), ptr %t1580
  %t1582 = or i64 %t1581, 4
  %t1583 = call i64 @rt_root(i64 %t1582)
  store i64 %t1583, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1601 = call ptr @rt_alloc_words(i64 1)
  %t1602 = ptrtoint ptr %t1601 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_395" to i64), ptr %t1601
  %t1603 = or i64 %t1602, 4
  %t1604 = call i64 @rt_root(i64 %t1603)
  store i64 %t1604, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1628 = call ptr @rt_alloc_words(i64 1)
  %t1629 = ptrtoint ptr %t1628 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_402" to i64), ptr %t1628
  %t1630 = or i64 %t1629, 4
  %t1631 = call i64 @rt_root(i64 %t1630)
  store i64 %t1631, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1654 = call ptr @rt_alloc_words(i64 1)
  %t1655 = ptrtoint ptr %t1654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_407" to i64), ptr %t1654
  %t1656 = or i64 %t1655, 4
  %t1657 = call i64 @rt_root(i64 %t1656)
  store i64 %t1657, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1688 = call ptr @rt_alloc_words(i64 1)
  %t1689 = ptrtoint ptr %t1688 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_413" to i64), ptr %t1688
  %t1690 = or i64 %t1689, 4
  %t1691 = call i64 @rt_root(i64 %t1690)
  store i64 %t1691, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1771 = call ptr @rt_alloc_words(i64 1)
  %t1772 = ptrtoint ptr %t1771 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_427" to i64), ptr %t1771
  %t1773 = or i64 %t1772, 4
  %t1774 = call i64 @rt_root(i64 %t1773)
  store i64 %t1774, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1822 = call ptr @rt_alloc_words(i64 1)
  %t1823 = ptrtoint ptr %t1822 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_434" to i64), ptr %t1822
  %t1824 = or i64 %t1823, 4
  %t1825 = call i64 @rt_root(i64 %t1824)
  store i64 %t1825, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1933 = call ptr @rt_alloc_words(i64 1)
  %t1934 = ptrtoint ptr %t1933 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_450" to i64), ptr %t1933
  %t1935 = or i64 %t1934, 4
  %t1936 = call i64 @rt_root(i64 %t1935)
  store i64 %t1936, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1944 = call ptr @rt_alloc_words(i64 1)
  %t1945 = ptrtoint ptr %t1944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_457" to i64), ptr %t1944
  %t1946 = or i64 %t1945, 4
  %t1947 = call i64 @rt_root(i64 %t1946)
  store i64 %t1947, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1964 = call ptr @rt_alloc_words(i64 1)
  %t1965 = ptrtoint ptr %t1964 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_461" to i64), ptr %t1964
  %t1966 = or i64 %t1965, 4
  %t1967 = call i64 @rt_root(i64 %t1966)
  store i64 %t1967, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2017 = call ptr @rt_alloc_words(i64 1)
  %t2018 = ptrtoint ptr %t2017 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_472" to i64), ptr %t2017
  %t2019 = or i64 %t2018, 4
  %t2020 = call i64 @rt_root(i64 %t2019)
  store i64 %t2020, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2039 = call ptr @rt_alloc_words(i64 1)
  %t2040 = ptrtoint ptr %t2039 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_478" to i64), ptr %t2039
  %t2041 = or i64 %t2040, 4
  %t2042 = call i64 @rt_root(i64 %t2041)
  store i64 %t2042, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2061 = call ptr @rt_alloc_words(i64 1)
  %t2062 = ptrtoint ptr %t2061 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_484" to i64), ptr %t2061
  %t2063 = or i64 %t2062, 4
  %t2064 = call i64 @rt_root(i64 %t2063)
  store i64 %t2064, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2098 = call ptr @rt_alloc_words(i64 1)
  %t2099 = ptrtoint ptr %t2098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_512" to i64), ptr %t2098
  %t2100 = or i64 %t2099, 4
  %t2101 = call i64 @rt_root(i64 %t2100)
  store i64 %t2101, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2119 = call ptr @rt_alloc_words(i64 1)
  %t2120 = ptrtoint ptr %t2119 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_524" to i64), ptr %t2119
  %t2121 = or i64 %t2120, 4
  %t2122 = call i64 @rt_root(i64 %t2121)
  store i64 %t2122, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2179 = call ptr @rt_alloc_words(i64 1)
  %t2180 = ptrtoint ptr %t2179 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_564" to i64), ptr %t2179
  %t2181 = or i64 %t2180, 4
  %t2182 = call i64 @rt_root(i64 %t2181)
  store i64 %t2182, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2220 = call ptr @rt_alloc_words(i64 1)
  %t2221 = ptrtoint ptr %t2220 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_577" to i64), ptr %t2220
  %t2222 = or i64 %t2221, 4
  %t2223 = call i64 @rt_root(i64 %t2222)
  store i64 %t2223, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2280 = call ptr @rt_alloc_words(i64 1)
  %t2281 = ptrtoint ptr %t2280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_591" to i64), ptr %t2280
  %t2282 = or i64 %t2281, 4
  %t2283 = call i64 @rt_root(i64 %t2282)
  store i64 %t2283, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2313 = call ptr @rt_alloc_words(i64 1)
  %t2314 = ptrtoint ptr %t2313 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_600" to i64), ptr %t2313
  %t2315 = or i64 %t2314, 4
  %t2316 = call i64 @rt_root(i64 %t2315)
  store i64 %t2316, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2346 = call ptr @rt_alloc_words(i64 1)
  %t2347 = ptrtoint ptr %t2346 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_609" to i64), ptr %t2346
  %t2348 = or i64 %t2347, 4
  %t2349 = call i64 @rt_root(i64 %t2348)
  store i64 %t2349, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2407 = call ptr @rt_alloc_words(i64 1)
  %t2408 = ptrtoint ptr %t2407 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_632" to i64), ptr %t2407
  %t2409 = or i64 %t2408, 4
  %t2410 = call i64 @rt_root(i64 %t2409)
  store i64 %t2410, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2453 = call ptr @rt_alloc_words(i64 1)
  %t2454 = ptrtoint ptr %t2453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_642" to i64), ptr %t2453
  %t2455 = or i64 %t2454, 4
  %t2456 = call i64 @rt_root(i64 %t2455)
  store i64 %t2456, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2501 = call ptr @rt_alloc_words(i64 1)
  %t2502 = ptrtoint ptr %t2501 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_655" to i64), ptr %t2501
  %t2503 = or i64 %t2502, 4
  %t2504 = call i64 @rt_root(i64 %t2503)
  store i64 %t2504, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2514 = call ptr @rt_alloc_words(i64 1)
  %t2515 = ptrtoint ptr %t2514 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_662" to i64), ptr %t2514
  %t2516 = or i64 %t2515, 4
  %t2517 = call i64 @rt_root(i64 %t2516)
  store i64 %t2517, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2535 = call ptr @rt_alloc_words(i64 1)
  %t2536 = ptrtoint ptr %t2535 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_676" to i64), ptr %t2535
  %t2537 = or i64 %t2536, 4
  %t2538 = call i64 @rt_root(i64 %t2537)
  store i64 %t2538, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2556 = call ptr @rt_alloc_words(i64 1)
  %t2557 = ptrtoint ptr %t2556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t2556
  %t2558 = or i64 %t2557, 4
  %t2559 = call i64 @rt_root(i64 %t2558)
  store i64 %t2559, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2590 = call ptr @rt_alloc_words(i64 1)
  %t2591 = ptrtoint ptr %t2590 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_699" to i64), ptr %t2590
  %t2592 = or i64 %t2591, 4
  %t2593 = call i64 @rt_root(i64 %t2592)
  store i64 %t2593, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2772 = call ptr @rt_alloc_words(i64 1)
  %t2773 = ptrtoint ptr %t2772 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_759" to i64), ptr %t2772
  %t2774 = or i64 %t2773, 4
  %t2775 = call i64 @rt_root(i64 %t2774)
  store i64 %t2775, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2809 = call ptr @rt_alloc_words(i64 1)
  %t2810 = ptrtoint ptr %t2809 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_766" to i64), ptr %t2809
  %t2811 = or i64 %t2810, 4
  %t2812 = call i64 @rt_root(i64 %t2811)
  store i64 %t2812, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2884 = call ptr @rt_alloc_words(i64 1)
  %t2885 = ptrtoint ptr %t2884 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_794" to i64), ptr %t2884
  %t2886 = or i64 %t2885, 4
  %t2887 = call i64 @rt_root(i64 %t2886)
  store i64 %t2887, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2947 = call ptr @rt_alloc_words(i64 1)
  %t2948 = ptrtoint ptr %t2947 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_808" to i64), ptr %t2947
  %t2949 = or i64 %t2948, 4
  %t2950 = call i64 @rt_root(i64 %t2949)
  store i64 %t2950, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2980 = call ptr @rt_alloc_words(i64 1)
  %t2981 = ptrtoint ptr %t2980 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_824" to i64), ptr %t2980
  %t2982 = or i64 %t2981, 4
  %t2983 = call i64 @rt_root(i64 %t2982)
  store i64 %t2983, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3120 = call ptr @rt_alloc_words(i64 1)
  %t3121 = ptrtoint ptr %t3120 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_852" to i64), ptr %t3120
  %t3122 = or i64 %t3121, 4
  %t3123 = call i64 @rt_root(i64 %t3122)
  store i64 %t3123, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3287 = call ptr @rt_alloc_words(i64 1)
  %t3288 = ptrtoint ptr %t3287 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_895" to i64), ptr %t3287
  %t3289 = or i64 %t3288, 4
  %t3290 = call i64 @rt_root(i64 %t3289)
  store i64 %t3290, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3329 = call ptr @rt_alloc_words(i64 1)
  %t3330 = ptrtoint ptr %t3329 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_898" to i64), ptr %t3329
  %t3331 = or i64 %t3330, 4
  %t3332 = call i64 @rt_root(i64 %t3331)
  store i64 %t3332, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3371 = call ptr @rt_alloc_words(i64 1)
  %t3372 = ptrtoint ptr %t3371 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_910" to i64), ptr %t3371
  %t3373 = or i64 %t3372, 4
  %t3374 = call i64 @rt_root(i64 %t3373)
  store i64 %t3374, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3398 = call ptr @rt_alloc_words(i64 1)
  %t3399 = ptrtoint ptr %t3398 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_917" to i64), ptr %t3398
  %t3400 = or i64 %t3399, 4
  %t3401 = call i64 @rt_root(i64 %t3400)
  store i64 %t3401, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3425 = call ptr @rt_alloc_words(i64 1)
  %t3426 = ptrtoint ptr %t3425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_924" to i64), ptr %t3425
  %t3427 = or i64 %t3426, 4
  %t3428 = call i64 @rt_root(i64 %t3427)
  store i64 %t3428, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3499 = call ptr @rt_alloc_words(i64 1)
  %t3500 = ptrtoint ptr %t3499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_941" to i64), ptr %t3499
  %t3501 = or i64 %t3500, 4
  %t3502 = call i64 @rt_root(i64 %t3501)
  store i64 %t3502, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3539 = call ptr @rt_alloc_words(i64 1)
  %t3540 = ptrtoint ptr %t3539 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_954" to i64), ptr %t3539
  %t3541 = or i64 %t3540, 4
  %t3542 = call i64 @rt_root(i64 %t3541)
  store i64 %t3542, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3555 = call ptr @rt_alloc_words(i64 1)
  %t3556 = ptrtoint ptr %t3555 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_958" to i64), ptr %t3555
  %t3557 = or i64 %t3556, 4
  %t3558 = call i64 @rt_root(i64 %t3557)
  store i64 %t3558, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3674 = call ptr @rt_alloc_words(i64 1)
  %t3675 = ptrtoint ptr %t3674 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_983" to i64), ptr %t3674
  %t3676 = or i64 %t3675, 4
  %t3677 = call i64 @rt_root(i64 %t3676)
  store i64 %t3677, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3827 = call ptr @rt_alloc_words(i64 1)
  %t3828 = ptrtoint ptr %t3827 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1017" to i64), ptr %t3827
  %t3829 = or i64 %t3828, 4
  %t3830 = call i64 @rt_root(i64 %t3829)
  store i64 %t3830, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3846 = call ptr @rt_alloc_words(i64 1)
  %t3847 = ptrtoint ptr %t3846 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1021" to i64), ptr %t3846
  %t3848 = or i64 %t3847, 4
  %t3849 = call i64 @rt_root(i64 %t3848)
  store i64 %t3849, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3920 = call ptr @rt_alloc_words(i64 1)
  %t3921 = ptrtoint ptr %t3920 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1033" to i64), ptr %t3920
  %t3922 = or i64 %t3921, 4
  %t3923 = call i64 @rt_root(i64 %t3922)
  store i64 %t3923, ptr @"scheme.base:read-all-from-string"
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

