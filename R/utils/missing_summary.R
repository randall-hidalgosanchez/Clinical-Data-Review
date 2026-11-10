# Function: Missing values summary
missing_summary <- function(data) {
    
    data %>%
        summarise(
            across(
                everything(),
                list(
                    n_missing = ~ sum(is.na(.x)),
                    perc_missing = ~ mean(is.na(.x)) * 100
                )
            )
        ) %>%
        pivot_longer(
            cols = everything(),
            names_to = c("variable", ".value"),
            names_pattern = "(.*)_(n_missing|perc_missing)"
        ) %>%
        arrange(desc(perc_missing))
    
}
