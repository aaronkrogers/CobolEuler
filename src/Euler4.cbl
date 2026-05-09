       identification division.
       program-id. euler4.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       working-storage section.
       01  ws_max_value        binary-double value 998001.
       01  ws_test_value       binary-double.
       01  ws_test_value_9     pic z(6).
       01  ws_test_value_x     redefines ws_test_value_9
                               pic x(6).
       01  ws_test_value_rev   pic x(6).
       01  ws_sub              binary-long.
       01  ws_divisor          binary-long.
       01  ws_remainder        binary-long.
       01  ws_quotient         binary-long.
       01  ws_palindrome_flag  pic x.
           88  ws_palindrome   value 'Y'.

       01  ws_result           pic z(11)9.
       01  ws_result_x         redefines ws_result
                               pic x(12).
       
       procedure division.

           perform 0100-init.
           perform 0200-run.
           goback.

       0100-init.
           display 'Problem: Find the largest palindrome made from '
                   ' the product of two 3-digit numbers.'.

       0200-run.
           perform varying ws_test_value from ws_max_value by -1
             until ws_test_value <= 0
               move  ws_test_value     to  ws_test_value_9
               perform 0210-check-palindrome

               if  ws_palindrome
                   move 999            to  ws_divisor
                   move 0              to  ws_quotient
                   perform varying ws_divisor from ws_divisor by -1
                     until ws_divisor < 100
                        or (ws_quotient > 100 and ws_remainder = 0)
                       divide  ws_test_value   by  ws_divisor
                                               giving  ws_quotient
                                               remainder  ws_remainder
                       
                       if  ws_quotient  >=  1000
                           move  0     to  ws_divisor
                           move  0     to  ws_quotient
                       end-if

                       if  ws_remainder  =  0  and  ws_quotient  >  100
                           display 'Solution: ' ws_test_value_x
                           goback
                       end-if
                   end-perform
               end-if       
           end-perform.

       0210-check-palindrome.
               move  trim(ws_test_value_x)
                                   to  ws_test_value_x.
   
               move  reverse(ws_test_value_x)
                                   to  ws_test_value_rev.

               if  trim(ws_test_value_x)  =  trim(ws_test_value_rev)
                   move  'Y'       to  ws_palindrome_flag
               else
                   move  'N'       to  ws_palindrome_flag
               end-if