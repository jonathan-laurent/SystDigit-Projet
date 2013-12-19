type t

val print : out_channel -> Netlist_ast.program -> unit

val value : string -> t

val ( ++ ) : t -> t -> t (* concat *)

val ( ^| ) : t -> t -> t (* or *)
val ( ^^ ) : t -> t -> t (* xor *)
val ( ^& ) : t -> t -> t (* and *)
val ( ^$ ) : t -> t -> t (* nand *)

val not : t -> t

val mux : t -> t -> t -> t

val ( ** ) : t -> int -> t (* select *)

val ( % ) : t -> int * int -> t (* slice *)

val rom : string -> int -> int -> t -> t

val ram : int -> int -> t -> t -> t -> t -> t

val main_0_1 : t -> Netlist_ast.program
val main_0_2 : t * t -> Netlist_ast.program
val main_0_3 : t * t * t -> Netlist_ast.program
val main_0_4 : t * t * t * t -> Netlist_ast.program
val main_0_5 : t * t * t * t * t -> Netlist_ast.program
val main_0_6 : t * t * t * t * t * t -> Netlist_ast.program
val main_0_7 : t * t * t * t * t * t * t -> Netlist_ast.program
val main_0_8 : t * t * t * t * t * t * t * t -> Netlist_ast.program
val main_0_9 : t * t * t * t * t * t * t * t * t -> Netlist_ast.program
val main_1_1 : (t -> t ) -> int -> Netlist_ast.program
val main_1_2 : (t -> t * t ) -> int -> Netlist_ast.program
val main_1_3 : (t -> t * t * t ) -> int -> Netlist_ast.program
val main_1_4 : (t -> t * t * t * t ) -> int -> Netlist_ast.program
val main_1_5 : (t -> t * t * t * t * t ) -> int -> Netlist_ast.program
val main_1_6 : (t -> t * t * t * t * t * t ) -> int -> Netlist_ast.program
val main_1_7 : (t -> t * t * t * t * t * t * t ) -> int -> Netlist_ast.program
val main_1_8 : (t -> t * t * t * t * t * t * t * t ) -> int -> Netlist_ast.program
val main_1_9 : (t -> t * t * t * t * t * t * t * t * t ) -> int -> Netlist_ast.program
val main_2_1 : (t -> t -> t ) -> int -> int -> Netlist_ast.program
val main_2_2 : (t -> t -> t * t ) -> int -> int -> Netlist_ast.program
val main_2_3 : (t -> t -> t * t * t ) -> int -> int -> Netlist_ast.program
val main_2_4 : (t -> t -> t * t * t * t ) -> int -> int -> Netlist_ast.program
val main_2_5 : (t -> t -> t * t * t * t * t ) -> int -> int -> Netlist_ast.program
val main_2_6 : (t -> t -> t * t * t * t * t * t ) -> int -> int -> Netlist_ast.program
val main_2_7 : (t -> t -> t * t * t * t * t * t * t ) -> int -> int -> Netlist_ast.program
val main_2_8 : (t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> Netlist_ast.program
val main_2_9 : (t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> Netlist_ast.program
val main_3_1 : (t -> t -> t -> t ) -> int -> int -> int -> Netlist_ast.program
val main_3_2 : (t -> t -> t -> t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_3 : (t -> t -> t -> t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_4 : (t -> t -> t -> t * t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_5 : (t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_6 : (t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_7 : (t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_8 : (t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_3_9 : (t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> Netlist_ast.program
val main_4_1 : (t -> t -> t -> t -> t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_2 : (t -> t -> t -> t -> t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_3 : (t -> t -> t -> t -> t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_4 : (t -> t -> t -> t -> t * t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_5 : (t -> t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_6 : (t -> t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_7 : (t -> t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_8 : (t -> t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_4_9 : (t -> t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> Netlist_ast.program
val main_5_1 : (t -> t -> t -> t -> t -> t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_2 : (t -> t -> t -> t -> t -> t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_3 : (t -> t -> t -> t -> t -> t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_4 : (t -> t -> t -> t -> t -> t * t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_5 : (t -> t -> t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_6 : (t -> t -> t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_7 : (t -> t -> t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_8 : (t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_5_9 : (t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_1 : (t -> t -> t -> t -> t -> t -> t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_2 : (t -> t -> t -> t -> t -> t -> t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_3 : (t -> t -> t -> t -> t -> t -> t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_4 : (t -> t -> t -> t -> t -> t -> t * t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_5 : (t -> t -> t -> t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_6 : (t -> t -> t -> t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_7 : (t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_8 : (t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_6_9 : (t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_1 : (t -> t -> t -> t -> t -> t -> t -> t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_2 : (t -> t -> t -> t -> t -> t -> t -> t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_3 : (t -> t -> t -> t -> t -> t -> t -> t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_4 : (t -> t -> t -> t -> t -> t -> t -> t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_5 : (t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_6 : (t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_7 : (t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_8 : (t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_7_9 : (t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_1 : (t -> t -> t -> t -> t -> t -> t -> t -> t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_2 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_3 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_4 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_5 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_6 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_7 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_8 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_8_9 : (t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_1 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_2 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_3 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_4 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_5 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_6 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_7 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_8 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
val main_9_9 : (t -> t -> t -> t -> t -> t -> t -> t -> t -> t * t * t * t * t * t * t * t * t ) -> int -> int -> int -> int -> int -> int -> int -> int -> int -> Netlist_ast.program
