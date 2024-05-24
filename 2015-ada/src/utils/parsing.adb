package body Parsing is

   procedure Do_In_Char_Loop (
      F : File_Type; Func : access function (C : Character) return Boolean
   ) is
      Cur_Char : Character;
      Should_Exit : Boolean;
   begin
      while not End_Of_File (F) loop
         Get (File => F, Item => Cur_Char);
         Should_Exit := Func (Cur_Char);
         if Should_Exit then
            exit;
         end if;
      end loop;
   end Do_In_Char_Loop;

end Parsing;