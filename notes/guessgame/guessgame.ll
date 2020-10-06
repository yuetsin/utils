source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

%_IO_FILE = type { i32 }

@global_var_201fd8 = local_unnamed_addr global i64 0
@global_var_202c68 = local_unnamed_addr global i64 0
@global_var_202c80 = local_unnamed_addr global i64 0
@global_var_1068 = constant [23 x i8] c"Welcome to Guess Game!\00"
@global_var_107f = constant [18 x i8] c"Input your guess:\00"
@global_var_1091 = constant [10 x i8] c"Wrong Len\00"
@global_var_109b = constant [12 x i8] c"Good Guess!\00"
@global_var_10a7 = constant [8 x i8] c"%dA%dB\0A\00"
@global_var_10b0 = constant [31 x i8] c"Thank you for playing the game\00"
@global_var_10cf = constant [28 x i8] c"Input the len of your name:\00"
@global_var_10eb = constant [17 x i8] c"Input your name:\00"
@global_var_10fc = constant [20 x i8] c"Input your comment:\00"
@global_var_1110 = constant [9 x i8] c"Bye! %s!\00"
@global_var_1119 = constant [30 x i8] c"Input the len of your answer:\00"
@global_var_700 = global i64* bitcast (%_IO_FILE** @global_var_202030 to i64*)
@global_var_1137 = constant [11 x i8] c"Wrong Len!\00"
@global_var_1142 = constant [19 x i8] c"Input your answer:\00"
@global_var_201d58 = global i64 2672
@global_var_201d60 = global i64 2608
@0 = external global i32
@global_var_202048 = local_unnamed_addr global i8 0
@global_var_202030 = global %_IO_FILE* null
@global_var_202020 = local_unnamed_addr global %_IO_FILE* null
@global_var_202040 = local_unnamed_addr global %_IO_FILE* null
@global_var_202c78 = external local_unnamed_addr global i8*
@global_var_202c60 = external local_unnamed_addr global i8*
@global_var_3fc = external global i8*
@global_var_202c70 = external local_unnamed_addr global i8*
@global_var_202c88 = external global i8*
@global_var_202560 = external global i8*

define i64 @function_868() local_unnamed_addr {
dec_label_pc_868:
  %rax.0.reg2mem = alloca i64, !insn.addr !0
  %0 = load i64, i64* inttoptr (i64 2105320 to i64*), align 8, !insn.addr !1
  %1 = icmp eq i64 %0, 0, !insn.addr !2
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !3
  br i1 %1, label %dec_label_pc_87a, label %dec_label_pc_878, !insn.addr !3

dec_label_pc_878:                                 ; preds = %dec_label_pc_868
  call void @__gmon_start__(), !insn.addr !4
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.0.reg2mem, !insn.addr !4
  br label %dec_label_pc_87a, !insn.addr !4

dec_label_pc_87a:                                 ; preds = %dec_label_pc_878, %dec_label_pc_868
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !5
}

define void @function_890(i32 %status) local_unnamed_addr {
dec_label_pc_890:
  call void @_exit(i32 %status), !insn.addr !6
  ret void, !insn.addr !6
}

define i8* @function_8a0(i8* %dest, i8* %src) local_unnamed_addr {
dec_label_pc_8a0:
  %0 = call i8* @strcpy(i8* %dest, i8* %src), !insn.addr !7
  ret i8* %0, !insn.addr !7
}

define i32 @function_8b0(i8* %s) local_unnamed_addr {
dec_label_pc_8b0:
  %0 = call i32 @puts(i8* %s), !insn.addr !8
  ret i32 %0, !insn.addr !8
}

define i32 @function_8c0(i8* %s) local_unnamed_addr {
dec_label_pc_8c0:
  %0 = call i32 @strlen(i8* %s), !insn.addr !9
  ret i32 %0, !insn.addr !9
}

define void @function_8d0() local_unnamed_addr {
dec_label_pc_8d0:
  call void @__stack_chk_fail(), !insn.addr !10
  ret void, !insn.addr !10
}

define i64* @function_8e0(i64* %addr, i32 %len, i32 %prot, i32 %flags, i32 %fd, i32 %offset) local_unnamed_addr {
dec_label_pc_8e0:
  %0 = call i64* @mmap(i64* %addr, i32 %len, i32 %prot, i32 %flags, i32 %fd, i32 %offset), !insn.addr !11
  ret i64* %0, !insn.addr !11
}

define void @function_8f0(%_IO_FILE* %stream, i8* %buf) local_unnamed_addr {
dec_label_pc_8f0:
  call void @setbuf(%_IO_FILE* %stream, i8* %buf), !insn.addr !12
  ret void, !insn.addr !12
}

define i32 @function_900(i8* %format, ...) local_unnamed_addr {
dec_label_pc_900:
  %0 = call i32 (i8*, ...) @printf(i8* %format), !insn.addr !13
  ret i32 %0, !insn.addr !13
}

define i64* @function_910(i64* %s, i32 %c, i32 %n) local_unnamed_addr {
dec_label_pc_910:
  %0 = call i64* @memset(i64* %s, i32 %c, i32 %n), !insn.addr !14
  ret i64* %0, !insn.addr !14
}

