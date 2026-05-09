       identification division.
       program-id. euler3.

       data division.
       working-storage section.
       01  ws_testor           binary-double unsigned
                               value 600851475143.
       01  ws_prime_can        binary-double unsigned value 2.
       01  ws_remainder        binary-double unsigned.
       01  ws_largest_prime    binary-double unsigned.
       01  ws_is_prime_res     pic x(1).
           88  ws_is_prime     value 'Y'.

       01  ws_result           pic z(11)9.
       01  ws_result_x         redefines ws_result
                               pic x(12).
       
       procedure division.

           perform 0100-init.
           perform 0200-run.
           goback.

       0100-init.
           display 'Problem: What is the largest prime factor of '
                   'the number 600851475143?'.

       0200-run.
           perform
           until ws_prime_can > ws_testor ** 0.5
               divide ws_testor by ws_prime_can giving ws_remainder
                 remainder ws_remainder

               if  ws_prime_can  =  2
                   move  'N'           to  ws_is_prime_res
                   call  'is_prime' using  ws_testor
                                           ws_is_prime_res

                   if  ws_is_prime
                       move  ws_testor to  ws_largest_prime
                       exit perform
                   end-if
               end-if

               if  ws_remainder  not =  0
                   add   1             to  ws_prime_can
               else
                   move  'N'           to  ws_is_prime_res
                   call  'is_prime'     using  ws_prime_can
                                           ws_is_prime_res
               
                   if  ws_is_prime
                       move  ws_prime_can  to  ws_largest_prime
                       divide  ws_prime_can    into  ws_testor
                       move    2           to  ws_prime_can
                   end-if
               end-if

           end-perform.

           move  ws_largest_prime      to  ws_result.
           move  function trim(ws_result_x)
                                       to  ws_result_x.
           display  'Solution: ' ws_result_x.
