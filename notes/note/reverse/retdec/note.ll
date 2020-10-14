source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

%_IO_FILE = type { i32 }

@global_var_600ff8 = local_unnamed_addr global i64 0
@global_var_600e20 = local_unnamed_addr global i64 0
@global_var_400a18 = constant [7 x i8] c"Index:\00"
@global_var_400a1f = constant [6 x i8] c"Size:\00"
@global_var_6010a0 = global i64 0
@global_var_400a25 = constant [5 x i8] c"Len:\00"
@global_var_400a2a = constant [7 x i8] c"Input:\00"
@global_var_400a38 = constant [46 x i8] c"Start our heap journey from old-school style!\00"
@global_var_400a68 = constant [36 x i8] c"How many ways can you exploit this?\00"
@global_var_400a8c = constant [7 x i8] c"1. Add\00"
@global_var_400a93 = constant [10 x i8] c"2. Delete\00"
@global_var_400a9d = constant [8 x i8] c"3. Edit\00"
@global_var_400aa5 = constant [8 x i8] c"4. Show\00"
@global_var_400aad = constant [8 x i8] c"Choice:\00"
@global_var_400ab5 = constant [8 x i8] c"Invalid\00"
@global_var_600e10 = local_unnamed_addr global i64 4196112
@global_var_600e18 = local_unnamed_addr global i64 4196080
@0 = external global i32
@global_var_601088 = local_unnamed_addr global i8 0
@global_var_601080 = local_unnamed_addr global %_IO_FILE* null

define i64 @read_int() local_unnamed_addr {
dec_label_pc_400736:
  %rax.0.reg2mem = alloca i64, !insn.addr !0
  %stack_var_-40 = alloca i64, align 8
  %0 = call i64 @__readfsqword(i64 40), !insn.addr !1
  store i64 0, i64* %stack_var_-40, align 8, !insn.addr !2
  %1 = call i32 @read(i32 0, i64* nonnull %stack_var_-40, i32 16), !insn.addr !3
  %2 = bitcast i64* %stack_var_-40 to i8*, !insn.addr !4
  %3 = call i32 @atoi(i8* nonnull %2), !insn.addr !4
  %4 = sext i32 %3 to i64, !insn.addr !4
  %5 = call i64 @__readfsqword(i64 40), !insn.addr !5
  %6 = icmp eq i64 %0, %5, !insn.addr !5
  store i64 %4, i64* %rax.0.reg2mem, !insn.addr !6
  br i1 %6, label %dec_label_pc_400793, label %dec_label_pc_40078e, !insn.addr !6

dec_label_pc_40078e:                              ; preds = %dec_label_pc_400736
  call void @__stack_chk_fail(), !insn.addr !7
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.0.reg2mem, !insn.addr !7
  br label %dec_label_pc_400793, !insn.addr !7

dec_label_pc_400793:                              ; preds = %dec_label_pc_40078e, %dec_label_pc_400736
  %rax.0.reload = load i64, i64* %rax.0.reg2mem
  ret i64 %rax.0.reload, !insn.addr !8
}

define i64 @add() local_unnamed_addr {
dec_label_pc_400795:
  %0 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_400a18, i64 0, i64 0)), !insn.addr !9
  %1 = call i64 @read_int(), !insn.addr !10
  %2 = call i32 @puts(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_var_400a1f, i64 0, i64 0)), !insn.addr !11
  %3 = call i64 @read_int(), !insn.addr !12
  %4 = trunc i64 %3 to i32, !insn.addr !13
  %5 = call i64* @malloc(i32 %4), !insn.addr !14
  %6 = ptrtoint i64* %5 to i64, !insn.addr !14
  %sext = mul i64 %1, 4294967296
  %7 = sdiv i64 %sext, 4294967296, !insn.addr !15
  %8 = sdiv i64 %sext, 536870912, !insn.addr !16
  %9 = add i64 %8, ptrtoint (i64* @global_var_6010a0 to i64), !insn.addr !16
  %10 = inttoptr i64 %9 to i64*, !insn.addr !16
  store i64 %6, i64* %10, align 8, !insn.addr !16
  ret i64 %7, !insn.addr !17
}

