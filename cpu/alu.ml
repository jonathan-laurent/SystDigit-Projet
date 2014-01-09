open Netlist_gen

let zeroes n =
    const (String.make n '0')

let one n =
    const "1" ++ zeroes (n-1)
let two n =
    const "01" ++ zeroes (n-2)

let rec rep n k =
    if n = 1 then k
    else
        let s = rep (n/2) k in
        if n mod 2 = 0 then s ++ s else s ++ s ++ k

let rec eq_c n v c = (* v is a value, c is a constant *)
    if n = 1 then
        if c = 1 then v else not v
    else
        (eq_c 1 (v ** 0) (c mod 2)) ^& (eq_c (n-1) (v % (1, n-1)) (c/2))

let rec all1 n x =
    if n = 1 then
        x
    else
        (x ** 0) ^& (all1 (n-1) (x % (1, n-1)))

let rec nonnull n a =
    if n = 1 then
        a
    else
        (a ** 0) ^| (nonnull (n-1) (a % (1, n-1)))

let rec sign_extend n_a n_dest a =
    a ++ rep (n_dest - n_a) (a ** (n_a - 1))

(* Arithmetic operations *)

let fulladder a b c =
       let s = a ^^ b ^^ c in
       let r = (a ^& b) ^| ((a ^^ b) ^& c) in
       s, r

let rec nadder_with_carry n a b c_in =
    if n = 1 then fulladder a b c_in
    else 
        let s_n, c_n1 = fulladder (a ** 0) (b ** 0) c_in in
        let s_n1, c_out = nadder_with_carry (n-1) (a % (1, n-1)) (b % (1, n-1)) c_n1 in
        s_n ++ s_n1, c_out

let nadder n a b =
    let a, b = nadder_with_carry n a b (const "0") in
    b ^. a

let neg n a = nadder n (not a) (one n)

let rec nsubber n a b =
  let r, c = nadder_with_carry n a (not b) (const "1") in
  c ^. r




