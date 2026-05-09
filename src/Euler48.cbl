       identification division.
       program-id. euler48.

       data division.
       working-storage section.
           01  ws_power        pic 9(10).
           01  ws_result       pic 9(10).
           01  ws_current      binary-long.
           01  ws_limit        binary-long value 1000.
           01  ws_x            binary-long.

       procedure division.

           perform 0100-init.
           perform 0200-run.
           goback.

       0100-init.
           display 'Find the last ten digits of the series, '
                   '1^1 + 2^2 + 3^3 + ... + 1000^{1000}.'.

       0200-run.
           perform varying ws_current from 1 by 1
             until ws_current > ws_limit
               perform 0210-calc-power
               add ws_power to ws_result
           end-perform.

           display 'Solution: ' ws_result.

       0210-calc-power.
           move 1 to ws_power.
           perform varying ws_x from 1 by 1 until ws_x > ws_current
               compute ws_power = ws_current * ws_power
           end-perform.
