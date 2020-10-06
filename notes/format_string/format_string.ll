source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

%_IO_FILE = type { i32 }

@global_var_600ff8 = local_unnamed_addr global i64 0
@global_var_601057 = local_unnamed_addr global i64 0
@global_var_600e20 = local_unnamed_addr global i64 0
@global_var_400744 = constant [14 x i8] c"Format String\00"
@global_var_600e10 = local_unnamed_addr global i64 4195856
@global_var_600e18 = local_unnamed_addr global i64 4195824
@global_var_601050 = local_unnamed_addr global %_IO_FILE* null
@global_var_601058 = local_unnamed_addr global i8 0

define i64 @main(i64 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_400636:
  %stack_var_-152 = alloca i64, align 8
  %0 = call i64 @__readfsqword(i64 40), !insn.addr !0
  %1 = load %_IO_FILE*, %_IO_FILE** @global_var_601050, align 8, !insn.addr !1
  call void @setbuf(%_IO_FILE* %1, i8* null), !insn.addr !2
  %2 = bitcast i64* %stack_var_-152 to i8*, !insn.addr !3
  call void @__asm_rep_stosq_memset(i8* nonnull %2, i64 0, i64 16), !insn.addr !3
  %3 = call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_var_400744, i64 0, i64 0)), !insn.addr !4
  br label %dec_label_pc_400685, !insn.addr !4

dec_label_pc_400685:                              ; preds = %dec_label_pc_400685, %dec_label_pc_400636
  %4 = call i32 @read(i32 0, i64* nonnull %stack_var_-152, i32 128), !insn.addr !5
  %5 = call i32 (i8*, ...) @printf(i8* nonnull %2), !insn.addr !6
  br label %dec_label_pc_400685, !insn.addr !7
}

declare i32 @puts(i8*) local_unnamed_addr

declare void @setbuf(%_IO_FILE*, i8*) local_unnamed_addr

declare i32 @printf(i8*, ...) local_unnamed_addr

declare i32 @read(i32, i64*, i32) local_unnamed_addr

declare void @__asm_rep_stosq_memset(i8*, i64, i64) local_unnamed_addr

declare i64 @__readfsqword(i64) local_unnamed_addr

!0 = !{i64 4195905}
!1 = !{i64 4195920}
!2 = !{i64 4195935}
!3 = !{i64 4195960}
!4 = !{i64 4195968}
!5 = !{i64 4195993}
!6 = !{i64 4196013}
!7 = !{i64 4196018}
