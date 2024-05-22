package body Day_1 is

   function Part_1 (F : File_Type) return Integer is
      Cur_Char : Character;
      Cur_Floor : Integer := 0;
   begin

      while not End_Of_File (F) loop
         Get (File => F, Item => Cur_Char);
         if Cur_Char = '(' then
            Cur_Floor := Cur_Floor + 1;
         end if;

         if Cur_Char = ')' then
            Cur_Floor := Cur_Floor - 1;
         end if;
      end loop;

      return Cur_Floor;
   end Part_1;

   function Part_2 (F : File_Type) return Integer is
      Cur_Char : Character;
      Cur_Floor : Integer := 0;
      Cur_Instruction : Integer := 1;
   begin

      while not End_Of_File (F) loop
         Get (File => F, Item => Cur_Char);
         if Cur_Char = '(' then
            Cur_Floor := Cur_Floor + 1;
         end if;

         if Cur_Char = ')' then
            Cur_Floor := Cur_Floor - 1;
         end if;

         if Cur_Floor < 0 then
            exit;
         end if;

         Cur_Instruction := Cur_Instruction + 1;
      end loop;

      return Cur_Instruction;
   end Part_2;

end Day_1;