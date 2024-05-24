with Ada.Text_IO; use Ada.Text_IO;

package Day_1 is

   function Part_1 (F : File_Type) return Integer;
   function Part_2 (F : File_Type) return Integer;

private
   function Part_1_Loop_Func (C : Character) return Boolean;
   function Part_2_Loop_Func (C : Character) return Boolean;

end Day_1;