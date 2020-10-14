source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

%_IO_FILE = type { i32 }

@global_var_200fd8 = local_unnamed_addr global i64 0
@global_var_ae8 = constant [42 x i8] c"Do you know how 0x%llx stored in memory?\0A\00"
@global_var_b12 = constant [10 x i8] c"Good job!\00"
@global_var_b1c = constant [8 x i8] c"/bin/sh\00"
@global_var_b24 = constant [15 x i8] c"You are wrong!\00"
@global_var_200d78 = global i64 2384
@global_var_200d80 = global i64 2320
@0 = external global i32
@global_var_201048 = local_unnamed_addr global i8 0
@global_var_201030 = local_unnamed_addr global %_IO_FILE* null
@global_var_201020 = local_unnamed_addr global %_IO_FILE* null
@global_var_201040 = local_unnamed_addr global %_IO_FILE* null

define i64 @_init() local_unnamed_addr {
dec_label_pc_788:
  %rax.0.reg2mem = alloca i64, !insn.addr !0
  %0 = load i64, i64* inttoptr (i64 2101224 to i64*), align 8, !insn.addr !1
  %1 = icmp eq i64 %0, 0, !insn.addr !2
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !3
  br i1 %1, label %dec_label_pc_79a, label %dec_label_pc_798, !insn.addr !3

dec_label_pc_798:                                 ; preds = %dec_label_pc_788
  call void @__gmon_start__(), !insn.addr !4
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.0.reg2mem, !insn.addr !4
  br label %dec_label_pc_79a, !insn.addr !4

dec_label_pc_79a:                                 ; preds = %dec_label_pc_798, %dec_label_pc_788
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !5
}

define i32 @function_7b0(i8* %s) local_unnamed_addr {
dec_label_pc_7b0:
  %0 = call i32 @puts(i8* %s), !insn.addr !6
  ret i32 %0, !insn.addr !6
}

define void @function_7c0() local_unnamed_addr {
dec_label_pc_7c0:
  call void @__stack_chk_fail(), !insn.addr !7
  ret void, !insn.addr !7
}

define void @function_7d0(%_IO_FILE* %stream, i8* %buf) local_unnamed_addr {
dec_label_pc_7d0:
  call void @setbuf(%_IO_FILE* %stream, i8* %buf), !insn.addr !8
  ret void, !insn.addr !8
}

define i32 @function_7e0(i8* %command) local_unnamed_addr {
dec_label_pc_7e0:
  %0 = call i32 @system(i8* %command), !insn.addr !9
  ret i32 %0, !insn.addr !9
}

define i32 @function_7f0(i8* %format, ...) local_unnamed_addr {
dec_label_pc_7f0:
  %0 = call i32 (i8*, ...) @printf(i8* %format), !insn.addr !10
  ret i32 %0, !insn.addr !10
}

define i32 @function_800(i32 %fd, i64* %buf, i32 %nbytes) local_unnamed_addr {
dec_label_pc_800:
  %0 = call i32 @read(i32 %fd, i64* %buf, i32 %nbytes), !insn.addr !11
  ret i32 %0, !insn.addr !11
}

define void @function_810(i32 %seed) local_unnamed_addr {
dec_label_pc_810:
  call void @srand(i32 %seed), !insn.addr !12
  ret void, !insn.addr !12
}

define i32 @function_820(i32* %timer) local_unnamed_addr {
dec_label_pc_820:
  %0 = call i32 @time(i32* %timer), !insn.addr !13
  ret i32 %0, !insn.addr !13
}

define i32 @function_830() local_unnamed_addr {
dec_label_pc_830:
  %0 = call i32 @rand(), !insn.addr !14
  ret i32 %0, !insn.addr !14
}

define void @function_840(i64* %d) local_unnamed_addr {
dec_label_pc_840:
  call void @__cxa_finalize(i64* %d), !insn.addr !15
  ret void, !insn.addr !15
}

define i64 @_start(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4) local_unnamed_addr {
dec_label_pc_850:
  %stack_var_8 = alloca i64, align 8
  %0 = trunc i64 %arg4 to i32, !insn.addr !16
  %1 = bitcast i64* %stack_var_8 to i8**, !insn.addr !16
  %2 = inttoptr i64 %arg3 to void ()*, !insn.addr !16
  %3 = call i32 @__libc_start_main(i64 2394, i32 %0, i8** nonnull %1, void ()* inttoptr (i64 2656 to void ()*), void ()* inttoptr (i64 2768 to void ()*), void ()* %2), !insn.addr !16
  %4 = call i64 @__asm_hlt(), !insn.addr !17
  unreachable, !insn.addr !17
}

define i64 @deregister_tm_clones() local_unnamed_addr {
dec_label_pc_880:
  ret i64 2101264, !insn.addr !18
}

define i64 @register_tm_clones() local_unnamed_addr {
dec_label_pc_8c0:
  ret i64 0, !insn.addr !19
}

