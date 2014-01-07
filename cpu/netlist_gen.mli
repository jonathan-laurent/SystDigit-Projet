type t

val print : out_channel -> Netlist_ast.program -> unit

val get : Netlist_ast.ident -> t
val loop : int -> (t * (t -> t))

val ignore: t -> t -> t (* ignores first value *)
val ( ^. ) : t -> t -> t (* ignores first value *)

val const : string -> t

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
    (* addr_size, word_size, read_addr *)

val ram : int -> int -> t -> t -> t -> t -> t
    (* addr_size, word_size, read_addr, write_enable, write_addr, data *)

val reg : int -> t -> t

val program :
    (Netlist_ast.ident * int) list                 (* liste des entrées : (nom, taille) *)
        -> (Netlist_ast.ident * int * t) list      (* liste des sorties : (nom de la sortie, taille, equation) *)
        -> Netlist_ast.program