define i64 @delete() local_unnamed_addr {
dec_label_pc_4007eb:
  %0 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_400a18, i64 0, i64 0)), !insn.addr !18
  %1 = call i64 @read_int(), !insn.addr !19
  %sext = mul i64 %1, 4294967296
  %2 = sdiv i64 %sext, 536870912, !insn.addr !20
  %3 = add i64 %2, ptrtoint (i64* @global_var_6010a0 to i64), !insn.addr !20
  %4 = inttoptr i64 %3 to i64*, !insn.addr !20
  %5 = load i64, i64* %4, align 8, !insn.addr !20
  %6 = inttoptr i64 %5 to i64*, !insn.addr !21
  call void @free(i64* %6), !insn.addr !21
  ret i64 ptrtoint (i32* @0 to i64), !insn.addr !22
}

define i64 @edit() local_unnamed_addr {
dec_label_pc_400822:
  %0 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_400a18, i64 0, i64 0)), !insn.addr !23
  %1 = call i64 @read_int(), !insn.addr !24
  %2 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_var_400a25, i64 0, i64 0)), !insn.addr !25
  %3 = call i64 @read_int(), !insn.addr !26
  %4 = trunc i64 %3 to i32, !insn.addr !27
  %5 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_400a2a, i64 0, i64 0)), !insn.addr !28
  %sext = mul i64 %1, 4294967296
  %6 = sdiv i64 %sext, 536870912, !insn.addr !29
  %7 = add i64 %6, ptrtoint (i64* @global_var_6010a0 to i64), !insn.addr !29
  %8 = inttoptr i64 %7 to i64*, !insn.addr !29
  %9 = load i64, i64* %8, align 8, !insn.addr !29
  %10 = inttoptr i64 %9 to i64*, !insn.addr !30
  %11 = call i32 @read(i32 0, i64* %10, i32 %4), !insn.addr !30
  %12 = sext i32 %11 to i64, !insn.addr !30
  ret i64 %12, !insn.addr !31
}

define i64 @show() local_unnamed_addr {
dec_label_pc_400885:
  %0 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_400a18, i64 0, i64 0)), !insn.addr !32
  %1 = call i64 @read_int(), !insn.addr !33
  %sext = mul i64 %1, 4294967296
  %2 = sdiv i64 %sext, 536870912, !insn.addr !34
  %3 = add i64 %2, ptrtoint (i64* @global_var_6010a0 to i64), !insn.addr !34
  %4 = inttoptr i64 %3 to i64*, !insn.addr !34
  %5 = load i64, i64* %4, align 8, !insn.addr !34
  %6 = inttoptr i64 %5 to i8*, !insn.addr !35
  %7 = call i32 @puts(i8* %6), !insn.addr !35
  %8 = sext i32 %7 to i64, !insn.addr !35
  ret i64 %8, !insn.addr !36
}

define i64 @main(i64 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_4008bc:
  %0 = load %_IO_FILE*, %_IO_FILE** @global_var_601080, align 8, !insn.addr !37
  call void @setbuf(%_IO_FILE* %0, i8* null), !insn.addr !38
  %1 = call i32 @puts(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @global_var_400a38, i64 0, i64 0)), !insn.addr !39
  %2 = call i32 @puts(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @global_var_400a68, i64 0, i64 0)), !insn.addr !40
  br label %dec_label_pc_4008ec, !insn.addr !40

dec_label_pc_4008ec:                              ; preds = %dec_label_pc_400986, %dec_label_pc_4008bc
  %3 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_var_400a8c, i64 0, i64 0)), !insn.addr !41
  %4 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_var_400a93, i64 0, i64 0)), !insn.addr !42
  %5 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_400a9d, i64 0, i64 0)), !insn.addr !43
  %6 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_400aa5, i64 0, i64 0)), !insn.addr !44
  %7 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_400aad, i64 0, i64 0)), !insn.addr !45
  %8 = call i64 @read_int(), !insn.addr !46
  %9 = trunc i64 %8 to i32, !insn.addr !47
  %10 = icmp eq i32 %9, 2, !insn.addr !47
  br i1 %10, label %dec_label_pc_400957, label %dec_label_pc_400933, !insn.addr !48

dec_label_pc_400933:                              ; preds = %dec_label_pc_4008ec
  %11 = icmp sgt i32 %9, 2, !insn.addr !49
  br i1 %11, label %dec_label_pc_40093f, label %dec_label_pc_400938, !insn.addr !49

dec_label_pc_400938:                              ; preds = %dec_label_pc_400933
  %12 = icmp eq i32 %9, 1, !insn.addr !50
  br i1 %12, label %dec_label_pc_40094b, label %dec_label_pc_40097b, !insn.addr !51