define i64 @__do_global_dtors_aux() local_unnamed_addr {
dec_label_pc_910:
  %0 = call i64 @__decompiler_undefined_function_0()
  %1 = load i8, i8* @global_var_201048, align 1, !insn.addr !20
  %2 = icmp eq i8 %1, 0, !insn.addr !20
  %3 = icmp eq i1 %2, false, !insn.addr !21
  br i1 %3, label %dec_label_pc_948, label %dec_label_pc_919, !insn.addr !21

dec_label_pc_919:                                 ; preds = %dec_label_pc_910
  %4 = load i64, i64* inttoptr (i64 2101240 to i64*), align 8, !insn.addr !22
  %5 = icmp eq i64 %4, 0, !insn.addr !22
  br i1 %5, label %dec_label_pc_933, label %dec_label_pc_927, !insn.addr !23

dec_label_pc_927:                                 ; preds = %dec_label_pc_919
  %6 = load i64, i64* inttoptr (i64 2101256 to i64*), align 8, !insn.addr !24
  %7 = inttoptr i64 %6 to i64*, !insn.addr !25
  call void @__cxa_finalize(i64* %7), !insn.addr !25
  br label %dec_label_pc_933, !insn.addr !25

dec_label_pc_933:                                 ; preds = %dec_label_pc_927, %dec_label_pc_919
  %8 = call i64 @deregister_tm_clones(), !insn.addr !26
  store i8 1, i8* @global_var_201048, align 1, !insn.addr !27
  ret i64 %8, !insn.addr !28

dec_label_pc_948:                                 ; preds = %dec_label_pc_910
  ret i64 %0, !insn.addr !29
}

define i64 @frame_dummy() local_unnamed_addr {
dec_label_pc_950:
  %0 = call i64 @register_tm_clones(), !insn.addr !30
  ret i64 %0, !insn.addr !30
}

define i64 @main(i64 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_95a:
  %rax.0.reg2mem = alloca i64, !insn.addr !31
  %stack_var_-32 = alloca i64, align 8
  %0 = call i64 @__readfsqword(i64 40), !insn.addr !32
  %1 = load %_IO_FILE*, %_IO_FILE** @global_var_201030, align 8, !insn.addr !33
  call void @setbuf(%_IO_FILE* %1, i8* null), !insn.addr !34
  %2 = load %_IO_FILE*, %_IO_FILE** @global_var_201020, align 8, !insn.addr !35
  call void @setbuf(%_IO_FILE* %2, i8* null), !insn.addr !36
  %3 = load %_IO_FILE*, %_IO_FILE** @global_var_201040, align 8, !insn.addr !37
  call void @setbuf(%_IO_FILE* %3, i8* null), !insn.addr !38
  %4 = call i32 @time(i32* null), !insn.addr !39
  %5 = add i32 %4, 4660, !insn.addr !40
  call void @srand(i32 %5), !insn.addr !41
  %6 = call i32 @rand(), !insn.addr !42
  %7 = zext i32 %6 to i64
  %8 = mul i64 %7, 4294967296, !insn.addr !43
  %9 = call i32 @rand(), !insn.addr !44
  %10 = sext i32 %9 to i64, !insn.addr !45
  %11 = add i64 %8, %10, !insn.addr !46
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @global_var_ae8, i64 0, i64 0), i64 %11), !insn.addr !47
  store i64 0, i64* %stack_var_-32, align 8, !insn.addr !48
  %13 = call i32 @read(i32 0, i64* nonnull %stack_var_-32, i32 8), !insn.addr !49
  %14 = load i64, i64* %stack_var_-32, align 8, !insn.addr !50
  %15 = icmp eq i64 %11, %14, !insn.addr !51
  %16 = icmp eq i1 %15, false, !insn.addr !52
  br i1 %16, label %dec_label_pc_a35, label %dec_label_pc_a1d, !insn.addr !52

dec_label_pc_a1d:                                 ; preds = %dec_label_pc_95a
  %17 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_var_b12, i64 0, i64 0)), !insn.addr !53
  %18 = call i32 @system(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_b1c, i64 0, i64 0)), !insn.addr !54
  br label %dec_label_pc_a35, !insn.addr !54

dec_label_pc_a35:                                 ; preds = %dec_label_pc_a1d, %dec_label_pc_95a
  %19 = call i32 @puts(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_var_b24, i64 0, i64 0)), !insn.addr !55
  %20 = call i64 @__readfsqword(i64 40), !insn.addr !56
  %21 = icmp eq i64 %0, %20, !insn.addr !56
  store i64 0, i64* %rax.0.reg2mem, !insn.addr !57
  br i1 %21, label %dec_label_pc_a5a, label %dec_label_pc_a55, !insn.addr !57

dec_label_pc_a55:                                 ; preds = %dec_label_pc_a35
  call void @__stack_chk_fail(), !insn.addr !58
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.0.reg2mem, !insn.addr !58
  br label %dec_label_pc_a5a, !insn.addr !58

dec_label_pc_a5a:                                 ; preds = %dec_label_pc_a55, %dec_label_pc_a35
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !59
}

