
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

let () =
  printf "%d\n" Three.x
;;
