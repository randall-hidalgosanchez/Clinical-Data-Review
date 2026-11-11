# Function: Categorical variables summary
categorical_summary <- function(data, dataset_name, variables) {
    
    data |>
        select(all_of(variables)) |>
        pivot_longer(
            cols = everything(),
            names_to = "variable",
            values_to = "value"
        ) |>
        filter(!is.na(value)) |>
        count(variable, value, name = "frequency") |>
        group_by(variable) |>
        mutate(
            percentage = round(
                frequency / sum(frequency) * 100, 2
            )
        ) |>
        ungroup() |>
        mutate(dataset = dataset_name) |>
        select(dataset, variable, value, frequency, percentage)
    
}
