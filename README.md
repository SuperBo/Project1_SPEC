# Group 7 Project 1

## Gem5 results

All gem5 simulation results are put in gem5out folder under directories named "conf<id>".
Where <id> is the id of the test that is defined in "part3-run-results.xlsx" and "part5-cost-results.xlsx" excel files.

## Support scripts

*run.sh* is used to run benchmark automatically. Its syntax is ./run.sh <outputfolder> <L1iSize> <L1iAssoc> <L1Size> <L1Assoc> <L2Size> <L2Assoc>
Example: ./run.sh ./m5out 128kB 4 256kB 4 4MB 4
Run simulation with CPU config of 128kB, 4-way L1 Instruction cache, 256kB, 4-way L1 Data cache and 4MB, 4-way L2 cache.

*run2.sh* is used to run benchmark automatically in Proejct 2. Its syntax is ./run2.sh <outputfolder> <branchPred\_choice> <btbEntries> <localPredictorSize> <globalPredictorSize> <choicPredictorSize>
Example: ./run2.sh ./m5out Tournament 2048 1024 4096 4096
Run simulation with CPU config of TournamentBP algorithm wiht BTBEntries=2048, localPredictorSize=1024 globalPredictorSize=4096 and choicPredictorSize=4096

*read_stats.sh* is used to read the results of bencharks, you need to cd to the conf<id> folder.
