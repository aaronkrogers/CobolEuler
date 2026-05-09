       identification division.
       program-id. euler1.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       working-storage section.
           01  ws_step         binary-long unsigned.
           01  ws_stop         binary-long unsigned  value 1000.
           01  ws_current      binary-long unsigned.
           01  ws_remainder    binary-long unsigned.
           01  ws_result       pic 9(6).

       procedure division.

           perform 0100-init.
           perform 0200-run.
           goback.

       0100-init.
           display 'Problem: Find the sum of all the '
                   'multiples of 3 or 5 below 1000.'.

       0200-run.

           move  3             to  ws_step.
           move  ws_step       to  ws_current.

           perform until ws_current >= ws_stop
               add   ws_current            to  ws_result
               add   ws_step               to  ws_current
           end-perform.

           move  5             to  ws_step.
           move  ws_step       to  ws_current.

           perform until ws_current >= ws_stop
               move  mod(ws_current, 3)    to  ws_remainder
               if  ws_remainder not = 0
                   add   ws_current        to  ws_result
               end-if
               add   ws_step               to  ws_current
           end-perform.

           display  'Solution: ' ws_result.