define i32 @function_920(i32 %seconds) local_unnamed_addr {
dec_label_pc_920:
  %0 = call i32 @alarm(i32 %seconds), !insn.addr !15
  ret i32 %0, !insn.addr !15
}

define i32 @function_930(i32 %fd, i64* %buf, i32 %nbytes) local_unnamed_addr {
dec_label_pc_930:
  %0 = call i32 @read(i32 %fd, i64* %buf, i32 %nbytes), !insn.addr !16
  ret i32 %0, !insn.addr !16
}

define i32 @function_940(i8* %nptr) local_unnamed_addr {
dec_label_pc_940:
  %0 = call i32 @atoi(i8* %nptr), !insn.addr !17
  ret i32 %0, !insn.addr !17
}

define void @function_950(i32 %status) local_unnamed_addr {
dec_label_pc_950:
  call void @exit(i32 %status), !insn.addr !18
  ret void, !insn.addr !18
}

define void @function_960(i64* %d) local_unnamed_addr {
dec_label_pc_960:
  call void @__cxa_finalize(i64* %d), !insn.addr !19
  ret void, !insn.addr !19
}

define i64 @entry_point(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4) local_unnamed_addr {
dec_label_pc_970:
  %stack_var_8 = alloca i64, align 8
  %0 = trunc i64 %arg4 to i32, !insn.addr !20
  %1 = bitcast i64* %stack_var_8 to i8**, !insn.addr !20
  %2 = inttoptr i64 %arg3 to void ()*, !insn.addr !20
  %3 = call i32 @__libc_start_main(i64 4018, i32 %0, i8** nonnull %1, void ()* inttoptr (i64 4064 to void ()*), void ()* inttoptr (i64 4176 to void ()*), void ()* %2), !insn.addr !20
  %4 = call i64 @__asm_hlt(), !insn.addr !21
  unreachable, !insn.addr !21
}

define i64 @function_9a0() local_unnamed_addr {
dec_label_pc_9a0:
  ret i64 2105360, !insn.addr !22
}

define i64 @function_9e0() local_unnamed_addr {
dec_label_pc_9e0:
  ret i64 0, !insn.addr !23
}

define i64 @function_a30() local_unnamed_addr {
dec_label_pc_a30:
  %0 = call i64 @__decompiler_undefined_function_0()
  %1 = load i8, i8* @global_var_202048, align 1, !insn.addr !24
  %2 = icmp eq i8 %1, 0, !insn.addr !24
  %3 = icmp eq i1 %2, false, !insn.addr !25
  br i1 %3, label %dec_label_pc_a68, label %dec_label_pc_a39, !insn.addr !25

dec_label_pc_a39:                                 ; preds = %dec_label_pc_a30
  %4 = load i64, i64* inttoptr (i64 2105336 to i64*), align 8, !insn.addr !26
  %5 = icmp eq i64 %4, 0, !insn.addr !26
  br i1 %5, label %dec_label_pc_a53, label %dec_label_pc_a47, !insn.addr !27

dec_label_pc_a47:                                 ; preds = %dec_label_pc_a39
  %6 = load i64, i64* inttoptr (i64 2105352 to i64*), align 8, !insn.addr !28
  %7 = inttoptr i64 %6 to i64*, !insn.addr !29
  call void @__cxa_finalize(i64* %7), !insn.addr !29
  br label %dec_label_pc_a53, !insn.addr !29

dec_label_pc_a53:                                 ; preds = %dec_label_pc_a47, %dec_label_pc_a39
  %8 = call i64 @function_9a0(), !insn.addr !30
  store i8 1, i8* @global_var_202048, align 1, !insn.addr !31
  ret i64 %8, !insn.addr !32

dec_label_pc_a68:                                 ; preds = %dec_label_pc_a30
  ret i64 %0, !insn.addr !33
}

define i64 @function_a70() local_unnamed_addr {
dec_label_pc_a70:
  %0 = call i64 @function_9e0(), !insn.addr !34
  ret i64 %0, !insn.addr !34
}

define i64 @function_a7a(i64 %arg1, i64 %arg2) local_unnamed_addr {
dec_label_pc_a7a:
  %0 = trunc i64 %arg1 to i32, !insn.addr !35
  %1 = trunc i64 %arg2 to i32, !insn.addr !36
  %2 = sub i32 %0, %1, !insn.addr !36
  %3 = xor i64 %arg2, %arg1
  %4 = trunc i64 %3 to i32, !insn.addr !36
  %5 = xor i32 %2, %0, !insn.addr !36
  %6 = and i32 %5, %4, !insn.addr !36
  %7 = icmp slt i32 %6, 0, !insn.addr !36
  %8 = icmp eq i32 %2, 0, !insn.addr !36
  %9 = icmp slt i32 %2, 0, !insn.addr !36
  %10 = icmp ne i1 %9, %7, !insn.addr !37
  %11 = or i1 %8, %10, !insn.addr !37
  %12 = select i1 %11, i64 %arg1, i64 %arg2, !insn.addr !37
  %13 = and i64 %12, 4294967295, !insn.addr !37
  ret i64 %13, !insn.addr !38
}

