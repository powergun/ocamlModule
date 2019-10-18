
(* 
https://dev.realworldocaml.org/first-class-modules.html

 *)

open Base
open Core

module type X_int = sig 
  val x : int 
end

module Three : X_int = struct 
  let x = 3 
end

let demo_call_normal_module () =
  printf "module: %d\n" Three.x
;;

(* 
http://dev.realworldocaml.org/first-class-modules.html
In order to access the contents of a first-class module, you need 
to unpack it into an ordinary module. This can be done using the 
val keyword,
*)
let to_int m =
  let module M = (val m : X_int) in
  M.x
;;

let demo_pack_unpack () =
  let three = (module Three : X_int) in
  printf "unpacked: %d\n" (to_int three)
;;

let demo () =
  demo_call_normal_module();
  demo_pack_unpack();
;;
