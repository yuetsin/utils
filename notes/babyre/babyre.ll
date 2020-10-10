source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

%_IO_FILE = type { i32 }

@global_var_4040 = global i64 0
@global_var_3fd8 = local_unnamed_addr global i64 0
@global_var_2004 = constant [13 x i8] c"Input flag: \00"
@global_var_4020 = global i64 8535871092021886013
@global_var_2011 = constant [8 x i8] c"Correct\00"
@global_var_2019 = constant [6 x i8] c"Error\00"
@global_var_3d90 = global i64 4576
@global_var_3d98 = global i64 4512
@0 = external global i32
@global_var_4048 = local_unnamed_addr global i8 0

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

define i64 @function_1090(i64 %arg1) local_unnamed_addr {
dec_label_pc_1090:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define void @function_1093(i64* %d) local_unnamed_addr {
dec_label_pc_1093:
  call void @__cxa_finalize(i64* %d), !insn.addr !6
  ret void, !insn.addr !6
}

define i64 @function_10a0(i8* %arg1) local_unnamed_addr {
dec_label_pc_10a0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_10a3(i8* %s) local_unnamed_addr {
dec_label_pc_10a3:
  %0 = call i32 @puts(i8* %s), !insn.addr !7
  ret i32 %0, !insn.addr !7
}

define i64 @function_10b0(i64* %arg1) local_unnamed_addr {
dec_label_pc_10b0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_10b3(i8* %s) local_unnamed_addr {
dec_label_pc_10b3:
  %0 = call i32 @strlen(i8* %s), !insn.addr !8
  ret i32 %0, !insn.addr !8
}

define i64 @function_10c0() local_unnamed_addr {
dec_label_pc_10c0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define void @function_10c3() local_unnamed_addr {
dec_label_pc_10c3:
  call void @__stack_chk_fail(), !insn.addr !9
  ret void, !insn.addr !9
}

define i64 @function_10d0(i8* %arg1) local_unnamed_addr {
dec_label_pc_10d0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_10d3(i8* %format, ...) local_unnamed_addr {
dec_label_pc_10d3:
  %0 = call i32 (i8*, ...) @printf(i8* %format), !insn.addr !10
  ret i32 %0, !insn.addr !10
}

define i64 @function_10e0(i64* %arg1, i64* %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_10e0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i32 @function_10e3(i64* %s1, i64* %s2, i32 %n) local_unnamed_addr {
dec_label_pc_10e3:
  %0 = call i32 @memcmp(i64* %s1, i64* %s2, i32 %n), !insn.addr !11
  ret i32 %0, !insn.addr !11
}

define i64 @function_10f0(i64* %arg1, i64 %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_10f0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i8* @function_10f3(i8* %s, i32 %n, %_IO_FILE* %stream) local_unnamed_addr {
dec_label_pc_10f3:
  %0 = call i8* @fgets(i8* %s, i32 %n, %_IO_FILE* %stream), !insn.addr !12
  ret i8* %0, !insn.addr !12
}

define i64 @entry_point() local_unnamed_addr {
dec_label_pc_1100:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i64 @function_1103(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4) local_unnamed_addr {
dec_label_pc_1103:
  %stack_var_8 = alloca i64, align 8
  %0 = trunc i64 %arg4 to i32, !insn.addr !13
  %1 = bitcast i64* %stack_var_8 to i8**, !insn.addr !13
  %2 = inttoptr i64 %arg3 to void ()*, !insn.addr !13
  %3 = call i32 @__libc_start_main(i64 4585, i32 %0, i8** nonnull %1, void ()* inttoptr (i64 4848 to void ()*), void ()* inttoptr (i64 4960 to void ()*), void ()* %2), !insn.addr !13
  %4 = call i64 @__asm_hlt(), !insn.addr !14
  ret i64 ptrtoint (i64* @global_var_4040 to i64), !insn.addr !15
}

define i64 @function_1160() local_unnamed_addr {
dec_label_pc_1160:
  ret i64 0, !insn.addr !16
}

define i64 @function_11a3() local_unnamed_addr {
dec_label_pc_11a3:
  %rax.0.reg2mem = alloca i64, !insn.addr !17
  %0 = call i64 @__decompiler_undefined_function_0()
  %1 = load i8, i8* @global_var_4048, align 1, !insn.addr !18
  %2 = icmp eq i8 %1, 0, !insn.addr !18
  %3 = icmp eq i1 %2, false, !insn.addr !19
  br i1 %3, label %dec_label_pc_11d8, label %dec_label_pc_11ad, !insn.addr !19

dec_label_pc_11ad:                                ; preds = %dec_label_pc_11a3
  %4 = load i64, i64* inttoptr (i64 16376 to i64*), align 8, !insn.addr !20
  %5 = icmp eq i64 %4, 0, !insn.addr !20
  br i1 %5, label %dec_label_pc_11c7, label %dec_label_pc_11bb, !insn.addr !21

dec_label_pc_11bb:                                ; preds = %dec_label_pc_11ad
  %6 = load i64, i64* inttoptr (i64 16392 to i64*), align 8, !insn.addr !22
  %7 = call i64 @function_1090(i64 %6), !insn.addr !23
  store i64 %7, i64* %rax.0.reg2mem, !insn.addr !23
  br label %dec_label_pc_11c7, !insn.addr !23

dec_label_pc_11c7:                                ; preds = %dec_label_pc_11bb, %dec_label_pc_11ad
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  store i8 1, i8* @global_var_4048, align 1, !insn.addr !24
  ret i64 %rax.0.reload, !insn.addr !25

dec_label_pc_11d8:                                ; preds = %dec_label_pc_11a3
  ret i64 %0, !insn.addr !26
}

define i64 @function_11e0() local_unnamed_addr {
dec_label_pc_11e0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0
}

define i64 @function_11e3() local_unnamed_addr {
dec_label_pc_11e3:
  %0 = call i64 @function_1160(), !insn.addr !27
  ret i64 %0, !insn.addr !27
}

define i64 @function_11ec() local_unnamed_addr {
dec_label_pc_11ec:
  %rax.0.reg2mem = alloca i64, !insn.addr !28
  %indvars.iv.reg2mem = alloca i64, !insn.addr !28
  %stack_var_-96.0.reg2mem = alloca i32, !insn.addr !28
  %stack_var_-88 = alloca i64, align 8
  %stack_var_-8 = alloca i64, align 8
  %0 = call i64 @__readfsqword(i64 40), !insn.addr !29
  %1 = call i64 @function_10d0(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_var_2004, i64 0, i64 0)), !insn.addr !30
  %2 = load i64, i64* @global_var_4040, align 8, !insn.addr !31
  %3 = call i64 @function_10f0(i64* nonnull %stack_var_-88, i64 64, i64 %2), !insn.addr !32
  %4 = call i64 @function_10b0(i64* nonnull %stack_var_-88), !insn.addr !33
  %5 = trunc i64 %4 to i32, !insn.addr !34
  %6 = icmp slt i32 %5, 1, !insn.addr !35
  br i1 %6, label %dec_label_pc_12c1, label %dec_label_pc_1242, !insn.addr !35

dec_label_pc_1242:                                ; preds = %dec_label_pc_11ec
  %7 = ptrtoint i64* %stack_var_-8 to i64, !insn.addr !36
  %8 = add i32 %5, -1, !insn.addr !37
  %9 = sext i32 %8 to i64, !insn.addr !38
  %10 = add i64 %7, -80, !insn.addr !39
  %11 = add i64 %10, %9, !insn.addr !39
  %12 = inttoptr i64 %11 to i8*, !insn.addr !39
  %13 = load i8, i8* %12, align 1, !insn.addr !39
  %14 = icmp eq i8 %13, 10, !insn.addr !40
  %15 = icmp eq i1 %14, false, !insn.addr !41
  store i32 %5, i32* %stack_var_-96.0.reg2mem, !insn.addr !41
  br i1 %15, label %dec_label_pc_1261, label %dec_label_pc_1253, !insn.addr !41

dec_label_pc_1253:                                ; preds = %dec_label_pc_1242
  store i8 0, i8* %12, align 1, !insn.addr !42
  store i32 %8, i32* %stack_var_-96.0.reg2mem, !insn.addr !42
  br label %dec_label_pc_1261, !insn.addr !42

dec_label_pc_1261:                                ; preds = %dec_label_pc_1253, %dec_label_pc_1242
  %stack_var_-96.0.reload = load i32, i32* %stack_var_-96.0.reg2mem
  %16 = icmp eq i32 %stack_var_-96.0.reload, 32, !insn.addr !43
  %17 = icmp eq i1 %16, false, !insn.addr !44
  store i64 0, i64* %indvars.iv.reg2mem, !insn.addr !44
  br i1 %17, label %dec_label_pc_12c1, label %dec_label_pc_1270, !insn.addr !44

dec_label_pc_1270:                                ; preds = %dec_label_pc_1261, %dec_label_pc_1270
  %indvars.iv.reload = load i64, i64* %indvars.iv.reg2mem
  %18 = add i64 %indvars.iv.reload, %10, !insn.addr !45
  %19 = inttoptr i64 %18 to i8*, !insn.addr !45
  %20 = load i8, i8* %19, align 1, !insn.addr !45
  %21 = add i8 %20, 13, !insn.addr !46
  store i8 %21, i8* %19, align 1, !insn.addr !47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.reload, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  store i64 %indvars.iv.next, i64* %indvars.iv.reg2mem, !insn.addr !48
  br i1 %exitcond, label %dec_label_pc_1292, label %dec_label_pc_1270, !insn.addr !48

dec_label_pc_1292:                                ; preds = %dec_label_pc_1270
  %22 = call i64 @function_10e0(i64* nonnull %stack_var_-88, i64* nonnull @global_var_4020, i64 32), !insn.addr !49
  %23 = trunc i64 %22 to i32, !insn.addr !50
  %24 = icmp eq i32 %23, 0, !insn.addr !50
  %25 = icmp eq i1 %24, false, !insn.addr !51
  br i1 %25, label %dec_label_pc_12c1, label %dec_label_pc_12ae, !insn.addr !51

dec_label_pc_12ae:                                ; preds = %dec_label_pc_1292
  %26 = call i64 @function_10a0(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_2011, i64 0, i64 0)), !insn.addr !52
  br label %dec_label_pc_12d2, !insn.addr !53

dec_label_pc_12c1:                                ; preds = %dec_label_pc_1292, %dec_label_pc_1261, %dec_label_pc_11ec
  %27 = call i64 @function_10a0(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_var_2019, i64 0, i64 0)), !insn.addr !54
  br label %dec_label_pc_12d2, !insn.addr !55

dec_label_pc_12d2:                                ; preds = %dec_label_pc_12c1, %dec_label_pc_12ae
  %28 = call i64 @__readfsqword(i64 40), !insn.addr !56
  %29 = icmp eq i64 %0, %28, !insn.addr !56
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !57
  br i1 %29, label %dec_label_pc_12e6, label %dec_label_pc_12e1, !insn.addr !57

dec_label_pc_12e1:                                ; preds = %dec_label_pc_12d2
  %30 = call i64 @function_10c0(), !insn.addr !58
  store i64 %30, i64* %rax.0.reg2mem, !insn.addr !58
  br label %dec_label_pc_12e6, !insn.addr !58

dec_label_pc_12e6:                                ; preds = %dec_label_pc_12e1, %dec_label_pc_12d2
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !59
}

define i64 @function_12f3(i64 %arg1, i64 %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_12f3:
  %rbx.0.reg2mem = alloca i64, !insn.addr !60
  %0 = call i64 @function_1000(), !insn.addr !61
  store i64 0, i64* %rbx.0.reg2mem, !insn.addr !62
  br i1 icmp eq (i64 ashr (i64 sub (i64 ptrtoint (i64* @global_var_3d98 to i64), i64 ptrtoint (i64* @global_var_3d90 to i64)), i64 3), i64 0), label %dec_label_pc_1346, label %dec_label_pc_1330, !insn.addr !62

dec_label_pc_1330:                                ; preds = %dec_label_pc_12f3, %dec_label_pc_1330
  %rbx.0.reload = load i64, i64* %rbx.0.reg2mem
  %1 = add i64 %rbx.0.reload, 1, !insn.addr !63
  %2 = icmp eq i64 %1, ashr (i64 sub (i64 ptrtoint (i64* @global_var_3d98 to i64), i64 ptrtoint (i64* @global_var_3d90 to i64)), i64 3), !insn.addr !64
  %3 = icmp eq i1 %2, false, !insn.addr !65
  store i64 %1, i64* %rbx.0.reg2mem, !insn.addr !65
  br i1 %3, label %dec_label_pc_1330, label %dec_label_pc_1346, !insn.addr !65

dec_label_pc_1346:                                ; preds = %dec_label_pc_1330, %dec_label_pc_12f3
  ret i64 %0, !insn.addr !66
}

define i64 @function_1363() local_unnamed_addr {
dec_label_pc_1363:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !67
}

define i64 @function_136b() local_unnamed_addr {
dec_label_pc_136b:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !68
}

declare i32 @puts(i8*) local_unnamed_addr

declare i32 @strlen(i8*) local_unnamed_addr

declare void @__stack_chk_fail() local_unnamed_addr

declare i32 @printf(i8*, ...) local_unnamed_addr

declare i32 @memcmp(i64*, i64*, i32) local_unnamed_addr

declare i8* @fgets(i8*, i32, %_IO_FILE*) local_unnamed_addr

declare i32 @__libc_start_main(i64, i32, i8**, void ()*, void ()*, void ()*) local_unnamed_addr

declare void @__gmon_start__() local_unnamed_addr

declare void @__cxa_finalize(i64*) local_unnamed_addr

declare i64 @__asm_hlt() local_unnamed_addr

declare i64 @__readfsqword(i64) local_unnamed_addr

declare i64 @__decompiler_undefined_function_0() local_unnamed_addr

!0 = !{i64 4099}
!1 = !{i64 4104}
!2 = !{i64 4111}
!3 = !{i64 4114}
!4 = !{i64 4116}
!5 = !{i64 4122}
!6 = !{i64 4244}
!7 = !{i64 4260}
!8 = !{i64 4276}
!9 = !{i64 4292}
!10 = !{i64 4308}
!11 = !{i64 4324}
!12 = !{i64 4340}
!13 = !{i64 4392}
!14 = !{i64 4398}
!15 = !{i64 4440}
!16 = !{i64 4504}
!17 = !{i64 4515}
!18 = !{i64 4516}
!19 = !{i64 4523}
!20 = !{i64 4526}
!21 = !{i64 4537}
!22 = !{i64 4539}
!23 = !{i64 4546}
!24 = !{i64 4556}
!25 = !{i64 4564}
!26 = !{i64 4568}
!27 = !{i64 4580}
!28 = !{i64 4588}
!29 = !{i64 4597}
!30 = !{i64 4624}
!31 = !{i64 4629}
!32 = !{i64 4648}
!33 = !{i64 4660}
!34 = !{i64 4665}
!35 = !{i64 4672}
!36 = !{i64 4590}
!37 = !{i64 4677}
!38 = !{i64 4680}
!39 = !{i64 4682}
!40 = !{i64 4687}
!41 = !{i64 4689}
!42 = !{i64 4700}
!43 = !{i64 4705}
!44 = !{i64 4709}
!45 = !{i64 4725}
!46 = !{i64 4730}
!47 = !{i64 4740}
!48 = !{i64 4752}
!49 = !{i64 4773}
!50 = !{i64 4778}
!51 = !{i64 4780}
!52 = !{i64 4789}
!53 = !{i64 4799}
!54 = !{i64 4808}
!55 = !{i64 4813}
!56 = !{i64 4822}
!57 = !{i64 4831}
!58 = !{i64 4833}
!59 = !{i64 4839}
!60 = !{i64 4851}
!61 = !{i64 4892}
!62 = !{i64 4901}
!63 = !{i64 4925}
!64 = !{i64 4929}
!65 = !{i64 4932}
!66 = !{i64 4948}
!67 = !{i64 4964}
!68 = !{i64 4980}