define i64 @function_a90() local_unnamed_addr {
dec_label_pc_a90:
  %0 = call i32 @alarm(i32 60), !insn.addr !39
  %1 = load %_IO_FILE*, %_IO_FILE** @global_var_202030, align 8, !insn.addr !40
  call void @setbuf(%_IO_FILE* %1, i8* null), !insn.addr !41
  %2 = load %_IO_FILE*, %_IO_FILE** @global_var_202020, align 8, !insn.addr !42
  call void @setbuf(%_IO_FILE* %2, i8* null), !insn.addr !43
  %3 = load %_IO_FILE*, %_IO_FILE** @global_var_202040, align 8, !insn.addr !44
  call void @setbuf(%_IO_FILE* %3, i8* null), !insn.addr !45
  %4 = call i64* @mmap(i64* null, i32 8192, i32 3, i32 34, i32 0, i32 0), !insn.addr !46
  %5 = ptrtoint i64* %4 to i64, !insn.addr !46
  store i64 %5, i64* @global_var_202c68, align 8, !insn.addr !47
  store i8* bitcast (i8** @global_var_3fc to i8*), i8** @global_var_202c60, align 8, !insn.addr !48
  store i8* bitcast (i8** @global_var_3fc to i8*), i8** @global_var_202c78, align 8, !insn.addr !49
  %6 = add i64 %5, 6144, !insn.addr !50
  %7 = inttoptr i64 %6 to i8*, !insn.addr !51
  store i8* %7, i8** @global_var_202c70, align 8, !insn.addr !51
  %8 = call i64* @mmap(i64* null, i32 4096, i32 3, i32 34, i32 0, i32 0), !insn.addr !52
  %9 = ptrtoint i64* %8 to i64, !insn.addr !52
  store i64 %9, i64* @global_var_202c80, align 8, !insn.addr !53
  %10 = call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @global_var_1068, i64 0, i64 0)), !insn.addr !54
  %11 = sext i32 %10 to i64, !insn.addr !54
  ret i64 %11, !insn.addr !55
}

define i64 @function_b7d(i64* %arg1, i64 %arg2) local_unnamed_addr {
dec_label_pc_b7d:
  %rax.0.reg2mem = alloca i64, !insn.addr !56
  %stack_var_-16.0.reg2mem = alloca i32, !insn.addr !56
  %0 = ptrtoint i64* %arg1 to i64
  %1 = trunc i64 %arg2 to i32, !insn.addr !57
  %2 = add i64 %0, -1
  store i32 0, i32* %stack_var_-16.0.reg2mem, !insn.addr !58
  br label %dec_label_pc_bef, !insn.addr !58

dec_label_pc_b95:                                 ; preds = %dec_label_pc_bef
  %3 = sub i32 %1, %stack_var_-16.0.reload, !insn.addr !59
  %4 = sext i32 %stack_var_-16.0.reload to i64, !insn.addr !60
  %5 = add i64 %4, %0, !insn.addr !61
  %6 = inttoptr i64 %5 to i64*, !insn.addr !62
  %7 = call i32 @read(i32 0, i64* %6, i32 %3), !insn.addr !62
  %8 = add i32 %7, %stack_var_-16.0.reload, !insn.addr !63
  %9 = sext i32 %8 to i64, !insn.addr !64
  %10 = add i64 %2, %9, !insn.addr !65
  %11 = inttoptr i64 %10 to i8*
  %12 = load i8, i8* %11, align 1, !insn.addr !66
  %13 = icmp eq i8 %12, 10, !insn.addr !67
  %14 = icmp eq i1 %13, false, !insn.addr !68
  store i32 %8, i32* %stack_var_-16.0.reg2mem, !insn.addr !68
  br i1 %14, label %dec_label_pc_bef, label %dec_label_pc_bda, !insn.addr !68

dec_label_pc_bda:                                 ; preds = %dec_label_pc_b95
  store i8 0, i8* %11, align 1, !insn.addr !69
  store i64 %10, i64* %rax.0.reg2mem, !insn.addr !70
  br label %dec_label_pc_bf7, !insn.addr !70

dec_label_pc_bef:                                 ; preds = %dec_label_pc_b95, %dec_label_pc_b7d
  %stack_var_-16.0.reload = load i32, i32* %stack_var_-16.0.reg2mem
  %15 = icmp slt i32 %stack_var_-16.0.reload, %1, !insn.addr !71
  br i1 %15, label %dec_label_pc_b95, label %dec_label_pc_bf7.loopexit, !insn.addr !71

dec_label_pc_bf7.loopexit:                        ; preds = %dec_label_pc_bef
  %16 = zext i32 %stack_var_-16.0.reload to i64, !insn.addr !72
  store i64 %16, i64* %rax.0.reg2mem
  br label %dec_label_pc_bf7

dec_label_pc_bf7:                                 ; preds = %dec_label_pc_bf7.loopexit, %dec_label_pc_bda
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !73
}