dec_label_pc_40093f:                              ; preds = %dec_label_pc_400933
  switch i32 %9, label %dec_label_pc_40097b [
    i32 3, label %dec_label_pc_400963
    i32 4, label %dec_label_pc_40096f
  ]

dec_label_pc_40094b:                              ; preds = %dec_label_pc_400938
  %13 = call i64 @add(), !insn.addr !52
  br label %dec_label_pc_400986, !insn.addr !53

dec_label_pc_400957:                              ; preds = %dec_label_pc_4008ec
  %14 = call i64 @delete(), !insn.addr !54
  br label %dec_label_pc_400986, !insn.addr !55

dec_label_pc_400963:                              ; preds = %dec_label_pc_40093f
  %15 = call i64 @edit(), !insn.addr !56
  br label %dec_label_pc_400986, !insn.addr !57

dec_label_pc_40096f:                              ; preds = %dec_label_pc_40093f
  %16 = call i64 @show(), !insn.addr !58
  br label %dec_label_pc_400986, !insn.addr !59

dec_label_pc_40097b:                              ; preds = %dec_label_pc_40093f, %dec_label_pc_400938
  %17 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_var_400ab5, i64 0, i64 0)), !insn.addr !60
  br label %dec_label_pc_400986, !insn.addr !61

dec_label_pc_400986:                              ; preds = %dec_label_pc_40097b, %dec_label_pc_40096f, %dec_label_pc_400963, %dec_label_pc_400957, %dec_label_pc_40094b
  br label %dec_label_pc_4008ec, !insn.addr !62
}

declare void @free(i64*) local_unnamed_addr

declare i32 @puts(i8*) local_unnamed_addr

declare void @__stack_chk_fail() local_unnamed_addr

declare void @setbuf(%_IO_FILE*, i8*) local_unnamed_addr

declare i32 @read(i32, i64*, i32) local_unnamed_addr

declare i64* @malloc(i32) local_unnamed_addr

declare i32 @atoi(i8*) local_unnamed_addr

declare i64 @__readfsqword(i64) local_unnamed_addr

!0 = !{i64 4196150}
!1 = !{i64 4196158}
!2 = !{i64 4196173}
!3 = !{i64 4196206}
!4 = !{i64 4196218}
!5 = !{i64 4196227}
!6 = !{i64 4196236}
!7 = !{i64 4196238}
!8 = !{i64 4196244}
!9 = !{i64 4196258}
!10 = !{i64 4196268}
!11 = !{i64 4196281}
!12 = !{i64 4196291}
!13 = !{i64 4196296}
!14 = !{i64 4196307}
!15 = !{i64 4196318}
!16 = !{i64 4196320}
!17 = !{i64 4196330}
!18 = !{i64 4196344}
!19 = !{i64 4196354}
!20 = !{i64 4196367}
!21 = !{i64 4196378}
!22 = !{i64 4196385}
!23 = !{i64 4196399}
!24 = !{i64 4196409}
!25 = !{i64 4196422}
!26 = !{i64 4196432}
!27 = !{i64 4196437}
!28 = !{i64 4196445}
!29 = !{i64 4196461}
!30 = !{i64 4196477}
!31 = !{i64 4196484}
!32 = !{i64 4196498}
!33 = !{i64 4196508}
!34 = !{i64 4196521}
!35 = !{i64 4196532}
!36 = !{i64 4196539}
!37 = !{i64 4196548}
!38 = !{i64 4196563}
!39 = !{i64 4196573}
!40 = !{i64 4196583}
!41 = !{i64 4196593}
!42 = !{i64 4196603}
!43 = !{i64 4196613}
!44 = !{i64 4196623}
!45 = !{i64 4196633}
!46 = !{i64 4196643}
!47 = !{i64 4196654}
!48 = !{i64 4196657}
!49 = !{i64 4196662}
!50 = !{i64 4196664}
!51 = !{i64 4196667}
!52 = !{i64 4196688}
!53 = !{i64 4196693}
!54 = !{i64 4196700}
!55 = !{i64 4196705}
!56 = !{i64 4196712}
!57 = !{i64 4196717}
!58 = !{i64 4196724}
!59 = !{i64 4196729}
!60 = !{i64 4196736}
!61 = !{i64 4196741}
!62 = !{i64 4196742}
