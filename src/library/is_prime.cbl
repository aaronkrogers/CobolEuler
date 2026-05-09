       identification division.
       program-id. is_prime.

       data division.
       working-storage section.
           01  ws_test_value       binary-double.
           01  ws_iter             binary-double.
           01  ws_remainder        binary-double.
           
       linkage section.
           01  ls_test_value       binary-double.
           01  ls_result           pic x.

       procedure division   using  ls_test_value,
                                   ls_result.
           
           perform 0100-init.
           perform 0200-run.
           goback.

       0100-init.

           move ls_test_value      to  ws_test_value.

       0200-run.

           move ls_test_value      to  ws_test_value.

           if  ws_test_value  <=  1
               move  'N'           to  ls_result
               goback
           end-if

           if  ws_test_value  =  2
               move  'Y'           to  ls_result
               goback
           end-if

           divide ws_test_value    by 2
                                   giving ws_remainder
                                   remainder ws_remainder

           if  ws_remainder  =  0
               move  'N'           to  ls_result
               goback
           end-if.

           perform varying ws_iter from 3 by 2
             until ws_iter * ws_iter  >=  ws_test_value

               divide ws_test_value    by ws_iter
                                       giving ws_remainder
                                       remainder ws_remainder

               if  ws_remainder  =  0
                   move  'N'           to  ls_result
                   goback
               end-if

           end-perform.

           move  'Y'               to  ls_result.
           goback.

       end program is_prime.