define i64 @function_bfa() local_unnamed_addr {
dec_label_pc_bfa:
  %rax.0.reg2mem = alloca i64, !insn.addr !74
  %stack_var_-40 = alloca i64, align 8
  %0 = call i64 @__readfsqword(i64 40), !insn.addr !75
  %1 = call i64 @function_b7d(i64* nonnull %stack_var_-40, i64 15), !insn.addr !76
  %2 = bitcast i64* %stack_var_-40 to i8*, !insn.addr !77
  %3 = call i32 @atoi(i8* nonnull %2), !insn.addr !77
  %4 = sext i32 %3 to i64, !insn.addr !77
  %5 = call i64 @__readfsqword(i64 40), !insn.addr !78
  %6 = icmp eq i64 %0, %5, !insn.addr !78
  store i64 %4, i64* %rax.0.reg2mem, !insn.addr !79
  br i1 %6, label %dec_label_pc_c42, label %dec_label_pc_c3d, !insn.addr !79

dec_label_pc_c3d:                                 ; preds = %dec_label_pc_bfa
  call void @__stack_chk_fail(), !insn.addr !80
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.0.reg2mem, !insn.addr !80
  br label %dec_label_pc_c42, !insn.addr !80

dec_label_pc_c42:                                 ; preds = %dec_label_pc_c3d, %dec_label_pc_bfa
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !81
}

define i64 @function_c44(i64 %arg1) local_unnamed_addr {
dec_label_pc_c44:
  %rax.0.reg2mem = alloca i64, !insn.addr !82
  %stack_var_-20.04.reg2mem = alloca i32, !insn.addr !82
  %indvars.iv.reg2mem = alloca i64, !insn.addr !82
  %stack_var_-24.1.lcssa.reg2mem = alloca i32, !insn.addr !82
  %stack_var_-24.16.reg2mem = alloca i32, !insn.addr !82
  %indvars.iv9.reg2mem = alloca i64, !insn.addr !82
  %.reg2mem = alloca i8*, !insn.addr !82
  %sext = mul i64 %arg1, 4294967296
  %0 = sdiv i64 %sext, 4294967296, !insn.addr !83
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @global_var_107f, i64 0, i64 0)), !insn.addr !84
  %2 = load i8*, i8** @global_var_202c78, align 8, !insn.addr !85
  %3 = and i64 %arg1, 4294967295, !insn.addr !86
  %4 = bitcast i8* %2 to i64*
  %5 = call i64 @function_b7d(i64* %4, i64 %3), !insn.addr !87
  %6 = load i8*, i8** @global_var_202c78, align 8, !insn.addr !88
  %7 = call i32 @strlen(i8* %6), !insn.addr !89
  %8 = sext i32 %7 to i64, !insn.addr !89
  %9 = icmp eq i64 %0, %8, !insn.addr !90
  br i1 %9, label %dec_label_pc_ca6, label %dec_label_pc_c90, !insn.addr !91

dec_label_pc_c90:                                 ; preds = %dec_label_pc_c44
  %10 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_var_1091, i64 0, i64 0)), !insn.addr !92
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !93
  br label %dec_label_pc_e63, !insn.addr !93

dec_label_pc_ca6:                                 ; preds = %dec_label_pc_c44
  %11 = load i8*, i8** @global_var_202c60, align 8, !insn.addr !94
  %12 = bitcast i8* %11 to i64*
  %13 = call i64* @memset(i64* %12, i32 0, i32 ptrtoint (i8** @global_var_3fc to i32)), !insn.addr !95
  %14 = load i64, i64* @global_var_202c68, align 8, !insn.addr !96
  %15 = inttoptr i64 %14 to i64*, !insn.addr !97
  %16 = call i64* @memset(i64* %15, i32 0, i32 ptrtoint (i8** @global_var_3fc to i32)), !insn.addr !97
  %17 = trunc i64 %0 to i32, !insn.addr !98
  %18 = icmp sgt i32 %17, 0, !insn.addr !99
  store i32 0, i32* %stack_var_-24.1.lcssa.reg2mem, !insn.addr !99
  br i1 %18, label %dec_label_pc_cf2.lr.ph, label %dec_label_pc_e21.preheader, !insn.addr !99

dec_label_pc_cf2.lr.ph:                           ; preds = %dec_label_pc_ca6
  %.pre = load i8*, i8** @global_var_202c78, align 8
  %wide.trip.count = and i64 %0, 4294967295
  store i8* %.pre, i8** %.reg2mem
  store i64 0, i64* %indvars.iv9.reg2mem
  store i32 0, i32* %stack_var_-24.16.reg2mem
  br label %dec_label_pc_cf2

