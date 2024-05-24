with Parsing; use Parsing;

package body Day_1 is

   Cur_Floor : Integer := 0;
   procedure Move_Floor (C : Character) is
   begin

      if C = '(' then
         Cur_Floor := Cur_Floor + 1;
      end if;
      if C = ')' then
         Cur_Floor := Cur_Floor - 1;
      end if;

   end Move_Floor;

   function Part_1_Loop_Func (C : Character) return Boolean is
   begin
      Move_Floor (C);
      return False;
   end Part_1_Loop_Func;

   Cur_Instruction : Integer := 1;
   function Part_2_Loop_Func (C : Character) return Boolean is
   begin

      Move_Floor (C);
      if Cur_Floor < 0 then
         return True;
      end if;
      Cur_Instruction := Cur_Instruction + 1;

      return False;
   end Part_2_Loop_Func;

   function Part_1 (F : File_Type) return Integer is
   begin
      Do_In_Char_Loop (F, Part_1_Loop_Func'Access);
      return Cur_Floor;
   end Part_1;

   function Part_2 (F : File_Type) return Integer is
   begin
      Do_In_Char_Loop (F, Part_2_Loop_Func'Access);
      return Cur_Instruction;
   end Part_2;

end Day_1;