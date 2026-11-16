# Count missing values and calculate their percentage for each column,
# returning the columns from highest to lowest missing percentage.
missing_summary <- function(data) {
    
    data %>%
        # Compute both missing-value measures for every input column.
        summarise(
            across(
                everything(),
                list(
                    n_missing = ~ sum(is.na(.x)),
                    perc_missing = ~ mean(is.na(.x)) * 100
                )
            )
        ) %>%
        # Reshape paired summary fields into one row per variable.
        pivot_longer(
            cols = everything(),
            names_to = c("variable", ".value"),
            names_pattern = "(.*)_(n_missing|perc_missing)"
        ) %>%
        arrange(desc(perc_missing))
    
}
