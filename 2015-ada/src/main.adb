with
  Ada.Calendar,
  Ada.Command_Line,
  Ada.Strings,
  Ada.Strings.Unbounded,
  Ada.Text_IO,
  Day_1,
  Day_2;

use
  Ada.Calendar,
  Ada.Command_Line,
  Ada.Strings,
  Ada.Strings.Unbounded,
  Ada.Text_IO;

procedure Main is
   Day : Integer := -1;
   Part : Integer := -1;
   function Validate_And_Set_Argument (S : String) return Boolean is
      Split_Location : Integer := -1;
      Argument_Key : Unbounded_String;
      Argument_Value : Integer;
   begin

      for I in S 'Range loop
         if S (I) = '=' then
            Split_Location := I;
         end if;
      end loop;

      if Split_Location = -1 then
         return False;
      end if;

      Argument_Key := To_Unbounded_String (S (S'First .. Split_Location - 1));
      Argument_Value := Integer'Value (S (Split_Location + 1 .. S'Last));

      if
        Argument_Key = "--day" and then
        Argument_Value < 25 and then
        Argument_Value > 0
      then
         Day := Argument_Value;
         return True;
      end if;

      if
        Argument_Key = "--part" and then
        Argument_Value < 3 and then
        Argument_Value > 0
      then
         Part := Argument_Value;
         return True;
      end if;

      return False;
   end Validate_And_Set_Argument;

   Cur_Argument : Unbounded_String;
   I : Integer := 1;

   Input_File : File_Type;

   type Processing_Function is access function (F : File_Type) return Integer;
   type Functions_Subarray is array (1 .. 2) of Processing_Function;
   Functions_Array : array (1 .. 25) of Functions_Subarray;

   Result : Integer;
   startTime, endTime : Time;

begin

   Functions_Array (1) (1) := Day_1.Part_1'Access;
   Functions_Array (1) (2) := Day_1.Part_2'Access;
   Functions_Array (2) (1) := Day_2.Part_1'Access;
   Functions_Array (2) (2) := Day_2.Part_2'Access;

   while I <= Argument_Count loop

      Cur_Argument := To_Unbounded_String (Argument (I));
      if not Validate_And_Set_Argument (To_String (Cur_Argument)) then
         Put_Line ("invalid argument: " & To_String (Cur_Argument));
         Set_Exit_Status (Failure);
         exit;
      end if;

      I := I + 1;

   end loop;

   if Day = -1 or else Part = -1 then
      Put_Line ("--day or --part argument not supplied.");
      return;
   end if;

   Open (
     File => Input_File,
     Mode => In_File,
     Name => "inputs\day" &
       To_String (Trim (To_Unbounded_String (Integer'Image (Day)), Left)) &
       ".txt"
   );

   startTime := Clock;
   Result := Functions_Array (Day) (Part) (Input_File);
   endTime := Clock;

   Put_Line ("Answer: " & Integer'Image (Result));
   Put_Line (
     "Calculation Time: " & Duration'Image (endTime - startTime) & " seconds"
   );

end Main;
