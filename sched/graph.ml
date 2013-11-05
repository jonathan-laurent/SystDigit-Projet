exception Cycle
type mark = NotVisited | InProgress | Visited

type 'a graph =
    { mutable g_nodes : 'a node list }
and 'a node = {
  n_label : 'a;
  mutable n_mark : mark;
  mutable n_link_to : 'a node list;
  mutable n_linked_by : 'a node list;
}

let mk_graph () = { g_nodes = [] }

let add_node g x =
  let n = { n_label = x; n_mark = NotVisited; n_link_to = []; n_linked_by = [] } in
  g.g_nodes <- n::g.g_nodes

let node_for_label g x =
  List.find (fun n -> n.n_label = x) g.g_nodes

let add_edge g id1 id2 =
  let n1 = node_for_label g id1 in
  let n2 = node_for_label g id2 in
  n1.n_link_to <- n2::n1.n_link_to;
  n2.n_linked_by <- n1::n2.n_linked_by

let clear_marks g =
  List.iter (fun n -> n.n_mark <- NotVisited) g.g_nodes

let find_roots g =
  List.filter (fun n -> n.n_linked_by = []) g.g_nodes

let has_cycle g =
	clear_marks g;
	let rec visit n =
		match n.n_mark with
		| InProgress -> true
		| Visited -> false
		| NotVisited ->
			n.n_mark <- InProgress;
			let ret = List.fold_left (fun x n -> x || (visit n)) false n.n_link_to in
			n.n_mark <- Visited;
			ret
	in
	let ret = List.fold_left (fun x n -> x || (if n.n_mark = Visited then false else visit n)) false g.g_nodes
	in clear_marks g; ret

let topological g =
	clear_marks g;
	let rec aux acc n =
		if n.n_mark = Visited
			then acc
			else begin
				n.n_mark <- Visited;
				n.n_label :: (List.fold_left (fun x n -> aux x n) acc n.n_linked_by)
			end
	in
	let ret = List.fold_left (fun x n -> aux x n) [] g.g_nodes
	in clear_marks g; List.rev ret

let topological_from_roots g roots =
	clear_marks g;
	let rec aux acc n =
		if n.n_mark = Visited
			then acc
			else begin
				n.n_mark <- Visited;
				n.n_label :: (List.fold_left (fun x n -> aux x n) acc n.n_linked_by)
			end
	in
	let ret = List.fold_left
		(fun x n -> aux x (node_for_label g n)) [] roots
	in
	let used = List.fold_left
		(fun s n ->
			if n.n_mark = Visited then
				n.n_label::s
			else
				s)
		[]
		g.g_nodes in
	clear_marks g;
	List.rev ret, used
