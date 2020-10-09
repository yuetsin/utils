source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

@global_var_4010 = global i64 0
@global_var_3fd8 = local_unnamed_addr global i64 0
@global_var_3da8 = global i64 4480
@global_var_3db0 = global i64 4416
@0 = external global i32

define i64 @function_1000() local_unnamed_addr {
dec_label_pc_1000:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i64 @function_1003() local_unnamed_addr {
dec_label_pc_1003:
  %rax.0.reg2mem = alloca i64, !insn.addr !0
  %0 = load i64, i64* inttoptr (i64 16360 to i64*), align 8, !insn.addr !1
  %1 = icmp eq i64 %0, 0, !insn.addr !2
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !3
  br i1 %1, label %dec_label_pc_1016, label %dec_label_pc_1014, !insn.addr !3

dec_label_pc_1014:                                ; preds = %dec_label_pc_1003
  call void @__gmon_start__(), !insn.addr !4
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.0.reg2mem, !insn.addr !4
  br label %dec_label_pc_1016, !insn.addr !4

dec_label_pc_1016:                                ; preds = %dec_label_pc_1014, %dec_label_pc_1003
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !5
}

define i64 @function_1060(i64 %arg1) local_unnamed_addr {
dec_label_pc_1060:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define void @function_1063(i64* %d) local_unnamed_addr {
dec_label_pc_1063:
  call void @__cxa_finalize(i64* %d), !insn.addr !6
  ret void, !insn.addr !6
}

define i64 @function_1070(i64 %arg1, i64 %arg2, i32 %arg3, i32 %arg4) local_unnamed_addr {
dec_label_pc_1070:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_1073(i32 %rgid, i32 %egid, i32 %sgid) local_unnamed_addr {
dec_label_pc_1073:
  %0 = call i32 @setresgid(i32 %rgid, i32 %egid, i32 %sgid), !insn.addr !7
  ret i32 %0, !insn.addr !7
}

define i64 @function_1080() local_unnamed_addr {
dec_label_pc_1080:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_1083() local_unnamed_addr {
dec_label_pc_1083:
  %0 = call i32 @getegid(), !insn.addr !8
  ret i32 %0, !insn.addr !8
}

define i64 @function_1090(i64 %arg1, i64 %arg2) local_unnamed_addr {
dec_label_pc_1090:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_1093(i8* %file, [1 x i8*] %argv) local_unnamed_addr {
dec_label_pc_1093:
  %0 = call i32 @execvp(i8* %file, [1 x i8*] %argv), !insn.addr !9
  ret i32 %0, !insn.addr !9
}

define i64 @entry_point() local_unnamed_addr {
dec_label_pc_10a0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i64 @function_10a3(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4) local_unnamed_addr {
dec_label_pc_10a3:
  %stack_var_8 = alloca i64, align 8
  %0 = trunc i64 %arg4 to i32, !insn.addr !10
  %1 = bitcast i64* %stack_var_8 to i8**, !insn.addr !10
  %2 = inttoptr i64 %arg3 to void ()*, !insn.addr !10
  %3 = call i32 @__libc_start_main(i64 4489, i32 %0, i8** nonnull %1, void ()* inttoptr (i64 4592 to void ()*), void ()* inttoptr (i64 4704 to void ()*), void ()* %2), !insn.addr !10
  %4 = call i64 @__asm_hlt(), !insn.addr !11
  ret i64 ptrtoint (i64* @global_var_4010 to i64), !insn.addr !12
}

define i64 @function_1100() local_unnamed_addr {
dec_label_pc_1100:
  ret i64 0, !insn.addr !13
}

define i64 @function_1143() local_unnamed_addr {
dec_label_pc_1143:
  %rax.0.reg2mem = alloca i64, !insn.addr !14
  %0 = call i64 @__decompiler_undefined_function_0()
  %1 = load i8, i8* bitcast (i64* @global_var_4010 to i8*), align 8, !insn.addr !15
  %2 = icmp eq i8 %1, 0, !insn.addr !15
  %3 = icmp eq i1 %2, false, !insn.addr !16
  br i1 %3, label %dec_label_pc_1178, label %dec_label_pc_114d, !insn.addr !16

dec_label_pc_114d:                                ; preds = %dec_label_pc_1143
  %4 = load i64, i64* inttoptr (i64 16376 to i64*), align 8, !insn.addr !17
  %5 = icmp eq i64 %4, 0, !insn.addr !17
  br i1 %5, label %dec_label_pc_1167, label %dec_label_pc_115b, !insn.addr !18

dec_label_pc_115b:                                ; preds = %dec_label_pc_114d
  %6 = load i64, i64* inttoptr (i64 16392 to i64*), align 8, !insn.addr !19
  %7 = call i64 @function_1060(i64 %6), !insn.addr !20
  store i64 %7, i64* %rax.0.reg2mem, !insn.addr !20
  br label %dec_label_pc_1167, !insn.addr !20

dec_label_pc_1167:                                ; preds = %dec_label_pc_115b, %dec_label_pc_114d
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  store i8 1, i8* bitcast (i64* @global_var_4010 to i8*), align 8, !insn.addr !21
  ret i64 %rax.0.reload, !insn.addr !22

dec_label_pc_1178:                                ; preds = %dec_label_pc_1143
  ret i64 %0, !insn.addr !23
}

define i64 @function_1180() local_unnamed_addr {
dec_label_pc_1180:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i64 @function_1183() local_unnamed_addr {
dec_label_pc_1183:
  %0 = call i64 @function_1100(), !insn.addr !24
  ret i64 %0, !insn.addr !24
}

define i64 @function_118c(i64 %arg1, i64 %arg2) local_unnamed_addr {
dec_label_pc_118c:
  %0 = call i64 @function_1080(), !insn.addr !25
  %1 = trunc i64 %0 to i32, !insn.addr !26
  %2 = and i64 %0, 4294967295, !insn.addr !27
  %3 = call i64 @function_1070(i64 %2, i64 %2, i32 %1, i32 %1), !insn.addr !28
  %4 = call i64 @function_11e0(), !insn.addr !29
  %5 = add i64 %arg2, 8, !insn.addr !30
  %6 = inttoptr i64 %5 to i64*, !insn.addr !31
  %7 = load i64, i64* %6, align 8, !insn.addr !31
  %8 = call i64 @function_1090(i64 %7, i64 %5), !insn.addr !32
  ret i64 0, !insn.addr !33
}

define i64 @function_11e0() local_unnamed_addr {
dec_label_pc_11e0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i64 @function_11e3() local_unnamed_addr {
dec_label_pc_11e3:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !34
}

define i64 @function_11f3(i64 %arg1, i64 %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_11f3:
  %rbx.0.reg2mem = alloca i64, !insn.addr !35
  %0 = call i64 @function_1000(), !insn.addr !36
  store i64 0, i64* %rbx.0.reg2mem, !insn.addr !37
  br i1 icmp eq (i64 ashr (i64 sub (i64 ptrtoint (i64* @global_var_3db0 to i64), i64 ptrtoint (i64* @global_var_3da8 to i64)), i64 3), i64 0), label %dec_label_pc_1246, label %dec_label_pc_1230, !insn.addr !37

dec_label_pc_1230:                                ; preds = %dec_label_pc_11f3, %dec_label_pc_1230
  %rbx.0.reload = load i64, i64* %rbx.0.reg2mem
  %1 = add i64 %rbx.0.reload, 1, !insn.addr !38
  %2 = icmp eq i64 %1, ashr (i64 sub (i64 ptrtoint (i64* @global_var_3db0 to i64), i64 ptrtoint (i64* @global_var_3da8 to i64)), i64 3), !insn.addr !39
  %3 = icmp eq i1 %2, false, !insn.addr !40
  store i64 %1, i64* %rbx.0.reg2mem, !insn.addr !40
  br i1 %3, label %dec_label_pc_1230, label %dec_label_pc_1246, !insn.addr !40

dec_label_pc_1246:                                ; preds = %dec_label_pc_1230, %dec_label_pc_11f3
  ret i64 %0, !insn.addr !41
}

define i64 @function_1263() local_unnamed_addr {
dec_label_pc_1263:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !42
}

define i64 @function_126b() local_unnamed_addr {
dec_label_pc_126b:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !43
}

declare i32 @setresgid(i32, i32, i32) local_unnamed_addr

declare i32 @getegid() local_unnamed_addr

declare i32 @execvp(i8*, [1 x i8*]) local_unnamed_addr

declare i32 @__libc_start_main(i64, i32, i8**, void ()*, void ()*, void ()*) local_unnamed_addr

declare void @__gmon_start__() local_unnamed_addr

declare void @__cxa_finalize(i64*) local_unnamed_addr

declare i64 @__asm_hlt() local_unnamed_addr

declare i64 @__decompiler_undefined_function_0() local_unnamed_addr

!0 = !{i64 4099}
!1 = !{i64 4104}
!2 = !{i64 4111}
!3 = !{i64 4114}
!4 = !{i64 4116}
!5 = !{i64 4122}
!6 = !{i64 4196}
!7 = !{i64 4212}
!8 = !{i64 4228}
!9 = !{i64 4244}
!10 = !{i64 4296}
!11 = !{i64 4302}
!12 = !{i64 4344}
!13 = !{i64 4408}
!14 = !{i64 4419}
!15 = !{i64 4420}
!16 = !{i64 4427}
!17 = !{i64 4430}
!18 = !{i64 4441}
!19 = !{i64 4443}
!20 = !{i64 4450}
!21 = !{i64 4460}
!22 = !{i64 4468}
!23 = !{i64 4472}
!24 = !{i64 4484}
!25 = !{i64 4508}
!26 = !{i64 4513}
!27 = !{i64 4525}
!28 = !{i64 4529}
!29 = !{i64 4534}
!30 = !{i64 4543}
!31 = !{i64 4555}
!32 = !{i64 4564}
!33 = !{i64 4575}
!34 = !{i64 4586}
!35 = !{i64 4595}
!36 = !{i64 4636}
!37 = !{i64 4645}
!38 = !{i64 4669}
!39 = !{i64 4673}
!40 = !{i64 4676}
!41 = !{i64 4692}
!42 = !{i64 4708}
!43 = !{i64 4724}
