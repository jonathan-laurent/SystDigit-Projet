open Netlist_ast

include Netlist_proc

type t = calc

let main_0_1 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_0_2 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_0_3 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_0_4 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3,o_4 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_0_5 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3,o_4,o_5 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_0_6 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_0_7 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_0_8 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_0_9 circuit =
	let eqs = [] in
	let vars = Idm.empty in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_1_1 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_1_2 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_1_3 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_1_4 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3,o_4 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_1_5 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_1_6 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_1_7 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_1_8 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_1_9 circuit t_1 =
	let i_1 = id "" in
	let eqs = [] in
	let vars = Idm.add i_1 t_1 (Idm.empty) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_2_1 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_2_2 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_2_3 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_2_4 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_2_5 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_2_6 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_2_7 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_2_8 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_2_9 circuit t_1 t_2 =
	let i_1 = id "" in
	let i_2 = id "" in
	let eqs = [] in
	let vars = Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_3_1 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_3_2 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_3_3 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_3_4 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_3_5 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_3_6 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_3_7 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_3_8 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_3_9 circuit t_1 t_2 t_3 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let eqs = [] in
	let vars = Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_4_1 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_4_2 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_4_3 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_4_4 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_4_5 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_4_6 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_4_7 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_4_8 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_4_9 circuit t_1 t_2 t_3 t_4 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let eqs = [] in
	let vars = Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 val_4 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_5_1 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_5_2 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_5_3 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_5_4 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_5_5 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_5_6 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_5_7 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_5_8 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_5_9 circuit t_1 t_2 t_3 t_4 t_5 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let eqs = [] in
	let vars = Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 val_4 val_5 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_6_1 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_6_2 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_6_3 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_6_4 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_6_5 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_6_6 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_6_7 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_6_8 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_6_9 circuit t_1 t_2 t_3 t_4 t_5 t_6 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let eqs = [] in
	let vars = Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 val_4 val_5 val_6 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_7_1 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_7_2 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_7_3 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_7_4 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_7_5 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_7_6 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_7_7 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_7_8 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_7_9 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let eqs = [] in
	let vars = Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_8_1 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_8_2 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_8_3 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_8_4 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_8_5 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_8_6 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_8_7 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_8_8 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_8_9 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let eqs = [] in
	let vars = Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty)))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

let main_9_1 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	match arg_1 with
	| Avar id_1 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1] }
	| _ -> failwith "constant output"

let main_9_2 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	match arg_1,arg_2 with
	| Avar id_1,Avar id_2 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2] }
	| _ -> failwith "constant output"

let main_9_3 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	match arg_1,arg_2,arg_3 with
	| Avar id_1,Avar id_2,Avar id_3 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3] }
	| _ -> failwith "constant output"

let main_9_4 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3,o_4 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	match arg_1,arg_2,arg_3,arg_4 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3;id_4] }
	| _ -> failwith "constant output"

let main_9_5 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3,o_4,o_5 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	match arg_1,arg_2,arg_3,arg_4,arg_5 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3;id_4;id_5] }
	| _ -> failwith "constant output"

let main_9_6 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3,o_4,o_5,o_6 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6] }
	| _ -> failwith "constant output"

let main_9_7 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7] }
	| _ -> failwith "constant output"

let main_9_8 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8] }
	| _ -> failwith "constant output"

let main_9_9 circuit t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 =
	let i_1 = id "" in
	let i_2 = id "" in
	let i_3 = id "" in
	let i_4 = id "" in
	let i_5 = id "" in
	let i_6 = id "" in
	let i_7 = id "" in
	let i_8 = id "" in
	let i_9 = id "" in
	let eqs = [] in
	let vars = Idm.add i_9 t_9 (Idm.add i_8 t_8 (Idm.add i_7 t_7 (Idm.add i_6 t_6 (Idm.add i_5 t_5 (Idm.add i_4 t_4 (Idm.add i_3 t_3 (Idm.add i_2 t_2 (Idm.add i_1 t_1 (Idm.empty))))))))) in
	let val_1 =
		let res_1 = ref (Arg (Avar i_1,t_1)) in
		fun () -> res_1 in
	let val_2 =
		let res_2 = ref (Arg (Avar i_2,t_2)) in
		fun () -> res_2 in
	let val_3 =
		let res_3 = ref (Arg (Avar i_3,t_3)) in
		fun () -> res_3 in
	let val_4 =
		let res_4 = ref (Arg (Avar i_4,t_4)) in
		fun () -> res_4 in
	let val_5 =
		let res_5 = ref (Arg (Avar i_5,t_5)) in
		fun () -> res_5 in
	let val_6 =
		let res_6 = ref (Arg (Avar i_6,t_6)) in
		fun () -> res_6 in
	let val_7 =
		let res_7 = ref (Arg (Avar i_7,t_7)) in
		fun () -> res_7 in
	let val_8 =
		let res_8 = ref (Arg (Avar i_8,t_8)) in
		fun () -> res_8 in
	let val_9 =
		let res_9 = ref (Arg (Avar i_9,t_9)) in
		fun () -> res_9 in
	let o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8,o_9 = circuit val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 val_9 in
	let arg_1,_,eqs,vars = calc Iset.empty eqs vars o_1 in
	let arg_2,_,eqs,vars = calc Iset.empty eqs vars o_2 in
	let arg_3,_,eqs,vars = calc Iset.empty eqs vars o_3 in
	let arg_4,_,eqs,vars = calc Iset.empty eqs vars o_4 in
	let arg_5,_,eqs,vars = calc Iset.empty eqs vars o_5 in
	let arg_6,_,eqs,vars = calc Iset.empty eqs vars o_6 in
	let arg_7,_,eqs,vars = calc Iset.empty eqs vars o_7 in
	let arg_8,_,eqs,vars = calc Iset.empty eqs vars o_8 in
	let arg_9,_,eqs,vars = calc Iset.empty eqs vars o_9 in
	match arg_1,arg_2,arg_3,arg_4,arg_5,arg_6,arg_7,arg_8,arg_9 with
	| Avar id_1,Avar id_2,Avar id_3,Avar id_4,Avar id_5,Avar id_6,Avar id_7,Avar id_8,Avar id_9 -> {
		p_eqs = eqs;
		p_vars = vars;
		p_inputs = [i_1;i_2;i_3;i_4;i_5;i_6;i_7;i_8;i_9];
		p_outputs = [id_1;id_2;id_3;id_4;id_5;id_6;id_7;id_8;id_9] }
	| _ -> failwith "constant output"