dec_label_pc_cf2:                                 ; preds = %dec_label_pc_cf2, %dec_label_pc_cf2.lr.ph
  %stack_var_-24.16.reload = load i32, i32* %stack_var_-24.16.reg2mem
  %indvars.iv9.reload = load i64, i64* %indvars.iv9.reg2mem
  %.reload = load i8*, i8** %.reg2mem, !insn.addr !100
  %19 = load i64, i64* @global_var_202c68, align 8, !insn.addr !101
  %20 = ptrtoint i8* %.reload to i64, !insn.addr !100
  %21 = add i64 %indvars.iv9.reload, %20, !insn.addr !102
  %22 = inttoptr i64 %21 to i8*, !insn.addr !103
  %23 = load i8, i8* %22, align 1, !insn.addr !103
  %24 = zext i8 %23 to i64, !insn.addr !104
  %25 = mul i64 %24, 4, !insn.addr !105
  %26 = add i64 %19, -4, !insn.addr !106
  %27 = add i64 %26, %25, !insn.addr !107
  %28 = inttoptr i64 %27 to i32*, !insn.addr !108
  %29 = load i32, i32* %28, align 4, !insn.addr !108
  %30 = add i32 %29, 1, !insn.addr !109
  store i32 %30, i32* %28, align 4, !insn.addr !110
  %31 = load i8*, i8** @global_var_202c60, align 8, !insn.addr !111
  %32 = ptrtoint i8* %31 to i64, !insn.addr !111
  %33 = load i8*, i8** @global_var_202c70, align 8, !insn.addr !112
  %34 = ptrtoint i8* %33 to i64, !insn.addr !112
  %35 = add i64 %indvars.iv9.reload, %34, !insn.addr !113
  %36 = inttoptr i64 %35 to i8*, !insn.addr !114
  %37 = load i8, i8* %36, align 1, !insn.addr !114
  %38 = zext i8 %37 to i64, !insn.addr !115
  %39 = mul i64 %38, 4, !insn.addr !116
  %40 = add i64 %32, -4, !insn.addr !117
  %41 = add i64 %40, %39, !insn.addr !118
  %42 = inttoptr i64 %41 to i32*, !insn.addr !119
  %43 = load i32, i32* %42, align 4, !insn.addr !119
  %44 = add i32 %43, 1, !insn.addr !120
  store i32 %44, i32* %42, align 4, !insn.addr !121
  %45 = load i8*, i8** @global_var_202c78, align 8, !insn.addr !122
  %46 = ptrtoint i8* %45 to i64, !insn.addr !122
  %47 = add i64 %indvars.iv9.reload, %46, !insn.addr !123
  %48 = inttoptr i64 %47 to i8*, !insn.addr !124
  %49 = load i8, i8* %48, align 1, !insn.addr !124
  %50 = load i8*, i8** @global_var_202c70, align 8, !insn.addr !125
  %51 = ptrtoint i8* %50 to i64, !insn.addr !125
  %52 = add i64 %indvars.iv9.reload, %51, !insn.addr !126
  %53 = inttoptr i64 %52 to i8*, !insn.addr !127
  %54 = load i8, i8* %53, align 1, !insn.addr !127
  %55 = icmp eq i8 %49, %54, !insn.addr !128
  %56 = zext i1 %55 to i32
  %spec.select = add i32 %stack_var_-24.16.reload, %56
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9.reload, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, %wide.trip.count
  store i8* %45, i8** %.reg2mem, !insn.addr !99
  store i64 %indvars.iv.next10, i64* %indvars.iv9.reg2mem, !insn.addr !99
  store i32 %spec.select, i32* %stack_var_-24.16.reg2mem, !insn.addr !99
  store i32 %spec.select, i32* %stack_var_-24.1.lcssa.reg2mem, !insn.addr !99
  br i1 %exitcond11, label %dec_label_pc_e21.preheader, label %dec_label_pc_cf2, !insn.addr !99

dec_label_pc_e21.preheader:                       ; preds = %dec_label_pc_cf2, %dec_label_pc_ca6
  %stack_var_-24.1.lcssa.reload = load i32, i32* %stack_var_-24.1.lcssa.reg2mem
  store i64 0, i64* %indvars.iv.reg2mem
  store i32 0, i32* %stack_var_-20.04.reg2mem
  br label %dec_label_pc_de5

dec_label_pc_de5:                                 ; preds = %dec_label_pc_de5, %dec_label_pc_e21.preheader
  %stack_var_-20.04.reload = load i32, i32* %stack_var_-20.04.reg2mem
  %indvars.iv.reload = load i64, i64* %indvars.iv.reg2mem
  %57 = load i8*, i8** @global_var_202c60, align 8, !insn.addr !129
  %58 = ptrtoint i8* %57 to i64, !insn.addr !129
  %59 = mul i64 %indvars.iv.reload, 4, !insn.addr !130
  %60 = add i64 %59, %58, !insn.addr !131
  %61 = inttoptr i64 %60 to i32*, !insn.addr !132
  %62 = load i32, i32* %61, align 4, !insn.addr !132
  %63 = load i64, i64* @global_var_202c68, align 8, !insn.addr !133
  %64 = add i64 %63, %59, !insn.addr !134
  %65 = inttoptr i64 %64 to i32*, !insn.addr !135
  %66 = load i32, i32* %65, align 4, !insn.addr !135
  %67 = zext i32 %62 to i64, !insn.addr !136
  %68 = zext i32 %66 to i64, !insn.addr !137
  %69 = call i64 @function_a7a(i64 %68, i64 %67), !insn.addr !138
  %70 = trunc i64 %69 to i32, !insn.addr !139
  %71 = add i32 %stack_var_-20.04.reload, %70, !insn.addr !139
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.reload, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 254
  store i64 %indvars.iv.next, i64* %indvars.iv.reg2mem, !insn.addr !140
  store i32 %71, i32* %stack_var_-20.04.reg2mem, !insn.addr !140
  br i1 %exitcond, label %dec_label_pc_e2a, label %dec_label_pc_de5, !insn.addr !140

