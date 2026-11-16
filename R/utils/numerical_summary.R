# Summarize selected numeric variables and label the results with their dataset.
numerical_summary <- function(data, dataset_name, variables) {
    
    
    data |>
        # Stack selected columns so the statistics can be calculated per variable.
        select(all_of(variables)) |>
        pivot_longer(
            cols = everything(),
            names_to = "variable",
            values_to = "value"
        ) |>
        group_by(variable) |>
        # Report observed/missing counts and descriptive statistics.
        # Return NA for statistics when a variable has no observed values.
        summarise(
            n = sum(!is.na(value)),
            missing = sum(is.na(value)),
            mean = if (all(is.na(value))) NA_real_
            else round(mean(value, na.rm = TRUE), 2),
            sd = if (all(is.na(value))) NA_real_
            else round(sd(value, na.rm = TRUE), 2),
            median = if (all(is.na(value))) NA_real_
            else median(value, na.rm = TRUE),
            min = if (all(is.na(value))) NA_real_
            else min(value, na.rm = TRUE),
            q1 = if (all(is.na(value))) NA_real_
            else quantile(value, 0.25, na.rm = TRUE),
            q3 = if (all(is.na(value))) NA_real_
            else quantile(value, 0.75, na.rm = TRUE),
            max = if (all(is.na(value))) NA_real_
            else max(value, na.rm = TRUE),
            .groups = "drop"
        )|>
        # Place the dataset label first in the resulting summary table.
        mutate(dataset = dataset_name, .before = 1)
}