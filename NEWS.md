# joyn 0.2.0

`joyn` has gained two new authors: Zander Prinsloo and Rossana Tatulli. 

## Breaking changes

* Function `joyn::merge()` was replaced by `joyn::joyn()`. This is now the main function of the `joyn` package.

* Arguments `allow.cartesian`, `yvars`, and `keep_y_in_x` have been deprecated. The latter two have been replaced by `y_vars_to_keep` and `keep_common_vars`, respectively. The new argument names bring more clarity about what they arguments do.

## New features

* New function `joyn::merge()` works as a mask for the `base::merge()` or `data.table::merge.data.table()`. `joyn::merge()` has the same features as the previous two, but includes the features of `joyn::joyn()`.

* Messages style have been improved and categorized. See [message vignette](https://randrescastaneda.github.io/joyn/articles/messages.html) for more information.

* New functions to mimic [dplyr joins](https://dplyr.tidyverse.org/reference/mutate-joins.html). The `joyn` variants have all the features for `joyn::joyn()` but lack some of the most advance features of `dplyr` joins like [`joyn::join_by()`](https://dplyr.tidyverse.org/reference/join_by.html)


## Minor improvements and fixes

* Minor inconsistency bugs were fixed.

# joyn 0.1.4
* update_NAs now could be FALSE even if update_values is TRUE

* Select rows-to-keep before transformation of updated values and NAs to avoid keeping rows from y that did not match in x but whose values got updated because `update_values = TRUE`

* Solve issues #1 and #19

* Change to data.table::merge.data.table syntax in all joins. It makes it easier to work with and consistent across different join types. 

* Remove previous lazy-loaded data.


# joyn 0.1.3
* Convert external data to external data.

# joyn 0.1.2

* Add function `possible_ids()` to identify what variables are suitable for 
uniquely identify the database.

## joyn 0.1.1

* Add function `is_id()` to check whether the table is uniquely identified by 
key variables

* Add function `freq_table()` as a substitute for janitor::tabyl. This makes it 
more convenient for users who do not have janitor installed. 

## joyn 0.1.0

Fix bug on `by` argument when using "=" or "==". 

## joyn 0.0.1
First Public release
