       identification division.
       program-id. is_prime.

       data division.
       working-storage section.
           01  ws_test_value       binary-double.
           01  ws_max_divisor      binary-double.
           01  ws_iter             binary-double.
           01  ws_remainder        binary-double.
           
       linkage section.
           01  ls_test_value       binary-double.
           01  ls_result           pic x.

       procedure division using ls_test_value,
                                   ls_result.
           
       perform 100-init thru 100-test.
       goback.

       100-init.
           move ls_test_value      to  ws_test_value.
           compute ws_max_divisor = ws_test_value ** 0.5 + 1.
       
       100-test.
             if ws_test_value = 1 or ws_test_value = 2
               if ws_test_value = 1 then
                   move 'N'    to  ls_result
                   goback
               else 
                   move 'Y'    to  ls_result
                   goback
               end-if
           else
               move 'Y'        to  ls_result
               perform  varying ws_iter from 2 by 1
                 until  ws_iter > ws_max_divisor
       
                   divide  ws_test_value by ws_iter
                           giving    ws_remainder
                           remainder ws_remainder

                   if  ws_remainder = 0
                       move 'N' to ls_result
                       goback
                   end-if
                  
               end-perform
           end-if.

       end program is_prime.
