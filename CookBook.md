## Script
The script `run_analysis.R` runs through five different steps as described in the course description.
* First step is loading the different data files and combining them using the `rbind()` function
* Second, variables with mean or std in the name are subsetted. These are all labeled with the correct names from features.txt
* Step three involves using the real names for the activities (instead of integers)
* Step four involves creating one big data set with the additional activity and subject columns
* Step 5 involves creating a new file `averages_data.txt`for each subject and activity type (30 subjects 6)

## Variables
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
