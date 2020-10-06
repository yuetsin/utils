source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

%_IO_FILE = type { i32 }

@global_var_600ff8 = local_unnamed_addr global i64 0
@global_var_4008f4 = local_unnamed_addr constant [7 x i8] c"Stage4\00"
@global_var_4008fb = local_unnamed_addr constant [8 x i8] c"/bin/sh\00"
@global_var_400903 = local_unnamed_addr constant [28 x i8] c"alter flags through stages.\00"
@global_var_40091f = local_unnamed_addr constant [7 x i8] c"Stage3\00"
@global_var_400926 = local_unnamed_addr constant [15 x i8] c"stage3 failed.\00"
@global_var_400935 = local_unnamed_addr constant [7 x i8] c"Stage2\00"
@global_var_40093c = local_unnamed_addr constant [15 x i8] c"stage2 failed.\00"
@global_var_40094b = constant [7 x i8] c"Stage1\00"
@global_var_400952 = constant [15 x i8] c"stage1 failed.\00"
@global_var_400961 = constant [19 x i8] c"Stack Overflooooow\00"
@global_var_600e10 = local_unnamed_addr global i64 4196032
@global_var_600e18 = local_unnamed_addr global i64 4195984
@global_var_601088 = local_unnamed_addr global i8 0
@global_var_60108c = local_unnamed_addr global i32 0
@global_var_601090 = local_unnamed_addr global i32 0
@global_var_601070 = local_unnamed_addr global %_IO_FILE* null
@global_var_601060 = local_unnamed_addr global %_IO_FILE* null
@global_var_601080 = local_unnamed_addr global %_IO_FILE* null

define i64 @stage1() local_unnamed_addr {
dec_label_pc_40079c:
  %stack_var_-56 = alloca i64, align 8
  store i64 0, i64* %stack_var_-56, align 8, !insn.addr !0
  %0 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_40094b, i64 0, i64 0)), !insn.addr !1
  %1 = call i32 @read(i32 0, i64* nonnull %stack_var_-56, i32 256), !insn.addr !2
  %2 = call i32 @puts(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_var_400952, i64 0, i64 0)), !insn.addr !3
  call void @exit(i32 -1), !insn.addr !4
  unreachable, !insn.addr !4
}

define i64 @main(i64 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_400815:
  %0 = load %_IO_FILE*, %_IO_FILE** @global_var_601070, align 8, !insn.addr !5
  call void @setbuf(%_IO_FILE* %0, i8* null), !insn.addr !6
  %1 = load %_IO_FILE*, %_IO_FILE** @global_var_601060, align 8, !insn.addr !7
  call void @setbuf(%_IO_FILE* %1, i8* null), !insn.addr !8
  %2 = load %_IO_FILE*, %_IO_FILE** @global_var_601080, align 8, !insn.addr !9
  call void @setbuf(%_IO_FILE* %2, i8* null), !insn.addr !10
  %3 = call i32 @puts(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_var_400961, i64 0, i64 0)), !insn.addr !11
  %4 = call i64 @stage1(), !insn.addr !12
  ret i64 0, !insn.addr !13
}

declare i32 @puts(i8*) local_unnamed_addr

declare void @setbuf(%_IO_FILE*, i8*) local_unnamed_addr

declare i32 @read(i32, i64*, i32) local_unnamed_addr

declare void @exit(i32) local_unnamed_addr

!0 = !{i64 4196267}
!1 = !{i64 4196304}
!2 = !{i64 4196326}
!3 = !{i64 4196345}
!4 = !{i64 4196355}
!5 = !{i64 4196377}
!6 = !{i64 4196392}
!7 = !{i64 4196397}
!8 = !{i64 4196412}
!9 = !{i64 4196417}
!10 = !{i64 4196432}
!11 = !{i64 4196442}
!12 = !{i64 4196452}
!13 = !{i64 4196463}