dec_label_pc_e2a:                                 ; preds = %dec_label_pc_de5
  %72 = icmp eq i32 %stack_var_-24.1.lcssa.reload, %17, !insn.addr !141
  %73 = icmp eq i1 %72, false, !insn.addr !142
  br i1 %73, label %dec_label_pc_e45, label %dec_label_pc_e32, !insn.addr !142

dec_label_pc_e32:                                 ; preds = %dec_label_pc_e2a
  %74 = call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_var_109b, i64 0, i64 0)), !insn.addr !143
  store i64 1, i64* %rax.0.reg2mem, !insn.addr !144
  br label %dec_label_pc_e63, !insn.addr !144

dec_label_pc_e45:                                 ; preds = %dec_label_pc_e2a
  %75 = zext i32 %71 to i64, !insn.addr !145
  %76 = zext i32 %stack_var_-24.1.lcssa.reload to i64, !insn.addr !146
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_10a7, i64 0, i64 0), i64 %76, i64 %75), !insn.addr !147
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !148
  br label %dec_label_pc_e63, !insn.addr !148

dec_label_pc_e63:                                 ; preds = %dec_label_pc_e45, %dec_label_pc_e32, %dec_label_pc_c90
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !149
}

define i64 @function_e65() local_unnamed_addr {
dec_label_pc_e65:
  %0 = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @global_var_10b0, i64 0, i64 0)), !insn.addr !150
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @global_var_10cf, i64 0, i64 0)), !insn.addr !151
  %2 = call i64 @function_bfa(), !insn.addr !152
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @global_var_10eb, i64 0, i64 0)), !insn.addr !153
  %4 = and i64 %2, 4294967295, !insn.addr !154
  %5 = call i64 @function_b7d(i64* bitcast (i8** @global_var_202c88 to i64*), i64 %4), !insn.addr !155
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_var_10fc, i64 0, i64 0)), !insn.addr !156
  %7 = load i64, i64* @global_var_202c80, align 8, !insn.addr !157
  %8 = inttoptr i64 %7 to i64*, !insn.addr !158
  %9 = call i64 @function_b7d(i64* %8, i64 4096), !insn.addr !158
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @global_var_1110, i64 0, i64 0), i8* bitcast (i8** @global_var_202c88 to i8*)), !insn.addr !159
  %11 = sext i32 %10 to i64, !insn.addr !159
  ret i64 %11, !insn.addr !160
}

define i64 @function_ef9() local_unnamed_addr {
dec_label_pc_ef9:
  %storemerge2.reg2mem = alloca i32, !insn.addr !161
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @global_var_1119, i64 0, i64 0)), !insn.addr !162
  %1 = call i64 @function_bfa(), !insn.addr !163
  %2 = trunc i64 %1 to i32, !insn.addr !164
  %3 = icmp slt i32 %2, 0, !insn.addr !165
  %4 = icmp sgt i32 %2, ptrtoint (i64** @global_var_700 to i32), !insn.addr !166
  %or.cond = or i1 %3, %4
  br i1 %or.cond, label %dec_label_pc_f2e, label %dec_label_pc_f44, !insn.addr !167

dec_label_pc_f2e:                                 ; preds = %dec_label_pc_ef9
  %5 = call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_var_1137, i64 0, i64 0)), !insn.addr !168
  call void @exit(i32 -1), !insn.addr !169
  unreachable, !insn.addr !169

dec_label_pc_f44:                                 ; preds = %dec_label_pc_ef9
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_var_1142, i64 0, i64 0)), !insn.addr !170
  %7 = and i64 %1, 4294967295, !insn.addr !171
  %8 = call i64 @function_b7d(i64* bitcast (i8** @global_var_202560 to i64*), i64 %7), !insn.addr !172
  %9 = load i8*, i8** @global_var_202c70, align 8, !insn.addr !173
  %10 = call i8* @strcpy(i8* %9, i8* bitcast (i8** @global_var_202560 to i8*)), !insn.addr !174
  store i32 0, i32* %storemerge2.reg2mem
  br label %dec_label_pc_f85

dec_label_pc_f85:                                 ; preds = %dec_label_pc_f85, %dec_label_pc_f44
  %storemerge2.reload = load i32, i32* %storemerge2.reg2mem
  %11 = load i8*, i8** @global_var_202c70, align 8, !insn.addr !175
  %12 = call i32 @strlen(i8* %11), !insn.addr !176
  %13 = zext i32 %12 to i64, !insn.addr !177
  %14 = call i64 @function_c44(i64 %13), !insn.addr !178
  %15 = trunc i64 %14 to i32, !insn.addr !179
  %16 = icmp eq i32 %15, 0, !insn.addr !179
  %17 = add nuw nsw i32 %storemerge2.reload, 1, !insn.addr !180
  %18 = icmp ult i32 %17, 300, !insn.addr !181
  %or.cond3 = icmp eq i1 %18, %16
  store i32 %17, i32* %storemerge2.reg2mem, !insn.addr !182
  br i1 %or.cond3, label %dec_label_pc_f85, label %dec_label_pc_faf, !insn.addr !182