(* Some operations on Redundant Binary Representation 
   Each binary digit is encoded on 2 bits 

   A n-digits number in RBR is written
   [a_0, a'_0, a_1, a'_1, ..., a_(n-1), a'_(n-1)]

*)

(* [a] and [b] are encoded on 2n bits
   [c_in] and [c_out] on 2 bits *)

let rec rbr_nadder_with_carry n a b c_in =

  if n = 0 then (zeroes 0), c_in else

  let fa1s, fa1r = fulladder (a ** 1) (b ** 0) (b ** 1) in
  let fa2s, fa2r = fulladder (c_in ** 1) (a ** 0) fa1s in

  let rec_s, rec_c = 
    rbr_nadder_with_carry (n - 1) 
      (a % (2, 2*n - 1)) 
      (b % (2, 2*n - 1)) 
      (fa1r ++ fa2r)

  in (c_in ** 0) ++ fa2s ++ rec_s, rec_c


let rbr_nadder n a b = 
  let s, c = rbr_nadder_with_carry n a b (zeroes 2) in
  c ^. s


let bin_of_rbr n a c = 

  (* Split even and odd bits *)
  let rec split_bits n a =
    if n = 0 then (zeroes 0, zeroes 0) 
    else
      let even, odd = split_bits (n-1) (a % (2, 2*n - 1)) in
      (a ** 0) ++ even, (a ** 1) ++ odd

  in
  let a_even, a_odd = split_bits n a in

  nadder n a_even a_odd
    
    

(* TODO : move to utils module *)
let rec range a b = if a > b then [] else a :: (range (a+1) b)

(* Sépare en deux listes de même taille une liste de taille paire *)
let rec split_list = function
  | [] -> [], []
  | [_] -> assert false
  | x::y::tl -> let a, b = split_list tl in x::a, y::b

(* n must be a power of two *)
(*
let nmul n a b =

  let summands = List.map (fun i ->  
    mux (b ** i)
      (zeroes (2*n))  
      ((zeroes i) ++ a ++ (zeroes (n - i)))
      
  ) (range 0 (n-1)) in

  
  let rec sum_list = function
    | [x] -> x
    | l -> 
        let s1, s2 = split_list l in 
        nadder (2*n) (sum_list s1) (sum_list s2)

  in let r = List.fold_left (nadder (2*n)) (List.hd summands) (List.tl summands) in


  (*in 
  let r = sum_list summands in*)
  (r % (0, n-1)), (r % (n, 2*n - 1))
  *)

let nmul n a b =
  let nn = 2*n in
  let result = ref (zeroes (nn)) in
  for i = 0 to n-1 do
    result := mux (b ** i) !result (nadder nn !result ((zeroes i) ++ a ++ (zeroes (n-i))))
  done;
  let r = !result in
  r % (0, n-1), r % (n, nn-1)
    




let rec ndiv n a b =
    zeroes n, zeroes n (* TODO : returns quotient and remainder *)




let rec nmulu n a b =
    zeroes n, zeroes n (* TODO : same as nmul but unsigned *)

let rec ndivu n a b =
    zeroes n, zeroes n (* TODO : save as ndiv but unsigned *)

(* Shifts *)

let npshift_signed n p a b =
    a (* TODO (here b is a signed integer on p bits) *)

let op_lsl n a b =
    a (* TODO (b is unsigned, same size n) *)

let op_lsr n a b =
    a (* TODO (b is unsigned, same size n) *)

let op_asr n a b =
    a (* TODO (b unsigned size n) *)

(* Comparisons *)

let rec eq_n n a b =
    all1 n (not (a ^^ b))

let rec ne_n n a b =
    nonnull n (a ^^ b)

let rec lt_n n a b =
    const "0"       (* TODO : less than *)

let rec ult_n n a b =
    const "0"       (* TODO : less than, unsigned *)

let rec le_n n a b =
    const "0"       (* TODO : less than or equal *)

let rec ule_n n a b =
    const "0"       (* TODO : less than or equal, unsigned *)

(* Big pieces *)

let alu_comparer n f0 f a b =
    (*
        f0  f   action
        --  -   ------
        0   0   equal
        0   1   not equal
        0   2   equal
        0   3   not equal
        1   0   lt
        1   1   le
        1   2   lt unsigned
        1   3   le unsigned
    *)
    let eq_ne = mux (f ** 0) (eq_n n a b) (ne_n n a b) in
    let lte_signed = mux (f ** 0) (lt_n n a b) (le_n n a b) in
    let lte_unsigned = mux (f ** 0) (ult_n n a b) (ule_n n a b) in
    let lte = mux (f ** 1) lte_signed lte_unsigned in
    mux f0 eq_ne lte

let alu_arith f1 f a b =
    (*  See table for ALU below *)
    let add = nadder 16 a b in
    let sub = nsubber 16 a b in
    let mul, mul2 = nmul 16 a b in
    let div, div2 = ndiv 16 a b in
    let mulu, mulu2 = nmulu 16 a b in
    let divu, divu2 = ndivu 16 a b in
    let q00 = mux (f ** 0) add sub in
    let q01 = mux (f ** 0) mul div in
    let q03 = mux (f ** 0) mulu divu in
    let q10 = mux (f ** 1) q00 q01 in
    let q11 = mux (f ** 1) q00 q03 in
    let q = mux f1 q10 q11 in
    let r01 = mux (f ** 0) mul2 div2 in
    let r03 = mux (f ** 0) mulu2 divu2 in
    let r10 = mux (f ** 1) (zeroes 16) r01 in
    let r11 = mux (f ** 1) (zeroes 16) r03 in
    let r = mux f1 r10 r11 in
    q, r

let alu_logic f a b =
    (*  See table for ALU below *)
    let q0 = mux (f ** 0) (a ^| b) (a ^& b) in
    let q1 = mux (f ** 0) (a ^^ b) (not (a ^| b)) in
    mux (f ** 1) q0 q1

let alu_shifts f a b =
    (*  See table for ALU below *)
    let q1 = mux (f ** 0) (op_lsr 16 a b) (op_asr 16 a b) in
    mux (f ** 1) (op_lsl 16 a b) q1

let alu f1 f0 f a b =
    (*
        f0  f1  f   action
        --  --  -   ------
        0   0   0   add
        0   0   1   sub
        0   0   2   mul
        0   0   3   div
        0   1   0   addu
        0   1   1   subu
        0   1   2   mulu
        0   1   3   divu
        1   0   0   or
        1   0   1   and
        1   0   2   xor
        1   0   3   nor
        1   1   0   lsl
        1   1   1   lsl
        1   1   2   lsr
        1   1   3   asr
    *)
    let arith, arith_r = alu_arith f1 f a b in
    let logic = alu_logic f a b in
    let shifts = alu_shifts f a b in

    let q0 = mux f1 logic shifts in
    let s = mux f0 arith q0 in
    let r = mux f0 arith_r (zeroes 16) in
    s, r

