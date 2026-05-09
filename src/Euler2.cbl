       identification division.
       program-id. euler2.

       data division.
       working-storage section.
           01  ws_fibs.
               05  ws_fib      binary-double unsigned occurs 3 times.
           01  ws_limit        binary-double unsigned value 4000000.
           01  ws_result       pic z(8)9.
           01  ws_result_x     pic x(9).

       procedure division.

           perform 0100-init.
           perform 0200-run.
           goback.

       0100-init.
           display 'Problem By considering the terms in the Fibonacci '
                   'sequence whose values do not exceed four million, '
                   'find the sum of the even-valued terms.'.

           move  1             to ws_fib(1).
           move  1             to ws_fib(2).

       0200-run.
           perform 0210-add-next-fib until ws_fib(3) > ws_limit.

           move  ws_result     to  ws_result_x.
           move  function trim(ws_result_x)
                               to  ws_result_x.
           display 'Solution: ' ws_result_x.

       0210-add-next-fib.
           perform 0220-get-next-fib.
           if function mod(ws_fib(3), 2) = 0
               add ws_fib(3)   to ws_result
           end-if.

       0220-get-next-fib.
           add   ws_fib(1)     to ws_fib(2) giving ws_fib(3)
           move  ws_fib(2)     to ws_fib(1).
           move  ws_fib(3)     to ws_fib(2).