define i64 @__libc_csu_init(i64 %arg1, i64 %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_a60:
  %rbx.0.reg2mem = alloca i64, !insn.addr !60
  %0 = call i64 @_init(), !insn.addr !61
  store i64 0, i64* %rbx.0.reg2mem, !insn.addr !62
  br i1 icmp eq (i64 ashr (i64 sub (i64 ptrtoint (i64* @global_var_200d80 to i64), i64 ptrtoint (i64* @global_var_200d78 to i64)), i64 3), i64 0), label %dec_label_pc_ab6, label %dec_label_pc_aa0, !insn.addr !62

dec_label_pc_aa0:                                 ; preds = %dec_label_pc_a60, %dec_label_pc_aa0
  %rbx.0.reload = load i64, i64* %rbx.0.reg2mem
  %1 = add i64 %rbx.0.reload, 1, !insn.addr !63
  %2 = icmp eq i64 %1, ashr (i64 sub (i64 ptrtoint (i64* @global_var_200d80 to i64), i64 ptrtoint (i64* @global_var_200d78 to i64)), i64 3), !insn.addr !64
  %3 = icmp eq i1 %2, false, !insn.addr !65
  store i64 %1, i64* %rbx.0.reg2mem, !insn.addr !65
  br i1 %3, label %dec_label_pc_aa0, label %dec_label_pc_ab6, !insn.addr !65

dec_label_pc_ab6:                                 ; preds = %dec_label_pc_aa0, %dec_label_pc_a60
  ret i64 %0, !insn.addr !66
}

define i64 @__libc_csu_fini() local_unnamed_addr {
dec_label_pc_ad0:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !67
}

define i64 @_fini() local_unnamed_addr {
dec_label_pc_ad4:
  %0 = call i64 @__decompiler_undefined_function_0()
  ret i64 %0, !insn.addr !68
}

declare i32 @puts(i8*) local_unnamed_addr

declare void @__stack_chk_fail() local_unnamed_addr

declare void @setbuf(%_IO_FILE*, i8*) local_unnamed_addr

declare i32 @system(i8*) local_unnamed_addr

declare i32 @printf(i8*, ...) local_unnamed_addr

declare i32 @read(i32, i64*, i32) local_unnamed_addr

declare void @srand(i32) local_unnamed_addr

declare i32 @time(i32*) local_unnamed_addr

declare i32 @rand() local_unnamed_addr

declare i32 @__libc_start_main(i64, i32, i8**, void ()*, void ()*, void ()*) local_unnamed_addr

declare void @__gmon_start__() local_unnamed_addr

declare void @__cxa_finalize(i64*) local_unnamed_addr

declare i64 @__asm_hlt() local_unnamed_addr

declare i64 @__readfsqword(i64) local_unnamed_addr

declare i64 @__decompiler_undefined_function_0() local_unnamed_addr

!0 = !{i64 1928}
!1 = !{i64 1932}
!2 = !{i64 1939}
!3 = !{i64 1942}
!4 = !{i64 1944}
!5 = !{i64 1950}
!6 = !{i64 1968}
!7 = !{i64 1984}
!8 = !{i64 2000}
!9 = !{i64 2016}
!10 = !{i64 2032}
!11 = !{i64 2048}
!12 = !{i64 2064}
!13 = !{i64 2080}
!14 = !{i64 2096}
!15 = !{i64 2112}
!16 = !{i64 2164}
!17 = !{i64 2170}
!18 = !{i64 2225}
!19 = !{i64 2305}
!20 = !{i64 2320}
!21 = !{i64 2327}
!22 = !{i64 2329}
!23 = !{i64 2341}
!24 = !{i64 2343}
!25 = !{i64 2350}
!26 = !{i64 2355}
!27 = !{i64 2360}
!28 = !{i64 2368}
!29 = !{i64 2376}
!30 = !{i64 2389}
!31 = !{i64 2394}
!32 = !{i64 2402}
!33 = !{i64 2417}
!34 = !{i64 2432}
!35 = !{i64 2437}
!36 = !{i64 2452}
!37 = !{i64 2457}
!38 = !{i64 2472}
!39 = !{i64 2482}
!40 = !{i64 2487}
!41 = !{i64 2494}
!42 = !{i64 2499}
!43 = !{i64 2506}
!44 = !{i64 2514}
!45 = !{i64 2519}
!46 = !{i64 2521}
!47 = !{i64 2544}
!48 = !{i64 2549}
!49 = !{i64 2574}
!50 = !{i64 2579}
!51 = !{i64 2583}
!52 = !{i64 2587}
!53 = !{i64 2596}
!54 = !{i64 2608}
!55 = !{i64 2620}
!56 = !{i64 2634}
!57 = !{i64 2643}
!58 = !{i64 2645}
!59 = !{i64 2651}
!60 = !{i64 2656}
!61 = !{i64 2700}
!62 = !{i64 2708}
!63 = !{i64 2733}
!64 = !{i64 2737}
!65 = !{i64 2740}
!66 = !{i64 2756}
!67 = !{i64 2768}
!68 = !{i64 2780}
