# Summarize selected categorical variables as counts and within-variable percentages.
categorical_summary <- function(data, dataset_name, variables) {
    
    
    # Keep the output schema consistent when there are no variables to summarize.
    if (length(variables) == 0) {
        return(tibble(
            dataset = character(),
            variable = character(),
            value = character(),
            frequency = integer(),
            percentage = double()
        ))
    }
    
    data |>
        # Convert the selected columns into one row per variable/value pair.
        select(all_of(variables)) |>
        pivot_longer(
            cols = everything(),
            names_to = "variable",
            values_to = "value"
        ) |>
        # Exclude missing categories before calculating observed-value counts.
        filter(!is.na(value)) |>
        count(variable, value, name = "frequency") |>
        group_by(variable) |>
        # Calculate each category's percentage within its variable.
        mutate(
            percentage = round(
                frequency / sum(frequency) * 100, 2
            )
        ) |>
        ungroup() |>
        mutate(dataset = dataset_name, .before = 1) |>
        select(dataset, variable, value, frequency, percentage)
}