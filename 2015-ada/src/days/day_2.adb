with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Day_2 is

   function Part_1 (F : File_Type) return Integer is
      Cur_Char : Character;
      Cur_Num_Str : Unbounded_String := To_Unbounded_String ("");
      Cur_Num_Idx : Integer := 1;
      Nums_For_Line : array (1 .. 3) of Integer;
      Areas : array (1 .. 3) of Integer;
      Min_Area : Integer := 0;
      Sum : Integer := 0;
   begin

      while not End_Of_File (F) loop
         Get (File => F, Item => Cur_Char);
         if Cur_Char = 'x' then
            Nums_For_Line (Cur_Num_Idx) := Integer'Value (
              To_String (Cur_Num_Str)
            );
            Cur_Num_Idx := Cur_Num_Idx + 1;
            Cur_Num_Str := To_Unbounded_String ("");
         else
            Cur_Num_Str := Cur_Num_Str & Cur_Char;
         end if;

         if End_Of_Line (F) then
            Nums_For_Line (Cur_Num_Idx) := Integer'Value (
              To_String (Cur_Num_Str)
            );
            Areas (1) := 2 * Nums_For_Line (1) * Nums_For_Line (2);
            Areas (2) := 2 * Nums_For_Line (2) * Nums_For_Line (3);
            Areas (3) := 2 * Nums_For_Line (3) * Nums_For_Line (1);

            for I in Areas'Range loop
               Sum := Sum + Areas (I);
               if Min_Area = 0 or else Areas (I) < Min_Area then
                  Min_Area := Areas (I);
               end if;
            end loop;

            Sum := Sum + (Min_Area / 2);
            Cur_Num_Idx := 1;
            Cur_Num_Str := To_Unbounded_String ("");
            Min_Area := 0;
         end if;
      end loop;

      return Sum;
   end Part_1;

   function Part_2 (F : File_Type) return Integer is
      Cur_Char : Character;
      Cur_Num_Str : Unbounded_String := To_Unbounded_String ("");
      Cur_Num_Idx : Integer := 1;
      Nums_For_Line : array (1 .. 3) of Integer;
      Max_Num : Integer := 0;
      Sum : Integer := 0;
   begin

      while not End_Of_File (F) loop
         Get (File => F, Item => Cur_Char);
         if Cur_Char = 'x' then
            Nums_For_Line (Cur_Num_Idx) := Integer'Value (
              To_String (Cur_Num_Str)
            );
            Cur_Num_Idx := Cur_Num_Idx + 1;
            Cur_Num_Str := To_Unbounded_String ("");
         else
            Cur_Num_Str := Cur_Num_Str & Cur_Char;
         end if;

         if End_Of_Line (F) then
            Nums_For_Line (Cur_Num_Idx) := Integer'Value (
              To_String (Cur_Num_Str)
            );

            for I in Nums_For_Line'Range loop
               Sum := Sum + (2 * Nums_For_Line (I));
               if Max_Num = 0 or else Nums_For_Line (I) > Max_Num then
                  Max_Num := Nums_For_Line (I);
               end if;
            end loop;

            Sum := Sum - (Max_Num * 2) + (Nums_For_Line (1) * Nums_For_Line (2) * Nums_For_Line (3));
            Cur_Num_Idx := 1;
            Cur_Num_Str := To_Unbounded_String ("");
            Max_Num := 0;
         end if;
      end loop;

      return Sum;
   end Part_2;

end Day_2;