dec_label_pc_faf:                                 ; preds = %dec_label_pc_f85
  ret i64 %14, !insn.addr !183
}

define i64 @function_fb2() local_unnamed_addr {
dec_label_pc_fb2:
  %0 = call i64 @function_a90(), !insn.addr !184
  %1 = call i64 @function_ef9(), !insn.addr !185
  %2 = call i64 @function_e65(), !insn.addr !186
  call void @_exit(i32 0), !insn.addr !187
  unreachable, !insn.addr !187
}

define i64 @function_fe0(i64 %arg1, i64 %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_fe0:
  %rbx.0.reg2mem = alloca i64, !insn.addr !188
  %0 = call i64 @function_868(), !insn.addr !189
  store i64 0, i64* %rbx.0.reg2mem, !insn.addr !190
  br i1 icmp eq (i64 ashr (i64 sub (i64 ptrtoint (i64* @global_var_201d60 to i64), i64 ptrtoint (i64* @global_var_201d58 to i64)), i64 3), i64 0), label %dec_label_pc_1036, label %dec_label_pc_1020, !insn.addr !190

dec_label_pc_1020:                                ; preds = %dec_label_pc_fe0, %dec_label_pc_1020
  %rbx.0.reload = load i64, i64* %rbx.0.reg2mem
  %1 = add i64 %rbx.0.reload, 1, !insn.addr !191
  %2 = icmp eq i64 %1, ashr (i64 sub (i64 ptrtoint (i64* @global_var_201d60 to i64), i64 ptrtoint (i64* @global_var_201d58 to i64)), i64 3), !insn.addr !192
  %3 = icmp eq i1 %2, false, !insn.addr !193
  store i64 %1, i64* %rbx.0.reg2mem, !insn.addr !193
  br i1 %3, label %dec_label_pc_1020, label %dec_label_pc_1036, !insn.addr !193

dec_label_pc_1036:                                ; preds = %dec_label_pc_1020, %dec_label_pc_fe0
  ret i64 %0, !insn.addr !194
}

define i64 @function_1050() local_unnamed_addr {
dec_label_pc_1050:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !195
}

define i64 @function_1054() local_unnamed_addr {
dec_label_pc_1054:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !196
}

declare void @_exit(i32) local_unnamed_addr

declare i8* @strcpy(i8*, i8*) local_unnamed_addr

declare i32 @puts(i8*) local_unnamed_addr

declare i32 @strlen(i8*) local_unnamed_addr

declare void @__stack_chk_fail() local_unnamed_addr

declare i64* @mmap(i64*, i32, i32, i32, i32, i32) local_unnamed_addr

declare void @setbuf(%_IO_FILE*, i8*) local_unnamed_addr

declare i32 @printf(i8*, ...) local_unnamed_addr

declare i64* @memset(i64*, i32, i32) local_unnamed_addr

declare i32 @alarm(i32) local_unnamed_addr

declare i32 @read(i32, i64*, i32) local_unnamed_addr

declare i32 @atoi(i8*) local_unnamed_addr

declare void @exit(i32) local_unnamed_addr

declare i32 @__libc_start_main(i64, i32, i8**, void ()*, void ()*, void ()*) local_unnamed_addr

declare void @__gmon_start__() local_unnamed_addr

declare void @__cxa_finalize(i64*) local_unnamed_addr

declare i64 @__asm_hlt() local_unnamed_addr

declare i64 @__readfsqword(i64) local_unnamed_addr

declare i64 @__decompiler_undefined_function_0() local_unnamed_addr

