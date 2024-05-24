with Ada.Text_IO; use Ada.Text_IO;

package Parsing is

   procedure Do_In_Char_Loop (
     F : File_Type;
     Func : access function (C : Character) return Boolean
   );

end Parsing;