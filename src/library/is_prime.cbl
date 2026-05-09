       identification division.
       program-id. is-prime.

       data division.
       working-storage section.
           01 ws-max-divisor   pic 9(9).
           01 ws-iter          pic 9(9).
           01 ws-temp          pic 9(12).
           01 ws-remainder     pic 9(12).
           01 ws-test-value    pic 9(12).
       linkage section.
           01 ls-test-value    pic 9(12).
           01 ls-result        pic x.

       procedure division using ls-test-value,
                                ls-result.
           
       perform 100-init thru 100-test.
       goback.

       100-init.
           move ls-test-value      to  ws-test-value.
           compute ws-max-divisor = ws-test-value ** 0.5 + 1.
       
       100-test.
             if ws-test-value = 1 or ws-test-value = 2
               if ws-test-value = 1 then
                   move 'N'    to  ls-result
                   goback
               else 
                   move 'Y'    to  ls-result
                   goback
               end-if
           else
               move 'Y'        to  ls-result
               perform  varying ws-iter from 2 by 1
                 until  ws-iter > ws-max-divisor
       
                   divide  ws-test-value by ws-iter
                           giving ws-temp 
                           remainder ws-remainder

                   if  ws-remainder = 0
                       move 'N' to ls-result
                       goback
                   end-if
                  
               end-perform
           end-if.

       end program is-prime.
