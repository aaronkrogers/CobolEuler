       identification division.
       program-id. euler48.

       data division.
       working-storage section.
           01 ws-power     pic 9(10).
           01 ws-result    pic 9(10).
           01 ws-current   pic 9(4).
           01 ws-limit     pic 9(4) value 1000.
           01 ws-x         pic 9(10).

       procedure division.
       perform 0100-init.
       perform 0200-run.
       goback.

       0100-init.
           display 'Find the last ten digits of the series, '
                   '1^1 + 2^2 + 3^3 + ... + 1000^{1000}.'.

       0200-run.
           perform 
           varying ws-current from 1 by 1
           until ws-current > ws-limit
               perform 0210-calc-power
               add ws-power to ws-result
           end-perform.
           display 'Solution: ' ws-result.

       0210-calc-power.
           move 1 to ws-power.
           perform varying ws-x from 1 by 1 until ws-x > ws-current
               multiply ws-current by ws-power
           end-perform.