!0 = !{i64 2152}
!1 = !{i64 2156}
!2 = !{i64 2163}
!3 = !{i64 2166}
!4 = !{i64 2168}
!5 = !{i64 2174}
!6 = !{i64 2192}
!7 = !{i64 2208}
!8 = !{i64 2224}
!9 = !{i64 2240}
!10 = !{i64 2256}
!11 = !{i64 2272}
!12 = !{i64 2288}
!13 = !{i64 2304}
!14 = !{i64 2320}
!15 = !{i64 2336}
!16 = !{i64 2352}
!17 = !{i64 2368}
!18 = !{i64 2384}
!19 = !{i64 2400}
!20 = !{i64 2452}
!21 = !{i64 2458}
!22 = !{i64 2513}
!23 = !{i64 2593}
!24 = !{i64 2608}
!25 = !{i64 2615}
!26 = !{i64 2617}
!27 = !{i64 2629}
!28 = !{i64 2631}
!29 = !{i64 2638}
!30 = !{i64 2643}
!31 = !{i64 2648}
!32 = !{i64 2656}
!33 = !{i64 2664}
!34 = !{i64 2677}
!35 = !{i64 2686}
!36 = !{i64 2695}
!37 = !{i64 2698}
!38 = !{i64 2703}
!39 = !{i64 2713}
!40 = !{i64 2718}
!41 = !{i64 2733}
!42 = !{i64 2738}
!43 = !{i64 2753}
!44 = !{i64 2758}
!45 = !{i64 2773}
!46 = !{i64 2810}
!47 = !{i64 2815}
!48 = !{i64 2835}
!49 = !{i64 2855}
!50 = !{i64 2869}
!51 = !{i64 2875}
!52 = !{i64 2914}
!53 = !{i64 2919}
!54 = !{i64 2933}
!55 = !{i64 2940}
!56 = !{i64 2941}
!57 = !{i64 3058}
!58 = !{i64 2963}
!59 = !{i64 2968}
!60 = !{i64 2976}
!61 = !{i64 2983}
!62 = !{i64 2997}
!63 = !{i64 3008}
!64 = !{i64 3014}
!65 = !{i64 3024}
!66 = !{i64 3027}
!67 = !{i64 3030}
!68 = !{i64 3032}
!69 = !{i64 3050}
!70 = !{i64 3053}
!71 = !{i64 3061}
!72 = !{i64 3055}
!73 = !{i64 3065}
!74 = !{i64 3066}
!75 = !{i64 3074}
!76 = !{i64 3101}
!77 = !{i64 3113}
!78 = !{i64 3122}
!79 = !{i64 3131}
!80 = !{i64 3133}
!81 = !{i64 3139}
!82 = !{i64 3140}
!83 = !{i64 3148}
!84 = !{i64 3163}
!85 = !{i64 3168}
!86 = !{i64 3178}
!87 = !{i64 3183}
!88 = !{i64 3188}
!89 = !{i64 3198}
!90 = !{i64 3211}
!91 = !{i64 3214}
!92 = !{i64 3223}
!93 = !{i64 3233}
!94 = !{i64 3238}
!95 = !{i64 3258}
!96 = !{i64 3263}
!97 = !{i64 3283}
!98 = !{i64 3539}
!99 = !{i64 3542}
!100 = !{i64 3321}
!101 = !{i64 3314}
!102 = !{i64 3334}
!103 = !{i64 3337}
!104 = !{i64 3340}
!105 = !{i64 3343}
!106 = !{i64 3347}
!107 = !{i64 3351}
!108 = !{i64 3354}
!109 = !{i64 3396}
!110 = !{i64 3399}
!111 = !{i64 3401}
!112 = !{i64 3408}
!113 = !{i64 3421}
!114 = !{i64 3424}
!115 = !{i64 3427}
!116 = !{i64 3430}
!117 = !{i64 3434}
!118 = !{i64 3438}
!119 = !{i64 3441}
!120 = !{i64 3483}
!121 = !{i64 3486}
!122 = !{i64 3488}
!123 = !{i64 3500}
!124 = !{i64 3503}
!125 = !{i64 3506}
!126 = !{i64 3518}
!127 = !{i64 3521}
!128 = !{i64 3524}
!129 = !{i64 3557}
!130 = !{i64 3570}
!131 = !{i64 3574}
!132 = !{i64 3577}
!133 = !{i64 3579}
!134 = !{i64 3596}
!135 = !{i64 3599}
!136 = !{i64 3601}
!137 = !{i64 3603}
!138 = !{i64 3605}
!139 = !{i64 3610}
!140 = !{i64 3624}
!141 = !{i64 3629}
!142 = !{i64 3632}
!143 = !{i64 3641}
!144 = !{i64 3651}
!145 = !{i64 3653}
!146 = !{i64 3659}
!147 = !{i64 3673}
!148 = !{i64 3678}
!149 = !{i64 3684}
!150 = !{i64 3700}
!151 = !{i64 3717}
!152 = !{i64 3727}
!153 = !{i64 3747}
!154 = !{i64 3755}
!155 = !{i64 3764}
!156 = !{i64 3781}
!157 = !{i64 3786}
!158 = !{i64 3801}
!159 = !{i64 3825}
!160 = !{i64 3832}
!161 = !{i64 3833}
!162 = !{i64 3853}
!163 = !{i64 3863}
!164 = !{i64 3868}
!165 = !{i64 3871}
!166 = !{i64 3884}
!167 = !{i64 3875}
!168 = !{i64 3893}
!169 = !{i64 3903}
!170 = !{i64 3920}
!171 = !{i64 3928}
!172 = !{i64 3937}
!173 = !{i64 3942}
!174 = !{i64 3959}
!175 = !{i64 3973}
!176 = !{i64 3983}
!177 = !{i64 3988}
!178 = !{i64 3990}
!179 = !{i64 3995}
!180 = !{i64 3999}
!181 = !{i64 4010}
!182 = !{i64 3997}
!183 = !{i64 4017}
!184 = !{i64 4027}
!185 = !{i64 4037}
!186 = !{i64 4047}
!187 = !{i64 4057}
!188 = !{i64 4064}
!189 = !{i64 4108}
!190 = !{i64 4116}
!191 = !{i64 4141}
!192 = !{i64 4145}
!193 = !{i64 4148}
!194 = !{i64 4164}
!195 = !{i64 4176}
!196 = !{i64 4188}
